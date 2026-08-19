#!/bin/sh
set -eu

CORPUS_ID='mathlib'
CORPUS_TITLE='Lean Mathlib'
CORPUS_DESCRIPTION='Formalized definitions, theorems, and proofs from the Mathlib library for Lean 4, release v4.32.2.'
CORPUS_DESTINATION='math/mathlib'

SOURCE_ID='mathlib'
SOURCE_PATH='source'
SOURCE_LICENSE='Apache-2.0'
SOURCE_NAME='mathlib'
SOURCE_VERSION='905b95818eb32af7874a58b427f50c1711a5e96c'
SOURCE_URL='https://github.com/leanprover-community/mathlib4'
SOURCE_CATEGORY='public-dataset'
SOURCE_LICENSE_DECLARATION='Apache-2.0'
SOURCE_LICENSE_URL='https://github.com/leanprover-community/mathlib4'

FETCHER_OUTPUT=${1-}
FETCHER_ARGUMENT_COUNT=$#
FETCHER_SIZE='50G'
FETCH_METHOD='git'
FETCH_PATH='source'
FETCH_URL='https://github.com/leanprover-community/mathlib4.git'
FETCH_REF='refs/tags/v4.32.2'
FETCH_REVISION='905b95818eb32af7874a58b427f50c1711a5e96c'
FETCH_OPTIONS='(glob)Mathlib/**/*.lean'

script_dir=$(CDPATH='' cd -- "$(dirname -- "$0")" && pwd -P)
. "$script_dir/../functions.sh"
fetcher_main
