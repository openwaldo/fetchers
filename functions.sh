#!/bin/sh

# Shared acquisition and validation functions for WALDO corpus fetchers.
# Callers must use `set -eu` before sourcing this file.

fetcher_error() {
  printf 'fetcher: %s\n' "$*" >&2
  return 1
}

fetcher_require() {
  for fetcher_program do
    command -v "$fetcher_program" >/dev/null 2>&1 ||
      fetcher_error "required program is unavailable: $fetcher_program" || return
  done
}

fetcher_require_env() {
  for fetcher_variable do
    eval "fetcher_value=\${$fetcher_variable-}"
    [ -n "$fetcher_value" ] ||
      fetcher_error "required environment variable is unset: $fetcher_variable" || return
  done
}

fetcher_sha256() {
  if command -v sha256sum >/dev/null 2>&1; then
    sha256sum "$1" | awk '{print $1}'
  elif command -v shasum >/dev/null 2>&1; then
    shasum -a 256 "$1" | awk '{print $1}'
  else
    fetcher_error 'sha256sum or shasum is required'
  fi
}

fetcher_begin() {
  [ "$#" -eq 1 ] || {
    fetcher_error "usage: $(basename "$0") OUTPUT_DIRECTORY"
    return 2
  }
  [ -n "$1" ] || {
    fetcher_error 'output directory must not be empty'
    return 2
  }
  if [ -e "$1" ]; then
    [ -d "$1" ] && [ ! -L "$1" ] || {
      fetcher_error "output is not a non-symlink directory: $1"
      return 2
    }
  else
    mkdir -p "$1" || return
  fi

  FETCHER_OUTPUT=$(CDPATH='' cd -- "$1" && pwd -P) || return
  FETCHER_RAW=$FETCHER_OUTPUT/raw
  FETCHER_MANIFEST=$FETCHER_OUTPUT/manifest.json
  FETCHER_SCRIPT=$(CDPATH='' cd -- "$(dirname -- "$0")" && pwd -P)/$(basename -- "$0")
  export FETCHER_OUTPUT FETCHER_RAW FETCHER_MANIFEST FETCHER_SCRIPT

  if [ -e "$FETCHER_RAW" ]; then
    [ -d "$FETCHER_RAW" ] && [ ! -L "$FETCHER_RAW" ] || {
      fetcher_error "raw output is not a non-symlink directory: $FETCHER_RAW"
      return 2
    }
  else
    mkdir "$FETCHER_RAW" || return
  fi

  FETCHER_EXISTING_MANIFEST=false
  if [ -e "$FETCHER_MANIFEST" ]; then
    [ -f "$FETCHER_MANIFEST" ] && [ ! -L "$FETCHER_MANIFEST" ] || {
      fetcher_error "manifest is not a regular non-symlink file: $FETCHER_MANIFEST"
      return 2
    }
    fetcher_require jq || return
    jq -e '.kind == "waldo-source-directory" and .schema == 1' \
      "$FETCHER_MANIFEST" >/dev/null || {
      fetcher_error "existing manifest is invalid: $FETCHER_MANIFEST"
      return 2
    }
    FETCHER_EXISTING_MANIFEST=true
  fi
  export FETCHER_EXISTING_MANIFEST
  FETCHER_SPACE_CHECKED=false
  export FETCHER_SPACE_CHECKED
}

fetcher_size_bytes() {
  fetcher_size_value=$1
  printf '%s\n' "$fetcher_size_value" |
    grep -Eq '^[0-9]+([.][0-9]+)?([KMGT]i?B?|B)$' || {
    fetcher_error "invalid size '$fetcher_size_value' (use values such as 500M, 10G, or 2TiB)"
    return 2
  }
  awk -v value="$fetcher_size_value" 'BEGIN {
    number = value
    sub(/[KMGT]i?B?$|B$/, "", number)
    unit = value
    sub(/^[0-9]+([.][0-9]+)?/, "", unit)
    factor = 1
    if (unit ~ /^K/) factor = 1024
    if (unit ~ /^M/) factor = 1024 * 1024
    if (unit ~ /^G/) factor = 1024 * 1024 * 1024
    if (unit ~ /^T/) factor = 1024 * 1024 * 1024 * 1024
    printf "%.0f\n", number * factor
  }'
}

fetcher_size() {
  [ "$#" -ge 1 ] && [ "$#" -le 2 ] || {
    fetcher_error 'fetcher_size requires RAW_SIZE and optional REQUIRED_FREE_SIZE'
    return 2
  }
  fetcher_raw_bytes=$(fetcher_size_bytes "$1") || return
  if [ "$#" -eq 2 ]; then
    fetcher_required_bytes=$(fetcher_size_bytes "$2") || return
    [ "$fetcher_required_bytes" -ge "$fetcher_raw_bytes" ] || {
      fetcher_error 'required free size must not be smaller than raw size'
      return 2
    }
  else
    fetcher_required_bytes=$((fetcher_raw_bytes * 2 + 1073741824))
  fi
  fetcher_available_kib=$(df -Pk "$FETCHER_OUTPUT" | awk 'NR == 2 {print $4}')
  case $fetcher_available_kib in
    ''|*[!0-9]*) fetcher_error "could not determine free space for $FETCHER_OUTPUT"; return 1 ;;
  esac
  fetcher_available_bytes=$((fetcher_available_kib * 1024))
  [ "$fetcher_available_bytes" -ge "$fetcher_required_bytes" ] || {
    fetcher_error "insufficient free space: need approximately $fetcher_required_bytes bytes, have $fetcher_available_bytes bytes at $FETCHER_OUTPUT"
    return 1
  }
  FETCHER_SPACE_CHECKED=true
  export FETCHER_SPACE_CHECKED
  printf 'fetcher: space check passed (estimated raw %s; required free %s bytes)\n' \
    "$1" "$fetcher_required_bytes" >&2
}

fetcher_assert_ready() {
  [ "${FETCHER_SPACE_CHECKED-false}" = true ] ||
    fetcher_error 'fetcher_size must run before acquisition'
}

fetcher_safe_relative_path() {
  case $1 in
    ''|/*|../*|*/../*|*/..|..|*'//'*) return 1 ;;
  esac
  return 0
}

fetcher_download() {
  [ "$#" -ge 2 ] && [ "$#" -le 3 ] || {
    fetcher_error 'fetcher_download requires URL, RAW_PATH, and optional SHA256'
    return 2
  }
  fetcher_assert_ready || return
  fetcher_require curl || return
  fetcher_url=$1
  fetcher_relative=$2
  fetcher_expected=${3-}
  case $fetcher_url in
    http://*|https://*) ;;
    *) fetcher_error "download URL must use HTTP or HTTPS: $fetcher_url"; return 2 ;;
  esac
  fetcher_safe_relative_path "$fetcher_relative" || {
    fetcher_error "unsafe raw output path: $fetcher_relative"
    return 2
  }
  if [ -n "$fetcher_expected" ]; then
    case $fetcher_expected in *[!0-9a-f]*) fetcher_error 'SHA-256 must be 64 lowercase hexadecimal characters'; return 2 ;; esac
    [ "${#fetcher_expected}" -eq 64 ] || {
      fetcher_error 'SHA-256 must be 64 lowercase hexadecimal characters'
      return 2
    }
  fi

  fetcher_output=$FETCHER_RAW/$fetcher_relative
  fetcher_partial=$fetcher_output.partial
  mkdir -p "$(dirname -- "$fetcher_output")" || return
  if [ -e "$fetcher_output" ]; then
    [ -f "$fetcher_output" ] && [ ! -L "$fetcher_output" ] || {
      fetcher_error "existing output is not a regular non-symlink file: $fetcher_relative"
      return 1
    }
    if [ -n "$fetcher_expected" ]; then
      fetcher_actual=$(fetcher_sha256 "$fetcher_output") || return
      [ "$fetcher_actual" = "$fetcher_expected" ] || {
        fetcher_error "existing output checksum mismatch: $fetcher_relative"
        return 1
      }
    elif [ "$FETCHER_EXISTING_MANIFEST" != true ]; then
      fetcher_error "cannot verify existing output without a checksum or prior manifest: $fetcher_relative"
      return 1
    fi
    printf 'fetcher: reusing %s\n' "$fetcher_relative" >&2
    return 0
  fi
  [ ! -e "$fetcher_partial" ] || {
    [ -f "$fetcher_partial" ] && [ ! -L "$fetcher_partial" ] || {
      fetcher_error "partial output is unsafe: $fetcher_partial"
      return 1
    }
  }

  fetcher_connect_timeout=${WALDO_HTTP_CONNECT_TIMEOUT:-15}
  fetcher_max_time=${WALDO_HTTP_MAX_TIME:-0}
  fetcher_retries=${WALDO_HTTP_RETRIES:-8}
  case $fetcher_connect_timeout:$fetcher_max_time:$fetcher_retries in
    *[!0-9:]*) fetcher_error 'HTTP timeout and retry settings must be non-negative integers'; return 2 ;;
  esac
  fetcher_redirect_protocols='=http,https'
  case $fetcher_url in https://*) fetcher_redirect_protocols='=https' ;; esac
  printf 'fetcher: downloading %s\n' "$fetcher_relative" >&2
  curl --fail --silent --show-error --location \
    --proto '=http,https' --proto-redir "$fetcher_redirect_protocols" \
    --connect-timeout "$fetcher_connect_timeout" --max-time "$fetcher_max_time" \
    --retry "$fetcher_retries" --retry-delay 1 --retry-connrefused \
    --continue-at - --output "$fetcher_partial" "$fetcher_url" || {
    fetcher_error "download failed; partial content was preserved at $fetcher_partial"
    return 1
  }
  if [ -n "$fetcher_expected" ]; then
    fetcher_actual=$(fetcher_sha256 "$fetcher_partial") || return
    [ "$fetcher_actual" = "$fetcher_expected" ] || {
      fetcher_error "checksum mismatch for $fetcher_relative: expected $fetcher_expected, got $fetcher_actual"
      return 1
    }
  fi
  mv -- "$fetcher_partial" "$fetcher_output" || return
}

fetcher_huggingface() {
  [ "$#" -ge 5 ] && [ "$#" -le 6 ] || {
    fetcher_error 'fetcher_huggingface requires SOURCE_PATH, BASE_URL, ORG/DATASET, REVISION, SUFFIX, and optional PREFIX'
    return 2
  }
  fetcher_assert_ready || return
  fetcher_require curl jq || return
  fetcher_source_path=$1
  fetcher_hf_base=${2%/}
  fetcher_hf_dataset=$3
  fetcher_hf_revision=$4
  fetcher_hf_suffix=$5
  fetcher_hf_prefix=${6-}
  [ -z "$fetcher_source_path" ] || fetcher_safe_relative_path "$fetcher_source_path" || {
    fetcher_error "unsafe source path: $fetcher_source_path"
    return 2
  }
  case $fetcher_hf_base in http://*|https://*) ;; *) fetcher_error 'Hugging Face base URL must use HTTP or HTTPS'; return 2 ;; esac
  case $fetcher_hf_dataset in */*) ;; *) fetcher_error 'Hugging Face dataset must be ORG/NAME'; return 2 ;; esac
  case $fetcher_hf_dataset in *[!A-Za-z0-9._/-]*|*..*|/*|*/|*/*/*) fetcher_error 'unsafe Hugging Face dataset'; return 2 ;; esac
  case $fetcher_hf_revision in *[!0-9a-f]*|'') fetcher_error 'Hugging Face revision must be a 40-character lowercase commit'; return 2 ;; esac
  [ "${#fetcher_hf_revision}" -eq 40 ] || {
    fetcher_error 'Hugging Face revision must be a 40-character lowercase commit'
    return 2
  }
  case $fetcher_hf_suffix in json|jsonl|json.gz|jsonl.gz|parquet) ;; *) fetcher_error "unsupported Hugging Face suffix: $fetcher_hf_suffix"; return 2 ;; esac
  case $fetcher_hf_prefix in *[!A-Za-z0-9._/-]*|*..*|/*) fetcher_error 'unsafe Hugging Face prefix'; return 2 ;; esac

  mkdir -p "$FETCHER_OUTPUT/.work"
  fetcher_hf_metadata=$FETCHER_OUTPUT/.work/huggingface.$$.json
  fetcher_hf_api="$fetcher_hf_base/api/datasets/$fetcher_hf_dataset/revision/$fetcher_hf_revision?blobs=true"
  curl --fail --silent --show-error --location \
    --proto '=http,https' --proto-redir '=http,https' \
    --connect-timeout 15 --max-time 180 --retry 5 --retry-delay 1 \
    --retry-connrefused --output "$fetcher_hf_metadata" "$fetcher_hf_api" || {
    fetcher_error "could not read pinned Hugging Face metadata for $fetcher_hf_dataset"
    return 1
  }
  jq -e --arg revision "$fetcher_hf_revision" --arg suffix ".$fetcher_hf_suffix" --arg prefix "$fetcher_hf_prefix" '
    .sha == $revision and
    ([.siblings[] | select(.rfilename | endswith($suffix)) |
      select($prefix == "" or (.rfilename | startswith($prefix)))] | length) > 0 and
    all(.siblings[] | select(.rfilename | endswith($suffix)) |
      select($prefix == "" or (.rfilename | startswith($prefix)));
      (.rfilename | test("^[A-Za-z0-9._/-]+$") and (contains("..") | not)) and
      (.size | type == "number" and . > 0) and
      (.lfs.sha256 | type == "string" and test("^[0-9a-f]{64}$")))
  ' "$fetcher_hf_metadata" >/dev/null || {
    fetcher_error "Hugging Face metadata is incomplete or revision drifted for $fetcher_hf_dataset"
    return 1
  }
  fetcher_hf_duplicates=$(jq -r --arg suffix ".$fetcher_hf_suffix" --arg prefix "$fetcher_hf_prefix" '
    [.siblings[] | select(.rfilename | endswith($suffix)) |
      select($prefix == "" or (.rfilename | startswith($prefix))) |
      .rfilename | split("/")[-1]] |
    group_by(.)[] | select(length > 1) | .[0]
  ' "$fetcher_hf_metadata")
  [ -z "$fetcher_hf_duplicates" ] || {
    fetcher_error "selected Hugging Face files have duplicate basenames: $fetcher_hf_duplicates"
    return 1
  }
  jq -r --arg suffix ".$fetcher_hf_suffix" --arg prefix "$fetcher_hf_prefix" '
    .siblings[] | select(.rfilename | endswith($suffix)) |
    select($prefix == "" or (.rfilename | startswith($prefix))) |
    [.rfilename, .lfs.sha256] | @tsv
  ' "$fetcher_hf_metadata" | LC_ALL=C sort | while IFS="$(printf '\t')" read -r fetcher_hf_remote fetcher_hf_checksum; do
    fetcher_hf_output=${fetcher_hf_remote##*/}
    case $fetcher_hf_output in *.json.gz) fetcher_hf_output=${fetcher_hf_output%.json.gz}.jsonl.gz ;; esac
    fetcher_hf_encoded=$(printf '%s' "$fetcher_hf_remote" | jq -sRr @uri)
    if [ -n "$fetcher_source_path" ]; then
      fetcher_hf_output=$fetcher_source_path/$fetcher_hf_output
    fi
    fetcher_download "$fetcher_hf_base/datasets/$fetcher_hf_dataset/resolve/$fetcher_hf_revision/$fetcher_hf_encoded?download=true" \
      "$fetcher_hf_output" "$fetcher_hf_checksum" || exit
  done || return
  rm -f -- "$fetcher_hf_metadata"
  rmdir "$FETCHER_OUTPUT/.work" 2>/dev/null || true
}

fetcher_git() {
  [ "$#" -ge 5 ] || {
    fetcher_error 'fetcher_git requires SOURCE_PATH, REPOSITORY, REVISION, COMMIT, and a path selection'
    return 2
  }
  fetcher_assert_ready || return
  fetcher_require git tar || return
  fetcher_git_source=$1
  fetcher_git_repository=$2
  fetcher_git_revision=$3
  fetcher_git_expected=$4
  shift 4
  fetcher_safe_relative_path "$fetcher_git_source" || {
    fetcher_error "Git sources require a non-empty safe source path: $fetcher_git_source"
    return 2
  }
  case $fetcher_git_repository in http://*|https://*|git://*|ssh://*|git@*:*|file://*) ;; *) fetcher_error "unsupported Git repository URL: $fetcher_git_repository"; return 2 ;; esac
  case $fetcher_git_expected in *[!0-9a-f]*|'') fetcher_error 'expected Git commit must be 40 lowercase hexadecimal characters'; return 2 ;; esac
  [ "${#fetcher_git_expected}" -eq 40 ] || {
    fetcher_error 'expected Git commit must be 40 lowercase hexadecimal characters'
    return 2
  }

  fetcher_git_symlinks=reject
  fetcher_git_filter=false
  fetcher_git_source_code=false
  while [ "$#" -gt 0 ]; do
    case $1 in
      --skip-symlinks) fetcher_git_symlinks=skip; shift ;;
      --filter-blobs) fetcher_git_filter=true; shift ;;
      --source-code) fetcher_git_source_code=true; shift ;;
      *) break ;;
    esac
  done
  if [ "$fetcher_git_source_code" = true ]; then
    set -- \
      '/*' \
      '!**/vendor/**' '!**/vendors/**' '!**/third_party/**' '!**/third-party/**' \
      '!**/external/**' '!**/node_modules/**' '!**/.venv/**' '!**/dist/**' \
      '!**/build/**' '!**/target/**' '!**/generated/**' '!**/testdata/**' \
      '!**/*.min.js' '!**/*.pb.go' '!**/*.pb.gw.go' '!**/*.swagger.go' \
      '!**/*_generated.go' '!**/zz_generated.*' '!**/generated.pb.*' \
      '!**/generated.deepcopy.*' '!**/generated.conversion.*' '!**/generated.defaults.*'
  fi
  [ "$#" -gt 0 ] || {
    fetcher_error 'fetcher_git requires at least one tracked-file pathspec'
    return 2
  }

  fetcher_git_output=$FETCHER_RAW/$fetcher_git_source
  if [ -e "$fetcher_git_output" ]; then
    [ -d "$fetcher_git_output" ] && [ ! -L "$fetcher_git_output" ] || {
      fetcher_error "existing Git output is unsafe: $fetcher_git_output"
      return 1
    }
    [ "$FETCHER_EXISTING_MANIFEST" = true ] || {
      fetcher_error "cannot verify existing Git output without a prior manifest: $fetcher_git_source"
      return 1
    }
    printf 'fetcher: reusing Git source %s\n' "$fetcher_git_source" >&2
    return 0
  fi

  fetcher_git_work=$FETCHER_OUTPUT/.work/$fetcher_git_source
  fetcher_git_clone=$fetcher_git_work/repository.git
  fetcher_git_archive=$fetcher_git_work/repository.tar
  fetcher_git_partial=$fetcher_git_work/output
  mkdir -p "$fetcher_git_work"
  if [ ! -d "$fetcher_git_clone" ]; then
    git init -q "$fetcher_git_clone" || return
    git -C "$fetcher_git_clone" remote add origin "$fetcher_git_repository" || return
  fi
  printf 'fetcher: fetching %s at %s\n' "$fetcher_git_repository" "$fetcher_git_revision" >&2
  fetcher_git_attempt=1
  while :; do
    if [ "$fetcher_git_filter" = true ]; then
      git -C "$fetcher_git_clone" fetch -q --depth=1 --no-tags --filter=blob:none origin "$fetcher_git_revision" && break
    else
      git -C "$fetcher_git_clone" fetch -q --depth=1 --no-tags origin "$fetcher_git_revision" && break
    fi
    [ "$fetcher_git_attempt" -lt 4 ] || {
      fetcher_error "Git fetch failed after $fetcher_git_attempt attempts; work preserved at $fetcher_git_work"
      return 1
    }
    sleep $((fetcher_git_attempt * 2))
    fetcher_git_attempt=$((fetcher_git_attempt + 1))
  done
  fetcher_git_actual=$(git -C "$fetcher_git_clone" rev-parse 'FETCH_HEAD^{commit}') || return
  [ "$fetcher_git_actual" = "$fetcher_git_expected" ] || {
    fetcher_error "Git revision resolved to $fetcher_git_actual, expected $fetcher_git_expected"
    return 1
  }
  [ ! -e "$fetcher_git_partial" ] || {
    fetcher_error "partial Git export already exists; inspect it before retrying: $fetcher_git_partial"
    return 1
  }
  mkdir "$fetcher_git_partial"
  if [ "$fetcher_git_source_code" = true ]; then
    git -C "$fetcher_git_clone" sparse-checkout init --no-cone || return
    git -C "$fetcher_git_clone" sparse-checkout set --no-cone "$@" || return
    git -C "$fetcher_git_clone" checkout -q --detach "$fetcher_git_actual" || return
    tar -cf "$fetcher_git_archive" --exclude=.git -C "$fetcher_git_clone" . || return
  else
    git -C "$fetcher_git_clone" archive --format=tar --output="$fetcher_git_archive" \
      "$fetcher_git_actual" -- "$@" || return
  fi
  tar -xf "$fetcher_git_archive" -C "$fetcher_git_partial" || return
  fetcher_git_symlink=$(find "$fetcher_git_partial" -type l -print -quit)
  if [ -n "$fetcher_git_symlink" ]; then
    if [ "$fetcher_git_symlinks" = reject ]; then
      fetcher_error "selected Git content contains a symlink: ${fetcher_git_symlink#"$fetcher_git_partial"/}"
      return 1
    fi
    find "$fetcher_git_partial" -type l -delete
  fi
  fetcher_git_count=$(find "$fetcher_git_partial" -type f | wc -l | tr -d ' ')
  [ "$fetcher_git_count" -gt 0 ] || {
    fetcher_error "Git source selection produced no files: $fetcher_git_source"
    return 1
  }
  mkdir -p "$(dirname -- "$fetcher_git_output")"
  mv -- "$fetcher_git_partial" "$fetcher_git_output" || return
  rm -rf -- "$fetcher_git_work"
  rmdir "$FETCHER_OUTPUT/.work" 2>/dev/null || true
  printf 'fetcher: published %s files from %s\n' "$fetcher_git_count" "$fetcher_git_actual" >&2
}

fetcher_manifest() {
  [ "$#" -eq 0 ] || {
    fetcher_error 'fetcher_manifest reads its JSON specification from standard input'
    return 2
  }
  fetcher_assert_ready || return
  fetcher_require jq find sort awk wc || return
  fetcher_spec=$FETCHER_OUTPUT/.manifest.spec.$$
  fetcher_inventory=$FETCHER_OUTPUT/.manifest.inventory.$$
  fetcher_partial=$FETCHER_OUTPUT/.manifest.partial.$$
  trap 'rm -f -- "$fetcher_spec" "$fetcher_inventory" "$fetcher_partial"' EXIT HUP INT TERM
  umask 022
  cat >"$fetcher_spec" || return
  jq -e '
    type == "object" and
    (.corpus.id | type == "string" and length > 0) and
    (.corpus.title | type == "string" and length > 0) and
    (.sources | type == "array" and length > 0) and
    all(.sources[];
      (.id | type == "string" and test("^[a-z0-9][a-z0-9._-]*$")) and
      (.path | type == "string" and test("^(|[A-Za-z0-9._-]+(/[A-Za-z0-9._-]+)*)$")) and
      (.license | type == "string" and length > 0) and
      (.source.name | type == "string" and length > 0) and
      (.source.url | type == "string" and test("^https?://")) and
      (.source.category | type == "string" and length > 0) and
      (.source.license_evidence | type == "object") and
      (.input | type == "object"))
  ' "$fetcher_spec" >/dev/null || {
    fetcher_error 'manifest specification is invalid'
    return 2
  }

  fetcher_special=$(find "$FETCHER_RAW" ! -type d ! -type f -print -quit)
  [ -z "$fetcher_special" ] || {
    fetcher_error "raw tree contains a symlink or special file: $fetcher_special"
    return 1
  }
  : >"$fetcher_inventory"
  find "$FETCHER_RAW" -type f -print | LC_ALL=C sort | while IFS= read -r fetcher_file; do
    fetcher_relative=${fetcher_file#"$FETCHER_RAW"/}
    case $fetcher_relative in *'
'*|*'	'*) fetcher_error "raw filename contains a tab or newline: $fetcher_relative"; exit 1 ;; esac
    fetcher_hash=$(fetcher_sha256 "$fetcher_file") || exit
    fetcher_bytes=$(wc -c <"$fetcher_file" | tr -d ' ')
    printf '%s\t%s\t%s\n' "$fetcher_hash" "$fetcher_bytes" "$fetcher_relative"
  done >"$fetcher_inventory" || return
  [ -s "$fetcher_inventory" ] || {
    fetcher_error 'raw directory contains no files'
    return 1
  }
  fetcher_files=$(wc -l <"$fetcher_inventory" | tr -d ' ')
  fetcher_bytes=$(awk -F '\t' '{sum += $2} END {printf "%.0f", sum}' "$fetcher_inventory")
  fetcher_tree_sha=$(fetcher_sha256 "$fetcher_inventory") || return

  fetcher_unfinished=$(find "$FETCHER_OUTPUT" -mindepth 1 -maxdepth 1 \
    ! -name raw ! -name manifest.json ! -name '.manifest.*' -print -quit)
  [ -z "$fetcher_unfinished" ] || {
    fetcher_error "unfinished acquisition state remains: $fetcher_unfinished"
    return 1
  }
  fetcher_script_sha=$(fetcher_sha256 "$FETCHER_SCRIPT") || return
  fetcher_retrieved=$(date -u '+%Y-%m-%dT%H:%M:%SZ')
  fetcher_script_name=corpora/$(basename -- "$FETCHER_SCRIPT")

  fetcher_repo=$(CDPATH='' cd -- "$(dirname -- "$FETCHER_SCRIPT")/.." && pwd -P)
  fetcher_revision=
  fetcher_dirty=true
  if command -v git >/dev/null 2>&1 && git -C "$fetcher_repo" rev-parse --is-inside-work-tree >/dev/null 2>&1; then
    fetcher_revision=$(git -C "$fetcher_repo" rev-parse HEAD 2>/dev/null || true)
    if git -C "$fetcher_repo" diff --quiet -- "$FETCHER_SCRIPT" &&
       git -C "$fetcher_repo" diff --cached --quiet -- "$FETCHER_SCRIPT"; then
      fetcher_dirty=false
    fi
  fi

  jq -S \
    --arg retrieved_at "$fetcher_retrieved" \
    --arg script "$fetcher_script_name" \
    --arg script_sha256 "$fetcher_script_sha" \
    --arg revision "$fetcher_revision" \
    --argjson dirty "$fetcher_dirty" \
    --argjson file_count "$fetcher_files" \
    --argjson byte_count "$fetcher_bytes" \
    --arg tree_sha256 "$fetcher_tree_sha" '
      . + {
        kind: "waldo-source-directory",
        schema: 1,
        retrieved_at: $retrieved_at,
        fetcher: ({script: $script, sha256: $script_sha256, dirty: $dirty} +
          (if $revision == "" then {} else {revision: $revision} end)),
        raw: {
          path: "raw",
          file_count: $file_count,
          byte_count: $byte_count,
          tree_sha256: $tree_sha256
        }
      }
    ' "$fetcher_spec" >"$fetcher_partial" || return
  mv -- "$fetcher_partial" "$FETCHER_MANIFEST" || return
  rm -f -- "$fetcher_spec" "$fetcher_inventory"
  trap - EXIT HUP INT TERM
  printf 'fetcher: wrote %s (%s files, %s bytes)\n' \
    "$FETCHER_MANIFEST" "$fetcher_files" "$fetcher_bytes" >&2
}
