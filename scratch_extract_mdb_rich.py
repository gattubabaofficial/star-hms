"""Rich schema extraction: column name, Access type, length, nullable, autonumber, PK."""
import json
from pathlib import Path
from access_parser import AccessParser

LEGACY_DIRS = [
    r"c:\Users\Dell\Desktop\star-hms\_legacy\original_files\HITBLT18 1111",
]
OUT = Path(r"c:\Users\Dell\Desktop\star-hms\_legacy\extracted\mdb_schema_rich.json")

# Access column type codes
ACCESS_TYPES = {
    1: "BOOLEAN", 2: "BYTE", 3: "INTEGER", 4: "LONG", 5: "CURRENCY",
    6: "SINGLE", 7: "DOUBLE", 8: "DATETIME", 9: "BINARY", 10: "TEXT",
    11: "OLE", 12: "MEMO", 15: "GUID", 16: "BIGINT", 17: "NUMERIC",
    18: "COMPLEX",
}


def col_meta(col):
    flags = col.column_flags
    return {
        "name": col.col_name_str,
        "type": ACCESS_TYPES.get(col.type, f"UNK{col.type}"),
        "length": getattr(col, "length", None),
        "nullable": bool(getattr(flags, "can_be_null", True)),
        "autonumber": bool(getattr(flags, "autonumber", False)),
    }


def main():
    schema = {}
    for d in LEGACY_DIRS:
        for f in sorted(Path(d).glob("*.[Mm][Dd][Bb]")):
            try:
                db = AccessParser(str(f))
            except Exception as e:  # noqa
                print(f"skip {f.name}: {e}")
                continue
            for tname in db.catalog:
                if tname.startswith("MSys") or tname.startswith("~"):
                    continue
                try:
                    tobj = db.get_table(tname)
                    cols = [col_meta(c) for c in tobj.columns.values() if c.col_name_str]
                    pks = list(tobj.primary_keys or [])
                except Exception as e:  # noqa
                    continue
                if not cols:
                    continue
                # keep richest version if duplicated across files
                prev = schema.get(tname)
                if prev is None or len(cols) > len(prev["columns"]):
                    schema[tname] = {"file": f.name, "pk": pks, "columns": cols}
            print(f"{f.name}: done")
    OUT.write_text(json.dumps(schema, indent=2), encoding="utf-8")
    print(f"Wrote {OUT} with {len(schema)} tables")


if __name__ == "__main__":
    main()
