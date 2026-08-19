#!/bin/sh
set -eu

CORPUS_ID='ultrachat-200k'
CORPUS_TITLE='UltraChat 200k SFT'
CORPUS_DESCRIPTION='Curated multi-turn assistant conversations from the UltraChat 200k supervised fine-tuning split, preserved as structured messages.'
CORPUS_DESTINATION='post-train/sft/ultrachat-200k'

SOURCE_ID='ultrachat-200k'
SOURCE_PATH=''
SOURCE_LICENSE='MIT'
SOURCE_NAME='HuggingFaceH4/ultrachat_200k'
SOURCE_VERSION='8049631c405ae6576f93f445c6b8166f76f5505a'
SOURCE_URL='https://huggingface.co/datasets/HuggingFaceH4/ultrachat_200k'
SOURCE_CATEGORY='public-dataset'
SOURCE_LICENSE_DECLARATION='MIT'
SOURCE_LICENSE_URL='https://huggingface.co/datasets/HuggingFaceH4/ultrachat_200k/tree/8049631c405ae6576f93f445c6b8166f76f5505a'
SOURCE_CONTENT_TYPES='multi-turn conversations
synthetic responses'
SOURCE_LANGUAGES='en'
SOURCE_SELECTION='The three pinned train_sft Parquet shards only; test_sft and generation splits are excluded.'
SOURCE_COPYRIGHTED='true'
SOURCE_MACHINE_GENERATED='true'
SOURCE_PERSONAL_DATA='unknown'
SOURCE_ACQUISITION_BASIS='Public supervised fine-tuning release curated from UltraChat generations.'
INPUT_TYPE='chat-messages'
INPUT_ON_EMPTY='skip'
INPUT_ID='prompt_id'
INPUT_MESSAGES_CONTENT='messages[].content'
INPUT_MESSAGES_ROLE='messages[].role'

FETCHER_OUTPUT=${1-}
FETCHER_ARGUMENT_COUNT=$#
FETCHER_SIZE='250M'
FETCH_COUNT='3'
FETCH_1_METHOD='download'
FETCH_1_URL='https://huggingface.co/datasets/HuggingFaceH4/ultrachat_200k/resolve/8049631c405ae6576f93f445c6b8166f76f5505a/data/train_sft-00000-of-00003-a3ecf92756993583.parquet?download=true'
FETCH_1_PATH='train_sft-00000.parquet'
FETCH_1_SHA256='afa8fa7426081b2a0e732fb50dbb5cd402a28ad5f0dbe66c0d996d63e7220727'

FETCH_2_METHOD='download'
FETCH_2_URL='https://huggingface.co/datasets/HuggingFaceH4/ultrachat_200k/resolve/8049631c405ae6576f93f445c6b8166f76f5505a/data/train_sft-00001-of-00003-0a1804bcb6ae68c6.parquet?download=true'
FETCH_2_PATH='train_sft-00001.parquet'
FETCH_2_SHA256='c8230190bc8b29084c974ff32f05589b458fad1908fc4b2fb2b9e1e9f7921f03'

FETCH_3_METHOD='download'
FETCH_3_URL='https://huggingface.co/datasets/HuggingFaceH4/ultrachat_200k/resolve/8049631c405ae6576f93f445c6b8166f76f5505a/data/train_sft-00002-of-00003-ee46ed25cfae92c6.parquet?download=true'
FETCH_3_PATH='train_sft-00002.parquet'
FETCH_3_SHA256='6fe7d2a5e95cf660f972ecaf304aa5632d7f53384e4b0e0d0f44d9c96733c03e'

script_dir=$(CDPATH='' cd -- "$(dirname -- "$0")" && pwd -P)
. "$script_dir/../functions.sh"
fetcher_main
