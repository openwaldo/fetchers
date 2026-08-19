#!/bin/sh
set -eu

CORPUS_ID='usgpo'
CORPUS_TITLE='US Government Publishing Office'
CORPUS_DESCRIPTION='Publications of the United States Government Publishing Office, via the filtered Common Pile v0.1 release.'
CORPUS_DESTINATION='government/usgpo'

SOURCE_ID='usgpo'
SOURCE_PATH=''
SOURCE_LICENSE='LicenseRef-Public-Domain'
SOURCE_NAME='common-pile/usgpo_filtered'
SOURCE_URL='https://huggingface.co/datasets/common-pile/usgpo_filtered'
SOURCE_CATEGORY='public-dataset'
SOURCE_LICENSE_DECLARATION='LicenseRef-Public-Domain'
SOURCE_LICENSE_URL='https://huggingface.co/datasets/common-pile/usgpo_filtered'
INPUT_TYPE='record-map'
INPUT_NUL='space'
INPUT_TEXT_FIELDS='text'

FETCHER_OUTPUT=${1-}
FETCHER_ARGUMENT_COUNT=$#
FETCHER_SIZE='50G'
FETCH_METHOD='huggingface'
FETCH_SOURCE_PATH=''
FETCH_BASE_URL='https://huggingface.co'
FETCH_DATASET='common-pile/usgpo_filtered'
FETCH_REVISION='b150cc22211de4d57f1b7f570097a00e65042424'
FETCH_SUFFIX='json.gz'
FETCH_PREFIX=''

script_dir=$(CDPATH='' cd -- "$(dirname -- "$0")" && pwd -P)
. "$script_dir/../functions.sh"
fetcher_main
