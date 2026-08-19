#!/bin/sh
set -eu

script_dir=$(CDPATH='' cd -- "$(dirname -- "$0")" && pwd -P)
. "$script_dir/../functions.sh"

fetcher_begin "$@"
fetcher_require jq find sort awk wc curl
fetcher_size 100G
fetcher_huggingface '' 'https://huggingface.co' 'common-pile/doab_filtered' 'defb24ca72ef6aba6ce0228b669eec06dcfbffbc' 'json.gz'

# shellcheck disable=SC2119
fetcher_manifest <<'JSON'
{
  "corpus": {
    "id": "doab",
    "title": "Directory of Open Access Books",
    "description": "Open-access book text from the Directory of Open Access Books, via the filtered Common Pile v0.1 release."
  },
  "sources": [
    {
      "id": "doab",
      "path": "",
      "license": "CC-BY-4.0",
      "source": {
        "name": "common-pile/doab_filtered",
        "url": "https://huggingface.co/datasets/common-pile/doab_filtered",
        "category": "public-dataset",
        "license_evidence": {
          "declaration": "CC-BY-4.0",
          "url": "https://huggingface.co/datasets/common-pile/doab_filtered"
        }
      },
      "input": {
        "type": "record-map",
        "on_empty": "skip",
        "fields": {
          "text": [
            "text"
          ]
        }
      },
      "artifacts": [
        {
          "url": "https://huggingface.co/datasets/common-pile/doab_filtered",
          "revision": "defb24ca72ef6aba6ce0228b669eec06dcfbffbc",
          "selection": {
            "suffix": "json.gz"
          }
        }
      ]
    }
  ]
}
JSON
