#!/bin/sh
set -eu

CORPUS_ID='public-domain-review'
CORPUS_TITLE='The Public Domain Review'
CORPUS_DESCRIPTION='Essays on public-domain art, literature, and history from The Public Domain Review, via the filtered Common Pile v0.1 release.'
CORPUS_DESTINATION='core/common-pile/public-domain-review'

SOURCE_ID='public-domain-review'
SOURCE_PATH=''
SOURCE_LICENSE='CC-BY-SA-4.0'
SOURCE_NAME='common-pile/public_domain_review_filtered'
SOURCE_URL='https://huggingface.co/datasets/common-pile/public_domain_review_filtered'
SOURCE_CATEGORY='public-dataset'
SOURCE_LICENSE_DECLARATION='CC-BY-SA-4.0'
SOURCE_LICENSE_URL='https://huggingface.co/datasets/common-pile/public_domain_review_filtered'
INPUT_TYPE='record-map'
INPUT_ON_EMPTY='skip'
INPUT_TEXT_FIELDS='text'
INPUT_ID='id'
INPUT_DATE='created'
INPUT_LICENSE='metadata.license'
INPUT_SOURCE='source'
INPUT_META_FIELDS='url=metadata.url'

FETCHER_OUTPUT=${1-}
FETCHER_ARGUMENT_COUNT=$#
FETCHER_SIZE='10G'
FETCH_METHOD='download'
FETCH_URL='https://huggingface.co/datasets/common-pile/public_domain_review_filtered/resolve/ec81450d060d25c2bb01b9fb2d24399aeb37a3cc/public-domain-review-0000.json.gz?download=true'
FETCH_PATH='public-domain-review.jsonl.gz'
FETCH_SHA256='ea89ec2fbfacfe2e5d014a6ad500597c42f11ad01fe705eb0b6fdc38298b4d3a'

script_dir=$(CDPATH='' cd -- "$(dirname -- "$0")" && pwd -P)
. "$script_dir/../functions.sh"
fetcher_main
