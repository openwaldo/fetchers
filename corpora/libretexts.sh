#!/bin/sh
set -eu

script_dir=$(CDPATH='' cd -- "$(dirname -- "$0")" && pwd -P)
. "$script_dir/../functions.sh"

fetcher_begin "$@"
fetcher_require jq find sort awk wc curl
fetcher_size 10G
fetcher_huggingface '' 'https://huggingface.co' 'common-pile/libretexts_filtered' '70388bca52b4a93515e14b1d56618fd7944988fd' 'json.gz'

# shellcheck disable=SC2119
fetcher_manifest <<'JSON'
{
  "corpus": {
    "id": "libretexts",
    "title": "LibreTexts",
    "description": "Open textbook sections from LibreTexts, via the filtered Common Pile release.",
    "destination": "core/common-pile/libretexts"
  },
  "sources": [
    {
      "id": "libretexts",
      "path": "",
      "license": "LicenseRef-Mixed",
      "source": {
        "name": "common-pile/libretexts_filtered",
        "version": "70388bca52b4a93515e14b1d56618fd7944988fd",
        "url": "https://huggingface.co/datasets/common-pile/libretexts_filtered",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://huggingface.co/datasets/common-pile/libretexts_filtered/blob/70388bca52b4a93515e14b1d56618fd7944988fd/README.md",
          "declaration": "LicenseRef-Mixed"
        },
        "content": {
          "types": [
            "open educational resources",
            "textbooks"
          ],
          "languages": [
            "en"
          ],
          "selection": "All gzip JSONL artifacts at the pinned filtered Common Pile revision whose per-record license normalizes to one of the seven enumerated accepted values.",
          "copyrighted": "yes",
          "machine_generated": "unknown"
        },
        "acquisition": {
          "basis": "Public dataset release at the pinned revision with per-record license evidence."
        }
      },
      "input": {
        "type": "record-map",
        "on_empty": "skip",
        "license_policy": {
          "include": [
            "CC-BY-4.0",
            "CC-BY-SA-4.0",
            "LicenseRef-Public-Domain",
            "CC-BY-3.0",
            "GNU Free Documentation License",
            "CC-BY-SA-3.0",
            "CC-BY-SA-2.5"
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
          "url": "https://huggingface.co/datasets/common-pile/libretexts_filtered",
          "revision": "70388bca52b4a93515e14b1d56618fd7944988fd",
          "selection": {
            "suffix": "json.gz"
          }
        }
      ]
    }
  ]
}
JSON
