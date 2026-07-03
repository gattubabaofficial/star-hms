VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "clsPyrFlexSearch"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit

Public fcmb As New frmFlexSearchList
Public dbAcDatabase As ADODB.Connection, dbStDatabase As ADODB.Connection, dbTlgDatabase As ADODB.Connection, dbPyrDatabase As ADODB.Connection, dbComDatabase As ADODB.Connection, dbCmpDatabase As ADODB.Connection
Rem Public mAchdMastList As Boolean, mProdMastList As Boolean
Rem Public mMachOptrList As Boolean, mMachMastList As Boolean, mPackPerList As Boolean, mMatProcMastList As Boolean, mVendMastList As Boolean
Public blnEmpMastList As Boolean, blnDeptMastList As Boolean, blnDesgMastList As Boolean
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

''ElseIf mMachOptrList = True Then
''    fcmb.lblFormHeading.Caption = "Machine Operator Master"
''    fcmb.TableName = "AchdMast"
''    fcmb.BoundField = "AhCode"
''    fcmb.ListField = "AhName"
''
''    fcmb.lblSearchCaption.Caption = "Name:"
''
''    BRecset.Open fcmb.TableName, dbAcDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect
''    BRecset.Index = fcmb.BoundField
''
''    LRecset.Open "Select * from " & fcmb.TableName & " inner join EmpMast on " & fcmb.TableName & ".AhCode=EmpMast.EmpCode order by " & fcmb.ListField, dbComDatabase, adOpenKeyset, adLockOptimistic
''
''    fcmb.Mfgrd1.Cols = 2
''    fcmb.Mfgrd1.ColWidth(0) = 0: fcmb.Mfgrd1.TextMatrix(0, 0) = "BoundText"
''    fcmb.Mfgrd1.ColWidth(1) = 3000: fcmb.Mfgrd1.TextMatrix(0, 1) = "Operator Name": fcmb.Mfgrd1.ColAlignment(1) = 1
''
''ElseIf mMachMastList = True Then
''    fcmb.lblFormHeading.Caption = "Machine Master"
''    fcmb.TableName = "MachMast"
''    fcmb.BoundField = "MacCode"
''    fcmb.ListField = "MacName"
''
''    fcmb.lblSearchCaption.Caption = "Name:"
''
''    BRecset.Open fcmb.TableName, dbTlgDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect
''    BRecset.Index = fcmb.BoundField
''
''    LRecset.Open "Select * from " & fcmb.TableName & " order by " & fcmb.ListField, dbTlgDatabase, adOpenKeyset, adLockOptimistic
''
''    fcmb.Mfgrd1.Cols = 2
''    fcmb.Mfgrd1.ColWidth(0) = 0: fcmb.Mfgrd1.TextMatrix(0, 0) = "BoundText"
''    fcmb.Mfgrd1.ColWidth(1) = 3000: fcmb.Mfgrd1.TextMatrix(0, 1) = "Machine Name": fcmb.Mfgrd1.ColAlignment(1) = 1
''ElseIf mPackPerList = True Then
''    fcmb.lblFormHeading.Caption = "Packing Person Master"
''    fcmb.TableName = "AchdMast"
''    fcmb.BoundField = "AhCode"
''    fcmb.ListField = "AhName"
''
''    fcmb.lblSearchCaption.Caption = "Name:"
''
''    BRecset.Open fcmb.TableName, dbAcDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect
''    BRecset.Index = fcmb.BoundField
''
''    LRecset.Open "Select * from " & fcmb.TableName & " inner join EmpMast on " & fcmb.TableName & ".AhCode=EmpMast.EmpCode order by " & fcmb.ListField, dbComDatabase, adOpenKeyset, adLockOptimistic
''
''    fcmb.Mfgrd1.Cols = 2
''    fcmb.Mfgrd1.ColWidth(0) = 0: fcmb.Mfgrd1.TextMatrix(0, 0) = "BoundText"
''    fcmb.Mfgrd1.ColWidth(1) = 3000: fcmb.Mfgrd1.TextMatrix(0, 1) = "Packing Person": fcmb.Mfgrd1.ColAlignment(1) = 1
''
''ElseIf mMatProcMastList = True Then
''    fcmb.lblFormHeading.Caption = "Material Process Master"
''    fcmb.TableName = "MatProcMast"
''    fcmb.BoundField = "MprCode"
''    fcmb.ListField = "MprName"
''
''    fcmb.lblSearchCaption.Caption = "Name:"
''
''    BRecset.Open fcmb.TableName, dbTlgDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect
''    BRecset.Index = fcmb.BoundField
''
''    LRecset.Open "Select * from " & fcmb.TableName & " order by " & fcmb.ListField, dbTlgDatabase, adOpenKeyset, adLockOptimistic
''
''    fcmb.Mfgrd1.Cols = 2
''    fcmb.Mfgrd1.ColWidth(0) = 0: fcmb.Mfgrd1.TextMatrix(0, 0) = "BoundText"
''    fcmb.Mfgrd1.ColWidth(1) = 3000: fcmb.Mfgrd1.TextMatrix(0, 1) = "Process Name": fcmb.Mfgrd1.ColAlignment(1) = 1
''
''ElseIf mVendMastList = True Then
''    fcmb.lblFormHeading.Caption = "Vendor Master"
''    fcmb.TableName = "AchdMast"
''    fcmb.BoundField = "AhCode"
''    fcmb.ListField = "AhName"
''
''    fcmb.lblSearchCaption.Caption = "Name:"
''
''    BRecset.Open fcmb.TableName, dbAcDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect
''    BRecset.Index = fcmb.BoundField
''
''    LRecset.Open "Select * from " & fcmb.TableName & " inner join UserRightMst on " & fcmb.TableName & ".AhCode=VendMast.UhtCode order by " & fcmb.ListField, dbComDatabase, adOpenKeyset, adLockOptimistic
''
''    fcmb.Mfgrd1.Cols = 2
''    fcmb.Mfgrd1.ColWidth(0) = 0: fcmb.Mfgrd1.TextMatrix(0, 0) = "BoundText"
''    fcmb.Mfgrd1.ColWidth(1) = 3000: fcmb.Mfgrd1.TextMatrix(0, 1) = "Vendor Name": fcmb.Mfgrd1.ColAlignment(1) = 1
    
If blnEmpMastList = True Then
    Load fcmb
    fcmb.lblFormHeading.Caption = "Employee Master"
    fcmb.TableName = "EmpMast"
    fcmb.BoundField = "EmpCode"
    fcmb.ListField = "EmpName"
    fcmb.lblSearchCaption.Caption = "Name:"
    
    BRecset.open fcmb.TableName, dbPyrDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect
    BRecset.Index = fcmb.BoundField
    LRecset.open "Select * from " & fcmb.TableName & " left join AchdMast on " & fcmb.TableName & ".EmpAhCode=AchdMast.AhCode order by " & fcmb.ListField, dbComDatabase, adOpenKeyset, adLockOptimistic
    
    Set fcmb.BRecset = BRecset
    Set fcmb.LRecset = LRecset
    Set fcmb.frmAccessMaster = New frmEmployeeMast
    
    fcmb.ClearFlexColList
    fcmb.AddFlexColList mFldName:="EmpCode", mFldTitle:="EmpCode", mFldWidth:=0, mFldAlign:=8
    fcmb.AddFlexColList mFldName:="EmpName", mFldTitle:="Employee Name", mFldWidth:=3000, mFldAlign:=1
    
    fcmb.Init
ElseIf blnDeptMastList = True Then
    Load fcmb
    fcmb.lblFormHeading.Caption = "Department Master"
    fcmb.TableName = "DeptMast"
    fcmb.BoundField = "DptCode"
    fcmb.ListField = "DptName"
    fcmb.lblSearchCaption.Caption = "Name:"
    
    BRecset.open fcmb.TableName, dbPyrDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect
    BRecset.Index = fcmb.BoundField
    LRecset.open "Select * from " & fcmb.TableName & " order by " & fcmb.ListField, dbPyrDatabase, adOpenKeyset, adLockOptimistic
    
    Set fcmb.BRecset = BRecset
    Set fcmb.LRecset = LRecset
    Set fcmb.frmAccessMaster = New frmDepartmentMast
    
    fcmb.ClearFlexColList
    fcmb.AddFlexColList mFldName:="DptCode", mFldTitle:="DptCode", mFldWidth:=0, mFldAlign:=8
    fcmb.AddFlexColList mFldName:="DptName", mFldTitle:="Department Name", mFldWidth:=3000, mFldAlign:=1
    
    fcmb.Init
ElseIf blnDesgMastList = True Then
    Load fcmb
    fcmb.lblFormHeading.Caption = "Designation Master"
    fcmb.TableName = "DesgMast"
    fcmb.BoundField = "DsgCode"
    fcmb.ListField = "DsgName"
    fcmb.lblSearchCaption.Caption = "Name:"
    
    BRecset.open fcmb.TableName, dbPyrDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect
    BRecset.Index = fcmb.BoundField
    LRecset.open "Select * from " & fcmb.TableName & " order by " & fcmb.ListField, dbPyrDatabase, adOpenKeyset, adLockOptimistic
    
    Set fcmb.BRecset = BRecset
    Set fcmb.LRecset = LRecset
    Set fcmb.frmAccessMaster = New frmDesignationMast
    
    fcmb.ClearFlexColList
    fcmb.AddFlexColList mFldName:="DsgCode", mFldTitle:="DsgCode", mFldWidth:=0, mFldAlign:=8
    fcmb.AddFlexColList mFldName:="DsgName", mFldTitle:="Designation Name", mFldWidth:=3000, mFldAlign:=1
    
    fcmb.Init
Else
    Err.Raise Number:=vbObjectError + 513, Description:="clsVgnFlexSearch_Class_Initialize_263"
End If

End Sub

Private Sub Class_Terminate()
CloseTable BRecset
CloseTable LRecset

End Sub

'''Private Sub FillList()
'''Dim srow As Long, mColCount As Integer
'''
'''If mAchdMastList = True Then
'''    RefreshDatabase dbAcDatabase
'''ElseIf mProdMastList = True Then
'''    RefreshDatabase dbStDatabase
'''ElseIf mMachMastList = True Or mMatProcMastList = True Then
'''    RefreshDatabase dbTlgDatabase
'''ElseIf blnDeptMastList = True Or blnDesgMastList = True Then
'''    RefreshDatabase dbPyrDatabase
'''ElseIf mVendMastList = True Or blnEmpMastList = True Or mMachOptrList = True Or mPackPerList = True Then
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
'''    If mAchdMastList = True Then
'''
'''    ElseIf mProdMastList = True Then
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
'''    ElseIf blnEmpMastList = True Then
'''
'''    ElseIf blnDeptMastList = True Then
'''
'''    ElseIf blnDesgMastList = True Then
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
'''If mAchdMastList = True Then
'''
'''ElseIf mProdMastList = True Then
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
'''ElseIf blnEmpMastList = True Then
'''
'''ElseIf blnDeptMastList = True Then
'''
'''ElseIf blnDesgMastList = True Then
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
'''If mAchdMastList = True Then
'''
'''ElseIf mProdMastList = True Then
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
'''ElseIf blnEmpMastList = True Then
'''
'''ElseIf blnDeptMastList = True Then
'''
'''ElseIf blnDesgMastList = True Then
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
'''If mAchdMastList = True Then
'''
'''ElseIf mProdMastList = True Then
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
'''ElseIf blnEmpMastList = True Then
'''
'''ElseIf blnDeptMastList = True Then
'''
'''ElseIf blnDesgMastList = True Then
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
