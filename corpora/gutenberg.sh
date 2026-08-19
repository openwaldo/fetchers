#!/bin/sh
set -eu

script_dir=$(CDPATH='' cd -- "$(dirname -- "$0")" && pwd -P)
. "$script_dir/../functions.sh"

fetcher_begin "$@"
fetcher_require jq find sort awk wc curl gzip
fetcher_size 100G
fetcher_gutenberg '' 'https://www.gutenberg.org' '-all' '-exclude-ids' '673'

# shellcheck disable=SC2119
fetcher_manifest <<'JSON'
{
  "corpus": {
    "id": "gutenberg",
    "title": "Project Gutenberg",
    "description": "Public-domain books transcribed and proofread by Project Gutenberg volunteers.",
    "destination": "core/books/gutenberg"
  },
  "sources": [
    {
      "id": "gutenberg",
      "path": "",
      "license": "CC0-1.0",
      "source": {
        "name": "gutenberg",
        "url": "https://www.gutenberg.org/",
        "category": "public-dataset",
        "license_evidence": {
          "declaration": "CC0-1.0",
          "url": "https://www.gutenberg.org/"
        }
      },
      "input": {
        "type": "bounded-text",
        "on_empty": "skip",
        "bounds": {
          "start_pattern": "(?m)^\\*\\*\\*\\s*START OF (?:THE|THIS) PROJECT GUTENBERG EBOOK[^\\n]*$",
          "end_pattern": "(?m)^[ \\t]*\\*\\*\\*\\s*END OF (?:THE|THIS) PROJECT GUTENBERG EBOOK[^\\n]*$"
        }
      },
      "artifacts": [
        {
          "method": "gutenberg",
          "arguments": [
            "https://www.gutenberg.org",
            "-all",
            "-exclude-ids",
            "673"
          ]
        }
      ]
    }
  ]
}
JSON
