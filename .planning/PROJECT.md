# HMS Web Application

## What This Is

A modern full-stack web application that replicates the HMSWin 1.0 VB6 desktop hospital management system. The web app runs in parallel with the existing VB6 desktop — hospital staff use VB6 for offline/local work while the web app provides online access from anywhere. A bidirectional sync engine keeps both systems in lockstep automatically. Supports multiple hospitals, each with their own isolated database.

## Core Value

**Remote access to hospital operations with zero data loss** — any authorized user can register patients, create bills, view reports, and manage hospital data from any browser, anywhere, while the local VB6 system continues operating independently, with automatic two-way synchronization.

## Requirements

### Validated

(None yet — ship to validate)

### Active

- [ ] Exact functional parity with all VB6 forms: masters, OPD, IPD, Lab, Pharmacy, Reports, System
- [ ] Same UX pattern: Summary (list) + Detail (form) on every screen
- [ ] Full CRUD on web app (users can create, edit, delete from web)
- [ ] RBAC permission model identical to VB6 (UserMast → UserRightMst)
- [ ] Two-way sync: local MS Access ↔ cloud PostgreSQL (automatic, bidirectional)
- [ ] Last-write-wins conflict resolution (pure timestamp-based)
- [ ] Multi-hospital support with database-per-tenant isolation
- [ ] VB6 field naming convention preserved in PostgreSQL
- [ ] Soft-delete pattern (RecState=0, VoidFlag=true)
- [ ] Voucher number generation per transaction type, company-specific
- [ ] Service pricing engine with 6-tier priority resolution
- [ ] Balance calculation logic for OPD/IPD/Lab billing
- [ ] Offline-capable web app

### Out of Scope

- Accounting module (`../Acnting/`) — separate system, not part of this migration
- Payroll module (`../Payroll/`) — separate system, not part of this migration  
- Clinical history module (Clincal.Mdb) — deferred to future milestone
- Crystal Reports direct migration — web app generates its own reports/PDFs
- Mobile native app — web app is responsive, no separate iOS/Android
- SMS integration — deferred to future milestone

## Context

**Source system:** HMSWin 1.0, VB6 desktop app using MS Access (.mdb) databases. Built ~2014-2015, actively used by 20+ hospitals. Uses ADODB, MSFlexGrid, Crystal Reports, WinSock. Multiple .mdb files per company: Company.Mdb, HospMast.Mdb, HospTran.Mdb, Common.Mdb, DiagMast.Mdb, DiagTran.Mdb, DrugMast.Mdb, DrugTran.Mdb, Stock.Mdb, GrpData.Mdb.

**VB6 source:** 170+ files — 50+ forms, 15+ class modules, HmsDStru.bas (397KB data structures), HmsLib.bas (74KB library), Module1.bas (139KB logic).

**Existing scaffold:** pnpm monorepo with `packages/api` (Express + Prisma + JWT + Zod).

**Motivation:** Enabling multi-location access and cloud reporting. VB6 continues for offline use.

## Constraints

- **Stack**: React 18 + TypeScript + Vite | Express + Prisma | PostgreSQL (Neon)
- **UI**: shadcn/ui + Tailwind CSS | AG Grid Community
- **Hosting**: Railway (API) + Vercel (frontend) + Neon (DB)
- **Multi-tenancy**: Database-per-tenant
- **Field naming**: Preserve VB6 prefixes (Pcg*, Dct*, Ptt*, etc.)
- **RBAC strings**: Must match exact VB6 menu option names

## Key Decisions

| Decision | Rationale | Outcome |
|----------|-----------|---------|
| Neon PostgreSQL | Serverless, database branching for multi-tenant | — Pending |
| Railway for API | Auto-deploy, WebSocket support for sync | — Pending |
| Vercel for frontend | Edge CDN, React/Vite optimized | — Pending |
| Two-way sync | Users need full read/write on web app | — Pending |
| Last-write-wins | Simpler than manual resolution, RBAC handles access | — Pending |
| Database-per-tenant | Complete data isolation between hospitals | — Pending |

## Evolution

This document evolves at phase transitions and milestone boundaries.

**After each phase transition:**
1. Requirements invalidated? → Move to Out of Scope with reason
2. Requirements validated? → Move to Validated with phase reference
3. New requirements emerged? → Add to Active
4. Decisions to log? → Add to Key Decisions
5. "What This Is" still accurate? → Update if drifted

**After each milestone:**
1. Full review of all sections
2. Core Value check — still the right priority?
3. Audit Out of Scope — reasons still valid?
4. Update Context with current state

---
*Last updated: 2026-04-10 after initialization*
