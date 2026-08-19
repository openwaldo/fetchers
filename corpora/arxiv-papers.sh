#!/bin/sh
set -eu

CORPUS_ID='arxiv-papers'
CORPUS_TITLE='ArXiv Papers'
CORPUS_DESCRIPTION='Full openly licensed ArXiv paper text from the filtered Common Pile release.'
CORPUS_DESTINATION='science/arxiv-papers'

SOURCE_ID='arxiv-papers'
SOURCE_PATH=''
SOURCE_LICENSE='LicenseRef-Mixed'
SOURCE_NAME='common-pile/arxiv_papers_filtered'
SOURCE_VERSION='033cf7f53f9b348deec868c1a5a48484f3ee9e52'
SOURCE_URL='https://huggingface.co/datasets/common-pile/arxiv_papers_filtered'
SOURCE_CATEGORY='public-dataset'
SOURCE_LICENSE_DECLARATION='LicenseRef-Mixed'
SOURCE_LICENSE_URL='https://huggingface.co/datasets/common-pile/arxiv_papers_filtered/blob/033cf7f53f9b348deec868c1a5a48484f3ee9e52/README.md'
SOURCE_CONTENT_TYPES='academic papers
scientific literature'
SOURCE_LANGUAGES='en'
SOURCE_SELECTION='All eight gzip JSONL artifacts at the pinned filtered Common Pile revision; all 295,424 records carry one of five enumerated open or public-domain license values.'
SOURCE_COPYRIGHTED='yes'
SOURCE_MACHINE_GENERATED='unknown'
SOURCE_ACQUISITION_BASIS='Public dataset release at the pinned revision with per-record license and original ArXiv URL evidence.'
INPUT_TYPE='record-map'
INPUT_ON_EMPTY='skip'
INPUT_TEXT_FIELDS='text'
INPUT_ID='id'
INPUT_DATE='created'
INPUT_LICENSE='metadata.license'
INPUT_LICENSE_INCLUDE='CC-BY-4.0
CC-BY-SA-4.0
CC0-1.0
CC-BY-3.0
LicenseRef-Public-Domain'

FETCHER_OUTPUT=${1-}
FETCHER_ARGUMENT_COUNT=$#
FETCHER_SIZE='500G'
FETCH_METHOD='huggingface'
FETCH_SOURCE_PATH=''
FETCH_BASE_URL='https://huggingface.co'
FETCH_DATASET='common-pile/arxiv_papers_filtered'
FETCH_REVISION='033cf7f53f9b348deec868c1a5a48484f3ee9e52'
FETCH_SUFFIX='json.gz'
FETCH_PREFIX=''

script_dir=$(CDPATH='' cd -- "$(dirname -- "$0")" && pwd -P)
. "$script_dir/../functions.sh"
fetcher_main
