#!/bin/sh
set -eu

script_dir=$(CDPATH='' cd -- "$(dirname -- "$0")" && pwd -P)
. "$script_dir/../functions.sh"

fetcher_begin "$@"
fetcher_require jq find sort awk wc curl unzip
fetcher_size 50G
fetcher_download 'https://allof.plos.org/allofplos.zip' 'allofplos.zip'
fetcher_zip_extract '' 'allofplos.zip' '.xml' 'articles'

# shellcheck disable=SC2119
fetcher_manifest <<'JSON'
{
  "corpus": {
    "id": "plos",
    "title": "PLOS Articles",
    "description": "Peer-reviewed research articles published by the Public Library of Science."
  },
  "sources": [
    {
      "id": "plos",
      "path": "",
      "license": "CC-BY-4.0",
      "source": {
        "name": "plos",
        "url": "https://allof.plos.org/allofplos.zip",
        "category": "public-dataset",
        "license_evidence": {
          "declaration": "CC-BY-4.0",
          "url": "https://allof.plos.org/allofplos.zip"
        }
      },
      "input": {
        "type": "xml-record",
        "fields": {
          "text": [
            "/article/front/article-meta/title-group/article-title",
            "/article/front/article-meta/abstract",
            "/article/body"
          ],
          "meta": {
            "journal": "/article/front/journal-meta/journal-title-group/journal-title"
          }
        },
        "xml": {
          "on_malformed": "skip",
          "exclude": [
            "//sub-article",
            "//table-wrap",
            "//fig",
            "//disp-formula",
            "//inline-formula",
            "//tex-math",
            "//math",
            "//supplementary-material",
            "//ref-list",
            "//object-id",
            "//graphic",
            "//media",
            "//front-stub"
          ]
        }
      },
      "artifacts": [
        {
          "url": "https://allof.plos.org/allofplos.zip",
          "path": "allofplos.zip"
        },
        {
          "method": "zip-extract",
          "arguments": [
            "allofplos.zip",
            ".xml",
            "articles"
          ]
        }
      ]
    }
  ]
}
JSON
