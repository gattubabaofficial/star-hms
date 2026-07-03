VERSION 5.00
Object = "{5E9E78A0-531B-11CF-91F6-C2863C385E30}#1.0#0"; "MSFLXGRD.OCX"
Begin VB.Form frmMaterialProcessMast 
   Appearance      =   0  'Flat
   BackColor       =   &H80000005&
   ClientHeight    =   9090
   ClientLeft      =   60
   ClientTop       =   60
   ClientWidth     =   13485
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
   ScaleHeight     =   9090
   ScaleWidth      =   13485
   ShowInTaskbar   =   0   'False
   WindowState     =   2  'Maximized
   Begin VB.TextBox txtVoid 
      CausesValidation=   0   'False
      Height          =   375
      Left            =   120
      TabIndex        =   3
      TabStop         =   0   'False
      Text            =   "Void"
      Top             =   8520
      Width           =   375
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
      Left            =   8760
      MaskColor       =   &H000000FF&
      TabIndex        =   11
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
      Left            =   8040
      MaskColor       =   &H000000FF&
      Style           =   1  'Graphical
      TabIndex        =   10
      TabStop         =   0   'False
      Top             =   0
      Width           =   255
   End
   Begin VB.ComboBox cmbFormEntryMode 
      Appearance      =   0  'Flat
      Enabled         =   0   'False
      Height          =   315
      ItemData        =   "MatProc.frx":0000
      Left            =   0
      List            =   "MatProc.frx":000D
      Style           =   1  'Simple Combo
      TabIndex        =   7
      TabStop         =   0   'False
      Text            =   "cmbFormMode"
      Top             =   360
      Width           =   1455
   End
   Begin VB.Frame frFormDtl 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   "Detail"
      ForeColor       =   &H80000008&
      Height          =   3975
      Left            =   240
      TabIndex        =   6
      Top             =   1080
      Width           =   8655
      Begin VB.CommandButton cmdSaveForm 
         Appearance      =   0  'Flat
         BackColor       =   &H80000009&
         Caption         =   "      &Save"
         Height          =   255
         Left            =   6360
         Style           =   1  'Graphical
         TabIndex        =   2
         Top             =   3120
         Width           =   375
      End
      Begin VB.TextBox txtMprName 
         Appearance      =   0  'Flat
         BeginProperty DataFormat 
            Type            =   0
            Format          =   "0"
            HaveTrueFalseNull=   0
            FirstDayOfWeek  =   0
            FirstWeekOfYear =   0
            LCID            =   1033
            SubFormatType   =   0
         EndProperty
         Height          =   285
         Left            =   2400
         MaxLength       =   50
         TabIndex        =   1
         Top             =   1080
         Width           =   5295
      End
      Begin VB.TextBox mskFormBoundField 
         Appearance      =   0  'Flat
         BeginProperty DataFormat 
            Type            =   1
            Format          =   "0"
            HaveTrueFalseNull=   0
            FirstDayOfWeek  =   0
            FirstWeekOfYear =   0
            LCID            =   1033
            SubFormatType   =   1
         EndProperty
         Enabled         =   0   'False
         Height          =   285
         Left            =   2400
         TabIndex        =   0
         Tag             =   "AhCode"
         Text            =   "-1"
         Top             =   480
         Width           =   1335
      End
      Begin VB.Label Label2 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Process Name:"
         ForeColor       =   &H80000008&
         Height          =   255
         Index           =   0
         Left            =   840
         TabIndex        =   9
         Top             =   1080
         Width           =   1575
      End
      Begin VB.Label Label1 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Code:"
         ForeColor       =   &H80000008&
         Height          =   255
         Index           =   0
         Left            =   840
         TabIndex        =   8
         Top             =   480
         Width           =   855
      End
   End
   Begin VB.Frame frFormSmry 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   "Summary"
      ForeColor       =   &H80000008&
      Height          =   5535
      Left            =   240
      TabIndex        =   5
      Top             =   840
      Width           =   12735
      Begin MSFlexGridLib.MSFlexGrid Mfgrd1 
         Height          =   4695
         Left            =   120
         TabIndex        =   12
         Top             =   360
         Width           =   11055
         _ExtentX        =   19500
         _ExtentY        =   8281
         _Version        =   393216
         RowHeightMin    =   315
         FocusRect       =   2
         HighLight       =   2
         SelectionMode   =   1
         Appearance      =   0
      End
   End
   Begin VB.Label lblFormHeading 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00E0E0E0&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Material Process Master"
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
      TabIndex        =   4
      Top             =   0
      Width           =   9015
   End
End
Attribute VB_Name = "frmMaterialProcessMast"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Dim mFormLoaded As Boolean, LastKeyPressed As Integer
Dim mMprCode As Long
Dim mRemoteAccess As Boolean, mEntrySaved As Boolean, mEntryAborted As Boolean
Dim dbTlgDatabase As New ADODB.Connection
Dim datRecset As New ADODB.Recordset
Dim mMprName_old As String
Dim clsMST As clsToolingMasterEntry, mActiveControl As Object, clsListStru As clsSelectQueryStructure

Public Property Let RemoteAccessCode(ByVal mAccessCode As Long)
mRemoteAccess = True
mMprCode = mAccessCode
End Property

Public Property Get EntryBoundCode() As Long
EntryBoundCode = Val(mskFormBoundField.Text)
End Property

Public Property Get EntrySaved() As Boolean
EntrySaved = mEntrySaved
End Property

Public Property Get EntryAborted() As Boolean
EntryAborted = mEntryAborted
End Property

Public Property Get MprName() As String
MprName = txtMprName.Text
End Property

Public Property Get FormAddEditMode() As Integer
FormAddEditMode = cmbFormEntryMode.ListIndex
End Property

Public Property Let FormAddEditMode(ByVal New_FormEntryMode As Integer)
cmbFormEntryMode.ListIndex = New_FormEntryMode
End Property

Private Sub cmdFormEnter_Click()
LastKeyPressed = 13
If FormAddEditMode = cFORM_SMRYMODE Then
    With datRecset
    If .EOF = False And .BOF = False Then
        Call Data_EditEvent
    Else
        Call Data_AddEvent
    End If
    End With
Else
    SendKeys "{tab}"
End If


End Sub

Private Sub cmdFormEscape_Click()
Dim srow As Long, mRecAbsPos As Long
LastKeyPressed = 27
If FormAddEditMode = cFORM_SMRYMODE Then
    Unload Me
Else
    txtVoid.SetFocus
    If CanReject() = True Then
        mEntryAborted = True
        mRecAbsPos = datRecset.AbsolutePosition
        Call Data_CancelEvent
        datRecset.Requery
        Call SmryList
        If datRecset.RecordCount > mRecAbsPos And mRecAbsPos > 0 Then
            datRecset.Move mRecAbsPos - 1, 1
        Else
            MoveRecToLast datRecset
        End If
        Call ShowActiveFlexRow
        
        Call ShowEntryMode(False)
        If mRemoteAccess = True Then
            Me.Hide
            ''Unload Me
            Exit Sub
        Else
            Mfgrd1.SetFocus
        End If
    Else
        txtMprName.SetFocus
    End If

End If

End Sub

Private Sub cmdSaveForm_Click()
Call Data_SaveEvent

datRecset.Requery
Call SmryList
datRecset.Find "MprName='" & txtMprName.Text & "'", Start:=1
Call ShowActiveFlexRow

Call ShowEntryMode(False)
Mfgrd1.SetFocus

End Sub

Private Sub cmdSaveForm_GotFocus()
txtVoid.SetFocus
cmdSaveForm.Enabled = False
If Data_Verify() = True Then
    If CanAccept() = True Then
        Call cmdSaveForm_Click
        If mRemoteAccess = True Then
            Me.Hide
            Exit Sub
        End If
    Else
        txtMprName.SetFocus
    End If
End If
cmdSaveForm.Enabled = True
End Sub

Private Sub Mfgrd1_DblClick()
Call cmdFormEnter_Click
End Sub

Private Sub Mfgrd1_GotFocus()
Mfgrd1.Col = FlexLeftVisibleCol(Mfgrd1)
If Mfgrd1.SelectionMode = flexSelectionByRow Then
    Mfgrd1.ColSel = 0: Mfgrd1.ColSel = Mfgrd1.Cols - 1
End If
Call Mfgrd1_RowColChange
End Sub

Private Sub Mfgrd1_KeyPress(KeyAscii As Integer)
Select Case KeyAscii
Case 43:    ' plus (+)
    Call Data_AddEvent
Case 45:    ' minus (-)
    Call Data_DeleteEvent
End Select

End Sub

Private Sub Mfgrd1_RowColChange()
If datRecset.RecordCount > 0 Then
    If datRecset.AbsolutePosition <> Mfgrd1.Row - Mfgrd1.FixedRows + 1 Then
        datRecset.MoveFirst
        datRecset.Move Mfgrd1.Row - Mfgrd1.FixedRows, 1     ' Mfgrd1.Row is already less by one
    End If
End If

End Sub

Private Sub Form_Activate()
If mFormLoaded = False Then
    If mRemoteAccess = True Then
        If mMprCode = 0 Then
            Call Data_AddEvent
        Else
            Call Data_EditEvent
        End If
    Else
        MoveRecToLast datRecset
        Mfgrd1.SetFocus
    End If
Else
    
End If

mFormLoaded = True
End Sub

Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)
LastKeyPressed = KeyCode
Select Case KeyCode
Case 13:
Case 27:
End Select

End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)
LastKeyPressed = KeyAscii

End Sub

Private Sub Form_Load()
Dim colcnt As Integer
mFormLoaded = False
mEntrySaved = False: mEntryAborted = False
Call Form_Resize

Call SetVoidControl(txtVoid)

OpenTlgDataSource dbTlgDatabase

Set clsMST = New clsToolingMasterEntry
Set clsMST.dbTlgDatabase = dbTlgDatabase
clsMST.MastName = "MatProcMast"
Set clsListStru = New clsSelectQueryStructure

If mRemoteAccess = True Then
    datRecset.Open "Select * from MatProcMast where MprCode=" & CStr(mMprCode) & " order by MprName", dbTlgDatabase, adOpenKeyset, adLockOptimistic
Else
    datRecset.Open "Select * from MatProcMast order by MprName", dbTlgDatabase, adOpenKeyset, adLockOptimistic
End If
Call SmryList
MoveRecToFirst datRecset
Call ShowActiveFlexRow

Call ShowEntryMode(False)

End Sub

Private Sub Form_Resize()
lblFormHeading.Width = Me.Width
cmdFormEscape.Left = Me.Width - (cmdFormEscape.Width * 2)
cmdFormEnter.Left = Me.Width + cmdFormEscape.Width

End Sub

Private Sub Form_Unload(Cancel As Integer)
Set clsMST = Nothing
Set clsListStru = Nothing

CloseTable datRecset
CloseDataSource dbTlgDatabase
End Sub

Private Sub ShowEntryMode(ByVal EntryMode As Boolean)
If Me.Visible = True Then
    txtVoid.SetFocus
End If
frFormSmry.Visible = Not EntryMode
frFormDtl.Visible = EntryMode: frFormDtl.Enabled = EntryMode
cmdSaveForm.Enabled = EntryMode
If EntryMode = False Then
    FormAddEditMode = cFORM_SMRYMODE
End If

End Sub

Private Function Data_Verify() As Boolean
Data_Verify = False
If Val(mskFormBoundField.Text) < 1 Then
    ErrorBox "Invalid Key Value !!!"
    txtMprName.SetFocus
    Exit Function
End If
If Trim(txtMprName.Text) = "" Then
    ErrorBox "Invalid Process Name !!!"
    txtMprName.SetFocus
    Exit Function
End If
If txtMprName.Text <> mMprName_old Then
    If ChkDuplicate(dbTlgDatabase, "MatProcMast", "MprName", txtMprName.Text, "MprCode", Val(mskFormBoundField.Text)) = True Then
        ErrorBox "Duplicate Input !!!"
        txtMprName.SetFocus
        Exit Function
    End If
End If

Data_Verify = True
End Function

Private Sub txtMprName_GotFocus()
FlashActiveControl txtMprName, True
End Sub

Private Sub txtMprName_LostFocus()
FlashActiveControl txtMprName, False
End Sub

Private Sub txtMprName_Validate(Cancel As Boolean)
txtMprName.Text = ToMyString(txtMprName.Text)
If Trim(txtMprName.Text) = "" Then
    ErrorBox "Invalid Input !!!"
    Cancel = True
    txtMprName.SetFocus
Else
    If txtMprName.Text <> mMprName_old Then
        If ChkDuplicate(dbTlgDatabase, "MatProcMast", "MprName", txtMprName.Text, "MprCode", Val(mskFormBoundField.Text)) = True Then
            ErrorBox "Duplicate Input !!!"
            Cancel = True
            txtMprName.SetFocus
        End If
    End If
End If

End Sub

Private Sub Data_AddEvent()

If clsMST.BeginMast(0) = False Then
    Exit Sub
End If
mEntrySaved = False: mEntryAborted = False
FormAddEditMode = cFORM_ADDMODE
    
clsMST.Clear
mMprCode = clsMST.ActiveCode
mskFormBoundField.Text = mMprCode
txtMprName.Text = ""

mMprName_old = txtMprName.Text

Call ShowEntryMode(True)
txtMprName.SetFocus

End Sub

Private Sub Data_EditEvent()
Dim mLCount As Integer, mUCount As Integer, mCount As Integer

If clsMST.BeginMast(datRecset.Fields("MprCode")) = False Then
    Exit Sub
End If
mEntrySaved = False: mEntryAborted = False
FormAddEditMode = cFORM_EDITMODE
With datRecset
mMprCode = .Fields("MprCode")
clsMST.GetData mMprCode
mskFormBoundField.Text = CStr(.Fields("MprCode"))
txtMprName.Text = .Fields("MprName")

End With

mMprName_old = txtMprName.Text
    
Call ShowEntryMode(True)
txtMprName.SetFocus

End Sub

Private Sub Data_SaveEvent()
With clsMST
If FormAddEditMode = cFORM_ADDMODE Then
    .Clear
Else
    .GetData mMprCode
End If

.mName_str = txtMprName.Text
If FormAddEditMode = cFORM_ADDMODE Then
    .AddNew
    mskFormBoundField.Text = .mCode_lng
Else
    .Update mMprCode
End If
If .mCode_lng > 0 Then   ' updated successfully
    .UpdateMast .mCode_lng
    .EndMast .mCode_lng
    mEntrySaved = True
Else
    Call Data_CancelEvent
    ErrorBox "Entry Cancelled !!!"
End If

End With

End Sub

Private Sub Data_DeleteEvent()
Dim mDeleteit As Boolean, mRecAbsPos As Long
If (datRecset.EOF Or datRecset.BOF) = True Then
    Exit Sub
End If

mMprCode = datRecset.Fields("MprCode")
mRecAbsPos = datRecset.AbsolutePosition

If clsMST.CanDeleteMast(mMprCode) = True Then
    txtVoid.SetFocus
    With clsMST
    .BeginMast mMprCode
    .DeleteMast mMprCode
    .UpdateMast mMprCode
    .EndMast mMprCode
    End With
    
    datRecset.Requery
    Call SmryList
    If datRecset.RecordCount > mRecAbsPos And mRecAbsPos > 0 Then
        datRecset.Move mRecAbsPos - 1, 1
    Else
        MoveRecToLast datRecset
    End If
    Call ShowActiveFlexRow
    Mfgrd1.SetFocus
Else
    Mfgrd1.SetFocus
End If

End Sub

Private Sub Data_CancelEvent()
clsMST.CancelMast mMprCode
clsMST.EndMast mMprCode
mEntryAborted = True

End Sub

Private Sub SmryList()
Dim gcolcount As Integer, acount As Integer, mLow As Integer, mHigh As Integer, mPos As Integer, srow As Long, mColCount As Integer

clsListStru.Clear

Rem column definitions
clsListStru.AddFields mExpr:="MprCode", mAttrib:=cFAT_SYSTEM
clsListStru.AddFields mExpr:="MprName", mTitle:="Process Name", mAlign:=flexAlignLeftCenter, mWidth:=4000, mShowItem:=True

datRecset.Requery

Mfgrd1.Cols = clsListStru.UFields + 1
gcolcount = 0
mLow = clsListStru.LFields
mHigh = clsListStru.UFields
For acount = mLow To mHigh
    With Mfgrd1
    .ColAlignment(gcolcount) = clsListStru.Field_Align(acount)
    If clsListStru.Field_Show(acount) = True Then
        .ColWidth(gcolcount) = clsListStru.Field_Width(acount)
    Else
        .ColWidth(gcolcount) = 0
    End If
    .TextMatrix(0, gcolcount) = clsListStru.Field_Title(acount)
    End With
    
    gcolcount = gcolcount + 1
Next acount
If FlexColsWidth(Mfgrd1) > Mfgrd1.Width Then
    Mfgrd1.SelectionMode = flexSelectionFree
Else
    Mfgrd1.SelectionMode = flexSelectionByRow
End If

srow = 1
MoveRecToFirst datRecset
With datRecset
If .RecordCount > 0 Then
    Do While .EOF = False
        Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("MprCode")) = .Fields("MprCode")
        Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("MprName")) = .Fields("MprName")

        srow = srow + 1
        If Mfgrd1.Rows < srow + 1 Then
            Mfgrd1.Rows = Mfgrd1.Rows + 1
        End If
        
        .MoveNext
    Loop
End If
End With
For mColCount = 0 To Mfgrd1.Cols - 1
    Mfgrd1.TextMatrix(srow, mColCount) = ""
Next mColCount
Mfgrd1.Rows = srow + 1

End Sub

Private Function GetActiveControl() As Boolean
Dim mCnt As Integer

On Error GoTo errhand
GetActiveControl = False
If Screen.ActiveForm.Name = Me.Name Then
    If Screen.ActiveControl.Visible = True And Screen.ActiveControl.Enabled = True Then
        Set mActiveControl = Screen.ActiveControl
        GetActiveControl = True
    End If
End If

errhand:
mCnt = mCnt + 1
If mCnt > 2 Then
    Exit Function
End If

End Function

Private Function SetActiveControl() As Boolean
Dim mCnt As Integer

On Error GoTo errhand
SetActiveControl = False
If Screen.ActiveForm.Name = Me.Name And IsEmpty(mActiveControl) = False Then
    If mActiveControl.Visible = True And mActiveControl.Enabled = True Then
        mActiveControl.SetFocus
        SetActiveControl = True
    End If
End If

errhand:
mCnt = mCnt + 1
If mCnt > 2 Then
    Exit Function
End If

End Function

Private Sub ShowActiveFlexRow()
Dim mReqdRow As Long

With datRecset
mReqdRow = .AbsolutePosition + Mfgrd1.FixedRows - 1
If .RecordCount > 0 And .EOF = False And .BOF = False Then
    If Mfgrd1.RowIsVisible(mReqdRow) = False Then
        If mReqdRow > Mfgrd1.TopRow Then
            Mfgrd1.TopRow = mReqdRow - Int(Mfgrd1.Height / Mfgrd1.RowHeightMin) + Mfgrd1.FixedRows + 1
        Else
            Mfgrd1.TopRow = mReqdRow
        End If
    End If
    Mfgrd1.Row = mReqdRow
Else
    Mfgrd1.Row = Mfgrd1.FixedRows
End If
End With

End Sub

