# WALDO fetcher

WALDO fetcher downloads raw corpus material into a local handoff directory.
It does not ingest, transform, shard, upload, schedule, or train data.

Each corpus is described by one reviewed INI file. The fetcher validates the
entire configuration and available disk space before making a network request.

```sh
go run ./cmd/fetcher corpora/linux-kernel-mailing-list.ini /path/to/handoff
```

Ingestion is a separate operation:

```sh
waldo index ingest /path/to/handoff community/linux-kernel-mailing-list
```

## Prerequisites

- Go 1.25 or newer.
- Enough free space for the sum of `estimated-size` values, plus 50% and 1 GiB
  of safety headroom.
- Network access to the declared upstream sources.
- `git` for `git` and `public-inbox` fetches.
- `python3` for `public-inbox`, `hyperkitty`, and `cap` helpers.
- The adjacent WALDO repository only when running ingestion or smoke tests.

Run commands from this repository root. Some fetchers use reviewed files under
`manifests/` or helpers under `libexec/`.

## Create a corpus configuration

One corpus normally requires only a new `corpora/<corpus-id>.ini`; do not write
a new shell script or corpus-specific parser.

1. Start from the closest existing INI. Use `foodista.ini` for mapped JSONL,
   `aya.ini` for Parquet conversations, `plos.ini` for XML,
   `gutenberg.ini` for bounded text, or a mailing-list INI for mbox.
2. Record the corpus identity, canonical upstream page, license declaration and
   evidence URL, source category, and exact selection.
3. Choose the smallest existing generic fetcher that can acquire the raw data.
   Pin a checksum, immutable commit, dataset revision, or reviewed manifest
   whenever the upstream provides one.
4. Inspect a representative raw file and declare its physical `format`. For
   structured records, add a logical `type` and field mappings that match the
   actual upstream structure.
5. Set `estimated-size` to the expected on-disk download size. It may be a
   conservative estimate; it must not deliberately understate the corpus.
6. Fetch into a new directory and inspect the generated manifest:

   ```sh
   go run ./cmd/fetcher corpora/example.ini /tmp/example-handoff
   python3 -m json.tool /tmp/example-handoff/manifest.json
   ```

7. Verify WALDO's independent probe and plan before publishing anything:

   ```sh
   waldo index ingest /tmp/example-handoff sandbox/example --dry-run
   ```

8. Run the repository tests and, for a small corpus, the complete smoke test:

   ```sh
   go test ./...
   ./smoke-test.sh corpora/example.ini
   ```

9. Review the generated source, license, input mapping, artifact evidence,
   file count, byte count, and raw-tree SHA-256 before committing the INI.

Do not point a new run at a completed handoff: the presence of `manifest.json`
means that snapshot is complete and immutable. Use a new output directory for
an upstream revision or selection change.

### Reproducibility checklist

A reviewable corpus configuration answers all of these questions:

- What exact upstream material is selected, and what is intentionally omitted?
- Is the artifact fixed by SHA-256, a full 40-character Git commit, a pinned
  Hugging Face revision, or another reviewed manifest?
- Where did the effective license and upstream license declaration come from?
- Does every source have exactly one effective license boundary?
- Does `[input]` describe the bytes actually downloaded, not a desired future
  conversion?
- Can another maintainer run the same command and obtain the same raw-tree
  SHA-256?

An unchecksummed mutable HTTP URL can still be acquired, but it is not strongly
reproducible. Add `sha256` whenever a stable artifact is available. Calculate
it with `sha256sum FILE` on Linux or `shasum -a 256 FILE` on macOS, then verify
that the digest is supported by upstream evidence rather than trusting an
unreviewed download blindly.

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

## Raw formats and ingestion profiles

Every source has an `[input]` section that declares its physical `format`. The
fetcher copies it into `manifest.json`. After downloading, the fetcher verifies
every file against that format and samples up to 100 structured records to
check mapped field paths. A mismatch fails without deleting the raw files, and
the error names the file and incorrect declaration. WALDO probes the bytes
again during ingestion and rejects disagreement with the manifest.

After correcting only the `[input]` declaration, rerun the same command and
output path. The fetcher detects its validation-failure marker, skips network
acquisition, and revalidates the preserved files before writing the manifest.

Fetcher output intended for training must use one of these supported forms:

| Raw form | Required `format` and profile |
| --- | --- |
| UTF-8 text or Markdown | `text` or `markdown`; optional `bounded-text`. |
| Unix mbox | `mbox`; no logical profile. |
| JSON, exactly one object per file | `json` plus `record-map`, `dialogue-pair`, `chat-messages`, or `ranked-conversation-tree`. |
| JSONL, one object per line | `jsonl` plus `record-map`, `dialogue-pair`, `chat-messages`, or `ranked-conversation-tree`. |
| Parquet, one record per row | `parquet` plus `record-map`, `dialogue-pair`, or `chat-messages`. |
| XML | `xml` plus `xml-record`. |

Gzip and Zstandard compression are supported directly for JSONL and mbox.
Top-level JSON arrays are not supported; publish those records as JSONL or
Parquet instead. A ranked conversation tree must use JSON or JSONL, not
Parquet.

WALDO rejects unsupported, ambiguous, or unmapped raw formats before
conversion. It does not turn raw markup into text or binary bytes into base64
training records. Add a general WALDO adapter or make the upstream fetch
produce one of the supported raw forms instead; do not add a corpus-specific
transformation to the fetcher.

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

[input]
format = mbox
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

`category` must be one of `public-dataset`, `commercially-licensed`,
`private-third-party`, `web-crawl`, `user-data`, `synthetic`, or `other`.
WALDO fails closed on unknown categories. Use `public-dataset` for an openly
reachable curated dataset; public availability alone does not establish a
license.

Every corpus requires at least one fetch. A single fetch uses `[fetch]`.
Multiple fetches use named sections such as `[fetch "2025-01"]`.

| Field | Meaning |
| --- | --- |
| `fetcher` | Named acquisition implementation, such as `http` or `git`. |
| `url` | Artifact, repository, or API URL used by that fetcher. |
| `estimated-size` | Approximate local bytes, such as `500M`, `25G`, or `2TiB`. |

In a multi-source corpus, every `[fetch "name"]` also requires `source`, whose
value must match a named source ID. It is omitted for a single-source corpus.

Every source also requires an `[input]` declaration. An unnamed declaration is
the default for every source; a named declaration overrides one source.

| Field | Meaning |
| --- | --- |
| `format` | Required physical format: `text`, `markdown`, `mbox`, `json`, `jsonl`, `parquet`, or `xml`. |
| `type` | Logical profile required for structured records or bounded text. |

For a single-source corpus, the source ID is the corpus ID. For a multi-source
corpus, the quoted section name is the source ID and directory name. An
additional `id` field is neither needed nor allowed.

Fetcher-specific and profile-specific required fields are documented below.
Unknown fields and missing conditional fields are errors.

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

For a reproducible static artifact, download it once for inspection, obtain or
calculate its SHA-256, add the digest, delete the exploratory handoff, and run
the reviewed INI into a fresh directory.

### Git

```ini
[fetch]
fetcher = git
url = https://github.com/example/project.git
revision = 0123456789abcdef0123456789abcdef01234567
ref = optional-tag-or-branch-used-to-locate-the-commit
pathspec = :(glob)data/**/*.jsonl
estimated-size = 2G
```

Required fields: `fetcher`, `url`, `revision`, and `estimated-size`.

`revision` is the required full immutable commit. When `ref` is present, it is
fetched to locate the commit and must resolve exactly to `revision`; otherwise
the revision itself is fetched. Repeat `pathspec` to retain only reviewed Git
paths. Pathspecs use Git pathspec syntax and must select at least one file.

Git output contains only non-empty, NUL-free UTF-8 regular files. Symlinks,
empty files, and binary files are skipped and reported. Declare
`content-type = source code` when a repository intentionally retains textual
JSON, XML, HTML, or similar files as raw source text, and use `format = text`.
A Git repository selected specifically to structured JSONL instead uses a
restrictive `pathspec` and declares `format = jsonl` with a mapping.

Additional acquisition implementations follow the same rule: each has a named
`fetcher` value and documented, named fields. Configurations never contain
`ARG_1`, `ARG_2`, or other positional implementation details.

### Hugging Face

Required fields: `fetcher = huggingface`, the canonical dataset `url`, pinned
40-character `revision`, selected `suffix`, and `estimated-size`. `prefix` is
optional. The fetcher reads pinned dataset metadata and verifies each selected
LFS SHA-256. `suffix` is written without a required leading dot, for example
`json.gz` or `parquet`; `prefix` restricts the upstream repository path.

### Public-inbox

Required fields: `fetcher = public-inbox`, `url`, `base-url`, `list`, `year`,
one or more repeated `epoch = NUMBER:COMMIT` values, and `estimated-size`.
Pinned Git message blobs for the requested year are retained as raw RFC 822
messages. `COMMIT` is a full 40-character commit for that public-inbox epoch.

### Monthly mbox

Required fields: `fetcher = monthly-mbox`, `url`, `base-url`, `list`, `year`,
`style` (`apache` or `gnu`), exactly twelve repeated `checksum` values in month
order from January through December, and `estimated-size`.

### HyperKitty

Required fields: `fetcher = hyperkitty`, `url`, `base-url`, `list`, `manifest`,
`manifest-sha256`, and `estimated-size`. The reviewed monthly manifest pins
message counts and canonical verification hashes; downloaded gzip mbox files
remain raw. `manifest` names a TSV file under `manifests/hyperkitty/`.

### HTTP set

Required fields: `fetcher = http-set`, `url`, one or more repeated
`artifact = URL|NAME|SHA256` values, and `estimated-size`. This is for a fixed
reviewed set of independently checksummed HTTP artifacts. `NAME` is the safe
local basename; each SHA-256 is mandatory.

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

### Adding a new acquisition method

Add code only when no existing generic fetcher can acquire the upstream raw
format. A new method must be reusable across corpora; it must not parse one
corpus into training text or render a conversation template.

The implementation checklist is:

1. Add its allowed and required named INI fields to `validateFetch` in
   `internal/config/config.go`. Reject unknown, ambiguous, or unsafe values
   before network access.
2. Add one dispatch case in `Runner.Run` and implement acquisition under
   `internal/fetcher/`. Keep all writes beneath the provided source directory.
3. Pin and verify available checksums, revisions, manifests, counts, or other
   upstream evidence. Use `.partial` files and atomic renames where possible.
4. Make interruption behavior explicit: resume safely or stop while preserving
   partial state. Never silently restart a non-resumable acquisition over
   existing bytes.
5. Produce only one of the general raw formats documented above. Archive
   extraction is allowed; corpus-specific content conversion is not.
6. Report meaningful download progress and leave final format/profile
   verification to the shared post-fetch validator.
7. Add focused unit tests, a catalog configuration, this fetcher-field
   reference, and an end-to-end fixture when the protocol introduces new
   behavior.

Do not add output paths, index destinations, lookaside settings, credentials,
WALDO invocations, or positional `ARG_*` fields to corpus INIs.

## Input mappings

Every source requires `[input]`. Use one unnamed section as the default for all
sources, or `[input "source-id"]` to override a named source. `format` is always
required. `type` and mapping fields are required only for structured records or
bounded text.

JSON, JSONL, and Parquet mappings use dotted field paths. Append `[]` to expand
a repeated array while traversing it:

```text
text                  top-level field
casebody.opinions[].text
messages[].role
```

Paths name upstream fields; they never contain corpus-specific code. For
Parquet, paths must resolve to scalar leaf columns and `[]` must agree with the
column's repeated structure. Repeat `text` to concatenate several fields in
declared order. `text-fallback` supplies lower-priority alternatives. Add
metadata as repeatable `meta = OUTPUT_NAME=upstream.path` entries.

Common optional policies are:

| Field | Meaning |
| --- | --- |
| `on-empty = error|skip` | For record-map, dialogue-pair, chat-messages, or bounded-text: fail on an empty mapped record, or explicitly skip it. |
| `nul = error|space` | For structured record profiles: fail on embedded NUL characters, or replace them with spaces. |
| `id`, `date`, `language`, `license`, `source` | Map canonical provenance fields from each record. |
| `meta = NAME=PATH` | Preserve an additional scalar field in canonical metadata; repeat as needed. |

Map `license` only when the upstream records carry their own license value.
WALDO preserves that raw value and otherwise uses the source-level `license` as
the effective default; never invent per-record licenses from content.

The fetcher's post-download check verifies every physical file and looks for
each mapped path in the first 100 JSON/JSONL records. Parquet mappings are
checked against the file schema. XML is parsed completely and its selectors
must match. WALDO performs full conversion validation later; passing the quick
fetcher check does not weaken WALDO's fail-closed behavior.

### Record map

```ini
[input]
format = jsonl
type = record-map
text = text
id = id
date = created
license = metadata.license
```

Required fields: `type` and at least one `text`. `text` is concatenated in
declared order; `text-fallback` provides ordered alternatives when the primary
paths are empty. `id`, `date`, `language`, `license`, `source`, and named
metadata mappings are optional.

### Dialogue pair

```ini
[input]
format = jsonl
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
format = jsonl
type = chat-messages
role = messages[].role
content = messages[].content
```

Required fields: `type`, `role`, and `content`. `tools` is an optional upstream
path containing tool definitions.

### Ranked conversation tree

```ini
[input]
format = jsonl
type = ranked-conversation-tree
replies = replies
text = text
rank = rank
```

Required fields: `type`, `replies`, `text`, and `rank`. Root, role,
assistant-role, and missing-rank mappings are optional. The only explicit
missing-rank policy is `missing-rank = source-order`.

### Bounded text

```ini
[input]
format = text
type = bounded-text
start-pattern = regular expression
end-pattern = regular expression
```

Required fields: `type`, `start-pattern`, and `end-pattern`. Patterns are Go
regular expressions. WALDO keeps content after the first start match through
the point immediately before the first following end match. Use
`on-empty = skip` only when files without both markers are intentionally
excluded.

### XML records

```ini
[input]
format = xml
type = xml-record
text = /article/body
```

Required fields: `type` and at least one `text` selector. Each physical XML
file is one record. Selectors use a strict absolute XPath subset: child and
descendant (`//`) traversal, namespace-aware names, `*`, repeated nodes, and a
terminal attribute. Repeat `text` for ordered concatenation. `exclude` and
metadata selectors are optional; `on-malformed` is `error` or `skip`.

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

[input "documents"]
format = jsonl
type = record-map
text = text

[input "code"]
format = text
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

## Failure and retry behavior

The error message determines the safe next action:

| Failure | What remains | Next action |
| --- | --- | --- |
| Configuration or disk-space validation | No network data should have been acquired. | Correct the INI or free space and rerun. |
| Interrupted resumable HTTP download | `*.partial` file. | Rerun the identical command and output path. |
| Interrupted non-resumable acquisition | Reported work or partial files. | Follow the specific error; the fetcher never silently overwrites them. |
| Post-fetch format or mapping mismatch | Complete raw files plus `.fetcher-work/validation-error.txt`; no manifest. | Correct only `[input]`, then rerun the same command to revalidate without network access. |
| Successful fetch | Complete raw files and `manifest.json`. | Treat as immutable; ingest it or use a new directory for another snapshot. |

Do not manually create or edit a generated manifest to bypass validation. The
INI is the reviewed source of corpus facts. If the upstream bytes are wrong,
use a fresh handoff; if the declaration is wrong, correct the INI and use the
validation retry described above.

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

## Definition of done

A new corpus fetcher is complete only when:

- its INI passes `go test ./...` and uses only documented fields;
- every source has reviewed license/provenance facts and an explicit format;
- every mutable artifact is pinned where upstream evidence permits;
- a real fetch completes and generates a manifest without manual editing;
- post-fetch validation agrees with the actual raw structure;
- `waldo index ingest ... --dry-run` accepts the handoff;
- a small representative corpus passes `smoke-test.sh`; and
- no corpus-specific transformation, destination, credential, or ingestion
  behavior was added to acquisition.
