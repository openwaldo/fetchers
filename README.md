# WALDO fetchers

This repository contains small, reviewed shell scripts that acquire raw training
corpora. There is exactly one script per corpus. Fetchers do not ingest,
transform, shard, upload, schedule, or train anything.

## Usage

```sh
./corpora/python-enhancement-proposals.sh /path/to/output
# Later, as a separate process:
waldo index ingest /path/to/output
```

A successful fetch creates this handoff:

```text
output/
├── manifest.json
└── raw/
    └── ...upstream files...
```

The fetcher stops after creating this handoff. It never invokes WALDO;
ingestion is a separate operation run later by a person or another process.

`raw/` contains only general formats understood by WALDO: text, Markdown,
JSON, JSONL, compressed JSONL, Parquet, XML, and any other general format WALDO
adds later. Fetchers may safely unpack archives, but must not perform
corpus-specific extraction or conversation rendering. WALDO owns probing,
field mapping, privacy processing, canonical Parquet, deduplication, sharding,
publication, and index changes.

Training-stage selection does not belong here. A model compose decides whether
a corpus is used for pretraining, midtraining, post-training, fine-tuning, or
evaluation.

## Script contract

Every script is POSIX shell, lives in `corpora/`, and reads like a declarative
corpus header followed by one entry point:

```sh
#!/bin/sh
set -eu

CORPUS_ID=example
CORPUS_TITLE='Example corpus'
CORPUS_DESCRIPTION='Raw example records.'
CORPUS_DESTINATION=core/example

SOURCE_ID=example
SOURCE_NAME='Example publisher'
SOURCE_URL=https://example.org/data
SOURCE_CATEGORY=public-dataset
SOURCE_LICENSE=CC0-1.0
SOURCE_LICENSE_DECLARATION=CC0-1.0
SOURCE_LICENSE_URL=https://example.org/license

INPUT_TYPE=record-map
INPUT_TEXT_FIELDS=text

FETCHER_OUTPUT=${1-}
FETCHER_ARGUMENT_COUNT=$#
FETCHER_SIZE=10G
FETCH_METHOD=download
FETCH_URL=https://example.org/data/records.jsonl.gz
FETCH_PATH=records.jsonl.gz
FETCH_SHA256=0123456789abcdef0123456789abcdef0123456789abcdef0123456789abcdef

script_dir=$(CDPATH='' cd -- "$(dirname -- "$0")" && pwd -P)
. "$script_dir/../functions.sh"
fetcher_main
```

`fetcher_main` takes no arguments. The script assigns its one positional
argument to `FETCHER_OUTPUT`; `${1-}` allows the shared validation to report a
clear missing-argument error under `set -u`. A second positional argument is an
error. Required corpus variables are validated before the output directory is
created or any network request starts.

`FETCHER_SIZE` requires free space for twice the estimated raw size plus 1 GiB.
This covers a partial download and ordinary ingestion buffers. Compressed
archives or unusually expensive preparation may also set
`FETCHER_REQUIRED_FREE` explicitly.

All validation runs before network access. A fetcher must:

- write only beneath the supplied output directory;
- use stable names and pinned upstream revisions where available;
- download to partial files and publish them atomically;
- verify upstream checksums when published;
- be safe to resume, or stop with an error while preserving existing content;
- reject conflicting files rather than deleting or silently replacing them;
- use bounded retries and fail on incomplete or ambiguous acquisition;
- never print, persist, or pass credentials as command arguments; and
- write `manifest.json` last, only after the raw handoff validates.

An existing valid artifact is reused after verification. A `.partial` artifact
may be resumed only when the protocol and fetcher support it. Otherwise the
fetcher reports the partial path and exits without cleaning it.

## Manifest

`manifest.json` is a compact acquisition record, not an index manifest or a
raw-file inventory. It uses `kind: waldo-source-directory` and `schema: 1`.
It records:

- corpus identity, description, and intended relative index destination;
- each source's path beneath `raw/`, upstream identity, immutable revision,
  license and evidence, content description, and acquisition basis;
- the generalized WALDO input profile required to interpret raw records;
- upstream artifact URLs and published checksums when available;
- retrieval time, fetcher script identity, raw file count and byte count; and
- one deterministic aggregate SHA-256 for the complete raw tree.

One corpus may contain several independently licensed sources. Such scripts use
numbered `SOURCE_1_*`, `SOURCE_2_*`, and matching `FETCH_1_*` variables. Static
corpus facts live as named shell variables in the script; `write_manifest`
reads them and writes the formal JSON. Fetcher scripts never contain JSON
heredocs. Secrets and machine-local paths are never recorded.

WALDO treats the manifest as source metadata, excludes it from raw record
probing, independently hashes every raw file, and persists the relevant
provenance in its corpus contribution.

If no manifest exists, `waldo index ingest` accepts equivalent metadata flags
and interactively requests missing required fields on a terminal. Missing
metadata is an error in noninteractive use.

## Updates

Fetchers currently produce complete pinned snapshots. Delta acquisition and
incremental ingest are future work; they must preserve immutable prior corpus
versions and explicitly describe the relationship between snapshots.

## Repository layout

```text
README.md
functions.sh
corpora/<corpus>.sh
tests/
```

Run the offline test suite before committing. Live source tests must be
explicit and must never require committed credentials.
