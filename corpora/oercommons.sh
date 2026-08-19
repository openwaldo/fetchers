#!/bin/sh
set -eu

script_dir=$(CDPATH='' cd -- "$(dirname -- "$0")" && pwd -P)
. "$script_dir/../functions.sh"

fetcher_begin "$@"
fetcher_require jq find sort awk wc curl
fetcher_size 10G
fetcher_huggingface '' 'https://huggingface.co' 'common-pile/oercommons_filtered' '506b6159dadcbc0dc67611cea024eedb04232fb2' 'json.gz'

# shellcheck disable=SC2119
fetcher_manifest <<'JSON'
{
  "corpus": {
    "id": "oercommons",
    "title": "OER Commons",
    "description": "Open educational resources from OER Commons, via the filtered Common Pile release.",
    "destination": "core/common-pile/oercommons"
  },
  "sources": [
    {
      "id": "oercommons",
      "path": "",
      "license": "LicenseRef-Mixed",
      "source": {
        "name": "common-pile/oercommons_filtered",
        "version": "506b6159dadcbc0dc67611cea024eedb04232fb2",
        "url": "https://huggingface.co/datasets/common-pile/oercommons_filtered",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://huggingface.co/datasets/common-pile/oercommons_filtered/blob/506b6159dadcbc0dc67611cea024eedb04232fb2/README.md",
          "declaration": "LicenseRef-Mixed"
        },
        "content": {
          "types": [
            "open educational resources"
          ],
          "languages": [
            "en"
          ],
          "selection": "All gzip JSONL artifacts at the pinned filtered Common Pile revision.",
          "copyrighted": "yes",
          "machine_generated": "unknown"
        },
        "acquisition": {
          "basis": "Public dataset release at the pinned revision."
        }
      },
      "input": {
        "type": "record-map",
        "on_empty": "skip",
        "license_policy": {
          "include": [
            "CC-BY-4.0",
            "CC-BY-SA-4.0",
            "LicenseRef-Public-Domain"
          ]
        },
        "fields": {
          "text": [
            "text"
          ],
          "id": "id",
          "license": "metadata.license"
        }
      },
      "artifacts": [
        {
          "url": "https://huggingface.co/datasets/common-pile/oercommons_filtered",
          "revision": "506b6159dadcbc0dc67611cea024eedb04232fb2",
          "selection": {
            "suffix": "json.gz"
          }
        }
      ]
    }
  ]
}
JSON
