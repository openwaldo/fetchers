#!/bin/sh
set -eu

CORPUS_ID='caselaw'
CORPUS_TITLE='United States Caselaw'
CORPUS_DESCRIPTION='Published decisions of United States federal and state courts, digitized by the Harvard Law School Library.'
CORPUS_DESTINATION='law/caselaw'

SOURCE_ID='caselaw'
SOURCE_PATH=''
SOURCE_LICENSE='LicenseRef-Public-Domain'
SOURCE_NAME='harvard-cap'
SOURCE_URL='https://static.case.law/'
SOURCE_CATEGORY='public-dataset'
SOURCE_LICENSE_DECLARATION='LicenseRef-Public-Domain'
SOURCE_LICENSE_URL='https://static.case.law/'
INPUT_TYPE='record-map'
INPUT_TEXT_FIELDS='casebody.head_matter
casebody.opinions[].text'
INPUT_DATE='decision_date'

FETCHER_OUTPUT=${1-}
FETCHER_ARGUMENT_COUNT=$#
FETCHER_SIZE='100G'
FETCH_METHOD='cap'
FETCH_ARG_COUNT='3'
FETCH_ARG_1=''
FETCH_ARG_2='https://static.case.law'
FETCH_ARG_3='-all'

script_dir=$(CDPATH='' cd -- "$(dirname -- "$0")" && pwd -P)
. "$script_dir/../functions.sh"
fetcher_main
