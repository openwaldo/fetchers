#!/bin/sh
set -eu

script_dir=$(CDPATH='' cd -- "$(dirname -- "$0")" && pwd -P)
. "$script_dir/../functions.sh"

fetcher_begin "$@"
fetcher_require jq find sort awk wc git tar
fetcher_size 25G
fetcher_public_inbox_year '' 'https://lore.kernel.org' 'lkml' '2025' '15:17145d36cd6846c40da10f16d7bca6eb36ba06b9' '16:17b3bd025913c34209645b20e205dfc760c9401a' '17:17dcb3b905a34ad6eac3d4bc666f5fdc3d2407b8' '18:4cfd85f2eacf9036cf01c8342a597f429b9fea7b'

# shellcheck disable=SC2119
fetcher_manifest <<'JSON'
{
  "corpus": {
    "id": "linux-kernel-mailing-list",
    "title": "Linux Kernel Mailing List",
    "description": "Calendar-year 2025 Linux kernel development messages from the official lore.kernel.org public archive.",
    "destination": "community/linux-kernel-mailing-list"
  },
  "sources": [
    {
      "id": "linux-kernel-mailing-list",
      "path": "",
      "license": "LicenseRef-Publicly-Archived-Forum",
      "source": {
        "name": "linux-kernel@vger.kernel.org",
        "version": "2025",
        "url": "https://lore.kernel.org/lkml/",
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
          "selection": "Every message commit whose author timestamp falls in calendar year 2025 from pinned public-inbox epochs 15, 16, 17, and 18; raw RFC 822 message blobs are retained as individual commit-addressed .eml inputs.",
          "copyrighted": "yes",
          "machine_generated": "unknown"
        },
        "acquisition": {
          "basis": "Official lore.kernel.org public-inbox Git epochs fetched by immutable object ID and streamed without per-message subprocesses."
        }
      },
      "input": {
      },
      "artifacts": [
        {
          "method": "public-inbox-year",
          "arguments": [
            "https://lore.kernel.org",
            "lkml",
            "2025",
            "15:17145d36cd6846c40da10f16d7bca6eb36ba06b9",
            "16:17b3bd025913c34209645b20e205dfc760c9401a",
            "17:17dcb3b905a34ad6eac3d4bc666f5fdc3d2407b8",
            "18:4cfd85f2eacf9036cf01c8342a597f429b9fea7b"
          ]
        }
      ]
    }
  ]
}
JSON
