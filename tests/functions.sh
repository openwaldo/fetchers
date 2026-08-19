#!/bin/sh
set -eu

repository=$(CDPATH='' cd -- "$(dirname -- "$0")/.." && pwd -P)
. "$repository/functions.sh"

temporary=$(mktemp -d "${TMPDIR:-/tmp}/waldo-fetchers-test.XXXXXX")
trap 'rm -rf -- "$temporary"' EXIT HUP INT TERM

fail() {
  echo "FAIL: $*" >&2
  exit 1
}

[ "$(fetcher_size_bytes 10G)" = 10737418240 ] || fail '10G parsing'
[ "$(fetcher_size_bytes 1.5MiB)" = 1572864 ] || fail '1.5MiB parsing'
if fetcher_size_bytes nonsense >/dev/null 2>&1; then
  fail 'invalid size accepted'
fi

output=$temporary/output
fetcher_begin "$output"
fetcher_size 1B 1B
printf 'hello\n' >"$FETCHER_RAW/example.txt"
# The manifest specification is provided on standard input.
# shellcheck disable=SC2119
fetcher_manifest <<'JSON'
{
  "corpus": {
    "id": "example",
    "title": "Example corpus",
    "description": "Offline manifest test."
  },
  "sources": [
    {
      "id": "example",
      "path": "",
      "license": "CC0-1.0",
      "source": {
        "name": "Example",
        "url": "https://example.invalid/corpus",
        "category": "public-dataset",
        "license_evidence": {"declaration": "CC0-1.0"}
      },
      "input": {}
    }
  ]
}
JSON

jq -e '
  .kind == "waldo-source-directory" and
  .schema == 1 and
  .raw.file_count == 1 and
  .raw.byte_count == 6 and
  (.raw.tree_sha256 | test("^[0-9a-f]{64}$")) and
  (.fetcher.sha256 | test("^[0-9a-f]{64}$"))
' "$output/manifest.json" >/dev/null || fail 'generated manifest'

git_source=$temporary/git-source
git_output=$temporary/git-output
git init -q "$git_source"
git -C "$git_source" config user.name 'Fetcher Test'
git -C "$git_source" config user.email 'fetcher@example.invalid'
printf 'raw git content\n' >"$git_source/example.txt"
git -C "$git_source" add example.txt
git -C "$git_source" commit -q -m fixture
git_commit=$(git -C "$git_source" rev-parse HEAD)
fetcher_begin "$git_output"
fetcher_size 1B 1B
fetcher_git source "file://$git_source" "$git_commit" "$git_commit" example.txt
[ "$(cat "$git_output/raw/source/example.txt")" = 'raw git content' ] ||
  fail 'pinned Git export'

if fetcher_begin one two >/dev/null 2>&1; then
  fail 'extra destination argument accepted'
fi

echo 'functions: PASS'
