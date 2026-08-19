#!/bin/sh
set -eu

CORPUS_ID='tulu3'
CORPUS_TITLE='Tulu 3 SFT Mixture'
CORPUS_DESCRIPTION='The pinned Tulu 3 supervised fine-tuning mixture preserved as structured messages with per-record source labels retained for downstream filtering.'
CORPUS_DESTINATION='post-train/sft/tulu3'

SOURCE_ID='tulu3'
SOURCE_PATH=''
SOURCE_LICENSE='ODC-BY-1.0'
SOURCE_NAME='allenai/tulu-3-sft-mixture'
SOURCE_VERSION='b14afda60f1bbebe55d5d2fa1e4df5042f97f8be'
SOURCE_URL='https://huggingface.co/datasets/allenai/tulu-3-sft-mixture'
SOURCE_CATEGORY='public-dataset'
SOURCE_LICENSE_DECLARATION='ODC-BY-1.0 collection; constituent datasets retain their own terms.'
SOURCE_LICENSE_URL='https://huggingface.co/datasets/allenai/tulu-3-sft-mixture/tree/b14afda60f1bbebe55d5d2fa1e4df5042f97f8be'
SOURCE_CONTENT_TYPES='instructions
model responses
multi-turn conversations'
SOURCE_SELECTION='All six pinned training Parquet shards. The upstream source label is retained so a compose can exclude duplicate or noncommercial subsets.'
SOURCE_COPYRIGHTED='true'
SOURCE_MACHINE_GENERATED='true'
SOURCE_PERSONAL_DATA='unknown'
SOURCE_ACQUISITION_BASIS='Public mixture assembled by Ai2 from multiple third-party instruction datasets; constituent terms require separate review.'
INPUT_TYPE='chat-messages'
INPUT_ON_EMPTY='skip'
INPUT_ID='id'
INPUT_SOURCE='source'
INPUT_MESSAGES_CONTENT='messages[].content'
INPUT_MESSAGES_ROLE='messages[].role'

FETCHER_OUTPUT=${1-}
FETCHER_ARGUMENT_COUNT=$#
FETCHER_SIZE='10G'
FETCH_METHOD='huggingface'
FETCH_SOURCE_PATH=''
FETCH_BASE_URL='https://huggingface.co'
FETCH_DATASET='allenai/tulu-3-sft-mixture'
FETCH_REVISION='b14afda60f1bbebe55d5d2fa1e4df5042f97f8be'
FETCH_SUFFIX='parquet'
FETCH_PREFIX='data/'

script_dir=$(CDPATH='' cd -- "$(dirname -- "$0")" && pwd -P)
. "$script_dir/../functions.sh"
fetcher_main
