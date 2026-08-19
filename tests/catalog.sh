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
  occurrences=$(grep -c "^fetcher_manifest <<'JSON'$" "$script")
  [ "$occurrences" -eq 1 ] || fail "expected one manifest: $script"
  manifest=$temporary/$(basename "$script").json
  sed -n "/^fetcher_manifest <<'JSON'$/,/^JSON$/p" "$script" |
    sed '1d;$d' >"$manifest"
  jq -e '
    (.corpus.id | type == "string" and length > 0) and
    (.corpus.title | type == "string" and length > 0) and
    (.sources | type == "array" and length > 0) and
    all(.sources[];
      (.id | type == "string" and length > 0) and
      (.path | type == "string") and
      (.license | type == "string" and length > 0) and
      (.source.url | test("^https?://")) and
      (.source.license_evidence | type == "object") and
      (.input.type | type == "string" and length > 0))
  ' "$manifest" >/dev/null || fail "manifest contract: $script"
done

[ "$count" -eq 53 ] || fail "expected 53 corpus scripts, found $count"

echo "catalog: PASS ($count corpus scripts)"
