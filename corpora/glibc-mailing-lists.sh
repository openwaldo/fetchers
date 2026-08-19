#!/bin/sh
set -eu

CORPUS_ID='glibc-mailing-lists'
CORPUS_TITLE='glibc Development and Help Mailing Lists'
CORPUS_DESCRIPTION='Calendar-year 2025 glibc development, patch review, and user-help messages from the official Sourceware public archives.'
CORPUS_DESTINATION='community/glibc-mailing-lists'

SOURCE_COUNT='2'
SOURCE_1_ID='glibc-development'
SOURCE_1_PATH='glibc-development'
SOURCE_1_LICENSE='LicenseRef-Publicly-Archived-Forum'
SOURCE_1_NAME='libc-alpha@sourceware.org'
SOURCE_1_VERSION='2025'
SOURCE_1_URL='https://inbox.sourceware.org/libc-alpha/'
SOURCE_1_CATEGORY='public-dataset'
SOURCE_1_LICENSE_DECLARATION='Sourceware operates this official public mailing-list archive with a public-inbox Git export; no blanket content license is asserted for individual messages.'
SOURCE_1_LICENSE_URL='https://inbox.sourceware.org/libc-alpha/'
SOURCE_1_CONTENT_TYPES='developer communications
mailing list
patches
source code review'
SOURCE_1_LANGUAGES='en'
SOURCE_1_FROM='2025-01-01'
SOURCE_1_TO='2025-12-31'
SOURCE_1_SELECTION='Every message commit whose author timestamp falls in calendar year 2025 from pinned public-inbox epoch 0; raw RFC 822 message blobs are retained as individual commit-addressed .eml inputs and archive tombstones are warned and ignored.'
SOURCE_1_COPYRIGHTED='yes'
SOURCE_1_MACHINE_GENERATED='unknown'
SOURCE_1_ACQUISITION_BASIS='Official Sourceware public-inbox Git epoch fetched by immutable object ID and streamed without per-message subprocesses.'

SOURCE_2_ID='glibc-help'
SOURCE_2_PATH='glibc-help'
SOURCE_2_LICENSE='LicenseRef-Publicly-Archived-Forum'
SOURCE_2_NAME='libc-help@sourceware.org'
SOURCE_2_VERSION='2025'
SOURCE_2_URL='https://inbox.sourceware.org/libc-help/'
SOURCE_2_CATEGORY='public-dataset'
SOURCE_2_LICENSE_DECLARATION='Sourceware operates this official public mailing-list archive with a public-inbox Git export; no blanket content license is asserted for individual messages.'
SOURCE_2_LICENSE_URL='https://inbox.sourceware.org/libc-help/'
SOURCE_2_CONTENT_TYPES='developer communications
mailing list
user help'
SOURCE_2_LANGUAGES='en'
SOURCE_2_FROM='2025-01-01'
SOURCE_2_TO='2025-12-31'
SOURCE_2_SELECTION='Every message commit whose author timestamp falls in calendar year 2025 from pinned public-inbox epoch 0; raw RFC 822 message blobs are retained as individual commit-addressed .eml inputs and archive tombstones are warned and ignored.'
SOURCE_2_COPYRIGHTED='yes'
SOURCE_2_MACHINE_GENERATED='unknown'
SOURCE_2_ACQUISITION_BASIS='Official Sourceware public-inbox Git epoch fetched by immutable object ID and streamed without per-message subprocesses.'

FETCHER_OUTPUT=${1-}
FETCHER_ARGUMENT_COUNT=$#
FETCHER_SIZE='25G'
FETCH_COUNT='2'
FETCH_1_METHOD='public_inbox_year'
FETCH_1_SOURCE='1'
FETCH_1_ARG_COUNT='5'
FETCH_1_ARG_1='glibc-development'
FETCH_1_ARG_2='https://inbox.sourceware.org'
FETCH_1_ARG_3='libc-alpha'
FETCH_1_ARG_4='2025'
FETCH_1_ARG_5='0:529b8446b96366b26ceef5b432e708db039e1c5f'

FETCH_2_METHOD='public_inbox_year'
FETCH_2_SOURCE='2'
FETCH_2_ARG_COUNT='5'
FETCH_2_ARG_1='glibc-help'
FETCH_2_ARG_2='https://inbox.sourceware.org'
FETCH_2_ARG_3='libc-help'
FETCH_2_ARG_4='2025'
FETCH_2_ARG_5='0:7b62f048725226ce0767aca3de377d5ee64fc2e4'

script_dir=$(CDPATH='' cd -- "$(dirname -- "$0")" && pwd -P)
. "$script_dir/../functions.sh"
fetcher_main
