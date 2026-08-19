// Copyright (c) 2026 OpenWALDO Project contributors
// Copyright (c) 2026 CtrlIQ, Inc.
// Copyright (c) 2026 Gregory M. Kurtzer
// SPDX-License-Identifier: Apache-2.0

package config

import (
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
