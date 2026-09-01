# OpenWALDO corpus plan

This is the forward collection plan for the public OpenWALDO index. It is not
a queue: a corpus becomes runnable only after its source, revision, license,
fetcher configuration, and destination have been reviewed.

## Collection rules

1. The public index may reference only data that OpenWALDO may redistribute.
   Permission to train on a dataset is not permission to publish its shards.
2. Acquire the upstream raw format and describe its general input mapping in
   the generated `manifest.json`. Do not add corpus-specific conversion.
3. Keep human, synthetic, translated, and derived data distinguishable.
4. Preserve speaker turns for dialogue. Do not flatten conversations during
   fetching.
5. Prefer primary, revision-pinned sources and independently auditable
   licenses. Review every release rather than inferring a data license from a
   code repository's license.
6. Avoid duplicating content already in the index. Add metadata-driven
   selections or compose weights when the underlying documents already exist.

## Foundational pretraining execution order

This is the definitive forward ingestion order for broad pretraining and
continued pretraining. Index paths describe subject and provenance; composes
decide which training phase consumes each corpus.

| Order | Corpus | Index destination | Training use | Status or gate |
| ---: | --- | --- | --- | --- |
| 1 | Common Pile GitHub Archive filtered | `community/github-archive` | Technical language, debugging, review, collaboration, and informal problem solving | Fetcher ready; 19 gzip shards and approximately 15 GB compressed |
| 2 | Common Pile Stack V2 Edu filtered | `code/stack-v2-edu` | Broad multilingual programming and technical-document pretraining | Fetcher ready; 95 gzip shards and approximately 83 GB compressed |
| 3 | Common Pile Stack V2 HTML filtered | `code/stack-v2-html` | Repository-associated technical prose, documentation, tutorials, and project pages | Fetcher ready; 5 gzip shards, approximately 2.0 GB compressed, and 1.67 million records |

## Blocked corpus TODO

Keep blocked sources here until every listed gate is resolved. They are not
ready to fetch or ingest merely because an upstream download exists.

| Corpus | Intended index destination | Why it is blocked | Resolution needed |
| --- | --- | --- | --- |
| Creative Commons Common Crawl filtered | `core/common-pile/cccc` | The dataset card claims per-record licenses, but the published records omit the license field | Obtain a corrected immutable release or authoritative record/domain-to-license mapping from the Common Pile maintainers |
| Open Textbook Library redistributable subset | `core/books/open-textbook-library` | Catalog metadata is CC0, book payloads are externally hosted with per-book licenses, and most payloads are PDF or EPUB | Add general PDF/EPUB ingestion, deterministic catalog-driven acquisition, and per-book license partitioning |
| OpenStax | `core/books/openstax` | Current books are CC BY-NC-SA 4.0 and the source books use CNXML | Decide whether the public index accepts noncommercial/share-alike material and add a reviewed generalized CNXML mapping |
| License-qualified bioRxiv | `science/biorxiv-open` | The bulk TDM repository does not permit general re-hosting | Acquire only article versions with redistribution-compatible licenses and check DOI overlap with `science/pubmed` and `science/pes2o` |

Two previously proposed jobs are already satisfied and must not be duplicated:

- PMC Open Access full text is already represented by `science/pubmed`, with
  approximately 3.8 million license-qualified records and per-record licenses.
- CourtListener is already included in `law/caselaw`; the Common Pile caselaw
  source combines Caselaw Access Project and public-domain CourtListener cases.

The missing Common Pile sources were also audited. GitHub Archive, Stack V2
Edu, and Stack V2 HTML are ready above. Stack V2 HTML is a distinct companion
containing extracted text from repository HTML files; measure cross-corpus
deduplication after ingest before assigning it substantial compose weight.
Creative Commons Common Crawl remains blocked on missing record-level license
fields. All other Common Pile families are already represented in the index.

## Immediate conversation plan

These fill the gap between technical community text and assistant-style SFT.

| Order | Corpus | What it contributes | Rights gate | Intended use |
| ---: | --- | --- | --- | --- |
| 1 | [Google Taskmaster](https://github.com/google-research-datasets/Taskmaster) | More than 55,000 written and spoken task-oriented dialogs; clarification, repair, and natural turns | Audit each Taskmaster release; TM-1 declares CC BY 4.0 | Conversational mid-training |
| 2 | [MultiDoGO](https://github.com/awslabs/multi-domain-goal-oriented-dialogues-dataset) | More than 81,000 human-to-human service dialogs in six domains | CDLA-Permissive 1.0 | Conversational mid-training |
| 3 | [Schema-Guided Dialogue](https://github.com/google-research-datasets/dstc8-schema-guided-dialogue) | Roughly 16,000 dialogs and 330,000 turns across everyday services | CC BY-SA 4.0; keep license-homogeneous shards | Conversational mid-training |
| 4 | [CCPE](https://github.com/google-research-datasets/ccpe) | 502 natural human dialogs about movie preferences | CC BY 4.0 | Small but valuable conversational corpus |
| 5 | [Topical-Chat](https://www.amazon.science/code-and-datasets/topical-chat) | Human open-domain, knowledge-grounded conversation | Review CDLA-Sharing 1.0 obligations before acceptance | Conversational mid-training |
| 6 | [MultiWOZ](https://github.com/budzianowski/multiwoz) | 10,437 human multi-domain dialogs | MultiWOZ 2.2 is distributed in the MIT-licensed project repository | Conversational mid-training |

Task-oriented dialogue teaches turn-taking and clarification, but it can also
overproduce a call-center voice. It should remain a minority of the language
mixture and be balanced with informal, topical, and literary conversation.

## Humor plan

1. Make the humor already present in Project Gutenberg selectable by preserving
   subject metadata such as `Humor`, `Satire`, `Comedy`, `Wit`, and `Jokes`.
   Do not publish duplicate shards containing the same books.
2. Preserve title, description, channel, and tags on the next YouTube corpus
   update. Use those fields to select openly licensed comedy, stand-up,
   interviews, panels, podcasts, and question-and-answer recordings.
3. Evaluate the [Gutenberg Dialogue Dataset](https://github.com/ricsinaruto/gutenberg-dialog)
   as a derived conversational view. It contains millions of literary dialog
   examples, but its source books substantially overlap the existing Gutenberg
   corpus and must not be counted as independent material.
4. Create an original OpenWALDO humor contribution under Apache-2.0 or CC0.
   Accept jokes, puns, comic dialog, anecdotes, satire, callbacks, and concise
   explanations of why a joke works, with contributor provenance and explicit
   rights.

Do not ingest Reddit joke dumps, scraped joke sites, movie or television
subtitles, or public chat logs merely because they are downloadable. Those
sources generally lack adequate redistribution permission, consent, or privacy
evidence.

## What Nemotron teaches us

The name Nemotron covers several generations. The most useful comparisons are
Nemotron 4, Nemotron Nano 2, and Nemotron 3 Nano.

### Published mixtures

- **Nemotron 4 (2024):** 9 trillion training tokens: 70% English natural
  language, 15% multilingual natural language, and 15% source code. Its
  alignment data was more than 98% synthetic.
- **Nemotron Nano 2 (2025):** a 20-trillion-token training horizon using web,
  Wikipedia, academic, math, code, multilingual, and SFT-style categories.
  NVIDIA switched mixtures at 60% and 90% of training, increasingly favoring
  higher-quality math, code, and SFT-style data. Its released collection
  describes 6.586 trillion corpus tokens, including 3.360T English web,
  1.257T synthetic web, 693B diverse QA, 558B translated diverse QA, 206B math,
  191B math SFT, 175B synthetic code, 59B code SFT, and 88B general SFT.
- **Nemotron 3 Nano (2026):** trained for approximately 25 trillion tokens while
  its disclosed training-data inventory totals about 10.65 trillion tokens;
  this implies substantial resampling. Its corpus covers web, dialogue,
  articles, code, math, science,
  legal, finance, 20 natural languages, and 43 programming languages. Later
  stages add verified synthetic reasoning, tool use, structured output,
  multi-turn conversation, and reinforcement learning environments.

The important pattern is a curriculum:

1. establish broad language and knowledge;
2. increase the concentration of high-quality academic, math, and code data;
3. introduce verified QA and instruction-shaped examples late in pretraining;
4. teach conversation and tools with dedicated SFT and reinforcement stages.

This supports OpenWALDO's separate pretraining, conversational, reasoning, and
tool-use composes. It does **not** support treating every conversation dataset
as undifferentiated pretraining text.

### Sources worth pursuing independently

Several Nemotron ingredients are already present in OpenWALDO: Wikimedia,
Stack Exchange, peS2o, PubMed, arXiv, Common Pile material, permissive code, and
open books. The strongest new source families to audit are:

| Priority | Source family | OpenWALDO evaluation |
| ---: | --- | --- |
| 1 | OpenStax and Open Textbook Library permissive subsets | High-value foundational and technical knowledge with explicit per-book licenses |
| 2 | PMC Open Access and bioRxiv license-qualified subsets | Expands full scientific prose; select only articles whose license permits redistribution |
| 3 | CourtListener bulk data | Useful legal breadth beyond current caselaw; provenance and public-domain/licensing fields must remain explicit |
| 4 | Open mathematical reasoning seeds | Audit GSM8K, PRM800K, SciBench, OpenBookQA, and similar sources individually before accepting them |
| 5 | Verified synthetic QA from OpenWALDO-owned inputs | Generate only with compatible models, preserve seed/model/prompt provenance, and keep synthetic data separately selectable |

### Sources not suitable for direct mirroring

NVIDIA's released Nemotron pretraining bundles are governed by the NVIDIA Data
Agreement for Model Training. It permits internal model training but forbids
transferring, distributing, or making the datasets available to others. The
public OpenWALDO lookaside therefore must **not** mirror those bundles.

Likewise, inclusion in Nemotron is not by itself an OpenWALDO license review.
LMSYS-Chat-1M, WildChat, Reddit derivatives, proprietary challenge data, and
private NVIDIA or third-party datasets fail or require substantial independent
review under OpenWALDO's redistribution and privacy standards.

## Execution order

1. Build the CCPE and Taskmaster fetcher configurations and ingest their full
   production corpora.
2. Fetch and ingest MultiDoGO and MultiWOZ 2.2 using their reviewed native
   delimited and JSON mappings.
3. Add OpenStax and Open Textbook Library license-qualified fetchers.
4. Make existing Gutenberg humor and YouTube conversational material
   selectable without duplicating physical content.
5. Audit PMC Open Access, bioRxiv, and CourtListener as the next foundational
   expansions.
6. Design an original, explicitly licensed OpenWALDO humor contribution.
7. After the human and foundational additions are measured, define a separate
   verified-synthetic-data plan inspired by Nemotron's late-stage curriculum.

## Fetcher compatibility audit

The current fetcher supports pinned Git trees, HTTP artifacts, Hugging Face
datasets, fixed HTTP sets, ZIP extraction, Gutenberg books, CAP, and several
mail archive sources. WALDO currently ingests text, Markdown, mbox, JSON,
JSONL, Parquet, delimited text, XML, PDF, and EPUB through generalized
profiles.

Create these INIs first:

| INI | Acquisition | Input | Status |
| --- | --- | --- | --- |
| `taskmaster.ini` | Pinned Git paths containing TM-1 through TM-4 dialog JSON | `format = json`, `type = chat-messages`, `role = utterances[].speaker`, `content = utterances[].text` | Added; production ingest in progress |
| `ccpe.ini` | Pinned Git `data.json` | `format = json`, `type = chat-messages`, `role = utterances[].speaker`, `content = utterances[].text` | Added and live-fetch validated; production ingest in progress |
| `schema-guided-dialogue.ini` | Pinned original train, development, and test dialogue JSON | `format = json`, `type = chat-messages`, `role = turns[].speaker`, `content = turns[].utterance`, with `USER` and `SYSTEM` role aliases | Added; production fetch and ingest pending |
| `multiwoz-2.2.ini` | Pinned official version 2.2 train, development, and test dialogue JSON | `format = json`, `type = chat-messages`, with `USER` and `SYSTEM` role aliases | Added; ready for production fetch and ingest |
| `multidogo.ini` | Pinned native unannotated turn files for all six domains | `format = delimited`, `type = delimited-chat`, comma delimiter, ordered by `turnNumber`, grouped by `conversationId` | Added; ready after deploying the matching WALDO binary |

Create these after small generalized improvements:

| INI | Blocker |
| --- | --- |
| `topical-chat.ini` | Conversation files are JSON objects keyed by dynamic conversation IDs, and speakers are `agent_1` and `agent_2`. General JSON mapping needs a configurable record-root/object-values expansion plus role aliases. Complete the CDLA-Sharing review first. |

Do not create these yet:

- `gutenberg-humor.ini`: it would duplicate books already in the index. The
  existing Gutenberg acquisition also does not currently apply its declared
  `selection`, `language`, or `ids` fields. Correct that behavior and design
  per-book subject metadata before making humor selectable.
- `gutenberg-dialogue.ini`: the published downloads use Mega, the extracted
  dialogs overlap existing Gutenberg books, and rebuilding them would require
  a corpus-specific transformation. Treat this as a derived-view question.
- `youtube-conversations.ini`: update `youtube.ini` to retain title,
  description, channel, and tags, then select those records in composes rather
  than downloading and publishing duplicates.

The minimal implementation order is therefore:

1. write `ccpe.ini`, fetch the complete corpus, ingest it, and verify the index;
2. write `taskmaster.ini`, fetch the complete corpus, ingest it, and verify the
   index;
3. fetch, ingest, and verify Schema-Guided Dialogue using generalized chat role aliases;
4. fetch and ingest MultiWOZ 2.2;
5. deploy the generalized delimited-chat adapter, then fetch and ingest
   MultiDoGO;
6. add generalized JSON record-root expansion for Topical-Chat.

## Acceptance gate

Before adding any entry to the index, record:

- immutable upstream revision and artifact list;
- exact data license and evidence URL;
- whether redistribution, modification, and commercial model training are
  allowed;
- human, synthetic, translated, or derived provenance;
- natural and programming languages;
- raw format and generalized WALDO input profile;
- document, byte, and token estimates;
- overlap with existing corpora;
- intended training stage and initial compose weight;
- successful complete fetch, WALDO ingest, and index verification.
