#!/bin/sh
set -eu

script_dir=$(CDPATH='' cd -- "$(dirname -- "$0")" && pwd -P)
. "$script_dir/../functions.sh"

fetcher_begin "$@"
fetcher_require jq find sort awk wc curl
fetcher_size 50G
fetcher_download 'https://huggingface.co/datasets/common-pile/regulations_filtered/resolve/3327364490dfc7929009226ad667eceb2441d93a/regulations-0000.json.gz?download=true' 'regulations-0000.jsonl.gz' '8c1bc1676f0425afe534a66ce2519b631a8d1338af06570a6ef0abf9c240f893'
fetcher_download 'https://huggingface.co/datasets/common-pile/regulations_filtered/resolve/3327364490dfc7929009226ad667eceb2441d93a/regulations-0001.json.gz?download=true' 'regulations-0001.jsonl.gz' 'fae5a6b6c5a4cba188663b8a8843ab778d09e6650a3d39860a90a711e0c16837'

# shellcheck disable=SC2119
fetcher_manifest <<'JSON'
{
  "corpus": {
    "id": "regulations",
    "title": "US Federal Rulemaking",
    "description": "Documents from United States federal rulemaking proceedings, via the filtered Common Pile v0.1 release."
  },
  "sources": [
    {
      "id": "regulations",
      "path": "",
      "license": "LicenseRef-Public-Domain",
      "source": {
        "name": "common-pile/regulations_filtered",
        "url": "https://huggingface.co/datasets/common-pile/regulations_filtered",
        "category": "public-dataset",
        "license_evidence": {
          "declaration": "LicenseRef-Public-Domain",
          "url": "https://huggingface.co/datasets/common-pile/regulations_filtered"
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
          "url": "https://huggingface.co/datasets/common-pile/regulations_filtered/resolve/3327364490dfc7929009226ad667eceb2441d93a/regulations-0000.json.gz?download=true",
          "path": "regulations-0000.jsonl.gz",
          "sha256": "8c1bc1676f0425afe534a66ce2519b631a8d1338af06570a6ef0abf9c240f893"
        },
        {
          "url": "https://huggingface.co/datasets/common-pile/regulations_filtered/resolve/3327364490dfc7929009226ad667eceb2441d93a/regulations-0001.json.gz?download=true",
          "path": "regulations-0001.jsonl.gz",
          "sha256": "fae5a6b6c5a4cba188663b8a8843ab778d09e6650a3d39860a90a711e0c16837"
        }
      ]
    }
  ]
}
JSON
