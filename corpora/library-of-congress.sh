#!/bin/sh
set -eu

script_dir=$(CDPATH='' cd -- "$(dirname -- "$0")" && pwd -P)
. "$script_dir/../functions.sh"

fetcher_begin "$@"
fetcher_require jq find sort awk wc curl
fetcher_size 50G
fetcher_huggingface '' 'https://huggingface.co' 'common-pile/library_of_congress_filtered' '56725c7aa1bb320703e22eb5f42903173d5bac3d' 'json.gz'

# shellcheck disable=SC2119
fetcher_manifest <<'JSON'
{
  "corpus": {
    "id": "library-of-congress",
    "title": "Library of Congress Books",
    "description": "Public-domain Library of Congress book text from the filtered Common Pile release.",
    "destination": "government/library-of-congress"
  },
  "sources": [
    {
      "id": "library-of-congress",
      "path": "",
      "license": "LicenseRef-Public-Domain",
      "source": {
        "name": "common-pile/library_of_congress_filtered",
        "version": "56725c7aa1bb320703e22eb5f42903173d5bac3d",
        "url": "https://huggingface.co/datasets/common-pile/library_of_congress_filtered",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://huggingface.co/datasets/common-pile/library_of_congress_filtered/blob/56725c7aa1bb320703e22eb5f42903173d5bac3d/README.md",
          "declaration": "LicenseRef-Public-Domain"
        },
        "content": {
          "types": [
            "books",
            "cultural heritage",
            "library collections"
          ],
          "languages": [
            "en"
          ],
          "selection": "All 25 gzip JSONL artifacts at the pinned filtered Common Pile revision; all 129,052 records declare Public Domain and retain original Library of Congress item and text URLs in upstream metadata.",
          "copyrighted": "no",
          "machine_generated": "unknown"
        },
        "acquisition": {
          "basis": "Public dataset release at the pinned revision with uniform per-record public-domain declarations and Library of Congress provenance."
        }
      },
      "input": {
        "type": "record-map",
        "on_empty": "skip",
        "license_policy": {
          "include": [
            "LicenseRef-Public-Domain"
          ]
        },
        "fields": {
          "text": [
            "text"
          ],
          "id": "id",
          "date": "metadata.year",
          "license": "metadata.license"
        }
      },
      "artifacts": [
        {
          "url": "https://huggingface.co/datasets/common-pile/library_of_congress_filtered",
          "revision": "56725c7aa1bb320703e22eb5f42903173d5bac3d",
          "selection": {
            "suffix": "json.gz"
          }
        }
      ]
    }
  ]
}
JSON
