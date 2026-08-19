#!/bin/sh
set -eu

CORPUS_ID='biodiversity-heritage-library'
CORPUS_TITLE='Biodiversity Heritage Library'
CORPUS_DESCRIPTION='Public-domain biodiversity books, journals, and archival documents from the filtered Common Pile release.'
CORPUS_DESTINATION='core/common-pile/biodiversity-heritage-library'

SOURCE_ID='biodiversity-heritage-library'
SOURCE_PATH=''
SOURCE_LICENSE='LicenseRef-Public-Domain'
SOURCE_NAME='common-pile/biodiversity_heritage_library_filtered'
SOURCE_VERSION='0486ed637d0d7aaff264bc77fe21a7444e0215cd'
SOURCE_URL='https://huggingface.co/datasets/common-pile/biodiversity_heritage_library_filtered'
SOURCE_CATEGORY='public-dataset'
SOURCE_LICENSE_DECLARATION='LicenseRef-Public-Domain'
SOURCE_LICENSE_URL='https://huggingface.co/datasets/common-pile/biodiversity_heritage_library_filtered/blob/0486ed637d0d7aaff264bc77fe21a7444e0215cd/README.md'
SOURCE_CONTENT_TYPES='books
cultural heritage
scientific literature'
SOURCE_LANGUAGES='en'
SOURCE_SELECTION='All 47 gzip JSONL artifacts at the pinned filtered Common Pile revision; the release declares 15,111,313 public-domain documents and retains original Biodiversity Heritage Library page URLs in record metadata.'
SOURCE_COPYRIGHTED='no'
SOURCE_MACHINE_GENERATED='unknown'
SOURCE_ACQUISITION_BASIS='Public dataset release created from the official Biodiversity Heritage Library bulk interface and filtered using the associated per-record license metadata.'
INPUT_TYPE='record-map'
INPUT_ON_EMPTY='skip'
INPUT_TEXT_FIELDS='text'
INPUT_TEXT_FALLBACK='metadata.url'
INPUT_ID='id'
INPUT_DATE='added'
INPUT_LICENSE='metadata.license'
INPUT_META_FIELDS='item_id=item_id
page_id=page_id
page_num=page_num
provenance=metadata.provenance
source=source
url=metadata.url'
INPUT_LICENSE_INCLUDE='LicenseRef-Public-Domain'

FETCHER_OUTPUT=${1-}
FETCHER_ARGUMENT_COUNT=$#
FETCHER_SIZE='50G'
FETCH_METHOD='huggingface'
FETCH_SOURCE_PATH=''
FETCH_BASE_URL='https://huggingface.co'
FETCH_DATASET='common-pile/biodiversity_heritage_library_filtered'
FETCH_REVISION='0486ed637d0d7aaff264bc77fe21a7444e0215cd'
FETCH_SUFFIX='json.gz'
FETCH_PREFIX=''

script_dir=$(CDPATH='' cd -- "$(dirname -- "$0")" && pwd -P)
. "$script_dir/../functions.sh"
fetcher_main
