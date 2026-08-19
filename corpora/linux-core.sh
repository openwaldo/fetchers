#!/bin/sh
set -eu

CORPUS_ID='linux-core'
CORPUS_TITLE='Linux Core — Copyleft'
CORPUS_DESCRIPTION='Pinned copyleft source for the Linux kernel and foundational GNU/Linux toolchain, boot, module, networking, filesystem, and process projects not already represented in code/copyleft.'
CORPUS_DESTINATION='code/linux-core'

SOURCE_COUNT='22'
SOURCE_1_ID='linux-kernel'
SOURCE_1_PATH='linux-kernel'
SOURCE_1_LICENSE='GPL-2.0-only'
SOURCE_1_NAME='linux/kernel'
SOURCE_1_VERSION='038d61fd642278bab63ee8ef722c50d10ab01e8f'
SOURCE_1_URL='https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git'
SOURCE_1_CATEGORY='public-dataset'
SOURCE_1_LICENSE_DECLARATION='GPL-2.0-only'
SOURCE_1_LICENSE_URL='https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/COPYING?id=038d61fd642278bab63ee8ef722c50d10ab01e8f'
SOURCE_1_CONTENT_TYPES='source code'
SOURCE_1_LANGUAGES='Assembly
C
Rust'
SOURCE_1_SELECTION='Tracked project files selected by the reviewed --source-code profile.'
SOURCE_1_COPYRIGHTED='yes'
SOURCE_1_ACQUISITION_BASIS='Official Linux kernel Git repository at the pinned v6.16 commit.'

SOURCE_2_ID='kmod'
SOURCE_2_PATH='kmod'
SOURCE_2_LICENSE='GPL-2.0-or-later AND LGPL-2.1-or-later'
SOURCE_2_NAME='kernel/kmod'
SOURCE_2_VERSION='13330c958deef15c227a9c83d8ba72106152fd7f'
SOURCE_2_URL='https://git.kernel.org/pub/scm/utils/kernel/kmod/kmod.git'
SOURCE_2_CATEGORY='public-dataset'
SOURCE_2_LICENSE_DECLARATION='GPL-2.0-or-later AND LGPL-2.1-or-later'
SOURCE_2_LICENSE_URL='https://git.kernel.org/pub/scm/utils/kernel/kmod/kmod.git/tree/COPYING?id=13330c958deef15c227a9c83d8ba72106152fd7f'
SOURCE_2_CONTENT_TYPES='source code'
SOURCE_2_LANGUAGES='C'
SOURCE_2_SELECTION='Tracked project files selected by the reviewed --source-code profile; library and utility licensing remains identified by upstream file headers.'
SOURCE_2_COPYRIGHTED='yes'
SOURCE_2_ACQUISITION_BASIS='Official kmod Git repository at the pinned v34.2 commit.'

SOURCE_3_ID='iproute2'
SOURCE_3_PATH='iproute2'
SOURCE_3_LICENSE='GPL-2.0-or-later'
SOURCE_3_NAME='kernel/iproute2'
SOURCE_3_VERSION='915d3eafcc19706c27b220134b25c24a5b9913b3'
SOURCE_3_URL='https://git.kernel.org/pub/scm/network/iproute2/iproute2.git'
SOURCE_3_CATEGORY='public-dataset'
SOURCE_3_LICENSE_DECLARATION='GPL-2.0-or-later'
SOURCE_3_LICENSE_URL='https://git.kernel.org/pub/scm/network/iproute2/iproute2.git/tree/COPYING?id=915d3eafcc19706c27b220134b25c24a5b9913b3'
SOURCE_3_CONTENT_TYPES='source code'
SOURCE_3_LANGUAGES='C'
SOURCE_3_SELECTION='Tracked project files selected by the reviewed --source-code profile.'
SOURCE_3_COPYRIGHTED='yes'
SOURCE_3_ACQUISITION_BASIS='Official iproute2 Git repository at the pinned v6.16.0 commit.'

SOURCE_4_ID='nftables'
SOURCE_4_PATH='nftables'
SOURCE_4_LICENSE='GPL-2.0-or-later'
SOURCE_4_NAME='netfilter/nftables'
SOURCE_4_VERSION='5fb748243550f857bb82cddcdce642f8bf269026'
SOURCE_4_URL='https://git.netfilter.org/nftables'
SOURCE_4_CATEGORY='public-dataset'
SOURCE_4_LICENSE_DECLARATION='GPL-2.0-or-later'
SOURCE_4_LICENSE_URL='https://git.netfilter.org/nftables/tree/COPYING?id=5fb748243550f857bb82cddcdce642f8bf269026'
SOURCE_4_CONTENT_TYPES='source code'
SOURCE_4_LANGUAGES='C'
SOURCE_4_SELECTION='Tracked project files selected by the reviewed --source-code profile.'
SOURCE_4_COPYRIGHTED='yes'
SOURCE_4_ACQUISITION_BASIS='Official Netfilter Git repository at the pinned v1.1.5 commit.'

SOURCE_5_ID='iptables'
SOURCE_5_PATH='iptables'
SOURCE_5_LICENSE='GPL-2.0-only'
SOURCE_5_NAME='netfilter/iptables'
SOURCE_5_VERSION='0506bea1dcc8f12d94e7c32bf2fb04abb3fdd269'
SOURCE_5_URL='https://git.netfilter.org/iptables'
SOURCE_5_CATEGORY='public-dataset'
SOURCE_5_LICENSE_DECLARATION='GPL-2.0-only'
SOURCE_5_LICENSE_URL='https://git.netfilter.org/iptables/tree/COPYING?id=0506bea1dcc8f12d94e7c32bf2fb04abb3fdd269'
SOURCE_5_CONTENT_TYPES='source code'
SOURCE_5_LANGUAGES='C'
SOURCE_5_SELECTION='Tracked project files selected by the reviewed --source-code profile.'
SOURCE_5_COPYRIGHTED='yes'
SOURCE_5_ACQUISITION_BASIS='Official Netfilter Git repository at the pinned v1.8.11 commit.'

SOURCE_6_ID='btrfs-progs'
SOURCE_6_PATH='btrfs-progs'
SOURCE_6_LICENSE='GPL-2.0-only'
SOURCE_6_NAME='kernel/btrfs-progs'
SOURCE_6_VERSION='54694de98fdc4ea5678cdd77b920c044bbf64f26'
SOURCE_6_URL='https://git.kernel.org/pub/scm/linux/kernel/git/kdave/btrfs-progs.git'
SOURCE_6_CATEGORY='public-dataset'
SOURCE_6_LICENSE_DECLARATION='GPL-2.0-only'
SOURCE_6_LICENSE_URL='https://git.kernel.org/pub/scm/linux/kernel/git/kdave/btrfs-progs.git/tree/COPYING?id=54694de98fdc4ea5678cdd77b920c044bbf64f26'
SOURCE_6_CONTENT_TYPES='source code'
SOURCE_6_LANGUAGES='C'
SOURCE_6_SELECTION='Tracked project files selected by the reviewed --source-code profile.'
SOURCE_6_COPYRIGHTED='yes'
SOURCE_6_ACQUISITION_BASIS='Official btrfs-progs Git repository at the pinned v6.16 commit.'

SOURCE_7_ID='xfsprogs'
SOURCE_7_PATH='xfsprogs'
SOURCE_7_LICENSE='GPL-2.0-only'
SOURCE_7_NAME='kernel/xfsprogs'
SOURCE_7_VERSION='1d287f3d958ebc425275d6a08ad6977e13e52fac'
SOURCE_7_URL='https://git.kernel.org/pub/scm/fs/xfs/xfsprogs-dev.git'
SOURCE_7_CATEGORY='public-dataset'
SOURCE_7_LICENSE_DECLARATION='GPL-2.0-only'
SOURCE_7_LICENSE_URL='https://git.kernel.org/pub/scm/fs/xfs/xfsprogs-dev.git/tree/LICENSES/GPL-2.0?id=1d287f3d958ebc425275d6a08ad6977e13e52fac'
SOURCE_7_CONTENT_TYPES='source code'
SOURCE_7_LANGUAGES='C'
SOURCE_7_SELECTION='Tracked project files selected by the reviewed --source-code profile.'
SOURCE_7_COPYRIGHTED='yes'
SOURCE_7_ACQUISITION_BASIS='Official xfsprogs Git repository at the pinned v6.16.0 commit.'

SOURCE_8_ID='busybox'
SOURCE_8_PATH='busybox'
SOURCE_8_LICENSE='GPL-2.0-only'
SOURCE_8_NAME='busybox/busybox'
SOURCE_8_VERSION='be7d1b7b1701d225379bc1665487ed0871b592a5'
SOURCE_8_URL='https://git.busybox.net/busybox'
SOURCE_8_CATEGORY='public-dataset'
SOURCE_8_LICENSE_DECLARATION='GPL-2.0-only'
SOURCE_8_LICENSE_URL='https://git.busybox.net/busybox/tree/LICENSE?id=be7d1b7b1701d225379bc1665487ed0871b592a5'
SOURCE_8_CONTENT_TYPES='source code'
SOURCE_8_LANGUAGES='C
Shell'
SOURCE_8_SELECTION='Tracked project files selected by the reviewed --source-code profile.'
SOURCE_8_COPYRIGHTED='yes'
SOURCE_8_ACQUISITION_BASIS='Official BusyBox Git repository at the pinned 1.37.0 commit.'

SOURCE_9_ID='glibc'
SOURCE_9_PATH='glibc'
SOURCE_9_LICENSE='LGPL-2.1-or-later'
SOURCE_9_NAME='gnu/glibc'
SOURCE_9_VERSION='d2097651cc57834dbfcaa102ddfacae0d86cfb66'
SOURCE_9_URL='https://sourceware.org/git/glibc.git'
SOURCE_9_CATEGORY='public-dataset'
SOURCE_9_LICENSE_DECLARATION='LGPL-2.1-or-later'
SOURCE_9_LICENSE_URL='https://sourceware.org/git/?p=glibc.git;a=blob;f=COPYING.LIB;hb=d2097651cc57834dbfcaa102ddfacae0d86cfb66'
SOURCE_9_CONTENT_TYPES='source code'
SOURCE_9_LANGUAGES='Assembly
C'
SOURCE_9_SELECTION='Tracked project files selected by the reviewed --source-code profile.'
SOURCE_9_COPYRIGHTED='yes'
SOURCE_9_ACQUISITION_BASIS='Official glibc Git repository at the pinned glibc-2.42 commit.'

SOURCE_10_ID='gcc'
SOURCE_10_PATH='gcc'
SOURCE_10_LICENSE='GPL-3.0-or-later'
SOURCE_10_NAME='gnu/gcc'
SOURCE_10_VERSION='5115c7e447fc07457443df874bf57840e8316d5f'
SOURCE_10_URL='https://gcc.gnu.org/git/gcc.git'
SOURCE_10_CATEGORY='public-dataset'
SOURCE_10_LICENSE_DECLARATION='GPL-3.0-or-later'
SOURCE_10_LICENSE_URL='https://github.com/gcc-mirror/gcc/blob/5115c7e447fc07457443df874bf57840e8316d5f/COPYING3'
SOURCE_10_CONTENT_TYPES='source code'
SOURCE_10_LANGUAGES='Ada
C
C++
D
Fortran
Go
Rust'
SOURCE_10_SELECTION='Tracked project files selected by the reviewed --source-code profile; runtime-library exceptions and incorporated component notices remain in the source tree.'
SOURCE_10_COPYRIGHTED='yes'
SOURCE_10_ACQUISITION_BASIS='Official GCC repository identity, acquired from its public GitHub mirror at the identical pinned GCC 15.2.0 commit to avoid Sourceware rate limiting.'

SOURCE_11_ID='binutils-gdb'
SOURCE_11_PATH='binutils-gdb'
SOURCE_11_LICENSE='GPL-3.0-or-later'
SOURCE_11_NAME='gnu/binutils-gdb'
SOURCE_11_VERSION='2bc7af1ff7732451b6a7b09462a815c3284f9613'
SOURCE_11_URL='https://sourceware.org/git/binutils-gdb.git'
SOURCE_11_CATEGORY='public-dataset'
SOURCE_11_LICENSE_DECLARATION='GPL-3.0-or-later'
SOURCE_11_LICENSE_URL='https://sourceware.org/git/?p=binutils-gdb.git;a=blob;f=COPYING3;hb=2bc7af1ff7732451b6a7b09462a815c3284f9613'
SOURCE_11_CONTENT_TYPES='source code'
SOURCE_11_LANGUAGES='C
C++'
SOURCE_11_SELECTION='Tracked project files selected by the reviewed --source-code profile; incorporated component notices remain in the source tree.'
SOURCE_11_COPYRIGHTED='yes'
SOURCE_11_ACQUISITION_BASIS='Official Sourceware binutils-gdb Git repository at the pinned binutils 2.45 commit.'

SOURCE_12_ID='grub'
SOURCE_12_PATH='grub'
SOURCE_12_LICENSE='GPL-3.0-or-later'
SOURCE_12_NAME='gnu/grub'
SOURCE_12_VERSION='5ca9db22e8ed0dbebb2aec53722972de0680a463'
SOURCE_12_URL='https://git.savannah.gnu.org/cgit/grub.git'
SOURCE_12_CATEGORY='public-dataset'
SOURCE_12_LICENSE_DECLARATION='GPL-3.0-or-later'
SOURCE_12_LICENSE_URL='https://git.savannah.gnu.org/cgit/grub.git/tree/COPYING?id=5ca9db22e8ed0dbebb2aec53722972de0680a463'
SOURCE_12_CONTENT_TYPES='source code'
SOURCE_12_LANGUAGES='Assembly
C'
SOURCE_12_SELECTION='Tracked project files selected by the reviewed --source-code profile.'
SOURCE_12_COPYRIGHTED='yes'
SOURCE_12_ACQUISITION_BASIS='Official GNU GRUB Git repository at the pinned 2.12 commit.'

SOURCE_13_ID='autoconf'
SOURCE_13_PATH='autoconf'
SOURCE_13_LICENSE='GPL-3.0-or-later'
SOURCE_13_NAME='gnu/autoconf'
SOURCE_13_VERSION='6199cff2909e0ac84c9391aa49ed097d6a33268d'
SOURCE_13_URL='https://git.savannah.gnu.org/cgit/autoconf.git'
SOURCE_13_CATEGORY='public-dataset'
SOURCE_13_LICENSE_DECLARATION='GPL-3.0-or-later'
SOURCE_13_LICENSE_URL='https://git.savannah.gnu.org/cgit/autoconf.git/tree/COPYING?id=6199cff2909e0ac84c9391aa49ed097d6a33268d'
SOURCE_13_CONTENT_TYPES='source code'
SOURCE_13_LANGUAGES='M4
Perl
Shell'
SOURCE_13_SELECTION='Tracked project files selected by the reviewed --source-code profile.'
SOURCE_13_COPYRIGHTED='yes'
SOURCE_13_ACQUISITION_BASIS='Official GNU Autoconf Git repository at the pinned 2.72 commit.'

SOURCE_14_ID='automake'
SOURCE_14_PATH='automake'
SOURCE_14_LICENSE='GPL-2.0-or-later'
SOURCE_14_NAME='gnu/automake'
SOURCE_14_VERSION='153298e27fa9414b25453440a2f36e1bb7bedfc1'
SOURCE_14_URL='https://git.savannah.gnu.org/cgit/automake.git'
SOURCE_14_CATEGORY='public-dataset'
SOURCE_14_LICENSE_DECLARATION='GPL-2.0-or-later'
SOURCE_14_LICENSE_URL='https://git.savannah.gnu.org/cgit/automake.git/tree/COPYING?id=153298e27fa9414b25453440a2f36e1bb7bedfc1'
SOURCE_14_CONTENT_TYPES='source code'
SOURCE_14_LANGUAGES='M4
Perl
Shell'
SOURCE_14_SELECTION='Tracked project files selected by the reviewed --source-code profile.'
SOURCE_14_COPYRIGHTED='yes'
SOURCE_14_ACQUISITION_BASIS='Official GNU Automake Git repository at the pinned 1.18.1 commit.'

SOURCE_15_ID='m4'
SOURCE_15_PATH='m4'
SOURCE_15_LICENSE='GPL-3.0-or-later'
SOURCE_15_NAME='gnu/m4'
SOURCE_15_VERSION='8103916f2cbf885cae4f6c7c6e6f142f4b8c43f2'
SOURCE_15_URL='https://git.savannah.gnu.org/cgit/m4.git'
SOURCE_15_CATEGORY='public-dataset'
SOURCE_15_LICENSE_DECLARATION='GPL-3.0-or-later'
SOURCE_15_LICENSE_URL='https://git.savannah.gnu.org/cgit/m4.git/tree/COPYING?id=8103916f2cbf885cae4f6c7c6e6f142f4b8c43f2'
SOURCE_15_CONTENT_TYPES='source code'
SOURCE_15_LANGUAGES='C
M4'
SOURCE_15_SELECTION='Tracked project files selected by the reviewed --source-code profile.'
SOURCE_15_COPYRIGHTED='yes'
SOURCE_15_ACQUISITION_BASIS='Official GNU M4 Git repository at the pinned 1.4.20 commit.'

SOURCE_16_ID='bison'
SOURCE_16_PATH='bison'
SOURCE_16_LICENSE='GPL-3.0-or-later'
SOURCE_16_NAME='gnu/bison'
SOURCE_16_VERSION='9beba1919cad5dd08b0cac277c27896808719e4b'
SOURCE_16_URL='https://git.savannah.gnu.org/cgit/bison.git'
SOURCE_16_CATEGORY='public-dataset'
SOURCE_16_LICENSE_DECLARATION='GPL-3.0-or-later'
SOURCE_16_LICENSE_URL='https://git.savannah.gnu.org/cgit/bison.git/tree/COPYING?id=9beba1919cad5dd08b0cac277c27896808719e4b'
SOURCE_16_CONTENT_TYPES='source code'
SOURCE_16_LANGUAGES='C
C++
M4'
SOURCE_16_SELECTION='Tracked project files selected by the reviewed --source-code profile; generated-parser exceptions remain documented upstream.'
SOURCE_16_COPYRIGHTED='yes'
SOURCE_16_ACQUISITION_BASIS='Official GNU Bison Git repository at the pinned 3.8.2 commit.'

SOURCE_17_ID='gettext'
SOURCE_17_PATH='gettext'
SOURCE_17_LICENSE='GPL-3.0-or-later'
SOURCE_17_NAME='gnu/gettext'
SOURCE_17_VERSION='d16c3c8f0554be9a6983bb14fae4987340f8f4c6'
SOURCE_17_URL='https://git.savannah.gnu.org/cgit/gettext.git'
SOURCE_17_CATEGORY='public-dataset'
SOURCE_17_LICENSE_DECLARATION='GPL-3.0-or-later'
SOURCE_17_LICENSE_URL='https://git.savannah.gnu.org/cgit/gettext.git/tree/COPYING?id=d16c3c8f0554be9a6983bb14fae4987340f8f4c6'
SOURCE_17_CONTENT_TYPES='source code'
SOURCE_17_LANGUAGES='C
C++
Java'
SOURCE_17_SELECTION='Tracked project files selected by the reviewed --source-code profile; library and runtime exceptions remain documented upstream.'
SOURCE_17_COPYRIGHTED='yes'
SOURCE_17_ACQUISITION_BASIS='Official GNU Gettext Git repository at the pinned 0.26 commit.'

SOURCE_18_ID='libtool'
SOURCE_18_PATH='libtool'
SOURCE_18_LICENSE='GPL-2.0-or-later'
SOURCE_18_NAME='gnu/libtool'
SOURCE_18_VERSION='db22f7fce768951ac89a83ea3ddedbb8a46511f7'
SOURCE_18_URL='https://git.savannah.gnu.org/cgit/libtool.git'
SOURCE_18_CATEGORY='public-dataset'
SOURCE_18_LICENSE_DECLARATION='GPL-2.0-or-later'
SOURCE_18_LICENSE_URL='https://git.savannah.gnu.org/cgit/libtool.git/tree/COPYING?id=db22f7fce768951ac89a83ea3ddedbb8a46511f7'
SOURCE_18_CONTENT_TYPES='source code'
SOURCE_18_LANGUAGES='C
M4
Shell'
SOURCE_18_SELECTION='Tracked project files selected by the reviewed --source-code profile.'
SOURCE_18_COPYRIGHTED='yes'
SOURCE_18_ACQUISITION_BASIS='Official GNU Libtool Git repository at the pinned 2.5.4 commit.'

SOURCE_19_ID='inetutils'
SOURCE_19_PATH='inetutils'
SOURCE_19_LICENSE='GPL-3.0-or-later'
SOURCE_19_NAME='gnu/inetutils'
SOURCE_19_VERSION='380e69a57239bce9cc6a9a9318bb92e001f31cac'
SOURCE_19_URL='https://git.savannah.gnu.org/cgit/inetutils.git'
SOURCE_19_CATEGORY='public-dataset'
SOURCE_19_LICENSE_DECLARATION='GPL-3.0-or-later'
SOURCE_19_LICENSE_URL='https://git.savannah.gnu.org/cgit/inetutils.git/tree/COPYING?id=380e69a57239bce9cc6a9a9318bb92e001f31cac'
SOURCE_19_CONTENT_TYPES='source code'
SOURCE_19_LANGUAGES='C'
SOURCE_19_SELECTION='Tracked project files selected by the reviewed --source-code profile.'
SOURCE_19_COPYRIGHTED='yes'
SOURCE_19_ACQUISITION_BASIS='Official GNU Inetutils Git repository at the pinned 2.7 commit.'

SOURCE_20_ID='gperf'
SOURCE_20_PATH='gperf'
SOURCE_20_LICENSE='GPL-3.0-or-later'
SOURCE_20_NAME='gnu/gperf'
SOURCE_20_VERSION='d2aeec9b9c1fd04dbf747afe4ada8e772d315ccd'
SOURCE_20_URL='https://git.savannah.gnu.org/cgit/gperf.git'
SOURCE_20_CATEGORY='public-dataset'
SOURCE_20_LICENSE_DECLARATION='GPL-3.0-or-later'
SOURCE_20_LICENSE_URL='https://git.savannah.gnu.org/cgit/gperf.git/tree/COPYING?id=d2aeec9b9c1fd04dbf747afe4ada8e772d315ccd'
SOURCE_20_CONTENT_TYPES='source code'
SOURCE_20_LANGUAGES='C
C++'
SOURCE_20_SELECTION='Tracked project files selected by the reviewed --source-code profile; generated-output terms remain documented upstream.'
SOURCE_20_COPYRIGHTED='yes'
SOURCE_20_ACQUISITION_BASIS='Official GNU gperf Git repository at the pinned 3.3 commit.'

SOURCE_21_ID='procps-ng'
SOURCE_21_PATH='procps-ng'
SOURCE_21_LICENSE='GPL-2.0-or-later AND LGPL-2.1-or-later'
SOURCE_21_NAME='procps-ng/procps'
SOURCE_21_VERSION='f46b2f7929cdfe2913ed0a7f585b09d6adbf994e'
SOURCE_21_URL='https://gitlab.com/procps-ng/procps'
SOURCE_21_CATEGORY='public-dataset'
SOURCE_21_LICENSE_DECLARATION='GPL-2.0-or-later AND LGPL-2.1-or-later'
SOURCE_21_LICENSE_URL='https://gitlab.com/procps-ng/procps/-/blob/f46b2f7929cdfe2913ed0a7f585b09d6adbf994e/COPYING'
SOURCE_21_CONTENT_TYPES='source code'
SOURCE_21_LANGUAGES='C'
SOURCE_21_SELECTION='Tracked project files selected by the reviewed --source-code profile; GPL utility and LGPL library licensing remains identified upstream.'
SOURCE_21_COPYRIGHTED='yes'
SOURCE_21_ACQUISITION_BASIS='Official procps-ng Git repository at the pinned v4.0.5 commit.'

SOURCE_22_ID='psmisc'
SOURCE_22_PATH='psmisc'
SOURCE_22_LICENSE='GPL-2.0-or-later'
SOURCE_22_NAME='psmisc/psmisc'
SOURCE_22_VERSION='9091d6dbcce3d8fb87adf9249a2eb346d25a562c'
SOURCE_22_URL='https://gitlab.com/psmisc/psmisc'
SOURCE_22_CATEGORY='public-dataset'
SOURCE_22_LICENSE_DECLARATION='GPL-2.0-or-later'
SOURCE_22_LICENSE_URL='https://gitlab.com/psmisc/psmisc/-/blob/9091d6dbcce3d8fb87adf9249a2eb346d25a562c/COPYING'
SOURCE_22_CONTENT_TYPES='source code'
SOURCE_22_LANGUAGES='C'
SOURCE_22_SELECTION='Tracked project files selected by the reviewed --source-code profile.'
SOURCE_22_COPYRIGHTED='yes'
SOURCE_22_ACQUISITION_BASIS='Official psmisc Git repository at the pinned v23.7 commit.'

FETCHER_OUTPUT=${1-}
FETCHER_ARGUMENT_COUNT=$#
FETCHER_SIZE='100G'
FETCH_COUNT='22'
FETCH_1_METHOD='git'
FETCH_1_SOURCE='1'
FETCH_1_PATH='linux-kernel'
FETCH_1_URL='https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git'
FETCH_1_REF='refs/tags/v6.16'
FETCH_1_REVISION='038d61fd642278bab63ee8ef722c50d10ab01e8f'
FETCH_1_OPTIONS='--skip-symlinks
--filter-blobs
--source-code'

FETCH_2_METHOD='git'
FETCH_2_SOURCE='2'
FETCH_2_PATH='kmod'
FETCH_2_URL='https://git.kernel.org/pub/scm/utils/kernel/kmod/kmod.git'
FETCH_2_REF='refs/tags/v34.2'
FETCH_2_REVISION='13330c958deef15c227a9c83d8ba72106152fd7f'
FETCH_2_OPTIONS='--skip-symlinks
--filter-blobs
--source-code'

FETCH_3_METHOD='git'
FETCH_3_SOURCE='3'
FETCH_3_PATH='iproute2'
FETCH_3_URL='https://git.kernel.org/pub/scm/network/iproute2/iproute2.git'
FETCH_3_REF='refs/tags/v6.16.0'
FETCH_3_REVISION='915d3eafcc19706c27b220134b25c24a5b9913b3'
FETCH_3_OPTIONS='--skip-symlinks
--filter-blobs
--source-code'

FETCH_4_METHOD='git'
FETCH_4_SOURCE='4'
FETCH_4_PATH='nftables'
FETCH_4_URL='https://git.netfilter.org/nftables'
FETCH_4_REF='refs/tags/v1.1.5'
FETCH_4_REVISION='5fb748243550f857bb82cddcdce642f8bf269026'
FETCH_4_OPTIONS='--skip-symlinks
--filter-blobs
--source-code'

FETCH_5_METHOD='git'
FETCH_5_SOURCE='5'
FETCH_5_PATH='iptables'
FETCH_5_URL='https://git.netfilter.org/iptables'
FETCH_5_REF='refs/tags/v1.8.11'
FETCH_5_REVISION='0506bea1dcc8f12d94e7c32bf2fb04abb3fdd269'
FETCH_5_OPTIONS='--skip-symlinks
--filter-blobs
--source-code'

FETCH_6_METHOD='git'
FETCH_6_SOURCE='6'
FETCH_6_PATH='btrfs-progs'
FETCH_6_URL='https://git.kernel.org/pub/scm/linux/kernel/git/kdave/btrfs-progs.git'
FETCH_6_REF='refs/tags/v6.16'
FETCH_6_REVISION='54694de98fdc4ea5678cdd77b920c044bbf64f26'
FETCH_6_OPTIONS='--skip-symlinks
--filter-blobs
--source-code'

FETCH_7_METHOD='git'
FETCH_7_SOURCE='7'
FETCH_7_PATH='xfsprogs'
FETCH_7_URL='https://git.kernel.org/pub/scm/fs/xfs/xfsprogs-dev.git'
FETCH_7_REF='refs/tags/v6.16.0'
FETCH_7_REVISION='1d287f3d958ebc425275d6a08ad6977e13e52fac'
FETCH_7_OPTIONS='--skip-symlinks
--filter-blobs
--source-code'

FETCH_8_METHOD='git'
FETCH_8_SOURCE='8'
FETCH_8_PATH='busybox'
FETCH_8_URL='https://git.busybox.net/busybox'
FETCH_8_REF='refs/tags/1_37_0'
FETCH_8_REVISION='be7d1b7b1701d225379bc1665487ed0871b592a5'
FETCH_8_OPTIONS='--skip-symlinks
--filter-blobs
--source-code'

FETCH_9_METHOD='git'
FETCH_9_SOURCE='9'
FETCH_9_PATH='glibc'
FETCH_9_URL='https://sourceware.org/git/glibc.git'
FETCH_9_REF='refs/tags/glibc-2.42'
FETCH_9_REVISION='d2097651cc57834dbfcaa102ddfacae0d86cfb66'
FETCH_9_OPTIONS='--skip-symlinks
--filter-blobs
--source-code'

FETCH_10_METHOD='git'
FETCH_10_SOURCE='10'
FETCH_10_PATH='gcc'
FETCH_10_URL='https://github.com/gcc-mirror/gcc.git'
FETCH_10_REF='refs/tags/releases/gcc-15.2.0'
FETCH_10_REVISION='5115c7e447fc07457443df874bf57840e8316d5f'
FETCH_10_OPTIONS='--skip-symlinks
--filter-blobs
--source-code'

FETCH_11_METHOD='git'
FETCH_11_SOURCE='11'
FETCH_11_PATH='binutils-gdb'
FETCH_11_URL='https://sourceware.org/git/binutils-gdb.git'
FETCH_11_REF='refs/tags/binutils-2_45'
FETCH_11_REVISION='2bc7af1ff7732451b6a7b09462a815c3284f9613'
FETCH_11_OPTIONS='--skip-symlinks
--filter-blobs
--source-code'

FETCH_12_METHOD='git'
FETCH_12_SOURCE='12'
FETCH_12_PATH='grub'
FETCH_12_URL='https://git.savannah.gnu.org/git/grub.git'
FETCH_12_REF='refs/tags/grub-2.12'
FETCH_12_REVISION='5ca9db22e8ed0dbebb2aec53722972de0680a463'
FETCH_12_OPTIONS='--skip-symlinks
--filter-blobs
--source-code'

FETCH_13_METHOD='git'
FETCH_13_SOURCE='13'
FETCH_13_PATH='autoconf'
FETCH_13_URL='https://git.savannah.gnu.org/git/autoconf.git'
FETCH_13_REF='refs/tags/v2.72'
FETCH_13_REVISION='6199cff2909e0ac84c9391aa49ed097d6a33268d'
FETCH_13_OPTIONS='--skip-symlinks
--filter-blobs
--source-code'

FETCH_14_METHOD='git'
FETCH_14_SOURCE='14'
FETCH_14_PATH='automake'
FETCH_14_URL='https://git.savannah.gnu.org/git/automake.git'
FETCH_14_REF='refs/tags/v1.18.1'
FETCH_14_REVISION='153298e27fa9414b25453440a2f36e1bb7bedfc1'
FETCH_14_OPTIONS='--skip-symlinks
--filter-blobs
--source-code'

FETCH_15_METHOD='git'
FETCH_15_SOURCE='15'
FETCH_15_PATH='m4'
FETCH_15_URL='https://git.savannah.gnu.org/git/m4.git'
FETCH_15_REF='refs/tags/v1.4.20'
FETCH_15_REVISION='8103916f2cbf885cae4f6c7c6e6f142f4b8c43f2'
FETCH_15_OPTIONS='--skip-symlinks
--filter-blobs
--source-code'

FETCH_16_METHOD='git'
FETCH_16_SOURCE='16'
FETCH_16_PATH='bison'
FETCH_16_URL='https://git.savannah.gnu.org/git/bison.git'
FETCH_16_REF='refs/tags/v3.8.2'
FETCH_16_REVISION='9beba1919cad5dd08b0cac277c27896808719e4b'
FETCH_16_OPTIONS='--skip-symlinks
--filter-blobs
--source-code'

FETCH_17_METHOD='git'
FETCH_17_SOURCE='17'
FETCH_17_PATH='gettext'
FETCH_17_URL='https://git.savannah.gnu.org/git/gettext.git'
FETCH_17_REF='refs/tags/v0.26'
FETCH_17_REVISION='d16c3c8f0554be9a6983bb14fae4987340f8f4c6'
FETCH_17_OPTIONS='--skip-symlinks
--filter-blobs
--source-code'

FETCH_18_METHOD='git'
FETCH_18_SOURCE='18'
FETCH_18_PATH='libtool'
FETCH_18_URL='https://git.savannah.gnu.org/git/libtool.git'
FETCH_18_REF='refs/tags/v2.5.4'
FETCH_18_REVISION='db22f7fce768951ac89a83ea3ddedbb8a46511f7'
FETCH_18_OPTIONS='--skip-symlinks
--filter-blobs
--source-code'

FETCH_19_METHOD='git'
FETCH_19_SOURCE='19'
FETCH_19_PATH='inetutils'
FETCH_19_URL='https://git.savannah.gnu.org/git/inetutils.git'
FETCH_19_REF='refs/tags/v2.7'
FETCH_19_REVISION='380e69a57239bce9cc6a9a9318bb92e001f31cac'
FETCH_19_OPTIONS='--skip-symlinks
--filter-blobs
--source-code'

FETCH_20_METHOD='git'
FETCH_20_SOURCE='20'
FETCH_20_PATH='gperf'
FETCH_20_URL='https://git.savannah.gnu.org/git/gperf.git'
FETCH_20_REF='refs/tags/v3.3'
FETCH_20_REVISION='d2aeec9b9c1fd04dbf747afe4ada8e772d315ccd'
FETCH_20_OPTIONS='--skip-symlinks
--filter-blobs
--source-code'

FETCH_21_METHOD='git'
FETCH_21_SOURCE='21'
FETCH_21_PATH='procps-ng'
FETCH_21_URL='https://gitlab.com/procps-ng/procps.git'
FETCH_21_REF='refs/tags/v4.0.5'
FETCH_21_REVISION='f46b2f7929cdfe2913ed0a7f585b09d6adbf994e'
FETCH_21_OPTIONS='--skip-symlinks
--filter-blobs
--source-code'

FETCH_22_METHOD='git'
FETCH_22_SOURCE='22'
FETCH_22_PATH='psmisc'
FETCH_22_URL='https://gitlab.com/psmisc/psmisc.git'
FETCH_22_REF='refs/tags/v23.7'
FETCH_22_REVISION='9091d6dbcce3d8fb87adf9249a2eb346d25a562c'
FETCH_22_OPTIONS='--skip-symlinks
--filter-blobs
--source-code'

script_dir=$(CDPATH='' cd -- "$(dirname -- "$0")" && pwd -P)
. "$script_dir/../functions.sh"
fetcher_main
