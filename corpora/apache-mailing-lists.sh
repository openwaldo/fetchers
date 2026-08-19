#!/bin/sh
set -eu

script_dir=$(CDPATH='' cd -- "$(dirname -- "$0")" && pwd -P)
. "$script_dir/../functions.sh"

fetcher_begin "$@"
fetcher_require jq find sort awk wc curl gzip
fetcher_size 25G
fetcher_apache_mbox_year 'apache-httpd-dev' 'https://lists.apache.org' 'dev@httpd.apache.org' '2025' '42f5f635cbd1fa5d04a0a1369a1adeeab2e5f5ddf87cdfe3bb22bafe7c389837' '44b113fa36e737e139433ce4cd8fac5c2ca3d1fcc2e3b2917f1d5926bc3f23c4' 'f26c29153a4081195d75044b90b58919aa318c2d2412568011665f075c301f07' 'ec5ced25165962fe4968c2689b423a7e681401335314f439830cd00c7c12b83d' '96efe7b732734dbdac110d1ae3e2e142523c231449b4c4d7477e219840a02f23' '983ad2914d0e454f4405cd0f367c15e71ceec0157862419d0f69e8258e454674' '18c748c3e01888b81da4856f37d014325bb2fca929af4e58e314242b66c2ff48' '9bd8e7fd84cfca64d9e03fc97261aa7a52b6e43f0be33ace2602cc2cec41b902' '8e09e56ada8037a1390d38e7d84bb3a7786294719109b2a6141126fef21b7e3b' '24c78328d85eaeb772537201de530d7bade851b3d544a9be40874a55ecfd811a' '48f5936457729403c590bc6955de33b6c388e56b7b5754c0410e93750b9d7bfa' 'f024f28d9344be1a12129852584e9bb105da64b3b465c6bbd6e6f223e410d34a'
fetcher_apache_mbox_year 'apache-subversion-dev' 'https://lists.apache.org' 'dev@subversion.apache.org' '2025' '82b78685b85007abd579fd06c3467b45c1b8851d6ef739ce440541284e07aa13' '9aec085452adec6e5b72c8d60fc96deee144b7aaaf0a0c150e921637f2dd91fe' '9727a270a182db9229b6d2343a83bc0588772f3f51a8c29381e376cc31102a71' 'df8deaa8df7206efc74a570ac61e6f5f0ae81fd012796d381783097392992b28' '5d3c98475b97982cf95ba58648652c34257e09e243deb33923e285a1e22a62b0' '57abe6564e43c5f0b48cfaf69a5505fe8489569d7cf5686feee2235ec967b94e' '601faa5950e305384a2d00a2de3f94b87a0798575b8abb6d64b735217e15e045' '45864940d566e60a76f909e14952f9c09f14b91305458846718cbbb9fd9ee9c0' '8b49e2a2792736ac5ce83a127c88ceed341d0cb295745c81bad85b824f1b9cb1' '5b651f2d6144e51b411fd38fcd509cab798c9415b6c0c2d69eb8c64408777300' '751a9da3857551ba05cf8b05bdc2929c5dabfcd48f58eb180dcac98c36a8507c' '0cd4e50f2258e4800c8037a48262f50db0a1b2fe82a75104753a29d62fd7ca9c'
fetcher_apache_mbox_year 'apache-commons-dev' 'https://lists.apache.org' 'dev@commons.apache.org' '2025' 'ccda00a9219865c685c10a07c35233fdaae113e4fcc6b103bf15db5db83ce69e' 'd9b9fa5c5ef9c5d35e0f21c32b66f9e536b8bc9f615ef6660dfae86c36b8e695' '35726dbfcd574720fd73ace1781da844514a9cf3dcd73ad5b5b1f9ead902194d' 'f13875267ab41c82166f8a8a3b7625f5dbec05cb82b130c68341b8963a6cfd98' '0ecb9e8403d924e367d8d3e8dd450578abd6fa05eb3ff274313e984db0bf3eab' '27d8ef11448f8942ad29f1b924add49d24131cd83ac38a844a36fdc2b8ef939d' '27b20c58a81f948cce8cc91798620fb05bdee6fe00afd5ca591e69244f92fe51' '6a43898554fcb704209a5c4ee4f4a4567fe05164263e1af59e735026b850a83c' '896151474457b02e5d9d8f423d9f6619d962027f4c32c1fcbd9b514664f0f1d9' '4c17652deffb0401ae00ed85fb6bf83e3c910a2fbbcd98977a68caeb3dd7282e' 'dec74a88298bacfbe84ba2ba631cd43c93540aa77f6e1e2ae345d68e6bf8406b' 'c0b7f3163c9e9feb619a57163c5a630631ab2454c2e7fc983e718108ca942e3a'

# shellcheck disable=SC2119
fetcher_manifest <<'JSON'
{
  "corpus": {
    "id": "apache-mailing-lists",
    "title": "Apache Project Development Mailing Lists",
    "description": "Checksum-pinned 2025 public development discussions for Apache HTTP Server, Subversion, and Commons."
  },
  "sources": [
    {
      "id": "apache-httpd-dev",
      "path": "apache-httpd-dev",
      "license": "LicenseRef-Apache-Public-Forum",
      "source": {
        "name": "dev@httpd.apache.org",
        "version": "2025",
        "url": "https://lists.apache.org/list.html?dev@httpd.apache.org",
        "category": "public-dataset",
        "license_evidence": {
          "declaration": "Published by the sender and made public without conditions under the ASF Public Forum Archive Policy.",
          "url": "https://www.apache.org/foundation/public-archives.html"
        },
        "content": {
          "types": [
            "developer communications",
            "mailing list"
          ],
          "languages": [
            "en"
          ],
          "from": "2025-01",
          "to": "2025-12",
          "selection": "All twelve monthly raw mbox exports for the public HTTP Server development list during calendar year 2025, retained as checksum-pinned UTF-8 text.",
          "copyrighted": "yes",
          "machine_generated": "unknown"
        },
        "acquisition": {
          "basis": "Official Apache raw mbox API with a reviewed SHA-256 for every selected month."
        }
      },
      "input": {
        "type": "mbox"
      },
      "artifacts": [
        {
          "method": "apache-mbox-year",
          "arguments": [
            "https://lists.apache.org",
            "dev@httpd.apache.org",
            "2025",
            "42f5f635cbd1fa5d04a0a1369a1adeeab2e5f5ddf87cdfe3bb22bafe7c389837",
            "44b113fa36e737e139433ce4cd8fac5c2ca3d1fcc2e3b2917f1d5926bc3f23c4",
            "f26c29153a4081195d75044b90b58919aa318c2d2412568011665f075c301f07",
            "ec5ced25165962fe4968c2689b423a7e681401335314f439830cd00c7c12b83d",
            "96efe7b732734dbdac110d1ae3e2e142523c231449b4c4d7477e219840a02f23",
            "983ad2914d0e454f4405cd0f367c15e71ceec0157862419d0f69e8258e454674",
            "18c748c3e01888b81da4856f37d014325bb2fca929af4e58e314242b66c2ff48",
            "9bd8e7fd84cfca64d9e03fc97261aa7a52b6e43f0be33ace2602cc2cec41b902",
            "8e09e56ada8037a1390d38e7d84bb3a7786294719109b2a6141126fef21b7e3b",
            "24c78328d85eaeb772537201de530d7bade851b3d544a9be40874a55ecfd811a",
            "48f5936457729403c590bc6955de33b6c388e56b7b5754c0410e93750b9d7bfa",
            "f024f28d9344be1a12129852584e9bb105da64b3b465c6bbd6e6f223e410d34a"
          ]
        }
      ]
    },
    {
      "id": "apache-subversion-dev",
      "path": "apache-subversion-dev",
      "license": "LicenseRef-Apache-Public-Forum",
      "source": {
        "name": "dev@subversion.apache.org",
        "version": "2025",
        "url": "https://lists.apache.org/list.html?dev@subversion.apache.org",
        "category": "public-dataset",
        "license_evidence": {
          "declaration": "Published by the sender and made public without conditions under the ASF Public Forum Archive Policy.",
          "url": "https://www.apache.org/foundation/public-archives.html"
        },
        "content": {
          "types": [
            "developer communications",
            "mailing list"
          ],
          "languages": [
            "en"
          ],
          "from": "2025-01",
          "to": "2025-12",
          "selection": "All twelve monthly raw mbox exports for the public Subversion development list during calendar year 2025, retained as checksum-pinned UTF-8 text.",
          "copyrighted": "yes",
          "machine_generated": "unknown"
        },
        "acquisition": {
          "basis": "Official Apache raw mbox API with a reviewed SHA-256 for every selected month."
        }
      },
      "input": {
        "type": "mbox"
      },
      "artifacts": [
        {
          "method": "apache-mbox-year",
          "arguments": [
            "https://lists.apache.org",
            "dev@subversion.apache.org",
            "2025",
            "82b78685b85007abd579fd06c3467b45c1b8851d6ef739ce440541284e07aa13",
            "9aec085452adec6e5b72c8d60fc96deee144b7aaaf0a0c150e921637f2dd91fe",
            "9727a270a182db9229b6d2343a83bc0588772f3f51a8c29381e376cc31102a71",
            "df8deaa8df7206efc74a570ac61e6f5f0ae81fd012796d381783097392992b28",
            "5d3c98475b97982cf95ba58648652c34257e09e243deb33923e285a1e22a62b0",
            "57abe6564e43c5f0b48cfaf69a5505fe8489569d7cf5686feee2235ec967b94e",
            "601faa5950e305384a2d00a2de3f94b87a0798575b8abb6d64b735217e15e045",
            "45864940d566e60a76f909e14952f9c09f14b91305458846718cbbb9fd9ee9c0",
            "8b49e2a2792736ac5ce83a127c88ceed341d0cb295745c81bad85b824f1b9cb1",
            "5b651f2d6144e51b411fd38fcd509cab798c9415b6c0c2d69eb8c64408777300",
            "751a9da3857551ba05cf8b05bdc2929c5dabfcd48f58eb180dcac98c36a8507c",
            "0cd4e50f2258e4800c8037a48262f50db0a1b2fe82a75104753a29d62fd7ca9c"
          ]
        }
      ]
    },
    {
      "id": "apache-commons-dev",
      "path": "apache-commons-dev",
      "license": "LicenseRef-Apache-Public-Forum",
      "source": {
        "name": "dev@commons.apache.org",
        "version": "2025",
        "url": "https://lists.apache.org/list.html?dev@commons.apache.org",
        "category": "public-dataset",
        "license_evidence": {
          "declaration": "Published by the sender and made public without conditions under the ASF Public Forum Archive Policy.",
          "url": "https://www.apache.org/foundation/public-archives.html"
        },
        "content": {
          "types": [
            "developer communications",
            "mailing list"
          ],
          "languages": [
            "en"
          ],
          "from": "2025-01",
          "to": "2025-12",
          "selection": "All twelve monthly raw mbox exports for the public Commons development list during calendar year 2025, retained as checksum-pinned UTF-8 text.",
          "copyrighted": "yes",
          "machine_generated": "unknown"
        },
        "acquisition": {
          "basis": "Official Apache raw mbox API with a reviewed SHA-256 for every selected month."
        }
      },
      "input": {
        "type": "mbox"
      },
      "artifacts": [
        {
          "method": "apache-mbox-year",
          "arguments": [
            "https://lists.apache.org",
            "dev@commons.apache.org",
            "2025",
            "ccda00a9219865c685c10a07c35233fdaae113e4fcc6b103bf15db5db83ce69e",
            "d9b9fa5c5ef9c5d35e0f21c32b66f9e536b8bc9f615ef6660dfae86c36b8e695",
            "35726dbfcd574720fd73ace1781da844514a9cf3dcd73ad5b5b1f9ead902194d",
            "f13875267ab41c82166f8a8a3b7625f5dbec05cb82b130c68341b8963a6cfd98",
            "0ecb9e8403d924e367d8d3e8dd450578abd6fa05eb3ff274313e984db0bf3eab",
            "27d8ef11448f8942ad29f1b924add49d24131cd83ac38a844a36fdc2b8ef939d",
            "27b20c58a81f948cce8cc91798620fb05bdee6fe00afd5ca591e69244f92fe51",
            "6a43898554fcb704209a5c4ee4f4a4567fe05164263e1af59e735026b850a83c",
            "896151474457b02e5d9d8f423d9f6619d962027f4c32c1fcbd9b514664f0f1d9",
            "4c17652deffb0401ae00ed85fb6bf83e3c910a2fbbcd98977a68caeb3dd7282e",
            "dec74a88298bacfbe84ba2ba631cd43c93540aa77f6e1e2ae345d68e6bf8406b",
            "c0b7f3163c9e9feb619a57163c5a630631ab2454c2e7fc983e718108ca942e3a"
          ]
        }
      ]
    }
  ]
}
JSON
