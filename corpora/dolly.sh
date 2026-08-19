#!/bin/sh
set -eu

CORPUS_ID='dolly'
CORPUS_TITLE='Databricks Dolly'
CORPUS_DESCRIPTION='Human-written instruction and response pairs from Databricks employees, preserved as structured messages.'
CORPUS_DESTINATION='post-train/sft/dolly'

SOURCE_ID='dolly'
SOURCE_PATH=''
SOURCE_LICENSE='CC-BY-SA-3.0'
SOURCE_NAME='databricks/databricks-dolly-15k'
SOURCE_URL='https://huggingface.co/datasets/databricks/databricks-dolly-15k'
SOURCE_CATEGORY='public-dataset'
SOURCE_LICENSE_DECLARATION='CC-BY-SA-3.0'
SOURCE_LICENSE_URL='https://huggingface.co/datasets/databricks/databricks-dolly-15k'
INPUT_TYPE='dialogue-pair'
INPUT_TEXT_FIELDS='instruction'
INPUT_CONTEXT='context'
INPUT_RESPONSE='response'

FETCHER_OUTPUT=${1-}
FETCHER_ARGUMENT_COUNT=$#
FETCHER_SIZE='25M'
FETCH_METHOD='huggingface'
FETCH_SOURCE_PATH=''
FETCH_BASE_URL='https://huggingface.co'
FETCH_DATASET='databricks/databricks-dolly-15k'
FETCH_REVISION='bdd27f4d94b9c1f951818a7da7fd7aeea5dbff1a'
FETCH_SUFFIX='jsonl'
FETCH_PREFIX=''

script_dir=$(CDPATH='' cd -- "$(dirname -- "$0")" && pwd -P)
. "$script_dir/../functions.sh"
fetcher_main
