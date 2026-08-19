#!/bin/sh
set -eu

CORPUS_ID='arxiv-abstracts'
CORPUS_TITLE='ArXiv Abstracts'
CORPUS_DESCRIPTION='Paper titles and abstracts from ArXiv metadata, via the filtered Common Pile release.'
CORPUS_DESTINATION='science/arxiv-abstracts'

SOURCE_ID='arxiv-abstracts'
SOURCE_PATH=''
SOURCE_LICENSE='CC0-1.0'
SOURCE_NAME='common-pile/arxiv_abstracts_filtered'
SOURCE_VERSION='dc1ceab4755eb037ec61e49cf1350dab7ceee6e7'
SOURCE_URL='https://huggingface.co/datasets/common-pile/arxiv_abstracts_filtered'
SOURCE_CATEGORY='public-dataset'
SOURCE_LICENSE_DECLARATION='CC0-1.0'
SOURCE_LICENSE_URL='https://huggingface.co/datasets/common-pile/arxiv_abstracts_filtered/blob/dc1ceab4755eb037ec61e49cf1350dab7ceee6e7/README.md'
SOURCE_CONTENT_TYPES='academic abstracts
scientific metadata'
SOURCE_LANGUAGES='multilingual'
SOURCE_SELECTION='Both gzip JSONL artifacts at the pinned filtered Common Pile revision; all 2,504,679 records declare CC0 for the abstract record. The source full_text_license field describes the separate full paper and is retained only as metadata. Exactly 263,151 identifiers overlap the full-paper corpus, while 2,241,527 identifiers occur only here. One identifier has two distinct source versions, and both are retained.'
SOURCE_COPYRIGHTED='no'
SOURCE_MACHINE_GENERATED='no'
SOURCE_ACQUISITION_BASIS='Public filtered dataset at the pinned revision with a uniform per-record CC0 declaration, original ArXiv URL, and source provenance.'
INPUT_TYPE='record-map'
INPUT_ON_EMPTY='skip'
INPUT_TEXT_FIELDS='text'
INPUT_ID='id'
INPUT_DATE='created'
INPUT_META_FIELDS='authors=metadata.authors
full_text_license=metadata.full_text_license
provenance=metadata.provenance
raw_license=metadata.license
source=source
submitter=metadata.submitter
url=metadata.url'

FETCHER_OUTPUT=${1-}
FETCHER_ARGUMENT_COUNT=$#
FETCHER_SIZE='50G'
FETCH_METHOD='huggingface'
FETCH_SOURCE_PATH=''
FETCH_BASE_URL='https://huggingface.co'
FETCH_DATASET='common-pile/arxiv_abstracts_filtered'
FETCH_REVISION='dc1ceab4755eb037ec61e49cf1350dab7ceee6e7'
FETCH_SUFFIX='json.gz'
FETCH_PREFIX=''

script_dir=$(CDPATH='' cd -- "$(dirname -- "$0")" && pwd -P)
. "$script_dir/../functions.sh"
fetcher_main
