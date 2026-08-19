#!/bin/sh
set -eu

CORPUS_ID='linux-kernel-mailing-list'
CORPUS_TITLE='Linux Kernel Mailing List'
CORPUS_DESCRIPTION='Calendar-year 2025 Linux kernel development messages from the official lore.kernel.org public archive.'
CORPUS_DESTINATION='community/linux-kernel-mailing-list'

SOURCE_ID='linux-kernel-mailing-list'
SOURCE_PATH=''
SOURCE_LICENSE='LicenseRef-Publicly-Archived-Forum'
SOURCE_NAME='linux-kernel@vger.kernel.org'
SOURCE_VERSION='2025'
SOURCE_URL='https://lore.kernel.org/lkml/'
SOURCE_CATEGORY='public-dataset'
SOURCE_LICENSE_DECLARATION='Kernel.org operates lore as a public Git-backed mailing-list archive with downloadable mbox and Git exports; no blanket content license is asserted for individual messages.'
SOURCE_LICENSE_URL='https://www.kernel.org/doc/projects/korg/lore.html'
SOURCE_CONTENT_TYPES='developer communications
mailing list
patches
source code review'
SOURCE_LANGUAGES='en'
SOURCE_FROM='2025-01-01'
SOURCE_TO='2025-12-31'
SOURCE_SELECTION='Every message commit whose author timestamp falls in calendar year 2025 from pinned public-inbox epochs 15, 16, 17, and 18; raw RFC 822 message blobs are retained as individual commit-addressed .eml inputs.'
SOURCE_COPYRIGHTED='yes'
SOURCE_MACHINE_GENERATED='unknown'
SOURCE_ACQUISITION_BASIS='Official lore.kernel.org public-inbox Git epochs fetched by immutable object ID and streamed without per-message subprocesses.'

FETCHER_OUTPUT=${1-}
FETCHER_ARGUMENT_COUNT=$#
FETCHER_SIZE='25G'
FETCH_METHOD='public_inbox_year'
FETCH_ARG_COUNT='8'
FETCH_ARG_1=''
FETCH_ARG_2='https://lore.kernel.org'
FETCH_ARG_3='lkml'
FETCH_ARG_4='2025'
FETCH_ARG_5='15:17145d36cd6846c40da10f16d7bca6eb36ba06b9'
FETCH_ARG_6='16:17b3bd025913c34209645b20e205dfc760c9401a'
FETCH_ARG_7='17:17dcb3b905a34ad6eac3d4bc666f5fdc3d2407b8'
FETCH_ARG_8='18:4cfd85f2eacf9036cf01c8342a597f429b9fea7b'

script_dir=$(CDPATH='' cd -- "$(dirname -- "$0")" && pwd -P)
. "$script_dir/../functions.sh"
fetcher_main
