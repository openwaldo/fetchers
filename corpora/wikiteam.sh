#!/bin/sh
set -eu

CORPUS_ID='wikiteam'
CORPUS_TITLE='WikiTeam Archives'
CORPUS_DESCRIPTION='Text recovered from independently archived wikis, via the filtered Common Pile v0.1 release.'
CORPUS_DESTINATION='core/common-pile/wikiteam'

SOURCE_ID='wikiteam'
SOURCE_PATH=''
SOURCE_LICENSE='CC-BY-SA-3.0'
SOURCE_NAME='common-pile/wikiteam_filtered'
SOURCE_URL='https://huggingface.co/datasets/common-pile/wikiteam_filtered'
SOURCE_CATEGORY='public-dataset'
SOURCE_LICENSE_DECLARATION='CC-BY-SA-3.0'
SOURCE_LICENSE_URL='https://huggingface.co/datasets/common-pile/wikiteam_filtered'
INPUT_TYPE='record-map'
INPUT_ON_EMPTY='skip'
INPUT_TEXT_FIELDS='text'
INPUT_ID='id'
INPUT_DATE='created'
INPUT_LICENSE='metadata.license'
INPUT_SOURCE='source'
INPUT_META_FIELDS='namespace=metadata.namespace
title=metadata.title
url=metadata.url
wiki=metadata.wiki'

FETCHER_OUTPUT=${1-}
FETCHER_ARGUMENT_COUNT=$#
FETCHER_SIZE='50G'
FETCH_METHOD='huggingface'
FETCH_SOURCE_PATH=''
FETCH_BASE_URL='https://huggingface.co'
FETCH_DATASET='common-pile/wikiteam_filtered'
FETCH_REVISION='f4ed055b57763a8f12238824140914b9eb098cab'
FETCH_SUFFIX='json.gz'
FETCH_PREFIX=''

script_dir=$(CDPATH='' cd -- "$(dirname -- "$0")" && pwd -P)
. "$script_dir/../functions.sh"
fetcher_main
