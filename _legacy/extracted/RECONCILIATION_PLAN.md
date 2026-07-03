# STAR-HMS Reconciliation Plan (Legacy Access → Current Webapp)

## What was extracted (authoritative source of truth)
- `mdb_schema_rich.json` — **275 legacy tables** from the live Access `.Mdb`
  files, with exact column names, Access types, lengths, nullability,
  autonumber flags, and primary keys.
- `mdb_schema.md` — human-readable table/column listing.
- `reconciliation.md` — column-level diff of legacy vs. current models.
- `backend/models_legacy_exact.py` — **auto-generated exact SQLAlchemy models**
  for all 275 tables (own `LegacyBase`, inert until adopted).

## Diff summary (current models vs. legacy)
- Legacy main tables: ~138 (+ matching `_Log` audit tables)
- Current models: 140 (incl. legacy flat compat + sync)
- **88 legacy main tables not yet modeled**
- **39 tables present in both but with column differences**
- 40 model tables not in legacy (flat-compat `Patient`, `beds`, etc. + sync)

## Domains fully MISSING from the current app
| Domain | Source .Mdb | Key tables |
|---|---|---|
| Accounting | Accounts, HmsAcTrn | VTypMast, AcntGrpMst, AchdMast, Journal, JrnHdr, Cash/Bank Rcpt+Pymt Hdr/Dtl |
| Clinical history | Clincal | ClncHistHdr/Dtl, CHistFmtMast/Dtl, ClncObjMast, CObjGrpMast |
| Pathology / Lab masters | DiagMast | TestDeptMast, TestGrpMast, TestParaMast, TestFmtMast/Dtl, TestMethodMast, TestSampTypMast |
| Lab transactions detail | DiagTran | LabPymtDtl, LabRefdDtl, TestRepoHdr, TestRepParaDtl, TestRepFmtDtl |
| Pharmacy / Drug | DrugMast, DrugTran | MediMast, MediGrpMst, MediCpyMst, MediCpoMst, DespHdr, DespBill, DespPymt/Refd |
| Stock | Stock | ProdMast, ProdRef, StockHdr, StockJrn |
| Payroll | Payroll | EmpMast, DeptMast, DesgMast, Attendance, SalarySlip, HoliMast, HoliGrant |
| Appointments | HospTran | OutdApt |
| Packages / Procedures / Referral | HospMast | PackgMast, PackgSrvMst, ProcMast, PatRefMst |

## Column mismatches needing fixes (masters — safe/additive)
- BedMast (+BdmAlloted), DoctMast (+3), PatMast (+14), ServGrpMst (+2),
  ServMast (+38 flags/rates), ServRateMst (rework to Srm* exact),
  DiagSrvMst (rework), Company (+4), UserRightMst (+7), UserRoleMst (+3),
  StsnMast (drop StnShowInList).

## Transaction tables — DESIGN FORK (needs decision)
The current OPD/IPD/Lab bill/receipt models use a **re-designed, simplified**
structure with different column prefixes than the legacy:
- Legacy `OutdHdr` (`Ohr*`) vs current `OutdHdr` (`Ohd*`)
- Legacy `IndrHdr` (`Ihr*`) vs current (`Ihd*`)
- Legacy `LabHdr` (`Lhr*`) vs current (`Lhd*`)
- Legacy split header+detail (Rcpt line detail, RcDctDtl doctor-share detail,
  PymtHdr/PymtDtl, RefdHdr/RefdDtl) vs current single-table simplifications.

Making these **exact** means rewriting those modules end-to-end
(models → pydantic schemas → routers → frontend pages), which will touch
currently-working OPD/IPD/Lab features.

## Recommended phased execution
1. **Masters column reconciliation** (additive, low risk) — align existing
   master tables to exact legacy columns.
2. **Missing master domains** — add exact models + CRUD routers + frontend for
   Pathology masters, Drug/Stock masters, Accounting masters, Payroll masters,
   Packages/Procedures/PatRef, Appointments.
3. **Transaction reconciliation** — adopt exact legacy structure for
   OPD/IPD/Lab headers, receipts, bills, payments, refunds (the design fork).
4. **New transaction domains** — Dispensary billing, Clinical history,
   Pathology reporting, Accounting vouchers, Stock journal, Payroll processing.
5. **Verify** — backend boots, frontend builds, smoke-test each module.
