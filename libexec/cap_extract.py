#!/usr/bin/env python3
"""Extract Harvard CAP case JSON with deterministic collision-free names."""

import json
import pathlib
import re
import stat
import sys
import zipfile

# CAP occasionally uses '=' for joined reporter-number ranges, '?' as an
# unknown-number placeholder, parentheses around reporter numbers, and spaces
# in textual reporter-number labels. McGrath also contains half- and
# three-quarter-page case numbers. These remain within a single path component
# and are safe after the archive path checks above.
SAFE = re.compile(r"^[A-Za-z0-9._,*=?()\[\] ½¾-]+$")


def main() -> None:
    archive, output, reporter, volume = sys.argv[1:]
    selected = []
    with zipfile.ZipFile(archive) as source:
        for member in source.infolist():
            path = pathlib.PurePosixPath(member.filename)
            mode = member.external_attr >> 16
            file_type = stat.S_IFMT(mode)
            if path.is_absolute() or ".." in path.parts or "\\" in member.filename or stat.S_ISLNK(mode) or file_type not in (0, stat.S_IFREG, stat.S_IFDIR):
                raise SystemExit(f"cap.sh: unsafe archive member: {member.filename!r}")
            if len(path.parts) != 2 or path.parts[0] != "json" or path.suffix != ".json":
                continue
            if not SAFE.fullmatch(path.name):
                raise SystemExit(
                    f"cap.sh: unsafe case filename in {reporter}/{volume}.zip: {path.name!r}"
                )
            selected.append((path.name, member))
        if not selected:
            raise SystemExit("cap.sh: volume contains no case JSON")
        for name, member in sorted(selected):
            destination = pathlib.Path(output, f"{reporter}-{volume}-{name}")
            if destination.exists():
                raise SystemExit(f"cap.sh: duplicate case output: {destination.name}")
            payload = source.read(member)
            json.loads(payload)
            destination.write_bytes(payload)


if __name__ == "__main__":
    main()
