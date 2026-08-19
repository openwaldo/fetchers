#!/bin/sh
set -eu

CORPUS_ID='library-of-congress'
CORPUS_TITLE='Library of Congress Books'
CORPUS_DESCRIPTION='Public-domain Library of Congress book text from the filtered Common Pile release.'
CORPUS_DESTINATION='government/library-of-congress'

SOURCE_ID='library-of-congress'
SOURCE_PATH=''
SOURCE_LICENSE='LicenseRef-Public-Domain'
SOURCE_NAME='common-pile/library_of_congress_filtered'
SOURCE_VERSION='56725c7aa1bb320703e22eb5f42903173d5bac3d'
SOURCE_URL='https://huggingface.co/datasets/common-pile/library_of_congress_filtered'
SOURCE_CATEGORY='public-dataset'
SOURCE_LICENSE_DECLARATION='LicenseRef-Public-Domain'
SOURCE_LICENSE_URL='https://huggingface.co/datasets/common-pile/library_of_congress_filtered/blob/56725c7aa1bb320703e22eb5f42903173d5bac3d/README.md'
SOURCE_CONTENT_TYPES='books
cultural heritage
library collections'
SOURCE_LANGUAGES='en'
SOURCE_SELECTION='All 25 gzip JSONL artifacts at the pinned filtered Common Pile revision; all 129,052 records declare Public Domain and retain original Library of Congress item and text URLs in upstream metadata.'
SOURCE_COPYRIGHTED='no'
SOURCE_MACHINE_GENERATED='unknown'
SOURCE_ACQUISITION_BASIS='Public dataset release at the pinned revision with uniform per-record public-domain declarations and Library of Congress provenance.'
INPUT_TYPE='record-map'
INPUT_ON_EMPTY='skip'
INPUT_TEXT_FIELDS='text'
INPUT_ID='id'
INPUT_DATE='metadata.year'
INPUT_LICENSE='metadata.license'
INPUT_LICENSE_INCLUDE='LicenseRef-Public-Domain'

FETCHER_OUTPUT=${1-}
FETCHER_ARGUMENT_COUNT=$#
FETCHER_SIZE='50G'
FETCH_METHOD='huggingface'
FETCH_SOURCE_PATH=''
FETCH_BASE_URL='https://huggingface.co'
FETCH_DATASET='common-pile/library_of_congress_filtered'
FETCH_REVISION='56725c7aa1bb320703e22eb5f42903173d5bac3d'
FETCH_SUFFIX='json.gz'
FETCH_PREFIX=''

script_dir=$(CDPATH='' cd -- "$(dirname -- "$0")" && pwd -P)
. "$script_dir/../functions.sh"
fetcher_main
