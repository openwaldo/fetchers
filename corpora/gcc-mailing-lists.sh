#!/bin/sh
set -eu

script_dir=$(CDPATH='' cd -- "$(dirname -- "$0")" && pwd -P)
. "$script_dir/../functions.sh"

fetcher_begin "$@"
fetcher_require jq find sort awk wc git tar
fetcher_size 25G
fetcher_public_inbox_year 'gcc-development' 'https://inbox.sourceware.org' 'gcc' '2025' '0:1e56f78753c3c05de1ecde8cc1d205db8e131a9e'
fetcher_public_inbox_year 'gcc-help' 'https://inbox.sourceware.org' 'gcc-help' '2025' '0:5a715393188fe69b131f2a9c9d4c33e7286cd78e'

# shellcheck disable=SC2119
fetcher_manifest <<'JSON'
{
  "corpus": {
    "id": "gcc-mailing-lists",
    "title": "GCC Development and Help Mailing Lists",
    "description": "Calendar-year 2025 GCC development, patch review, and user-help messages from the official Sourceware public archives."
  },
  "sources": [
    {
      "id": "gcc-development",
      "path": "gcc-development",
      "license": "LicenseRef-Publicly-Archived-Forum",
      "source": {
        "name": "gcc@gcc.gnu.org",
        "version": "2025",
        "url": "https://inbox.sourceware.org/gcc/",
        "category": "public-dataset",
        "license_evidence": {
          "declaration": "Sourceware operates this official public mailing-list archive with a public-inbox Git export; no blanket content license is asserted for individual messages.",
          "url": "https://inbox.sourceware.org/gcc/"
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
        "type": "auto"
      },
      "artifacts": [
        {
          "method": "public-inbox-year",
          "arguments": [
            "https://inbox.sourceware.org",
            "gcc",
            "2025",
            "0:1e56f78753c3c05de1ecde8cc1d205db8e131a9e"
          ]
        }
      ]
    },
    {
      "id": "gcc-help",
      "path": "gcc-help",
      "license": "LicenseRef-Publicly-Archived-Forum",
      "source": {
        "name": "gcc-help@gcc.gnu.org",
        "version": "2025",
        "url": "https://inbox.sourceware.org/gcc-help/",
        "category": "public-dataset",
        "license_evidence": {
          "declaration": "Sourceware operates this official public mailing-list archive with a public-inbox Git export; no blanket content license is asserted for individual messages.",
          "url": "https://inbox.sourceware.org/gcc-help/"
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
        "type": "auto"
      },
      "artifacts": [
        {
          "method": "public-inbox-year",
          "arguments": [
            "https://inbox.sourceware.org",
            "gcc-help",
            "2025",
            "0:5a715393188fe69b131f2a9c9d4c33e7286cd78e"
          ]
        }
      ]
    }
  ]
}
JSON
