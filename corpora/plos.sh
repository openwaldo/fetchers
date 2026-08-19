#!/bin/sh
set -eu

CORPUS_ID='plos'
CORPUS_TITLE='PLOS Articles'
CORPUS_DESCRIPTION='Peer-reviewed research articles published by the Public Library of Science.'
CORPUS_DESTINATION='science/plos'

SOURCE_ID='plos'
SOURCE_PATH=''
SOURCE_LICENSE='CC-BY-4.0'
SOURCE_NAME='plos'
SOURCE_URL='https://allof.plos.org/allofplos.zip'
SOURCE_CATEGORY='public-dataset'
SOURCE_LICENSE_DECLARATION='CC-BY-4.0'
SOURCE_LICENSE_URL='https://allof.plos.org/allofplos.zip'
INPUT_TYPE='xml-record'
INPUT_TEXT_FIELDS='/article/front/article-meta/title-group/article-title
/article/front/article-meta/abstract
/article/body'
INPUT_META_FIELDS='journal=/article/front/journal-meta/journal-title-group/journal-title'
INPUT_XML_ON_MALFORMED='skip'
INPUT_XML_EXCLUDE='//sub-article
//table-wrap
//fig
//disp-formula
//inline-formula
//tex-math
//math
//supplementary-material
//ref-list
//object-id
//graphic
//media
//front-stub'

FETCHER_OUTPUT=${1-}
FETCHER_ARGUMENT_COUNT=$#
FETCHER_SIZE='50G'
FETCH_COUNT='2'
FETCH_1_METHOD='download'
FETCH_1_URL='https://allof.plos.org/allofplos.zip'
FETCH_1_PATH='allofplos.zip'
FETCH_1_SHA256=''

FETCH_2_METHOD='zip_extract'
FETCH_2_ARG_COUNT='4'
FETCH_2_ARG_1=''
FETCH_2_ARG_2='allofplos.zip'
FETCH_2_ARG_3='.xml'
FETCH_2_ARG_4='articles'

script_dir=$(CDPATH='' cd -- "$(dirname -- "$0")" && pwd -P)
. "$script_dir/../functions.sh"
fetcher_main
