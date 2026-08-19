#!/usr/bin/env python3
# Copyright (c) 2026 OpenWALDO Project contributors
# Copyright (c) 2026 CtrlIQ, Inc.
# Copyright (c) 2026 Gregory M. Kurtzer
# SPDX-License-Identifier: Apache-2.0

import pathlib
import sys


def fail(message: str) -> None:
    raise SystemExit(f"mbox_split.py: {message}")


def main() -> None:
    if len(sys.argv) != 3:
        fail("usage: mbox_split.py INPUT.mbox OUTPUT_DIR")
    source = pathlib.Path(sys.argv[1])
    output = pathlib.Path(sys.argv[2])
    if not source.is_file() or source.is_symlink():
        fail("input must be a regular non-symlink file")
    if output.exists():
        fail("output directory already exists")

    output.mkdir(mode=0o755)
    current = None
    count = 0
    try:
        with source.open("rb") as stream:
            for line in stream:
                if line.startswith(b"From MAILER-DAEMON "):
                    if current is not None:
                        current.close()
                    count += 1
                    current = (output / f"message-{count:08d}.eml").open("wb")
                    continue
                if current is None:
                    if line.strip():
                        fail("non-whitespace content before first mbox envelope")
                    continue
                current.write(line)
        if current is not None:
            current.close()
            current = None
        if count == 0:
            fail("no mbox messages found")
    except BaseException:
        if current is not None:
            current.close()
        for child in output.iterdir():
            child.unlink()
        output.rmdir()
        raise
    print(f"mbox_split.py: extracted {count} RFC 822 messages", file=sys.stderr)


if __name__ == "__main__":
    main()
