VERSION 5.00
Object = "{5E9E78A0-531B-11CF-91F6-C2863C385E30}#1.0#0"; "MSFLXGRD.OCX"
Begin VB.Form frmPackMast 
   Appearance      =   0  'Flat
   BackColor       =   &H80000005&
   ClientHeight    =   8220
   ClientLeft      =   60
   ClientTop       =   60
   ClientWidth     =   13890
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
   LockControls    =   -1  'True
   ScaleHeight     =   8220
   ScaleWidth      =   13890
   ShowInTaskbar   =   0   'False
   Begin VB.TextBox txtVoid 
      CausesValidation=   0   'False
      Height          =   375
      Left            =   120
      TabIndex        =   8
      TabStop         =   0   'False
      Text            =   "Text1"
      Top             =   7680
      Width           =   255
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
      MaskColor       =   &H00E0E0E0&
      TabIndex        =   19
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
      TabIndex        =   15
      TabStop         =   0   'False
      Top             =   0
      Width           =   255
   End
   Begin VB.ComboBox cmbFormEntryMode 
      Appearance      =   0  'Flat
      Enabled         =   0   'False
      Height          =   315
      ItemData        =   "PackMast.frx":0000
      Left            =   0
      List            =   "PackMast.frx":000D
      Style           =   1  'Simple Combo
      TabIndex        =   12
      TabStop         =   0   'False
      Text            =   "cmbFormMode"
      Top             =   360
      Width           =   1455
   End
   Begin VB.Frame frFormDtl 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   "Detail"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   3915
      Left            =   240
      TabIndex        =   11
      Top             =   1080
      Width           =   9555
      Begin VB.TextBox txtPckInrNm 
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
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   285
         Left            =   3660
         MaxLength       =   5
         TabIndex        =   6
         Top             =   1980
         Width           =   1155
      End
      Begin VB.TextBox mskPckInrSz 
         Alignment       =   1  'Right Justify
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
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   285
         Left            =   2400
         TabIndex        =   5
         Tag             =   "AhCode"
         Text            =   "0"
         Top             =   1980
         Width           =   1215
      End
      Begin VB.TextBox txtPckOutNm 
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
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   285
         Left            =   3660
         MaxLength       =   5
         TabIndex        =   4
         Top             =   1620
         Width           =   1155
      End
      Begin VB.TextBox mskPckOutSz 
         Alignment       =   1  'Right Justify
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
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   285
         Left            =   2400
         TabIndex        =   3
         Tag             =   "AhCode"
         Text            =   "0"
         Top             =   1620
         Width           =   1215
      End
      Begin VB.TextBox txtPckDesc 
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
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   285
         Left            =   2400
         MaxLength       =   50
         TabIndex        =   2
         Top             =   1260
         Width           =   5295
      End
      Begin VB.CommandButton cmdSaveForm 
         Appearance      =   0  'Flat
         BackColor       =   &H80000009&
         Caption         =   "      &Save"
         Height          =   375
         Left            =   9180
         Style           =   1  'Graphical
         TabIndex        =   7
         Top             =   3540
         Width           =   375
      End
      Begin VB.TextBox txtPckName 
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
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   285
         Left            =   2400
         MaxLength       =   50
         TabIndex        =   1
         Top             =   900
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
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
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
         Caption         =   "Inner Packing:"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   255
         Index           =   15
         Left            =   840
         TabIndex        =   23
         Top             =   1980
         Width           =   1575
      End
      Begin VB.Label Label2 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Outer Packing:"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   255
         Index           =   14
         Left            =   840
         TabIndex        =   22
         Top             =   1620
         Width           =   1575
      End
      Begin VB.Label Label2 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Description:"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   255
         Index           =   8
         Left            =   840
         TabIndex        =   21
         Top             =   1260
         Width           =   1575
      End
      Begin VB.Label Label2 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Packing Name:"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   255
         Index           =   0
         Left            =   840
         TabIndex        =   14
         Top             =   900
         Width           =   1575
      End
      Begin VB.Label Label1 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Code:"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   255
         Index           =   0
         Left            =   840
         TabIndex        =   13
         Top             =   480
         Width           =   1575
      End
   End
   Begin VB.Frame frFormSmry 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   "Summary"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   5175
      Left            =   240
      TabIndex        =   10
      Top             =   840
      Width           =   11115
      Begin VB.TextBox txtSearch1Text 
         Appearance      =   0  'Flat
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   285
         Left            =   1080
         TabIndex        =   16
         Top             =   360
         Width           =   4695
      End
      Begin VB.TextBox txtList1Col 
         Appearance      =   0  'Flat
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   285
         Index           =   0
         Left            =   240
         MousePointer    =   1  'Arrow
         TabIndex        =   18
         TabStop         =   0   'False
         Top             =   1680
         Width           =   1335
      End
      Begin MSFlexGridLib.MSFlexGrid Mfgrd1 
         Height          =   4335
         Left            =   240
         TabIndex        =   17
         Top             =   720
         Width           =   10335
         _ExtentX        =   18230
         _ExtentY        =   7646
         _Version        =   393216
         RowHeightMin    =   315
         FocusRect       =   2
         HighLight       =   2
         SelectionMode   =   1
         Appearance      =   0
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
      End
      Begin VB.Label Label1 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Search:"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   255
         Index           =   1
         Left            =   240
         TabIndex        =   20
         Top             =   360
         Width           =   735
      End
   End
   Begin VB.Label lblFormHeading 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00E0E0E0&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Packing Master"
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
      TabIndex        =   9
      Top             =   0
      Width           =   9015
   End
End
Attribute VB_Name = "frmPackMast"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Option Explicit

Dim FormLoaded As Boolean, mLastKeyPressed As Integer, mMaskKeyPressed As Integer
Dim mPckCode As Long
Dim mRemoteAccess As Boolean, mEntrySaved As Boolean, mEntryAborted As Boolean
Dim dbKgtDatabase As New ADODB.Connection, dbStDatabase As New ADODB.Connection, dbGrpDatabase As New ADODB.Connection, dbComDatabase As New ADODB.Connection, datRecset As New ADODB.Recordset
Dim mPckName_old As String
Dim clsPCK As clsKgtMasterEntry, mActiveControl As Object, clsListStru As clsSelectQueryStructure

Public Property Let RemoteAccessCode(ByVal mAccessCode As Long)
mRemoteAccess = True
mPckCode = mAccessCode
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

Public Property Get PckName() As String
PckName = txtPckName.Text
End Property

Public Property Get FormAddEditMode() As Integer
FormAddEditMode = cmbFormEntryMode.ListIndex
End Property

Public Property Let FormAddEditMode(ByVal New_FormEntryMode As Integer)
cmbFormEntryMode.ListIndex = New_FormEntryMode
End Property

Private Sub cmdFormEnter_Click()

mLastKeyPressed = 13
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

mLastKeyPressed = 27
If FormAddEditMode = cFORM_SMRYMODE Then
    If Len(txtSearch1Text.Text) > 0 Then
        txtSearch1Text.Text = ""
        Call txtSearch1Text_InterActiveChange
    Else
        Unload Me
    End If
Else
    txtVoid.SetFocus
    If CanReject() = True Then
        mEntryAborted = True
        mRecAbsPos = datRecset.AbsolutePosition
        Call Data_CancelEvent
        Call SmryList
        If datRecset.RecordCount > mRecAbsPos And mRecAbsPos > 0 Then
            datRecset.Move mRecAbsPos - 1, 1
        Else
            MoveRecToLast datRecset
        End If
        ShowRecActiveFlexRow datRecset, Mfgrd1
        
        Call ShowEntryMode(False)
        If mRemoteAccess = True Then
            Me.Hide
            ''Unload Me
            Exit Sub
        Else
            Mfgrd1.SetFocus
        End If
    Else
        txtPckName.SetFocus
    End If
End If

End Sub

Private Sub cmdSaveForm_Click()
Call Data_SaveEvent

Call SmryList
txtSearch1Text_InterActiveChange txtPckName.Text

''If txtSearch1Text.Text <> txtPckName.Text Then
''    txtSearch1Text.Text = txtPckName.Text
''Else
''    Call txtSearch1Text_Change
''End If
''datRecset.Find "PckName='" & txtPckName.Text & "'", Start:=1
''ShowRecActiveFlexRow datRecset, Mfgrd1

ShowEntryMode False
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
        txtPckName.SetFocus
    End If
End If
cmdSaveForm.Enabled = True

End Sub

Private Sub Form_Activate()
If FormLoaded = False Then
    If mRemoteAccess = True Then
        If mPckCode = 0 Then
            Call Data_AddEvent
        Else
            Call Data_EditEvent
        End If
    Else
        MoveRecToFirst datRecset
        ShowRecActiveFlexRow datRecset, Mfgrd1
        Mfgrd1.SetFocus
    End If
Else

End If

FormLoaded = True
End Sub

Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)
mLastKeyPressed = KeyCode
mMaskKeyPressed = Shift
''If ActiveControl.Name = Mfgrd1.Name Then
''    If InList(KeyCode, Array(vbKeyDown, vbKeyUp, vbKeyPageDown, vbKeyPageUp)) = True And Shift = 0 Then
''        Mfgrd1_KeyDown KeyCode, Shift
''        KeyCode = 0
''    End If
''End If

Select Case KeyCode
Case vbKeyPageDown
    If FormAddEditMode <> cFORM_SMRYMODE Then
        Call cmdSaveForm_GotFocus
    End If
End Select

End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)
mLastKeyPressed = KeyAscii

End Sub

Private Sub Form_Load()
Dim colcnt As Integer
FormLoaded = False
mEntrySaved = False: mEntryAborted = False
SetFormSize Me, frmMain
Call Form_Resize

Call SetVoidControl(txtVoid)
txtSearch1Text.Enabled = False

OpenKgtDataSource dbKgtDatabase
OpenStDataSource dbStDatabase
OpenGrpDataSource dbGrpDatabase
OpenComDataSource dbComDatabase

Set clsPCK = New clsKgtMasterEntry
Set clsPCK.dbKgtDatabase = dbKgtDatabase
clsPCK.blnPackMast = True
clsPCK.Init

Set clsListStru = New clsSelectQueryStructure

datRecset.Open "Select * from PackMast" _
    & " order by PckName" _
    , dbComDatabase, adOpenKeyset, adLockOptimistic
Call SmryList

Call ShowEntryMode(False)

End Sub

Private Sub Form_Resize()
lblFormHeading.Width = Me.Width
cmdFormEscape.Left = Me.Width - (cmdFormEscape.Width * 2)
cmdFormEnter.Left = Me.Width + cmdFormEscape.Width
frFormSmry.Left = (Me.Width - frFormSmry.Width) / 2: frFormSmry.Top = cmbFormEntryMode.Top + (cmbFormEntryMode.Height * 2)
frFormDtl.Left = (Me.Width - frFormDtl.Width) / 2: frFormDtl.Top = frFormSmry.Top

End Sub

Private Sub Form_Unload(Cancel As Integer)
Set clsPCK = Nothing
Set clsListStru = Nothing

CloseTable datRecset
CloseDataSource dbKgtDatabase
CloseDataSource dbStDatabase
CloseDataSource dbGrpDatabase
CloseDataSource dbComDatabase
End Sub

Private Sub ShowEntryMode(ByVal EntryMode As Boolean)
If Me.Visible = True Then
    txtVoid.SetFocus
End If
frFormSmry.Visible = Not EntryMode: frFormSmry.Enabled = Not EntryMode
frFormDtl.Visible = EntryMode: frFormDtl.Enabled = EntryMode
cmdSaveForm.Enabled = EntryMode
If EntryMode = False Then
    FormAddEditMode = cFORM_SMRYMODE
End If

End Sub

Private Function Data_Verify() As Boolean
Data_Verify = False
If Val(mskFormBoundField.Text) < 1 And FormAddEditMode = cFORM_EDITMODE Then
    ErrorBox "Invalid Key Value !!!"
    txtPckName.SetFocus
    Exit Function
End If
If Trim(txtPckName.Text) = "" Then
    ErrorBox "Invalid Item Name !!!"
    txtPckName.SetFocus
    Exit Function
End If
If Val(UnMyNumFmt(mskPckOutSz.Text)) <= 0 Then
    ErrorBox "Invalid Input !!!"
    mskPckOutSz.SetFocus
    Exit Function
End If
If txtPckOutNm.Text = "" Then
    ErrorBox "Invalid Input !!!"
    txtPckOutNm.SetFocus
    Exit Function
End If
If Val(UnMyNumFmt(mskPckInrSz.Text)) <= 0 Then
    ErrorBox "Invalid Input !!!"
    mskPckInrSz.SetFocus
    Exit Function
End If
If txtPckInrNm.Text = "" Then
    ErrorBox "Invalid Input !!!"
    txtPckInrNm.SetFocus
    Exit Function
End If
If txtPckName.Text <> mPckName_old Then
    If ChkIsDuplicate(dbKgtDatabase, "PackMast", "PckName", txtPckName.Text, "PckCode", Val(mskFormBoundField.Text)) = True Then
        ErrorBox "Duplicate Input !!!"
        txtPckName.SetFocus
        Exit Function
    End If
End If

Data_Verify = True
End Function

Private Sub mskPckInrSz_GotFocus()
FlashActiveControl mskPckInrSz, True
End Sub

Private Sub mskPckInrSz_LostFocus()
FlashActiveControl mskPckInrSz, False
End Sub

Private Sub mskPckInrSz_Validate(Cancel As Boolean)
mskPckInrSz.Text = ToMyNumFmt(mskPckInrSz.Text, mDecimals:=-1, mUseAbs:=True)
If Val(UnMyNumFmt(mskPckInrSz.Text)) <= 0 Then
    ErrorBox "Invalid Input !!!"
    mskPckInrSz.SetFocus
    Cancel = True
End If

End Sub

Private Sub mskPckOutSz_GotFocus()
FlashActiveControl mskPckOutSz, True
End Sub

Private Sub mskPckOutSz_LostFocus()
FlashActiveControl mskPckOutSz, False
End Sub

Private Sub mskPckOutSz_Validate(Cancel As Boolean)
mskPckOutSz.Text = ToMyNumFmt(mskPckOutSz.Text, mDecimals:=-1, mUseAbs:=True)
If Val(UnMyNumFmt(mskPckOutSz.Text)) <= 0 Then
    ErrorBox "Invalid Input !!!"
    mskPckOutSz.SetFocus
    Cancel = True
End If

End Sub

Private Sub txtPckDesc_GotFocus()
FlashActiveControl txtPckDesc, True
End Sub

Private Sub txtPckDesc_LostFocus()
FlashActiveControl txtPckDesc, False
End Sub

Private Sub txtPckDesc_Validate(Cancel As Boolean)
txtPckDesc.Text = ToMyWord(txtPckDesc.Text)
If txtPckDesc.Text = "" Then
    txtPckDesc.Text = txtPckName.Text
End If

End Sub

Private Sub txtPckInrNm_GotFocus()
FlashActiveControl txtPckInrNm, True
End Sub

Private Sub txtPckInrNm_LostFocus()
FlashActiveControl txtPckInrNm, False
End Sub

Private Sub txtPckInrNm_Validate(Cancel As Boolean)
txtPckInrNm.Text = ToMyWord(txtPckInrNm.Text)
If txtPckInrNm.Text = "" Then
    ErrorBox "Invalid Input !!!"
    txtPckInrNm.SetFocus
    Cancel = True
End If

End Sub

Private Sub txtPckName_GotFocus()
FlashActiveControl txtPckName, True
End Sub

Private Sub txtPckName_LostFocus()
FlashActiveControl txtPckName, False
End Sub

Private Sub txtPckName_Validate(Cancel As Boolean)
txtPckName.Text = ToMyWord(txtPckName.Text)
If Trim(txtPckName.Text) = "" Then
    ErrorBox "Invalid Input !!!"
    Cancel = True
    txtPckName.SetFocus
Else
    If txtPckName.Text <> mPckName_old Then
        If ChkIsDuplicate(dbKgtDatabase, "PackMast", "PckName", txtPckName.Text, "PckCode", Val(mskFormBoundField.Text)) = True Then
            ErrorBox "Duplicate Input !!!"
            Cancel = True
            txtPckName.SetFocus
        End If
    End If
End If
If Cancel = False Then
    If txtPckDesc.Text = "" Then
        txtPckDesc.Text = txtPckName.Text
    End If
End If

End Sub

Private Sub Data_AddEvent()

If clsPCK.BeginMast(0) = False Then
    Exit Sub
End If
mEntrySaved = False: mEntryAborted = False
FormAddEditMode = cFORM_ADDMODE

clsPCK.Clear
mPckCode = clsPCK.ActiveCode

mskFormBoundField.Text = mPckCode
txtPckName.Text = ""
txtPckDesc.Text = ""
mskPckOutSz.Text = ToMyNumFmt(1, mDecimals:=0)
txtPckOutNm.Text = "Nos."
mskPckInrSz.Text = ToMyNumFmt(1, mDecimals:=0)
txtPckInrNm.Text = "Nos."

mPckName_old = txtPckName.Text

Call ShowEntryMode(True)
txtPckName.SetFocus

End Sub

Private Sub Data_EditEvent()
If clsPCK.BeginMast(datRecset.fields("PckCode")) = False Then
    Exit Sub
End If
mEntrySaved = False: mEntryAborted = False
FormAddEditMode = cFORM_EDITMODE
With datRecset
mPckCode = .fields("PckCode")

clsPCK.GetData mPckCode

mskFormBoundField.Text = CStr(mPckCode)

txtPckName.Text = .fields("PckName")
txtPckDesc.Text = .fields("PckDesc")
mskPckOutSz.Text = ToMyNumFmt(.fields("PckOutSz"), mDecimals:=-1)
txtPckOutNm.Text = .fields("PckOutNm")
mskPckInrSz.Text = ToMyNumFmt(.fields("PckInrSz"), mDecimals:=-1)
txtPckInrNm.Text = .fields("PckInrNm")
End With

mPckName_old = txtPckName.Text

Call ShowEntryMode(True)
txtPckName.SetFocus

End Sub

Private Sub Data_SaveEvent()
Dim mContinueUpdate As Boolean

mContinueUpdate = True

With clsPCK
If FormAddEditMode = cFORM_ADDMODE Then
    .Clear
Else
    .GetData mPckCode
End If

.mName_str = txtPckName.Text
.mPckDesc_str = txtPckDesc.Text
.mPckOutSz_dbl = Val(UnMyNumFmt(mskPckOutSz.Text))
.mPckOutNm_str = txtPckOutNm.Text
.mPckInrSz_dbl = Val(UnMyNumFmt(mskPckInrSz.Text))
.mPckInrNm_str = txtPckInrNm.Text
If FormAddEditMode = cFORM_ADDMODE Then
    If .AddNew() = True Then
        mskFormBoundField.Text = .mCode_lng
        mPckCode = .mCode_lng
    Else
        mContinueUpdate = False
    End If
Else
    If .Update(mPckCode) = True Then
        Rem none
    Else
        mContinueUpdate = False
    End If
End If
If mContinueUpdate = True Then   ''' .mCode_lng > 0   updated successfully
    .UpdateMast mPckCode
    .EndMast mPckCode
    
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

mPckCode = datRecset.fields("PckCode")
mRecAbsPos = datRecset.AbsolutePosition

If clsPCK.CanDeleteMast(mPckCode, mSkipConfirm:=True) = True Then
    If CanDelete() = True Then
        If clsPCK.BeginMast(mPckCode) = True Then
            clsPCK.DeleteMast mPckCode
            clsPCK.UpdateMast mPckCode
            clsPCK.EndMast mPckCode
            
            Call SmryList
            If datRecset.RecordCount > mRecAbsPos And mRecAbsPos > 0 Then
                datRecset.Move mRecAbsPos - 1, 1
            Else
                MoveRecToLast datRecset
            End If
        End If
        ShowRecActiveFlexRow datRecset, Mfgrd1
        Mfgrd1.SetFocus
    Else
        Mfgrd1.SetFocus
    End If
Else
    Mfgrd1.SetFocus
End If

End Sub

Private Sub Data_CancelEvent()
clsPCK.CancelMast mPckCode
clsPCK.EndMast mPckCode

mEntryAborted = True

End Sub

Private Sub SmryList()
Dim aStock As Variant
Dim gcolcount As Integer, acount As Integer, mLow As Integer, mHigh As Integer, mPos As Integer, srow As Long, mColCount As Integer
Dim tRecset As ADODB.Recordset

clsListStru.Clear

Rem column definitions
clsListStru.AddFields mExpr:="PckCode", mAttrib:=cFAT_SYSTEM
clsListStru.AddFields mExpr:="PckName", mTitle:="Product Name", mAlign:=flexAlignLeftCenter, mWidth:=3500, mShowItem:=True
clsListStru.AddFields mExpr:="PckOutSz", mTitle:="Outer Qty", mAlign:=flexAlignLeftCenter, mWidth:=1500, mShowItem:=True
clsListStru.AddFields mExpr:="PckOutNm", mTitle:="Outer Name", mAlign:=flexAlignLeftCenter, mWidth:=1500, mShowItem:=True
clsListStru.AddFields mExpr:="PckInrSz", mTitle:="Inner Qty", mWidth:="1500", mAlign:=flexAlignLeftCenter, mShowItem:=True
clsListStru.AddFields mExpr:="PckInrNm", mTitle:="Inner Name", mWidth:="1500", mAlign:=flexAlignLeftCenter, mShowItem:=True

RefreshDatabase dbKgtDatabase
RefreshDatabase dbComDatabase
datRecset.Requery

Mfgrd1.Height = Int(Mfgrd1.Height / Mfgrd1.RowHeightMin) * Mfgrd1.RowHeightMin
Mfgrd1.Cols = clsListStru.UFields + 1
gcolcount = 0
mLow = clsListStru.LFields
mHigh = clsListStru.UFields
For acount = mLow To mHigh
    With Mfgrd1
    'If .Cols <= gcolcount Then
    '    .Cols = gcolcount + 1
    'End If
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
Rem MoveRecToFirst datRecset
Set tRecset = datRecset.ActiveConnection.Execute(datRecset.Source)
With tRecset
Rem If .RecordCount > 0 Then
If IsValidRec(tRecset) = True Then
    Do While .EOF = False
        Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("PckCode")) = .fields("PckCode")
        Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("PckName")) = .fields("PckName")
        Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("PckOutSz")) = ToMyNumFmt(.fields("PckOutSz"), mDecimals:=-1)
        Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("PckOutNm")) = .fields("PckOutNm")
        Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("PckInrSz")) = ToMyNumFmt(.fields("PckInrSz"), mDecimals:=-1)
        Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("PckInrNm")) = .fields("PckInrNm")
        
        srow = srow + 1
        If Mfgrd1.Rows < srow + 1 Then
            Mfgrd1.Rows = Mfgrd1.Rows + 1
        End If
        
        .MoveNext
    Loop
End If
End With
CloseTable tRecset
For mColCount = 0 To Mfgrd1.Cols - 1
    Mfgrd1.TextMatrix(srow, mColCount) = ""
Next mColCount
Mfgrd1.Rows = srow + 1

SetFlexColCursor txtList1Col, Mfgrd1

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

Private Sub Mfgrd1_DblClick()
Call cmdFormEnter_Click

End Sub

Private Sub Mfgrd1_GotFocus()
Mfgrd1.Col = FlexLeftVisibleCol(Mfgrd1)
Mfgrd1.LeftCol = FlexLeftVisibleCol(Mfgrd1)
If Mfgrd1.SelectionMode = flexSelectionByRow Then
    Mfgrd1.ColSel = 0: Mfgrd1.ColSel = Mfgrd1.Cols - 1
End If
Call Mfgrd1_RowColChange
txtSearch1Text.Text = ""

End Sub

Private Sub Mfgrd1_KeyDown(KeyCode As Integer, Shift As Integer)
If MyAddNewKey(Shift, KeyCode) = True Then
    Call Data_AddEvent
ElseIf MyDeleteKey(Shift, KeyCode) = True Then
    If Mfgrd1.Row < Mfgrd1.Rows - 1 Then
        Call Data_DeleteEvent
    End If
ElseIf Shift = vbCtrlMask And KeyCode = vbKeySpace Then
    Call cmdFormEnter_Click
End If

End Sub

Private Sub Mfgrd1_KeyPress(KeyAscii As Integer)
mLastKeyPressed = KeyAscii
If mMaskKeyPressed = 0 Or mMaskKeyPressed = vbShiftMask Then
    Select Case KeyAscii
    Case vbKeyBack
        If txtSearch1Text.Text <> "" Then
            txtSearch1Text.Text = Left(txtSearch1Text.Text, Len(txtSearch1Text.Text) - 1)
            Call txtSearch1Text_InterActiveChange
        End If
    Case Else
        txtSearch1Text.Text = txtSearch1Text.Text & Chr(KeyAscii)
        Call txtSearch1Text_InterActiveChange
    End Select
End If

End Sub

Private Sub Mfgrd1_RowColChange()
With datRecset
If .RecordCount > 0 Then
    If .AbsolutePosition <> Mfgrd1.Row - Mfgrd1.FixedRows + 1 Then
        .MoveFirst
        .Move Mfgrd1.Row - Mfgrd1.FixedRows, 1     ' Mfgrd1.Row is already less by one
    End If
End If
End With
ShowFlexColCursor txtList1Col, Mfgrd1, datRecset

End Sub

Private Sub Mfgrd1_Scroll()
ShowFlexColCursor txtList1Col, Mfgrd1, datRecset

End Sub

Private Sub txtList1Col_DblClick(Index As Integer)
Call Mfgrd1_DblClick
End Sub

Private Sub txtList1Col_GotFocus(Index As Integer)
Mfgrd1.SetFocus
End Sub

Private Sub txtSearch1Text_InterActiveChange(Optional ByVal mText)
mText = IIf(IsMissing(mText) = True, txtSearch1Text.Text, mText)
SearchFlex Mfgrd1, clsListStru.GetItemIndex("PckName"), mText
ShowActiveFlexRow Mfgrd1

End Sub

Private Sub txtSearch1Text_GotFocus()
FlashActiveControl txtSearch1Text, True

End Sub

Private Sub txtSearch1Text_LostFocus()
FlashActiveControl txtSearch1Text, False
End Sub

Private Sub txtPckOutNm_GotFocus()
FlashActiveControl txtPckOutNm, True
End Sub

Private Sub txtPckOutNm_LostFocus()
FlashActiveControl txtPckOutNm, False
End Sub

Private Sub txtPckOutNm_Validate(Cancel As Boolean)
txtPckOutNm.Text = ToMyWord(Trim(txtPckOutNm.Text))
If txtPckOutNm.Text = "" Then
    ErrorBox "Invalid Input !!!"
    txtPckOutNm.SetFocus
    Cancel = True
End If

End Sub
