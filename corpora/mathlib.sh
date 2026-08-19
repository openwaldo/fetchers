#!/bin/sh
set -eu

script_dir=$(CDPATH='' cd -- "$(dirname -- "$0")" && pwd -P)
. "$script_dir/../functions.sh"

fetcher_begin "$@"
fetcher_require jq find sort awk wc git tar
fetcher_size 50G
fetcher_git 'source' 'https://github.com/leanprover-community/mathlib4.git' 'refs/tags/v4.32.2' '905b95818eb32af7874a58b427f50c1711a5e96c' '(glob)Mathlib/**/*.lean'

# shellcheck disable=SC2119
fetcher_manifest <<'JSON'
{
  "corpus": {
    "id": "mathlib",
    "title": "Lean Mathlib",
    "description": "Formalized definitions, theorems, and proofs from the Mathlib library for Lean 4, release v4.32.2."
  },
  "sources": [
    {
      "id": "mathlib",
      "path": "source",
      "license": "Apache-2.0",
      "source": {
        "name": "mathlib",
        "version": "905b95818eb32af7874a58b427f50c1711a5e96c",
        "url": "https://github.com/leanprover-community/mathlib4",
        "category": "public-dataset",
        "license_evidence": {
          "declaration": "Apache-2.0",
          "url": "https://github.com/leanprover-community/mathlib4"
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://github.com/leanprover-community/mathlib4.git",
          "revision": "905b95818eb32af7874a58b427f50c1711a5e96c",
          "ref": "refs/tags/v4.32.2"
        }
      ]
    }
  ]
}
JSON
