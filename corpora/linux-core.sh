#!/bin/sh
set -eu

script_dir=$(CDPATH='' cd -- "$(dirname -- "$0")" && pwd -P)
. "$script_dir/../functions.sh"

fetcher_begin "$@"
fetcher_require jq find sort awk wc git tar
fetcher_size 100G
fetcher_git 'linux-kernel' 'https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git' 'refs/tags/v6.16' '038d61fd642278bab63ee8ef722c50d10ab01e8f' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'kmod' 'https://git.kernel.org/pub/scm/utils/kernel/kmod/kmod.git' 'refs/tags/v34.2' '13330c958deef15c227a9c83d8ba72106152fd7f' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'iproute2' 'https://git.kernel.org/pub/scm/network/iproute2/iproute2.git' 'refs/tags/v6.16.0' '915d3eafcc19706c27b220134b25c24a5b9913b3' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'nftables' 'https://git.netfilter.org/nftables' 'refs/tags/v1.1.5' '5fb748243550f857bb82cddcdce642f8bf269026' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'iptables' 'https://git.netfilter.org/iptables' 'refs/tags/v1.8.11' '0506bea1dcc8f12d94e7c32bf2fb04abb3fdd269' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'btrfs-progs' 'https://git.kernel.org/pub/scm/linux/kernel/git/kdave/btrfs-progs.git' 'refs/tags/v6.16' '54694de98fdc4ea5678cdd77b920c044bbf64f26' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'xfsprogs' 'https://git.kernel.org/pub/scm/fs/xfs/xfsprogs-dev.git' 'refs/tags/v6.16.0' '1d287f3d958ebc425275d6a08ad6977e13e52fac' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'busybox' 'https://git.busybox.net/busybox' 'refs/tags/1_37_0' 'be7d1b7b1701d225379bc1665487ed0871b592a5' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'glibc' 'https://sourceware.org/git/glibc.git' 'refs/tags/glibc-2.42' 'd2097651cc57834dbfcaa102ddfacae0d86cfb66' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'gcc' 'https://github.com/gcc-mirror/gcc.git' 'refs/tags/releases/gcc-15.2.0' '5115c7e447fc07457443df874bf57840e8316d5f' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'binutils-gdb' 'https://sourceware.org/git/binutils-gdb.git' 'refs/tags/binutils-2_45' '2bc7af1ff7732451b6a7b09462a815c3284f9613' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'grub' 'https://git.savannah.gnu.org/git/grub.git' 'refs/tags/grub-2.12' '5ca9db22e8ed0dbebb2aec53722972de0680a463' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'autoconf' 'https://git.savannah.gnu.org/git/autoconf.git' 'refs/tags/v2.72' '6199cff2909e0ac84c9391aa49ed097d6a33268d' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'automake' 'https://git.savannah.gnu.org/git/automake.git' 'refs/tags/v1.18.1' '153298e27fa9414b25453440a2f36e1bb7bedfc1' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'm4' 'https://git.savannah.gnu.org/git/m4.git' 'refs/tags/v1.4.20' '8103916f2cbf885cae4f6c7c6e6f142f4b8c43f2' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'bison' 'https://git.savannah.gnu.org/git/bison.git' 'refs/tags/v3.8.2' '9beba1919cad5dd08b0cac277c27896808719e4b' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'gettext' 'https://git.savannah.gnu.org/git/gettext.git' 'refs/tags/v0.26' 'd16c3c8f0554be9a6983bb14fae4987340f8f4c6' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'libtool' 'https://git.savannah.gnu.org/git/libtool.git' 'refs/tags/v2.5.4' 'db22f7fce768951ac89a83ea3ddedbb8a46511f7' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'inetutils' 'https://git.savannah.gnu.org/git/inetutils.git' 'refs/tags/v2.7' '380e69a57239bce9cc6a9a9318bb92e001f31cac' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'gperf' 'https://git.savannah.gnu.org/git/gperf.git' 'refs/tags/v3.3' 'd2aeec9b9c1fd04dbf747afe4ada8e772d315ccd' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'procps-ng' 'https://gitlab.com/procps-ng/procps.git' 'refs/tags/v4.0.5' 'f46b2f7929cdfe2913ed0a7f585b09d6adbf994e' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'psmisc' 'https://gitlab.com/psmisc/psmisc.git' 'refs/tags/v23.7' '9091d6dbcce3d8fb87adf9249a2eb346d25a562c' '--skip-symlinks' '--filter-blobs' '--source-code'

# shellcheck disable=SC2119
fetcher_manifest <<'JSON'
{
  "corpus": {
    "id": "linux-core",
    "title": "Linux Core — Copyleft",
    "description": "Pinned copyleft source for the Linux kernel and foundational GNU/Linux toolchain, boot, module, networking, filesystem, and process projects not already represented in code/copyleft.",
    "destination": "code/linux-core"
  },
  "sources": [
    {
      "id": "linux-kernel",
      "path": "linux-kernel",
      "license": "GPL-2.0-only",
      "source": {
        "name": "linux/kernel",
        "version": "038d61fd642278bab63ee8ef722c50d10ab01e8f",
        "url": "https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/COPYING?id=038d61fd642278bab63ee8ef722c50d10ab01e8f",
          "declaration": "GPL-2.0-only"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "Assembly",
            "C",
            "Rust"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Official Linux kernel Git repository at the pinned v6.16 commit."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git",
          "revision": "038d61fd642278bab63ee8ef722c50d10ab01e8f",
          "ref": "refs/tags/v6.16"
        }
      ]
    },
    {
      "id": "kmod",
      "path": "kmod",
      "license": "GPL-2.0-or-later AND LGPL-2.1-or-later",
      "source": {
        "name": "kernel/kmod",
        "version": "13330c958deef15c227a9c83d8ba72106152fd7f",
        "url": "https://git.kernel.org/pub/scm/utils/kernel/kmod/kmod.git",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://git.kernel.org/pub/scm/utils/kernel/kmod/kmod.git/tree/COPYING?id=13330c958deef15c227a9c83d8ba72106152fd7f",
          "declaration": "GPL-2.0-or-later AND LGPL-2.1-or-later"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "C"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile; library and utility licensing remains identified by upstream file headers.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Official kmod Git repository at the pinned v34.2 commit."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://git.kernel.org/pub/scm/utils/kernel/kmod/kmod.git",
          "revision": "13330c958deef15c227a9c83d8ba72106152fd7f",
          "ref": "refs/tags/v34.2"
        }
      ]
    },
    {
      "id": "iproute2",
      "path": "iproute2",
      "license": "GPL-2.0-or-later",
      "source": {
        "name": "kernel/iproute2",
        "version": "915d3eafcc19706c27b220134b25c24a5b9913b3",
        "url": "https://git.kernel.org/pub/scm/network/iproute2/iproute2.git",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://git.kernel.org/pub/scm/network/iproute2/iproute2.git/tree/COPYING?id=915d3eafcc19706c27b220134b25c24a5b9913b3",
          "declaration": "GPL-2.0-or-later"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "C"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Official iproute2 Git repository at the pinned v6.16.0 commit."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://git.kernel.org/pub/scm/network/iproute2/iproute2.git",
          "revision": "915d3eafcc19706c27b220134b25c24a5b9913b3",
          "ref": "refs/tags/v6.16.0"
        }
      ]
    },
    {
      "id": "nftables",
      "path": "nftables",
      "license": "GPL-2.0-or-later",
      "source": {
        "name": "netfilter/nftables",
        "version": "5fb748243550f857bb82cddcdce642f8bf269026",
        "url": "https://git.netfilter.org/nftables",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://git.netfilter.org/nftables/tree/COPYING?id=5fb748243550f857bb82cddcdce642f8bf269026",
          "declaration": "GPL-2.0-or-later"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "C"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Official Netfilter Git repository at the pinned v1.1.5 commit."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://git.netfilter.org/nftables",
          "revision": "5fb748243550f857bb82cddcdce642f8bf269026",
          "ref": "refs/tags/v1.1.5"
        }
      ]
    },
    {
      "id": "iptables",
      "path": "iptables",
      "license": "GPL-2.0-only",
      "source": {
        "name": "netfilter/iptables",
        "version": "0506bea1dcc8f12d94e7c32bf2fb04abb3fdd269",
        "url": "https://git.netfilter.org/iptables",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://git.netfilter.org/iptables/tree/COPYING?id=0506bea1dcc8f12d94e7c32bf2fb04abb3fdd269",
          "declaration": "GPL-2.0-only"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "C"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Official Netfilter Git repository at the pinned v1.8.11 commit."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://git.netfilter.org/iptables",
          "revision": "0506bea1dcc8f12d94e7c32bf2fb04abb3fdd269",
          "ref": "refs/tags/v1.8.11"
        }
      ]
    },
    {
      "id": "btrfs-progs",
      "path": "btrfs-progs",
      "license": "GPL-2.0-only",
      "source": {
        "name": "kernel/btrfs-progs",
        "version": "54694de98fdc4ea5678cdd77b920c044bbf64f26",
        "url": "https://git.kernel.org/pub/scm/linux/kernel/git/kdave/btrfs-progs.git",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://git.kernel.org/pub/scm/linux/kernel/git/kdave/btrfs-progs.git/tree/COPYING?id=54694de98fdc4ea5678cdd77b920c044bbf64f26",
          "declaration": "GPL-2.0-only"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "C"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Official btrfs-progs Git repository at the pinned v6.16 commit."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://git.kernel.org/pub/scm/linux/kernel/git/kdave/btrfs-progs.git",
          "revision": "54694de98fdc4ea5678cdd77b920c044bbf64f26",
          "ref": "refs/tags/v6.16"
        }
      ]
    },
    {
      "id": "xfsprogs",
      "path": "xfsprogs",
      "license": "GPL-2.0-only",
      "source": {
        "name": "kernel/xfsprogs",
        "version": "1d287f3d958ebc425275d6a08ad6977e13e52fac",
        "url": "https://git.kernel.org/pub/scm/fs/xfs/xfsprogs-dev.git",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://git.kernel.org/pub/scm/fs/xfs/xfsprogs-dev.git/tree/LICENSES/GPL-2.0?id=1d287f3d958ebc425275d6a08ad6977e13e52fac",
          "declaration": "GPL-2.0-only"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "C"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Official xfsprogs Git repository at the pinned v6.16.0 commit."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://git.kernel.org/pub/scm/fs/xfs/xfsprogs-dev.git",
          "revision": "1d287f3d958ebc425275d6a08ad6977e13e52fac",
          "ref": "refs/tags/v6.16.0"
        }
      ]
    },
    {
      "id": "busybox",
      "path": "busybox",
      "license": "GPL-2.0-only",
      "source": {
        "name": "busybox/busybox",
        "version": "be7d1b7b1701d225379bc1665487ed0871b592a5",
        "url": "https://git.busybox.net/busybox",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://git.busybox.net/busybox/tree/LICENSE?id=be7d1b7b1701d225379bc1665487ed0871b592a5",
          "declaration": "GPL-2.0-only"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "C",
            "Shell"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Official BusyBox Git repository at the pinned 1.37.0 commit."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://git.busybox.net/busybox",
          "revision": "be7d1b7b1701d225379bc1665487ed0871b592a5",
          "ref": "refs/tags/1_37_0"
        }
      ]
    },
    {
      "id": "glibc",
      "path": "glibc",
      "license": "LGPL-2.1-or-later",
      "source": {
        "name": "gnu/glibc",
        "version": "d2097651cc57834dbfcaa102ddfacae0d86cfb66",
        "url": "https://sourceware.org/git/glibc.git",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://sourceware.org/git/?p=glibc.git;a=blob;f=COPYING.LIB;hb=d2097651cc57834dbfcaa102ddfacae0d86cfb66",
          "declaration": "LGPL-2.1-or-later"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "Assembly",
            "C"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Official glibc Git repository at the pinned glibc-2.42 commit."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://sourceware.org/git/glibc.git",
          "revision": "d2097651cc57834dbfcaa102ddfacae0d86cfb66",
          "ref": "refs/tags/glibc-2.42"
        }
      ]
    },
    {
      "id": "gcc",
      "path": "gcc",
      "license": "GPL-3.0-or-later",
      "source": {
        "name": "gnu/gcc",
        "version": "5115c7e447fc07457443df874bf57840e8316d5f",
        "url": "https://gcc.gnu.org/git/gcc.git",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://github.com/gcc-mirror/gcc/blob/5115c7e447fc07457443df874bf57840e8316d5f/COPYING3",
          "declaration": "GPL-3.0-or-later"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "Ada",
            "C",
            "C++",
            "D",
            "Fortran",
            "Go",
            "Rust"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile; runtime-library exceptions and incorporated component notices remain in the source tree.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Official GCC repository identity, acquired from its public GitHub mirror at the identical pinned GCC 15.2.0 commit to avoid Sourceware rate limiting."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://github.com/gcc-mirror/gcc.git",
          "revision": "5115c7e447fc07457443df874bf57840e8316d5f",
          "ref": "refs/tags/releases/gcc-15.2.0"
        }
      ]
    },
    {
      "id": "binutils-gdb",
      "path": "binutils-gdb",
      "license": "GPL-3.0-or-later",
      "source": {
        "name": "gnu/binutils-gdb",
        "version": "2bc7af1ff7732451b6a7b09462a815c3284f9613",
        "url": "https://sourceware.org/git/binutils-gdb.git",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://sourceware.org/git/?p=binutils-gdb.git;a=blob;f=COPYING3;hb=2bc7af1ff7732451b6a7b09462a815c3284f9613",
          "declaration": "GPL-3.0-or-later"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "C",
            "C++"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile; incorporated component notices remain in the source tree.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Official Sourceware binutils-gdb Git repository at the pinned binutils 2.45 commit."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://sourceware.org/git/binutils-gdb.git",
          "revision": "2bc7af1ff7732451b6a7b09462a815c3284f9613",
          "ref": "refs/tags/binutils-2_45"
        }
      ]
    },
    {
      "id": "grub",
      "path": "grub",
      "license": "GPL-3.0-or-later",
      "source": {
        "name": "gnu/grub",
        "version": "5ca9db22e8ed0dbebb2aec53722972de0680a463",
        "url": "https://git.savannah.gnu.org/cgit/grub.git",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://git.savannah.gnu.org/cgit/grub.git/tree/COPYING?id=5ca9db22e8ed0dbebb2aec53722972de0680a463",
          "declaration": "GPL-3.0-or-later"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "Assembly",
            "C"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Official GNU GRUB Git repository at the pinned 2.12 commit."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://git.savannah.gnu.org/git/grub.git",
          "revision": "5ca9db22e8ed0dbebb2aec53722972de0680a463",
          "ref": "refs/tags/grub-2.12"
        }
      ]
    },
    {
      "id": "autoconf",
      "path": "autoconf",
      "license": "GPL-3.0-or-later",
      "source": {
        "name": "gnu/autoconf",
        "version": "6199cff2909e0ac84c9391aa49ed097d6a33268d",
        "url": "https://git.savannah.gnu.org/cgit/autoconf.git",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://git.savannah.gnu.org/cgit/autoconf.git/tree/COPYING?id=6199cff2909e0ac84c9391aa49ed097d6a33268d",
          "declaration": "GPL-3.0-or-later"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "M4",
            "Perl",
            "Shell"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Official GNU Autoconf Git repository at the pinned 2.72 commit."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://git.savannah.gnu.org/git/autoconf.git",
          "revision": "6199cff2909e0ac84c9391aa49ed097d6a33268d",
          "ref": "refs/tags/v2.72"
        }
      ]
    },
    {
      "id": "automake",
      "path": "automake",
      "license": "GPL-2.0-or-later",
      "source": {
        "name": "gnu/automake",
        "version": "153298e27fa9414b25453440a2f36e1bb7bedfc1",
        "url": "https://git.savannah.gnu.org/cgit/automake.git",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://git.savannah.gnu.org/cgit/automake.git/tree/COPYING?id=153298e27fa9414b25453440a2f36e1bb7bedfc1",
          "declaration": "GPL-2.0-or-later"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "M4",
            "Perl",
            "Shell"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Official GNU Automake Git repository at the pinned 1.18.1 commit."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://git.savannah.gnu.org/git/automake.git",
          "revision": "153298e27fa9414b25453440a2f36e1bb7bedfc1",
          "ref": "refs/tags/v1.18.1"
        }
      ]
    },
    {
      "id": "m4",
      "path": "m4",
      "license": "GPL-3.0-or-later",
      "source": {
        "name": "gnu/m4",
        "version": "8103916f2cbf885cae4f6c7c6e6f142f4b8c43f2",
        "url": "https://git.savannah.gnu.org/cgit/m4.git",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://git.savannah.gnu.org/cgit/m4.git/tree/COPYING?id=8103916f2cbf885cae4f6c7c6e6f142f4b8c43f2",
          "declaration": "GPL-3.0-or-later"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "C",
            "M4"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Official GNU M4 Git repository at the pinned 1.4.20 commit."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://git.savannah.gnu.org/git/m4.git",
          "revision": "8103916f2cbf885cae4f6c7c6e6f142f4b8c43f2",
          "ref": "refs/tags/v1.4.20"
        }
      ]
    },
    {
      "id": "bison",
      "path": "bison",
      "license": "GPL-3.0-or-later",
      "source": {
        "name": "gnu/bison",
        "version": "9beba1919cad5dd08b0cac277c27896808719e4b",
        "url": "https://git.savannah.gnu.org/cgit/bison.git",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://git.savannah.gnu.org/cgit/bison.git/tree/COPYING?id=9beba1919cad5dd08b0cac277c27896808719e4b",
          "declaration": "GPL-3.0-or-later"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "C",
            "C++",
            "M4"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile; generated-parser exceptions remain documented upstream.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Official GNU Bison Git repository at the pinned 3.8.2 commit."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://git.savannah.gnu.org/git/bison.git",
          "revision": "9beba1919cad5dd08b0cac277c27896808719e4b",
          "ref": "refs/tags/v3.8.2"
        }
      ]
    },
    {
      "id": "gettext",
      "path": "gettext",
      "license": "GPL-3.0-or-later",
      "source": {
        "name": "gnu/gettext",
        "version": "d16c3c8f0554be9a6983bb14fae4987340f8f4c6",
        "url": "https://git.savannah.gnu.org/cgit/gettext.git",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://git.savannah.gnu.org/cgit/gettext.git/tree/COPYING?id=d16c3c8f0554be9a6983bb14fae4987340f8f4c6",
          "declaration": "GPL-3.0-or-later"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "C",
            "C++",
            "Java"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile; library and runtime exceptions remain documented upstream.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Official GNU Gettext Git repository at the pinned 0.26 commit."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://git.savannah.gnu.org/git/gettext.git",
          "revision": "d16c3c8f0554be9a6983bb14fae4987340f8f4c6",
          "ref": "refs/tags/v0.26"
        }
      ]
    },
    {
      "id": "libtool",
      "path": "libtool",
      "license": "GPL-2.0-or-later",
      "source": {
        "name": "gnu/libtool",
        "version": "db22f7fce768951ac89a83ea3ddedbb8a46511f7",
        "url": "https://git.savannah.gnu.org/cgit/libtool.git",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://git.savannah.gnu.org/cgit/libtool.git/tree/COPYING?id=db22f7fce768951ac89a83ea3ddedbb8a46511f7",
          "declaration": "GPL-2.0-or-later"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "C",
            "M4",
            "Shell"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Official GNU Libtool Git repository at the pinned 2.5.4 commit."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://git.savannah.gnu.org/git/libtool.git",
          "revision": "db22f7fce768951ac89a83ea3ddedbb8a46511f7",
          "ref": "refs/tags/v2.5.4"
        }
      ]
    },
    {
      "id": "inetutils",
      "path": "inetutils",
      "license": "GPL-3.0-or-later",
      "source": {
        "name": "gnu/inetutils",
        "version": "380e69a57239bce9cc6a9a9318bb92e001f31cac",
        "url": "https://git.savannah.gnu.org/cgit/inetutils.git",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://git.savannah.gnu.org/cgit/inetutils.git/tree/COPYING?id=380e69a57239bce9cc6a9a9318bb92e001f31cac",
          "declaration": "GPL-3.0-or-later"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "C"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Official GNU Inetutils Git repository at the pinned 2.7 commit."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://git.savannah.gnu.org/git/inetutils.git",
          "revision": "380e69a57239bce9cc6a9a9318bb92e001f31cac",
          "ref": "refs/tags/v2.7"
        }
      ]
    },
    {
      "id": "gperf",
      "path": "gperf",
      "license": "GPL-3.0-or-later",
      "source": {
        "name": "gnu/gperf",
        "version": "d2aeec9b9c1fd04dbf747afe4ada8e772d315ccd",
        "url": "https://git.savannah.gnu.org/cgit/gperf.git",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://git.savannah.gnu.org/cgit/gperf.git/tree/COPYING?id=d2aeec9b9c1fd04dbf747afe4ada8e772d315ccd",
          "declaration": "GPL-3.0-or-later"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "C",
            "C++"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile; generated-output terms remain documented upstream.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Official GNU gperf Git repository at the pinned 3.3 commit."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://git.savannah.gnu.org/git/gperf.git",
          "revision": "d2aeec9b9c1fd04dbf747afe4ada8e772d315ccd",
          "ref": "refs/tags/v3.3"
        }
      ]
    },
    {
      "id": "procps-ng",
      "path": "procps-ng",
      "license": "GPL-2.0-or-later AND LGPL-2.1-or-later",
      "source": {
        "name": "procps-ng/procps",
        "version": "f46b2f7929cdfe2913ed0a7f585b09d6adbf994e",
        "url": "https://gitlab.com/procps-ng/procps",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://gitlab.com/procps-ng/procps/-/blob/f46b2f7929cdfe2913ed0a7f585b09d6adbf994e/COPYING",
          "declaration": "GPL-2.0-or-later AND LGPL-2.1-or-later"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "C"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile; GPL utility and LGPL library licensing remains identified upstream.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Official procps-ng Git repository at the pinned v4.0.5 commit."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://gitlab.com/procps-ng/procps.git",
          "revision": "f46b2f7929cdfe2913ed0a7f585b09d6adbf994e",
          "ref": "refs/tags/v4.0.5"
        }
      ]
    },
    {
      "id": "psmisc",
      "path": "psmisc",
      "license": "GPL-2.0-or-later",
      "source": {
        "name": "psmisc/psmisc",
        "version": "9091d6dbcce3d8fb87adf9249a2eb346d25a562c",
        "url": "https://gitlab.com/psmisc/psmisc",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://gitlab.com/psmisc/psmisc/-/blob/9091d6dbcce3d8fb87adf9249a2eb346d25a562c/COPYING",
          "declaration": "GPL-2.0-or-later"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "C"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Official psmisc Git repository at the pinned v23.7 commit."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://gitlab.com/psmisc/psmisc.git",
          "revision": "9091d6dbcce3d8fb87adf9249a2eb346d25a562c",
          "ref": "refs/tags/v23.7"
        }
      ]
    }
  ]
}
JSON
