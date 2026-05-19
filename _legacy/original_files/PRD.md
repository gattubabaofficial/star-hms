# HMS Web Application — Product Requirements Document
### VB6 HMSWin 1.0 → Full-Stack Web Application

**Version:** 1.0  
**Source System:** HMSWin 1.0 (Itesija, Rev 39, April 2015)  
**Target:** Cloud-ready web app with local MS Access ↔ cloud PostgreSQL sync  
**Tooling:** Claude Code + "Get Shit Done" + Ralph Loop extensions, Stitch MCP  

---

## 1. PROJECT OVERVIEW

### 1.1 Goal
Produce an exact functional replica of the HMSWin VB6 desktop application as a modern web application — preserving every form, field, business rule, and RBAC permission — while adding a **local↔cloud sync layer** so the hospital can continue using their existing MS Access `.mdb` databases locally and sync to PostgreSQL on the cloud on demand or automatically.

### 1.2 Core Principles
- **Zero data loss**: every VB6 table maps 1:1 to a PostgreSQL table with the original field names preserved as column aliases
- **Same UX flow**: Summary (list) + Detail (form) pattern on every screen, same as VB6
- **Local-first sync**: local Access DB remains the source of truth; cloud is the mirror
- **RBAC identical**: `UserMast` → `UserRightMst` permission model preserved exactly
- **Offline-capable**: app works without internet; syncs when connection is available

---

## 2. SYSTEM ARCHITECTURE

```
┌─────────────────────────────────────────────────────────────────┐
│                        CLIENT (Browser)                          │
│  React 18 + TypeScript + Vite                                   │
│  shadcn/ui + Tailwind CSS                                       │
│  AG Grid (FlexGrid replacement)                                  │
│  React Hook Form + Zod validation                               │
│  Zustand (session/company state)                                │
│  React Query (server state + cache)                             │
└──────────────────────────┬──────────────────────────────────────┘
                           │ REST / WebSocket
┌──────────────────────────▼──────────────────────────────────────┐
│                     API SERVER (Node.js)                         │
│  Express + TypeScript                                           │
│  Prisma ORM (PostgreSQL)                                        │
│  JWT auth + RBAC middleware                                     │
│  Sync Engine (local Access ↔ cloud PG)                         │
│  Bull queue (background jobs)                                   │
└────────────┬────────────────────────────┬───────────────────────┘
             │                            │
┌────────────▼───────────┐  ┌────────────▼──────────────────────┐
│  PostgreSQL (Cloud)     │  │  LOCAL SYNC AGENT                  │
│  Supabase / Neon /      │  │  Node.js daemon on hospital PC     │
│  Railway                │  │  Reads MS Access .mdb via          │
│  Primary DB             │  │  node-adodb / mdb-reader           │
│                         │  │  Pushes delta to API via REST      │
└─────────────────────────┘  │  Stitch MCP handles orchestration  │
                             └───────────────────────────────────┘
```

### 2.1 Stitch MCP Integration
Stitch MCP is used as the **data pipeline orchestrator**:
- Defines replication jobs from MS Access → PostgreSQL
- Schedules incremental syncs (every 15 min by default, configurable)
- Handles conflict resolution (local wins on write, cloud wins on read-only reports)
- Provides sync status dashboard endpoint consumed by the web app

### 2.2 Claude Code Workflow (Get Shit Done + Ralph Loop)
- **Get Shit Done extension**: used to scaffold all CRUD routes, Prisma models, and React form components from the PRD table definitions below — run once per module
- **Ralph Loop extension**: iterates on each generated component, auto-tests, and self-corrects until all Zod validations pass and API integration tests green
- Claude Code reads this PRD file as its primary instruction source

---

## 3. DATABASE SCHEMA (PostgreSQL)

### 3.1 VB6 Field Naming Convention
All original VB6 field prefixes are preserved in the DB for zero-confusion during sync:

| Prefix | Table |
|--------|-------|
| `Pcg*` | PatCatgMst (Patient Category) |
| `Dcg*` | DoctCatgMst (Doctor Category) |
| `Drl*` | DoctRoleMst (Doctor Role) |
| `Dct*` | DoctMast (Doctor) |
| `Ptt*` | PatMast (Patient) |
| `Sgp*` | ServGrpMst (Service Group) |
| `Srv*` | ServMast (Service) |
| `Bdm*` | BedMast (Bed) |
| `Wrd*` | WardMast (Ward) |
| `Flr*` | FloorMast (Floor) |
| `Opg*` | OutdReg (OPD Registration) |
| `Ihd*` | IndrHdr (IPD Header) |
| `Lhd*` | LabHdr (Lab Header) |

### 3.2 Master Tables DDL (PostgreSQL)

```sql
-- ============================================================
-- SYSTEM / AUTH
-- ============================================================
CREATE TABLE "Company" (
  "CmpCode"        SERIAL PRIMARY KEY,
  "CmpName"        VARCHAR(60)  NOT NULL,
  "CmpAddress"     VARCHAR(250),
  "CmpCity"        VARCHAR(50),
  "CmpDistrict"    VARCHAR(50),
  "CmpState"       VARCHAR(50),
  "CmpReg1"        VARCHAR(20),   -- TIN
  "CmpReg2"        VARCHAR(20),   -- PAN
  "CmpReg3"        VARCHAR(20),
  "CmpContPer"     VARCHAR(50),
  "CmpOPhone"      VARCHAR(30),
  "CmpRPhone"      VARCHAR(30),
  "CmpFax"         VARCHAR(30),
  "CmpEmail"       VARCHAR(60),
  "CmpWebsite"     VARCHAR(100),
  "CmpJurisdiction" VARCHAR(50),
  "CmpBooksDate"   DATE,
  "CmpFYStartDt"   DATE,
  "CmpFYEndDt"     DATE,
  "CmpSecPwd"      VARCHAR(60),   -- hashed
  "CmpRecState"    SMALLINT NOT NULL DEFAULT 1
);

CREATE TABLE "UserRoleMst" (
  "UrlCode"        SERIAL PRIMARY KEY,
  "UrlName"        VARCHAR(50) NOT NULL,
  "UrlRecState"    SMALLINT NOT NULL DEFAULT 1
);

CREATE TABLE "UserMast" (
  "UsrCode"        SERIAL PRIMARY KEY,
  "UsrName"        VARCHAR(50) NOT NULL,
  "UsrUrlCode"     INTEGER REFERENCES "UserRoleMst"("UrlCode"),
  "UsrPwd"         VARCHAR(120) NOT NULL,  -- bcrypt hash
  "UsrRecState"    SMALLINT NOT NULL DEFAULT 1
);

CREATE TABLE "UserRightMst" (
  "UhtCode"        SERIAL PRIMARY KEY,
  "UhtUsrCode"     INTEGER REFERENCES "UserMast"("UsrCode"),
  "UhtUrlCode"     INTEGER REFERENCES "UserRoleMst"("UrlCode"),
  "UhtSecuOptName" VARCHAR(80) NOT NULL,   -- menu option name
  "UhtCanAdd"      BOOLEAN NOT NULL DEFAULT false,
  "UhtCanEdit"     BOOLEAN NOT NULL DEFAULT false,
  "UhtCanDelete"   BOOLEAN NOT NULL DEFAULT false,
  "UhtCanView"     BOOLEAN NOT NULL DEFAULT false,
  "UhtRemark"      VARCHAR(100),
  "UhtRecState"    SMALLINT NOT NULL DEFAULT 1
);

-- ============================================================
-- HMS MASTER TABLES
-- ============================================================
CREATE TABLE "PatCatgMst" (
  "PcgCode"        SERIAL PRIMARY KEY,
  "PcgName"        VARCHAR(50) NOT NULL,
  "PcgInfAllowed"  BOOLEAN NOT NULL DEFAULT false,
  "PcgDefAllowed"  BOOLEAN NOT NULL DEFAULT false,
  "PcgDiscAllowed" BOOLEAN NOT NULL DEFAULT false,
  "PcgDiscPer"     DOUBLE PRECISION NOT NULL DEFAULT 0,
  "PcgShowInList"  BOOLEAN NOT NULL DEFAULT true,
  "PcgRecState"    SMALLINT NOT NULL DEFAULT 1
);

CREATE TABLE "DoctCatgMst" (
  "DcgCode"        SERIAL PRIMARY KEY,
  "DcgName"        VARCHAR(50) NOT NULL,
  "DcgRecState"    SMALLINT NOT NULL DEFAULT 1
);

CREATE TABLE "DoctRoleMst" (
  "DrlCode"        SERIAL PRIMARY KEY,
  "DrlName"        VARCHAR(50) NOT NULL,
  "DrlRecState"    SMALLINT NOT NULL DEFAULT 1
);

CREATE TABLE "RefCatgMst" (
  "RfgCode"        SERIAL PRIMARY KEY,
  "RfgName"        VARCHAR(50) NOT NULL,
  "RfgRecState"    SMALLINT NOT NULL DEFAULT 1
);

CREATE TABLE "DoctMast" (
  "DctCode"        SERIAL PRIMARY KEY,
  "DctTitle"       VARCHAR(5),
  "DctName"        VARCHAR(50) NOT NULL,
  "DctSpeci"       VARCHAR(50),
  "DctDcgCode"     INTEGER REFERENCES "DoctCatgMst"("DcgCode"),
  "DctDrlCode"     INTEGER REFERENCES "DoctRoleMst"("DrlCode"),
  "DctAddr"        VARCHAR(250),
  "DctTelNo"       VARCHAR(50),
  "DctEmail"       VARCHAR(50),
  "DctAhCode"      INTEGER,   -- accounting head FK (from Acnting DB)
  "DctShare"       DOUBLE PRECISION DEFAULT 0,
  "DctRecState"    SMALLINT NOT NULL DEFAULT 1
);

CREATE TABLE "RefByMast" (
  "RByCode"        SERIAL PRIMARY KEY,
  "RByName"        VARCHAR(50) NOT NULL,
  "RBySpeci"       VARCHAR(50),
  "RByRfgCode"     INTEGER REFERENCES "RefCatgMst"("RfgCode"),
  "RByAddr"        VARCHAR(250),
  "RByTelNo"       VARCHAR(50),
  "RByEmail"       VARCHAR(50),
  "RByAhCode"      INTEGER,
  "RByShare"       DOUBLE PRECISION DEFAULT 0,
  "RByRecState"    SMALLINT NOT NULL DEFAULT 1
);

CREATE TABLE "RefToMast" (
  "RToCode"        SERIAL PRIMARY KEY,
  "RToName"        VARCHAR(50) NOT NULL,
  "RToSpeci"       VARCHAR(50),
  "RToRfgCode"     INTEGER REFERENCES "RefCatgMst"("RfgCode"),
  "RToAddr"        VARCHAR(250),
  "RToTelNo"       VARCHAR(50),
  "RToEmail"       VARCHAR(50),
  "RToAhCode"      INTEGER,
  "RToShare"       DOUBLE PRECISION DEFAULT 0,
  "RToRecState"    SMALLINT NOT NULL DEFAULT 1
);

CREATE TABLE "AreaMast" (
  "AraCode"        SERIAL PRIMARY KEY,
  "AraName"        VARCHAR(50) NOT NULL,
  "AraRecState"    SMALLINT NOT NULL DEFAULT 1
);

CREATE TABLE "StsnMast" (
  "StnCode"        SERIAL PRIMARY KEY,
  "StnName"        VARCHAR(50) NOT NULL,
  "StnRecState"    SMALLINT NOT NULL DEFAULT 1
);

CREATE TABLE "DiagMast" (
  "DigCode"        SERIAL PRIMARY KEY,
  "DigName"        VARCHAR(100) NOT NULL,
  "DigRecState"    SMALLINT NOT NULL DEFAULT 1
);

CREATE TABLE "FloorMast" (
  "FlrCode"        SERIAL PRIMARY KEY,
  "FlrName"        VARCHAR(50) NOT NULL,
  "FlrShowInList"  BOOLEAN NOT NULL DEFAULT true,
  "FlrRecState"    SMALLINT NOT NULL DEFAULT 1
);

CREATE TABLE "WardMast" (
  "WrdCode"        SERIAL PRIMARY KEY,
  "WrdName"        VARCHAR(50) NOT NULL,
  "WrdRecState"    SMALLINT NOT NULL DEFAULT 1
);

CREATE TABLE "ServGrpMst" (
  "SgpCode"          SERIAL PRIMARY KEY,
  "SgpName"          VARCHAR(50) NOT NULL,
  "SgpIndex"         SMALLINT DEFAULT 0,
  "SgpExpanded"      BOOLEAN DEFAULT false,
  "SgpEditable"      BOOLEAN DEFAULT false,
  "SgpInfAllowed"    BOOLEAN DEFAULT false,
  "SgpDefAllowed"    BOOLEAN DEFAULT false,
  "SgpDiscAllowed"   BOOLEAN DEFAULT false,
  "SgpDiscPer"       DOUBLE PRECISION DEFAULT 0,
  "SgpExtRateSys"    BOOLEAN DEFAULT false,
  "SgpDctwseRateSys" BOOLEAN DEFAULT false,
  "SgpPcgwseRateSys" BOOLEAN DEFAULT false,
  "SgpRBywseRateSys" BOOLEAN DEFAULT false,
  "SgpRTowseRateSys" BOOLEAN DEFAULT false,
  "SgpTimewseRateSys" BOOLEAN DEFAULT false,
  "SgpExtDiscSys"    BOOLEAN DEFAULT false,
  "SgpDctwseDiscSys" BOOLEAN DEFAULT false,
  "SgpPcgwseDiscSys" BOOLEAN DEFAULT false,
  "SgpExtBargSys"    BOOLEAN DEFAULT false,
  "SgpExtShareSys"   BOOLEAN DEFAULT false,
  "SgpDctwseShareSys" BOOLEAN DEFAULT false,
  "SgpShowInList"    BOOLEAN DEFAULT true,
  "SgpRecState"      SMALLINT NOT NULL DEFAULT 1
);

CREATE TABLE "ServMast" (
  "SrvCode"          SERIAL PRIMARY KEY,
  "SrvName"          VARCHAR(100) NOT NULL,
  "SrvSgpCode"       INTEGER REFERENCES "ServGrpMst"("SgpCode"),
  "SrvAhCode"        INTEGER,
  "SrvCharges"       DOUBLE PRECISION DEFAULT 0,
  "SrvDiscPer"       DOUBLE PRECISION DEFAULT 0,
  "SrvIndex"         SMALLINT DEFAULT 0,
  "SrvRateEditable"  BOOLEAN DEFAULT false,
  "SrvAmtEditable"   BOOLEAN DEFAULT false,
  "SrvUnitEditable"  BOOLEAN DEFAULT false,
  "SrvMultiDct"      BOOLEAN DEFAULT false,
  "SrvShowInList"    BOOLEAN DEFAULT true,
  "SrvAutoInsIndr"   BOOLEAN DEFAULT false,
  "SrvAutoInsOnceIndr" BOOLEAN DEFAULT false,
  "SrvAutoCalcIndr"  BOOLEAN DEFAULT false,
  "SrvInfAllowed"    BOOLEAN DEFAULT false,
  "SrvDefAllowed"    BOOLEAN DEFAULT false,
  "SrvDiscAllowed"   BOOLEAN DEFAULT false,
  "SrvExtRateSys"    BOOLEAN DEFAULT false,
  "SrvExtDiscSys"    BOOLEAN DEFAULT false,
  "SrvExtShareSys"   BOOLEAN DEFAULT false,
  "SrvExtBargSys"    BOOLEAN DEFAULT false,
  "SrvRecState"      SMALLINT NOT NULL DEFAULT 1
);

CREATE TABLE "ServRateMst" (
  "SrmCode"          SERIAL PRIMARY KEY,
  "SrmSrvCode"       INTEGER REFERENCES "ServMast"("SrvCode"),
  "SrmRateType"      VARCHAR(20) NOT NULL,  -- 'DoctWise','PatCatg','RefBy','RefTo','TimeWise'
  "SrmRefCode"       INTEGER,               -- FK to DoctMast/PatCatgMst/etc based on type
  "SrmEffDate"       DATE,
  "SrmStartTime"     INTEGER,
  "SrmEndTime"       INTEGER,
  "SrmRate"          DOUBLE PRECISION DEFAULT 0,
  "SrmShare"         DOUBLE PRECISION DEFAULT 0,
  "SrmDiscPer"       DOUBLE PRECISION DEFAULT 0,
  "SrmBargPer"       DOUBLE PRECISION DEFAULT 0,
  "SrmRecState"      SMALLINT NOT NULL DEFAULT 1
);

CREATE TABLE "PatMast" (
  "PttCode"        SERIAL PRIMARY KEY,
  "PttName"        VARCHAR(60) NOT NULL,
  "PttRegNo"       INTEGER,
  "PttRegDate"     DATE,
  "PttAhCode"      INTEGER,
  "PttPcgCode"     INTEGER REFERENCES "PatCatgMst"("PcgCode"),
  "PttSex"         VARCHAR(10),
  "PttAgeAsOnDt"   DATE,
  "PttDob"         DATE,
  "PttRefRela"     VARCHAR(5),    -- S/O, D/O, W/O etc.
  "PttRefName"     VARCHAR(60),   -- care of
  "PttAddr"        VARCHAR(250),
  "PttAraCode"     INTEGER REFERENCES "AreaMast"("AraCode"),
  "PttStnCode"     INTEGER REFERENCES "StsnMast"("StnCode"),
  "PttTelNo"       VARCHAR(50),
  "PttSMSNo"       VARCHAR(50),
  "PttEmail"       VARCHAR(50),
  "PttInfAllowed"  BOOLEAN DEFAULT false,
  "PttDefAllowed"  BOOLEAN DEFAULT false,
  "PttDiscAllowed" BOOLEAN DEFAULT false,
  "PttDiscPer"     DOUBLE PRECISION DEFAULT 0,
  "PttShowInList"  BOOLEAN DEFAULT true,
  "PttRemark"      VARCHAR(50),
  "PttRecState"    SMALLINT NOT NULL DEFAULT 1
);

CREATE TABLE "BedMast" (
  "BdmCode"        SERIAL PRIMARY KEY,
  "BdmName"        VARCHAR(50) NOT NULL,
  "BdmWrdCode"     INTEGER REFERENCES "WardMast"("WrdCode"),
  "BdmFlrCode"     INTEGER REFERENCES "FloorMast"("FlrCode"),
  "BdmCharges"     DOUBLE PRECISION DEFAULT 0,
  "BdmDiscPer"     DOUBLE PRECISION DEFAULT 0,
  "BdmDiscAllowed" BOOLEAN DEFAULT false,
  "BdmSrvCode"     INTEGER REFERENCES "ServMast"("SrvCode"),
  "BdmFreeAllot"   BOOLEAN DEFAULT false,
  "BdmChkTime"     INTEGER,
  "BdmChkOutTimeBasis" VARCHAR(20),
  "BdmIndex"       SMALLINT DEFAULT 0,
  "BdmShowInList"  BOOLEAN DEFAULT true,
  "BdmRemark"      VARCHAR(50),
  "BdmRecState"    SMALLINT NOT NULL DEFAULT 1
);

-- ============================================================
-- OPD (OUTPATIENT) TRANSACTIONS
-- ============================================================
CREATE TABLE "OutdReg" (
  "OpgCode"        SERIAL PRIMARY KEY,
  "OpgVtmCode"     INTEGER,           -- Voucher type
  "OpgPrefix"      VARCHAR(10),
  "OpgVchNo"       INTEGER NOT NULL,
  "OpgPostfix"     VARCHAR(10),
  "OpgDate"        DATE NOT NULL,
  "OpgTime"        INTEGER,
  "OpgOldOpgCode"  INTEGER,           -- previous OPD ref
  "OpgCDctCode"    INTEGER REFERENCES "DoctMast"("DctCode"),
  "OpgRByCode"     INTEGER REFERENCES "RefByMast"("RByCode"),
  "OpgRToCode"     INTEGER REFERENCES "RefToMast"("RToCode"),
  "OpgPttCode"     INTEGER NOT NULL REFERENCES "PatMast"("PttCode"),
  "OpgPDigCode"    INTEGER REFERENCES "DiagMast"("DigCode"),   -- provisional diag
  "OpgFDigCode"    INTEGER REFERENCES "DiagMast"("DigCode"),   -- final diag
  "OpgSrvCode"     INTEGER REFERENCES "ServMast"("SrvCode"),
  "OpgUnit"        DOUBLE PRECISION DEFAULT 1,
  "OpgRate"        DOUBLE PRECISION DEFAULT 0,
  "OpgAmtBefDisc"  DOUBLE PRECISION DEFAULT 0,
  "OpgDiscPer"     DOUBLE PRECISION DEFAULT 0,
  "OpgDiscAmt"     DOUBLE PRECISION DEFAULT 0,
  "OpgAmtAftDisc"  DOUBLE PRECISION DEFAULT 0,
  "OpgRfugAmt"     DOUBLE PRECISION DEFAULT 0,
  "OpgRemark"      VARCHAR(50),
  "OpgRecState"    SMALLINT NOT NULL DEFAULT 1,
  "OpgCmpCode"     SMALLINT NOT NULL DEFAULT 1
);

CREATE TABLE "OutdHdr" (
  "OhdCode"        SERIAL PRIMARY KEY,
  "OhdVtmCode"     INTEGER,
  "OhdPrefix"      VARCHAR(10),
  "OhdVchNo"       INTEGER NOT NULL,
  "OhdDate"        DATE NOT NULL,
  "OhdTime"        INTEGER,
  "OhdPttCode"     INTEGER NOT NULL REFERENCES "PatMast"("PttCode"),
  "OhdCDctCode"    INTEGER REFERENCES "DoctMast"("DctCode"),
  "OhdRByCode"     INTEGER REFERENCES "RefByMast"("RByCode"),
  "OhdBillType"    VARCHAR(20),
  "OhdDiscPer"     DOUBLE PRECISION DEFAULT 0,
  "OhdDiscAmt"     DOUBLE PRECISION DEFAULT 0,
  "OhdTotalAmt"    DOUBLE PRECISION DEFAULT 0,
  "OhdDepAmt"      DOUBLE PRECISION DEFAULT 0,
  "OhdRfugAmt"     DOUBLE PRECISION DEFAULT 0,
  "OhdBalAmt"      DOUBLE PRECISION DEFAULT 0,
  "OhdRemark"      VARCHAR(50),
  "OhdVoidFlag"    BOOLEAN DEFAULT false,
  "OhdRecState"    SMALLINT NOT NULL DEFAULT 1,
  "OhdCmpCode"     SMALLINT NOT NULL DEFAULT 1
);

CREATE TABLE "OutdBill" (
  "ObdCode"        SERIAL PRIMARY KEY,
  "ObdOhdCode"     INTEGER NOT NULL REFERENCES "OutdHdr"("OhdCode"),
  "ObdSrvCode"     INTEGER REFERENCES "ServMast"("SrvCode"),
  "ObdSno"         SMALLINT,
  "ObdUnit"        DOUBLE PRECISION DEFAULT 1,
  "ObdRate"        DOUBLE PRECISION DEFAULT 0,
  "ObdAmtBefDisc"  DOUBLE PRECISION DEFAULT 0,
  "ObdDiscPer"     DOUBLE PRECISION DEFAULT 0,
  "ObdDiscAmt"     DOUBLE PRECISION DEFAULT 0,
  "ObdAmtAftDisc"  DOUBLE PRECISION DEFAULT 0,
  "ObdRecState"    SMALLINT NOT NULL DEFAULT 1
);

CREATE TABLE "OutdBlDctDtl" (
  "OddCode"        SERIAL PRIMARY KEY,
  "OddOhdCode"     INTEGER NOT NULL REFERENCES "OutdHdr"("OhdCode"),
  "OddDctCode"     INTEGER REFERENCES "DoctMast"("DctCode"),
  "OddSharePer"    DOUBLE PRECISION DEFAULT 0,
  "OddShareAmt"    DOUBLE PRECISION DEFAULT 0,
  "OddRecState"    SMALLINT NOT NULL DEFAULT 1
);

CREATE TABLE "OutdBlPymtHdr" (
  "ObpCode"        SERIAL PRIMARY KEY,
  "ObpOhdCode"     INTEGER REFERENCES "OutdHdr"("OhdCode"),
  "ObpDate"        DATE NOT NULL,
  "ObpAmt"         DOUBLE PRECISION DEFAULT 0,
  "ObpRecState"    SMALLINT NOT NULL DEFAULT 1
);

CREATE TABLE "OutdBlRefdHdr" (
  "ObrCode"        SERIAL PRIMARY KEY,
  "ObrOhdCode"     INTEGER REFERENCES "OutdHdr"("OhdCode"),
  "ObrDate"        DATE NOT NULL,
  "ObrAmt"         DOUBLE PRECISION DEFAULT 0,
  "ObrRecState"    SMALLINT NOT NULL DEFAULT 1
);

CREATE TABLE "OutdRcpt" (
  "OrcCode"        SERIAL PRIMARY KEY,
  "OrcVtmCode"     INTEGER,
  "OrcPrefix"      VARCHAR(10),
  "OrcVchNo"       INTEGER NOT NULL,
  "OrcDate"        DATE NOT NULL,
  "OrcTime"        INTEGER,
  "OrcPttCode"     INTEGER NOT NULL REFERENCES "PatMast"("PttCode"),
  "OrcCDctCode"    INTEGER REFERENCES "DoctMast"("DctCode"),
  "OrcRByCode"     INTEGER REFERENCES "RefByMast"("RByCode"),
  "OrcReceiptType" VARCHAR(20),
  "OrcDiscPer"     DOUBLE PRECISION DEFAULT 0,
  "OrcTotalAmt"    DOUBLE PRECISION DEFAULT 0,
  "OrcRecvdAmt"    DOUBLE PRECISION DEFAULT 0,
  "OrcRfugAmt"     DOUBLE PRECISION DEFAULT 0,
  "OrcBalAmt"      DOUBLE PRECISION DEFAULT 0,
  "OrcAdvAmt"      DOUBLE PRECISION DEFAULT 0,
  "OrcRemark"      VARCHAR(50),
  "OrcVoidFlag"    BOOLEAN DEFAULT false,
  "OrcRecState"    SMALLINT NOT NULL DEFAULT 1,
  "OrcCmpCode"     SMALLINT NOT NULL DEFAULT 1
);

CREATE TABLE "OutdRcDctDtl" (
  "OrdCode"        SERIAL PRIMARY KEY,
  "OrdOrcCode"     INTEGER NOT NULL REFERENCES "OutdRcpt"("OrcCode"),
  "OrdDctCode"     INTEGER REFERENCES "DoctMast"("DctCode"),
  "OrdSharePer"    DOUBLE PRECISION DEFAULT 0,
  "OrdRecState"    SMALLINT NOT NULL DEFAULT 1
);

CREATE TABLE "OutdPymtHdr" (
  "OphCode"        SERIAL PRIMARY KEY,
  "OphOrcCode"     INTEGER REFERENCES "OutdRcpt"("OrcCode"),
  "OphDate"        DATE NOT NULL,
  "OphAmt"         DOUBLE PRECISION DEFAULT 0,
  "OphRecState"    SMALLINT NOT NULL DEFAULT 1
);

CREATE TABLE "OutdRefdHdr" (
  "OrhCode"        SERIAL PRIMARY KEY,
  "OrhOrcCode"     INTEGER REFERENCES "OutdRcpt"("OrcCode"),
  "OrhDate"        DATE NOT NULL,
  "OrhAmt"         DOUBLE PRECISION DEFAULT 0,
  "OrhRecState"    SMALLINT NOT NULL DEFAULT 1
);

CREATE TABLE "OutdRgRefd" (
  "OrrCode"        SERIAL PRIMARY KEY,
  "OrrOpgCode"     INTEGER REFERENCES "OutdReg"("OpgCode"),
  "OrrDate"        DATE NOT NULL,
  "OrrAmt"         DOUBLE PRECISION DEFAULT 0,
  "OrrRecState"    SMALLINT NOT NULL DEFAULT 1
);

-- ============================================================
-- IPD (INPATIENT) TRANSACTIONS
-- ============================================================
CREATE TABLE "IndrHdr" (
  "IhdCode"        SERIAL PRIMARY KEY,
  "IhdVtmCode"     INTEGER,
  "IhdPrefix"      VARCHAR(10),
  "IhdVchNo"       INTEGER NOT NULL,
  "IhdDate"        DATE NOT NULL,
  "IhdTime"        INTEGER,
  "IhdPttCode"     INTEGER NOT NULL REFERENCES "PatMast"("PttCode"),
  "IhdCDctCode"    INTEGER REFERENCES "DoctMast"("DctCode"),
  "IhdRByCode"     INTEGER REFERENCES "RefByMast"("RByCode"),
  "IhdWrdCode"     INTEGER REFERENCES "WardMast"("WrdCode"),
  "IhdBedCode"     INTEGER REFERENCES "BedMast"("BdmCode"),
  "IhdFlrCode"     INTEGER REFERENCES "FloorMast"("FlrCode"),
  "IhdAdvAmt"      DOUBLE PRECISION DEFAULT 0,
  "IhdDischDate"   DATE,
  "IhdDischTime"   INTEGER,
  "IhdPDigCode"    INTEGER REFERENCES "DiagMast"("DigCode"),
  "IhdFDigCode"    INTEGER REFERENCES "DiagMast"("DigCode"),
  "IhdStatus"      VARCHAR(20) DEFAULT 'Admitted',
  "IhdRemark"      VARCHAR(50),
  "IhdVoidFlag"    BOOLEAN DEFAULT false,
  "IhdRecState"    SMALLINT NOT NULL DEFAULT 1,
  "IhdCmpCode"     SMALLINT NOT NULL DEFAULT 1
);

CREATE TABLE "IBedState" (
  "IbbsCode"       SERIAL PRIMARY KEY,
  "IbbsICode"      INTEGER NOT NULL REFERENCES "IndrHdr"("IhdCode"),
  "IbbsIbsCode"    INTEGER REFERENCES "BedMast"("BdmCode"),
  "IbbsFromDate"   DATE,
  "IbbsFromTime"   INTEGER,
  "IbbsToDate"     DATE,
  "IbbsToTime"     INTEGER,
  "IbbsUnit"       DOUBLE PRECISION DEFAULT 1,
  "IbbsIblICode"   INTEGER,       -- linked to IPD bill
  "IbbsIpgCode"    INTEGER,
  "IbbsSno"        SMALLINT,
  "IbbsTrnCode"    INTEGER,
  "IbbsRemark"     VARCHAR(50),
  "IbbsRecState"   SMALLINT NOT NULL DEFAULT 1
);

CREATE TABLE "IndrBlHdr" (
  "IbhCode"        SERIAL PRIMARY KEY,
  "IbhVtmCode"     INTEGER,
  "IbhPrefix"      VARCHAR(10),
  "IbhVchNo"       INTEGER NOT NULL,
  "IbhDate"        DATE NOT NULL,
  "IbhIhdCode"     INTEGER NOT NULL REFERENCES "IndrHdr"("IhdCode"),
  "IbhPttCode"     INTEGER NOT NULL REFERENCES "PatMast"("PttCode"),
  "IbhBillType"    VARCHAR(20),
  "IbhDiscPer"     DOUBLE PRECISION DEFAULT 0,
  "IbhTotalAmt"    DOUBLE PRECISION DEFAULT 0,
  "IbhDepAmt"      DOUBLE PRECISION DEFAULT 0,
  "IbhRfugAmt"     DOUBLE PRECISION DEFAULT 0,
  "IbhBalAmt"      DOUBLE PRECISION DEFAULT 0,
  "IbhStatus"      VARCHAR(20),
  "IbhDischDate"   DATE,
  "IbhRemark"      VARCHAR(50),
  "IbhVoidFlag"    BOOLEAN DEFAULT false,
  "IbhRecState"    SMALLINT NOT NULL DEFAULT 1,
  "IbhCmpCode"     SMALLINT NOT NULL DEFAULT 1
);

CREATE TABLE "IndrBill" (
  "IbdCode"        SERIAL PRIMARY KEY,
  "IbdIbhCode"     INTEGER NOT NULL REFERENCES "IndrBlHdr"("IbhCode"),
  "IbdSrvCode"     INTEGER REFERENCES "ServMast"("SrvCode"),
  "IbdSno"         SMALLINT,
  "IbdUnit"        DOUBLE PRECISION DEFAULT 1,
  "IbdRate"        DOUBLE PRECISION DEFAULT 0,
  "IbdAmtBefDisc"  DOUBLE PRECISION DEFAULT 0,
  "IbdDiscPer"     DOUBLE PRECISION DEFAULT 0,
  "IbdDiscAmt"     DOUBLE PRECISION DEFAULT 0,
  "IbdAmtAftDisc"  DOUBLE PRECISION DEFAULT 0,
  "IbdRecState"    SMALLINT NOT NULL DEFAULT 1
);

CREATE TABLE "IndrBlDctDtl" (
  "IddCode"        SERIAL PRIMARY KEY,
  "IddIbhCode"     INTEGER NOT NULL REFERENCES "IndrBlHdr"("IbhCode"),
  "IddDctCode"     INTEGER REFERENCES "DoctMast"("DctCode"),
  "IddSharePer"    DOUBLE PRECISION DEFAULT 0,
  "IddShareAmt"    DOUBLE PRECISION DEFAULT 0,
  "IddRecState"    SMALLINT NOT NULL DEFAULT 1
);

CREATE TABLE "IndrBlDpogDtl" (
  "IpdCode"        SERIAL PRIMARY KEY,
  "IpdIbhCode"     INTEGER REFERENCES "IndrBlHdr"("IbhCode"),
  "IpdAmt"         DOUBLE PRECISION DEFAULT 0,
  "IpdDate"        DATE,
  "IpdRecState"    SMALLINT NOT NULL DEFAULT 1
);

CREATE TABLE "IndrBlRfugDtl" (
  "IrdCode"        SERIAL PRIMARY KEY,
  "IrdIbhCode"     INTEGER REFERENCES "IndrBlHdr"("IbhCode"),
  "IrdAmt"         DOUBLE PRECISION DEFAULT 0,
  "IrdDate"        DATE,
  "IrdRecState"    SMALLINT NOT NULL DEFAULT 1
);

CREATE TABLE "IndrReg" (
  "IrgCode"        SERIAL PRIMARY KEY,
  "IrgIhdCode"     INTEGER NOT NULL REFERENCES "IndrHdr"("IhdCode"),
  "IrgDate"        DATE NOT NULL,
  "IrgAmt"         DOUBLE PRECISION DEFAULT 0,
  "IrgType"        VARCHAR(20),
  "IrgRecState"    SMALLINT NOT NULL DEFAULT 1
);

CREATE TABLE "IndrRgPymt" (
  "IrpCode"        SERIAL PRIMARY KEY,
  "IrpIrgCode"     INTEGER REFERENCES "IndrReg"("IrgCode"),
  "IrpDate"        DATE NOT NULL,
  "IrpAmt"         DOUBLE PRECISION DEFAULT 0,
  "IrpRecState"    SMALLINT NOT NULL DEFAULT 1
);

CREATE TABLE "IndrRgRefd" (
  "IrrCode"        SERIAL PRIMARY KEY,
  "IrrIrgCode"     INTEGER REFERENCES "IndrReg"("IrgCode"),
  "IrrDate"        DATE NOT NULL,
  "IrrAmt"         DOUBLE PRECISION DEFAULT 0,
  "IrrRecState"    SMALLINT NOT NULL DEFAULT 1
);

-- ============================================================
-- LAB TRANSACTIONS
-- ============================================================
CREATE TABLE "LabHdr" (
  "LhdCode"        SERIAL PRIMARY KEY,
  "LhdVtmCode"     INTEGER,
  "LhdPrefix"      VARCHAR(10),
  "LhdVchNo"       INTEGER NOT NULL,
  "LhdDate"        DATE NOT NULL,
  "LhdTime"        INTEGER,
  "LhdPttCode"     INTEGER NOT NULL REFERENCES "PatMast"("PttCode"),
  "LhdCDctCode"    INTEGER REFERENCES "DoctMast"("DctCode"),
  "LhdRByCode"     INTEGER REFERENCES "RefByMast"("RByCode"),
  "LhdReceiptType" VARCHAR(20),
  "LhdDiscPer"     DOUBLE PRECISION DEFAULT 0,
  "LhdTotalAmt"    DOUBLE PRECISION DEFAULT 0,
  "LhdRecvdAmt"    DOUBLE PRECISION DEFAULT 0,
  "LhdRfugAmt"     DOUBLE PRECISION DEFAULT 0,
  "LhdBalAmt"      DOUBLE PRECISION DEFAULT 0,
  "LhdAdvAmt"      DOUBLE PRECISION DEFAULT 0,
  "LhdRemark"      VARCHAR(50),
  "LhdVoidFlag"    BOOLEAN DEFAULT false,
  "LhdRecState"    SMALLINT NOT NULL DEFAULT 1,
  "LhdCmpCode"     SMALLINT NOT NULL DEFAULT 1
);

CREATE TABLE "LabRcpt" (
  "LrdCode"        SERIAL PRIMARY KEY,
  "LrdLhdCode"     INTEGER NOT NULL REFERENCES "LabHdr"("LhdCode"),
  "LrdSrvCode"     INTEGER REFERENCES "ServMast"("SrvCode"),
  "LrdSno"         SMALLINT,
  "LrdUnit"        DOUBLE PRECISION DEFAULT 1,
  "LrdRate"        DOUBLE PRECISION DEFAULT 0,
  "LrdAmtBefDisc"  DOUBLE PRECISION DEFAULT 0,
  "LrdDiscPer"     DOUBLE PRECISION DEFAULT 0,
  "LrdDiscAmt"     DOUBLE PRECISION DEFAULT 0,
  "LrdAmtAftDisc"  DOUBLE PRECISION DEFAULT 0,
  "LrdRecState"    SMALLINT NOT NULL DEFAULT 1
);

CREATE TABLE "LabRcDctDtl" (
  "LddCode"        SERIAL PRIMARY KEY,
  "LddLhdCode"     INTEGER NOT NULL REFERENCES "LabHdr"("LhdCode"),
  "LddDctCode"     INTEGER REFERENCES "DoctMast"("DctCode"),
  "LddSharePer"    DOUBLE PRECISION DEFAULT 0,
  "LddRecState"    SMALLINT NOT NULL DEFAULT 1
);

CREATE TABLE "LabPymtHdr" (
  "LphCode"        SERIAL PRIMARY KEY,
  "LphLhdCode"     INTEGER REFERENCES "LabHdr"("LhdCode"),
  "LphDate"        DATE NOT NULL,
  "LphAmt"         DOUBLE PRECISION DEFAULT 0,
  "LphRecState"    SMALLINT NOT NULL DEFAULT 1
);

CREATE TABLE "LabRefdHdr" (
  "LrhCode"        SERIAL PRIMARY KEY,
  "LrhLhdCode"     INTEGER REFERENCES "LabHdr"("LhdCode"),
  "LrhDate"        DATE NOT NULL,
  "LrhAmt"         DOUBLE PRECISION DEFAULT 0,
  "LrhRecState"    SMALLINT NOT NULL DEFAULT 1
);

-- ============================================================
-- PHARMACY (MDS) TABLES
-- ============================================================
CREATE TABLE "SubItmGrpMst" (
  "SigCode"        SERIAL PRIMARY KEY,
  "SigName"        VARCHAR(50) NOT NULL,
  "SigRecState"    SMALLINT NOT NULL DEFAULT 1
);

CREATE TABLE "SubItmMast" (
  "SimCode"        SERIAL PRIMARY KEY,
  "SimName"        VARCHAR(100) NOT NULL,
  "SimSigCode"     INTEGER REFERENCES "SubItmGrpMst"("SigCode"),
  "SimRecState"    SMALLINT NOT NULL DEFAULT 1
);

CREATE TABLE "PartyGrpMst" (
  "PgpCode"        SERIAL PRIMARY KEY,
  "PgpName"        VARCHAR(50) NOT NULL,
  "PgpRecState"    SMALLINT NOT NULL DEFAULT 1
);

CREATE TABLE "PartyMast" (
  "PtyCode"        SERIAL PRIMARY KEY,
  "PtyName"        VARCHAR(100) NOT NULL,
  "PtyAddr"        VARCHAR(250),
  "PtyAraCode"     INTEGER REFERENCES "AreaMast"("AraCode"),
  "PtyTelNo"       VARCHAR(50),
  "PtySMSNo"       VARCHAR(50),
  "PtyPgpCode"     INTEGER REFERENCES "PartyGrpMst"("PgpCode"),
  "PtyRecState"    SMALLINT NOT NULL DEFAULT 1
);

CREATE TABLE "IndrStk" (
  "IskCode"        SERIAL PRIMARY KEY,
  "IskVtmCode"     INTEGER,
  "IskVchNo"       INTEGER NOT NULL,
  "IskDate"        DATE NOT NULL,
  "IskPtyCode"     INTEGER REFERENCES "PartyMast"("PtyCode"),
  "IskRefNo"       VARCHAR(30),
  "IskRefDate"     DATE,
  "IskNetAmt"      DOUBLE PRECISION DEFAULT 0,
  "IskOtherChg"    DOUBLE PRECISION DEFAULT 0,
  "IskRoundOff"    DOUBLE PRECISION DEFAULT 0,
  "IskTax"         DOUBLE PRECISION DEFAULT 0,
  "IskRemark"      VARCHAR(50),
  "IskRecState"    SMALLINT NOT NULL DEFAULT 1
);

CREATE TABLE "IndrStkDtl" (
  "IsdCode"        SERIAL PRIMARY KEY,
  "IsdIskCode"     INTEGER NOT NULL REFERENCES "IndrStk"("IskCode"),
  "IsdSimCode"     INTEGER REFERENCES "SubItmMast"("SimCode"),
  "IsdSno"         SMALLINT,
  "IsdQty"         DOUBLE PRECISION DEFAULT 0,
  "IsdRate"        DOUBLE PRECISION DEFAULT 0,
  "IsdDiscPer"     DOUBLE PRECISION DEFAULT 0,
  "IsdDiscAmt"     DOUBLE PRECISION DEFAULT 0,
  "IsdTaxPer"      DOUBLE PRECISION DEFAULT 0,
  "IsdTaxAmt"      DOUBLE PRECISION DEFAULT 0,
  "IsdAmt"         DOUBLE PRECISION DEFAULT 0,
  "IsdRecState"    SMALLINT NOT NULL DEFAULT 1
);

CREATE TABLE "OutdStk" (
  "OskCode"        SERIAL PRIMARY KEY,
  "OskVtmCode"     INTEGER,
  "OskVchNo"       INTEGER NOT NULL,
  "OskDate"        DATE NOT NULL,
  "OskPtyCode"     INTEGER REFERENCES "PartyMast"("PtyCode"),
  "OskRefNo"       VARCHAR(30),
  "OskNetAmt"      DOUBLE PRECISION DEFAULT 0,
  "OskOtherChg"    DOUBLE PRECISION DEFAULT 0,
  "OskRoundOff"    DOUBLE PRECISION DEFAULT 0,
  "OskTax"         DOUBLE PRECISION DEFAULT 0,
  "OskRemark"      VARCHAR(50),
  "OskRecState"    SMALLINT NOT NULL DEFAULT 1
);

CREATE TABLE "OutdStkDtl" (
  "OsdCode"        SERIAL PRIMARY KEY,
  "OsdOskCode"     INTEGER NOT NULL REFERENCES "OutdStk"("OskCode"),
  "OsdSimCode"     INTEGER REFERENCES "SubItmMast"("SimCode"),
  "OsdSno"         SMALLINT,
  "OsdQty"         DOUBLE PRECISION DEFAULT 0,
  "OsdRate"        DOUBLE PRECISION DEFAULT 0,
  "OsdDiscPer"     DOUBLE PRECISION DEFAULT 0,
  "OsdDiscAmt"     DOUBLE PRECISION DEFAULT 0,
  "OsdTaxPer"      DOUBLE PRECISION DEFAULT 0,
  "OsdTaxAmt"      DOUBLE PRECISION DEFAULT 0,
  "OsdAmt"         DOUBLE PRECISION DEFAULT 0,
  "OsdRecState"    SMALLINT NOT NULL DEFAULT 1
);

-- ============================================================
-- SYNC TRACKING
-- ============================================================
CREATE TABLE "SyncLog" (
  "id"             SERIAL PRIMARY KEY,
  "table_name"     VARCHAR(60) NOT NULL,
  "record_id"      INTEGER NOT NULL,
  "operation"      VARCHAR(10) NOT NULL,  -- INSERT/UPDATE/DELETE
  "synced_at"      TIMESTAMPTZ DEFAULT NOW(),
  "source"         VARCHAR(20) DEFAULT 'local', -- 'local' or 'cloud'
  "checksum"       VARCHAR(64)
);

CREATE TABLE "SyncConfig" (
  "id"             SERIAL PRIMARY KEY,
  "key"            VARCHAR(60) UNIQUE NOT NULL,
  "value"          TEXT,
  "updated_at"     TIMESTAMPTZ DEFAULT NOW()
);
```

---

## 4. PROJECT FILE STRUCTURE

```
hms-web/
├── README.md
├── package.json                    # monorepo root
├── pnpm-workspace.yaml
│
├── apps/
│   ├── web/                        # React frontend
│   │   ├── src/
│   │   │   ├── main.tsx
│   │   │   ├── App.tsx
│   │   │   ├── router.tsx          # React Router v6
│   │   │   ├── store/
│   │   │   │   ├── session.ts      # Zustand: company + user session
│   │   │   │   └── sync.ts         # Zustand: sync status
│   │   │   ├── lib/
│   │   │   │   ├── api.ts          # Axios instance + interceptors
│   │   │   │   ├── auth.ts         # JWT helpers
│   │   │   │   └── utils.ts        # date, number formatters
│   │   │   ├── components/
│   │   │   │   ├── layout/
│   │   │   │   │   ├── AppShell.tsx      # statusbar + sidebar + content
│   │   │   │   │   ├── StatusBar.tsx     # Company|FY|User|Role|Date|Time
│   │   │   │   │   ├── Sidebar.tsx       # menu matching MyMenu.frm
│   │   │   │   │   └── FormMode.tsx      # New/Edit/Delete/View select
│   │   │   │   ├── shared/
│   │   │   │   │   ├── SummaryDetailLayout.tsx  # universal Summary+Detail tabs
│   │   │   │   │   ├── DataGrid.tsx             # AG Grid wrapper
│   │   │   │   │   ├── LookupField.tsx           # combobox with search
│   │   │   │   │   ├── PrintDialog.tsx           # print/PDF/Excel dialog
│   │   │   │   │   └── SyncBadge.tsx             # local↔cloud sync indicator
│   │   │   ├── modules/
│   │   │   │   ├── auth/
│   │   │   │   │   ├── LoginPage.tsx
│   │   │   │   │   └── CompanySelect.tsx
│   │   │   │   ├── masters/
│   │   │   │   │   ├── patient/
│   │   │   │   │   │   ├── PatientMaster.tsx      # PatMast.frm
│   │   │   │   │   │   └── patientSchema.ts       # Zod validation
│   │   │   │   │   ├── doctor/
│   │   │   │   │   │   └── DoctorMaster.tsx
│   │   │   │   │   ├── service/
│   │   │   │   │   │   ├── ServiceMaster.tsx
│   │   │   │   │   │   └── ServiceRateGrid.tsx    # extended rate system
│   │   │   │   │   ├── bed/
│   │   │   │   │   │   ├── BedMaster.tsx
│   │   │   │   │   │   ├── WardMaster.tsx
│   │   │   │   │   │   └── FloorMaster.tsx
│   │   │   │   │   ├── simple/                    # DoctCatg, DoctRole, PatCatg etc.
│   │   │   │   │   │   └── SimpleMaster.tsx       # generic reusable for 1-field masters
│   │   │   │   ├── opd/
│   │   │   │   │   ├── OpdRegistration.tsx        # OutdReg
│   │   │   │   │   ├── OpdBill.tsx                # OutdHdr + OutdBill
│   │   │   │   │   ├── OpdReceipt.tsx             # OutdRcpt
│   │   │   │   │   ├── OpdPayment.tsx
│   │   │   │   │   ├── OpdRefund.tsx
│   │   │   │   │   └── OpdRegRefund.tsx
│   │   │   │   ├── ipd/
│   │   │   │   │   ├── IpdRegistration.tsx        # IndrHdr
│   │   │   │   │   ├── IpdBedStatus.tsx           # IBedState live view
│   │   │   │   │   ├── IpdBill.tsx                # IndrBlHdr + IndrBill
│   │   │   │   │   ├── IpdReceipt.tsx
│   │   │   │   │   ├── IpdPayment.tsx
│   │   │   │   │   └── IpdRefund.tsx
│   │   │   │   ├── lab/
│   │   │   │   │   ├── LabReceipt.tsx             # LabHdr + LabRcpt
│   │   │   │   │   ├── LabPayment.tsx
│   │   │   │   │   └── LabRefund.tsx
│   │   │   │   ├── pharmacy/
│   │   │   │   │   ├── MedicinePurchase.tsx       # IndrStk
│   │   │   │   │   ├── MedicineSale.tsx           # OutdStk
│   │   │   │   │   ├── StockRegister.tsx
│   │   │   │   │   ├── PartyMaster.tsx
│   │   │   │   │   └── ItemMaster.tsx
│   │   │   │   ├── reports/
│   │   │   │   │   ├── CollectionReport.tsx       # CollView.frm
│   │   │   │   │   ├── ServiceReport.tsx          # ServView.frm
│   │   │   │   │   └── BedStatusReport.tsx
│   │   │   │   └── system/
│   │   │   │       ├── UserMaster.tsx
│   │   │   │       ├── UserRights.tsx
│   │   │   │       ├── CompanyMaster.tsx
│   │   │   │       ├── BackupUtil.tsx
│   │   │   │       └── SyncDashboard.tsx          # NEW: local↔cloud sync UI
│   │   ├── public/
│   │   ├── index.html
│   │   └── vite.config.ts
│   │
│   └── sync-agent/                 # LOCAL DAEMON (runs on hospital PC)
│       ├── src/
│       │   ├── index.ts            # main process
│       │   ├── access-reader.ts    # reads MS Access .mdb via node-adodb
│       │   ├── delta-tracker.ts    # detects changed records using RecState + timestamps
│       │   ├── push-client.ts      # HTTP client → API server
│       │   └── scheduler.ts        # cron-style scheduler
│       ├── config.json             # { mdbPath, apiUrl, apiKey, syncInterval }
│       └── package.json
│
├── packages/
│   └── api/                        # Express API server
│       ├── src/
│       │   ├── index.ts
│       │   ├── prisma/
│       │   │   ├── schema.prisma   # mirrors all tables above
│       │   │   └── migrations/
│       │   ├── middleware/
│       │   │   ├── auth.ts         # JWT verify
│       │   │   └── rbac.ts         # checks UserRightMst per route
│       │   ├── routes/
│       │   │   ├── auth.ts
│       │   │   ├── masters/        # one file per master
│       │   │   ├── opd/
│       │   │   ├── ipd/
│       │   │   ├── lab/
│       │   │   ├── pharmacy/
│       │   │   ├── reports/
│       │   │   └── sync/           # sync push endpoint
│       │   ├── services/
│       │   │   ├── pricing.ts      # ServRateMst lookup logic
│       │   │   ├── billing.ts      # bill generation & balance calc
│       │   │   └── sync.ts         # delta merge + conflict resolution
│       │   └── utils/
│       │       ├── vchno.ts        # voucher number generator
│       │       └── recstate.ts     # soft-delete helpers
│       └── package.json
│
└── .github/
    └── workflows/
        ├── deploy-api.yml          # auto-deploy to Railway/Render
        └── deploy-web.yml          # auto-deploy to Vercel/Netlify
```

---

## 5. LOCAL ↔ CLOUD SYNC DESIGN

### 5.1 How It Works
```
MS Access .mdb (local PC)
        │
        │  sync-agent reads every N minutes
        │  tracks: RecState field + last_sync_time
        ▼
sync-agent/delta-tracker.ts
        │  computes changed rows (INSERT/UPDATE/VOID)
        │
        ▼
POST /api/sync/push  { table, records[] }
        │
        ▼
API sync.service.ts
        │  upserts records into PostgreSQL
        │  logs to SyncLog table
        │  returns { accepted, conflicts }
        ▼
PostgreSQL (cloud) — always mirrors local
```

### 5.2 Config File (sync-agent/config.json)
```json
{
  "mdbPath": "C:\\HmsData\\Company001.mdb",
  "apiUrl": "https://your-hospital.railway.app",
  "apiKey": "sync-secret-key",
  "syncIntervalMinutes": 15,
  "tables": [
    "PatMast", "DoctMast", "ServMast", "BedMast",
    "OutdReg", "OutdHdr", "OutdBill", "OutdBlDctDtl",
    "OutdRcpt", "IndrHdr", "IBedState", "IndrBlHdr",
    "IndrBill", "LabHdr", "LabRcpt",
    "IndrStk", "OutdStk"
  ],
  "conflictStrategy": "local-wins"
}
```

### 5.3 RecState Values (from VB6 source)
| Value | Meaning |
|-------|---------|
| 1 | Active |
| 0 | Deleted / Voided |
| -1 | Null/Empty |

The sync agent uses `RecState = 0` as soft-delete signal.

---

## 6. AUTHENTICATION & RBAC

### 6.1 Login Flow
1. POST `/api/auth/login` → `{ username, password, companyCode }`
2. Server checks `UserMast` (bcrypt compare)
3. Returns JWT containing `{ usrCode, usrName, urlCode, urlName, cmpCode }`
4. JWT stored in httpOnly cookie

### 6.2 Permission Check (mirrors VB6 `GetUserOptRightStr`)
```typescript
// middleware/rbac.ts
export function requireRight(menuOptName: string, right: 'View'|'Add'|'Edit'|'Delete') {
  return async (req, res, next) => {
    const { usrCode, urlCode } = req.user;
    // First check user-specific right, then role-level right
    const right = await prisma.userRightMst.findFirst({
      where: {
        OR: [
          { UhtUsrCode: usrCode, UhtSecuOptName: { in: ['*', menuOptName] } },
          { UhtUrlCode: urlCode, UhtSecuOptName: { in: ['*', menuOptName] } }
        ]
      }
    });
    if (!right || !right[`UhtCan${right}`]) return res.status(403).json({ error: 'Access denied' });
    next();
  };
}
```

### 6.3 Menu Option Names (exact strings from VB6)
These strings must match exactly for RBAC to work:
- `"OPD Registration"`, `"OPD Bill"`, `"OPD Receipt"`, `"OPD Payment"`, `"OPD Refund"`
- `"IPD Registration"`, `"IPD Bill"`, `"IPD Receipt"`, `"IPD Payment"`, `"IPD Refund"`, `"Bed Status"`
- `"LAB Receipt"`, `"LAB Payment"`, `"LAB Refund"`
- `"Patient Master"`, `"Doctor Master"`, `"Service Master"`, `"Bed Master"`
- `"User Master"`, `"User Rights Master"`, `"Company Information"`
- `"Collection Report"`, `"Service/Bill Report"`
- `"Medical Store"`, `"Take Backup"`

---

## 7. BUSINESS RULES (from VB6 source)

### 7.1 Service Pricing Resolution (pricing.ts)
```
Priority order for rate lookup:
1. Time-wise rate (if current time falls in SrmStartTime–SrmEndTime)
2. Doctor-wise rate (if consulting doctor has a specific rate)
3. Patient Category-wise rate (if patient category has a specific rate)
4. RefBy-wise rate (if referring doctor has a specific rate)
5. RefTo-wise rate (if referred-to doctor has a specific rate)
6. Default service rate (ServMast.SrvCharges)

Discount resolution (same priority order using ServRateMst.SrmDiscPer):
1. Check if service allows discount (SrvDiscAllowed)
2. Check patient category discount (PatMast.PttDiscAllowed → PttDiscPer)
3. Check service group discount (SgpDiscAllowed → SgpDiscPer)
4. Use resolved discount from ServRateMst if extended system is on

Bargain = manual override, only if SrvDefAllowed = true
Increment = AmtAftDisc * (1 + InfPer/100), only if InfAllowed = true
```

### 7.2 Voucher Number Generation (vchno.ts)
- Each transaction type has its own sequence per VoucherType (VTypMast)
- Format: `[Prefix][VchNo][Postfix]` e.g., `OPD-0001` or `IPD001`
- Voucher numbers are company-specific (OpgCmpCode field)

### 7.3 Balance Calculation
```
OPD Bill Balance   = TotalAmt - DepositedAmt - RefundedAmt
IPD Bill Balance   = TotalAmt - AdvanceAdj - BillDeposits - BillRefunds + OnAccPayAdj
Lab Balance        = TotalAmt - ReceivedAmt - RefundedAmt
```

### 7.4 Soft Delete
- All deletes set `RecState = 0` (VoidFlag = true for transaction headers)
- Records are never physically deleted
- All queries filter `WHERE RecState > 0` (or `RecState = 1`)

---

## 8. COMPONENT PATTERNS

### 8.1 SummaryDetailLayout (universal for all screens)
```tsx
// Matches VB6 tab pattern: Summary (list) ↔ Detail (form)
<SummaryDetailLayout
  summaryColumns={[...]}       // AG Grid column defs
  summaryData={records}
  onRowSelect={(row) => loadDetail(row)}
  detailForm={<PatientDetailForm />}
  formMode={formMode}          // 'New' | 'Edit' | 'Delete' | 'View'
  onModeChange={setFormMode}
  onSave={handleSave}
  onSearch={handleSearch}
/>
```

### 8.2 StatusBar (AppShell)
```tsx
// Always visible at bottom of every screen
<StatusBar
  company={session.cmpName}
  finYear={`${session.fyStart}-${session.fyEnd}`}
  user={session.userName}
  role={session.roleName}
  workDate={session.defaultDate}
  systemDate={today}
/>
```

---

## 9. CLAUDE CODE TASK PROMPTS

Use these prompts with **Get Shit Done** extension:

### Task 1: Database Setup
```
Read HMS_Web_PRD.md section 3.2. Generate:
1. prisma/schema.prisma with all tables
2. migration SQL file
3. seed.ts with default Company, admin User, admin Role, all rights
Run: npx prisma migrate dev
```

### Task 2: Auth Module
```
Read HMS_Web_PRD.md sections 6.1, 6.2. Generate:
1. POST /api/auth/login with JWT + httpOnly cookie
2. GET /api/auth/me
3. rbac.ts middleware
4. LoginPage.tsx React component (matching CompMast.frm login panel fields)
```

### Task 3: Patient Master
```
Read HMS_Web_PRD.md section 3.2 (PatMast) and FRM analysis (PatMast.frm fields).
Generate:
1. GET/POST/PUT /api/masters/patients with RBAC "Patient Master"
2. PatientMaster.tsx with SummaryDetailLayout
3. Zod schema: patientSchema.ts
4. All fields from PatMast table
5. Age auto-calculate from DOB
6. Contact number duplicate check (matches VB6 ChkDuplPatByContNo)
```

### Task 4: OPD Registration
```
Read HMS_Web_PRD.md OutdReg schema + section 7.2 (voucher numbering) + 7.1 (pricing).
Generate:
1. POST /api/opd/registration
2. GET /api/opd/registration/:id
3. OpdRegistration.tsx with patient lookup, service grid, auto-pricing
4. Pricing service call: GET /api/services/:id/rate?doctorId=&patientCategoryId=&time=
```

### Task 5: Sync Agent
```
Read HMS_Web_PRD.md section 5. Generate:
1. sync-agent/src/access-reader.ts using node-adodb to read .mdb
2. sync-agent/src/delta-tracker.ts comparing RecState and tracking last sync
3. sync-agent/src/push-client.ts posting to /api/sync/push
4. sync-agent/config.json with all table names from section 5.2
5. API route POST /api/sync/push that upserts records + logs to SyncLog
```

### Ralph Loop instruction:
```
After each task generation, run:
1. TypeScript compile check
2. Zod schema validation test
3. API integration test (supertest)
If any fail, fix and retry until all green. Max 5 iterations.
```

---

## 10. DEPLOYMENT

### 10.1 Cloud (API + DB)
- **Database**: Supabase (free tier: 500MB) or Neon (serverless PostgreSQL)
- **API**: Railway or Render (Node.js, auto-deploy from GitHub)
- **Frontend**: Vercel or Netlify (React SPA)
- **ENV vars needed**: `DATABASE_URL`, `JWT_SECRET`, `SYNC_API_KEY`

### 10.2 Local Sync Agent
- Runs as a Windows Service on hospital PC using `node-windows` or `pm2`
- Reads `.mdb` files from `C:\HmsData\` (configurable in config.json)
- Requires: Node.js 18+ on hospital PC
- Install: `npm install && npm run install-service`

### 10.3 Environment Variables
```env
# apps/api/.env
DATABASE_URL=postgresql://user:pass@db.supabase.co:5432/hms
JWT_SECRET=your-secret-key-here
JWT_EXPIRES_IN=8h
SYNC_API_KEY=sync-shared-secret
PORT=3001

# apps/sync-agent/config.json
{
  "mdbPath": "C:\\HmsData\\Company001.mdb",
  "apiUrl": "https://hms-api.railway.app",
  "apiKey": "sync-shared-secret"
}
```

---

## 11. TECHNOLOGY STACK SUMMARY

| Layer | Technology | Version |
|-------|-----------|---------|
| Frontend framework | React + TypeScript | 18 / 5 |
| Build tool | Vite | 5 |
| UI components | shadcn/ui | latest |
| CSS | Tailwind CSS | 3 |
| Data grid | AG Grid Community | 31 |
| Form validation | React Hook Form + Zod | 7 / 3 |
| HTTP client | Axios + React Query | 1 / 5 |
| State management | Zustand | 4 |
| Backend | Express + TypeScript | 4 / 5 |
| ORM | Prisma | 5 |
| Database (cloud) | PostgreSQL | 15 |
| Auth | JWT + bcryptjs | - |
| Local DB reader | node-adodb | 5 |
| Job queue | Bull + Redis | 4 |
| Monorepo | pnpm workspaces | 8 |
| MCP orchestration | Stitch MCP | latest |
| Dev workflow | Claude Code + Get Shit Done + Ralph Loop | latest |

---

## 12. IMPLEMENTATION ORDER

| Week | Module | Key Deliverables |
|------|--------|-----------------|
| 1 | Foundation | DB schema, migrations, auth, RBAC, AppShell, StatusBar, SummaryDetailLayout |
| 2 | Simple Masters | DoctCatg, DoctRole, PatCatg, RefCatg, Area, Station, Diagnosis, Ward, Floor |
| 3 | Complex Masters | Doctor, Patient, Service (with pricing grid), Bed |
| 4 | OPD | Registration, Bill, Receipt, Payment, Refund |
| 5 | IPD | Registration, Bed Status, Bill (complex), Payment, Refund |
| 6 | Lab | Receipt, Payment, Refund |
| 7 | Pharmacy | Item Master, Party Master, Purchase, Sale, Stock Register |
| 8 | Reports | Collection Report, Service Report, Bed Status Report |
| 9 | Sync Agent | Local daemon, delta tracking, push endpoint, SyncDashboard UI |
| 10 | System | User Master, Rights Master, Company Master, Backup, Deploy |

---

*This PRD is the single source of truth for the HMS Web Application migration.*  
*Claude Code should reference this file for all code generation tasks.*  
*Last updated: April 2026*
