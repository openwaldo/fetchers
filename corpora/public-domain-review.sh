#!/bin/sh
set -eu

script_dir=$(CDPATH='' cd -- "$(dirname -- "$0")" && pwd -P)
. "$script_dir/../functions.sh"

fetcher_begin "$@"
fetcher_require jq find sort awk wc curl
fetcher_size 10G
fetcher_download 'https://huggingface.co/datasets/common-pile/public_domain_review_filtered/resolve/ec81450d060d25c2bb01b9fb2d24399aeb37a3cc/public-domain-review-0000.json.gz?download=true' 'public-domain-review.jsonl.gz' 'ea89ec2fbfacfe2e5d014a6ad500597c42f11ad01fe705eb0b6fdc38298b4d3a'

# shellcheck disable=SC2119
fetcher_manifest <<'JSON'
{
  "corpus": {
    "id": "public-domain-review",
    "title": "The Public Domain Review",
    "description": "Essays on public-domain art, literature, and history from The Public Domain Review, via the filtered Common Pile v0.1 release.",
    "destination": "core/common-pile/public-domain-review"
  },
  "sources": [
    {
      "id": "public-domain-review",
      "path": "",
      "license": "CC-BY-SA-4.0",
      "source": {
        "name": "common-pile/public_domain_review_filtered",
        "url": "https://huggingface.co/datasets/common-pile/public_domain_review_filtered",
        "category": "public-dataset",
        "license_evidence": {
          "declaration": "CC-BY-SA-4.0",
          "url": "https://huggingface.co/datasets/common-pile/public_domain_review_filtered"
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
            "url": "metadata.url"
          }
        }
      },
      "artifacts": [
        {
          "url": "https://huggingface.co/datasets/common-pile/public_domain_review_filtered/resolve/ec81450d060d25c2bb01b9fb2d24399aeb37a3cc/public-domain-review-0000.json.gz?download=true",
          "path": "public-domain-review.jsonl.gz",
          "sha256": "ea89ec2fbfacfe2e5d014a6ad500597c42f11ad01fe705eb0b6fdc38298b4d3a"
        }
      ]
    }
  ]
}
JSON
