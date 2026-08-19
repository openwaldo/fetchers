#!/bin/sh
set -eu

script_dir=$(CDPATH='' cd -- "$(dirname -- "$0")" && pwd -P)
. "$script_dir/../functions.sh"

fetcher_begin "$@"
fetcher_require jq find sort awk wc curl
fetcher_size 5M
fetcher_download 'https://huggingface.co/datasets/common-pile/python_enhancement_proposals_filtered/resolve/cfd1b2c53646bcf2148f77315db704214dcb7743/peps-dolma-0000.json.gz?download=true' 'peps.jsonl.gz' '4bb61eded5168ac7f0059a92ed242577c67e4fced8c0d019c84bfaca5596c791'

# shellcheck disable=SC2119
fetcher_manifest <<'JSON'
{
  "corpus": {
    "id": "python-enhancement-proposals",
    "title": "Python Enhancement Proposals",
    "description": "Technical specifications and rationale for Python language features, via the filtered Common Pile v0.1 release."
  },
  "sources": [
    {
      "id": "python-enhancement-proposals",
      "path": "",
      "license": "LicenseRef-Public-Domain",
      "source": {
        "name": "common-pile/python_enhancement_proposals_filtered",
        "url": "https://huggingface.co/datasets/common-pile/python_enhancement_proposals_filtered",
        "category": "public-dataset",
        "license_evidence": {
          "declaration": "LicenseRef-Public-Domain",
          "url": "https://huggingface.co/datasets/common-pile/python_enhancement_proposals_filtered"
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
          "license": "metadata.license",
          "source": "source",
          "meta": {
            "pep_number": "metadata.pep_number",
            "url": "metadata.url"
          }
        }
      },
      "artifacts": [
        {
          "url": "https://huggingface.co/datasets/common-pile/python_enhancement_proposals_filtered/resolve/cfd1b2c53646bcf2148f77315db704214dcb7743/peps-dolma-0000.json.gz?download=true",
          "path": "peps.jsonl.gz",
          "sha256": "4bb61eded5168ac7f0059a92ed242577c67e4fced8c0d019c84bfaca5596c791"
        }
      ]
    }
  ]
}
JSON
