Attribute VB_Name = "ToolingLibrary"
Option Explicit

Public sTlgDatabaseName As String

Public Sub InitTlgVar()
sTlgDatabaseName = "Tooling.Mdb"
End Sub

Public Sub RemoveTlgNullValue()
Dim dbTlgDatabase As New ADODB.Connection, dbTlgCatalog As New ADOX.Catalog
Dim tRecset As New ADODB.Recordset
Dim mTable As ADOX.Table, mTableName As String

OpenTlgDataSource dbTlgDatabase, mExclusiveMode:=True
If dbTlgDatabase.State <> 1 Then
    ErrorBox Err.Description
    Exit Sub
End If
Set dbTlgCatalog.ActiveConnection = dbTlgDatabase

dbTlgDatabase.BeginTrans
For Each mTable In dbTlgCatalog.Tables
    If mTable.Type = "TABLE" Then
        mTableName = mTable.Name
        With tRecset
        .Open "Select * from " & mTableName & "", dbTlgDatabase, adOpenKeyset, adLockOptimistic
        If .RecordCount > 0 Then
            RemoveNullValue tRecset
        End If
        End With
        CloseTable tRecset
    End If
Next mTable
dbTlgDatabase.CommitTrans

Set dbTlgCatalog = Nothing
CloseDataSource dbTlgDatabase

End Sub

Public Property Get dbTlgDatabaseFullPath(Optional ByVal mDbPath) As String
mDbPath = IIf(IsMissing(mDbPath) = False, mDbPath, sCmpDataPath)
dbTlgDatabaseFullPath = AddBS(mDbPath) & "Tooling.Mdb"

End Property

Public Function OpenTlgDataSource(ByRef db As ADODB.Connection, Optional ByVal mDbPath, Optional ByVal mUserId As String, Optional ByVal mPwd As String, Optional ByVal mExclusiveMode As Boolean) As Variant
mDbPath = IIf(IsMissing(mDbPath) = False, mDbPath, sCmpDataPath)
db.ConnectionString = "Provider=" & DbProvider & ";Data Source=" & dbTlgDatabaseFullPath(mDbPath)
If mExclusiveMode = True Then
    db.Mode = adModeShareExclusive
End If

db.Open
End Function

