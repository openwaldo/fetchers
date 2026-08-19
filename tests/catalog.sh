#!/bin/sh
set -eu

repository=$(CDPATH='' cd -- "$(dirname -- "$0")/.." && pwd -P)
temporary=$(mktemp -d "${TMPDIR:-/tmp}/waldo-fetcher-catalog.XXXXXX")
trap 'rm -rf -- "$temporary"' EXIT HUP INT TERM

fail() {
  echo "FAIL: $*" >&2
  exit 1
}

count=0
for script in "$repository"/corpora/*.sh; do
  count=$((count + 1))
  [ -x "$script" ] || fail "not executable: $script"
  sh -n "$script" || fail "shell syntax: $script"
  [ "$(grep -c '^fetcher_main$' "$script")" -eq 1 ] ||
    fail "expected one fetcher_main entry point: $script"
  ! grep -q 'fetcher_manifest\|<<.*JSON' "$script" ||
    fail "embedded JSON manifest remains: $script"
  FETCHER_VALIDATE_ONLY=1 "$script" "$temporary/output" >/dev/null ||
    fail "declarative configuration: $script"
  FETCHER_SPEC_ONLY=1 "$script" "$temporary/output" | jq -e '
    (.corpus.id | type == "string" and length > 0) and
    (.corpus.title | type == "string" and length > 0) and
    (.corpus.destination | type == "string" and length > 0) and
    (.sources | type == "array" and length > 0) and
    all(.sources[];
      (.id | type == "string" and length > 0) and
      (.path | type == "string") and
      (.license | type == "string" and length > 0) and
      (.source.url | test("^https?://")) and
      (.source.license_evidence | type == "object") and
      (.input | type == "object") and
      (.artifacts | type == "array" and length > 0))
  ' >/dev/null || fail "generated manifest contract: $script"
done

[ "$count" -eq 53 ] || fail "expected 53 corpus scripts, found $count"

echo "catalog: PASS ($count corpus scripts)"
