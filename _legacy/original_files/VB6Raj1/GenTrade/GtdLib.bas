Attribute VB_Name = "GtdLibrary"
Option Explicit

Public sGtdDatabaseName As String

Public Const cGTD_VTYPE_GENERAL = 101

Rem Crystal Report List file names
Public Const cSALEINV_CRLFILENAME = "SaleInv.Crl"

Public Sub InitGtdVar()

sGtdDatabaseName = "GenTrade.Mdb"
clsVType.AddType cGTD_VTYPE_GENERAL, "General"

End Sub

Public Sub RemoveGtdNullValue(Optional ByRef FormProgStatus As frmProgressStatus)
Dim dbGtdDatabase As New ADODB.Connection, dbGtdCatalog As New ADOX.Catalog
Dim tRecset As New ADODB.Recordset
Dim mTable As ADOX.Table, mTableName As String

OpenGtdDataSource dbGtdDatabase, mExclusiveMode:=True
If dbGtdDatabase.State <> 1 Then
    ErrorBox Err.Description
    GoTo EndSub
End If
Set dbGtdCatalog.ActiveConnection = dbGtdDatabase
If Not FormProgStatus Is Nothing Then
    If FormProgStatus.Visible = True Then
        FormProgStatus.pbar1.Min = 0: FormProgStatus.pbar1.Max = dbGtdCatalog.Tables.count
    End If
End If

dbGtdDatabase.BeginTrans
For Each mTable In dbGtdCatalog.Tables
    If mTable.Type = "TABLE" Then
        If Not FormProgStatus Is Nothing Then
            If FormProgStatus.Visible = True Then
                FormProgStatus.ShowNextStatus dbGtdCatalog.ActiveConnection.Properties("Data Source Name") & vbCrLf & "Table: " & mTable.Name
            End If
        End If
    
        mTableName = mTable.Name
        With tRecset
        .Open "Select * from " & mTableName & "", dbGtdDatabase, adOpenKeyset, adLockOptimistic
        If .RecordCount > 0 Then
            RemoveNullValue tRecset
        End If
        End With
        CloseTable tRecset
    End If
Next mTable
dbGtdDatabase.CommitTrans

Rem InfoBox dbGtdCatalog.ActiveConnection.Properties("Data Source Name") & ", Done !!!"

CloseDataSource dbGtdDatabase

EndSub:
Set dbGtdCatalog = Nothing
Set dbGtdDatabase = Nothing
Exit Sub

End Sub

Public Property Get dbGtdDatabaseFullPath(Optional ByVal mDbPath) As String
mDbPath = IIf(IsMissing(mDbPath) = False, mDbPath, sCmpDataPath)
dbGtdDatabaseFullPath = AddBS(mDbPath) & sGtdDatabaseName

End Property

Public Function OpenGtdDataSource(ByRef db As ADODB.Connection, Optional ByVal mDbPath, Optional ByVal mUserId As String, Optional ByVal mPwd As String, Optional ByVal mExclusiveMode As Boolean) As Variant
mDbPath = AddBS(IIf(IsMissing(mDbPath) = False, mDbPath, sCmpDataPath))
db.ConnectionString = "Provider=" & DbProvider & ";Data Source=" & dbGtdDatabaseFullPath(mDbPath)
If mExclusiveMode = True Then
    db.Mode = adModeShareExclusive
End If

db.Open
End Function

Public Property Get SaleInvCRLFileFullPath(Optional ByVal mFilePath, Optional ByVal mFileName) As String
mFilePath = IIf(IsMissing(mFilePath) = False, mFilePath, sCmpDataPath)  ''' sAppPath
mFileName = IIf(IsMissing(mFileName) = False, mFileName, cSALEINV_CRLFILENAME)
SaleInvCRLFileFullPath = AddBS(mFilePath) & mFileName

End Property

