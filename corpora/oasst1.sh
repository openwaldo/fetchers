#!/bin/sh
set -eu

CORPUS_ID='oasst1'
CORPUS_TITLE='OpenAssistant Conversations 1'
CORPUS_DESCRIPTION='Human-written and ranked multi-turn assistant conversations from OpenAssistant release 1, preserved as structured messages.'
CORPUS_DESTINATION='post-train/sft/oasst1'

SOURCE_ID='oasst1'
SOURCE_PATH=''
SOURCE_LICENSE='Apache-2.0'
SOURCE_NAME='OpenAssistant/oasst1'
SOURCE_URL='https://huggingface.co/datasets/OpenAssistant/oasst1'
SOURCE_CATEGORY='public-dataset'
SOURCE_LICENSE_DECLARATION='Apache-2.0'
SOURCE_LICENSE_URL='https://huggingface.co/datasets/OpenAssistant/oasst1'
INPUT_TYPE='ranked-conversation-tree'
INPUT_ID='message_tree_id'
INPUT_LANGUAGE='lang'
INPUT_TREE_ROOT='prompt'
INPUT_TREE_REPLIES='replies'
INPUT_TREE_TEXT='text'
INPUT_TREE_ROLE='role'
INPUT_TREE_ASSISTANT_ROLE='assistant'
INPUT_TREE_RANK='rank'
INPUT_TREE_MISSING_RANK='source-order'

FETCHER_OUTPUT=${1-}
FETCHER_ARGUMENT_COUNT=$#
FETCHER_SIZE='25M'
FETCH_METHOD='download'
FETCH_URL='https://huggingface.co/datasets/OpenAssistant/oasst1/resolve/fdf72ae0827c1cda404aff25b6603abec9e3399b/2023-04-12_oasst_ready.trees.jsonl.gz?download=true'
FETCH_PATH='oasst1-ready-trees.jsonl.gz'
FETCH_SHA256='2a9a8fd343e9b28e04a895a669d3253f82d93e9c174d440199ae19d5fafbdff7'

script_dir=$(CDPATH='' cd -- "$(dirname -- "$0")" && pwd -P)
. "$script_dir/../functions.sh"
fetcher_main
