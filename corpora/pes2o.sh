#!/bin/sh
set -eu

script_dir=$(CDPATH='' cd -- "$(dirname -- "$0")" && pwd -P)
. "$script_dir/../functions.sh"

fetcher_begin "$@"
fetcher_require jq find sort awk wc curl
fetcher_size 50G
fetcher_huggingface '' 'https://huggingface.co' 'common-pile/peS2o_filtered' '297747513bfb0ff1fbf61ddad3b03319d0f04597' 'json.gz'

# shellcheck disable=SC2119
fetcher_manifest <<'JSON'
{
  "corpus": {
    "id": "pes2o",
    "title": "Open-Access Papers",
    "description": "Full text of open-access scientific papers from peS2o, via the filtered Common Pile v0.1 release."
  },
  "sources": [
    {
      "id": "pes2o",
      "path": "",
      "license": "CC-BY-4.0",
      "source": {
        "name": "common-pile/peS2o_filtered",
        "url": "https://huggingface.co/datasets/common-pile/peS2o_filtered",
        "category": "public-dataset",
        "license_evidence": {
          "declaration": "CC-BY-4.0",
          "url": "https://huggingface.co/datasets/common-pile/peS2o_filtered"
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
          "source": "source",
          "meta": {
            "oa_license": "metadata.oa_license",
            "oa_status": "metadata.oa_status",
            "oa_url": "metadata.oa_url"
          }
        }
      },
      "artifacts": [
        {
          "url": "https://huggingface.co/datasets/common-pile/peS2o_filtered",
          "revision": "297747513bfb0ff1fbf61ddad3b03319d0f04597",
          "selection": {
            "suffix": "json.gz"
          }
        }
      ]
    }
  ]
}
JSON
