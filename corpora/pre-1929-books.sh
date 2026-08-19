#!/bin/sh
set -eu

CORPUS_ID='pre-1929-books'
CORPUS_TITLE='Pre-1929 Public Library Books'
CORPUS_DESCRIPTION='Public-domain scans of books published before 1929 from the filtered Common Pile release.'
CORPUS_DESTINATION='core/common-pile/pre-1929-books'

SOURCE_ID='pre-1929-books'
SOURCE_PATH=''
SOURCE_LICENSE='LicenseRef-Public-Domain'
SOURCE_NAME='common-pile/pre_1929_books_filtered'
SOURCE_VERSION='23f9d96dbb1db3324bbc9fbfe1f8299cc799c4d1'
SOURCE_URL='https://huggingface.co/datasets/common-pile/pre_1929_books_filtered'
SOURCE_CATEGORY='public-dataset'
SOURCE_LICENSE_DECLARATION='LicenseRef-Public-Domain'
SOURCE_LICENSE_URL='https://huggingface.co/datasets/common-pile/pre_1929_books_filtered/blob/23f9d96dbb1db3324bbc9fbfe1f8299cc799c4d1/README.md'
SOURCE_CONTENT_TYPES='books
cultural heritage
scanned text'
SOURCE_LANGUAGES='multilingual'
SOURCE_SELECTION='All 26 gzip JSONL artifacts at the pinned filtered Common Pile revision; 124,898 records uniformly declare Public Domain and retain HathiTrust and Internet Archive identifiers, provenance, and original URLs. Exact canonical-text comparison found no overlap with the 77,587 committed Project Gutenberg records.'
SOURCE_COPYRIGHTED='no'
SOURCE_MACHINE_GENERATED='no'
SOURCE_ACQUISITION_BASIS='Public filtered release of pre-1929 Public Library books with per-record public-domain declarations and original HathiTrust and Internet Archive provenance.'
INPUT_TYPE='record-map'
INPUT_ON_EMPTY='skip'
INPUT_TEXT_FIELDS='text'
INPUT_TEXT_FALLBACK='metadata.title
metadata.author
metadata.ia_url
metadata.hathi_url'
INPUT_ID='id'
INPUT_DATE='added'
INPUT_META_FIELDS='author=metadata.author
hathi_url=metadata.hathi_url
htid=metadata.htid
ia_ark_id=metadata.ia_ark_id
ia_url=metadata.ia_url
language=metadata.language
place=metadata.place
provenance=metadata.provenance
raw_license=metadata.license
text_file_url=metadata.text_file_url
title=metadata.title
year=metadata.year'
INPUT_LICENSE_INCLUDE='LicenseRef-Public-Domain'

FETCHER_OUTPUT=${1-}
FETCHER_ARGUMENT_COUNT=$#
FETCHER_SIZE='100G'
FETCH_METHOD='huggingface'
FETCH_SOURCE_PATH=''
FETCH_BASE_URL='https://huggingface.co'
FETCH_DATASET='common-pile/pre_1929_books_filtered'
FETCH_REVISION='23f9d96dbb1db3324bbc9fbfe1f8299cc799c4d1'
FETCH_SUFFIX='json.gz'
FETCH_PREFIX=''

script_dir=$(CDPATH='' cd -- "$(dirname -- "$0")" && pwd -P)
. "$script_dir/../functions.sh"
fetcher_main
