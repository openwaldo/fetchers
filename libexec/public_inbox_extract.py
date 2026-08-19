#!/usr/bin/env python3
"""Stream one calendar year from a pinned public-inbox Git epoch."""

import datetime
import os
import subprocess
import sys


def fail(message):
    raise SystemExit(f"public_inbox_extract.py: {message}")


def main():
    if len(sys.argv) != 6:
        fail("usage: REPOSITORY HEAD YEAR OUTPUT_DIR PREFIX")
    repository, head, year_text, output_dir, prefix = sys.argv[1:]
    if len(head) != 40 or any(character not in "0123456789abcdef" for character in head):
        fail("HEAD must be a 40-character lowercase Git object ID")
    try:
        year = int(year_text)
    except ValueError:
        fail("YEAR must be an integer")
    if year < 1970 or year > 9999:
        fail("YEAR is outside the supported range")
    if not prefix or "/" in prefix or prefix.startswith("."):
        fail("PREFIX must be a safe basename prefix")
    if not os.path.isdir(repository) or not os.path.isdir(output_dir):
        fail("repository and output directory must exist")

    log = subprocess.Popen(
        ["git", f"--git-dir={repository}", "log", "--reverse", "--format=%H%x09%at", head],
        stdout=subprocess.PIPE,
        text=True,
        encoding="utf-8",
    )
    batch = subprocess.Popen(
        ["git", f"--git-dir={repository}", "cat-file", "--batch"],
        stdin=subprocess.PIPE,
        stdout=subprocess.PIPE,
    )
    if log.stdout is None or batch.stdin is None or batch.stdout is None:
        fail("unable to create Git streaming processes")

    messages = 0
    tombstones = 0
    try:
        for line in log.stdout:
            commit, timestamp_text = line.rstrip("\n").split("\t", 1)
            timestamp = int(timestamp_text)
            if datetime.datetime.fromtimestamp(timestamp, datetime.timezone.utc).year != year:
                continue
            batch.stdin.write(f"{commit}:m\n".encode("ascii"))
            batch.stdin.flush()
            header = batch.stdout.readline().decode("ascii").rstrip("\n")
            fields = header.split()
            if len(fields) != 3 or fields[1] != "blob":
                tree = subprocess.run(
                    ["git", f"--git-dir={repository}", "ls-tree", "--name-only", commit],
                    check=True,
                    stdout=subprocess.PIPE,
                    text=True,
                    encoding="utf-8",
                ).stdout.splitlines()
                if fields == [f"{commit}:m", "missing"] and tree == ["d"]:
                    tombstones += 1
                    print(
                        "WARNING: ignored public-inbox tombstone "
                        f"{commit}; archive tree contains d and no training message m",
                        file=sys.stderr,
                    )
                    continue
                fail(
                    f"commit {commit} does not contain a message blob named m "
                    f"(tree entries: {tree})"
                )
            size = int(fields[2])
            message = batch.stdout.read(size)
            if len(message) != size or batch.stdout.read(1) != b"\n":
                fail(f"short Git object read for {commit}")
            messages += 1
            path = os.path.join(
                output_dir, f"{prefix}-{messages:08d}-{commit}.eml"
            )
            with open(path, "xb") as output:
                output.write(message)
    finally:
        log.stdout.close()
        batch.stdin.close()
        batch.stdout.close()
        log_status = log.wait()
        batch_status = batch.wait()
    if log_status != 0 or batch_status != 0:
        fail(f"Git stream failed: log={log_status} cat-file={batch_status}")
    if messages == 0:
        fail(f"no messages found for {year}")
    print(
        f"public_inbox_extract.py: retained {messages} messages as individual "
        f".eml files; ignored {tombstones} archive tombstones",
        file=sys.stderr,
    )


if __name__ == "__main__":
    main()
