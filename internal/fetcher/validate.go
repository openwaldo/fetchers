// Copyright (c) 2026 OpenWALDO Project contributors
// Copyright (c) 2026 CtrlIQ, Inc.
// Copyright (c) 2026 Gregory M. Kurtzer
// SPDX-License-Identifier: Apache-2.0

package fetcher

import (
	"bufio"
	"bytes"
	"compress/gzip"
	"encoding/json"
	"encoding/xml"
	"errors"
	"fmt"
	"io"
	"os"
	"path/filepath"
	"regexp"
	"sort"
	"strings"
	"unicode/utf8"

	"github.com/klauspost/compress/zstd"
	"github.com/openwaldo/fetchers/internal/config"
	"github.com/parquet-go/parquet-go"
)

const validationRecordLimit = 100

func validateFetchedCorpus(cfg config.File, root string, stderr io.Writer) error {
	for _, source := range cfg.SortedSources() {
		id := cfg.SourceID(source)
		sourceCode := false
		for _, contentType := range source.Values["content-type"] {
			sourceCode = sourceCode || strings.EqualFold(strings.TrimSpace(contentType), "source code")
		}
		input, ok := cfg.Input(id)
		if !ok {
			return fmt.Errorf("source %q has no [input] declaration", id)
		}
		directory := root
		if len(cfg.Sources) > 1 {
			directory = filepath.Join(root, id)
		}
		files, err := validationFiles(directory)
		if err != nil {
			return fmt.Errorf("source %q: %w", id, err)
		}
		if len(files) == 0 {
			return fmt.Errorf("source %q: fetch produced no regular files", id)
		}
		for _, path := range files {
			if err := validateFetchedFile(path, input, sourceCode); err != nil {
				relative, _ := filepath.Rel(root, path)
				return fmt.Errorf("source %q file %q declares format %q and profile %q: %w", id, filepath.ToSlash(relative), input.One("format"), input.One("type"), err)
			}
		}
		fmt.Fprintf(stderr, "fetcher: validated source %s: %d files as %s", id, len(files), input.One("format"))
		if input.One("type") != "" {
			fmt.Fprintf(stderr, " with %s mapping", input.One("type"))
		}
		fmt.Fprintln(stderr)
	}
	return nil
}

func validationFiles(root string) ([]string, error) {
	var result []string
	err := filepath.WalkDir(root, func(path string, entry os.DirEntry, err error) error {
		if err != nil {
			return err
		}
		if path == root {
			return nil
		}
		if entry.IsDir() && path == filepath.Join(root, ".fetcher-work") {
			return filepath.SkipDir
		}
		if entry.Type()&os.ModeSymlink != 0 {
			return fmt.Errorf("validation refuses symlink %s", path)
		}
		if entry.IsDir() {
			return nil
		}
		info, err := entry.Info()
		if err != nil {
			return err
		}
		if !info.Mode().IsRegular() {
			return fmt.Errorf("validation refuses special file %s", path)
		}
		if entry.Name() == "manifest.json" {
			return nil
		}
		if strings.HasSuffix(entry.Name(), ".partial") {
			return fmt.Errorf("incomplete download remains at %s", path)
		}
		result = append(result, path)
		return nil
	})
	sort.Strings(result)
	return result, err
}

func validateFetchedFile(path string, input config.Section, sourceCode bool) error {
	format := input.One("format")
	if format == "parquet" {
		return validateParquet(path, input)
	}
	reader, compressed, closeReader, err := openValidationReader(path)
	if err != nil {
		return err
	}
	defer closeReader()
	if compressed && format != "jsonl" && format != "mbox" {
		return fmt.Errorf("compression is supported only for declared format jsonl or mbox")
	}
	switch format {
	case "text", "markdown":
		return validateText(reader, input, sourceCode)
	case "mbox":
		return validateMbox(reader)
	case "json":
		return validateJSON(reader, input)
	case "jsonl":
		return validateJSONL(reader, input)
	case "xml":
		return validateXML(reader, input)
	default:
		return fmt.Errorf("unsupported validation format %q", format)
	}
}

func openValidationReader(path string) (io.Reader, bool, func() error, error) {
	file, err := os.Open(path)
	if err != nil {
		return nil, false, nil, err
	}
	header := make([]byte, 4)
	count, readErr := io.ReadFull(file, header)
	if readErr != nil && !errors.Is(readErr, io.EOF) && !errors.Is(readErr, io.ErrUnexpectedEOF) {
		file.Close()
		return nil, false, nil, readErr
	}
	if _, err := file.Seek(0, io.SeekStart); err != nil {
		file.Close()
		return nil, false, nil, err
	}
	if count >= 2 && bytes.Equal(header[:2], []byte{0x1f, 0x8b}) {
		reader, err := gzip.NewReader(file)
		if err != nil {
			file.Close()
			return nil, false, nil, fmt.Errorf("invalid gzip stream: %w", err)
		}
		return reader, true, func() error { reader.Close(); return file.Close() }, nil
	}
	if count == 4 && bytes.Equal(header, []byte{0x28, 0xb5, 0x2f, 0xfd}) {
		reader, err := zstd.NewReader(file)
		if err != nil {
			file.Close()
			return nil, false, nil, fmt.Errorf("invalid Zstandard stream: %w", err)
		}
		return reader, true, func() error { reader.Close(); return file.Close() }, nil
	}
	return file, false, file.Close, nil
}

func validateText(reader io.Reader, input config.Section, sourceCode bool) error {
	buffered := bufio.NewReader(reader)
	if !sourceCode {
		prefix, _ := buffered.Peek(4096)
		trimmed := bytes.TrimSpace(prefix)
		switch {
		case len(trimmed) > 0 && (trimmed[0] == '{' || trimmed[0] == '['):
			return fmt.Errorf("declared text appears to be JSON; declare format json or jsonl and add a mapping")
		case len(trimmed) > 0 && trimmed[0] == '<':
			return fmt.Errorf("declared text appears to be XML or HTML; declare the matching supported format")
		case bytes.HasPrefix(trimmed, []byte("From ")):
			return fmt.Errorf("declared text appears to be mbox; declare format mbox")
		}
	}
	var content []byte
	if input.One("type") == "bounded-text" {
		var err error
		content, err = io.ReadAll(buffered)
		if err != nil {
			return err
		}
		if len(content) == 0 || bytes.IndexByte(content, 0) >= 0 || !utf8.Valid(content) {
			return fmt.Errorf("expected non-empty NUL-free UTF-8 text")
		}
	} else {
		nonempty := false
		for {
			char, size, err := buffered.ReadRune()
			if errors.Is(err, io.EOF) {
				break
			}
			if err != nil || char == 0 || char == utf8.RuneError && size == 1 {
				return fmt.Errorf("expected non-empty NUL-free UTF-8 text")
			}
			nonempty = true
		}
		if !nonempty {
			return fmt.Errorf("expected non-empty NUL-free UTF-8 text")
		}
	}
	if len(content) == 0 && input.One("type") == "bounded-text" {
		return fmt.Errorf("expected non-empty NUL-free UTF-8 text")
	}
	if input.One("type") == "bounded-text" {
		start, err := regexp.Compile(input.One("start-pattern"))
		if err != nil {
			return fmt.Errorf("invalid start-pattern: %w", err)
		}
		end, err := regexp.Compile(input.One("end-pattern"))
		if err != nil {
			return fmt.Errorf("invalid end-pattern: %w", err)
		}
		startMatch := start.FindIndex(content)
		if startMatch == nil {
			return fmt.Errorf("bounded-text start-pattern did not match")
		}
		if end.FindIndex(content[startMatch[1]:]) == nil {
			return fmt.Errorf("bounded-text end-pattern did not match after the start marker")
		}
	}
	return nil
}

func validateMbox(reader io.Reader) error {
	buffered := bufio.NewReader(reader)
	line, err := buffered.ReadString('\n')
	if err != nil && !errors.Is(err, io.EOF) {
		return err
	}
	if !strings.HasPrefix(line, "From ") {
		return fmt.Errorf("expected an mbox envelope line beginning with %q; first line was %q", "From ", strings.TrimSpace(line))
	}
	return nil
}

func validateJSON(reader io.Reader, input config.Section) error {
	decoder := json.NewDecoder(reader)
	decoder.UseNumber()
	token, err := decoder.Token()
	if err != nil {
		return fmt.Errorf("invalid JSON: %w", err)
	}
	delimiter, ok := token.(json.Delim)
	if !ok || (delimiter != '{' && delimiter != '[') {
		return fmt.Errorf("expected a top-level object or array of objects")
	}
	var records []any
	count := 0
	appendRecord := func(record any) error {
		count++
		if _, ok := record.(map[string]any); !ok {
			return fmt.Errorf("JSON record %d must contain an object, got %T", count, record)
		}
		if len(records) < validationRecordLimit {
			records = append(records, record)
		}
		return nil
	}
	if delimiter == '{' {
		object := map[string]any{}
		for decoder.More() {
			name, err := decoder.Token()
			if err != nil {
				return err
			}
			key, ok := name.(string)
			if !ok {
				return fmt.Errorf("JSON object key is not a string")
			}
			var value any
			if err := decoder.Decode(&value); err != nil {
				return err
			}
			object[key] = value
		}
		if _, err := decoder.Token(); err != nil {
			return err
		}
		if err := appendRecord(object); err != nil {
			return err
		}
	} else {
		for decoder.More() {
			var record any
			if err := decoder.Decode(&record); err != nil {
				return fmt.Errorf("invalid JSON record %d: %w", count+1, err)
			}
			if err := appendRecord(record); err != nil {
				return err
			}
		}
		if _, err := decoder.Token(); err != nil {
			return err
		}
	}
	if count == 0 {
		return fmt.Errorf("JSON contains no records")
	}
	var extra any
	if err := decoder.Decode(&extra); !errors.Is(err, io.EOF) {
		if err == nil {
			return fmt.Errorf("expected one JSON value but found another")
		}
		return fmt.Errorf("invalid trailing JSON: %w", err)
	}
	return validateMappedRecords(records, input)
}

func validateJSONL(reader io.Reader, input config.Section) error {
	buffered := bufio.NewReader(reader)
	var records []any
	lineNumber := 0
	for len(records) < validationRecordLimit {
		line, err := buffered.ReadBytes('\n')
		if len(line) > 0 {
			lineNumber++
			line = bytes.TrimSpace(line)
			if len(line) != 0 {
				decoder := json.NewDecoder(bytes.NewReader(line))
				decoder.UseNumber()
				var record any
				if decodeErr := decoder.Decode(&record); decodeErr != nil {
					return fmt.Errorf("invalid JSONL record at line %d: %w", lineNumber, decodeErr)
				}
				if _, ok := record.(map[string]any); !ok {
					return fmt.Errorf("JSONL line %d must contain an object, got %T", lineNumber, record)
				}
				var extra any
				if decodeErr := decoder.Decode(&extra); !errors.Is(decodeErr, io.EOF) {
					return fmt.Errorf("JSONL line %d contains more than one JSON value", lineNumber)
				}
				records = append(records, record)
			}
		}
		if errors.Is(err, io.EOF) {
			break
		}
		if err != nil {
			return err
		}
	}
	if len(records) == 0 {
		return fmt.Errorf("JSONL contains no records")
	}
	return validateMappedRecords(records, input)
}

func validateMappedRecords(records []any, input config.Section) error {
	for _, path := range mappedPaths(input) {
		found := false
		for _, record := range records {
			if pathPresent(record, path) {
				found = true
				break
			}
		}
		if !found {
			return fmt.Errorf("mapped field path %q was absent from the first %d record(s); correct the [input] mapping", path, len(records))
		}
	}
	return nil
}

func mappedPaths(input config.Section) []string {
	var result []string
	for _, field := range []string{"text", "text-fallback"} {
		result = append(result, input.Values[field]...)
	}
	for _, field := range []string{"id", "date", "language", "license", "source", "context", "response", "role", "content", "system", "tools", "tree-root", "replies", "rank"} {
		if value := input.One(field); value != "" {
			result = append(result, value)
		}
	}
	for _, value := range input.Values["meta"] {
		if _, path, ok := strings.Cut(value, "="); ok {
			result = append(result, strings.TrimSpace(path))
		}
	}
	return result
}

func pathPresent(value any, path string) bool {
	values := []any{value}
	for _, raw := range strings.Split(path, ".") {
		expand := strings.HasSuffix(raw, "[]")
		name := strings.TrimSuffix(raw, "[]")
		var next []any
		for _, current := range values {
			object, ok := current.(map[string]any)
			if !ok {
				continue
			}
			child, ok := object[name]
			if !ok || child == nil {
				continue
			}
			if expand {
				array, ok := child.([]any)
				if !ok {
					continue
				}
				next = append(next, array...)
			} else {
				next = append(next, child)
			}
		}
		values = next
		if len(values) == 0 {
			return false
		}
	}
	return len(values) > 0
}

func validateParquet(path string, input config.Section) error {
	file, err := os.Open(path)
	if err != nil {
		return err
	}
	defer file.Close()
	info, err := file.Stat()
	if err != nil {
		return err
	}
	parquetFile, err := parquet.OpenFile(file, info.Size())
	if err != nil {
		return fmt.Errorf("invalid Parquet file: %w", err)
	}
	for _, path := range mappedPaths(input) {
		if _, ok := lookupParquetField(parquetFile.Schema(), path); !ok {
			return fmt.Errorf("mapped Parquet field %q is absent or non-scalar; correct the [input] mapping", path)
		}
	}
	if parquetFile.NumRows() == 0 {
		return fmt.Errorf("Parquet file contains no rows")
	}
	return nil
}

func lookupParquetField(schema *parquet.Schema, path string) (parquet.LeafColumn, bool) {
	clean := strings.ReplaceAll(path, "[]", "")
	if leaf, ok := schema.Lookup(strings.Split(clean, ".")...); ok {
		return leaf, true
	}
	var match parquet.LeafColumn
	found := false
	for _, physical := range schema.Columns() {
		if !parquetPathMatches(path, physical) {
			continue
		}
		leaf, ok := schema.Lookup(physical...)
		if !ok || found {
			return parquet.LeafColumn{}, false
		}
		match, found = leaf, true
	}
	return match, found
}

func parquetPathMatches(logical string, physical []string) bool {
	segments := strings.Split(logical, ".")
	position := 0
	for _, raw := range segments {
		repeated := strings.HasSuffix(raw, "[]")
		name := strings.TrimSuffix(raw, "[]")
		if position >= len(physical) || physical[position] != name {
			return false
		}
		position++
		if repeated {
			for position < len(physical) && parquetListWrapper(physical[position]) {
				position++
			}
		}
	}
	return position == len(physical)
}

func parquetListWrapper(name string) bool {
	switch name {
	case "list", "element", "item", "array", "array_element", "bag":
		return true
	default:
		return false
	}
}

func validateXML(reader io.Reader, input config.Section) error {
	decoder := xml.NewDecoder(reader)
	paths := mappedPaths(input)
	found := make([]bool, len(paths))
	var stack []string
	for {
		token, err := decoder.Token()
		if errors.Is(err, io.EOF) {
			break
		}
		if err != nil {
			return fmt.Errorf("invalid XML: %w", err)
		}
		switch token := token.(type) {
		case xml.StartElement:
			stack = append(stack, token.Name.Local)
			for index, selector := range paths {
				if xmlPathMatches(selector, stack) {
					found[index] = true
				}
			}
		case xml.EndElement:
			if len(stack) > 0 {
				stack = stack[:len(stack)-1]
			}
		}
	}
	for index, ok := range found {
		if !ok {
			return fmt.Errorf("XML selector %q did not match any element; correct the [input] mapping", paths[index])
		}
	}
	return nil
}

func xmlPathMatches(selector string, stack []string) bool {
	descendant := strings.HasPrefix(selector, "//")
	selector = strings.TrimPrefix(strings.TrimPrefix(selector, "//"), "/")
	var parts []string
	for _, part := range strings.Split(selector, "/") {
		if part == "" || strings.HasPrefix(part, "@") {
			continue
		}
		if colon := strings.IndexByte(part, ':'); colon >= 0 {
			part = part[colon+1:]
		}
		parts = append(parts, part)
	}
	if len(parts) > len(stack) {
		return false
	}
	start := 0
	if descendant {
		start = len(stack) - len(parts)
	} else if len(parts) != len(stack) {
		return false
	}
	for index := range parts {
		if parts[index] != "*" && parts[index] != stack[start+index] {
			return false
		}
	}
	return true
}
