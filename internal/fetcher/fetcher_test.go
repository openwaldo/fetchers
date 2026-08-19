// Copyright (c) 2026 OpenWALDO Project contributors
// Copyright (c) 2026 CtrlIQ, Inc.
// Copyright (c) 2026 Gregory M. Kurtzer
// SPDX-License-Identifier: Apache-2.0

package fetcher

import (
	"context"
	"crypto/sha256"
	"encoding/hex"
	"encoding/json"
	"io"
	"net/http"
	"os"
	"path/filepath"
	"strings"
	"testing"

	"github.com/openwaldo/fetchers/internal/config"
)

func TestHTTPFetcherWritesRawArtifactAndManifest(t *testing.T) {
	content := []byte("raw upstream data\n")
	client := &http.Client{Transport: roundTripFunc(func(request *http.Request) (*http.Response, error) {
		return &http.Response{StatusCode: http.StatusOK, Status: "200 OK", Body: io.NopCloser(strings.NewReader(string(content))), Header: make(http.Header)}, nil
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
sha256 = ` + hex.EncodeToString(digest[:]) + "\n"))
	if err != nil {
		t.Fatal(err)
	}
	output := filepath.Join(t.TempDir(), "handoff")
	if err := (Runner{Client: client}).Run(context.Background(), configuration, output); err != nil {
		t.Fatal(err)
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
}

type roundTripFunc func(*http.Request) (*http.Response, error)

func (function roundTripFunc) RoundTrip(request *http.Request) (*http.Response, error) {
	return function(request)
}
