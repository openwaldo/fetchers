#!/bin/sh
set -eu

CORPUS_ID='gutenberg'
CORPUS_TITLE='Project Gutenberg'
CORPUS_DESCRIPTION='Public-domain books transcribed and proofread by Project Gutenberg volunteers.'
CORPUS_DESTINATION='core/books/gutenberg'

SOURCE_ID='gutenberg'
SOURCE_PATH=''
SOURCE_LICENSE='CC0-1.0'
SOURCE_NAME='gutenberg'
SOURCE_URL='https://www.gutenberg.org/'
SOURCE_CATEGORY='public-dataset'
SOURCE_LICENSE_DECLARATION='CC0-1.0'
SOURCE_LICENSE_URL='https://www.gutenberg.org/'
INPUT_TYPE='bounded-text'
INPUT_ON_EMPTY='skip'
INPUT_BOUNDS_START='(?m)^\*\*\*\s*START OF (?:THE|THIS) PROJECT GUTENBERG EBOOK[^\n]*$'
INPUT_BOUNDS_END='(?m)^[ \t]*\*\*\*\s*END OF (?:THE|THIS) PROJECT GUTENBERG EBOOK[^\n]*$'

FETCHER_OUTPUT=${1-}
FETCHER_ARGUMENT_COUNT=$#
FETCHER_SIZE='100G'
FETCH_METHOD='gutenberg'
FETCH_ARG_COUNT='5'
FETCH_ARG_1=''
FETCH_ARG_2='https://www.gutenberg.org'
FETCH_ARG_3='-all'
FETCH_ARG_4='-exclude-ids'
FETCH_ARG_5='673'

script_dir=$(CDPATH='' cd -- "$(dirname -- "$0")" && pwd -P)
. "$script_dir/../functions.sh"
fetcher_main
