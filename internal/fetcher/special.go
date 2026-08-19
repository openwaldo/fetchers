// Copyright (c) 2026 OpenWALDO Project contributors
// Copyright (c) 2026 CtrlIQ, Inc.
// Copyright (c) 2026 Gregory M. Kurtzer
// SPDX-License-Identifier: Apache-2.0

package fetcher

import (
	"archive/zip"
	"bufio"
	"bytes"
	"compress/gzip"
	"context"
	"crypto/sha256"
	"encoding/csv"
	"encoding/hex"
	"encoding/json"
	"fmt"
	"io"
	"net/http"
	"net/http/cookiejar"
	"net/url"
	"os"
	"os/exec"
	"path/filepath"
	"regexp"
	"sort"
	"strconv"
	"strings"
	"time"

	"github.com/openwaldo/fetchers/internal/config"
)

func syntheticHTTP(rawURL, checksum, filename string) config.Section {
	values := map[string][]string{"url": {rawURL}}
	if checksum != "" {
		values["sha256"] = []string{checksum}
	}
	if filename != "" {
		values["_filename"] = []string{filename}
	}
	return config.Section{Kind: "fetch", Values: values}
}

func (runner Runner) fetchHTTPSet(ctx context.Context, fetch config.Section, destination string, position int) error {
	for index, specification := range fetch.Values["artifact"] {
		rawURL, remainder, found := strings.Cut(specification, "|")
		name, checksum, foundChecksum := strings.Cut(remainder, "|")
		if !found || !foundChecksum {
			return fmt.Errorf("invalid HTTP-set artifact %q", specification)
		}
		if strings.HasSuffix(name, ".txt") {
			name = strings.TrimSuffix(name, ".txt") + ".mbox.gz"
		}
		if err := runner.fetchHTTP(ctx, syntheticHTTP(rawURL, checksum, safeFilename(name)), destination, position*1000+index); err != nil {
			return err
		}
	}
	return nil
}

func (runner Runner) fetchMonthlyMbox(ctx context.Context, fetch config.Section, destination string, position int) error {
	checksums := fetch.Values["checksum"]
	if len(checksums) != 12 {
		return fmt.Errorf("monthly-mbox requires twelve checksums")
	}
	base, list, year, style := strings.TrimSuffix(fetch.One("base-url"), "/"), fetch.One("list"), fetch.One("year"), fetch.One("style")
	for month, checksum := range checksums {
		number := fmt.Sprintf("%02d", month+1)
		var rawURL string
		switch style {
		case "apache":
			rawURL = fmt.Sprintf("%s/api/mbox.lua?list=%s&date=%s-%s", base, url.QueryEscape(list), year, number)
		case "gnu":
			rawURL = fmt.Sprintf("%s/%s/%s-%s", base, list, year, number)
		default:
			return fmt.Errorf("unknown monthly-mbox style %q", style)
		}
		name := fmt.Sprintf("%s-%s-%s.mbox", safeFilename(list), year, number)
		if err := runner.fetchHTTP(ctx, syntheticHTTP(rawURL, checksum, name), destination, position*100+month); err != nil {
			return err
		}
	}
	return nil
}

type huggingFaceMetadata struct {
	SHA      string `json:"sha"`
	Siblings []struct {
		Filename string `json:"rfilename"`
		Size     int64  `json:"size"`
		LFS      *struct {
			SHA256 string `json:"sha256"`
		} `json:"lfs"`
	} `json:"siblings"`
}

func (runner Runner) fetchHuggingFace(ctx context.Context, fetch config.Section, destination string, position int) error {
	datasetURL, err := url.Parse(fetch.One("url"))
	if err != nil {
		return err
	}
	dataset := strings.TrimPrefix(datasetURL.Path, "/datasets/")
	if dataset == datasetURL.Path || strings.Count(dataset, "/") != 1 {
		return fmt.Errorf("invalid Hugging Face dataset URL %q", datasetURL)
	}
	revision := fetch.One("revision")
	metadataURL := fmt.Sprintf("%s://%s/api/datasets/%s/revision/%s?blobs=true", datasetURL.Scheme, datasetURL.Host, dataset, revision)
	request, _ := http.NewRequestWithContext(ctx, http.MethodGet, metadataURL, nil)
	response, err := runner.Client.Do(request)
	if err != nil {
		return err
	}
	defer response.Body.Close()
	if response.StatusCode < 200 || response.StatusCode >= 300 {
		return fmt.Errorf("Hugging Face metadata: HTTP %s", response.Status)
	}
	var metadata huggingFaceMetadata
	if err := json.NewDecoder(io.LimitReader(response.Body, 64<<20)).Decode(&metadata); err != nil {
		return err
	}
	if metadata.SHA != revision {
		return fmt.Errorf("Hugging Face revision resolved to %s, expected %s", metadata.SHA, revision)
	}
	suffix, prefix := "."+strings.TrimPrefix(fetch.One("suffix"), "."), fetch.One("prefix")
	var selected []struct {
		name     string
		checksum string
		size     int64
	}
	var totalBytes int64
	for _, sibling := range metadata.Siblings {
		if !strings.HasSuffix(sibling.Filename, suffix) || prefix != "" && !strings.HasPrefix(sibling.Filename, prefix) {
			continue
		}
		if sibling.Size <= 0 || sibling.LFS == nil || len(sibling.LFS.SHA256) != 64 {
			return fmt.Errorf("Hugging Face file %q lacks pinned LFS evidence", sibling.Filename)
		}
		selected = append(selected, struct {
			name     string
			checksum string
			size     int64
		}{sibling.Filename, sibling.LFS.SHA256, sibling.Size})
		totalBytes += sibling.Size
	}
	if len(selected) == 0 {
		return fmt.Errorf("Hugging Face selection produced no files")
	}
	sort.Slice(selected, func(i, j int) bool { return selected[i].name < selected[j].name })
	fmt.Fprintf(runner.Stderr, "fetcher: huggingface selected %d files (%s total)\n", len(selected), humanTransferBytes(totalBytes))
	seen := map[string]bool{}
	var completedBytes int64
	for index, item := range selected {
		name := safeFilename(filepath.Base(item.name))
		if strings.HasSuffix(name, ".json.gz") {
			name = strings.TrimSuffix(name, ".json.gz") + ".jsonl.gz"
		}
		if seen[name] {
			return fmt.Errorf("Hugging Face selection has duplicate basename %q", name)
		}
		seen[name] = true
		segments := strings.Split(item.name, "/")
		for index := range segments {
			segments[index] = url.PathEscape(segments[index])
		}
		rawURL := fmt.Sprintf("%s://%s/datasets/%s/resolve/%s/%s?download=true", datasetURL.Scheme, datasetURL.Host, dataset, revision, strings.Join(segments, "/"))
		collection := downloadCollectionProgress{
			fileIndex:      index + 1,
			fileCount:      len(selected),
			completedBytes: completedBytes,
			totalBytes:     totalBytes,
		}
		if err := runner.fetchHTTPWithCollection(ctx, syntheticHTTP(rawURL, item.checksum, name), destination, position*10000+index, &collection); err != nil {
			return err
		}
		completedBytes += item.size
	}
	return nil
}

func (runner Runner) fetchPublicInbox(ctx context.Context, fetch config.Section, destination, root string, position int) error {
	helper, err := helperPath("public_inbox_extract.py")
	if err != nil {
		return err
	}
	work := filepath.Join(root, ".fetcher-work", fmt.Sprintf("public-inbox-%04d", position))
	output := filepath.Join(work, "output")
	if err := os.MkdirAll(output, 0o755); err != nil {
		return err
	}
	for _, specification := range fetch.Values["epoch"] {
		epoch, head, found := strings.Cut(specification, ":")
		if !found || len(head) != 40 {
			return fmt.Errorf("invalid public-inbox epoch %q", specification)
		}
		repository := filepath.Join(work, epoch+".git")
		if _, err := os.Stat(repository); os.IsNotExist(err) {
			if err := command(ctx, "git", "init", "--bare", "--quiet", repository); err != nil {
				return err
			}
		}
		remote := fmt.Sprintf("%s/%s/%s", strings.TrimSuffix(fetch.One("base-url"), "/"), fetch.One("list"), epoch)
		if err := command(ctx, "git", "--git-dir="+repository, "fetch", "--quiet", "--no-tags", remote, head); err != nil {
			return err
		}
		prefix := fmt.Sprintf("%s-epoch-%s", fetch.One("list"), epoch)
		if err := command(ctx, "python3", helper, repository, head, fetch.One("year"), output, prefix); err != nil {
			return err
		}
	}
	entries, err := os.ReadDir(output)
	if err != nil || len(entries) == 0 {
		return fmt.Errorf("public-inbox produced no messages")
	}
	for _, entry := range entries {
		if err := os.Rename(filepath.Join(output, entry.Name()), filepath.Join(destination, entry.Name())); err != nil {
			return err
		}
	}
	return nil
}

func helperPath(name string) (string, error) {
	candidates := []string{filepath.Join("libexec", name)}
	if executable, err := os.Executable(); err == nil {
		candidates = append(candidates, filepath.Join(filepath.Dir(executable), "..", "libexec", name))
	}
	for _, candidate := range candidates {
		if absolute, err := filepath.Abs(candidate); err == nil {
			if info, statErr := os.Stat(absolute); statErr == nil && info.Mode().IsRegular() {
				return absolute, nil
			}
		}
	}
	return "", fmt.Errorf("required helper libexec/%s was not found", name)
}

func (runner Runner) fetchHyperKitty(ctx context.Context, fetch config.Section, destination, root string, position int) error {
	helper, err := helperPath("hyperkitty_extract.py")
	if err != nil {
		return err
	}
	manifest := filepath.Join("manifests", "hyperkitty", fetch.One("manifest"))
	if err := verifyChecksum(manifest, fetch.One("manifest-sha256")); err != nil {
		return err
	}
	file, err := os.Open(manifest)
	if err != nil {
		return err
	}
	defer file.Close()
	scanner := bufio.NewScanner(file)
	line := 0
	for scanner.Scan() {
		line++
		if line == 1 {
			continue
		}
		fields := strings.Split(scanner.Text(), "\t")
		if len(fields) != 3 {
			return fmt.Errorf("invalid HyperKitty manifest line %d", line)
		}
		period, count, checksum := fields[0], fields[1], fields[2]
		next, err := nextMonth(period)
		if err != nil {
			return err
		}
		name := fmt.Sprintf("%s-%s.mbox.gz", fetch.One("list"), period)
		rawURL := fmt.Sprintf("%s/%s%%40python.org/export/%s%%40python.org-%s.mbox.gz?end=%s-01&start=%s-01", strings.TrimSuffix(fetch.One("base-url"), "/"), fetch.One("list"), fetch.One("list"), period, next, period)
		if err := runner.fetchHTTP(ctx, syntheticHTTP(rawURL, "", name), destination, position*1000+line); err != nil {
			return err
		}
		validation := filepath.Join(root, ".fetcher-work", "hyperkitty", fmt.Sprintf("%04d", line))
		if err := os.MkdirAll(filepath.Dir(validation), 0o755); err != nil {
			return err
		}
		if err := command(ctx, "python3", helper, filepath.Join(destination, name), validation, safeFilename(fetch.One("list")+"-"+period), count, checksum); err != nil {
			return err
		}
		if err := os.RemoveAll(validation); err != nil {
			return err
		}
	}
	return scanner.Err()
}

func nextMonth(period string) (string, error) {
	parsed, err := time.Parse("2006-01", period)
	if err != nil {
		return "", fmt.Errorf("invalid month %q", period)
	}
	return parsed.AddDate(0, 1, 0).Format("2006-01"), nil
}

func (runner Runner) fetchSourceHut(ctx context.Context, fetch config.Section, destination string) error {
	jar, _ := cookiejar.New(nil)
	client := *runner.Client
	client.Jar = jar
	pageRequest, _ := http.NewRequestWithContext(ctx, http.MethodGet, fetch.One("url"), nil)
	page, err := client.Do(pageRequest)
	if err != nil {
		return err
	}
	body, readErr := io.ReadAll(io.LimitReader(page.Body, 16<<20))
	page.Body.Close()
	if readErr != nil || page.StatusCode < 200 || page.StatusCode >= 300 {
		return fmt.Errorf("SourceHut list page failed: %v, HTTP %s", readErr, page.Status)
	}
	match := regexp.MustCompile(`name="_csrf_token"[^>]*value="([A-Za-z0-9._-]+)"`).FindSubmatch(body)
	if match == nil {
		return fmt.Errorf("SourceHut list page has no CSRF token")
	}
	form := url.Values{"_csrf_token": {string(match[1])}, "days": {"-1"}}
	request, _ := http.NewRequestWithContext(ctx, http.MethodPost, strings.TrimSuffix(fetch.One("url"), "/")+"/export", strings.NewReader(form.Encode()))
	request.Header.Set("Content-Type", "application/x-www-form-urlencoded")
	response, err := client.Do(request)
	if err != nil {
		return err
	}
	defer response.Body.Close()
	if response.StatusCode < 200 || response.StatusCode >= 300 {
		return fmt.Errorf("SourceHut export: HTTP %s", response.Status)
	}
	path := filepath.Join(destination, "export.mbox.partial")
	file, err := os.OpenFile(path, os.O_CREATE|os.O_EXCL|os.O_WRONLY, 0o644)
	if err != nil {
		return err
	}
	_, copyErr := io.Copy(file, response.Body)
	closeErr := file.Close()
	if copyErr != nil {
		return copyErr
	}
	if closeErr != nil {
		return closeErr
	}
	if err := verifyCanonicalSourceHut(path, fetch.One("sha256")); err != nil {
		return err
	}
	return os.Rename(path, filepath.Join(destination, "export.mbox"))
}

func verifyCanonicalSourceHut(path, expected string) error {
	file, err := os.Open(path)
	if err != nil {
		return err
	}
	defer file.Close()
	hash := sha256.New()
	scanner := bufio.NewScanner(file)
	scanner.Buffer(make([]byte, 64<<10), 256<<20)
	for scanner.Scan() {
		line := scanner.Text()
		if strings.HasPrefix(line, "From MAILER-DAEMON ") {
			line = "From MAILER-DAEMON Thu Jan 01 00:00:00 1970"
		}
		fmt.Fprintln(hash, line)
	}
	if err := scanner.Err(); err != nil {
		return err
	}
	if actual := hex.EncodeToString(hash.Sum(nil)); actual != expected {
		return fmt.Errorf("SourceHut canonical checksum mismatch: expected %s, got %s", expected, actual)
	}
	return nil
}

func fetchZIP(fetch config.Section, destination string) error {
	name := strings.TrimPrefix(fetch.One("url"), "local:")
	archivePath := filepath.Join(destination, safeFilename(filepath.Base(name)))
	reader, err := zip.OpenReader(archivePath)
	if err != nil {
		return err
	}
	defer reader.Close()
	output := filepath.Join(destination, "extracted")
	if err := os.Mkdir(output, 0o755); err != nil {
		return err
	}
	written := 0
	for _, item := range reader.File {
		if item.FileInfo().IsDir() || !strings.HasSuffix(strings.ToLower(item.Name), strings.ToLower(fetch.One("suffix"))) {
			continue
		}
		clean := filepath.Clean(filepath.FromSlash(item.Name))
		if filepath.IsAbs(clean) || clean == ".." || strings.HasPrefix(clean, ".."+string(filepath.Separator)) || item.Mode()&os.ModeSymlink != 0 {
			return fmt.Errorf("unsafe ZIP entry %q", item.Name)
		}
		path := filepath.Join(output, clean)
		if err := os.MkdirAll(filepath.Dir(path), 0o755); err != nil {
			return err
		}
		source, err := item.Open()
		if err != nil {
			return err
		}
		target, err := os.OpenFile(path, os.O_CREATE|os.O_EXCL|os.O_WRONLY, 0o644)
		if err != nil {
			source.Close()
			return err
		}
		_, copyErr := io.Copy(target, source)
		source.Close()
		target.Close()
		if copyErr != nil {
			return copyErr
		}
		written++
	}
	if written == 0 {
		return fmt.Errorf("ZIP selection produced no files")
	}
	return os.Remove(archivePath)
}

// fetchGutenberg retains the upstream UTF-8 text files. Catalog selection is
// generic acquisition bookkeeping; marker removal remains WALDO's bounded-text adapter.
func (runner Runner) fetchGutenberg(ctx context.Context, fetch config.Section, destination string, position int) error {
	catalogURL := strings.TrimSuffix(fetch.One("url"), "/") + "/cache/epub/feeds/pg_catalog.csv"
	if err := runner.fetchHTTP(ctx, syntheticHTTP(catalogURL, "", ".gutenberg-catalog.csv"), destination, position); err != nil {
		return err
	}
	catalog, err := os.Open(filepath.Join(destination, ".gutenberg-catalog.csv"))
	if err != nil {
		return err
	}
	defer catalog.Close()
	records, err := csv.NewReader(catalog).ReadAll()
	if err != nil {
		return err
	}
	excluded := map[string]bool{}
	for _, id := range strings.Fields(fetch.One("exclude-ids")) {
		excluded[id] = true
	}
	var ids []string
	for row, record := range records {
		if row == 0 || len(record) == 0 {
			continue
		}
		id := strings.TrimSpace(record[0])
		if _, err := strconv.Atoi(id); err == nil && !excluded[id] {
			ids = append(ids, id)
		}
	}
	limit, _ := strconv.Atoi(fetch.One("count"))
	if limit > 0 && len(ids) > limit {
		ids = ids[:limit]
	}
	if len(ids) == 0 {
		return fmt.Errorf("Gutenberg selection produced no books")
	}
	books := filepath.Join(destination, "books")
	if err := os.Mkdir(books, 0o755); err != nil {
		return err
	}
	for index, id := range ids {
		name := "pg" + id + ".txt"
		rawURL := fmt.Sprintf("%s/cache/epub/%s/%s", strings.TrimSuffix(fetch.One("url"), "/"), id, name)
		if err := runner.fetchHTTP(ctx, syntheticHTTP(rawURL, "", name), books, position*1000000+index); err != nil {
			return err
		}
		if err := decodeGzipInPlace(filepath.Join(books, name)); err != nil {
			return err
		}
	}
	return os.Remove(filepath.Join(destination, ".gutenberg-catalog.csv"))
}

func decodeGzipInPlace(path string) error {
	file, err := os.Open(path)
	if err != nil {
		return err
	}
	magic := make([]byte, 2)
	_, readErr := io.ReadFull(file, magic)
	file.Close()
	if readErr != nil || !bytes.Equal(magic, []byte{0x1f, 0x8b}) {
		return nil
	}
	input, _ := os.Open(path)
	reader, err := gzip.NewReader(input)
	if err != nil {
		input.Close()
		return err
	}
	partial := path + ".decoded"
	output, err := os.OpenFile(partial, os.O_CREATE|os.O_EXCL|os.O_WRONLY, 0o644)
	if err != nil {
		reader.Close()
		input.Close()
		return err
	}
	_, copyErr := io.Copy(output, reader)
	reader.Close()
	input.Close()
	output.Close()
	if copyErr != nil {
		return copyErr
	}
	if err := os.Rename(partial, path); err != nil {
		return err
	}
	return nil
}

func (runner Runner) fetchCAP(ctx context.Context, fetch config.Section, destination, root string, position int) error {
	helperMetadata, err := helperPath("cap_metadata.py")
	if err != nil {
		return err
	}
	helperExtract, err := helperPath("cap_extract.py")
	if err != nil {
		return err
	}
	work := filepath.Join(root, ".fetcher-work", fmt.Sprintf("cap-%04d", position))
	if err := os.MkdirAll(work, 0o755); err != nil {
		return err
	}
	metadata := filepath.Join(work, "metadata.json")
	if err := runner.fetchHTTP(ctx, syntheticHTTP(strings.TrimSuffix(fetch.One("url"), "/")+"/ReportersMetadata.json", "", "metadata.json"), work, position); err != nil {
		return err
	}
	reportersOutput, err := exec.CommandContext(ctx, "python3", helperMetadata, "reporters", metadata).Output()
	if err != nil {
		return err
	}
	reporters := strings.Fields(string(reportersOutput))
	limit, _ := strconv.Atoi(fetch.One("limit"))
	volumes := 0
	for _, reporter := range reporters {
		volumeMetadata := filepath.Join(work, reporter+"-volumes.json")
		if err := runner.fetchHTTP(ctx, syntheticHTTP(fmt.Sprintf("%s/%s/VolumesMetadata.json", strings.TrimSuffix(fetch.One("url"), "/"), reporter), "", filepath.Base(volumeMetadata)), work, position); err != nil {
			return err
		}
		output, err := exec.CommandContext(ctx, "python3", helperMetadata, "volumes", volumeMetadata, reporter).Output()
		if err != nil {
			return err
		}
		for _, line := range strings.Split(strings.TrimSpace(string(output)), "\n") {
			if line == "" || limit > 0 && volumes >= limit {
				break
			}
			fields := strings.Fields(line)
			if len(fields) != 2 {
				return fmt.Errorf("invalid CAP volume metadata")
			}
			archiveName := fields[0] + "-" + fields[1] + ".zip"
			rawURL := fmt.Sprintf("%s/%s/%s.zip", strings.TrimSuffix(fetch.One("url"), "/"), fields[0], fields[1])
			if err := runner.fetchHTTP(ctx, syntheticHTTP(rawURL, "", archiveName), work, position); err != nil {
				return err
			}
			if err := command(ctx, "python3", helperExtract, filepath.Join(work, archiveName), destination, fields[0], fields[1]); err != nil {
				return err
			}
			volumes++
		}
		if limit > 0 && volumes >= limit {
			break
		}
	}
	if volumes == 0 {
		return fmt.Errorf("CAP acquired no volumes")
	}
	return nil
}
