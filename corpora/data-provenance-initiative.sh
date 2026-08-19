#!/bin/sh
set -eu

CORPUS_ID='data-provenance-initiative'
CORPUS_TITLE='Data Provenance Initiative'
CORPUS_DESCRIPTION='Openly licensed English and code datasets audited by the Data Provenance Initiative, via the filtered Common Pile release.'
CORPUS_DESTINATION='core/common-pile/data-provenance-initiative'

SOURCE_ID='data-provenance-initiative'
SOURCE_PATH=''
SOURCE_LICENSE='LicenseRef-Mixed'
SOURCE_NAME='common-pile/data_provenance_initiative_filtered'
SOURCE_VERSION='8f5afcf585e4618ff12f5b6d49cb5242faf5afbd'
SOURCE_URL='https://huggingface.co/datasets/common-pile/data_provenance_initiative_filtered'
SOURCE_CATEGORY='public-dataset'
SOURCE_LICENSE_DECLARATION='LicenseRef-Mixed'
SOURCE_LICENSE_URL='https://huggingface.co/datasets/common-pile/data_provenance_initiative_filtered/blob/8f5afcf585e4618ff12f5b6d49cb5242faf5afbd/README.md'
SOURCE_CONTENT_TYPES='datasets
developer data
question answering'
SOURCE_LANGUAGES='en'
SOURCE_SELECTION='All three gzip JSONL artifacts at the pinned filtered Common Pile revision; all 3,508,390 records retain an original dataset identifier and URL. Each upstream license array is preserved and represented conservatively as a deterministic conjunction of its normalized terms.'
SOURCE_COPYRIGHTED='yes'
SOURCE_MACHINE_GENERATED='no'
SOURCE_ACQUISITION_BASIS='Public filtered release derived from the Data Provenance Initiative audit, with per-record original-source and license evidence.'
INPUT_TYPE='record-map'
INPUT_ON_EMPTY='skip'
INPUT_NUL='space'
INPUT_TEXT_FIELDS='text'
INPUT_ID='metadata.url'
INPUT_DATE='added'
INPUT_LICENSE='metadata.license[]'
INPUT_META_FIELDS='dataset_id=metadata.dataset_id
languages=metadata.language[]
license_url=metadata.license_url
record_id=id'
INPUT_LICENSE_INCLUDE='Apache-2.0
Apache-2.0 AND BSD-2-Clause AND BSD-3-Clause AND CC0-1.0 AND ISC AND MIT
Apache-2.0 AND BSD-2-Clause AND BSD-3-Clause AND ISC AND MIT
Apache-2.0 AND BSD-2-Clause AND BSD-3-Clause AND MIT
Apache-2.0 AND BSD-2-Clause AND MIT
Apache-2.0 AND BSD-3-Clause
Apache-2.0 AND BSD-3-Clause AND CC0-1.0 AND MIT
Apache-2.0 AND BSD-3-Clause AND MIT
Apache-2.0 AND CDLA-Permissive-1.0
Apache-2.0 AND CC-BY-3.0
Apache-2.0 AND CC-BY-4.0
Apache-2.0 AND CC-BY-SA-3.0
Apache-2.0 AND CC-BY-SA-4.0
Apache-2.0 AND CC0-1.0
Apache-2.0 AND CC0-1.0 AND MIT
Apache-2.0 AND MIT
BSD-2-Clause
BSD-2-Clause AND BSD-3-Clause AND MIT
BSD-2-Clause AND CC0-1.0 AND MIT
BSD-2-Clause AND ISC AND MIT
BSD-2-Clause AND MIT
BSD-3-Clause
BSD-3-Clause AND MIT
CC-BY-3.0
CC-BY-4.0
CC-BY-4.0 AND MIT
CC-BY-SA-3.0
CC-BY-SA-3.0 AND MIT
CC-BY-SA-4.0
CC-BY-SA-4.0 AND MIT
CC0-1.0
CC0-1.0 AND MIT
ISC AND MIT
MIT'

FETCHER_OUTPUT=${1-}
FETCHER_ARGUMENT_COUNT=$#
FETCHER_SIZE='50G'
FETCH_METHOD='huggingface'
FETCH_SOURCE_PATH=''
FETCH_BASE_URL='https://huggingface.co'
FETCH_DATASET='common-pile/data_provenance_initiative_filtered'
FETCH_REVISION='8f5afcf585e4618ff12f5b6d49cb5242faf5afbd'
FETCH_SUFFIX='json.gz'
FETCH_PREFIX=''

script_dir=$(CDPATH='' cd -- "$(dirname -- "$0")" && pwd -P)
. "$script_dir/../functions.sh"
fetcher_main
