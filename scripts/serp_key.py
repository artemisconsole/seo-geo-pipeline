#!/usr/bin/env python3
"""Pick a SERP API key that still has credit, for rotation across ~10 keys.

Reads keys from .credentials/credentials.yaml (serp_api_keys: [{label, key}, ...])
and a remaining-credit cache from data/serp/key-usage.json
({label: {"remaining": int|null, "updated": "YYYY-MM-DD"}}).

Prints JSON {"label": ..., "remaining": ...} for the chosen key and NEVER prints the
key value itself (CLAUDE.md section 3). The code making the SERP call loads the secret
by label from credentials. Exits non-zero if no key has credit.
"""
import argparse
import json
import sys
from pathlib import Path


def load_yaml(path):
    try:
        import yaml
    except ImportError:
        sys.exit("PyYAML required (pip install pyyaml)")
    p = Path(path)
    if not p.exists():
        sys.exit(f"not found: {path}")
    with p.open("r", encoding="utf-8") as f:
        return yaml.safe_load(f) or {}


def main():
    ap = argparse.ArgumentParser(description="Choose a SERP API key with credit.")
    ap.add_argument("--credentials", default=".credentials/credentials.yaml")
    ap.add_argument("--usage", default="data/serp/key-usage.json")
    ap.add_argument("--threshold", type=int, default=1,
                    help="min remaining credit to consider a key usable")
    args = ap.parse_args()

    creds = load_yaml(args.credentials)
    keys = creds.get("serp_api_keys") or []
    if not keys:
        sys.exit("no serp_api_keys in credentials")

    usage = {}
    up = Path(args.usage)
    if up.exists():
        usage = json.loads(up.read_text(encoding="utf-8") or "{}")

    def remaining(label):
        return (usage.get(label) or {}).get("remaining")  # None = unknown

    usable = []
    for k in keys:
        label = k.get("label")
        if not label:
            continue
        r = remaining(label)
        if r is None or r >= args.threshold:
            usable.append((label, r))

    if not usable:
        sys.exit("all SERP keys out of credit - refresh usage or add keys, bao PIC")

    # known remaining (descending) first, unknown (None) last
    usable.sort(key=lambda t: (t[1] is None, -(t[1] or 0)))
    label, r = usable[0]
    print(json.dumps({"label": label, "remaining": r}))


if __name__ == "__main__":
    main()
