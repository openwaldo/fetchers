#!/bin/sh
set -eu

CORPUS_ID='python-mailing-lists'
CORPUS_TITLE='Python Community Mailing Lists'
CORPUS_DESCRIPTION='Checksum-pinned Python development, user, and learning-support discussions from official monthly HyperKitty mbox exports.'
CORPUS_DESTINATION='community/python-mailing-lists'

SOURCE_COUNT='3'
SOURCE_1_ID='python-list'
SOURCE_1_PATH='python-list'
SOURCE_1_LICENSE='LicenseRef-Publicly-Archived-Forum'
SOURCE_1_NAME='python-list@python.org'
SOURCE_1_VERSION='2015-01..2025-12'
SOURCE_1_URL='https://mail.python.org/archives/list/python-list@python.org/'
SOURCE_1_CATEGORY='public-dataset'
SOURCE_1_LICENSE_DECLARATION='Python.org identifies python-list as a public community mailing list and publishes its archive and bulk mbox exports; no blanket content license is asserted for individual messages.'
SOURCE_1_LICENSE_URL='https://www.python.org/community/lists/'
SOURCE_1_CONTENT_TYPES='mailing list
technical discussion
user support'
SOURCE_1_LANGUAGES='en'
SOURCE_1_FROM='2015-01'
SOURCE_1_TO='2025-12'
SOURCE_1_SELECTION='All 132 official date-bounded monthly exports from 2015 through 2025, retained as byte-exact RFC 822 messages; a deterministic MIME-boundary projection is used only to verify each export.'
SOURCE_1_COPYRIGHTED='yes'
SOURCE_1_MACHINE_GENERATED='unknown'
SOURCE_1_ACQUISITION_BASIS='Official unauthenticated monthly HyperKitty mbox exports, each pinned by canonical SHA-256 and message count in a checksum-pinned manifest.'

SOURCE_2_ID='tutor'
SOURCE_2_PATH='tutor'
SOURCE_2_LICENSE='LicenseRef-Publicly-Archived-Forum'
SOURCE_2_NAME='tutor@python.org'
SOURCE_2_VERSION='2015-01..2025-12'
SOURCE_2_URL='https://mail.python.org/archives/list/tutor@python.org/'
SOURCE_2_CATEGORY='public-dataset'
SOURCE_2_LICENSE_DECLARATION='Python.org identifies tutor as a public learning and support mailing list and publishes its archive and bulk mbox exports; no blanket content license is asserted for individual messages.'
SOURCE_2_LICENSE_URL='https://www.python.org/community/lists/'
SOURCE_2_CONTENT_TYPES='mailing list
programming education
user support'
SOURCE_2_LANGUAGES='en'
SOURCE_2_FROM='2015-01'
SOURCE_2_TO='2025-12'
SOURCE_2_SELECTION='All 132 official date-bounded monthly exports from 2015 through 2025, retained as byte-exact RFC 822 messages; a deterministic MIME-boundary projection is used only to verify each export.'
SOURCE_2_COPYRIGHTED='yes'
SOURCE_2_MACHINE_GENERATED='unknown'
SOURCE_2_ACQUISITION_BASIS='Official unauthenticated monthly HyperKitty mbox exports, each pinned by canonical SHA-256 and message count in a checksum-pinned manifest.'

SOURCE_3_ID='python-dev'
SOURCE_3_PATH='python-dev'
SOURCE_3_LICENSE='LicenseRef-Publicly-Archived-Forum'
SOURCE_3_NAME='python-dev@python.org'
SOURCE_3_VERSION='2015-01..2022-12'
SOURCE_3_URL='https://mail.python.org/archives/list/python-dev@python.org/'
SOURCE_3_CATEGORY='public-dataset'
SOURCE_3_LICENSE_DECLARATION='Python.org identifies python-dev as a public core-development mailing list and publishes its archive and bulk mbox exports; no blanket content license is asserted for individual messages.'
SOURCE_3_LICENSE_URL='https://www.python.org/community/lists/'
SOURCE_3_CONTENT_TYPES='developer communications
language design
mailing list'
SOURCE_3_LANGUAGES='en'
SOURCE_3_FROM='2015-01'
SOURCE_3_TO='2022-12'
SOURCE_3_SELECTION='All 96 official date-bounded monthly exports from 2015 through the list'"'"'s 2022 migration, retained as byte-exact RFC 822 messages; a deterministic MIME-boundary projection is used only to verify each export.'
SOURCE_3_COPYRIGHTED='yes'
SOURCE_3_MACHINE_GENERATED='unknown'
SOURCE_3_ACQUISITION_BASIS='Official unauthenticated monthly HyperKitty mbox exports, each pinned by canonical SHA-256 and message count in a checksum-pinned manifest.'

FETCHER_OUTPUT=${1-}
FETCHER_ARGUMENT_COUNT=$#
FETCHER_SIZE='25G'
FETCH_COUNT='3'
FETCH_1_METHOD='hyperkitty_monthly'
FETCH_1_SOURCE='1'
FETCH_1_ARG_COUNT='6'
FETCH_1_ARG_1='python-list'
FETCH_1_ARG_2='https://mail.python.org/archives/list'
FETCH_1_ARG_3='python-list'
FETCH_1_ARG_4='messages'
FETCH_1_ARG_5='python-list.tsv'
FETCH_1_ARG_6='5eae49e599a701348872423903fce3f678482396f2d38ed2a364290d184704d5'

FETCH_2_METHOD='hyperkitty_monthly'
FETCH_2_SOURCE='2'
FETCH_2_ARG_COUNT='6'
FETCH_2_ARG_1='tutor'
FETCH_2_ARG_2='https://mail.python.org/archives/list'
FETCH_2_ARG_3='tutor'
FETCH_2_ARG_4='messages'
FETCH_2_ARG_5='tutor.tsv'
FETCH_2_ARG_6='e931ad0b6c0f2e5c1b364eb001e604d5ec13542d24ea5f075611d796d0bb0ced'

FETCH_3_METHOD='hyperkitty_monthly'
FETCH_3_SOURCE='3'
FETCH_3_ARG_COUNT='6'
FETCH_3_ARG_1='python-dev'
FETCH_3_ARG_2='https://mail.python.org/archives/list'
FETCH_3_ARG_3='python-dev'
FETCH_3_ARG_4='messages'
FETCH_3_ARG_5='python-dev.tsv'
FETCH_3_ARG_6='684e7d8cdc5e3d09f2dc70d8626e354cf301c0cc29a6e44b6781b120bb372829'

script_dir=$(CDPATH='' cd -- "$(dirname -- "$0")" && pwd -P)
. "$script_dir/../functions.sh"
fetcher_main
