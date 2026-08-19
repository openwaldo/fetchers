// Copyright (c) 2026 OpenWALDO Project contributors
// Copyright (c) 2026 CtrlIQ, Inc.
// Copyright (c) 2026 Gregory M. Kurtzer
// SPDX-License-Identifier: Apache-2.0

package fetcher

import (
	"bytes"
	"strings"
	"testing"
	"time"
)

func TestHumanTransferBytes(t *testing.T) {
	for value, expected := range map[int64]string{0: "0 B", 1023: "1023 B", 1024: "1.0 KiB", 1024 * 1024: "1.0 MiB"} {
		if actual := humanTransferBytes(value); actual != expected {
			t.Errorf("humanTransferBytes(%d) = %q, want %q", value, actual, expected)
		}
	}
}

func TestFormatETA(t *testing.T) {
	if actual := formatETA(65_000_000_000); actual != "01:05" {
		t.Fatalf("formatETA() = %q", actual)
	}
}

func TestDownloadProgressIncludesRateAndETAForKnownLength(t *testing.T) {
	var output bytes.Buffer
	now := time.Now()
	progress := &downloadProgress{
		output: &output, name: "fixture.bin", written: 50 << 20, total: 100 << 20,
		started: now.Add(-10 * time.Second),
	}
	progress.render(now, false)
	text := output.String()
	for _, expected := range []string{"50.0%", "MiB/s", "ETA"} {
		if !strings.Contains(text, expected) {
			t.Fatalf("progress lacks %q: %s", expected, text)
		}
	}
}

func TestDownloadProgressIncludesCollectionProgress(t *testing.T) {
	var output bytes.Buffer
	now := time.Now()
	progress := &downloadProgress{
		output: &output, name: "shard.parquet", written: 50 << 20, total: 100 << 20,
		started: now.Add(-10 * time.Second),
		collection: &downloadCollectionProgress{
			fileIndex: 3, fileCount: 6, completedBytes: 200 << 20, totalBytes: 600 << 20,
		},
	}
	progress.render(now, false)
	text := output.String()
	for _, expected := range []string{"file 3/6", "overall 250.0 MiB/600.0 MiB", "41.7%", "ETA"} {
		if !strings.Contains(text, expected) {
			t.Fatalf("collection progress lacks %q: %s", expected, text)
		}
	}
}
