#!/bin/sh
set -eu

CORPUS_ID='uk-hansard'
CORPUS_TITLE='UK Parliament Hansard'
CORPUS_DESCRIPTION='Official reports of debates in the United Kingdom Parliament, via the filtered Common Pile v0.1 release.'
CORPUS_DESTINATION='government/uk-hansard'

SOURCE_ID='uk-hansard'
SOURCE_PATH=''
SOURCE_LICENSE='LicenseRef-Open-Parliament-Licence'
SOURCE_NAME='common-pile/uk_hansard_filtered'
SOURCE_URL='https://huggingface.co/datasets/common-pile/uk_hansard_filtered'
SOURCE_CATEGORY='public-dataset'
SOURCE_LICENSE_DECLARATION='LicenseRef-Open-Parliament-Licence'
SOURCE_LICENSE_URL='https://huggingface.co/datasets/common-pile/uk_hansard_filtered'
INPUT_TYPE='record-map'
INPUT_ON_EMPTY='skip'
INPUT_TEXT_FIELDS='text'

FETCHER_OUTPUT=${1-}
FETCHER_ARGUMENT_COUNT=$#
FETCHER_SIZE='50G'
FETCH_COUNT='4'
FETCH_1_METHOD='download'
FETCH_1_URL='https://huggingface.co/datasets/common-pile/uk_hansard_filtered/resolve/c88adc44309aa255a41b51cef93ba783f775fe23/uk_hansard-0000.json.gz?download=true'
FETCH_1_PATH='uk-hansard-0000.jsonl.gz'
FETCH_1_SHA256='ce9c35eb800d385f2f163a190227ed4031f9b6d73d386098ad5a4b76b1829812'

FETCH_2_METHOD='download'
FETCH_2_URL='https://huggingface.co/datasets/common-pile/uk_hansard_filtered/resolve/c88adc44309aa255a41b51cef93ba783f775fe23/uk_hansard-0001.json.gz?download=true'
FETCH_2_PATH='uk-hansard-0001.jsonl.gz'
FETCH_2_SHA256='325542421788aa6afe305eb62b56420335affc4af59258cd223545b11d445056'

FETCH_3_METHOD='download'
FETCH_3_URL='https://huggingface.co/datasets/common-pile/uk_hansard_filtered/resolve/c88adc44309aa255a41b51cef93ba783f775fe23/uk_hansard-0002.json.gz?download=true'
FETCH_3_PATH='uk-hansard-0002.jsonl.gz'
FETCH_3_SHA256='35ef9c775a3bcc8f551159b75afa35d9a515f86cfb570711491e617968c1fe8c'

FETCH_4_METHOD='download'
FETCH_4_URL='https://huggingface.co/datasets/common-pile/uk_hansard_filtered/resolve/c88adc44309aa255a41b51cef93ba783f775fe23/uk_hansard-0003.json.gz?download=true'
FETCH_4_PATH='uk-hansard-0003.jsonl.gz'
FETCH_4_SHA256='cb37f5a6f066776e1642e832d549296c2c8bdc9ebabb5e57e7c3f33d0642471f'

script_dir=$(CDPATH='' cd -- "$(dirname -- "$0")" && pwd -P)
. "$script_dir/../functions.sh"
fetcher_main
