Attribute VB_Name = "HmsLibrary"

Option Explicit

Public sHmsDatabaseName As String
Public sPatMastOptFileName As String, sPatMastOldFileName As String, sExtServRateOptFileName As String
Public sOutdRegOptFileName As String, sOutdRegOldFileName As String, sOutdRgRefdOptFileName As String, sOutdRgRefdOldFileName As String, sOutdRcptOptFileName As String, sOutdRcptOldFileName As String, sOutdPymtOptFileName As String, sOutdPymtOldFileName As String, sOutdRefdOptFileName As String, sOutdRefdOldFileName As String, sOutdBillOptFileName As String, sOutdBillOldFileName As String, sOutdBlPymtOptFileName As String, sOutdBlPymtOldFileName As String, sOutdBlRefdOptFileName As String, sOutdBlRefdOldFileName As String, sOutdRgPymtOptFileName As String, sOutdRgPymtOldFileName As String
Public sIndrRegOptFileName As String, sIndrRegOldFileName As String, sBedMastOptFileName As String, sBedMastOldFileName As String, sIndrRcptOptFileName As String, sIndrRcptOldFileName As String, sIndrPymtOptFileName As String, sIndrPymtOldFileName As String, sIndrRefdOptFileName As String, sIndrRefdOldFileName As String, sIndrBillOptFileName As String, sIndrBillOldFileName As String, sIndrBlPymtOptFileName As String, sIndrBlPymtOldFileName As String, sIndrBlRefdOptFileName As String, sIndrBlRefdOldFileName As String, sIndrRgPymtOptFileName As String, sIndrRgPymtOldFileName As String, sIndrRgRefdOptFileName As String, sIndrRgRefdOldFileName As String
Public sLabRegOptFileName As String, sLabRegOldFileName As String, sLabRcptOptFileName As String, sLabRcptOldFileName As String, sLabPymtOptFileName As String, sLabPymtOldFileName As String, sLabRefdOptFileName As String, sLabRefdOldFileName As String
Rem Service Charges/Share System
Public sExtServRateSys As Boolean, sDctwseServRateSys As Boolean, sPcgwseServRateSys As Boolean, sRBywseServRateSys As Boolean, sRTowseServRateSys As Boolean, sTimewseServRateSys As Boolean
Public sExtServDiscSys As Boolean, sDctwseServDiscSys As Boolean, sPcgwseServDiscSys As Boolean, sRBywseServDiscSys As Boolean, sRTowseServDiscSys As Boolean, sTimewseServDiscSys As Boolean
Public sExtServBargSys As Boolean, sDctwseServBargSys As Boolean, sPcgwseServBargSys As Boolean, sRBywseServBargSys As Boolean, sRTowseServBargSys As Boolean, sTimewseServBargSys As Boolean
Public sExtServShareSys As Boolean, sDctwseServShareSys As Boolean, sPcgwseServShareSys As Boolean, sRBywseServShareSys As Boolean, sRTowseServShareSys As Boolean, sTimewseServShareSys As Boolean

Public Const cHMS_VTYPE_OUTDOOR_REG = 101
Public Const cHMS_VTYPE_OUTDOOR_RCPT = 102
Public Const cHMS_VTYPE_OUTDOOR_PYMT = 103
Public Const cHMS_VTYPE_OUTDOOR_REFD = 104
Public Const cHMS_VTYPE_OUTDOOR_BILL = 105
Public Const cHMS_VTYPE_OUTDOOR_BLPYMT = 106
Public Const cHMS_VTYPE_OUTDOOR_BLREFD = 107
Public Const cHMS_VTYPE_OUTDOOR_RGPYMT = 108
Public Const cHMS_VTYPE_OUTDOOR_RGREFD = 109    ''' 14-March-2015
Public Const cHMS_VTYPE_INDOOR_REG = 110
Public Const cHMS_VTYPE_INDOOR_RCPT = 111
Public Const cHMS_VTYPE_INDOOR_PYMT = 112
Public Const cHMS_VTYPE_INDOOR_REFD = 113
Public Const cHMS_VTYPE_INDOOR_BILL = 114
Public Const cHMS_VTYPE_INDOOR_BLPYMT = 115
Public Const cHMS_VTYPE_INDOOR_BLREFD = 116
Public Const cHMS_VTYPE_INDOOR_RGPYMT = 117
Public Const cHMS_VTYPE_INDOOR_RGREFD = 118
Public Const cHMS_VTYPE_LAB_RCPT = 119
Public Const cHMS_VTYPE_LAB_PYMT = 120
Public Const cHMS_VTYPE_LAB_REFD = 121
Public Const cHMS_VTYPE_GENERAL = 122

Rem Crystal Report List file names
Rem outdoor files
Public Const cOUTDREG_CRLFILENAME = "OutdReg.Crl"
Public Const cOUTDRGREFD_CRLFILENAME = "OutdRgRefd.Crl"
Public Const cOUTDRCPT_CRLFILENAME = "OutdRcpt.Crl"
Public Const cOUTDPYMT_CRLFILENAME = "OutdPymt.Crl"
Public Const cOUTDREFD_CRLFILENAME = "OutdRefd.Crl"
Public Const cOUTDBILL_CRLFILENAME = "OutdBill.Crl"
Public Const cOUTDBLPYMT_CRLFILENAME = "OutdBlPymt.Crl"
Public Const cOUTDBLREFD_CRLFILENAME = "OutdBlRefd.Crl"
Rem indoor files
Public Const cINDRREG_CRLFILENAME = "IndrReg.Crl"
Public Const cINDRRCPT_CRLFILENAME = "IndrRcpt.Crl"
Public Const cINDRPYMT_CRLFILENAME = "IndrPymt.Crl"
Public Const cINDRREFD_CRLFILENAME = "IndrRefd.Crl"
Public Const cINDRRGPYMT_CRLFILENAME = "IndrRgPymt.Crl"
Public Const cINDRRGREFD_CRLFILENAME = "IndrRgRefd.Crl"
Public Const cINDRBILL_CRLFILENAME = "IndrBill.Crl"
Public Const cINDRBLPYMT_CRLFILENAME = "IndrBlPymt.Crl"
Public Const cINDRBLREFD_CRLFILENAME = "IndrBlRefd.Crl"
Rem lab files
Public Const cLABREG_CRLFILENAME = "LabReg.Crl"
Public Const cLABRCPT_CRLFILENAME = "LabRcpt.Crl"
Public Const cLABPYMT_CRLFILENAME = "LabPymt.Crl"
Public Const cLABREFD_CRLFILENAME = "LabRefd.Crl"
Rem report files
Public Const cCOLLREP_CRLFILENAME = "CollRep.Crl"
Public Const cSERVREP_CRLFILENAME = "ServRep.Crl"

Rem patient refname title list
Public Const cPTTREFRELA_LIST = "C/o,S/o,D/o,W/o,F/o,M/o"
Public Const cPTTSEX_LIST = "Male,Female,None"
Public Const cIPD_DISCHARGE_STATE = "Unknown,Occupied,Discharged,Shifted,Referred,Absconded,Died,Insolvent,Other"
Public Const cIBS_STATE_UNKNOWN = 0
Public Const cIBS_STATE_OCCUPIED = 1
Public Const cIBS_STATE_DISCHARGED = 2
Public Const cIBS_STATE_SHIFTED = 3
Public Const cIBS_STATE_REFERRED = 4
Public Const cIBS_STATE_ABSCONDED = 5
Public Const cIBS_STATE_DIED = 6
Public Const cIBS_STATE_INSOLVENT = 7
Public Const cIBS_STATE_OTHER = 8
Rem Bed Master Check Out Time Basis
Public Const cBDM_CHKOUTTIMEBASIS_LIST = "Unknown,Fixed Time Basis,Admitted Time Basis"
Public Const cBDM_CHKOUTTIMEBASIS_UNKNOWN = 0
Public Const cBDM_CHKOUTTIMEBASIS_FIXEDTIME = 1
Public Const cBDM_CHKOUTTIMEBASIS_ADMITTIME = 2

Public Sub InitHmsVar()
' --------------------------------------
sHmsDatabaseName = "Hospital.Mdb"
sPatMastOptFileName = "PatMast.Opt"
sPatMastOldFileName = "PatMast.Old"
sExtServRateOptFileName = "ExtSrvRt.Opt"
' --------------------------------------------
sOutdRegOptFileName = "OutdReg.Opt"
sOutdRegOldFileName = "OutdReg.Old"
sOutdRgRefdOptFileName = "OutdRgRefd.Opt"
sOutdRgRefdOldFileName = "OutdRgRefd.Old"
sOutdRcptOptFileName = "OutdRcpt.Opt"
sOutdRcptOldFileName = "OutdRcpt.Old"
sOutdPymtOptFileName = "OutdPymt.Opt"
sOutdPymtOldFileName = "OutdPymt.Old"
sOutdRefdOptFileName = "OutdRefd.Opt"
sOutdRefdOldFileName = "OutdRefd.Old"
sOutdBillOptFileName = "OutdBill.Opt"
sOutdBillOldFileName = "OutdBill.Old"
sOutdBlPymtOptFileName = "OutdBlPymt.Opt"
sOutdBlPymtOldFileName = "OutdBlPymt.Old"
sOutdBlRefdOptFileName = "OutdBlRefd.Opt"
sOutdBlRefdOldFileName = "OutdBlRefd.Old"
sOutdRgPymtOptFileName = "OutdRgPymt.Opt"
sOutdRgPymtOldFileName = "OutdRgPymt.Old"
' --------------------------------------
sIndrRegOptFileName = "IndrReg.Opt"
sIndrRegOldFileName = "IndrReg.Old"
sBedMastOptFileName = "BedMast.Opt"
sBedMastOldFileName = "BedMast.Old"
sIndrRcptOptFileName = "IndrRcpt.Opt"
sIndrRcptOldFileName = "IndrRcpt.Old"
sIndrPymtOptFileName = "IndrPymt.Opt"
sIndrPymtOldFileName = "IndrPymt.Old"
sIndrRefdOptFileName = "IndrRefd.Opt"
sIndrRefdOldFileName = "IndrRefd.Old"
sIndrBillOptFileName = "IndrBill.Opt"
sIndrBillOldFileName = "IndrBill.Old"
sIndrBlPymtOptFileName = "IndrBlPymt.Opt"
sIndrBlPymtOldFileName = "IndrBlPymt.Old"
sIndrBlRefdOptFileName = "IndrBlRefd.Opt"
sIndrBlRefdOldFileName = "IndrBlRefd.Old"
sIndrRgPymtOptFileName = "IndrRgPymt.Opt"
sIndrRgPymtOldFileName = "IndrRgPymt.Old"
sIndrRgRefdOptFileName = "IndrRgRefd.Opt"
sIndrRgRefdOldFileName = "IndrRgRefd.Old"
' ---------------------------------------
sLabRegOptFileName = "LabReg.Opt"
sLabRegOldFileName = "LabReg.Old"
sLabRcptOptFileName = "LabRcpt.Opt"
sLabRcptOldFileName = "LabRcpt.Old"
sLabPymtOptFileName = "LabPymt.Opt"
sLabPymtOldFileName = "LabPymt.Old"
sLabRefdOptFileName = "LabRefd.Opt"
sLabRefdOldFileName = "LabRefd.Old"
' ---------------------------------------

' ------------------------
clsVType.AddType cHMS_VTYPE_OUTDOOR_REG, "Outdoor Registration"
clsVType.AddType cHMS_VTYPE_OUTDOOR_RCPT, "Outdoor Receipt"
clsVType.AddType cHMS_VTYPE_OUTDOOR_PYMT, "Outdoor Payment"
clsVType.AddType cHMS_VTYPE_OUTDOOR_REFD, "Outdoor Refund"
clsVType.AddType cHMS_VTYPE_OUTDOOR_BILL, "Outdoor Bill"
clsVType.AddType cHMS_VTYPE_OUTDOOR_BLPYMT, "Outdoor Bill Payment"
clsVType.AddType cHMS_VTYPE_OUTDOOR_BLREFD, "Outdoor Bill Refund"
Rem clsVType.AddType cHMS_VTYPE_OUTDOOR_RGPYMT, "Outdoor Reg. Payment"
clsVType.AddType cHMS_VTYPE_OUTDOOR_RGREFD, "Outdoor Reg.Refund"
' ------------------------------------------
clsVType.AddType cHMS_VTYPE_INDOOR_REG, "Indoor Registration"
clsVType.AddType cHMS_VTYPE_INDOOR_RCPT, "Indoor Receipt"
clsVType.AddType cHMS_VTYPE_INDOOR_PYMT, "Indoor Payment"
clsVType.AddType cHMS_VTYPE_INDOOR_REFD, "Indoor Refund"
clsVType.AddType cHMS_VTYPE_INDOOR_BILL, "Indoor Bill"
clsVType.AddType cHMS_VTYPE_INDOOR_BLPYMT, "Indoor Bill Payment"
clsVType.AddType cHMS_VTYPE_INDOOR_BLREFD, "Indoor Bill Refund"
clsVType.AddType cHMS_VTYPE_INDOOR_RGPYMT, "Indoor On A/c.Payment"
clsVType.AddType cHMS_VTYPE_INDOOR_RGREFD, "Indoor On A/c.Refund"
' --------------------------------------------
clsVType.AddType cHMS_VTYPE_LAB_RCPT, "Lab Receipt"
clsVType.AddType cHMS_VTYPE_LAB_PYMT, "Lab Payment"
clsVType.AddType cHMS_VTYPE_LAB_REFD, "Lab Refund"
clsVType.AddType cHMS_VTYPE_GENERAL, "General"

Rem restoring hospital system parameter options
Call InitHmsServRateSysParaOpt

End Sub

Public Sub InitHmsServRateSysParaOpt()
Dim clsHOPT As New clsHmsOpdOptionsEntry

clsHOPT.blnServRateSysOptMast = True
clsHOPT.Init
If sCmpDataPath = "" Then
    clsHOPT.Clear
Else
    clsHOPT.GetServRateSysOptData
End If

sExtServRateSys = clsHOPT.mExtServRateSys_bln: sDctwseServRateSys = clsHOPT.mDctwseServRateSys_bln: sPcgwseServRateSys = clsHOPT.mPcgwseServRateSys_bln: sRBywseServRateSys = clsHOPT.mRBywseServRateSys_bln: sRTowseServRateSys = clsHOPT.mRTowseServRateSys_bln: sTimewseServRateSys = clsHOPT.mTimewseServRateSys_bln
sExtServDiscSys = clsHOPT.mExtServDiscSys_bln: sDctwseServDiscSys = clsHOPT.mDctwseServDiscSys_bln: sPcgwseServDiscSys = clsHOPT.mPcgwseServDiscSys_bln: sRBywseServDiscSys = clsHOPT.mRBywseServDiscSys_bln: sRTowseServDiscSys = clsHOPT.mRTowseServDiscSys_bln: sTimewseServDiscSys = clsHOPT.mTimewseServDiscSys_bln
sExtServBargSys = clsHOPT.mExtServBargSys_bln: sDctwseServBargSys = clsHOPT.mDctwseServBargSys_bln: sPcgwseServBargSys = clsHOPT.mPcgwseServBargSys_bln: sRBywseServBargSys = clsHOPT.mRBywseServBargSys_bln: sRTowseServBargSys = clsHOPT.mRTowseServBargSys_bln: sTimewseServBargSys = clsHOPT.mTimewseServBargSys_bln
sExtServShareSys = clsHOPT.mExtServShareSys_bln: sDctwseServShareSys = clsHOPT.mDctwseServShareSys_bln: sPcgwseServShareSys = clsHOPT.mPcgwseServShareSys_bln: sRBywseServShareSys = clsHOPT.mRBywseServShareSys_bln: sRTowseServShareSys = clsHOPT.mRTowseServShareSys_bln: sTimewseServShareSys = clsHOPT.mTimewseServShareSys_bln
Set clsHOPT = Nothing

End Sub

Public Sub RemoveHmsNullValue(Optional ByRef FormProgStatus As frmProgressStatus)
Dim dbHmsDatabase As New ADODB.Connection, dbHmsCatalog As New ADOX.Catalog
Dim tRecset As New ADODB.Recordset
Dim mTable As ADOX.Table, mTableName As String

OpenHmsDataSource dbHmsDatabase, mExclusiveMode:=True
If dbHmsDatabase.State <> 1 Then
    ErrorBox Err.Description
    GoTo EndSub
End If
Set dbHmsCatalog.ActiveConnection = dbHmsDatabase
If Not FormProgStatus Is Nothing Then
    If FormProgStatus.Visible = True Then
        FormProgStatus.pbar1.Min = 0: FormProgStatus.pbar1.Max = dbHmsCatalog.Tables.count
    End If
End If

dbHmsDatabase.BeginTrans
For Each mTable In dbHmsCatalog.Tables
    If mTable.Type = "TABLE" Then
        If Not FormProgStatus Is Nothing Then
            If FormProgStatus.Visible = True Then
                FormProgStatus.ShowNextStatus dbHmsCatalog.ActiveConnection.Properties("Data Source Name") & vbCrLf & "Table: " & mTable.Name
            End If
        End If
        
        mTableName = mTable.Name
        With tRecset
        .open "Select * from " & mTableName & "", dbHmsDatabase, adOpenKeyset, adLockOptimistic
        If .RecordCount > 0 Then
            RemoveNullValue tRecset
        End If
        End With
        CloseTable tRecset
    End If
Next mTable
dbHmsDatabase.CommitTrans

Rem InfoBox dbHmsCatalog.ActiveConnection.Properties("Data Source Name") & ", Done !!!"

CloseDataSource dbHmsDatabase

EndSub:
Set dbHmsCatalog = Nothing
Set dbHmsDatabase = Nothing
Exit Sub

End Sub

Public Property Get PatMastOptFileFullPath(Optional ByVal mFilePath, Optional ByVal mFileName) As String
mFilePath = IIf(IsMissing(mFilePath) = False, mFilePath, sCmpDataPath)  ''' sAppPath
mFileName = IIf(IsMissing(mFileName) = False, mFileName, sPatMastOptFileName)
PatMastOptFileFullPath = AddBS(mFilePath) & mFileName

End Property

Public Property Get PatMastOldFileFullPath(Optional ByVal mFilePath, Optional ByVal mFileName) As String
mFilePath = IIf(IsMissing(mFilePath) = False, mFilePath, sCmpDataPath)  ''' sAppPath
mFileName = IIf(IsMissing(mFileName) = False, mFileName, sPatMastOldFileName)
PatMastOldFileFullPath = AddBS(mFilePath) & mFileName

End Property

Public Property Get ExtServRateOptFileFullPath(Optional ByVal mFilePath, Optional ByVal mFileName) As String
mFilePath = IIf(IsMissing(mFilePath) = False, mFilePath, sCmpDataPath)  ''' sAppPath
mFileName = IIf(IsMissing(mFileName) = False, mFileName, sExtServRateOptFileName)
ExtServRateOptFileFullPath = AddBS(mFilePath) & mFileName

End Property

Public Property Get OutdRegOptFileFullPath(Optional ByVal mFilePath, Optional ByVal mFileName) As String
mFilePath = IIf(IsMissing(mFilePath) = False, mFilePath, sCmpDataPath)  ''' sAppPath
mFileName = IIf(IsMissing(mFileName) = False, mFileName, sOutdRegOptFileName)
OutdRegOptFileFullPath = AddBS(mFilePath) & mFileName

End Property

Public Property Get OutdRegOldFileFullPath(Optional ByVal mFilePath, Optional ByVal mFileName) As String
mFilePath = IIf(IsMissing(mFilePath) = False, mFilePath, sCmpDataPath)  ''' sAppPath
mFileName = IIf(IsMissing(mFileName) = False, mFileName, sOutdRegOldFileName)
OutdRegOldFileFullPath = AddBS(mFilePath) & mFileName

End Property

Public Property Get OutdRegCRLFileFullPath(Optional ByVal mFilePath, Optional ByVal mFileName) As String
mFilePath = IIf(IsMissing(mFilePath) = False, mFilePath, sCmpDataPath)  ''' sAppPath
mFileName = IIf(IsMissing(mFileName) = False, mFileName, cOUTDREG_CRLFILENAME)
OutdRegCRLFileFullPath = AddBS(mFilePath) & mFileName

End Property

Public Property Get OutdRgRefdOptFileFullPath(Optional ByVal mFilePath, Optional ByVal mFileName) As String
mFilePath = IIf(IsMissing(mFilePath) = False, mFilePath, sCmpDataPath)  ''' sAppPath
mFileName = IIf(IsMissing(mFileName) = False, mFileName, sOutdRgRefdOptFileName)
OutdRgRefdOptFileFullPath = AddBS(mFilePath) & mFileName

End Property

Public Property Get OutdRgRefdOldFileFullPath(Optional ByVal mFilePath, Optional ByVal mFileName) As String
mFilePath = IIf(IsMissing(mFilePath) = False, mFilePath, sCmpDataPath)  ''' sAppPath
mFileName = IIf(IsMissing(mFileName) = False, mFileName, sOutdRgRefdOldFileName)
OutdRgRefdOldFileFullPath = AddBS(mFilePath) & mFileName

End Property

Public Property Get OutdRgRefdCRLFileFullPath(Optional ByVal mFilePath, Optional ByVal mFileName) As String
mFilePath = IIf(IsMissing(mFilePath) = False, mFilePath, sCmpDataPath)  ''' sAppPath
mFileName = IIf(IsMissing(mFileName) = False, mFileName, cOUTDRGREFD_CRLFILENAME)
OutdRgRefdCRLFileFullPath = AddBS(mFilePath) & mFileName

End Property

Public Property Get OutdRcptOptFileFullPath(Optional ByVal mFilePath, Optional ByVal mFileName) As String
mFilePath = IIf(IsMissing(mFilePath) = False, mFilePath, sCmpDataPath)  ''' sAppPath
mFileName = IIf(IsMissing(mFileName) = False, mFileName, sOutdRcptOptFileName)
OutdRcptOptFileFullPath = AddBS(mFilePath) & mFileName

End Property

Public Property Get OutdRcptOldFileFullPath(Optional ByVal mFilePath, Optional ByVal mFileName) As String
mFilePath = IIf(IsMissing(mFilePath) = False, mFilePath, sCmpDataPath)  ''' sAppPath
mFileName = IIf(IsMissing(mFileName) = False, mFileName, sOutdRcptOldFileName)
OutdRcptOldFileFullPath = AddBS(mFilePath) & mFileName

End Property

Public Property Get OutdRcptCRLFileFullPath(Optional ByVal mFilePath, Optional ByVal mFileName) As String
mFilePath = IIf(IsMissing(mFilePath) = False, mFilePath, sCmpDataPath)  ''' sAppPath
mFileName = IIf(IsMissing(mFileName) = False, mFileName, cOUTDRCPT_CRLFILENAME)
OutdRcptCRLFileFullPath = AddBS(mFilePath) & mFileName

End Property

Public Property Get OutdPymtOptFileFullPath(Optional ByVal mFilePath, Optional ByVal mFileName) As String
mFilePath = IIf(IsMissing(mFilePath) = False, mFilePath, sCmpDataPath)  ''' sAppPath
mFileName = IIf(IsMissing(mFileName) = False, mFileName, sOutdPymtOptFileName)
OutdPymtOptFileFullPath = AddBS(mFilePath) & mFileName

End Property

Public Property Get OutdPymtOldFileFullPath(Optional ByVal mFilePath, Optional ByVal mFileName) As String
mFilePath = IIf(IsMissing(mFilePath) = False, mFilePath, sCmpDataPath)  ''' sAppPath
mFileName = IIf(IsMissing(mFileName) = False, mFileName, sOutdPymtOldFileName)
OutdPymtOldFileFullPath = AddBS(mFilePath) & mFileName

End Property

Public Property Get OutdPymtCRLFileFullPath(Optional ByVal mFilePath, Optional ByVal mFileName) As String
mFilePath = IIf(IsMissing(mFilePath) = False, mFilePath, sCmpDataPath)  ''' sAppPath
mFileName = IIf(IsMissing(mFileName) = False, mFileName, cOUTDPYMT_CRLFILENAME)
OutdPymtCRLFileFullPath = AddBS(mFilePath) & mFileName

End Property

Public Property Get OutdRefdOptFileFullPath(Optional ByVal mFilePath, Optional ByVal mFileName) As String
mFilePath = IIf(IsMissing(mFilePath) = False, mFilePath, sCmpDataPath)  ''' sAppPath
mFileName = IIf(IsMissing(mFileName) = False, mFileName, sOutdRefdOptFileName)
OutdRefdOptFileFullPath = AddBS(mFilePath) & mFileName

End Property

Public Property Get OutdRefdOldFileFullPath(Optional ByVal mFilePath, Optional ByVal mFileName) As String
mFilePath = IIf(IsMissing(mFilePath) = False, mFilePath, sCmpDataPath)  ''' sAppPath
mFileName = IIf(IsMissing(mFileName) = False, mFileName, sOutdRefdOldFileName)
OutdRefdOldFileFullPath = AddBS(mFilePath) & mFileName

End Property

Public Property Get OutdRefdCRLFileFullPath(Optional ByVal mFilePath, Optional ByVal mFileName) As String
mFilePath = IIf(IsMissing(mFilePath) = False, mFilePath, sCmpDataPath)  ''' sAppPath
mFileName = IIf(IsMissing(mFileName) = False, mFileName, cOUTDREFD_CRLFILENAME)
OutdRefdCRLFileFullPath = AddBS(mFilePath) & mFileName

End Property

Public Property Get OutdBillOptFileFullPath(Optional ByVal mFilePath, Optional ByVal mFileName) As String
mFilePath = IIf(IsMissing(mFilePath) = False, mFilePath, sCmpDataPath)  ''' sAppPath
mFileName = IIf(IsMissing(mFileName) = False, mFileName, sOutdBillOptFileName)
OutdBillOptFileFullPath = AddBS(mFilePath) & mFileName

End Property

Public Property Get OutdBillOldFileFullPath(Optional ByVal mFilePath, Optional ByVal mFileName) As String
mFilePath = IIf(IsMissing(mFilePath) = False, mFilePath, sCmpDataPath)  ''' sAppPath
mFileName = IIf(IsMissing(mFileName) = False, mFileName, sOutdBillOldFileName)
OutdBillOldFileFullPath = AddBS(mFilePath) & mFileName

End Property

Public Property Get OutdBillCRLFileFullPath(Optional ByVal mFilePath, Optional ByVal mFileName) As String
mFilePath = IIf(IsMissing(mFilePath) = False, mFilePath, sCmpDataPath)  ''' sAppPath
mFileName = IIf(IsMissing(mFileName) = False, mFileName, cOUTDBILL_CRLFILENAME)
OutdBillCRLFileFullPath = AddBS(mFilePath) & mFileName

End Property

Public Property Get OutdBlPymtOptFileFullPath(Optional ByVal mFilePath, Optional ByVal mFileName) As String
mFilePath = IIf(IsMissing(mFilePath) = False, mFilePath, sCmpDataPath)  ''' sAppPath
mFileName = IIf(IsMissing(mFileName) = False, mFileName, sOutdBlPymtOptFileName)
OutdBlPymtOptFileFullPath = AddBS(mFilePath) & mFileName

End Property

Public Property Get OutdBlPymtOldFileFullPath(Optional ByVal mFilePath, Optional ByVal mFileName) As String
mFilePath = IIf(IsMissing(mFilePath) = False, mFilePath, sCmpDataPath)  ''' sAppPath
mFileName = IIf(IsMissing(mFileName) = False, mFileName, sOutdBlPymtOldFileName)
OutdBlPymtOldFileFullPath = AddBS(mFilePath) & mFileName

End Property

Public Property Get OutdBlPymtCRLFileFullPath(Optional ByVal mFilePath, Optional ByVal mFileName) As String
mFilePath = IIf(IsMissing(mFilePath) = False, mFilePath, sCmpDataPath)  ''' sAppPath
mFileName = IIf(IsMissing(mFileName) = False, mFileName, cOUTDBLPYMT_CRLFILENAME)
OutdBlPymtCRLFileFullPath = AddBS(mFilePath) & mFileName

End Property

Public Property Get OutdBlRefdOptFileFullPath(Optional ByVal mFilePath, Optional ByVal mFileName) As String
mFilePath = IIf(IsMissing(mFilePath) = False, mFilePath, sCmpDataPath)  ''' sAppPath
mFileName = IIf(IsMissing(mFileName) = False, mFileName, sOutdBlRefdOptFileName)
OutdBlRefdOptFileFullPath = AddBS(mFilePath) & mFileName

End Property

Public Property Get OutdBlRefdOldFileFullPath(Optional ByVal mFilePath, Optional ByVal mFileName) As String
mFilePath = IIf(IsMissing(mFilePath) = False, mFilePath, sCmpDataPath)  ''' sAppPath
mFileName = IIf(IsMissing(mFileName) = False, mFileName, sOutdBlRefdOldFileName)
OutdBlRefdOldFileFullPath = AddBS(mFilePath) & mFileName

End Property

Public Property Get OutdBlRefdCRLFileFullPath(Optional ByVal mFilePath, Optional ByVal mFileName) As String
mFilePath = IIf(IsMissing(mFilePath) = False, mFilePath, sCmpDataPath)  ''' sAppPath
mFileName = IIf(IsMissing(mFileName) = False, mFileName, cOUTDBLREFD_CRLFILENAME)
OutdBlRefdCRLFileFullPath = AddBS(mFilePath) & mFileName

End Property

Public Property Get OutdRgPymtOptFileFullPath(Optional ByVal mFilePath, Optional ByVal mFileName) As String
mFilePath = IIf(IsMissing(mFilePath) = False, mFilePath, sCmpDataPath)  ''' sAppPath
mFileName = IIf(IsMissing(mFileName) = False, mFileName, sOutdRgPymtOptFileName)
OutdRgPymtOptFileFullPath = AddBS(mFilePath) & mFileName

End Property

Public Property Get OutdRgPymtOldFileFullPath(Optional ByVal mFilePath, Optional ByVal mFileName) As String
mFilePath = IIf(IsMissing(mFilePath) = False, mFilePath, sCmpDataPath)  ''' sAppPath
mFileName = IIf(IsMissing(mFileName) = False, mFileName, sOutdRgPymtOldFileName)
OutdRgPymtOldFileFullPath = AddBS(mFilePath) & mFileName

End Property

'''Public Property Get OutdRgRefdOptFileFullPath(Optional ByVal mFilePath, Optional ByVal mFileName) As String
'''mFilePath = IIf(IsMissing(mFilePath) = False, mFilePath, sCmpDataPath)  ''' sAppPath
'''mFileName = IIf(IsMissing(mFileName) = False, mFileName, sOutdRgRefdOptFileName)
'''OutdRgRefdOptFileFullPath = AddBS(mFilePath) & mFileName
'''
'''End Property

'''Public Property Get OutdRgRefdOldFileFullPath(Optional ByVal mFilePath, Optional ByVal mFileName) As String
'''mFilePath = IIf(IsMissing(mFilePath) = False, mFilePath, sCmpDataPath)  ''' sAppPath
'''mFileName = IIf(IsMissing(mFileName) = False, mFileName, sOutdRgRefdOldFileName)
'''OutdRgRefdOldFileFullPath = AddBS(mFilePath) & mFileName
'''
'''End Property

Public Property Get IndrRegOptFileFullPath(Optional ByVal mFilePath, Optional ByVal mFileName) As String
mFilePath = IIf(IsMissing(mFilePath) = False, mFilePath, sCmpDataPath)  ''' sAppPath
mFileName = IIf(IsMissing(mFileName) = False, mFileName, sIndrRegOptFileName)
IndrRegOptFileFullPath = AddBS(mFilePath) & mFileName

End Property

Public Property Get IndrRegOldFileFullPath(Optional ByVal mFilePath, Optional ByVal mFileName) As String
mFilePath = IIf(IsMissing(mFilePath) = False, mFilePath, sCmpDataPath)  ''' sAppPath
mFileName = IIf(IsMissing(mFileName) = False, mFileName, sIndrRegOldFileName)
IndrRegOldFileFullPath = AddBS(mFilePath) & mFileName

End Property

Public Property Get IndrRegCRLFileFullPath(Optional ByVal mFilePath, Optional ByVal mFileName) As String
mFilePath = IIf(IsMissing(mFilePath) = False, mFilePath, sCmpDataPath)  ''' sAppPath
mFileName = IIf(IsMissing(mFileName) = False, mFileName, cINDRREG_CRLFILENAME)
IndrRegCRLFileFullPath = AddBS(mFilePath) & mFileName

End Property

Public Property Get BedMastOptFileFullPath(Optional ByVal mFilePath, Optional ByVal mFileName) As String
mFilePath = IIf(IsMissing(mFilePath) = False, mFilePath, sCmpDataPath)  ''' sAppPath
mFileName = IIf(IsMissing(mFileName) = False, mFileName, sBedMastOptFileName)
BedMastOptFileFullPath = AddBS(mFilePath) & mFileName

End Property

Public Property Get BedMastOldFileFullPath(Optional ByVal mFilePath, Optional ByVal mFileName) As String
mFilePath = IIf(IsMissing(mFilePath) = False, mFilePath, sCmpDataPath)  ''' sAppPath
mFileName = IIf(IsMissing(mFileName) = False, mFileName, sBedMastOldFileName)
BedMastOldFileFullPath = AddBS(mFilePath) & mFileName

End Property

Public Property Get IndrRcptOptFileFullPath(Optional ByVal mFilePath, Optional ByVal mFileName) As String
mFilePath = IIf(IsMissing(mFilePath) = False, mFilePath, sCmpDataPath)  ''' sAppPath
mFileName = IIf(IsMissing(mFileName) = False, mFileName, sIndrRcptOptFileName)
IndrRcptOptFileFullPath = AddBS(mFilePath) & mFileName

End Property

Public Property Get IndrRcptOldFileFullPath(Optional ByVal mFilePath, Optional ByVal mFileName) As String
mFilePath = IIf(IsMissing(mFilePath) = False, mFilePath, sCmpDataPath)  ''' sAppPath
mFileName = IIf(IsMissing(mFileName) = False, mFileName, sIndrRcptOldFileName)
IndrRcptOldFileFullPath = AddBS(mFilePath) & mFileName

End Property

Public Property Get IndrRcptCRLFileFullPath(Optional ByVal mFilePath, Optional ByVal mFileName) As String
mFilePath = IIf(IsMissing(mFilePath) = False, mFilePath, sCmpDataPath)  ''' sAppPath
mFileName = IIf(IsMissing(mFileName) = False, mFileName, cINDRRCPT_CRLFILENAME)
IndrRcptCRLFileFullPath = AddBS(mFilePath) & mFileName

End Property

Public Property Get IndrPymtOptFileFullPath(Optional ByVal mFilePath, Optional ByVal mFileName) As String
mFilePath = IIf(IsMissing(mFilePath) = False, mFilePath, sCmpDataPath)  ''' sAppPath
mFileName = IIf(IsMissing(mFileName) = False, mFileName, sIndrPymtOptFileName)
IndrPymtOptFileFullPath = AddBS(mFilePath) & mFileName

End Property

Public Property Get IndrPymtOldFileFullPath(Optional ByVal mFilePath, Optional ByVal mFileName) As String
mFilePath = IIf(IsMissing(mFilePath) = False, mFilePath, sCmpDataPath)  ''' sAppPath
mFileName = IIf(IsMissing(mFileName) = False, mFileName, sIndrPymtOldFileName)
IndrPymtOldFileFullPath = AddBS(mFilePath) & mFileName

End Property

Public Property Get IndrPymtCRLFileFullPath(Optional ByVal mFilePath, Optional ByVal mFileName) As String
mFilePath = IIf(IsMissing(mFilePath) = False, mFilePath, sCmpDataPath)  ''' sAppPath
mFileName = IIf(IsMissing(mFileName) = False, mFileName, cINDRPYMT_CRLFILENAME)
IndrPymtCRLFileFullPath = AddBS(mFilePath) & mFileName

End Property

Public Property Get IndrRefdOptFileFullPath(Optional ByVal mFilePath, Optional ByVal mFileName) As String
mFilePath = IIf(IsMissing(mFilePath) = False, mFilePath, sCmpDataPath)  ''' sAppPath
mFileName = IIf(IsMissing(mFileName) = False, mFileName, sIndrRefdOptFileName)
IndrRefdOptFileFullPath = AddBS(mFilePath) & mFileName

End Property

Public Property Get IndrRefdOldFileFullPath(Optional ByVal mFilePath, Optional ByVal mFileName) As String
mFilePath = IIf(IsMissing(mFilePath) = False, mFilePath, sCmpDataPath)  ''' sAppPath
mFileName = IIf(IsMissing(mFileName) = False, mFileName, sIndrRefdOldFileName)
IndrRefdOldFileFullPath = AddBS(mFilePath) & mFileName

End Property

Public Property Get IndrRefdCRLFileFullPath(Optional ByVal mFilePath, Optional ByVal mFileName) As String
mFilePath = IIf(IsMissing(mFilePath) = False, mFilePath, sCmpDataPath)  ''' sAppPath
mFileName = IIf(IsMissing(mFileName) = False, mFileName, cINDRREFD_CRLFILENAME)
IndrRefdCRLFileFullPath = AddBS(mFilePath) & mFileName

End Property

Public Property Get IndrBillOptFileFullPath(Optional ByVal mFilePath, Optional ByVal mFileName) As String
mFilePath = IIf(IsMissing(mFilePath) = False, mFilePath, sCmpDataPath)  ''' sAppPath
mFileName = IIf(IsMissing(mFileName) = False, mFileName, sIndrBillOptFileName)
IndrBillOptFileFullPath = AddBS(mFilePath) & mFileName

End Property

Public Property Get IndrBillOldFileFullPath(Optional ByVal mFilePath, Optional ByVal mFileName) As String
mFilePath = IIf(IsMissing(mFilePath) = False, mFilePath, sCmpDataPath)  ''' sAppPath
mFileName = IIf(IsMissing(mFileName) = False, mFileName, sIndrBillOldFileName)
IndrBillOldFileFullPath = AddBS(mFilePath) & mFileName

End Property

Public Property Get IndrBillCRLFileFullPath(Optional ByVal mFilePath, Optional ByVal mFileName) As String
mFilePath = IIf(IsMissing(mFilePath) = False, mFilePath, sCmpDataPath)  ''' sAppPath
mFileName = IIf(IsMissing(mFileName) = False, mFileName, cINDRBILL_CRLFILENAME)
IndrBillCRLFileFullPath = AddBS(mFilePath) & mFileName

End Property

Public Property Get IndrBlPymtOptFileFullPath(Optional ByVal mFilePath, Optional ByVal mFileName) As String
mFilePath = IIf(IsMissing(mFilePath) = False, mFilePath, sCmpDataPath)  ''' sAppPath
mFileName = IIf(IsMissing(mFileName) = False, mFileName, sIndrBlPymtOptFileName)
IndrBlPymtOptFileFullPath = AddBS(mFilePath) & mFileName

End Property

Public Property Get IndrBlPymtOldFileFullPath(Optional ByVal mFilePath, Optional ByVal mFileName) As String
mFilePath = IIf(IsMissing(mFilePath) = False, mFilePath, sCmpDataPath)  ''' sAppPath
mFileName = IIf(IsMissing(mFileName) = False, mFileName, sIndrBlPymtOldFileName)
IndrBlPymtOldFileFullPath = AddBS(mFilePath) & mFileName

End Property

Public Property Get IndrBlPymtCRLFileFullPath(Optional ByVal mFilePath, Optional ByVal mFileName) As String
mFilePath = IIf(IsMissing(mFilePath) = False, mFilePath, sCmpDataPath)  ''' sAppPath
mFileName = IIf(IsMissing(mFileName) = False, mFileName, cINDRBLPYMT_CRLFILENAME)
IndrBlPymtCRLFileFullPath = AddBS(mFilePath) & mFileName

End Property

Public Property Get IndrBlRefdOptFileFullPath(Optional ByVal mFilePath, Optional ByVal mFileName) As String
mFilePath = IIf(IsMissing(mFilePath) = False, mFilePath, sCmpDataPath)  ''' sAppPath
mFileName = IIf(IsMissing(mFileName) = False, mFileName, sIndrBlRefdOptFileName)
IndrBlRefdOptFileFullPath = AddBS(mFilePath) & mFileName

End Property

Public Property Get IndrBlRefdOldFileFullPath(Optional ByVal mFilePath, Optional ByVal mFileName) As String
mFilePath = IIf(IsMissing(mFilePath) = False, mFilePath, sCmpDataPath)  ''' sAppPath
mFileName = IIf(IsMissing(mFileName) = False, mFileName, sIndrBlRefdOldFileName)
IndrBlRefdOldFileFullPath = AddBS(mFilePath) & mFileName

End Property

Public Property Get IndrBlRefdCRLFileFullPath(Optional ByVal mFilePath, Optional ByVal mFileName) As String
mFilePath = IIf(IsMissing(mFilePath) = False, mFilePath, sCmpDataPath)  ''' sAppPath
mFileName = IIf(IsMissing(mFileName) = False, mFileName, cINDRBLREFD_CRLFILENAME)
IndrBlRefdCRLFileFullPath = AddBS(mFilePath) & mFileName

End Property

Public Property Get IndrRgPymtOptFileFullPath(Optional ByVal mFilePath, Optional ByVal mFileName) As String
mFilePath = IIf(IsMissing(mFilePath) = False, mFilePath, sCmpDataPath)  ''' sAppPath
mFileName = IIf(IsMissing(mFileName) = False, mFileName, sIndrRgPymtOptFileName)
IndrRgPymtOptFileFullPath = AddBS(mFilePath) & mFileName

End Property

Public Property Get IndrRgPymtOldFileFullPath(Optional ByVal mFilePath, Optional ByVal mFileName) As String
mFilePath = IIf(IsMissing(mFilePath) = False, mFilePath, sCmpDataPath)  ''' sAppPath
mFileName = IIf(IsMissing(mFileName) = False, mFileName, sIndrRgPymtOldFileName)
IndrRgPymtOldFileFullPath = AddBS(mFilePath) & mFileName

End Property

Public Property Get IndrRgPymtCRLFileFullPath(Optional ByVal mFilePath, Optional ByVal mFileName) As String
mFilePath = IIf(IsMissing(mFilePath) = False, mFilePath, sCmpDataPath)  ''' sAppPath
mFileName = IIf(IsMissing(mFileName) = False, mFileName, cINDRRGPYMT_CRLFILENAME)
IndrRgPymtCRLFileFullPath = AddBS(mFilePath) & mFileName

End Property

Public Property Get IndrRgRefdOptFileFullPath(Optional ByVal mFilePath, Optional ByVal mFileName) As String
mFilePath = IIf(IsMissing(mFilePath) = False, mFilePath, sCmpDataPath)  ''' sAppPath
mFileName = IIf(IsMissing(mFileName) = False, mFileName, sIndrRgRefdOptFileName)
IndrRgRefdOptFileFullPath = AddBS(mFilePath) & mFileName

End Property

Public Property Get IndrRgRefdOldFileFullPath(Optional ByVal mFilePath, Optional ByVal mFileName) As String
mFilePath = IIf(IsMissing(mFilePath) = False, mFilePath, sCmpDataPath)  ''' sAppPath
mFileName = IIf(IsMissing(mFileName) = False, mFileName, sIndrRgRefdOldFileName)
IndrRgRefdOldFileFullPath = AddBS(mFilePath) & mFileName

End Property

Public Property Get IndrRgRefdCRLFileFullPath(Optional ByVal mFilePath, Optional ByVal mFileName) As String
mFilePath = IIf(IsMissing(mFilePath) = False, mFilePath, sCmpDataPath)  ''' sAppPath
mFileName = IIf(IsMissing(mFileName) = False, mFileName, cINDRRGREFD_CRLFILENAME)
IndrRgRefdCRLFileFullPath = AddBS(mFilePath) & mFileName

End Property

Public Property Get LabRegOptFileFullPath(Optional ByVal mFilePath, Optional ByVal mFileName) As String
mFilePath = IIf(IsMissing(mFilePath) = False, mFilePath, sCmpDataPath)  ''' sAppPath
mFileName = IIf(IsMissing(mFileName) = False, mFileName, sLabRegOptFileName)
LabRegOptFileFullPath = AddBS(mFilePath) & mFileName

End Property

Public Property Get LabRegOldFileFullPath(Optional ByVal mFilePath, Optional ByVal mFileName) As String
mFilePath = IIf(IsMissing(mFilePath) = False, mFilePath, sCmpDataPath)  ''' sAppPath
mFileName = IIf(IsMissing(mFileName) = False, mFileName, sLabRegOldFileName)
LabRegOldFileFullPath = AddBS(mFilePath) & mFileName

End Property

Public Property Get LabRegCRLFileFullPath(Optional ByVal mFilePath, Optional ByVal mFileName) As String
mFilePath = IIf(IsMissing(mFilePath) = False, mFilePath, sCmpDataPath)  ''' sAppPath
mFileName = IIf(IsMissing(mFileName) = False, mFileName, cLABREG_CRLFILENAME)
LabRegCRLFileFullPath = AddBS(mFilePath) & mFileName

End Property

Public Property Get LabRcptOptFileFullPath(Optional ByVal mFilePath, Optional ByVal mFileName) As String
mFilePath = IIf(IsMissing(mFilePath) = False, mFilePath, sCmpDataPath)  ''' sAppPath
mFileName = IIf(IsMissing(mFileName) = False, mFileName, sLabRcptOptFileName)
LabRcptOptFileFullPath = AddBS(mFilePath) & mFileName

End Property

Public Property Get LabRcptOldFileFullPath(Optional ByVal mFilePath, Optional ByVal mFileName) As String
mFilePath = IIf(IsMissing(mFilePath) = False, mFilePath, sCmpDataPath)  ''' sAppPath
mFileName = IIf(IsMissing(mFileName) = False, mFileName, sLabRcptOldFileName)
LabRcptOldFileFullPath = AddBS(mFilePath) & mFileName

End Property

Public Property Get LabRcptCRLFileFullPath(Optional ByVal mFilePath, Optional ByVal mFileName) As String
mFilePath = IIf(IsMissing(mFilePath) = False, mFilePath, sCmpDataPath)  ''' sAppPath
mFileName = IIf(IsMissing(mFileName) = False, mFileName, cLABRCPT_CRLFILENAME)
LabRcptCRLFileFullPath = AddBS(mFilePath) & mFileName

End Property

Public Property Get LabPymtOptFileFullPath(Optional ByVal mFilePath, Optional ByVal mFileName) As String
mFilePath = IIf(IsMissing(mFilePath) = False, mFilePath, sCmpDataPath)  ''' sAppPath
mFileName = IIf(IsMissing(mFileName) = False, mFileName, sLabPymtOptFileName)
LabPymtOptFileFullPath = AddBS(mFilePath) & mFileName

End Property

Public Property Get LabPymtOldFileFullPath(Optional ByVal mFilePath, Optional ByVal mFileName) As String
mFilePath = IIf(IsMissing(mFilePath) = False, mFilePath, sCmpDataPath)  ''' sAppPath
mFileName = IIf(IsMissing(mFileName) = False, mFileName, sLabPymtOldFileName)
LabPymtOldFileFullPath = AddBS(mFilePath) & mFileName

End Property

Public Property Get LabPymtCRLFileFullPath(Optional ByVal mFilePath, Optional ByVal mFileName) As String
mFilePath = IIf(IsMissing(mFilePath) = False, mFilePath, sCmpDataPath)  ''' sAppPath
mFileName = IIf(IsMissing(mFileName) = False, mFileName, cLABPYMT_CRLFILENAME)
LabPymtCRLFileFullPath = AddBS(mFilePath) & mFileName

End Property

Public Property Get LabRefdOptFileFullPath(Optional ByVal mFilePath, Optional ByVal mFileName) As String
mFilePath = IIf(IsMissing(mFilePath) = False, mFilePath, sCmpDataPath)  ''' sAppPath
mFileName = IIf(IsMissing(mFileName) = False, mFileName, sLabRefdOptFileName)
LabRefdOptFileFullPath = AddBS(mFilePath) & mFileName

End Property

Public Property Get LabRefdOldFileFullPath(Optional ByVal mFilePath, Optional ByVal mFileName) As String
mFilePath = IIf(IsMissing(mFilePath) = False, mFilePath, sCmpDataPath)  ''' sAppPath
mFileName = IIf(IsMissing(mFileName) = False, mFileName, sLabRefdOldFileName)
LabRefdOldFileFullPath = AddBS(mFilePath) & mFileName

End Property

Public Property Get LabRefdCRLFileFullPath(Optional ByVal mFilePath, Optional ByVal mFileName) As String
mFilePath = IIf(IsMissing(mFilePath) = False, mFilePath, sCmpDataPath)  ''' sAppPath
mFileName = IIf(IsMissing(mFileName) = False, mFileName, cLABREFD_CRLFILENAME)
LabRefdCRLFileFullPath = AddBS(mFilePath) & mFileName

End Property

Public Property Get CollRepCRLFileFullPath(Optional ByVal mFilePath, Optional ByVal mFileName) As String
mFilePath = IIf(IsMissing(mFilePath) = False, mFilePath, sCmpDataPath)  ''' sAppPath
mFileName = IIf(IsMissing(mFileName) = False, mFileName, cCOLLREP_CRLFILENAME)
CollRepCRLFileFullPath = AddBS(mFilePath) & mFileName

End Property

Public Property Get ServRepCRLFileFullPath(Optional ByVal mFilePath, Optional ByVal mFileName) As String
mFilePath = IIf(IsMissing(mFilePath) = False, mFilePath, sCmpDataPath)  ''' sAppPath
mFileName = IIf(IsMissing(mFileName) = False, mFileName, cSERVREP_CRLFILENAME)
ServRepCRLFileFullPath = AddBS(mFilePath) & mFileName

End Property

Public Property Get dbHmsDatabaseFullPath(Optional ByVal mDbPath) As String
mDbPath = IIf(IsMissing(mDbPath) = False, mDbPath, sCmpDataPath)
dbHmsDatabaseFullPath = AddBS(mDbPath) & sHmsDatabaseName

End Property

Public Function OpenHmsDataSource(ByRef db As ADODB.Connection, Optional ByVal mDbPath, Optional ByVal mUserId As String, Optional ByVal mPwd As String, Optional ByVal mExclusiveMode As Boolean) As Variant
mDbPath = AddBS(IIf(IsMissing(mDbPath) = False, mDbPath, sCmpDataPath))
db.ConnectionString = "Provider=" & DbProvider & ";Data Source=" & dbHmsDatabaseFullPath(mDbPath)
If mExclusiveMode = True Then
    db.Mode = adModeShareExclusive
End If

db.open
End Function

Public Sub GetServRateValues(ByRef cnn As ADODB.Connection, ByVal mSrvCode As Long, ByVal mTranDate As Date, ByVal mTranTime As Long, Optional ByVal mSrmPttCode As Long, Optional ByVal mSrmDctCode As Long, Optional ByVal mSrmPcgCode As Long, Optional ByVal mSrmRByCode As Long, Optional ByVal mSrmRToCode As Long, Optional ByRef mSrmRate As Double, Optional ByRef mSrmDiscPer As Double, Optional ByRef mSrmInfByPer As Double, Optional ByRef mSrmDefByPer As Double, Optional ByRef mSrmSharePer As Double, Optional ByRef mSrmShareAmt As Double)
Dim clsSRV As New clsHmsMasterEntry, clsSGP As New clsHmsMasterEntry, clsPCG As New clsHmsMasterEntry, clsPTT As New clsHmsMasterEntry
Dim tRecset As New ADODB.Recordset

Dim mDctwseRateSys As Boolean, mPcgwseRateSys As Boolean, mRBywseRateSys As Boolean, mRTowseRateSys As Boolean, mTimewseRateSys As Boolean
Dim mDctwseDiscSys As Boolean, mPcgwseDiscSys As Boolean, mRBywseDiscSys As Boolean, mRTowseDiscSys As Boolean, mTimewseDiscSys As Boolean
Dim mDctwseBargSys As Boolean, mPcgwseBargSys As Boolean, mRBywseBargSys As Boolean, mRTowseBargSys As Boolean, mTimewseBargSys As Boolean
Dim mDctwseShareSys As Boolean, mPcgwseShareSys As Boolean, mRBywseShareSys As Boolean, mRTowseShareSys As Boolean, mTimewseShareSys As Boolean

clsSRV.blnServMast = True
Set clsSRV.dbHmsDatabase = cnn
clsSRV.Init

clsSGP.blnServGrpMast = True
Set clsSGP.dbHmsDatabase = cnn
clsSGP.Init

clsPCG.blnPatCatgMast = True
Set clsPCG.dbHmsDatabase = cnn
clsPCG.Init

clsPTT.blnPatMast = True
Set clsPTT.dbHmsDatabase = cnn
clsPTT.Init

clsSRV.GetData mSrvCode
clsSGP.GetData clsSRV.mSrvSgpCode_lng
clsPCG.GetData mSrmPcgCode
clsPTT.GetData mSrmPttCode

If sExtServRateSys = False Then
    mDctwseRateSys = sDctwseServRateSys
    mPcgwseRateSys = sPcgwseServRateSys
    mRBywseRateSys = sRBywseServRateSys
    mRTowseRateSys = sRTowseServRateSys
    mTimewseRateSys = sTimewseServRateSys
Else
    If clsSGP.mSgpExtRateSys_bln = False Then
        mDctwseRateSys = clsSGP.mSgpDctwseRateSys_bln
        mPcgwseRateSys = clsSGP.mSgpPcgwseRateSys_bln
        mRBywseRateSys = clsSGP.mSgpRBywseRateSys_bln
        mRTowseRateSys = clsSGP.mSgpRTowseRateSys_bln
        mTimewseRateSys = clsSGP.mSgpTimewseRateSys_bln
    Else
        mDctwseRateSys = clsSRV.mSrvDctwseRateSys_bln
        mPcgwseRateSys = clsSRV.mSrvPcgwseRateSys_bln
        mRBywseRateSys = clsSRV.mSrvRBywseRateSys_bln
        mRTowseRateSys = clsSRV.mSrvRTowseRateSys_bln
        mTimewseRateSys = clsSRV.mSrvTimewseRateSys_bln
    End If
End If

If sExtServDiscSys = False Then
    mDctwseDiscSys = sDctwseServDiscSys
    mPcgwseDiscSys = sPcgwseServDiscSys
    mRBywseDiscSys = sRBywseServDiscSys
    mRTowseDiscSys = sRTowseServDiscSys
    mTimewseDiscSys = sTimewseServDiscSys
Else
    If clsSGP.mSgpExtDiscSys_bln = False Then
        mDctwseDiscSys = clsSGP.mSgpDctwseDiscSys_bln
        mPcgwseDiscSys = clsSGP.mSgpPcgwseDiscSys_bln
        mRBywseDiscSys = clsSGP.mSgpRBywseDiscSys_bln
        mRTowseDiscSys = clsSGP.mSgpRTowseDiscSys_bln
        mTimewseDiscSys = clsSGP.mSgpTimewseDiscSys_bln
    Else
        mDctwseDiscSys = clsSRV.mSrvDctwseDiscSys_bln
        mPcgwseDiscSys = clsSRV.mSrvPcgwseDiscSys_bln
        mRBywseDiscSys = clsSRV.mSrvRBywseDiscSys_bln
        mRTowseDiscSys = clsSRV.mSrvRTowseDiscSys_bln
        mTimewseDiscSys = clsSRV.mSrvTimewseDiscSys_bln
    End If
End If
    
If sExtServBargSys = False Then
    mDctwseBargSys = sDctwseServBargSys
    mPcgwseBargSys = sPcgwseServBargSys
    mRBywseBargSys = sRBywseServBargSys
    mRTowseBargSys = sRTowseServBargSys
    mTimewseBargSys = sTimewseServBargSys
Else
    If clsSGP.mSgpExtBargSys_bln = False Then
        mDctwseBargSys = clsSGP.mSgpDctwseBargSys_bln
        mPcgwseBargSys = clsSGP.mSgpPcgwseBargSys_bln
        mRBywseBargSys = clsSGP.mSgpRBywseBargSys_bln
        mRTowseBargSys = clsSGP.mSgpRTowseBargSys_bln
        mTimewseBargSys = clsSGP.mSgpTimewseBargSys_bln
    Else
        mDctwseBargSys = clsSRV.mSrvDctwseBargSys_bln
        mPcgwseBargSys = clsSRV.mSrvPcgwseBargSys_bln
        mRBywseBargSys = clsSRV.mSrvRBywseBargSys_bln
        mRTowseBargSys = clsSRV.mSrvRTowseBargSys_bln
        mTimewseBargSys = clsSRV.mSrvTimewseBargSys_bln
    End If
End If

If sExtServShareSys = False Then
    mDctwseShareSys = sDctwseServShareSys
    mPcgwseShareSys = sPcgwseServShareSys
    mRBywseShareSys = sRBywseServShareSys
    mRTowseShareSys = sRTowseServShareSys
    mTimewseShareSys = sTimewseServShareSys
Else
    If clsSGP.mSgpExtShareSys_bln = False Then
        mDctwseShareSys = clsSGP.mSgpDctwseShareSys_bln
        mPcgwseShareSys = clsSGP.mSgpPcgwseShareSys_bln
        mRBywseShareSys = clsSGP.mSgpRBywseShareSys_bln
        mRTowseShareSys = clsSGP.mSgpRTowseShareSys_bln
        mTimewseShareSys = clsSGP.mSgpTimewseShareSys_bln
    Else
        mDctwseShareSys = clsSRV.mSrvDctwseShareSys_bln
        mPcgwseShareSys = clsSRV.mSrvPcgwseShareSys_bln
        mRBywseShareSys = clsSRV.mSrvRBywseShareSys_bln
        mRTowseShareSys = clsSRV.mSrvRTowseShareSys_bln
        mTimewseShareSys = clsSRV.mSrvTimewseShareSys_bln
    End If
End If

If mDctwseRateSys = True Or mPcgwseRateSys = True Or mRBywseRateSys = True Or mRTowseRateSys = True Or mTimewseRateSys = True Then
    With tRecset
    .open "Select top 1 * from ServRateMst where SrmCode = " & CStr(mSrvCode) & IIf(mDctwseRateSys = True, " and SrmDctCode = " & CStr(mSrmDctCode), "") & IIf(mPcgwseRateSys = True, " and SrmPcgCode = " & CStr(mSrmPcgCode), "") & IIf(mRBywseRateSys = True, " and SrmRByCode = " & CStr(mSrmRByCode), "") & IIf(mRTowseRateSys = True, " and SrmRToCode = " & CStr(mSrmRToCode), "") & " and SrmWefDate <= #" & ToSysDate(mTranDate) & "#" & IIf(mTimewseRateSys = True, " and SrmStartTime <= " & CStr(mTranTime) & " and SrmEndTime >= " & CStr(mTranTime), "") & " order by SrmWefDate desc", cnn, adOpenKeyset, adLockOptimistic
    If .EOF = False Then
        mSrmRate = .fields("SrmRate")
    End If
    End With
    CloseTable tRecset
End If
If mSrmRate = 0 Then
    mSrmRate = clsSRV.mSrvRate_dbl
End If

If clsPCG.mPcgDiscAllowed_bln = True And clsSGP.mSgpDiscAllowed_bln = True And clsSRV.mSrvDiscAllowed_bln = True And IIf(mSrmPttCode > 0, clsPTT.mPttDiscAllowed_bln = True, True) Then
    If mDctwseDiscSys = True Or mPcgwseDiscSys = True Or mRBywseDiscSys = True Or mRTowseDiscSys = True Or mTimewseDiscSys = True Then
        With tRecset
        .open "Select top 1 * from ServRateMst where SrmCode = " & CStr(mSrvCode) & IIf(mDctwseDiscSys = True, " and SrmDctCode = " & CStr(mSrmDctCode), "") & IIf(mPcgwseDiscSys = True, " and SrmPcgCode = " & CStr(mSrmPcgCode), "") & IIf(mRBywseDiscSys = True, " and SrmRByCode = " & CStr(mSrmRByCode), "") & IIf(mRTowseDiscSys = True, " and SrmRToCode = " & CStr(mSrmRToCode), "") & " and SrmWefDate <= #" & ToSysDate(mTranDate) & "#" & IIf(mTimewseDiscSys = True, " and SrmStartTime <= " & CStr(mTranTime) & " and SrmEndTime >= " & CStr(mTranTime), "") & " order by SrmWefDate desc", cnn, adOpenKeyset, adLockOptimistic
        If .EOF = False Then
            mSrmDiscPer = .fields("SrmDiscPer")
        End If
        End With
        CloseTable tRecset
    End If
    If mSrmDiscPer = 0 Then
        mSrmDiscPer = clsSRV.mSrvDiscPer_dbl
    End If
    If mSrmDiscPer = 0 Then
        mSrmDiscPer = clsSGP.mSgpDiscPer_dbl
    End If
    If mSrmDiscPer = 0 Then
        mSrmDiscPer = clsPTT.mPttDiscPer_dbl
    End If
    If mSrmDiscPer = 0 Then
        mSrmDiscPer = clsPCG.mPcgDiscPer_dbl
    End If
End If

If clsPCG.mPcgInfAllowed_bln = True And clsSGP.mSgpInfAllowed_bln = True And clsSRV.mSrvInfAllowed_bln = True And IIf(mSrmPttCode > 0, clsPTT.mPttInfAllowed_bln = True, True) Then
    If mDctwseBargSys = True Or mPcgwseBargSys = True Or mRBywseBargSys = True Or mRTowseBargSys = True Or mTimewseBargSys = True Then
        With tRecset
        .open "Select top 1 * from ServRateMst where SrmCode = " & CStr(mSrvCode) & IIf(mDctwseBargSys = True, " and SrmDctCode = " & CStr(mSrmDctCode), "") & IIf(mPcgwseBargSys = True, " and SrmPcgCode = " & CStr(mSrmPcgCode), "") & IIf(mRBywseBargSys = True, " and SrmRByCode = " & CStr(mSrmRByCode), "") & IIf(mRTowseBargSys = True, " and SrmRToCode = " & CStr(mSrmRToCode), "") & " and SrmWefDate <= #" & ToSysDate(mTranDate) & "#" & IIf(mTimewseBargSys = True, " and SrmStartTime <= " & CStr(mTranTime) & " and SrmEndTime >= " & CStr(mTranTime), "") & " order by SrmWefDate desc", cnn, adOpenKeyset, adLockOptimistic
        If .EOF = False Then
            mSrmInfByPer = .fields("SrmInfByPer")
        End If
        End With
        CloseTable tRecset
    End If
End If

If clsPCG.mPcgDefAllowed_bln = True And clsSGP.mSgpDefAllowed_bln = True And clsSRV.mSrvDefAllowed_bln = True And IIf(mSrmPttCode > 0, clsPTT.mPttDefAllowed_bln = True, True) Then
    If mDctwseBargSys = True Or mPcgwseBargSys = True Or mRBywseBargSys = True Or mRTowseBargSys = True Or mTimewseBargSys = True Then
        With tRecset
        .open "Select top 1 * from ServRateMst where SrmCode = " & CStr(mSrvCode) & IIf(mDctwseBargSys = True, " and SrmDctCode = " & CStr(mSrmDctCode), "") & IIf(mPcgwseBargSys = True, " and SrmPcgCode = " & CStr(mSrmPcgCode), "") & IIf(mRBywseBargSys = True, " and SrmRByCode = " & CStr(mSrmRByCode), "") & IIf(mRTowseBargSys = True, " and SrmRToCode = " & CStr(mSrmRToCode), "") & " and SrmWefDate <= #" & ToSysDate(mTranDate) & "#" & IIf(mTimewseBargSys = True, " and SrmStartTime <= " & CStr(mTranTime) & " and SrmEndTime >= " & CStr(mTranTime), "") & " order by SrmWefDate desc", cnn, adOpenKeyset, adLockOptimistic
        If .EOF = False Then
            mSrmDefByPer = .fields("SrmDefByPer")
        End If
        End With
        CloseTable tRecset
    End If
End If

If mDctwseShareSys = True Or mPcgwseShareSys = True Or mRBywseShareSys = True Or mRTowseShareSys = True Or mTimewseShareSys = True Then
    With tRecset
    .open "Select top 1 * from ServRateMst where SrmCode=" & CStr(mSrvCode) & IIf(mDctwseShareSys = True, " and SrmDctCode=" & CStr(mSrmDctCode), "") & IIf(mPcgwseShareSys = True, " and SrmPcgCode=" & CStr(mSrmPcgCode), "") & IIf(mRBywseShareSys = True, " and SrmRByCode=" & CStr(mSrmRByCode), "") & IIf(mRTowseShareSys = True, " and SrmRToCode=" & CStr(mSrmRToCode), "") & " and SrmWefDate<=#" & ToSysDate(mTranDate) & "#" & IIf(mTimewseShareSys = True, " and SrmStartTime<=" & CStr(mTranTime) & " and SrmEndTime>=" & CStr(mTranTime), "") & " order by SrmWefDate desc", cnn, adOpenKeyset, adLockOptimistic
    If .EOF = False Then
        mSrmSharePer = .fields("SrmSharePer")
        mSrmShareAmt = .fields("SrmShareAmt")
    End If
    End With
    CloseTable tRecset
End If

Set clsSRV = Nothing: Set clsSGP = Nothing: Set clsPCG = Nothing: Set clsPTT = Nothing
CloseTable tRecset, mCheckOpen:=True

End Sub

Public Sub GetIndrLinkTranAmt(ByRef cnn As ADODB.Connection, ByVal mIpgCode As Long, Optional ByRef mIblAmtAftDiscTot, Optional ByRef mIpgAdvAmtTot, Optional ByRef mIrcAmtAftDiscTot, Optional ByRef mIrcRecdAmtTot, Optional ByRef mIrcDepoAmtTot, Optional ByRef mIrcRefuAmtTot, Optional ByRef mIrcBalAmtTot, Optional ByRef mIgtDpogAmtTot, Optional ByRef mIgfRfugAmtTot, Optional ByRef mIbpyDepoAmtTot, Optional ByRef mIbfdRefuAmtTot)
Dim tRecset As New ADODB.Recordset

If IsMissing(mIblAmtAftDiscTot) = False Then
    With tRecset
    .open "Select IbhIpgCode,sum(IbhAmtAftDisc) as IbhAmtAftDisc_sum from IndrBlHdr where IbhIpgCode=" & CStr(mIpgCode) & " group by IbhIpgCode", cnn, adOpenKeyset, adLockOptimistic
    If .EOF = False Then
        mIblAmtAftDiscTot = .fields("IbhAmtAftDisc_sum")
    End If
    End With
    CloseTable tRecset
End If
If IsMissing(mIpgAdvAmtTot) = False Then
    With tRecset
    .open "Select IpgCode,sum(IpgAdvAmt) as IpgAdvAmt_sum from IndrReg where IpgCode=" & CStr(mIpgCode) & " group by IpgCode", cnn, adOpenKeyset, adLockOptimistic
    If .EOF = False Then
        mIpgAdvAmtTot = .fields("IpgAdvAmt_sum")
    End If
    End With
    CloseTable tRecset
End If
If IsMissing(mIrcAmtAftDiscTot) = False Or IsMissing(mIrcRecdAmtTot) = False Or IsMissing(mIrcDepoAmtTot) = False Or IsMissing(mIrcRefuAmtTot) = False Or IsMissing(mIrcBalAmtTot) = False Then
    With tRecset
    .open "Select IhrIpgCode,sum(IhrAmtAftDisc) as IhrAmtAftDisc_sum, sum(IhrRecdAmt) as IhrRecdAmt_sum, sum(IhrDepoAmt) as IhrDepoAmt_sum, sum(IhrRefuAmt) as IhrRefuAmt_sum, sum(IhrBalAmt) as IhrBalAmt_sum from IndrHdr where IhrIpgCode=" & CStr(mIpgCode) & " group by IhrIpgCode", cnn, adOpenKeyset, adLockOptimistic
    If .EOF = False Then
        mIrcAmtAftDiscTot = .fields("IhrAmtAftDisc_sum")
        mIrcRecdAmtTot = .fields("IhrRecdAmt_sum")
        mIrcDepoAmtTot = .fields("IhrDepoAmt_sum")
        mIrcRefuAmtTot = .fields("IhrRefuAmt_sum")
        mIrcBalAmtTot = .fields("IhrBalAmt_sum")
    End If
    End With
    CloseTable tRecset
End If
If IsMissing(mIgtDpogAmtTot) = False Then
    With tRecset
    .open "Select IgtIpgCode,sum(IgtDpogAmt) as IgtDpogAmt_sum from IndrRgPymt where IgtIpgCode=" & CStr(mIpgCode) & " group by IgtIpgCode", cnn, adOpenKeyset, adLockOptimistic
    If .EOF = False Then
        mIgtDpogAmtTot = .fields("IgtDpogAmt_sum")
    End If
    End With
    CloseTable tRecset
End If
If IsMissing(mIgfRfugAmtTot) = False Then
    With tRecset
    .open "Select IgfIpgCode,sum(IgfRfugAmt) as IgfRfugAmt_sum from IndrRgRefd where IgfIpgCode=" & CStr(mIpgCode) & " group by IgfIpgCode", cnn, adOpenKeyset, adLockOptimistic
    If .EOF = False Then
        mIgfRfugAmtTot = .fields("IgfRfugAmt_sum")
    End If
    End With
    CloseTable tRecset
End If
If IsMissing(mIbpyDepoAmtTot) = False Then
    With tRecset
    .open "Select IbphIpgCode,sum(IbphDepoAmt) as IbphDepoAmt_sum from IndrBlPymtHdr where IbphIpgCode=" & CStr(mIpgCode) & " group by IbphIpgCode", cnn, adOpenKeyset, adLockOptimistic
    If .EOF = False Then
        mIbpyDepoAmtTot = .fields("IbphDepoAmt_sum")
    End If
    End With
    CloseTable tRecset
End If
If IsMissing(mIbfdRefuAmtTot) = False Then
    With tRecset
    .open "Select IbfhIpgCode,sum(IbfhRefuAmt) as IbfhRefuAmt_sum from IndrBlRefdHdr where IbfhIpgCode=" & CStr(mIpgCode) & " group by IbfhIpgCode", cnn, adOpenKeyset, adLockOptimistic
    If .EOF = False Then
        mIbfdRefuAmtTot = .fields("IbfhRefuAmt_sum")
    End If
    End With
    CloseTable tRecset
End If

End Sub

Public Function GetIndrLinkTranVchr(ByRef cnn As ADODB.Connection, ByVal mIpgCode As Long) As String
Dim tRecset As New ADODB.Recordset, mLinkTranStr As String

With tRecset
.open "Select * from IndrBlHdr as hdr inner join VTypMast vty on hdr.IbhVtmCode=vty.VtmCode where IbhIpgCode=" & CStr(mIpgCode) & " order by IbhCode", cnn, adOpenKeyset, adLockOptimistic
If .EOF = False Then
    Do While .EOF = False
        mLinkTranStr = mLinkTranStr & .fields("VtmName") & " No." & CStr(.fields("IbhVchNo")) & " Dated " & Dtoc(.fields("IbhDate")) & " Rs." & ToMyNumFmt(.fields("IbhAmtAftDisc")) & vbCrLf
        
        .MoveNext
    Loop
End If
End With
CloseTable tRecset

With tRecset
.open "Select * from IndrBlPymtHdr as hdr inner join VTypMast vty on hdr.IbphVtmCode=vty.VtmCode where IbphIpgCode=" & CStr(mIpgCode) & " order by IbphCode", cnn, adOpenKeyset, adLockOptimistic
If .EOF = False Then
    Do While .EOF = False
        mLinkTranStr = mLinkTranStr & .fields("VtmName") & " No." & CStr(.fields("IbphVchNo")) & " Dated " & Dtoc(.fields("IbphDate")) & " Rs." & ToMyNumFmt(.fields("IbphDepoAmt")) & vbCrLf
        
        .MoveNext
    Loop
End If
End With
CloseTable tRecset

With tRecset
.open "Select * from IndrBlRefdHdr as hdr inner join VTypMast vty on hdr.IbfhVtmCode=vty.VtmCode where IbfhIpgCode=" & CStr(mIpgCode) & " order by IbfhCode", cnn, adOpenKeyset, adLockOptimistic
If .EOF = False Then
    Do While .EOF = False
        mLinkTranStr = mLinkTranStr & .fields("VtmName") & " No." & CStr(.fields("IbfhVchNo")) & " Dated " & Dtoc(.fields("IbfhDate")) & " Rs." & ToMyNumFmt(.fields("IbfhRefuAmt")) & vbCrLf
        
        .MoveNext
    Loop
End If
End With
CloseTable tRecset

With tRecset
.open "Select * from IndrReg as hdr inner join VTypMast vty on hdr.IpgVtmCode=vty.VtmCode where IpgCode=" & CStr(mIpgCode) & " order by IpgCode", cnn, adOpenKeyset, adLockOptimistic
If .EOF = False Then
    Do While .EOF = False
        mLinkTranStr = mLinkTranStr & .fields("VtmName") & " No." & CStr(.fields("IpgVchNo")) & " Dated " & Dtoc(.fields("IpgDate")) & " Rs." & ToMyNumFmt(.fields("IpgAdvAmt")) & vbCrLf
        
        .MoveNext
    Loop
End If
End With
CloseTable tRecset

With tRecset
.open "Select * from IndrHdr as hdr inner join VTypMast vty on hdr.IhrVtmCode=vty.VtmCode where IhrIpgCode=" & CStr(mIpgCode) & " order by IhrCode", cnn, adOpenKeyset, adLockOptimistic
If .EOF = False Then
    Do While .EOF = False
        mLinkTranStr = mLinkTranStr & .fields("VtmName") & " No." & CStr(.fields("IhrVchNo")) & " Dated " & Dtoc(.fields("IhrDate")) & " Rs." & ToMyNumFmt(.fields("IhrAmtAftDisc")) & " (Recd." & ToMyNumFmt(.fields("IhrRecdAmt")) & ", Bal." & ToMyNumFmt(.fields("IhrBalAmt")) & ")" & vbCrLf
        
        .MoveNext
    Loop
End If
End With
CloseTable tRecset

With tRecset
.open "Select * from IndrPymtHdr as hdr inner join VTypMast vty on hdr.IphVtmCode=vty.VtmCode where IphIpgCode=" & CStr(mIpgCode) & " order by IphCode", cnn, adOpenKeyset, adLockOptimistic
If .EOF = False Then
    Do While .EOF = False
        mLinkTranStr = mLinkTranStr & .fields("VtmName") & " No." & CStr(.fields("IphVchNo")) & " Dated " & Dtoc(.fields("IphDate")) & " Rs." & ToMyNumFmt(.fields("IphDepoAmt")) & vbCrLf
        
        .MoveNext
    Loop
End If
End With
CloseTable tRecset

With tRecset
.open "Select * from IndrRefdHdr as hdr inner join VTypMast vty on hdr.IfhVtmCode=vty.VtmCode where IfhIpgCode=" & CStr(mIpgCode) & " order by IfhCode", cnn, adOpenKeyset, adLockOptimistic
If .EOF = False Then
    Do While .EOF = False
        mLinkTranStr = mLinkTranStr & .fields("VtmName") & " No." & CStr(.fields("IfhVchNo")) & " Dated " & Dtoc(.fields("IfhDate")) & " Rs." & ToMyNumFmt(.fields("IfhRefuAmt")) & vbCrLf
        
        .MoveNext
    Loop
End If
End With
CloseTable tRecset

With tRecset
.open "Select * from IndrRgPymt as hdr inner join VTypMast vty on hdr.IgtVtmCode=vty.VtmCode where IgtIpgCode=" & CStr(mIpgCode) & " order by IgtCode", cnn, adOpenKeyset, adLockOptimistic
If .EOF = False Then
    Do While .EOF = False
        mLinkTranStr = mLinkTranStr & .fields("VtmName") & " No." & CStr(.fields("IgtVchNo")) & " Dated " & Dtoc(.fields("IgtDate")) & " Rs." & ToMyNumFmt(.fields("IgtDpogAmt")) & vbCrLf
        
        .MoveNext
    Loop
End If
End With
CloseTable tRecset

With tRecset
.open "Select * from IndrRgRefd as hdr inner join VTypMast vty on hdr.IgfVtmCode=vty.VtmCode where IgfIpgCode=" & CStr(mIpgCode) & " order by IgfCode", cnn, adOpenKeyset, adLockOptimistic
If .EOF = False Then
    Do While .EOF = False
        mLinkTranStr = mLinkTranStr & .fields("VtmName") & " No." & CStr(.fields("IgfVchNo")) & " Dated " & Dtoc(.fields("IgfDate")) & " Rs." & ToMyNumFmt(.fields("IgfRfugAmt")) & vbCrLf
        
        .MoveNext
    Loop
End If
End With
CloseTable tRecset

GetIndrLinkTranVchr = mLinkTranStr

End Function

Public Function GetIndrIgtAdjTranVchr(ByRef cnn As ADODB.Connection, ByVal mIpgCode As Long, ByVal mIgtCode As Long) As String
Dim tRecset As New ADODB.Recordset, mLinkTranStr As String

With tRecset
.open "Select * from (IndrBlHdr hdr" _
    & " inner join IndrBlDpogDtl ibgd on hdr.IbhCode=ibgd.IbgdCode)" _
    & " inner join VTypMast vty on hdr.IbhVtmCode=vty.VtmCode" _
    & " where IbhIpgCode=" & CStr(mIpgCode) & " and IbgdIgtCode=" & CStr(mIgtCode) _
    & " order by IbhDate,IbhVchNo" _
    , cnn, adOpenKeyset, adLockOptimistic
If .EOF = False Then
    Do While .EOF = False
        mLinkTranStr = mLinkTranStr & .fields("VtmName") & " No." & CStr(.fields("IbhVchNo")) & " Dated " & Dtoc(.fields("IbhDate")) & " Rs." & ToMyNumFmt(.fields("IbgdDpogAmt")) & vbCrLf
        
        .MoveNext
    Loop
End If
End With
CloseTable tRecset

GetIndrIgtAdjTranVchr = mLinkTranStr

End Function

Public Function GetIndrIgfAdjTranVchr(ByRef cnn As ADODB.Connection, ByVal mIpgCode As Long, ByVal mIgfCode As Long) As String
Dim tRecset As New ADODB.Recordset, mLinkTranStr As String

With tRecset
.open "Select * from (IndrBlHdr hdr" _
    & " inner join IndrBlRfugDtl Ibgf on hdr.IbhCode=Ibgf.IbgfCode)" _
    & " inner join VTypMast vty on hdr.IbhVtmCode=vty.VtmCode" _
    & " where IbhIpgCode=" & CStr(mIpgCode) & " and IbgfIgfCode=" & CStr(mIgfCode) _
    & " order by IbhDate,IbhVchNo" _
    , cnn, adOpenKeyset, adLockOptimistic
If .EOF = False Then
    Do While .EOF = False
        mLinkTranStr = mLinkTranStr & .fields("VtmName") & " No." & CStr(.fields("IbhVchNo")) & " Dated " & Dtoc(.fields("IbhDate")) & " Rs." & ToMyNumFmt(.fields("IbgfRfugAmt")) & vbCrLf
        
        .MoveNext
    Loop
End If
End With
CloseTable tRecset

GetIndrIgfAdjTranVchr = mLinkTranStr

End Function

Public Sub GetBedRateValues(ByRef cnn As ADODB.Connection, ByVal mBdmCode As Long, ByVal mTranDate As Date, ByVal mTranTime As Long, ByVal mSrmPttCode As Long, Optional ByVal mSrmDctCode As Long, Optional ByVal mSrmPcgCode As Long, Optional ByVal mSrmRByCode As Long, Optional ByVal mSrmRToCode As Long, Optional ByRef mSrmRate As Double, Optional ByRef mSrmDiscPer As Double, Optional ByRef mSrmInfByPer As Double, Optional ByRef mSrmDefByPer As Double, Optional ByRef mSrmSharePer As Double, Optional ByRef mSrmShareAmt As Double)
Dim clsBDM As New clsHmsMasterEntry, clsSRV As New clsHmsMasterEntry, clsSGP As New clsHmsMasterEntry, clsPCG As New clsHmsMasterEntry, clsPTT As New clsHmsMasterEntry
Dim tRecset As New ADODB.Recordset

Dim mDctwseRateSys As Boolean, mPcgwseRateSys As Boolean, mRBywseRateSys As Boolean, mRTowseRateSys As Boolean, mTimewseRateSys As Boolean
Dim mDctwseDiscSys As Boolean, mPcgwseDiscSys As Boolean, mRBywseDiscSys As Boolean, mRTowseDiscSys As Boolean, mTimewseDiscSys As Boolean
Dim mDctwseBargSys As Boolean, mPcgwseBargSys As Boolean, mRBywseBargSys As Boolean, mRTowseBargSys As Boolean, mTimewseBargSys As Boolean
Dim mDctwseShareSys As Boolean, mPcgwseShareSys As Boolean, mRBywseShareSys As Boolean, mRTowseShareSys As Boolean, mTimewseShareSys As Boolean

clsBDM.blnBedMast = True
Set clsBDM.dbHmsDatabase = cnn
clsBDM.Init

clsSRV.blnServMast = True
Set clsSRV.dbHmsDatabase = cnn
clsSRV.Init

clsSGP.blnServGrpMast = True
Set clsSGP.dbHmsDatabase = cnn
clsSGP.Init

clsPCG.blnPatCatgMast = True
Set clsPCG.dbHmsDatabase = cnn
clsPCG.Init

clsPTT.blnPatMast = True
Set clsPTT.dbHmsDatabase = cnn
clsPTT.Init

clsBDM.GetData mBdmCode
clsSRV.GetData clsBDM.mBdmSrvCode_lng
clsSGP.GetData clsSRV.mSrvSgpCode_lng
clsPCG.GetData mSrmPcgCode
clsPTT.GetData mSrmPttCode

If sExtServRateSys = False Then
    mDctwseRateSys = sDctwseServRateSys
    mPcgwseRateSys = sPcgwseServRateSys
    mRBywseRateSys = sRBywseServRateSys
    mRTowseRateSys = sRTowseServRateSys
    mTimewseRateSys = sTimewseServRateSys
Else
    If clsSGP.mSgpExtRateSys_bln = False Then
        mDctwseRateSys = clsSGP.mSgpDctwseRateSys_bln
        mPcgwseRateSys = clsSGP.mSgpPcgwseRateSys_bln
        mRBywseRateSys = clsSGP.mSgpRBywseRateSys_bln
        mRTowseRateSys = clsSGP.mSgpRTowseRateSys_bln
        mTimewseRateSys = clsSGP.mSgpTimewseRateSys_bln
    Else
        mDctwseRateSys = clsSRV.mSrvDctwseRateSys_bln
        mPcgwseRateSys = clsSRV.mSrvPcgwseRateSys_bln
        mRBywseRateSys = clsSRV.mSrvRBywseRateSys_bln
        mRTowseRateSys = clsSRV.mSrvRTowseRateSys_bln
        mTimewseRateSys = clsSRV.mSrvTimewseRateSys_bln
    End If
End If

If sExtServDiscSys = False Then
    mDctwseDiscSys = sDctwseServDiscSys
    mPcgwseDiscSys = sPcgwseServDiscSys
    mRBywseDiscSys = sRBywseServDiscSys
    mRTowseDiscSys = sRTowseServDiscSys
    mTimewseDiscSys = sTimewseServDiscSys
Else
    If clsSGP.mSgpExtDiscSys_bln = False Then
        mDctwseDiscSys = clsSGP.mSgpDctwseDiscSys_bln
        mPcgwseDiscSys = clsSGP.mSgpPcgwseDiscSys_bln
        mRBywseDiscSys = clsSGP.mSgpRBywseDiscSys_bln
        mRTowseDiscSys = clsSGP.mSgpRTowseDiscSys_bln
        mTimewseDiscSys = clsSGP.mSgpTimewseDiscSys_bln
    Else
        mDctwseDiscSys = clsSRV.mSrvDctwseDiscSys_bln
        mPcgwseDiscSys = clsSRV.mSrvPcgwseDiscSys_bln
        mRBywseDiscSys = clsSRV.mSrvRBywseDiscSys_bln
        mRTowseDiscSys = clsSRV.mSrvRTowseDiscSys_bln
        mTimewseDiscSys = clsSRV.mSrvTimewseDiscSys_bln
    End If
End If
    
If sExtServBargSys = False Then
    mDctwseBargSys = sDctwseServBargSys
    mPcgwseBargSys = sPcgwseServBargSys
    mRBywseBargSys = sRBywseServBargSys
    mRTowseBargSys = sRTowseServBargSys
    mTimewseBargSys = sTimewseServBargSys
Else
    If clsSGP.mSgpExtBargSys_bln = False Then
        mDctwseBargSys = clsSGP.mSgpDctwseBargSys_bln
        mPcgwseBargSys = clsSGP.mSgpPcgwseBargSys_bln
        mRBywseBargSys = clsSGP.mSgpRBywseBargSys_bln
        mRTowseBargSys = clsSGP.mSgpRTowseBargSys_bln
        mTimewseBargSys = clsSGP.mSgpTimewseBargSys_bln
    Else
        mDctwseBargSys = clsSRV.mSrvDctwseBargSys_bln
        mPcgwseBargSys = clsSRV.mSrvPcgwseBargSys_bln
        mRBywseBargSys = clsSRV.mSrvRBywseBargSys_bln
        mRTowseBargSys = clsSRV.mSrvRTowseBargSys_bln
        mTimewseBargSys = clsSRV.mSrvTimewseBargSys_bln
    End If
End If

If sExtServShareSys = False Then
    mDctwseShareSys = sDctwseServShareSys
    mPcgwseShareSys = sPcgwseServShareSys
    mRBywseShareSys = sRBywseServShareSys
    mRTowseShareSys = sRTowseServShareSys
    mTimewseShareSys = sTimewseServShareSys
Else
    If clsSGP.mSgpExtShareSys_bln = False Then
        mDctwseShareSys = clsSGP.mSgpDctwseShareSys_bln
        mPcgwseShareSys = clsSGP.mSgpPcgwseShareSys_bln
        mRBywseShareSys = clsSGP.mSgpRBywseShareSys_bln
        mRTowseShareSys = clsSGP.mSgpRTowseShareSys_bln
        mTimewseShareSys = clsSGP.mSgpTimewseShareSys_bln
    Else
        mDctwseShareSys = clsSRV.mSrvDctwseShareSys_bln
        mPcgwseShareSys = clsSRV.mSrvPcgwseShareSys_bln
        mRBywseShareSys = clsSRV.mSrvRBywseShareSys_bln
        mRTowseShareSys = clsSRV.mSrvRTowseShareSys_bln
        mTimewseShareSys = clsSRV.mSrvTimewseShareSys_bln
    End If
End If

If mDctwseRateSys = True Or mPcgwseRateSys = True Or mRBywseRateSys = True Or mRTowseRateSys = True Or mTimewseRateSys = True Then
    With tRecset
    .open "Select top 1 * from ServRateMst where SrmCode=" & CStr(clsBDM.mBdmSrvCode_lng) & IIf(mDctwseRateSys = True, " and SrmDctCode=" & CStr(mSrmDctCode), "") & IIf(mPcgwseRateSys = True, " and SrmPcgCode=" & CStr(mSrmPcgCode), "") & IIf(mRBywseRateSys = True, " and SrmRByCode=" & CStr(mSrmRByCode), "") & IIf(mRTowseRateSys = True, " and SrmRToCode=" & CStr(mSrmRToCode), "") & " and SrmWefDate<=#" & ToSysDate(mTranDate) & "#" & IIf(mTimewseRateSys = True, " and SrmStartTime<=" & CStr(mTranTime) & " and SrmEndTime>=" & CStr(mTranTime), "") & " order by SrmWefDate desc", cnn, adOpenKeyset, adLockOptimistic
    If .EOF = False Then
        mSrmRate = .fields("SrmRate")
    End If
    End With
    CloseTable tRecset
End If
If mSrmRate = 0 Then
    mSrmRate = clsBDM.mBdmCharges_dbl
End If
If mSrmRate = 0 Then
    mSrmRate = clsSRV.mSrvRate_dbl
End If

If clsPCG.mPcgDiscAllowed_bln = True And clsSGP.mSgpDiscAllowed_bln = True And clsSRV.mSrvDiscAllowed_bln = True And clsBDM.mBdmDiscAllowed_bln = True And IIf(mSrmPttCode > 0, clsPTT.mPttDiscAllowed_bln = True, True) Then
    If mDctwseDiscSys = True Or mPcgwseDiscSys = True Or mRBywseDiscSys = True Or mRTowseDiscSys = True Or mTimewseDiscSys = True Then
        With tRecset
        .open "Select top 1 * from ServRateMst where SrmCode = " & CStr(clsBDM.mBdmSrvCode_lng) & IIf(mDctwseDiscSys = True, " and SrmDctCode = " & CStr(mSrmDctCode), "") & IIf(mPcgwseDiscSys = True, " and SrmPcgCode = " & CStr(mSrmPcgCode), "") & IIf(mRBywseDiscSys = True, " and SrmRByCode = " & CStr(mSrmRByCode), "") & IIf(mRTowseDiscSys = True, " and SrmRToCode = " & CStr(mSrmRToCode), "") & " and SrmWefDate <= #" & ToSysDate(mTranDate) & "#" & IIf(mTimewseDiscSys = True, " and SrmStartTime <= " & CStr(mTranTime) & " and SrmEndTime >= " & CStr(mTranTime), "") & " order by SrmWefDate desc", cnn, adOpenKeyset, adLockOptimistic
        If .EOF = False Then
            mSrmDiscPer = .fields("SrmDiscPer")
        End If
        End With
        CloseTable tRecset
    End If
    If mSrmDiscPer = 0 Then
        mSrmDiscPer = clsBDM.mBdmDiscPer_sng
    End If
    If mSrmDiscPer = 0 Then
        mSrmDiscPer = clsSRV.mSrvDiscPer_dbl
    End If
    If mSrmDiscPer = 0 Then
        mSrmDiscPer = clsSGP.mSgpDiscPer_dbl
    End If
    If mSrmDiscPer = 0 Then
        mSrmDiscPer = clsPTT.mPttDiscPer_dbl
    End If
    If mSrmDiscPer = 0 Then
        mSrmDiscPer = clsPCG.mPcgDiscPer_dbl
    End If
End If

If clsPCG.mPcgInfAllowed_bln = True And clsSGP.mSgpInfAllowed_bln = True And clsSRV.mSrvInfAllowed_bln = True And IIf(mSrmPttCode > 0, clsPTT.mPttInfAllowed_bln = True, True) Then
    If mDctwseBargSys = True Or mPcgwseBargSys = True Or mRBywseBargSys = True Or mRTowseBargSys = True Or mTimewseBargSys = True Then
        With tRecset
        .open "Select top 1 * from ServRateMst where SrmCode = " & CStr(clsBDM.mBdmSrvCode_lng) & IIf(mDctwseBargSys = True, " and SrmDctCode = " & CStr(mSrmDctCode), "") & IIf(mPcgwseBargSys = True, " and SrmPcgCode = " & CStr(mSrmPcgCode), "") & IIf(mRBywseBargSys = True, " and SrmRByCode = " & CStr(mSrmRByCode), "") & IIf(mRTowseBargSys = True, " and SrmRToCode = " & CStr(mSrmRToCode), "") & " and SrmWefDate <= #" & ToSysDate(mTranDate) & "#" & IIf(mTimewseBargSys = True, " and SrmStartTime <= " & CStr(mTranTime) & " and SrmEndTime >= " & CStr(mTranTime), "") & " order by SrmWefDate desc", cnn, adOpenKeyset, adLockOptimistic
        If .EOF = False Then
            mSrmInfByPer = .fields("SrmInfByPer")
        End If
        End With
        CloseTable tRecset
    End If
End If

If clsPCG.mPcgDefAllowed_bln = True And clsSGP.mSgpDefAllowed_bln = True And clsSRV.mSrvDefAllowed_bln = True And IIf(mSrmPttCode > 0, clsPTT.mPttDefAllowed_bln = True, True) Then
    If mDctwseBargSys = True Or mPcgwseBargSys = True Or mRBywseBargSys = True Or mRTowseBargSys = True Or mTimewseBargSys = True Then
        With tRecset
        .open "Select top 1 * from ServRateMst where SrmCode = " & CStr(clsBDM.mBdmSrvCode_lng) & IIf(mDctwseBargSys = True, " and SrmDctCode = " & CStr(mSrmDctCode), "") & IIf(mPcgwseBargSys = True, " and SrmPcgCode = " & CStr(mSrmPcgCode), "") & IIf(mRBywseBargSys = True, " and SrmRByCode = " & CStr(mSrmRByCode), "") & IIf(mRTowseBargSys = True, " and SrmRToCode = " & CStr(mSrmRToCode), "") & " and SrmWefDate <= #" & ToSysDate(mTranDate) & "#" & IIf(mTimewseBargSys = True, " and SrmStartTime <= " & CStr(mTranTime) & " and SrmEndTime >= " & CStr(mTranTime), "") & " order by SrmWefDate desc", cnn, adOpenKeyset, adLockOptimistic
        If .EOF = False Then
            mSrmDefByPer = .fields("SrmDefByPer")
        End If
        End With
        CloseTable tRecset
    End If
End If

If mDctwseShareSys = True Or mPcgwseShareSys = True Or mRBywseShareSys = True Or mRTowseShareSys = True Or mTimewseShareSys = True Then
    With tRecset
    .open "Select top 1 * from ServRateMst where SrmCode=" & CStr(clsBDM.mBdmSrvCode_lng) & IIf(mDctwseShareSys = True, " and SrmDctCode=" & CStr(mSrmDctCode), "") & IIf(mPcgwseShareSys = True, " and SrmPcgCode=" & CStr(mSrmPcgCode), "") & IIf(mRBywseShareSys = True, " and SrmRByCode=" & CStr(mSrmRByCode), "") & IIf(mRTowseShareSys = True, " and SrmRToCode=" & CStr(mSrmRToCode), "") & " and SrmWefDate<=#" & ToSysDate(mTranDate) & "#" & IIf(mTimewseShareSys = True, " and SrmStartTime<=" & CStr(mTranTime) & " and SrmEndTime>=" & CStr(mTranTime), "") & " order by SrmWefDate desc", cnn, adOpenKeyset, adLockOptimistic
    If .EOF = False Then
        mSrmSharePer = .fields("SrmSharePer")
        mSrmShareAmt = .fields("SrmShareAmt")
    End If
    End With
    CloseTable tRecset
End If

Set clsBDM = Nothing: Set clsSRV = Nothing: Set clsSGP = Nothing: Set clsPCG = Nothing: Set clsPTT = Nothing
CloseTable tRecset, mCheckOpen:=True

End Sub

Public Sub ResetIpdBillSrvIndexOrder(ByRef cnn As ADODB.Connection, ByVal mIblCode As Long)
Dim tRecset As New ADODB.Recordset

cnn.BeginTrans
With tRecset
.open "Select * from IndrBill ibl" _
    & " inner join (ServMast srv inner join ServGrpMst sgp on srv.SrvSgpCode = sgp.SgpCode) on ibl.IblSrvCode = srv.SrvCode" _
    & " where IblCode=" & CStr(mIblCode) _
    & " order by sgp.SgpIndex,srv.SrvIndex,IblICode" _
    , cnn, adOpenKeyset, adLockOptimistic
If .EOF = False Then
    Do While .EOF = False
        .fields("IblSno") = .AbsolutePosition
        .Update
        
        .MoveNext
    Loop
End If
End With
CloseTable tRecset
cnn.CommitTrans

End Sub

Public Function GetIpdDischState(ByRef cnn As ADODB.Connection, ByVal mIpgCode As Long) As Integer
Dim mRtnval As Integer, tRecset As New ADODB.Recordset

Set tRecset = cnn.Execute("Select top 1 * from IBedState where IbsIpgCode = " & CStr(mIpgCode) & " order by IbsCode desc")
With tRecset
If .EOF = False Then
    mRtnval = .fields("IbsDischState")
Else
    mRtnval = cIBS_STATE_UNKNOWN
End If
End With
CloseTable tRecset

GetIpdDischState = mRtnval

End Function

Public Function GetServDctDtlCount(ByRef cnn As ADODB.Connection, ByVal mTableName As String, ByVal mSdcCodeField As String, ByVal mSdcCode As Long, ByVal mSdcSubCodeField As String, ByVal mSdcSubCode As Long) As Integer
Dim tRecset As New ADODB.Recordset, mRtnval As Integer

With tRecset
.open "Select count(*) as SdcCount from " & mTableName & " where " & mSdcCodeField & "=" & CStr(mSdcCode) & " and " & mSdcSubCodeField & "=" & CStr(mSdcSubCode) & "", cnn, adOpenKeyset, adLockOptimistic
mRtnval = .fields("SdcCount")
End With
CloseTable tRecset

GetServDctDtlCount = mRtnval

End Function





