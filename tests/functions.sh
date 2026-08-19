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
(
  CORPUS_ID=example
  CORPUS_TITLE='Example corpus'
  CORPUS_DESCRIPTION='Offline manifest test.'
  CORPUS_DESTINATION=tests/example
  SOURCE_ID=example
  SOURCE_PATH=
  SOURCE_LICENSE=CC0-1.0
  SOURCE_NAME=Example
  SOURCE_URL=https://example.invalid/corpus
  SOURCE_CATEGORY=public-dataset
  SOURCE_LICENSE_DECLARATION=CC0-1.0
  INPUT_TYPE=record-map
  INPUT_TEXT_FIELDS=text
  FETCHER_OUTPUT=$output
  FETCHER_ARGUMENT_COUNT=1
  FETCHER_SIZE=1B
  FETCH_METHOD=download
  FETCH_URL=https://example.invalid/corpus/example.jsonl
  FETCH_PATH=example.jsonl
  fetcher_config_validate
  fetcher_begin "$FETCHER_OUTPUT"
  fetcher_size 1B 1B
  printf 'hello\n' >"$FETCHER_RAW/example.txt"
  write_manifest
)

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

if FETCHER_VALIDATE_ONLY=1 "$repository/corpora/python-enhancement-proposals.sh" >/dev/null 2>&1; then
  fail 'missing destination argument accepted'
fi
if FETCHER_VALIDATE_ONLY=1 "$repository/corpora/python-enhancement-proposals.sh" one two >/dev/null 2>&1; then
  fail 'extra destination argument accepted'
fi

echo 'functions: PASS'
