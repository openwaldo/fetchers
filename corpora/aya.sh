#!/bin/sh
set -eu

CORPUS_ID='aya'
CORPUS_TITLE='Aya Dataset'
CORPUS_DESCRIPTION='Multilingual human-written instruction and response pairs from the Aya project, preserved as structured messages.'
CORPUS_DESTINATION='post-train/sft/aya'

SOURCE_ID='aya'
SOURCE_PATH=''
SOURCE_LICENSE='Apache-2.0'
SOURCE_NAME='CohereForAI/aya_dataset'
SOURCE_URL='https://huggingface.co/datasets/CohereForAI/aya_dataset'
SOURCE_CATEGORY='public-dataset'
SOURCE_LICENSE_DECLARATION='Apache-2.0'
SOURCE_LICENSE_URL='https://huggingface.co/datasets/CohereForAI/aya_dataset'
INPUT_TYPE='dialogue-pair'
INPUT_ON_EMPTY='skip'
INPUT_TEXT_FIELDS='inputs'
INPUT_LANGUAGE='language_code'
INPUT_RESPONSE='targets'

FETCHER_OUTPUT=${1-}
FETCHER_ARGUMENT_COUNT=$#
FETCHER_SIZE='250M'
FETCH_METHOD='huggingface'
FETCH_SOURCE_PATH=''
FETCH_BASE_URL='https://huggingface.co'
FETCH_DATASET='CohereForAI/aya_dataset'
FETCH_REVISION='f9ea04583f02a8f86404ff6c58bf75fe637df8a2'
FETCH_SUFFIX='parquet'
FETCH_PREFIX='data/'

script_dir=$(CDPATH='' cd -- "$(dirname -- "$0")" && pwd -P)
. "$script_dir/../functions.sh"
fetcher_main
