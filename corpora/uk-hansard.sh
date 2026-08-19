#!/bin/sh
set -eu

script_dir=$(CDPATH='' cd -- "$(dirname -- "$0")" && pwd -P)
. "$script_dir/../functions.sh"

fetcher_begin "$@"
fetcher_require jq find sort awk wc curl
fetcher_size 50G
fetcher_download 'https://huggingface.co/datasets/common-pile/uk_hansard_filtered/resolve/c88adc44309aa255a41b51cef93ba783f775fe23/uk_hansard-0000.json.gz?download=true' 'uk-hansard-0000.jsonl.gz' 'ce9c35eb800d385f2f163a190227ed4031f9b6d73d386098ad5a4b76b1829812'
fetcher_download 'https://huggingface.co/datasets/common-pile/uk_hansard_filtered/resolve/c88adc44309aa255a41b51cef93ba783f775fe23/uk_hansard-0001.json.gz?download=true' 'uk-hansard-0001.jsonl.gz' '325542421788aa6afe305eb62b56420335affc4af59258cd223545b11d445056'
fetcher_download 'https://huggingface.co/datasets/common-pile/uk_hansard_filtered/resolve/c88adc44309aa255a41b51cef93ba783f775fe23/uk_hansard-0002.json.gz?download=true' 'uk-hansard-0002.jsonl.gz' '35ef9c775a3bcc8f551159b75afa35d9a515f86cfb570711491e617968c1fe8c'
fetcher_download 'https://huggingface.co/datasets/common-pile/uk_hansard_filtered/resolve/c88adc44309aa255a41b51cef93ba783f775fe23/uk_hansard-0003.json.gz?download=true' 'uk-hansard-0003.jsonl.gz' 'cb37f5a6f066776e1642e832d549296c2c8bdc9ebabb5e57e7c3f33d0642471f'

# shellcheck disable=SC2119
fetcher_manifest <<'JSON'
{
  "corpus": {
    "id": "uk-hansard",
    "title": "UK Parliament Hansard",
    "description": "Official reports of debates in the United Kingdom Parliament, via the filtered Common Pile v0.1 release.",
    "destination": "government/uk-hansard"
  },
  "sources": [
    {
      "id": "uk-hansard",
      "path": "",
      "license": "LicenseRef-Open-Parliament-Licence",
      "source": {
        "name": "common-pile/uk_hansard_filtered",
        "url": "https://huggingface.co/datasets/common-pile/uk_hansard_filtered",
        "category": "public-dataset",
        "license_evidence": {
          "declaration": "LicenseRef-Open-Parliament-Licence",
          "url": "https://huggingface.co/datasets/common-pile/uk_hansard_filtered"
        }
      },
      "input": {
        "type": "record-map",
        "fields": {
          "text": [
            "text"
          ]
        },
        "on_empty": "skip"
      },
      "artifacts": [
        {
          "url": "https://huggingface.co/datasets/common-pile/uk_hansard_filtered/resolve/c88adc44309aa255a41b51cef93ba783f775fe23/uk_hansard-0000.json.gz?download=true",
          "path": "uk-hansard-0000.jsonl.gz",
          "sha256": "ce9c35eb800d385f2f163a190227ed4031f9b6d73d386098ad5a4b76b1829812"
        },
        {
          "url": "https://huggingface.co/datasets/common-pile/uk_hansard_filtered/resolve/c88adc44309aa255a41b51cef93ba783f775fe23/uk_hansard-0001.json.gz?download=true",
          "path": "uk-hansard-0001.jsonl.gz",
          "sha256": "325542421788aa6afe305eb62b56420335affc4af59258cd223545b11d445056"
        },
        {
          "url": "https://huggingface.co/datasets/common-pile/uk_hansard_filtered/resolve/c88adc44309aa255a41b51cef93ba783f775fe23/uk_hansard-0002.json.gz?download=true",
          "path": "uk-hansard-0002.jsonl.gz",
          "sha256": "35ef9c775a3bcc8f551159b75afa35d9a515f86cfb570711491e617968c1fe8c"
        },
        {
          "url": "https://huggingface.co/datasets/common-pile/uk_hansard_filtered/resolve/c88adc44309aa255a41b51cef93ba783f775fe23/uk_hansard-0003.json.gz?download=true",
          "path": "uk-hansard-0003.jsonl.gz",
          "sha256": "cb37f5a6f066776e1642e832d549296c2c8bdc9ebabb5e57e7c3f33d0642471f"
        }
      ]
    }
  ]
}
JSON
