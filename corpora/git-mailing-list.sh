#!/bin/sh
set -eu

CORPUS_ID='git-mailing-list'
CORPUS_TITLE='Git Development Mailing List'
CORPUS_DESCRIPTION='Calendar-year 2025 Git development and review messages from the official lore.kernel.org public archive.'
CORPUS_DESTINATION='community/git-mailing-list'

SOURCE_ID='git-mailing-list'
SOURCE_PATH=''
SOURCE_LICENSE='LicenseRef-Publicly-Archived-Forum'
SOURCE_NAME='git@vger.kernel.org'
SOURCE_VERSION='2025'
SOURCE_URL='https://lore.kernel.org/git/'
SOURCE_CATEGORY='public-dataset'
SOURCE_LICENSE_DECLARATION='Kernel.org operates lore as a public Git-backed mailing-list archive with downloadable mbox and Git exports; no blanket content license is asserted for individual messages.'
SOURCE_LICENSE_URL='https://www.kernel.org/doc/projects/korg/lore.html'
SOURCE_CONTENT_TYPES='developer communications
mailing list
patches
source code review'
SOURCE_LANGUAGES='en'
SOURCE_FROM='2025-01-01'
SOURCE_TO='2025-12-31'
SOURCE_SELECTION='Every message commit whose author timestamp falls in calendar year 2025 from pinned public-inbox epoch 1; raw RFC 822 message blobs are retained as individual commit-addressed .eml inputs.'
SOURCE_COPYRIGHTED='yes'
SOURCE_MACHINE_GENERATED='unknown'
SOURCE_ACQUISITION_BASIS='Official lore.kernel.org public-inbox Git epoch fetched by immutable object ID and streamed without per-message subprocesses.'

FETCHER_OUTPUT=${1-}
FETCHER_ARGUMENT_COUNT=$#
FETCHER_SIZE='25G'
FETCH_METHOD='public_inbox_year'
FETCH_ARG_COUNT='5'
FETCH_ARG_1=''
FETCH_ARG_2='https://lore.kernel.org'
FETCH_ARG_3='git'
FETCH_ARG_4='2025'
FETCH_ARG_5='1:0dfd53553cd88d51508b8c31e61cc23ba758b191'

script_dir=$(CDPATH='' cd -- "$(dirname -- "$0")" && pwd -P)
. "$script_dir/../functions.sh"
fetcher_main
