#!/bin/sh
set -eu

CORPUS_ID='python-enhancement-proposals'
CORPUS_TITLE='Python Enhancement Proposals'
CORPUS_DESCRIPTION='Technical specifications and rationale for Python language features, via the filtered Common Pile v0.1 release.'
CORPUS_DESTINATION='core/common-pile/python-enhancement-proposals'

SOURCE_ID='python-enhancement-proposals'
SOURCE_PATH=''
SOURCE_LICENSE='LicenseRef-Public-Domain'
SOURCE_NAME='common-pile/python_enhancement_proposals_filtered'
SOURCE_URL='https://huggingface.co/datasets/common-pile/python_enhancement_proposals_filtered'
SOURCE_CATEGORY='public-dataset'
SOURCE_LICENSE_DECLARATION='LicenseRef-Public-Domain'
SOURCE_LICENSE_URL='https://huggingface.co/datasets/common-pile/python_enhancement_proposals_filtered'
INPUT_TYPE='record-map'
INPUT_ON_EMPTY='skip'
INPUT_TEXT_FIELDS='text'
INPUT_ID='id'
INPUT_DATE='created'
INPUT_LICENSE='metadata.license'
INPUT_SOURCE='source'
INPUT_META_FIELDS='pep_number=metadata.pep_number
url=metadata.url'

FETCHER_OUTPUT=${1-}
FETCHER_ARGUMENT_COUNT=$#
FETCHER_SIZE='5M'
FETCH_METHOD='download'
FETCH_URL='https://huggingface.co/datasets/common-pile/python_enhancement_proposals_filtered/resolve/cfd1b2c53646bcf2148f77315db704214dcb7743/peps-dolma-0000.json.gz?download=true'
FETCH_PATH='peps.jsonl.gz'
FETCH_SHA256='4bb61eded5168ac7f0059a92ed242577c67e4fced8c0d019c84bfaca5596c791'

script_dir=$(CDPATH='' cd -- "$(dirname -- "$0")" && pwd -P)
. "$script_dir/../functions.sh"
fetcher_main
