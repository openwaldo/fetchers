#!/bin/sh
set -eu

script_dir=$(CDPATH='' cd -- "$(dirname -- "$0")" && pwd -P)
. "$script_dir/../functions.sh"

fetcher_begin "$@"
fetcher_require jq find sort awk wc curl
fetcher_size 25M
fetcher_download 'https://huggingface.co/datasets/OpenAssistant/oasst1/resolve/fdf72ae0827c1cda404aff25b6603abec9e3399b/2023-04-12_oasst_ready.trees.jsonl.gz?download=true' 'oasst1-ready-trees.jsonl.gz' '2a9a8fd343e9b28e04a895a669d3253f82d93e9c174d440199ae19d5fafbdff7'

# shellcheck disable=SC2119
fetcher_manifest <<'JSON'
{
  "corpus": {
    "id": "oasst1",
    "title": "OpenAssistant Conversations 1",
    "description": "Human-written and ranked multi-turn assistant conversations from OpenAssistant release 1, preserved as structured messages."
  },
  "sources": [
    {
      "id": "oasst1",
      "path": "",
      "license": "Apache-2.0",
      "source": {
        "name": "OpenAssistant/oasst1",
        "url": "https://huggingface.co/datasets/OpenAssistant/oasst1",
        "category": "public-dataset",
        "license_evidence": {
          "declaration": "Apache-2.0",
          "url": "https://huggingface.co/datasets/OpenAssistant/oasst1"
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
          "url": "https://huggingface.co/datasets/OpenAssistant/oasst1/resolve/fdf72ae0827c1cda404aff25b6603abec9e3399b/2023-04-12_oasst_ready.trees.jsonl.gz?download=true",
          "path": "oasst1-ready-trees.jsonl.gz",
          "sha256": "2a9a8fd343e9b28e04a895a669d3253f82d93e9c174d440199ae19d5fafbdff7"
        }
      ]
    }
  ]
}
JSON
