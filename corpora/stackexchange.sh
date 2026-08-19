#!/bin/sh
set -eu

script_dir=$(CDPATH='' cd -- "$(dirname -- "$0")" && pwd -P)
. "$script_dir/../functions.sh"

fetcher_begin "$@"
fetcher_require jq find sort awk wc curl
fetcher_size 50G
fetcher_huggingface '' 'https://huggingface.co' 'common-pile/stackexchange_filtered' 'c0ac7373830c688a43fc12d1988c4b19ccd884ab' 'json.gz'

# shellcheck disable=SC2119
fetcher_manifest <<'JSON'
{
  "corpus": {
    "id": "stackexchange",
    "title": "Stack Exchange",
    "description": "Questions, answers, and community posts from Stack Exchange sites, via the filtered Common Pile v0.1 release.",
    "destination": "core/common-pile/stackexchange"
  },
  "sources": [
    {
      "id": "stackexchange",
      "path": "",
      "license": "CC-BY-SA-4.0",
      "source": {
        "name": "common-pile/stackexchange_filtered",
        "url": "https://huggingface.co/datasets/common-pile/stackexchange_filtered",
        "category": "public-dataset",
        "license_evidence": {
          "declaration": "CC-BY-SA-4.0",
          "url": "https://huggingface.co/datasets/common-pile/stackexchange_filtered"
        }
      },
      "input": {
        "type": "record-map",
        "nul": "space",
        "fields": {
          "text": [
            "text"
          ]
        }
      },
      "artifacts": [
        {
          "url": "https://huggingface.co/datasets/common-pile/stackexchange_filtered",
          "revision": "c0ac7373830c688a43fc12d1988c4b19ccd884ab",
          "selection": {
            "suffix": "json.gz"
          }
        }
      ]
    }
  ]
}
JSON
