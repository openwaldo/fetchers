#!/bin/sh
set -eu

CORPUS_ID='pressbooks'
CORPUS_TITLE='PressBooks'
CORPUS_DESCRIPTION='Open-access book sections from PressBooks, via the filtered Common Pile release.'
CORPUS_DESTINATION='core/common-pile/pressbooks'

SOURCE_ID='pressbooks'
SOURCE_PATH=''
SOURCE_LICENSE='LicenseRef-Mixed'
SOURCE_NAME='common-pile/pressbooks_filtered'
SOURCE_VERSION='1a1d3b50d77f834370f8eb4c0d174668dd1676bb'
SOURCE_URL='https://huggingface.co/datasets/common-pile/pressbooks_filtered'
SOURCE_CATEGORY='public-dataset'
SOURCE_LICENSE_DECLARATION='LicenseRef-Mixed'
SOURCE_LICENSE_URL='https://huggingface.co/datasets/common-pile/pressbooks_filtered/blob/1a1d3b50d77f834370f8eb4c0d174668dd1676bb/README.md'
SOURCE_CONTENT_TYPES='books
open educational resources'
SOURCE_LANGUAGES='en'
SOURCE_SELECTION='All gzip JSONL artifacts at the pinned filtered Common Pile revision whose per-record license normalizes to one of the four enumerated accepted values.'
SOURCE_COPYRIGHTED='yes'
SOURCE_MACHINE_GENERATED='unknown'
SOURCE_ACQUISITION_BASIS='Public dataset release at the pinned revision with per-record license evidence.'
INPUT_TYPE='record-map'
INPUT_ON_EMPTY='skip'
INPUT_TEXT_FIELDS='text'
INPUT_ID='id'
INPUT_DATE='created'
INPUT_LICENSE='metadata.license'
INPUT_LICENSE_INCLUDE='CC-BY-4.0
CC-BY-SA-4.0
CC0-1.0
LicenseRef-Public-Domain'

FETCHER_OUTPUT=${1-}
FETCHER_ARGUMENT_COUNT=$#
FETCHER_SIZE='10G'
FETCH_METHOD='huggingface'
FETCH_SOURCE_PATH=''
FETCH_BASE_URL='https://huggingface.co'
FETCH_DATASET='common-pile/pressbooks_filtered'
FETCH_REVISION='1a1d3b50d77f834370f8eb4c0d174668dd1676bb'
FETCH_SUFFIX='json.gz'
FETCH_PREFIX=''

script_dir=$(CDPATH='' cd -- "$(dirname -- "$0")" && pwd -P)
. "$script_dir/../functions.sh"
fetcher_main
