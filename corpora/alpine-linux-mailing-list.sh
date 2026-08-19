#!/bin/sh
set -eu

script_dir=$(CDPATH='' cd -- "$(dirname -- "$0")" && pwd -P)
. "$script_dir/../functions.sh"

fetcher_begin "$@"
fetcher_require jq find sort awk wc curl gzip
fetcher_size 25G
fetcher_sourcehut_list_export 'alpine-devel' 'https://lists.alpinelinux.org/~alpine/devel' 'alpine-devel-messages' 'a16fef22d575c3f170383128e32fe082a5be12991ffb8294dbc4fee636b3c457'

# shellcheck disable=SC2119
fetcher_manifest <<'JSON'
{
  "corpus": {
    "id": "alpine-linux-mailing-list",
    "title": "Alpine Linux Development Mailing List",
    "description": "Canonicalized complete public Alpine Linux development-list archive from the official bulk mbox export.",
    "destination": "community/alpine-linux-mailing-list"
  },
  "sources": [
    {
      "id": "alpine-devel",
      "path": "alpine-devel",
      "license": "LicenseRef-Publicly-Archived-Forum",
      "source": {
        "name": "alpine-devel@lists.alpinelinux.org",
        "version": "2006-2026-snapshot-2026-08-10",
        "url": "https://lists.alpinelinux.org/~alpine/devel",
        "category": "public-dataset",
        "license_evidence": {
          "declaration": "Alpine identifies this as its public development mailing list and the official archive explicitly offers the entire list as an mbox export; no blanket content license is asserted for individual messages.",
          "url": "https://lists.alpinelinux.org/~alpine/devel"
        },
        "content": {
          "types": [
            "developer communications",
            "mailing list",
            "source code discussion",
            "user support"
          ],
          "languages": [
            "en"
          ],
          "from": "2006-01-17",
          "to": "2026-07-27",
          "selection": "All 8,206 messages in the complete official archive export qualified on 2026-08-10. Transport-generated mbox envelope timestamps are canonicalized and removed while each byte-exact RFC 822 message is emitted as one training input.",
          "copyrighted": "yes",
          "machine_generated": "unknown"
        },
        "acquisition": {
          "basis": "Official whole-list mbox export independently retrieved twice and pinned by the identical SHA-256 of its narrowly canonicalized payload."
        }
      },
      "input": {
      },
      "artifacts": [
        {
          "method": "sourcehut-list-export",
          "arguments": [
            "https://lists.alpinelinux.org/~alpine/devel",
            "alpine-devel-messages",
            "a16fef22d575c3f170383128e32fe082a5be12991ffb8294dbc4fee636b3c457"
          ]
        }
      ]
    }
  ]
}
JSON
