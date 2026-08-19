#!/bin/sh
set -eu

script_dir=$(CDPATH='' cd -- "$(dirname -- "$0")" && pwd -P)
. "$script_dir/../functions.sh"

fetcher_begin "$@"
fetcher_require jq find sort awk wc git tar
fetcher_size 25G
fetcher_public_inbox_year '' 'https://lore.kernel.org' 'git' '2025' '1:0dfd53553cd88d51508b8c31e61cc23ba758b191'

# shellcheck disable=SC2119
fetcher_manifest <<'JSON'
{
  "corpus": {
    "id": "git-mailing-list",
    "title": "Git Development Mailing List",
    "description": "Calendar-year 2025 Git development and review messages from the official lore.kernel.org public archive.",
    "destination": "community/git-mailing-list"
  },
  "sources": [
    {
      "id": "git-mailing-list",
      "path": "",
      "license": "LicenseRef-Publicly-Archived-Forum",
      "source": {
        "name": "git@vger.kernel.org",
        "version": "2025",
        "url": "https://lore.kernel.org/git/",
        "category": "public-dataset",
        "license_evidence": {
          "declaration": "Kernel.org operates lore as a public Git-backed mailing-list archive with downloadable mbox and Git exports; no blanket content license is asserted for individual messages.",
          "url": "https://www.kernel.org/doc/projects/korg/lore.html"
        },
        "content": {
          "types": [
            "developer communications",
            "mailing list",
            "patches",
            "source code review"
          ],
          "languages": [
            "en"
          ],
          "from": "2025-01-01",
          "to": "2025-12-31",
          "selection": "Every message commit whose author timestamp falls in calendar year 2025 from pinned public-inbox epoch 1; raw RFC 822 message blobs are retained as individual commit-addressed .eml inputs.",
          "copyrighted": "yes",
          "machine_generated": "unknown"
        },
        "acquisition": {
          "basis": "Official lore.kernel.org public-inbox Git epoch fetched by immutable object ID and streamed without per-message subprocesses."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "method": "public-inbox-year",
          "arguments": [
            "https://lore.kernel.org",
            "git",
            "2025",
            "1:0dfd53553cd88d51508b8c31e61cc23ba758b191"
          ]
        }
      ]
    }
  ]
}
JSON
