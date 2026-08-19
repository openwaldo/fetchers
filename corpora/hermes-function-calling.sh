#!/bin/sh
set -eu

script_dir=$(CDPATH='' cd -- "$(dirname -- "$0")" && pwd -P)
. "$script_dir/../functions.sh"

fetcher_begin "$@"
fetcher_require jq find sort awk wc curl
fetcher_size 250M
fetcher_download 'https://huggingface.co/datasets/NousResearch/hermes-function-calling-v1/resolve/176b6a99207f758190477ac3f24d702154d0ff5d/func_calling/train/0000.parquet?download=true' 'func-calling-multiturn.parquet' '92dfe61a5a62506eb4ec3f31b6d523273846ed7a4f59abf90548b659814a6c01'
fetcher_download 'https://huggingface.co/datasets/NousResearch/hermes-function-calling-v1/resolve/176b6a99207f758190477ac3f24d702154d0ff5d/func_calling_singleturn/train/0000.parquet?download=true' 'func-calling-singleturn.parquet' '654159e95aa7a6628df43afef954731a5164683d3d1d31d026ec10c57acd7e0c'

# shellcheck disable=SC2119
fetcher_manifest <<'JSON'
{
  "corpus": {
    "id": "hermes-function-calling",
    "title": "Hermes Function Calling",
    "description": "Structured multi-turn and single-turn function-calling conversations preserving tool definitions, calls, results, and final assistant responses."
  },
  "sources": [
    {
      "id": "hermes-function-calling",
      "path": "",
      "license": "Apache-2.0",
      "source": {
        "name": "NousResearch/hermes-function-calling-v1",
        "version": "176b6a99207f758190477ac3f24d702154d0ff5d",
        "url": "https://huggingface.co/datasets/NousResearch/hermes-function-calling-v1",
        "category": "public-dataset",
        "license_evidence": {
          "declaration": "Apache-2.0",
          "url": "https://huggingface.co/datasets/NousResearch/hermes-function-calling-v1/tree/176b6a99207f758190477ac3f24d702154d0ff5d"
        },
        "content": {
          "types": [
            "assistant responses",
            "tool calls",
            "tool definitions",
            "tool results"
          ],
          "selection": "The public auto-converted Parquet files for func_calling and func_calling_singleturn at immutable revision 176b6a99207f758190477ac3f24d702154d0ff5d.",
          "personal_data": "unknown",
          "copyrighted": true,
          "machine_generated": true
        },
        "acquisition": {
          "basis": "Public synthetic function-calling conversations released by Nous Research."
        }
      },
      "input": {
        "type": "chat-messages",
        "on_empty": "skip",
        "fields": {
          "id": "id",
          "meta": {
            "category": "category",
            "subcategory": "subcategory",
            "task": "task"
          }
        },
        "messages": {
          "role": "conversations[].from",
          "content": "conversations[].value",
          "tools": "tools",
          "role_aliases": {
            "human": "user",
            "gpt": "assistant"
          }
        }
      },
      "artifacts": [
        {
          "url": "https://huggingface.co/datasets/NousResearch/hermes-function-calling-v1/resolve/176b6a99207f758190477ac3f24d702154d0ff5d/func_calling/train/0000.parquet?download=true",
          "path": "func-calling-multiturn.parquet",
          "sha256": "92dfe61a5a62506eb4ec3f31b6d523273846ed7a4f59abf90548b659814a6c01"
        },
        {
          "url": "https://huggingface.co/datasets/NousResearch/hermes-function-calling-v1/resolve/176b6a99207f758190477ac3f24d702154d0ff5d/func_calling_singleturn/train/0000.parquet?download=true",
          "path": "func-calling-singleturn.parquet",
          "sha256": "654159e95aa7a6628df43afef954731a5164683d3d1d31d026ec10c57acd7e0c"
        }
      ]
    }
  ]
}
JSON
