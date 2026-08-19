#!/usr/bin/env python3
"""Select stable Project Gutenberg plain-text records from pg_catalog.csv."""

import csv
import sys


def main() -> None:
    if len(sys.argv) != 4:
        raise SystemExit("gutenberg.sh: internal catalog argument error")
    path, wanted_language, count_raw = sys.argv[1:]
    count = int(count_raw)
    identifiers: set[int] = set()
    with open(path, newline="", encoding="utf-8-sig") as source:
        for row in csv.DictReader(source):
            identifier = row.get("Text#") or row.get("Text Number") or row.get("ebook_id")
            language = row.get("Language") or row.get("Languages") or row.get("language") or ""
            file_type = row.get("Type") or row.get("File Type") or row.get("type") or "Text"
            if not identifier or not identifier.isdigit():
                continue
            if wanted_language and wanted_language not in [part.strip() for part in language.replace(";", ",").split(",")]:
                continue
            if file_type and "text" not in file_type.lower():
                continue
            identifiers.add(int(identifier))
    for identifier in sorted(identifiers)[: count or None]:
        print(identifier)


if __name__ == "__main__":
    main()
