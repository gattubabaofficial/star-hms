Attribute VB_Name = "CtnLibrary"
Option Explicit

Public sCtnDatabaseName As String
Public sPatMastOptFileName As String, sPatMastOldFileName As String, sExtServRateOptFileName As String
Public sOutdRegOptFileName As String, sOutdRegOldFileName As String, sOutdRcptOptFileName As String, sOutdRcptOldFileName As String, sOutdPymtOptFileName As String, sOutdPymtOldFileName As String, sOutdRefdOptFileName As String, sOutdRefdOldFileName As String, sOutdBillOptFileName As String, sOutdBillOldFileName As String, sOutdBlPymtOptFileName As String, sOutdBlPymtOldFileName As String, sOutdBlRefdOptFileName As String, sOutdBlRefdOldFileName As String, sOutdRgPymtOptFileName As String, sOutdRgPymtOldFileName As String, sOutdRgRefdOptFileName As String, sOutdRgRefdOldFileName As String
Public sIndrRegOptFileName As String, sIndrRegOldFileName As String, sBedMastOptFileName As String, sBedMastOldFileName As String, sIndrRcptOptFileName As String, sIndrRcptOldFileName As String, sIndrPymtOptFileName As String, sIndrPymtOldFileName As String, sIndrRefdOptFileName As String, sIndrRefdOldFileName As String, sIndrBillOptFileName As String, sIndrBillOldFileName As String, sIndrBlPymtOptFileName As String, sIndrBlPymtOldFileName As String, sIndrBlRefdOptFileName As String, sIndrBlRefdOldFileName As String, sIndrRgPymtOptFileName As String, sIndrRgPymtOldFileName As String, sIndrRgRefdOptFileName As String, sIndrRgRefdOldFileName As String
Public sOutdRegCRLFileName As String
Rem Service Charges/Share System
Public sExtServRateSys As Boolean, sDctwseServRateSys As Boolean, sPcgwseServRateSys As Boolean, sRBywseServRateSys As Boolean, sRTowseServRateSys As Boolean, sTimewseServRateSys As Boolean
Public sExtServDiscSys As Boolean, sDctwseServDiscSys As Boolean, sPcgwseServDiscSys As Boolean, sRBywseServDiscSys As Boolean, sRTowseServDiscSys As Boolean, sTimewseServDiscSys As Boolean
Public sExtServBargSys As Boolean, sDctwseServBargSys As Boolean, sPcgwseServBargSys As Boolean, sRBywseServBargSys As Boolean, sRTowseServBargSys As Boolean, sTimewseServBargSys As Boolean
Public sExtServShareSys As Boolean, sDctwseServShareSys As Boolean, sPcgwseServShareSys As Boolean, sRBywseServShareSys As Boolean, sRTowseServShareSys As Boolean, sTimewseServShareSys As Boolean

'Public Const cCTN_VTYPE_PURCH = 101
'Public Const cCTN_VTYPE_SALE = 102
Public Const cCTN_VTYPE_GENERAL = 101

Public Sub InitCtnVar()
'Dim clsHOPT As New clsHmsOpdOptionsEntry
' --------------------------------------
sCtnDatabaseName = "Canteen.Mdb"
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
'clsVType.AddType cCTN_VTYPE_PURCH, "Purchase"
'clsVType.AddType cCTN_VTYPE_SALE, "Sales Entry"
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
clsVType.AddType cCTN_VTYPE_GENERAL, "General"

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

Public Sub RemoveCtnNullValue(Optional ByRef FormProgStatus As frmProgressStatus)
Dim dbCtnDatabase As New ADODB.Connection, dbCtnCatalog As New ADOX.Catalog
Dim tRecset As New ADODB.Recordset
Dim mTable As ADOX.Table, mTableName As String

OpenCtnDataSource dbCtnDatabase, mExclusiveMode:=True
If dbCtnDatabase.State <> 1 Then
    ErrorBox Err.Description
    GoTo EndSub
End If
Set dbCtnCatalog.ActiveConnection = dbCtnDatabase
If Not FormProgStatus Is Nothing Then
    If FormProgStatus.Visible = True Then
        FormProgStatus.pbar1.Min = 0: FormProgStatus.pbar1.Max = dbCtnCatalog.Tables.count
    End If
End If

dbCtnDatabase.BeginTrans
For Each mTable In dbCtnCatalog.Tables
    If mTable.Type = "TABLE" Then
        If Not FormProgStatus Is Nothing Then
            If FormProgStatus.Visible = True Then
                FormProgStatus.ShowNextStatus dbCtnCatalog.ActiveConnection.Properties("Data Source Name") & vbCrLf & "Table: " & mTable.Name
            End If
        End If
        
        mTableName = mTable.Name
        With tRecset
        .Open "Select * from " & mTableName & "", dbCtnDatabase, adOpenKeyset, adLockOptimistic
        If .RecordCount > 0 Then
            RemoveNullValue tRecset
        End If
        End With
        CloseTable tRecset
    End If
Next mTable
dbCtnDatabase.CommitTrans

Rem InfoBox dbCtnCatalog.ActiveConnection.Properties("Data Source Name") & ", Done !!!"

CloseDataSource dbCtnDatabase

EndSub:
Set dbCtnCatalog = Nothing
Set dbCtnDatabase = Nothing
Exit Sub

End Sub

Public Property Get dbCtnDatabaseFullPath(Optional ByVal mDbPath) As String
mDbPath = IIf(IsMissing(mDbPath) = False, mDbPath, sCmpDataPath)
dbCtnDatabaseFullPath = AddBS(mDbPath) & sCtnDatabaseName

End Property

Public Function OpenCtnDataSource(ByRef db As ADODB.Connection, Optional ByVal mDbPath, Optional ByVal mUserId As String, Optional ByVal mPwd As String, Optional ByVal mExclusiveMode As Boolean) As Variant
mDbPath = AddBS(IIf(IsMissing(mDbPath) = False, mDbPath, sCmpDataPath))
db.ConnectionString = "Provider=" & DbProvider & ";Data Source=" & dbCtnDatabaseFullPath(mDbPath)
If mExclusiveMode = True Then
    db.Mode = adModeShareExclusive
End If

db.Open
End Function



