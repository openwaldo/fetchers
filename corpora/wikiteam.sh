#!/bin/sh
set -eu

script_dir=$(CDPATH='' cd -- "$(dirname -- "$0")" && pwd -P)
. "$script_dir/../functions.sh"

fetcher_begin "$@"
fetcher_require jq find sort awk wc curl
fetcher_size 50G
fetcher_huggingface '' 'https://huggingface.co' 'common-pile/wikiteam_filtered' 'f4ed055b57763a8f12238824140914b9eb098cab' 'json.gz'

# shellcheck disable=SC2119
fetcher_manifest <<'JSON'
{
  "corpus": {
    "id": "wikiteam",
    "title": "WikiTeam Archives",
    "description": "Text recovered from independently archived wikis, via the filtered Common Pile v0.1 release.",
    "destination": "core/common-pile/wikiteam"
  },
  "sources": [
    {
      "id": "wikiteam",
      "path": "",
      "license": "CC-BY-SA-3.0",
      "source": {
        "name": "common-pile/wikiteam_filtered",
        "url": "https://huggingface.co/datasets/common-pile/wikiteam_filtered",
        "category": "public-dataset",
        "license_evidence": {
          "declaration": "CC-BY-SA-3.0",
          "url": "https://huggingface.co/datasets/common-pile/wikiteam_filtered"
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
            "namespace": "metadata.namespace",
            "title": "metadata.title",
            "url": "metadata.url",
            "wiki": "metadata.wiki"
          }
        }
      },
      "artifacts": [
        {
          "url": "https://huggingface.co/datasets/common-pile/wikiteam_filtered",
          "revision": "f4ed055b57763a8f12238824140914b9eb098cab",
          "selection": {
            "suffix": "json.gz"
          }
        }
      ]
    }
  ]
}
JSON
