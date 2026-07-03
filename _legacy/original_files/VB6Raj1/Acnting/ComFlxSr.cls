VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "clsComFlexSearch"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit

Public fcmb As New frmFlexSearchList
Public dbAcDatabase As ADODB.Connection, dbStDatabase As ADODB.Connection, dbComDatabase As ADODB.Connection
Public mListSqlExpr As String
Public blnAchdMastList As Boolean, blnProdMastList As Boolean, blnAreaMastList As Boolean, blnStationMastList As Boolean, blnVTypeMastList As Boolean
Rem Public mMachOptrList As Boolean, mMachMastList As Boolean, mPackPerList As Boolean, mMatProcMastList As Boolean, mVendMastList As Boolean
Rem Public mEmpMastList As Boolean, mDeptMastList As Boolean, mDesgMastList As Boolean
Rem Public mUserRoleList As Boolean, mUserMastList As Boolean
Dim BRecset As New ADODB.Recordset, LRecset As New ADODB.Recordset

Public Property Get BoundText() As String
BoundText = fcmb.BoundText
End Property

Public Property Let BoundText(ByVal mText As String)
fcmb.SearchBoundText mText
End Property

Public Property Get Text() As String
Text = fcmb.Text
End Property

Public Property Let Text(ByVal mText As String)
fcmb.SearchText mText
End Property

Rem mUserPara(0) = User Text
Rem mUserPara(1) = Cursor position
Public Property Let UserText(ByRef mUserPara As Variant)
fcmb.UserText = mUserPara

End Property

Public Property Get CallFromText_Change() As Boolean
CallFromText_Change = fcmb.CallFromText_Change
End Property

Public Property Let CallFromText_Change(ByVal mTrueFalse As Boolean)
fcmb.CallFromText_Change = mTrueFalse
End Property

Public Property Get CallFromBoundText_Change() As Boolean
CallFromBoundText_Change = fcmb.CallFromBoundText_Change
End Property

Public Property Let CallFromBoundText_Change(ByVal mTrueFalse As Boolean)
fcmb.CallFromBoundText_Change = mTrueFalse
End Property

Public Property Get ListSelected() As Boolean
ListSelected = fcmb.ListSelected()
End Property

Public Sub Show()
fcmb.Show 1
End Sub

Public Sub Init()

If blnAchdMastList = True Then
    Load fcmb
    fcmb.lblFormHeading.Caption = "Account Head Master"
    fcmb.TableName = "AchdMast"
    fcmb.BoundField = "AhCode"
    fcmb.ListField = "AhName"
    fcmb.lblSearchCaption.Caption = "Name:"
    
    BRecset.Open fcmb.TableName, dbAcDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect
    BRecset.Index = fcmb.BoundField
    If mListSqlExpr = "" Then
        LRecset.Open "Select * from " & fcmb.TableName & " order by " & fcmb.ListField, dbAcDatabase, adOpenKeyset, adLockOptimistic
    Else
        LRecset.Open mListSqlExpr, dbAcDatabase, adOpenKeyset, adLockOptimistic
    End If
    
    Set fcmb.BRecset = BRecset
    Set fcmb.LRecset = LRecset
    Set fcmb.frmAccessMaster = New frmAcntHead
    
    fcmb.ClearFlexColList
    fcmb.AddFlexColList mFldName:="AhCode", mFldTitle:="AhCode", mFldWidth:=0, mFldAlign:=8
    fcmb.AddFlexColList mFldName:="AhName", mFldTitle:="Account Head Name", mFldWidth:=3000, mFldAlign:=1
    
    fcmb.Init
    
ElseIf blnProdMastList = True Then
    Load fcmb
    fcmb.lblFormHeading.Caption = "Product Master"
    fcmb.TableName = "ProdMast"
    fcmb.BoundField = "ItmCode"
    fcmb.ListField = "ItmName"
    fcmb.lblSearchCaption.Caption = "Name:"
    
    BRecset.Open fcmb.TableName, dbStDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect
    BRecset.Index = fcmb.BoundField
    If mListSqlExpr = "" Then
        LRecset.Open "Select * from " & fcmb.TableName & " order by " & fcmb.ListField, dbStDatabase, adOpenKeyset, adLockOptimistic
    Else
        LRecset.Open mListSqlExpr, dbStDatabase, adOpenKeyset, adLockOptimistic
    End If
    
    Set fcmb.BRecset = BRecset
    Set fcmb.LRecset = LRecset
    Set fcmb.frmAccessMaster = New frmItemMast
    
    fcmb.ClearFlexColList
    fcmb.AddFlexColList mFldName:="ItmCode", mFldTitle:="ItmCode", mFldWidth:=0, mFldAlign:=8
    fcmb.AddFlexColList mFldName:="ItmName", mFldTitle:="Product Name", mFldWidth:=3000, mFldAlign:=1
    
    fcmb.Init
    
ElseIf blnAreaMastList = True Then
    Load fcmb
    fcmb.lblFormHeading.Caption = "Area Master"
    fcmb.TableName = "AreaMast"
    fcmb.BoundField = "AraCode"
    fcmb.ListField = "AraName"
    fcmb.lblSearchCaption.Caption = "Name:"
    
    BRecset.Open fcmb.TableName, dbAcDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect
    BRecset.Index = fcmb.BoundField
    If mListSqlExpr = "" Then
        LRecset.Open "Select * from " & fcmb.TableName & " inner join StsnMast on " & fcmb.TableName & ".AraStnCode=StsnMast.StnCode order by " & fcmb.ListField, dbAcDatabase, adOpenKeyset, adLockOptimistic
    Else
        LRecset.Open mListSqlExpr, dbAcDatabase, adOpenKeyset, adLockOptimistic
    End If
    
    Set fcmb.BRecset = BRecset
    Set fcmb.LRecset = LRecset
    Set fcmb.frmAccessMaster = New frmAreaMast
    
    fcmb.ClearFlexColList
    fcmb.AddFlexColList mFldName:="AraCode", mFldTitle:="AraCode", mFldWidth:=0, mFldAlign:=8
    fcmb.AddFlexColList mFldName:="AraName", mFldTitle:="Area Name", mFldWidth:=3000, mFldAlign:=1
    fcmb.AddFlexColList mFldName:="StnName", mFldTitle:="Station", mFldWidth:=2000, mFldAlign:=1
    
    fcmb.Init
    
ElseIf blnStationMastList = True Then
    Load fcmb
    fcmb.lblFormHeading.Caption = "Station Master"
    fcmb.TableName = "StsnMast"
    fcmb.BoundField = "StnCode"
    fcmb.ListField = "StnName"
    fcmb.lblSearchCaption.Caption = "Name:"
    
    BRecset.Open fcmb.TableName, dbAcDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect
    BRecset.Index = fcmb.BoundField
    If mListSqlExpr = "" Then
        LRecset.Open "Select * from " & fcmb.TableName & " order by " & fcmb.ListField, dbAcDatabase, adOpenKeyset, adLockOptimistic
    Else
        LRecset.Open mListSqlExpr, dbAcDatabase, adOpenKeyset, adLockOptimistic
    End If
    
    Set fcmb.BRecset = BRecset
    Set fcmb.LRecset = LRecset
    Set fcmb.frmAccessMaster = New frmStationMast
    
    fcmb.ClearFlexColList
    fcmb.AddFlexColList mFldName:="StnCode", mFldTitle:="StnCode", mFldWidth:=0, mFldAlign:=8
    fcmb.AddFlexColList mFldName:="StnName", mFldTitle:="Station Name", mFldWidth:=3000, mFldAlign:=1
    
    fcmb.Init
    
ElseIf blnVTypeMastList = True Then
    Load fcmb
    fcmb.lblFormHeading.Caption = "Voucher Type Master"
    fcmb.TableName = "VTypMast"
    fcmb.BoundField = "VtmCode"
    fcmb.ListField = "VtmName"
    fcmb.lblSearchCaption.Caption = "Name:"
    
    BRecset.Open fcmb.TableName, dbAcDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect
    BRecset.Index = fcmb.BoundField
    If mListSqlExpr = "" Then
        LRecset.Open "Select * from " & fcmb.TableName & " order by " & fcmb.ListField, dbAcDatabase, adOpenKeyset, adLockOptimistic
    Else
        LRecset.Open mListSqlExpr, dbAcDatabase, adOpenKeyset, adLockOptimistic
    End If
    
    Set fcmb.BRecset = BRecset
    Set fcmb.LRecset = LRecset
    Set fcmb.frmAccessMaster = New frmVoucherType
    
    fcmb.ClearFlexColList
    fcmb.AddFlexColList mFldName:="VtmCode", mFldTitle:="VtmCode", mFldWidth:=0, mFldAlign:=8
    fcmb.AddFlexColList mFldName:="VtmName", mFldTitle:="Voucher Name", mFldWidth:=3000, mFldAlign:=1
    
    fcmb.Init
    
Else
    Err.Raise Number:=vbObjectError + 513, Description:="clsComFlexSearch_Class_Initialize_278"
End If

End Sub

Public Sub ReInit()
If blnAchdMastList = True Then
    BRecset.Close: LRecset.Close
    
    BRecset.Open fcmb.TableName, dbAcDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect
    BRecset.Index = fcmb.BoundField
    If mListSqlExpr = "" Then
        LRecset.Open "Select * from " & fcmb.TableName & " order by " & fcmb.ListField, dbAcDatabase, adOpenKeyset, adLockOptimistic
    Else
        LRecset.Open mListSqlExpr, dbAcDatabase, adOpenKeyset, adLockOptimistic
    End If
    fcmb.ReInit
    
ElseIf blnProdMastList = True Then
    BRecset.Close: LRecset.Close
    
    BRecset.Open fcmb.TableName, dbStDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect
    BRecset.Index = fcmb.BoundField
    If mListSqlExpr = "" Then
        LRecset.Open "Select * from " & fcmb.TableName & " order by " & fcmb.ListField, dbStDatabase, adOpenKeyset, adLockOptimistic
    Else
        LRecset.Open mListSqlExpr, dbStDatabase, adOpenKeyset, adLockOptimistic
    End If
    fcmb.ReInit
    
ElseIf blnAreaMastList = True Then
    BRecset.Close: LRecset.Close
    
    BRecset.Open fcmb.TableName, dbAcDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect
    BRecset.Index = fcmb.BoundField
    If mListSqlExpr = "" Then
        LRecset.Open "Select * from " & fcmb.TableName & " inner join StsnMast on " & fcmb.TableName & ".AraStnCode=StsnMast.StnCode order by " & fcmb.ListField, dbAcDatabase, adOpenKeyset, adLockOptimistic
    Else
        LRecset.Open mListSqlExpr, dbAcDatabase, adOpenKeyset, adLockOptimistic
    End If
    fcmb.ReInit
    
ElseIf blnStationMastList = True Then
    BRecset.Close: LRecset.Close
    
    BRecset.Open fcmb.TableName, dbAcDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect
    BRecset.Index = fcmb.BoundField
    If mListSqlExpr = "" Then
        LRecset.Open "Select * from " & fcmb.TableName & " order by " & fcmb.ListField, dbAcDatabase, adOpenKeyset, adLockOptimistic
    Else
        LRecset.Open mListSqlExpr, dbAcDatabase, adOpenKeyset, adLockOptimistic
    End If
    fcmb.ReInit
    
ElseIf blnVTypeMastList = True Then
    BRecset.Close: LRecset.Close
    
    BRecset.Open fcmb.TableName, dbAcDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect
    BRecset.Index = fcmb.BoundField
    If mListSqlExpr = "" Then
        LRecset.Open "Select * from " & fcmb.TableName & " order by " & fcmb.ListField, dbAcDatabase, adOpenKeyset, adLockOptimistic
    Else
        LRecset.Open mListSqlExpr, dbAcDatabase, adOpenKeyset, adLockOptimistic
    End If
    fcmb.ReInit
    
Else
    Err.Raise Number:=vbObjectError + 513, Description:="clsComFlexSearch_Class_ReInit_342"
End If

End Sub

Public Sub Requery()
fcmb.Requery

End Sub

Private Sub Class_Terminate()
CloseTable BRecset
CloseTable LRecset

End Sub

'''Private Sub FillList()
'''Dim srow As Long, mColCount As Integer
'''
'''If blnAchdMastList = True Then
'''    RefreshDatabase dbAcDatabase
'''ElseIf blnProdMastList = True Then
'''    RefreshDatabase dbStDatabase
'''ElseIf mMachMastList = True Or mMatProcMastList = True Then
'''    RefreshDatabase dbTlgDatabase
'''ElseIf mDeptMastList = True Or mDesgMastList = True Then
'''    RefreshDatabase dbPyrDatabase
'''ElseIf mVendMastList = True Or mEmpMastList = True Or mMachOptrList = True Or mPackPerList = True Then
'''    RefreshDatabase dbAcDatabase
'''    RefreshDatabase dbComDatabase
'''ElseIf mUserRoleList = True Or mUserMastList = True Then
'''    RefreshDatabase dbCmpDatabase
'''End If
'''BRecset.Requery: LRecset.Requery
'''
'''srow = 1
'''With LRecset
'''If .RecordCount > 0 Then
'''    .MoveFirst
'''End If
'''Do While .EOF = False
'''    fcmb.Mfgrd1.TextMatrix(srow, 0) = .Fields(fcmb.BoundField)
'''    fcmb.Mfgrd1.TextMatrix(srow, 1) = .Fields(fcmb.ListField)
'''
'''    If blnAchdMastList = True Then
'''
'''    ElseIf blnProdMastList = True Then
'''
'''    ElseIf mMachOptrList = True Then
'''
'''    ElseIf mPackPerList = True Then
'''
'''    ElseIf mMachMastList = True Then
'''
'''    ElseIf mVendMastList = True Then
'''
'''    ElseIf mMatProcMastList = True Then
'''
'''    ElseIf mEmpMastList = True Then
'''
'''    ElseIf mDeptMastList = True Then
'''
'''    ElseIf mDesgMastList = True Then
'''
'''    ElseIf mUserRoleList = True Then
'''
'''    ElseIf mUserMastList = True Then
'''
'''    End If
'''
'''    fcmb.Mfgrd1.Rows = fcmb.Mfgrd1.Rows + 1
'''    srow = srow + 1
'''
'''    .MoveNext
'''Loop
'''End With
'''For mColCount = 0 To fcmb.Mfgrd1.Cols - 1
'''    fcmb.Mfgrd1.TextMatrix(srow, mColCount) = ""
'''Next mColCount
'''fcmb.Mfgrd1.Rows = srow + 1
'''
'''SearchBoundText fcmb.BoundText  ' record position is reset after refill or requery
'''
'''End Sub

'''Private Sub SearchBoundText(ByVal mText As String)
'''Dim mMatchFound As Boolean, mSearchText As Boolean, mText1 As String
'''mMatchFound = False
'''mSearchText = True
'''Rem mText = ToMyString(mText) surely not expected but keep it
'''If BRecset.EOF = False And LRecset.EOF = False Then
'''    If BRecset.Fields(fcmb.BoundField) = LRecset.Fields(fcmb.BoundField) And BRecset.Fields(fcmb.ListField) = LRecset.Fields(fcmb.ListField) And BRecset.Fields(fcmb.BoundField) = Val(mText) Then
'''        mSearchText = False
'''    End If
'''End If
'''If mSearchText = True Then
'''    BRecset.Seek Array(Val(mText))
'''    If BRecset.EOF = False Then
'''        mText1 = ToMyString(BRecset.Fields(fcmb.ListField))
'''        LRecset.Find fcmb.ListField & " like '" & mText1 & "'", Start:=1
'''    Else
'''        MoveRecToEOF LRecset
'''    End If
'''End If
'''If BRecset.EOF = False And LRecset.EOF = False Then
'''    If BRecset.Fields(fcmb.BoundField) = LRecset.Fields(fcmb.BoundField) And BRecset.Fields(fcmb.ListField) = LRecset.Fields(fcmb.ListField) Then
'''        mMatchFound = True
'''    End If
'''End If
'''If mMatchFound = True Then
'''    fcmb.BoundText = CStr(BRecset.Fields(fcmb.BoundField))
'''    fcmb.Text = LRecset.Fields(fcmb.ListField)
'''Else
'''    fcmb.BoundText = ""
'''    fcmb.Text = ""
'''    MoveRecToEOF BRecset
'''    MoveRecToEOF LRecset
'''End If
'''If blnAchdMastList = True Then
'''
'''ElseIf blnProdMastList = True Then
'''
'''ElseIf mMachOptrList = True Then
'''
'''ElseIf mPackPerList = True Then
'''
'''ElseIf mMachMastList = True Then
'''
'''ElseIf mVendMastList = True Then
'''
'''ElseIf mMatProcMastList = True Then
'''
'''ElseIf mEmpMastList = True Then
'''
'''ElseIf mDeptMastList = True Then
'''
'''ElseIf mDesgMastList = True Then
'''
'''ElseIf mUserRoleList = True Then
'''
'''ElseIf mUserMastList = True Then
'''
'''End If
'''
'''End Sub
'''
'''Private Sub SearchText(ByVal mText As String)
'''Dim mMatchFound As Boolean, mSearchText As Boolean
'''mMatchFound = False
'''mSearchText = True
'''
'''If LRecset.EOF = False And BRecset.EOF = False Then
'''    If LRecset.Fields(fcmb.ListField) = BRecset.Fields(fcmb.ListField) And LRecset.Fields(fcmb.BoundField) = BRecset.Fields(fcmb.BoundField) And LRecset.Fields(fcmb.ListField) = mText Then
'''        mSearchText = False
'''    End If
'''End If
'''If mSearchText = True Then
'''    mText = ToMyString(mText)
'''    LRecset.Find fcmb.ListField & " like '" & mText & IIf(mText <> "", "*", "") & "'", Start:=1
'''    If LRecset.EOF = False Then
'''        BRecset.Seek Array(LRecset.Fields(fcmb.BoundField))
'''    Else
'''        MoveRecToEOF BRecset
'''    End If
'''End If
'''If LRecset.EOF = False And BRecset.EOF = False Then
'''    If LRecset.Fields(fcmb.ListField) = BRecset.Fields(fcmb.ListField) And LRecset.Fields(fcmb.BoundField) = BRecset.Fields(fcmb.BoundField) Then
'''        mMatchFound = True
'''    End If
'''End If
'''If mMatchFound = True Then
'''    fcmb.Text = LRecset.Fields(fcmb.ListField)
'''    fcmb.BoundText = CStr(BRecset.Fields(fcmb.BoundField))
'''Else
'''    fcmb.Text = ""
'''    fcmb.BoundText = ""
'''    MoveRecToEOF LRecset
'''    MoveRecToEOF BRecset
'''End If
'''If blnAchdMastList = True Then
'''
'''ElseIf blnProdMastList = True Then
'''
'''ElseIf mMachOptrList = True Then
'''
'''ElseIf mPackPerList = True Then
'''
'''ElseIf mMachMastList = True Then
'''
'''ElseIf mVendMastList = True Then
'''
'''ElseIf mMatProcMastList = True Then
'''
'''ElseIf mEmpMastList = True Then
'''
'''ElseIf mDeptMastList = True Then
'''
'''ElseIf mDesgMastList = True Then
'''
'''ElseIf mUserRoleList = True Then
'''
'''ElseIf mUserMastList = True Then
'''
'''End If
'''
'''End Sub

'''Private Sub ShowActiveFlexRow()
'''Dim mReqdRow As Long
'''
''''''With LRecset
''''''mReqdRow = .AbsolutePosition + fcmb.Mfgrd1.FixedRows - 1
''''''If .RecordCount > 0 And .EOF = False And .BOF = False Then
''''''    If fcmb.Mfgrd1.RowIsVisible(mReqdRow) = False Then
''''''        If mReqdRow > fcmb.Mfgrd1.TopRow Then
''''''            fcmb.Mfgrd1.TopRow = mReqdRow - Int(fcmb.Mfgrd1.Height / fcmb.Mfgrd1.RowHeightMin) + fcmb.Mfgrd1.FixedRows + 1
''''''        Else
''''''            fcmb.Mfgrd1.TopRow = mReqdRow
''''''        End If
''''''    End If
''''''    fcmb.Mfgrd1.Row = mReqdRow
''''''Else
''''''    fcmb.Mfgrd1.Row = fcmb.Mfgrd1.Rows - 1   '  fcmb.Mfgrd1.FixedRows
''''''End If
''''''End With
'''
'''With LRecset
'''mReqdRow = .AbsolutePosition + fcmb.Mfgrd1.FixedRows - 1
'''If .RecordCount > 0 And .EOF = False And .BOF = False Then
'''    fcmb.Mfgrd1.Row = mReqdRow
'''Else
'''    fcmb.Mfgrd1.Row = fcmb.Mfgrd1.Rows - 1   '  fcmb.Mfgrd1.FixedRows
'''End If
'''If fcmb.Mfgrd1.RowIsVisible(fcmb.Mfgrd1.Row) = False Then
'''    If fcmb.Mfgrd1.Row > fcmb.Mfgrd1.TopRow Then
'''        fcmb.Mfgrd1.TopRow = fcmb.Mfgrd1.Row - Int(fcmb.Mfgrd1.Height / fcmb.Mfgrd1.RowHeightMin) + fcmb.Mfgrd1.FixedRows + 1
'''    Else
'''        fcmb.Mfgrd1.TopRow = fcmb.Mfgrd1.Row
'''    End If
'''End If
'''End With
'''Call ShowCursor
'''
''''If Screen.ActiveControl.Name <> fcmb.Mfgrd1.Name Then
''''    fcmb.Mfgrd1_RowColChange
''''End If
'''
'''End Sub
'''
'''Private Sub ShowCursor()
'''Dim mVisibleCols As Integer, mFlexColPos As Integer, mObjColPos As Integer, srow As Long
'''
'''srow = fcmb.Mfgrd1.Row
'''mVisibleCols = 1
'''mObjColPos = 0
'''For mFlexColPos = 0 To fcmb.Mfgrd1.Cols - 1
'''    If fcmb.Mfgrd1.ColWidth(mFlexColPos) > 0 Then
'''        fcmb.txtListCol(mObjColPos).Text = fcmb.Mfgrd1.TextMatrix(srow, mFlexColPos)
'''        fcmb.txtListCol(mObjColPos).Top = fcmb.Mfgrd1.Top + fcmb.Mfgrd1.RowPos(srow)
'''        If LRecset.EOF = True Then
'''            fcmb.txtListCol(mObjColPos).BackColor = vbRed
'''        Else
'''            fcmb.txtListCol(mObjColPos).BackColor = fcmb.Mfgrd1.BackColorSel
'''        End If
'''
'''        mVisibleCols = mVisibleCols + 1
'''        mObjColPos = mObjColPos + 1
'''    End If
'''Next mFlexColPos
'''
'''End Sub
'''
'''Private Sub Data_AddEvent()
'''
'''frmAccessMaster.RemoteAccessCode = 0
'''frmAccessMaster.Show 1
'''If frmAccessMaster.EntrySaved = True Then
'''    Call FillList
'''    SearchBoundText CStr(frmAccessMaster.EntryBoundCode)
'''    UserText = Array(fcmb.Text, Len(fcmb.Text))
'''End If
'''Unload frmAccessMaster
'''
'''If blnAchdMastList = True Then
'''
'''ElseIf blnProdMastList = True Then
'''
'''ElseIf mMachOptrList = True Then
'''
'''ElseIf mPackPerList = True Then
'''
'''ElseIf mMachMastList = True Then
'''
'''ElseIf mVendMastList = True Then
'''
'''ElseIf mMatProcMastList = True Then
'''
'''ElseIf mEmpMastList = True Then
'''
'''ElseIf mDeptMastList = True Then
'''
'''ElseIf mDesgMastList = True Then
'''
'''ElseIf mUserRoleList = True Then
'''
'''ElseIf mUserMastList = True Then
'''
'''End If
'''
'''End Sub
'''
'''Private Sub Data_EditEvent()
'''
'''End Sub
'''
'''Private Sub Data_DeleteEvent()
'''
'''End Sub
'''
