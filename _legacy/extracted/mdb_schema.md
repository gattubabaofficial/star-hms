# Legacy MDB Schema (extracted)


## Accounts.Mdb


### AchdMast  (5 cols)
AhCode, AhAcgCode, AhDepends, AhRecState, AhName

### AchdMast_Log  (5 cols)
AhCode, AhName, AhAcgCode, AhDepends, AhRecState

### AcntGrpMst  (8 cols)
AcgCode, AcgSysCode, AcgBaseCode, AcgIndex, AcgDepends, AcgRecState, AcgName, AcgAbvr

### AcntGrpMst_Log  (8 cols)
AcgCode, AcgName, AcgAbvr, AcgSysCode, AcgBaseCode, AcgIndex, AcgDepends, AcgRecState

### AreaMast  (4 cols)
AraCode, AraStnCode, AraRecState, AraName

### AreaMast_Log  (4 cols)
AraCode, AraName, AraStnCode, AraRecState

### BnkrMast  (4 cols)
BkrCode, BkrName, BkrDesc, BkrRecState

### BnkrMast_Log  (4 cols)
BkrCode, BkrName, BkrDesc, BkrRecState

### Journal  (15 cols)
JrnCode, JrnICode, JrnSno, JrnVtmCode, JrnVchNo, JrnDate, JrnAhCode, JrnAmt, JrnLAhCode, JrnCmpCode, JrnAutoGen, JrnRecState, JrnPrefix, JrnPostfix, JrnNarr

### Journal_Log  (15 cols)
JrnCode, JrnICode, JrnSno, JrnVtmCode, JrnPrefix, JrnVchNo, JrnPostfix, JrnDate, JrnAhCode, JrnAmt, JrnNarr, JrnLAhCode, JrnCmpCode, JrnAutoGen, JrnRecState

### JrnHdr  (12 cols)
JhrCode, JhrVtmCode, JhrPrefix, JhrVchNo, JhrPostfix, JhrDate, JhrAhCode, JhrAmt, JhrNarr, JhrCmpCode, JhrAutoGen, JhrRecState

### JrnHdr_Log  (12 cols)
JhrCode, JhrVtmCode, JhrPrefix, JhrVchNo, JhrPostfix, JhrDate, JhrAhCode, JhrAmt, JhrNarr, JhrCmpCode, JhrAutoGen, JhrRecState

### NatioStateMast  (4 cols)
NstCode, NstName, NstRefCode, NstRecState

### NatioStateMast_Log  (4 cols)
NstCode, NstName, NstRefCode, NstRecState

### StsnMast  (3 cols)
StnCode, StnRecState, StnName

### StsnMast_Log  (3 cols)
StnCode, StnName, StnRecState

### VTypMast  (23 cols)
VtmCode, VtmSysCode, VtmEditable, VtmStartNo, VtmResetNoBasis, VtmIndex, VtmShowInList, VtmRecState, VtmPrntCopies, VtmStkMode, VtmAddNewSMS, VtmEditSMS, VtmDeleSMS, VtmName, VtmAbvr, VtmPrefix, VtmPostfix, VtmItmNarr, VtmComNarr, VtmPrntName, VtmPymtMode, VtmPrntFmtSpeci, VtmSendSmsNos

### VTypMast_Log  (0 cols)


## Clincal.Mdb


### CHistFmtDtl  (34 cols)
HfdCode, HfdICode, HfdSno, HfdCbgCode, HfdPrintRec, HfdRecState, HfdCbjCodeList, HfdTitle, HfdNote1, HfdNote2, HfdNote3, HfdNote4, HfdNote5, HfdNote6, HfdNote7, HfdNote8, HfdRemark, HfdDocType, HfdOptho_RED_Sph, HfdOptho_RED_Cyl, HfdOptho_RED_Axis, HfdOptho_RED_VA, HfdOptho_LED_Sph, HfdOptho_LED_Cyl, HfdOptho_LED_Axis, HfdOptho_LED_VA, HfdOptho_REN_Sph, HfdOptho_REN_Cyl, HfdOptho_REN_Axis, HfdOptho_REN_VA, HfdOptho_LEN_Sph, HfdOptho_LEN_Cyl, HfdOptho_LEN_Axis, HfdOptho_LEN_VA

### CHistFmtDtl_Log  (34 cols)
HfdCode, HfdICode, HfdSno, HfdCbgCode, HfdCbjCodeList, HfdTitle, HfdNote1, HfdNote2, HfdNote3, HfdNote4, HfdNote5, HfdNote6, HfdNote7, HfdNote8, HfdPrintRec, HfdRemark, HfdRecState, HfdDocType, HfdOptho_RED_Sph, HfdOptho_RED_Cyl, HfdOptho_RED_Axis, HfdOptho_RED_VA, HfdOptho_LED_Sph, HfdOptho_LED_Cyl, HfdOptho_LED_Axis, HfdOptho_LED_VA, HfdOptho_REN_Sph, HfdOptho_REN_Cyl, HfdOptho_REN_Axis, HfdOptho_REN_VA, HfdOptho_LEN_Sph, HfdOptho_LEN_Cyl, HfdOptho_LEN_Axis, HfdOptho_LEN_VA

### CHistFmtMast  (13 cols)
HfmCode, HfmFDigCode, HfmVtmCode, HfmPrntDest, HfmIndex, HfmShowInList, HfmAutoGen, HfmRecState, HfmName, HfmPrintName, HfmRemark, HfmRepStyle, HfmFmtFileDesc

### CHistFmtMast_Log  (13 cols)
HfmCode, HfmName, HfmPrintName, HfmFDigCode, HfmVtmCode, HfmRemark, HfmRepStyle, HfmPrntDest, HfmFmtFileDesc, HfmIndex, HfmShowInList, HfmAutoGen, HfmRecState

### CObjBaseDtl  (5 cols)
BcjCode, BcjICode, BcjSno, BcjCbjCode, BcjRecState

### CObjBaseDtl_Log  (5 cols)
BcjCode, BcjICode, BcjSno, BcjCbjCode, BcjRecState

### CObjGrpMast  (6 cols)
CbgCode, CbgIndex, CbgShowInList, CbgRecState, CbgName, CbgPrintName

### CObjGrpMast_Log  (6 cols)
CbgCode, CbgName, CbgPrintName, CbgIndex, CbgShowInList, CbgRecState

### ClncHistDtl  (38 cols)
ChdCode, ChdChfCode, ChdICode, ChdSno, ChdDate, ChdPttCode, ChdHfmCode, ChdCbgCode, ChdPrintRec, ChdRecState, ChdCbjCodeList, ChdTitle, ChdNote1, ChdNote2, ChdNote3, ChdNote4, ChdNote5, ChdNote6, ChdNote7, ChdNote8, ChdDocType, ChdOptho_RED_Sph, ChdOptho_RED_Cyl, ChdOptho_RED_Axis, ChdOptho_RED_VA, ChdOptho_LED_Sph, ChdOptho_LED_Cyl, ChdOptho_LED_Axis, ChdOptho_LED_VA, ChdOptho_REN_Sph, ChdOptho_REN_Cyl, ChdOptho_REN_Axis, ChdOptho_REN_VA, ChdOptho_LEN_Sph, ChdOptho_LEN_Cyl, ChdOptho_LEN_Axis, ChdOptho_LEN_VA, ChdRemark

### ClncHistDtl_Log  (38 cols)
ChdCode, ChdChfCode, ChdICode, ChdSno, ChdDate, ChdPttCode, ChdHfmCode, ChdCbgCode, ChdCbjCodeList, ChdTitle, ChdNote1, ChdNote2, ChdNote3, ChdNote4, ChdNote5, ChdNote6, ChdNote7, ChdNote8, ChdDocType, ChdOptho_RED_Sph, ChdOptho_RED_Cyl, ChdOptho_RED_Axis, ChdOptho_RED_VA, ChdOptho_LED_Sph, ChdOptho_LED_Cyl, ChdOptho_LED_Axis, ChdOptho_LED_VA, ChdOptho_REN_Sph, ChdOptho_REN_Cyl, ChdOptho_REN_Axis, ChdOptho_REN_VA, ChdOptho_LEN_Sph, ChdOptho_LEN_Cyl, ChdOptho_LEN_Axis, ChdOptho_LEN_VA, ChdPrintRec, ChdRemark, ChdRecState

### ClncHistFmt  (8 cols)
ChfCode, ChfICode, ChfSno, ChfDate, ChfPttCode, ChfHfmCode, ChfRecState, ChfRemark

### ClncHistFmt_Log  (8 cols)
ChfCode, ChfICode, ChfSno, ChfDate, ChfPttCode, ChfHfmCode, ChfRemark, ChfRecState

### ClncHistHdr  (26 cols)
ChhCode, ChhLnkVchCode, ChhLnkVtmCode, ChhVtmCode, ChhVchNo, ChhDate, ChhTime, ChhPttCode, ChhCDctCode, ChhRByCode, ChhRToCode, ChhPDigCode, ChhFDigCode, ChhProcDate, ChhProcTime, ChhPrcCode, ChhRecState, ChhCmpCode, ChhUsr1Code, ChhUsr2Code, ChhBcgCode, ChhBahCode, ChhPrefix, ChhPostfix, ChhRemark, ChhPrcDesc

### ClncHistHdr_Log  (26 cols)
ChhCode, ChhLnkVchCode, ChhLnkVtmCode, ChhVtmCode, ChhPrefix, ChhVchNo, ChhPostfix, ChhDate, ChhTime, ChhPttCode, ChhCDctCode, ChhRByCode, ChhRToCode, ChhPDigCode, ChhFDigCode, ChhRemark, ChhProcDate, ChhProcTime, ChhPrcCode, ChhPrcDesc, ChhRecState, ChhCmpCode, ChhUsr1Code, ChhUsr2Code, ChhBcgCode, ChhBahCode

### ClncObjMast  (14 cols)
CbjCode, CbjCbgCode, CbjBaseCbgCode, CbjSubIndex, CbjIndex, CbjShowInList, CbjRecState, CbjName, CbjPrintName, CbjProp1, CbjProp2, CbjProp3, CbjProp4, CbjRemark

### ClncObjMast_Log  (14 cols)
CbjCode, CbjName, CbjPrintName, CbjCbgCode, CbjBaseCbgCode, CbjSubIndex, CbjProp1, CbjProp2, CbjProp3, CbjProp4, CbjRemark, CbjIndex, CbjShowInList, CbjRecState

## Common.Mdb

ERROR: 'NoneType' object is not subscriptable


## Company.Mdb


### Company  (25 cols)
CmpCode, CmpBooksDate, CmpFYStartDt, CmpFYEndDt, CmpRecState, CmpDefSele, CmpInstRef, CmpCheckRef, CmpName, CmpAddress, CmpCity, CmpDistrict, CmpState, CmpReg1, CmpReg2, CmpReg3, CmpContPer, CmpOPhone, CmpRPhone, CmpFax, CmpEmail, CmpWebsite, CmpJurisdiction, CmpSecPwd, CmpType

### UserMast  (5 cols)
UsrCode, UsrUrlCode, UsrRecState, UsrName, UsrPwd

### UserMast_Log  (5 cols)
UsrCode, UsrName, UsrPwd, UsrUrlCode, UsrRecState

### UserRightMst  (17 cols)
UhtCode, UhtUrlCode, UhtUsrCode, UhtCanAdd, UhtCanEdit, UhtCanDelete, UhtCanView, UhtCanAltVchAuth, UhtRecState, UhtCanPrint, UhtEditBackDays, UhtAlwPrintCount, UhtCanBackDate, UhtAdminAuth, UhtSecuOptName, UhtSecuOptTitle, UhtRemark

### UserRightMst_Log  (17 cols)
UhtCode, UhtUrlCode, UhtUsrCode, UhtSecuOptName, UhtSecuOptTitle, UhtCanAdd, UhtCanEdit, UhtCanDelete, UhtCanView, UhtCanAltVchAuth, UhtRemark, UhtRecState, UhtCanPrint, UhtEditBackDays, UhtAlwPrintCount, UhtCanBackDate, UhtAdminAuth

### UserRoleMst  (6 cols)
UrlCode, UrlRecState, UrlType, UrlSubDiv, UrlName, UrlPwd

### UserRoleMst_Log  (6 cols)
UrlCode, UrlName, UrlPwd, UrlRecState, UrlType, UrlSubDiv

## DiagMast.Mdb


### TestDeptMast  (9 cols)
TdpCode, TdpIndex, TdpShowInList, TdpRecState, TdpName, TdpPrintName, TdpHdrNote, TdpDtlNote, TdpFtrNote

### TestDeptMast_Log  (9 cols)
TdpCode, TdpName, TdpPrintName, TdpHdrNote, TdpDtlNote, TdpFtrNote, TdpIndex, TdpShowInList, TdpRecState

### TestFmtDtl  (15 cols)
TfdCode, TfdICode, TfdSno, TfdTprCode, TfdRecState, TfdPrintRec, TfdTgpCode, TfdTdpCode, TfdRemark, TfdDefValue, TfdHdrNote, TfdFtrNote, TfdDefNote1, TfdDefNote2, TfdDefNote3

### TestFmtDtl_Log  (15 cols)
TfdCode, TfdICode, TfdSno, TfdTprCode, TfdRemark, TfdRecState, TfdDefValue, TfdHdrNote, TfdFtrNote, TfdPrintRec, TfdDefNote1, TfdDefNote2, TfdDefNote3, TfdTgpCode, TfdTdpCode

### TestFmtMast  (19 cols)
TfmCode, TfmIndex, TfmShowInList, TfmRecState, TfmTspCode, TfmVtmCode, TfmPrntDest, TfmAutoGen, TfmNewPage, TfmMergeRepo, TfmName, TfmPrintName, TfmHdrNote, TfmDtlNote, TfmFtrNote, TfmRemark, TfmRepStyle, TfmFmtFileDesc, TfmDocFileDesc

### TestFmtMast_Log  (19 cols)
TfmCode, TfmName, TfmPrintName, TfmHdrNote, TfmDtlNote, TfmFtrNote, TfmRemark, TfmIndex, TfmShowInList, TfmRecState, TfmTspCode, TfmVtmCode, TfmRepStyle, TfmPrntDest, TfmFmtFileDesc, TfmAutoGen, TfmDocFileDesc, TfmNewPage, TfmMergeRepo

### TestGrpMast  (9 cols)
TgpCode, TgpShowInList, TgpRecState, TgpIndex, TgpName, TgpPrintName, TgpHdrNote, TgpDtlNote, TgpFtrNote

### TestGrpMast_Log  (9 cols)
TgpCode, TgpName, TgpPrintName, TgpHdrNote, TgpDtlNote, TgpFtrNote, TgpShowInList, TgpRecState, TgpIndex

### TestMethodMast  (5 cols)
TmhCode, TmhShowInList, TmhRecState, TmhIndex, TmhName

### TestMethodMast_Log  (5 cols)
TmhCode, TmhName, TmhShowInList, TmhRecState, TmhIndex

### TestParaMast  (29 cols)
TprCode, TprTmhCode, TprTgpCode, TprTdpCode, TprSrvCode, TprRng1, TprRng2, TprRngLowFontSize, TprRngHighFontSize, TprIndex, TprShowInList, TprRecState, TprTspCode, TprVtmCode, TprTvcCode, TprChkAutoValue, TprName, TprPrintName, TprRngUnit, TprListValue, TprRemark, TprRngLowFontStyle, TprRngHighFontStyle, TprRngLowFontName, TprRngHighFontName, TprHdrNote, TprDtlNote, TprFtrNote, TprValueQExpr1

### TestParaMast_Log  (29 cols)
TprCode, TprName, TprPrintName, TprTmhCode, TprTgpCode, TprTdpCode, TprSrvCode, TprRng1, TprRng2, TprRngUnit, TprListValue, TprRemark, TprRngLowFontStyle, TprRngHighFontStyle, TprRngLowFontName, TprRngHighFontName, TprRngLowFontSize, TprRngHighFontSize, TprHdrNote, TprDtlNote, TprFtrNote, TprIndex, TprShowInList, TprRecState, TprTspCode, TprVtmCode, TprTvcCode, TprValueQExpr1, TprChkAutoValue

### TestParaSrvMst  (5 cols)
TrsCode, TrsICode, TrsSno, TrsSrvCode, TrsRecState

### TestParaSrvMst_Log  (5 cols)
TrsCode, TrsICode, TrsSno, TrsSrvCode, TrsRecState

### TestSampTypMast  (5 cols)
TspCode, TspIndex, TspShowInList, TspRecState, TspName

### TestSampTypMast_Log  (5 cols)
TspCode, TspName, TspIndex, TspShowInList, TspRecState

### TestValCalcDtl  (7 cols)
TcdCode, TcdICode, TcdSno, TcdTprCode, TcdPrefix, TcdPostfix, TcdRecState

### TestValCalcDtl_Log  (7 cols)
TcdCode, TcdICode, TcdSno, TcdTprCode, TcdPrefix, TcdPostfix, TcdRecState

### TestValCalcMast  (6 cols)
TvcCode, TvcName, TvcTprCode, TvcRemark, TvcShowInList, TvcRecState

### TestValCalcMast_Log  (6 cols)
TvcCode, TvcName, TvcTprCode, TvcRemark, TvcShowInList, TvcRecState

## DiagTran.Mdb


### LabHdr  (57 cols)
LhrCode, LhrLpgCode, LhrVtmCode, LhrVchNo, LhrDate, LhrTime, LhrOldLhrCode, LhrPttCode, LhrCDctCode, LhrRByCode, LhrRToCode, LhrPDigCode, LhrFDigCode, LhrPymtAhCode, LhrPttWeight, LhrProcDate, LhrProcTime, LhrPrcCode, LhrPttDiscPer, LhrAmtBefDisc, LhrDiscAmt, LhrAmtAftDisc, LhrAdvAmt, LhrRecdAmt, LhrDepoAmt, LhrRefuAmt, LhrShortAmt, LhrWOffAmt, LhrBalAmt, LhrCDctSharePer, LhrCDctShareAmt, LhrRbySharePer, LhrRbyShareAmt, LhrSDctSharePer, LhrSDctShareAmt, LhrRbyRefDt, LhrRecState, LhrCmpCode, LhrUsr1Code, LhrUsr2Code, LhrPrntCnt, LhrBcgCode, LhrBahCode, LhrPrefix, LhrPostfix, LhrPymtMode, LhrPymtRefNo, LhrPttHeight, LhrEchsRegNo, LhrEchsServNo, LhrEchsRankNo, LhrInspRegNo, LhrInspDocNo, LhrRefClaimNo, LhrPrcDesc, LhrRbyRefNo, LhrRemark

### LabHdr_Log  (57 cols)
LhrCode, LhrLpgCode, LhrVtmCode, LhrPrefix, LhrVchNo, LhrPostfix, LhrDate, LhrTime, LhrOldLhrCode, LhrPttCode, LhrCDctCode, LhrRByCode, LhrRToCode, LhrPDigCode, LhrFDigCode, LhrPymtAhCode, LhrPymtMode, LhrPymtRefNo, LhrPttWeight, LhrPttHeight, LhrEchsRegNo, LhrEchsServNo, LhrEchsRankNo, LhrInspRegNo, LhrInspDocNo, LhrRefClaimNo, LhrProcDate, LhrProcTime, LhrPrcCode, LhrPrcDesc, LhrPttDiscPer, LhrAmtBefDisc, LhrDiscAmt, LhrAmtAftDisc, LhrAdvAmt, LhrRecdAmt, LhrDepoAmt, LhrRefuAmt, LhrShortAmt, LhrWOffAmt, LhrBalAmt, LhrCDctSharePer, LhrCDctShareAmt, LhrRbySharePer, LhrRbyShareAmt, LhrSDctSharePer, LhrSDctShareAmt, LhrRbyRefNo, LhrRbyRefDt, LhrRemark, LhrRecState, LhrCmpCode, LhrUsr1Code, LhrUsr2Code, LhrPrntCnt, LhrBcgCode, LhrBahCode

### LabPymtDtl  (10 cols)
LpyCode, LpyICode, LpySno, LpyDate, LpyPttCode, LpyLhrCode, LpyDepoAmt, LpyShortAmt, LpyRemark, LpyRecState

### LabPymtDtl_Log  (10 cols)
LpyCode, LpyICode, LpySno, LpyDate, LpyPttCode, LpyLhrCode, LpyDepoAmt, LpyShortAmt, LpyRemark, LpyRecState

### LabPymtHdr  (22 cols)
LphCode, LphLpgCode, LphLhrCode, LphVtmCode, LphPrefix, LphVchNo, LphPostfix, LphDate, LphTime, LphOldLphCode, LphPttCode, LphPymtAhCode, LphPymtMode, LphPymtRefNo, LphDepoAmt, LphShortAmt, LphRemark, LphRecState, LphCmpCode, LphUsr1Code, LphUsr2Code, LphPrntCnt

### LabPymtHdr_Log  (22 cols)
LphCode, LphLpgCode, LphLhrCode, LphVtmCode, LphPrefix, LphVchNo, LphPostfix, LphDate, LphTime, LphOldLphCode, LphPttCode, LphPymtAhCode, LphPymtMode, LphPymtRefNo, LphDepoAmt, LphShortAmt, LphRemark, LphRecState, LphCmpCode, LphUsr1Code, LphUsr2Code, LphPrntCnt

### LabRcDctDtl  (17 cols)
LrdCode, LrdLrcCode, LrdICode, LrdSno, LrdSrvCode, LrdPttCode, LrdDctCode, LrdDate, LrdDrlCode, LrdCDctSharePer, LrdCDctShareAmt, LrdRbySharePer, LrdRbyShareAmt, LrdSDctSharePer, LrdSDctShareAmt, LrdRemark, LrdRecState

### LabRcDctDtl_Log  (17 cols)
LrdCode, LrdLrcCode, LrdICode, LrdSno, LrdSrvCode, LrdPttCode, LrdDctCode, LrdDate, LrdDrlCode, LrdCDctSharePer, LrdCDctShareAmt, LrdRbySharePer, LrdRbyShareAmt, LrdSDctSharePer, LrdSDctShareAmt, LrdRemark, LrdRecState

### LabRcpt  (27 cols)
LrcCode, LrcICode, LrcSno, LrcDate, LrcPttCode, LrcSrvCode, LrcUnit, LrcRate, LrcAmtBefDisc, LrcDiscPer, LrcDiscAmt, LrcAmtAftDisc, LrcAdvAmt, LrcRecdAmt, LrcDepoAmt, LrcRefuAmt, LrcShortAmt, LrcWOffAmt, LrcBalAmt, LrcCDctSharePer, LrcCDctShareAmt, LrcRbySharePer, LrcRbyShareAmt, LrcSDctSharePer, LrcSDctShareAmt, LrcRecState, LrcRemark

### LabRcpt_Log  (27 cols)
LrcCode, LrcICode, LrcSno, LrcDate, LrcPttCode, LrcSrvCode, LrcUnit, LrcRate, LrcAmtBefDisc, LrcDiscPer, LrcDiscAmt, LrcAmtAftDisc, LrcAdvAmt, LrcRecdAmt, LrcDepoAmt, LrcRefuAmt, LrcShortAmt, LrcWOffAmt, LrcBalAmt, LrcCDctSharePer, LrcCDctShareAmt, LrcRbySharePer, LrcRbyShareAmt, LrcSDctSharePer, LrcSDctShareAmt, LrcRemark, LrcRecState

### LabRefdDtl  (10 cols)
LfdCode, LfdICode, LfdSno, LfdDate, LfdPttCode, LfdLhrCode, LfdRefuAmt, LfdWOffAmt, LfdRecState, LfdRemark

### LabRefdDtl_Log  (10 cols)
LfdCode, LfdICode, LfdSno, LfdDate, LfdPttCode, LfdLhrCode, LfdRefuAmt, LfdWOffAmt, LfdRemark, LfdRecState

### LabRefdHdr  (22 cols)
LfhCode, LfhLpgCode, LfhLhrCode, LfhVtmCode, LfhVchNo, LfhDate, LfhTime, LfhOldLfhCode, LfhPttCode, LfhPymtAhCode, LfhRefuAmt, LfhWOffAmt, LfhRecState, LfhCmpCode, LfhUsr1Code, LfhUsr2Code, LfhPrntCnt, LfhPrefix, LfhPostfix, LfhPymtMode, LfhPymtRefNo, LfhRemark

### LabRefdHdr_Log  (22 cols)
LfhCode, LfhLpgCode, LfhLhrCode, LfhVtmCode, LfhPrefix, LfhVchNo, LfhPostfix, LfhDate, LfhTime, LfhOldLfhCode, LfhPttCode, LfhPymtAhCode, LfhPymtMode, LfhPymtRefNo, LfhRefuAmt, LfhWOffAmt, LfhRemark, LfhRecState, LfhCmpCode, LfhUsr1Code, LfhUsr2Code, LfhPrntCnt

### TestRepFmtDtl  (15 cols)
TftCode, TftICode, TftSno, TftDate, TftPttCode, TftTfmCode, TftTspCode, TftSampCollDate, TftRepGenDate, TftRecState, TftNewPage, TftMergeRepo, TftHdrNote, TftFtrNote, TftRemark

### TestRepFmtDtl_Log  (15 cols)
TftCode, TftICode, TftSno, TftDate, TftPttCode, TftTfmCode, TftHdrNote, TftFtrNote, TftTspCode, TftSampCollDate, TftRepGenDate, TftRemark, TftRecState, TftNewPage, TftMergeRepo

### TestRepParaDtl  (22 cols)
TrdCode, TrdTftCode, TrdICode, TrdSno, TrdDate, TrdPttCode, TrdTfmCode, TrdTprCode, TrdTgpCode, TrdRng1, TrdRng2, TrdPrintRec, TrdRecState, TrdTdpCode, TrdExmValue, TrdExmNote1, TrdExmNote2, TrdExmNote3, TrdRngUnit, TrdRemark, TrdHdrNote, TrdFtrNote

### TestRepParaDtl_Log  (22 cols)
TrdCode, TrdTftCode, TrdICode, TrdSno, TrdDate, TrdPttCode, TrdTfmCode, TrdTprCode, TrdTgpCode, TrdExmValue, TrdExmNote1, TrdExmNote2, TrdExmNote3, TrdRng1, TrdRng2, TrdRngUnit, TrdPrintRec, TrdRemark, TrdHdrNote, TrdFtrNote, TrdRecState, TrdTdpCode

### TestRepoHdr  (22 cols)
TrhCode, TrhLnkVchCode, TrhLnkVtmCode, TrhVtmCode, TrhVchNo, TrhDate, TrhTime, TrhPttCode, TrhCDctCode, TrhRByCode, TrhRToCode, TrhPDigCode, TrhFDigCode, TrhRecState, TrhCmpCode, TrhUsr1Code, TrhUsr2Code, TrhBcgCode, TrhBahCode, TrhPrefix, TrhPostfix, TrhRemark

### TestRepoHdr_Log  (22 cols)
TrhCode, TrhLnkVchCode, TrhLnkVtmCode, TrhVtmCode, TrhPrefix, TrhVchNo, TrhPostfix, TrhDate, TrhTime, TrhPttCode, TrhCDctCode, TrhRByCode, TrhRToCode, TrhPDigCode, TrhFDigCode, TrhRemark, TrhRecState, TrhCmpCode, TrhUsr1Code, TrhUsr2Code, TrhBcgCode, TrhBahCode

## DrugMast.Mdb


### MediCpoMst  (7 cols)
MpoCode, MpoScdH1, MpoIndex, MpoShowInList, MpoRecState, MpoName, MpoDesc

### MediCpoMst_Log  (7 cols)
MpoCode, MpoName, MpoDesc, MpoScdH1, MpoIndex, MpoShowInList, MpoRecState

### MediCpyMst  (6 cols)
McyCode, McyIndex, McyShowInList, McyRecState, McyName, McyDesc

### MediCpyMst_Log  (6 cols)
McyCode, McyName, McyDesc, McyIndex, McyShowInList, McyRecState

### MediGrpMst  (6 cols)
MgpCode, MgpIndex, MgpShowInList, MgpRecState, MgpName, MgpDesc

### MediGrpMst_Log  (6 cols)
MgpCode, MgpName, MgpDesc, MgpIndex, MgpShowInList, MgpRecState

### MediMast  (14 cols)
MpdCode, MpdMcyCode, MpdMgpCode, MpdMpoCode, MpdSrvCode, MpdAhCode, MpdLooseQty, MpdIndex, MpdShowInList, MpdRecState, MpdName, MpdDesc, MpdRefNo, MpdPacking

### MediMast_Log  (14 cols)
MpdCode, MpdName, MpdDesc, MpdRefNo, MpdMcyCode, MpdMgpCode, MpdMpoCode, MpdSrvCode, MpdAhCode, MpdPacking, MpdLooseQty, MpdIndex, MpdShowInList, MpdRecState

## DrugTran.Mdb


### DespBill  (27 cols)
DgbCode, DgbICode, DgbSno, DgbDate, DgbPttCode, DgbMpdCode, DgbUnit, DgbRate, DgbAmtBefDisc, DgbDiscPer, DgbDiscAmt, DgbAmtAftDisc, DgbAdvAmt, DgbRecdAmt, DgbDepoAmt, DgbRefuAmt, DgbBalAmt, DgbCDctSharePer, DgbCDctShareAmt, DgbRbySharePer, DgbRbyShareAmt, DgbSDctSharePer, DgbSDctShareAmt, DgbRemark, DgbRecState, DgbBatchNo, DgbUDiv

### DespBill_Log  (27 cols)
DgbCode, DgbICode, DgbSno, DgbDate, DgbPttCode, DgbMpdCode, DgbUnit, DgbRate, DgbAmtBefDisc, DgbDiscPer, DgbDiscAmt, DgbAmtAftDisc, DgbAdvAmt, DgbRecdAmt, DgbDepoAmt, DgbRefuAmt, DgbBalAmt, DgbCDctSharePer, DgbCDctShareAmt, DgbRbySharePer, DgbRbyShareAmt, DgbSDctSharePer, DgbSDctShareAmt, DgbRemark, DgbRecState, DgbBatchNo, DgbUDiv

### DespHdr  (55 cols)
DghCode, DghSpgCode, DghVtmCode, DghPrefix, DghVchNo, DghPostfix, DghDate, DghTime, DghOldDghCode, DghPttCode, DghCDctCode, DghRByCode, DghRToCode, DghPDigCode, DghFDigCode, DghPymtAhCode, DghPymtMode, DghPymtRefNo, DghPttWeight, DghPttHeight, DghEchsRegNo, DghEchsServNo, DghEchsRankNo, DghInspRegNo, DghInspDocNo, DghRefClaimNo, DghProcDate, DghProcTime, DghPrcCode, DghPrcDesc, DghPttDiscPer, DghAmtBefDisc, DghDiscAmt, DghAmtAftDisc, DghAdvAmt, DghRecdAmt, DghDepoAmt, DghRefuAmt, DghBalAmt, DghCDctSharePer, DghCDctShareAmt, DghRbySharePer, DghRbyShareAmt, DghSDctSharePer, DghSDctShareAmt, DghRbyRefNo, DghRbyRefDt, DghRemark, DghRecState, DghCmpCode, DghUsr1Code, DghUsr2Code, DghPrntCnt, DghBcgCode, DghBahCode

### DespHdr_Log  (55 cols)
DghCode, DghSpgCode, DghVtmCode, DghPrefix, DghVchNo, DghPostfix, DghDate, DghTime, DghOldDghCode, DghPttCode, DghCDctCode, DghRByCode, DghRToCode, DghPDigCode, DghFDigCode, DghPymtAhCode, DghPymtMode, DghPymtRefNo, DghPttWeight, DghPttHeight, DghEchsRegNo, DghEchsServNo, DghEchsRankNo, DghInspRegNo, DghInspDocNo, DghRefClaimNo, DghProcDate, DghProcTime, DghPrcCode, DghPrcDesc, DghPttDiscPer, DghAmtBefDisc, DghDiscAmt, DghAmtAftDisc, DghAdvAmt, DghRecdAmt, DghDepoAmt, DghRefuAmt, DghBalAmt, DghCDctSharePer, DghCDctShareAmt, DghRbySharePer, DghRbyShareAmt, DghSDctSharePer, DghSDctShareAmt, DghRbyRefNo, DghRbyRefDt, DghRemark, DghRecState, DghCmpCode, DghUsr1Code, DghUsr2Code, DghPrntCnt, DghBcgCode, DghBahCode

### DespPymtDtl  (9 cols)
DgpyCode, DgpyICode, DgpySno, DgpyDate, DgpyPttCode, DgpyDghCode, DgpyDepoAmt, DgpyRemark, DgpyRecState

### DespPymtDtl_Log  (9 cols)
DgpyCode, DgpyICode, DgpySno, DgpyDate, DgpyPttCode, DgpyDghCode, DgpyDepoAmt, DgpyRemark, DgpyRecState

### DespPymtHdr  (21 cols)
DgphCode, DgphSpgCode, DgphDghCode, DgphVtmCode, DgphPrefix, DgphVchNo, DgphPostfix, DgphDate, DgphTime, DgphOldDgphCode, DgphPttCode, DgphPymtAhCode, DgphPymtMode, DgphPymtRefNo, DgphDepoAmt, DgphRemark, DgphRecState, DgphCmpCode, DgphUsr1Code, DgphUsr2Code, DgphPrntCnt

### DespPymtHdr_Log  (21 cols)
DgphCode, DgphSpgCode, DgphDghCode, DgphVtmCode, DgphPrefix, DgphVchNo, DgphPostfix, DgphDate, DgphTime, DgphOldDgphCode, DgphPttCode, DgphPymtAhCode, DgphPymtMode, DgphPymtRefNo, DgphDepoAmt, DgphRemark, DgphRecState, DgphCmpCode, DgphUsr1Code, DgphUsr2Code, DgphPrntCnt

### DespRefdDtl  (9 cols)
DgfdCode, DgfdICode, DgfdSno, DgfdDate, DgfdPttCode, DgfdDghCode, DgfdRefuAmt, DgfdRemark, DgfdRecState

### DespRefdDtl_Log  (9 cols)
DgfdCode, DgfdICode, DgfdSno, DgfdDate, DgfdPttCode, DgfdDghCode, DgfdRefuAmt, DgfdRemark, DgfdRecState

### DespRefdHdr  (21 cols)
DgfhCode, DgfhSpgCode, DgfhDghCode, DgfhVtmCode, DgfhPrefix, DgfhVchNo, DgfhPostfix, DgfhDate, DgfhTime, DgfhOldDgfhCode, DgfhPttCode, DgfhPymtAhCode, DgfhPymtMode, DgfhPymtRefNo, DgfhRefuAmt, DgfhRemark, DgfhRecState, DgfhCmpCode, DgfhUsr1Code, DgfhUsr2Code, DgfhPrntCnt

### DespRefdHdr_Log  (21 cols)
DgfhCode, DgfhSpgCode, DgfhDghCode, DgfhVtmCode, DgfhPrefix, DgfhVchNo, DgfhPostfix, DgfhDate, DgfhTime, DgfhOldDgfhCode, DgfhPttCode, DgfhPymtAhCode, DgfhPymtMode, DgfhPymtRefNo, DgfhRefuAmt, DgfhRemark, DgfhRecState, DgfhCmpCode, DgfhUsr1Code, DgfhUsr2Code, DgfhPrntCnt

## GrpData.Mdb


### gAchdSum  (5 cols)
GasICode, GasDate, GasAhCode, GasAmt, GasRecState

### gProdSum  (8 cols)
GpsICode, GpsDate, GpsItmCode, GpsItmRefCode, GpsQty, GpsRate, GpsValue, GpsRecState

## HmsAcMst.Mdb


## HmsAcTrn.Mdb


### BnkPymtDtl  (12 cols)
BpyCode, BpyICode, BpySno, BpyDate, BpyBnkAhCode, BpyAhCode, BpyChqNo, BpyNarr, BpyChqClearDt, BpyAmount, BpyRemark, BpyRecState

### BnkPymtDtl_Log  (12 cols)
BpyCode, BpyICode, BpySno, BpyDate, BpyBnkAhCode, BpyAhCode, BpyChqNo, BpyNarr, BpyChqClearDt, BpyAmount, BpyRemark, BpyRecState

### BnkPymtHdr  (18 cols)
BphCode, BphVtmCode, BphPrefix, BphVchNo, BphPostfix, BphDate, BphTime, BphTrnRefNo, BphTrnRefDt, BphBnkAhCode, BphAmount, BphNarr, BphRemark, BphRecState, BphCmpCode, BphUsr1Code, BphUsr2Code, BphPrntCnt

### BnkPymtHdr_Log  (18 cols)
BphCode, BphVtmCode, BphPrefix, BphVchNo, BphPostfix, BphDate, BphTime, BphTrnRefNo, BphTrnRefDt, BphBnkAhCode, BphAmount, BphNarr, BphRemark, BphRecState, BphCmpCode, BphUsr1Code, BphUsr2Code, BphPrntCnt

### BnkRcptDtl  (14 cols)
BrcCode, BrcICode, BrcSno, BrcDate, BrcBnkAhCode, BrcAhCode, BrcChqNo, BrcChqDate, BrcBkrCode, BrcNarr, BrcChqClearDt, BrcAmount, BrcRemark, BrcRecState

### BnkRcptDtl_Log  (14 cols)
BrcCode, BrcICode, BrcSno, BrcDate, BrcBnkAhCode, BrcAhCode, BrcChqNo, BrcChqDate, BrcBkrCode, BrcNarr, BrcChqClearDt, BrcAmount, BrcRemark, BrcRecState

### BnkRcptHdr  (18 cols)
BrhCode, BrhVtmCode, BrhPrefix, BrhVchNo, BrhPostfix, BrhDate, BrhTime, BrhTrnRefNo, BrhTrnRefDt, BrhBnkAhCode, BrhAmount, BrhNarr, BrhRemark, BrhRecState, BrhCmpCode, BrhUsr1Code, BrhUsr2Code, BrhPrntCnt

### BnkRcptHdr_Log  (18 cols)
BrhCode, BrhVtmCode, BrhPrefix, BrhVchNo, BrhPostfix, BrhDate, BrhTime, BrhTrnRefNo, BrhTrnRefDt, BrhBnkAhCode, BrhAmount, BrhNarr, BrhRemark, BrhRecState, BrhCmpCode, BrhUsr1Code, BrhUsr2Code, BrhPrntCnt

### CshPymtDtl  (10 cols)
CpyCode, CpyICode, CpySno, CpyDate, CpyCshAhCode, CpyAhCode, CpyNarr, CpyAmount, CpyRemark, CpyRecState

### CshPymtDtl_Log  (10 cols)
CpyCode, CpyICode, CpySno, CpyDate, CpyCshAhCode, CpyAhCode, CpyNarr, CpyAmount, CpyRemark, CpyRecState

### CshPymtHdr  (18 cols)
CphCode, CphVtmCode, CphPrefix, CphVchNo, CphPostfix, CphDate, CphTime, CphTrnRefNo, CphTrnRefDt, CphCshAhCode, CphAmount, CphNarr, CphRemark, CphRecState, CphCmpCode, CphUsr1Code, CphUsr2Code, CphPrntCnt

### CshPymtHdr_Log  (18 cols)
CphCode, CphVtmCode, CphPrefix, CphVchNo, CphPostfix, CphDate, CphTime, CphTrnRefNo, CphTrnRefDt, CphCshAhCode, CphAmount, CphNarr, CphRemark, CphRecState, CphCmpCode, CphUsr1Code, CphUsr2Code, CphPrntCnt

### CshRcptDtl  (10 cols)
CrcCode, CrcICode, CrcSno, CrcDate, CrcCshAhCode, CrcAhCode, CrcNarr, CrcAmount, CrcRemark, CrcRecState

### CshRcptDtl_Log  (10 cols)
CrcCode, CrcICode, CrcSno, CrcDate, CrcCshAhCode, CrcAhCode, CrcNarr, CrcAmount, CrcRemark, CrcRecState

### CshRcptHdr  (18 cols)
CrhCode, CrhVtmCode, CrhPrefix, CrhVchNo, CrhPostfix, CrhDate, CrhTime, CrhTrnRefNo, CrhTrnRefDt, CrhCshAhCode, CrhAmount, CrhNarr, CrhRemark, CrhRecState, CrhCmpCode, CrhUsr1Code, CrhUsr2Code, CrhPrntCnt

### CshRcptHdr_Log  (18 cols)
CrhCode, CrhVtmCode, CrhPrefix, CrhVchNo, CrhPostfix, CrhDate, CrhTime, CrhTrnRefNo, CrhTrnRefDt, CrhCshAhCode, CrhAmount, CrhNarr, CrhRemark, CrhRecState, CrhCmpCode, CrhUsr1Code, CrhUsr2Code, CrhPrntCnt

## HospMast.Mdb


### BedMast  (16 cols)
BdmCode, BdmFlrCode, BdmWrdCode, BdmSrvCode, BdmIndex, BdmCharges, BdmDiscAllowed, BdmDiscPer, BdmChkOutTimeBasis, BdmChkTime, BdmFreeAllot, BdmShowInList, BdmRecState, BdmAlloted, BdmName, BdmRemark

### BedMast_Log  (16 cols)
BdmCode, BdmName, BdmFlrCode, BdmWrdCode, BdmSrvCode, BdmIndex, BdmCharges, BdmDiscAllowed, BdmDiscPer, BdmChkOutTimeBasis, BdmChkTime, BdmFreeAllot, BdmRemark, BdmShowInList, BdmRecState, BdmAlloted

### BedSrvMst  (7 cols)
BsmCode, BsmICode, BsmSno, BsmSrvCode, BsmUnit, BsmRate, BsmRecState

### BedSrvMst_Log  (7 cols)
BsmCode, BsmICode, BsmSno, BsmSrvCode, BsmUnit, BsmRate, BsmRecState

### DiagMast  (3 cols)
DigCode, DigRecState, DigName

### DiagMast_Log  (3 cols)
DigCode, DigName, DigRecState

### DiagSrvMst  (7 cols)
DsmCode, DsmICode, DsmSno, DsmSrvCode, DsmUnit, DsmRate, DsmRecState

### DiagSrvMst_Log  (7 cols)
DsmCode, DsmICode, DsmSno, DsmSrvCode, DsmUnit, DsmRate, DsmRecState

### DoctCatgMst  (3 cols)
DcgCode, DcgRecState, DcgName

### DoctCatgMst_Log  (3 cols)
DcgCode, DcgName, DcgRecState

### DoctMast  (15 cols)
DctCode, DctDcgCode, DctDrlCode, DctAhCode, DctShare, DctRecState, DctRegValidDays, DctTitle, DctName, DctSpeci, DctAddr, DctTelNo, DctEmail, DctPresNote, DctReg1No

### DoctMast_Log  (15 cols)
DctCode, DctTitle, DctName, DctSpeci, DctDcgCode, DctDrlCode, DctAddr, DctTelNo, DctEmail, DctAhCode, DctShare, DctRecState, DctPresNote, DctRegValidDays, DctReg1No

### DoctRoleMst  (3 cols)
DrlCode, DrlRecState, DrlName

### DoctRoleMst_Log  (3 cols)
DrlCode, DrlName, DrlRecState

### FloorMast  (4 cols)
FlrCode, FlrShowInList, FlrRecState, FlrName

### FloorMast_Log  (4 cols)
FlrCode, FlrName, FlrShowInList, FlrRecState

### PackgMast  (4 cols)
PkgCode, PkgName, PkgRemark, PkgRecState

### PackgMast_Log  (4 cols)
PkgCode, PkgName, PkgRemark, PkgRecState

### PackgSrvMst  (7 cols)
PksCode, PksICode, PksSno, PksSrvCode, PksUnit, PksRate, PksRecState

### PackgSrvMst_Log  (7 cols)
PksCode, PksICode, PksSno, PksSrvCode, PksUnit, PksRate, PksRecState

### PatCatgMst  (9 cols)
PcgCode, PcgInfAllowed, PcgDefAllowed, PcgDiscAllowed, PcgDiscPer, PcgShowInList, PcgRecState, PcgType, PcgName

### PatCatgMst_Log  (9 cols)
PcgCode, PcgName, PcgInfAllowed, PcgDefAllowed, PcgDiscAllowed, PcgDiscPer, PcgShowInList, PcgRecState, PcgType

### PatMast  (38 cols)
PttCode, PttRegNo, PttRegDate, PttAhCode, PttPcgCode, PttPrfCode, PttAgeAsOnDt, PttDob, PttAraCode, PttStnCode, PttInfAllowed, PttDefAllowed, PttDiscAllowed, PttDiscPer, PttShowInList, PttOpgCount, PttIpgCount, PttDpgCount, PttLpgCount, PttDlbCount, PttClnCount, PttRecState, PttSalute, PttName, PttSex, PttRefRela, PttRefName, PttAddr, PttTelNo, PttSMSNo, PttEmail, PttAadharNo, PttEchsRegNo, PttEchsServNo, PttEchsRankNo, PttInspRegNo, PttInspDocNo, PttRemark

### PatMast_Log  (0 cols)


### PatRefMst  (29 cols)
PrfCode, PrfName, PrfRegNo, PrfRegDate, PrfAhCode, PrfPcgCode, PrfSex, PrfAgeAsOnDt, PrfDob, PrfRefRela, PrfRefName, PrfAddr, PrfAraCode, PrfStnCode, PrfTelNo, PrfSMSNo, PrfEmail, PrfRef1No, PrfRef2No, PrfRef3No, PrfInspRegNo, PrfInspDocNo, PrfInfAllowed, PrfDefAllowed, PrfDiscAllowed, PrfDiscPer, PrfShowInList, PrfRemark, PrfRecState

### PatRefMst_Log  (29 cols)
PrfCode, PrfName, PrfRegNo, PrfRegDate, PrfAhCode, PrfPcgCode, PrfSex, PrfAgeAsOnDt, PrfDob, PrfRefRela, PrfRefName, PrfAddr, PrfAraCode, PrfStnCode, PrfTelNo, PrfSMSNo, PrfEmail, PrfRef1No, PrfRef2No, PrfRef3No, PrfInspRegNo, PrfInspDocNo, PrfInfAllowed, PrfDefAllowed, PrfDiscAllowed, PrfDiscPer, PrfShowInList, PrfRemark, PrfRecState

### ProcMast  (5 cols)
PrcCode, PrcRecState, PrcName, PrcRefCode, PrcDesc

### ProcMast_Log  (5 cols)
PrcCode, PrcName, PrcRefCode, PrcDesc, PrcRecState

### RefByMast  (10 cols)
RByCode, RByRfgCode, RByAhCode, RByShare, RByRecState, RByName, RBySpeci, RByAddr, RByTelNo, RByEmail

### RefByMast_Log  (10 cols)
RByCode, RByName, RBySpeci, RByRfgCode, RByAddr, RByTelNo, RByEmail, RByAhCode, RByShare, RByRecState

### RefCatgMst  (3 cols)
RfgCode, RfgRecState, RfgName

### RefCatgMst_Log  (3 cols)
RfgCode, RfgName, RfgRecState

### RefToMast  (10 cols)
RToCode, RToName, RToSpeci, RToRfgCode, RToAddr, RToTelNo, RToEmail, RToAhCode, RToShare, RToRecState

### RefToMast_Log  (10 cols)
RToCode, RToName, RToSpeci, RToRfgCode, RToAddr, RToTelNo, RToEmail, RToAhCode, RToShare, RToRecState

### ServGrpMst  (37 cols)
SgpCode, SgpIndex, SgpExpanded, SgpEditable, SgpInfAllowed, SgpDefAllowed, SgpDiscAllowed, SgpDiscPer, SgpExtRateSys, SgpDctwseRateSys, SgpPcgwseRateSys, SgpRBywseRateSys, SgpRTowseRateSys, SgpTimewseRateSys, SgpExtDiscSys, SgpDctwseDiscSys, SgpPcgwseDiscSys, SgpRBywseDiscSys, SgpRTowseDiscSys, SgpTimewseDiscSys, SgpExtBargSys, SgpDctwseBargSys, SgpPcgwseBargSys, SgpRBywseBargSys, SgpRTowseBargSys, SgpTimewseBargSys, SgpExtShareSys, SgpDctwseShareSys, SgpPcgwseShareSys, SgpRBywseShareSys, SgpRTowseShareSys, SgpTimewseShareSys, SgpShowInList, SgpRecState, SgpShared, SgpName, SgpPrntName

### ServGrpMst_Log  (37 cols)
SgpCode, SgpName, SgpIndex, SgpExpanded, SgpEditable, SgpInfAllowed, SgpDefAllowed, SgpDiscAllowed, SgpDiscPer, SgpExtRateSys, SgpDctwseRateSys, SgpPcgwseRateSys, SgpRBywseRateSys, SgpRTowseRateSys, SgpTimewseRateSys, SgpExtDiscSys, SgpDctwseDiscSys, SgpPcgwseDiscSys, SgpRBywseDiscSys, SgpRTowseDiscSys, SgpTimewseDiscSys, SgpExtBargSys, SgpDctwseBargSys, SgpPcgwseBargSys, SgpRBywseBargSys, SgpRTowseBargSys, SgpTimewseBargSys, SgpExtShareSys, SgpDctwseShareSys, SgpPcgwseShareSys, SgpRBywseShareSys, SgpRTowseShareSys, SgpTimewseShareSys, SgpShowInList, SgpRecState, SgpPrntName, SgpShared

### ServMast  (52 cols)
SrvCode, SrvSgpCode, SrvAhCode, SrvIndex, SrvRate, SrvOpdGenChg, SrvOpdEmgChg, SrvIpdGenChg, SrvIpdEmgChg, SrvLabGenChg, SrvLabEmgChg, SrvMultiDctIncl, SrvAutoInsIpdBill, SrvAutoCalcIpdBill, SrvAutoInsOnceIpdBill, SrvUnitEditable, SrvRateEditable, SrvAmtEditable, SrvInfAllowed, SrvDefAllowed, SrvDiscAllowed, SrvDiscPer, SrvDctwseRateSys, SrvPcgwseRateSys, SrvRBywseRateSys, SrvRTowseRateSys, SrvTimewseRateSys, SrvDctwseDiscSys, SrvPcgwseDiscSys, SrvRBywseDiscSys, SrvRTowseDiscSys, SrvTimewseDiscSys, SrvDctwseBargSys, SrvPcgwseBargSys, SrvRBywseBargSys, SrvRTowseBargSys, SrvTimewseBargSys, SrvDctwseShareSys, SrvPcgwseShareSys, SrvRBywseShareSys, SrvRTowseShareSys, SrvTimewseShareSys, SrvShowInList, SrvRecState, SrvIndsRate, SrvTfmCode, SrvShared, SrvVtsCode, SrvRemarkOpt, SrvName, SrvDesc, SrvRefNo

### ServMast_Log  (52 cols)
SrvCode, SrvName, SrvDesc, SrvRefNo, SrvSgpCode, SrvAhCode, SrvIndex, SrvRate, SrvOpdGenChg, SrvOpdEmgChg, SrvIpdGenChg, SrvIpdEmgChg, SrvLabGenChg, SrvLabEmgChg, SrvMultiDctIncl, SrvAutoInsIpdBill, SrvAutoCalcIpdBill, SrvAutoInsOnceIpdBill, SrvUnitEditable, SrvRateEditable, SrvAmtEditable, SrvInfAllowed, SrvDefAllowed, SrvDiscAllowed, SrvDiscPer, SrvDctwseRateSys, SrvPcgwseRateSys, SrvRBywseRateSys, SrvRTowseRateSys, SrvTimewseRateSys, SrvDctwseDiscSys, SrvPcgwseDiscSys, SrvRBywseDiscSys, SrvRTowseDiscSys, SrvTimewseDiscSys, SrvDctwseBargSys, SrvPcgwseBargSys, SrvRBywseBargSys, SrvRTowseBargSys, SrvTimewseBargSys, SrvDctwseShareSys, SrvPcgwseShareSys, SrvRBywseShareSys, SrvRTowseShareSys, SrvTimewseShareSys, SrvShowInList, SrvRecState, SrvIndsRate, SrvTfmCode, SrvShared, SrvVtsCode, SrvRemarkOpt

### ServRateMst  (18 cols)
SrmCode, SrmICode, SrmSno, SrmWefDate, SrmPcgCode, SrmDctCode, SrmRByCode, SrmRToCode, SrmStartTime, SrmEndTime, SrmRate, SrmDiscPer, SrmInfByPer, SrmDefByPer, SrmSharePer, SrmShareAmt, SrmRecState, SrmRemark

### ServRateMst_Log  (18 cols)
SrmCode, SrmICode, SrmSno, SrmWefDate, SrmPcgCode, SrmDctCode, SrmRByCode, SrmRToCode, SrmStartTime, SrmEndTime, SrmRate, SrmDiscPer, SrmInfByPer, SrmDefByPer, SrmSharePer, SrmShareAmt, SrmRemark, SrmRecState

### WardMast  (4 cols)
WrdCode, WrdShowInList, WrdRecState, WrdName

### WardMast_Log  (4 cols)
WrdCode, WrdName, WrdShowInList, WrdRecState

## HospTran.Mdb


### DictHdr  (57 cols)
DhrCode, DhrDpgCode, DhrVtmCode, DhrVchNo, DhrDate, DhrTime, DhrOldDhrCode, DhrPttCode, DhrCDctCode, DhrRByCode, DhrRToCode, DhrPDigCode, DhrFDigCode, DhrPymtAhCode, DhrPttWeight, DhrProcDate, DhrProcTime, DhrPrcCode, DhrPttDiscPer, DhrAmtBefDisc, DhrDiscAmt, DhrAmtAftDisc, DhrAdvAmt, DhrRecdAmt, DhrDepoAmt, DhrRefuAmt, DhrShortAmt, DhrWOffAmt, DhrBalAmt, DhrCDctSharePer, DhrCDctShareAmt, DhrRbySharePer, DhrRbyShareAmt, DhrSDctSharePer, DhrSDctShareAmt, DhrRbyRefDt, DhrRecState, DhrCmpCode, DhrUsr1Code, DhrUsr2Code, DhrPrntCnt, DhrBcgCode, DhrBahCode, DhrPrefix, DhrPostfix, DhrPymtMode, DhrPymtRefNo, DhrPttHeight, DhrEchsRegNo, DhrEchsServNo, DhrEchsRankNo, DhrInspRegNo, DhrInspDocNo, DhrRefClaimNo, DhrPrcDesc, DhrRbyRefNo, DhrRemark

### DictHdr_Log  (57 cols)
DhrCode, DhrDpgCode, DhrVtmCode, DhrPrefix, DhrVchNo, DhrPostfix, DhrDate, DhrTime, DhrOldDhrCode, DhrPttCode, DhrCDctCode, DhrRByCode, DhrRToCode, DhrPDigCode, DhrFDigCode, DhrPymtAhCode, DhrPymtMode, DhrPymtRefNo, DhrPttWeight, DhrPttHeight, DhrEchsRegNo, DhrEchsServNo, DhrEchsRankNo, DhrInspRegNo, DhrInspDocNo, DhrRefClaimNo, DhrProcDate, DhrProcTime, DhrPrcCode, DhrPrcDesc, DhrPttDiscPer, DhrAmtBefDisc, DhrDiscAmt, DhrAmtAftDisc, DhrAdvAmt, DhrRecdAmt, DhrDepoAmt, DhrRefuAmt, DhrShortAmt, DhrWOffAmt, DhrBalAmt, DhrCDctSharePer, DhrCDctShareAmt, DhrRbySharePer, DhrRbyShareAmt, DhrSDctSharePer, DhrSDctShareAmt, DhrRbyRefNo, DhrRbyRefDt, DhrRemark, DhrRecState, DhrCmpCode, DhrUsr1Code, DhrUsr2Code, DhrPrntCnt, DhrBcgCode, DhrBahCode

### DictPymtDtl  (10 cols)
DpyCode, DpyICode, DpySno, DpyDate, DpyPttCode, DpyDhrCode, DpyDepoAmt, DpyShortAmt, DpyRemark, DpyRecState

### DictPymtDtl_Log  (10 cols)
DpyCode, DpyICode, DpySno, DpyDate, DpyPttCode, DpyDhrCode, DpyDepoAmt, DpyShortAmt, DpyRemark, DpyRecState

### DictPymtHdr  (22 cols)
DphCode, DphDpgCode, DphDhrCode, DphVtmCode, DphPrefix, DphVchNo, DphPostfix, DphDate, DphTime, DphOldDphCode, DphPttCode, DphPymtAhCode, DphPymtMode, DphPymtRefNo, DphDepoAmt, DphShortAmt, DphRemark, DphRecState, DphCmpCode, DphUsr1Code, DphUsr2Code, DphPrntCnt

### DictPymtHdr_Log  (22 cols)
DphCode, DphDpgCode, DphDhrCode, DphVtmCode, DphPrefix, DphVchNo, DphPostfix, DphDate, DphTime, DphOldDphCode, DphPttCode, DphPymtAhCode, DphPymtMode, DphPymtRefNo, DphDepoAmt, DphShortAmt, DphRemark, DphRecState, DphCmpCode, DphUsr1Code, DphUsr2Code, DphPrntCnt

### DictRcDctDtl  (17 cols)
DrdCode, DrdDrcCode, DrdICode, DrdSno, DrdSrvCode, DrdPttCode, DrdDctCode, DrdDate, DrdDrlCode, DrdCDctSharePer, DrdCDctShareAmt, DrdRbySharePer, DrdRbyShareAmt, DrdSDctSharePer, DrdSDctShareAmt, DrdRecState, DrdRemark

### DictRcDctDtl_Log  (17 cols)
DrdCode, DrdDrcCode, DrdICode, DrdSno, DrdSrvCode, DrdPttCode, DrdDctCode, DrdDate, DrdDrlCode, DrdCDctSharePer, DrdCDctShareAmt, DrdRbySharePer, DrdRbyShareAmt, DrdSDctSharePer, DrdSDctShareAmt, DrdRemark, DrdRecState

### DictRcpt  (27 cols)
DrcCode, DrcICode, DrcSno, DrcDate, DrcPttCode, DrcSrvCode, DrcUnit, DrcRate, DrcAmtBefDisc, DrcDiscPer, DrcDiscAmt, DrcAmtAftDisc, DrcAdvAmt, DrcRecdAmt, DrcDepoAmt, DrcRefuAmt, DrcShortAmt, DrcWOffAmt, DrcBalAmt, DrcCDctSharePer, DrcCDctShareAmt, DrcRbySharePer, DrcRbyShareAmt, DrcSDctSharePer, DrcSDctShareAmt, DrcRecState, DrcRemark

### DictRcpt_Log  (27 cols)
DrcCode, DrcICode, DrcSno, DrcDate, DrcPttCode, DrcSrvCode, DrcUnit, DrcRate, DrcAmtBefDisc, DrcDiscPer, DrcDiscAmt, DrcAmtAftDisc, DrcAdvAmt, DrcRecdAmt, DrcDepoAmt, DrcRefuAmt, DrcShortAmt, DrcWOffAmt, DrcBalAmt, DrcCDctSharePer, DrcCDctShareAmt, DrcRbySharePer, DrcRbyShareAmt, DrcSDctSharePer, DrcSDctShareAmt, DrcRemark, DrcRecState

### DictRefdDtl  (10 cols)
DfdCode, DfdICode, DfdSno, DfdDate, DfdPttCode, DfdDhrCode, DfdRefuAmt, DfdWOffAmt, DfdRecState, DfdRemark

### DictRefdDtl_Log  (10 cols)
DfdCode, DfdICode, DfdSno, DfdDate, DfdPttCode, DfdDhrCode, DfdRefuAmt, DfdWOffAmt, DfdRemark, DfdRecState

### DictRefdHdr  (22 cols)
DfhCode, DfhDpgCode, DfhDhrCode, DfhVtmCode, DfhVchNo, DfhDate, DfhTime, DfhOldDfhCode, DfhPttCode, DfhPymtAhCode, DfhRefuAmt, DfhWOffAmt, DfhRecState, DfhCmpCode, DfhUsr1Code, DfhUsr2Code, DfhPrntCnt, DfhPrefix, DfhPostfix, DfhPymtMode, DfhPymtRefNo, DfhRemark

### DictRefdHdr_Log  (22 cols)
DfhCode, DfhDpgCode, DfhDhrCode, DfhVtmCode, DfhPrefix, DfhVchNo, DfhPostfix, DfhDate, DfhTime, DfhOldDfhCode, DfhPttCode, DfhPymtAhCode, DfhPymtMode, DfhPymtRefNo, DfhRefuAmt, DfhWOffAmt, DfhRemark, DfhRecState, DfhCmpCode, DfhUsr1Code, DfhUsr2Code, DfhPrntCnt

### IBedState  (17 cols)
IbsCode, IbsSno, IbsVtmCode, IbsVchNo, IbsDate, IbsTime, IbsIpgCode, IbsBdmCode, IbsDischDate, IbsDischTime, IbsPttCode, IbsDischState, IbsLIbsCode, IbsRecState, IbsPrefix, IbsPostfix, IbsRemark

### IBedState_Log  (17 cols)
IbsCode, IbsSno, IbsVtmCode, IbsPrefix, IbsVchNo, IbsPostfix, IbsDate, IbsTime, IbsIpgCode, IbsBdmCode, IbsDischDate, IbsDischTime, IbsPttCode, IbsDischState, IbsLIbsCode, IbsRemark, IbsRecState

### IndrBill  (32 cols)
IblCode, IblICode, IblSno, IblDate, IblIpgCode, IblPttCode, IblSrvCode, IblUnit, IblRate, IblAmtBefDisc, IblDiscPer, IblDiscAmt, IblAmtAftDisc, IblAdvAmt, IblDpogAmt, IblDepoAmt, IblRfugAmt, IblRefuAmt, IblShortAmt, IblWOffAmt, IblBalAmt, IblCDctSharePer, IblCDctShareAmt, IblRbySharePer, IblRbyShareAmt, IblSDctSharePer, IblSDctShareAmt, IblSrvDate, IblRecState, IblHdrCode, IblDtlCode, IblRemark

### IndrBill_Log  (32 cols)
IblCode, IblICode, IblSno, IblDate, IblIpgCode, IblPttCode, IblSrvCode, IblUnit, IblRate, IblAmtBefDisc, IblDiscPer, IblDiscAmt, IblAmtAftDisc, IblAdvAmt, IblDpogAmt, IblDepoAmt, IblRfugAmt, IblRefuAmt, IblShortAmt, IblWOffAmt, IblBalAmt, IblCDctSharePer, IblCDctShareAmt, IblRbySharePer, IblRbyShareAmt, IblSDctSharePer, IblSDctShareAmt, IblSrvDate, IblRemark, IblRecState, IblHdrCode, IblDtlCode

### IndrBlDctDtl  (17 cols)
IbdCode, IbdIblCode, IbdICode, IbdSno, IbdSrvCode, IbdPttCode, IbdDctCode, IbdDate, IbdDrlCode, IbdCDctSharePer, IbdCDctShareAmt, IbdRbySharePer, IbdRbyShareAmt, IbdSDctSharePer, IbdSDctShareAmt, IbdRecState, IbdRemark

### IndrBlDctDtl_Log  (17 cols)
IbdCode, IbdIblCode, IbdICode, IbdSno, IbdSrvCode, IbdPttCode, IbdDctCode, IbdDate, IbdDrlCode, IbdCDctSharePer, IbdCDctShareAmt, IbdRbySharePer, IbdRbyShareAmt, IbdSDctSharePer, IbdSDctShareAmt, IbdRemark, IbdRecState

### IndrBlDpogDtl  (7 cols)
IbgdCode, IbgdICode, IbgdSno, IbgdIgtCode, IbgdDpogAmt, IbgdRemark, IbgdRecState

### IndrBlDpogDtl_Log  (7 cols)
IbgdCode, IbgdICode, IbgdSno, IbgdIgtCode, IbgdDpogAmt, IbgdRemark, IbgdRecState

### IndrBlHdr  (41 cols)
IbhCode, IbhIpgCode, IbhVtmCode, IbhVchNo, IbhDate, IbhTime, IbhOldIbhCode, IbhPttCode, IbhPttDiscPer, IbhAmtBefDisc, IbhDiscAmt, IbhAmtAftDisc, IbhAdvAmt, IbhDpogAmt, IbhDepoAmt, IbhRfugAmt, IbhRefuAmt, IbhShortAmt, IbhWOffAmt, IbhBalAmt, IbhCDctSharePer, IbhCDctShareAmt, IbhRbySharePer, IbhRbyShareAmt, IbhSDctSharePer, IbhSDctShareAmt, IbhProcDate, IbhProcTime, IbhPrcCode, IbhRecState, IbhCmpCode, IbhUsr1Code, IbhUsr2Code, IbhPrntCnt, IbhBcgCode, IbhBahCode, IbhHdrCode, IbhPrefix, IbhPostfix, IbhRemark, IbhPrcDesc

### IndrBlHdr_Log  (41 cols)
IbhCode, IbhIpgCode, IbhVtmCode, IbhPrefix, IbhVchNo, IbhPostfix, IbhDate, IbhTime, IbhOldIbhCode, IbhPttCode, IbhPttDiscPer, IbhAmtBefDisc, IbhDiscAmt, IbhAmtAftDisc, IbhAdvAmt, IbhDpogAmt, IbhDepoAmt, IbhRfugAmt, IbhRefuAmt, IbhShortAmt, IbhWOffAmt, IbhBalAmt, IbhCDctSharePer, IbhCDctShareAmt, IbhRbySharePer, IbhRbyShareAmt, IbhSDctSharePer, IbhSDctShareAmt, IbhRemark, IbhProcDate, IbhProcTime, IbhPrcCode, IbhPrcDesc, IbhRecState, IbhCmpCode, IbhUsr1Code, IbhUsr2Code, IbhPrntCnt, IbhBcgCode, IbhBahCode, IbhHdrCode

### IndrBlIbsDtl  (13 cols)
IbbsCode, IbbsIblICode, IbbsIpgCode, IbbsICode, IbbsIbsCode, IbbsSno, IbbsFromDate, IbbsFromTime, IbbsToDate, IbbsToTime, IbbsUnit, IbbsRecState, IbbsRemark

### IndrBlIbsDtl_Log  (13 cols)
IbbsCode, IbbsIblICode, IbbsIpgCode, IbbsICode, IbbsIbsCode, IbbsSno, IbbsFromDate, IbbsFromTime, IbbsToDate, IbbsToTime, IbbsUnit, IbbsRemark, IbbsRecState

### IndrBlPymtDtl  (10 cols)
IbpyCode, IbpyICode, IbpySno, IbpyDate, IbpyPttCode, IbpyIbhCode, IbpyDepoAmt, IbpyShortAmt, IbpyRecState, IbpyRemark

### IndrBlPymtDtl_Log  (10 cols)
IbpyCode, IbpyICode, IbpySno, IbpyDate, IbpyPttCode, IbpyIbhCode, IbpyDepoAmt, IbpyShortAmt, IbpyRemark, IbpyRecState

### IndrBlPymtHdr  (21 cols)
IbphCode, IbphIpgCode, IbphVtmCode, IbphVchNo, IbphDate, IbphTime, IbphOldIbphCode, IbphPttCode, IbphPymtAhCode, IbphDepoAmt, IbphShortAmt, IbphRecState, IbphCmpCode, IbphUsr1Code, IbphUsr2Code, IbphPrntCnt, IbphPrefix, IbphPostfix, IbphPymtMode, IbphPymtRefNo, IbphRemark

### IndrBlPymtHdr_Log  (21 cols)
IbphCode, IbphIpgCode, IbphVtmCode, IbphPrefix, IbphVchNo, IbphPostfix, IbphDate, IbphTime, IbphOldIbphCode, IbphPttCode, IbphPymtAhCode, IbphPymtMode, IbphPymtRefNo, IbphDepoAmt, IbphShortAmt, IbphRemark, IbphRecState, IbphCmpCode, IbphUsr1Code, IbphUsr2Code, IbphPrntCnt

### IndrBlRefdDtl  (10 cols)
IbfdCode, IbfdICode, IbfdSno, IbfdDate, IbfdPttCode, IbfdIbhCode, IbfdRefuAmt, IbfdWOffAmt, IbfdRecState, IbfdRemark

### IndrBlRefdDtl_Log  (10 cols)
IbfdCode, IbfdICode, IbfdSno, IbfdDate, IbfdPttCode, IbfdIbhCode, IbfdRefuAmt, IbfdWOffAmt, IbfdRemark, IbfdRecState

### IndrBlRefdHdr  (21 cols)
IbfhCode, IbfhIpgCode, IbfhVtmCode, IbfhVchNo, IbfhDate, IbfhTime, IbfhOldIbfhCode, IbfhPttCode, IbfhPymtAhCode, IbfhRefuAmt, IbfhWOffAmt, IbfhRecState, IbfhCmpCode, IbfhUsr1Code, IbfhUsr2Code, IbfhPrntCnt, IbfhPrefix, IbfhPostfix, IbfhPymtMode, IbfhPymtRefNo, IbfhRemark

### IndrBlRefdHdr_Log  (21 cols)
IbfhCode, IbfhIpgCode, IbfhVtmCode, IbfhPrefix, IbfhVchNo, IbfhPostfix, IbfhDate, IbfhTime, IbfhOldIbfhCode, IbfhPttCode, IbfhPymtAhCode, IbfhPymtMode, IbfhPymtRefNo, IbfhRefuAmt, IbfhWOffAmt, IbfhRemark, IbfhRecState, IbfhCmpCode, IbfhUsr1Code, IbfhUsr2Code, IbfhPrntCnt

### IndrBlRfugDtl  (7 cols)
IbgfCode, IbgfICode, IbgfSno, IbgfIgfCode, IbgfRfugAmt, IbgfRemark, IbgfRecState

### IndrBlRfugDtl_Log  (7 cols)
IbgfCode, IbgfICode, IbgfSno, IbgfIgfCode, IbgfRfugAmt, IbgfRemark, IbgfRecState

### IndrHdr  (38 cols)
IhrCode, IhrIpgCode, IhrVtmCode, IhrVchNo, IhrDate, IhrTime, IhrOldIhrCode, IhrPttCode, IhrPymtAhCode, IhrPttDiscPer, IhrAmtBefDisc, IhrDiscAmt, IhrAmtAftDisc, IhrAdvAmt, IhrRecdAmt, IhrDepoAmt, IhrRefuAmt, IhrShortAmt, IhrWOffAmt, IhrBalAmt, IhrCDctSharePer, IhrCDctShareAmt, IhrRbySharePer, IhrRbyShareAmt, IhrSDctSharePer, IhrSDctShareAmt, IhrRecState, IhrCmpCode, IhrUsr1Code, IhrUsr2Code, IhrPrntCnt, IhrBcgCode, IhrBahCode, IhrPrefix, IhrPostfix, IhrPymtMode, IhrPymtRefNo, IhrRemark

### IndrHdr_Log  (38 cols)
IhrCode, IhrIpgCode, IhrVtmCode, IhrPrefix, IhrVchNo, IhrPostfix, IhrDate, IhrTime, IhrOldIhrCode, IhrPttCode, IhrPymtAhCode, IhrPymtMode, IhrPymtRefNo, IhrPttDiscPer, IhrAmtBefDisc, IhrDiscAmt, IhrAmtAftDisc, IhrAdvAmt, IhrRecdAmt, IhrDepoAmt, IhrRefuAmt, IhrShortAmt, IhrWOffAmt, IhrBalAmt, IhrCDctSharePer, IhrCDctShareAmt, IhrRbySharePer, IhrRbyShareAmt, IhrSDctSharePer, IhrSDctShareAmt, IhrRemark, IhrRecState, IhrCmpCode, IhrUsr1Code, IhrUsr2Code, IhrPrntCnt, IhrBcgCode, IhrBahCode

### IndrPymtDtl  (10 cols)
IpyCode, IpyICode, IpySno, IpyDate, IpyPttCode, IpyIhrCode, IpyDepoAmt, IpyShortAmt, IpyRecState, IpyRemark

### IndrPymtDtl_Log  (10 cols)
IpyCode, IpyICode, IpySno, IpyDate, IpyPttCode, IpyIhrCode, IpyDepoAmt, IpyShortAmt, IpyRemark, IpyRecState

### IndrPymtHdr  (21 cols)
IphCode, IphIpgCode, IphVtmCode, IphVchNo, IphDate, IphTime, IphOldIphCode, IphPttCode, IphPymtAhCode, IphDepoAmt, IphShortAmt, IphRecState, IphCmpCode, IphUsr1Code, IphUsr2Code, IphPrntCnt, IphPrefix, IphPostfix, IphPymtMode, IphPymtRefNo, IphRemark

### IndrPymtHdr_Log  (21 cols)
IphCode, IphIpgCode, IphVtmCode, IphPrefix, IphVchNo, IphPostfix, IphDate, IphTime, IphOldIphCode, IphPttCode, IphPymtAhCode, IphPymtMode, IphPymtRefNo, IphDepoAmt, IphShortAmt, IphRemark, IphRecState, IphCmpCode, IphUsr1Code, IphUsr2Code, IphPrntCnt

### IndrRcDctDtl  (17 cols)
IrdCode, IrdIrcCode, IrdICode, IrdSno, IrdSrvCode, IrdPttCode, IrdDctCode, IrdDate, IrdDrlCode, IrdCDctSharePer, IrdCDctShareAmt, IrdRbySharePer, IrdRbyShareAmt, IrdSDctSharePer, IrdSDctShareAmt, IrdRemark, IrdRecState

### IndrRcDctDtl_Log  (17 cols)
IrdCode, IrdIrcCode, IrdICode, IrdSno, IrdSrvCode, IrdPttCode, IrdDctCode, IrdDate, IrdDrlCode, IrdCDctSharePer, IrdCDctShareAmt, IrdRbySharePer, IrdRbyShareAmt, IrdSDctSharePer, IrdSDctShareAmt, IrdRemark, IrdRecState

### IndrRcpt  (27 cols)
IrcCode, IrcICode, IrcSno, IrcDate, IrcPttCode, IrcSrvCode, IrcUnit, IrcRate, IrcAmtBefDisc, IrcDiscPer, IrcDiscAmt, IrcAmtAftDisc, IrcAdvAmt, IrcRecdAmt, IrcDepoAmt, IrcRefuAmt, IrcShortAmt, IrcWOffAmt, IrcBalAmt, IrcCDctSharePer, IrcCDctShareAmt, IrcRbySharePer, IrcRbyShareAmt, IrcSDctSharePer, IrcSDctShareAmt, IrcRecState, IrcRemark

### IndrRcpt_Log  (27 cols)
IrcCode, IrcICode, IrcSno, IrcDate, IrcPttCode, IrcSrvCode, IrcUnit, IrcRate, IrcAmtBefDisc, IrcDiscPer, IrcDiscAmt, IrcAmtAftDisc, IrcAdvAmt, IrcRecdAmt, IrcDepoAmt, IrcRefuAmt, IrcShortAmt, IrcWOffAmt, IrcBalAmt, IrcCDctSharePer, IrcCDctShareAmt, IrcRbySharePer, IrcRbyShareAmt, IrcSDctSharePer, IrcSDctShareAmt, IrcRemark, IrcRecState

### IndrRefdDtl  (10 cols)
IfdCode, IfdICode, IfdSno, IfdDate, IfdPttCode, IfdIhrCode, IfdRefuAmt, IfdWOffAmt, IfdRecState, IfdRemark

### IndrRefdDtl_Log  (10 cols)
IfdCode, IfdICode, IfdSno, IfdDate, IfdPttCode, IfdIhrCode, IfdRefuAmt, IfdWOffAmt, IfdRemark, IfdRecState

### IndrRefdHdr  (21 cols)
IfhCode, IfhIpgCode, IfhVtmCode, IfhVchNo, IfhDate, IfhTime, IfhOldIfhCode, IfhPttCode, IfhPymtAhCode, IfhRefuAmt, IfhWOffAmt, IfhRecState, IfhCmpCode, IfhUsr1Code, IfhUsr2Code, IfhPrntCnt, IfhPrefix, IfhPostfix, IfhPymtMode, IfhPymtRefNo, IfhRemark

### IndrRefdHdr_Log  (21 cols)
IfhCode, IfhIpgCode, IfhVtmCode, IfhPrefix, IfhVchNo, IfhPostfix, IfhDate, IfhTime, IfhOldIfhCode, IfhPttCode, IfhPymtAhCode, IfhPymtMode, IfhPymtRefNo, IfhRefuAmt, IfhWOffAmt, IfhRemark, IfhRecState, IfhCmpCode, IfhUsr1Code, IfhUsr2Code, IfhPrntCnt

### IndrReg  (41 cols)
IpgCode, IpgVtmCode, IpgVchNo, IpgDate, IpgTime, IpgOldIpgCode, IpgCDctCode, IpgRByCode, IpgRToCode, IpgPttCode, IpgPDigCode, IpgFDigCode, IpgPymtAhCode, IpgPttWeight, IpgBdmCode, IpgIbsCode, IpgDischDate, IpgDischTime, IpgAdvAmt, IpgRbyRefDt, IpgRecState, IpgCmpCode, IpgUsr1Code, IpgUsr2Code, IpgPrntCnt, IpgBcgCode, IpgBahCode, IpgPrefix, IpgPostfix, IpgPymtMode, IpgPymtRefNo, IpgPttHeight, IpgEchsRegNo, IpgEchsServNo, IpgEchsRankNo, IpgInspRegNo, IpgInspDocNo, IpgRefClaimNo, IpgRbyRefNo, IpgDiagNote, IpgRemark

### IndrReg_Log  (41 cols)
IpgCode, IpgVtmCode, IpgPrefix, IpgVchNo, IpgPostfix, IpgDate, IpgTime, IpgOldIpgCode, IpgCDctCode, IpgRByCode, IpgRToCode, IpgPttCode, IpgPDigCode, IpgFDigCode, IpgPymtAhCode, IpgPymtMode, IpgPymtRefNo, IpgPttWeight, IpgPttHeight, IpgEchsRegNo, IpgEchsServNo, IpgEchsRankNo, IpgInspRegNo, IpgInspDocNo, IpgRefClaimNo, IpgBdmCode, IpgIbsCode, IpgDischDate, IpgDischTime, IpgAdvAmt, IpgRbyRefNo, IpgRbyRefDt, IpgDiagNote, IpgRemark, IpgRecState, IpgCmpCode, IpgUsr1Code, IpgUsr2Code, IpgPrntCnt, IpgBcgCode, IpgBahCode

### IndrRgPymt  (22 cols)
IgtCode, IgtIpgCode, IgtVtmCode, IgtVchNo, IgtDate, IgtTime, IgtOldIgtCode, IgtPttCode, IgtPymtAhCode, IgtDpogAmt, IgtAdjAmt, IgtBalAmt, IgtRecState, IgtCmpCode, IgtUsr1Code, IgtUsr2Code, IgtPrntCnt, IgtPrefix, IgtPostfix, IgtPymtMode, IgtPymtRefNo, IgtRemark

### IndrRgPymt_Log  (22 cols)
IgtCode, IgtIpgCode, IgtVtmCode, IgtPrefix, IgtVchNo, IgtPostfix, IgtDate, IgtTime, IgtOldIgtCode, IgtPttCode, IgtPymtAhCode, IgtPymtMode, IgtPymtRefNo, IgtDpogAmt, IgtAdjAmt, IgtBalAmt, IgtRemark, IgtRecState, IgtCmpCode, IgtUsr1Code, IgtUsr2Code, IgtPrntCnt

### IndrRgRefd  (22 cols)
IgfCode, IgfIpgCode, IgfVtmCode, IgfPrefix, IgfVchNo, IgfPostfix, IgfDate, IgfTime, IgfOldIgfCode, IgfPttCode, IgfPymtAhCode, IgfPymtMode, IgfPymtRefNo, IgfRfugAmt, IgfAdjAmt, IgfBalAmt, IgfRemark, IgfRecState, IgfCmpCode, IgfUsr1Code, IgfUsr2Code, IgfPrntCnt

### IndrRgRefd_Log  (22 cols)
IgfCode, IgfIpgCode, IgfVtmCode, IgfPrefix, IgfVchNo, IgfPostfix, IgfDate, IgfTime, IgfOldIgfCode, IgfPttCode, IgfPymtAhCode, IgfPymtMode, IgfPymtRefNo, IgfRfugAmt, IgfAdjAmt, IgfBalAmt, IgfRemark, IgfRecState, IgfCmpCode, IgfUsr1Code, IgfUsr2Code, IgfPrntCnt

### OutdApt  (54 cols)
OapCode, OapVtmCode, OapVchNo, OapDate, OapTime, OapOldOpgCode, OapCDctCode, OapRByCode, OapRToCode, OapPttCode, OapPDigCode, OapFDigCode, OapPymtAhCode, OapMatured, OapLnkVtmCode, OapLnkVchCode, OapPttWeight, OapSrvCode, OapUnit, OapRate, OapAmtBefDisc, OapDiscPer, OapDiscAmt, OapAmtAftDisc, OapRecdAmt, OapDpogAmt, OapRfugAmt, OapShortAmt, OapWOffAmt, OapBalAmt, OapRbyRefDt, OapRecState, OapCmpCode, OapUsr1Code, OapUsr2Code, OapPrntCnt, OapBcgCode, OapBahCode, OapPrefix, OapPostfix, OapPymtMode, OapPymtRefNo, OapCommMode, OapMatyStatus, OapPttHeight, OapEchsRegNo, OapEchsServNo, OapEchsRankNo, OapInspRegNo, OapInspDocNo, OapRefClaimNo, OapRbyRefNo, OapDiagNote, OapRemark

### OutdApt_Log  (54 cols)
OapCode, OapVtmCode, OapPrefix, OapVchNo, OapPostfix, OapDate, OapTime, OapOldOpgCode, OapCDctCode, OapRByCode, OapRToCode, OapPttCode, OapPDigCode, OapFDigCode, OapPymtAhCode, OapPymtMode, OapPymtRefNo, OapCommMode, OapMatured, OapMatyStatus, OapLnkVtmCode, OapLnkVchCode, OapPttWeight, OapPttHeight, OapEchsRegNo, OapEchsServNo, OapEchsRankNo, OapInspRegNo, OapInspDocNo, OapRefClaimNo, OapSrvCode, OapUnit, OapRate, OapAmtBefDisc, OapDiscPer, OapDiscAmt, OapAmtAftDisc, OapRecdAmt, OapDpogAmt, OapRfugAmt, OapShortAmt, OapWOffAmt, OapBalAmt, OapRbyRefNo, OapRbyRefDt, OapDiagNote, OapRemark, OapRecState, OapCmpCode, OapUsr1Code, OapUsr2Code, OapPrntCnt, OapBcgCode, OapBahCode

### OutdBill  (25 cols)
OblCode, OblICode, OblSno, OblDate, OblPttCode, OblSrvCode, OblUnit, OblRate, OblAmtBefDisc, OblDiscPer, OblDiscAmt, OblAmtAftDisc, OblDepoAmt, OblRefuAmt, OblShortAmt, OblWOffAmt, OblBalAmt, OblCDctSharePer, OblCDctShareAmt, OblRbySharePer, OblRbyShareAmt, OblSDctSharePer, OblSDctShareAmt, OblRemark, OblRecState

### OutdBill_Log  (25 cols)
OblCode, OblICode, OblSno, OblDate, OblPttCode, OblSrvCode, OblUnit, OblRate, OblAmtBefDisc, OblDiscPer, OblDiscAmt, OblAmtAftDisc, OblDepoAmt, OblRefuAmt, OblShortAmt, OblWOffAmt, OblBalAmt, OblCDctSharePer, OblCDctShareAmt, OblRbySharePer, OblRbyShareAmt, OblSDctSharePer, OblSDctShareAmt, OblRemark, OblRecState

### OutdBlDctDtl  (17 cols)
ObdCode, ObdOblCode, ObdICode, ObdSno, ObdSrvCode, ObdPttCode, ObdDctCode, ObdDate, ObdDrlCode, ObdCDctSharePer, ObdCDctShareAmt, ObdRbySharePer, ObdRbyShareAmt, ObdSDctSharePer, ObdSDctShareAmt, ObdRemark, ObdRecState

### OutdBlDctDtl_Log  (17 cols)
ObdCode, ObdOblCode, ObdICode, ObdSno, ObdSrvCode, ObdPttCode, ObdDctCode, ObdDate, ObdDrlCode, ObdCDctSharePer, ObdCDctShareAmt, ObdRbySharePer, ObdRbyShareAmt, ObdSDctSharePer, ObdSDctShareAmt, ObdRemark, ObdRecState

### OutdBlHdr  (33 cols)
ObhCode, ObhOpgCode, ObhVtmCode, ObhPrefix, ObhVchNo, ObhPostfix, ObhDate, ObhTime, ObhOldObhCode, ObhPttCode, ObhPttDiscPer, ObhAmtBefDisc, ObhDiscAmt, ObhAmtAftDisc, ObhDepoAmt, ObhRefuAmt, ObhShortAmt, ObhWOffAmt, ObhBalAmt, ObhCDctSharePer, ObhCDctShareAmt, ObhRbySharePer, ObhRbyShareAmt, ObhSDctSharePer, ObhSDctShareAmt, ObhRemark, ObhRecState, ObhCmpCode, ObhUsr1Code, ObhUsr2Code, ObhPrntCnt, ObhBcgCode, ObhBahCode

### OutdBlHdr_Log  (33 cols)
ObhCode, ObhOpgCode, ObhVtmCode, ObhPrefix, ObhVchNo, ObhPostfix, ObhDate, ObhTime, ObhOldObhCode, ObhPttCode, ObhPttDiscPer, ObhAmtBefDisc, ObhDiscAmt, ObhAmtAftDisc, ObhDepoAmt, ObhRefuAmt, ObhShortAmt, ObhWOffAmt, ObhBalAmt, ObhCDctSharePer, ObhCDctShareAmt, ObhRbySharePer, ObhRbyShareAmt, ObhSDctSharePer, ObhSDctShareAmt, ObhRemark, ObhRecState, ObhCmpCode, ObhUsr1Code, ObhUsr2Code, ObhPrntCnt, ObhBcgCode, ObhBahCode

### OutdBlPymtDtl  (10 cols)
ObpyCode, ObpyICode, ObpySno, ObpyDate, ObpyPttCode, ObpyObhCode, ObpyDepoAmt, ObpyShortAmt, ObpyRemark, ObpyRecState

### OutdBlPymtDtl_Log  (10 cols)
ObpyCode, ObpyICode, ObpySno, ObpyDate, ObpyPttCode, ObpyObhCode, ObpyDepoAmt, ObpyShortAmt, ObpyRemark, ObpyRecState

### OutdBlPymtHdr  (21 cols)
ObphCode, ObphOpgCode, ObphVtmCode, ObphPrefix, ObphVchNo, ObphPostfix, ObphDate, ObphTime, ObphOldObphCode, ObphPttCode, ObphPymtAhCode, ObphPymtMode, ObphPymtRefNo, ObphDepoAmt, ObphShortAmt, ObphRemark, ObphRecState, ObphCmpCode, ObphUsr1Code, ObphUsr2Code, ObphPrntCnt

### OutdBlPymtHdr_Log  (21 cols)
ObphCode, ObphOpgCode, ObphVtmCode, ObphPrefix, ObphVchNo, ObphPostfix, ObphDate, ObphTime, ObphOldObphCode, ObphPttCode, ObphPymtAhCode, ObphPymtMode, ObphPymtRefNo, ObphDepoAmt, ObphShortAmt, ObphRemark, ObphRecState, ObphCmpCode, ObphUsr1Code, ObphUsr2Code, ObphPrntCnt

### OutdBlRefdDtl  (10 cols)
ObfdCode, ObfdICode, ObfdSno, ObfdDate, ObfdPttCode, ObfdObhCode, ObfdRefuAmt, ObfdWOffAmt, ObfdRemark, ObfdRecState

### OutdBlRefdDtl_Log  (10 cols)
ObfdCode, ObfdICode, ObfdSno, ObfdDate, ObfdPttCode, ObfdObhCode, ObfdRefuAmt, ObfdWOffAmt, ObfdRemark, ObfdRecState

### OutdBlRefdHdr  (21 cols)
ObfhCode, ObfhOpgCode, ObfhVtmCode, ObfhPrefix, ObfhVchNo, ObfhPostfix, ObfhDate, ObfhTime, ObfhOldObfhCode, ObfhPttCode, ObfhPymtAhCode, ObfhPymtMode, ObfhPymtRefNo, ObfhRefuAmt, ObfhWOffAmt, ObfhRemark, ObfhRecState, ObfhCmpCode, ObfhUsr1Code, ObfhUsr2Code, ObfhPrntCnt

### OutdBlRefdHdr_Log  (21 cols)
ObfhCode, ObfhOpgCode, ObfhVtmCode, ObfhPrefix, ObfhVchNo, ObfhPostfix, ObfhDate, ObfhTime, ObfhOldObfhCode, ObfhPttCode, ObfhPymtAhCode, ObfhPymtMode, ObfhPymtRefNo, ObfhRefuAmt, ObfhWOffAmt, ObfhRemark, ObfhRecState, ObfhCmpCode, ObfhUsr1Code, ObfhUsr2Code, ObfhPrntCnt

### OutdHdr  (42 cols)
OhrCode, OhrOpgCode, OhrVtmCode, OhrVchNo, OhrDate, OhrTime, OhrOldOhrCode, OhrPttCode, OhrPymtAhCode, OhrPttDiscPer, OhrAmtBefDisc, OhrDiscAmt, OhrAmtAftDisc, OhrAdvAmt, OhrRecdAmt, OhrDepoAmt, OhrRefuAmt, OhrShortAmt, OhrWOffAmt, OhrBalAmt, OhrCDctSharePer, OhrCDctShareAmt, OhrRbySharePer, OhrRbyShareAmt, OhrSDctSharePer, OhrSDctShareAmt, OhrProcDate, OhrProcTime, OhrPrcCode, OhrRecState, OhrCmpCode, OhrUsr1Code, OhrUsr2Code, OhrPrntCnt, OhrBcgCode, OhrBahCode, OhrPrefix, OhrPostfix, OhrPymtMode, OhrPymtRefNo, OhrRemark, OhrPrcDesc

### OutdHdr_Log  (42 cols)
OhrCode, OhrOpgCode, OhrVtmCode, OhrPrefix, OhrVchNo, OhrPostfix, OhrDate, OhrTime, OhrOldOhrCode, OhrPttCode, OhrPymtAhCode, OhrPymtMode, OhrPymtRefNo, OhrPttDiscPer, OhrAmtBefDisc, OhrDiscAmt, OhrAmtAftDisc, OhrAdvAmt, OhrRecdAmt, OhrDepoAmt, OhrRefuAmt, OhrShortAmt, OhrWOffAmt, OhrBalAmt, OhrCDctSharePer, OhrCDctShareAmt, OhrRbySharePer, OhrRbyShareAmt, OhrSDctSharePer, OhrSDctShareAmt, OhrRemark, OhrProcDate, OhrProcTime, OhrPrcCode, OhrPrcDesc, OhrRecState, OhrCmpCode, OhrUsr1Code, OhrUsr2Code, OhrPrntCnt, OhrBcgCode, OhrBahCode

### OutdPymtDtl  (10 cols)
OpyCode, OpyICode, OpySno, OpyDate, OpyPttCode, OpyOhrCode, OpyDepoAmt, OpyShortAmt, OpyRecState, OpyRemark

### OutdPymtDtl_Log  (10 cols)
OpyCode, OpyICode, OpySno, OpyDate, OpyPttCode, OpyOhrCode, OpyDepoAmt, OpyShortAmt, OpyRemark, OpyRecState

### OutdPymtHdr  (21 cols)
OphCode, OphOpgCode, OphVtmCode, OphVchNo, OphDate, OphTime, OphOldOphCode, OphPttCode, OphPymtAhCode, OphDepoAmt, OphShortAmt, OphRecState, OphCmpCode, OphUsr1Code, OphUsr2Code, OphPrntCnt, OphPrefix, OphPostfix, OphPymtMode, OphPymtRefNo, OphRemark

### OutdPymtHdr_Log  (21 cols)
OphCode, OphOpgCode, OphVtmCode, OphPrefix, OphVchNo, OphPostfix, OphDate, OphTime, OphOldOphCode, OphPttCode, OphPymtAhCode, OphPymtMode, OphPymtRefNo, OphDepoAmt, OphShortAmt, OphRemark, OphRecState, OphCmpCode, OphUsr1Code, OphUsr2Code, OphPrntCnt

### OutdRcDctDtl  (17 cols)
OrdCode, OrdOrcCode, OrdICode, OrdSno, OrdSrvCode, OrdPttCode, OrdDctCode, OrdDate, OrdDrlCode, OrdCDctSharePer, OrdCDctShareAmt, OrdRbySharePer, OrdRbyShareAmt, OrdSDctSharePer, OrdSDctShareAmt, OrdRemark, OrdRecState

### OutdRcDctDtl_Log  (17 cols)
OrdCode, OrdOrcCode, OrdICode, OrdSno, OrdSrvCode, OrdPttCode, OrdDctCode, OrdDate, OrdDrlCode, OrdCDctSharePer, OrdCDctShareAmt, OrdRbySharePer, OrdRbyShareAmt, OrdSDctSharePer, OrdSDctShareAmt, OrdRemark, OrdRecState

### OutdRcpt  (27 cols)
OrcCode, OrcICode, OrcSno, OrcDate, OrcPttCode, OrcSrvCode, OrcUnit, OrcRate, OrcAmtBefDisc, OrcDiscPer, OrcDiscAmt, OrcAmtAftDisc, OrcAdvAmt, OrcRecdAmt, OrcDepoAmt, OrcRefuAmt, OrcShortAmt, OrcWOffAmt, OrcBalAmt, OrcCDctSharePer, OrcCDctShareAmt, OrcRbySharePer, OrcRbyShareAmt, OrcSDctSharePer, OrcSDctShareAmt, OrcRecState, OrcRemark

### OutdRcpt_Log  (27 cols)
OrcCode, OrcICode, OrcSno, OrcDate, OrcPttCode, OrcSrvCode, OrcUnit, OrcRate, OrcAmtBefDisc, OrcDiscPer, OrcDiscAmt, OrcAmtAftDisc, OrcAdvAmt, OrcRecdAmt, OrcDepoAmt, OrcRefuAmt, OrcShortAmt, OrcWOffAmt, OrcBalAmt, OrcCDctSharePer, OrcCDctShareAmt, OrcRbySharePer, OrcRbyShareAmt, OrcSDctSharePer, OrcSDctShareAmt, OrcRemark, OrcRecState

### OutdRefdDtl  (10 cols)
OfdCode, OfdICode, OfdSno, OfdDate, OfdPttCode, OfdOhrCode, OfdRefuAmt, OfdWOffAmt, OfdRecState, OfdRemark

### OutdRefdDtl_Log  (10 cols)
OfdCode, OfdICode, OfdSno, OfdDate, OfdPttCode, OfdOhrCode, OfdRefuAmt, OfdWOffAmt, OfdRemark, OfdRecState

### OutdRefdHdr  (21 cols)
OfhCode, OfhOpgCode, OfhVtmCode, OfhVchNo, OfhDate, OfhTime, OfhOldOfhCode, OfhPttCode, OfhPymtAhCode, OfhRefuAmt, OfhWOffAmt, OfhRecState, OfhCmpCode, OfhUsr1Code, OfhUsr2Code, OfhPrntCnt, OfhPrefix, OfhPostfix, OfhPymtMode, OfhPymtRefNo, OfhRemark

### OutdRefdHdr_Log  (21 cols)
OfhCode, OfhOpgCode, OfhVtmCode, OfhPrefix, OfhVchNo, OfhPostfix, OfhDate, OfhTime, OfhOldOfhCode, OfhPttCode, OfhPymtAhCode, OfhPymtMode, OfhPymtRefNo, OfhRefuAmt, OfhWOffAmt, OfhRemark, OfhRecState, OfhCmpCode, OfhUsr1Code, OfhUsr2Code, OfhPrntCnt

### OutdReg  (58 cols)
OpgCode, OpgVtmCode, OpgVchNo, OpgDate, OpgTime, OpgOldOpgCode, OpgCDctCode, OpgRByCode, OpgRToCode, OpgPttCode, OpgPDigCode, OpgFDigCode, OpgPymtAhCode, OpgAptVtmCode, OpgAptVchCode, OpgPttWeight, OpgSrvCode, OpgUnit, OpgRate, OpgAmtBefDisc, OpgDiscPer, OpgDiscAmt, OpgAmtAftDisc, OpgRecdAmt, OpgDpogAmt, OpgRfugAmt, OpgShortAmt, OpgWOffAmt, OpgBalAmt, OpgCDctSharePer, OpgCDctShareAmt, OpgRbySharePer, OpgRbyShareAmt, OpgSDctSharePer, OpgSDctShareAmt, OpgRbyRefDt, OpgTokNo, OpgRecState, OpgCmpCode, OpgUsr1Code, OpgUsr2Code, OpgPrntCnt, OpgBcgCode, OpgBahCode, OpgPrefix, OpgPostfix, OpgPymtMode, OpgPymtRefNo, OpgPttHeight, OpgEchsRegNo, OpgEchsServNo, OpgEchsRankNo, OpgInspRegNo, OpgInspDocNo, OpgRefClaimNo, OpgRbyRefNo, OpgDiagNote, OpgRemark

### OutdReg_Log  (58 cols)
OpgCode, OpgVtmCode, OpgPrefix, OpgVchNo, OpgPostfix, OpgDate, OpgTime, OpgOldOpgCode, OpgCDctCode, OpgRByCode, OpgRToCode, OpgPttCode, OpgPDigCode, OpgFDigCode, OpgPymtAhCode, OpgPymtMode, OpgPymtRefNo, OpgAptVtmCode, OpgAptVchCode, OpgPttWeight, OpgPttHeight, OpgEchsRegNo, OpgEchsServNo, OpgEchsRankNo, OpgInspRegNo, OpgInspDocNo, OpgRefClaimNo, OpgSrvCode, OpgUnit, OpgRate, OpgAmtBefDisc, OpgDiscPer, OpgDiscAmt, OpgAmtAftDisc, OpgRecdAmt, OpgDpogAmt, OpgRfugAmt, OpgShortAmt, OpgWOffAmt, OpgBalAmt, OpgCDctSharePer, OpgCDctShareAmt, OpgRbySharePer, OpgRbyShareAmt, OpgSDctSharePer, OpgSDctShareAmt, OpgRbyRefNo, OpgRbyRefDt, OpgDiagNote, OpgTokNo, OpgRemark, OpgRecState, OpgCmpCode, OpgUsr1Code, OpgUsr2Code, OpgPrntCnt, OpgBcgCode, OpgBahCode

### OutdRgPymt  (23 cols)
OgtCode, OgtOpgCode, OgtVtmCode, OgtPrefix, OgtVchNo, OgtPostfix, OgtDate, OgtTime, OgtOldOgtCode, OgtPttCode, OgtPymtAhCode, OgtPymtMode, OgtPymtRefNo, OgtDpogAmt, OgtShortAmt, OgtAdjAmt, OgtBalAmt, OgtRemark, OgtRecState, OgtCmpCode, OgtUsr1Code, OgtUsr2Code, OgtPrntCnt

### OutdRgPymt_Log  (23 cols)
OgtCode, OgtOpgCode, OgtVtmCode, OgtPrefix, OgtVchNo, OgtPostfix, OgtDate, OgtTime, OgtOldOgtCode, OgtPttCode, OgtPymtAhCode, OgtPymtMode, OgtPymtRefNo, OgtDpogAmt, OgtShortAmt, OgtAdjAmt, OgtBalAmt, OgtRemark, OgtRecState, OgtCmpCode, OgtUsr1Code, OgtUsr2Code, OgtPrntCnt

### OutdRgRefd  (23 cols)
OgfCode, OgfOpgCode, OgfVtmCode, OgfVchNo, OgfDate, OgfTime, OgfOldOgfCode, OgfPttCode, OgfPymtAhCode, OgfRfugAmt, OgfWOffAmt, OgfAdjAmt, OgfBalAmt, OgfRecState, OgfCmpCode, OgfUsr1Code, OgfUsr2Code, OgfPrntCnt, OgfPrefix, OgfPostfix, OgfPymtMode, OgfPymtRefNo, OgfRemark

### OutdRgRefd_Log  (23 cols)
OgfCode, OgfOpgCode, OgfVtmCode, OgfPrefix, OgfVchNo, OgfPostfix, OgfDate, OgfTime, OgfOldOgfCode, OgfPttCode, OgfPymtAhCode, OgfPymtMode, OgfPymtRefNo, OgfRfugAmt, OgfWOffAmt, OgfAdjAmt, OgfBalAmt, OgfRemark, OgfRecState, OgfCmpCode, OgfUsr1Code, OgfUsr2Code, OgfPrntCnt

## Payroll.Mdb


### Attendance  (14 cols)
AtdCode, AtdICode, AtdSno, AtdDate, AtdEmpCode, AtdDptCode, AtdDsgCode, AtdSftCode, AtdTime, AtdStatus, AtdStartTime, AtdEndTime, AtdNarr, AtdRecState

### Attendance_Log  (14 cols)
AtdCode, AtdICode, AtdSno, AtdDate, AtdEmpCode, AtdDptCode, AtdDsgCode, AtdSftCode, AtdTime, AtdStatus, AtdStartTime, AtdEndTime, AtdNarr, AtdRecState

### DeptMast  (3 cols)
DptCode, DptName, DptRecState

### DeptMast_Log  (3 cols)
DptCode, DptName, DptRecState

### DesgMast  (3 cols)
DsgCode, DsgName, DsgRecState

### DesgMast_Log  (3 cols)
DsgCode, DsgName, DsgRecState

### EmpMast  (29 cols)
EmpCode, EmpName, EmpAhCode, EmpDptCode, EmpDsgCode, EmpJoinDate, EmpBSalary, EmpSelfPFPer, EmpSelfPFAmt, EmpSelfESICPer, EmpSelfESICAmt, EmpCoPFPer, EmpCoPFAmt, EmpHRAPer, EmpHRAAmt, EmpDAPer, EmpDAAmt, EmpNSalary, EmpWrkTime, EmpHalfDayTime, EmpMinWrkTime, EmpAddOT, EmpCutUT, EmpMnLeaves, EmpYrLeaves, EmpWeeklyOff, EmpJobState, EmpSftCode, EmpRecState

### EmpMast_Log  (29 cols)
EmpCode, EmpName, EmpAhCode, EmpDptCode, EmpDsgCode, EmpJoinDate, EmpBSalary, EmpSelfPFPer, EmpSelfPFAmt, EmpSelfESICPer, EmpSelfESICAmt, EmpCoPFPer, EmpCoPFAmt, EmpHRAPer, EmpHRAAmt, EmpDAPer, EmpDAAmt, EmpNSalary, EmpWrkTime, EmpHalfDayTime, EmpMinWrkTime, EmpAddOT, EmpCutUT, EmpMnLeaves, EmpYrLeaves, EmpWeeklyOff, EmpJobState, EmpSftCode, EmpRecState

### HoliGrant  (9 cols)
HlgCode, HlgHlmCode, HlgDate, HlgEmpCode, HlgDptCode, HlgDsgCode, HlgAlwState, HlgRemark, HlgRecState

### HoliGrant_Log  (9 cols)
HlgCode, HlgHlmCode, HlgDate, HlgEmpCode, HlgDptCode, HlgDsgCode, HlgAlwState, HlgRemark, HlgRecState

### HoliMast  (5 cols)
HlmCode, HlmDate, HlmName, HlmRemark, HlmRecState

### HoliMast_Log  (5 cols)
HlmCode, HlmDate, HlmName, HlmRemark, HlmRecState

### SalarySlip  (47 cols)
SslCode, SslICode, SslSno, SslDate, SslEmpCode, SslDptCode, SslDsgCode, SslStartDt, SslEndDt, SslPresentDays, SslHalfDayDays, SslWeeklyOffDays, SslHolidayDays, SslLeaveDays, SslAbsentDays, SslTotalDays, SslPresentTime, SslHalfDayTime, SslWeeklyOffTime, SslHolidayTime, SslLeaveTime, SslAbsentTime, SslTotalTime, SslExtraTime, SslExtraDays, SslPayableDays, SslPayableTime, SslAddDays, SslAddTime, SslNetPayDays, SslNetPayTime, SslBSalary, SslSelfPFPer, SslSelfPFAmt, SslSelfESICPer, SslSelfESICAmt, SslCoPFPer, SslCoPFAmt, SslHRAPer, SslHRAAmt, SslDAPer, SslDAAmt, SslNSalary, SslPaidStatus, SslPaidDt, SslRemark, SslRecState

### SalarySlip_Log  (47 cols)
SslCode, SslICode, SslSno, SslDate, SslEmpCode, SslDptCode, SslDsgCode, SslStartDt, SslEndDt, SslPresentDays, SslHalfDayDays, SslWeeklyOffDays, SslHolidayDays, SslLeaveDays, SslAbsentDays, SslTotalDays, SslPresentTime, SslHalfDayTime, SslWeeklyOffTime, SslHolidayTime, SslLeaveTime, SslAbsentTime, SslTotalTime, SslExtraTime, SslExtraDays, SslPayableDays, SslPayableTime, SslAddDays, SslAddTime, SslNetPayDays, SslNetPayTime, SslBSalary, SslSelfPFPer, SslSelfPFAmt, SslSelfESICPer, SslSelfESICAmt, SslCoPFPer, SslCoPFAmt, SslHRAPer, SslHRAAmt, SslDAPer, SslDAAmt, SslNSalary, SslPaidStatus, SslPaidDt, SslRemark, SslRecState

## Stock.Mdb


### ProdMast  (5 cols)
ItmCode, ItmName, ItmDesc, ItmDepends, ItmRecState

### ProdMast_Log  (5 cols)
ItmCode, ItmName, ItmDesc, ItmDepends, ItmRecState

### ProdRef  (12 cols)
ItrRefCode, ItrItmCode, ItrRef1Name, ItrRef2Name, ItrStkCode, ItrStkICode, ItrRate, ItrPRate, ItrMRP, ItrSRate, ItrCmpCode, ItrRecState

### ProdRef_Log  (12 cols)
ItrRefCode, ItrItmCode, ItrRef1Name, ItrRef2Name, ItrStkCode, ItrStkICode, ItrRate, ItrPRate, ItrMRP, ItrSRate, ItrCmpCode, ItrRecState

### StockHdr  (12 cols)
ShrCode, ShrVtmCode, ShrPrefix, ShrVchNo, ShrPostfix, ShrDate, ShrQty, ShrValue, ShrNarr, ShrAutoGen, ShrCmpCode, ShrRecState

### StockHdr_Log  (12 cols)
ShrCode, ShrVtmCode, ShrPrefix, ShrVchNo, ShrPostfix, ShrDate, ShrQty, ShrValue, ShrNarr, ShrAutoGen, ShrCmpCode, ShrRecState

### StockJrn  (18 cols)
StkCode, StkICode, StkSno, StkVtmCode, StkPrefix, StkVchNo, StkPostfix, StkDate, StkItmCode, StkItmRefCode, StkQty, StkRate, StkValue, StkNarr, StkLItmCode, StkAutoGen, StkCmpCode, StkRecState

### StockJrn_Log  (18 cols)
StkCode, StkICode, StkSno, StkVtmCode, StkPrefix, StkVchNo, StkPostfix, StkDate, StkItmCode, StkItmRefCode, StkQty, StkRate, StkValue, StkNarr, StkLItmCode, StkAutoGen, StkCmpCode, StkRecState