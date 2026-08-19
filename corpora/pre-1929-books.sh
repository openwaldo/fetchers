#!/bin/sh
set -eu

script_dir=$(CDPATH='' cd -- "$(dirname -- "$0")" && pwd -P)
. "$script_dir/../functions.sh"

fetcher_begin "$@"
fetcher_require jq find sort awk wc curl
fetcher_size 100G
fetcher_huggingface '' 'https://huggingface.co' 'common-pile/pre_1929_books_filtered' '23f9d96dbb1db3324bbc9fbfe1f8299cc799c4d1' 'json.gz'

# shellcheck disable=SC2119
fetcher_manifest <<'JSON'
{
  "corpus": {
    "id": "pre-1929-books",
    "title": "Pre-1929 Public Library Books",
    "description": "Public-domain scans of books published before 1929 from the filtered Common Pile release.",
    "destination": "core/common-pile/pre-1929-books"
  },
  "sources": [
    {
      "id": "pre-1929-books",
      "path": "",
      "license": "LicenseRef-Public-Domain",
      "source": {
        "name": "common-pile/pre_1929_books_filtered",
        "version": "23f9d96dbb1db3324bbc9fbfe1f8299cc799c4d1",
        "url": "https://huggingface.co/datasets/common-pile/pre_1929_books_filtered",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://huggingface.co/datasets/common-pile/pre_1929_books_filtered/blob/23f9d96dbb1db3324bbc9fbfe1f8299cc799c4d1/README.md",
          "declaration": "LicenseRef-Public-Domain"
        },
        "content": {
          "types": [
            "books",
            "cultural heritage",
            "scanned text"
          ],
          "languages": [
            "multilingual"
          ],
          "selection": "All 26 gzip JSONL artifacts at the pinned filtered Common Pile revision; 124,898 records uniformly declare Public Domain and retain HathiTrust and Internet Archive identifiers, provenance, and original URLs. Exact canonical-text comparison found no overlap with the 77,587 committed Project Gutenberg records.",
          "copyrighted": "no",
          "machine_generated": "no"
        },
        "acquisition": {
          "basis": "Public filtered release of pre-1929 Public Library books with per-record public-domain declarations and original HathiTrust and Internet Archive provenance."
        }
      },
      "input": {
        "type": "record-map",
        "on_empty": "skip",
        "license_policy": {
          "include": [
            "LicenseRef-Public-Domain"
          ]
        },
        "fields": {
          "text": [
            "text"
          ],
          "text_fallback": [
            "metadata.title",
            "metadata.author",
            "metadata.ia_url",
            "metadata.hathi_url"
          ],
          "id": "id",
          "date": "added",
          "meta": {
            "author": "metadata.author",
            "hathi_url": "metadata.hathi_url",
            "htid": "metadata.htid",
            "ia_ark_id": "metadata.ia_ark_id",
            "ia_url": "metadata.ia_url",
            "language": "metadata.language",
            "place": "metadata.place",
            "provenance": "metadata.provenance",
            "raw_license": "metadata.license",
            "text_file_url": "metadata.text_file_url",
            "title": "metadata.title",
            "year": "metadata.year"
          }
        }
      },
      "artifacts": [
        {
          "url": "https://huggingface.co/datasets/common-pile/pre_1929_books_filtered",
          "revision": "23f9d96dbb1db3324bbc9fbfe1f8299cc799c4d1",
          "selection": {
            "suffix": "json.gz"
          }
        }
      ]
    }
  ]
}
JSON
