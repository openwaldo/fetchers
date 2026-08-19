#!/bin/sh
set -eu

script_dir=$(CDPATH='' cd -- "$(dirname -- "$0")" && pwd -P)
. "$script_dir/../functions.sh"

fetcher_begin "$@"
fetcher_require jq find sort awk wc curl
fetcher_size 50G
fetcher_huggingface '' 'https://huggingface.co' 'common-pile/data_provenance_initiative_filtered' '8f5afcf585e4618ff12f5b6d49cb5242faf5afbd' 'json.gz'

# shellcheck disable=SC2119
fetcher_manifest <<'JSON'
{
  "corpus": {
    "id": "data-provenance-initiative",
    "title": "Data Provenance Initiative",
    "description": "Openly licensed English and code datasets audited by the Data Provenance Initiative, via the filtered Common Pile release.",
    "destination": "core/common-pile/data-provenance-initiative"
  },
  "sources": [
    {
      "id": "data-provenance-initiative",
      "path": "",
      "license": "LicenseRef-Mixed",
      "source": {
        "name": "common-pile/data_provenance_initiative_filtered",
        "version": "8f5afcf585e4618ff12f5b6d49cb5242faf5afbd",
        "url": "https://huggingface.co/datasets/common-pile/data_provenance_initiative_filtered",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://huggingface.co/datasets/common-pile/data_provenance_initiative_filtered/blob/8f5afcf585e4618ff12f5b6d49cb5242faf5afbd/README.md",
          "declaration": "LicenseRef-Mixed"
        },
        "content": {
          "types": [
            "datasets",
            "developer data",
            "question answering"
          ],
          "languages": [
            "en"
          ],
          "selection": "All three gzip JSONL artifacts at the pinned filtered Common Pile revision; all 3,508,390 records retain an original dataset identifier and URL. Each upstream license array is preserved and represented conservatively as a deterministic conjunction of its normalized terms.",
          "copyrighted": "yes",
          "machine_generated": "no"
        },
        "acquisition": {
          "basis": "Public filtered release derived from the Data Provenance Initiative audit, with per-record original-source and license evidence."
        }
      },
      "input": {
        "type": "record-map",
        "on_empty": "skip",
        "nul": "space",
        "license_policy": {
          "include": [
            "Apache-2.0",
            "Apache-2.0 AND BSD-2-Clause AND BSD-3-Clause AND CC0-1.0 AND ISC AND MIT",
            "Apache-2.0 AND BSD-2-Clause AND BSD-3-Clause AND ISC AND MIT",
            "Apache-2.0 AND BSD-2-Clause AND BSD-3-Clause AND MIT",
            "Apache-2.0 AND BSD-2-Clause AND MIT",
            "Apache-2.0 AND BSD-3-Clause",
            "Apache-2.0 AND BSD-3-Clause AND CC0-1.0 AND MIT",
            "Apache-2.0 AND BSD-3-Clause AND MIT",
            "Apache-2.0 AND CDLA-Permissive-1.0",
            "Apache-2.0 AND CC-BY-3.0",
            "Apache-2.0 AND CC-BY-4.0",
            "Apache-2.0 AND CC-BY-SA-3.0",
            "Apache-2.0 AND CC-BY-SA-4.0",
            "Apache-2.0 AND CC0-1.0",
            "Apache-2.0 AND CC0-1.0 AND MIT",
            "Apache-2.0 AND MIT",
            "BSD-2-Clause",
            "BSD-2-Clause AND BSD-3-Clause AND MIT",
            "BSD-2-Clause AND CC0-1.0 AND MIT",
            "BSD-2-Clause AND ISC AND MIT",
            "BSD-2-Clause AND MIT",
            "BSD-3-Clause",
            "BSD-3-Clause AND MIT",
            "CC-BY-3.0",
            "CC-BY-4.0",
            "CC-BY-4.0 AND MIT",
            "CC-BY-SA-3.0",
            "CC-BY-SA-3.0 AND MIT",
            "CC-BY-SA-4.0",
            "CC-BY-SA-4.0 AND MIT",
            "CC0-1.0",
            "CC0-1.0 AND MIT",
            "ISC AND MIT",
            "MIT"
          ]
        },
        "fields": {
          "text": [
            "text"
          ],
          "id": "metadata.url",
          "date": "added",
          "license": "metadata.license[]",
          "meta": {
            "dataset_id": "metadata.dataset_id",
            "languages": "metadata.language[]",
            "license_url": "metadata.license_url",
            "record_id": "id"
          }
        }
      },
      "artifacts": [
        {
          "url": "https://huggingface.co/datasets/common-pile/data_provenance_initiative_filtered",
          "revision": "8f5afcf585e4618ff12f5b6d49cb5242faf5afbd",
          "selection": {
            "suffix": "json.gz"
          }
        }
      ]
    }
  ]
}
JSON
