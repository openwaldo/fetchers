#!/bin/sh
set -eu

script_dir=$(CDPATH='' cd -- "$(dirname -- "$0")" && pwd -P)
. "$script_dir/../functions.sh"

fetcher_begin "$@"
fetcher_require jq find sort awk wc curl
fetcher_size 250G
fetcher_huggingface '' 'https://huggingface.co' 'common-pile/uspto_filtered' '13894c5462467c843163693269d9266ec2c772b4' 'json.gz' 'USPTO-'

# shellcheck disable=SC2119
fetcher_manifest <<'JSON'
{
  "corpus": {
    "id": "uspto",
    "title": "United States Patents and Patent Applications",
    "description": "United States patent grants and published patent applications from the filtered Common Pile release."
  },
  "sources": [
    {
      "id": "uspto",
      "path": "",
      "license": "CC-BY-4.0",
      "source": {
        "name": "common-pile/uspto_filtered",
        "version": "13894c5462467c843163693269d9266ec2c772b4",
        "url": "https://huggingface.co/datasets/common-pile/uspto_filtered",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://huggingface.co/datasets/common-pile/uspto_filtered/blob/13894c5462467c843163693269d9266ec2c772b4/README.md",
          "declaration": "CC-BY-4.0"
        },
        "content": {
          "types": [
            "patent applications",
            "patents",
            "technical literature"
          ],
          "languages": [
            "en"
          ],
          "selection": "All 256 gzip JSONL artifacts at the pinned filtered Common Pile revision; every qualified record retains its USPTO identifier, Google Patents source, source-file provenance, publication date, language, and raw CC BY 4.0 declaration.",
          "copyrighted": "no",
          "machine_generated": "no"
        },
        "acquisition": {
          "basis": "Public filtered release of United States patent grants and applications with per-record CC BY 4.0 declarations and source provenance."
        }
      },
      "input": {
        "type": "record-map",
        "on_empty": "skip",
        "nul": "space",
        "license_policy": {
          "include": [
            "CC-BY-4.0"
          ]
        },
        "fields": {
          "text": [
            "text"
          ],
          "id": "id",
          "date": "created",
          "license": "metadata.license",
          "meta": {
            "added": "added",
            "language": "metadata.language",
            "provenance": "metadata.provenance",
            "publication_date": "metadata.publication_date",
            "raw_license": "metadata.license",
            "source": "source"
          }
        }
      },
      "artifacts": [
        {
          "url": "https://huggingface.co/datasets/common-pile/uspto_filtered",
          "revision": "13894c5462467c843163693269d9266ec2c772b4",
          "selection": {
            "suffix": "json.gz",
            "prefix": "USPTO-"
          }
        }
      ]
    }
  ]
}
JSON
