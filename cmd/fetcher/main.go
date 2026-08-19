// Copyright (c) 2026 OpenWALDO Project contributors
// Copyright (c) 2026 CtrlIQ, Inc.
// Copyright (c) 2026 Gregory M. Kurtzer
// SPDX-License-Identifier: Apache-2.0

package main

import (
	"context"
	"fmt"
	"os"

	"github.com/openwaldo/fetchers/internal/config"
	"github.com/openwaldo/fetchers/internal/fetcher"
)

func main() {
	if len(os.Args) != 3 {
		fmt.Fprintf(os.Stderr, "Usage: %s CORPUS.ini OUTPUT_DIRECTORY\n", os.Args[0])
		os.Exit(2)
	}
	file, err := os.Open(os.Args[1])
	if err != nil {
		fatal(err)
	}
	configuration, err := config.Parse(file)
	closeErr := file.Close()
	if err != nil {
		fatal(err)
	}
	if closeErr != nil {
		fatal(closeErr)
	}
	if err := (fetcher.Runner{Stderr: os.Stderr}).Run(context.Background(), configuration, os.Args[2]); err != nil {
		fatal(err)
	}
}

func fatal(err error) {
	fmt.Fprintf(os.Stderr, "fetcher: %v\n", err)
	os.Exit(1)
}
