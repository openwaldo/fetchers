#!/bin/sh
set -eu

CORPUS_ID='interaction-contract'
CORPUS_TITLE='OpenWALDO Interaction Contract v1'
CORPUS_DESCRIPTION='OpenWALDO-maintained interaction corpus with 45,000 structured-message training examples across 21 portable conversation and tool-behavior categories.'
CORPUS_DESTINATION='post-train/sft/interaction-contract-v1'

SOURCE_ID='interaction-contract'
SOURCE_PATH='source'
SOURCE_LICENSE='Apache-2.0'
SOURCE_NAME='openwaldo/post-training-data'
SOURCE_VERSION='8d2454f2625a85d911cd7810816e489f0ebb1448'
SOURCE_URL='https://github.com/openwaldo/post-training-data'
SOURCE_CATEGORY='public-dataset'
SOURCE_LICENSE_DECLARATION='Apache License 2.0, declared in the repository LICENSE file.'
SOURCE_LICENSE_URL='https://github.com/openwaldo/post-training-data/blob/8d2454f2625a85d911cd7810816e489f0ebb1448/LICENSE'
SOURCE_CONTENT_TYPES='instruction and response pairs
interaction behavior
supervised fine-tuning'
SOURCE_LANGUAGES='en'
SOURCE_SELECTION='The 18 interaction-contract-v1 training JSONL shards only; typed messages remain in the source rows while validation, evaluation, documentation, and repository administration files are excluded.'
SOURCE_COPYRIGHTED='true'
SOURCE_MACHINE_GENERATED='true'
SOURCE_PERSONAL_DATA='false'
SOURCE_ACQUISITION_BASIS='OpenWALDO project-authored, AI-assisted candidate training data requiring human review before production; generation details are retained in the source repository because recipe schema 1 does not accept the synthetic source category.'
INPUT_TYPE='dialogue-pair'
INPUT_TEXT_FIELDS='prompt'
INPUT_ID='id'
INPUT_RESPONSE='response'

FETCHER_OUTPUT=${1-}
FETCHER_ARGUMENT_COUNT=$#
FETCHER_SIZE='25M'
FETCH_METHOD='git'
FETCH_PATH='source'
FETCH_URL='https://github.com/openwaldo/post-training-data.git'
FETCH_REF='8d2454f2625a85d911cd7810816e489f0ebb1448'
FETCH_REVISION='8d2454f2625a85d911cd7810816e489f0ebb1448'
FETCH_OPTIONS='(glob)data/sft/interaction-contract-v1/train/*.jsonl'

script_dir=$(CDPATH='' cd -- "$(dirname -- "$0")" && pwd -P)
. "$script_dir/../functions.sh"
fetcher_main
