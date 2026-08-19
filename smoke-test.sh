#!/bin/sh

set -eux

repository=$(CDPATH='' cd -- "$(dirname -- "$0")" && pwd -P)
waldo_repository=$(CDPATH='' cd -- "$repository/../waldo" && pwd -P)
temporary_base=${TMPDIR:-/tmp}
work=$(mktemp -d "$temporary_base/waldo-fetcher-smoke.XXXXXX")
server_pid=
backend=${WALDO_SMOKE_BACKEND:-auto}

cleanup() {
  if [ -n "$server_pid" ]; then
    kill "$server_pid" 2>/dev/null || true
    wait "$server_pid" 2>/dev/null || true
  fi
  if [ "${WALDO_SMOKE_KEEP:-0}" = "1" ]; then
    echo "preserved smoke-test workspace: $work"
    return
  fi
  case "$work" in
    "$temporary_base"/waldo-fetcher-smoke.*) rm -rf -- "$work" ;;
    *) echo "refusing to remove unexpected workspace: $work" >&2 ;;
  esac
}
trap cleanup EXIT HUP INT TERM

command -v go
command -v gzip
command -v python3

mkdir -p "$work/upstream"
cat >"$work/upstream/records.jsonl" <<'EOF'
{"text":"A small language model learns to predict the next token from the tokens that came before it."}
{"text":"Clear questions and direct answers make technical conversations easier to understand and verify."}
{"text":"A corpus is a reviewed collection of source material used to teach or evaluate a model."}
{"text":"Reproducible ingestion records the source, license, checksums, document counts, and token counts."}
{"text":"Local smoke tests use disposable files so they never alter a maintainer's real index or object store."}
{"text":"The final training step writes model provenance and artifacts into a temporary model directory."}
EOF
gzip -c "$work/upstream/records.jsonl" >"$work/upstream/records.jsonl.gz"

cat >"$work/server.py" <<'PY'
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
python3 "$work/server.py" "$work/upstream" "$work/port" &
server_pid=$!

attempt=0
while [ ! -s "$work/port" ]; do
  attempt=$((attempt + 1))
  if [ "$attempt" -gt 100 ]; then
    echo "fixture server did not start" >&2
    exit 1
  fi
  sleep 0.05
done
port=$(cat "$work/port")

cat >"$work/smoke.ini" <<EOF
[corpus]
id = smoke-test
title = WALDO end-to-end smoke test
description = Disposable local records for fetch, ingest, and training verification.

[source]
name = Local smoke-test HTTP server
url = http://127.0.0.1:$port/
category = public-dataset
license = CC0-1.0
license-declaration = Disposable test fixture dedicated to the public domain.

[fetch]
fetcher = http
url = http://127.0.0.1:$port/records.jsonl.gz
estimated-size = 1MiB

[input]
type = record-map
text = text
EOF

GOCACHE="$work/go-cache" go build -o "$work/fetcher" "$repository/cmd/fetcher"
(
  cd "$waldo_repository"
  GOCACHE="$work/go-cache" go build -o "$work/waldo" ./cmd/waldo
)

"$work/fetcher" "$work/smoke.ini" "$work/handoff"

export WALDO_CONFIG="$work/waldo-config.json"
"$work/waldo" index init "$work/index"
"$work/waldo" config set index "$work/index"
"$work/waldo" config set lookaside "file://$work/lookaside"
"$work/waldo" config set lookaside.cache "$work/lookaside-cache"
"$work/waldo" config set lookaside.scratch "$work/lookaside-scratch"
"$work/waldo" config set ingest.staging "$work/staging"
"$work/waldo" config set model.root "$work/models"
"$work/waldo" config set model.backend "$backend"

"$work/waldo" index ingest "$work/handoff" smoke/e2e

contribution=
for candidate in "$work/staging"/*/contribution; do
  [ -d "$candidate" ] || continue
  [ -z "$contribution" ] || {
    echo "multiple contribution overlays found" >&2
    exit 1
  }
  contribution=$candidate
done
[ -n "$contribution" ]
cp -R "$contribution"/. "$work/index"/

"$work/waldo" index audit "$work/index/smoke/e2e"
lookaside_object=$(find "$work/lookaside" -type f -print -quit)
[ -n "$lookaside_object" ]

cat >"$work/model.yaml" <<'EOF'
kind: waldo-model-compose
schema: 1
architecture:
  family: decoder-transformer
  context_tokens: 16
  vocabulary_size: 259
  hidden_size: 32
  intermediate_size: 64
  layers: 1
  attention_heads: 4
  key_value_heads: 2
  tie_embeddings: true
  parameter_dtype: float32
  tokenizer:
    name: byte
    revision: builtin-byte-schema-1
stages:
  - name: pretrain
    type: pre-training
    objective: causal-language-modeling
    corpora:
      - smoke/e2e
    parameters:
      steps: 1
      batch_size: 1
      sequence_length: 16
      learning_rate: 0.001
      seed: 7
      checkpoint_every: 1
      evaluate_every: 1
EOF

"$work/waldo" model train smoke-test "$work/model.yaml"
"$work/waldo" model summary smoke-test
"$work/waldo" --json model summary smoke-test | tee "$work/model-summary.json"
grep -Eq '"state"[[:space:]]*:[[:space:]]*"complete"' "$work/model-summary.json"

if [ "$backend" = "fake" ]; then
  grep -Eq '"simulated"[[:space:]]*:[[:space:]]*true' "$work/model-summary.json"
else
  grep -Eq '"simulated"[[:space:]]*:[[:space:]]*false' "$work/model-summary.json"
  weights=$(find "$work/models/smoke-test" -type f -name model.safetensors -print -quit)
  [ -n "$weights" ]
  [ -s "$weights" ]
fi

echo "smoke test passed: fetched, ingested, published locally, and trained with backend $backend"
