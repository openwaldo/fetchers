#!/bin/sh
set -eu

CORPUS_ID='hermes-function-calling'
CORPUS_TITLE='Hermes Function Calling'
CORPUS_DESCRIPTION='Structured multi-turn and single-turn function-calling conversations preserving tool definitions, calls, results, and final assistant responses.'
CORPUS_DESTINATION='post-train/sft/hermes-function-calling'

SOURCE_ID='hermes-function-calling'
SOURCE_PATH=''
SOURCE_LICENSE='Apache-2.0'
SOURCE_NAME='NousResearch/hermes-function-calling-v1'
SOURCE_VERSION='176b6a99207f758190477ac3f24d702154d0ff5d'
SOURCE_URL='https://huggingface.co/datasets/NousResearch/hermes-function-calling-v1'
SOURCE_CATEGORY='public-dataset'
SOURCE_LICENSE_DECLARATION='Apache-2.0'
SOURCE_LICENSE_URL='https://huggingface.co/datasets/NousResearch/hermes-function-calling-v1/tree/176b6a99207f758190477ac3f24d702154d0ff5d'
SOURCE_CONTENT_TYPES='assistant responses
tool calls
tool definitions
tool results'
SOURCE_SELECTION='The public auto-converted Parquet files for func_calling and func_calling_singleturn at immutable revision 176b6a99207f758190477ac3f24d702154d0ff5d.'
SOURCE_COPYRIGHTED='true'
SOURCE_MACHINE_GENERATED='true'
SOURCE_PERSONAL_DATA='unknown'
SOURCE_ACQUISITION_BASIS='Public synthetic function-calling conversations released by Nous Research.'
INPUT_TYPE='chat-messages'
INPUT_ON_EMPTY='skip'
INPUT_ID='id'
INPUT_META_FIELDS='category=category
subcategory=subcategory
task=task'
INPUT_MESSAGES_CONTENT='conversations[].value'
INPUT_MESSAGES_ROLE='conversations[].from'
INPUT_MESSAGES_TOOLS='tools'
INPUT_ROLE_ALIASES='human=user
gpt=assistant'

FETCHER_OUTPUT=${1-}
FETCHER_ARGUMENT_COUNT=$#
FETCHER_SIZE='250M'
FETCH_COUNT='2'
FETCH_1_METHOD='download'
FETCH_1_URL='https://huggingface.co/datasets/NousResearch/hermes-function-calling-v1/resolve/176b6a99207f758190477ac3f24d702154d0ff5d/func_calling/train/0000.parquet?download=true'
FETCH_1_PATH='func-calling-multiturn.parquet'
FETCH_1_SHA256='92dfe61a5a62506eb4ec3f31b6d523273846ed7a4f59abf90548b659814a6c01'

FETCH_2_METHOD='download'
FETCH_2_URL='https://huggingface.co/datasets/NousResearch/hermes-function-calling-v1/resolve/176b6a99207f758190477ac3f24d702154d0ff5d/func_calling_singleturn/train/0000.parquet?download=true'
FETCH_2_PATH='func-calling-singleturn.parquet'
FETCH_2_SHA256='654159e95aa7a6628df43afef954731a5164683d3d1d31d026ec10c57acd7e0c'

script_dir=$(CDPATH='' cd -- "$(dirname -- "$0")" && pwd -P)
. "$script_dir/../functions.sh"
fetcher_main
