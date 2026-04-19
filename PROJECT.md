# HMS Web Application — VB6 to Modern Web Migration

## What This Is

A full-stack web application that is an **exact functional replica** of the HMSWin 1.0 VB6 desktop hospital management system. The original system (built in VB6, Rev 39, April 2015) manages OPD, IPD, Lab, Pharmacy, and system administration with MS Access databases. This web migration preserves every form, field, business rule, and RBAC permission while modernizing the stack to React + Express + PostgreSQL with a local↔cloud sync layer.

## Core Value

Enable the hospital to transition from a legacy VB6 desktop application to a cloud-ready web application **without changing any workflow or losing any data**. The local MS Access database continues as the source of truth while the cloud PostgreSQL database mirrors it for web access.

## Context

### Problem
The HMSWin 1.0 VB6 desktop application:
- Only runs on Windows with specific VB6 runtime dependencies
- Tied to local MS Access databases with no remote access
- No mobile or remote access capability
- Increasingly difficult to maintain and extend
- Single-machine deployment limits concurrent usage

### Users
- Hospital staff (reception, billing, admin)
- Doctors (OPD/IPD interaction)
- Lab technicians (diagnostic entries)
- Pharmacy staff (medicine purchase/sale)
- System administrators (user management, backups)

### Existing System
- **VB6 Source**: `Hospital/` directory contains 170+ files — forms (.frm), classes (.cls), modules (.bas)
- **Data**: `HITBLT18 1111/` directory contains live MS Access databases (HospMast.Mdb, HospTran.Mdb, Company.Mdb, Stock.Mdb, etc.) and Crystal Reports (.rpt)
- **Current Progress**: Monorepo initialized, MongoDB → PostgreSQL schema done, Auth & RBAC module completed

### Tech Stack
| Layer | Technology |
|-------|-----------|
| Frontend | React 18 + TypeScript + Vite |
| UI | shadcn/ui + Tailwind CSS 3 |
| Data Grid | AG Grid Community |
| Forms | React Hook Form + Zod |
| State | Zustand + React Query |
| Backend | Express + TypeScript |
| ORM | Prisma |
| Database | PostgreSQL (cloud) |
| Auth | JWT + bcryptjs |
| Sync | node-adodb (local Access reader) |
| Monorepo | pnpm workspaces |

## Requirements

### Validated
- ✓ Monorepo structure with pnpm workspaces — existing
- ✓ Express API server with Prisma ORM — existing  
- ✓ JWT authentication (login/profile endpoints) — existing
- ✓ RBAC middleware (UserRightMst permission model) — existing
- ✓ React frontend with Vite — existing
- ✓ Sync agent package scaffolded — existing

### Active

#### Foundation & Layout
- [ ] Database schema migration (50+ PostgreSQL tables matching VB6 field names)
- [ ] Seed data (default Company, admin User, roles, all rights)
- [ ] AppShell layout (StatusBar + Sidebar + content area)
- [ ] StatusBar component (Company|FY|User|Role|Date|Time)
- [ ] Sidebar menu (matching VB6 MyMenu.frm structure)
- [ ] SummaryDetailLayout (universal Summary+Detail tabs pattern)
- [ ] FormMode component (New/Edit/Delete/View select)
- [ ] DataGrid wrapper (AG Grid)
- [ ] LookupField component (combobox with search)

#### Simple Masters
- [ ] Doctor Category Master (DoctCatgMst)
- [ ] Doctor Role Master (DoctRoleMst)
- [ ] Patient Category Master (PatCatgMst)
- [ ] Referral Category Master (RefCatgMst)
- [ ] Area Master (AreaMast)
- [ ] Station Master (StsnMast)
- [ ] Diagnosis Master (DiagMast)
- [ ] Ward Master (WardMast)
- [ ] Floor Master (FloorMast)

#### Complex Masters
- [ ] Doctor Master (DoctMast) — with category, role, specialization, share %
- [ ] Patient Master (PatMast) — with age calc, DOB, contact dup check
- [ ] Service Group Master (ServGrpMst) — with extended rate/discount/share flags
- [ ] Service Master (ServMast) — with pricing grid, rate system flags
- [ ] Service Rate Master (ServRateMst) — DoctWise/PatCatg/RefBy/RefTo/TimeWise rates
- [ ] Bed Master (BedMast) — with ward, floor, charges, service link
- [ ] RefBy Master (RefByMast) — referring doctors
- [ ] RefTo Master (RefToMast) — referred-to doctors

#### OPD Module
- [ ] OPD Registration (OutdReg) — with patient lookup, service, auto-pricing
- [ ] OPD Bill (OutdHdr + OutdBill) — itemized billing with doctor share
- [ ] OPD Receipt (OutdRcpt) — payment collection with doctor share
- [ ] OPD Payment (OutdBlPymtHdr) — bill payment tracking
- [ ] OPD Refund (OutdBlRefdHdr) — bill refund processing
- [ ] OPD Registration Refund (OutdRgRefd) — registration refund

#### IPD Module
- [ ] IPD Registration (IndrHdr) — admission with bed/ward/floor assignment
- [ ] IPD Bed Status (IBedState) — live bed occupancy view
- [ ] IPD Bill (IndrBlHdr + IndrBill) — complex billing with deposit/advance
- [ ] IPD Receipt (IndrReg) — on-account payment collection
- [ ] IPD Payment (IndrRgPymt) — payment tracking
- [ ] IPD Refund (IndrRgRefd + IndrBlRfugDtl) — refund processing

#### Lab Module
- [ ] Lab Receipt (LabHdr + LabRcpt) — test billing with doctor share
- [ ] Lab Payment (LabPymtHdr) — payment tracking
- [ ] Lab Refund (LabRefdHdr) — refund processing

#### Pharmacy Module
- [ ] Item Group Master (SubItmGrpMst)
- [ ] Item Master (SubItmMast)
- [ ] Party Group Master (PartyGrpMst)
- [ ] Party Master (PartyMast)
- [ ] Medicine Purchase (IndrStk + IndrStkDtl) — stock inward
- [ ] Medicine Sale (OutdStk + OutdStkDtl) — stock outward
- [ ] Stock Register

#### Reports
- [ ] Collection Report (CollView.frm equivalent)
- [ ] Service/Bill Report (ServView.frm equivalent)
- [ ] Bed Status Report

#### Business Rules
- [ ] Service Pricing Resolution (time→doctor→patCatg→refBy→refTo→default)
- [ ] Discount Resolution (with SrvDiscAllowed, PttDiscAllowed, SgpDiscAllowed)
- [ ] Voucher Number Generation (prefix + auto-increment + postfix per company)
- [ ] Balance Calculation (OPD/IPD/Lab specific formulas)
- [ ] Soft Delete (RecState = 0, VoidFlag = true)

#### Sync & System
- [ ] Local Sync Agent (reads MS Access .mdb, pushes delta to API)
- [ ] SyncLog & SyncConfig tables
- [ ] Sync Dashboard UI
- [ ] User Master
- [ ] User Rights Master
- [ ] Company Master
- [ ] Backup Utility

### Out of Scope
- Payroll module — exists in VB6 but not in scope for web migration v1
- General Transactions (Journal Entry, Stock Journal) — accounting module, separate system
- Diagnostic Lab Test Result entry/report — complex, separate scope
- Clinical History module — separate scope
- Crystal Reports direct conversion — will use web-based report rendering instead
- Accounting module integration — separate system

## Key Decisions

| Decision | Rationale | Outcome |
|----------|-----------|---------|
| PostgreSQL over MongoDB | PRD specifies PostgreSQL; relational data with FK constraints matches VB6 Access DB | Switch from MongoDB to PostgreSQL |
| Preserve VB6 field names | Zero-confusion during sync; 1:1 mapping to Access .mdb columns | Use quoted column names in PostgreSQL |
| Summary+Detail pattern | Every VB6 form uses this — list grid + detail form tabs | SummaryDetailLayout component |
| AG Grid for data grids | Replaces VSFlexGrid from VB6; feature parity for sorting/filtering | AG Grid Community edition |
| Local-wins sync strategy | Hospital's local Access DB is authoritative; cloud mirrors it | conflict_strategy = "local-wins" |
| shadcn/ui + Tailwind | Modern, accessible components; PRD specifies this stack | shadcn/ui for all UI components |

## VB6 Source Reference

### Key Files in `Hospital/` Directory
- `MyMenu.frm` — Main menu structure (all navigation)
- `CompMast.frm` — Company/Login form
- `PatMast.frm` — Patient Master form
- `DoctMast.frm` — Doctor Master form
- `ServMast.frm` — Service Master form
- `BedMast.frm` — Bed Master form
- `OpdReg.frm` — OPD Registration
- `OpdBill.frm`, `OpdRcpt.frm` — OPD Billing/Receipt
- `IpdReg.frm`, `IpdBill.frm`, `IpdRcpt.frm` — IPD forms
- `LabRcpt.frm` — Lab Receipt
- `MediPur.frm`, `MediSale.frm` — Pharmacy
- `CollView.frm`, `ServView.frm` — Reports
- `HmsLib.bas` — Core business logic library
- `HmsDStru.bas` — Database structure definitions (396KB!)
- `Module1.bas` — Utility functions (138KB)
- `Class1-4.cls` — Business logic classes

### Key Data Files in `HITBLT18 1111/` Directory
- `Company.Mdb` — Company/User/Role data (598KB)
- `HospMast.Mdb` — Hospital master data (28.9MB)
- `HospTran.Mdb` — Hospital transactions (6.8MB)
- `Stock.Mdb` — Pharmacy stock (466KB)
- `DiagMast.Mdb` — Diagnosis master (1.6MB)
- `Common.Mdb` — Common/shared data (10.5MB)
- Various `.Rpt` files — Crystal Reports templates
- Various `.Cfs`, `.Opt`, `.Crl` — Config/options/report layout files

## Evolution

This document evolves at phase transitions and milestone boundaries.

**After each phase transition** (via `/gsd-transition`):
1. Requirements invalidated? → Move to Out of Scope with reason
2. Requirements validated? → Move to Validated with phase reference
3. New requirements emerged? → Add to Active
4. Decisions to log? → Add to Key Decisions
5. "What This Is" still accurate? → Update if drifted

**After each milestone** (via `/gsd-complete-milestone`):
1. Full review of all sections
2. Core Value check — still the right priority?
3. Audit Out of Scope — reasons still valid?
4. Update Context with current state

---
*Last updated: 2026-04-12 after initialization*
