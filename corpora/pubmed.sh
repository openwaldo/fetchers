#!/bin/sh
set -eu

script_dir=$(CDPATH='' cd -- "$(dirname -- "$0")" && pwd -P)
. "$script_dir/../functions.sh"

fetcher_begin "$@"
fetcher_require jq find sort awk wc curl
fetcher_size 500G
fetcher_huggingface '' 'https://huggingface.co' 'common-pile/pubmed_filtered' 'c156f0569a92d8f2edc33cebe1f72f7d3e1cae84' 'json.gz'

# shellcheck disable=SC2119
fetcher_manifest <<'JSON'
{
  "corpus": {
    "id": "pubmed",
    "title": "PubMed Central Open-Access Articles",
    "description": "Openly licensed PubMed Central article text from the filtered Common Pile release."
  },
  "sources": [
    {
      "id": "pubmed",
      "path": "",
      "license": "LicenseRef-Mixed",
      "source": {
        "name": "common-pile/pubmed_filtered",
        "version": "c156f0569a92d8f2edc33cebe1f72f7d3e1cae84",
        "url": "https://huggingface.co/datasets/common-pile/pubmed_filtered",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://huggingface.co/datasets/common-pile/pubmed_filtered/blob/c156f0569a92d8f2edc33cebe1f72f7d3e1cae84/README.md",
          "declaration": "LicenseRef-Mixed"
        },
        "content": {
          "types": [
            "academic papers",
            "biomedical literature"
          ],
          "languages": [
            "multilingual"
          ],
          "selection": "All 17 gzip JSONL artifacts at the pinned filtered Common Pile revision; 3,797,568 records have complete PubMed Central identity, original URL, provenance, and one of three enumerated open licenses. The 11,870 metadata-rich rows with empty article text use their journal citation, then original PMC URL, as deterministic fallback.",
          "copyrighted": "yes",
          "machine_generated": "no"
        },
        "acquisition": {
          "basis": "Public filtered dataset at the pinned revision with exact per-record open-license declarations and original PubMed Central URLs."
        }
      },
      "input": {
        "type": "record-map",
        "on_empty": "skip",
        "license_policy": {
          "include": [
            "CC-BY-4.0",
            "CC-BY-SA-4.0",
            "CC0-1.0"
          ]
        },
        "fields": {
          "text": [
            "text"
          ],
          "text_fallback": [
            "metadata.journal",
            "metadata.url"
          ],
          "id": "id",
          "date": "created",
          "license": "metadata.license",
          "meta": {
            "author_first": "metadata.authors[].first",
            "author_last": "metadata.authors[].last",
            "journal": "metadata.journal",
            "provenance": "metadata.provenance",
            "raw_license": "metadata.license",
            "source": "source",
            "url": "metadata.url"
          }
        }
      },
      "artifacts": [
        {
          "url": "https://huggingface.co/datasets/common-pile/pubmed_filtered",
          "revision": "c156f0569a92d8f2edc33cebe1f72f7d3e1cae84",
          "selection": {
            "suffix": "json.gz"
          }
        }
      ]
    }
  ]
}
JSON
