# WALDO fetcher

WALDO fetcher downloads raw corpus material into a local handoff directory.
It does not ingest, transform, shard, upload, schedule, or train data.

Each corpus is described by one reviewed INI file. The fetcher validates the
entire configuration and available disk space before making a network request.

```sh
go build -o fetcher ./cmd/fetcher
./fetcher corpora/linux-kernel-mailing-list.ini /path/to/handoff
```

Ingestion is a separate operation:

```sh
waldo index ingest /path/to/handoff community/linux-kernel-mailing-list
```

## End-to-end smoke test

Run the traced smoke test from any directory:

```sh
./smoke-test.sh
```

The default is the small Python Enhancement Proposals corpus. Pass any corpus
INI file to test a different real fetcher:

```sh
./smoke-test.sh corpora/dolly.ini
```

The script uses `go run ./cmd/fetcher`, fetches the real upstream corpus,
ingests it with `go run ./cmd/waldo` into a disposable index and local
lookaside, applies the generated contribution, and trains a one-step model with
WALDO's automatically selected real backend. It does not touch the configured
index, lookaside, or model store. Commands and their output are shown with shell
tracing. Use `WALDO_SMOKE_KEEP=1` to retain the temporary workspace for
inspection.

## Handoff layout

A corpus containing one source is written directly into the handoff directory:

```text
handoff/
├── manifest.json
└── downloaded raw files...
```

`manifest.json` contains the corpus and source metadata. It applies recursively
to every non-manifest file beneath that directory.

A corpus containing several sources uses one child directory per source:

```text
handoff/
├── manifest.json
├── source-one/
│   ├── manifest.json
│   └── downloaded raw files...
└── source-two/
    ├── manifest.json
    └── downloaded raw files...
```

The root manifest contains the corpus identity and explicitly lists its source
directories. Each child manifest contains one source, one effective/default
license, and any input mapping. Every file beneath a source directory inherits
that metadata.

Multiple downloads from the same source share one source directory. Different
sources or licenses require different source directories. WALDO ignores the
manifests as content, recursively probes the remaining regular files, and
rejects undeclared directories, symlinks, special files, or conflicting
manifest boundaries.

Raw filenames have no semantic meaning. The fetcher derives safe, deterministic
names from the response or assigns an artifact name. INI files do not specify
output filenames.

## Minimal INI file

```ini
[corpus]
id = linux-kernel-mailing-list
title = Linux Kernel Mailing List
description = Linux kernel development messages from 2025.

[source]
name = linux-kernel@vger.kernel.org
url = https://lore.kernel.org/lkml/
category = public-dataset
license = LicenseRef-Publicly-Archived-Forum
license-declaration = Publicly archived mailing-list messages; no blanket content license is asserted.
license-url = https://www.kernel.org/doc/projects/korg/lore.html
content-from = 2025-01-01
content-to = 2025-12-31

[fetch]
fetcher = http
url = https://example.invalid/linux-kernel-2025.mbox.gz
estimated-size = 25G
```

`content-from` and `content-to` are optional. Include them only when the
selected content period is known and meaningful.

## Required fields

Every INI file requires exactly one `[corpus]` section.

| Field | Meaning |
| --- | --- |
| `id` | Stable lowercase corpus identifier. |
| `title` | Human-readable corpus title. |
| `description` | Concise description of the selected material. |

Every corpus requires at least one source. A single-source corpus uses
`[source]`; a multi-source corpus uses named sections such as
`[source "kernel"]`.

| Field | Meaning |
| --- | --- |
| `name` | Human-readable upstream source name. |
| `url` | Canonical upstream source or dataset page. |
| `category` | WALDO source category. |
| `license` | Effective/default license identifier for every record in this source directory. |
| `license-declaration` | What the upstream declares, or an explicit statement that no blanket license is asserted. |

Every corpus requires at least one fetch. A single fetch uses `[fetch]`.
Multiple fetches use named sections such as `[fetch "2025-01"]`.

| Field | Meaning |
| --- | --- |
| `fetcher` | Named acquisition implementation, such as `http` or `git`. |
| `url` | Artifact, repository, or API URL used by that fetcher. |
| `estimated-size` | Approximate local bytes, such as `500M`, `25G`, or `2TiB`. |

In a multi-source corpus, every `[fetch "name"]` also requires `source`, whose
value must match a named source ID. It is omitted for a single-source corpus.

For a single-source corpus, the source ID is the corpus ID. For a multi-source
corpus, the quoted section name is the source ID and directory name. An
additional `id` field is neither needed nor allowed.

These are the only universally required fields. Fetcher-specific required
fields are documented below. Unknown fields and missing conditional fields are
errors.

## Optional source fields

| Field | Meaning |
| --- | --- |
| `version` | Upstream release, snapshot, or revision label. |
| `license-url` | URL supporting `license-declaration`. |
| `content-from` | Earliest selected content date, when known. |
| `content-to` | Latest selected content date, when known. |
| `selection` | Human-readable subset or inclusion rule. |
| `content-type` | Content type; may be repeated. |
| `language` | Known language; may be repeated. |
| `copyrighted` | `yes`, `no`, or `unknown`. |
| `machine-generated` | `yes`, `no`, or `unknown`. |
| `personal-data` | `yes`, `no`, or `unknown`. |
| `acquisition-basis` | Why this acquisition is authoritative and reproducible. |

The fetcher records retrieval time, its own version, raw file count, raw byte
count, and a deterministic aggregate SHA-256 automatically.

HTTP downloads report transferred bytes and rate on stderr. When the server
provides a content length, progress also includes percentage and ETA. Terminal
output updates in place; redirected output uses periodic newline-delimited
status records suitable for logs. Resumed downloads include the retained
partial bytes in their total progress.

## Fetchers

### HTTP

```ini
[fetch]
fetcher = http
url = https://example.org/archive.jsonl.gz
estimated-size = 10G
sha256 = optional-lowercase-64-character-checksum
```

Required fields: `fetcher`, `url`, and `estimated-size`.

`sha256` is optional and is checked only when present. HTTP downloads resume
when the server supports ranges. A partial download is preserved on failure.
The fetcher uses a safe URL basename, a safe `Content-Disposition` filename,
or a deterministic artifact name. Existing conflicting content is never
silently replaced.

### Git

```ini
[fetch]
fetcher = git
url = https://github.com/example/project.git
revision = 0123456789abcdef0123456789abcdef01234567
estimated-size = 2G
```

Required fields: `fetcher`, `url`, `revision`, and `estimated-size`.

`revision` must resolve to the declared immutable commit. Optional reviewed Git
selection fields may be added as named fields by the Git fetcher; positional
argument arrays are not part of the INI format.

Additional acquisition implementations follow the same rule: each has a named
`fetcher` value and documented, named fields. Configurations never contain
`ARG_1`, `ARG_2`, or other positional implementation details.

### Hugging Face

Required fields: `fetcher = huggingface`, the canonical dataset `url`, pinned
40-character `revision`, selected `suffix`, and `estimated-size`. `prefix` is
optional. The fetcher reads pinned dataset metadata and verifies each selected
LFS SHA-256.

### Public-inbox

Required fields: `fetcher = public-inbox`, `url`, `base-url`, `list`, `year`,
one or more repeated `epoch = NUMBER:COMMIT` values, and `estimated-size`.
Pinned Git message blobs for the requested year are retained as raw RFC 822
messages.

### Monthly mbox

Required fields: `fetcher = monthly-mbox`, `url`, `base-url`, `list`, `year`,
`style` (`apache` or `gnu`), exactly twelve repeated `checksum` values in month
order, and `estimated-size`.

### HyperKitty

Required fields: `fetcher = hyperkitty`, `url`, `base-url`, `list`, `manifest`,
`manifest-sha256`, and `estimated-size`. The reviewed monthly manifest pins
message counts and canonical verification hashes; downloaded gzip mbox files
remain raw.

### HTTP set

Required fields: `fetcher = http-set`, `url`, one or more repeated
`artifact = URL|NAME|SHA256` values, and `estimated-size`. This is for a fixed
reviewed set of independently checksummed HTTP artifacts.

### SourceHut list export

Required fields: `fetcher = sourcehut`, the public list `url`, canonical
`sha256`, and `estimated-size`. The raw whole-list mbox export is retained.

### Gutenberg

Required fields: `fetcher = gutenberg`, `url`, `selection`, and
`estimated-size`. Optional fields are `count`, `language`, `ids`, and
`exclude-ids`. Upstream book text remains raw; marker removal belongs to the
manifest's general `bounded-text` profile.

### CAP

Required fields: `fetcher = cap`, `url`, `selection` or `reporters`, and
`estimated-size`. `limit` is optional. Reporter volume archives are obtained
from the pinned source and safely unpacked into their raw JSON records.

### ZIP

Required fields: `fetcher = zip`, `url = local:ARCHIVE`, `suffix`, and
`estimated-size`. It operates on an archive acquired by an earlier fetch in
the same source boundary, safely retains matching regular files, and removes
the archive only after extraction succeeds.

## Input mappings

Do not add an `[input]` section when WALDO can identify and interpret the raw
format directly. This includes ordinary text, Markdown, mbox, and other
general formats with automatic readers.

Structured records add `[input]` for a single source or
`[input "source-id"]` for a named source. `type` is always required when the
section exists.

### Record map

```ini
[input]
type = record-map
text = text
id = id
date = created
license = metadata.license
```

Required fields: `type` and at least one `text`. `text` may be repeated in
priority order. `id`, `date`, `language`, `license`, `source`, and named
metadata mappings are optional.

### Dialogue pair

```ini
[input]
type = dialogue-pair
text = prompt
response = response
context = context
```

Required fields: `type`, at least one `text`, and `response`. `context` is
optional.

### Chat messages

```ini
[input]
type = chat-messages
role = messages[].role
content = messages[].content
```

Required fields: `type`, `role`, and `content`. Tool and role-alias mappings are
optional.

### Ranked conversation tree

```ini
[input]
type = ranked-conversation-tree
replies = replies
text = text
rank = rank
```

Required fields: `type`, `replies`, `text`, and `rank`. Root, role,
assistant-role, and missing-rank mappings are optional.

### Bounded text

```ini
[input]
type = bounded-text
start-pattern = regular expression
end-pattern = regular expression
```

Required fields: `type`, `start-pattern`, and `end-pattern`.

### XML records

```ini
[input]
type = xml-record
text = /article/body
```

Required fields: `type` and at least one `text` selector. Each physical XML
file is one record. Exclusion and metadata selectors are optional.

## Multi-source example

```ini
[corpus]
id = example-suite
title = Example Suite
description = Two independently licensed sources.

[source "documents"]
name = Example Documents
url = https://example.org/documents
category = public-dataset
license = CC-BY-4.0
license-declaration = Creative Commons Attribution 4.0

[fetch "documents"]
source = documents
fetcher = http
url = https://example.org/documents.jsonl.gz
estimated-size = 5G

[source "code"]
name = Example Code
url = https://github.com/example/code
category = public-dataset
license = Apache-2.0
license-declaration = Apache License 2.0

[fetch "code"]
source = code
fetcher = git
url = https://github.com/example/code.git
revision = 0123456789abcdef0123456789abcdef01234567
estimated-size = 2G
```

## INI syntax and validation

- Files are UTF-8 text.
- Section and field names are lowercase.
- Blank lines and lines beginning with `#` or `;` are ignored.
- Values begin after the first `=` and are trimmed.
- Unknown sections and fields are errors.
- Duplicate scalar fields are errors.
- Only documented list fields may be repeated.
- Corpus and source IDs use lowercase letters, digits, `.`, `_`, and `-`.
- Destinations and source IDs must be safe relative paths.
- URLs must use a scheme accepted by the selected fetcher.
- Secrets are never written directly into INI files. A fetcher that needs a
  credential names an environment variable and fails before network access if
  it is unavailable.
- All configuration, executable, credential-presence, handoff-safety, and
  disk-space checks complete before acquisition starts.

## Acquisition guarantees

- Fetchers write only beneath the supplied handoff directory.
- Raw upstream formats are retained; corpus-specific transformation is not
  allowed.
- Archives may be safely unpacked as general containers.
- Downloads are resumable when the upstream protocol supports it.
- Non-resumable partial state is preserved and reported, never deleted.
- Published checksums and immutable revisions are verified when declared.
- Manifests are written last, after acquisition and raw-tree validation.
- Running a fetcher never invokes `waldo index ingest`.
- Updating an existing corpus snapshot must be explicit; incremental update
  semantics remain future work.

## Repository layout

```text
README.md
cmd/fetcher/
corpora/<corpus>.ini
```

The Go program owns INI parsing, validation, acquisition, resumability, disk
checks, safe filenames, and manifest generation. Corpus INI files contain only
human-readable facts and named fetcher settings.

## Tests

```sh
go test ./...
./tests/e2e.sh
```

The end-to-end test uses a temporary localhost fixture and verifies a
multi-source fetch containing gzip JSONL and gzip mbox through WALDO's
canonical Parquet writer and a temporary file lookaside.
