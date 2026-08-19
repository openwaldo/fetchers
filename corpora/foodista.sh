#!/bin/sh
set -eu

CORPUS_ID='foodista'
CORPUS_TITLE='Foodista'
CORPUS_DESCRIPTION='Community-contributed cooking and food articles from Foodista, via the filtered Common Pile v0.1 release.'
CORPUS_DESTINATION='core/common-pile/foodista'

SOURCE_ID='foodista'
SOURCE_PATH=''
SOURCE_LICENSE='CC-BY-3.0'
SOURCE_NAME='common-pile/foodista_filtered'
SOURCE_URL='https://huggingface.co/datasets/common-pile/foodista_filtered'
SOURCE_CATEGORY='public-dataset'
SOURCE_LICENSE_DECLARATION='CC-BY-3.0'
SOURCE_LICENSE_URL='https://huggingface.co/datasets/common-pile/foodista_filtered'
INPUT_TYPE='record-map'
INPUT_ON_EMPTY='skip'
INPUT_TEXT_FIELDS='text'
INPUT_ID='id'
INPUT_DATE='created'
INPUT_LICENSE='metadata.license'
INPUT_SOURCE='source'
INPUT_META_FIELDS='url=metadata.url'

FETCHER_OUTPUT=${1-}
FETCHER_ARGUMENT_COUNT=$#
FETCHER_SIZE='10G'
FETCH_METHOD='download'
FETCH_URL='https://huggingface.co/datasets/common-pile/foodista_filtered/resolve/28ac18deab7ed2ec3580f4f13f0ed141e47957ef/foodista-dolma-0000.json.gz?download=true'
FETCH_PATH='foodista.jsonl.gz'
FETCH_SHA256='c39b3e7efc54ec03a38fbf2aa0e471d9bcb898879b2df1ff1e6646fdbcc4476f'

script_dir=$(CDPATH='' cd -- "$(dirname -- "$0")" && pwd -P)
. "$script_dir/../functions.sh"
fetcher_main
