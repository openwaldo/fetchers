#!/bin/sh
set -eu

script_dir=$(CDPATH='' cd -- "$(dirname -- "$0")" && pwd -P)
. "$script_dir/../functions.sh"

fetcher_begin "$@"
fetcher_require jq find sort awk wc curl gzip
fetcher_size 25G
fetcher_mailman_text_set 'beowulf' 'https://beowulf.org/pipermail/beowulf/2025-January.txt.gz' '2025-01.txt' 'bc72a2bfcfa69e18f3e6cdbbb96aeadb15667043b9ac5969726397224c57795f' 'https://beowulf.org/pipermail/beowulf/2025-February.txt.gz' '2025-02.txt' '83166d9338a81bf3a42a86f0d9a219636e5c68766e13fe20dcff02451ed0f57d' 'https://beowulf.org/pipermail/beowulf/2025-March.txt.gz' '2025-03.txt' 'cf0ed7d46e8ddbdceafef0a2dea9d50a393ba16e37e0842a68f74ba197bfa5aa' 'https://beowulf.org/pipermail/beowulf/2025-June.txt.gz' '2025-06.txt' '35c803cecfe0dbec50aa8bfc1423305fd62fa68a59dcc06d3f39517f3c19b457' 'https://beowulf.org/pipermail/beowulf/2025-October.txt.gz' '2025-10.txt' '7801698e2397a3823154cf7b736f21a52965054d238dd91787f018e478b5182b' 'https://beowulf.org/pipermail/beowulf/2025-November.txt.gz' '2025-11.txt' '0bdcc90a080a2d65a884f279f3e15398e6d8af537d2b0bab523973c71378cb1c'
fetcher_mailman_text_set 'osi-license-review' 'https://lists.opensource.org/pipermail/license-review_lists.opensource.org/2025-January.txt.gz' '2025-01.txt' '116bbe116b5aa7b7f03e5ba196c0150c04c4eb16bda190cd57466b916e2bb2e6' 'https://lists.opensource.org/pipermail/license-review_lists.opensource.org/2025-February.txt.gz' '2025-02.txt' '6c8a3adb125f8b0c537e2871c1fa1bde18747294eee43c23c182cc55ec62947f' 'https://lists.opensource.org/pipermail/license-review_lists.opensource.org/2025-March.txt.gz' '2025-03.txt' '7ba0dad2dadc8ef2d9cb80305b6cf326cc75af92bc39278a2e8c86d493b1367e' 'https://lists.opensource.org/pipermail/license-review_lists.opensource.org/2025-April.txt.gz' '2025-04.txt' '1c250a6c2f9adada5958a40881898393e9e921b0ff41aca2e84db489c29eab1f' 'https://lists.opensource.org/pipermail/license-review_lists.opensource.org/2025-May.txt.gz' '2025-05.txt' 'd7fbb9f92b214f4f34670d0060ffff1579319d30f05889abb2560a1de3b992bb' 'https://lists.opensource.org/pipermail/license-review_lists.opensource.org/2025-June.txt.gz' '2025-06.txt' '313a2e71fd52b915b8b09280fc8621d6ffbaa88ef7d50d18969206e92a35583a' 'https://lists.opensource.org/pipermail/license-review_lists.opensource.org/2025-July.txt.gz' '2025-07.txt' 'e761496fa972cfbbf1f9f58a71802d752a48646f012afb27d8fb2b3c5cac3d55' 'https://lists.opensource.org/pipermail/license-review_lists.opensource.org/2025-August.txt.gz' '2025-08.txt' 'c0cbf6a2ce315e39d6735cfd48b25dff587cb312aa5210ed444fe331eff453f5' 'https://lists.opensource.org/pipermail/license-review_lists.opensource.org/2025-September.txt.gz' '2025-09.txt' 'fdfb78090ee44e70a24fd72dacec04e4f6bcd7eefb00c5ff86f65a5ed15603b7' 'https://lists.opensource.org/pipermail/license-review_lists.opensource.org/2025-October.txt.gz' '2025-10.txt' '5e0963aea0db9dc913a23ac080b13ee7f6179573cf19476a62fb19e4aed4e7d5' 'https://lists.opensource.org/pipermail/license-review_lists.opensource.org/2025-November.txt.gz' '2025-11.txt' 'dcd0f1ea9c80cbdd699e2e4cd1a4291f0b378e77e4a919938a01c6523da11c3d' 'https://lists.opensource.org/pipermail/license-review_lists.opensource.org/2025-December.txt.gz' '2025-12.txt' 'b8f3ddcb4b0b1aabdb4d2e9008405fae1a7cf447f03ca54c23193eb19e102f70'
fetcher_mailman_text_set 'osi-license-discuss' 'https://lists.opensource.org/pipermail/license-discuss_lists.opensource.org/2025-February.txt.gz' '2025-02.txt' '3a1bb5c7d27068879a8f1cd405efe1af1975b19fa1aaaade9921b19754b08c2c' 'https://lists.opensource.org/pipermail/license-discuss_lists.opensource.org/2025-March.txt.gz' '2025-03.txt' '447fd831c98be32c1b90b07c4a07974c9c52ebb62a738c4a250b1bd727892d2a' 'https://lists.opensource.org/pipermail/license-discuss_lists.opensource.org/2025-April.txt.gz' '2025-04.txt' '9c93bfd729ac7528514f078c0a5060c602ece3c0ac3447580c10afecd39082b7' 'https://lists.opensource.org/pipermail/license-discuss_lists.opensource.org/2025-May.txt.gz' '2025-05.txt' '223d0b3c0d6deddc3139a61dcf99da091f68afc2bdf589d75d2ccc1a6d368592' 'https://lists.opensource.org/pipermail/license-discuss_lists.opensource.org/2025-June.txt.gz' '2025-06.txt' 'b47deae623d5a83cea24ea3372065b8d442c465e580f12f931f648352b958e13' 'https://lists.opensource.org/pipermail/license-discuss_lists.opensource.org/2025-July.txt.gz' '2025-07.txt' 'ba010d98c4314ef7e21493e59f30b9ccb8b7c7911b5ab4ab2cc31a5a458a4d5c' 'https://lists.opensource.org/pipermail/license-discuss_lists.opensource.org/2025-September.txt.gz' '2025-09.txt' 'f432193853ed1cad23b188d42e73db3dab1b8473e063e091ef47e4d67f046016' 'https://lists.opensource.org/pipermail/license-discuss_lists.opensource.org/2025-October.txt.gz' '2025-10.txt' 'c048727d6ae548d4dacaf064dad1446a1af3e5c2d192464e59bfb0d4a564074e' 'https://lists.opensource.org/pipermail/license-discuss_lists.opensource.org/2025-November.txt.gz' '2025-11.txt' '7067c6dfe1aee8a4e494edda267979427623bf1164e6f05eb4667efa6ef4f3b5' 'https://lists.opensource.org/pipermail/license-discuss_lists.opensource.org/2025-December.txt.gz' '2025-12.txt' '82f4c7a37a54030a17a98a3aa3fa73a1b5cb74a8d5cd9f8e1b4ba609d45f8dd5'

# shellcheck disable=SC2119
fetcher_manifest <<'JSON'
{
  "corpus": {
    "id": "opensource-mailing-lists",
    "title": "Open Source Community Mailing Lists",
    "description": "Checksum-pinned 2025 public discussions from the Beowulf and Open Source Initiative communities.",
    "destination": "community/opensource-mailing-lists"
  },
  "sources": [
    {
      "id": "beowulf",
      "path": "beowulf",
      "license": "LicenseRef-Publicly-Archived-Forum",
      "source": {
        "name": "Beowulf Mailing List",
        "version": "2025",
        "url": "https://beowulf.org/pipermail/beowulf/",
        "category": "public-dataset",
        "license_evidence": {
          "declaration": "The project identifies Beowulf as a public mailing list and provides downloadable monthly text archives; no blanket content license is stated.",
          "url": "https://beowulf.org/cgi-bin/mailman/listinfo/"
        },
        "content": {
          "types": [
            "high-performance computing",
            "mailing list",
            "user community support"
          ],
          "languages": [
            "en"
          ],
          "from": "2025-01",
          "to": "2025-11",
          "selection": "All six non-empty monthly text exports published for calendar year 2025.",
          "copyrighted": "yes",
          "machine_generated": "unknown"
        },
        "acquisition": {
          "basis": "Official public Mailman archive with each available monthly gzip text export checksum-pinned."
        }
      },
      "input": {
        "type": "mbox"
      },
      "artifacts": [
        {
          "method": "mailman-text-set",
          "arguments": [
            "https://beowulf.org/pipermail/beowulf/2025-January.txt.gz",
            "2025-01.txt",
            "bc72a2bfcfa69e18f3e6cdbbb96aeadb15667043b9ac5969726397224c57795f",
            "https://beowulf.org/pipermail/beowulf/2025-February.txt.gz",
            "2025-02.txt",
            "83166d9338a81bf3a42a86f0d9a219636e5c68766e13fe20dcff02451ed0f57d",
            "https://beowulf.org/pipermail/beowulf/2025-March.txt.gz",
            "2025-03.txt",
            "cf0ed7d46e8ddbdceafef0a2dea9d50a393ba16e37e0842a68f74ba197bfa5aa",
            "https://beowulf.org/pipermail/beowulf/2025-June.txt.gz",
            "2025-06.txt",
            "35c803cecfe0dbec50aa8bfc1423305fd62fa68a59dcc06d3f39517f3c19b457",
            "https://beowulf.org/pipermail/beowulf/2025-October.txt.gz",
            "2025-10.txt",
            "7801698e2397a3823154cf7b736f21a52965054d238dd91787f018e478b5182b",
            "https://beowulf.org/pipermail/beowulf/2025-November.txt.gz",
            "2025-11.txt",
            "0bdcc90a080a2d65a884f279f3e15398e6d8af537d2b0bab523973c71378cb1c"
          ]
        }
      ]
    },
    {
      "id": "osi-license-review",
      "path": "osi-license-review",
      "license": "LicenseRef-OSI-Public-Forum",
      "source": {
        "name": "OSI License Review",
        "version": "2025",
        "url": "https://lists.opensource.org/pipermail/license-review_lists.opensource.org/",
        "category": "public-dataset",
        "license_evidence": {
          "declaration": "OSI deems public-forum communications published by the sender and made public without condition.",
          "url": "https://opensource.org/public_archives_policy/"
        },
        "content": {
          "types": [
            "license review",
            "mailing list",
            "open source governance"
          ],
          "languages": [
            "en"
          ],
          "from": "2025-01",
          "to": "2025-12",
          "selection": "All twelve monthly gzip text exports for calendar year 2025.",
          "copyrighted": "yes",
          "machine_generated": "unknown"
        },
        "acquisition": {
          "basis": "Official public Mailman archive with each monthly export checksum-pinned."
        }
      },
      "input": {
        "type": "mbox"
      },
      "artifacts": [
        {
          "method": "mailman-text-set",
          "arguments": [
            "https://lists.opensource.org/pipermail/license-review_lists.opensource.org/2025-January.txt.gz",
            "2025-01.txt",
            "116bbe116b5aa7b7f03e5ba196c0150c04c4eb16bda190cd57466b916e2bb2e6",
            "https://lists.opensource.org/pipermail/license-review_lists.opensource.org/2025-February.txt.gz",
            "2025-02.txt",
            "6c8a3adb125f8b0c537e2871c1fa1bde18747294eee43c23c182cc55ec62947f",
            "https://lists.opensource.org/pipermail/license-review_lists.opensource.org/2025-March.txt.gz",
            "2025-03.txt",
            "7ba0dad2dadc8ef2d9cb80305b6cf326cc75af92bc39278a2e8c86d493b1367e",
            "https://lists.opensource.org/pipermail/license-review_lists.opensource.org/2025-April.txt.gz",
            "2025-04.txt",
            "1c250a6c2f9adada5958a40881898393e9e921b0ff41aca2e84db489c29eab1f",
            "https://lists.opensource.org/pipermail/license-review_lists.opensource.org/2025-May.txt.gz",
            "2025-05.txt",
            "d7fbb9f92b214f4f34670d0060ffff1579319d30f05889abb2560a1de3b992bb",
            "https://lists.opensource.org/pipermail/license-review_lists.opensource.org/2025-June.txt.gz",
            "2025-06.txt",
            "313a2e71fd52b915b8b09280fc8621d6ffbaa88ef7d50d18969206e92a35583a",
            "https://lists.opensource.org/pipermail/license-review_lists.opensource.org/2025-July.txt.gz",
            "2025-07.txt",
            "e761496fa972cfbbf1f9f58a71802d752a48646f012afb27d8fb2b3c5cac3d55",
            "https://lists.opensource.org/pipermail/license-review_lists.opensource.org/2025-August.txt.gz",
            "2025-08.txt",
            "c0cbf6a2ce315e39d6735cfd48b25dff587cb312aa5210ed444fe331eff453f5",
            "https://lists.opensource.org/pipermail/license-review_lists.opensource.org/2025-September.txt.gz",
            "2025-09.txt",
            "fdfb78090ee44e70a24fd72dacec04e4f6bcd7eefb00c5ff86f65a5ed15603b7",
            "https://lists.opensource.org/pipermail/license-review_lists.opensource.org/2025-October.txt.gz",
            "2025-10.txt",
            "5e0963aea0db9dc913a23ac080b13ee7f6179573cf19476a62fb19e4aed4e7d5",
            "https://lists.opensource.org/pipermail/license-review_lists.opensource.org/2025-November.txt.gz",
            "2025-11.txt",
            "dcd0f1ea9c80cbdd699e2e4cd1a4291f0b378e77e4a919938a01c6523da11c3d",
            "https://lists.opensource.org/pipermail/license-review_lists.opensource.org/2025-December.txt.gz",
            "2025-12.txt",
            "b8f3ddcb4b0b1aabdb4d2e9008405fae1a7cf447f03ca54c23193eb19e102f70"
          ]
        }
      ]
    },
    {
      "id": "osi-license-discuss",
      "path": "osi-license-discuss",
      "license": "LicenseRef-OSI-Public-Forum",
      "source": {
        "name": "OSI License Discuss",
        "version": "2025",
        "url": "https://lists.opensource.org/pipermail/license-discuss_lists.opensource.org/",
        "category": "public-dataset",
        "license_evidence": {
          "declaration": "OSI deems public-forum communications published by the sender and made public without condition.",
          "url": "https://opensource.org/public_archives_policy/"
        },
        "content": {
          "types": [
            "license discussion",
            "mailing list",
            "open source governance"
          ],
          "languages": [
            "en"
          ],
          "from": "2025-02",
          "to": "2025-12",
          "selection": "All ten non-empty monthly gzip text exports published for calendar year 2025.",
          "copyrighted": "yes",
          "machine_generated": "unknown"
        },
        "acquisition": {
          "basis": "Official public Mailman archive with each available monthly export checksum-pinned."
        }
      },
      "input": {
        "type": "mbox"
      },
      "artifacts": [
        {
          "method": "mailman-text-set",
          "arguments": [
            "https://lists.opensource.org/pipermail/license-discuss_lists.opensource.org/2025-February.txt.gz",
            "2025-02.txt",
            "3a1bb5c7d27068879a8f1cd405efe1af1975b19fa1aaaade9921b19754b08c2c",
            "https://lists.opensource.org/pipermail/license-discuss_lists.opensource.org/2025-March.txt.gz",
            "2025-03.txt",
            "447fd831c98be32c1b90b07c4a07974c9c52ebb62a738c4a250b1bd727892d2a",
            "https://lists.opensource.org/pipermail/license-discuss_lists.opensource.org/2025-April.txt.gz",
            "2025-04.txt",
            "9c93bfd729ac7528514f078c0a5060c602ece3c0ac3447580c10afecd39082b7",
            "https://lists.opensource.org/pipermail/license-discuss_lists.opensource.org/2025-May.txt.gz",
            "2025-05.txt",
            "223d0b3c0d6deddc3139a61dcf99da091f68afc2bdf589d75d2ccc1a6d368592",
            "https://lists.opensource.org/pipermail/license-discuss_lists.opensource.org/2025-June.txt.gz",
            "2025-06.txt",
            "b47deae623d5a83cea24ea3372065b8d442c465e580f12f931f648352b958e13",
            "https://lists.opensource.org/pipermail/license-discuss_lists.opensource.org/2025-July.txt.gz",
            "2025-07.txt",
            "ba010d98c4314ef7e21493e59f30b9ccb8b7c7911b5ab4ab2cc31a5a458a4d5c",
            "https://lists.opensource.org/pipermail/license-discuss_lists.opensource.org/2025-September.txt.gz",
            "2025-09.txt",
            "f432193853ed1cad23b188d42e73db3dab1b8473e063e091ef47e4d67f046016",
            "https://lists.opensource.org/pipermail/license-discuss_lists.opensource.org/2025-October.txt.gz",
            "2025-10.txt",
            "c048727d6ae548d4dacaf064dad1446a1af3e5c2d192464e59bfb0d4a564074e",
            "https://lists.opensource.org/pipermail/license-discuss_lists.opensource.org/2025-November.txt.gz",
            "2025-11.txt",
            "7067c6dfe1aee8a4e494edda267979427623bf1164e6f05eb4667efa6ef4f3b5",
            "https://lists.opensource.org/pipermail/license-discuss_lists.opensource.org/2025-December.txt.gz",
            "2025-12.txt",
            "82f4c7a37a54030a17a98a3aa3fa73a1b5cb74a8d5cd9f8e1b4ba609d45f8dd5"
          ]
        }
      ]
    }
  ]
}
JSON
