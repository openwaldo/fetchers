#!/bin/sh
set -eu

script_dir=$(CDPATH='' cd -- "$(dirname -- "$0")" && pwd -P)
. "$script_dir/../functions.sh"

fetcher_begin "$@"
fetcher_require jq find sort awk wc curl
fetcher_size 10G
fetcher_download 'https://huggingface.co/datasets/common-pile/foodista_filtered/resolve/28ac18deab7ed2ec3580f4f13f0ed141e47957ef/foodista-dolma-0000.json.gz?download=true' 'foodista.jsonl.gz' 'c39b3e7efc54ec03a38fbf2aa0e471d9bcb898879b2df1ff1e6646fdbcc4476f'

# shellcheck disable=SC2119
fetcher_manifest <<'JSON'
{
  "corpus": {
    "id": "foodista",
    "title": "Foodista",
    "description": "Community-contributed cooking and food articles from Foodista, via the filtered Common Pile v0.1 release.",
    "destination": "core/common-pile/foodista"
  },
  "sources": [
    {
      "id": "foodista",
      "path": "",
      "license": "CC-BY-3.0",
      "source": {
        "name": "common-pile/foodista_filtered",
        "url": "https://huggingface.co/datasets/common-pile/foodista_filtered",
        "category": "public-dataset",
        "license_evidence": {
          "declaration": "CC-BY-3.0",
          "url": "https://huggingface.co/datasets/common-pile/foodista_filtered"
        }
      },
      "input": {
        "type": "record-map",
        "on_empty": "skip",
        "fields": {
          "text": [
            "text"
          ],
          "id": "id",
          "date": "created",
          "license": "metadata.license",
          "source": "source",
          "meta": {
            "url": "metadata.url"
          }
        }
      },
      "artifacts": [
        {
          "url": "https://huggingface.co/datasets/common-pile/foodista_filtered/resolve/28ac18deab7ed2ec3580f4f13f0ed141e47957ef/foodista-dolma-0000.json.gz?download=true",
          "path": "foodista.jsonl.gz",
          "sha256": "c39b3e7efc54ec03a38fbf2aa0e471d9bcb898879b2df1ff1e6646fdbcc4476f"
        }
      ]
    }
  ]
}
JSON
