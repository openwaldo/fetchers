#!/bin/sh

set -eux

repository=$(CDPATH='' cd -- "$(dirname -- "$0")" && pwd -P)
waldo_repository=$(CDPATH='' cd -- "$repository/../waldo" && pwd -P)
temporary_base=${TMPDIR:-/tmp}

if [ "$#" -gt 1 ]; then
  echo "usage: $0 [corpus.ini]" >&2
  exit 2
fi

config_input=${1:-$repository/corpora/python-enhancement-proposals.ini}
if [ ! -f "$config_input" ]; then
  echo "corpus configuration does not exist: $config_input" >&2
  exit 2
fi
config=$(CDPATH='' cd -- "$(dirname -- "$config_input")" && pwd -P)/$(basename -- "$config_input")
corpus_id=$(awk -F= '
  /^\[corpus\][[:space:]]*$/ { in_corpus=1; next }
  /^\[/ { in_corpus=0 }
  in_corpus && $1 ~ /^[[:space:]]*id[[:space:]]*$/ {
    value=$2
    gsub(/^[[:space:]]+|[[:space:]]+$/, "", value)
    print value
    exit
  }
' "$config")
if [ -z "$corpus_id" ]; then
  echo "corpus configuration has no [corpus] id: $config" >&2
  exit 2
fi

work=$(mktemp -d "$temporary_base/waldo-fetcher-smoke.XXXXXX")

cleanup() {
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

export GOCACHE="$work/go-cache"
export WALDO_CONFIG="$work/waldo-config.json"

(
  cd "$repository"
  go run ./cmd/fetcher "$config" "$work/handoff"
)

waldo() {
  (
    cd "$waldo_repository"
    go run ./cmd/waldo "$@"
  )
}

waldo index init "$work/index"
waldo config set index "$work/index"
waldo config set lookaside "file://$work/lookaside"
waldo config set lookaside.cache "$work/lookaside-cache"
waldo config set lookaside.scratch "$work/lookaside-scratch"
waldo config set ingest.staging "$work/staging"
waldo config set model.root "$work/models"
waldo config set model.backend auto

destination="smoke/$corpus_id"
waldo index ingest "$work/handoff" "$destination"

contribution=
for candidate in "$work/staging"/*/contribution; do
  [ -d "$candidate" ] || continue
  [ -z "$contribution" ] || {
    echo "multiple contribution overlays found" >&2
    exit 1
  }
  contribution=$candidate
done
if [ -z "$contribution" ]; then
  echo "ingest did not create a contribution overlay" >&2
  exit 1
fi
cp -R "$contribution"/. "$work/index"/

waldo index audit "$work/index/$destination"
lookaside_object=$(find "$work/lookaside" -type f -print -quit)
if [ -z "$lookaside_object" ]; then
  echo "ingest did not publish an object to the local lookaside" >&2
  exit 1
fi

cat >"$work/model.yaml" <<EOF
kind: waldo-model-compose
schema: 1
interaction:
  template: user-assistant-v1
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
  - name: smoke-train
    type: pre-training
    objective: causal-language-modeling
    conversation:
      template: user-assistant-v1
      supervised_roles: [assistant]
    corpora:
      - $destination
    parameters:
      steps: 1
      batch_size: 1
      sequence_length: 16
      learning_rate: 0.001
      seed: 7
      checkpoint_every: 1
      evaluate_every: 1
EOF

waldo model train "smoke-$corpus_id" "$work/model.yaml"
waldo model summary "smoke-$corpus_id"

weights=$(find "$work/models/smoke-$corpus_id" -type f -name model.safetensors -print -quit)
if [ -z "$weights" ] || [ ! -s "$weights" ]; then
  echo "real training did not produce model.safetensors" >&2
  exit 1
fi

echo "smoke test passed: fetched $corpus_id, ingested it locally, and trained real model weights"
