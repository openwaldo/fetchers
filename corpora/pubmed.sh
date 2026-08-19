#!/bin/sh
set -eu

CORPUS_ID='pubmed'
CORPUS_TITLE='PubMed Central Open-Access Articles'
CORPUS_DESCRIPTION='Openly licensed PubMed Central article text from the filtered Common Pile release.'
CORPUS_DESTINATION='science/pubmed'

SOURCE_ID='pubmed'
SOURCE_PATH=''
SOURCE_LICENSE='LicenseRef-Mixed'
SOURCE_NAME='common-pile/pubmed_filtered'
SOURCE_VERSION='c156f0569a92d8f2edc33cebe1f72f7d3e1cae84'
SOURCE_URL='https://huggingface.co/datasets/common-pile/pubmed_filtered'
SOURCE_CATEGORY='public-dataset'
SOURCE_LICENSE_DECLARATION='LicenseRef-Mixed'
SOURCE_LICENSE_URL='https://huggingface.co/datasets/common-pile/pubmed_filtered/blob/c156f0569a92d8f2edc33cebe1f72f7d3e1cae84/README.md'
SOURCE_CONTENT_TYPES='academic papers
biomedical literature'
SOURCE_LANGUAGES='multilingual'
SOURCE_SELECTION='All 17 gzip JSONL artifacts at the pinned filtered Common Pile revision; 3,797,568 records have complete PubMed Central identity, original URL, provenance, and one of three enumerated open licenses. The 11,870 metadata-rich rows with empty article text use their journal citation, then original PMC URL, as deterministic fallback.'
SOURCE_COPYRIGHTED='yes'
SOURCE_MACHINE_GENERATED='no'
SOURCE_ACQUISITION_BASIS='Public filtered dataset at the pinned revision with exact per-record open-license declarations and original PubMed Central URLs.'
INPUT_TYPE='record-map'
INPUT_ON_EMPTY='skip'
INPUT_TEXT_FIELDS='text'
INPUT_TEXT_FALLBACK='metadata.journal
metadata.url'
INPUT_ID='id'
INPUT_DATE='created'
INPUT_LICENSE='metadata.license'
INPUT_META_FIELDS='author_first=metadata.authors[].first
author_last=metadata.authors[].last
journal=metadata.journal
provenance=metadata.provenance
raw_license=metadata.license
source=source
url=metadata.url'
INPUT_LICENSE_INCLUDE='CC-BY-4.0
CC-BY-SA-4.0
CC0-1.0'

FETCHER_OUTPUT=${1-}
FETCHER_ARGUMENT_COUNT=$#
FETCHER_SIZE='500G'
FETCH_METHOD='huggingface'
FETCH_SOURCE_PATH=''
FETCH_BASE_URL='https://huggingface.co'
FETCH_DATASET='common-pile/pubmed_filtered'
FETCH_REVISION='c156f0569a92d8f2edc33cebe1f72f7d3e1cae84'
FETCH_SUFFIX='json.gz'
FETCH_PREFIX=''

script_dir=$(CDPATH='' cd -- "$(dirname -- "$0")" && pwd -P)
. "$script_dir/../functions.sh"
fetcher_main
