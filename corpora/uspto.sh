#!/bin/sh
set -eu

CORPUS_ID='uspto'
CORPUS_TITLE='United States Patents and Patent Applications'
CORPUS_DESCRIPTION='United States patent grants and published patent applications from the filtered Common Pile release.'
CORPUS_DESTINATION='government/uspto'

SOURCE_ID='uspto'
SOURCE_PATH=''
SOURCE_LICENSE='CC-BY-4.0'
SOURCE_NAME='common-pile/uspto_filtered'
SOURCE_VERSION='13894c5462467c843163693269d9266ec2c772b4'
SOURCE_URL='https://huggingface.co/datasets/common-pile/uspto_filtered'
SOURCE_CATEGORY='public-dataset'
SOURCE_LICENSE_DECLARATION='CC-BY-4.0'
SOURCE_LICENSE_URL='https://huggingface.co/datasets/common-pile/uspto_filtered/blob/13894c5462467c843163693269d9266ec2c772b4/README.md'
SOURCE_CONTENT_TYPES='patent applications
patents
technical literature'
SOURCE_LANGUAGES='en'
SOURCE_SELECTION='All 256 gzip JSONL artifacts at the pinned filtered Common Pile revision; every qualified record retains its USPTO identifier, Google Patents source, source-file provenance, publication date, language, and raw CC BY 4.0 declaration.'
SOURCE_COPYRIGHTED='no'
SOURCE_MACHINE_GENERATED='no'
SOURCE_ACQUISITION_BASIS='Public filtered release of United States patent grants and applications with per-record CC BY 4.0 declarations and source provenance.'
INPUT_TYPE='record-map'
INPUT_ON_EMPTY='skip'
INPUT_NUL='space'
INPUT_TEXT_FIELDS='text'
INPUT_ID='id'
INPUT_DATE='created'
INPUT_LICENSE='metadata.license'
INPUT_META_FIELDS='added=added
language=metadata.language
provenance=metadata.provenance
publication_date=metadata.publication_date
raw_license=metadata.license
source=source'
INPUT_LICENSE_INCLUDE='CC-BY-4.0'

FETCHER_OUTPUT=${1-}
FETCHER_ARGUMENT_COUNT=$#
FETCHER_SIZE='250G'
FETCH_METHOD='huggingface'
FETCH_SOURCE_PATH=''
FETCH_BASE_URL='https://huggingface.co'
FETCH_DATASET='common-pile/uspto_filtered'
FETCH_REVISION='13894c5462467c843163693269d9266ec2c772b4'
FETCH_SUFFIX='json.gz'
FETCH_PREFIX='USPTO-'

script_dir=$(CDPATH='' cd -- "$(dirname -- "$0")" && pwd -P)
. "$script_dir/../functions.sh"
fetcher_main
