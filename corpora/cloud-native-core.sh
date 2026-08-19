#!/bin/sh
set -eu

CORPUS_ID='cloud-native-core'
CORPUS_TITLE='Cloud Native Core — Permissive'
CORPUS_DESCRIPTION='Project-owned source from immutable Apache-licensed releases of etcd, Prometheus, and containerd.'
CORPUS_DESTINATION='code/cloud-native-core'

SOURCE_COUNT='3'
SOURCE_1_ID='etcd'
SOURCE_1_PATH='etcd'
SOURCE_1_LICENSE='Apache-2.0'
SOURCE_1_NAME='etcd-io/etcd'
SOURCE_1_VERSION='5e7fd0de9a57db03ecc11794dc40403a734c07bb'
SOURCE_1_URL='https://github.com/etcd-io/etcd'
SOURCE_1_CATEGORY='public-dataset'
SOURCE_1_LICENSE_DECLARATION='Apache-2.0'
SOURCE_1_LICENSE_URL='https://github.com/etcd-io/etcd/blob/5e7fd0de9a57db03ecc11794dc40403a734c07bb/LICENSE'
SOURCE_1_CONTENT_TYPES='source code'
SOURCE_1_LANGUAGES='Go'
SOURCE_1_SELECTION='Project-owned source at v3.7.1 selected by the reviewed --source-code profile; vendored dependencies and generated API/build output excluded.'
SOURCE_1_COPYRIGHTED='yes'
SOURCE_1_ACQUISITION_BASIS='Official Git repository at the immutable peeled v3.7.1 commit.'

SOURCE_2_ID='prometheus'
SOURCE_2_PATH='prometheus'
SOURCE_2_LICENSE='Apache-2.0'
SOURCE_2_NAME='prometheus/prometheus'
SOURCE_2_VERSION='bb5dff00cf8fdfbf5c65e0531aa835fa238a43a2'
SOURCE_2_URL='https://github.com/prometheus/prometheus'
SOURCE_2_CATEGORY='public-dataset'
SOURCE_2_LICENSE_DECLARATION='Apache-2.0'
SOURCE_2_LICENSE_URL='https://github.com/prometheus/prometheus/blob/bb5dff00cf8fdfbf5c65e0531aa835fa238a43a2/LICENSE'
SOURCE_2_CONTENT_TYPES='source code'
SOURCE_2_LANGUAGES='Go
TypeScript'
SOURCE_2_SELECTION='Project-owned source at v3.13.2 selected by the reviewed --source-code profile; vendored dependencies and generated API/build output excluded.'
SOURCE_2_COPYRIGHTED='yes'
SOURCE_2_ACQUISITION_BASIS='Official Git repository at the immutable peeled v3.13.2 commit.'

SOURCE_3_ID='containerd'
SOURCE_3_PATH='containerd'
SOURCE_3_LICENSE='Apache-2.0'
SOURCE_3_NAME='containerd/containerd'
SOURCE_3_VERSION='aad11006b869517fcd3009450b6f82da282e1a9b'
SOURCE_3_URL='https://github.com/containerd/containerd'
SOURCE_3_CATEGORY='public-dataset'
SOURCE_3_LICENSE_DECLARATION='Apache-2.0'
SOURCE_3_LICENSE_URL='https://github.com/containerd/containerd/blob/aad11006b869517fcd3009450b6f82da282e1a9b/LICENSE'
SOURCE_3_CONTENT_TYPES='source code'
SOURCE_3_LANGUAGES='Go'
SOURCE_3_SELECTION='Project-owned source at v2.3.3 selected by the reviewed --source-code profile; 4,851 vendored files and generated API/build output are excluded.'
SOURCE_3_COPYRIGHTED='yes'
SOURCE_3_ACQUISITION_BASIS='Official Git repository at the immutable peeled v2.3.3 commit.'

FETCHER_OUTPUT=${1-}
FETCHER_ARGUMENT_COUNT=$#
FETCHER_SIZE='100G'
FETCH_COUNT='3'
FETCH_1_METHOD='git'
FETCH_1_SOURCE='1'
FETCH_1_PATH='etcd'
FETCH_1_URL='https://github.com/etcd-io/etcd.git'
FETCH_1_REF='refs/tags/v3.7.1'
FETCH_1_REVISION='5e7fd0de9a57db03ecc11794dc40403a734c07bb'
FETCH_1_OPTIONS='--skip-symlinks
--filter-blobs
--source-code'

FETCH_2_METHOD='git'
FETCH_2_SOURCE='2'
FETCH_2_PATH='prometheus'
FETCH_2_URL='https://github.com/prometheus/prometheus.git'
FETCH_2_REF='refs/tags/v3.13.2'
FETCH_2_REVISION='bb5dff00cf8fdfbf5c65e0531aa835fa238a43a2'
FETCH_2_OPTIONS='--skip-symlinks
--filter-blobs
--source-code'

FETCH_3_METHOD='git'
FETCH_3_SOURCE='3'
FETCH_3_PATH='containerd'
FETCH_3_URL='https://github.com/containerd/containerd.git'
FETCH_3_REF='refs/tags/v2.3.3'
FETCH_3_REVISION='aad11006b869517fcd3009450b6f82da282e1a9b'
FETCH_3_OPTIONS='--skip-symlinks
--filter-blobs
--source-code'

script_dir=$(CDPATH='' cd -- "$(dirname -- "$0")" && pwd -P)
. "$script_dir/../functions.sh"
fetcher_main
