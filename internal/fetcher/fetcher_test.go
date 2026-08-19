// Copyright (c) 2026 OpenWALDO Project contributors
// Copyright (c) 2026 CtrlIQ, Inc.
// Copyright (c) 2026 Gregory M. Kurtzer
// SPDX-License-Identifier: Apache-2.0

package fetcher

import (
	"archive/tar"
	"bytes"
	"context"
	"crypto/sha256"
	"encoding/hex"
	"encoding/json"
	"errors"
	"io"
	"net/http"
	"os"
	"path/filepath"
	"strings"
	"testing"

	"github.com/openwaldo/fetchers/internal/config"
)

func TestGitArchiveRetainsOnlyIngestibleText(t *testing.T) {
	var archive bytes.Buffer
	writer := tar.NewWriter(&archive)
	files := []struct {
		name string
		data []byte
	}{
		{"main.go", []byte("package main\n")},
		{"page.html", []byte("<!doctype html><p>source template</p>\n")},
		{"empty.txt", nil},
		{"image.bin", []byte{0, 1, 2}},
	}
	for _, file := range files {
		if err := writer.WriteHeader(&tar.Header{Name: file.name, Mode: 0o644, Size: int64(len(file.data)), Typeflag: tar.TypeReg}); err != nil {
			t.Fatal(err)
		}
		if _, err := writer.Write(file.data); err != nil {
			t.Fatal(err)
		}
	}
	if err := writer.Close(); err != nil {
		t.Fatal(err)
	}
	output := t.TempDir()
	stats, err := extractTar(bytes.NewReader(archive.Bytes()), output)
	if err != nil {
		t.Fatal(err)
	}
	if stats.Retained != 2 || stats.Skipped != 2 {
		t.Fatalf("archive stats = %+v", stats)
	}
	for _, name := range []string{"main.go", "page.html"} {
		if _, err := os.Stat(filepath.Join(output, name)); err != nil {
			t.Fatalf("retained %s: %v", name, err)
		}
	}
	for _, name := range []string{"empty.txt", "image.bin"} {
		if _, err := os.Stat(filepath.Join(output, name)); !os.IsNotExist(err) {
			t.Fatalf("skipped %s still exists", name)
		}
	}
}

func TestHTTPFetcherWritesRawArtifactAndManifest(t *testing.T) {
	content := []byte("raw upstream data\n")
	client := &http.Client{Transport: roundTripFunc(func(request *http.Request) (*http.Response, error) {
		return &http.Response{StatusCode: http.StatusOK, Status: "200 OK", ContentLength: int64(len(content)), Body: io.NopCloser(strings.NewReader(string(content))), Header: make(http.Header)}, nil
	})}
	digest := sha256.Sum256(content)
	configuration, err := config.Parse(strings.NewReader(`[corpus]
id = example
title = Example
description = Example corpus.

[source]
name = Example
url = https://example.test/source
category = public-dataset
license = CC0-1.0
license-declaration = CC0 1.0

[fetch]
fetcher = http
url = https://download.example.test/data.txt
estimated-size = 1B
sha256 = ` + hex.EncodeToString(digest[:]) + `
[input]
format = text
`))
	if err != nil {
		t.Fatal(err)
	}
	output := filepath.Join(t.TempDir(), "handoff")
	var progress bytes.Buffer
	if err := (Runner{Client: client, Stderr: &progress}).Run(context.Background(), configuration, output); err != nil {
		t.Fatal(err)
	}
	if !strings.Contains(progress.String(), "download data.txt") || !strings.Contains(progress.String(), "100.0%") || !strings.Contains(progress.String(), "complete") {
		t.Fatalf("progress = %q", progress.String())
	}
	got, err := os.ReadFile(filepath.Join(output, "data.txt"))
	if err != nil {
		t.Fatal(err)
	}
	if string(got) != string(content) {
		t.Fatalf("content = %q", got)
	}
	manifestData, err := os.ReadFile(filepath.Join(output, "manifest.json"))
	if err != nil {
		t.Fatal(err)
	}
	var manifest map[string]any
	if err := json.Unmarshal(manifestData, &manifest); err != nil {
		t.Fatal(err)
	}
	if manifest["kind"] != "waldo-corpus-directory" || manifest["source"] == nil || manifest["raw"] == nil {
		t.Fatalf("manifest = %+v", manifest)
	}
	source := manifest["source"].(map[string]any)
	input := source["input"].(map[string]any)
	if input["format"] != "text" {
		t.Fatalf("manifest input = %+v", input)
	}
}

func TestPostFetchValidationPreservesMismatchedData(t *testing.T) {
	content := []byte("not jsonl\n")
	client := &http.Client{Transport: roundTripFunc(func(request *http.Request) (*http.Response, error) {
		return &http.Response{StatusCode: http.StatusOK, Status: "200 OK", ContentLength: int64(len(content)), Body: io.NopCloser(bytes.NewReader(content)), Header: make(http.Header)}, nil
	})}
	configuration, err := config.Parse(strings.NewReader(`[corpus]
id = example
title = Example
description = Example corpus.

[source]
name = Example
url = https://example.test/source
category = public-dataset
license = CC0-1.0
license-declaration = CC0 1.0

[fetch]
fetcher = http
url = https://download.example.test/data.jsonl
estimated-size = 1B

[input]
format = jsonl
type = record-map
text = text
`))
	if err != nil {
		t.Fatal(err)
	}
	output := filepath.Join(t.TempDir(), "handoff")
	err = (Runner{Client: client, Stderr: io.Discard}).Run(context.Background(), configuration, output)
	if err == nil || !strings.Contains(err.Error(), `declares format "jsonl"`) || !strings.Contains(err.Error(), "invalid JSONL record at line 1") || !strings.Contains(err.Error(), "downloaded data remains") {
		t.Fatalf("error = %v", err)
	}
	if data, readErr := os.ReadFile(filepath.Join(output, "data.jsonl")); readErr != nil || !bytes.Equal(data, content) {
		t.Fatalf("downloaded content was not preserved: data=%q err=%v", data, readErr)
	}
	if _, statErr := os.Stat(filepath.Join(output, "manifest.json")); !os.IsNotExist(statErr) {
		t.Fatalf("failed fetch must not publish manifest: %v", statErr)
	}
	configuration.Inputs[0].Values = map[string][]string{"format": {"text"}}
	noNetwork := &http.Client{Transport: roundTripFunc(func(request *http.Request) (*http.Response, error) {
		return nil, errors.New("network must not be used during validation retry")
	})}
	if err := (Runner{Client: noNetwork, Stderr: io.Discard}).Run(context.Background(), configuration, output); err != nil {
		t.Fatalf("validation retry failed: %v", err)
	}
	if _, statErr := os.Stat(filepath.Join(output, "manifest.json")); statErr != nil {
		t.Fatalf("validation retry did not publish manifest: %v", statErr)
	}
}

func TestPostFetchValidationExplainsIncorrectMapping(t *testing.T) {
	input := config.Section{Values: map[string][]string{
		"format": {"jsonl"}, "type": {"dialogue-pair"}, "text": {"question"}, "response": {"missing_answer"},
	}}
	err := validateFetchedFile(writeValidationFixture(t, "record.jsonl", `{"question":"hello","answer":"world"}`+"\n"), input, false)
	if err == nil || !strings.Contains(err.Error(), `mapped field path "missing_answer" was absent`) || !strings.Contains(err.Error(), "correct the [input] mapping") {
		t.Fatalf("error = %v", err)
	}
}

func writeValidationFixture(t *testing.T, name, content string) string {
	t.Helper()
	path := filepath.Join(t.TempDir(), name)
	if err := os.WriteFile(path, []byte(content), 0o644); err != nil {
		t.Fatal(err)
	}
	return path
}

type roundTripFunc func(*http.Request) (*http.Response, error)

func (function roundTripFunc) RoundTrip(request *http.Request) (*http.Response, error) {
	return function(request)
}
