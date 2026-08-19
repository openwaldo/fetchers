// Copyright (c) 2026 OpenWALDO Project contributors
// Copyright (c) 2026 CtrlIQ, Inc.
// Copyright (c) 2026 Gregory M. Kurtzer
// SPDX-License-Identifier: Apache-2.0

package fetcher

import (
	"archive/tar"
	"bufio"
	"context"
	"crypto/sha256"
	"encoding/hex"
	"encoding/json"
	"errors"
	"fmt"
	"io"
	"io/fs"
	"net/http"
	"net/url"
	"os"
	"os/exec"
	"path/filepath"
	"regexp"
	"sort"
	"strconv"
	"strings"
	"syscall"
	"time"
	"unicode/utf8"

	"github.com/openwaldo/fetchers/internal/config"
)

const Version = "waldo-fetcher-1"

const validationFailurePath = ".fetcher-work/validation-error.txt"

type Runner struct {
	Client *http.Client
	Stderr io.Writer
}

func (runner Runner) Run(ctx context.Context, cfg config.File, output string) error {
	root, err := prepareOutput(output)
	if err != nil {
		return err
	}
	required, err := requiredSpace(cfg)
	if err != nil {
		return err
	}
	if err := checkSpace(root, required); err != nil {
		return err
	}
	if runner.Client == nil {
		runner.Client = &http.Client{Timeout: 0}
	}
	if runner.Stderr == nil {
		runner.Stderr = io.Discard
	}
	retryValidation, err := validationRetryPending(root)
	if err != nil {
		return err
	}
	if retryValidation {
		fmt.Fprintf(runner.Stderr, "fetcher: retrying validation against preserved data in %s\n", root)
	} else {
		multiple := len(cfg.Sources) > 1
		for position, fetch := range cfg.Fetches {
			sourceID := cfg.Corpus.One("id")
			if multiple {
				sourceID = fetch.One("source")
			}
			destination := root
			if multiple {
				destination = filepath.Join(root, sourceID)
				if err := os.MkdirAll(destination, 0o755); err != nil {
					return err
				}
			}
			fmt.Fprintf(runner.Stderr, "fetcher: %s (%d/%d)\n", fetch.One("fetcher"), position+1, len(cfg.Fetches))
			switch fetch.One("fetcher") {
			case "http":
				err = runner.fetchHTTP(ctx, fetch, destination, position)
			case "git":
				err = runner.fetchGit(ctx, fetch, destination, root, position)
			case "huggingface":
				err = runner.fetchHuggingFace(ctx, fetch, destination, position)
			case "http-set":
				err = runner.fetchHTTPSet(ctx, fetch, destination, position)
			case "monthly-mbox":
				err = runner.fetchMonthlyMbox(ctx, fetch, destination, position)
			case "public-inbox":
				err = runner.fetchPublicInbox(ctx, fetch, destination, root, position)
			case "hyperkitty":
				err = runner.fetchHyperKitty(ctx, fetch, destination, root, position)
			case "sourcehut":
				err = runner.fetchSourceHut(ctx, fetch, destination)
			case "zip":
				err = fetchZIP(fetch, destination)
			case "gutenberg":
				err = runner.fetchGutenberg(ctx, fetch, destination, position)
			case "cap":
				err = runner.fetchCAP(ctx, fetch, destination, root, position)
			default:
				err = fmt.Errorf("fetcher %q is validated but not implemented", fetch.One("fetcher"))
			}
			if err != nil {
				return err
			}
		}
	}
	if !retryValidation {
		if err := os.RemoveAll(filepath.Join(root, ".fetcher-work")); err != nil {
			return err
		}
	}
	if err := validateFetchedCorpus(cfg, root, runner.Stderr); err != nil {
		if markerErr := writeValidationFailure(root, err); markerErr != nil {
			return fmt.Errorf("post-fetch validation failed and retry state could not be written: %v; validation error: %w", markerErr, err)
		}
		return fmt.Errorf("post-fetch validation failed; downloaded data remains at %s: %w", root, err)
	}
	if err := os.RemoveAll(filepath.Join(root, ".fetcher-work")); err != nil {
		return err
	}
	if err := writeManifests(cfg, root); err != nil {
		return err
	}
	return nil
}

func validationRetryPending(root string) (bool, error) {
	info, err := os.Lstat(filepath.Join(root, validationFailurePath))
	if os.IsNotExist(err) {
		return false, nil
	}
	if err != nil {
		return false, err
	}
	if !info.Mode().IsRegular() || info.Mode()&os.ModeSymlink != 0 {
		return false, fmt.Errorf("validation retry marker is not a regular file")
	}
	return true, nil
}

func writeValidationFailure(root string, validationErr error) error {
	path := filepath.Join(root, validationFailurePath)
	if err := os.MkdirAll(filepath.Dir(path), 0o755); err != nil {
		return err
	}
	return os.WriteFile(path, []byte(validationErr.Error()+"\n"), 0o600)
}

func prepareOutput(output string) (string, error) {
	if strings.TrimSpace(output) == "" {
		return "", fmt.Errorf("output directory is required")
	}
	abs, err := filepath.Abs(output)
	if err != nil {
		return "", err
	}
	info, err := os.Lstat(abs)
	if os.IsNotExist(err) {
		if err := os.MkdirAll(abs, 0o755); err != nil {
			return "", err
		}
		return abs, nil
	}
	if err != nil {
		return "", err
	}
	if !info.IsDir() || info.Mode()&os.ModeSymlink != 0 {
		return "", fmt.Errorf("output must be a non-symlink directory")
	}
	if _, err := os.Lstat(filepath.Join(abs, "manifest.json")); err == nil {
		return "", fmt.Errorf("output already contains a completed manifest")
	} else if !os.IsNotExist(err) {
		return "", err
	}
	return abs, nil
}

func requiredSpace(cfg config.File) (uint64, error) {
	var total uint64
	for _, fetch := range cfg.Fetches {
		value, err := parseSize(fetch.One("estimated-size"))
		if err != nil {
			return 0, fmt.Errorf("fetch %q estimated-size: %w", fetch.Name, err)
		}
		if ^uint64(0)-total < value {
			return 0, fmt.Errorf("estimated sizes overflow")
		}
		total += value
	}
	buffer := total/2 + 1<<30
	if ^uint64(0)-total < buffer {
		return 0, fmt.Errorf("required space overflows")
	}
	return total + buffer, nil
}

var sizePattern = regexp.MustCompile(`^([0-9]+)([KMGT]i?B?|B)$`)

func parseSize(value string) (uint64, error) {
	match := sizePattern.FindStringSubmatch(value)
	if match == nil {
		return 0, fmt.Errorf("use a value such as 500M, 10G, or 2TiB")
	}
	number, _ := strconv.ParseUint(match[1], 10, 64)
	power := strings.IndexByte("KMGT", match[2][0]) + 1
	factor := uint64(1)
	for range power {
		factor *= 1024
	}
	if number > ^uint64(0)/factor {
		return 0, fmt.Errorf("size overflows")
	}
	return number * factor, nil
}

func checkSpace(path string, required uint64) error {
	var stat syscall.Statfs_t
	if err := syscall.Statfs(path, &stat); err != nil {
		return err
	}
	available := stat.Bavail * uint64(stat.Bsize)
	if available < required {
		return fmt.Errorf("insufficient free space: need approximately %d bytes, have %d", required, available)
	}
	return nil
}

func (runner Runner) fetchHTTP(ctx context.Context, fetch config.Section, destination string, position int) error {
	return runner.fetchHTTPWithCollection(ctx, fetch, destination, position, nil)
}

func (runner Runner) fetchHTTPWithCollection(ctx context.Context, fetch config.Section, destination string, position int, collection *downloadCollectionProgress) error {
	parsed, err := url.Parse(fetch.One("url"))
	if err != nil || (parsed.Scheme != "http" && parsed.Scheme != "https") || parsed.Host == "" {
		return fmt.Errorf("invalid HTTP URL %q", fetch.One("url"))
	}
	name := fetch.One("_filename")
	if name == "" {
		name = safeFilename(filepath.Base(parsed.Path))
	}
	if name == "" || name == "." {
		name = safeFilename(fetch.Name)
		if name == "" {
			name = fmt.Sprintf("artifact-%04d", position+1)
		}
	}
	final := filepath.Join(destination, name)
	partial := final + ".partial"
	if info, err := os.Lstat(final); err == nil {
		if !info.Mode().IsRegular() || info.Mode()&os.ModeSymlink != 0 {
			return fmt.Errorf("existing HTTP output is unsafe: %s", final)
		}
		return verifyChecksum(final, fetch.One("sha256"))
	} else if !os.IsNotExist(err) {
		return err
	}
	var offset int64
	if info, err := os.Lstat(partial); err == nil {
		if !info.Mode().IsRegular() || info.Mode()&os.ModeSymlink != 0 {
			return fmt.Errorf("partial HTTP output is unsafe: %s", partial)
		}
		offset = info.Size()
	} else if !os.IsNotExist(err) {
		return err
	}
	request, err := http.NewRequestWithContext(ctx, http.MethodGet, parsed.String(), nil)
	if err != nil {
		return err
	}
	if offset > 0 {
		request.Header.Set("Range", fmt.Sprintf("bytes=%d-", offset))
	}
	response, err := runner.Client.Do(request)
	if err != nil {
		return fmt.Errorf("download failed; partial data remains at %s: %w", partial, err)
	}
	defer response.Body.Close()
	flags := os.O_CREATE | os.O_WRONLY
	if offset > 0 && response.StatusCode == http.StatusPartialContent {
		flags |= os.O_APPEND
	} else {
		offset = 0
		flags |= os.O_TRUNC
	}
	if response.StatusCode < 200 || response.StatusCode >= 300 {
		return fmt.Errorf("download %s: HTTP %s", parsed, response.Status)
	}
	file, err := os.OpenFile(partial, flags, 0o644)
	if err != nil {
		return err
	}
	total := int64(-1)
	if response.ContentLength >= 0 {
		total = offset + response.ContentLength
	}
	progress := newDownloadProgress(runner.Stderr, name, offset, total)
	if collection != nil {
		progress = newCollectionDownloadProgress(runner.Stderr, name, offset, total, *collection)
	}
	progress.Start()
	_, copyErr := io.Copy(file, io.TeeReader(response.Body, progress))
	if copyErr == nil {
		progress.Finish()
	}
	syncErr := file.Sync()
	closeErr := file.Close()
	if copyErr != nil {
		return fmt.Errorf("download failed; partial data remains at %s: %w", partial, copyErr)
	}
	if syncErr != nil {
		return syncErr
	}
	if closeErr != nil {
		return closeErr
	}
	if err := verifyChecksum(partial, fetch.One("sha256")); err != nil {
		return err
	}
	return os.Rename(partial, final)
}

func verifyChecksum(path, expected string) error {
	if expected == "" {
		return nil
	}
	if len(expected) != 64 || strings.ToLower(expected) != expected {
		return fmt.Errorf("SHA-256 must be 64 lowercase hexadecimal characters")
	}
	file, err := os.Open(path)
	if err != nil {
		return err
	}
	defer file.Close()
	hash := sha256.New()
	if _, err := io.Copy(hash, file); err != nil {
		return err
	}
	actual := hex.EncodeToString(hash.Sum(nil))
	if actual != expected {
		return fmt.Errorf("checksum mismatch for %s: expected %s, got %s", path, expected, actual)
	}
	return nil
}

func (runner Runner) fetchGit(ctx context.Context, fetch config.Section, destination, root string, position int) error {
	if _, err := exec.LookPath("git"); err != nil {
		return fmt.Errorf("git fetcher requires git: %w", err)
	}
	name := safeFilename(fetch.Name)
	if name == "" {
		parsed, _ := url.Parse(fetch.One("url"))
		name = strings.TrimSuffix(safeFilename(filepath.Base(parsed.Path)), ".git")
	}
	if name == "" {
		name = fmt.Sprintf("repository-%04d", position+1)
	}
	final := filepath.Join(destination, name)
	if info, err := os.Lstat(final); err == nil {
		if !info.IsDir() || info.Mode()&os.ModeSymlink != 0 {
			return fmt.Errorf("existing Git output is unsafe: %s", final)
		}
		return nil
	} else if !os.IsNotExist(err) {
		return err
	}
	work := filepath.Join(root, ".fetcher-work", fmt.Sprintf("git-%04d", position+1))
	repository := filepath.Join(work, "repository.git")
	partial := filepath.Join(work, "output")
	if err := os.MkdirAll(work, 0o755); err != nil {
		return err
	}
	if _, err := os.Stat(repository); os.IsNotExist(err) {
		if err := command(ctx, "git", "init", "--bare", "--quiet", repository); err != nil {
			return err
		}
		if err := command(ctx, "git", "-C", repository, "remote", "add", "origin", fetch.One("url")); err != nil {
			return err
		}
	}
	remoteRef := fetch.One("ref")
	if remoteRef == "" {
		remoteRef = fetch.One("revision")
	}
	if err := command(ctx, "git", "-C", repository, "fetch", "--depth=1", "--no-tags", "origin", remoteRef); err != nil {
		return fmt.Errorf("Git fetch failed; work remains at %s: %w", work, err)
	}
	actualBytes, err := exec.CommandContext(ctx, "git", "-C", repository, "rev-parse", "FETCH_HEAD^{commit}").Output()
	if err != nil {
		return err
	}
	actual := strings.TrimSpace(string(actualBytes))
	if actual != fetch.One("revision") {
		return fmt.Errorf("Git revision resolved to %s, expected %s", actual, fetch.One("revision"))
	}
	if err := os.MkdirAll(partial, 0o755); err != nil {
		return err
	}
	arguments := []string{"-C", repository, "archive", "--format=tar", actual}
	arguments = append(arguments, fetch.Values["pathspec"]...)
	archive := exec.CommandContext(ctx, "git", arguments...)
	pipe, err := archive.StdoutPipe()
	if err != nil {
		return err
	}
	archive.Stderr = runner.Stderr
	if err := archive.Start(); err != nil {
		return err
	}
	archiveStats, err := extractTar(pipe, partial)
	if err != nil {
		_ = archive.Process.Kill()
		_ = archive.Wait()
		return err
	}
	if err := archive.Wait(); err != nil {
		return err
	}
	if err := os.MkdirAll(filepath.Dir(final), 0o755); err != nil {
		return err
	}
	if err := os.Rename(partial, final); err != nil {
		return err
	}
	fmt.Fprintf(runner.Stderr, "fetcher: git retained %d non-empty UTF-8 files; skipped %d empty or binary files\n", archiveStats.Retained, archiveStats.Skipped)
	return os.RemoveAll(work)
}

func command(ctx context.Context, program string, arguments ...string) error {
	command := exec.CommandContext(ctx, program, arguments...)
	command.Stdout, command.Stderr = os.Stderr, os.Stderr
	return command.Run()
}

type textArchiveStats struct {
	Retained int64
	Skipped  int64
}

func extractTar(reader io.Reader, destination string) (textArchiveStats, error) {
	var stats textArchiveStats
	archive := tar.NewReader(reader)
	for {
		header, err := archive.Next()
		if errors.Is(err, io.EOF) {
			return stats, nil
		}
		if err != nil {
			return stats, err
		}
		clean := filepath.Clean(filepath.FromSlash(header.Name))
		if clean == "." || filepath.IsAbs(clean) || clean == ".." || strings.HasPrefix(clean, ".."+string(filepath.Separator)) {
			return stats, fmt.Errorf("unsafe tar path %q", header.Name)
		}
		path := filepath.Join(destination, clean)
		switch header.Typeflag {
		case tar.TypeDir:
			if err := os.MkdirAll(path, 0o755); err != nil {
				return stats, err
			}
		case tar.TypeReg, tar.TypeRegA:
			if err := os.MkdirAll(filepath.Dir(path), 0o755); err != nil {
				return stats, err
			}
			file, err := os.OpenFile(path, os.O_CREATE|os.O_EXCL|os.O_WRONLY, 0o644)
			if err != nil {
				return stats, err
			}
			_, copyErr := io.CopyN(file, archive, header.Size)
			closeErr := file.Close()
			if copyErr != nil {
				return stats, copyErr
			}
			if closeErr != nil {
				return stats, closeErr
			}
			text, err := nonemptyUTF8File(path)
			if err != nil {
				return stats, err
			}
			if !text {
				if err := os.Remove(path); err != nil {
					return stats, err
				}
				stats.Skipped++
				continue
			}
			stats.Retained++
		case tar.TypeSymlink, tar.TypeLink:
			continue
		default:
			return stats, fmt.Errorf("unsupported tar entry %q", header.Name)
		}
	}
}

func nonemptyUTF8File(path string) (bool, error) {
	file, err := os.Open(path)
	if err != nil {
		return false, err
	}
	defer file.Close()
	reader := bufio.NewReader(file)
	nonempty := false
	for {
		char, size, err := reader.ReadRune()
		if errors.Is(err, io.EOF) {
			return nonempty, nil
		}
		if err != nil {
			return false, err
		}
		if char == 0 || char == utf8.RuneError && size == 1 {
			return false, nil
		}
		nonempty = true
	}
}

func safeFilename(value string) string {
	value = strings.TrimSpace(value)
	var result strings.Builder
	for _, char := range value {
		if char >= 'a' && char <= 'z' || char >= 'A' && char <= 'Z' || char >= '0' && char <= '9' || strings.ContainsRune("._-", char) {
			result.WriteRune(char)
		} else {
			result.WriteByte('-')
		}
	}
	return strings.Trim(result.String(), ".-")
}

func writeManifests(cfg config.File, root string) error {
	multiple := len(cfg.Sources) > 1
	fetcherEvidence := map[string]any{"name": Version, "retrieved_at": time.Now().UTC().Format(time.RFC3339)}
	if multiple {
		rootManifest := map[string]any{
			"kind": "waldo-corpus-directory", "schema": 1,
			"corpus": corpusManifest(cfg),
		}
		var ids []string
		for _, source := range cfg.SortedSources() {
			ids = append(ids, cfg.SourceID(source))
		}
		rootManifest["sources"] = ids
		for _, source := range cfg.Sources {
			id := cfg.SourceID(source)
			directory := filepath.Join(root, id)
			raw, err := rawEvidence(directory)
			if err != nil {
				return err
			}
			manifest := map[string]any{"kind": "waldo-source-directory", "schema": 1, "source": sourceManifest(cfg, source), "raw": raw, "fetcher": fetcherEvidence}
			if err := writeJSONAtomic(filepath.Join(directory, "manifest.json"), manifest); err != nil {
				return err
			}
		}
		return writeJSONAtomic(filepath.Join(root, "manifest.json"), rootManifest)
	}
	source := cfg.Sources[0]
	raw, err := rawEvidence(root)
	if err != nil {
		return err
	}
	manifest := map[string]any{
		"kind": "waldo-corpus-directory", "schema": 1, "corpus": corpusManifest(cfg),
		"source": sourceManifest(cfg, source), "raw": raw, "fetcher": fetcherEvidence,
	}
	return writeJSONAtomic(filepath.Join(root, "manifest.json"), manifest)
}

func corpusManifest(cfg config.File) map[string]any {
	return map[string]any{"id": cfg.Corpus.One("id"), "title": cfg.Corpus.One("title"), "description": cfg.Corpus.One("description")}
}

func sourceManifest(cfg config.File, section config.Section) map[string]any {
	id := cfg.SourceID(section)
	upstream := map[string]any{
		"name": section.One("name"), "url": section.One("url"), "category": section.One("category"),
		"license_evidence": compactMap(map[string]any{"declaration": section.One("license-declaration"), "url": section.One("license-url")}),
	}
	for ini, jsonName := range map[string]string{"version": "version"} {
		if value := section.One(ini); value != "" {
			upstream[jsonName] = value
		}
	}
	content := compactMap(map[string]any{
		"types": section.Values["content-type"], "languages": section.Values["language"], "programming_languages": section.Values["programming-language"], "from": section.One("content-from"), "to": section.One("content-to"), "selection": section.One("selection"),
		"copyrighted": section.One("copyrighted"), "machine_generated": section.One("machine-generated"), "personal_data": section.One("personal-data"),
	})
	if len(content) > 0 {
		upstream["content"] = content
	}
	if basis := section.One("acquisition-basis"); basis != "" {
		upstream["acquisition"] = map[string]any{"basis": basis}
	}
	result := map[string]any{"id": id, "license": section.One("license"), "source": upstream}
	var artifacts []map[string]any
	for _, fetch := range cfg.Fetches {
		fetchSource := cfg.Corpus.One("id")
		if len(cfg.Sources) > 1 {
			fetchSource = fetch.One("source")
		}
		if fetchSource != id {
			continue
		}
		artifacts = append(artifacts, compactMap(map[string]any{
			"fetcher": fetch.One("fetcher"), "url": fetch.One("url"), "revision": fetch.One("revision"), "sha256": fetch.One("sha256"),
		}))
	}
	if len(artifacts) > 0 {
		result["artifacts"] = artifacts
	}
	if input := inputManifest(cfg, id); len(input) > 0 {
		result["input"] = input
	}
	return result
}

func inputManifest(cfg config.File, sourceID string) map[string]any {
	section, ok := cfg.Input(sourceID)
	if !ok {
		return nil
	}
	result := map[string]any{"format": section.One("format")}
	if value := section.One("type"); value != "" {
		result["type"] = value
	}
	if value := section.One("on-empty"); value != "" {
		result["on_empty"] = value
	}
	if value := section.One("nul"); value != "" {
		result["nul"] = value
	}
	fields := map[string]any{}
	for _, name := range []string{"text", "text-fallback"} {
		if values := section.Values[name]; len(values) > 0 {
			fields[strings.ReplaceAll(name, "-", "_")] = values
		}
	}
	for _, name := range []string{"id", "date", "language", "license", "source", "context", "response"} {
		if value := section.One(name); value != "" {
			fields[name] = value
		}
	}
	if values := section.Values["meta"]; len(values) > 0 {
		metadata := map[string]string{}
		for _, value := range values {
			name, path, found := strings.Cut(value, "=")
			if !found || strings.TrimSpace(name) == "" || strings.TrimSpace(path) == "" {
				continue
			}
			metadata[strings.TrimSpace(name)] = strings.TrimSpace(path)
		}
		if len(metadata) > 0 {
			fields["meta"] = metadata
		}
	}
	if len(fields) > 0 {
		result["fields"] = fields
	}
	switch section.One("type") {
	case "chat-messages":
		messages := compactMap(map[string]any{"role": section.One("role"), "content": section.One("content"), "tools": section.One("tools")})
		if len(messages) > 0 {
			result["messages"] = messages
		}
	case "ranked-conversation-tree":
		tree := compactMap(map[string]any{"root": section.One("tree-root"), "replies": section.One("replies"), "text": section.One("text"), "rank": section.One("rank"), "missing_rank": section.One("missing-rank"), "role": section.One("role"), "assistant_role": section.One("assistant-role")})
		if len(tree) > 0 {
			result["tree"] = tree
		}
		if mapped, ok := result["fields"].(map[string]any); ok {
			delete(mapped, "text")
			if len(mapped) == 0 {
				delete(result, "fields")
			}
		}
	case "bounded-text":
		result["bounds"] = compactMap(map[string]any{"start_pattern": section.One("start-pattern"), "end_pattern": section.One("end-pattern")})
	case "xml-record":
		xml := compactMap(map[string]any{"on_malformed": section.One("on-malformed"), "source_prefix": section.One("source-prefix"), "exclude": section.Values["exclude"]})
		if len(xml) > 0 {
			result["xml"] = xml
		}
	}
	return result
}

func compactMap(value map[string]any) map[string]any {
	for key, item := range value {
		switch typed := item.(type) {
		case string:
			if typed == "" {
				delete(value, key)
			}
		case []string:
			if len(typed) == 0 {
				delete(value, key)
			}
		}
	}
	return value
}

func rawEvidence(root string) (map[string]any, error) {
	type entry struct {
		path, digest string
		bytes        int64
	}
	var entries []entry
	var total int64
	err := filepath.WalkDir(root, func(path string, item fs.DirEntry, walkErr error) error {
		if walkErr != nil {
			return walkErr
		}
		if path == root {
			return nil
		}
		if item.Type()&os.ModeSymlink != 0 {
			return fmt.Errorf("raw entry is a symlink: %s", path)
		}
		if item.IsDir() {
			if item.Name() == ".fetcher-work" {
				return filepath.SkipDir
			}
			return nil
		}
		info, err := item.Info()
		if err != nil {
			return err
		}
		if !info.Mode().IsRegular() || item.Name() == "manifest.json" {
			return fmt.Errorf("invalid raw entry: %s", path)
		}
		file, err := os.Open(path)
		if err != nil {
			return err
		}
		hash := sha256.New()
		written, copyErr := io.Copy(hash, file)
		closeErr := file.Close()
		if copyErr != nil {
			return copyErr
		}
		if closeErr != nil {
			return closeErr
		}
		relative, _ := filepath.Rel(root, path)
		entries = append(entries, entry{filepath.ToSlash(relative), hex.EncodeToString(hash.Sum(nil)), written})
		total += written
		return nil
	})
	if err != nil {
		return nil, err
	}
	if len(entries) == 0 {
		return nil, fmt.Errorf("source directory contains no raw files: %s", root)
	}
	sort.Slice(entries, func(i, j int) bool { return entries[i].path < entries[j].path })
	tree := sha256.New()
	for _, entry := range entries {
		fmt.Fprintf(tree, "%s\t%d\t%s\n", entry.digest, entry.bytes, entry.path)
	}
	return map[string]any{"file_count": len(entries), "byte_count": total, "tree_sha256": hex.EncodeToString(tree.Sum(nil))}, nil
}

func writeJSONAtomic(path string, value any) error {
	data, err := json.MarshalIndent(value, "", "  ")
	if err != nil {
		return err
	}
	data = append(data, '\n')
	partial := path + ".partial"
	if err := os.WriteFile(partial, data, 0o644); err != nil {
		return err
	}
	return os.Rename(partial, path)
}
