"""Emit exact SQLAlchemy model code (main + _Log) for a set of legacy tables,
targeting the app's backend.database.Base. Prints to stdout; caller redirects.

Usage: python scratch_emit_domain.py <header_comment> <Table1> <Table2> ...
"""
import json
import sys

RICH = json.load(
    open(r"c:\Users\Dell\Desktop\star-hms\_legacy\extracted\mdb_schema_rich.json", encoding="utf-8")
)

TYPE_MAP = {
    "BOOLEAN": ("Boolean", False), "BYTE": ("SmallInteger", False),
    "INTEGER": ("SmallInteger", False), "LONG": ("Integer", False),
    "CURRENCY": ("Numeric(19, 4)", False), "SINGLE": ("Float", False),
    "DOUBLE": ("Float", False), "DATETIME": ("DateTime", False),
    "BINARY": ("LargeBinary", False), "OLE": ("LargeBinary", False),
    "MEMO": ("Text", False), "TEXT": ("String", True),
    "GUID": ("String(38)", False), "BIGINT": ("BigInteger", False),
    "NUMERIC": ("Numeric(28, 6)", False),
}


def sa_type(col):
    sa, needs_len = TYPE_MAP.get(col["type"], ("String", True))
    if needs_len:
        length = col.get("length") or 510
        chars = max(1, int(length) // 2) if length and length > 1 else 255
        sa = f"String({chars})"
    return sa


def emit_class(tbl, meta):
    pk = set(meta.get("pk") or [])
    cols = meta["columns"]
    names = {c["name"] for c in cols}
    if not (pk & names):
        pk = {cols[0]["name"]}
    out = [f"\n\nclass {tbl}(Base):", f'    __tablename__ = "{tbl}"']
    for c in cols:
        args = [sa_type(c)]
        if c["name"] in pk:
            args.append("primary_key=True")
            if c.get("autonumber"):
                args.append("index=True")
        # non-PK columns left nullable for API flexibility (legacy used
        # empty-string / 0 defaults); exact names/types/order preserved.
        out.append(f"    {c['name']} = Column({', '.join(args)})")
    return "\n".join(out)


def emit_log(tbl, meta):
    cols = meta["columns"]
    out = [f"\n\nclass {tbl}_Log(Base):", f'    __tablename__ = "{tbl}_Log"']
    out.append("    LogId = Column(Integer, primary_key=True, autoincrement=True)")
    out.append("    LogAction = Column(String(10), nullable=False)")
    out.append("    LogDate = Column(DateTime, default=func.now())")
    for c in cols:
        out.append(f"    {c['name']} = Column({sa_type(c)})")
    return "\n".join(out)


def main():
    header = sys.argv[1]
    tables = sys.argv[2:]
    print('from sqlalchemy import (')
    print('    Column, Integer, SmallInteger, BigInteger, String, Text, Boolean,')
    print('    DateTime, Float, Numeric, LargeBinary,')
    print(')')
    print('from sqlalchemy.sql import func')
    print('from backend.database import Base')
    print(f'\n# {header}')
    missing = []
    for t in tables:
        meta = RICH.get(t)
        if not meta:
            missing.append(t)
            continue
        print(emit_class(t, meta))
    print("\n\n# ---- Audit log tables ----")
    for t in tables:
        meta = RICH.get(t)
        if meta:
            print(emit_log(t, meta))
    if missing:
        sys.stderr.write(f"MISSING FROM SCHEMA: {missing}\n")


if __name__ == "__main__":
    main()
