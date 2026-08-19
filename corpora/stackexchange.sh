#!/bin/sh
set -eu

CORPUS_ID='stackexchange'
CORPUS_TITLE='Stack Exchange'
CORPUS_DESCRIPTION='Questions, answers, and community posts from Stack Exchange sites, via the filtered Common Pile v0.1 release.'
CORPUS_DESTINATION='core/common-pile/stackexchange'

SOURCE_ID='stackexchange'
SOURCE_PATH=''
SOURCE_LICENSE='CC-BY-SA-4.0'
SOURCE_NAME='common-pile/stackexchange_filtered'
SOURCE_URL='https://huggingface.co/datasets/common-pile/stackexchange_filtered'
SOURCE_CATEGORY='public-dataset'
SOURCE_LICENSE_DECLARATION='CC-BY-SA-4.0'
SOURCE_LICENSE_URL='https://huggingface.co/datasets/common-pile/stackexchange_filtered'
INPUT_TYPE='record-map'
INPUT_NUL='space'
INPUT_TEXT_FIELDS='text'

FETCHER_OUTPUT=${1-}
FETCHER_ARGUMENT_COUNT=$#
FETCHER_SIZE='50G'
FETCH_METHOD='huggingface'
FETCH_SOURCE_PATH=''
FETCH_BASE_URL='https://huggingface.co'
FETCH_DATASET='common-pile/stackexchange_filtered'
FETCH_REVISION='c0ac7373830c688a43fc12d1988c4b19ccd884ab'
FETCH_SUFFIX='json.gz'
FETCH_PREFIX=''

script_dir=$(CDPATH='' cd -- "$(dirname -- "$0")" && pwd -P)
. "$script_dir/../functions.sh"
fetcher_main
