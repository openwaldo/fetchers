#!/bin/sh
set -eu

script_dir=$(CDPATH='' cd -- "$(dirname -- "$0")" && pwd -P)
. "$script_dir/../functions.sh"

fetcher_begin "$@"
fetcher_require jq find sort awk wc curl
fetcher_size 10G
fetcher_huggingface '' 'https://huggingface.co' 'allenai/tulu-3-sft-mixture' 'b14afda60f1bbebe55d5d2fa1e4df5042f97f8be' 'parquet' 'data/'

# shellcheck disable=SC2119
fetcher_manifest <<'JSON'
{
  "corpus": {
    "id": "tulu3",
    "title": "Tulu 3 SFT Mixture",
    "description": "The pinned Tulu 3 supervised fine-tuning mixture preserved as structured messages with per-record source labels retained for downstream filtering."
  },
  "sources": [
    {
      "id": "tulu3",
      "path": "",
      "license": "ODC-BY-1.0",
      "source": {
        "name": "allenai/tulu-3-sft-mixture",
        "version": "b14afda60f1bbebe55d5d2fa1e4df5042f97f8be",
        "url": "https://huggingface.co/datasets/allenai/tulu-3-sft-mixture",
        "category": "public-dataset",
        "license_evidence": {
          "declaration": "ODC-BY-1.0 collection; constituent datasets retain their own terms.",
          "url": "https://huggingface.co/datasets/allenai/tulu-3-sft-mixture/tree/b14afda60f1bbebe55d5d2fa1e4df5042f97f8be"
        },
        "content": {
          "types": [
            "instructions",
            "model responses",
            "multi-turn conversations"
          ],
          "selection": "All six pinned training Parquet shards. The upstream source label is retained so a compose can exclude duplicate or noncommercial subsets.",
          "personal_data": "unknown",
          "copyrighted": true,
          "machine_generated": true
        },
        "acquisition": {
          "basis": "Public mixture assembled by Ai2 from multiple third-party instruction datasets; constituent terms require separate review."
        }
      },
      "input": {
        "type": "chat-messages",
        "on_empty": "skip",
        "fields": {
          "id": "id",
          "source": "source"
        },
        "messages": {
          "role": "messages[].role",
          "content": "messages[].content"
        }
      },
      "artifacts": [
        {
          "url": "https://huggingface.co/datasets/allenai/tulu-3-sft-mixture",
          "revision": "b14afda60f1bbebe55d5d2fa1e4df5042f97f8be",
          "selection": {
            "suffix": "parquet",
            "prefix": "data/"
          }
        }
      ]
    }
  ]
}
JSON
