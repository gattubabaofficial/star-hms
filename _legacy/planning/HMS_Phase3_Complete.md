# HMS Phase 3 COMPLETE - Actual Database Discovery

## Source-Based Tables Extracted

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
- OutdRcDctDtl
- OutdRcDctDtl_Log
- OutdPymtHdr
- OutdPymtHdr_Log
- OutdPymtDtl
- OutdPymtDtl_Log
- OutdRefdHdr
- OutdRefdHdr_Log
- OutdRefdDtl
- OutdRefdDtl_Log
- OutdBlHdr
- OutdBlHdr_Log
- OutdBill
- OutdBill_Log
- OutdBlDctDtl
- OutdBlDctDtl_Log
- OutdBlPymtHdr
- OutdBlPymtHdr_Log
- OutdBlPymtDtl
- OutdBlPymtDtl_Log
- OutdBlRefdHdr
- OutdBlRefdHdr_Log
- OutdBlRefdDtl
- OutdBlRefdDtl_Log
- IndrHdr
- IndrHdr_Log
- IndrRcpt
- IndrRcpt_Log
- IndrRcDctDtl
- IndrRcDctDtl_Log
- IndrPymtHdr
- IndrPymtHdr_Log
- IndrPymtDtl
- IndrPymtDtl_Log
- IndrRefdHdr
- IndrRefdHdr_Log
- IndrRefdDtl
- IndrRefdDtl_Log
- IndrBlHdr
- IndrBlHdr_Log
- IndrBill
- IndrBill_Log
- IndrBlIbsDtl
- IndrBlIbsDtl_Log
- IndrBlDctDtl
- IndrBlDctDtl_Log
- IndrBlDpogDtl
- IndrBlDpogDtl_Log
- IndrBlRfugDtl
- IndrBlRfugDtl_Log
- IndrBlPymtHdr
- IndrBlPymtHdr_Log
- IndrBlPymtDtl
- IndrBlPymtDtl_Log
- IndrBlRefdHdr
- IndrBlRefdHdr_Log
- IndrBlRefdDtl
- IndrBlRefdDtl_Log
- IndrReg
- IndrReg_Log
- IBedState
- IBedState_Log
- IndrRgPymt
- IndrRgPymt_Log
- IndrRgRefd
- IndrRgRefd_Log
- LabHdr
- LabHdr_Log
- LabRcpt
- LabRcpt_Log
- LabRcDctDtl
- LabRcDctDtl_Log
- LabPymtHdr
- LabPymtHdr_Log
- LabPymtDtl
- LabPymtDtl_Log
- LabRefdHdr
- LabRefdHdr_Log
- LabRefdDtl
- LabRefdDtl_Log

## Key Domains Identified

### Patient
PatCatgMst
Patient-related registration tables

### Doctor
DoctMast
DoctCatgMst
DoctRoleMst

### Referral
RefByMast
RefToMast
RefCatgMst

### Services
ServGrpMst
ServMast
ServRateMst

### OPD
OpdReg*
OpdBill*
OpdRcpt*

### IPD
IpdReg*
IpdBill*
IpdBed*

### Lab
LabRcpt*
LabPayment*
LabRefund*

### Pharmacy
MedPurchHdr
MedPurchDtl
MedSaleHdr
MedSaleDtl
