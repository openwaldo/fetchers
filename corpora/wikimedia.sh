#!/bin/sh
set -eu

script_dir=$(CDPATH='' cd -- "$(dirname -- "$0")" && pwd -P)
. "$script_dir/../functions.sh"

fetcher_begin "$@"
fetcher_require jq find sort awk wc curl
fetcher_size 50G
fetcher_huggingface '' 'https://huggingface.co' 'common-pile/wikimedia_filtered' '0641bb84bd9b7162bcddf8be7836822161a9a342' 'json.gz'

# shellcheck disable=SC2119
fetcher_manifest <<'JSON'
{
  "corpus": {
    "id": "wikimedia",
    "title": "Wikimedia",
    "description": "Articles and other text from Wikimedia projects, via the filtered Common Pile v0.1 release."
  },
  "sources": [
    {
      "id": "wikimedia",
      "path": "",
      "license": "CC-BY-SA-4.0",
      "source": {
        "name": "common-pile/wikimedia_filtered",
        "url": "https://huggingface.co/datasets/common-pile/wikimedia_filtered",
        "category": "public-dataset",
        "license_evidence": {
          "declaration": "CC-BY-SA-4.0",
          "url": "https://huggingface.co/datasets/common-pile/wikimedia_filtered"
        }
      },
      "input": {
        "type": "record-map",
        "on_empty": "skip",
        "main_content": {
          "metadata.namespace": 0
        },
        "fields": {
          "text": [
            "text"
          ],
          "id": "id",
          "date": "created",
          "license": "metadata.license",
          "source": "source",
          "meta": {
            "namespace": "metadata.namespace",
            "title": "metadata.title",
            "url": "metadata.url",
            "wiki": "metadata.wiki"
          }
        }
      },
      "artifacts": [
        {
          "url": "https://huggingface.co/datasets/common-pile/wikimedia_filtered",
          "revision": "0641bb84bd9b7162bcddf8be7836822161a9a342",
          "selection": {
            "suffix": "json.gz"
          }
        }
      ]
    }
  ]
}
JSON
