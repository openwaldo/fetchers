#!/bin/sh
set -eu

script_dir=$(CDPATH='' cd -- "$(dirname -- "$0")" && pwd -P)
. "$script_dir/../functions.sh"

fetcher_begin "$@"
fetcher_require jq find sort awk wc curl
fetcher_size 250M
fetcher_huggingface '' 'https://huggingface.co' 'CohereForAI/aya_dataset' 'f9ea04583f02a8f86404ff6c58bf75fe637df8a2' 'parquet' 'data/'

# shellcheck disable=SC2119
fetcher_manifest <<'JSON'
{
  "corpus": {
    "id": "aya",
    "title": "Aya Dataset",
    "description": "Multilingual human-written instruction and response pairs from the Aya project, preserved as structured messages.",
    "destination": "post-train/sft/aya"
  },
  "sources": [
    {
      "id": "aya",
      "path": "",
      "license": "Apache-2.0",
      "source": {
        "name": "CohereForAI/aya_dataset",
        "url": "https://huggingface.co/datasets/CohereForAI/aya_dataset",
        "category": "public-dataset",
        "license_evidence": {
          "declaration": "Apache-2.0",
          "url": "https://huggingface.co/datasets/CohereForAI/aya_dataset"
        }
      },
      "input": {
        "type": "dialogue-pair",
        "on_empty": "skip",
        "fields": {
          "text": [
            "inputs"
          ],
          "response": "targets",
          "language": "language_code"
        }
      },
      "artifacts": [
        {
          "url": "https://huggingface.co/datasets/CohereForAI/aya_dataset",
          "revision": "f9ea04583f02a8f86404ff6c58bf75fe637df8a2",
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
