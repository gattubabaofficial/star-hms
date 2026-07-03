Attribute VB_Name = "PayrollLibrary"
Option Explicit

Public sPyrDatabaseName As String

Rem attendance status
Public Const cATNDSTAT_ABSENT = 1
Public Const cATNDSTAT_PRESENT = 2
Public Const cATNDSTAT_WEEKLYOFF = 3
Public Const cATNDSTAT_HOLIDAY = 4
Public Const cATNDSTAT_LEAVE = 5
Public Const cATNDSTAT_HALFDAY = 6
Public Const cATNDSTAT_LIST = "Absent,Present,Weekly Off,Holiday,Leave,Half Day"
Public Const cATNDWOFF_SUNDAY = 1
Public Const cATNDWOFF_MONDAY = 2
Public Const cATNDWOFF_TUESDAY = 3
Public Const cATNDWOFF_WEDNUSDAY = 4
Public Const cATNDWOFF_THURSDAY = 5
Public Const cATNDWOFF_FRIDAY = 6
Public Const cATNDWOFF_SATURDAY = 7
Public Const cATNDWOFF_NONE = 8
Public Const cATNDWOFF_LIST = "Sunday,Monday,Tuesday,Wednusday,Thursday,Friday,Saturday"
Public Const cATNDJSTAT_CONTINUED = 1
Public Const cATNDJSTAT_DISCONTINUED = 2
Public Const cATNDJSTAT_LIST = "Continued,Discontinued"
Public Const cATNDHSTAT_ALLOWED = 1
Public Const cATNDHSTAT_DISALLOWED = 2
Public Const cATNDHSTAT_LIST = "Allowed,Disallowed"

Rem attendance shift
Public Const cATNDSFT_DAY = 1
Public Const cATNDSFT_NIGHT = 2
Public Const cATNDSFT_LIST = "Day,Night"

Public Sub InitPyrVar()
sPyrDatabaseName = "Payroll.Mdb"

End Sub

Public Sub RemovePyrNullValue(Optional ByRef FormProgStatus As frmProgressStatus)
Dim dbPyrDatabase As New ADODB.Connection, dbPyrCatalog As New ADOX.Catalog
Dim tRecset As New ADODB.Recordset
Dim mTable As ADOX.Table, mTableName As String

OpenPyrDataSource dbPyrDatabase, mExclusiveMode:=True
If dbPyrDatabase.State <> 1 Then
    ErrorBox Err.Description
    GoTo EndSub
End If
Set dbPyrCatalog.ActiveConnection = dbPyrDatabase
If Not FormProgStatus Is Nothing Then
    If FormProgStatus.Visible = True Then
        FormProgStatus.pbar1.Min = 0: FormProgStatus.pbar1.Max = dbPyrCatalog.Tables.count
    End If
End If

dbPyrDatabase.BeginTrans
For Each mTable In dbPyrCatalog.Tables
    If mTable.Type = "TABLE" Then
        If Not FormProgStatus Is Nothing Then
            If FormProgStatus.Visible = True Then
                FormProgStatus.ShowNextStatus dbPyrCatalog.ActiveConnection.Properties("Data Source Name") & vbCrLf & "Table: " & mTable.Name
            End If
        End If
        
        mTableName = mTable.Name
        With tRecset
        .Open "Select * from " & mTableName & "", dbPyrDatabase, adOpenKeyset, adLockOptimistic
        If .RecordCount > 0 Then
            RemoveNullValue tRecset
        End If
        End With
        CloseTable tRecset
    End If
Next mTable
dbPyrDatabase.CommitTrans

Rem InfoBox dbPyrCatalog.ActiveConnection.Properties("Data Source Name") & ", Done !!!"

CloseDataSource dbPyrDatabase

EndSub:
Set dbPyrCatalog = Nothing
Set dbPyrDatabase = Nothing
Exit Sub

End Sub

Public Property Get dbPyrDatabaseFullPath(Optional ByVal mDbPath) As String
mDbPath = IIf(IsMissing(mDbPath) = False, mDbPath, sCmpDataPath)
dbPyrDatabaseFullPath = AddBS(mDbPath) & sPyrDatabaseName

End Property

Public Function OpenPyrDataSource(ByRef db As ADODB.Connection, Optional ByVal mDbPath, Optional ByVal mUserId As String, Optional ByVal mPwd As String, Optional ByVal mExclusiveMode As Boolean) As Variant
mDbPath = IIf(IsMissing(mDbPath) = False, mDbPath, sCmpDataPath)
db.ConnectionString = "Provider=" & DbProvider & ";Data Source=" & dbPyrDatabaseFullPath(mDbPath)
If mExclusiveMode = True Then
    db.Mode = adModeShareExclusive
End If

db.Open
End Function

