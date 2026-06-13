# HMS Reverse Engineering – Phase 2

## Actual VB6 Forms Extracted From Source

### Core System
- Main.frm
- MyMenu.frm
- Form1.frm
- CompMast.frm
- SecuMast.frm
- TakeBkup.frm

---

## Patient Management

### Masters
- PatMast.frm (Patient Master)
- PatCgMst.frm (Patient Category)

### Referral
- RefByMst.frm
- RefToMst.frm
- RefCgMst.frm

---

## Doctor Management

- DoctMast.frm
- DctCgMst.frm
- DctRolMs.frm

---

## Clinical Services

- DiagMast.frm (Diagnosis Master)
- ServMast.frm (Service Master)
- ServView.frm
- SrvGrpMs.frm (Service Group)

---

## Bed Management

- FloorMst.frm
- FlorMast.frm
- WardMast.frm
- BedMast.frm

---

## OPD Module

### Registration
- OpdReg.frm

### Receipts
- OpdRcpt.frm
- OpdPyRc.frm
- OpdRfRc.frm

### Billing
- OpdBill.frm
- OpdBlPRc.frm
- OpdBlPyt.frm
- OpdBlRfd.frm
- OpdRgRfd.frm

### Menu
- HmsOpOpt.frm

---

## IPD Module

### Admission
- IpdReg.frm
- IpdBedSt.frm

### Billing
- IpdBill.frm

### Receipts
- IpdRcpt.frm
- IpdPyRc.frm
- IpdRfRc.frm

### Deposits / Refunds
- IpdRgPyt.frm
- IpdRgRfd.frm
- IpdBlPyt.frm
- IpdBlRfd.frm

### Menu
- HmsIpOpt.frm

---

## Laboratory

- LabRcpt.frm
- LabPyRc.frm
- LabRfRc.frm
- HmsLbOpt.frm

---

## Pharmacy

- MediPur.frm
- MediSale.frm
- StockReg.frm
- StkTrnVw.frm

---

## Security & Users

- UserMast.frm
- UsrRolMs.frm
- UsrRhtMs.frm

---

## Inventory

- PartyMst.frm
- PrtGrpMs.frm
- SubItMst.frm
- SubItGMs.frm

---

## Reporting

- CRViewer.frm
- CollView.frm

---

# Reconstructed Database Domains

1. Patient Domain
2. Doctor Domain
3. OPD Domain
4. IPD Domain
5. Billing Domain
6. Laboratory Domain
7. Pharmacy Domain
8. Inventory Domain
9. Accounting Domain
10. Security Domain

# Phase 3 Target

- Extract MDB database tables
- Infer primary keys
- Infer foreign keys
- Generate full ERD
- Generate PostgreSQL schema
