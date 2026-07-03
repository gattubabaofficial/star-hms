"""Reconcile current SQLAlchemy models against extracted legacy MDB schema.

Produces _legacy/extracted/reconciliation.md
"""
import json
import sys
from pathlib import Path

sys.path.insert(0, r"c:\Users\Dell\Desktop\star-hms")

# Import models so tables register on Base.metadata
import backend.models  # noqa  (imports all submodules)
from backend.database import Base  # noqa

OUT = Path(r"c:\Users\Dell\Desktop\star-hms\_legacy\extracted\reconciliation.md")

legacy = json.load(
    open(r"c:\Users\Dell\Desktop\star-hms\_legacy\extracted\mdb_schema.json", encoding="utf-8")
)

# legacy: tablename(lower) -> (file, realname, [cols])
leg = {}
for f, tabs in legacy.items():
    for t, cols in tabs.items():
        if t.startswith("__"):
            continue
        # prefer the version with more columns if duplicated across files
        prev = leg.get(t.lower())
        if prev is None or len(cols) > len(prev[2]):
            leg[t.lower()] = (f, t, [str(c) for c in cols])

# current models: tablename(lower) -> {col names}
cur = {}
for tbl in Base.metadata.tables.values():
    cur[tbl.name.lower()] = {c.name for c in tbl.columns}

lines = ["# Reconciliation: Legacy MDB vs Current Models\n"]
lines.append(f"Legacy tables: {len(leg)} | Model tables: {len(cur)}\n")

# Tables in legacy but NOT modeled (skip _Log for brevity but note count)
missing_tables = sorted(
    name for name in leg if name not in cur
)
missing_main = [t for t in missing_tables if not t.endswith("_log")]
missing_log = [t for t in missing_tables if t.endswith("_log")]

lines.append("\n## A. Legacy tables NOT in current models\n")
lines.append(f"Main tables missing ({len(missing_main)}):")
for t in missing_main:
    f, real, cols = leg[t]
    lines.append(f"- **{real}** ({f}, {len(cols)} cols)")
lines.append(f"\n_Log tables missing: {len(missing_log)}_")

# Tables modeled but not in legacy (our extras / renamed)
extra_tables = sorted(name for name in cur if name not in leg)
lines.append("\n## B. Model tables NOT found in legacy schema\n")
for t in extra_tables:
    lines.append(f"- {t}")

# Column-level diff for tables present in both (main tables only)
lines.append("\n## C. Column differences (main tables present in both)\n")
col_issues = 0
for name in sorted(leg):
    if name.endswith("_log") or name not in cur:
        continue
    f, real, lcols = leg[name]
    lset = {c.lower(): c for c in lcols}
    cset = {c.lower() for c in cur[name]}
    missing_cols = [lset[k] for k in lset if k not in cset]
    extra_cols = [c for c in cur[name] if c.lower() not in lset]
    if missing_cols or extra_cols:
        col_issues += 1
        lines.append(f"\n### {real} ({f})")
        if missing_cols:
            lines.append(f"  MISSING in model ({len(missing_cols)}): {', '.join(missing_cols)}")
        if extra_cols:
            lines.append(f"  EXTRA in model ({len(extra_cols)}): {', '.join(extra_cols)}")

lines.append(f"\n\nTables with column diffs: {col_issues}")
OUT.write_text("\n".join(lines), encoding="utf-8")
print("\n".join(lines[:4]))
print(f"\nMain tables missing: {len(missing_main)}")
print(f"Log tables missing: {len(missing_log)}")
print(f"Model extras: {len(extra_tables)}")
print(f"Tables w/ column diffs: {col_issues}")
print(f"Wrote {OUT}")
