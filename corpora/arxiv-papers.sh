#!/bin/sh
set -eu

script_dir=$(CDPATH='' cd -- "$(dirname -- "$0")" && pwd -P)
. "$script_dir/../functions.sh"

fetcher_begin "$@"
fetcher_require jq find sort awk wc curl
fetcher_size 500G
fetcher_huggingface '' 'https://huggingface.co' 'common-pile/arxiv_papers_filtered' '033cf7f53f9b348deec868c1a5a48484f3ee9e52' 'json.gz'

# shellcheck disable=SC2119
fetcher_manifest <<'JSON'
{
  "corpus": {
    "id": "arxiv-papers",
    "title": "ArXiv Papers",
    "description": "Full openly licensed ArXiv paper text from the filtered Common Pile release."
  },
  "sources": [
    {
      "id": "arxiv-papers",
      "path": "",
      "license": "LicenseRef-Mixed",
      "source": {
        "name": "common-pile/arxiv_papers_filtered",
        "version": "033cf7f53f9b348deec868c1a5a48484f3ee9e52",
        "url": "https://huggingface.co/datasets/common-pile/arxiv_papers_filtered",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://huggingface.co/datasets/common-pile/arxiv_papers_filtered/blob/033cf7f53f9b348deec868c1a5a48484f3ee9e52/README.md",
          "declaration": "LicenseRef-Mixed"
        },
        "content": {
          "types": [
            "academic papers",
            "scientific literature"
          ],
          "languages": [
            "en"
          ],
          "selection": "All eight gzip JSONL artifacts at the pinned filtered Common Pile revision; all 295,424 records carry one of five enumerated open or public-domain license values.",
          "copyrighted": "yes",
          "machine_generated": "unknown"
        },
        "acquisition": {
          "basis": "Public dataset release at the pinned revision with per-record license and original ArXiv URL evidence."
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
            "CC-BY-3.0",
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
          "url": "https://huggingface.co/datasets/common-pile/arxiv_papers_filtered",
          "revision": "033cf7f53f9b348deec868c1a5a48484f3ee9e52",
          "selection": {
            "suffix": "json.gz"
          }
        }
      ]
    }
  ]
}
JSON
