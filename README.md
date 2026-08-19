# WALDO fetcher

WALDO fetcher acquires raw corpus material and writes a validated handoff
directory. It does not transform training content, ingest data, upload shards,
choose an index destination, schedule work, or train models.

Each corpus is one reviewed INI file under `corpora/`:

```sh
go run ./cmd/fetcher corpora/python-enhancement-proposals.ini /tmp/pep-handoff
waldo index ingest /tmp/pep-handoff pretrain/python-enhancement-proposals
```

Run commands from this repository root. Go 1.25 or newer is required. Some
mailing-list and archive fetchers also require `git` or `python3`.

## Creating a corpus fetcher

Normally, creating a fetcher means adding `corpora/<corpus-id>.ini`; it does
not mean writing a new program or shell script.

1. Find the closest existing INI and copy it.
2. Record the corpus identity, canonical source, license evidence, and exact
   selection.
3. Choose an existing generic acquisition method.
4. Pin the artifact with a SHA-256, immutable commit, dataset revision, or
   reviewed manifest whenever possible.
5. Inspect the actual raw data and declare its physical format and logical
   field mapping.
6. Estimate its on-disk size conservatively.
7. Fetch into a new directory, then inspect the generated `manifest.json`.
8. Run WALDO's dry-run and the tests shown below.

Do not add corpus-specific parsing or conversation rendering. Fetchers retain
general raw formats; WALDO performs declarative interpretation during ingest.

## Complete JSONL example

```ini
[corpus]
id = example-dialogues
title = Example Dialogues
description = Reviewed prompt and response records from Example Dataset.

[source]
name = Example Dataset
url = https://example.org/datasets/dialogues
category = public-dataset
license = CC-BY-4.0
license-declaration = Creative Commons Attribution 4.0
license-url = https://example.org/datasets/dialogues/license
version = 2026-08-01
selection = Training split from the 2026-08-01 release.
content-type = prompts
content-type = responses
language = en
copyrighted = yes
machine-generated = no
personal-data = unknown

[fetch]
fetcher = http
url = https://example.org/releases/2026-08-01/dialogues.jsonl.gz
sha256 = 0123456789abcdef0123456789abcdef0123456789abcdef0123456789abcdef
estimated-size = 2G

[input]
format = jsonl
type = dialogue-pair
id = id
text = prompt
response = response
language = language
on-empty = skip
```

Run it with:

```sh
go run ./cmd/fetcher corpora/example-dialogues.ini /tmp/example-dialogues
python3 -m json.tool /tmp/example-dialogues/manifest.json
waldo index ingest /tmp/example-dialogues sandbox/example-dialogues --dry-run
```

## INI structure

Every INI requires one `[corpus]`, at least one `[source]`, at least one
`[fetch]`, and an `[input]` declaration covering every source.

### Corpus

| Field | Required | Meaning |
| --- | --- | --- |
| `id` | yes | Stable lowercase ID using letters, digits, `.`, `_`, or `-`. |
| `title` | yes | Human-readable title. |
| `description` | yes | Concise description of the selected material. |

### Source

| Field | Required | Meaning |
| --- | --- | --- |
| `name` | yes | Human-readable upstream name. |
| `url` | yes | Canonical dataset, repository, or archive page. |
| `category` | yes | Controlled source category listed below. |
| `license` | yes | Effective/default license identifier for this source. |
| `license-declaration` | yes | What upstream declares, or an explicit statement that no blanket license is asserted. |
| `license-url` | no | URL supporting the license declaration. |
| `version` | no | Upstream release, revision, or snapshot label. |
| `selection` | no | Exact subset or inclusion rule. |
| `content-from`, `content-to` | no | Selected date range when known. |
| `content-type` | no | Content type; repeat as needed. |
| `language` | no | Known language; repeat as needed. |
| `copyrighted` | no | `yes`, `no`, or `unknown`. |
| `machine-generated` | no | `yes`, `no`, or `unknown`. |
| `personal-data` | no | `yes`, `no`, or `unknown`. |
| `acquisition-basis` | no | Why acquisition is authoritative and reproducible. |

`category` must be one of:

```text
public-dataset
commercially-licensed
private-third-party
web-crawl
user-data
synthetic
other
```

Public availability does not establish a license. Preserve the upstream
declaration separately from the effective `license` decision.

### Fetch

Every fetch requires `fetcher`, `url`, and `estimated-size`. Sizes accept forms
such as `500M`, `10G`, and `2TiB`. Before acquisition, the fetcher requires the
sum of all estimates plus 50% and 1 GiB of free-space headroom.

Available methods and their additional fields are:

| `fetcher` | Additional required fields | Optional/notes |
| --- | --- | --- |
| `http` | none | `sha256` is strongly recommended; downloads resume when supported. |
| `git` | `revision` | Full 40-character commit; optional `ref`; repeatable Git `pathspec`. |
| `huggingface` | `revision`, `suffix` | Pinned dataset commit; optional path `prefix`; LFS hashes are verified. |
| `public-inbox` | `base-url`, `list`, `year`, repeated `epoch = NUMBER:COMMIT` | Produces raw RFC 822 messages. |
| `monthly-mbox` | `base-url`, `list`, `year`, `style`, twelve monthly `checksum` values | `style` is `apache` or `gnu`. |
| `hyperkitty` | `base-url`, `list`, `manifest`, `manifest-sha256` | Manifest is under `manifests/hyperkitty/`. |
| `http-set` | repeated `artifact = URL\|NAME\|SHA256` | Fixed reviewed artifact set. |
| `sourcehut` | `sha256` | Retains the canonical whole-list mbox export. |
| `gutenberg` | `selection` | Optional `count`, `language`, `ids`, and `exclude-ids`. |
| `cap` | `selection` or `reporters` | Optional volume `limit`; emits raw case JSON objects. |
| `zip` | `url = local:ARCHIVE`, `suffix` | Safely extracts an archive acquired by an earlier fetch. |

For Git, `revision` is authoritative. If `ref` is present, it is used to find
the commit and must resolve exactly to `revision`. Git output retains only
non-empty, NUL-free UTF-8 regular files. Binary files, empty files, and
symlinks are skipped. Use `content-type = source code` with `format = text` for
source repositories; use a restrictive `pathspec` and structured input profile
when intentionally selecting JSONL from a repository.

SHA-256 values are 64 lowercase hexadecimal characters. Obtain them from
upstream evidence when available. To calculate one for comparison:

```sh
sha256sum FILE        # Linux
shasum -a 256 FILE    # macOS
```

### Input format and mapping

Every source declares one physical format:

| Raw data | `format` | Logical `type` |
| --- | --- | --- |
| NUL-free UTF-8 text | `text` | none, or `bounded-text` |
| Markdown | `markdown` | none, or `bounded-text` |
| Unix mbox | `mbox` | none |
| One JSON object per file | `json` | record profile |
| One JSON object per line | `jsonl` | record profile |
| One record per Parquet row | `parquet` | record profile |
| One XML record per file | `xml` | `xml-record` |

Gzip and Zstandard compression are supported directly for JSONL and mbox.
Top-level JSON arrays are not supported.

Structured field paths use dotted traversal and `[]` array expansion:

```ini
text = casebody.head_matter
text = casebody.opinions[].text
role = messages[].role
meta = upstream_url=metadata.url
```

Repeated `text` paths are concatenated in order. `text-fallback` declares
lower-priority alternatives. Parquet paths must resolve to scalar leaf columns
and `[]` must agree with repeated schema structure.

Supported profiles are:

| `type` | Required mappings | Purpose |
| --- | --- | --- |
| `record-map` | one or more `text` | General documents or records. |
| `dialogue-pair` | `text`, `response` | Prompt, optional context, and response. |
| `chat-messages` | `role`, `content` | Ordered message arrays; optional `tools`. |
| `ranked-conversation-tree` | `replies`, `text`, `rank` | Ranked reply trees; JSON/JSONL only. |
| `bounded-text` | `start-pattern`, `end-pattern` | Content between first matching boundaries. |
| `xml-record` | one or more absolute XPath `text` selectors | Ordered XML text extraction. |

Common optional mappings are `id`, `date`, `language`, `license`, `source`, and
repeatable `meta = NAME=PATH`. Map `license` only when records carry an
upstream license value; otherwise the source-level license is the default.

`on-empty = error|skip` applies to record-map, dialogue-pair, chat-messages,
and bounded-text. `nul = error|space` applies to structured record profiles.
For ranked trees, `missing-rank = source-order` is the only explicit fallback.
For XML, `on-malformed = error|skip` controls malformed documents.

The fetcher verifies every file after download. It samples the first 100
JSON/JSONL records, checks Parquet schemas, and parses XML completely. WALDO
then independently probes the files and performs full conversion validation.

## Multiple sources and downloads

Use named sections when a corpus has independently licensed or sourced
material. Every fetch names its source. An unnamed `[input]` can be the shared
default; a named input overrides one source.

```ini
[source "documents"]
# required source fields...

[source "code"]
# required source fields...

[fetch "documents-001"]
source = documents
fetcher = http
url = https://example.org/documents.jsonl.gz
sha256 = 0123456789abcdef0123456789abcdef0123456789abcdef0123456789abcdef
estimated-size = 5G

[fetch "code-001"]
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

Multiple downloads for one source share its directory and input declaration.
Different sources or effective licenses require separate source boundaries.

## Output and retries

A successful single-source handoff contains raw files and one generated
`manifest.json`. Multi-source handoffs contain a root manifest and one child
manifest per source. Manifests record corpus/source facts, input declarations,
artifact evidence, retrieval time, raw file and byte counts, and a deterministic
raw-tree SHA-256.

The manifest is written last. Retry behavior is:

- Resumable HTTP failures retain `*.partial`; rerun the same command.
- Other interrupted work is preserved and reported, never silently replaced.
- A format or mapping failure retains complete raw files and writes
  `.fetcher-work/validation-error.txt`. Correct `[input]` and rerun the same
  command; acquisition is skipped and the raw files are revalidated.
- A directory containing `manifest.json` is complete and immutable. Use a new
  directory for an upstream revision, selection, or license change.

Never edit a generated manifest to bypass validation. The INI is the reviewed
source of corpus facts.

## Reproducibility checklist

Before committing a corpus INI, confirm:

- the exact included and excluded material is documented;
- immutable checksums, commits, revisions, or manifests are pinned where
  upstream permits;
- license and provenance claims have reviewable evidence;
- every source has an explicit format and accurate mapping;
- another maintainer can reproduce the same raw-tree SHA-256;
- the fetch completes without manual changes to its output; and
- no destination, credential, ingestion, or corpus-specific transformation is
  embedded in acquisition.

An unchecksummed mutable HTTP URL is not strongly reproducible. Use it only
when upstream provides no stable artifact, and document that limitation.

## Verification

```sh
go test ./...
./tests/e2e.sh
./smoke-test.sh corpora/python-enhancement-proposals.ini
```

`tests/e2e.sh` uses local gzip JSONL and mbox fixtures through fetch, WALDO
ingest, and training. `smoke-test.sh` accepts any corpus INI, uses temporary
local index/lookaside/model directories, shows every command, and performs a
real fetch, ingest, and one-step model training. Set `WALDO_SMOKE_KEEP=1` to
preserve its temporary workspace.

A corpus fetcher is complete when its INI passes the tests, a real fetch writes
an unedited manifest, post-fetch validation matches the raw data, and WALDO's
dry-run accepts the handoff.

## Adding a new generic acquisition method

Do this only when no existing method can retain the upstream raw data. Add
named-field validation in `internal/config/config.go`, dispatch and acquisition
under `internal/fetcher/`, interruption-safe behavior, progress reporting, and
focused tests. The method must be reusable across corpora and must produce one
of the general formats above.

## License

The software, documentation, corpus configurations, and repository-authored
manifests in this repository are licensed under the
[Apache License 2.0](LICENSE). Downloaded corpus material remains governed by
its own upstream licenses and is not relicensed by this project.
