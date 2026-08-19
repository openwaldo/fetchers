#!/bin/sh
set -eu

CORPUS_ID='youtube'
CORPUS_TITLE='YouTube Transcripts'
CORPUS_DESCRIPTION='Transcripts from Creative Commons-licensed YouTube videos, via the filtered Common Pile v0.1 release.'
CORPUS_DESTINATION='core/common-pile/youtube'

SOURCE_ID='youtube'
SOURCE_PATH=''
SOURCE_LICENSE='CC-BY-3.0'
SOURCE_NAME='common-pile/youtube_filtered'
SOURCE_URL='https://huggingface.co/datasets/common-pile/youtube_filtered'
SOURCE_CATEGORY='public-dataset'
SOURCE_LICENSE_DECLARATION='CC-BY-3.0'
SOURCE_LICENSE_URL='https://huggingface.co/datasets/common-pile/youtube_filtered'
INPUT_TYPE='record-map'
INPUT_ON_EMPTY='skip'
INPUT_NUL='space'
INPUT_TEXT_FIELDS='text'

FETCHER_OUTPUT=${1-}
FETCHER_ARGUMENT_COUNT=$#
FETCHER_SIZE='50G'
FETCH_METHOD='huggingface'
FETCH_SOURCE_PATH=''
FETCH_BASE_URL='https://huggingface.co'
FETCH_DATASET='common-pile/youtube_filtered'
FETCH_REVISION='dff8c8a54e98bce64c2e7ce9a8466c144c1cddd6'
FETCH_SUFFIX='json.gz'
FETCH_PREFIX=''

script_dir=$(CDPATH='' cd -- "$(dirname -- "$0")" && pwd -P)
. "$script_dir/../functions.sh"
fetcher_main
