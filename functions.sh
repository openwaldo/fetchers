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
  FETCHER_REPOSITORY=$(CDPATH='' cd -- "$(dirname -- "$FETCHER_SCRIPT")/.." && pwd -P)
  FETCHER_LIBEXEC=$FETCHER_REPOSITORY/libexec
  export FETCHER_OUTPUT FETCHER_RAW FETCHER_MANIFEST FETCHER_SCRIPT
  export FETCHER_REPOSITORY FETCHER_LIBEXEC

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

fetcher_apache_mbox_year() {
  [ "$#" -eq 16 ] || {
    fetcher_error 'fetcher_apache_mbox_year requires SOURCE_PATH, BASE_URL, LIST, YEAR, and twelve SHA256 values'
    return 2
  }
  fetcher_mbox_path=$1
  fetcher_mbox_base=${2%/}
  fetcher_mbox_list=$3
  fetcher_mbox_year=$4
  shift 4
  case $fetcher_mbox_list in *@*.apache.org) ;; *) fetcher_error 'Apache list must end in @*.apache.org'; return 2 ;; esac
  fetcher_mbox_month=1
  for fetcher_mbox_checksum do
    fetcher_mbox_number=$(printf '%02d' "$fetcher_mbox_month")
    fetcher_download "$fetcher_mbox_base/api/mbox.lua?list=$fetcher_mbox_list&date=$fetcher_mbox_year-$fetcher_mbox_number" \
      "$fetcher_mbox_path/$fetcher_mbox_year-$fetcher_mbox_number.mbox" "$fetcher_mbox_checksum" || return
    fetcher_mbox_month=$((fetcher_mbox_month + 1))
  done
}

fetcher_gnu_mbox_year() {
  [ "$#" -eq 16 ] || {
    fetcher_error 'fetcher_gnu_mbox_year requires SOURCE_PATH, BASE_URL, LIST, YEAR, and twelve SHA256 values'
    return 2
  }
  fetcher_mbox_path=$1
  fetcher_mbox_base=${2%/}
  fetcher_mbox_list=$3
  fetcher_mbox_year=$4
  shift 4
  case $fetcher_mbox_list in ''|*[!A-Za-z0-9._+-]*) fetcher_error 'unsafe GNU list name'; return 2 ;; esac
  fetcher_mbox_month=1
  for fetcher_mbox_checksum do
    fetcher_mbox_number=$(printf '%02d' "$fetcher_mbox_month")
    fetcher_download "$fetcher_mbox_base/$fetcher_mbox_list/$fetcher_mbox_year-$fetcher_mbox_number" \
      "$fetcher_mbox_path/$fetcher_mbox_list-$fetcher_mbox_year-$fetcher_mbox_number.mbox" "$fetcher_mbox_checksum" || return
    fetcher_mbox_month=$((fetcher_mbox_month + 1))
  done
}

fetcher_mailman_text_set() {
  [ "$#" -ge 4 ] && [ $((($# - 1) % 3)) -eq 0 ] || {
    fetcher_error 'fetcher_mailman_text_set requires SOURCE_PATH and URL OUTPUT SHA256 triples'
    return 2
  }
  fetcher_mailman_path=$1
  shift
  fetcher_require gzip || return
  while [ "$#" -gt 0 ]; do
    fetcher_mailman_url=$1
    fetcher_mailman_name=$2
    fetcher_mailman_sha=$3
    shift 3
    case $fetcher_mailman_name in *.txt) ;; *) fetcher_error 'Mailman output must end in .txt'; return 2 ;; esac
    fetcher_mailman_base=${fetcher_mailman_name%.txt}.mbox
    fetcher_mailman_compressed=$fetcher_mailman_path/$fetcher_mailman_base.gz
    fetcher_mailman_output=$FETCHER_RAW/$fetcher_mailman_path/$fetcher_mailman_base
    fetcher_download "$fetcher_mailman_url" "$fetcher_mailman_compressed" "$fetcher_mailman_sha" || return
    [ ! -e "$fetcher_mailman_output" ] || {
      [ "$FETCHER_EXISTING_MANIFEST" = true ] && continue
      fetcher_error "cannot verify existing decompressed Mailman output: $fetcher_mailman_output"
      return 1
    }
    gzip -dc -- "$FETCHER_RAW/$fetcher_mailman_compressed" >"$fetcher_mailman_output.partial" || {
      fetcher_error "invalid Mailman gzip archive: $fetcher_mailman_compressed"
      return 1
    }
    mv -- "$fetcher_mailman_output.partial" "$fetcher_mailman_output"
    rm -f -- "$FETCHER_RAW/$fetcher_mailman_compressed"
  done
}

fetcher_public_inbox_year() {
  [ "$#" -ge 5 ] || {
    fetcher_error 'fetcher_public_inbox_year requires SOURCE_PATH, BASE_URL, LIST, YEAR, and EPOCH:HEAD values'
    return 2
  }
  fetcher_assert_ready || return
  fetcher_require git python3 || return
  fetcher_inbox_path=$1
  fetcher_inbox_base=${2%/}
  fetcher_inbox_list=$3
  fetcher_inbox_year=$4
  shift 4
  fetcher_safe_relative_path "$fetcher_inbox_path" || { fetcher_error 'unsafe public-inbox source path'; return 2; }
  case $fetcher_inbox_list in ''|*[!A-Za-z0-9._-]*) fetcher_error 'unsafe public-inbox list'; return 2 ;; esac
  fetcher_inbox_output=$FETCHER_RAW/$fetcher_inbox_path
  if [ -e "$fetcher_inbox_output" ]; then
    [ "$FETCHER_EXISTING_MANIFEST" = true ] || {
      fetcher_error "cannot verify existing public-inbox output: $fetcher_inbox_path"
      return 1
    }
    return 0
  fi
  fetcher_inbox_work=$FETCHER_OUTPUT/.work/public-inbox-$fetcher_inbox_path
  fetcher_inbox_partial=$fetcher_inbox_work/output
  mkdir -p "$fetcher_inbox_partial"
  for fetcher_inbox_specification do
    fetcher_inbox_epoch=${fetcher_inbox_specification%%:*}
    fetcher_inbox_head=${fetcher_inbox_specification#*:}
    case $fetcher_inbox_epoch in ''|*[!0-9]*) fetcher_error 'unsafe public-inbox epoch'; return 2 ;; esac
    case $fetcher_inbox_head in *[!0-9a-f]*|'') fetcher_error 'unsafe public-inbox head'; return 2 ;; esac
    [ "${#fetcher_inbox_head}" -eq 40 ] || { fetcher_error 'public-inbox head must have 40 characters'; return 2; }
    fetcher_inbox_repository=$fetcher_inbox_work/$fetcher_inbox_epoch.git
    if [ ! -d "$fetcher_inbox_repository" ]; then
      git init --bare --quiet "$fetcher_inbox_repository" || return
    fi
    git --git-dir="$fetcher_inbox_repository" fetch --quiet --no-tags \
      "$fetcher_inbox_base/$fetcher_inbox_list/$fetcher_inbox_epoch" "$fetcher_inbox_head" || return
    fetcher_inbox_actual=$(git --git-dir="$fetcher_inbox_repository" rev-parse FETCH_HEAD) || return
    [ "$fetcher_inbox_actual" = "$fetcher_inbox_head" ] || { fetcher_error 'public-inbox head mismatch'; return 1; }
    python3 "$FETCHER_LIBEXEC/public_inbox_extract.py" "$fetcher_inbox_repository" \
      "$fetcher_inbox_head" "$fetcher_inbox_year" "$fetcher_inbox_partial" \
      "$fetcher_inbox_list-epoch-$fetcher_inbox_epoch" || return
  done
  mkdir -p "$(dirname -- "$fetcher_inbox_output")"
  mv -- "$fetcher_inbox_partial" "$fetcher_inbox_output"
  rm -rf -- "$fetcher_inbox_work"
  rmdir "$FETCHER_OUTPUT/.work" 2>/dev/null || true
}

fetcher_sourcehut_list_export() {
  [ "$#" -eq 4 ] || {
    fetcher_error 'fetcher_sourcehut_list_export requires SOURCE_PATH, LIST_URL, OUTPUT_DIR, and canonical SHA256'
    return 2
  }
  fetcher_assert_ready || return
  fetcher_require curl sed python3 || return
  fetcher_sourcehut_path=$1
  fetcher_sourcehut_url=${2%/}
  fetcher_sourcehut_name=$3
  fetcher_sourcehut_expected=$4
  fetcher_sourcehut_output=$FETCHER_RAW/$fetcher_sourcehut_path/$fetcher_sourcehut_name
  if [ -e "$fetcher_sourcehut_output" ]; then
    [ "$FETCHER_EXISTING_MANIFEST" = true ] || { fetcher_error 'cannot verify existing SourceHut output'; return 1; }
    return 0
  fi
  fetcher_sourcehut_work=$FETCHER_OUTPUT/.work/sourcehut-$fetcher_sourcehut_path
  mkdir -p "$fetcher_sourcehut_work"
  fetcher_sourcehut_page=$fetcher_sourcehut_work/page.html
  fetcher_sourcehut_cookies=$fetcher_sourcehut_work/cookies
  fetcher_sourcehut_raw=$fetcher_sourcehut_work/export.mbox
  fetcher_sourcehut_canonical=$fetcher_sourcehut_work/canonical.mbox
  fetcher_sourcehut_split=$fetcher_sourcehut_work/messages
  curl --fail --silent --show-error --location --proto '=http,https' \
    --connect-timeout 15 --retry 8 --retry-connrefused --cookie-jar "$fetcher_sourcehut_cookies" \
    --output "$fetcher_sourcehut_page" "$fetcher_sourcehut_url" || return
  fetcher_sourcehut_token=$(sed -n 's/.*name="_csrf_token"[^>]*value="\([^"]*\)".*/\1/p' "$fetcher_sourcehut_page" | head -n 1)
  case $fetcher_sourcehut_token in ''|*[!A-Za-z0-9._-]*) fetcher_error 'missing or unsafe SourceHut CSRF token'; return 1 ;; esac
  curl --fail --silent --show-error --location --proto '=http,https' \
    --connect-timeout 15 --retry 8 --retry-connrefused --cookie "$fetcher_sourcehut_cookies" \
    --data-urlencode "_csrf_token=$fetcher_sourcehut_token" --data 'days=-1' \
    --output "$fetcher_sourcehut_raw" "$fetcher_sourcehut_url/export" || return
  sed -E 's/^From MAILER-DAEMON .*/From MAILER-DAEMON Thu Jan 01 00:00:00 1970/' \
    "$fetcher_sourcehut_raw" >"$fetcher_sourcehut_canonical" || return
  fetcher_sourcehut_actual=$(fetcher_sha256 "$fetcher_sourcehut_canonical") || return
  [ "$fetcher_sourcehut_actual" = "$fetcher_sourcehut_expected" ] || {
    fetcher_error "SourceHut canonical verification mismatch: expected $fetcher_sourcehut_expected, got $fetcher_sourcehut_actual"
    return 1
  }
  python3 "$FETCHER_LIBEXEC/mbox_split.py" "$fetcher_sourcehut_raw" "$fetcher_sourcehut_split" || return
  mkdir -p "$(dirname -- "$fetcher_sourcehut_output")"
  mv -- "$fetcher_sourcehut_split" "$fetcher_sourcehut_output"
  rm -rf -- "$fetcher_sourcehut_work"
  rmdir "$FETCHER_OUTPUT/.work" 2>/dev/null || true
}

fetcher_hyperkitty_monthly() {
  [ "$#" -eq 6 ] || {
    fetcher_error 'fetcher_hyperkitty_monthly requires SOURCE_PATH, BASE_URL, LIST, OUTPUT_DIR, MANIFEST, and MANIFEST_SHA256'
    return 2
  }
  fetcher_assert_ready || return
  fetcher_require curl gzip python3 || return
  fetcher_hk_path=$1
  fetcher_hk_base=${2%/}
  fetcher_hk_list=$3
  fetcher_hk_name=$4
  fetcher_hk_manifest_name=$5
  fetcher_hk_manifest_sha=$6
  fetcher_hk_manifest=$FETCHER_REPOSITORY/manifests/hyperkitty/$fetcher_hk_manifest_name
  [ "$(fetcher_sha256 "$fetcher_hk_manifest")" = "$fetcher_hk_manifest_sha" ] || {
    fetcher_error "HyperKitty acquisition manifest checksum mismatch: $fetcher_hk_manifest_name"
    return 1
  }
  fetcher_hk_output=$FETCHER_RAW/$fetcher_hk_path/$fetcher_hk_name
  if [ -e "$fetcher_hk_output" ]; then
    [ "$FETCHER_EXISTING_MANIFEST" = true ] || { fetcher_error 'cannot verify existing HyperKitty output'; return 1; }
    return 0
  fi
  fetcher_hk_work=$FETCHER_OUTPUT/.work/hyperkitty-$fetcher_hk_path
  fetcher_hk_partial=$fetcher_hk_work/output
  mkdir -p "$fetcher_hk_partial"
  fetcher_hk_tab=$(printf '\t')
  while IFS="$fetcher_hk_tab" read -r fetcher_hk_period fetcher_hk_count fetcher_hk_sha fetcher_hk_extra; do
    [ "$fetcher_hk_period" != period ] || continue
    [ -z "${fetcher_hk_extra:-}" ] || { fetcher_error "malformed HyperKitty row: $fetcher_hk_period"; return 1; }
    fetcher_hk_year=${fetcher_hk_period%-*}
    fetcher_hk_month=${fetcher_hk_period#*-}
    case $fetcher_hk_month in
      01) fetcher_hk_next="$fetcher_hk_year-02" ;; 02) fetcher_hk_next="$fetcher_hk_year-03" ;;
      03) fetcher_hk_next="$fetcher_hk_year-04" ;; 04) fetcher_hk_next="$fetcher_hk_year-05" ;;
      05) fetcher_hk_next="$fetcher_hk_year-06" ;; 06) fetcher_hk_next="$fetcher_hk_year-07" ;;
      07) fetcher_hk_next="$fetcher_hk_year-08" ;; 08) fetcher_hk_next="$fetcher_hk_year-09" ;;
      09) fetcher_hk_next="$fetcher_hk_year-10" ;; 10) fetcher_hk_next="$fetcher_hk_year-11" ;;
      11) fetcher_hk_next="$fetcher_hk_year-12" ;; 12) fetcher_hk_next="$((fetcher_hk_year + 1))-01" ;;
      *) fetcher_error "invalid HyperKitty month: $fetcher_hk_period"; return 1 ;;
    esac
    fetcher_hk_archive=$fetcher_hk_work/$fetcher_hk_period.mbox.gz
    fetcher_hk_url="$fetcher_hk_base/$fetcher_hk_list%40python.org/export/$fetcher_hk_list%40python.org-$fetcher_hk_period.mbox.gz?end=$fetcher_hk_next-01&start=$fetcher_hk_period-01"
    curl --http1.1 --fail --silent --show-error --location --proto '=http,https' \
      --connect-timeout 15 --retry 8 --retry-connrefused --output "$fetcher_hk_archive" "$fetcher_hk_url" || return
    gzip -t "$fetcher_hk_archive" || return
    python3 "$FETCHER_LIBEXEC/hyperkitty_extract.py" "$fetcher_hk_archive" \
      "$fetcher_hk_partial/$fetcher_hk_period" "$fetcher_hk_list-$fetcher_hk_period-message" \
      "$fetcher_hk_count" "$fetcher_hk_sha" || return
  done <"$fetcher_hk_manifest"
  mkdir -p "$(dirname -- "$fetcher_hk_output")"
  mv -- "$fetcher_hk_partial" "$fetcher_hk_output"
  rm -rf -- "$fetcher_hk_work"
  rmdir "$FETCHER_OUTPUT/.work" 2>/dev/null || true
}

fetcher_zip_extract() {
  [ "$#" -eq 4 ] || {
    fetcher_error 'fetcher_zip_extract requires SOURCE_PATH, ARCHIVE, SUFFIX, and OUTPUT_DIR'
    return 2
  }
  fetcher_assert_ready || return
  fetcher_require python3 || return
  fetcher_zip_path=$1
  fetcher_zip_archive=$FETCHER_RAW/${fetcher_zip_path:+$fetcher_zip_path/}$2
  fetcher_zip_suffix=$3
  fetcher_zip_output=$FETCHER_RAW/${fetcher_zip_path:+$fetcher_zip_path/}$4
  fetcher_zip_partial=$fetcher_zip_output.partial
  [ -f "$fetcher_zip_archive" ] && [ ! -L "$fetcher_zip_archive" ] || { fetcher_error "ZIP archive is unavailable: $fetcher_zip_archive"; return 1; }
  [ ! -e "$fetcher_zip_output" ] || { fetcher_error "ZIP output already exists: $fetcher_zip_output"; return 1; }
  python3 "$FETCHER_LIBEXEC/zip_extract.py" "$fetcher_zip_archive" "$fetcher_zip_suffix" \
    "$fetcher_zip_partial" "${WALDO_ZIP_MAX_FILES:-1000000}" \
    "${WALDO_ZIP_MAX_BYTES:-107374182400}" || return
  mv -- "$fetcher_zip_partial" "$fetcher_zip_output"
  rm -f -- "$fetcher_zip_archive"
}

fetcher_gutenberg() {
  [ "$#" -ge 2 ] || {
    fetcher_error 'fetcher_gutenberg requires SOURCE_PATH, BASE_URL, and a selection'
    return 2
  }
  fetcher_assert_ready || return
  fetcher_require curl gzip python3 || return
  fetcher_pg_path=$1
  fetcher_pg_base=${2%/}
  shift 2
  fetcher_pg_count=0
  fetcher_pg_ids=
  fetcher_pg_language=
  fetcher_pg_excluded=
  while [ "$#" -gt 0 ]; do
    case $1 in
      -all) fetcher_pg_count=0; fetcher_pg_language=; shift ;;
      -n) [ "$#" -ge 2 ] || return 2; fetcher_pg_count=$2; shift 2 ;;
      -ids) [ "$#" -ge 2 ] || return 2; fetcher_pg_ids=$2; shift 2 ;;
      -lang) [ "$#" -ge 2 ] || return 2; fetcher_pg_language=$2; shift 2 ;;
      -exclude-ids) [ "$#" -ge 2 ] || return 2; fetcher_pg_excluded=$2; shift 2 ;;
      *) fetcher_error "unknown Gutenberg selection: $1"; return 2 ;;
    esac
  done
  case $fetcher_pg_count in ''|*[!0-9]*) fetcher_error 'Gutenberg count must be non-negative'; return 2 ;; esac
  case $fetcher_pg_language in *[!A-Za-z-]*) fetcher_error 'unsafe Gutenberg language'; return 2 ;; esac
  case $fetcher_pg_ids:$fetcher_pg_excluded in *[!0-9\ :]*) fetcher_error 'Gutenberg IDs must be space-separated integers'; return 2 ;; esac
  fetcher_pg_catalog=${fetcher_pg_path:+$fetcher_pg_path/}.gutenberg-catalog.csv
  fetcher_pg_work=$FETCHER_OUTPUT/.work/gutenberg
  fetcher_pg_id_file=$fetcher_pg_work/ids
  mkdir -p "$fetcher_pg_work"
  if [ -z "$fetcher_pg_ids" ]; then
    fetcher_download "$fetcher_pg_base/cache/epub/feeds/pg_catalog.csv" "$fetcher_pg_catalog" || return
    python3 "$FETCHER_LIBEXEC/pg_catalog.py" "$FETCHER_RAW/$fetcher_pg_catalog" \
      "$fetcher_pg_language" "$fetcher_pg_count" >"$fetcher_pg_id_file" || return
  else
    : >"$fetcher_pg_id_file"
    for fetcher_pg_id in $fetcher_pg_ids; do printf '%s\n' "$fetcher_pg_id" >>"$fetcher_pg_id_file"; done
  fi
  [ -s "$fetcher_pg_id_file" ] || { fetcher_error 'Gutenberg selection produced no books'; return 1; }
  fetcher_pg_books=$FETCHER_RAW/${fetcher_pg_path:+$fetcher_pg_path/}books
  [ ! -e "$fetcher_pg_books" ] || { fetcher_error "Gutenberg output already exists: $fetcher_pg_books"; return 1; }
  mkdir -p "$fetcher_pg_books"
  fetcher_pg_acquired=0
  while IFS= read -r fetcher_pg_id; do
    fetcher_pg_skip=false
    for fetcher_pg_excluded_id in $fetcher_pg_excluded; do
      [ "$fetcher_pg_id" != "$fetcher_pg_excluded_id" ] || fetcher_pg_skip=true
    done
    [ "$fetcher_pg_skip" = false ] || continue
    fetcher_pg_name=pg$fetcher_pg_id.txt
    fetcher_pg_download=${fetcher_pg_path:+$fetcher_pg_path/}$fetcher_pg_name
    if ! fetcher_download "$fetcher_pg_base/cache/epub/$fetcher_pg_id/$fetcher_pg_name" "$fetcher_pg_download"; then
      fetcher_error "Gutenberg text is unavailable or incomplete for ID $fetcher_pg_id"
      return 1
    fi
    fetcher_pg_file=$FETCHER_RAW/$fetcher_pg_download
    fetcher_pg_magic=$(od -An -tx1 -N2 "$fetcher_pg_file" | tr -d ' \n')
    if [ "$fetcher_pg_magic" = 1f8b ]; then
      gzip -dc -- "$fetcher_pg_file" >"$fetcher_pg_file.decoded" || return
      mv -- "$fetcher_pg_file.decoded" "$fetcher_pg_file"
    fi
    mv -- "$fetcher_pg_file" "$fetcher_pg_books/$fetcher_pg_name"
    fetcher_pg_acquired=$((fetcher_pg_acquired + 1))
  done <"$fetcher_pg_id_file"
  [ "$fetcher_pg_acquired" -gt 0 ] || { fetcher_error 'Gutenberg acquired no books'; return 1; }
  rm -f -- "$FETCHER_RAW/$fetcher_pg_catalog"
  rm -rf -- "$fetcher_pg_work"
  rmdir "$FETCHER_OUTPUT/.work" 2>/dev/null || true
}

fetcher_cap() {
  [ "$#" -ge 3 ] || {
    fetcher_error 'fetcher_cap requires SOURCE_PATH, BASE_URL, and a reporter selection'
    return 2
  }
  fetcher_assert_ready || return
  fetcher_require curl python3 || return
  fetcher_cap_path=$1
  fetcher_cap_base=${2%/}
  shift 2
  fetcher_cap_reporters=
  fetcher_cap_all=false
  fetcher_cap_limit=0
  while [ "$#" -gt 0 ]; do
    case $1 in
      -all) fetcher_cap_all=true; shift ;;
      -reporters) [ "$#" -ge 2 ] || return 2; fetcher_cap_reporters=$2; shift 2 ;;
      -n) [ "$#" -ge 2 ] || return 2; fetcher_cap_limit=$2; shift 2 ;;
      *) fetcher_error "unknown CAP selection: $1"; return 2 ;;
    esac
  done
  fetcher_cap_output=$FETCHER_RAW/${fetcher_cap_path:+$fetcher_cap_path/}cases
  [ ! -e "$fetcher_cap_output" ] || { fetcher_error "CAP output already exists: $fetcher_cap_output"; return 1; }
  fetcher_cap_work=$FETCHER_OUTPUT/.work/cap
  fetcher_cap_metadata=$fetcher_cap_work/metadata.json
  fetcher_cap_volumes=$fetcher_cap_work/volumes.tsv
  fetcher_cap_archive=$fetcher_cap_work/volume.zip
  mkdir -p "$fetcher_cap_work" "$fetcher_cap_output"
  if [ "$fetcher_cap_all" = true ]; then
    curl --fail --silent --show-error --location --retry 8 --retry-connrefused \
      --output "$fetcher_cap_metadata" "$fetcher_cap_base/ReportersMetadata.json" || return
    fetcher_cap_reporters=$(python3 "$FETCHER_LIBEXEC/cap_metadata.py" reporters "$fetcher_cap_metadata") || return
  fi
  : >"$fetcher_cap_volumes"
  for fetcher_cap_reporter in $fetcher_cap_reporters; do
    curl --fail --silent --show-error --location --retry 8 --retry-connrefused \
      --output "$fetcher_cap_metadata" "$fetcher_cap_base/$fetcher_cap_reporter/VolumesMetadata.json" || return
    python3 "$FETCHER_LIBEXEC/cap_metadata.py" volumes "$fetcher_cap_metadata" \
      "$fetcher_cap_reporter" >>"$fetcher_cap_volumes" || return
  done
  LC_ALL=C sort -u "$fetcher_cap_volumes" -o "$fetcher_cap_volumes"
  [ -s "$fetcher_cap_volumes" ] || { fetcher_error 'CAP selection produced no volumes'; return 1; }
  fetcher_cap_handled=0
  while IFS="$(printf '\t')" read -r fetcher_cap_reporter fetcher_cap_volume; do
    [ "$fetcher_cap_limit" -eq 0 ] || [ "$fetcher_cap_handled" -lt "$fetcher_cap_limit" ] || break
    curl --fail --silent --show-error --location --retry 8 --retry-connrefused \
      --output "$fetcher_cap_archive" "$fetcher_cap_base/$fetcher_cap_reporter/$fetcher_cap_volume.zip" || return
    python3 "$FETCHER_LIBEXEC/cap_extract.py" "$fetcher_cap_archive" "$fetcher_cap_output" \
      "$fetcher_cap_reporter" "$fetcher_cap_volume" || return
    fetcher_cap_handled=$((fetcher_cap_handled + 1))
  done <"$fetcher_cap_volumes"
  [ "$fetcher_cap_handled" -gt 0 ] || { fetcher_error 'CAP acquired no volumes'; return 1; }
  rm -rf -- "$fetcher_cap_work"
  rmdir "$FETCHER_OUTPUT/.work" 2>/dev/null || true
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
  fetcher_repository=
  fetcher_dirty=true
  if command -v git >/dev/null 2>&1 && git -C "$fetcher_repo" rev-parse --is-inside-work-tree >/dev/null 2>&1; then
    fetcher_revision=$(git -C "$fetcher_repo" rev-parse HEAD 2>/dev/null || true)
    fetcher_repository=$(git -C "$fetcher_repo" remote get-url origin 2>/dev/null || true)
    if [ -z "$(git -C "$fetcher_repo" status --porcelain)" ]; then
      fetcher_dirty=false
    fi
  fi

  jq -S \
    --arg retrieved_at "$fetcher_retrieved" \
    --arg script "$fetcher_script_name" \
    --arg script_sha256 "$fetcher_script_sha" \
    --arg revision "$fetcher_revision" \
    --arg repository "$fetcher_repository" \
    --argjson dirty "$fetcher_dirty" \
    --argjson file_count "$fetcher_files" \
    --argjson byte_count "$fetcher_bytes" \
    --arg tree_sha256 "$fetcher_tree_sha" '
      . + {
        kind: "waldo-source-directory",
        schema: 1,
        retrieved_at: $retrieved_at,
        fetcher: ({script: $script, sha256: $script_sha256, dirty: $dirty} +
          (if $revision == "" then {} else {revision: $revision} end) +
          (if $repository == "" then {} else {repository: $repository} end)),
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

# Return an indexed configuration value. All variable names are constructed by
# this file, never from downloaded content.
fetcher_config_value() {
  fetcher_config_name=$1
  eval "fetcher_config_result=\${$fetcher_config_name-}"
  printf '%s' "$fetcher_config_result"
}

fetcher_config_required() {
  for fetcher_config_name do
    fetcher_config_result=$(fetcher_config_value "$fetcher_config_name")
    [ -n "$fetcher_config_result" ] || {
      fetcher_error "required fetcher variable is unset: $fetcher_config_name"
      return 2
    }
  done
}

fetcher_config_copy_if_unset() {
  fetcher_config_target=$1
  fetcher_config_origin=$2
  eval "fetcher_config_target_set=\${$fetcher_config_target+x}"
  [ "$fetcher_config_target_set" = x ] && return 0
  eval "fetcher_config_origin_set=\${$fetcher_config_origin+x}"
  [ "$fetcher_config_origin_set" = x ] || return 0
  fetcher_config_result=$(fetcher_config_value "$fetcher_config_origin")
  eval "$fetcher_config_target=\$fetcher_config_result"
}

fetcher_config_normalize() {
  if [ -z "${SOURCE_COUNT-}" ]; then
    SOURCE_COUNT=1
  fi
  if [ "$SOURCE_COUNT" = 1 ]; then
    for fetcher_config_suffix in ID PATH LICENSE NAME VERSION URL CATEGORY \
      LICENSE_DECLARATION LICENSE_URL CONTENT_TYPES LANGUAGES FROM TO SELECTION \
      COPYRIGHTED MACHINE_GENERATED PERSONAL_DATA ACQUISITION_BASIS; do
      fetcher_config_copy_if_unset "SOURCE_1_$fetcher_config_suffix" "SOURCE_$fetcher_config_suffix"
    done
    for fetcher_config_suffix in TYPE ON_EMPTY NUL TEXT_FIELDS TEXT_FALLBACK ID DATE \
      LICENSE SOURCE LANGUAGE CONTEXT RESPONSE META_FIELDS LICENSE_INCLUDE MAIN_CONTENT \
      MESSAGES_CONTENT MESSAGES_ROLE MESSAGES_TOOLS ROLE_ALIASES TREE_ROOT TREE_REPLIES \
      TREE_TEXT TREE_ROLE TREE_ASSISTANT_ROLE TREE_RANK TREE_MISSING_RANK BOUNDS_START \
      BOUNDS_END XML_ON_MALFORMED XML_EXCLUDE; do
      fetcher_config_copy_if_unset "SOURCE_1_INPUT_$fetcher_config_suffix" "INPUT_$fetcher_config_suffix"
    done
  fi
  if [ -z "${FETCH_COUNT-}" ]; then
    FETCH_COUNT=1
  fi
  if [ "$FETCH_COUNT" = 1 ]; then
    fetcher_config_copy_if_unset FETCH_1_METHOD FETCH_METHOD
    fetcher_config_copy_if_unset FETCH_1_SOURCE FETCH_SOURCE
    fetcher_config_copy_if_unset FETCH_1_ARG_COUNT FETCH_ARG_COUNT
    fetcher_config_args=$(fetcher_config_value FETCH_1_ARG_COUNT)
    case $fetcher_config_args in ''|*[!0-9]*) ;;
      *)
        fetcher_config_arg=1
        while [ "$fetcher_config_arg" -le "$fetcher_config_args" ]; do
          fetcher_config_copy_if_unset "FETCH_1_ARG_$fetcher_config_arg" "FETCH_ARG_$fetcher_config_arg"
          fetcher_config_arg=$((fetcher_config_arg + 1))
        done
        ;;
    esac
  fi
  fetcher_config_job=1
  while [ "$fetcher_config_job" -le "$FETCH_COUNT" ]; do
    eval "fetcher_config_source_set=\${FETCH_${fetcher_config_job}_SOURCE+x}"
    [ "$fetcher_config_source_set" = x ] || eval "FETCH_${fetcher_config_job}_SOURCE=1"
    fetcher_config_method=$(fetcher_config_value "FETCH_${fetcher_config_job}_METHOD")
    case $fetcher_config_method in
      download)
        fetcher_config_arg_names='URL PATH SHA256'
        ;;
      huggingface)
        fetcher_config_arg_names='SOURCE_PATH BASE_URL DATASET REVISION SUFFIX PREFIX'
        ;;
      git)
        fetcher_config_arg_names='PATH URL REF REVISION'
        ;;
      *)
        fetcher_config_job=$((fetcher_config_job + 1))
        continue
        ;;
    esac
    fetcher_config_arg=0
    for fetcher_config_suffix in $fetcher_config_arg_names; do
      fetcher_config_arg=$((fetcher_config_arg + 1))
      fetcher_config_origin=FETCH_${fetcher_config_job}_$fetcher_config_suffix
      if [ "$FETCH_COUNT" = 1 ]; then
        fetcher_config_copy_if_unset "$fetcher_config_origin" "FETCH_$fetcher_config_suffix"
      fi
      fetcher_config_copy_if_unset "FETCH_${fetcher_config_job}_ARG_${fetcher_config_arg}" "$fetcher_config_origin"
    done
    if [ "$fetcher_config_method" = git ]; then
      fetcher_config_options=$(fetcher_config_value "FETCH_${fetcher_config_job}_OPTIONS")
      if [ -z "$fetcher_config_options" ] && [ "$FETCH_COUNT" = 1 ]; then
        fetcher_config_options=$(fetcher_config_value FETCH_OPTIONS)
      fi
      for fetcher_config_result in $fetcher_config_options; do
        fetcher_config_arg=$((fetcher_config_arg + 1))
        eval "FETCH_${fetcher_config_job}_ARG_${fetcher_config_arg}=\$fetcher_config_result"
      done
    fi
    if [ "$fetcher_config_method" = download ] &&
       [ -z "$(fetcher_config_value "FETCH_${fetcher_config_job}_ARG_3")" ]; then
      fetcher_config_arg=2
    fi
    if [ "$fetcher_config_method" = huggingface ] &&
       [ -z "$(fetcher_config_value "FETCH_${fetcher_config_job}_ARG_6")" ]; then
      fetcher_config_arg=5
    fi
    eval "FETCH_${fetcher_config_job}_ARG_COUNT=$fetcher_config_arg"
    fetcher_config_job=$((fetcher_config_job + 1))
  done
}

fetcher_config_validate() {
  fetcher_config_normalize || return
  fetcher_config_required CORPUS_ID CORPUS_TITLE CORPUS_DESCRIPTION \
    CORPUS_DESTINATION FETCHER_OUTPUT FETCHER_SIZE FETCH_COUNT SOURCE_COUNT || return
  [ "${FETCHER_ARGUMENT_COUNT-}" = 1 ] || {
    fetcher_error "usage: $(basename "$0") OUTPUT_DIRECTORY"
    return 2
  }
  case $FETCH_COUNT:$SOURCE_COUNT in
    *[!0-9:]*) fetcher_error 'FETCH_COUNT and SOURCE_COUNT must be positive integers'; return 2 ;;
  esac
  [ "$FETCH_COUNT" -gt 0 ] && [ "$SOURCE_COUNT" -gt 0 ] || {
    fetcher_error 'FETCH_COUNT and SOURCE_COUNT must be positive integers'
    return 2
  }
  fetcher_config_source=1
  while [ "$fetcher_config_source" -le "$SOURCE_COUNT" ]; do
    fetcher_config_required \
      "SOURCE_${fetcher_config_source}_ID" \
      "SOURCE_${fetcher_config_source}_LICENSE" \
      "SOURCE_${fetcher_config_source}_NAME" \
      "SOURCE_${fetcher_config_source}_URL" \
      "SOURCE_${fetcher_config_source}_CATEGORY" \
      "SOURCE_${fetcher_config_source}_LICENSE_DECLARATION" || return
    fetcher_config_source=$((fetcher_config_source + 1))
  done
  fetcher_config_job=1
  while [ "$fetcher_config_job" -le "$FETCH_COUNT" ]; do
    fetcher_config_required "FETCH_${fetcher_config_job}_METHOD" \
      "FETCH_${fetcher_config_job}_SOURCE" "FETCH_${fetcher_config_job}_ARG_COUNT" || return
    fetcher_config_method=$(fetcher_config_value "FETCH_${fetcher_config_job}_METHOD")
    case $fetcher_config_method in
      *[!a-z0-9_]*|'') fetcher_error "invalid fetch method: $fetcher_config_method"; return 2 ;;
    esac
    fetcher_config_source=$(fetcher_config_value "FETCH_${fetcher_config_job}_SOURCE")
    case $fetcher_config_source in *[!0-9]*|'') fetcher_error 'invalid fetch source index'; return 2 ;; esac
    [ "$fetcher_config_source" -ge 1 ] && [ "$fetcher_config_source" -le "$SOURCE_COUNT" ] || {
      fetcher_error "FETCH_${fetcher_config_job}_SOURCE is out of range"
      return 2
    }
    fetcher_config_args=$(fetcher_config_value "FETCH_${fetcher_config_job}_ARG_COUNT")
    case $fetcher_config_args in *[!0-9]*|'') fetcher_error 'invalid fetch argument count'; return 2 ;; esac
    fetcher_config_arg=1
    while [ "$fetcher_config_arg" -le "$fetcher_config_args" ]; do
      fetcher_config_name=FETCH_${fetcher_config_job}_ARG_${fetcher_config_arg}
      eval "fetcher_config_present=\${$fetcher_config_name+x}"
      [ "$fetcher_config_present" = x ] || {
        fetcher_error "required fetcher variable is unset: $fetcher_config_name"
        return 2
      }
      fetcher_config_arg=$((fetcher_config_arg + 1))
    done
    fetcher_config_job=$((fetcher_config_job + 1))
  done
}

fetcher_run_configured() {
  fetcher_config_job=1
  while [ "$fetcher_config_job" -le "$FETCH_COUNT" ]; do
    fetcher_config_method=$(fetcher_config_value "FETCH_${fetcher_config_job}_METHOD")
    fetcher_config_args=$(fetcher_config_value "FETCH_${fetcher_config_job}_ARG_COUNT")
    set --
    fetcher_config_arg=1
    while [ "$fetcher_config_arg" -le "$fetcher_config_args" ]; do
      fetcher_config_result=$(fetcher_config_value "FETCH_${fetcher_config_job}_ARG_${fetcher_config_arg}")
      set -- "$@" "$fetcher_config_result"
      fetcher_config_arg=$((fetcher_config_arg + 1))
    done
    "fetcher_$fetcher_config_method" "$@" || return
    fetcher_config_job=$((fetcher_config_job + 1))
  done
}

fetcher_input_json() {
  fetcher_input_prefix=SOURCE_${1}_INPUT_
  fetcher_input_type=$(fetcher_config_value "${fetcher_input_prefix}TYPE")
  fetcher_input_on_empty=$(fetcher_config_value "${fetcher_input_prefix}ON_EMPTY")
  fetcher_input_nul=$(fetcher_config_value "${fetcher_input_prefix}NUL")
  fetcher_input_text=$(fetcher_config_value "${fetcher_input_prefix}TEXT_FIELDS")
  fetcher_input_fallback=$(fetcher_config_value "${fetcher_input_prefix}TEXT_FALLBACK")
  fetcher_input_meta=$(fetcher_config_value "${fetcher_input_prefix}META_FIELDS")
  fetcher_input_include=$(fetcher_config_value "${fetcher_input_prefix}LICENSE_INCLUDE")
  fetcher_input_main=$(fetcher_config_value "${fetcher_input_prefix}MAIN_CONTENT")
  fetcher_input_exclude=$(fetcher_config_value "${fetcher_input_prefix}XML_EXCLUDE")
  jq -n \
    --arg type "$fetcher_input_type" --arg on_empty "$fetcher_input_on_empty" --arg nul "$fetcher_input_nul" \
    --arg text "$fetcher_input_text" --arg fallback "$fetcher_input_fallback" --arg meta "$fetcher_input_meta" \
    --arg include "$fetcher_input_include" --arg main "$fetcher_input_main" \
    --arg id "$(fetcher_config_value "${fetcher_input_prefix}ID")" \
    --arg date "$(fetcher_config_value "${fetcher_input_prefix}DATE")" \
    --arg license "$(fetcher_config_value "${fetcher_input_prefix}LICENSE")" \
    --arg source "$(fetcher_config_value "${fetcher_input_prefix}SOURCE")" \
    --arg language "$(fetcher_config_value "${fetcher_input_prefix}LANGUAGE")" \
    --arg context "$(fetcher_config_value "${fetcher_input_prefix}CONTEXT")" \
    --arg response "$(fetcher_config_value "${fetcher_input_prefix}RESPONSE")" \
    --arg messages_content "$(fetcher_config_value "${fetcher_input_prefix}MESSAGES_CONTENT")" \
    --arg messages_role "$(fetcher_config_value "${fetcher_input_prefix}MESSAGES_ROLE")" \
    --arg messages_tools "$(fetcher_config_value "${fetcher_input_prefix}MESSAGES_TOOLS")" \
    --arg role_aliases "$(fetcher_config_value "${fetcher_input_prefix}ROLE_ALIASES")" \
    --arg tree_root "$(fetcher_config_value "${fetcher_input_prefix}TREE_ROOT")" \
    --arg tree_replies "$(fetcher_config_value "${fetcher_input_prefix}TREE_REPLIES")" \
    --arg tree_text "$(fetcher_config_value "${fetcher_input_prefix}TREE_TEXT")" \
    --arg tree_role "$(fetcher_config_value "${fetcher_input_prefix}TREE_ROLE")" \
    --arg tree_assistant "$(fetcher_config_value "${fetcher_input_prefix}TREE_ASSISTANT_ROLE")" \
    --arg tree_rank "$(fetcher_config_value "${fetcher_input_prefix}TREE_RANK")" \
    --arg tree_missing "$(fetcher_config_value "${fetcher_input_prefix}TREE_MISSING_RANK")" \
    --arg bounds_start "$(fetcher_config_value "${fetcher_input_prefix}BOUNDS_START")" \
    --arg bounds_end "$(fetcher_config_value "${fetcher_input_prefix}BOUNDS_END")" \
    --arg xml_malformed "$(fetcher_config_value "${fetcher_input_prefix}XML_ON_MALFORMED")" \
    --arg xml_exclude "$fetcher_input_exclude" '
      def lines($v): $v | split("\n") | map(select(length > 0));
      def pairs($v): $v | split("\n") | map(select(length > 0) |
        capture("^(?<key>[^=]+)=(?<value>.*)$")) | from_entries;
      def typed_pairs($v): $v | split("\n") | map(select(length > 0) |
        capture("^(?<key>[^=]+)=(?<raw>.*)$") |
        {key: .key, value: (.raw | fromjson)}) | from_entries;
      def put($key; $value): if $value == "" then . else . + {($key): $value} end;
      ({}) | put("type"; $type) | put("on_empty"; $on_empty) | put("nul"; $nul) |
      . + ([$text,$fallback,$id,$date,$license,$source,$language,$context,$response,$meta] |
        if any(. != "") then {fields:
          (({} | if $text == "" then . else .text=lines($text) end |
            if $fallback == "" then . else .text_fallback=lines($fallback) end |
            put("id";$id) | put("date";$date) | put("license";$license) |
            put("source";$source) | put("language";$language) |
            put("context";$context) | put("response";$response)) +
            (if $meta == "" then {} else {meta:pairs($meta)} end))}
        else {} end) |
      . + (if $include == "" then {} else {license_policy:{include:lines($include)}} end) |
      . + (if $main == "" then {} else {main_content:typed_pairs($main)} end) |
      . + (if $messages_content == "" and $messages_role == "" then {} else
        {messages: (({} | put("content";$messages_content) | put("role";$messages_role) |
          put("tools";$messages_tools)) +
          (if $role_aliases == "" then {} else {role_aliases:pairs($role_aliases)} end))} end) |
      . + (if $tree_root == "" then {} else {tree:
        ({} | put("root";$tree_root) | put("replies";$tree_replies) |
          put("text";$tree_text) | put("role";$tree_role) |
          put("assistant_role";$tree_assistant) | put("rank";$tree_rank) |
          put("missing_rank";$tree_missing))} end) |
      . + (if $bounds_start == "" and $bounds_end == "" then {} else
        {bounds:({} | put("start_pattern";$bounds_start) | put("end_pattern";$bounds_end))} end) |
      . + (if $xml_malformed == "" and $xml_exclude == "" then {} else
        {xml:({} | put("on_malformed";$xml_malformed) |
          if $xml_exclude == "" then . else .exclude=lines($xml_exclude) end)} end)'
}

fetcher_artifacts_json() {
  fetcher_artifact_source=$1
  fetcher_artifact_job=1
  fetcher_artifact_last=$FETCH_COUNT
  if [ "$FETCH_COUNT" -eq "$SOURCE_COUNT" ] &&
     [ "$(fetcher_config_value "FETCH_${fetcher_artifact_source}_SOURCE")" = "$fetcher_artifact_source" ]; then
    fetcher_artifact_job=$fetcher_artifact_source
    fetcher_artifact_last=$fetcher_artifact_source
  fi
  while [ "$fetcher_artifact_job" -le "$fetcher_artifact_last" ]; do
    [ "$(fetcher_config_value "FETCH_${fetcher_artifact_job}_SOURCE")" = "$fetcher_artifact_source" ] || {
      fetcher_artifact_job=$((fetcher_artifact_job + 1))
      continue
    }
    fetcher_artifact_method=$(fetcher_config_value "FETCH_${fetcher_artifact_job}_METHOD")
    fetcher_artifact_args=$(fetcher_config_value "FETCH_${fetcher_artifact_job}_ARG_COUNT")
    case $fetcher_artifact_method in
      download)
        jq -n --arg url "$(fetcher_config_value "FETCH_${fetcher_artifact_job}_ARG_1")" \
          --arg path "$(fetcher_config_value "FETCH_${fetcher_artifact_job}_ARG_2")" \
          --arg sha "$(fetcher_config_value "FETCH_${fetcher_artifact_job}_ARG_3")" '
          {url:$url,path:$path} + (if $sha == "" then {} else {sha256:$sha} end)'
        ;;
      git)
        jq -n --arg url "$(fetcher_config_value "FETCH_${fetcher_artifact_job}_ARG_2")" \
          --arg ref "$(fetcher_config_value "FETCH_${fetcher_artifact_job}_ARG_3")" \
          --arg revision "$(fetcher_config_value "FETCH_${fetcher_artifact_job}_ARG_4")" \
          '{url:$url,revision:$revision,ref:$ref}'
        ;;
      huggingface)
        jq -n --arg base "$(fetcher_config_value "FETCH_${fetcher_artifact_job}_ARG_2")" \
          --arg dataset "$(fetcher_config_value "FETCH_${fetcher_artifact_job}_ARG_3")" \
          --arg revision "$(fetcher_config_value "FETCH_${fetcher_artifact_job}_ARG_4")" \
          --arg suffix "$(fetcher_config_value "FETCH_${fetcher_artifact_job}_ARG_5")" \
          --arg prefix "$(fetcher_config_value "FETCH_${fetcher_artifact_job}_ARG_6")" '
          {url:($base+"/datasets/"+$dataset),revision:$revision,
           selection:({suffix:$suffix} + (if $prefix == "" then {} else {prefix:$prefix} end))}'
        ;;
      *)
        fetcher_artifact_arguments=$(mktemp "${TMPDIR:-/tmp}/waldo-fetcher-arguments.XXXXXX") || return
        fetcher_artifact_arg=2
        while [ "$fetcher_artifact_arg" -le "$fetcher_artifact_args" ]; do
          fetcher_config_value "FETCH_${fetcher_artifact_job}_ARG_${fetcher_artifact_arg}" |
            jq -Rs . >>"$fetcher_artifact_arguments"
          fetcher_artifact_arg=$((fetcher_artifact_arg + 1))
        done
        fetcher_artifact_label=$(printf '%s' "$fetcher_artifact_method" | tr '_' '-')
        jq -s --arg method "$fetcher_artifact_label" '{method:$method,arguments:.}' \
          "$fetcher_artifact_arguments"
        rm -f -- "$fetcher_artifact_arguments"
        ;;
    esac
    fetcher_artifact_job=$((fetcher_artifact_job + 1))
  done | jq -s .
}

fetcher_sources_json() {
  fetcher_source_index=1
  while [ "$fetcher_source_index" -le "$SOURCE_COUNT" ]; do
    fetcher_source_input=$(fetcher_input_json "$fetcher_source_index") || return
    fetcher_source_artifacts=$(fetcher_artifacts_json "$fetcher_source_index") || return
    fetcher_source_prefix=SOURCE_${fetcher_source_index}_
    jq -n \
      --arg id "$(fetcher_config_value "${fetcher_source_prefix}ID")" \
      --arg path "$(fetcher_config_value "${fetcher_source_prefix}PATH")" \
      --arg license "$(fetcher_config_value "${fetcher_source_prefix}LICENSE")" \
      --arg name "$(fetcher_config_value "${fetcher_source_prefix}NAME")" \
      --arg version "$(fetcher_config_value "${fetcher_source_prefix}VERSION")" \
      --arg url "$(fetcher_config_value "${fetcher_source_prefix}URL")" \
      --arg category "$(fetcher_config_value "${fetcher_source_prefix}CATEGORY")" \
      --arg declaration "$(fetcher_config_value "${fetcher_source_prefix}LICENSE_DECLARATION")" \
      --arg evidence_url "$(fetcher_config_value "${fetcher_source_prefix}LICENSE_URL")" \
      --arg types "$(fetcher_config_value "${fetcher_source_prefix}CONTENT_TYPES")" \
      --arg languages "$(fetcher_config_value "${fetcher_source_prefix}LANGUAGES")" \
      --arg from "$(fetcher_config_value "${fetcher_source_prefix}FROM")" \
      --arg to "$(fetcher_config_value "${fetcher_source_prefix}TO")" \
      --arg selection "$(fetcher_config_value "${fetcher_source_prefix}SELECTION")" \
      --arg copyrighted "$(fetcher_config_value "${fetcher_source_prefix}COPYRIGHTED")" \
      --arg machine "$(fetcher_config_value "${fetcher_source_prefix}MACHINE_GENERATED")" \
      --arg personal "$(fetcher_config_value "${fetcher_source_prefix}PERSONAL_DATA")" \
      --arg basis "$(fetcher_config_value "${fetcher_source_prefix}ACQUISITION_BASIS")" \
      --argjson input "$fetcher_source_input" --argjson artifacts "$fetcher_source_artifacts" '
        def lines($v): $v | split("\n") | map(select(length > 0));
        def scalar($v): if $v == "true" then true elif $v == "false" then false else $v end;
        def put($key; $value): if $value == "" then . else . + {($key):$value} end;
        {id:$id,path:$path,license:$license,
         source:({name:$name,url:$url,category:$category,
           license_evidence:({declaration:$declaration} | put("url";$evidence_url))} |
           put("version";$version) |
           . + (if [$types,$languages,$from,$to,$selection,$copyrighted,$machine,$personal] | any(. != "")
             then {content:({} |
               if $types == "" then . else .types=lines($types) end |
               if $languages == "" then . else .languages=lines($languages) end |
               put("from";$from) | put("to";$to) | put("selection";$selection) |
               if $copyrighted == "" then . else .copyrighted=scalar($copyrighted) end |
               if $machine == "" then . else .machine_generated=scalar($machine) end |
               if $personal == "" then . else .personal_data=scalar($personal) end)}
             else {} end) |
           . + (if $basis == "" then {} else {acquisition:{basis:$basis}} end)),
         input:$input,artifacts:$artifacts}'
    fetcher_source_index=$((fetcher_source_index + 1))
  done | jq -s .
}

fetcher_spec_json() {
  fetcher_sources=$(fetcher_sources_json) || return
  jq -n --arg id "$CORPUS_ID" --arg title "$CORPUS_TITLE" \
    --arg description "$CORPUS_DESCRIPTION" --arg destination "$CORPUS_DESTINATION" \
    --argjson sources "$fetcher_sources" '
      {corpus:{id:$id,title:$title,description:$description,destination:$destination},sources:$sources}'
}

write_manifest() {
  fetcher_spec_json | fetcher_manifest
}

fetcher_main() {
  fetcher_require jq find sort awk wc || return
  fetcher_config_validate || return
  if [ "${FETCHER_SPEC_ONLY-}" = 1 ]; then
    fetcher_spec_json
    return
  fi
  [ "${FETCHER_VALIDATE_ONLY-}" != 1 ] || return 0
  fetcher_begin "$FETCHER_OUTPUT" || return
  if [ -n "${FETCHER_REQUIRED_FREE-}" ]; then
    fetcher_size "$FETCHER_SIZE" "$FETCHER_REQUIRED_FREE" || return
  else
    fetcher_size "$FETCHER_SIZE" || return
  fi
  fetcher_run_configured || return
  write_manifest
}
