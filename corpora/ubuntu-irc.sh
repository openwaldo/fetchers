#!/bin/sh
set -eu

CORPUS_ID='ubuntu-irc'
CORPUS_TITLE='Ubuntu IRC Logs'
CORPUS_DESCRIPTION='Public Ubuntu community IRC conversations, via the filtered Common Pile v0.1 release.'
CORPUS_DESTINATION='core/common-pile/ubuntu-irc'

SOURCE_ID='ubuntu-irc'
SOURCE_PATH=''
SOURCE_LICENSE='CC0-1.0'
SOURCE_NAME='common-pile/ubuntu_irc_filtered'
SOURCE_URL='https://huggingface.co/datasets/common-pile/ubuntu_irc_filtered'
SOURCE_CATEGORY='public-dataset'
SOURCE_LICENSE_DECLARATION='CC0-1.0'
SOURCE_LICENSE_URL='https://huggingface.co/datasets/common-pile/ubuntu_irc_filtered'
INPUT_TYPE='record-map'
INPUT_ON_EMPTY='skip'
INPUT_NUL='space'
INPUT_TEXT_FIELDS='text'

FETCHER_OUTPUT=${1-}
FETCHER_ARGUMENT_COUNT=$#
FETCHER_SIZE='50G'
FETCH_COUNT='3'
FETCH_1_METHOD='download'
FETCH_1_URL='https://huggingface.co/datasets/common-pile/ubuntu_irc_filtered/resolve/84f88c986584f11d672befab542fa4d5123f3e8f/ubuntu-chat-dolma-0000.json.gz?download=true'
FETCH_1_PATH='ubuntu-irc-0000.jsonl.gz'
FETCH_1_SHA256='133eb85b084f508eda1d2dac3b0c22c68f3d6e230cde237b8d0ec3c2804e24e2'

FETCH_2_METHOD='download'
FETCH_2_URL='https://huggingface.co/datasets/common-pile/ubuntu_irc_filtered/resolve/84f88c986584f11d672befab542fa4d5123f3e8f/ubuntu-chat-dolma-0001.json.gz?download=true'
FETCH_2_PATH='ubuntu-irc-0001.jsonl.gz'
FETCH_2_SHA256='493f012a4de1b5395862931028646b9113de9a943291016280d5b1cc91b18d5d'

FETCH_3_METHOD='download'
FETCH_3_URL='https://huggingface.co/datasets/common-pile/ubuntu_irc_filtered/resolve/84f88c986584f11d672befab542fa4d5123f3e8f/ubuntu-chat-dolma-0002.json.gz?download=true'
FETCH_3_PATH='ubuntu-irc-0002.jsonl.gz'
FETCH_3_SHA256='ef909f7fe32e5f0032748fc945f78891eec05cb565548c2a217bfee17e791d62'

script_dir=$(CDPATH='' cd -- "$(dirname -- "$0")" && pwd -P)
. "$script_dir/../functions.sh"
fetcher_main
