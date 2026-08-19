#!/bin/sh
set -eu

script_dir=$(CDPATH='' cd -- "$(dirname -- "$0")" && pwd -P)
. "$script_dir/../functions.sh"

fetcher_begin "$@"
fetcher_require jq find sort awk wc curl
fetcher_size 250M
fetcher_download 'https://huggingface.co/datasets/HuggingFaceH4/ultrachat_200k/resolve/8049631c405ae6576f93f445c6b8166f76f5505a/data/train_sft-00000-of-00003-a3ecf92756993583.parquet?download=true' 'train_sft-00000.parquet' 'afa8fa7426081b2a0e732fb50dbb5cd402a28ad5f0dbe66c0d996d63e7220727'
fetcher_download 'https://huggingface.co/datasets/HuggingFaceH4/ultrachat_200k/resolve/8049631c405ae6576f93f445c6b8166f76f5505a/data/train_sft-00001-of-00003-0a1804bcb6ae68c6.parquet?download=true' 'train_sft-00001.parquet' 'c8230190bc8b29084c974ff32f05589b458fad1908fc4b2fb2b9e1e9f7921f03'
fetcher_download 'https://huggingface.co/datasets/HuggingFaceH4/ultrachat_200k/resolve/8049631c405ae6576f93f445c6b8166f76f5505a/data/train_sft-00002-of-00003-ee46ed25cfae92c6.parquet?download=true' 'train_sft-00002.parquet' '6fe7d2a5e95cf660f972ecaf304aa5632d7f53384e4b0e0d0f44d9c96733c03e'

# shellcheck disable=SC2119
fetcher_manifest <<'JSON'
{
  "corpus": {
    "id": "ultrachat-200k",
    "title": "UltraChat 200k SFT",
    "description": "Curated multi-turn assistant conversations from the UltraChat 200k supervised fine-tuning split, preserved as structured messages."
  },
  "sources": [
    {
      "id": "ultrachat-200k",
      "path": "",
      "license": "MIT",
      "source": {
        "name": "HuggingFaceH4/ultrachat_200k",
        "version": "8049631c405ae6576f93f445c6b8166f76f5505a",
        "url": "https://huggingface.co/datasets/HuggingFaceH4/ultrachat_200k",
        "category": "public-dataset",
        "license_evidence": {
          "declaration": "MIT",
          "url": "https://huggingface.co/datasets/HuggingFaceH4/ultrachat_200k/tree/8049631c405ae6576f93f445c6b8166f76f5505a"
        },
        "content": {
          "types": [
            "multi-turn conversations",
            "synthetic responses"
          ],
          "languages": [
            "en"
          ],
          "selection": "The three pinned train_sft Parquet shards only; test_sft and generation splits are excluded.",
          "personal_data": "unknown",
          "copyrighted": true,
          "machine_generated": true
        },
        "acquisition": {
          "basis": "Public supervised fine-tuning release curated from UltraChat generations."
        }
      },
      "input": {
        "type": "chat-messages",
        "on_empty": "skip",
        "fields": {
          "id": "prompt_id"
        },
        "messages": {
          "role": "messages[].role",
          "content": "messages[].content"
        }
      },
      "artifacts": [
        {
          "url": "https://huggingface.co/datasets/HuggingFaceH4/ultrachat_200k/resolve/8049631c405ae6576f93f445c6b8166f76f5505a/data/train_sft-00000-of-00003-a3ecf92756993583.parquet?download=true",
          "path": "train_sft-00000.parquet",
          "sha256": "afa8fa7426081b2a0e732fb50dbb5cd402a28ad5f0dbe66c0d996d63e7220727"
        },
        {
          "url": "https://huggingface.co/datasets/HuggingFaceH4/ultrachat_200k/resolve/8049631c405ae6576f93f445c6b8166f76f5505a/data/train_sft-00001-of-00003-0a1804bcb6ae68c6.parquet?download=true",
          "path": "train_sft-00001.parquet",
          "sha256": "c8230190bc8b29084c974ff32f05589b458fad1908fc4b2fb2b9e1e9f7921f03"
        },
        {
          "url": "https://huggingface.co/datasets/HuggingFaceH4/ultrachat_200k/resolve/8049631c405ae6576f93f445c6b8166f76f5505a/data/train_sft-00002-of-00003-ee46ed25cfae92c6.parquet?download=true",
          "path": "train_sft-00002.parquet",
          "sha256": "6fe7d2a5e95cf660f972ecaf304aa5632d7f53384e4b0e0d0f44d9c96733c03e"
        }
      ]
    }
  ]
}
JSON
