#!/bin/sh
set -eu

CORPUS_ID='regulations'
CORPUS_TITLE='US Federal Rulemaking'
CORPUS_DESCRIPTION='Documents from United States federal rulemaking proceedings, via the filtered Common Pile v0.1 release.'
CORPUS_DESTINATION='government/regulations'

SOURCE_ID='regulations'
SOURCE_PATH=''
SOURCE_LICENSE='LicenseRef-Public-Domain'
SOURCE_NAME='common-pile/regulations_filtered'
SOURCE_URL='https://huggingface.co/datasets/common-pile/regulations_filtered'
SOURCE_CATEGORY='public-dataset'
SOURCE_LICENSE_DECLARATION='LicenseRef-Public-Domain'
SOURCE_LICENSE_URL='https://huggingface.co/datasets/common-pile/regulations_filtered'
INPUT_TYPE='record-map'
INPUT_NUL='space'
INPUT_TEXT_FIELDS='text'

FETCHER_OUTPUT=${1-}
FETCHER_ARGUMENT_COUNT=$#
FETCHER_SIZE='50G'
FETCH_COUNT='2'
FETCH_1_METHOD='download'
FETCH_1_URL='https://huggingface.co/datasets/common-pile/regulations_filtered/resolve/3327364490dfc7929009226ad667eceb2441d93a/regulations-0000.json.gz?download=true'
FETCH_1_PATH='regulations-0000.jsonl.gz'
FETCH_1_SHA256='8c1bc1676f0425afe534a66ce2519b631a8d1338af06570a6ef0abf9c240f893'

FETCH_2_METHOD='download'
FETCH_2_URL='https://huggingface.co/datasets/common-pile/regulations_filtered/resolve/3327364490dfc7929009226ad667eceb2441d93a/regulations-0001.json.gz?download=true'
FETCH_2_PATH='regulations-0001.jsonl.gz'
FETCH_2_SHA256='fae5a6b6c5a4cba188663b8a8843ab778d09e6650a3d39860a90a711e0c16837'

script_dir=$(CDPATH='' cd -- "$(dirname -- "$0")" && pwd -P)
. "$script_dir/../functions.sh"
fetcher_main
