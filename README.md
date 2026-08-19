# WALDO fetchers

This repository contains small, reviewed shell scripts that acquire raw training
corpora. There is exactly one script per corpus. Fetchers do not ingest,
transform, shard, upload, schedule, or train anything.

## Usage

```sh
./corpora/pep.sh /path/to/output
# Later, as a separate process:
waldo index ingest /path/to/output /index/destination
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

Every script is POSIX shell, lives in `corpora/`, and begins with:

```sh
#!/bin/sh
set -eu
. "$(dirname "$0")/../functions.sh"

fetcher_begin "$@"                 # requires exactly one output directory
fetcher_require curl                # required programs, checked before work
fetcher_require_env PROVIDER_TOKEN  # only when the source requires it
fetcher_size 10G                    # estimate raw bytes and check free space
```

`fetcher_size SIZE` requires free space for twice the estimated raw size plus
1 GiB. This covers a partial download and ordinary ingestion buffers.
Compressed archives or unusually expensive preparation must declare a larger
total explicitly with `fetcher_size RAW_SIZE REQUIRED_FREE_SIZE`.

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

One corpus may contain several independently licensed sources. Each source then
has its own non-overlapping path and metadata entry. Static corpus facts live in
the script; `functions.sh` writes and validates the final JSON so scripts do not
hand-roll manifests. Secrets and machine-local paths are never recorded.

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
