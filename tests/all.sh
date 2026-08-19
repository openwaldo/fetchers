#!/bin/sh
# Copyright (c) 2026 OpenWALDO Project contributors
# Copyright (c) 2026 CtrlIQ, Inc.
# Copyright (c) 2026 Gregory M. Kurtzer
# SPDX-License-Identifier: Apache-2.0

set -eu

repository=$(CDPATH='' cd -- "$(dirname -- "$0")/.." && pwd -P)
fetcher_test_cache=$(mktemp -d "${TMPDIR:-/tmp}/waldo-fetcher-pycache.XXXXXX")
trap 'rm -rf -- "$fetcher_test_cache"' EXIT HUP INT TERM

if command -v python3 >/dev/null 2>&1; then
  PYTHONPYCACHEPREFIX=$fetcher_test_cache \
    python3 -m py_compile "$repository"/libexec/*.py
fi

task_cache=$fetcher_test_cache/go
(
  cd "$repository"
  GOCACHE=$task_cache go test ./...
)

printf 'tests: PASS\n'
