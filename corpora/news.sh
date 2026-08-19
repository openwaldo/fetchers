#!/bin/sh
set -eu

CORPUS_ID='news'
CORPUS_TITLE='Common Pile News'
CORPUS_DESCRIPTION='Openly licensed news articles from seventeen publishers, via the filtered Common Pile release.'
CORPUS_DESTINATION='core/common-pile/news'

SOURCE_ID='news'
SOURCE_PATH=''
SOURCE_LICENSE='LicenseRef-Mixed'
SOURCE_NAME='common-pile/news_filtered'
SOURCE_VERSION='59aaa8f104e189e6fb8033f0ed319c5c343a03b1'
SOURCE_URL='https://huggingface.co/datasets/common-pile/news_filtered'
SOURCE_CATEGORY='public-dataset'
SOURCE_LICENSE_DECLARATION='LicenseRef-Mixed'
SOURCE_LICENSE_URL='https://huggingface.co/datasets/common-pile/news_filtered/blob/59aaa8f104e189e6fb8033f0ed319c5c343a03b1/README.md'
SOURCE_CONTENT_TYPES='articles
news'
SOURCE_LANGUAGES='en'
SOURCE_SELECTION='All gzip JSONL artifacts at the pinned filtered Common Pile revision from the seventeen enumerated publisher source labels and two enumerated per-record licenses.'
SOURCE_COPYRIGHTED='yes'
SOURCE_MACHINE_GENERATED='unknown'
SOURCE_ACQUISITION_BASIS='Public dataset release at the pinned revision with per-record license and original article URL evidence.'
INPUT_TYPE='record-map'
INPUT_ON_EMPTY='skip'
INPUT_TEXT_FIELDS='text'
INPUT_ID='id'
INPUT_DATE='created'
INPUT_LICENSE='metadata.license'
INPUT_LICENSE_INCLUDE='CC-BY-4.0
CC-BY-SA-4.0'

FETCHER_OUTPUT=${1-}
FETCHER_ARGUMENT_COUNT=$#
FETCHER_SIZE='10G'
FETCH_METHOD='huggingface'
FETCH_SOURCE_PATH=''
FETCH_BASE_URL='https://huggingface.co'
FETCH_DATASET='common-pile/news_filtered'
FETCH_REVISION='59aaa8f104e189e6fb8033f0ed319c5c343a03b1'
FETCH_SUFFIX='json.gz'
FETCH_PREFIX=''

script_dir=$(CDPATH='' cd -- "$(dirname -- "$0")" && pwd -P)
. "$script_dir/../functions.sh"
fetcher_main
