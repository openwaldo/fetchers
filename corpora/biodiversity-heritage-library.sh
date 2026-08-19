#!/bin/sh
set -eu

script_dir=$(CDPATH='' cd -- "$(dirname -- "$0")" && pwd -P)
. "$script_dir/../functions.sh"

fetcher_begin "$@"
fetcher_require jq find sort awk wc curl
fetcher_size 50G
fetcher_huggingface '' 'https://huggingface.co' 'common-pile/biodiversity_heritage_library_filtered' '0486ed637d0d7aaff264bc77fe21a7444e0215cd' 'json.gz'

# shellcheck disable=SC2119
fetcher_manifest <<'JSON'
{
  "corpus": {
    "id": "biodiversity-heritage-library",
    "title": "Biodiversity Heritage Library",
    "description": "Public-domain biodiversity books, journals, and archival documents from the filtered Common Pile release.",
    "destination": "core/common-pile/biodiversity-heritage-library"
  },
  "sources": [
    {
      "id": "biodiversity-heritage-library",
      "path": "",
      "license": "LicenseRef-Public-Domain",
      "source": {
        "name": "common-pile/biodiversity_heritage_library_filtered",
        "version": "0486ed637d0d7aaff264bc77fe21a7444e0215cd",
        "url": "https://huggingface.co/datasets/common-pile/biodiversity_heritage_library_filtered",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://huggingface.co/datasets/common-pile/biodiversity_heritage_library_filtered/blob/0486ed637d0d7aaff264bc77fe21a7444e0215cd/README.md",
          "declaration": "LicenseRef-Public-Domain"
        },
        "content": {
          "types": [
            "books",
            "cultural heritage",
            "scientific literature"
          ],
          "languages": [
            "en"
          ],
          "selection": "All 47 gzip JSONL artifacts at the pinned filtered Common Pile revision; the release declares 15,111,313 public-domain documents and retains original Biodiversity Heritage Library page URLs in record metadata.",
          "copyrighted": "no",
          "machine_generated": "unknown"
        },
        "acquisition": {
          "basis": "Public dataset release created from the official Biodiversity Heritage Library bulk interface and filtered using the associated per-record license metadata."
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
          "text_fallback": [
            "metadata.url"
          ],
          "id": "id",
          "date": "added",
          "license": "metadata.license",
          "meta": {
            "item_id": "item_id",
            "page_id": "page_id",
            "page_num": "page_num",
            "provenance": "metadata.provenance",
            "source": "source",
            "url": "metadata.url"
          }
        }
      },
      "artifacts": [
        {
          "url": "https://huggingface.co/datasets/common-pile/biodiversity_heritage_library_filtered",
          "revision": "0486ed637d0d7aaff264bc77fe21a7444e0215cd",
          "selection": {
            "suffix": "json.gz"
          }
        }
      ]
    }
  ]
}
JSON
