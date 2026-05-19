# HMS Web Application — Requirements

## Milestone 1: Core Application (v1.0)

### R1. Database & Schema
- **R1.1** PostgreSQL schema with 50+ tables matching VB6 field naming conventions (quoted identifiers)
- **R1.2** Prisma schema.prisma mirroring all tables with proper relations and field types
- **R1.3** Migration files for schema creation
- **R1.4** Seed script: default Company, admin User, admin UserRole, full UserRights for all menu options
- **R1.5** SyncLog and SyncConfig tables for sync tracking

### R2. Authentication & Authorization
- **R2.1** ✅ POST /api/auth/login with JWT + httpOnly cookie
- **R2.2** ✅ GET /api/auth/me for session info
- **R2.3** ✅ RBAC middleware checking UserRightMst per route (UhtCanAdd/Edit/Delete/View)
- **R2.4** Company selection at login (multi-company support via CmpCode)
- **R2.5** Session state: company, FY dates, user, role persisted in Zustand

### R3. Application Shell & Shared Components
- **R3.1** AppShell layout: StatusBar (bottom) + Sidebar (left) + Content area
- **R3.2** StatusBar: Company name | FY period | User | Role | Work Date | System Time
- **R3.3** Sidebar: Menu structure matching VB6 MyMenu.frm (Hospital Masters, OPD, IPD, Lab, Pharmacy, Reports, System)
- **R3.4** SummaryDetailLayout: Universal Summary (AG Grid) + Detail (form) tabs — used on every screen
- **R3.5** FormMode selector: New / Edit / Delete / View
- **R3.6** DataGrid: AG Grid wrapper with column defs, sorting, filtering, row selection
- **R3.7** LookupField: Combobox with async search for FK references (patients, doctors, services)
- **R3.8** PrintDialog: Print / PDF / Excel export dialog
- **R3.9** SyncBadge: Local↔Cloud sync status indicator

### R4. Simple Masters (Generic CRUD)
- **R4.1** SimpleMaster component: reusable for all 1-2 field master tables
- **R4.2** Doctor Category (DoctCatgMst): DcgCode, DcgName
- **R4.3** Doctor Role (DoctRoleMst): DrlCode, DrlName
- **R4.4** Patient Category (PatCatgMst): PcgCode, PcgName, PcgInfAllowed, PcgDefAllowed, PcgDiscAllowed, PcgDiscPer, PcgShowInList
- **R4.5** Referral Category (RefCatgMst): RfgCode, RfgName
- **R4.6** Area Master (AreaMast): AraCode, AraName
- **R4.7** Station Master (StsnMast): StnCode, StnName
- **R4.8** Diagnosis Master (DiagMast): DigCode, DigName
- **R4.9** Ward Master (WardMast): WrdCode, WrdName
- **R4.10** Floor Master (FloorMast): FlrCode, FlrName, FlrShowInList
- **R4.11** API routes: GET/POST/PUT per master with RBAC

### R5. Complex Masters
- **R5.1** Doctor Master: All DctMast fields + FK to DoctCatgMst, DoctRoleMst + share %
- **R5.2** Patient Master: All PatMast fields + age auto-calc from DOB + contact duplicate check (ChkDuplPatByContNo) + FK to PatCatgMst, AreaMast, StsnMast
- **R5.3** Service Group Master: All SgpMst fields including all 20+ flags (ExtRateSys, DctwseRateSys, etc.)
- **R5.4** Service Master: All SrvMast fields + FK to ServGrpMst + pricing grid
- **R5.5** Service Rate Master: Rate entries for DoctWise, PatCatg, RefBy, RefTo, TimeWise types
- **R5.6** Bed Master: All BdmMast fields + FK to WardMast, FloorMast, ServMast
- **R5.7** RefBy Master: All RByMast fields + FK to RefCatgMst + share %
- **R5.8** RefTo Master: All RToMast fields + FK to RefCatgMst + share %

### R6. Business Rules Engine
- **R6.1** Service Pricing Resolution (pricing.ts): Priority order — Time→Doctor→PatCatg→RefBy→RefTo→Default rate from ServRateMst
- **R6.2** Discount Resolution: Check SrvDiscAllowed → PttDiscAllowed → SgpDiscAllowed → Extended discount from ServRateMst
- **R6.3** Bargain: Manual override only if SrvDefAllowed = true
- **R6.4** Increment: AmtAftDisc * (1 + InfPer/100) only if InfAllowed = true
- **R6.5** Voucher Number Generation (vchno.ts): Format [Prefix][AutoNo][Postfix] per VoucherType per Company
- **R6.6** Balance Calculation: OPD Bill = Total - Deposited - Refunded; IPD = Total - Advance - Deposits - Refunds + OnAccPay; Lab = Total - Received - Refunded
- **R6.7** Soft Delete: RecState = 0 + VoidFlag for headers; all queries WHERE RecState > 0

### R7. OPD Module
- **R7.1** OPD Registration (OutdReg): Patient lookup, consulting doctor, RefBy/RefTo, diagnosis, service select, auto-pricing, voucher number
- **R7.2** OPD Bill (OutdHdr + OutdBill): Header + line items, doctor share (OutdBlDctDtl), discount calc, total with balance
- **R7.3** OPD Receipt (OutdRcpt): Payment collection, receipt type, doctor share, advance handling
- **R7.4** OPD Payment (OutdBlPymtHdr / OutdPymtHdr): Bill/receipt payment tracking
- **R7.5** OPD Refund (OutdBlRefdHdr / OutdRefdHdr): Bill/receipt refund processing
- **R7.6** OPD Reg Refund (OutdRgRefd): Registration-level refund

### R8. IPD Module
- **R8.1** IPD Registration (IndrHdr): Admission — patient, doctor, bed/ward/floor assignment, advance, diagnosis, status tracking
- **R8.2** IPD Bed Status (IBedState): Live bed occupancy — from/to date+time, bed transfers, unit calc
- **R8.3** IPD Bill (IndrBlHdr + IndrBill): Complex billing — line items, doctor share (IndrBlDctDtl), deposits (IndrBlDpogDtl), refunds (IndrBlRfugDtl), discharge
- **R8.4** IPD Receipt (IndrReg): On-account receipt with type (advance, deposit)
- **R8.5** IPD Payment (IndrRgPymt): Payment tracking
- **R8.6** IPD Refund (IndrRgRefd): Refund processing

### R9. Lab Module
- **R9.1** Lab Receipt (LabHdr + LabRcpt): Test billing — patient, doctor, services, amounts, doctor share (LabRcDctDtl)
- **R9.2** Lab Payment (LabPymtHdr): Payment tracking
- **R9.3** Lab Refund (LabRefdHdr): Refund processing

### R10. Pharmacy Module
- **R10.1** Item Group Master (SubItmGrpMst): Group name
- **R10.2** Item Master (SubItmMast): Item + group FK
- **R10.3** Party Group Master (PartyGrpMst): Group name
- **R10.4** Party Master (PartyMast): Party details + area FK + group FK
- **R10.5** Medicine Purchase (IndrStk + IndrStkDtl): Inward — party, ref, items with qty/rate/disc/tax
- **R10.6** Medicine Sale (OutdStk + OutdStkDtl): Outward — party, items with qty/rate/disc/tax
- **R10.7** Stock Register: Current stock view with item-wise details

### R11. Reports
- **R11.1** Collection Report: Date-wise collection summary matching CollView.frm
- **R11.2** Service/Bill Report: Service-wise report matching ServView.frm
- **R11.3** Bed Status Report: Current bed occupancy and availability

### R12. Sync Agent
- **R12.1** sync-agent/access-reader.ts: Read MS Access .mdb tables via node-adodb
- **R12.2** sync-agent/delta-tracker.ts: Detect changes using RecState + last_sync_time
- **R12.3** sync-agent/push-client.ts: POST changed records to /api/sync/push
- **R12.4** sync-agent/scheduler.ts: Configurable interval (default 15min)
- **R12.5** API: POST /api/sync/push — upsert records + log to SyncLog
- **R12.6** Conflict resolution: local-wins strategy
- **R12.7** SyncDashboard: UI showing last sync time, record counts, errors

### R13. System Administration
- **R13.1** User Master: CRUD for UserMast
- **R13.2** User Rights Master: Permission matrix (UsrRhtMs.frm — per user/role per menu option per right)
- **R13.3** Company Master: Company information management
- **R13.4** Backup Utility: Database backup trigger

---
*Last updated: 2026-04-12*
