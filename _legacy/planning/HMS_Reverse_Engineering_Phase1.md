# HMS Reverse Engineering Report (Phase 1)

## Source Statistics
- VB6 Forms: 61
- VB6 Classes: 22
- VB6 Modules: 9

## Forms Discovered

- BedMast.frm
- CRViewer.frm
- CollView.frm
- CompMast.frm
- DctCgMst.frm
- DctRolMs.frm
- DiagMast.frm
- DoctMast.frm
- FloorMst.frm
- FlorMast.frm
- Form1.frm
- HmsIpOpt.frm
- HmsLbOpt.frm
- HmsOpOpt.frm
- HmsOpts.frm
- IpdBedSt.frm
- IpdBill.frm
- IpdBlPyt.frm
- IpdBlRfd.frm
- IpdPyRc.frm
- IpdRcpt.frm
- IpdReg.frm
- IpdRfRc.frm
- IpdRgPyt.frm
- IpdRgRfd.frm
- LabPyRc.frm
- LabRcpt.frm
- LabRfRc.frm
- Main.frm
- MediPur.frm
- MediSale.frm
- MyMenu.frm
- OpdBill.frm
- OpdBlPRc.frm
- OpdBlPyt.frm
- OpdBlRfd.frm
- OpdPyRc.frm
- OpdRcpt.frm
- OpdReg.frm
- OpdRfRc.frm
- OpdRgRfd.frm
- PartyMst.frm
- PatCgMst.frm
- PatMast.frm
- PrtGrpMs.frm
- RefByMst.frm
- RefCgMst.frm
- RefToMst.frm
- SecuMast.frm
- ServMast.frm
- ServView.frm
- SrvGrpMs.frm
- StkTrnVw.frm
- StockReg.frm
- SubItGMs.frm
- SubItMst.frm
- TakeBkup.frm
- UserMast.frm
- UsrRhtMs.frm
- UsrRolMs.frm
- WardMast.frm

## Classes

- Class1.cls
- Class2.cls
- Class3.cls
- Class4.cls
- CmpMstEn.cls
- HmsFlxSr.cls
- HmsIpMTr.cls
- HmsIpOpt.cls
- HmsLbMTr.cls
- HmsLbOpt.cls
- HmsMTrEn.cls
- HmsMstEn.cls
- HmsOpMTr.cls
- HmsOpOpt.cls
- HmsOptEn.cls
- HmsSTrEn.cls
- HmsSrvDc.cls
- HmsTrnEn.cls
- MdsFlxSr.cls
- MdsMTrEn.cls
- MdsMstEn.cls
- tmpHmsSrvDc.cls

## Modules

- AppDStru.bas
- AppLib.bas
- AppMain.bas
- ExtMenu.bas
- HmsDStru.bas
- HmsLib.bas
- MdsDStru.bas
- MdsLib.bas
- Module1.bas

## Reconstructed Modules

### Masters
- Patient Master
- Patient Category
- Doctor Master
- Doctor Category
- Doctor Role
- Referral Management
- Service Master
- Diagnosis Master
- Procedure Master
- Floor / Ward / Bed Masters

### OPD
- Registration
- Receipt
- Bill
- Payment
- Refund

### IPD
- Admission
- Bed Status
- Receipt
- Billing
- Deposits
- Refunds
- Discharge

### Laboratory
- Lab Receipt
- Lab Payment
- Lab Refund
- Test Reports

### Pharmacy
- Purchase
- Sale
- Stock Register
- Stock Transactions

### Security
- User
- Roles
- Rights

### Accounting
- Ledger
- Voucher
- Cash / Bank / Journal

## Next Reverse Engineering Phase
1. Parse FRM controls.
2. Extract field names.
3. Infer database tables.
4. Generate complete ERD.
5. Generate UML diagrams.
6. Produce PostgreSQL schema.
