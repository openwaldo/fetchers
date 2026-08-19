#!/bin/sh
set -eu

script_dir=$(CDPATH='' cd -- "$(dirname -- "$0")" && pwd -P)
. "$script_dir/../functions.sh"

fetcher_begin "$@"
fetcher_require jq find sort awk wc curl tar gzip
fetcher_size 100G
fetcher_cap '' 'https://static.case.law' '-all'

# shellcheck disable=SC2119
fetcher_manifest <<'JSON'
{
  "corpus": {
    "id": "caselaw",
    "title": "United States Caselaw",
    "description": "Published decisions of United States federal and state courts, digitized by the Harvard Law School Library.",
    "destination": "law/caselaw"
  },
  "sources": [
    {
      "id": "caselaw",
      "path": "",
      "license": "LicenseRef-Public-Domain",
      "source": {
        "name": "harvard-cap",
        "url": "https://static.case.law/",
        "category": "public-dataset",
        "license_evidence": {
          "declaration": "LicenseRef-Public-Domain",
          "url": "https://static.case.law/"
        }
      },
      "input": {
        "type": "record-map",
        "fields": {
          "text": [
            "casebody.head_matter",
            "casebody.opinions[].text"
          ],
          "date": "decision_date"
        }
      },
      "artifacts": [
        {
          "method": "cap",
          "arguments": [
            "https://static.case.law",
            "-all"
          ]
        }
      ]
    }
  ]
}
JSON
