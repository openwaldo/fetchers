#!/bin/sh
set -eu

repository=$(CDPATH='' cd -- "$(dirname -- "$0")/.." && pwd -P)
fetcher_test_cache=$(mktemp -d "${TMPDIR:-/tmp}/waldo-fetcher-pycache.XXXXXX")
trap 'rm -rf -- "$fetcher_test_cache"' EXIT HUP INT TERM

if command -v shellcheck >/dev/null 2>&1; then
  # Dynamic absolute sourcing is intentional and tested by executing functions.sh.
  shellcheck -e SC1091 -s sh "$repository/functions.sh" \
    "$repository"/corpora/*.sh "$repository"/tests/*.sh
else
  echo 'tests: shellcheck unavailable; skipping lint' >&2
fi

if command -v python3 >/dev/null 2>&1; then
  PYTHONPYCACHEPREFIX=$fetcher_test_cache \
    python3 -m py_compile "$repository"/libexec/*.py
fi

"$repository/tests/functions.sh"
"$repository/tests/catalog.sh"
