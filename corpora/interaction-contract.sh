#!/bin/sh
set -eu

script_dir=$(CDPATH='' cd -- "$(dirname -- "$0")" && pwd -P)
. "$script_dir/../functions.sh"

fetcher_begin "$@"
fetcher_require jq find sort awk wc git tar
fetcher_size 25M
fetcher_git 'source' 'https://github.com/openwaldo/post-training-data.git' '8d2454f2625a85d911cd7810816e489f0ebb1448' '8d2454f2625a85d911cd7810816e489f0ebb1448' '(glob)data/sft/interaction-contract-v1/train/*.jsonl'

# shellcheck disable=SC2119
fetcher_manifest <<'JSON'
{
  "corpus": {
    "id": "interaction-contract",
    "title": "OpenWALDO Interaction Contract v1",
    "description": "OpenWALDO-maintained interaction corpus with 45,000 structured-message training examples across 21 portable conversation and tool-behavior categories.",
    "destination": "post-train/sft/interaction-contract-v1"
  },
  "sources": [
    {
      "id": "interaction-contract",
      "path": "source",
      "license": "Apache-2.0",
      "source": {
        "name": "openwaldo/post-training-data",
        "version": "8d2454f2625a85d911cd7810816e489f0ebb1448",
        "url": "https://github.com/openwaldo/post-training-data",
        "category": "public-dataset",
        "license_evidence": {
          "declaration": "Apache License 2.0, declared in the repository LICENSE file.",
          "url": "https://github.com/openwaldo/post-training-data/blob/8d2454f2625a85d911cd7810816e489f0ebb1448/LICENSE"
        },
        "content": {
          "types": [
            "instruction and response pairs",
            "interaction behavior",
            "supervised fine-tuning"
          ],
          "languages": [
            "en"
          ],
          "selection": "The 18 interaction-contract-v1 training JSONL shards only; typed messages remain in the source rows while validation, evaluation, documentation, and repository administration files are excluded.",
          "personal_data": false,
          "copyrighted": true,
          "machine_generated": true
        },
        "acquisition": {
          "basis": "OpenWALDO project-authored, AI-assisted candidate training data requiring human review before production; generation details are retained in the source repository because recipe schema 1 does not accept the synthetic source category."
        }
      },
      "input": {
        "type": "dialogue-pair",
        "fields": {
          "text": [
            "prompt"
          ],
          "response": "response",
          "id": "id"
        }
      },
      "artifacts": [
        {
          "url": "https://github.com/openwaldo/post-training-data.git",
          "revision": "8d2454f2625a85d911cd7810816e489f0ebb1448",
          "ref": "8d2454f2625a85d911cd7810816e489f0ebb1448"
        }
      ]
    }
  ]
}
JSON
