#!/bin/sh
set -eu

script_dir=$(CDPATH='' cd -- "$(dirname -- "$0")" && pwd -P)
. "$script_dir/../functions.sh"

fetcher_begin "$@"
fetcher_require jq find sort awk wc curl
fetcher_size 10G
fetcher_huggingface '' 'https://huggingface.co' 'common-pile/news_filtered' '59aaa8f104e189e6fb8033f0ed319c5c343a03b1' 'json.gz'

# shellcheck disable=SC2119
fetcher_manifest <<'JSON'
{
  "corpus": {
    "id": "news",
    "title": "Common Pile News",
    "description": "Openly licensed news articles from seventeen publishers, via the filtered Common Pile release."
  },
  "sources": [
    {
      "id": "news",
      "path": "",
      "license": "LicenseRef-Mixed",
      "source": {
        "name": "common-pile/news_filtered",
        "version": "59aaa8f104e189e6fb8033f0ed319c5c343a03b1",
        "url": "https://huggingface.co/datasets/common-pile/news_filtered",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://huggingface.co/datasets/common-pile/news_filtered/blob/59aaa8f104e189e6fb8033f0ed319c5c343a03b1/README.md",
          "declaration": "LicenseRef-Mixed"
        },
        "content": {
          "types": [
            "articles",
            "news"
          ],
          "languages": [
            "en"
          ],
          "selection": "All gzip JSONL artifacts at the pinned filtered Common Pile revision from the seventeen enumerated publisher source labels and two enumerated per-record licenses.",
          "copyrighted": "yes",
          "machine_generated": "unknown"
        },
        "acquisition": {
          "basis": "Public dataset release at the pinned revision with per-record license and original article URL evidence."
        }
      },
      "input": {
        "type": "record-map",
        "on_empty": "skip",
        "license_policy": {
          "include": [
            "CC-BY-4.0",
            "CC-BY-SA-4.0"
          ]
        },
        "fields": {
          "text": [
            "text"
          ],
          "id": "id",
          "date": "created",
          "license": "metadata.license"
        }
      },
      "artifacts": [
        {
          "url": "https://huggingface.co/datasets/common-pile/news_filtered",
          "revision": "59aaa8f104e189e6fb8033f0ed319c5c343a03b1",
          "selection": {
            "suffix": "json.gz"
          }
        }
      ]
    }
  ]
}
JSON
