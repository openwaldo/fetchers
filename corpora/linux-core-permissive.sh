#!/bin/sh
set -eu

CORPUS_ID='linux-core-permissive'
CORPUS_TITLE='Linux Core — Permissive Alternatives and BSD'
CORPUS_DESCRIPTION='Pinned permissively licensed libc, shell, userland, init/package tooling, and BSD base-system source selected without copyleft imported trees.'
CORPUS_DESTINATION='code/linux-core-permissive'

SOURCE_COUNT='11'
SOURCE_1_ID='musl'
SOURCE_1_PATH='musl'
SOURCE_1_LICENSE='MIT'
SOURCE_1_NAME='musl/libc'
SOURCE_1_VERSION='0784374d561435f7c787a555aeab8ede699ed298'
SOURCE_1_URL='https://git.musl-libc.org/cgit/musl'
SOURCE_1_CATEGORY='public-dataset'
SOURCE_1_LICENSE_DECLARATION='MIT'
SOURCE_1_LICENSE_URL='https://git.musl-libc.org/cgit/musl/tree/COPYRIGHT?id=0784374d561435f7c787a555aeab8ede699ed298'
SOURCE_1_CONTENT_TYPES='source code'
SOURCE_1_LANGUAGES='Assembly
C'
SOURCE_1_SELECTION='Complete tracked project source selected by the reviewed --source-code profile.'
SOURCE_1_COPYRIGHTED='yes'
SOURCE_1_ACQUISITION_BASIS='Official musl Git repository at the pinned v1.2.5 commit.'

SOURCE_2_ID='toybox'
SOURCE_2_PATH='toybox'
SOURCE_2_LICENSE='0BSD'
SOURCE_2_NAME='landley/toybox'
SOURCE_2_VERSION='7eaddbdb9c1712801ddf131ed79ead0c981ffcb1'
SOURCE_2_URL='https://landley.net/toybox'
SOURCE_2_CATEGORY='public-dataset'
SOURCE_2_LICENSE_DECLARATION='0BSD'
SOURCE_2_LICENSE_URL='https://github.com/landley/toybox/blob/7eaddbdb9c1712801ddf131ed79ead0c981ffcb1/LICENSE'
SOURCE_2_CONTENT_TYPES='source code'
SOURCE_2_LANGUAGES='C
Shell'
SOURCE_2_SELECTION='Complete tracked project source selected by the reviewed --source-code profile.'
SOURCE_2_COPYRIGHTED='yes'
SOURCE_2_ACQUISITION_BASIS='Official Toybox repository at the pinned 0.8.12 commit.'

SOURCE_3_ID='dash'
SOURCE_3_PATH='dash'
SOURCE_3_LICENSE='BSD-3-Clause'
SOURCE_3_NAME='kernel/dash'
SOURCE_3_VERSION='4bbf8721a3ac6401ced6a0454956801f6ba37256'
SOURCE_3_URL='https://git.kernel.org/pub/scm/utils/dash/dash.git'
SOURCE_3_CATEGORY='public-dataset'
SOURCE_3_LICENSE_DECLARATION='BSD-3-Clause'
SOURCE_3_LICENSE_URL='https://git.kernel.org/pub/scm/utils/dash/dash.git/tree/COPYING?id=4bbf8721a3ac6401ced6a0454956801f6ba37256'
SOURCE_3_CONTENT_TYPES='source code'
SOURCE_3_LANGUAGES='C'
SOURCE_3_SELECTION='Complete tracked project source selected by the reviewed --source-code profile.'
SOURCE_3_COPYRIGHTED='yes'
SOURCE_3_ACQUISITION_BASIS='Official dash Git repository at the pinned v0.5.12 commit.'

SOURCE_4_ID='sbase'
SOURCE_4_PATH='sbase'
SOURCE_4_LICENSE='MIT'
SOURCE_4_NAME='suckless/sbase'
SOURCE_4_VERSION='c546c3a5724c81cee9a11d816a38ccdf17472129'
SOURCE_4_URL='https://core.suckless.org/sbase'
SOURCE_4_CATEGORY='public-dataset'
SOURCE_4_LICENSE_DECLARATION='MIT'
SOURCE_4_LICENSE_URL='https://git.suckless.org/sbase/file/LICENSE.html'
SOURCE_4_CONTENT_TYPES='source code'
SOURCE_4_LANGUAGES='C'
SOURCE_4_SELECTION='Complete tracked project source selected by the reviewed --source-code profile.'
SOURCE_4_COPYRIGHTED='yes'
SOURCE_4_ACQUISITION_BASIS='Official suckless sbase Git repository at the pinned commit.'

SOURCE_5_ID='ubase'
SOURCE_5_PATH='ubase'
SOURCE_5_LICENSE='MIT'
SOURCE_5_NAME='suckless/ubase'
SOURCE_5_VERSION='e8249b49ca3e02032dece5e0cdac3d236667a6d9'
SOURCE_5_URL='https://core.suckless.org/ubase'
SOURCE_5_CATEGORY='public-dataset'
SOURCE_5_LICENSE_DECLARATION='MIT'
SOURCE_5_LICENSE_URL='https://git.suckless.org/ubase/file/LICENSE.html'
SOURCE_5_CONTENT_TYPES='source code'
SOURCE_5_LANGUAGES='C'
SOURCE_5_SELECTION='Complete tracked project source selected by the reviewed --source-code profile.'
SOURCE_5_COPYRIGHTED='yes'
SOURCE_5_ACQUISITION_BASIS='Official suckless ubase Git repository at the pinned commit.'

SOURCE_6_ID='openrc'
SOURCE_6_PATH='openrc'
SOURCE_6_LICENSE='LicenseRef-FreeBSD-permissive'
SOURCE_6_NAME='OpenRC/openrc'
SOURCE_6_VERSION='f232308ad67cc94bd95e98a6af4a47fc58912b70'
SOURCE_6_URL='https://github.com/OpenRC/openrc'
SOURCE_6_CATEGORY='public-dataset'
SOURCE_6_LICENSE_DECLARATION='LicenseRef-FreeBSD-permissive'
SOURCE_6_LICENSE_URL='https://github.com/OpenRC/openrc/blob/f232308ad67cc94bd95e98a6af4a47fc58912b70/LICENSE'
SOURCE_6_CONTENT_TYPES='source code'
SOURCE_6_LANGUAGES='C
Shell'
SOURCE_6_SELECTION='Complete tracked project source selected by the reviewed --source-code profile.'
SOURCE_6_COPYRIGHTED='yes'
SOURCE_6_ACQUISITION_BASIS='Official OpenRC Git repository at the pinned 0.62.3 commit.'

SOURCE_7_ID='xbps'
SOURCE_7_PATH='xbps'
SOURCE_7_LICENSE='BSD-2-Clause'
SOURCE_7_NAME='void-linux/xbps'
SOURCE_7_VERSION='364428243685bd3f85e27e140f98981790e7295e'
SOURCE_7_URL='https://github.com/void-linux/xbps'
SOURCE_7_CATEGORY='public-dataset'
SOURCE_7_LICENSE_DECLARATION='BSD-2-Clause'
SOURCE_7_LICENSE_URL='https://github.com/void-linux/xbps/blob/364428243685bd3f85e27e140f98981790e7295e/LICENSE'
SOURCE_7_CONTENT_TYPES='source code'
SOURCE_7_LANGUAGES='C
Shell'
SOURCE_7_SELECTION='Complete tracked project source selected by the reviewed --source-code profile.'
SOURCE_7_COPYRIGHTED='yes'
SOURCE_7_ACQUISITION_BASIS='Official XBPS Git repository at the pinned 0.60 commit.'

SOURCE_8_ID='openssh-portable'
SOURCE_8_PATH='openssh-portable'
SOURCE_8_LICENSE='BSD-2-Clause'
SOURCE_8_NAME='openssh/openssh-portable'
SOURCE_8_VERSION='e8dd756725e8800fcd0b3fd71ee6b4382d1e8fab'
SOURCE_8_URL='https://github.com/openssh/openssh-portable'
SOURCE_8_CATEGORY='public-dataset'
SOURCE_8_LICENSE_DECLARATION='BSD-2-Clause'
SOURCE_8_LICENSE_URL='https://github.com/openssh/openssh-portable/blob/e8dd756725e8800fcd0b3fd71ee6b4382d1e8fab/LICENCE'
SOURCE_8_CONTENT_TYPES='source code'
SOURCE_8_LANGUAGES='C
Shell'
SOURCE_8_SELECTION='Complete tracked portable OpenSSH source selected by the reviewed --source-code profile; bundled compatibility notices remain in the source tree.'
SOURCE_8_COPYRIGHTED='yes'
SOURCE_8_ACQUISITION_BASIS='Official OpenSSH Portable Git repository at the pinned V_10_4_P1 commit.'

SOURCE_9_ID='freebsd-src'
SOURCE_9_PATH='freebsd-src'
SOURCE_9_LICENSE='BSD-2-Clause'
SOURCE_9_NAME='FreeBSD/src'
SOURCE_9_VERSION='7aedc8de6446ad5a10d553b926423c689f0a3363'
SOURCE_9_URL='https://github.com/freebsd/freebsd-src'
SOURCE_9_CATEGORY='public-dataset'
SOURCE_9_LICENSE_DECLARATION='BSD-2-Clause'
SOURCE_9_LICENSE_URL='https://github.com/freebsd/freebsd-src/blob/7aedc8de6446ad5a10d553b926423c689f0a3363/COPYRIGHT'
SOURCE_9_CONTENT_TYPES='source code'
SOURCE_9_LANGUAGES='Assembly
C
C++
Shell'
SOURCE_9_SELECTION='Project-owned permissive base-system source; contrib, crypto, CDDL, GNU, microcode, and other imported third-party trees excluded.'
SOURCE_9_COPYRIGHTED='yes'
SOURCE_9_ACQUISITION_BASIS='Official FreeBSD source repository at the pinned 15.0 release commit.'

SOURCE_10_ID='openbsd-src'
SOURCE_10_PATH='openbsd-src'
SOURCE_10_LICENSE='LicenseRef-OpenBSD-permissive'
SOURCE_10_NAME='OpenBSD/src'
SOURCE_10_VERSION='003d9ff8ec54f3f15e165d831f1972e2a710cfce'
SOURCE_10_URL='https://github.com/openbsd/src'
SOURCE_10_CATEGORY='public-dataset'
SOURCE_10_LICENSE_DECLARATION='LicenseRef-OpenBSD-permissive'
SOURCE_10_LICENSE_URL='https://www.openbsd.org/policy.html'
SOURCE_10_CONTENT_TYPES='source code'
SOURCE_10_LANGUAGES='Assembly
C
C++
Shell'
SOURCE_10_SELECTION='OpenBSD permissive base-system source at an immutable mirror commit; GNU and microcode trees excluded, and retained files preserve their ISC/BSD-style notices.'
SOURCE_10_COPYRIGHTED='yes'
SOURCE_10_ACQUISITION_BASIS='Official OpenBSD GitHub source mirror pinned by exact commit.'

SOURCE_11_ID='netbsd-src'
SOURCE_11_PATH='netbsd-src'
SOURCE_11_LICENSE='LicenseRef-NetBSD-permissive'
SOURCE_11_NAME='NetBSD/src'
SOURCE_11_VERSION='1d2eff37050c088093399be0526404544f166cab'
SOURCE_11_URL='https://github.com/NetBSD/src'
SOURCE_11_CATEGORY='public-dataset'
SOURCE_11_LICENSE_DECLARATION='LicenseRef-NetBSD-permissive'
SOURCE_11_LICENSE_URL='https://www.netbsd.org/about/redistribution.html'
SOURCE_11_CONTENT_TYPES='source code'
SOURCE_11_LANGUAGES='Assembly
C
C++
Shell'
SOURCE_11_SELECTION='Project-owned permissive NetBSD base-system source with crypto, external, firmware, and imported sys/external trees excluded explicitly.'
SOURCE_11_COPYRIGHTED='yes'
SOURCE_11_ACQUISITION_BASIS='Official NetBSD GitHub source mirror pinned by exact netbsd-10 branch commit.'

FETCHER_OUTPUT=${1-}
FETCHER_ARGUMENT_COUNT=$#
FETCHER_SIZE='100G'
FETCH_COUNT='11'
FETCH_1_METHOD='git'
FETCH_1_SOURCE='1'
FETCH_1_PATH='musl'
FETCH_1_URL='https://git.musl-libc.org/git/musl'
FETCH_1_REF='refs/tags/v1.2.5'
FETCH_1_REVISION='0784374d561435f7c787a555aeab8ede699ed298'
FETCH_1_OPTIONS='--skip-symlinks
--filter-blobs
--source-code'

FETCH_2_METHOD='git'
FETCH_2_SOURCE='2'
FETCH_2_PATH='toybox'
FETCH_2_URL='https://github.com/landley/toybox.git'
FETCH_2_REF='refs/tags/0.8.12'
FETCH_2_REVISION='7eaddbdb9c1712801ddf131ed79ead0c981ffcb1'
FETCH_2_OPTIONS='--skip-symlinks
--filter-blobs
--source-code'

FETCH_3_METHOD='git'
FETCH_3_SOURCE='3'
FETCH_3_PATH='dash'
FETCH_3_URL='https://git.kernel.org/pub/scm/utils/dash/dash.git'
FETCH_3_REF='refs/tags/v0.5.12'
FETCH_3_REVISION='4bbf8721a3ac6401ced6a0454956801f6ba37256'
FETCH_3_OPTIONS='--skip-symlinks
--filter-blobs
--source-code'

FETCH_4_METHOD='git'
FETCH_4_SOURCE='4'
FETCH_4_PATH='sbase'
FETCH_4_URL='https://git.suckless.org/sbase'
FETCH_4_REF='c546c3a5724c81cee9a11d816a38ccdf17472129'
FETCH_4_REVISION='c546c3a5724c81cee9a11d816a38ccdf17472129'
FETCH_4_OPTIONS='--skip-symlinks
--filter-blobs
--source-code'

FETCH_5_METHOD='git'
FETCH_5_SOURCE='5'
FETCH_5_PATH='ubase'
FETCH_5_URL='https://git.suckless.org/ubase'
FETCH_5_REF='e8249b49ca3e02032dece5e0cdac3d236667a6d9'
FETCH_5_REVISION='e8249b49ca3e02032dece5e0cdac3d236667a6d9'
FETCH_5_OPTIONS='--skip-symlinks
--filter-blobs
--source-code'

FETCH_6_METHOD='git'
FETCH_6_SOURCE='6'
FETCH_6_PATH='openrc'
FETCH_6_URL='https://github.com/OpenRC/openrc.git'
FETCH_6_REF='refs/tags/0.62.3'
FETCH_6_REVISION='f232308ad67cc94bd95e98a6af4a47fc58912b70'
FETCH_6_OPTIONS='--skip-symlinks
--filter-blobs
--source-code'

FETCH_7_METHOD='git'
FETCH_7_SOURCE='7'
FETCH_7_PATH='xbps'
FETCH_7_URL='https://github.com/void-linux/xbps.git'
FETCH_7_REF='refs/tags/0.60'
FETCH_7_REVISION='364428243685bd3f85e27e140f98981790e7295e'
FETCH_7_OPTIONS='--skip-symlinks
--filter-blobs
--source-code'

FETCH_8_METHOD='git'
FETCH_8_SOURCE='8'
FETCH_8_PATH='openssh-portable'
FETCH_8_URL='https://github.com/openssh/openssh-portable.git'
FETCH_8_REF='refs/tags/V_10_4_P1'
FETCH_8_REVISION='e8dd756725e8800fcd0b3fd71ee6b4382d1e8fab'
FETCH_8_OPTIONS='--skip-symlinks
--filter-blobs
--source-code'

FETCH_9_METHOD='git'
FETCH_9_SOURCE='9'
FETCH_9_PATH='freebsd-src'
FETCH_9_URL='https://github.com/freebsd/freebsd-src.git'
FETCH_9_REF='refs/tags/release/15.0.0'
FETCH_9_REVISION='7aedc8de6446ad5a10d553b926423c689f0a3363'
FETCH_9_OPTIONS='--skip-symlinks
--filter-blobs
.
:(exclude)cddl/**
:(exclude)contrib/**
:(exclude)crypto/**
:(exclude)gnu/**
:(exclude)sys/cddl/**
:(exclude)sys/contrib/**
:(exclude)sys/dev/microcode/**
:(exclude)sys/gnu/**'

FETCH_10_METHOD='git'
FETCH_10_SOURCE='10'
FETCH_10_PATH='openbsd-src'
FETCH_10_URL='https://github.com/openbsd/src.git'
FETCH_10_REF='003d9ff8ec54f3f15e165d831f1972e2a710cfce'
FETCH_10_REVISION='003d9ff8ec54f3f15e165d831f1972e2a710cfce'
FETCH_10_OPTIONS='--skip-symlinks
--filter-blobs
.
:(exclude)gnu/**
:(exclude)sys/dev/microcode/**'

FETCH_11_METHOD='git'
FETCH_11_SOURCE='11'
FETCH_11_PATH='netbsd-src'
FETCH_11_URL='https://github.com/NetBSD/src.git'
FETCH_11_REF='1d2eff37050c088093399be0526404544f166cab'
FETCH_11_REVISION='1d2eff37050c088093399be0526404544f166cab'
FETCH_11_OPTIONS='--skip-symlinks
--filter-blobs
.
:(exclude)crypto/**
:(exclude)external/**
:(exclude)sys/dev/microcode/**
:(exclude)sys/external/**'

script_dir=$(CDPATH='' cd -- "$(dirname -- "$0")" && pwd -P)
. "$script_dir/../functions.sh"
fetcher_main
