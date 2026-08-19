#!/bin/sh
set -eu

script_dir=$(CDPATH='' cd -- "$(dirname -- "$0")" && pwd -P)
. "$script_dir/../functions.sh"

fetcher_begin "$@"
fetcher_require jq find sort awk wc curl
fetcher_size 10G
fetcher_huggingface '' 'https://huggingface.co' 'common-pile/pressbooks_filtered' '1a1d3b50d77f834370f8eb4c0d174668dd1676bb' 'json.gz'

# shellcheck disable=SC2119
fetcher_manifest <<'JSON'
{
  "corpus": {
    "id": "pressbooks",
    "title": "PressBooks",
    "description": "Open-access book sections from PressBooks, via the filtered Common Pile release.",
    "destination": "core/common-pile/pressbooks"
  },
  "sources": [
    {
      "id": "pressbooks",
      "path": "",
      "license": "LicenseRef-Mixed",
      "source": {
        "name": "common-pile/pressbooks_filtered",
        "version": "1a1d3b50d77f834370f8eb4c0d174668dd1676bb",
        "url": "https://huggingface.co/datasets/common-pile/pressbooks_filtered",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://huggingface.co/datasets/common-pile/pressbooks_filtered/blob/1a1d3b50d77f834370f8eb4c0d174668dd1676bb/README.md",
          "declaration": "LicenseRef-Mixed"
        },
        "content": {
          "types": [
            "books",
            "open educational resources"
          ],
          "languages": [
            "en"
          ],
          "selection": "All gzip JSONL artifacts at the pinned filtered Common Pile revision whose per-record license normalizes to one of the four enumerated accepted values.",
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
            "CC0-1.0",
            "LicenseRef-Public-Domain"
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
          "url": "https://huggingface.co/datasets/common-pile/pressbooks_filtered",
          "revision": "1a1d3b50d77f834370f8eb4c0d174668dd1676bb",
          "selection": {
            "suffix": "json.gz"
          }
        }
      ]
    }
  ]
}
JSON
