"""Extract full schema (tables + columns) from every legacy .Mdb file.

Outputs:
  _legacy/extracted/mdb_schema.json  -> {file: {table: [{name,type}, ...]}}
  _legacy/extracted/mdb_schema.md    -> human readable summary
"""
import json
import os
from pathlib import Path

from access_parser import AccessParser

LEGACY_DIRS = [
    r"c:\Users\Dell\Desktop\star-hms\_legacy\original_files\HITBLT18 1111",
    r"c:\Users\Dell\Desktop\star-hms\_legacy\original_files\Hospital",
]
OUT_DIR = Path(r"c:\Users\Dell\Desktop\star-hms\_legacy\extracted")
OUT_DIR.mkdir(parents=True, exist_ok=True)


def find_mdbs():
    for d in LEGACY_DIRS:
        p = Path(d)
        if not p.exists():
            continue
        for f in p.iterdir():
            if f.suffix.lower() in (".mdb", ".accdb"):
                yield f


def extract(path: Path):
    db = AccessParser(str(path))
    result = {}
    # catalog: table name -> column definitions
    for tname in db.catalog:
        if tname.startswith("MSys") or tname.startswith("~"):
            continue
        try:
            tbl = db.parse_table(tname)
            cols = list(tbl.keys())
        except Exception as e:  # noqa
            cols = [f"<ERROR: {e}>"]
        result[tname] = cols
    return result


def main():
    schema = {}
    for mdb in sorted(find_mdbs()):
        key = mdb.name
        print(f"Parsing {key} ...")
        try:
            schema[key] = extract(mdb)
            print(f"  -> {len(schema[key])} tables")
        except Exception as e:  # noqa
            print(f"  !! FAILED: {e}")
            schema[key] = {"__error__": str(e)}

    (OUT_DIR / "mdb_schema.json").write_text(
        json.dumps(schema, indent=2, default=str), encoding="utf-8"
    )

    lines = ["# Legacy MDB Schema (extracted)\n"]
    for fname, tables in schema.items():
        lines.append(f"\n## {fname}\n")
        if "__error__" in tables:
            lines.append(f"ERROR: {tables['__error__']}\n")
            continue
        for tname, cols in sorted(tables.items()):
            lines.append(f"\n### {tname}  ({len(cols)} cols)")
            lines.append(", ".join(str(c) for c in cols))
    (OUT_DIR / "mdb_schema.md").write_text("\n".join(lines), encoding="utf-8")
    print(f"\nWrote {OUT_DIR/'mdb_schema.json'} and .md")
    # quick totals
    total_tables = sum(
        len(t) for t in schema.values() if "__error__" not in t
    )
    print(f"Total files: {len(schema)}, total tables: {total_tables}")


if __name__ == "__main__":
    main()
