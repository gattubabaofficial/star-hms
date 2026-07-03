Attribute VB_Name = "PmtLibrary"
Option Explicit

Public sPmtDatabaseName As String
Public sPatMastOptFileName As String, sPatMastOldFileName As String, sExtServRateOptFileName As String
Public sOutdRegOptFileName As String, sOutdRegOldFileName As String, sOutdRcptOptFileName As String, sOutdRcptOldFileName As String, sOutdPymtOptFileName As String, sOutdPymtOldFileName As String, sOutdRefdOptFileName As String, sOutdRefdOldFileName As String, sOutdBillOptFileName As String, sOutdBillOldFileName As String, sOutdBlPymtOptFileName As String, sOutdBlPymtOldFileName As String, sOutdBlRefdOptFileName As String, sOutdBlRefdOldFileName As String, sOutdRgPymtOptFileName As String, sOutdRgPymtOldFileName As String, sOutdRgRefdOptFileName As String, sOutdRgRefdOldFileName As String
Public sIndrRegOptFileName As String, sIndrRegOldFileName As String, sBedMastOptFileName As String, sBedMastOldFileName As String, sIndrRcptOptFileName As String, sIndrRcptOldFileName As String, sIndrPymtOptFileName As String, sIndrPymtOldFileName As String, sIndrRefdOptFileName As String, sIndrRefdOldFileName As String, sIndrBillOptFileName As String, sIndrBillOldFileName As String, sIndrBlPymtOptFileName As String, sIndrBlPymtOldFileName As String, sIndrBlRefdOptFileName As String, sIndrBlRefdOldFileName As String, sIndrRgPymtOptFileName As String, sIndrRgPymtOldFileName As String, sIndrRgRefdOptFileName As String, sIndrRgRefdOldFileName As String
Public sOutdRegCRLFileName As String
Rem Service Charges/Share System
Public sExtServRateSys As Boolean, sDctwseServRateSys As Boolean, sPcgwseServRateSys As Boolean, sRBywseServRateSys As Boolean, sRTowseServRateSys As Boolean, sTimewseServRateSys As Boolean
Public sExtServDiscSys As Boolean, sDctwseServDiscSys As Boolean, sPcgwseServDiscSys As Boolean, sRBywseServDiscSys As Boolean, sRTowseServDiscSys As Boolean, sTimewseServDiscSys As Boolean
Public sExtServBargSys As Boolean, sDctwseServBargSys As Boolean, sPcgwseServBargSys As Boolean, sRBywseServBargSys As Boolean, sRTowseServBargSys As Boolean, sTimewseServBargSys As Boolean
Public sExtServShareSys As Boolean, sDctwseServShareSys As Boolean, sPcgwseServShareSys As Boolean, sRBywseServShareSys As Boolean, sRTowseServShareSys As Boolean, sTimewseServShareSys As Boolean

Public Const cPMT_VTYPE_JOB_RCPT = 101
Public Const cPMT_VTYPE_JOB_ISSUE = 102
Public Const cPMT_VTYPE_GENERAL = 103

Public MyCompany As CompanyInfo

Public Type CompanyInfo
mCmpCode As Long
mCmpName As String
mCmpBooksDate As Date
mCmpFYStartDt As Date
mCmpFYEndDt As Date
mCmpAddress As String
mCmpCity As String
mCmpDistrict As String
mCmpState As String
mCmpReg1 As String
mCmpReg2 As String
mCmpReg3 As String
mCmpContPer As String
mCmpOPhone As String
mCmpRPhone As String
mCmpFax As String
mCmpEmail As String
mCmpWebsite As String
mCmpJurisdiction As String
mCmpSecPwd As String
mCmpRecState As String

End Type

Public Sub InitPmtVar()
' --------------------------------------
sPmtDatabaseName = "Priya.Mdb"
sPatMastOptFileName = "PatMast.Jar"
sPatMastOldFileName = "PatMast.Old"
sExtServRateOptFileName = "ExtSrvRt.Jar"
' --------------------------------------------
sOutdRegOptFileName = "OutdReg.Jar"
sOutdRegOldFileName = "OutdReg.Old"
sOutdRcptOptFileName = "OutdRcpt.Jar"
sOutdRcptOldFileName = "OutdRcpt.Old"
sOutdPymtOptFileName = "OutdPymt.Jar"
sOutdPymtOldFileName = "OutdPymt.Old"
sOutdRefdOptFileName = "OutdRefd.Jar"
sOutdRefdOldFileName = "OutdRefd.Old"
sOutdBillOptFileName = "OutdBill.Jar"
sOutdBillOldFileName = "OutdBill.Old"
sOutdBlPymtOptFileName = "OutdBlPymt.Jar"
sOutdBlPymtOldFileName = "OutdBlPymt.Old"
sOutdBlRefdOptFileName = "OutdBlRefd.Jar"
sOutdBlRefdOldFileName = "OutdBlRefd.Old"
sOutdRgPymtOptFileName = "OutdRgPymt.Jar"
sOutdRgPymtOldFileName = "OutdRgPymt.Old"
sOutdRgRefdOptFileName = "OutdRgRefd.Jar"
sOutdRgRefdOldFileName = "OutdRgRefd.Old"
' --------------------------------------
sIndrRegOptFileName = "IndrReg.Jar"
sIndrRegOldFileName = "IndrReg.Old"
sBedMastOptFileName = "BedMast.Jar"
sBedMastOldFileName = "BedMast.Old"
sIndrRcptOptFileName = "IndrRcpt.Jar"
sIndrRcptOldFileName = "IndrRcpt.Old"
sIndrPymtOptFileName = "IndrPymt.Jar"
sIndrPymtOldFileName = "IndrPymt.Old"
sIndrRefdOptFileName = "IndrRefd.Jar"
sIndrRefdOldFileName = "IndrRefd.Old"
sIndrBillOptFileName = "IndrBill.Jar"
sIndrBillOldFileName = "IndrBill.Old"
sIndrBlPymtOptFileName = "IndrBlPymt.Jar"
sIndrBlPymtOldFileName = "IndrBlPymt.Old"
sIndrBlRefdOptFileName = "IndrBlRefd.Jar"
sIndrBlRefdOldFileName = "IndrBlRefd.Old"
sIndrRgPymtOptFileName = "IndrRgPymt.Jar"
sIndrRgPymtOldFileName = "IndrRgPymt.Old"
sIndrRgRefdOptFileName = "IndrRgRefd.Jar"
sIndrRgRefdOldFileName = "IndrRgRefd.Old"
' ---------------------------------------
sOutdRegCRLFileName = "OutdReg.Crl"

' ------------------------
clsVType.AddType cPMT_VTYPE_JOB_RCPT, "Job Receipt"
clsVType.AddType cPMT_VTYPE_JOB_ISSUE, "Job Issue"
'' --------------------------------------------
clsVType.AddType cPMT_VTYPE_GENERAL, "General"

End Sub

Public Sub RemovePmtNullValue()
Dim dbPmtDatabase As New ADODB.Connection, dbPmtCatalog As New ADOX.Catalog
Dim tRecset As New ADODB.Recordset
Dim mTable As ADOX.Table, mTableName As String

OpenPmtDataSource dbPmtDatabase, mExclusiveMode:=True
If dbPmtDatabase.State <> 1 Then
    ErrorBox Err.Description
    GoTo EndSub
End If
Set dbPmtCatalog.ActiveConnection = dbPmtDatabase

dbPmtDatabase.BeginTrans
For Each mTable In dbPmtCatalog.Tables
    If mTable.Type = "TABLE" Then
        mTableName = mTable.Name
        With tRecset
        .Open "Select * from " & mTableName & "", dbPmtDatabase, adOpenKeyset, adLockOptimistic
        If .RecordCount > 0 Then
            RemoveNullValue tRecset
        End If
        End With
        CloseTable tRecset
    End If
Next mTable
dbPmtDatabase.CommitTrans

InfoBox dbPmtCatalog.ActiveConnection.Properties("Data Source Name") & ", Done !!!"

CloseDataSource dbPmtDatabase

EndSub:
Set dbPmtCatalog = Nothing
Set dbPmtDatabase = Nothing
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

Public Property Get dbPmtDatabaseFullPath(Optional ByVal mDbPath) As String
mDbPath = IIf(IsMissing(mDbPath) = False, mDbPath, sCmpDataPath)
dbPmtDatabaseFullPath = AddBS(mDbPath) & sPmtDatabaseName

End Property

Public Function OpenPmtDataSource(ByRef db As ADODB.Connection, Optional ByVal mDbPath, Optional ByVal mUserId As String, Optional ByVal mPwd As String, Optional ByVal mExclusiveMode As Boolean) As Variant
mDbPath = AddBS(IIf(IsMissing(mDbPath) = False, mDbPath, sCmpDataPath))
db.ConnectionString = "Provider=" & DbProvider & ";Data Source=" & dbPmtDatabaseFullPath(mDbPath)
If mExclusiveMode = True Then
    db.Mode = adModeShareExclusive
End If

db.Open
End Function

Public Sub ClearCompanyInfo()

With MyCompany
.mCmpCode = 0
.mCmpName = ""
.mCmpBooksDate = cUNKNOWNDATE
.mCmpFYStartDt = cUNKNOWNDATE
.mCmpFYEndDt = cUNKNOWNDATE
.mCmpAddress = ""
.mCmpCity = ""
.mCmpDistrict = ""
.mCmpState = ""
.mCmpReg1 = ""
.mCmpReg2 = ""
.mCmpReg3 = ""
.mCmpContPer = ""
.mCmpOPhone = ""
.mCmpRPhone = ""
.mCmpFax = ""
.mCmpEmail = ""
.mCmpWebsite = ""
.mCmpJurisdiction = ""
.mCmpSecPwd = ""
.mCmpRecState = 0

End With

End Sub

Public Sub GetCompanyInfo(ByVal mCmpCode As Integer, Optional ByVal mClearPrev = True)
Dim cnn As New ADODB.Connection, tRecset As New ADODB.Recordset

If mClearPrev = True Then
    Call ClearCompanyInfo
End If
OpenCmpDataSource cnn

With tRecset
.Open "Select * from Company where CmpCode=" & CStr(mCmpCode) & "", cnn, adOpenKeyset, adLockOptimistic
If .EOF = False Then
    MyCompany.mCmpCode = .fields("CmpCode")
    MyCompany.mCmpName = .fields("CmpName")
    MyCompany.mCmpBooksDate = .fields("CmpBooksDate")
    MyCompany.mCmpFYStartDt = .fields("CmpFYStartDt")
    MyCompany.mCmpFYEndDt = .fields("CmpFYEndDt")
    MyCompany.mCmpAddress = .fields("CmpAddress")
    MyCompany.mCmpCity = .fields("CmpCity")
    MyCompany.mCmpDistrict = .fields("CmpDistrict")
    MyCompany.mCmpState = .fields("CmpState")
    MyCompany.mCmpReg1 = .fields("CmpReg1")
    MyCompany.mCmpReg2 = .fields("CmpReg2")
    MyCompany.mCmpReg3 = .fields("CmpReg3")
    MyCompany.mCmpContPer = .fields("CmpContPer")
    MyCompany.mCmpOPhone = .fields("CmpOPhone")
    MyCompany.mCmpRPhone = .fields("CmpRPhone")
    MyCompany.mCmpFax = .fields("CmpFax")
    MyCompany.mCmpEmail = .fields("CmpEmail")
    MyCompany.mCmpWebsite = .fields("CmpWebsite")
    MyCompany.mCmpJurisdiction = .fields("CmpJurisdiction")
    MyCompany.mCmpSecPwd = .fields("CmpSecPwd")
    MyCompany.mCmpRecState = .fields("CmpRecState")
End If
End With
CloseTable tRecset
CloseDataSource cnn

End Sub

Public Sub AutoInitStationFromArea(ByRef cnn As ADODB.Connection, ByRef txtStnName As TextBox, ByRef fcmbStnName As clsComFlexSearch, ByVal mAraCode As Long)
Dim tRecset As New ADODB.Recordset

With tRecset
.Open "Select * from AreaMast where AraCode=" & CStr(mAraCode) & "", cnn, adOpenKeyset, adLockOptimistic
If .EOF = False Then
    fcmbStnName.BoundText = CStr(.fields("AraStnCode"))
    If Val(fcmbStnName.BoundText) = 0 Then
        fcmbStnName.Requery
        fcmbStnName.BoundText = CStr(.fields("AraStnCode"))
    End If
    txtStnName.Text = fcmbStnName.Text
End If
End With
CloseTable tRecset

End Sub
