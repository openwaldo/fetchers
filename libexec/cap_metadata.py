#!/usr/bin/env python3
# Copyright (c) 2026 OpenWALDO Project contributors
# Copyright (c) 2026 CtrlIQ, Inc.
# Copyright (c) 2026 Gregory M. Kurtzer
# SPDX-License-Identifier: Apache-2.0

"""Read the two Harvard CAP metadata formats."""

import json
import re
import sys

SAFE = re.compile(r"^[A-Za-z0-9._-]+$")


def safe(value: object, label: str) -> str:
    if not isinstance(value, str) or not SAFE.fullmatch(value) or value in (".", ".."):
        raise SystemExit(f"cap.sh: unsafe {label} in metadata")
    return value


def main() -> None:
    mode, path, *rest = sys.argv[1:]
    with open(path, encoding="utf-8") as source:
        data = json.load(source)
    if not isinstance(data, list):
        raise SystemExit("cap.sh: metadata must be a JSON array")
    if mode == "reporters" and not rest:
        print("\n".join(sorted({safe(item.get("slug"), "reporter") for item in data if isinstance(item, dict)})))
    elif mode == "volumes" and len(rest) == 1:
        reporter = safe(rest[0], "reporter")
        # CAP publishes metadata for redacted volumes whose archives are
        # intentionally unavailable. Exclude those declared gaps instead of
        # treating their expected 404 responses as transient failures.
        for volume in sorted(
            {
                safe(item.get("volume_folder"), "volume")
                for item in data
                if isinstance(item, dict) and item.get("redacted") is not True
            }
        ):
            print(f"{reporter}\t{volume}")
    else:
        raise SystemExit("cap.sh: internal metadata argument error")


if __name__ == "__main__":
    main()
