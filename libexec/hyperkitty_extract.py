#!/usr/bin/env python3
# Copyright (c) 2026 OpenWALDO Project contributors
# Copyright (c) 2026 CtrlIQ, Inc.
# Copyright (c) 2026 Gregory M. Kurtzer
# SPDX-License-Identifier: Apache-2.0

"""Verify a HyperKitty export deterministically while retaining raw messages."""

import gzip
import hashlib
import pathlib
import re
import struct
import sys
from typing import List, Optional


ENVELOPE = re.compile(
    rb"^From .+ (?:Mon|Tue|Wed|Thu|Fri|Sat|Sun) "
    rb"(?:Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec) "
    rb"[ 0-3][0-9] [0-2][0-9]:[0-5][0-9]:[0-6][0-9] [0-9]{4}\r?\n$"
)
GENERATED_BOUNDARY = re.compile(
    rb'boundary\s*=\s*(?:"(={15}[0-9]{19}==)"|(={15}[0-9]{19}==))', re.IGNORECASE
)
BOUNDARY_TOKEN = re.compile(rb"={15}[0-9]{19}==")


def fail(message: str) -> None:
    raise SystemExit(f"hyperkitty_extract.py: {message}")


def split(source: pathlib.Path) -> List[bytes]:
    messages: List[bytes] = []
    current: Optional[List[bytes]] = None
    with gzip.open(source, "rb") as stream:
        for line in stream:
            if ENVELOPE.match(line):
                if current is not None:
                    messages.append(b"".join(current))
                current = []
            elif current is None:
                if line.strip():
                    fail("non-whitespace content precedes the first mbox envelope")
            else:
                current.append(line)
    if current is not None:
        messages.append(b"".join(current))
    return messages


def verification_form(message: bytes) -> bytes:
    tokens: list[bytes] = []
    for match in GENERATED_BOUNDARY.finditer(message):
        token = match.group(1) or match.group(2)
        if token not in tokens:
            tokens.append(token)
    replacements = {
        token: f"===============canonical-{index:04d}==".encode()
        for index, token in enumerate(tokens, 1)
    }
    return BOUNDARY_TOKEN.sub(
        lambda match: replacements.get(match.group(0), match.group(0)), message
    )


def main() -> None:
    if len(sys.argv) != 6:
        fail("usage: INPUT.gz OUTPUT_DIR PREFIX EXPECTED_COUNT EXPECTED_SHA256")
    source = pathlib.Path(sys.argv[1])
    output = pathlib.Path(sys.argv[2])
    prefix = sys.argv[3]
    expected_count = int(sys.argv[4])
    expected_sha = sys.argv[5]
    if not source.is_file() or source.is_symlink():
        fail("input must be a regular non-symlink file")
    if output.exists():
        fail("output directory already exists")
    if not re.fullmatch(r"[a-z0-9][a-z0-9.-]*", prefix):
        fail("unsafe output prefix")
    if not re.fullmatch(r"[0-9a-f]{64}", expected_sha):
        fail("expected SHA-256 must contain 64 lowercase hexadecimal characters")

    raw_messages = split(source)
    if len(raw_messages) != expected_count:
        fail(f"message count mismatch: expected {expected_count}, got {len(raw_messages)}")
    ordered = sorted(
        ((verification_form(message), message) for message in raw_messages),
        key=lambda pair: (hashlib.sha256(pair[0]).digest(), pair[0]),
    )
    digest = hashlib.sha256()
    for canonical, _raw in ordered:
        digest.update(struct.pack(">Q", len(canonical)))
        digest.update(canonical)
    if digest.hexdigest() != expected_sha:
        fail(
            f"canonical verification mismatch: expected {expected_sha}, "
            f"got {digest.hexdigest()}"
        )

    output.mkdir(mode=0o755)
    try:
        for index, (_canonical, raw) in enumerate(ordered, 1):
            (output / f"{prefix}-{index:08d}.eml").write_bytes(raw)
    except BaseException:
        for child in output.iterdir():
            child.unlink()
        output.rmdir()
        raise
    print(
        f"hyperkitty_extract.py: verified and retained {len(ordered)} raw messages",
        file=sys.stderr,
    )


if __name__ == "__main__":
    main()
