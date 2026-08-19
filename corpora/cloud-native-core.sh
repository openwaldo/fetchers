#!/bin/sh
set -eu

script_dir=$(CDPATH='' cd -- "$(dirname -- "$0")" && pwd -P)
. "$script_dir/../functions.sh"

fetcher_begin "$@"
fetcher_require jq find sort awk wc git tar
fetcher_size 100G
fetcher_git 'etcd' 'https://github.com/etcd-io/etcd.git' 'refs/tags/v3.7.1' '5e7fd0de9a57db03ecc11794dc40403a734c07bb' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'prometheus' 'https://github.com/prometheus/prometheus.git' 'refs/tags/v3.13.2' 'bb5dff00cf8fdfbf5c65e0531aa835fa238a43a2' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'containerd' 'https://github.com/containerd/containerd.git' 'refs/tags/v2.3.3' 'aad11006b869517fcd3009450b6f82da282e1a9b' '--skip-symlinks' '--filter-blobs' '--source-code'

# shellcheck disable=SC2119
fetcher_manifest <<'JSON'
{
  "corpus": {
    "id": "cloud-native-core",
    "title": "Cloud Native Core — Permissive",
    "description": "Project-owned source from immutable Apache-licensed releases of etcd, Prometheus, and containerd."
  },
  "sources": [
    {
      "id": "etcd",
      "path": "etcd",
      "license": "Apache-2.0",
      "source": {
        "name": "etcd-io/etcd",
        "version": "5e7fd0de9a57db03ecc11794dc40403a734c07bb",
        "url": "https://github.com/etcd-io/etcd",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://github.com/etcd-io/etcd/blob/5e7fd0de9a57db03ecc11794dc40403a734c07bb/LICENSE",
          "declaration": "Apache-2.0"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "Go"
          ],
          "selection": "Project-owned source at v3.7.1 selected by the reviewed --source-code profile; vendored dependencies and generated API/build output excluded.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Official Git repository at the immutable peeled v3.7.1 commit."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://github.com/etcd-io/etcd.git",
          "revision": "5e7fd0de9a57db03ecc11794dc40403a734c07bb",
          "ref": "refs/tags/v3.7.1"
        }
      ]
    },
    {
      "id": "prometheus",
      "path": "prometheus",
      "license": "Apache-2.0",
      "source": {
        "name": "prometheus/prometheus",
        "version": "bb5dff00cf8fdfbf5c65e0531aa835fa238a43a2",
        "url": "https://github.com/prometheus/prometheus",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://github.com/prometheus/prometheus/blob/bb5dff00cf8fdfbf5c65e0531aa835fa238a43a2/LICENSE",
          "declaration": "Apache-2.0"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "Go",
            "TypeScript"
          ],
          "selection": "Project-owned source at v3.13.2 selected by the reviewed --source-code profile; vendored dependencies and generated API/build output excluded.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Official Git repository at the immutable peeled v3.13.2 commit."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://github.com/prometheus/prometheus.git",
          "revision": "bb5dff00cf8fdfbf5c65e0531aa835fa238a43a2",
          "ref": "refs/tags/v3.13.2"
        }
      ]
    },
    {
      "id": "containerd",
      "path": "containerd",
      "license": "Apache-2.0",
      "source": {
        "name": "containerd/containerd",
        "version": "aad11006b869517fcd3009450b6f82da282e1a9b",
        "url": "https://github.com/containerd/containerd",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://github.com/containerd/containerd/blob/aad11006b869517fcd3009450b6f82da282e1a9b/LICENSE",
          "declaration": "Apache-2.0"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "Go"
          ],
          "selection": "Project-owned source at v2.3.3 selected by the reviewed --source-code profile; 4,851 vendored files and generated API/build output are excluded.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Official Git repository at the immutable peeled v2.3.3 commit."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://github.com/containerd/containerd.git",
          "revision": "aad11006b869517fcd3009450b6f82da282e1a9b",
          "ref": "refs/tags/v2.3.3"
        }
      ]
    }
  ]
}
JSON
