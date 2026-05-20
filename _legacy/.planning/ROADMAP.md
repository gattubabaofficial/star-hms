# HMS Web Application — Roadmap

## Milestone 1: Core Application (v1.0)

### Phase 1: Database Schema & Seed ✅ (Partially Complete)
**Goal:** PostgreSQL schema with all 50+ tables, Prisma models, migrations, and seed data.
**Satisfies:** R1.1, R1.2, R1.3, R1.4, R1.5
**Status:** 🔄 Needs rework — currently MongoDB, must switch to PostgreSQL
**UAT:**
- [ ] `npx prisma migrate dev` succeeds with no errors
- [ ] All 50+ tables created with correct column types and FK constraints
- [ ] Seed creates default Company, admin User, admin Role, and full rights
- [ ] SyncLog and SyncConfig tables exist
- [ ] Column names match VB6 field names exactly (quoted identifiers)

---

### Phase 2: Authentication & Authorization ✅ (Partially Complete)
**Goal:** JWT auth with company-aware login, RBAC middleware, and session management.
**Satisfies:** R2.1, R2.2, R2.3, R2.4, R2.5
**Depends on:** Phase 1
**Status:** 🔄 Auth routes exist but need PostgreSQL adapter
**UAT:**
- [ ] Login with username + password + companyCode returns JWT
- [ ] JWT contains usrCode, usrName, urlCode, urlName, cmpCode
- [ ] GET /api/auth/me returns session info from JWT
- [ ] RBAC middleware blocks unauthorized access per menu option
- [ ] Zustand store holds company, FY, user, role state

---

### Phase 3: Application Shell & Shared Components
**Goal:** AppShell layout, StatusBar, Sidebar, SummaryDetailLayout, and all reusable components.
**Satisfies:** R3.1, R3.2, R3.3, R3.4, R3.5, R3.6, R3.7, R3.8, R3.9
**Depends on:** Phase 2
**UAT:**
- [ ] AppShell renders with StatusBar at bottom, Sidebar on left, Content in center
- [ ] StatusBar shows Company | FY | User | Role | Date | Time
- [ ] Sidebar menus match VB6 MyMenu.frm structure (Hospital Masters, OPD, IPD, Lab, Pharmacy, Reports, System)
- [ ] SummaryDetailLayout switches between Summary (grid) and Detail (form) tabs
- [ ] FormMode selector shows New/Edit/Delete/View
- [ ] DataGrid renders with AG Grid, supports column defs and row selection
- [ ] LookupField does async search and returns selected FK value
- [ ] React Router routes configured for all modules

---

### Phase 4: Simple Masters — API & Backend
**Goal:** Backend CRUD routes for all 9 simple master tables with RBAC.
**Satisfies:** R4.1 (backend), R4.2–R4.10 (API), R4.11
**Depends on:** Phase 1
**UAT:**
- [ ] GET /api/masters/doctor-categories returns paginated DoctCatgMst list
- [ ] POST creates new record with auto-increment code
- [ ] PUT updates existing record
- [ ] DELETE soft-deletes (RecState = 0)
- [ ] All 9 masters have identical CRUD endpoints
- [ ] RBAC applied per master

---

### Phase 5: Simple Masters — Frontend UI
**Goal:** SimpleMaster reusable component rendering all 9 simple masters with SummaryDetailLayout.
**Satisfies:** R4.1 (frontend), R4.2–R4.10 (UI)
**Depends on:** Phase 3, Phase 4
**UAT:**
- [ ] SimpleMaster renders with SummaryDetailLayout
- [ ] Doctor Category, Doctor Role, Pat Category, Ref Category, Area, Station, Diagnosis, Ward, Floor all render correctly
- [ ] PatCatgMst shows additional fields (InfAllowed, DefAllowed, DiscAllowed, DiscPer, ShowInList)
- [ ] FloorMast shows ShowInList toggle
- [ ] Add/Edit/Delete/View modes work for all masters
- [ ] Search/filter works in summary grid

---

### Phase 6: Business Rules Engine
**Goal:** Implement core business logic — pricing, discounts, voucher numbers, balance calc, soft delete.
**Satisfies:** R6.1, R6.2, R6.3, R6.4, R6.5, R6.6, R6.7
**Depends on:** Phase 1
**UAT:**
- [ ] pricing.ts resolves rate in priority order: Time→Doctor→PatCatg→RefBy→RefTo→Default
- [ ] Discount resolution follows SrvDiscAllowed → PttDiscAllowed → SgpDiscAllowed chain
- [ ] Bargain only applied when SrvDefAllowed = true
- [ ] Increment calc: AmtAftDisc * (1 + InfPer/100) when InfAllowed = true
- [ ] vchno.ts generates [Prefix][AutoNo][Postfix] per VoucherType per Company
- [ ] Balance calc: correct formulas for OPD, IPD, Lab
- [ ] recstate.ts: soft-delete sets RecState=0, all queries filter RecState > 0

---

### Phase 7: Complex Masters — Doctor & Patient (API + UI)
**Goal:** Doctor Master and Patient Master full CRUD with all fields, validations, and UI.
**Satisfies:** R5.1, R5.2
**Depends on:** Phase 3, Phase 4, Phase 5
**UAT:**
- [ ] Doctor Master: all DctMast fields, FK lookups for category/role, share % input
- [ ] Patient Master: all PatMast fields, DOB→age auto-calc, contact duplicate check
- [ ] Patient: FK lookups for PatCatgMst, AreaMast, StsnMast
- [ ] Patient: discount fields (InfAllowed, DefAllowed, DiscAllowed, DiscPer)
- [ ] Both use SummaryDetailLayout with full-featured grids

---

### Phase 8: Complex Masters — Service & Bed (API + UI)
**Goal:** Service Group, Service, Service Rate, and Bed masters with the complex pricing grid.
**Satisfies:** R5.3, R5.4, R5.5, R5.6
**Depends on:** Phase 6, Phase 7
**UAT:**
- [ ] Service Group: all 20+ flags (ExtRateSys, DctwseRateSys, PcgwseRateSys, etc.)
- [ ] Service Master: all fields + FK to ServGrpMst + rate/discount/share flag inheritance
- [ ] Service Rate Master: embedded grid for adding rate records (DoctWise, PatCatg, RefBy, RefTo, TimeWise)
- [ ] Bed Master: all fields + FK lookups for Ward, Floor, Service
- [ ] Pricing flags cascade correctly from group to service

---

### Phase 9: Complex Masters — RefBy & RefTo (API + UI)
**Goal:** Referring doctor and Referred-to doctor masters.
**Satisfies:** R5.7, R5.8
**Depends on:** Phase 4 (RefCatgMst)
**UAT:**
- [ ] RefBy Master: all RByMast fields, FK to RefCatgMst, share %
- [ ] RefTo Master: all RToMast fields, FK to RefCatgMst, share %
- [ ] Both use SummaryDetailLayout

---

### Phase 10: OPD Registration (API + UI)
**Goal:** OPD patient registration with patient lookup, service selection, and auto-pricing.
**Satisfies:** R7.1
**Depends on:** Phase 6, Phase 7, Phase 8
**UAT:**
- [ ] Patient lookup via LookupField
- [ ] Consulting doctor selection
- [ ] RefBy/RefTo selection
- [ ] Provisional and Final diagnosis selection
- [ ] Service auto-populates rate from pricing engine
- [ ] Voucher number auto-generated
- [ ] Discount calc works per business rules
- [ ] OutdReg record created with all fields

---

### Phase 11: OPD Bill & Receipt (API + UI)
**Goal:** OPD billing and receipt with line items, doctor share, and payment tracking.
**Satisfies:** R7.2, R7.3
**Depends on:** Phase 10
**UAT:**
- [ ] OPD Bill: header (OutdHdr) + line items (OutdBill) + doctor share (OutdBlDctDtl)
- [ ] OPD Receipt: header (OutdRcpt) + receipt type + doctor share
- [ ] Balance calculation: TotalAmt - DepositedAmt - RefundedAmt
- [ ] Void flag support
- [ ] Both use SummaryDetailLayout with VB6-matching fields

---

### Phase 12: OPD Payment & Refund (API + UI)
**Goal:** OPD payment tracking and refund processing.
**Satisfies:** R7.4, R7.5, R7.6
**Depends on:** Phase 11
**UAT:**
- [ ] OPD Bill Payment: record payments against bills
- [ ] OPD Bill Refund: process refunds against bills
- [ ] OPD Receipt Payment/Refund: same for receipts
- [ ] OPD Registration Refund: refund against registration
- [ ] Balance recalculates correctly after each transaction

---

### Phase 13: IPD Registration & Bed Status (API + UI)
**Goal:** IPD admission with bed/ward/floor assignment and live bed occupancy view.
**Satisfies:** R8.1, R8.2
**Depends on:** Phase 6, Phase 7, Phase 8
**UAT:**
- [ ] IPD Registration: patient, doctor, bed/ward/floor, advance, diagnosis, status
- [ ] Bed assignment creates IBedState record
- [ ] Bed Status: visual grid showing occupied/available beds by floor/ward
- [ ] Bed transfer: change bed with from/to date+time tracking
- [ ] Admission status tracking (Admitted/Discharged)

---

### Phase 14: IPD Bill & Receipt (API + UI)
**Goal:** Complex IPD billing with deposits, advances, and on-account receipts.
**Satisfies:** R8.3, R8.4
**Depends on:** Phase 13
**UAT:**
- [ ] IPD Bill: header + line items + doctor share + deposits (IndrBlDpogDtl) + refunds (IndrBlRfugDtl)
- [ ] IPD Receipt: on-account payments with type (advance/deposit)
- [ ] Balance: TotalAmt - AdvanceAdj - BillDeposits - BillRefunds + OnAccPayAdj
- [ ] Discharge date/time integration
- [ ] Void flag support

---

### Phase 15: IPD Payment & Refund (API + UI)
**Goal:** IPD payment tracking and refund processing.
**Satisfies:** R8.5, R8.6
**Depends on:** Phase 14
**UAT:**
- [ ] Payment records against IPD receipts
- [ ] Refund processing
- [ ] Balance recalculation

---

### Phase 16: Lab Module (API + UI)
**Goal:** Lab receipt, payment, and refund — complete lab billing workflow.
**Satisfies:** R9.1, R9.2, R9.3
**Depends on:** Phase 6, Phase 7, Phase 8
**UAT:**
- [ ] Lab Receipt: patient, doctor, test services, amounts, doctor share
- [ ] Lab Payment: payment tracking
- [ ] Lab Refund: refund processing
- [ ] Balance: TotalAmt - ReceivedAmt - RefundedAmt
- [ ] All use SummaryDetailLayout

---

### Phase 17: Pharmacy Masters (API + UI)
**Goal:** Item Group, Item, Party Group, Party masters for pharmacy module.
**Satisfies:** R10.1, R10.2, R10.3, R10.4
**Depends on:** Phase 4
**UAT:**
- [ ] Item Group Master: CRUD with SummaryDetailLayout
- [ ] Item Master: CRUD with group FK lookup
- [ ] Party Group Master: CRUD
- [ ] Party Master: CRUD with area FK, group FK, contacts

---

### Phase 18: Pharmacy Transactions (API + UI)
**Goal:** Medicine purchase (stock inward) and sale (stock outward) with line items.
**Satisfies:** R10.5, R10.6, R10.7
**Depends on:** Phase 17
**UAT:**
- [ ] Purchase Entry: party, ref no/date, line items (item, qty, rate, disc, tax, amount)
- [ ] Sale Entry: party, line items
- [ ] Stock Register: current item-wise stock quantities
- [ ] Purchase/Sale detail lines with correct calc (Qty * Rate - Disc + Tax = Amt)

---

### Phase 19: Reports
**Goal:** Collection report, service report, and bed status report.
**Satisfies:** R11.1, R11.2, R11.3
**Depends on:** Phase 12, Phase 15, Phase 16
**UAT:**
- [ ] Collection Report: date range filter, daily summary, OPD/IPD/Lab breakdown
- [ ] Service Report: service-wise billing summary with doctor-wise breakdown
- [ ] Bed Status Report: current occupancy by floor/ward
- [ ] Export to PDF/Excel via PrintDialog

---

### Phase 20: System Administration
**Goal:** User Master, User Rights, Company Master, Backup utility.
**Satisfies:** R13.1, R13.2, R13.3, R13.4
**Depends on:** Phase 3
**UAT:**
- [ ] User Master: CRUD with role assignment, password management
- [ ] User Rights: permission matrix — per user/role × per menu option × per right (Add/Edit/Delete/View)
- [ ] Company Master: company info management
- [ ] Backup: trigger database backup

---

### Phase 21: Sync Agent
**Goal:** Local daemon that reads MS Access .mdb and pushes delta to cloud PostgreSQL.
**Satisfies:** R12.1, R12.2, R12.3, R12.4, R12.5, R12.6, R12.7
**Depends on:** Phase 1
**UAT:**
- [ ] access-reader.ts reads .mdb tables via node-adodb
- [ ] delta-tracker.ts detects changed records (RecState + timestamps)
- [ ] push-client.ts POSTs to /api/sync/push
- [ ] scheduler.ts runs at configurable intervals (default 15min)
- [ ] API upserts records and logs to SyncLog
- [ ] Conflict resolution: local-wins
- [ ] SyncDashboard UI shows status, counts, errors

---

### Phase 22: Polish & Deploy
**Goal:** Final testing, UI polish, production deployment.
**Satisfies:** All requirements (final verification)
**Depends on:** All previous phases
**UAT:**
- [ ] All modules functional end-to-end
- [ ] Responsive layout works on tablet+ screens
- [ ] API deployed (Railway/Render)
- [ ] Frontend deployed (Vercel/Netlify)
- [ ] Database provisioned (Supabase/Neon)
- [ ] Environment variables configured
- [ ] Sync agent installable as Windows service

---
*Last updated: 2026-04-12*
