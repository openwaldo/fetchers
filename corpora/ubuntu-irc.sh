#!/bin/sh
set -eu

script_dir=$(CDPATH='' cd -- "$(dirname -- "$0")" && pwd -P)
. "$script_dir/../functions.sh"

fetcher_begin "$@"
fetcher_require jq find sort awk wc curl
fetcher_size 50G
fetcher_download 'https://huggingface.co/datasets/common-pile/ubuntu_irc_filtered/resolve/84f88c986584f11d672befab542fa4d5123f3e8f/ubuntu-chat-dolma-0000.json.gz?download=true' 'ubuntu-irc-0000.jsonl.gz' '133eb85b084f508eda1d2dac3b0c22c68f3d6e230cde237b8d0ec3c2804e24e2'
fetcher_download 'https://huggingface.co/datasets/common-pile/ubuntu_irc_filtered/resolve/84f88c986584f11d672befab542fa4d5123f3e8f/ubuntu-chat-dolma-0001.json.gz?download=true' 'ubuntu-irc-0001.jsonl.gz' '493f012a4de1b5395862931028646b9113de9a943291016280d5b1cc91b18d5d'
fetcher_download 'https://huggingface.co/datasets/common-pile/ubuntu_irc_filtered/resolve/84f88c986584f11d672befab542fa4d5123f3e8f/ubuntu-chat-dolma-0002.json.gz?download=true' 'ubuntu-irc-0002.jsonl.gz' 'ef909f7fe32e5f0032748fc945f78891eec05cb565548c2a217bfee17e791d62'

# shellcheck disable=SC2119
fetcher_manifest <<'JSON'
{
  "corpus": {
    "id": "ubuntu-irc",
    "title": "Ubuntu IRC Logs",
    "description": "Public Ubuntu community IRC conversations, via the filtered Common Pile v0.1 release."
  },
  "sources": [
    {
      "id": "ubuntu-irc",
      "path": "",
      "license": "CC0-1.0",
      "source": {
        "name": "common-pile/ubuntu_irc_filtered",
        "url": "https://huggingface.co/datasets/common-pile/ubuntu_irc_filtered",
        "category": "public-dataset",
        "license_evidence": {
          "declaration": "CC0-1.0",
          "url": "https://huggingface.co/datasets/common-pile/ubuntu_irc_filtered"
        }
      },
      "input": {
        "type": "record-map",
        "on_empty": "skip",
        "nul": "space",
        "fields": {
          "text": [
            "text"
          ]
        }
      },
      "artifacts": [
        {
          "url": "https://huggingface.co/datasets/common-pile/ubuntu_irc_filtered/resolve/84f88c986584f11d672befab542fa4d5123f3e8f/ubuntu-chat-dolma-0000.json.gz?download=true",
          "path": "ubuntu-irc-0000.jsonl.gz",
          "sha256": "133eb85b084f508eda1d2dac3b0c22c68f3d6e230cde237b8d0ec3c2804e24e2"
        },
        {
          "url": "https://huggingface.co/datasets/common-pile/ubuntu_irc_filtered/resolve/84f88c986584f11d672befab542fa4d5123f3e8f/ubuntu-chat-dolma-0001.json.gz?download=true",
          "path": "ubuntu-irc-0001.jsonl.gz",
          "sha256": "493f012a4de1b5395862931028646b9113de9a943291016280d5b1cc91b18d5d"
        },
        {
          "url": "https://huggingface.co/datasets/common-pile/ubuntu_irc_filtered/resolve/84f88c986584f11d672befab542fa4d5123f3e8f/ubuntu-chat-dolma-0002.json.gz?download=true",
          "path": "ubuntu-irc-0002.jsonl.gz",
          "sha256": "ef909f7fe32e5f0032748fc945f78891eec05cb565548c2a217bfee17e791d62"
        }
      ]
    }
  ]
}
JSON
