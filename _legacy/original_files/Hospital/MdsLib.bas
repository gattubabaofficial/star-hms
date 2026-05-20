Attribute VB_Name = "MdsLibrary"
Option Explicit

Public sMdsDatabaseName As String
Public sPatMastOptFileName As String, sPatMastOldFileName As String, sExtServRateOptFileName As String
Public sOutdRegOptFileName As String, sOutdRegOldFileName As String, sOutdRcptOptFileName As String, sOutdRcptOldFileName As String, sOutdPymtOptFileName As String, sOutdPymtOldFileName As String, sOutdRefdOptFileName As String, sOutdRefdOldFileName As String, sOutdBillOptFileName As String, sOutdBillOldFileName As String, sOutdBlPymtOptFileName As String, sOutdBlPymtOldFileName As String, sOutdBlRefdOptFileName As String, sOutdBlRefdOldFileName As String, sOutdRgPymtOptFileName As String, sOutdRgPymtOldFileName As String, sOutdRgRefdOptFileName As String, sOutdRgRefdOldFileName As String
Public sIndrRegOptFileName As String, sIndrRegOldFileName As String, sBedMastOptFileName As String, sBedMastOldFileName As String, sIndrRcptOptFileName As String, sIndrRcptOldFileName As String, sIndrPymtOptFileName As String, sIndrPymtOldFileName As String, sIndrRefdOptFileName As String, sIndrRefdOldFileName As String, sIndrBillOptFileName As String, sIndrBillOldFileName As String, sIndrBlPymtOptFileName As String, sIndrBlPymtOldFileName As String, sIndrBlRefdOptFileName As String, sIndrBlRefdOldFileName As String, sIndrRgPymtOptFileName As String, sIndrRgPymtOldFileName As String, sIndrRgRefdOptFileName As String, sIndrRgRefdOldFileName As String
Public sOutdRegCRLFileName As String
Rem Service Charges/Share System
Public sExtServRateSys As Boolean, sDctwseServRateSys As Boolean, sPcgwseServRateSys As Boolean, sRBywseServRateSys As Boolean, sRTowseServRateSys As Boolean, sTimewseServRateSys As Boolean
Public sExtServDiscSys As Boolean, sDctwseServDiscSys As Boolean, sPcgwseServDiscSys As Boolean, sRBywseServDiscSys As Boolean, sRTowseServDiscSys As Boolean, sTimewseServDiscSys As Boolean
Public sExtServBargSys As Boolean, sDctwseServBargSys As Boolean, sPcgwseServBargSys As Boolean, sRBywseServBargSys As Boolean, sRTowseServBargSys As Boolean, sTimewseServBargSys As Boolean
Public sExtServShareSys As Boolean, sDctwseServShareSys As Boolean, sPcgwseServShareSys As Boolean, sRBywseServShareSys As Boolean, sRTowseServShareSys As Boolean, sTimewseServShareSys As Boolean

'Public Const cMDS_VTYPE_PURCH = 101
'Public Const cMDS_VTYPE_SALE = 102
'Public Const cMDS_VTYPE_GENERAL = 101

Public Sub InitMdsVar()
'Dim clsHOPT As New clsHmsOpdOptionsEntry
' --------------------------------------
sMdsDatabaseName = "MediStor.Mdb"
sPatMastOptFileName = "PatMast.Opt"
sPatMastOldFileName = "PatMast.Old"
sExtServRateOptFileName = "ExtSrvRt.Opt"
' --------------------------------------------
sOutdRegOptFileName = "OutdReg.Opt"
sOutdRegOldFileName = "OutdReg.Old"
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
sOutdRgRefdOptFileName = "OutdRgRefd.Opt"
sOutdRgRefdOldFileName = "OutdRgRefd.Old"
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
sOutdRegCRLFileName = "OutdReg.Crl"


' ------------------------
'clsVType.AddType cMDS_VTYPE_PURCH, "Purchase"
'clsVType.AddType cMDS_VTYPE_SALE, "Sales Entry"
'clsVType.AddType cHMS_VTYPE_OUTDOOR_REFD, "Outdoor Refund"
'clsVType.AddType cHMS_VTYPE_OUTDOOR_BILL, "Outdoor Bill"
'clsVType.AddType cHMS_VTYPE_OUTDOOR_BLPYMT, "Outdoor Bill Payment"
'clsVType.AddType cHMS_VTYPE_OUTDOOR_BLREFD, "Outdoor Bill Refund"
'Rem clsVType.AddType cHMS_VTYPE_OUTDOOR_RGPYMT, "Outdoor Reg. Payment"
'Rem clsVType.AddType cHMS_VTYPE_OUTDOOR_RGREFD, "Outdoor Reg. Refund"
'' ------------------------------------------
'clsVType.AddType cHMS_VTYPE_INDOOR_REG, "Indoor Registration"
'clsVType.AddType cHMS_VTYPE_INDOOR_RCPT, "Indoor Receipt"
'clsVType.AddType cHMS_VTYPE_INDOOR_PYMT, "Indoor Payment"
'clsVType.AddType cHMS_VTYPE_INDOOR_REFD, "Indoor Refund"
'clsVType.AddType cHMS_VTYPE_INDOOR_BILL, "Indoor Bill"
'clsVType.AddType cHMS_VTYPE_INDOOR_BLPYMT, "Indoor Bill Payment"
'clsVType.AddType cHMS_VTYPE_INDOOR_BLREFD, "Indoor Bill Refund"
'clsVType.AddType cHMS_VTYPE_INDOOR_RGPYMT, "Indoor On A/c.Payment"
'clsVType.AddType cHMS_VTYPE_INDOOR_RGREFD, "Indoor On A/c.Refund"
'' --------------------------------------------
'clsVType.AddType cHMS_VTYPE_LAB, "Lab"
'clsVType.AddType cMDS_VTYPE_GENERAL, "General"

Rem restoring hospital system parameter options
'clsHOPT.blnServRateSysOptMast = True
'clsHOPT.Init
'clsHOPT.GetServRateSysOptData
'
'sExtServRateSys = clsHOPT.mExtServRateSys_bln: sDctwseServRateSys = clsHOPT.mDctwseServRateSys_bln: sPcgwseServRateSys = clsHOPT.mPcgwseServRateSys_bln: sRBywseServRateSys = clsHOPT.mRBywseServRateSys_bln: sRTowseServRateSys = clsHOPT.mRTowseServRateSys_bln: sTimewseServRateSys = clsHOPT.mTimewseServRateSys_bln
'sExtServDiscSys = clsHOPT.mExtServDiscSys_bln: sDctwseServDiscSys = clsHOPT.mDctwseServDiscSys_bln: sPcgwseServDiscSys = clsHOPT.mPcgwseServDiscSys_bln: sRBywseServDiscSys = clsHOPT.mRBywseServDiscSys_bln: sRTowseServDiscSys = clsHOPT.mRTowseServDiscSys_bln: sTimewseServDiscSys = clsHOPT.mTimewseServDiscSys_bln
'sExtServBargSys = clsHOPT.mExtServBargSys_bln: sDctwseServBargSys = clsHOPT.mDctwseServBargSys_bln: sPcgwseServBargSys = clsHOPT.mPcgwseServBargSys_bln: sRBywseServBargSys = clsHOPT.mRBywseServBargSys_bln: sRTowseServBargSys = clsHOPT.mRTowseServBargSys_bln: sTimewseServBargSys = clsHOPT.mTimewseServBargSys_bln
'sExtServShareSys = clsHOPT.mExtServShareSys_bln: sDctwseServShareSys = clsHOPT.mDctwseServShareSys_bln: sPcgwseServShareSys = clsHOPT.mPcgwseServShareSys_bln: sRBywseServShareSys = clsHOPT.mRBywseServShareSys_bln: sRTowseServShareSys = clsHOPT.mRTowseServShareSys_bln: sTimewseServShareSys = clsHOPT.mTimewseServShareSys_bln
'Set clsHOPT = Nothing

End Sub

Public Sub RemoveMdsNullValue(Optional ByRef FormProgStatus As frmProgressStatus)
Dim dbMdsDatabase As New ADODB.Connection, dbMdsCatalog As New ADOX.Catalog
Dim tRecset As New ADODB.Recordset
Dim mTable As ADOX.Table, mTableName As String

OpenMdsDataSource dbMdsDatabase, mExclusiveMode:=True
If dbMdsDatabase.State <> 1 Then
    ErrorBox Err.Description
    GoTo EndSub
End If
Set dbMdsCatalog.ActiveConnection = dbMdsDatabase
If Not FormProgStatus Is Nothing Then
    If FormProgStatus.Visible = True Then
        FormProgStatus.pbar1.Min = 0: FormProgStatus.pbar1.Max = dbMdsCatalog.Tables.count
    End If
End If

dbMdsDatabase.BeginTrans
For Each mTable In dbMdsCatalog.Tables
    If mTable.Type = "TABLE" Then
        If Not FormProgStatus Is Nothing Then
            If FormProgStatus.Visible = True Then
                FormProgStatus.ShowNextStatus dbMdsCatalog.ActiveConnection.Properties("Data Source Name") & vbCrLf & "Table: " & mTable.Name
            End If
        End If
        
        mTableName = mTable.Name
        With tRecset
        .open "Select * from " & mTableName & "", dbMdsDatabase, adOpenKeyset, adLockOptimistic
        If .RecordCount > 0 Then
            RemoveNullValue tRecset
        End If
        End With
        CloseTable tRecset
    End If
Next mTable
dbMdsDatabase.CommitTrans

Rem InfoBox dbMdsCatalog.ActiveConnection.Properties("Data Source Name") & ", Done !!!"

CloseDataSource dbMdsDatabase

EndSub:
Set dbMdsCatalog = Nothing
Set dbMdsDatabase = Nothing
Exit Sub

End Sub

'Public Property Get PatMastOptFileFullPath(Optional ByVal mFilePath, Optional ByVal mFileName) As String
'mFilePath = IIf(IsMissing(mFilePath) = False, mFilePath, sAppPath)
'mFileName = IIf(IsMissing(mFileName) = False, mFileName, sPatMastOptFileName)
'PatMastOptFileFullPath = AddBS(mFilePath) & mFileName
'
'End Property
'
'Public Property Get PatMastOldFileFullPath(Optional ByVal mFilePath, Optional ByVal mFileName) As String
'mFilePath = IIf(IsMissing(mFilePath) = False, mFilePath, sAppPath)
'mFileName = IIf(IsMissing(mFileName) = False, mFileName, sPatMastOldFileName)
'PatMastOldFileFullPath = AddBS(mFilePath) & mFileName
'
'End Property

'Public Property Get ExtServRateOptFileFullPath(Optional ByVal mFilePath, Optional ByVal mFileName) As String
'mFilePath = IIf(IsMissing(mFilePath) = False, mFilePath, sAppPath)
'mFileName = IIf(IsMissing(mFileName) = False, mFileName, sExtServRateOptFileName)
'ExtServRateOptFileFullPath = AddBS(mFilePath) & mFileName
'
'End Property
'
'Public Property Get OutdRegOptFileFullPath(Optional ByVal mFilePath, Optional ByVal mFileName) As String
'mFilePath = IIf(IsMissing(mFilePath) = False, mFilePath, sAppPath)
'mFileName = IIf(IsMissing(mFileName) = False, mFileName, sOutdRegOptFileName)
'OutdRegOptFileFullPath = AddBS(mFilePath) & mFileName
'
'End Property
'
'Public Property Get OutdRegOldFileFullPath(Optional ByVal mFilePath, Optional ByVal mFileName) As String
'mFilePath = IIf(IsMissing(mFilePath) = False, mFilePath, sAppPath)
'mFileName = IIf(IsMissing(mFileName) = False, mFileName, sOutdRegOldFileName)
'OutdRegOldFileFullPath = AddBS(mFilePath) & mFileName
'
'End Property
'
'Public Property Get OutdRegCRLFileFullPath(Optional ByVal mFilePath, Optional ByVal mFileName) As String
'mFilePath = IIf(IsMissing(mFilePath) = False, mFilePath, sAppPath)
'mFileName = IIf(IsMissing(mFileName) = False, mFileName, sOutdRegCRLFileName)
'OutdRegCRLFileFullPath = AddBS(mFilePath) & mFileName
'
'End Property
'
'Public Property Get OutdRcptOptFileFullPath(Optional ByVal mFilePath, Optional ByVal mFileName) As String
'mFilePath = IIf(IsMissing(mFilePath) = False, mFilePath, sAppPath)
'mFileName = IIf(IsMissing(mFileName) = False, mFileName, sOutdRcptOptFileName)
'OutdRcptOptFileFullPath = AddBS(mFilePath) & mFileName
'
'End Property
'
'Public Property Get OutdRcptOldFileFullPath(Optional ByVal mFilePath, Optional ByVal mFileName) As String
'mFilePath = IIf(IsMissing(mFilePath) = False, mFilePath, sAppPath)
'mFileName = IIf(IsMissing(mFileName) = False, mFileName, sOutdRcptOldFileName)
'OutdRcptOldFileFullPath = AddBS(mFilePath) & mFileName
'
'End Property
'
'Public Property Get OutdPymtOptFileFullPath(Optional ByVal mFilePath, Optional ByVal mFileName) As String
'mFilePath = IIf(IsMissing(mFilePath) = False, mFilePath, sAppPath)
'mFileName = IIf(IsMissing(mFileName) = False, mFileName, sOutdPymtOptFileName)
'OutdPymtOptFileFullPath = AddBS(mFilePath) & mFileName
'
'End Property
'
'Public Property Get OutdPymtOldFileFullPath(Optional ByVal mFilePath, Optional ByVal mFileName) As String
'mFilePath = IIf(IsMissing(mFilePath) = False, mFilePath, sAppPath)
'mFileName = IIf(IsMissing(mFileName) = False, mFileName, sOutdPymtOldFileName)
'OutdPymtOldFileFullPath = AddBS(mFilePath) & mFileName
'
'End Property
'
'Public Property Get OutdRefdOptFileFullPath(Optional ByVal mFilePath, Optional ByVal mFileName) As String
'mFilePath = IIf(IsMissing(mFilePath) = False, mFilePath, sAppPath)
'mFileName = IIf(IsMissing(mFileName) = False, mFileName, sOutdRefdOptFileName)
'OutdRefdOptFileFullPath = AddBS(mFilePath) & mFileName
'
'End Property
'
'Public Property Get OutdRefdOldFileFullPath(Optional ByVal mFilePath, Optional ByVal mFileName) As String
'mFilePath = IIf(IsMissing(mFilePath) = False, mFilePath, sAppPath)
'mFileName = IIf(IsMissing(mFileName) = False, mFileName, sOutdRefdOldFileName)
'OutdRefdOldFileFullPath = AddBS(mFilePath) & mFileName
'
'End Property
'
'Public Property Get OutdBillOptFileFullPath(Optional ByVal mFilePath, Optional ByVal mFileName) As String
'mFilePath = IIf(IsMissing(mFilePath) = False, mFilePath, sAppPath)
'mFileName = IIf(IsMissing(mFileName) = False, mFileName, sOutdBillOptFileName)
'OutdBillOptFileFullPath = AddBS(mFilePath) & mFileName
'
'End Property
'
'Public Property Get OutdBillOldFileFullPath(Optional ByVal mFilePath, Optional ByVal mFileName) As String
'mFilePath = IIf(IsMissing(mFilePath) = False, mFilePath, sAppPath)
'mFileName = IIf(IsMissing(mFileName) = False, mFileName, sOutdBillOldFileName)
'OutdBillOldFileFullPath = AddBS(mFilePath) & mFileName
'
'End Property
'
'Public Property Get OutdBlPymtOptFileFullPath(Optional ByVal mFilePath, Optional ByVal mFileName) As String
'mFilePath = IIf(IsMissing(mFilePath) = False, mFilePath, sAppPath)
'mFileName = IIf(IsMissing(mFileName) = False, mFileName, sOutdBlPymtOptFileName)
'OutdBlPymtOptFileFullPath = AddBS(mFilePath) & mFileName
'
'End Property
'
'Public Property Get OutdBlPymtOldFileFullPath(Optional ByVal mFilePath, Optional ByVal mFileName) As String
'mFilePath = IIf(IsMissing(mFilePath) = False, mFilePath, sAppPath)
'mFileName = IIf(IsMissing(mFileName) = False, mFileName, sOutdBlPymtOldFileName)
'OutdBlPymtOldFileFullPath = AddBS(mFilePath) & mFileName
'
'End Property
'
'Public Property Get OutdBlRefdOptFileFullPath(Optional ByVal mFilePath, Optional ByVal mFileName) As String
'mFilePath = IIf(IsMissing(mFilePath) = False, mFilePath, sAppPath)
'mFileName = IIf(IsMissing(mFileName) = False, mFileName, sOutdBlRefdOptFileName)
'OutdBlRefdOptFileFullPath = AddBS(mFilePath) & mFileName
'
'End Property
'
'Public Property Get OutdBlRefdOldFileFullPath(Optional ByVal mFilePath, Optional ByVal mFileName) As String
'mFilePath = IIf(IsMissing(mFilePath) = False, mFilePath, sAppPath)
'mFileName = IIf(IsMissing(mFileName) = False, mFileName, sOutdBlRefdOldFileName)
'OutdBlRefdOldFileFullPath = AddBS(mFilePath) & mFileName
'
'End Property
'
'Public Property Get OutdRgPymtOptFileFullPath(Optional ByVal mFilePath, Optional ByVal mFileName) As String
'mFilePath = IIf(IsMissing(mFilePath) = False, mFilePath, sAppPath)
'mFileName = IIf(IsMissing(mFileName) = False, mFileName, sOutdRgPymtOptFileName)
'OutdRgPymtOptFileFullPath = AddBS(mFilePath) & mFileName
'
'End Property
'
'Public Property Get OutdRgPymtOldFileFullPath(Optional ByVal mFilePath, Optional ByVal mFileName) As String
'mFilePath = IIf(IsMissing(mFilePath) = False, mFilePath, sAppPath)
'mFileName = IIf(IsMissing(mFileName) = False, mFileName, sOutdRgPymtOldFileName)
'OutdRgPymtOldFileFullPath = AddBS(mFilePath) & mFileName
'
'End Property
'
'Public Property Get OutdRgRefdOptFileFullPath(Optional ByVal mFilePath, Optional ByVal mFileName) As String
'mFilePath = IIf(IsMissing(mFilePath) = False, mFilePath, sAppPath)
'mFileName = IIf(IsMissing(mFileName) = False, mFileName, sOutdRgRefdOptFileName)
'OutdRgRefdOptFileFullPath = AddBS(mFilePath) & mFileName
'
'End Property
'
'Public Property Get OutdRgRefdOldFileFullPath(Optional ByVal mFilePath, Optional ByVal mFileName) As String
'mFilePath = IIf(IsMissing(mFilePath) = False, mFilePath, sAppPath)
'mFileName = IIf(IsMissing(mFileName) = False, mFileName, sOutdRgRefdOldFileName)
'OutdRgRefdOldFileFullPath = AddBS(mFilePath) & mFileName
'
'End Property
'
'Public Property Get IndrRegOptFileFullPath(Optional ByVal mFilePath, Optional ByVal mFileName) As String
'mFilePath = IIf(IsMissing(mFilePath) = False, mFilePath, sAppPath)
'mFileName = IIf(IsMissing(mFileName) = False, mFileName, sIndrRegOptFileName)
'IndrRegOptFileFullPath = AddBS(mFilePath) & mFileName
'
'End Property
'
'Public Property Get IndrRegOldFileFullPath(Optional ByVal mFilePath, Optional ByVal mFileName) As String
'mFilePath = IIf(IsMissing(mFilePath) = False, mFilePath, sAppPath)
'mFileName = IIf(IsMissing(mFileName) = False, mFileName, sIndrRegOldFileName)
'IndrRegOldFileFullPath = AddBS(mFilePath) & mFileName
'
'End Property
'
'Public Property Get BedMastOptFileFullPath(Optional ByVal mFilePath, Optional ByVal mFileName) As String
'mFilePath = IIf(IsMissing(mFilePath) = False, mFilePath, sAppPath)
'mFileName = IIf(IsMissing(mFileName) = False, mFileName, sBedMastOptFileName)
'BedMastOptFileFullPath = AddBS(mFilePath) & mFileName
'
'End Property
'
'Public Property Get BedMastOldFileFullPath(Optional ByVal mFilePath, Optional ByVal mFileName) As String
'mFilePath = IIf(IsMissing(mFilePath) = False, mFilePath, sAppPath)
'mFileName = IIf(IsMissing(mFileName) = False, mFileName, sBedMastOldFileName)
'BedMastOldFileFullPath = AddBS(mFilePath) & mFileName
'
'End Property
'
'Public Property Get IndrRcptOptFileFullPath(Optional ByVal mFilePath, Optional ByVal mFileName) As String
'mFilePath = IIf(IsMissing(mFilePath) = False, mFilePath, sAppPath)
'mFileName = IIf(IsMissing(mFileName) = False, mFileName, sIndrRcptOptFileName)
'IndrRcptOptFileFullPath = AddBS(mFilePath) & mFileName
'
'End Property
'
'Public Property Get IndrRcptOldFileFullPath(Optional ByVal mFilePath, Optional ByVal mFileName) As String
'mFilePath = IIf(IsMissing(mFilePath) = False, mFilePath, sAppPath)
'mFileName = IIf(IsMissing(mFileName) = False, mFileName, sIndrRcptOldFileName)
'IndrRcptOldFileFullPath = AddBS(mFilePath) & mFileName
'
'End Property
'
'Public Property Get IndrPymtOptFileFullPath(Optional ByVal mFilePath, Optional ByVal mFileName) As String
'mFilePath = IIf(IsMissing(mFilePath) = False, mFilePath, sAppPath)
'mFileName = IIf(IsMissing(mFileName) = False, mFileName, sIndrPymtOptFileName)
'IndrPymtOptFileFullPath = AddBS(mFilePath) & mFileName
'
'End Property
'
'Public Property Get IndrPymtOldFileFullPath(Optional ByVal mFilePath, Optional ByVal mFileName) As String
'mFilePath = IIf(IsMissing(mFilePath) = False, mFilePath, sAppPath)
'mFileName = IIf(IsMissing(mFileName) = False, mFileName, sIndrPymtOldFileName)
'IndrPymtOldFileFullPath = AddBS(mFilePath) & mFileName
'
'End Property
'
'Public Property Get IndrRefdOptFileFullPath(Optional ByVal mFilePath, Optional ByVal mFileName) As String
'mFilePath = IIf(IsMissing(mFilePath) = False, mFilePath, sAppPath)
'mFileName = IIf(IsMissing(mFileName) = False, mFileName, sIndrRefdOptFileName)
'IndrRefdOptFileFullPath = AddBS(mFilePath) & mFileName
'
'End Property
'
'Public Property Get IndrRefdOldFileFullPath(Optional ByVal mFilePath, Optional ByVal mFileName) As String
'mFilePath = IIf(IsMissing(mFilePath) = False, mFilePath, sAppPath)
'mFileName = IIf(IsMissing(mFileName) = False, mFileName, sIndrRefdOldFileName)
'IndrRefdOldFileFullPath = AddBS(mFilePath) & mFileName
'
'End Property
'
'Public Property Get IndrBillOptFileFullPath(Optional ByVal mFilePath, Optional ByVal mFileName) As String
'mFilePath = IIf(IsMissing(mFilePath) = False, mFilePath, sAppPath)
'mFileName = IIf(IsMissing(mFileName) = False, mFileName, sIndrBillOptFileName)
'IndrBillOptFileFullPath = AddBS(mFilePath) & mFileName
'
'End Property
'
'Public Property Get IndrBillOldFileFullPath(Optional ByVal mFilePath, Optional ByVal mFileName) As String
'mFilePath = IIf(IsMissing(mFilePath) = False, mFilePath, sAppPath)
'mFileName = IIf(IsMissing(mFileName) = False, mFileName, sIndrBillOldFileName)
'IndrBillOldFileFullPath = AddBS(mFilePath) & mFileName
'
'End Property
'
'Public Property Get IndrBlPymtOptFileFullPath(Optional ByVal mFilePath, Optional ByVal mFileName) As String
'mFilePath = IIf(IsMissing(mFilePath) = False, mFilePath, sAppPath)
'mFileName = IIf(IsMissing(mFileName) = False, mFileName, sIndrBlPymtOptFileName)
'IndrBlPymtOptFileFullPath = AddBS(mFilePath) & mFileName
'
'End Property
'
'Public Property Get IndrBlPymtOldFileFullPath(Optional ByVal mFilePath, Optional ByVal mFileName) As String
'mFilePath = IIf(IsMissing(mFilePath) = False, mFilePath, sAppPath)
'mFileName = IIf(IsMissing(mFileName) = False, mFileName, sIndrBlPymtOldFileName)
'IndrBlPymtOldFileFullPath = AddBS(mFilePath) & mFileName
'
'End Property
'
'Public Property Get IndrBlRefdOptFileFullPath(Optional ByVal mFilePath, Optional ByVal mFileName) As String
'mFilePath = IIf(IsMissing(mFilePath) = False, mFilePath, sAppPath)
'mFileName = IIf(IsMissing(mFileName) = False, mFileName, sIndrBlRefdOptFileName)
'IndrBlRefdOptFileFullPath = AddBS(mFilePath) & mFileName
'
'End Property
'
'Public Property Get IndrBlRefdOldFileFullPath(Optional ByVal mFilePath, Optional ByVal mFileName) As String
'mFilePath = IIf(IsMissing(mFilePath) = False, mFilePath, sAppPath)
'mFileName = IIf(IsMissing(mFileName) = False, mFileName, sIndrBlRefdOldFileName)
'IndrBlRefdOldFileFullPath = AddBS(mFilePath) & mFileName
'
'End Property
'
'Public Property Get IndrRgPymtOptFileFullPath(Optional ByVal mFilePath, Optional ByVal mFileName) As String
'mFilePath = IIf(IsMissing(mFilePath) = False, mFilePath, sAppPath)
'mFileName = IIf(IsMissing(mFileName) = False, mFileName, sIndrRgPymtOptFileName)
'IndrRgPymtOptFileFullPath = AddBS(mFilePath) & mFileName
'
'End Property
'
'Public Property Get IndrRgPymtOldFileFullPath(Optional ByVal mFilePath, Optional ByVal mFileName) As String
'mFilePath = IIf(IsMissing(mFilePath) = False, mFilePath, sAppPath)
'mFileName = IIf(IsMissing(mFileName) = False, mFileName, sIndrRgPymtOldFileName)
'IndrRgPymtOldFileFullPath = AddBS(mFilePath) & mFileName
'
'End Property
'
'Public Property Get IndrRgRefdOptFileFullPath(Optional ByVal mFilePath, Optional ByVal mFileName) As String
'mFilePath = IIf(IsMissing(mFilePath) = False, mFilePath, sAppPath)
'mFileName = IIf(IsMissing(mFileName) = False, mFileName, sIndrRgRefdOptFileName)
'IndrRgRefdOptFileFullPath = AddBS(mFilePath) & mFileName
'
'End Property
'
'Public Property Get IndrRgRefdOldFileFullPath(Optional ByVal mFilePath, Optional ByVal mFileName) As String
'mFilePath = IIf(IsMissing(mFilePath) = False, mFilePath, sAppPath)
'mFileName = IIf(IsMissing(mFileName) = False, mFileName, sIndrRgRefdOldFileName)
'IndrRgRefdOldFileFullPath = AddBS(mFilePath) & mFileName
'
'End Property

Public Property Get dbMdsDatabaseFullPath(Optional ByVal mDbPath) As String
mDbPath = IIf(IsMissing(mDbPath) = False, mDbPath, sCmpDataPath)
dbMdsDatabaseFullPath = AddBS(mDbPath) & sMdsDatabaseName

End Property

Public Function OpenMdsDataSource(ByRef db As ADODB.Connection, Optional ByVal mDbPath, Optional ByVal mUserId As String, Optional ByVal mPwd As String, Optional ByVal mExclusiveMode As Boolean) As Variant
mDbPath = AddBS(IIf(IsMissing(mDbPath) = False, mDbPath, sCmpDataPath))
db.ConnectionString = "Provider=" & DbProvider & ";Data Source=" & dbMdsDatabaseFullPath(mDbPath)
If mExclusiveMode = True Then
    db.Mode = adModeShareExclusive
End If

db.open
End Function

'Public Sub GetServRateValues(ByRef cnn As ADODB.Connection, ByVal mSrvCode As Long, ByVal mTranDate As Date, ByVal mTranTime As Long, Optional ByVal mSrmDctCode As Long, Optional ByVal mSrmPcgCode As Long, Optional ByVal mSrmRByCode As Long, Optional ByVal mSrmRToCode As Long, Optional ByRef mSrmRate As Double, Optional ByRef mSrmDiscPer As Double, Optional ByRef mSrmInfByPer As Double, Optional ByRef mSrmDefByPer As Double, Optional ByRef mSrmSharePer As Double, Optional ByRef mSrmShareAmt As Double)
'Dim clsSRV As New clsMdsMasterEntry, clsSGP As New clsMdsMasterEntry
'Dim tRecset As New ADODB.Recordset
'
'Dim mDctwseRateSys As Boolean, mPcgwseRateSys As Boolean, mRBywseRateSys As Boolean, mRTowseRateSys As Boolean, mTimewseRateSys As Boolean
'Dim mDctwseDiscSys As Boolean, mPcgwseDiscSys As Boolean, mRBywseDiscSys As Boolean, mRTowseDiscSys As Boolean, mTimewseDiscSys As Boolean
'Dim mDctwseBargSys As Boolean, mPcgwseBargSys As Boolean, mRBywseBargSys As Boolean, mRTowseBargSys As Boolean, mTimewseBargSys As Boolean
'Dim mDctwseShareSys As Boolean, mPcgwseShareSys As Boolean, mRBywseShareSys As Boolean, mRTowseShareSys As Boolean, mTimewseShareSys As Boolean
'
'clsSRV.blnServMast = True
'Set clsSRV.dbMdsDatabase = cnn
'clsSRV.Init
'
'clsSGP.blnServGrpMast = True
'Set clsSGP.dbMdsDatabase = cnn
'clsSGP.Init
'
'clsSRV.GetData mSrvCode
'clsSGP.GetData clsSRV.mSrvSgpCode_lng
'
'If sExtServRateSys = False Then
'    mDctwseRateSys = sDctwseServRateSys
'    mPcgwseRateSys = sPcgwseServRateSys
'    mRBywseRateSys = sRBywseServRateSys
'    mRTowseRateSys = sRTowseServRateSys
'    mTimewseRateSys = sTimewseServRateSys
'Else
'    If clsSGP.mSgpExtRateSys_bln = False Then
'        mDctwseRateSys = clsSGP.mSgpDctwseRateSys_bln
'        mPcgwseRateSys = clsSGP.mSgpPcgwseRateSys_bln
'        mRBywseRateSys = clsSGP.mSgpRBywseRateSys_bln
'        mRTowseRateSys = clsSGP.mSgpRTowseRateSys_bln
'        mTimewseRateSys = clsSGP.mSgpTimewseRateSys_bln
'    Else
'        mDctwseRateSys = clsSRV.mSrvDctwseRateSys_bln
'        mPcgwseRateSys = clsSRV.mSrvPcgwseRateSys_bln
'        mRBywseRateSys = clsSRV.mSrvRBywseRateSys_bln
'        mRTowseRateSys = clsSRV.mSrvRTowseRateSys_bln
'        mTimewseRateSys = clsSRV.mSrvTimewseRateSys_bln
'    End If
'End If
'
'If sExtServDiscSys = False Then
'    mDctwseDiscSys = sDctwseServDiscSys
'    mPcgwseDiscSys = sPcgwseServDiscSys
'    mRBywseDiscSys = sRBywseServDiscSys
'    mRTowseDiscSys = sRTowseServDiscSys
'    mTimewseDiscSys = sTimewseServDiscSys
'Else
'    If clsSGP.mSgpExtDiscSys_bln = False Then
'        mDctwseDiscSys = clsSGP.mSgpDctwseDiscSys_bln
'        mPcgwseDiscSys = clsSGP.mSgpPcgwseDiscSys_bln
'        mRBywseDiscSys = clsSGP.mSgpRBywseDiscSys_bln
'        mRTowseDiscSys = clsSGP.mSgpRTowseDiscSys_bln
'        mTimewseDiscSys = clsSGP.mSgpTimewseDiscSys_bln
'    Else
'        mDctwseDiscSys = clsSRV.mSrvDctwseDiscSys_bln
'        mPcgwseDiscSys = clsSRV.mSrvPcgwseDiscSys_bln
'        mRBywseDiscSys = clsSRV.mSrvRBywseDiscSys_bln
'        mRTowseDiscSys = clsSRV.mSrvRTowseDiscSys_bln
'        mTimewseDiscSys = clsSRV.mSrvTimewseDiscSys_bln
'    End If
'End If
'
'If sExtServBargSys = False Then
'    mDctwseBargSys = sDctwseServBargSys
'    mPcgwseBargSys = sPcgwseServBargSys
'    mRBywseBargSys = sRBywseServBargSys
'    mRTowseBargSys = sRTowseServBargSys
'    mTimewseBargSys = sTimewseServBargSys
'Else
'    If clsSGP.mSgpExtBargSys_bln = False Then
'        mDctwseBargSys = clsSGP.mSgpDctwseBargSys_bln
'        mPcgwseBargSys = clsSGP.mSgpPcgwseBargSys_bln
'        mRBywseBargSys = clsSGP.mSgpRBywseBargSys_bln
'        mRTowseBargSys = clsSGP.mSgpRTowseBargSys_bln
'        mTimewseBargSys = clsSGP.mSgpTimewseBargSys_bln
'    Else
'        mDctwseBargSys = clsSRV.mSrvDctwseBargSys_bln
'        mPcgwseBargSys = clsSRV.mSrvPcgwseBargSys_bln
'        mRBywseBargSys = clsSRV.mSrvRBywseBargSys_bln
'        mRTowseBargSys = clsSRV.mSrvRTowseBargSys_bln
'        mTimewseBargSys = clsSRV.mSrvTimewseBargSys_bln
'    End If
'End If
'
'If sExtServShareSys = False Then
'    mDctwseShareSys = sDctwseServShareSys
'    mPcgwseShareSys = sPcgwseServShareSys
'    mRBywseShareSys = sRBywseServShareSys
'    mRTowseShareSys = sRTowseServShareSys
'    mTimewseShareSys = sTimewseServShareSys
'Else
'    If clsSGP.mSgpExtShareSys_bln = False Then
'        mDctwseShareSys = clsSGP.mSgpDctwseShareSys_bln
'        mPcgwseShareSys = clsSGP.mSgpPcgwseShareSys_bln
'        mRBywseShareSys = clsSGP.mSgpRBywseShareSys_bln
'        mRTowseShareSys = clsSGP.mSgpRTowseShareSys_bln
'        mTimewseShareSys = clsSGP.mSgpTimewseShareSys_bln
'    Else
'        mDctwseShareSys = clsSRV.mSrvDctwseShareSys_bln
'        mPcgwseShareSys = clsSRV.mSrvPcgwseShareSys_bln
'        mRBywseShareSys = clsSRV.mSrvRBywseShareSys_bln
'        mRTowseShareSys = clsSRV.mSrvRTowseShareSys_bln
'        mTimewseShareSys = clsSRV.mSrvTimewseShareSys_bln
'    End If
'End If
'
'If mDctwseRateSys = True Or mPcgwseRateSys = True Or mRBywseRateSys = True Or mRTowseRateSys = True Or mTimewseRateSys = True Then
'    With tRecset
'    .Open "Select top 1 * from ServRateMst where SrmCode=" & CStr(mSrvCode) & IIf(mDctwseRateSys = True, " and SrmDctCode=" & CStr(mSrmDctCode), "") & IIf(mPcgwseRateSys = True, " and SrmPcgCode=" & CStr(mSrmPcgCode), "") & IIf(mRBywseRateSys = True, " and SrmRByCode=" & CStr(mSrmRByCode), "") & IIf(mRTowseRateSys = True, " and SrmRToCode=" & CStr(mSrmRToCode), "") & " and SrmWefDate<=#" & ToSysDate(mTranDate) & "#" & IIf(mTimewseRateSys = True, " and SrmStartTime<=" & CStr(mTranTime) & " and SrmEndTime>=" & CStr(mTranTime), "") & " order by SrmWefDate desc", cnn, adOpenKeyset, adLockOptimistic
'    If .EOF = False Then
'        mSrmRate = .fields("SrmRate")
'    Else
'        mSrmRate = clsSRV.mSrvOpdGenChg_dbl
'    End If
'    End With
'    CloseTable tRecset
'Else
'    mSrmRate = clsSRV.mSrvOpdGenChg_dbl
'End If
'
'If mDctwseDiscSys = True Or mPcgwseDiscSys = True Or mRBywseDiscSys = True Or mRTowseDiscSys = True Or mTimewseDiscSys = True Then
'    With tRecset
'    .Open "Select top 1 * from ServRateMst where SrmCode=" & CStr(mSrvCode) & IIf(mDctwseDiscSys = True, " and SrmDctCode=" & CStr(mSrmDctCode), "") & IIf(mPcgwseDiscSys = True, " and SrmPcgCode=" & CStr(mSrmPcgCode), "") & IIf(mRBywseDiscSys = True, " and SrmRByCode=" & CStr(mSrmRByCode), "") & IIf(mRTowseDiscSys = True, " and SrmRToCode=" & CStr(mSrmRToCode), "") & " and SrmWefDate<=#" & ToSysDate(mTranDate) & "#" & IIf(mTimewseDiscSys = True, " and SrmStartTime<=" & CStr(mTranTime) & " and SrmEndTime>=" & CStr(mTranTime), "") & " order by SrmWefDate desc", cnn, adOpenKeyset, adLockOptimistic
'    If .EOF = False Then
'        mSrmDiscPer = .fields("SrmDiscPer")
'    Else
'        mSrmDiscPer = clsSRV.mSrvDiscPer_dbl
'    End If
'    End With
'    CloseTable tRecset
'Else
'    mSrmDiscPer = clsSRV.mSrvDiscPer_dbl
'End If
'
'If mDctwseBargSys = True Or mPcgwseBargSys = True Or mRBywseBargSys = True Or mRTowseBargSys = True Or mTimewseBargSys = True Then
'    With tRecset
'    .Open "Select top 1 * from ServRateMst where SrmCode=" & CStr(mSrvCode) & IIf(mDctwseBargSys = True, " and SrmDctCode=" & CStr(mSrmDctCode), "") & IIf(mPcgwseBargSys = True, " and SrmPcgCode=" & CStr(mSrmPcgCode), "") & IIf(mRBywseBargSys = True, " and SrmRByCode=" & CStr(mSrmRByCode), "") & IIf(mRTowseBargSys = True, " and SrmRToCode=" & CStr(mSrmRToCode), "") & " and SrmWefDate<=#" & ToSysDate(mTranDate) & "#" & IIf(mTimewseBargSys = True, " and SrmStartTime<=" & CStr(mTranTime) & " and SrmEndTime>=" & CStr(mTranTime), "") & " order by SrmWefDate desc", cnn, adOpenKeyset, adLockOptimistic
'    If .EOF = False Then
'        mSrmInfByPer = .fields("SrmInfByPer")
'        mSrmDefByPer = .fields("SrmDefByPer")
'    End If
'    End With
'    CloseTable tRecset
'Else
'
'End If
'
'If mDctwseShareSys = True Or mPcgwseShareSys = True Or mRBywseShareSys = True Or mRTowseShareSys = True Or mTimewseShareSys = True Then
'    With tRecset
'    .Open "Select top 1 * from ServRateMst where SrmCode=" & CStr(mSrvCode) & IIf(mDctwseShareSys = True, " and SrmDctCode=" & CStr(mSrmDctCode), "") & IIf(mPcgwseShareSys = True, " and SrmPcgCode=" & CStr(mSrmPcgCode), "") & IIf(mRBywseShareSys = True, " and SrmRByCode=" & CStr(mSrmRByCode), "") & IIf(mRTowseShareSys = True, " and SrmRToCode=" & CStr(mSrmRToCode), "") & " and SrmWefDate<=#" & ToSysDate(mTranDate) & "#" & IIf(mTimewseShareSys = True, " and SrmStartTime<=" & CStr(mTranTime) & " and SrmEndTime>=" & CStr(mTranTime), "") & " order by SrmWefDate desc", cnn, adOpenKeyset, adLockOptimistic
'    If .EOF = False Then
'        mSrmSharePer = .fields("SrmSharePer")
'        mSrmShareAmt = .fields("SrmShareAmt")
'    End If
'    End With
'    CloseTable tRecset
'Else
'
'End If
'
'Set clsSRV = Nothing: Set clsSGP = Nothing
'CloseTable tRecset, mCheckOpen:=True
'
'End Sub

'Public Sub GetIndrLinkTranAmt(ByRef cnn As ADODB.Connection, ByVal mIpgCode As Long, Optional ByRef mIblAmtAftDiscTot, Optional ByRef mIpgAdvAmtTot, Optional ByRef mIrcAmtAftDiscTot, Optional ByRef mIrcRecdAmtTot, Optional ByRef mIrcDepoAmtTot, Optional ByRef mIrcRefuAmtTot, Optional ByRef mIrcBalAmtTot, Optional ByRef mIgtDpogAmtTot, Optional ByRef mIgfRfugAmtTot, Optional ByRef mIbpyDepoAmtTot, Optional ByRef mIbfdRefuAmtTot)
'Dim tRecset As New ADODB.Recordset
'
'If IsMissing(mIblAmtAftDiscTot) = False Then
'    With tRecset
'    .Open "Select IbhIpgCode,sum(IbhAmtAftDisc) as IbhAmtAftDisc_sum from IndrBlHdr where IbhIpgCode=" & CStr(mIpgCode) & " group by IbhIpgCode", cnn, adOpenKeyset, adLockOptimistic
'    If .EOF = False Then
'        mIblAmtAftDiscTot = .fields("IbhAmtAftDisc_sum")
'    End If
'    End With
'    CloseTable tRecset
'End If
'If IsMissing(mIpgAdvAmtTot) = False Then
'    With tRecset
'    .Open "Select IpgCode,sum(IpgAdvAmt) as IpgAdvAmt_sum from IndrReg where IpgCode=" & CStr(mIpgCode) & " group by IpgCode", cnn, adOpenKeyset, adLockOptimistic
'    If .EOF = False Then
'        mIpgAdvAmtTot = .fields("IpgAdvAmt_sum")
'    End If
'    End With
'    CloseTable tRecset
'End If
'If IsMissing(mIrcAmtAftDiscTot) = False Or IsMissing(mIrcRecdAmtTot) = False Or IsMissing(mIrcDepoAmtTot) = False Or IsMissing(mIrcRefuAmtTot) = False Or IsMissing(mIrcBalAmtTot) = False Then
'    With tRecset
'    .Open "Select IhrIpgCode,sum(IhrAmtAftDisc) as IhrAmtAftDisc_sum, sum(IhrRecdAmt) as IhrRecdAmt_sum, sum(IhrDepoAmt) as IhrDepoAmt_sum, sum(IhrRefuAmt) as IhrRefuAmt_sum, sum(IhrBalAmt) as IhrBalAmt_sum from IndrHdr where IhrIpgCode=" & CStr(mIpgCode) & " group by IhrIpgCode", cnn, adOpenKeyset, adLockOptimistic
'    If .EOF = False Then
'        mIrcAmtAftDiscTot = .fields("IhrAmtAftDisc_sum")
'        mIrcRecdAmtTot = .fields("IhrRecdAmt_sum")
'        mIrcDepoAmtTot = .fields("IhrDepoAmt_sum")
'        mIrcRefuAmtTot = .fields("IhrRefuAmt_sum")
'        mIrcBalAmtTot = .fields("IhrBalAmt_sum")
'    End If
'    End With
'    CloseTable tRecset
'End If
'If IsMissing(mIgtDpogAmtTot) = False Then
'    With tRecset
'    .Open "Select IgtIpgCode,sum(IgtDpogAmt) as IgtDpogAmt_sum from IndrRgPymt where IgtIpgCode=" & CStr(mIpgCode) & " group by IgtIpgCode", cnn, adOpenKeyset, adLockOptimistic
'    If .EOF = False Then
'        mIgtDpogAmtTot = .fields("IgtDpogAmt_sum")
'    End If
'    End With
'    CloseTable tRecset
'End If
'If IsMissing(mIgfRfugAmtTot) = False Then
'    With tRecset
'    .Open "Select IgfIpgCode,sum(IgfRfugAmt) as IgfRfugAmt_sum from IndrRgRefd where IgfIpgCode=" & CStr(mIpgCode) & " group by IgfIpgCode", cnn, adOpenKeyset, adLockOptimistic
'    If .EOF = False Then
'        mIgfRfugAmtTot = .fields("IgfRfugAmt_sum")
'    End If
'    End With
'    CloseTable tRecset
'End If
'If IsMissing(mIbpyDepoAmtTot) = False Then
'    With tRecset
'    .Open "Select IbphIpgCode,sum(IbphDepoAmt) as IbphDepoAmt_sum from IndrBlPymtHdr where IbphIpgCode=" & CStr(mIpgCode) & " group by IbphIpgCode", cnn, adOpenKeyset, adLockOptimistic
'    If .EOF = False Then
'        mIbpyDepoAmtTot = .fields("IbphDepoAmt_sum")
'    End If
'    End With
'    CloseTable tRecset
'End If
'If IsMissing(mIbfdRefuAmtTot) = False Then
'    With tRecset
'    .Open "Select IbfhIpgCode,sum(IbfhRefuAmt) as IbfhRefuAmt_sum from IndrBlRefdHdr where IbfhIpgCode=" & CStr(mIpgCode) & " group by IbfhIpgCode", cnn, adOpenKeyset, adLockOptimistic
'    If .EOF = False Then
'        mIbfdRefuAmtTot = .fields("IbfhRefuAmt_sum")
'    End If
'    End With
'    CloseTable tRecset
'End If
'
'End Sub

'Public Function GetIndrLinkTranVchr(ByRef cnn As ADODB.Connection, ByVal mIpgCode As Long) As String
'Dim tRecset As New ADODB.Recordset, mLinkTranStr As String
'
'With tRecset
'.Open "Select * from IndrBlHdr as hdr inner join VTypMast vty on hdr.IbhVtmCode=vty.VtmCode where IbhIpgCode=" & CStr(mIpgCode) & " order by IbhCode", cnn, adOpenKeyset, adLockOptimistic
'If .EOF = False Then
'    Do While .EOF = False
'        mLinkTranStr = mLinkTranStr & .fields("VtmName") & " No." & CStr(.fields("IbhVchNo")) & " Dated " & Dtoc(.fields("IbhDate")) & " Rs." & ToMyNumFmt(.fields("IbhAmtAftDisc")) & vbCrLf
'
'        .MoveNext
'    Loop
'End If
'End With
'CloseTable tRecset
'
'With tRecset
'.Open "Select * from IndrReg as hdr inner join VTypMast vty on hdr.IpgVtmCode=vty.VtmCode where IpgCode=" & CStr(mIpgCode) & " order by IpgCode", cnn, adOpenKeyset, adLockOptimistic
'If .EOF = False Then
'    Do While .EOF = False
'        mLinkTranStr = mLinkTranStr & .fields("VtmName") & " No." & CStr(.fields("IpgVchNo")) & " Dated " & Dtoc(.fields("IpgDate")) & " Rs." & ToMyNumFmt(.fields("IpgAdvAmt")) & vbCrLf
'
'        .MoveNext
'    Loop
'End If
'End With
'CloseTable tRecset
'
'With tRecset
'.Open "Select * from IndrHdr as hdr inner join VTypMast vty on hdr.IhrVtmCode=vty.VtmCode where IhrIpgCode=" & CStr(mIpgCode) & " order by IhrCode", cnn, adOpenKeyset, adLockOptimistic
'If .EOF = False Then
'    Do While .EOF = False
'        mLinkTranStr = mLinkTranStr & .fields("VtmName") & " No." & CStr(.fields("IhrVchNo")) & " Dated " & Dtoc(.fields("IhrDate")) & " Rs." & ToMyNumFmt(.fields("IhrAmtAftDisc")) & " (Recd." & ToMyNumFmt(.fields("IhrRecdAmt")) & ", Bal." & ToMyNumFmt(.fields("IhrBalAmt")) & ")" & vbCrLf
'
'        .MoveNext
'    Loop
'End If
'End With
'CloseTable tRecset
'
'With tRecset
'.Open "Select * from IndrPymtHdr as hdr inner join VTypMast vty on hdr.IphVtmCode=vty.VtmCode where IphIpgCode=" & CStr(mIpgCode) & " order by IphCode", cnn, adOpenKeyset, adLockOptimistic
'If .EOF = False Then
'    Do While .EOF = False
'        mLinkTranStr = mLinkTranStr & .fields("VtmName") & " No." & CStr(.fields("IphVchNo")) & " Dated " & Dtoc(.fields("IphDate")) & " Rs." & ToMyNumFmt(.fields("IphDepoAmt")) & vbCrLf
'
'        .MoveNext
'    Loop
'End If
'End With
'CloseTable tRecset
'
'With tRecset
'.Open "Select * from IndrRefdHdr as hdr inner join VTypMast vty on hdr.IfhVtmCode=vty.VtmCode where IfhIpgCode=" & CStr(mIpgCode) & " order by IfhCode", cnn, adOpenKeyset, adLockOptimistic
'If .EOF = False Then
'    Do While .EOF = False
'        mLinkTranStr = mLinkTranStr & .fields("VtmName") & " No." & CStr(.fields("IfhVchNo")) & " Dated " & Dtoc(.fields("IfhDate")) & " Rs." & ToMyNumFmt(.fields("IfhRefuAmt")) & vbCrLf
'
'        .MoveNext
'    Loop
'End If
'End With
'CloseTable tRecset
'
'With tRecset
'.Open "Select * from IndrRgPymt as hdr inner join VTypMast vty on hdr.IgtVtmCode=vty.VtmCode where IgtIpgCode=" & CStr(mIpgCode) & " order by IgtCode", cnn, adOpenKeyset, adLockOptimistic
'If .EOF = False Then
'    Do While .EOF = False
'        mLinkTranStr = mLinkTranStr & .fields("VtmName") & " No." & CStr(.fields("IgtVchNo")) & " Dated " & Dtoc(.fields("IgtDate")) & " Rs." & ToMyNumFmt(.fields("IgtDpogAmt")) & vbCrLf
'
'        .MoveNext
'    Loop
'End If
'End With
'CloseTable tRecset
'
'With tRecset
'.Open "Select * from IndrRgRefd as hdr inner join VTypMast vty on hdr.IgfVtmCode=vty.VtmCode where IgfIpgCode=" & CStr(mIpgCode) & " order by IgfCode", cnn, adOpenKeyset, adLockOptimistic
'If .EOF = False Then
'    Do While .EOF = False
'        mLinkTranStr = mLinkTranStr & .fields("VtmName") & " No." & CStr(.fields("IgfVchNo")) & " Dated " & Dtoc(.fields("IgfDate")) & " Rs." & ToMyNumFmt(.fields("IgfRfugAmt")) & vbCrLf
'
'        .MoveNext
'    Loop
'End If
'End With
'CloseTable tRecset
'
'With tRecset
'.Open "Select * from IndrBlPymtHdr as hdr inner join VTypMast vty on hdr.IbphVtmCode=vty.VtmCode where IbphIpgCode=" & CStr(mIpgCode) & " order by IbphCode", cnn, adOpenKeyset, adLockOptimistic
'If .EOF = False Then
'    Do While .EOF = False
'        mLinkTranStr = mLinkTranStr & .fields("VtmName") & " No." & CStr(.fields("IbphVchNo")) & " Dated " & Dtoc(.fields("IbphDate")) & " Rs." & ToMyNumFmt(.fields("IbphDepoAmt")) & vbCrLf
'
'        .MoveNext
'    Loop
'End If
'End With
'CloseTable tRecset
'
'With tRecset
'.Open "Select * from IndrBlRefdHdr as hdr inner join VTypMast vty on hdr.IbfhVtmCode=vty.VtmCode where IbfhIpgCode=" & CStr(mIpgCode) & " order by IbfhCode", cnn, adOpenKeyset, adLockOptimistic
'If .EOF = False Then
'    Do While .EOF = False
'        mLinkTranStr = mLinkTranStr & .fields("VtmName") & " No." & CStr(.fields("IbfhVchNo")) & " Dated " & Dtoc(.fields("IbfhDate")) & " Rs." & ToMyNumFmt(.fields("IbfhRefuAmt")) & vbCrLf
'
'        .MoveNext
'    Loop
'End If
'End With
'CloseTable tRecset
'
'GetIndrLinkTranVchr = mLinkTranStr
'
'End Function

'Public Sub GetBedRateValues(ByRef cnn As ADODB.Connection, ByVal mBdmCode As Long, ByVal mTranDate As Date, ByVal mTranTime As Long, Optional ByVal mSrmDctCode As Long, Optional ByVal mSrmPcgCode As Long, Optional ByVal mSrmRByCode As Long, Optional ByVal mSrmRToCode As Long, Optional ByRef mSrmRate As Double, Optional ByRef mSrmDiscPer As Double, Optional ByRef mSrmInfByPer As Double, Optional ByRef mSrmDefByPer As Double, Optional ByRef mSrmSharePer As Double, Optional ByRef mSrmShareAmt As Double)
'Dim clsBDM As New clsMdsMasterEntry, clsSRV As New clsMdsMasterEntry, clsSGP As New clsMdsMasterEntry
'Dim tRecset As New ADODB.Recordset
'
'Dim mDctwseRateSys As Boolean, mPcgwseRateSys As Boolean, mRBywseRateSys As Boolean, mRTowseRateSys As Boolean, mTimewseRateSys As Boolean
'Dim mDctwseDiscSys As Boolean, mPcgwseDiscSys As Boolean, mRBywseDiscSys As Boolean, mRTowseDiscSys As Boolean, mTimewseDiscSys As Boolean
'Dim mDctwseBargSys As Boolean, mPcgwseBargSys As Boolean, mRBywseBargSys As Boolean, mRTowseBargSys As Boolean, mTimewseBargSys As Boolean
'Dim mDctwseShareSys As Boolean, mPcgwseShareSys As Boolean, mRBywseShareSys As Boolean, mRTowseShareSys As Boolean, mTimewseShareSys As Boolean
'
'clsBDM.blnBedMast = True
'Set clsBDM.dbMdsDatabase = cnn
'clsBDM.Init
'
'clsSRV.blnServMast = True
'Set clsSRV.dbMdsDatabase = cnn
'clsSRV.Init
'
'clsSGP.blnServGrpMast = True
'Set clsSGP.dbMdsDatabase = cnn
'clsSGP.Init
'
'clsBDM.GetData mBdmCode
'clsSRV.GetData clsBDM.mBdmSrvCode_lng
'clsSGP.GetData clsSRV.mSrvSgpCode_lng
'
'If sExtServRateSys = False Then
'    mDctwseRateSys = sDctwseServRateSys
'    mPcgwseRateSys = sPcgwseServRateSys
'    mRBywseRateSys = sRBywseServRateSys
'    mRTowseRateSys = sRTowseServRateSys
'    mTimewseRateSys = sTimewseServRateSys
'Else
'    If clsSGP.mSgpExtRateSys_bln = False Then
'        mDctwseRateSys = clsSGP.mSgpDctwseRateSys_bln
'        mPcgwseRateSys = clsSGP.mSgpPcgwseRateSys_bln
'        mRBywseRateSys = clsSGP.mSgpRBywseRateSys_bln
'        mRTowseRateSys = clsSGP.mSgpRTowseRateSys_bln
'        mTimewseRateSys = clsSGP.mSgpTimewseRateSys_bln
'    Else
'        mDctwseRateSys = clsSRV.mSrvDctwseRateSys_bln
'        mPcgwseRateSys = clsSRV.mSrvPcgwseRateSys_bln
'        mRBywseRateSys = clsSRV.mSrvRBywseRateSys_bln
'        mRTowseRateSys = clsSRV.mSrvRTowseRateSys_bln
'        mTimewseRateSys = clsSRV.mSrvTimewseRateSys_bln
'    End If
'End If
'
'If sExtServDiscSys = False Then
'    mDctwseDiscSys = sDctwseServDiscSys
'    mPcgwseDiscSys = sPcgwseServDiscSys
'    mRBywseDiscSys = sRBywseServDiscSys
'    mRTowseDiscSys = sRTowseServDiscSys
'    mTimewseDiscSys = sTimewseServDiscSys
'Else
'    If clsSGP.mSgpExtDiscSys_bln = False Then
'        mDctwseDiscSys = clsSGP.mSgpDctwseDiscSys_bln
'        mPcgwseDiscSys = clsSGP.mSgpPcgwseDiscSys_bln
'        mRBywseDiscSys = clsSGP.mSgpRBywseDiscSys_bln
'        mRTowseDiscSys = clsSGP.mSgpRTowseDiscSys_bln
'        mTimewseDiscSys = clsSGP.mSgpTimewseDiscSys_bln
'    Else
'        mDctwseDiscSys = clsSRV.mSrvDctwseDiscSys_bln
'        mPcgwseDiscSys = clsSRV.mSrvPcgwseDiscSys_bln
'        mRBywseDiscSys = clsSRV.mSrvRBywseDiscSys_bln
'        mRTowseDiscSys = clsSRV.mSrvRTowseDiscSys_bln
'        mTimewseDiscSys = clsSRV.mSrvTimewseDiscSys_bln
'    End If
'End If
'
'If sExtServBargSys = False Then
'    mDctwseBargSys = sDctwseServBargSys
'    mPcgwseBargSys = sPcgwseServBargSys
'    mRBywseBargSys = sRBywseServBargSys
'    mRTowseBargSys = sRTowseServBargSys
'    mTimewseBargSys = sTimewseServBargSys
'Else
'    If clsSGP.mSgpExtBargSys_bln = False Then
'        mDctwseBargSys = clsSGP.mSgpDctwseBargSys_bln
'        mPcgwseBargSys = clsSGP.mSgpPcgwseBargSys_bln
'        mRBywseBargSys = clsSGP.mSgpRBywseBargSys_bln
'        mRTowseBargSys = clsSGP.mSgpRTowseBargSys_bln
'        mTimewseBargSys = clsSGP.mSgpTimewseBargSys_bln
'    Else
'        mDctwseBargSys = clsSRV.mSrvDctwseBargSys_bln
'        mPcgwseBargSys = clsSRV.mSrvPcgwseBargSys_bln
'        mRBywseBargSys = clsSRV.mSrvRBywseBargSys_bln
'        mRTowseBargSys = clsSRV.mSrvRTowseBargSys_bln
'        mTimewseBargSys = clsSRV.mSrvTimewseBargSys_bln
'    End If
'End If
'
'If sExtServShareSys = False Then
'    mDctwseShareSys = sDctwseServShareSys
'    mPcgwseShareSys = sPcgwseServShareSys
'    mRBywseShareSys = sRBywseServShareSys
'    mRTowseShareSys = sRTowseServShareSys
'    mTimewseShareSys = sTimewseServShareSys
'Else
'    If clsSGP.mSgpExtShareSys_bln = False Then
'        mDctwseShareSys = clsSGP.mSgpDctwseShareSys_bln
'        mPcgwseShareSys = clsSGP.mSgpPcgwseShareSys_bln
'        mRBywseShareSys = clsSGP.mSgpRBywseShareSys_bln
'        mRTowseShareSys = clsSGP.mSgpRTowseShareSys_bln
'        mTimewseShareSys = clsSGP.mSgpTimewseShareSys_bln
'    Else
'        mDctwseShareSys = clsSRV.mSrvDctwseShareSys_bln
'        mPcgwseShareSys = clsSRV.mSrvPcgwseShareSys_bln
'        mRBywseShareSys = clsSRV.mSrvRBywseShareSys_bln
'        mRTowseShareSys = clsSRV.mSrvRTowseShareSys_bln
'        mTimewseShareSys = clsSRV.mSrvTimewseShareSys_bln
'    End If
'End If
'
'If mDctwseRateSys = True Or mPcgwseRateSys = True Or mRBywseRateSys = True Or mRTowseRateSys = True Or mTimewseRateSys = True Then
'    With tRecset
'    .Open "Select top 1 * from ServRateMst where SrmCode=" & CStr(clsBDM.mBdmSrvCode_lng) & IIf(mDctwseRateSys = True, " and SrmDctCode=" & CStr(mSrmDctCode), "") & IIf(mPcgwseRateSys = True, " and SrmPcgCode=" & CStr(mSrmPcgCode), "") & IIf(mRBywseRateSys = True, " and SrmRByCode=" & CStr(mSrmRByCode), "") & IIf(mRTowseRateSys = True, " and SrmRToCode=" & CStr(mSrmRToCode), "") & " and SrmWefDate<=#" & ToSysDate(mTranDate) & "#" & IIf(mTimewseRateSys = True, " and SrmStartTime<=" & CStr(mTranTime) & " and SrmEndTime>=" & CStr(mTranTime), "") & " order by SrmWefDate desc", cnn, adOpenKeyset, adLockOptimistic
'    If .EOF = False Then
'        mSrmRate = .fields("SrmRate")
'    Else
'        If clsSRV.mSrvOpdGenChg_dbl <> 0 Then
'            mSrmRate = clsSRV.mSrvOpdGenChg_dbl
'        Else
'            mSrmRate = clsBDM.mBdmCharges_dbl
'        End If
'    End If
'    End With
'    CloseTable tRecset
'Else
'    If clsSRV.mSrvOpdGenChg_dbl <> 0 Then
'        mSrmRate = clsSRV.mSrvOpdGenChg_dbl
'    Else
'        mSrmRate = clsBDM.mBdmCharges_dbl
'    End If
'End If
'
'If mDctwseDiscSys = True Or mPcgwseDiscSys = True Or mRBywseDiscSys = True Or mRTowseDiscSys = True Or mTimewseDiscSys = True Then
'    With tRecset
'    .Open "Select top 1 * from ServRateMst where SrmCode=" & CStr(clsBDM.mBdmSrvCode_lng) & IIf(mDctwseDiscSys = True, " and SrmDctCode=" & CStr(mSrmDctCode), "") & IIf(mPcgwseDiscSys = True, " and SrmPcgCode=" & CStr(mSrmPcgCode), "") & IIf(mRBywseDiscSys = True, " and SrmRByCode=" & CStr(mSrmRByCode), "") & IIf(mRTowseDiscSys = True, " and SrmRToCode=" & CStr(mSrmRToCode), "") & " and SrmWefDate<=#" & ToSysDate(mTranDate) & "#" & IIf(mTimewseDiscSys = True, " and SrmStartTime<=" & CStr(mTranTime) & " and SrmEndTime>=" & CStr(mTranTime), "") & " order by SrmWefDate desc", cnn, adOpenKeyset, adLockOptimistic
'    If .EOF = False Then
'        mSrmDiscPer = .fields("SrmDiscPer")
'    Else
'        If clsSRV.mSrvDiscPer_dbl <> 0 Then
'            mSrmDiscPer = clsSRV.mSrvDiscPer_dbl
'        Else
'            mSrmDiscPer = IIf(clsBDM.mBdmDiscAllowed_bln = True, clsBDM.mBdmDiscPer_sng, 0)
'        End If
'    End If
'    End With
'    CloseTable tRecset
'Else
'    If clsSRV.mSrvDiscPer_dbl <> 0 Then
'        mSrmDiscPer = clsSRV.mSrvDiscPer_dbl
'    Else
'        mSrmDiscPer = IIf(clsBDM.mBdmDiscAllowed_bln = True, clsBDM.mBdmDiscPer_sng, 0)
'    End If
'End If
'
'If mDctwseBargSys = True Or mPcgwseBargSys = True Or mRBywseBargSys = True Or mRTowseBargSys = True Or mTimewseBargSys = True Then
'    With tRecset
'    .Open "Select top 1 * from ServRateMst where SrmCode=" & CStr(clsBDM.mBdmSrvCode_lng) & IIf(mDctwseBargSys = True, " and SrmDctCode=" & CStr(mSrmDctCode), "") & IIf(mPcgwseBargSys = True, " and SrmPcgCode=" & CStr(mSrmPcgCode), "") & IIf(mRBywseBargSys = True, " and SrmRByCode=" & CStr(mSrmRByCode), "") & IIf(mRTowseBargSys = True, " and SrmRToCode=" & CStr(mSrmRToCode), "") & " and SrmWefDate<=#" & ToSysDate(mTranDate) & "#" & IIf(mTimewseBargSys = True, " and SrmStartTime<=" & CStr(mTranTime) & " and SrmEndTime>=" & CStr(mTranTime), "") & " order by SrmWefDate desc", cnn, adOpenKeyset, adLockOptimistic
'    If .EOF = False Then
'        mSrmInfByPer = .fields("SrmInfByPer")
'        mSrmDefByPer = .fields("SrmDefByPer")
'    End If
'    End With
'    CloseTable tRecset
'Else
'
'End If
'
'If mDctwseShareSys = True Or mPcgwseShareSys = True Or mRBywseShareSys = True Or mRTowseShareSys = True Or mTimewseShareSys = True Then
'    With tRecset
'    .Open "Select top 1 * from ServRateMst where SrmCode=" & CStr(clsBDM.mBdmSrvCode_lng) & IIf(mDctwseShareSys = True, " and SrmDctCode=" & CStr(mSrmDctCode), "") & IIf(mPcgwseShareSys = True, " and SrmPcgCode=" & CStr(mSrmPcgCode), "") & IIf(mRBywseShareSys = True, " and SrmRByCode=" & CStr(mSrmRByCode), "") & IIf(mRTowseShareSys = True, " and SrmRToCode=" & CStr(mSrmRToCode), "") & " and SrmWefDate<=#" & ToSysDate(mTranDate) & "#" & IIf(mTimewseShareSys = True, " and SrmStartTime<=" & CStr(mTranTime) & " and SrmEndTime>=" & CStr(mTranTime), "") & " order by SrmWefDate desc", cnn, adOpenKeyset, adLockOptimistic
'    If .EOF = False Then
'        mSrmSharePer = .fields("SrmSharePer")
'        mSrmShareAmt = .fields("SrmShareAmt")
'    End If
'    End With
'    CloseTable tRecset
'Else
'
'End If
'
'Set clsBDM = Nothing: Set clsSRV = Nothing: Set clsSGP = Nothing
'CloseTable tRecset, mCheckOpen:=True
'
'End Sub

'Public Sub ResetIpdBillSrvIndexOrder(ByRef cnn As ADODB.Connection, ByVal mIblCode As Long)
'Dim tRecset As New ADODB.Recordset
'
'cnn.BeginTrans
'With tRecset
'.Open "Select * from IndrBill as ibl inner join ServMast as srv on ibl.IblSrvCode=srv.SrvCode where IblCode=" & CStr(mIblCode) & " order by SrvIndex,IblICode", cnn, adOpenKeyset, adLockOptimistic
'If .EOF = False Then
'    Do While .EOF = False
'        .fields("IblSno") = .AbsolutePosition
'        .Update
'
'        .MoveNext
'    Loop
'End If
'End With
'CloseTable tRecset
'cnn.CommitTrans
'
'End Sub

'Public Function GetIpdDischState(ByRef cnn As ADODB.Connection, ByVal mIpgCode As Long) As Integer
'Dim mRtnval As Integer, tRecset As New ADODB.Recordset
'
'With tRecset
'.Open "Select top 1 * from IBedState where IbsIpgCode=" & CStr(mIpgCode) & " order by IbsCode desc", cnn, adOpenKeyset, adLockOptimistic
'If .EOF = False Then
'    mRtnval = .fields("IbsDischState")
'Else
'    mRtnval = cIBS_STATE_UNKNOWN
'End If
'End With
'CloseTable tRecset
'
'GetIpdDischState = mRtnval
'
'End Function

'Public Function GetServDctDtlCount(ByRef cnn As ADODB.Connection, ByVal mTableName As String, ByVal mSdcCodeField As String, ByVal mSdcCode As Long, ByVal mSdcSubCodeField As String, ByVal mSdcSubCode As Long) As Integer
'Dim tRecset As New ADODB.Recordset, mRtnval As Integer
'
'With tRecset
'.Open "Select count(*) as SdcCount from " & mTableName & " where " & mSdcCodeField & "=" & CStr(mSdcCode) & " and " & mSdcSubCodeField & "=" & CStr(mSdcSubCode) & "", cnn, adOpenKeyset, adLockOptimistic
'mRtnval = .fields("SdcCount")
'End With
'CloseTable tRecset
'
'GetServDctDtlCount = mRtnval
'
'End Function

'Public Sub AutoInitStationFromArea(ByRef cnn As ADODB.Connection, ByRef txtStnName As TextBox, ByRef fcmbStnName As clsComFlexSearch, ByVal mAraCode As Long)
'Dim tRecset As New ADODB.Recordset
'
'With tRecset
'.Open "Select * from AreaMast where AraCode=" & CStr(mAraCode) & "", cnn, adOpenKeyset, adLockOptimistic
'If .EOF = False Then
'    fcmbStnName.BoundText = CStr(.fields("AraStnCode"))
'    If Val(fcmbStnName.BoundText) = 0 Then
'        fcmbStnName.Requery
'        fcmbStnName.BoundText = CStr(.fields("AraStnCode"))
'    End If
'    txtStnName.Text = fcmbStnName.Text
'End If
'End With
'CloseTable tRecset
'
'End Sub

'''Public Function GetUserOptRightStr(ByVal mUsrCode As Long, ByVal mMenuOptName As String) As String
'''Dim tRecset As New ADODB.Recordset, cnn As New ADODB.Connection, mRtnval As String
'''
'''OpenCmpDataSource cnn
'''With tRecset
'''.Open "Select * from UserRightMst" _
'''    & " where UhtUsrCode = " & CStr(mUsrCode) _
'''    & " and UhtSecuOptName IN ('" & cUHT_SECUOPTNAME_ANY & "','" & mMenuOptName & "')" _
'''    , cnn, adOpenKeyset, adLockOptimistic
'''If .EOF = False Then
'''    mRtnval = "CanAdd=" & CStr(.fields("UhtCanAdd")) _
'''        & ";" & "CanEdit=" & CStr(.fields("UhtCanEdit")) _
'''        & ";" & "CanDelete=" & CStr(.fields("UhtCanDelete")) _
'''        & ";" & "CanView=" & CStr(.fields("UhtCanView"))
'''    .Close
'''Else
'''    .Close
'''    .Open "Select * from UserRightMst" _
'''        & " where UhtUrlCode = (Select UsrUrlCode from UserMast where UsrCode = " & CStr(mUsrCode) & ")" _
'''        & " and UhtSecuOptName IN ('" & cUHT_SECUOPTNAME_ANY & "','" & mMenuOptName & "')" _
'''        , cnn, adOpenKeyset, adLockOptimistic
'''    If .EOF = False Then
'''        mRtnval = "CanAdd=" & CStr(.fields("UhtCanAdd")) _
'''            & ";" & "CanEdit=" & CStr(.fields("UhtCanEdit")) _
'''            & ";" & "CanDelete=" & CStr(.fields("UhtCanDelete")) _
'''            & ";" & "CanView=" & CStr(.fields("UhtCanView"))
'''    Else
'''        mRtnval = "CanAdd=0" _
'''            & ";" & "CanEdit=0" _
'''            & ";" & "CanDelete=0" _
'''            & ";" & "CanView=0"
'''    End If
'''    .Close
'''End If
'''End With
'''CloseTable tRecset, mCheckOpen:=True
'''CloseDataSource cnn
'''
'''GetUserOptRightStr = mRtnval
'''
'''End Function

'Public Sub AssignUserOptRightValue(ByVal mUsrCode As Long, ByVal mMenuOptName As String, Optional ByRef mCanAddOpt, Optional ByRef mCanEditOpt, Optional ByRef mCanDeleteOpt, Optional mCanViewOpt)
'Dim mUsrRightStr As String, aUsrRightStr As Variant, pos As Integer
'Dim aRightName As Variant, mRightName As String, mRightValue As Boolean
'
'mUsrRightStr = GetUserOptRightStr(mUsrCode, mMenuOptName)
'aUsrRightStr = Split(mUsrRightStr, ";")
'
'For pos = LBound(aUsrRightStr) To UBound(aUsrRightStr)
'    aRightName = Split(aUsrRightStr(pos), "=")
'    mRightName = CStr(aRightName(LBound(aRightName)))
'    mRightValue = CBool(aRightName(UBound(aRightName)))
'    If mRightName = "CanAdd" Then
'        mCanAddOpt = mRightValue
'    ElseIf mRightName = "CanEdit" Then
'        mCanEditOpt = mRightValue
'    ElseIf mRightName = "CanDelete" Then
'        mCanDeleteOpt = mRightValue
'    ElseIf mRightName = "CanView" Then
'        mCanViewOpt = mRightValue
'    Else
'        ErrorBox "HmsLibrary_AssignUserOptRightValue_#1349_[Undefined Case]"
'    End If
'Next pos
'
'End Sub
'
'Public Function CanUserAddOpt(ByVal mUsrCode As Long, ByVal mMenuOptName As String, Optional ByVal mRtnDefault As Boolean = False) As Boolean
'Dim mRtnval As Boolean, mUsrRightStr As String, aUsrRightStr As Variant, pos As Integer
'Dim aRightName As Variant, mRightName As String, mRightValue As Boolean
'
'mRtnval = mRtnDefault
'mUsrRightStr = GetUserOptRightStr(mUsrCode, mMenuOptName)
'aUsrRightStr = Split(mUsrRightStr, ";")
'
'For pos = LBound(aUsrRightStr) To UBound(aUsrRightStr)
'    aRightName = Split(aUsrRightStr(pos), "=")
'    mRightName = CStr(aRightName(LBound(aRightName)))
'    mRightValue = CBool(aRightName(UBound(aRightName)))
'    If mRightName = "CanAdd" Then
'        mRtnval = mRightValue
'        Exit For
'    End If
'Next pos
'CanUserAddOpt = mRtnval
'
'End Function
'
'Public Function CanUserEditOpt(ByVal mUsrCode As Long, ByVal mMenuOptName As String, Optional ByVal mRtnDefault As Boolean = False) As Boolean
'Dim mRtnval As Boolean, mUsrRightStr As String, aUsrRightStr As Variant, pos As Integer
'Dim aRightName As Variant, mRightName As String, mRightValue As Boolean
'
'mRtnval = mRtnDefault
'mUsrRightStr = GetUserOptRightStr(mUsrCode, mMenuOptName)
'aUsrRightStr = Split(mUsrRightStr, ";")
'
'For pos = LBound(aUsrRightStr) To UBound(aUsrRightStr)
'    aRightName = Split(aUsrRightStr(pos), "=")
'    mRightName = CStr(aRightName(LBound(aRightName)))
'    mRightValue = CBool(aRightName(UBound(aRightName)))
'    If mRightName = "CanEdit" Then
'        mRtnval = mRightValue
'        Exit For
'    End If
'Next pos
'CanUserEditOpt = mRtnval
'
'End Function
'
'Public Function CanUserDeleteOpt(ByVal mUsrCode As Long, ByVal mMenuOptName As String, Optional ByVal mRtnDefault As Boolean = False) As Boolean
'Dim mRtnval As Boolean, mUsrRightStr As String, aUsrRightStr As Variant, pos As Integer
'Dim aRightName As Variant, mRightName As String, mRightValue As Boolean
'
'mRtnval = mRtnDefault
'mUsrRightStr = GetUserOptRightStr(mUsrCode, mMenuOptName)
'aUsrRightStr = Split(mUsrRightStr, ";")
'
'For pos = LBound(aUsrRightStr) To UBound(aUsrRightStr)
'    aRightName = Split(aUsrRightStr(pos), "=")
'    mRightName = CStr(aRightName(LBound(aRightName)))
'    mRightValue = CBool(aRightName(UBound(aRightName)))
'    If mRightName = "CanDelete" Then
'        mRtnval = mRightValue
'        Exit For
'    End If
'Next pos
'CanUserDeleteOpt = mRtnval
'
'End Function




