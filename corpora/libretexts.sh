#!/bin/sh
set -eu

CORPUS_ID='libretexts'
CORPUS_TITLE='LibreTexts'
CORPUS_DESCRIPTION='Open textbook sections from LibreTexts, via the filtered Common Pile release.'
CORPUS_DESTINATION='core/common-pile/libretexts'

SOURCE_ID='libretexts'
SOURCE_PATH=''
SOURCE_LICENSE='LicenseRef-Mixed'
SOURCE_NAME='common-pile/libretexts_filtered'
SOURCE_VERSION='70388bca52b4a93515e14b1d56618fd7944988fd'
SOURCE_URL='https://huggingface.co/datasets/common-pile/libretexts_filtered'
SOURCE_CATEGORY='public-dataset'
SOURCE_LICENSE_DECLARATION='LicenseRef-Mixed'
SOURCE_LICENSE_URL='https://huggingface.co/datasets/common-pile/libretexts_filtered/blob/70388bca52b4a93515e14b1d56618fd7944988fd/README.md'
SOURCE_CONTENT_TYPES='open educational resources
textbooks'
SOURCE_LANGUAGES='en'
SOURCE_SELECTION='All gzip JSONL artifacts at the pinned filtered Common Pile revision whose per-record license normalizes to one of the seven enumerated accepted values.'
SOURCE_COPYRIGHTED='yes'
SOURCE_MACHINE_GENERATED='unknown'
SOURCE_ACQUISITION_BASIS='Public dataset release at the pinned revision with per-record license evidence.'
INPUT_TYPE='record-map'
INPUT_ON_EMPTY='skip'
INPUT_TEXT_FIELDS='text'
INPUT_ID='id'
INPUT_DATE='created'
INPUT_LICENSE='metadata.license'
INPUT_LICENSE_INCLUDE='CC-BY-4.0
CC-BY-SA-4.0
LicenseRef-Public-Domain
CC-BY-3.0
GNU Free Documentation License
CC-BY-SA-3.0
CC-BY-SA-2.5'

FETCHER_OUTPUT=${1-}
FETCHER_ARGUMENT_COUNT=$#
FETCHER_SIZE='10G'
FETCH_METHOD='huggingface'
FETCH_SOURCE_PATH=''
FETCH_BASE_URL='https://huggingface.co'
FETCH_DATASET='common-pile/libretexts_filtered'
FETCH_REVISION='70388bca52b4a93515e14b1d56618fd7944988fd'
FETCH_SUFFIX='json.gz'
FETCH_PREFIX=''

script_dir=$(CDPATH='' cd -- "$(dirname -- "$0")" && pwd -P)
. "$script_dir/../functions.sh"
fetcher_main
