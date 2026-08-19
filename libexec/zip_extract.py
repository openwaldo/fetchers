#!/usr/bin/env python3
"""Safely extract selected regular files from a ZIP archive."""

import os
import pathlib
import shutil
import stat
import sys
import zipfile


def fail(message: str) -> None:
    raise SystemExit(f"zip-extract.sh: {message}")


def main() -> None:
    if len(sys.argv) != 6:
        fail("internal argument error")
    archive, suffix, output, max_files_raw, max_bytes_raw = sys.argv[1:]
    max_files = int(max_files_raw)
    max_bytes = int(max_bytes_raw)
    selected: list[tuple[zipfile.ZipInfo, pathlib.PurePosixPath]] = []
    total = 0
    seen: set[str] = set()

    try:
        source = zipfile.ZipFile(archive)
    except (OSError, zipfile.BadZipFile) as error:
        fail(f"cannot open archive: {error}")
    with source:
        for member in source.infolist():
            name = member.filename
            path = pathlib.PurePosixPath(name)
            mode = member.external_attr >> 16
            file_type = stat.S_IFMT(mode)
            if (
                not name
                or "\\" in name
                or path.is_absolute()
                or ".." in path.parts
                or any(part in ("", ".") for part in path.parts)
            ):
                fail(f"unsafe archive member: {name!r}")
            if stat.S_ISLNK(mode) or file_type not in (0, stat.S_IFREG, stat.S_IFDIR):
                fail(f"non-regular archive member: {name!r}")
            if member.is_dir() or not name.endswith(suffix):
                continue
            target = path.as_posix()
            if target in seen:
                fail(f"duplicate archive member: {name!r}")
            seen.add(target)
            selected.append((member, path))
            total += member.file_size
            if len(selected) > max_files or total > max_bytes:
                fail("archive exceeds configured expansion limits")
        if not selected:
            fail(f"archive contains no {suffix} files")

        os.mkdir(output, 0o755)
        for member, relative in selected:
            destination = pathlib.Path(output).joinpath(*relative.parts)
            destination.parent.mkdir(parents=True, exist_ok=True)
            with source.open(member) as reader, destination.open("xb") as writer:
                shutil.copyfileobj(reader, writer, length=1024 * 1024)


if __name__ == "__main__":
    main()
