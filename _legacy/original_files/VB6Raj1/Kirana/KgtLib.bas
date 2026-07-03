Attribute VB_Name = "KgtLibrary"
Option Explicit

Public sKgtDatabaseName As String

Public Const cKGT_VTYPE_GENERAL = 101
Public Const cKGT_VTYPE_WSLSALES = 102
Public Const cKGT_VTYPE_RTLSALES = 103
Public Const cKGT_VTYPE_SWLSALES = 104
Public Const cKGT_VTYPE_SALELIST = "102,103,104"

Rem Crystal Report List file names
Public Const cRTLSALE_CRLFILENAME = "RtlSale.Crl"
Public Const cSWLSALE_CRLFILENAME = "SwlSale.Crl"
Public Const cWSLSALE_CRLFILENAME = "WslSale.Crl"

Public Sub InitKgtVar()

sKgtDatabaseName = "KiranaGn.Mdb"
clsVType.AddType cKGT_VTYPE_GENERAL, "General"
clsVType.AddType cKGT_VTYPE_WSLSALES, "Whole Sale"
clsVType.AddType cKGT_VTYPE_RTLSALES, "Retail Sale"
clsVType.AddType cKGT_VTYPE_SWLSALES, "Semi Whole Sale"

End Sub

Public Sub RemoveKgtNullValue(Optional ByRef FormProgStatus As frmProgressStatus)
Dim dbKgtDatabase As New ADODB.Connection, dbKgtCatalog As New ADOX.Catalog
Dim tRecset As New ADODB.Recordset
Dim mTable As ADOX.Table, mTableName As String

OpenKgtDataSource dbKgtDatabase, mExclusiveMode:=True
If dbKgtDatabase.State <> 1 Then
    ErrorBox Err.Description
    GoTo EndSub
End If
Set dbKgtCatalog.ActiveConnection = dbKgtDatabase
If Not FormProgStatus Is Nothing Then
    If FormProgStatus.Visible = True Then
        FormProgStatus.pbar1.Min = 0: FormProgStatus.pbar1.Max = dbKgtCatalog.Tables.count
    End If
End If

dbKgtDatabase.BeginTrans
For Each mTable In dbKgtCatalog.Tables
    If mTable.Type = "TABLE" Then
        If Not FormProgStatus Is Nothing Then
            If FormProgStatus.Visible = True Then
                FormProgStatus.ShowNextStatus dbKgtCatalog.ActiveConnection.Properties("Data Source Name") & vbCrLf & "Table: " & mTable.Name
            End If
        End If
        
        mTableName = mTable.Name
        With tRecset
        .Open "Select * from " & mTableName & "", dbKgtDatabase, adOpenKeyset, adLockOptimistic
        If .RecordCount > 0 Then
            RemoveNullValue tRecset
        End If
        End With
        CloseTable tRecset
    End If
Next mTable
dbKgtDatabase.CommitTrans

Rem InfoBox dbKgtCatalog.ActiveConnection.Properties("Data Source Name") & ", Done !!!"

CloseDataSource dbKgtDatabase

EndSub:
Set dbKgtCatalog = Nothing
Set dbKgtDatabase = Nothing
Exit Sub

End Sub

Public Property Get RtlSaleCRLFileFullPath(Optional ByVal mFilePath, Optional ByVal mFileName) As String
mFilePath = IIf(IsMissing(mFilePath) = False, mFilePath, sCmpDataPath)  ''' sAppPath
mFileName = IIf(IsMissing(mFileName) = False, mFileName, cRTLSALE_CRLFILENAME)
RtlSaleCRLFileFullPath = AddBS(mFilePath) & mFileName

End Property

Public Property Get SwlSaleCRLFileFullPath(Optional ByVal mFilePath, Optional ByVal mFileName) As String
mFilePath = IIf(IsMissing(mFilePath) = False, mFilePath, sCmpDataPath)  ''' sAppPath
mFileName = IIf(IsMissing(mFileName) = False, mFileName, cSWLSALE_CRLFILENAME)
SwlSaleCRLFileFullPath = AddBS(mFilePath) & mFileName

End Property

Public Property Get WslSaleCRLFileFullPath(Optional ByVal mFilePath, Optional ByVal mFileName) As String
mFilePath = IIf(IsMissing(mFilePath) = False, mFilePath, sCmpDataPath)  ''' sAppPath
mFileName = IIf(IsMissing(mFileName) = False, mFileName, cWSLSALE_CRLFILENAME)
WslSaleCRLFileFullPath = AddBS(mFilePath) & mFileName

End Property

Public Property Get dbKgtDatabaseFullPath(Optional ByVal mDbPath) As String
mDbPath = IIf(IsMissing(mDbPath) = False, mDbPath, sCmpDataPath)
dbKgtDatabaseFullPath = AddBS(mDbPath) & sKgtDatabaseName

End Property

Public Function OpenKgtDataSource(ByRef db As ADODB.Connection, Optional ByVal mDbPath, Optional ByVal mUserId As String, Optional ByVal mPwd As String, Optional ByVal mExclusiveMode As Boolean) As Variant
mDbPath = AddBS(IIf(IsMissing(mDbPath) = False, mDbPath, sCmpDataPath))
db.ConnectionString = "Provider=" & DbProvider & ";Data Source=" & dbKgtDatabaseFullPath(mDbPath)
If mExclusiveMode = True Then
    db.Mode = adModeShareExclusive
End If

db.Open
End Function





