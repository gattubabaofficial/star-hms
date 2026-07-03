Attribute VB_Name = "CommonLibrary"
Option Explicit

Public clsVType As New clsVoucherType
Public Const cCOM_VTYPE_NONE = 0
Public Const cCOM_VTYPE_OPNSTK = 1
Public Const cCOM_VTYPE_ACNTOPN = 2
Public Const cCOM_VTYPE_JOURNAL = 3
Public Const cCOM_VTYPE_STOCKJRN = 4
Public Const cCOM_VTYPE_SALES = 5
Public Const cCOM_VTYPE_PURCHASE = 6
Public Const cCOM_VTYPE_RETNINW = 7
Public Const cCOM_VTYPE_RETNOUTW = 8
Public Const cCOM_VTYPE_STOCKTRANSFER = 9
Public Const cCOM_VTYPE_STKWRITEOFF = 10
Public Const cCOM_VTYPE_RECEIPT = 11
Public Const cCOM_VTYPE_PAYMENT = 12
Public Const cCOM_VTYPE_CONTRA = 13
Public Const cCOM_VTYPE_DEBITNOTE = 14
Public Const cCOM_VTYPE_CREDIT_NOTE = 15

Rem voucher reset number basis
Public Const cVTYPE_RESETNO_NA = 0
Public Const cVTYPE_RESETNO_YEARLY = 1
Public Const cVTYPE_RESETNO_MONTHLY = 2
Public Const cVTYPE_RESETNO_DAILY = 3
Public Const cVTYPE_RESETNO_NEVER = 4
Public Const cVTYPE_RESETNO_LIST = "N/A,Yearly,Monthly,Daily,Never"

Public Type VoucherType
Type_App As String
Type_No() As Variant
Type_Name() As Variant

End Type

Public Sub InitCommonVar()
sAcDatabaseName = "Accounts.Mdb"
sStDatabaseName = "Stock.Mdb"
sGrpDatabaseName = "GrpData.Mdb"
sComDatabaseName = "Common.Mdb"
sAppOptFileName = "ApComOpt.Opt"
sUIdCodeFileName = "UIdCode.UId"
sAcsPermFileName = "AcsPerm.Acp"
sBkpOldFileName = "AppBkp.Old"

clsVType.AddType cCOM_VTYPE_NONE, "None"
clsVType.AddType cCOM_VTYPE_OPNSTK, "Stock Opening"
clsVType.AddType cCOM_VTYPE_ACNTOPN, "Account Opening"
clsVType.AddType cCOM_VTYPE_JOURNAL, "Journal"
clsVType.AddType cCOM_VTYPE_STOCKJRN, "Stock Journal"
clsVType.AddType cCOM_VTYPE_SALES, "Sales"
clsVType.AddType cCOM_VTYPE_PURCHASE, "Purchase"
clsVType.AddType cCOM_VTYPE_RETNINW, "Sales Return"
clsVType.AddType cCOM_VTYPE_RETNOUTW, "Purchase Return"
clsVType.AddType cCOM_VTYPE_STOCKTRANSFER, "Stock Transfer"
clsVType.AddType cCOM_VTYPE_STKWRITEOFF, "Stock Write off"
clsVType.AddType cCOM_VTYPE_RECEIPT, "Receipts"
clsVType.AddType cCOM_VTYPE_PAYMENT, "Payments"
clsVType.AddType cCOM_VTYPE_CONTRA, "Contra"
clsVType.AddType cCOM_VTYPE_DEBITNOTE, "Debit Note"
clsVType.AddType cCOM_VTYPE_CREDIT_NOTE, "Credit Note"

End Sub

Public Sub RemoveCmpNullValue(Optional ByRef FormProgStatus As frmProgressStatus)
Dim dbCmpDatabase As New ADODB.Connection, dbCmpCatalog As New ADOX.Catalog
Dim tRecset As New ADODB.Recordset
Dim mTable As ADOX.Table, mTableName As String

OpenCmpDataSource dbCmpDatabase, mExclusiveMode:=True
If dbCmpDatabase.State <> 1 Then
    ErrorBox Err.Description
    GoTo EndSub
End If
Set dbCmpCatalog.ActiveConnection = dbCmpDatabase
If Not FormProgStatus Is Nothing Then
    If FormProgStatus.Visible = True Then
        FormProgStatus.pbar1.Min = 0: FormProgStatus.pbar1.Max = dbCmpCatalog.Tables.count
    End If
End If

dbCmpDatabase.BeginTrans
For Each mTable In dbCmpCatalog.Tables
    If mTable.Type = "TABLE" Then
        If Not FormProgStatus Is Nothing Then
            If FormProgStatus.Visible = True Then
                FormProgStatus.ShowNextStatus dbCmpCatalog.ActiveConnection.Properties("Data Source Name") & vbCrLf & "Table: " & mTable.Name
            End If
        End If
        
        mTableName = mTable.Name
        With tRecset
        .open "Select * from " & mTableName & "", dbCmpDatabase, adOpenKeyset, adLockOptimistic
        If .RecordCount > 0 Then
            RemoveNullValue tRecset
        End If
        End With
        CloseTable tRecset
    End If
Next mTable
dbCmpDatabase.CommitTrans

Rem InfoBox dbCmpCatalog.ActiveConnection.Properties("Data Source Name") & ", Done !!!"

CloseDataSource dbCmpDatabase

EndSub:
Set dbCmpCatalog = Nothing
Set dbCmpDatabase = Nothing
Exit Sub

End Sub

Public Sub RemoveAcNullValue(Optional ByRef FormProgStatus As frmProgressStatus)
Dim dbAcDatabase As New ADODB.Connection, dbAcCatalog As New ADOX.Catalog
Dim tRecset As New ADODB.Recordset
Dim mTable As ADOX.Table, mTableName As String

OpenAcDataSource dbAcDatabase, mExclusiveMode:=True
If dbAcDatabase.State <> 1 Then
    ErrorBox Err.Description
    GoTo EndSub
End If
Set dbAcCatalog.ActiveConnection = dbAcDatabase
If Not FormProgStatus Is Nothing Then
    If FormProgStatus.Visible = True Then
        FormProgStatus.pbar1.Min = 0: FormProgStatus.pbar1.Max = dbAcCatalog.Tables.count
    End If
End If

dbAcDatabase.BeginTrans
For Each mTable In dbAcCatalog.Tables
    If mTable.Type = "TABLE" Then
        If Not FormProgStatus Is Nothing Then
            If FormProgStatus.Visible = True Then
                FormProgStatus.ShowNextStatus dbAcCatalog.ActiveConnection.Properties("Data Source Name") & vbCrLf & "Table: " & mTable.Name
            End If
        End If
        
        mTableName = mTable.Name
        With tRecset
        .open "Select * from " & mTableName & "", dbAcDatabase, adOpenKeyset, adLockOptimistic
        If .RecordCount > 0 Then
            RemoveNullValue tRecset
        End If
        End With
        CloseTable tRecset
    End If
Next mTable
dbAcDatabase.CommitTrans

Rem InfoBox dbAcCatalog.ActiveConnection.Properties("Data Source Name") & ", Done !!!"

CloseDataSource dbAcDatabase

EndSub:
Set dbAcCatalog = Nothing
Set dbAcDatabase = Nothing
Exit Sub

End Sub

Public Sub RemoveStNullValue(Optional ByRef FormProgStatus As frmProgressStatus)
Dim dbStDatabase As New ADODB.Connection, dbStCatalog As New ADOX.Catalog
Dim tRecset As New ADODB.Recordset
Dim mTable As ADOX.Table, mTableName As String

OpenStDataSource dbStDatabase, mExclusiveMode:=True
If dbStDatabase.State <> 1 Then
    ErrorBox Err.Description
    GoTo EndSub
End If
Set dbStCatalog.ActiveConnection = dbStDatabase
If Not FormProgStatus Is Nothing Then
    If FormProgStatus.Visible = True Then
        FormProgStatus.pbar1.Min = 0: FormProgStatus.pbar1.Max = dbStCatalog.Tables.count
    End If
End If

dbStDatabase.BeginTrans
For Each mTable In dbStCatalog.Tables
    If mTable.Type = "TABLE" Then
        If Not FormProgStatus Is Nothing Then
            If FormProgStatus.Visible = True Then
                FormProgStatus.ShowNextStatus dbStCatalog.ActiveConnection.Properties("Data Source Name") & vbCrLf & "Table: " & mTable.Name
            End If
        End If
        
        mTableName = mTable.Name
        With tRecset
        .open "Select * from " & mTableName & "", dbStDatabase, adOpenKeyset, adLockOptimistic
        If .RecordCount > 0 Then
            RemoveNullValue tRecset
        End If
        End With
        CloseTable tRecset
    End If
Next mTable
dbStDatabase.CommitTrans

Rem InfoBox dbStCatalog.ActiveConnection.Properties("Data Source Name") & ", Done !!!"

CloseDataSource dbStDatabase

EndSub:
Set dbStCatalog = Nothing
Set dbStDatabase = Nothing
Exit Sub

End Sub

Public Sub RemoveGrpNullValue(Optional ByRef FormProgStatus As frmProgressStatus)
Dim dbGrpDatabase As New ADODB.Connection, dbGrpCatalog As New ADOX.Catalog
Dim tRecset As New ADODB.Recordset
Dim mTable As ADOX.Table, mTableName As String

OpenGrpDataSource dbGrpDatabase, mExclusiveMode:=True
If dbGrpDatabase.State <> 1 Then
    ErrorBox Err.Description
    GoTo EndSub
End If
Set dbGrpCatalog.ActiveConnection = dbGrpDatabase
If Not FormProgStatus Is Nothing Then
    If FormProgStatus.Visible = True Then
        FormProgStatus.pbar1.Min = 0: FormProgStatus.pbar1.Max = dbGrpCatalog.Tables.count
    End If
End If

dbGrpDatabase.BeginTrans
For Each mTable In dbGrpCatalog.Tables
    If mTable.Type = "TABLE" Then
        If Not FormProgStatus Is Nothing Then
            If FormProgStatus.Visible = True Then
                FormProgStatus.ShowNextStatus dbGrpCatalog.ActiveConnection.Properties("Data Source Name") & vbCrLf & "Table: " & mTable.Name
            End If
        End If
        
        mTableName = mTable.Name
        With tRecset
        .open "Select * from " & mTableName & "", dbGrpDatabase, adOpenKeyset, adLockOptimistic
        If .RecordCount > 0 Then
            RemoveNullValue tRecset
        End If
        End With
        CloseTable tRecset
    End If
Next mTable
dbGrpDatabase.CommitTrans

Rem InfoBox dbGrpCatalog.ActiveConnection.Properties("Data Source Name") & ", Done !!!"

CloseDataSource dbGrpDatabase

EndSub:
Set dbGrpCatalog = Nothing
Set dbGrpDatabase = Nothing
Exit Sub

End Sub

Public Sub RemoveComNullValue(Optional ByRef FormProgStatus As frmProgressStatus)
Dim dbComDatabase As New ADODB.Connection, dbComCatalog As New ADOX.Catalog
Dim tRecset As New ADODB.Recordset
Dim mTable As ADOX.Table, mTableName As String

OpenComDataSource dbComDatabase, mExclusiveMode:=True
If dbComDatabase.State <> 1 Then
    ErrorBox Err.Description
    GoTo EndSub
End If
Set dbComCatalog.ActiveConnection = dbComDatabase
If Not FormProgStatus Is Nothing Then
    If FormProgStatus.Visible = True Then
        FormProgStatus.pbar1.Min = 0: FormProgStatus.pbar1.Max = dbComCatalog.Tables.count
    End If
End If

dbComDatabase.BeginTrans
For Each mTable In dbComCatalog.Tables
    If mTable.Type = "TABLE" Then
        If Not FormProgStatus Is Nothing Then
            If FormProgStatus.Visible = True Then
                FormProgStatus.ShowNextStatus dbComCatalog.ActiveConnection.Properties("Data Source Name") & vbCrLf & "Table: " & mTable.Name
            End If
        End If
        
        mTableName = mTable.Name
        With tRecset
        .open "Select * from " & mTableName & "", dbComDatabase, adOpenKeyset, adLockOptimistic
        If .RecordCount > 0 Then
            RemoveNullValue tRecset
        End If
        End With
        CloseTable tRecset
    End If
Next mTable
dbComDatabase.CommitTrans

Rem InfoBox dbComCatalog.ActiveConnection.Properties("Data Source Name") & ", Done !!!"

CloseDataSource dbComDatabase

EndSub:
Set dbComCatalog = Nothing
Set dbComDatabase = Nothing
Exit Sub

End Sub

Public Property Get dbCmpDatabaseFullPath(Optional ByVal mDbPath) As String
mDbPath = IIf(IsMissing(mDbPath) = False, mDbPath, sCmpDataPath)
dbCmpDatabaseFullPath = AddBS(mDbPath) & sCmpDatabaseName

End Property

Public Function OpenCmpDataSource(ByRef db As ADODB.Connection, Optional ByVal mDbFullPath, Optional ByVal mUserId As String, Optional ByVal mPwd As String, Optional ByVal mExclusiveMode As Boolean) As Variant
mDbFullPath = IIf(IsMissing(mDbFullPath) = False, mDbFullPath, dbCmpDatabaseFullPath())
db.ConnectionString = "Provider=" & DbProvider & ";Data Source=" & mDbFullPath
If mExclusiveMode = True Then
    db.Mode = adModeShareExclusive
End If

db.open
End Function

Public Property Get dbAcDatabaseFullPath(Optional ByVal mDbPath) As String
mDbPath = IIf(IsMissing(mDbPath) = False, mDbPath, sCmpDataPath)
dbAcDatabaseFullPath = AddBS(mDbPath) & sAcDatabaseName

End Property

Public Function OpenAcDataSource(ByRef db As ADODB.Connection, Optional ByVal mDbPath, Optional ByVal mUserId As String, Optional ByVal mPwd As String, Optional ByVal mExclusiveMode As Boolean) As Variant
mDbPath = IIf(IsMissing(mDbPath) = False, mDbPath, sCmpDataPath)
db.ConnectionString = "Provider=" & DbProvider & ";Data Source=" & dbAcDatabaseFullPath(mDbPath)
If mExclusiveMode = True Then
    db.Mode = adModeShareExclusive
End If

db.open
End Function

Public Property Get dbStDatabaseFullPath(Optional ByVal mDbPath) As String
mDbPath = IIf(IsMissing(mDbPath) = False, mDbPath, sCmpDataPath)
dbStDatabaseFullPath = AddBS(mDbPath) & sStDatabaseName

End Property

Public Function OpenStDataSource(ByRef db As ADODB.Connection, Optional ByVal mDbPath, Optional ByVal mUserId As String, Optional ByVal mPwd As String, Optional ByVal mExclusiveMode As Boolean) As Variant
mDbPath = IIf(IsMissing(mDbPath) = False, mDbPath, sCmpDataPath)
db.ConnectionString = "Provider=" & DbProvider & ";Data Source=" & dbStDatabaseFullPath(mDbPath)
If mExclusiveMode = True Then
    db.Mode = adModeShareExclusive
End If

db.open
End Function

Public Property Get dbGrpDatabaseFullPath(Optional ByVal mDbPath) As String
mDbPath = IIf(IsMissing(mDbPath) = False, mDbPath, sCmpDataPath)
dbGrpDatabaseFullPath = AddBS(mDbPath) & sGrpDatabaseName

End Property

Public Function OpenGrpDataSource(ByRef db As ADODB.Connection, Optional ByVal mDbPath, Optional ByVal mUserId As String, Optional ByVal mPwd As String, Optional ByVal mExclusiveMode As Boolean) As Variant
mDbPath = IIf(IsMissing(mDbPath) = False, mDbPath, sCmpDataPath)
db.ConnectionString = "Provider=" & DbProvider & ";Data Source=" & dbGrpDatabaseFullPath(mDbPath)
If mExclusiveMode = True Then
    db.Mode = adModeShareExclusive
End If

db.open
End Function

Public Property Get dbComDatabaseFullPath(Optional ByVal mDbPath) As String
mDbPath = IIf(IsMissing(mDbPath) = False, mDbPath, sCmpDataPath)
dbComDatabaseFullPath = AddBS(mDbPath) & sComDatabaseName

End Property

Public Function OpenComDataSource(ByRef db As ADODB.Connection, Optional ByVal mDbPath, Optional ByVal mUserId As String, Optional ByVal mPwd As String, Optional ByVal mExclusiveMode As Boolean) As Variant
mDbPath = IIf(IsMissing(mDbPath) = False, mDbPath, sCmpDataPath)
db.ConnectionString = "Provider=" & DbProvider & ";Data Source=" & dbComDatabaseFullPath(mDbPath)
If mExclusiveMode = True Then
    db.Mode = adModeShareExclusive
End If

db.open
End Function

Public Property Get AppOptFileFullPath(Optional ByVal mFilePath, Optional ByVal mFileName) As String
mFilePath = IIf(IsMissing(mFilePath) = False, mFilePath, sCmpDataPath)   ''' sAppPath
mFileName = IIf(IsMissing(mFileName) = False, mFileName, sAppOptFileName)
AppOptFileFullPath = AddBS(mFilePath) & mFileName

End Property

Public Property Get UIdCodeFileFullPath(Optional ByVal mFilePath, Optional ByVal mFileName) As String
mFilePath = IIf(IsMissing(mFilePath) = False, mFilePath, sCmpDataPath)   ''' sAppPath
mFileName = IIf(IsMissing(mFileName) = False, mFileName, sUIdCodeFileName)
UIdCodeFileFullPath = AddBS(mFilePath) & mFileName

End Property

Public Property Get AcsPermFileFullPath(Optional ByVal mFilePath, Optional ByVal mFileName) As String
mFilePath = IIf(IsMissing(mFilePath) = False, mFilePath, sCmpDataPath)       ''' sAppPath
mFileName = IIf(IsMissing(mFileName) = False, mFileName, sAcsPermFileName)
AcsPermFileFullPath = AddBS(mFilePath) & mFileName

End Property

Public Property Get AppBkpOldFileFullPath(Optional ByVal mFilePath, Optional ByVal mFileName) As String
mFilePath = IIf(IsMissing(mFilePath) = False, mFilePath, sCmpDataPath)   ''' sAppPath
mFileName = IIf(IsMissing(mFileName) = False, mFileName, sBkpOldFileName)
AppBkpOldFileFullPath = AddBS(mFilePath) & mFileName

End Property

Public Property Get CfsFileFullPath(ByVal mFileName, Optional ByVal mFilePath) As String
mFilePath = IIf(IsMissing(mFilePath) = False, mFilePath, sCmpDataPath)   ''' sAppPath
Rem mFileName = IIf(IsMissing(mFileName) = False, mFileName, sCsfFileName)
CfsFileFullPath = AddBS(mFilePath) & mFileName

End Property

Public Function IsFinYrDate(ByVal mDate As Date) As Boolean
IsFinYrDate = Between(mDate, sFinYrStartDate, sFinYrEndDate)
End Function

Public Function IsBooksDate(ByVal mDate As Date) As Boolean
IsBooksDate = Between(mDate, sCmpBookStartDate, sCmpBookEndDate)
End Function

Public Property Get DefaultEntryDate() As Date
If IsFinYrDate(sDefaultDate) = True Then
    DefaultEntryDate = sDefaultDate
ElseIf IsFinYrDate(Date) = True Then
    DefaultEntryDate = Date
ElseIf Date > sFinYrEndDate Then
    DefaultEntryDate = sFinYrEndDate
Else
    DefaultEntryDate = sFinYrStartDate
End If

End Property

Public Function GetNextVTypeNo(ByRef dbDatabase As ADODB.Connection, ByRef dbAcDatabase As ADODB.Connection, ByRef dbComDatabase As ADODB.Connection, ByVal mTableName As String, ByVal mFieldName As String, ByVal mVtmFieldName As String, ByVal mVtmFieldValue As Long, ByVal mFinYrFieldName As String, ByVal mFinYrFieldValue As Integer, ByVal mDateFieldName As String, ByVal mDateFieldValue As Date, Optional ByVal mFilterStr As String = "", Optional ByVal mModuleCode, Optional ByVal mModuleName, Optional ByVal mAcsPermFileName, Optional ByVal mDeletedVchNo) As Long
Dim rs As New ADODB.Recordset, clsVTM As New clsComMastEntry, mAcsPermNo As Integer, mVTypeNo As Long, mNetwVTypeNo As Long

RefreshDatabase dbDatabase
RefreshDatabase dbAcDatabase
Set clsVTM.dbAcDatabase = dbAcDatabase
clsVTM.blnVTypeMast = True
clsVTM.Init
clsVTM.GetData mVtmFieldValue
If IsMissing(mDeletedVchNo) = True Then
    If clsVTM.mVtmResetNoBasis_int = cVTYPE_RESETNO_YEARLY Then
        rs.open "Select top 1 " & mFieldName & " from " & mTableName _
         & " where " & mVtmFieldName & "=" & CStr(mVtmFieldValue) & " and " & mFinYrFieldName & "=" & CStr(mFinYrFieldValue) _
         & "" & IIf(mFilterStr <> "", " and " & mFilterStr & "", "") _
         & " order by " & mFieldName & " desc", dbDatabase, adOpenKeyset, adLockOptimistic
    ElseIf clsVTM.mVtmResetNoBasis_int = cVTYPE_RESETNO_MONTHLY Then
        rs.open "Select top 1 " & mFieldName & " from " & mTableName _
         & " where " & mVtmFieldName & "=" & CStr(mVtmFieldValue) & " and " & mFinYrFieldName & "=" & CStr(mFinYrFieldValue) _
         & " and " & mDateFieldName & " between #" & ToSysDate(MonthStartDate(mDateFieldValue)) & "# and #" & ToSysDate(MonthEndDate(mDateFieldValue)) & "#" _
         & IIf(mFilterStr <> "", " and " & mFilterStr & "", "") _
         & " order by " & mFieldName & " desc", dbDatabase, adOpenKeyset, adLockOptimistic
    ElseIf clsVTM.mVtmResetNoBasis_int = cVTYPE_RESETNO_DAILY Then
        rs.open "Select top 1 " & mFieldName & " from " & mTableName _
         & " where " & mVtmFieldName & "=" & CStr(mVtmFieldValue) & " and " & mFinYrFieldName & "=" & CStr(mFinYrFieldValue) _
         & " and " & mDateFieldName & "=#" & ToSysDate(mDateFieldValue) & "#" _
         & IIf(mFilterStr <> "", " and " & mFilterStr & "", "") _
         & " order by " & mFieldName & " desc", dbDatabase, adOpenKeyset, adLockOptimistic
    Else    ' case of none and never
        rs.open "Select top 1 " & mFieldName & " from " & mTableName _
         & " where " & mVtmFieldName & "=" & CStr(mVtmFieldValue) _
         & IIf(mFilterStr <> "", " and " & mFilterStr & "", "") _
         & " order by " & mFieldName & " desc", dbDatabase, adOpenKeyset, adLockOptimistic
    End If
    If rs.EOF = False Then
        If rs.fields(mFieldName) + 1 >= clsVTM.mVtmStartNo_lng Then
            mVTypeNo = rs.fields(mFieldName) + 1
        Else
            mVTypeNo = clsVTM.mVtmStartNo_lng
        End If
    Else
        mVTypeNo = clsVTM.mVtmStartNo_lng
    End If
    CloseTable rs
Else
    mVTypeNo = mDeletedVchNo
End If
GetNextVTypeNo = mVTypeNo

''If GetAccessPerm(mAcsPermNo, mAcsPermFileName) = True Then
''    mNetwVTypeNo = GenNetwVchNo(dbComDatabase, mVtmFieldValue, mVTypeNo, mDateFieldValue, mModuleCode, mModuleName, clsVTM.mVtmResetNoBasis_int)
''    GetNextVTypeNo = mNetwVTypeNo
''    Close #mAcsPermNo
''Else
''    ErrorBox "Access Permission Denied !!!"
''    GetNextVTypeNo = mVTypeNo
''End If
Set clsVTM = Nothing

End Function

Public Function ChkIsDuplVTypeNo(ByRef dbDatabase As ADODB.Connection, ByRef dbAcDatabase As ADODB.Connection, ByVal mTableName As String, ByVal mChkFieldName As String, ByVal mChkFieldValue As Long, ByVal mKeyFieldName As String, ByVal mKeyFieldValue As Long, ByVal mVtmFieldName As String, ByVal mVtmFieldValue As Long, ByVal mFinYrFieldName As String, ByVal mFinYrFieldValue As Integer, ByVal mDateFieldName As String, ByVal mDateFieldValue As Date, Optional ByVal mFilterStr As String = "") As Boolean
Dim rs As New ADODB.Recordset, clsVTM As New clsComMastEntry

RefreshDatabase dbDatabase
RefreshDatabase dbAcDatabase
Set clsVTM.dbAcDatabase = dbAcDatabase
clsVTM.blnVTypeMast = True
clsVTM.Init
clsVTM.GetData mVtmFieldValue
If clsVTM.mVtmResetNoBasis_int = cVTYPE_RESETNO_YEARLY Then
    rs.open "Select " & mChkFieldName & "," & mDateFieldName & " from " & mTableName _
     & " where " & mChkFieldName & "=" & CStr(mChkFieldValue) & " and " & mKeyFieldName & "<>" & CStr(mKeyFieldValue) _
     & " and " & mVtmFieldName & "=" & CStr(mVtmFieldValue) & " and " & mFinYrFieldName & "=" & CStr(mFinYrFieldValue) _
     & IIf(mFilterStr <> "", " and " & mFilterStr & "", "") _
     & " order by " & mChkFieldName & "", dbDatabase, adOpenKeyset, adLockOptimistic
ElseIf clsVTM.mVtmResetNoBasis_int = cVTYPE_RESETNO_MONTHLY Then
    rs.open "Select " & mChkFieldName & "," & mDateFieldName & " from " & mTableName _
     & " where " & mChkFieldName & "=" & CStr(mChkFieldValue) & " and " & mKeyFieldName & "<>" & CStr(mKeyFieldValue) _
     & " and " & mVtmFieldName & "=" & CStr(mVtmFieldValue) & " and " & mFinYrFieldName & "=" & CStr(mFinYrFieldValue) _
     & " and " & mDateFieldName & " between #" & CStr(ToSysDate(MonthStartDate(mDateFieldValue))) & "# and #" & CStr(ToSysDate(MonthEndDate(mDateFieldValue))) & "#" _
     & IIf(mFilterStr <> "", " and " & mFilterStr & "", "") _
     & " order by " & mChkFieldName & "", dbDatabase, adOpenKeyset, adLockOptimistic
ElseIf clsVTM.mVtmResetNoBasis_int = cVTYPE_RESETNO_DAILY Then
    rs.open "Select " & mChkFieldName & "," & mDateFieldName & " from " & mTableName _
     & " where " & mChkFieldName & "=" & CStr(mChkFieldValue) & " and " & mKeyFieldName & "<>" & CStr(mKeyFieldValue) _
     & " and " & mVtmFieldName & "=" & CStr(mVtmFieldValue) & " and " & mFinYrFieldName & "=" & CStr(mFinYrFieldValue) _
     & " and " & mDateFieldName & "=#" & CStr(ToSysDate(mDateFieldValue)) & "#" _
     & IIf(mFilterStr <> "", " and " & mFilterStr & "", "") _
     & " order by " & mChkFieldName & "", dbDatabase, adOpenKeyset, adLockOptimistic
Else    ' case of none and never
    rs.open "Select " & mChkFieldName & "," & mDateFieldName & " from " & mTableName _
     & " where " & mChkFieldName & "=" & CStr(mChkFieldValue) & " and " & mKeyFieldName & "<>" & CStr(mKeyFieldValue) _
     & " and " & mVtmFieldName & "=" & CStr(mVtmFieldValue) _
     & IIf(mFilterStr <> "", " and " & mFilterStr & "", "") _
     & " order by " & mChkFieldName & "", dbDatabase, adOpenKeyset, adLockOptimistic
End If
If rs.RecordCount > 0 Then
    ChkIsDuplVTypeNo = True
    ErrorBox "Duplicate Entry No. on dated " & Dtoc(rs.fields(mDateFieldName)) & " !!!"
Else
    ChkIsDuplVTypeNo = False
End If
CloseTable rs

End Function

Public Function GetUIdCode(ByVal mProcess As String, Optional ByVal mUIdFileName, Optional ByVal mAcsPermFileName) As Long
Dim fhand As Integer, mAcsRef As String, mUIdCode As Long, mAcsPermNo As Integer, mRetryCount As Integer

On Error GoTo errhand
GetUIdCode = 0
If GetAccessPerm(mAcsPermNo, mRetryCount, mAcsPermFileName) = True And mRetryCount = 0 Then
    If FileExist(UIdCodeFileFullPath(mFileName:=mUIdFileName)) = False Then
        fhand = FreeFile
        Open UIdCodeFileFullPath(mFileName:=mUIdFileName) For Output Lock Read Write As #fhand
        Write #fhand, 1, sWinComputerName & "," & sWinUserName & "," & CStr(Date) & "-" & CStr(Time) & "," & mProcess
        Close #fhand
    End If
    fhand = FreeFile
    Open UIdCodeFileFullPath(mFileName:=mUIdFileName) For Input Lock Read Write As #fhand
    Input #fhand, mUIdCode, mAcsRef
    Close #fhand
    
    mUIdCode = mUIdCode + 1
    fhand = FreeFile
    Open UIdCodeFileFullPath(mFileName:=mUIdFileName) For Output Lock Read Write As #fhand
    Write #fhand, mUIdCode, sWinComputerName & "," & sWinUserName & "," & CStr(Date) & "-" & CStr(Time) & "," & mProcess
    Close #fhand
    
    GetUIdCode = mUIdCode
    Close #mAcsPermNo
Else
    ErrorBox "Access Permission Denied !!!"
End If
Exit Function

errhand:
ErrorBox Err.Description & vbCrLf & Err.Source
Resume Next
 
End Function

Public Function GetAccessPerm(ByRef mAcsPermNo As Integer, ByRef mRetryCount As Integer, Optional ByVal mAcsPermFileName) As Boolean
Dim fhand As Integer, mAccessed As Boolean, mCounter As Integer

GetAccessPerm = False
mAccessed = False
mCounter = 0
fhand = FreeFile
On Error GoTo errhand
Do While mAccessed = False
    fhand = FreeFile
    mAccessed = True
    Open AcsPermFileFullPath(mFileName:=mAcsPermFileName) For Output Lock Read Write As #fhand
    If mAccessed = True Then
        Write #fhand, sWinComputerName & "," & sWinUserName & "," & CStr(Date) & "-" & CStr(Time)
        GetAccessPerm = True
        mAcsPermNo = fhand
    End If
Loop
Exit Function

errhand:
mRetryCount = mRetryCount + 1
mCounter = mCounter + 1
mAccessed = False
If mCounter > 1000 Then
    If MsgBox(Err.Description & " Retry", vbYesNo + vbQuestion + vbDefaultButton1) = vbYes Then
        mCounter = 0
        mRetryCount = 0 ''' 04-06-2014
        Resume Next
    Else
        Exit Function
    End If
Else
    Resume Next
End If

End Function

Private Function GenNetwVchNo(ByRef dbComDatabase As ADODB.Connection, ByVal mVtmCode As Long, ByVal mVchNo As Long, ByVal mVchDate As Date, ByVal mModuleCode As Long, ByVal mModuleName As String, Optional mNoResetMethod As Integer = cVTYPE_RESETNO_NA) As Long
Dim rs As New ADODB.Recordset, mSucceded As Boolean, mSameVchNoFound As Boolean

mSucceded = False
RefreshDatabase dbComDatabase

rs.open "Select * from NetwVchNoLog where NvlCmpCode=" & CStr(sFinYrCmpCode) & " and NvlVtmCode=" & CStr(mVtmCode) _
 & " and NvlVchDate=#" & CStr(ToSysDate(mVchDate)) & "#" & " and NvlVchNo=" & CStr(mVchNo) _
 & " and NvlLoginCode=" & CStr(sLoginUIdCode) & " and NvlUsrCode=" & CStr(sLoginUserCode) _
 & " and NvlModuleCode=" & CStr(mModuleCode) & " and NvlModuleName='" & mModuleName & "'" _
 & " and NvlSysComputer='" & sWinComputerName & "'" & " and NvlSysUser='" & sWinUserName & "'" _
 , dbComDatabase, adOpenKeyset, adLockOptimistic
If rs.RecordCount > 0 Then
    GenNetwVchNo = mVchNo
    mSucceded = True
End If
CloseTable rs
If mSucceded = False Then
    If mNoResetMethod = cVTYPE_RESETNO_YEARLY Then
        rs.open "Select * from NetwVchNoLog where NvlCmpCode=" & CStr(sFinYrCmpCode) & " and NvlVtmCode=" & CStr(mVtmCode) _
         & " and (NvlLoginCode=" & CStr(sLoginUIdCode) & " or NvlUsrCode=" & CStr(sLoginUserCode) _
         & " or NvlModuleCode=" & CStr(mModuleCode) _
         & " or NvlSysComputer='" & sWinComputerName & "'" & " or NvlSysUser='" & sWinUserName & "')" _
         , dbComDatabase, adOpenKeyset, adLockOptimistic
    ElseIf mNoResetMethod = cVTYPE_RESETNO_MONTHLY Then
        rs.open "Select * from NetwVchNoLog where NvlCmpCode=" & CStr(sFinYrCmpCode) & " and NvlVtmCode=" & CStr(mVtmCode) _
         & " and NvlVchDate between #" & CStr(ToSysDate(MonthStartDate(mVchDate))) & "# and #" & CStr(ToSysDate(MonthEndDate(mVchDate))) & "#" _
         & " and (NvlLoginCode=" & CStr(sLoginUIdCode) & " or NvlUsrCode=" & CStr(sLoginUserCode) _
         & " or NvlModuleCode=" & CStr(mModuleCode) _
         & " or NvlSysComputer='" & sWinComputerName & "'" & " or NvlSysUser='" & sWinUserName & "')" _
         , dbComDatabase, adOpenKeyset, adLockOptimistic
    ElseIf mNoResetMethod = cVTYPE_RESETNO_DAILY Then
        rs.open "Select * from NetwVchNoLog where NvlCmpCode=" & CStr(sFinYrCmpCode) & " and NvlVtmCode=" & CStr(mVtmCode) _
         & " and NvlVchDate=#" & CStr(ToSysDate(mVchDate)) & "#" _
         & " and (NvlLoginCode=" & CStr(sLoginUIdCode) & " or NvlUsrCode=" & CStr(sLoginUserCode) _
         & " or NvlModuleCode=" & CStr(mModuleCode) _
         & " or NvlSysComputer='" & sWinComputerName & "'" & " or NvlSysUser='" & sWinUserName & "')" _
         , dbComDatabase, adOpenKeyset, adLockOptimistic
    Else
        rs.open "Select * from NetwVchNoLog where NvlVtmCode=" & CStr(mVtmCode) _
         & " and (NvlLoginCode=" & CStr(sLoginUIdCode) & " or NvlUsrCode=" & CStr(sLoginUserCode) _
         & " or NvlModuleCode=" & CStr(mModuleCode) _
         & " or NvlSysComputer='" & sWinComputerName & "'" & " or NvlSysUser='" & sWinUserName & "')" _
         , dbComDatabase, adOpenKeyset, adLockOptimistic
    End If
    If rs.RecordCount > 0 Then
        Do While rs.EOF = False And mSucceded = False
            If (Date > rs.fields("NvlLogDate")) Or (TimeToMin(Time$) - rs.fields("NvlLogTime") > 5) Then
                AlertBox "Expired Voucher Nos. Found !!!"
                GenNetwVchNo = rs.fields("NvlVchNo")
                mSucceded = True
                
                dbComDatabase.BeginTrans
                rs.fields("NvlVchDate") = mVchDate
                rs.fields("NvlLogDate") = Date
                rs.fields("NvlLogTime") = TimeToMin(Time$)
                rs.fields("NvlLoginCode") = sLoginUIdCode
                rs.fields("NvlUsrCode") = sLoginUserCode
                rs.fields("NvlModuleCode") = mModuleCode
                rs.fields("NvlModuleName") = mModuleName
                rs.fields("NvlSysComputer") = sWinComputerName
                rs.fields("NvlSysUser") = sWinUserName
                rs.Update
                dbComDatabase.CommitTrans
            End If
            rs.MoveNext
        Loop
    End If
    CloseTable rs
End If
If mSucceded = False Then
    If mNoResetMethod = cVTYPE_RESETNO_YEARLY Then
        rs.open "Select * from NetwVchNoLog where NvlCmpCode=" & CStr(sFinYrCmpCode) & " and NvlVtmCode=" & CStr(mVtmCode) _
         , dbComDatabase, adOpenKeyset, adLockOptimistic
    ElseIf mNoResetMethod = cVTYPE_RESETNO_MONTHLY Then
        rs.open "Select * from NetwVchNoLog where NvlCmpCode=" & CStr(sFinYrCmpCode) & " and NvlVtmCode=" & CStr(mVtmCode) _
         & " and NvlVchDate between #" & CStr(ToSysDate(MonthStartDate(mVchDate))) & "# and #" & CStr(ToSysDate(MonthEndDate(mVchDate))) & "#" _
         , dbComDatabase, adOpenKeyset, adLockOptimistic
    ElseIf mNoResetMethod = cVTYPE_RESETNO_DAILY Then
        rs.open "Select * from NetwVchNoLog where NvlCmpCode=" & CStr(sFinYrCmpCode) & " and NvlVtmCode=" & CStr(mVtmCode) _
         & " and NvlVchDate=#" & CStr(ToSysDate(mVchDate)) & "#" _
         , dbComDatabase, adOpenKeyset, adLockOptimistic
    Else
        rs.open "Select * from NetwVchNoLog where NvlVtmCode=" & CStr(mVtmCode) _
         , dbComDatabase, adOpenKeyset, adLockOptimistic
    End If
    If rs.RecordCount > 0 Then
        Do While rs.EOF = False And mSucceded = False
            If (Date > rs.fields("NvlLogDate")) Or (TimeToMin(Time$) - rs.fields("NvlLogTime") > 5) Then
                AlertBox "Expired Voucher Nos. Found !!!"
                GenNetwVchNo = rs.fields("NvlVchNo")
                mSucceded = True
                
                dbComDatabase.BeginTrans
                rs.fields("NvlVchDate") = mVchDate
                rs.fields("NvlLogDate") = Date
                rs.fields("NvlLogTime") = TimeToMin(Time$)
                rs.fields("NvlLoginCode") = sLoginUIdCode
                rs.fields("NvlUsrCode") = sLoginUserCode
                rs.fields("NvlModuleCode") = mModuleCode
                rs.fields("NvlModuleName") = mModuleName
                rs.fields("NvlSysComputer") = sWinComputerName
                rs.fields("NvlSysUser") = sWinUserName
                rs.Update
                dbComDatabase.CommitTrans
            End If
            rs.MoveNext
        Loop
    End If
    CloseTable rs
End If
If mSucceded = False Then
    Do
        If mNoResetMethod = cVTYPE_RESETNO_YEARLY Then
            rs.open "Select * from NetwVchNoLog where NvlCmpCode=" & CStr(sFinYrCmpCode) & " and NvlVtmCode=" & CStr(mVtmCode) _
             & " and NvlVchNo=" & CStr(mVchNo) _
             , dbComDatabase, adOpenKeyset, adLockOptimistic
        ElseIf mNoResetMethod = cVTYPE_RESETNO_MONTHLY Then
            rs.open "Select * from NetwVchNoLog where NvlCmpCode=" & CStr(sFinYrCmpCode) & " and NvlVtmCode=" & CStr(mVtmCode) _
             & " and NvlVchNo=" & CStr(mVchNo) _
             & " and NvlVchDate between #" & CStr(ToSysDate(MonthStartDate(mVchDate))) & "# and #" & CStr(ToSysDate(MonthEndDate(mVchDate))) & "#" _
             , dbComDatabase, adOpenKeyset, adLockOptimistic
        ElseIf mNoResetMethod = cVTYPE_RESETNO_DAILY Then
            rs.open "Select * from NetwVchNoLog where NvlCmpCode=" & CStr(sFinYrCmpCode) & " and NvlVtmCode=" & CStr(mVtmCode) _
             & " and NvlVchNo=" & CStr(mVchNo) _
             & " and NvlVchDate=#" & CStr(ToSysDate(mVchDate)) & "#" _
             , dbComDatabase, adOpenKeyset, adLockOptimistic
        Else
            rs.open "Select * from NetwVchNoLog where NvlVtmCode=" & CStr(mVtmCode) _
             & " and NvlVchNo=" & CStr(mVchNo) _
             , dbComDatabase, adOpenKeyset, adLockOptimistic
        End If
        mSameVchNoFound = (rs.RecordCount > 0)
        If mSameVchNoFound = True Then
            mVchNo = mVchNo + 1
        End If
        CloseTable rs
    Loop While mSameVchNoFound = True
    
    dbComDatabase.BeginTrans
    rs.open "Select * from NetwVchNoLog where NvlCode=-0.1", dbComDatabase, adOpenKeyset, adLockOptimistic
    rs.AddNew
    Rem rs.Fields("NvlCode") = AutoNumber
    rs.fields("NvlVtmCode") = mVtmCode
    rs.fields("NvlVchDate") = mVchDate
    rs.fields("NvlVchNo") = mVchNo
    rs.fields("NvlCmpCode") = sFinYrCmpCode
    rs.fields("NvlLogDate") = Date
    rs.fields("NvlLogTime") = TimeToMin(Time$)
    ' ----------
    rs.fields("NvlLoginCode") = sLoginUIdCode
    rs.fields("NvlUsrCode") = sLoginUserCode
    rs.fields("NvlModuleCode") = mModuleCode
    rs.fields("NvlModuleName") = mModuleName
    rs.fields("NvlSysComputer") = sWinComputerName
    rs.fields("NvlSysUser") = sWinUserName
    rs.Update
    dbComDatabase.CommitTrans
    
    GenNetwVchNo = rs.fields("NvlVchNo")
    mSucceded = True

    CloseTable rs
End If

End Function

Public Sub RemoveNetwVchNo(ByRef dbComDatabase As ADODB.Connection, ByVal mVtmCode As Long, ByVal mVchNo As Long, ByVal mVchDate As Date, ByVal mModuleCode As Long, ByVal mModuleName As String, Optional ByVal mShowFailedMsg As Boolean = True)
Dim rs As New ADODB.Recordset

RefreshDatabase dbComDatabase
rs.open "Select * from NetwVchNoLog where NvlCmpCode=" & CStr(sFinYrCmpCode) & " and NvlVtmCode=" & CStr(mVtmCode) _
    & " and NvlVchDate=#" & CStr(ToSysDate(mVchDate)) & "#" & " and NvlVchNo=" & CStr(mVchNo) _
    & " and NvlLoginCode=" & CStr(sLoginUIdCode) & " and NvlUsrCode=" & CStr(sLoginUserCode) _
    & " and NvlModuleCode=" & CStr(mModuleCode) & " and NvlModuleName='" & mModuleName & "'" _
    & " and NvlSysComputer='" & sWinComputerName & "'" & " and NvlSysUser='" & sWinUserName & "'" _
    , dbComDatabase, adOpenKeyset, adLockOptimistic
If rs.RecordCount > 0 Then
    dbComDatabase.BeginTrans
    rs.Delete
    rs.Update
    rs.MoveNext
    dbComDatabase.CommitTrans
Else
    If mShowFailedMsg = True Then
        ErrorBox "RemoveNetwVchNo_#704_[Failed]"
    End If
End If
CloseTable rs

End Sub

Public Function ChkIsExistVTypeNo(ByRef dbDatabase As ADODB.Connection, ByVal mTableName As String, ByVal mChkFieldName As String, ByVal mChkFieldValue As Long, ByVal mVtmFieldName As String, ByVal mVtmFieldValue As Long, ByVal mFinYrFieldName As String, ByVal mFinYrFieldValue As Integer, Optional ByVal mFilterStr As String = "") As Boolean
Dim rs As New ADODB.Recordset, clsVTM As New clsComMastEntry

RefreshDatabase dbDatabase

rs.open "Select " & mChkFieldName & " from " & mTableName _
 & " where " & mChkFieldName & "=" & CStr(mChkFieldValue) _
 & " and " & mVtmFieldName & "=" & CStr(mVtmFieldValue) & " and " & mFinYrFieldName & "=" & CStr(mFinYrFieldValue) _
 & IIf(mFilterStr <> "", " and " & mFilterStr & "", "") _
 & " order by " & mChkFieldName & "", dbDatabase, adOpenKeyset, adLockOptimistic

If rs.RecordCount = 0 Then
    ChkIsExistVTypeNo = False
Else
    ChkIsExistVTypeNo = True
End If
CloseTable rs

End Function

Public Sub AddPrinterToCombo(ByRef mCmbObj As ComboBox)
Dim mPrinter As Printer, mDefaultPrinterIndex As Integer

mDefaultPrinterIndex = -1

mCmbObj.Clear
For Each mPrinter In Printers
    mCmbObj.AddItem mPrinter.DeviceName & Space(100) & mPrinter.Port
    If mPrinter.DeviceName = Printer.DeviceName Then
        mDefaultPrinterIndex = mCmbObj.NewIndex
    End If
Next mPrinter
If mCmbObj.ListCount > 0 Then
    If mDefaultPrinterIndex > -1 Then
        mCmbObj.ListIndex = mDefaultPrinterIndex
    Else
        mCmbObj.ListIndex = 0
    End If
End If

End Sub

Public Sub AddPrintDestToCombo(ByRef mCmbObj As ComboBox)

mCmbObj.Clear
mCmbObj.AddItem "Print to Printer"
mCmbObj.AddItem "Screen Preview"
mCmbObj.ListIndex = 0

End Sub

Public Function GetLastValueFromTableCol(ByRef cnn As ADODB.Connection, ByVal mTableName As String, ByVal mColumnName As String, ByVal mOrderByColName As String, Optional ByVal mFilterCond As String, Optional ByVal mRtnDefValue As Variant) As Variant
Dim mRtnval As Variant, tRecset As New ADODB.Recordset

mRtnval = mRtnDefValue
With tRecset
.open "Select top 1 " & mColumnName & " from " & mTableName & IIf(mFilterCond <> "", " where " & mFilterCond, "") & " order by " & IIf(mOrderByColName <> "", mOrderByColName & IIf(InStr(UCase(mOrderByColName), UCase(" desc")) = 0, " desc", ""), mColumnName & " desc"), cnn, adOpenKeyset, adLockOptimistic
If .EOF = False Then
    mRtnval = .fields(mColumnName)
End If
End With
CloseTable tRecset

GetLastValueFromTableCol = mRtnval

End Function

Public Function GetSubVchTypeList(ByRef cnn As ADODB.Connection, ByVal mSysVchType As Integer, Optional ByVal mRtnDefValue As String) As String
Dim mRtnval As String, tRecset As New ADODB.Recordset

With tRecset
.open "Select * from VTypMast where VtmSysCode = " & CStr(mSysVchType) & " order by VtmCode", cnn, adOpenKeyset, adLockOptimistic
If .EOF = False Then
    Do While .EOF = False
        mRtnval = mRtnval & CStr(.fields("VtmCode")) & ","
        .MoveNext
    Loop
    mRtnval = Left(mRtnval, Len(mRtnval) - 1)
Else
    mRtnval = mRtnDefValue
End If
End With
CloseTable tRecset

GetSubVchTypeList = mRtnval

End Function

Public Function GetValueFromTableCol(ByRef cnn As ADODB.Connection, ByVal mTableName As String, ByVal mColumnName As String, ByVal mFilterCond As String, Optional ByVal mRtnDefValue As Variant) As Variant
Dim mRtnval As Variant, tRecset As ADODB.Recordset

mRtnval = mRtnDefValue

Set tRecset = cnn.Execute("Select top 1 " & mColumnName & " from " & mTableName & " where " & mFilterCond & "")
With tRecset
If .EOF = False Then
    mRtnval = .fields(mColumnName)
End If
End With
CloseTable tRecset

GetValueFromTableCol = mRtnval

End Function

Public Sub ChkCustomForm(ByRef frm1 As Form, ByVal mFileFullPathName As String)
Dim fhand As Integer, cntl As Object, mOptTitle As String, mOptValue As Variant

On Error GoTo errhand
If FileExist(mFileFullPathName) = False Then
    fhand = FreeFile
    Open mFileFullPathName For Output As #fhand
    For Each cntl In frm1.Controls
        If TypeOf cntl Is TextBox Or TypeOf cntl Is ComboBox Or TypeOf cntl Is ListBox Or TypeOf cntl Is CheckBox Then
            If cntl.TabStop = True Then
                Write #fhand, cntl.Name & "." & "TabStop", cntl.TabStop
            End If
        End If
    Next cntl
    Close #fhand
End If

fhand = FreeFile
Open mFileFullPathName For Input As #fhand
Do While EOF(fhand) = False
    Input #fhand, mOptTitle, mOptValue
    mOptTitle = UCase(mOptTitle)
    
    For Each cntl In frm1.Controls
        If TypeOf cntl Is TextBox Or TypeOf cntl Is ComboBox Or TypeOf cntl Is ListBox Or TypeOf cntl Is CheckBox Then
            If UCase(cntl.Name & "." & "TabStop") = mOptTitle Then
                If cntl.TabStop <> mOptValue Then
                    cntl.TabStop = mOptValue
                End If
            End If
        End If
    Next cntl
Loop
Close #fhand
Exit Sub

errhand:
MsgBox "Custom Form Settings" & vbCrLf & Err.Description, vbCritical, "Error !!!"
Resume Next

End Sub

Public Sub AutoInitStationFromArea(ByRef cnn As ADODB.Connection, ByRef txtStnName As TextBox, ByRef fcmbStnName As clsComFlexSearch, ByVal mAraCode As Long)
Dim tRecset As New ADODB.Recordset

With tRecset
.open "Select * from AreaMast where AraCode=" & CStr(mAraCode) & "", cnn, adOpenKeyset, adLockOptimistic
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

Public Sub ChkEntryModeSign(ByRef mCmbObj As ComboBox)
If mCmbObj.ListIndex = cFORM_ADDMODE Then
    mCmbObj.BackColor = vbCyan
ElseIf mCmbObj.ListIndex = cFORM_EDITMODE Then
    mCmbObj.BackColor = vbGreen
ElseIf mCmbObj.ListIndex = cFORM_SMRYMODE Then
    mCmbObj.BackColor = vbWindowBackground
Else
    mCmbObj.BackColor = vbBlack
End If

End Sub
