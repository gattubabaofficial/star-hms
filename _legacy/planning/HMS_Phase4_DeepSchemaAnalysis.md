# HMS Reverse Engineering – Phase 4 (Deep Schema Analysis)

## Verified Findings From Source Code

The file `HmsDStru.bas` is a database schema generator using ADOX.

### Tables Directly Detected
Total HMS tables defined: **130**

First 50 tables discovered:

- PatCatgMst
- PatCatgMst_Log
- DoctCatgMst
- DoctCatgMst_Log
- RefCatgMst
- RefCatgMst_Log
- DoctMast
- DoctMast_Log
- DoctRoleMst
- DoctRoleMst_Log
- RefByMast
- RefByMast_Log
- RefToMast
- RefToMast_Log
- ServGrpMst
- ServGrpMst_Log
- ServMast
- ServMast_Log
- ServRateMst
- ServRateMst_Log
- PatMast
- PatMast_Log
- DiagMast
- DiagMast_Log
- DiagSrvMst
- DiagSrvMst_Log
- FloorMast
- FloorMast_Log
- WardMast
- WardMast_Log
- BedMast
- BedMast_Log
- BedSrvMst
- BedSrvMst_Log
- SubItmMast
- SubItmMast_Log
- SubItmGrpMst
- SubItmGrpMst_Log
- PartyMast
- PartyMast_Log
- PartyGrpMst
- PartyGrpMst_Log
- OutdReg
- OutdReg_Log
- OutdRgRefd
- OutdRgRefd_Log
- OutdHdr
- OutdHdr_Log
- OutdRcpt
- OutdRcpt_Log

---

## Confirmed Schema Pattern

Each master table follows:

Master Table
→ Log Table

Example:

PatCatgMst
PatCatgMst_Log

DoctMast
DoctMast_Log

ServMast
ServMast_Log

This indicates built-in auditing.

---

## Confirmed Entity Domains

### Patient Domain
- PatCatgMst
- Patient Registration
- OPD Registration
- IPD Registration

### Doctor Domain
- DoctMast
- DoctCatgMst
- DoctRoleMst

### Referral Domain
- RefByMast
- RefToMast
- RefCatgMst

### Service Domain
- ServGrpMst
- ServMast
- ServRateMst

### Facility Domain
- Floor
- Ward
- Bed

### Billing Domain
- OPD Bills
- IPD Bills
- Receipts
- Refunds

### Lab Domain
- Lab Receipts
- Lab Payments
- Lab Refunds

### Pharmacy Domain
- Purchase
- Sale
- Stock

---

## Architecture Observed

VB6 Forms
    ↓
Business Classes
    ↓
ADO Layer
    ↓
MDB Database

Crystal Reports consume the same database.

---

## Phase 5 Objectives

1. Extract every column definition.
2. Map primary keys.
3. Infer foreign keys.
4. Generate ERD.
5. Generate PostgreSQL schema.
6. Produce UML Class Diagram.
7. Produce SRS and final PRD.
