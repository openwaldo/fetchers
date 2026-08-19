#!/bin/sh
set -eu

CORPUS_ID='doab'
CORPUS_TITLE='Directory of Open Access Books'
CORPUS_DESCRIPTION='Open-access book text from the Directory of Open Access Books, via the filtered Common Pile v0.1 release.'
CORPUS_DESTINATION='core/books/doab'

SOURCE_ID='doab'
SOURCE_PATH=''
SOURCE_LICENSE='CC-BY-4.0'
SOURCE_NAME='common-pile/doab_filtered'
SOURCE_URL='https://huggingface.co/datasets/common-pile/doab_filtered'
SOURCE_CATEGORY='public-dataset'
SOURCE_LICENSE_DECLARATION='CC-BY-4.0'
SOURCE_LICENSE_URL='https://huggingface.co/datasets/common-pile/doab_filtered'
INPUT_TYPE='record-map'
INPUT_ON_EMPTY='skip'
INPUT_TEXT_FIELDS='text'

FETCHER_OUTPUT=${1-}
FETCHER_ARGUMENT_COUNT=$#
FETCHER_SIZE='100G'
FETCH_METHOD='huggingface'
FETCH_SOURCE_PATH=''
FETCH_BASE_URL='https://huggingface.co'
FETCH_DATASET='common-pile/doab_filtered'
FETCH_REVISION='defb24ca72ef6aba6ce0228b669eec06dcfbffbc'
FETCH_SUFFIX='json.gz'
FETCH_PREFIX=''

script_dir=$(CDPATH='' cd -- "$(dirname -- "$0")" && pwd -P)
. "$script_dir/../functions.sh"
fetcher_main
