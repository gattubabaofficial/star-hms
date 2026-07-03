# Reconciliation: Legacy MDB vs Current Models

Legacy tables: 275 | Model tables: 140


## A. Legacy tables NOT in current models

Main tables missing (88):
- **AchdMast** (Accounts.Mdb, 5 cols)
- **AcntGrpMst** (Accounts.Mdb, 8 cols)
- **Attendance** (Payroll.Mdb, 14 cols)
- **BnkPymtDtl** (HmsAcTrn.Mdb, 12 cols)
- **BnkPymtHdr** (HmsAcTrn.Mdb, 18 cols)
- **BnkRcptDtl** (HmsAcTrn.Mdb, 14 cols)
- **BnkRcptHdr** (HmsAcTrn.Mdb, 18 cols)
- **BnkrMast** (Accounts.Mdb, 4 cols)
- **CHistFmtDtl** (Clincal.Mdb, 34 cols)
- **CHistFmtMast** (Clincal.Mdb, 13 cols)
- **ClncHistDtl** (Clincal.Mdb, 38 cols)
- **ClncHistFmt** (Clincal.Mdb, 8 cols)
- **ClncHistHdr** (Clincal.Mdb, 26 cols)
- **ClncObjMast** (Clincal.Mdb, 14 cols)
- **CObjBaseDtl** (Clincal.Mdb, 5 cols)
- **CObjGrpMast** (Clincal.Mdb, 6 cols)
- **CshPymtDtl** (HmsAcTrn.Mdb, 10 cols)
- **CshPymtHdr** (HmsAcTrn.Mdb, 18 cols)
- **CshRcptDtl** (HmsAcTrn.Mdb, 10 cols)
- **CshRcptHdr** (HmsAcTrn.Mdb, 18 cols)
- **DeptMast** (Payroll.Mdb, 3 cols)
- **DesgMast** (Payroll.Mdb, 3 cols)
- **DespBill** (DrugTran.Mdb, 27 cols)
- **DespHdr** (DrugTran.Mdb, 55 cols)
- **DespPymtDtl** (DrugTran.Mdb, 9 cols)
- **DespPymtHdr** (DrugTran.Mdb, 21 cols)
- **DespRefdDtl** (DrugTran.Mdb, 9 cols)
- **DespRefdHdr** (DrugTran.Mdb, 21 cols)
- **DictHdr** (HospTran.Mdb, 57 cols)
- **DictPymtDtl** (HospTran.Mdb, 10 cols)
- **DictPymtHdr** (HospTran.Mdb, 22 cols)
- **DictRcDctDtl** (HospTran.Mdb, 17 cols)
- **DictRcpt** (HospTran.Mdb, 27 cols)
- **DictRefdDtl** (HospTran.Mdb, 10 cols)
- **DictRefdHdr** (HospTran.Mdb, 22 cols)
- **EmpMast** (Payroll.Mdb, 29 cols)
- **gAchdSum** (GrpData.Mdb, 5 cols)
- **gProdSum** (GrpData.Mdb, 8 cols)
- **HoliGrant** (Payroll.Mdb, 9 cols)
- **HoliMast** (Payroll.Mdb, 5 cols)
- **IndrBlDpogDtl** (HospTran.Mdb, 7 cols)
- **IndrBlIbsDtl** (HospTran.Mdb, 13 cols)
- **IndrBlRfugDtl** (HospTran.Mdb, 7 cols)
- **IndrPymtDtl** (HospTran.Mdb, 10 cols)
- **IndrPymtHdr** (HospTran.Mdb, 21 cols)
- **IndrRcDctDtl** (HospTran.Mdb, 17 cols)
- **IndrRcpt** (HospTran.Mdb, 27 cols)
- **IndrRefdDtl** (HospTran.Mdb, 10 cols)
- **IndrRefdHdr** (HospTran.Mdb, 21 cols)
- **Journal** (Accounts.Mdb, 15 cols)
- **JrnHdr** (Accounts.Mdb, 12 cols)
- **LabPymtDtl** (DiagTran.Mdb, 10 cols)
- **LabRefdDtl** (DiagTran.Mdb, 10 cols)
- **MediCpoMst** (DrugMast.Mdb, 7 cols)
- **MediCpyMst** (DrugMast.Mdb, 6 cols)
- **MediGrpMst** (DrugMast.Mdb, 6 cols)
- **MediMast** (DrugMast.Mdb, 14 cols)
- **NatioStateMast** (Accounts.Mdb, 4 cols)
- **OutdApt** (HospTran.Mdb, 54 cols)
- **OutdBlHdr** (HospTran.Mdb, 33 cols)
- **OutdBlPymtDtl** (HospTran.Mdb, 10 cols)
- **OutdBlRefdDtl** (HospTran.Mdb, 10 cols)
- **OutdPymtDtl** (HospTran.Mdb, 10 cols)
- **OutdRefdDtl** (HospTran.Mdb, 10 cols)
- **OutdRgPymt** (HospTran.Mdb, 23 cols)
- **PackgMast** (HospMast.Mdb, 4 cols)
- **PackgSrvMst** (HospMast.Mdb, 7 cols)
- **PatRefMst** (HospMast.Mdb, 29 cols)
- **ProcMast** (HospMast.Mdb, 5 cols)
- **ProdMast** (Stock.Mdb, 5 cols)
- **ProdRef** (Stock.Mdb, 12 cols)
- **SalarySlip** (Payroll.Mdb, 47 cols)
- **StockHdr** (Stock.Mdb, 12 cols)
- **StockJrn** (Stock.Mdb, 18 cols)
- **TestDeptMast** (DiagMast.Mdb, 9 cols)
- **TestFmtDtl** (DiagMast.Mdb, 15 cols)
- **TestFmtMast** (DiagMast.Mdb, 19 cols)
- **TestGrpMast** (DiagMast.Mdb, 9 cols)
- **TestMethodMast** (DiagMast.Mdb, 5 cols)
- **TestParaMast** (DiagMast.Mdb, 29 cols)
- **TestParaSrvMst** (DiagMast.Mdb, 5 cols)
- **TestRepFmtDtl** (DiagTran.Mdb, 15 cols)
- **TestRepoHdr** (DiagTran.Mdb, 22 cols)
- **TestRepParaDtl** (DiagTran.Mdb, 22 cols)
- **TestSampTypMast** (DiagMast.Mdb, 5 cols)
- **TestValCalcDtl** (DiagMast.Mdb, 7 cols)
- **TestValCalcMast** (DiagMast.Mdb, 6 cols)
- **VTypMast** (Accounts.Mdb, 23 cols)

_Log tables missing: 87_

## B. Model tables NOT found in legacy schema

- audit_logs
- beds
- company_log
- doctor_categories
- doctor_roles
- doctors
- floors
- indrstk
- indrstk_log
- indrstkdtl
- indrstkdtl_log
- ipd_admissions
- ipd_bills
- opd_bills
- opd_registrations
- outdstk
- outdstk_log
- outdstkdtl
- outdstkdtl_log
- partygrpmst
- partygrpmst_log
- partymast
- partymast_log
- patient_categories
- patients
- paydeptmast
- paydesnmast
- payempmast
- service_groups
- services
- subitmgrpmst
- subitmgrpmst_log
- subitmmast
- subitmmast_log
- syncconfig
- syncconfig_log
- synclog
- synclog_log
- users
- wards

## C. Column differences (main tables present in both)


### BedMast (HospMast.Mdb)
  MISSING in model (1): BdmAlloted

### Company (Company.Mdb)
  MISSING in model (4): CmpDefSele, CmpInstRef, CmpCheckRef, CmpType

### DiagSrvMst (HospMast.Mdb)
  MISSING in model (3): DsmICode, DsmSno, DsmRecState
  EXTRA in model (1): DsmDigCode

### DoctMast (HospMast.Mdb)
  MISSING in model (3): DctRegValidDays, DctPresNote, DctReg1No

### IBedState (HospTran.Mdb)
  EXTRA in model (1): IbsCmpCode

### IndrBill (HospTran.Mdb)
  MISSING in model (32): IblCode, IblICode, IblSno, IblDate, IblIpgCode, IblPttCode, IblSrvCode, IblUnit, IblRate, IblAmtBefDisc, IblDiscPer, IblDiscAmt, IblAmtAftDisc, IblAdvAmt, IblDpogAmt, IblDepoAmt, IblRfugAmt, IblRefuAmt, IblShortAmt, IblWOffAmt, IblBalAmt, IblCDctSharePer, IblCDctShareAmt, IblRbySharePer, IblRbyShareAmt, IblSDctSharePer, IblSDctShareAmt, IblSrvDate, IblRecState, IblHdrCode, IblDtlCode, IblRemark
  EXTRA in model (11): IbdSno, IbdIbhCode, IbdAmtBefDisc, IbdDiscPer, IbdUnit, IbdCode, IbdSrvCode, IbdRate, IbdDiscAmt, IbdAmtAftDisc, IbdRecState

### IndrBlDctDtl (HospTran.Mdb)
  MISSING in model (17): IbdCode, IbdIblCode, IbdICode, IbdSno, IbdSrvCode, IbdPttCode, IbdDctCode, IbdDate, IbdDrlCode, IbdCDctSharePer, IbdCDctShareAmt, IbdRbySharePer, IbdRbyShareAmt, IbdSDctSharePer, IbdSDctShareAmt, IbdRecState, IbdRemark
  EXTRA in model (6): IddIbhCode, IddShareAmt, IddDctCode, IddRecState, IddSharePer, IddCode

### IndrBlHdr (HospTran.Mdb)
  MISSING in model (30): IbhIpgCode, IbhTime, IbhOldIbhCode, IbhPttDiscPer, IbhAmtBefDisc, IbhDiscAmt, IbhAmtAftDisc, IbhAdvAmt, IbhDpogAmt, IbhDepoAmt, IbhRefuAmt, IbhShortAmt, IbhWOffAmt, IbhCDctSharePer, IbhCDctShareAmt, IbhRbySharePer, IbhRbyShareAmt, IbhSDctSharePer, IbhSDctShareAmt, IbhProcDate, IbhProcTime, IbhPrcCode, IbhUsr1Code, IbhUsr2Code, IbhPrntCnt, IbhBcgCode, IbhBahCode, IbhHdrCode, IbhPostfix, IbhPrcDesc
  EXTRA in model (8): IbhStatus, IbhVoidFlag, IbhBillType, IbhIhdCode, IbhDischDate, IbhTotalAmt, IbhDiscPer, IbhDepAmt

### IndrBlPymtDtl (HospTran.Mdb)
  MISSING in model (1): IbpyShortAmt
  EXTRA in model (1): IbpyCmpCode

### IndrBlPymtHdr (HospTran.Mdb)
  MISSING in model (7): IbphPymtAhCode, IbphShortAmt, IbphUsr1Code, IbphUsr2Code, IbphPrntCnt, IbphPymtMode, IbphPymtRefNo

### IndrBlRefdDtl (HospTran.Mdb)
  MISSING in model (1): IbfdWOffAmt
  EXTRA in model (1): IbfdCmpCode

### IndrBlRefdHdr (HospTran.Mdb)
  MISSING in model (7): IbfhPymtAhCode, IbfhWOffAmt, IbfhUsr1Code, IbfhUsr2Code, IbfhPrntCnt, IbfhPymtMode, IbfhPymtRefNo

### IndrHdr (HospTran.Mdb)
  MISSING in model (38): IhrCode, IhrIpgCode, IhrVtmCode, IhrVchNo, IhrDate, IhrTime, IhrOldIhrCode, IhrPttCode, IhrPymtAhCode, IhrPttDiscPer, IhrAmtBefDisc, IhrDiscAmt, IhrAmtAftDisc, IhrAdvAmt, IhrRecdAmt, IhrDepoAmt, IhrRefuAmt, IhrShortAmt, IhrWOffAmt, IhrBalAmt, IhrCDctSharePer, IhrCDctShareAmt, IhrRbySharePer, IhrRbyShareAmt, IhrSDctSharePer, IhrSDctShareAmt, IhrRecState, IhrCmpCode, IhrUsr1Code, IhrUsr2Code, IhrPrntCnt, IhrBcgCode, IhrBahCode, IhrPrefix, IhrPostfix, IhrPymtMode, IhrPymtRefNo, IhrRemark
  EXTRA in model (22): IhdVoidFlag, IhdVtmCode, IhdDate, IhdCDctCode, IhdPrefix, IhdPDigCode, IhdVchNo, IhdRecState, IhdDischTime, IhdStatus, IhdTime, IhdBedCode, IhdWrdCode, IhdAdvAmt, IhdFlrCode, IhdRByCode, IhdPttCode, IhdDischDate, IhdCode, IhdRemark, IhdFDigCode, IhdCmpCode

### IndrReg (HospTran.Mdb)
  MISSING in model (19): IpgPymtAhCode, IpgPttWeight, IpgRbyRefDt, IpgUsr1Code, IpgUsr2Code, IpgPrntCnt, IpgBcgCode, IpgBahCode, IpgPymtMode, IpgPymtRefNo, IpgPttHeight, IpgEchsRegNo, IpgEchsServNo, IpgEchsRankNo, IpgInspRegNo, IpgInspDocNo, IpgRefClaimNo, IpgRbyRefNo, IpgDiagNote

### IndrRgPymt (HospTran.Mdb)
  MISSING in model (6): IgtPymtAhCode, IgtUsr1Code, IgtUsr2Code, IgtPrntCnt, IgtPymtMode, IgtPymtRefNo

### IndrRgRefd (HospTran.Mdb)
  MISSING in model (6): IgfPymtAhCode, IgfPymtMode, IgfPymtRefNo, IgfUsr1Code, IgfUsr2Code, IgfPrntCnt

### LabHdr (DiagTran.Mdb)
  MISSING in model (57): LhrCode, LhrLpgCode, LhrVtmCode, LhrVchNo, LhrDate, LhrTime, LhrOldLhrCode, LhrPttCode, LhrCDctCode, LhrRByCode, LhrRToCode, LhrPDigCode, LhrFDigCode, LhrPymtAhCode, LhrPttWeight, LhrProcDate, LhrProcTime, LhrPrcCode, LhrPttDiscPer, LhrAmtBefDisc, LhrDiscAmt, LhrAmtAftDisc, LhrAdvAmt, LhrRecdAmt, LhrDepoAmt, LhrRefuAmt, LhrShortAmt, LhrWOffAmt, LhrBalAmt, LhrCDctSharePer, LhrCDctShareAmt, LhrRbySharePer, LhrRbyShareAmt, LhrSDctSharePer, LhrSDctShareAmt, LhrRbyRefDt, LhrRecState, LhrCmpCode, LhrUsr1Code, LhrUsr2Code, LhrPrntCnt, LhrBcgCode, LhrBahCode, LhrPrefix, LhrPostfix, LhrPymtMode, LhrPymtRefNo, LhrPttHeight, LhrEchsRegNo, LhrEchsServNo, LhrEchsRankNo, LhrInspRegNo, LhrInspDocNo, LhrRefClaimNo, LhrPrcDesc, LhrRbyRefNo, LhrRemark
  EXTRA in model (20): LhdRecState, LhdDiscPer, LhdReceiptType, LhdRemark, LhdBalAmt, LhdRByCode, LhdTime, LhdPttCode, LhdVchNo, LhdTotalAmt, LhdCmpCode, LhdPrefix, LhdCode, LhdAdvAmt, LhdVoidFlag, LhdCDctCode, LhdVtmCode, LhdRecvdAmt, LhdDate, LhdRfugAmt

### LabPymtHdr (DiagTran.Mdb)
  MISSING in model (19): LphLpgCode, LphLhrCode, LphVtmCode, LphPrefix, LphVchNo, LphPostfix, LphTime, LphOldLphCode, LphPttCode, LphPymtAhCode, LphPymtMode, LphPymtRefNo, LphDepoAmt, LphShortAmt, LphRemark, LphCmpCode, LphUsr1Code, LphUsr2Code, LphPrntCnt
  EXTRA in model (2): LphAmt, LphLhdCode

### LabRcDctDtl (DiagTran.Mdb)
  MISSING in model (17): LrdCode, LrdLrcCode, LrdICode, LrdSno, LrdSrvCode, LrdPttCode, LrdDctCode, LrdDate, LrdDrlCode, LrdCDctSharePer, LrdCDctShareAmt, LrdRbySharePer, LrdRbyShareAmt, LrdSDctSharePer, LrdSDctShareAmt, LrdRemark, LrdRecState
  EXTRA in model (5): LddDctCode, LddCode, LddSharePer, LddRecState, LddLhdCode

### LabRcpt (DiagTran.Mdb)
  MISSING in model (27): LrcCode, LrcICode, LrcSno, LrcDate, LrcPttCode, LrcSrvCode, LrcUnit, LrcRate, LrcAmtBefDisc, LrcDiscPer, LrcDiscAmt, LrcAmtAftDisc, LrcAdvAmt, LrcRecdAmt, LrcDepoAmt, LrcRefuAmt, LrcShortAmt, LrcWOffAmt, LrcBalAmt, LrcCDctSharePer, LrcCDctShareAmt, LrcRbySharePer, LrcRbyShareAmt, LrcSDctSharePer, LrcSDctShareAmt, LrcRecState, LrcRemark
  EXTRA in model (11): LrdCode, LrdLhdCode, LrdSno, LrdRate, LrdDiscAmt, LrdSrvCode, LrdUnit, LrdRecState, LrdAmtBefDisc, LrdDiscPer, LrdAmtAftDisc

### LabRefdHdr (DiagTran.Mdb)
  MISSING in model (22): LfhCode, LfhLpgCode, LfhLhrCode, LfhVtmCode, LfhVchNo, LfhDate, LfhTime, LfhOldLfhCode, LfhPttCode, LfhPymtAhCode, LfhRefuAmt, LfhWOffAmt, LfhRecState, LfhCmpCode, LfhUsr1Code, LfhUsr2Code, LfhPrntCnt, LfhPrefix, LfhPostfix, LfhPymtMode, LfhPymtRefNo, LfhRemark
  EXTRA in model (5): LrhAmt, LrhDate, LrhLhdCode, LrhCode, LrhRecState

### OutdBill (HospTran.Mdb)
  MISSING in model (25): OblCode, OblICode, OblSno, OblDate, OblPttCode, OblSrvCode, OblUnit, OblRate, OblAmtBefDisc, OblDiscPer, OblDiscAmt, OblAmtAftDisc, OblDepoAmt, OblRefuAmt, OblShortAmt, OblWOffAmt, OblBalAmt, OblCDctSharePer, OblCDctShareAmt, OblRbySharePer, OblRbyShareAmt, OblSDctSharePer, OblSDctShareAmt, OblRemark, OblRecState
  EXTRA in model (11): ObdUnit, ObdSrvCode, ObdAmtAftDisc, ObdAmtBefDisc, ObdRate, ObdCode, ObdDiscAmt, ObdRecState, ObdDiscPer, ObdSno, ObdOhdCode

### OutdBlDctDtl (HospTran.Mdb)
  MISSING in model (17): ObdCode, ObdOblCode, ObdICode, ObdSno, ObdSrvCode, ObdPttCode, ObdDctCode, ObdDate, ObdDrlCode, ObdCDctSharePer, ObdCDctShareAmt, ObdRbySharePer, ObdRbyShareAmt, ObdSDctSharePer, ObdSDctShareAmt, ObdRemark, ObdRecState
  EXTRA in model (6): OddOhdCode, OddCode, OddDctCode, OddSharePer, OddShareAmt, OddRecState

### OutdBlPymtHdr (HospTran.Mdb)
  MISSING in model (21): ObphCode, ObphOpgCode, ObphVtmCode, ObphPrefix, ObphVchNo, ObphPostfix, ObphDate, ObphTime, ObphOldObphCode, ObphPttCode, ObphPymtAhCode, ObphPymtMode, ObphPymtRefNo, ObphDepoAmt, ObphShortAmt, ObphRemark, ObphRecState, ObphCmpCode, ObphUsr1Code, ObphUsr2Code, ObphPrntCnt
  EXTRA in model (5): ObpDate, ObpCode, ObpRecState, ObpOhdCode, ObpAmt

### OutdBlRefdHdr (HospTran.Mdb)
  MISSING in model (21): ObfhCode, ObfhOpgCode, ObfhVtmCode, ObfhPrefix, ObfhVchNo, ObfhPostfix, ObfhDate, ObfhTime, ObfhOldObfhCode, ObfhPttCode, ObfhPymtAhCode, ObfhPymtMode, ObfhPymtRefNo, ObfhRefuAmt, ObfhWOffAmt, ObfhRemark, ObfhRecState, ObfhCmpCode, ObfhUsr1Code, ObfhUsr2Code, ObfhPrntCnt
  EXTRA in model (5): ObrRecState, ObrAmt, ObrCode, ObrDate, ObrOhdCode

### OutdHdr (HospTran.Mdb)
  MISSING in model (42): OhrCode, OhrOpgCode, OhrVtmCode, OhrVchNo, OhrDate, OhrTime, OhrOldOhrCode, OhrPttCode, OhrPymtAhCode, OhrPttDiscPer, OhrAmtBefDisc, OhrDiscAmt, OhrAmtAftDisc, OhrAdvAmt, OhrRecdAmt, OhrDepoAmt, OhrRefuAmt, OhrShortAmt, OhrWOffAmt, OhrBalAmt, OhrCDctSharePer, OhrCDctShareAmt, OhrRbySharePer, OhrRbyShareAmt, OhrSDctSharePer, OhrSDctShareAmt, OhrProcDate, OhrProcTime, OhrPrcCode, OhrRecState, OhrCmpCode, OhrUsr1Code, OhrUsr2Code, OhrPrntCnt, OhrBcgCode, OhrBahCode, OhrPrefix, OhrPostfix, OhrPymtMode, OhrPymtRefNo, OhrRemark, OhrPrcDesc
  EXTRA in model (20): OhdRfugAmt, OhdCmpCode, OhdCDctCode, OhdPrefix, OhdDepAmt, OhdDiscPer, OhdDate, OhdTotalAmt, OhdBillType, OhdDiscAmt, OhdBalAmt, OhdTime, OhdRByCode, OhdCode, OhdRemark, OhdRecState, OhdVtmCode, OhdPttCode, OhdVchNo, OhdVoidFlag

### OutdPymtHdr (HospTran.Mdb)
  MISSING in model (18): OphOpgCode, OphVtmCode, OphVchNo, OphTime, OphOldOphCode, OphPttCode, OphPymtAhCode, OphDepoAmt, OphShortAmt, OphCmpCode, OphUsr1Code, OphUsr2Code, OphPrntCnt, OphPrefix, OphPostfix, OphPymtMode, OphPymtRefNo, OphRemark
  EXTRA in model (2): OphOrcCode, OphAmt

### OutdRcDctDtl (HospTran.Mdb)
  MISSING in model (13): OrdICode, OrdSno, OrdSrvCode, OrdPttCode, OrdDate, OrdDrlCode, OrdCDctSharePer, OrdCDctShareAmt, OrdRbySharePer, OrdRbyShareAmt, OrdSDctSharePer, OrdSDctShareAmt, OrdRemark
  EXTRA in model (1): OrdSharePer

### OutdRcpt (HospTran.Mdb)
  MISSING in model (19): OrcICode, OrcSno, OrcSrvCode, OrcUnit, OrcRate, OrcAmtBefDisc, OrcDiscAmt, OrcAmtAftDisc, OrcRecdAmt, OrcDepoAmt, OrcRefuAmt, OrcShortAmt, OrcWOffAmt, OrcCDctSharePer, OrcCDctShareAmt, OrcRbySharePer, OrcRbyShareAmt, OrcSDctSharePer, OrcSDctShareAmt
  EXTRA in model (12): OrcTime, OrcVchNo, OrcVoidFlag, OrcReceiptType, OrcVtmCode, OrcCmpCode, OrcRfugAmt, OrcTotalAmt, OrcRecvdAmt, OrcRByCode, OrcCDctCode, OrcPrefix

### OutdRefdHdr (HospTran.Mdb)
  MISSING in model (21): OfhCode, OfhOpgCode, OfhVtmCode, OfhVchNo, OfhDate, OfhTime, OfhOldOfhCode, OfhPttCode, OfhPymtAhCode, OfhRefuAmt, OfhWOffAmt, OfhRecState, OfhCmpCode, OfhUsr1Code, OfhUsr2Code, OfhPrntCnt, OfhPrefix, OfhPostfix, OfhPymtMode, OfhPymtRefNo, OfhRemark
  EXTRA in model (5): OrhDate, OrhRecState, OrhCode, OrhAmt, OrhOrcCode

### OutdReg (HospTran.Mdb)
  MISSING in model (33): OpgPymtAhCode, OpgAptVtmCode, OpgAptVchCode, OpgPttWeight, OpgRecdAmt, OpgDpogAmt, OpgShortAmt, OpgWOffAmt, OpgBalAmt, OpgCDctSharePer, OpgCDctShareAmt, OpgRbySharePer, OpgRbyShareAmt, OpgSDctSharePer, OpgSDctShareAmt, OpgRbyRefDt, OpgTokNo, OpgUsr1Code, OpgUsr2Code, OpgPrntCnt, OpgBcgCode, OpgBahCode, OpgPymtMode, OpgPymtRefNo, OpgPttHeight, OpgEchsRegNo, OpgEchsServNo, OpgEchsRankNo, OpgInspRegNo, OpgInspDocNo, OpgRefClaimNo, OpgRbyRefNo, OpgDiagNote

### OutdRgRefd (HospTran.Mdb)
  MISSING in model (23): OgfCode, OgfOpgCode, OgfVtmCode, OgfVchNo, OgfDate, OgfTime, OgfOldOgfCode, OgfPttCode, OgfPymtAhCode, OgfRfugAmt, OgfWOffAmt, OgfAdjAmt, OgfBalAmt, OgfRecState, OgfCmpCode, OgfUsr1Code, OgfUsr2Code, OgfPrntCnt, OgfPrefix, OgfPostfix, OgfPymtMode, OgfPymtRefNo, OgfRemark
  EXTRA in model (5): OrrOpgCode, OrrDate, OrrAmt, OrrCode, OrrRecState

### PatMast (HospMast.Mdb)
  MISSING in model (14): PttPrfCode, PttOpgCount, PttIpgCount, PttDpgCount, PttLpgCount, PttDlbCount, PttClnCount, PttSalute, PttAadharNo, PttEchsRegNo, PttEchsServNo, PttEchsRankNo, PttInspRegNo, PttInspDocNo

### ServGrpMst (HospMast.Mdb)
  MISSING in model (2): SgpShared, SgpPrntName

### ServMast (HospMast.Mdb)
  MISSING in model (38): SrvRate, SrvOpdGenChg, SrvOpdEmgChg, SrvIpdGenChg, SrvIpdEmgChg, SrvLabGenChg, SrvLabEmgChg, SrvMultiDctIncl, SrvAutoInsIpdBill, SrvAutoCalcIpdBill, SrvAutoInsOnceIpdBill, SrvDctwseRateSys, SrvPcgwseRateSys, SrvRBywseRateSys, SrvRTowseRateSys, SrvTimewseRateSys, SrvDctwseDiscSys, SrvPcgwseDiscSys, SrvRBywseDiscSys, SrvRTowseDiscSys, SrvTimewseDiscSys, SrvDctwseBargSys, SrvPcgwseBargSys, SrvRBywseBargSys, SrvRTowseBargSys, SrvTimewseBargSys, SrvDctwseShareSys, SrvPcgwseShareSys, SrvRBywseShareSys, SrvRTowseShareSys, SrvTimewseShareSys, SrvIndsRate, SrvTfmCode, SrvShared, SrvVtsCode, SrvRemarkOpt, SrvDesc, SrvRefNo
  EXTRA in model (9): SrvCharges, SrvAutoInsOnceIndr, SrvExtBargSys, SrvMultiDct, SrvAutoInsIndr, SrvExtRateSys, SrvExtShareSys, SrvAutoCalcIndr, SrvExtDiscSys

### ServRateMst (HospMast.Mdb)
  MISSING in model (12): SrmICode, SrmSno, SrmWefDate, SrmPcgCode, SrmDctCode, SrmRByCode, SrmRToCode, SrmInfByPer, SrmDefByPer, SrmSharePer, SrmShareAmt, SrmRemark
  EXTRA in model (6): SrmShare, SrmBargPer, SrmRefCode, SrmSrvCode, SrmRateType, SrmEffDate

### StsnMast (Accounts.Mdb)
  EXTRA in model (1): StnShowInList

### UserRightMst (Company.Mdb)
  MISSING in model (7): UhtCanAltVchAuth, UhtCanPrint, UhtEditBackDays, UhtAlwPrintCount, UhtCanBackDate, UhtAdminAuth, UhtSecuOptTitle

### UserRoleMst (Company.Mdb)
  MISSING in model (3): UrlType, UrlSubDiv, UrlPwd


Tables with column diffs: 39