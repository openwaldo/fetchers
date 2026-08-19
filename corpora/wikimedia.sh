#!/bin/sh
set -eu

CORPUS_ID='wikimedia'
CORPUS_TITLE='Wikimedia'
CORPUS_DESCRIPTION='Articles and other text from Wikimedia projects, via the filtered Common Pile v0.1 release.'
CORPUS_DESTINATION='core/common-pile/wikimedia'

SOURCE_ID='wikimedia'
SOURCE_PATH=''
SOURCE_LICENSE='CC-BY-SA-4.0'
SOURCE_NAME='common-pile/wikimedia_filtered'
SOURCE_URL='https://huggingface.co/datasets/common-pile/wikimedia_filtered'
SOURCE_CATEGORY='public-dataset'
SOURCE_LICENSE_DECLARATION='CC-BY-SA-4.0'
SOURCE_LICENSE_URL='https://huggingface.co/datasets/common-pile/wikimedia_filtered'
INPUT_TYPE='record-map'
INPUT_ON_EMPTY='skip'
INPUT_TEXT_FIELDS='text'
INPUT_ID='id'
INPUT_DATE='created'
INPUT_LICENSE='metadata.license'
INPUT_SOURCE='source'
INPUT_META_FIELDS='namespace=metadata.namespace
title=metadata.title
url=metadata.url
wiki=metadata.wiki'
INPUT_MAIN_CONTENT='metadata.namespace=0'

FETCHER_OUTPUT=${1-}
FETCHER_ARGUMENT_COUNT=$#
FETCHER_SIZE='50G'
FETCH_METHOD='huggingface'
FETCH_SOURCE_PATH=''
FETCH_BASE_URL='https://huggingface.co'
FETCH_DATASET='common-pile/wikimedia_filtered'
FETCH_REVISION='0641bb84bd9b7162bcddf8be7836822161a9a342'
FETCH_SUFFIX='json.gz'
FETCH_PREFIX=''

script_dir=$(CDPATH='' cd -- "$(dirname -- "$0")" && pwd -P)
. "$script_dir/../functions.sh"
fetcher_main
