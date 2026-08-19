#!/bin/sh
set -eu

script_dir=$(CDPATH='' cd -- "$(dirname -- "$0")" && pwd -P)
. "$script_dir/../functions.sh"

fetcher_begin "$@"
fetcher_require jq find sort awk wc git tar
fetcher_size 100G
fetcher_git 'musl' 'https://git.musl-libc.org/git/musl' 'refs/tags/v1.2.5' '0784374d561435f7c787a555aeab8ede699ed298' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'toybox' 'https://github.com/landley/toybox.git' 'refs/tags/0.8.12' '7eaddbdb9c1712801ddf131ed79ead0c981ffcb1' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'dash' 'https://git.kernel.org/pub/scm/utils/dash/dash.git' 'refs/tags/v0.5.12' '4bbf8721a3ac6401ced6a0454956801f6ba37256' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'sbase' 'https://git.suckless.org/sbase' 'c546c3a5724c81cee9a11d816a38ccdf17472129' 'c546c3a5724c81cee9a11d816a38ccdf17472129' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'ubase' 'https://git.suckless.org/ubase' 'e8249b49ca3e02032dece5e0cdac3d236667a6d9' 'e8249b49ca3e02032dece5e0cdac3d236667a6d9' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'openrc' 'https://github.com/OpenRC/openrc.git' 'refs/tags/0.62.3' 'f232308ad67cc94bd95e98a6af4a47fc58912b70' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'xbps' 'https://github.com/void-linux/xbps.git' 'refs/tags/0.60' '364428243685bd3f85e27e140f98981790e7295e' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'openssh-portable' 'https://github.com/openssh/openssh-portable.git' 'refs/tags/V_10_4_P1' 'e8dd756725e8800fcd0b3fd71ee6b4382d1e8fab' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'freebsd-src' 'https://github.com/freebsd/freebsd-src.git' 'refs/tags/release/15.0.0' '7aedc8de6446ad5a10d553b926423c689f0a3363' '--skip-symlinks' '--filter-blobs' '.' ':(exclude)cddl/**' ':(exclude)contrib/**' ':(exclude)crypto/**' ':(exclude)gnu/**' ':(exclude)sys/cddl/**' ':(exclude)sys/contrib/**' ':(exclude)sys/dev/microcode/**' ':(exclude)sys/gnu/**'
fetcher_git 'openbsd-src' 'https://github.com/openbsd/src.git' '003d9ff8ec54f3f15e165d831f1972e2a710cfce' '003d9ff8ec54f3f15e165d831f1972e2a710cfce' '--skip-symlinks' '--filter-blobs' '.' ':(exclude)gnu/**' ':(exclude)sys/dev/microcode/**'
fetcher_git 'netbsd-src' 'https://github.com/NetBSD/src.git' '1d2eff37050c088093399be0526404544f166cab' '1d2eff37050c088093399be0526404544f166cab' '--skip-symlinks' '--filter-blobs' '.' ':(exclude)crypto/**' ':(exclude)external/**' ':(exclude)sys/dev/microcode/**' ':(exclude)sys/external/**'

# shellcheck disable=SC2119
fetcher_manifest <<'JSON'
{
  "corpus": {
    "id": "linux-core-permissive",
    "title": "Linux Core — Permissive Alternatives and BSD",
    "description": "Pinned permissively licensed libc, shell, userland, init/package tooling, and BSD base-system source selected without copyleft imported trees."
  },
  "sources": [
    {
      "id": "musl",
      "path": "musl",
      "license": "MIT",
      "source": {
        "name": "musl/libc",
        "version": "0784374d561435f7c787a555aeab8ede699ed298",
        "url": "https://git.musl-libc.org/cgit/musl",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://git.musl-libc.org/cgit/musl/tree/COPYRIGHT?id=0784374d561435f7c787a555aeab8ede699ed298",
          "declaration": "MIT"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "Assembly",
            "C"
          ],
          "selection": "Complete tracked project source selected by the reviewed --source-code profile.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Official musl Git repository at the pinned v1.2.5 commit."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://git.musl-libc.org/git/musl",
          "revision": "0784374d561435f7c787a555aeab8ede699ed298",
          "ref": "refs/tags/v1.2.5"
        }
      ]
    },
    {
      "id": "toybox",
      "path": "toybox",
      "license": "0BSD",
      "source": {
        "name": "landley/toybox",
        "version": "7eaddbdb9c1712801ddf131ed79ead0c981ffcb1",
        "url": "https://landley.net/toybox",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://github.com/landley/toybox/blob/7eaddbdb9c1712801ddf131ed79ead0c981ffcb1/LICENSE",
          "declaration": "0BSD"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "C",
            "Shell"
          ],
          "selection": "Complete tracked project source selected by the reviewed --source-code profile.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Official Toybox repository at the pinned 0.8.12 commit."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://github.com/landley/toybox.git",
          "revision": "7eaddbdb9c1712801ddf131ed79ead0c981ffcb1",
          "ref": "refs/tags/0.8.12"
        }
      ]
    },
    {
      "id": "dash",
      "path": "dash",
      "license": "BSD-3-Clause",
      "source": {
        "name": "kernel/dash",
        "version": "4bbf8721a3ac6401ced6a0454956801f6ba37256",
        "url": "https://git.kernel.org/pub/scm/utils/dash/dash.git",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://git.kernel.org/pub/scm/utils/dash/dash.git/tree/COPYING?id=4bbf8721a3ac6401ced6a0454956801f6ba37256",
          "declaration": "BSD-3-Clause"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "C"
          ],
          "selection": "Complete tracked project source selected by the reviewed --source-code profile.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Official dash Git repository at the pinned v0.5.12 commit."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://git.kernel.org/pub/scm/utils/dash/dash.git",
          "revision": "4bbf8721a3ac6401ced6a0454956801f6ba37256",
          "ref": "refs/tags/v0.5.12"
        }
      ]
    },
    {
      "id": "sbase",
      "path": "sbase",
      "license": "MIT",
      "source": {
        "name": "suckless/sbase",
        "version": "c546c3a5724c81cee9a11d816a38ccdf17472129",
        "url": "https://core.suckless.org/sbase",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://git.suckless.org/sbase/file/LICENSE.html",
          "declaration": "MIT"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "C"
          ],
          "selection": "Complete tracked project source selected by the reviewed --source-code profile.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Official suckless sbase Git repository at the pinned commit."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://git.suckless.org/sbase",
          "revision": "c546c3a5724c81cee9a11d816a38ccdf17472129",
          "ref": "c546c3a5724c81cee9a11d816a38ccdf17472129"
        }
      ]
    },
    {
      "id": "ubase",
      "path": "ubase",
      "license": "MIT",
      "source": {
        "name": "suckless/ubase",
        "version": "e8249b49ca3e02032dece5e0cdac3d236667a6d9",
        "url": "https://core.suckless.org/ubase",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://git.suckless.org/ubase/file/LICENSE.html",
          "declaration": "MIT"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "C"
          ],
          "selection": "Complete tracked project source selected by the reviewed --source-code profile.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Official suckless ubase Git repository at the pinned commit."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://git.suckless.org/ubase",
          "revision": "e8249b49ca3e02032dece5e0cdac3d236667a6d9",
          "ref": "e8249b49ca3e02032dece5e0cdac3d236667a6d9"
        }
      ]
    },
    {
      "id": "openrc",
      "path": "openrc",
      "license": "LicenseRef-FreeBSD-permissive",
      "source": {
        "name": "OpenRC/openrc",
        "version": "f232308ad67cc94bd95e98a6af4a47fc58912b70",
        "url": "https://github.com/OpenRC/openrc",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://github.com/OpenRC/openrc/blob/f232308ad67cc94bd95e98a6af4a47fc58912b70/LICENSE",
          "declaration": "LicenseRef-FreeBSD-permissive"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "C",
            "Shell"
          ],
          "selection": "Complete tracked project source selected by the reviewed --source-code profile.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Official OpenRC Git repository at the pinned 0.62.3 commit."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://github.com/OpenRC/openrc.git",
          "revision": "f232308ad67cc94bd95e98a6af4a47fc58912b70",
          "ref": "refs/tags/0.62.3"
        }
      ]
    },
    {
      "id": "xbps",
      "path": "xbps",
      "license": "BSD-2-Clause",
      "source": {
        "name": "void-linux/xbps",
        "version": "364428243685bd3f85e27e140f98981790e7295e",
        "url": "https://github.com/void-linux/xbps",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://github.com/void-linux/xbps/blob/364428243685bd3f85e27e140f98981790e7295e/LICENSE",
          "declaration": "BSD-2-Clause"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "C",
            "Shell"
          ],
          "selection": "Complete tracked project source selected by the reviewed --source-code profile.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Official XBPS Git repository at the pinned 0.60 commit."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://github.com/void-linux/xbps.git",
          "revision": "364428243685bd3f85e27e140f98981790e7295e",
          "ref": "refs/tags/0.60"
        }
      ]
    },
    {
      "id": "openssh-portable",
      "path": "openssh-portable",
      "license": "BSD-2-Clause",
      "source": {
        "name": "openssh/openssh-portable",
        "version": "e8dd756725e8800fcd0b3fd71ee6b4382d1e8fab",
        "url": "https://github.com/openssh/openssh-portable",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://github.com/openssh/openssh-portable/blob/e8dd756725e8800fcd0b3fd71ee6b4382d1e8fab/LICENCE",
          "declaration": "BSD-2-Clause"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "C",
            "Shell"
          ],
          "selection": "Complete tracked portable OpenSSH source selected by the reviewed --source-code profile; bundled compatibility notices remain in the source tree.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Official OpenSSH Portable Git repository at the pinned V_10_4_P1 commit."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://github.com/openssh/openssh-portable.git",
          "revision": "e8dd756725e8800fcd0b3fd71ee6b4382d1e8fab",
          "ref": "refs/tags/V_10_4_P1"
        }
      ]
    },
    {
      "id": "freebsd-src",
      "path": "freebsd-src",
      "license": "BSD-2-Clause",
      "source": {
        "name": "FreeBSD/src",
        "version": "7aedc8de6446ad5a10d553b926423c689f0a3363",
        "url": "https://github.com/freebsd/freebsd-src",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://github.com/freebsd/freebsd-src/blob/7aedc8de6446ad5a10d553b926423c689f0a3363/COPYRIGHT",
          "declaration": "BSD-2-Clause"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "Assembly",
            "C",
            "C++",
            "Shell"
          ],
          "selection": "Project-owned permissive base-system source; contrib, crypto, CDDL, GNU, microcode, and other imported third-party trees excluded.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Official FreeBSD source repository at the pinned 15.0 release commit."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://github.com/freebsd/freebsd-src.git",
          "revision": "7aedc8de6446ad5a10d553b926423c689f0a3363",
          "ref": "refs/tags/release/15.0.0"
        }
      ]
    },
    {
      "id": "openbsd-src",
      "path": "openbsd-src",
      "license": "LicenseRef-OpenBSD-permissive",
      "source": {
        "name": "OpenBSD/src",
        "version": "003d9ff8ec54f3f15e165d831f1972e2a710cfce",
        "url": "https://github.com/openbsd/src",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://www.openbsd.org/policy.html",
          "declaration": "LicenseRef-OpenBSD-permissive"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "Assembly",
            "C",
            "C++",
            "Shell"
          ],
          "selection": "OpenBSD permissive base-system source at an immutable mirror commit; GNU and microcode trees excluded, and retained files preserve their ISC/BSD-style notices.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Official OpenBSD GitHub source mirror pinned by exact commit."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://github.com/openbsd/src.git",
          "revision": "003d9ff8ec54f3f15e165d831f1972e2a710cfce",
          "ref": "003d9ff8ec54f3f15e165d831f1972e2a710cfce"
        }
      ]
    },
    {
      "id": "netbsd-src",
      "path": "netbsd-src",
      "license": "LicenseRef-NetBSD-permissive",
      "source": {
        "name": "NetBSD/src",
        "version": "1d2eff37050c088093399be0526404544f166cab",
        "url": "https://github.com/NetBSD/src",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://www.netbsd.org/about/redistribution.html",
          "declaration": "LicenseRef-NetBSD-permissive"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "Assembly",
            "C",
            "C++",
            "Shell"
          ],
          "selection": "Project-owned permissive NetBSD base-system source with crypto, external, firmware, and imported sys/external trees excluded explicitly.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Official NetBSD GitHub source mirror pinned by exact netbsd-10 branch commit."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://github.com/NetBSD/src.git",
          "revision": "1d2eff37050c088093399be0526404544f166cab",
          "ref": "1d2eff37050c088093399be0526404544f166cab"
        }
      ]
    }
  ]
}
JSON
