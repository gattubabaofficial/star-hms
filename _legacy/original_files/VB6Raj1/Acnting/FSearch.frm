VERSION 5.00
Object = "{5E9E78A0-531B-11CF-91F6-C2863C385E30}#1.0#0"; "MSFLXGRD.OCX"
Begin VB.Form frmFlexSearchList 
   Appearance      =   0  'Flat
   BackColor       =   &H80000005&
   ClientHeight    =   6630
   ClientLeft      =   60
   ClientTop       =   60
   ClientWidth     =   9570
   ControlBox      =   0   'False
   BeginProperty Font 
      Name            =   "Verdana"
      Size            =   8.25
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   ScaleHeight     =   6630
   ScaleWidth      =   9570
   ShowInTaskbar   =   0   'False
   StartUpPosition =   1  'CenterOwner
   Begin VB.TextBox txtListCol 
      Appearance      =   0  'Flat
      Height          =   285
      Index           =   0
      Left            =   240
      TabIndex        =   6
      TabStop         =   0   'False
      Top             =   2040
      Width           =   1335
   End
   Begin VB.CommandButton cmdFormEnter 
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      Default         =   -1  'True
      BeginProperty Font 
         Name            =   "Arial Black"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   9120
      MaskColor       =   &H000000FF&
      TabIndex        =   4
      TabStop         =   0   'False
      Top             =   0
      UseMaskColor    =   -1  'True
      Width           =   255
   End
   Begin VB.CommandButton cmdFormEscape 
      Appearance      =   0  'Flat
      BackColor       =   &H008080FF&
      Cancel          =   -1  'True
      Caption         =   "X"
      BeginProperty Font 
         Name            =   "Arial Black"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   8640
      MaskColor       =   &H000000FF&
      Style           =   1  'Graphical
      TabIndex        =   3
      TabStop         =   0   'False
      Top             =   0
      Width           =   255
   End
   Begin MSFlexGridLib.MSFlexGrid Mfgrd1 
      Height          =   4935
      Left            =   240
      TabIndex        =   1
      Top             =   1080
      Width           =   8655
      _ExtentX        =   15266
      _ExtentY        =   8705
      _Version        =   393216
      RowHeightMin    =   315
      AllowBigSelection=   0   'False
      FocusRect       =   0
      HighLight       =   0
      SelectionMode   =   1
      Appearance      =   0
   End
   Begin VB.TextBox txtSearchText 
      Appearance      =   0  'Flat
      Height          =   285
      Left            =   1680
      TabIndex        =   0
      Top             =   600
      Width           =   4215
   End
   Begin VB.Label lblFormHeading 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00E0E0E0&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Form Heading"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   375
      Left            =   0
      TabIndex        =   5
      Top             =   0
      Width           =   9015
   End
   Begin VB.Label lblSearchCaption 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   "Label1"
      ForeColor       =   &H80000008&
      Height          =   285
      Left            =   240
      TabIndex        =   2
      Top             =   600
      Width           =   1455
   End
End
Attribute VB_Name = "frmFlexSearchList"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Public dbAcDatabase As ADODB.Connection, dbStDatabase As ADODB.Connection, dbTlgDatabase As ADODB.Connection, dbPyrDatabase As ADODB.Connection, dbComDatabase As ADODB.Connection
Public mAchdMastList As Boolean, mProdMastList As Boolean
Public mMachOptrList As Boolean, mMachMastList As Boolean, mPackPerList As Boolean, mMatProcMastList As Boolean, mVendMastList As Boolean
Public mEmpMastList As Boolean, mDeptMastList As Boolean, mDesgMastList As Boolean
Public frmAccessMaster As Form
Dim BRecset As New ADODB.Recordset, LRecset As New ADODB.Recordset
Dim m_BoundText As String, m_Text As String, m_CallFromText_Change As Boolean, m_CallFromBoundText_Change As Boolean
Dim mTableName As String, mBoundField As String, mListField As String
Dim mFormLoaded As Boolean, mLastKeyPressed As Integer

Public Property Get BoundText() As String
BoundText = m_BoundText
End Property

Public Property Let BoundText(ByVal mText As String)
SearchBoundText mText
End Property

Public Property Get Text() As String
Text = m_Text
End Property

Public Property Let Text(ByVal mText As String)
SearchText mText
End Property

Rem mUserPara(0) = User Text
Rem mUserPara(1) = Cursor position
Public Property Let UserText(ByRef mUserPara As Variant)
If UCase(Left(m_Text, 1)) = UCase(mUserPara(0)) Then
    txtSearchText.Text = m_Text
Else
    txtSearchText.Text = mUserPara(0)
End If
txtSearchText.SelStart = mUserPara(1)
txtSearchText.SelLength = Len(txtSearchText.Text) - mUserPara(1)

End Property

Public Property Get CallFromText_Change() As Boolean
CallFromText_Change = m_CallFromText_Change
End Property

Public Property Let CallFromText_Change(ByVal mTrueFalse As Boolean)
m_CallFromText_Change = mTrueFalse
End Property

Public Property Get CallFromBoundText_Change() As Boolean
CallFromBoundText_Change = m_CallFromBoundText_Change
End Property

Public Property Let CallFromBoundText_Change(ByVal mTrueFalse As Boolean)
m_CallFromBoundText_Change = mTrueFalse
End Property

Private Sub cmdFormEnter_Click()
mLastKeyPressed = 13
Me.Hide

End Sub

Private Sub cmdFormEscape_Click()
mLastKeyPressed = 27
If Screen.ActiveControl.Name = Mfgrd1.Name Then
    txtSearchText.SetFocus
ElseIf txtSearchText.Text <> "" Then
    txtSearchText.Text = ""
    txtSearchText.SetFocus
Else
    Me.Hide
End If

End Sub

Private Sub Form_Activate()
If mFormLoaded = False Then
    Call FillList
    
    mFormLoaded = True
Else
    
End If
Call ShowActiveFlexRow

End Sub

Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)
mLastKeyPressed = KeyCode
End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)
mLastKeyPressed = KeyAscii
End Sub

Private Sub Form_Load()
Dim mFlexColPos As Integer, mVisibleCols As Integer, mObjColPos As Integer
mFormLoaded = False
Call Form_Resize

Mfgrd1.Height = Int(Mfgrd1.Height / Mfgrd1.RowHeightMin) * Mfgrd1.RowHeightMin
Mfgrd1.Rows = 2: Mfgrd1.FixedRows = 1: Mfgrd1.FixedCols = 1
If mAchdMastList = True Then
    lblFormHeading.Caption = "Account Head Master"
    mTableName = "AchdMast"
    mBoundField = "AhCode"
    mListField = "AhName"
    
    lblSearchCaption.Caption = "Name:"
    
    BRecset.Open mTableName, dbAcDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect
    BRecset.Index = mBoundField
    
    LRecset.Open "Select * from " & mTableName & " order by " & mListField, dbAcDatabase, adOpenKeyset, adLockOptimistic
    
    Mfgrd1.Cols = 2
    Mfgrd1.ColWidth(0) = 0: Mfgrd1.TextMatrix(0, 0) = "BoundText"
    Mfgrd1.ColWidth(1) = 3000: Mfgrd1.TextMatrix(0, 1) = "Account Name": Mfgrd1.ColAlignment(1) = 1
    
ElseIf mProdMastList = True Then
    lblFormHeading.Caption = "Product Master"
    mTableName = "ProdMast"
    mBoundField = "ItmCode"
    mListField = "ItmName"

    lblSearchCaption.Caption = "Name:"
    
    BRecset.Open mTableName, dbStDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect
    BRecset.Index = mBoundField
    
    LRecset.Open "Select * from " & mTableName & " order by " & mListField, dbStDatabase, adOpenKeyset, adLockOptimistic
    
    Mfgrd1.Cols = 2
    Mfgrd1.ColWidth(0) = 0: Mfgrd1.TextMatrix(0, 0) = "BoundText"
    Mfgrd1.ColWidth(1) = 3000: Mfgrd1.TextMatrix(0, 1) = "Product Name": Mfgrd1.ColAlignment(1) = 1
    
ElseIf mMachOptrList = True Then
    lblFormHeading.Caption = "Machine Operator Master"
    mTableName = "AchdMast"
    mBoundField = "AhCode"
    mListField = "AhName"
    
    lblSearchCaption.Caption = "Name:"
    
    BRecset.Open mTableName, dbAcDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect
    BRecset.Index = mBoundField
    
    LRecset.Open "Select * from " & mTableName & " inner join EmpMast on " & mTableName & ".AhCode=EmpMast.EmpCode order by " & mListField, dbComDatabase, adOpenKeyset, adLockOptimistic
    
    Mfgrd1.Cols = 2
    Mfgrd1.ColWidth(0) = 0: Mfgrd1.TextMatrix(0, 0) = "BoundText"
    Mfgrd1.ColWidth(1) = 3000: Mfgrd1.TextMatrix(0, 1) = "Operator Name": Mfgrd1.ColAlignment(1) = 1
    
ElseIf mMachMastList = True Then
    lblFormHeading.Caption = "Machine Master"
    mTableName = "MachMast"
    mBoundField = "MacCode"
    mListField = "MacName"
    
    lblSearchCaption.Caption = "Name:"
    
    BRecset.Open mTableName, dbTlgDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect
    BRecset.Index = mBoundField
    
    LRecset.Open "Select * from " & mTableName & " order by " & mListField, dbTlgDatabase, adOpenKeyset, adLockOptimistic
    
    Mfgrd1.Cols = 2
    Mfgrd1.ColWidth(0) = 0: Mfgrd1.TextMatrix(0, 0) = "BoundText"
    Mfgrd1.ColWidth(1) = 3000: Mfgrd1.TextMatrix(0, 1) = "Machine Name": Mfgrd1.ColAlignment(1) = 1
ElseIf mPackPerList = True Then
    lblFormHeading.Caption = "Packing Person Master"
    mTableName = "AchdMast"
    mBoundField = "AhCode"
    mListField = "AhName"
    
    lblSearchCaption.Caption = "Name:"
    
    BRecset.Open mTableName, dbAcDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect
    BRecset.Index = mBoundField
    
    LRecset.Open "Select * from " & mTableName & " inner join EmpMast on " & mTableName & ".AhCode=EmpMast.EmpCode order by " & mListField, dbComDatabase, adOpenKeyset, adLockOptimistic
    
    Mfgrd1.Cols = 2
    Mfgrd1.ColWidth(0) = 0: Mfgrd1.TextMatrix(0, 0) = "BoundText"
    Mfgrd1.ColWidth(1) = 3000: Mfgrd1.TextMatrix(0, 1) = "Packing Person": Mfgrd1.ColAlignment(1) = 1
    
ElseIf mMatProcMastList = True Then
    lblFormHeading.Caption = "Material Process Master"
    mTableName = "MatProcMast"
    mBoundField = "MprCode"
    mListField = "MprName"
    
    lblSearchCaption.Caption = "Name:"
    
    BRecset.Open mTableName, dbTlgDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect
    BRecset.Index = mBoundField
    
    LRecset.Open "Select * from " & mTableName & " order by " & mListField, dbTlgDatabase, adOpenKeyset, adLockOptimistic
    
    Mfgrd1.Cols = 2
    Mfgrd1.ColWidth(0) = 0: Mfgrd1.TextMatrix(0, 0) = "BoundText"
    Mfgrd1.ColWidth(1) = 3000: Mfgrd1.TextMatrix(0, 1) = "Process Name": Mfgrd1.ColAlignment(1) = 1

ElseIf mVendMastList = True Then
    lblFormHeading.Caption = "Vendor Master"
    mTableName = "AchdMast"
    mBoundField = "AhCode"
    mListField = "AhName"
    
    lblSearchCaption.Caption = "Name:"
    
    BRecset.Open mTableName, dbAcDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect
    BRecset.Index = mBoundField
    
    LRecset.Open "Select * from " & mTableName & " inner join VendMast on " & mTableName & ".AhCode=VendMast.VndCode order by " & mListField, dbComDatabase, adOpenKeyset, adLockOptimistic
    
    Mfgrd1.Cols = 2
    Mfgrd1.ColWidth(0) = 0: Mfgrd1.TextMatrix(0, 0) = "BoundText"
    Mfgrd1.ColWidth(1) = 3000: Mfgrd1.TextMatrix(0, 1) = "Vendor Name": Mfgrd1.ColAlignment(1) = 1
    
ElseIf mEmpMastList = True Then
    lblFormHeading.Caption = "Employee Master"
    mTableName = "AchdMast"
    mBoundField = "AhCode"
    mListField = "AhName"
    
    lblSearchCaption.Caption = "Name:"
    
    BRecset.Open mTableName, dbAcDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect
    BRecset.Index = mBoundField
    
    LRecset.Open "Select * from " & mTableName & " inner join EmpMast on " & mTableName & ".AhCode=EmpMast.EmpCode order by " & mListField, dbComDatabase, adOpenKeyset, adLockOptimistic
    
    Mfgrd1.Cols = 2
    Mfgrd1.ColWidth(0) = 0: Mfgrd1.TextMatrix(0, 0) = "BoundText"
    Mfgrd1.ColWidth(1) = 3000: Mfgrd1.TextMatrix(0, 1) = "Employee Name": Mfgrd1.ColAlignment(1) = 1
    
ElseIf mDeptMastList = True Then
    lblFormHeading.Caption = "Department Master"
    mTableName = "DeptMast"
    mBoundField = "DptCode"
    mListField = "DptName"
    
    lblSearchCaption.Caption = "Name:"
    
    BRecset.Open mTableName, dbPyrDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect
    BRecset.Index = mBoundField
    
    LRecset.Open "Select * from " & mTableName & " order by " & mListField, dbPyrDatabase, adOpenKeyset, adLockOptimistic
    
    Mfgrd1.Cols = 2
    Mfgrd1.ColWidth(0) = 0: Mfgrd1.TextMatrix(0, 0) = "BoundText"
    Mfgrd1.ColWidth(1) = 3000: Mfgrd1.TextMatrix(0, 1) = "Department Name": Mfgrd1.ColAlignment(1) = 1

ElseIf mDesgMastList = True Then
    lblFormHeading.Caption = "Designation Master"
    mTableName = "DesgMast"
    mBoundField = "DsgCode"
    mListField = "DsgName"
    
    lblSearchCaption.Caption = "Name:"
    
    BRecset.Open mTableName, dbPyrDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect
    BRecset.Index = mBoundField
    
    LRecset.Open "Select * from " & mTableName & " order by " & mListField, dbPyrDatabase, adOpenKeyset, adLockOptimistic
    
    Mfgrd1.Cols = 2
    Mfgrd1.ColWidth(0) = 0: Mfgrd1.TextMatrix(0, 0) = "BoundText"
    Mfgrd1.ColWidth(1) = 3000: Mfgrd1.TextMatrix(0, 1) = "Designation Name": Mfgrd1.ColAlignment(1) = 1
    
Else
    Err.Raise Number:=vbObjectError + 513, Description:="frmFlexSearchList_Form_Load_98"
End If

mVisibleCols = 1
mObjColPos = 0
For mFlexColPos = 0 To Mfgrd1.Cols - 1
    If Mfgrd1.ColWidth(mFlexColPos) > 0 Then
        If txtListCol.Count < mVisibleCols Then
            Load txtListCol(mObjColPos)
        End If
        txtListCol(mObjColPos).Visible = True
        txtListCol(mObjColPos).ZOrder 0
        txtListCol(mObjColPos).Left = Mfgrd1.Left + Mfgrd1.ColPos(mFlexColPos)
        txtListCol(mObjColPos).Width = Mfgrd1.ColWidth(mFlexColPos)
        txtListCol(mObjColPos).Height = Mfgrd1.RowHeightMin
        'txtListCol(mObjColPos).Enabled = True
        txtListCol(mObjColPos).BackColor = Mfgrd1.BackColorSel
        txtListCol(mObjColPos).ForeColor = Mfgrd1.ForeColorSel
        txtListCol(mObjColPos).Alignment = TextAlignFromFlex(Mfgrd1.ColAlignment(mFlexColPos))
        
        mVisibleCols = mVisibleCols + 1
        mObjColPos = mObjColPos + 1
    End If
Next mFlexColPos

End Sub

Private Sub Form_Resize()
lblFormHeading.Width = Me.Width
cmdFormEscape.Left = Me.Width - (cmdFormEscape.Width * 2)
cmdFormEnter.Left = Me.Width + cmdFormEscape.Width

End Sub

Private Sub Form_Unload(Cancel As Integer)
Set frmAccessMaster = Nothing
CloseTable BRecset
CloseTable LRecset

End Sub

Private Sub FillList()
Dim srow As Long, mColCount As Integer

If mAchdMastList = True Then
    RefreshDatabase dbAcDatabase
ElseIf mProdMastList = True Then
    RefreshDatabase dbStDatabase
ElseIf mMachMastList = True Or mMatProcMastList = True Then
    RefreshDatabase dbTlgDatabase
ElseIf mDeptMastList = True Or mDesgMastList = True Then
    RefreshDatabase dbPyrDatabase
ElseIf mVendMastList = True Or mEmpMastList = True Or mMachOptrList = True Or mPackPerList = True Then
    RefreshDatabase dbAcDatabase
    RefreshDatabase dbComDatabase
End If
BRecset.Requery: LRecset.Requery

srow = 1
With LRecset
If .RecordCount > 0 Then
    .MoveFirst
End If
Do While .EOF = False
    Mfgrd1.TextMatrix(srow, 0) = .Fields(mBoundField)
    Mfgrd1.TextMatrix(srow, 1) = .Fields(mListField)
    
    If mAchdMastList = True Then
    
    ElseIf mProdMastList = True Then
    
    ElseIf mMachOptrList = True Then
    
    ElseIf mPackPerList = True Then
    
    ElseIf mMachMastList = True Then
    
    ElseIf mVendMastList = True Then
    
    ElseIf mMatProcMastList = True Then
    
    ElseIf mEmpMastList = True Then
    
    ElseIf mDeptMastList = True Then
    
    ElseIf mDesgMastList = True Then
    
    End If
    
    Mfgrd1.Rows = Mfgrd1.Rows + 1
    srow = srow + 1
    
    .MoveNext
Loop
End With
For mColCount = 0 To Mfgrd1.Cols - 1
    Mfgrd1.TextMatrix(srow, mColCount) = ""
Next mColCount
Mfgrd1.Rows = srow + 1

SearchBoundText m_BoundText  ' record position is reset after refill or requery

End Sub

Private Sub SearchBoundText(ByVal mText As String)
Dim mMatchFound As Boolean, mSearchText As Boolean, mText1 As String
mMatchFound = False
mSearchText = True
Rem mText = ToMyString(mText) surely not expected but keep it
If BRecset.EOF = False And LRecset.EOF = False Then
    If BRecset.Fields(mBoundField) = LRecset.Fields(mBoundField) And BRecset.Fields(mListField) = LRecset.Fields(mListField) And BRecset.Fields(mBoundField) = Val(mText) Then
        mSearchText = False
    End If
End If
If mSearchText = True Then
    BRecset.Seek Array(Val(mText))
    If BRecset.EOF = False Then
        mText1 = ToMyString(BRecset.Fields(mListField))
        LRecset.Find mListField & " like '" & mText1 & "'", Start:=1
    Else
        MoveRecToEOF LRecset
    End If
End If
If BRecset.EOF = False And LRecset.EOF = False Then
    If BRecset.Fields(mBoundField) = LRecset.Fields(mBoundField) And BRecset.Fields(mListField) = LRecset.Fields(mListField) Then
        mMatchFound = True
    End If
End If
If mMatchFound = True Then
    m_BoundText = CStr(BRecset.Fields(mBoundField))
    m_Text = LRecset.Fields(mListField)
Else
    m_BoundText = ""
    m_Text = ""
    MoveRecToEOF BRecset
    MoveRecToEOF LRecset
End If
If mAchdMastList = True Then

ElseIf mProdMastList = True Then

ElseIf mMachOptrList = True Then

ElseIf mPackPerList = True Then

ElseIf mMachMastList = True Then

ElseIf mVendMastList = True Then

ElseIf mMatProcMastList = True Then

ElseIf mEmpMastList = True Then

ElseIf mDeptMastList = True Then

ElseIf mDesgMastList = True Then

End If

End Sub

Private Sub SearchText(ByVal mText As String)
Dim mMatchFound As Boolean, mSearchText As Boolean
mMatchFound = False
mSearchText = True

If LRecset.EOF = False And BRecset.EOF = False Then
    If LRecset.Fields(mListField) = BRecset.Fields(mListField) And LRecset.Fields(mBoundField) = BRecset.Fields(mBoundField) And LRecset.Fields(mListField) = mText Then
        mSearchText = False
    End If
End If
If mSearchText = True Then
    mText = ToMyString(mText)
    LRecset.Find mListField & " like '" & mText & IIf(mText <> "", "*", "") & "'", Start:=1
    If LRecset.EOF = False Then
        BRecset.Seek Array(LRecset.Fields(mBoundField))
    Else
        MoveRecToEOF BRecset
    End If
End If
If LRecset.EOF = False And BRecset.EOF = False Then
    If LRecset.Fields(mListField) = BRecset.Fields(mListField) And LRecset.Fields(mBoundField) = BRecset.Fields(mBoundField) Then
        mMatchFound = True
    End If
End If
If mMatchFound = True Then
    m_Text = LRecset.Fields(mListField)
    m_BoundText = CStr(BRecset.Fields(mBoundField))
Else
    m_Text = ""
    m_BoundText = ""
    MoveRecToEOF LRecset
    MoveRecToEOF BRecset
End If
If mAchdMastList = True Then

ElseIf mProdMastList = True Then

ElseIf mMachOptrList = True Then

ElseIf mPackPerList = True Then

ElseIf mMachMastList = True Then

ElseIf mVendMastList = True Then

ElseIf mMatProcMastList = True Then

ElseIf mEmpMastList = True Then

ElseIf mDeptMastList = True Then

ElseIf mDesgMastList = True Then

End If

End Sub

Private Sub Mfgrd1_DblClick()
Call cmdFormEnter_Click
End Sub

Private Sub Mfgrd1_GotFocus()
Mfgrd1.Col = FlexLeftVisibleCol(Mfgrd1)
If Mfgrd1.SelectionMode = flexSelectionByRow Then
    'Mfgrd1.ColSel = 0: Mfgrd1.ColSel = Mfgrd1.Cols - 1
End If
Call Mfgrd1_RowColChange

End Sub

Private Sub Mfgrd1_KeyDown(KeyCode As Integer, Shift As Integer)
If KeyCode = vbKeyAdd Then '   43:    ' plus (+)
    Call Data_AddEvent
ElseIf KeyCode = vbKeySubtract Then   ' :    ' minus (-)
    If Mfgrd1.Row < Mfgrd1.Rows - 1 Then
        Call Data_DeleteEvent
    End If
ElseIf Shift = vbCtrlMask And KeyCode = vbKeyReturn Then
    Rem pending
End If

End Sub

Private Sub Mfgrd1_RowColChange()

With LRecset
If .RecordCount > 0 Then
    If .AbsolutePosition <> Mfgrd1.Row - Mfgrd1.FixedRows + 1 Then
        .MoveFirst
        .Move Mfgrd1.Row - Mfgrd1.FixedRows, 1     ' Mfgrd1.Row is already less by one
    End If
End If
If InterActiveChange(Mfgrd1) = True Then
    If .EOF = False And .BOF = False Then
        txtSearchText.Text = .Fields(mListField)
    Else
        txtSearchText.Text = ""
    End If
End If
End With
Call ShowCursor

End Sub

Private Sub ShowActiveFlexRow()
Dim mReqdRow As Long

'''With LRecset
'''mReqdRow = .AbsolutePosition + Mfgrd1.FixedRows - 1
'''If .RecordCount > 0 And .EOF = False And .BOF = False Then
'''    If Mfgrd1.RowIsVisible(mReqdRow) = False Then
'''        If mReqdRow > Mfgrd1.TopRow Then
'''            Mfgrd1.TopRow = mReqdRow - Int(Mfgrd1.Height / Mfgrd1.RowHeightMin) + Mfgrd1.FixedRows + 1
'''        Else
'''            Mfgrd1.TopRow = mReqdRow
'''        End If
'''    End If
'''    Mfgrd1.Row = mReqdRow
'''Else
'''    Mfgrd1.Row = Mfgrd1.Rows - 1   '  Mfgrd1.FixedRows
'''End If
'''End With

With LRecset
mReqdRow = .AbsolutePosition + Mfgrd1.FixedRows - 1
If .RecordCount > 0 And .EOF = False And .BOF = False Then
    Mfgrd1.Row = mReqdRow
Else
    Mfgrd1.Row = Mfgrd1.Rows - 1   '  Mfgrd1.FixedRows
End If
If Mfgrd1.RowIsVisible(Mfgrd1.Row) = False Then
    If Mfgrd1.Row > Mfgrd1.TopRow Then
        Mfgrd1.TopRow = Mfgrd1.Row - Int(Mfgrd1.Height / Mfgrd1.RowHeightMin) + Mfgrd1.FixedRows + 1
    Else
        Mfgrd1.TopRow = Mfgrd1.Row
    End If
End If
End With
Call ShowCursor

'If Screen.ActiveControl.Name <> Mfgrd1.Name Then
'    Mfgrd1_RowColChange
'End If

End Sub

Private Sub ShowCursor()
Dim mVisibleCols As Integer, mFlexColPos As Integer, mObjColPos As Integer, srow As Long

srow = Mfgrd1.Row
mVisibleCols = 1
mObjColPos = 0
For mFlexColPos = 0 To Mfgrd1.Cols - 1
    If Mfgrd1.ColWidth(mFlexColPos) > 0 Then
        txtListCol(mObjColPos).Text = Mfgrd1.TextMatrix(srow, mFlexColPos)
        txtListCol(mObjColPos).Top = Mfgrd1.Top + Mfgrd1.RowPos(srow)
        If LRecset.EOF = True Then
            txtListCol(mObjColPos).BackColor = vbRed
        Else
            txtListCol(mObjColPos).BackColor = Mfgrd1.BackColorSel
        End If
        
        mVisibleCols = mVisibleCols + 1
        mObjColPos = mObjColPos + 1
    End If
Next mFlexColPos

End Sub

Private Sub txtListCol_Click(Index As Integer)
Call cmdFormEnter_Click
End Sub

Private Sub txtSearchText_Change()
SearchText txtSearchText.Text
If Me.Visible = True Then
    Call ShowActiveFlexRow
End If
End Sub

Private Sub txtSearchText_GotFocus()
FlashActiveControl txtSearchText, True, mSkipSelection:=True
End Sub

Private Sub txtSearchText_KeyDown(KeyCode As Integer, Shift As Integer)
If Shift = vbCtrlMask Then
    If KeyCode = vbKeyAdd Then
        Call Data_AddEvent
    ElseIf KeyCode = vbKeySubtract Then
        If Mfgrd1.Row < Mfgrd1.Rows - 1 Then
            Call Data_DeleteEvent
        End If
    ElseIf KeyCode = vbKeyReturn Then
        
    End If
ElseIf KeyCode = vbKeyDown Or KeyCode = vbKeyUp Then
    With LRecset
    If .RecordCount > 0 Then
        If KeyCode = vbKeyDown Then
            If .EOF = False Then
                .MoveNext
            End If
            If .EOF = True Then
                .MoveLast
            End If
        ElseIf KeyCode = vbKeyUp Then
            If .BOF = False Then
                .MovePrevious
            End If
            If .BOF = True Then
                .MoveFirst
            End If
        End If
    End If
    If .EOF = False And .BOF = False Then
        txtSearchText.Text = .Fields(mListField)
    Else
        txtSearchText.Text = ""
    End If
    txtSearchText.SelStart = Len(txtSearchText.Text)
    KeyCode = 0
    
    End With
End If

End Sub

Private Sub txtSearchText_LostFocus()
FlashActiveControl txtSearchText, False

End Sub

Private Sub Data_AddEvent()

frmAccessMaster.RemoteAccessCode = 0
frmAccessMaster.Show 1
If frmAccessMaster.EntrySaved = True Then
    Call FillList
    SearchBoundText CStr(frmAccessMaster.EntryBoundCode)
    UserText = Array(m_Text, Len(m_Text))
End If
Unload frmAccessMaster

If mAchdMastList = True Then
    
ElseIf mProdMastList = True Then
    
ElseIf mMachOptrList = True Then

ElseIf mPackPerList = True Then
    
ElseIf mMachMastList = True Then

ElseIf mVendMastList = True Then

ElseIf mMatProcMastList = True Then
    
ElseIf mEmpMastList = True Then
    
ElseIf mDeptMastList = True Then
    
ElseIf mDesgMastList = True Then
    
End If

End Sub

Private Sub Data_EditEvent()

End Sub

Private Sub Data_DeleteEvent()

End Sub
