#!/bin/sh
set -eu

script_dir=$(CDPATH='' cd -- "$(dirname -- "$0")" && pwd -P)
. "$script_dir/../functions.sh"

fetcher_begin "$@"
fetcher_require jq find sort awk wc curl
fetcher_size 50G
fetcher_huggingface '' 'https://huggingface.co' 'common-pile/arxiv_abstracts_filtered' 'dc1ceab4755eb037ec61e49cf1350dab7ceee6e7' 'json.gz'

# shellcheck disable=SC2119
fetcher_manifest <<'JSON'
{
  "corpus": {
    "id": "arxiv-abstracts",
    "title": "ArXiv Abstracts",
    "description": "Paper titles and abstracts from ArXiv metadata, via the filtered Common Pile release.",
    "destination": "science/arxiv-abstracts"
  },
  "sources": [
    {
      "id": "arxiv-abstracts",
      "path": "",
      "license": "CC0-1.0",
      "source": {
        "name": "common-pile/arxiv_abstracts_filtered",
        "version": "dc1ceab4755eb037ec61e49cf1350dab7ceee6e7",
        "url": "https://huggingface.co/datasets/common-pile/arxiv_abstracts_filtered",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://huggingface.co/datasets/common-pile/arxiv_abstracts_filtered/blob/dc1ceab4755eb037ec61e49cf1350dab7ceee6e7/README.md",
          "declaration": "CC0-1.0"
        },
        "content": {
          "types": [
            "academic abstracts",
            "scientific metadata"
          ],
          "languages": [
            "multilingual"
          ],
          "selection": "Both gzip JSONL artifacts at the pinned filtered Common Pile revision; all 2,504,679 records declare CC0 for the abstract record. The source full_text_license field describes the separate full paper and is retained only as metadata. Exactly 263,151 identifiers overlap the full-paper corpus, while 2,241,527 identifiers occur only here. One identifier has two distinct source versions, and both are retained.",
          "copyrighted": "no",
          "machine_generated": "no"
        },
        "acquisition": {
          "basis": "Public filtered dataset at the pinned revision with a uniform per-record CC0 declaration, original ArXiv URL, and source provenance."
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
          "meta": {
            "authors": "metadata.authors",
            "full_text_license": "metadata.full_text_license",
            "provenance": "metadata.provenance",
            "raw_license": "metadata.license",
            "source": "source",
            "submitter": "metadata.submitter",
            "url": "metadata.url"
          }
        }
      },
      "artifacts": [
        {
          "url": "https://huggingface.co/datasets/common-pile/arxiv_abstracts_filtered",
          "revision": "dc1ceab4755eb037ec61e49cf1350dab7ceee6e7",
          "selection": {
            "suffix": "json.gz"
          }
        }
      ]
    }
  ]
}
JSON
