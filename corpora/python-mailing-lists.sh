#!/bin/sh
set -eu

script_dir=$(CDPATH='' cd -- "$(dirname -- "$0")" && pwd -P)
. "$script_dir/../functions.sh"

fetcher_begin "$@"
fetcher_require jq find sort awk wc curl gzip
fetcher_size 25G
fetcher_hyperkitty_monthly 'python-list' 'https://mail.python.org/archives/list' 'python-list' 'messages' 'python-list.tsv' '5eae49e599a701348872423903fce3f678482396f2d38ed2a364290d184704d5'
fetcher_hyperkitty_monthly 'tutor' 'https://mail.python.org/archives/list' 'tutor' 'messages' 'tutor.tsv' 'e931ad0b6c0f2e5c1b364eb001e604d5ec13542d24ea5f075611d796d0bb0ced'
fetcher_hyperkitty_monthly 'python-dev' 'https://mail.python.org/archives/list' 'python-dev' 'messages' 'python-dev.tsv' '684e7d8cdc5e3d09f2dc70d8626e354cf301c0cc29a6e44b6781b120bb372829'

# shellcheck disable=SC2119
fetcher_manifest <<'JSON'
{
  "corpus": {
    "id": "python-mailing-lists",
    "title": "Python Community Mailing Lists",
    "description": "Checksum-pinned Python development, user, and learning-support discussions from official monthly HyperKitty mbox exports.",
    "destination": "community/python-mailing-lists"
  },
  "sources": [
    {
      "id": "python-list",
      "path": "python-list",
      "license": "LicenseRef-Publicly-Archived-Forum",
      "source": {
        "name": "python-list@python.org",
        "version": "2015-01..2025-12",
        "url": "https://mail.python.org/archives/list/python-list@python.org/",
        "category": "public-dataset",
        "license_evidence": {
          "declaration": "Python.org identifies python-list as a public community mailing list and publishes its archive and bulk mbox exports; no blanket content license is asserted for individual messages.",
          "url": "https://www.python.org/community/lists/"
        },
        "content": {
          "types": [
            "mailing list",
            "technical discussion",
            "user support"
          ],
          "languages": [
            "en"
          ],
          "from": "2015-01",
          "to": "2025-12",
          "selection": "All 132 official date-bounded monthly exports from 2015 through 2025, retained as byte-exact RFC 822 messages; a deterministic MIME-boundary projection is used only to verify each export.",
          "copyrighted": "yes",
          "machine_generated": "unknown"
        },
        "acquisition": {
          "basis": "Official unauthenticated monthly HyperKitty mbox exports, each pinned by canonical SHA-256 and message count in a checksum-pinned manifest."
        }
      },
      "input": {
      },
      "artifacts": [
        {
          "method": "hyperkitty-monthly",
          "arguments": [
            "https://mail.python.org/archives/list",
            "python-list",
            "messages",
            "python-list.tsv",
            "5eae49e599a701348872423903fce3f678482396f2d38ed2a364290d184704d5"
          ]
        }
      ]
    },
    {
      "id": "tutor",
      "path": "tutor",
      "license": "LicenseRef-Publicly-Archived-Forum",
      "source": {
        "name": "tutor@python.org",
        "version": "2015-01..2025-12",
        "url": "https://mail.python.org/archives/list/tutor@python.org/",
        "category": "public-dataset",
        "license_evidence": {
          "declaration": "Python.org identifies tutor as a public learning and support mailing list and publishes its archive and bulk mbox exports; no blanket content license is asserted for individual messages.",
          "url": "https://www.python.org/community/lists/"
        },
        "content": {
          "types": [
            "mailing list",
            "programming education",
            "user support"
          ],
          "languages": [
            "en"
          ],
          "from": "2015-01",
          "to": "2025-12",
          "selection": "All 132 official date-bounded monthly exports from 2015 through 2025, retained as byte-exact RFC 822 messages; a deterministic MIME-boundary projection is used only to verify each export.",
          "copyrighted": "yes",
          "machine_generated": "unknown"
        },
        "acquisition": {
          "basis": "Official unauthenticated monthly HyperKitty mbox exports, each pinned by canonical SHA-256 and message count in a checksum-pinned manifest."
        }
      },
      "input": {
      },
      "artifacts": [
        {
          "method": "hyperkitty-monthly",
          "arguments": [
            "https://mail.python.org/archives/list",
            "tutor",
            "messages",
            "tutor.tsv",
            "e931ad0b6c0f2e5c1b364eb001e604d5ec13542d24ea5f075611d796d0bb0ced"
          ]
        }
      ]
    },
    {
      "id": "python-dev",
      "path": "python-dev",
      "license": "LicenseRef-Publicly-Archived-Forum",
      "source": {
        "name": "python-dev@python.org",
        "version": "2015-01..2022-12",
        "url": "https://mail.python.org/archives/list/python-dev@python.org/",
        "category": "public-dataset",
        "license_evidence": {
          "declaration": "Python.org identifies python-dev as a public core-development mailing list and publishes its archive and bulk mbox exports; no blanket content license is asserted for individual messages.",
          "url": "https://www.python.org/community/lists/"
        },
        "content": {
          "types": [
            "developer communications",
            "language design",
            "mailing list"
          ],
          "languages": [
            "en"
          ],
          "from": "2015-01",
          "to": "2022-12",
          "selection": "All 96 official date-bounded monthly exports from 2015 through the list's 2022 migration, retained as byte-exact RFC 822 messages; a deterministic MIME-boundary projection is used only to verify each export.",
          "copyrighted": "yes",
          "machine_generated": "unknown"
        },
        "acquisition": {
          "basis": "Official unauthenticated monthly HyperKitty mbox exports, each pinned by canonical SHA-256 and message count in a checksum-pinned manifest."
        }
      },
      "input": {
      },
      "artifacts": [
        {
          "method": "hyperkitty-monthly",
          "arguments": [
            "https://mail.python.org/archives/list",
            "python-dev",
            "messages",
            "python-dev.tsv",
            "684e7d8cdc5e3d09f2dc70d8626e354cf301c0cc29a6e44b6781b120bb372829"
          ]
        }
      ]
    }
  ]
}
JSON
