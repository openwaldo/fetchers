#!/bin/sh
set -eu

script_dir=$(CDPATH='' cd -- "$(dirname -- "$0")" && pwd -P)
. "$script_dir/../functions.sh"

fetcher_begin "$@"
fetcher_require jq find sort awk wc curl
fetcher_size 25M
fetcher_huggingface '' 'https://huggingface.co' 'databricks/databricks-dolly-15k' 'bdd27f4d94b9c1f951818a7da7fd7aeea5dbff1a' 'jsonl'

# shellcheck disable=SC2119
fetcher_manifest <<'JSON'
{
  "corpus": {
    "id": "dolly",
    "title": "Databricks Dolly",
    "description": "Human-written instruction and response pairs from Databricks employees, preserved as structured messages.",
    "destination": "post-train/sft/dolly"
  },
  "sources": [
    {
      "id": "dolly",
      "path": "",
      "license": "CC-BY-SA-3.0",
      "source": {
        "name": "databricks/databricks-dolly-15k",
        "url": "https://huggingface.co/datasets/databricks/databricks-dolly-15k",
        "category": "public-dataset",
        "license_evidence": {
          "declaration": "CC-BY-SA-3.0",
          "url": "https://huggingface.co/datasets/databricks/databricks-dolly-15k"
        }
      },
      "input": {
        "type": "dialogue-pair",
        "fields": {
          "text": [
            "instruction"
          ],
          "context": "context",
          "response": "response"
        }
      },
      "artifacts": [
        {
          "url": "https://huggingface.co/datasets/databricks/databricks-dolly-15k",
          "revision": "bdd27f4d94b9c1f951818a7da7fd7aeea5dbff1a",
          "selection": {
            "suffix": "jsonl"
          }
        }
      ]
    }
  ]
}
JSON
