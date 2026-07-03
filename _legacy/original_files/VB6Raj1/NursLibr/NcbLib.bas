Attribute VB_Name = "NcbLibrary"

Option Explicit

Public sNcbDatabaseName As String

'Public Const cNCB_VTYPE_GENERAL = 101
'Public Const cNCB_VTYPE_STUDOPNSTK = 102
'Public Const cNCB_VTYPE_SELFOPNSTK = 103
'Public Const cNCB_VTYPE_ISSUTOSTUD = 104
'Public Const cNCB_VTYPE_RCPTFROMSTUD = 105
'Public Const cNCB_VTYPE_STKWRITEOFF = 106

Rem Student Reference
Public Const cSDTREFRELA_LIST = "C/o,S/o,D/o,W/o,F/o,M/o"
Public Const cSDTSEX_LIST = "Male,Female,None"

Public Sub InitNcbVar()
sNcbDatabaseName = "NrsCgLbr.Mdb"
' --------------------------------------------
'clsVType.AddType cNCB_VTYPE_GENERAL, "General"
'clsVType.AddType cNCB_VTYPE_STUDOPNSTK, "Student Opn.Stock"
'clsVType.AddType cNCB_VTYPE_SELFOPNSTK, "Store (Self) Opn.Stock"
'clsVType.AddType cNCB_VTYPE_ISSUTOSTUD, "Issue to Students"
'clsVType.AddType cNCB_VTYPE_RCPTFROMSTUD, "Receipts from Students"
'clsVType.AddType cNCB_VTYPE_STKWRITEOFF, "Stock Write off"

End Sub

Public Sub RemoveNcbNullValue(Optional ByRef FormProgStatus As frmProgressStatus)
Dim dbNcbDatabase As New ADODB.Connection, dbNcbCatalog As New ADOX.Catalog
Dim tRecset As New ADODB.Recordset
Dim mTable As ADOX.Table, mTableName As String

OpenNcbDataSource dbNcbDatabase, mExclusiveMode:=True
If dbNcbDatabase.State <> 1 Then
    ErrorBox Err.Description
    GoTo EndSub
End If
Set dbNcbCatalog.ActiveConnection = dbNcbDatabase
If Not FormProgStatus Is Nothing Then
    If FormProgStatus.Visible = True Then
        FormProgStatus.pbar1.Min = 0: FormProgStatus.pbar1.Max = dbNcbCatalog.Tables.count
    End If
End If

dbNcbDatabase.BeginTrans
For Each mTable In dbNcbCatalog.Tables
    If mTable.Type = "TABLE" Then
        If Not FormProgStatus Is Nothing Then
            If FormProgStatus.Visible = True Then
                FormProgStatus.ShowNextStatus dbNcbCatalog.ActiveConnection.Properties("Data Source Name") & vbCrLf & "Table: " & mTable.Name
            End If
        End If
        
        mTableName = mTable.Name
        With tRecset
        .Open "Select * from " & mTableName & "", dbNcbDatabase, adOpenKeyset, adLockOptimistic
        If .RecordCount > 0 Then
            RemoveNullValue tRecset
        End If
        End With
        CloseTable tRecset
    End If
Next mTable
dbNcbDatabase.CommitTrans

Rem InfoBox dbNcbCatalog.ActiveConnection.Properties("Data Source Name") & ", Done !!!"

CloseDataSource dbNcbDatabase

EndSub:
Set dbNcbCatalog = Nothing
Set dbNcbDatabase = Nothing
Exit Sub

End Sub

Public Property Get dbNcbDatabaseFullPath(Optional ByVal mDbPath) As String
mDbPath = IIf(IsMissing(mDbPath) = False, mDbPath, sCmpDataPath)
dbNcbDatabaseFullPath = AddBS(mDbPath) & sNcbDatabaseName

End Property

Public Function OpenNcbDataSource(ByRef db As ADODB.Connection, Optional ByVal mDbPath, Optional ByVal mUserId As String, Optional ByVal mPwd As String, Optional ByVal mExclusiveMode As Boolean) As Variant
mDbPath = AddBS(IIf(IsMissing(mDbPath) = False, mDbPath, sCmpDataPath))
db.ConnectionString = "Provider=" & DbProvider & ";Data Source=" & dbNcbDatabaseFullPath(mDbPath)
If mExclusiveMode = True Then
    db.Mode = adModeShareExclusive
End If

db.Open
End Function



