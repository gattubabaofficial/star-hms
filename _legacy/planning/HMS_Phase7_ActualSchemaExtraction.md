# HMS Phase 7 - Actual Schema Extraction

Tables parsed from source: **130**

## First 25 Tables with Column Counts

- PatCatgMst | Columns: 8 | PK: PcgCode
- PatCatgMst_Log | Columns: 8 | PK: PcgCode
- DoctCatgMst | Columns: 3 | PK: DcgCode
- DoctCatgMst_Log | Columns: 3 | PK: DcgCode
- RefCatgMst | Columns: 3 | PK: RfgCode
- RefCatgMst_Log | Columns: 3 | PK: RfgCode
- DoctMast | Columns: 12 | PK: DctCode
- DoctMast_Log | Columns: 12 | PK: DctCode
- DoctRoleMst | Columns: 3 | PK: DrlCode
- DoctRoleMst_Log | Columns: 3 | PK: DrlCode
- RefByMast | Columns: 10 | PK: RByCode
- RefByMast_Log | Columns: 10 | PK: RByCode
- RefToMast | Columns: 10 | PK: RToCode
- RefToMast_Log | Columns: 10 | PK: RToCode
- ServGrpMst | Columns: 35 | PK: SgpCode
- ServGrpMst_Log | Columns: 35 | PK: SgpCode
- ServMast | Columns: 45 | PK: SrvCode
- ServMast_Log | Columns: 45 | PK: SrvCode
- ServRateMst | Columns: 19 | PK: SrmICode
- ServRateMst_Log | Columns: 19 | PK: SrmICode
- PatMast | Columns: 24 | PK: PttCode
- PatMast_Log | Columns: 24 | PK: PttCode
- DiagMast | Columns: 3 | PK: DigCode
- DiagMast_Log | Columns: 3 | PK: DigCode
- DiagSrvMst | Columns: 7 | PK: DsmICode

## Sample Actual Extracted Structures

### PatCatgMst
PK: PcgCode
- PcgCode
- PcgName
- PcgInfAllowed
- PcgDefAllowed
- PcgDiscAllowed
- PcgDiscPer
- PcgShowInList
- PcgRecState

### PatCatgMst_Log
PK: PcgCode
- PcgCode
- PcgName
- PcgInfAllowed
- PcgDefAllowed
- PcgDiscAllowed
- PcgDiscPer
- PcgShowInList
- PcgRecState

### DoctCatgMst
PK: DcgCode
- DcgCode
- DcgName
- DcgRecState

### DoctCatgMst_Log
PK: DcgCode
- DcgCode
- DcgName
- DcgRecState

### RefCatgMst
PK: RfgCode
- RfgCode
- RfgName
- RfgRecState

### RefCatgMst_Log
PK: RfgCode
- RfgCode
- RfgName
- RfgRecState

### DoctMast
PK: DctCode
- DctCode
- DctTitle
- DctName
- DctSpeci
- DctDcgCode
- DctDrlCode
- DctAddr
- DctTelNo
- DctEmail
- DctAhCode
- DctShare
- DctRecState

### DoctMast_Log
PK: DctCode
- DctCode
- DctTitle
- DctName
- DctSpeci
- DctDcgCode
- DctDrlCode
- DctAddr
- DctTelNo
- DctEmail
- DctAhCode
- DctShare
- DctRecState


## Confirmed Database Design Pattern

Every major master table has:
- Main table
- Audit log table (_Log)

Examples:
- PatCatgMst / PatCatgMst_Log
- DoctMast / DoctMast_Log
- RefByMast / RefByMast_Log
- ServGrpMst / ServGrpMst_Log

## Confirmed Core Entities

Patient Categories
Doctors
Doctor Categories
Doctor Roles
Referrals
Service Groups
Services
Service Rates
Beds
Wards
Floors
OPD
IPD
Lab
Pharmacy
Users
Security

## ERD Core

PatientCategory -> Patients
DoctorCategory -> Doctors
DoctorRole -> Doctors
ServiceGroup -> Services
Floor -> Ward -> Bed
Patient -> OPD Registration
Patient -> IPD Admission
Patient -> Bills -> Payments

## Phase 7 Result

Source parsing has confirmed 130 table definitions directly from HmsDStru.bas.
This is now source-derived rather than inferred from form names.
