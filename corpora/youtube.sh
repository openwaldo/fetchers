#!/bin/sh
set -eu

script_dir=$(CDPATH='' cd -- "$(dirname -- "$0")" && pwd -P)
. "$script_dir/../functions.sh"

fetcher_begin "$@"
fetcher_require jq find sort awk wc curl
fetcher_size 50G
fetcher_huggingface '' 'https://huggingface.co' 'common-pile/youtube_filtered' 'dff8c8a54e98bce64c2e7ce9a8466c144c1cddd6' 'json.gz'

# shellcheck disable=SC2119
fetcher_manifest <<'JSON'
{
  "corpus": {
    "id": "youtube",
    "title": "YouTube Transcripts",
    "description": "Transcripts from Creative Commons-licensed YouTube videos, via the filtered Common Pile v0.1 release.",
    "destination": "core/common-pile/youtube"
  },
  "sources": [
    {
      "id": "youtube",
      "path": "",
      "license": "CC-BY-3.0",
      "source": {
        "name": "common-pile/youtube_filtered",
        "url": "https://huggingface.co/datasets/common-pile/youtube_filtered",
        "category": "public-dataset",
        "license_evidence": {
          "declaration": "CC-BY-3.0",
          "url": "https://huggingface.co/datasets/common-pile/youtube_filtered"
        }
      },
      "input": {
        "type": "record-map",
        "on_empty": "skip",
        "nul": "space",
        "fields": {
          "text": [
            "text"
          ]
        }
      },
      "artifacts": [
        {
          "url": "https://huggingface.co/datasets/common-pile/youtube_filtered",
          "revision": "dff8c8a54e98bce64c2e7ce9a8466c144c1cddd6",
          "selection": {
            "suffix": "json.gz"
          }
        }
      ]
    }
  ]
}
JSON
