VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "clsDataStru"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Rem Important Notes
Rem there cannot be autoincreament no. applied on two fields at the same time, so be cautious while shifting autoincreament feature to other fields
Rem type, defined size, and nullable cannot be changed on existing column using adox, user alter table alter column instead
Rem only change/edition in text column size has been permitted, and nowhere type,size has been changed

Option Explicit

Public FormProgStatus As frmProgressStatus
Dim mTableStru As adTableStru
Dim mViewStru As adViewStru
Dim mLinkStru As adLinkStru

Public Function GetTableStru(ByRef aTableSru As Variant)
Rem how to return this type to back
End Function

Public Sub ClearTableStru()
mTableStru.TableName = ""
mTableStru.ColumnName = Array()
mTableStru.ColumnType = Array()
mTableStru.ColumnWidth = Array()
mTableStru.ColumnRequired = Array()
mTableStru.AllowZeroLength = Array()
mTableStru.AutoIncrement = Array()
mTableStru.ColumnStatus = Array()
mTableStru.PrimaryKey = ""
mTableStru.IndexName = Array()
mTableStru.IndexUnique = Array()
mTableStru.IndexColumn1 = Array()
mTableStru.IndexColumn2 = Array()
mTableStru.IndexColumn3 = Array()
mTableStru.IndexColumn4 = Array()
mTableStru.IndexColumn5 = Array()
mTableStru.IndexColumn6 = Array()
mTableStru.IndexColumn7 = Array()
mTableStru.IndexColumn8 = Array()
mTableStru.IndexColumn9 = Array()
mTableStru.IndexStatus = Array()
mTableStru.CreateStatus = 0

End Sub

Public Sub ClearViewStru()
mViewStru.ViewName = ""
mViewStru.CommandStr = ""
mViewStru.CreateStatus = 0

End Sub

Public Sub ClearLinkStru()
mLinkStru.TableName = Array()
mLinkStru.LinkName = Array()
mLinkStru.dbSource = Array()
mLinkStru.LinkStatus = Array()

End Sub

Public Sub AddColumn()
AddToArray mTableStru.ColumnName, Empty
AddToArray mTableStru.ColumnType, Empty
AddToArray mTableStru.ColumnWidth, Empty
AddToArray mTableStru.ColumnRequired, False
AddToArray mTableStru.AllowZeroLength, True
AddToArray mTableStru.AutoIncrement, Empty
AddToArray mTableStru.ColumnStatus, cREC_NEW

End Sub

Public Sub AddIndex()
AddToArray mTableStru.IndexName, Empty
AddToArray mTableStru.IndexUnique, Empty
AddToArray mTableStru.IndexStatus, cREC_NEW
AddToArray mTableStru.IndexColumn1, Empty
AddToArray mTableStru.IndexColumn2, Empty
AddToArray mTableStru.IndexColumn3, Empty
AddToArray mTableStru.IndexColumn4, Empty
AddToArray mTableStru.IndexColumn5, Empty
AddToArray mTableStru.IndexColumn6, Empty
AddToArray mTableStru.IndexColumn7, Empty
AddToArray mTableStru.IndexColumn8, Empty
AddToArray mTableStru.IndexColumn9, Empty

End Sub

Public Sub AddLink()
AddToArray mLinkStru.TableName, Empty
AddToArray mLinkStru.LinkName, Empty
AddToArray mLinkStru.dbSource, Empty
AddToArray mLinkStru.LinkStatus, cREC_NEW

End Sub

Public Property Get TableName() As String
TableName = mTableStru.TableName
End Property

Public Property Let TableName(ByVal mTableName As String)
mTableStru.TableName = mTableName
End Property

Public Property Get PrimaryKey() As String
PrimaryKey = mTableStru.PrimaryKey
End Property

Public Property Let PrimaryKey(ByVal mPrimKey As String)
mTableStru.PrimaryKey = mPrimKey
End Property

Public Property Get ColumnName(Optional ByVal mDim) As String
mDim = IIf(IsMissing(mDim) = False, mDim, UBound(mTableStru.ColumnName))
ColumnName = mTableStru.ColumnName(mDim)
End Property

Public Property Let ColumnName(Optional ByVal mDim, ByVal mColumnName As String)
mDim = IIf(IsMissing(mDim) = False, mDim, UBound(mTableStru.ColumnName))
mTableStru.ColumnName(mDim) = mColumnName
End Property

Public Property Get ColumnType(Optional ByVal mDim) As Integer
mDim = IIf(IsMissing(mDim) = False, mDim, UBound(mTableStru.ColumnName))
ColumnType = mTableStru.ColumnType(mDim)
End Property

Public Property Let ColumnType(Optional ByVal mDim, ByVal mColumnType As Integer)
mDim = IIf(IsMissing(mDim) = False, mDim, UBound(mTableStru.ColumnName))
mTableStru.ColumnType(mDim) = mColumnType
End Property

Public Property Get ColumnWidth(Optional ByVal mDim) As Integer
mDim = IIf(IsMissing(mDim) = False, mDim, UBound(mTableStru.ColumnName))
ColumnWidth = mTableStru.ColumnWidth(mDim)
End Property

Public Property Let ColumnWidth(Optional ByVal mDim, ByVal mColumnWidth As Integer)
mDim = IIf(IsMissing(mDim) = False, mDim, UBound(mTableStru.ColumnName))
mTableStru.ColumnWidth(mDim) = mColumnWidth
End Property

Public Property Get ColumnRequired(Optional ByVal mDim) As Boolean
mDim = IIf(IsMissing(mDim) = False, mDim, UBound(mTableStru.ColumnName))
ColumnRequired = mTableStru.ColumnRequired(mDim)
End Property

Public Property Let ColumnRequired(Optional ByVal mDim, ByVal mColumnRequired As Boolean)
mDim = IIf(IsMissing(mDim) = False, mDim, UBound(mTableStru.ColumnName))
mTableStru.ColumnRequired(mDim) = mColumnRequired
End Property

Public Property Get AllowZeroLength(Optional ByVal mDim) As Boolean
mDim = IIf(IsMissing(mDim) = False, mDim, UBound(mTableStru.ColumnName))
AllowZeroLength = mTableStru.AllowZeroLength(mDim)
End Property

Public Property Let AllowZeroLength(Optional ByVal mDim, ByVal mAllowZeroLength As Boolean)
mDim = IIf(IsMissing(mDim) = False, mDim, UBound(mTableStru.ColumnName))
mTableStru.AllowZeroLength(mDim) = mAllowZeroLength
End Property

Public Property Get AutoIncrement(Optional ByVal mDim) As Boolean
mDim = IIf(IsMissing(mDim) = False, mDim, UBound(mTableStru.ColumnName))
AutoIncrement = mTableStru.AutoIncrement(mDim)
End Property

Public Property Let AutoIncrement(Optional ByVal mDim, ByVal mAutoIncrement As Boolean)
mDim = IIf(IsMissing(mDim) = False, mDim, UBound(mTableStru.ColumnName))
mTableStru.AutoIncrement(mDim) = mAutoIncrement
End Property

Public Property Get ColumnStatus(Optional ByVal mDim) As Integer
mDim = IIf(IsMissing(mDim) = False, mDim, UBound(mTableStru.ColumnName))
ColumnStatus = mTableStru.ColumnStatus(mDim)
End Property

Public Property Let ColumnStatus(Optional ByVal mDim, ByVal mColumnStatus As Integer)
mDim = IIf(IsMissing(mDim) = False, mDim, UBound(mTableStru.ColumnName))
mTableStru.ColumnStatus(mDim) = mColumnStatus
End Property

Public Property Get IndexName(Optional ByVal mDim) As String
mDim = IIf(IsMissing(mDim) = False, mDim, UBound(mTableStru.IndexName))
IndexName = mTableStru.IndexName(mDim)
End Property

Public Property Let IndexName(Optional ByVal mDim, ByVal mIndexName As String)
mDim = IIf(IsMissing(mDim) = False, mDim, UBound(mTableStru.IndexName))
mTableStru.IndexName(mDim) = mIndexName
End Property

Public Property Get IndexUnique(Optional ByVal mDim) As Boolean
mDim = IIf(IsMissing(mDim) = False, mDim, UBound(mTableStru.IndexName))
IndexUnique = mTableStru.IndexUnique(mDim)
End Property

Public Property Let IndexUnique(Optional ByVal mDim, ByVal mIndexUnique As Boolean)
mDim = IIf(IsMissing(mDim) = False, mDim, UBound(mTableStru.IndexName))
mTableStru.IndexUnique(mDim) = mIndexUnique
End Property

Public Property Get IndexColumn1(Optional ByVal mDim) As String
mDim = IIf(IsMissing(mDim) = False, mDim, UBound(mTableStru.IndexName))
IndexColumn1 = mTableStru.IndexColumn1(mDim)
End Property

Public Property Let IndexColumn1(Optional ByVal mDim, ByVal mIndexColumn As String)
mDim = IIf(IsMissing(mDim) = False, mDim, UBound(mTableStru.IndexName))
mTableStru.IndexColumn1(mDim) = mIndexColumn
End Property

Public Property Get IndexColumn2(Optional ByVal mDim) As String
mDim = IIf(IsMissing(mDim) = False, mDim, UBound(mTableStru.IndexName))
IndexColumn2 = mTableStru.IndexColumn2(mDim)
End Property

Public Property Let IndexColumn2(Optional ByVal mDim, ByVal mIndexColumn As String)
mDim = IIf(IsMissing(mDim) = False, mDim, UBound(mTableStru.IndexName))
mTableStru.IndexColumn2(mDim) = mIndexColumn
End Property

Public Property Get IndexColumn3(Optional ByVal mDim) As String
mDim = IIf(IsMissing(mDim) = False, mDim, UBound(mTableStru.IndexName))
IndexColumn3 = mTableStru.IndexColumn3(mDim)
End Property

Public Property Let IndexColumn3(Optional ByVal mDim, ByVal mIndexColumn As String)
mDim = IIf(IsMissing(mDim) = False, mDim, UBound(mTableStru.IndexName))
mTableStru.IndexColumn3(mDim) = mIndexColumn
End Property

Public Property Get IndexColumn4(Optional ByVal mDim) As String
mDim = IIf(IsMissing(mDim) = False, mDim, UBound(mTableStru.IndexName))
IndexColumn4 = mTableStru.IndexColumn4(mDim)
End Property

Public Property Let IndexColumn4(Optional ByVal mDim, ByVal mIndexColumn As String)
mDim = IIf(IsMissing(mDim) = False, mDim, UBound(mTableStru.IndexName))
mTableStru.IndexColumn4(mDim) = mIndexColumn
End Property

Public Property Get IndexColumn5(Optional ByVal mDim) As String
mDim = IIf(IsMissing(mDim) = False, mDim, UBound(mTableStru.IndexName))
IndexColumn5 = mTableStru.IndexColumn5(mDim)
End Property

Public Property Let IndexColumn5(Optional ByVal mDim, ByVal mIndexColumn As String)
mDim = IIf(IsMissing(mDim) = False, mDim, UBound(mTableStru.IndexName))
mTableStru.IndexColumn5(mDim) = mIndexColumn
End Property

Public Property Get IndexColumn6(Optional ByVal mDim) As String
mDim = IIf(IsMissing(mDim) = False, mDim, UBound(mTableStru.IndexName))
IndexColumn6 = mTableStru.IndexColumn6(mDim)
End Property

Public Property Let IndexColumn6(Optional ByVal mDim, ByVal mIndexColumn As String)
mDim = IIf(IsMissing(mDim) = False, mDim, UBound(mTableStru.IndexName))
mTableStru.IndexColumn6(mDim) = mIndexColumn
End Property

Public Property Get IndexColumn7(Optional ByVal mDim) As String
mDim = IIf(IsMissing(mDim) = False, mDim, UBound(mTableStru.IndexName))
IndexColumn7 = mTableStru.IndexColumn7(mDim)
End Property

Public Property Let IndexColumn7(Optional ByVal mDim, ByVal mIndexColumn As String)
mDim = IIf(IsMissing(mDim) = False, mDim, UBound(mTableStru.IndexName))
mTableStru.IndexColumn7(mDim) = mIndexColumn
End Property

Public Property Get IndexColumn8(Optional ByVal mDim) As String
mDim = IIf(IsMissing(mDim) = False, mDim, UBound(mTableStru.IndexName))
IndexColumn8 = mTableStru.IndexColumn8(mDim)
End Property

Public Property Let IndexColumn8(Optional ByVal mDim, ByVal mIndexColumn As String)
mDim = IIf(IsMissing(mDim) = False, mDim, UBound(mTableStru.IndexName))
mTableStru.IndexColumn8(mDim) = mIndexColumn
End Property

Public Property Get IndexColumn9(Optional ByVal mDim) As String
mDim = IIf(IsMissing(mDim) = False, mDim, UBound(mTableStru.IndexName))
IndexColumn9 = mTableStru.IndexColumn9(mDim)
End Property

Public Property Let IndexColumn9(Optional ByVal mDim, ByVal mIndexColumn As String)
mDim = IIf(IsMissing(mDim) = False, mDim, UBound(mTableStru.IndexName))
mTableStru.IndexColumn9(mDim) = mIndexColumn
End Property

Rem View Structure properties **********************************************************
Public Property Get ViewName() As String
ViewName = mViewStru.ViewName
End Property

Public Property Let ViewName(ByVal mViewName As String)
mViewStru.ViewName = mViewName
End Property

Public Property Get CommandStr() As String
CommandStr = mViewStru.CommandStr
End Property

Public Property Let CommandStr(ByVal mCommandStr As String)
mViewStru.CommandStr = mCommandStr
End Property

Rem Link Structure properties **********************************************************
Public Property Get LinkTableName(Optional ByVal mDim) As String
mDim = IIf(IsMissing(mDim) = False, mDim, UBound(mLinkStru.TableName))
LinkTableName = mLinkStru.TableName(mDim)
End Property

Public Property Let LinkTableName(Optional ByVal mDim, ByVal mTableName As String)
mDim = IIf(IsMissing(mDim) = False, mDim, UBound(mLinkStru.TableName))
mLinkStru.TableName(mDim) = mTableName
End Property

Public Property Get LinkDbSource(Optional ByVal mDim) As String
mDim = IIf(IsMissing(mDim) = False, mDim, UBound(mLinkStru.TableName))
LinkDbSource = mLinkStru.dbSource(mDim)
End Property

Public Property Let LinkDbSource(Optional ByVal mDim, ByVal mDbSource As String)
mDim = IIf(IsMissing(mDim) = False, mDim, UBound(mLinkStru.TableName))
mLinkStru.dbSource(mDim) = mDbSource
End Property

Public Property Get LinkStatus(Optional ByVal mDim) As Integer
mDim = IIf(IsMissing(mDim) = False, mDim, UBound(mLinkStru.TableName))
LinkStatus = mLinkStru.LinkStatus(mDim)
End Property

Public Property Let LinkStatus(Optional ByVal mDim, ByVal mStatus As Integer)
mDim = IIf(IsMissing(mDim) = False, mDim, UBound(mLinkStru.TableName))
mLinkStru.LinkStatus(mDim) = mStatus
End Property

Public Sub CreateTable(ByRef dbCatalog As ADOX.Catalog)     ' , ByRef mTableStru As adTableStru
Dim mTable As ADOX.Table, mColumn As ADOX.Column, mIndex As ADOX.Index, mProp As ADOX.Property, mPrimKey As ADOX.Key, mTblCount As Integer, mColCount As Integer, mIdxCount As Integer, aPos As Integer, mCreateStatus As Integer

If Not FormProgStatus Is Nothing Then
    If FormProgStatus.Visible = True Then
        FormProgStatus.ShowNextStatus dbCatalog.ActiveConnection.Properties("Data Source Name") & vbCrLf & "Table: " & mTableStru.TableName
        Rem DoEvents
    End If
End If

mCreateStatus = 1
For Each mTable In dbCatalog.Tables
    'If mTable.Type = "LINK" Or mTable.Type = "VIEW" Or mTable.Type = "SYSTEM TABLE" Or mTable.Type = "ACCESS TABLE" Then
    If mTable.Type = "TABLE" Then
        If UCase(mTable.Name) = UCase(mTableStru.TableName) Then
            mCreateStatus = 2
            Exit For
        End If
    Else
        If UCase(mTable.Name) = UCase(mTableStru.TableName) Then
            ErrorBox "Cannot Create Table over " & mTable.Type & " !!!" & vbCrLf & mTable.Name
            mCreateStatus = 0
            Exit For
        End If
    End If
Next mTable
If mCreateStatus > 0 Then
    If mCreateStatus = 1 Then   ' adding new table
        Set mTable = New ADOX.Table
        mTable.ParentCatalog = dbCatalog
        
        With mTable
        .Name = mTableStru.TableName
        
        On Error GoTo AddStruErr
        For mColCount = LBound(mTableStru.ColumnName) To UBound(mTableStru.ColumnName)
            mTable.Columns.Append mTableStru.ColumnName(mColCount), mTableStru.ColumnType(mColCount), mTableStru.ColumnWidth(mColCount)
            
            Set mColumn = mTable.Columns(mTableStru.ColumnName(mColCount))
            With mColumn
            If InList(.Type, Array(adSmallInt, adInteger, adDouble, adSingle)) = True Then
                .Properties("Default") = 0
            ElseIf .Type = adVarWChar Then
                .Properties("Default") = ""
            ElseIf .Type = adBoolean Then
                .Properties("Default") = 0
            ElseIf .Type = adDate Then
                Rem .Properties("Default") = cUNKNOWNDATE do not assign it
            Else
                ErrorBox "Undefined Data Type " & CStr(.Type)
            End If
            If IsEmpty(mTableStru.AutoIncrement(mColCount)) = False Then
                Rem important: not to be applied on more than one field
                .Properties("AutoIncrement") = mTableStru.AutoIncrement(mColCount)
            End If
            If IsEmpty(mTableStru.ColumnRequired(mColCount)) = False And .Type <> adBoolean Then    ' multi-step error generated in create new table mode only and not in edit mode
                .Properties("Nullable") = Not mTableStru.ColumnRequired(mColCount)
            End If
            If IsEmpty(mTableStru.AllowZeroLength(mColCount)) = False And .Type <> adBoolean Then
                .Properties("Jet Oledb:Allow Zero Length") = mTableStru.AllowZeroLength(mColCount)
            End If
            End With
            
            mTableStru.ColumnStatus(mColCount) = cREC_ADDED
        Next mColCount
        End With
        dbCatalog.Tables.Append mTable
        
    ElseIf mCreateStatus = 2 Then   ' editing existing tables for creating new columns, editing existing columns, removing mismatch name columns
        Set mTable = New ADOX.Table
        mTable.ParentCatalog = dbCatalog
        Set mTable = dbCatalog.Tables(mTableStru.TableName)
        
        For mIdxCount = mTable.Indexes.count - 1 To 0 Step -1
            mTable.Indexes.Delete mIdxCount
        Next mIdxCount
        
        On Error GoTo EditStruErr
        'For Each mColumn In mTable.Columns
        For mColCount = 0 To mTable.Columns.count - 1
            Set mColumn = mTable.Columns(mColCount)
            aPos = AScan(mTableStru.ColumnName, mColumn.Name)
            If aPos >= LBound(mTableStru.ColumnName) Then
                With mColumn
                If InList(.Type, Array(adSmallInt, adInteger, adDouble, adSingle)) = True Then
                    .Properties("Default") = 0
                ElseIf .Type = adVarWChar Then
                    .Properties("Default") = ""
                ElseIf .Type = adBoolean Then
                    .Properties("Default") = False
                ElseIf .Type = adDate Then
                    Rem .Properties("Default") = cUNKNOWNDATE do not assign it
                Else
                    ErrorBox "Undefined Data Type " & CStr(.Type)
                End If
                If .Type <> mTableStru.ColumnType(aPos) Then
                    ErrorBox "Programmatic Table Alteration Strictly Prohibited !!!" & vbCrLf & .Name & "->" & adTypeName(.Type) & "->" & adTypeName(mTableStru.ColumnType(aPos))
                    Rem .Type = mTableStru.ColumnType(aPos)
                End If
                If IsEmpty(mTableStru.ColumnWidth(aPos)) = False Then
                    If .DefinedSize <> mTableStru.ColumnWidth(aPos) Then
                        If .Type = adVarWChar Then
                            dbCatalog.ActiveConnection.Execute "alter table " & mTableStru.TableName & " alter column " & mColumn.Name & " TEXT(" & CStr(mTableStru.ColumnWidth(aPos)) & ")"
                        ElseIf .Type = adBoolean Then
                            Rem has to be bypassed
                        Else
                            ErrorBox "Programmatic Table Alteration Strictly Prohibited !!!" & vbCrLf & .Name & "->" & adTypeName(.Type) & ".DefinedSize:" & CStr(.DefinedSize) & "->" & adTypeName(mTableStru.ColumnType(aPos)) & ".DefinedSize:" & CStr(mTableStru.ColumnWidth(aPos))
                            Rem .DefinedSize = mTableStru.ColumnWidth(aPos)
                        End If
                    End If
                End If
                If IsEmpty(mTableStru.AutoIncrement(aPos)) = False Then
                    Rem important: not to be applied on more than one field
                    If .Properties("AutoIncrement") <> mTableStru.AutoIncrement(aPos) Then
                        .Properties("AutoIncrement") = Not mTableStru.AutoIncrement(aPos)
                    End If
                End If
                If IsEmpty(mTableStru.ColumnRequired(aPos)) = False And .Type <> adBoolean Then
                    If .Properties("Nullable") <> Not mTableStru.ColumnRequired(aPos) Then
                        Set mProp = .Properties("Nullable")
                        Rem mProp.Value = Not mTableStru.ColumnRequired(aPos)
                        Rem .Properties("Nullable") = Not mTableStru.ColumnRequired(aPos)   ' generating multi-step oledb error
                    End If
                End If
                If IsEmpty(mTableStru.AllowZeroLength(aPos)) = False And .Type <> adBoolean Then
                    If .Properties("Jet Oledb:Allow Zero Length") <> mTableStru.AllowZeroLength(aPos) Then
                        .Properties("Jet Oledb:Allow Zero Length") = mTableStru.AllowZeroLength(aPos)
                    End If
                End If
                End With
                mTableStru.ColumnStatus(aPos) = cREC_EDITED
            Else
                AddColumn
                ColumnName() = mColumn.Name
                ColumnStatus() = cREC_DELETED
            End If
        Next mColCount
        For mColCount = LBound(mTableStru.ColumnName) To UBound(mTableStru.ColumnName)
            If mTableStru.ColumnStatus(mColCount) = cREC_NEW Then
                mTable.Columns.Append mTableStru.ColumnName(mColCount), mTableStru.ColumnType(mColCount), mTableStru.ColumnWidth(mColCount)
                
                Set mColumn = mTable.Columns(mTableStru.ColumnName(mColCount))
                With mColumn
                If InList(.Type, Array(adSmallInt, adInteger, adDouble, adSingle)) = True Then
                    .Properties("Default") = 0
                End If
                If IsEmpty(mTableStru.AutoIncrement(mColCount)) = False Then
                    Rem important: not to be applied on more than one field
                    .Properties("AutoIncrement") = mTableStru.AutoIncrement(mColCount)
                End If
                If IsEmpty(mTableStru.ColumnRequired(mColCount)) = False Then
                    Set mProp = .Properties("Nullable")
                    Rem mProp = Not mTableStru.ColumnRequired(mColCount)
                    Rem .Properties("Nullable") = Not mTableStru.ColumnRequired(mColCount) ' causing error
                End If
                If IsEmpty(mTableStru.AllowZeroLength(mColCount)) = False Then
                    .Properties("Jet Oledb:Allow Zero Length") = mTableStru.AllowZeroLength(mColCount)
                End If
                End With
                
                mTableStru.ColumnStatus(mColCount) = cREC_ADDED
            ElseIf mTableStru.ColumnStatus(mColCount) = cREC_DELETED Then
                mTable.Columns.Delete mTableStru.ColumnName(mColCount)
            End If
        Next mColCount
    End If
    
    On Error GoTo IndexErr
    For mIdxCount = LBound(mTableStru.IndexName) To UBound(mTableStru.IndexName)
        Set mIndex = New ADOX.Index
        With mIndex
        .Name = mTableStru.IndexName(mIdxCount)
        If IsEmpty(mTableStru.IndexUnique(mIdxCount)) = False Then
            .Unique = mTableStru.IndexUnique(mIdxCount)
        End If
        .Columns.Append mTableStru.IndexColumn1(mIdxCount)
        If IsEmpty(mTableStru.IndexColumn2(mIdxCount)) = False Then
            .Columns.Append mTableStru.IndexColumn2(mIdxCount)
        End If
        If IsEmpty(mTableStru.IndexColumn3(mIdxCount)) = False Then
            .Columns.Append mTableStru.IndexColumn3(mIdxCount)
        End If
        If IsEmpty(mTableStru.IndexColumn4(mIdxCount)) = False Then
            .Columns.Append mTableStru.IndexColumn4(mIdxCount)
        End If
        If IsEmpty(mTableStru.IndexColumn5(mIdxCount)) = False Then
            .Columns.Append mTableStru.IndexColumn5(mIdxCount)
        End If
        If IsEmpty(mTableStru.IndexColumn6(mIdxCount)) = False Then
            .Columns.Append mTableStru.IndexColumn6(mIdxCount)
        End If
        If IsEmpty(mTableStru.IndexColumn7(mIdxCount)) = False Then
            .Columns.Append mTableStru.IndexColumn7(mIdxCount)
        End If
        If IsEmpty(mTableStru.IndexColumn8(mIdxCount)) = False Then
            .Columns.Append mTableStru.IndexColumn8(mIdxCount)
        End If
        If IsEmpty(mTableStru.IndexColumn9(mIdxCount)) = False Then
            .Columns.Append mTableStru.IndexColumn9(mIdxCount)
        End If
        mTable.Indexes.Append mIndex
        
        End With
    Next mIdxCount
    On Error GoTo 0
    
    If mTableStru.PrimaryKey <> "" Then
        Set mPrimKey = New ADOX.Key
        With mPrimKey
        .Name = mTableStru.PrimaryKey
        .Columns.Append mTableStru.PrimaryKey
        End With
        mTable.Keys.Append mPrimKey
    End If
    
    mTableStru.CreateStatus = mCreateStatus
End If
Set mTable = Nothing
Set mColumn = Nothing
Set mIndex = Nothing
Set mPrimKey = Nothing
Exit Sub

Rem error handlings
AddStruErr:
MsgBox Err.Description & vbCrLf & Err.Source & vbCrLf & mTable.Name & "->" & mColumn.Name
Resume Next

EditStruErr:
MsgBox Err.Description & vbCrLf & Err.Source & vbCrLf & mTable.Name & "->" & mColumn.Name
Resume Next

IndexErr:
MsgBox Err.Description & vbCrLf & Err.Source & vbCrLf & mIndex.Name
Resume Next

ShowErr:
MsgBox Err.Description
Resume Next

End Sub

Public Sub CreateView(ByRef dbCatalog As ADOX.Catalog)     ' , ByRef mViewStru As adTableStru
Dim mTable As ADOX.Table, mView As ADOX.View, mCommand As ADODB.Command, mCreateStatus As Integer

If Not FormProgStatus Is Nothing Then
    If FormProgStatus.Visible = True Then
        FormProgStatus.ShowNextStatus dbCatalog.ActiveConnection.Properties("Data Source Name") & vbCrLf & "View: " & mViewStru.ViewName
        Rem DoEvents
    End If
End If

dbCatalog.Views.Refresh
mCreateStatus = 1
For Each mTable In dbCatalog.Tables
    'If mTable.Type = "LINK" Or mTable.Type = "VIEW" Or mTable.Type = "SYSTEM TABLE" Or mTable.Type = "ACCESS TABLE" Then
    If mTable.Type <> "VIEW" Then
        If UCase(mTable.Name) = UCase(mViewStru.ViewName) Then
            ErrorBox "Cannot Create View over " & mTable.Type & " !!!" & vbCrLf & mTable.Name
            mCreateStatus = 0
            Exit For
        End If
    End If
Next mTable
If mCreateStatus = 1 Then
    For Each mView In dbCatalog.Views
        'If mTable.Type = "LINK" Or mTable.Type = "VIEW" Or mTable.Type = "SYSTEM TABLE" Or mTable.Type = "ACCESS TABLE" Then
        If UCase(mView.Name) = UCase(mViewStru.ViewName) Then
            mCreateStatus = 2
            Exit For
        End If
    Next mView
End If

If mCreateStatus > 0 Then
    If mCreateStatus = 1 Then   ' adding new table
        Set mCommand = New ADODB.Command
        mCommand.CommandText = mViewStru.CommandStr
        dbCatalog.Views.Append mViewStru.ViewName, mCommand
        
    ElseIf mCreateStatus = 2 Then   ' editing existing tables for creating new columns, editing existing columns, removing mismatch name columns
        Set mCommand = dbCatalog.Views(mViewStru.ViewName).Command
        mCommand.CommandText = mViewStru.CommandStr
        Set dbCatalog.Views(mViewStru.ViewName).Command = mCommand
        
    End If
    
    mViewStru.CreateStatus = mCreateStatus
End If
Set mTable = Nothing
Set mCommand = Nothing
dbCatalog.Views.Refresh

Exit Sub

End Sub

Public Sub CreateLink(ByRef dbCatalog As ADOX.Catalog)
Dim mTable As ADOX.Table, mTblCount As Integer, aPos As Integer

On Error GoTo errhand
For Each mTable In dbCatalog.Tables
    aPos = AScan(mLinkStru.TableName, mTable.Name)
    If aPos >= LBound(mLinkStru.TableName) Then
        If mTable.Type = "LINK" Then
            mLinkStru.LinkStatus(aPos) = cREC_DELETED
        Else
            ErrorBox "Cannot Create Link over " & mTable.Type & " !!!" & vbCrLf & mTable.Name
            mLinkStru.LinkStatus(aPos) = cREC_CANCELED
        End If
    End If
Next mTable

For aPos = LBound(mLinkStru.TableName) To UBound(mLinkStru.TableName)
    If mLinkStru.LinkStatus(aPos) = cREC_DELETED Then
        dbCatalog.Tables.Delete mLinkStru.TableName(aPos)
        mLinkStru.LinkStatus(aPos) = cREC_NEW
    End If
Next aPos

For aPos = LBound(mLinkStru.TableName) To UBound(mLinkStru.TableName)
    If mLinkStru.LinkStatus(aPos) = cREC_NEW Then
        If Not FormProgStatus Is Nothing Then
            If FormProgStatus.Visible = True Then
                FormProgStatus.ShowNextStatus dbCatalog.ActiveConnection.Properties("Data Source Name") & vbCrLf & "Link: " & mLinkStru.TableName(aPos)
                Rem DoEvents
            End If
        End If
    
        Set mTable = New ADOX.Table
        mTable.ParentCatalog = dbCatalog
        With mTable
        .Name = mLinkStru.TableName(aPos)
        .Properties("Jet OLEDB:Create Link") = True
        .Properties("Jet OLEDB:Link DataSource") = mLinkStru.dbSource(aPos)
        .Properties("Jet OLEDB:Remote Table Name") = mLinkStru.TableName(aPos)
        
        End With
        dbCatalog.Tables.Append mTable
        
        mLinkStru.LinkStatus(aPos) = cREC_ADDED
    End If
Next aPos
Set mTable = Nothing
Exit Sub

errhand:
MsgBox Err.Description & vbCrLf & Err.Source
Resume Next

End Sub


