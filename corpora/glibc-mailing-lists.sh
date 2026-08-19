#!/bin/sh
set -eu

script_dir=$(CDPATH='' cd -- "$(dirname -- "$0")" && pwd -P)
. "$script_dir/../functions.sh"

fetcher_begin "$@"
fetcher_require jq find sort awk wc git tar
fetcher_size 25G
fetcher_public_inbox_year 'glibc-development' 'https://inbox.sourceware.org' 'libc-alpha' '2025' '0:529b8446b96366b26ceef5b432e708db039e1c5f'
fetcher_public_inbox_year 'glibc-help' 'https://inbox.sourceware.org' 'libc-help' '2025' '0:7b62f048725226ce0767aca3de377d5ee64fc2e4'

# shellcheck disable=SC2119
fetcher_manifest <<'JSON'
{
  "corpus": {
    "id": "glibc-mailing-lists",
    "title": "glibc Development and Help Mailing Lists",
    "description": "Calendar-year 2025 glibc development, patch review, and user-help messages from the official Sourceware public archives.",
    "destination": "community/glibc-mailing-lists"
  },
  "sources": [
    {
      "id": "glibc-development",
      "path": "glibc-development",
      "license": "LicenseRef-Publicly-Archived-Forum",
      "source": {
        "name": "libc-alpha@sourceware.org",
        "version": "2025",
        "url": "https://inbox.sourceware.org/libc-alpha/",
        "category": "public-dataset",
        "license_evidence": {
          "declaration": "Sourceware operates this official public mailing-list archive with a public-inbox Git export; no blanket content license is asserted for individual messages.",
          "url": "https://inbox.sourceware.org/libc-alpha/"
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
          "selection": "Every message commit whose author timestamp falls in calendar year 2025 from pinned public-inbox epoch 0; raw RFC 822 message blobs are retained as individual commit-addressed .eml inputs and archive tombstones are warned and ignored.",
          "copyrighted": "yes",
          "machine_generated": "unknown"
        },
        "acquisition": {
          "basis": "Official Sourceware public-inbox Git epoch fetched by immutable object ID and streamed without per-message subprocesses."
        }
      },
      "input": {
      },
      "artifacts": [
        {
          "method": "public-inbox-year",
          "arguments": [
            "https://inbox.sourceware.org",
            "libc-alpha",
            "2025",
            "0:529b8446b96366b26ceef5b432e708db039e1c5f"
          ]
        }
      ]
    },
    {
      "id": "glibc-help",
      "path": "glibc-help",
      "license": "LicenseRef-Publicly-Archived-Forum",
      "source": {
        "name": "libc-help@sourceware.org",
        "version": "2025",
        "url": "https://inbox.sourceware.org/libc-help/",
        "category": "public-dataset",
        "license_evidence": {
          "declaration": "Sourceware operates this official public mailing-list archive with a public-inbox Git export; no blanket content license is asserted for individual messages.",
          "url": "https://inbox.sourceware.org/libc-help/"
        },
        "content": {
          "types": [
            "developer communications",
            "mailing list",
            "user help"
          ],
          "languages": [
            "en"
          ],
          "from": "2025-01-01",
          "to": "2025-12-31",
          "selection": "Every message commit whose author timestamp falls in calendar year 2025 from pinned public-inbox epoch 0; raw RFC 822 message blobs are retained as individual commit-addressed .eml inputs and archive tombstones are warned and ignored.",
          "copyrighted": "yes",
          "machine_generated": "unknown"
        },
        "acquisition": {
          "basis": "Official Sourceware public-inbox Git epoch fetched by immutable object ID and streamed without per-message subprocesses."
        }
      },
      "input": {
      },
      "artifacts": [
        {
          "method": "public-inbox-year",
          "arguments": [
            "https://inbox.sourceware.org",
            "libc-help",
            "2025",
            "0:7b62f048725226ce0767aca3de377d5ee64fc2e4"
          ]
        }
      ]
    }
  ]
}
JSON
