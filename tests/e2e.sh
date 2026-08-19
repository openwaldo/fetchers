#!/bin/sh
# Copyright (c) 2026 OpenWALDO Project contributors
# Copyright (c) 2026 CtrlIQ, Inc.
# Copyright (c) 2026 Gregory M. Kurtzer
# SPDX-License-Identifier: Apache-2.0

set -eu

repository=$(CDPATH='' cd -- "$(dirname -- "$0")/.." && pwd -P)
waldo_repository=$(CDPATH='' cd -- "$repository/../waldo" && pwd -P)
temporary=$(mktemp -d "${TMPDIR:-/tmp}/waldo-fetcher-e2e.XXXXXX")
server_pid=

cleanup() {
  if [ -n "$server_pid" ]; then
    kill "$server_pid" 2>/dev/null || true
    wait "$server_pid" 2>/dev/null || true
  fi
  rm -rf -- "$temporary"
}
trap cleanup EXIT HUP INT TERM

mkdir -p "$temporary/upstream" "$temporary/index"
printf '%s\n' '{"text":"first mapped record"}' '{"text":"second mapped record"}' |
  gzip -c >"$temporary/upstream/records.jsonl.gz"
printf '%s\n' \
  'From sender@example.test Mon Jan  1 00:00:00 2024' \
  'From: Sender <sender@example.test>' \
  'Subject: Test message' \
  '' \
  'Raw mailing-list body.' |
  gzip -c >"$temporary/upstream/messages.mbox.gz"

cat >"$temporary/server.py" <<'PY'
import http.server
import pathlib
import socketserver
import sys

root, port_file = sys.argv[1:]
handler = lambda *args, **kwargs: http.server.SimpleHTTPRequestHandler(
    *args, directory=root, **kwargs
)
with socketserver.TCPServer(("127.0.0.1", 0), handler) as server:
    pathlib.Path(port_file).write_text(str(server.server_address[1]))
    server.serve_forever()
PY
python3 "$temporary/server.py" "$temporary/upstream" "$temporary/port" \
  </dev/null >"$temporary/server.log" 2>&1 &
server_pid=$!

attempt=0
while [ ! -s "$temporary/port" ]; do
  attempt=$((attempt + 1))
  if [ "$attempt" -gt 100 ]; then
    printf 'fixture server did not start\n' >&2
    exit 1
  fi
  sleep 0.05
done
port=$(cat "$temporary/port")

cat >"$temporary/corpus.ini" <<EOF
[corpus]
id = e2e
title = Fetcher end-to-end fixture
description = Local JSONL and mbox fixture.

[source "records"]
name = JSONL fixture
url = http://127.0.0.1:$port/records.jsonl.gz
category = public-dataset
license = CC0-1.0
license-declaration = Test fixture under CC0-1.0.

[source "mail"]
name = Mbox fixture
url = http://127.0.0.1:$port/messages.mbox.gz
category = public-dataset
license = CC0-1.0
license-declaration = Test fixture under CC0-1.0.

[fetch "records"]
source = records
fetcher = http
url = http://127.0.0.1:$port/records.jsonl.gz
estimated-size = 1B

[fetch "mail"]
source = mail
fetcher = http
url = http://127.0.0.1:$port/messages.mbox.gz
estimated-size = 1B

[input "records"]
format = jsonl
type = record-map
text = text

[input "mail"]
format = mbox
EOF

task_cache="$temporary/go-cache"
GOCACHE="$task_cache" go build -o "$temporary/fetcher" "$repository/cmd/fetcher"
(
  cd "$waldo_repository"
  GOCACHE="$task_cache" go build -o "$temporary/waldo" ./cmd/waldo
)
"$temporary/fetcher" "$temporary/corpus.ini" "$temporary/handoff" \
  2>"$temporary/fetch-progress.log"
grep -q '100.0%.*complete' "$temporary/fetch-progress.log"

cat >"$temporary/index/index.json" <<'EOF'
{"kind":"index","schema":1,"path":"","entries":[]}
EOF
cat >"$temporary/waldo-config.json" <<EOF
{
  "schema": 1,
  "index": "$temporary/index",
  "lookaside": {"publish": {"url": "file://$temporary/lookaside"}}
}
EOF

WALDO_CONFIG="$temporary/waldo-config.json" \
  "$temporary/waldo" --json index ingest "$temporary/handoff" test/e2e \
  >"$temporary/result.json" 2>"$temporary/progress.jsonl"

grep -q '"retained_docs": 3' "$temporary/result.json"
grep -q '"adapter": "mbox"' "$temporary/result.json"
grep -q '"adapter": "jsonl"' "$temporary/result.json"
grep -q '"phase":"ingest","status":"started".*"total_files":2' "$temporary/progress.jsonl"
grep -q '"phase":"ingest","status":"records".*"docs":3.*"tokens":' "$temporary/progress.jsonl"
grep -q '"phase":"ingest","status":"completed".*"files":2.*"docs":3.*"tokens":' "$temporary/progress.jsonl"
printf 'fetcher e2e: passed (nested manifests, gzip JSONL, gzip mbox, Parquet, lookaside)\n'
