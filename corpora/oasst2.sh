#!/bin/sh
set -eu

script_dir=$(CDPATH='' cd -- "$(dirname -- "$0")" && pwd -P)
. "$script_dir/../functions.sh"

fetcher_begin "$@"
fetcher_require jq find sort awk wc curl
fetcher_size 25M
fetcher_download 'https://huggingface.co/datasets/OpenAssistant/oasst2/resolve/179dd21fc55192153d94adb0e0ce8f69e222bf75/2023-11-05_oasst2_ready.trees.jsonl.gz?download=true' 'oasst2-ready-trees.jsonl.gz' '7a886a16ccfc1173c4f00a6897523e3c95b2785a86ee44a18a98f4f2807ee29b'

# shellcheck disable=SC2119
fetcher_manifest <<'JSON'
{
  "corpus": {
    "id": "oasst2",
    "title": "OpenAssistant Conversations 2",
    "description": "Human-written and ranked multi-turn assistant conversations from OpenAssistant release 2, preserved as structured messages.",
    "destination": "post-train/sft/oasst2"
  },
  "sources": [
    {
      "id": "oasst2",
      "path": "",
      "license": "Apache-2.0",
      "source": {
        "name": "OpenAssistant/oasst2",
        "url": "https://huggingface.co/datasets/OpenAssistant/oasst2",
        "category": "public-dataset",
        "license_evidence": {
          "declaration": "Apache-2.0",
          "url": "https://huggingface.co/datasets/OpenAssistant/oasst2"
        }
      },
      "input": {
        "type": "ranked-conversation-tree",
        "fields": {
          "language": "lang",
          "id": "message_tree_id"
        },
        "tree": {
          "root": "prompt",
          "replies": "replies",
          "text": "text",
          "role": "role",
          "assistant_role": "assistant",
          "rank": "rank",
          "missing_rank": "source-order"
        }
      },
      "artifacts": [
        {
          "url": "https://huggingface.co/datasets/OpenAssistant/oasst2/resolve/179dd21fc55192153d94adb0e0ce8f69e222bf75/2023-11-05_oasst2_ready.trees.jsonl.gz?download=true",
          "path": "oasst2-ready-trees.jsonl.gz",
          "sha256": "7a886a16ccfc1173c4f00a6897523e3c95b2785a86ee44a18a98f4f2807ee29b"
        }
      ]
    }
  ]
}
JSON
