#!/bin/sh
set -eu

CORPUS_ID='oercommons'
CORPUS_TITLE='OER Commons'
CORPUS_DESCRIPTION='Open educational resources from OER Commons, via the filtered Common Pile release.'
CORPUS_DESTINATION='core/common-pile/oercommons'

SOURCE_ID='oercommons'
SOURCE_PATH=''
SOURCE_LICENSE='LicenseRef-Mixed'
SOURCE_NAME='common-pile/oercommons_filtered'
SOURCE_VERSION='506b6159dadcbc0dc67611cea024eedb04232fb2'
SOURCE_URL='https://huggingface.co/datasets/common-pile/oercommons_filtered'
SOURCE_CATEGORY='public-dataset'
SOURCE_LICENSE_DECLARATION='LicenseRef-Mixed'
SOURCE_LICENSE_URL='https://huggingface.co/datasets/common-pile/oercommons_filtered/blob/506b6159dadcbc0dc67611cea024eedb04232fb2/README.md'
SOURCE_CONTENT_TYPES='open educational resources'
SOURCE_LANGUAGES='en'
SOURCE_SELECTION='All gzip JSONL artifacts at the pinned filtered Common Pile revision.'
SOURCE_COPYRIGHTED='yes'
SOURCE_MACHINE_GENERATED='unknown'
SOURCE_ACQUISITION_BASIS='Public dataset release at the pinned revision.'
INPUT_TYPE='record-map'
INPUT_ON_EMPTY='skip'
INPUT_TEXT_FIELDS='text'
INPUT_ID='id'
INPUT_LICENSE='metadata.license'
INPUT_LICENSE_INCLUDE='CC-BY-4.0
CC-BY-SA-4.0
LicenseRef-Public-Domain'

FETCHER_OUTPUT=${1-}
FETCHER_ARGUMENT_COUNT=$#
FETCHER_SIZE='10G'
FETCH_METHOD='huggingface'
FETCH_SOURCE_PATH=''
FETCH_BASE_URL='https://huggingface.co'
FETCH_DATASET='common-pile/oercommons_filtered'
FETCH_REVISION='506b6159dadcbc0dc67611cea024eedb04232fb2'
FETCH_SUFFIX='json.gz'
FETCH_PREFIX=''

script_dir=$(CDPATH='' cd -- "$(dirname -- "$0")" && pwd -P)
. "$script_dir/../functions.sh"
fetcher_main
