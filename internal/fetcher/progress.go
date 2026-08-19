// Copyright (c) 2026 OpenWALDO Project contributors
// Copyright (c) 2026 CtrlIQ, Inc.
// Copyright (c) 2026 Gregory M. Kurtzer
// SPDX-License-Identifier: Apache-2.0

package fetcher

import (
	"fmt"
	"io"
	"os"
	"strings"
	"time"
)

type downloadProgress struct {
	output       io.Writer
	name         string
	initial      int64
	written      int64
	total        int64
	collection   *downloadCollectionProgress
	started      time.Time
	lastRendered time.Time
	interactive  bool
}

type downloadCollectionProgress struct {
	fileIndex      int
	fileCount      int
	completedBytes int64
	totalBytes     int64
}

func newDownloadProgress(output io.Writer, name string, initial, total int64) *downloadProgress {
	return &downloadProgress{output: output, name: name, initial: initial, total: total, interactive: terminalWriter(output)}
}

func newCollectionDownloadProgress(output io.Writer, name string, initial, total int64, collection downloadCollectionProgress) *downloadProgress {
	progress := newDownloadProgress(output, name, initial, total)
	progress.collection = &collection
	return progress
}

func (progress *downloadProgress) Start() {
	progress.started = time.Now()
	progress.render(progress.started, false)
}

func (progress *downloadProgress) Write(data []byte) (int, error) {
	progress.written += int64(len(data))
	now := time.Now()
	interval := 5 * time.Second
	if progress.interactive {
		interval = 250 * time.Millisecond
	}
	if now.Sub(progress.lastRendered) >= interval {
		progress.render(now, false)
	}
	return len(data), nil
}

func (progress *downloadProgress) Finish() {
	progress.render(time.Now(), true)
}

func (progress *downloadProgress) render(now time.Time, final bool) {
	current := progress.initial + progress.written
	elapsed := now.Sub(progress.started).Seconds()
	rate := float64(progress.written)
	if elapsed > 0 {
		rate /= elapsed
	}
	var detail string
	if progress.total > 0 {
		percent := 100 * float64(current) / float64(progress.total)
		if percent > 100 {
			percent = 100
		}
		detail = fmt.Sprintf("%s/%s %5.1f%%", humanTransferBytes(current), humanTransferBytes(progress.total), percent)
	} else {
		detail = humanTransferBytes(current)
	}
	if rate > 0 {
		detail += "  " + humanTransferBytes(int64(rate)) + "/s"
		if progress.collection == nil && progress.total > current {
			remaining := time.Duration(float64(progress.total-current)/rate) * time.Second
			detail += "  ETA " + formatETA(remaining)
		}
	}
	name := fmt.Sprintf("%-28s", truncateProgressName(progress.name, 28))
	if progress.collection != nil {
		name = fmt.Sprintf("file %d/%d %-28s", progress.collection.fileIndex, progress.collection.fileCount, truncateProgressName(progress.name, 28))
		overall := progress.collection.completedBytes + current
		if overall > progress.collection.totalBytes {
			overall = progress.collection.totalBytes
		}
		percent := 100 * float64(overall) / float64(progress.collection.totalBytes)
		detail += fmt.Sprintf("  | overall %s/%s %5.1f%%", humanTransferBytes(overall), humanTransferBytes(progress.collection.totalBytes), percent)
		if rate > 0 && progress.collection.totalBytes > overall {
			remaining := time.Duration(float64(progress.collection.totalBytes-overall)/rate) * time.Second
			detail += "  ETA " + formatETA(remaining)
		}
	}
	if final {
		detail += "  complete"
	}
	line := fmt.Sprintf("fetcher: download %s %s", name, detail)
	if progress.interactive {
		ending := "\r"
		if final {
			ending = "\n"
		}
		fmt.Fprintf(progress.output, "\r%-160s%s", line, ending)
	} else {
		fmt.Fprintln(progress.output, line)
	}
	progress.lastRendered = now
}

func terminalWriter(writer io.Writer) bool {
	file, ok := writer.(*os.File)
	if !ok {
		return false
	}
	info, err := file.Stat()
	return err == nil && info.Mode()&os.ModeCharDevice != 0
}

func humanTransferBytes(value int64) string {
	if value < 1024 {
		return fmt.Sprintf("%d B", value)
	}
	units := []string{"KiB", "MiB", "GiB", "TiB"}
	size := float64(value)
	unit := 0
	for size >= 1024 && unit < len(units)-1 {
		size /= 1024
		unit++
	}
	// The loop starts with bytes, so compensate for its first division.
	label := units[unit-1]
	return fmt.Sprintf("%.1f %s", size, label)
}

func formatETA(duration time.Duration) string {
	if duration < 0 {
		duration = 0
	}
	duration = duration.Round(time.Second)
	hours := int(duration / time.Hour)
	minutes := int(duration%time.Hour) / int(time.Minute)
	seconds := int(duration%time.Minute) / int(time.Second)
	if hours > 0 {
		return fmt.Sprintf("%d:%02d:%02d", hours, minutes, seconds)
	}
	return fmt.Sprintf("%02d:%02d", minutes, seconds)
}

func truncateProgressName(value string, maximum int) string {
	value = strings.TrimSpace(value)
	if len(value) <= maximum {
		return value
	}
	if maximum <= 3 {
		return value[:maximum]
	}
	return value[:maximum-3] + "..."
}
