#!/bin/sh
set -eu

CORPUS_ID='pes2o'
CORPUS_TITLE='Open-Access Papers'
CORPUS_DESCRIPTION='Full text of open-access scientific papers from peS2o, via the filtered Common Pile v0.1 release.'
CORPUS_DESTINATION='science/pes2o'

SOURCE_ID='pes2o'
SOURCE_PATH=''
SOURCE_LICENSE='CC-BY-4.0'
SOURCE_NAME='common-pile/peS2o_filtered'
SOURCE_URL='https://huggingface.co/datasets/common-pile/peS2o_filtered'
SOURCE_CATEGORY='public-dataset'
SOURCE_LICENSE_DECLARATION='CC-BY-4.0'
SOURCE_LICENSE_URL='https://huggingface.co/datasets/common-pile/peS2o_filtered'
INPUT_TYPE='record-map'
INPUT_ON_EMPTY='skip'
INPUT_TEXT_FIELDS='text'
INPUT_ID='id'
INPUT_DATE='created'
INPUT_SOURCE='source'
INPUT_META_FIELDS='oa_license=metadata.oa_license
oa_status=metadata.oa_status
oa_url=metadata.oa_url'

FETCHER_OUTPUT=${1-}
FETCHER_ARGUMENT_COUNT=$#
FETCHER_SIZE='50G'
FETCH_METHOD='huggingface'
FETCH_SOURCE_PATH=''
FETCH_BASE_URL='https://huggingface.co'
FETCH_DATASET='common-pile/peS2o_filtered'
FETCH_REVISION='297747513bfb0ff1fbf61ddad3b03319d0f04597'
FETCH_SUFFIX='json.gz'
FETCH_PREFIX=''

script_dir=$(CDPATH='' cd -- "$(dirname -- "$0")" && pwd -P)
. "$script_dir/../functions.sh"
fetcher_main
