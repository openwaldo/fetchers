// Copyright (c) 2026 OpenWALDO Project contributors
// Copyright (c) 2026 CtrlIQ, Inc.
// Copyright (c) 2026 Gregory M. Kurtzer
// SPDX-License-Identifier: Apache-2.0

package config

import (
	"os"
	"path/filepath"
	"strings"
	"testing"
)

func TestParseMinimalHTTPConfiguration(t *testing.T) {
	file, err := Parse(strings.NewReader(`[corpus]
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
url = https://example.test/data.jsonl.gz
estimated-size = 1G
`))
	if err != nil {
		t.Fatal(err)
	}
	if file.Corpus.One("id") != "example" || len(file.Sources) != 1 || len(file.Fetches) != 1 {
		t.Fatalf("file = %+v", file)
	}
}

func TestCorpusCatalogParses(t *testing.T) {
	paths, err := filepath.Glob(filepath.Join("..", "..", "corpora", "*.ini"))
	if err != nil {
		t.Fatal(err)
	}
	if len(paths) == 0 {
		t.Fatal("corpus catalog is empty")
	}
	for _, path := range paths {
		t.Run(filepath.Base(path), func(t *testing.T) {
			file, err := os.Open(path)
			if err != nil {
				t.Fatal(err)
			}
			defer file.Close()
			if _, err := Parse(file); err != nil {
				t.Fatal(err)
			}
		})
	}
}

func TestParseRejectsUnknownField(t *testing.T) {
	_, err := Parse(strings.NewReader(`[corpus]
id = example
title = Example
description = Example corpus.
unknown = value
`))
	if err == nil || !strings.Contains(err.Error(), "unknown") {
		t.Fatalf("error = %v", err)
	}
}
