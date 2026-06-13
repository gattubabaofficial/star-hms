# HMS Phase 5 – Field Level Reverse Engineering

## Tables Parsed From Source

Detected tables with field definitions: 130+

### PatCatgMst
- PcgCode
- PcgName
- PcgInfAllowed
- PcgDefAllowed
- PcgDiscAllowed
- PcgDiscPer
- PcgShowInList
- PcgRecState

### PatCatgMst_Log
- PcgCode
- PcgName
- PcgInfAllowed
- PcgDefAllowed
- PcgDiscAllowed
- PcgDiscPer
- PcgShowInList
- PcgRecState

### DoctCatgMst
- DcgCode
- DcgName
- DcgRecState

### DoctCatgMst_Log
- DcgCode
- DcgName
- DcgRecState

### RefCatgMst
- RfgCode
- RfgName
- RfgRecState

### RefCatgMst_Log
- RfgCode
- RfgName
- RfgRecState

### DoctMast
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

### DoctRoleMst
- DrlCode
- DrlName
- DrlRecState

### DoctRoleMst_Log
- DrlCode
- DrlName
- DrlRecState

### RefByMast
- RByCode
- RByName
- RBySpeci
- RByRfgCode
- RByAddr
- RByTelNo
- RByEmail
- RByAhCode
- RByShare
- RByRecState

### RefByMast_Log
- RByCode
- RByName
- RBySpeci
- RByRfgCode
- RByAddr
- RByTelNo
- RByEmail
- RByAhCode
- RByShare
- RByRecState


## Confirmed Relationships

PatCatgMst
  └── PatCatgMst_Log

DoctCatgMst
  └── DoctCatgMst_Log

RefCatgMst
  └── RefCatgMst_Log

DoctRoleMst
  └── DoctRoleMst_Log

DoctMast
  ├── DctDcgCode → DoctCatgMst
  ├── DctDrlCode → DoctRoleMst
  └── DctAhCode → Account Head

## First Verified Foreign Keys

DoctMast.DctDcgCode → DoctCatgMst.DcgCode
DoctMast.DctDrlCode → DoctRoleMst.DrlCode

## ERD Fragment

DoctorCategory
    |
    | 1:N
    |
Doctor ---- N:1 ---- DoctorRole

PatientCategory
    |
Patient

## Findings

- Source contains explicit field definitions.
- Tables are generated through ADOX.
- Audit logging is implemented through *_Log tables.
- Foreign-key naming convention is consistent.
- Database can be reconstructed accurately from source code.
