#!/bin/sh
set -eu

CORPUS_ID='alpine-linux-mailing-list'
CORPUS_TITLE='Alpine Linux Development Mailing List'
CORPUS_DESCRIPTION='Canonicalized complete public Alpine Linux development-list archive from the official bulk mbox export.'
CORPUS_DESTINATION='community/alpine-linux-mailing-list'

SOURCE_ID='alpine-devel'
SOURCE_PATH='alpine-devel'
SOURCE_LICENSE='LicenseRef-Publicly-Archived-Forum'
SOURCE_NAME='alpine-devel@lists.alpinelinux.org'
SOURCE_VERSION='2006-2026-snapshot-2026-08-10'
SOURCE_URL='https://lists.alpinelinux.org/~alpine/devel'
SOURCE_CATEGORY='public-dataset'
SOURCE_LICENSE_DECLARATION='Alpine identifies this as its public development mailing list and the official archive explicitly offers the entire list as an mbox export; no blanket content license is asserted for individual messages.'
SOURCE_LICENSE_URL='https://lists.alpinelinux.org/~alpine/devel'
SOURCE_CONTENT_TYPES='developer communications
mailing list
source code discussion
user support'
SOURCE_LANGUAGES='en'
SOURCE_FROM='2006-01-17'
SOURCE_TO='2026-07-27'
SOURCE_SELECTION='All 8,206 messages in the complete official archive export qualified on 2026-08-10. Transport-generated mbox envelope timestamps are canonicalized and removed while each byte-exact RFC 822 message is emitted as one training input.'
SOURCE_COPYRIGHTED='yes'
SOURCE_MACHINE_GENERATED='unknown'
SOURCE_ACQUISITION_BASIS='Official whole-list mbox export independently retrieved twice and pinned by the identical SHA-256 of its narrowly canonicalized payload.'

FETCHER_OUTPUT=${1-}
FETCHER_ARGUMENT_COUNT=$#
FETCHER_SIZE='25G'
FETCH_METHOD='sourcehut_list_export'
FETCH_ARG_COUNT='4'
FETCH_ARG_1='alpine-devel'
FETCH_ARG_2='https://lists.alpinelinux.org/~alpine/devel'
FETCH_ARG_3='alpine-devel-messages'
FETCH_ARG_4='a16fef22d575c3f170383128e32fe082a5be12991ffb8294dbc4fee636b3c457'

script_dir=$(CDPATH='' cd -- "$(dirname -- "$0")" && pwd -P)
. "$script_dir/../functions.sh"
fetcher_main
