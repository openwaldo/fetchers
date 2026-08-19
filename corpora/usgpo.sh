#!/bin/sh
set -eu

script_dir=$(CDPATH='' cd -- "$(dirname -- "$0")" && pwd -P)
. "$script_dir/../functions.sh"

fetcher_begin "$@"
fetcher_require jq find sort awk wc curl
fetcher_size 50G
fetcher_huggingface '' 'https://huggingface.co' 'common-pile/usgpo_filtered' 'b150cc22211de4d57f1b7f570097a00e65042424' 'json.gz'

# shellcheck disable=SC2119
fetcher_manifest <<'JSON'
{
  "corpus": {
    "id": "usgpo",
    "title": "US Government Publishing Office",
    "description": "Publications of the United States Government Publishing Office, via the filtered Common Pile v0.1 release.",
    "destination": "government/usgpo"
  },
  "sources": [
    {
      "id": "usgpo",
      "path": "",
      "license": "LicenseRef-Public-Domain",
      "source": {
        "name": "common-pile/usgpo_filtered",
        "url": "https://huggingface.co/datasets/common-pile/usgpo_filtered",
        "category": "public-dataset",
        "license_evidence": {
          "declaration": "LicenseRef-Public-Domain",
          "url": "https://huggingface.co/datasets/common-pile/usgpo_filtered"
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
          "url": "https://huggingface.co/datasets/common-pile/usgpo_filtered",
          "revision": "b150cc22211de4d57f1b7f570097a00e65042424",
          "selection": {
            "suffix": "json.gz"
          }
        }
      ]
    }
  ]
}
JSON
