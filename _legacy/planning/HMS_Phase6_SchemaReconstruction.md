# HMS Phase 6 – Schema Reconstruction & ERD Draft

## Source Verification

Schema extracted from:
- HmsDStru.bas
- ADOX table generator
- VB6 Hospital Management System source

Total tables discovered in HMS schema generator: 130

## Confirmed Master Tables

### Patient Domain
- PatCatgMst
- PatCatgMst_Log

### Doctor Domain
- DoctCatgMst
- DoctRoleMst
- DoctMast
- Corresponding *_Log tables

### Referral Domain
- RefCatgMst
- RefByMast
- RefToMast

### Services Domain
- ServGrpMst
- ServMast
- ServRateMst

## Verified Column Examples

### PatCatgMst
PK: PcgCode
Columns:
- PcgName
- PcgInfAllowed
- PcgDefAllowed
- PcgDiscAllowed
- PcgDiscPer
- PcgShowInList
- PcgRecState

### DoctMast
PK: DctCode
Columns:
- DctTitle
- DctName
- DctSpeci
- DctDcgCode
- DctDrlCode
- DctAddr
- DctTelNo
- DctEmail
- DctAhCode

## Foreign Keys Identified

DoctMast.DctDcgCode -> DoctCatgMst.DcgCode

DoctMast.DctDrlCode -> DoctRoleMst.DrlCode

## Reconstructed ER Diagram (Mermaid)

```mermaid
erDiagram

PATIENT_CATEGORY ||--o{ PATIENT : categorizes

DOCTOR_CATEGORY ||--o{ DOCTOR : contains

DOCTOR_ROLE ||--o{ DOCTOR : assigned

DOCTOR {
 int DctCode PK
 int DctDcgCode FK
 int DctDrlCode FK
 string DctName
}

SERVICE_GROUP ||--o{ SERVICE : contains

FLOOR ||--o{ WARD : contains

WARD ||--o{ BED : contains

PATIENT ||--o{ OPD_REGISTRATION : registers

PATIENT ||--o{ IPD_ADMISSION : admitted

PATIENT ||--o{ LAB_RECEIPT : orders

PATIENT ||--o{ BILL : billed

BILL ||--o{ PAYMENT : paid
}
```

## PostgreSQL Naming Recommendation

PatCatgMst      -> patient_categories
DoctCatgMst    -> doctor_categories
DoctRoleMst    -> doctor_roles
DoctMast       -> doctors
ServGrpMst     -> service_groups
ServMast       -> services

## Phase 7

- Full column extraction from every table
- Generate CREATE TABLE scripts
- Complete ERD with cardinalities
- UML Class Diagram
- API model definitions
