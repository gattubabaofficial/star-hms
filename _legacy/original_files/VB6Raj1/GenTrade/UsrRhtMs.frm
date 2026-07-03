VERSION 5.00
Object = "{5E9E78A0-531B-11CF-91F6-C2863C385E30}#1.0#0"; "MSFLXGRD.OCX"
Begin VB.Form frmUserRightMast 
   Appearance      =   0  'Flat
   BackColor       =   &H80000005&
   ClientHeight    =   9090
   ClientLeft      =   60
   ClientTop       =   60
   ClientWidth     =   14340
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
   ScaleWidth      =   14340
   ShowInTaskbar   =   0   'False
   Begin VB.TextBox txtVoid 
      CausesValidation=   0   'False
      Height          =   375
      Left            =   120
      TabIndex        =   10
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
      TabIndex        =   18
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
      TabIndex        =   17
      TabStop         =   0   'False
      Top             =   0
      Width           =   255
   End
   Begin VB.ComboBox cmbFormEntryMode 
      Appearance      =   0  'Flat
      Enabled         =   0   'False
      Height          =   315
      ItemData        =   "UsrRhtMs.frx":0000
      Left            =   0
      List            =   "UsrRhtMs.frx":000D
      Style           =   1  'Simple Combo
      TabIndex        =   14
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
      Height          =   6735
      Left            =   240
      TabIndex        =   13
      Top             =   1080
      Width           =   10335
      Begin VB.ComboBox cmbSecuOptName 
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   315
         Left            =   2400
         Style           =   2  'Dropdown List
         TabIndex        =   3
         Top             =   1920
         Width           =   4095
      End
      Begin VB.TextBox txtUhtRemark 
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
         TabIndex        =   8
         Top             =   3360
         Width           =   4095
      End
      Begin VB.CheckBox chkUhtCanView 
         Alignment       =   1  'Right Justify
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         Caption         =   "Allow View:"
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
         Height          =   285
         Left            =   3240
         TabIndex        =   7
         Top             =   2880
         Width           =   1815
      End
      Begin VB.CheckBox chkUhtCanDelete 
         Alignment       =   1  'Right Justify
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         Caption         =   "Allow Delete:"
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
         Height          =   285
         Left            =   840
         TabIndex        =   6
         Top             =   2880
         Width           =   1815
      End
      Begin VB.CheckBox chkUhtCanEdit 
         Alignment       =   1  'Right Justify
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         Caption         =   "Allow Edit:"
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
         Height          =   285
         Left            =   3240
         TabIndex        =   5
         Top             =   2400
         Width           =   1815
      End
      Begin VB.CheckBox chkUhtCanAdd 
         Alignment       =   1  'Right Justify
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         Caption         =   "Allow Add:"
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
         Height          =   285
         Left            =   840
         TabIndex        =   4
         Top             =   2400
         Width           =   1815
      End
      Begin VB.TextBox txtUrlName 
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
         Top             =   960
         Width           =   4095
      End
      Begin VB.CommandButton cmdSaveForm 
         Appearance      =   0  'Flat
         BackColor       =   &H80000009&
         Caption         =   "      &Save"
         Height          =   255
         Left            =   8280
         Style           =   1  'Graphical
         TabIndex        =   9
         Top             =   5640
         Width           =   375
      End
      Begin VB.TextBox txtUsrName 
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
         Top             =   1440
         Width           =   4095
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
         Top             =   360
         Width           =   1335
      End
      Begin VB.Label Label2 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Remark:"
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
         Height          =   285
         Index           =   3
         Left            =   840
         TabIndex        =   25
         Top             =   3360
         Width           =   1575
      End
      Begin VB.Label Label2 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Menu Option:"
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
         Height          =   285
         Index           =   2
         Left            =   840
         TabIndex        =   24
         Top             =   1920
         Width           =   1575
      End
      Begin VB.Label Label2 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "User Role:"
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
         Height          =   285
         Index           =   1
         Left            =   840
         TabIndex        =   23
         Top             =   960
         Width           =   1575
      End
      Begin VB.Label Label2 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "User Name:"
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
         Height          =   285
         Index           =   0
         Left            =   840
         TabIndex        =   16
         Top             =   1440
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
         Height          =   285
         Index           =   0
         Left            =   840
         TabIndex        =   15
         Top             =   360
         Width           =   855
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
      Height          =   7575
      Left            =   240
      TabIndex        =   12
      Top             =   840
      Width           =   13815
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
         Left            =   960
         TabIndex        =   19
         Top             =   360
         Width           =   4215
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
         Left            =   120
         MousePointer    =   1  'Arrow
         TabIndex        =   21
         TabStop         =   0   'False
         Top             =   1560
         Width           =   1335
      End
      Begin MSFlexGridLib.MSFlexGrid Mfgrd1 
         Height          =   6615
         Left            =   120
         TabIndex        =   20
         Top             =   720
         Width           =   13455
         _ExtentX        =   23733
         _ExtentY        =   11668
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
         Left            =   120
         TabIndex        =   22
         Top             =   360
         Width           =   735
      End
   End
   Begin VB.Label lblFormHeading 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00E0E0E0&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "User Right Master"
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
      TabIndex        =   11
      Top             =   0
      Width           =   9015
   End
End
Attribute VB_Name = "frmUserRightMast"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Dim mFormLoaded As Boolean, mLastKeyPressed As Integer, mMaskKeyPressed As Integer
Dim mUhtCode As Long
Dim mRemoteAccess As Boolean, mEntrySaved As Boolean, mEntryAborted As Boolean
Dim dbCmpDatabase As New ADODB.Connection
Dim datRecset As New ADODB.Recordset
Dim mUhtUrlCode_old As String, mUhtUsrCode_old As String
Dim clsUHT As clsCmpMasterEntry, mActiveControl As Object, clsListStru As clsSelectQueryStructure
Dim fcmbUrlName As clsGtdFlexSearch, fcmbUsrName As clsGtdFlexSearch

Public Property Let RemoteAccessCode(ByVal mAccessCode As Long)
mRemoteAccess = True
mUhtCode = mAccessCode
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

Public Property Get FormAddEditMode() As Integer
FormAddEditMode = cmbFormEntryMode.ListIndex
End Property

Public Property Let FormAddEditMode(ByVal New_FormEntryMode As Integer)
cmbFormEntryMode.ListIndex = New_FormEntryMode
End Property

Private Sub chkUhtCanAdd_GotFocus()
FlashActiveControl chkUhtCanAdd, True
End Sub

Private Sub chkUhtCanAdd_LostFocus()
FlashActiveControl chkUhtCanAdd, False
End Sub

Private Sub chkUhtCanDelete_GotFocus()
FlashActiveControl chkUhtCanDelete, True
End Sub

Private Sub chkUhtCanDelete_LostFocus()
FlashActiveControl chkUhtCanDelete, False
End Sub

Private Sub chkUhtCanEdit_GotFocus()
FlashActiveControl chkUhtCanEdit, True
End Sub

Private Sub chkUhtCanEdit_LostFocus()
FlashActiveControl chkUhtCanEdit, False
End Sub

Private Sub chkUhtCanView_GotFocus()
FlashActiveControl chkUhtCanView, True
End Sub

Private Sub chkUhtCanView_LostFocus()
FlashActiveControl chkUhtCanView, False
End Sub

Private Sub cmbSecuOptName_GotFocus()
FlashActiveControl cmbSecuOptName, True
End Sub

Private Sub cmbSecuOptName_LostFocus()
FlashActiveControl cmbSecuOptName, False
End Sub

Private Sub cmbSecuOptName_Validate(Cancel As Boolean)
If cmbSecuOptName.ListIndex < 0 Then
    ErrorBox "Invalid Selection !!!"
    cmbSecuOptName.SetFocus
    Cancel = True
End If

End Sub

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
        txtUrlName.SetFocus
    End If
End If

End Sub

Private Sub cmdSaveForm_Click()
Call Data_SaveEvent

Call SmryList
txtSearch1Text_InterActiveChange txtUsrName.Text

'datRecset.Find "UsrName='" & txtUsrName.Text & "'", Start:=1
'ShowRecActiveFlexRow datRecset, Mfgrd1

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
        txtUrlName.SetFocus
    End If
End If
cmdSaveForm.Enabled = True
End Sub

Private Sub Form_Activate()
If mFormLoaded = False Then
    If mRemoteAccess = True Then
        MoveRecToFirst datRecset
        ShowRecActiveFlexRow datRecset, Mfgrd1
        Mfgrd1.SetFocus
        If mUhtCode = 0 Then
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

mFormLoaded = True
End Sub

Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)
mLastKeyPressed = KeyCode
mMaskKeyPressed = Shift
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
mFormLoaded = False
mEntrySaved = False: mEntryAborted = False
SetFormSize Me, frmMain
Call Form_Resize

SetVoidControl txtVoid
txtSearch1Text.Enabled = False

OpenCmpDataSource dbCmpDatabase

Set clsUHT = New clsCmpMasterEntry
Set clsUHT.dbCmpDatabase = dbCmpDatabase
clsUHT.blnUserRightMast = True
clsUHT.Init

Set clsListStru = New clsSelectQueryStructure

Set fcmbUrlName = New clsGtdFlexSearch
Set fcmbUrlName.dbCmpDatabase = dbCmpDatabase
fcmbUrlName.blnUserRoleMastList = True
fcmbUrlName.Init

Set fcmbUsrName = New clsGtdFlexSearch
Set fcmbUsrName.dbCmpDatabase = dbCmpDatabase
fcmbUsrName.blnUserMastList = True
fcmbUsrName.Init

cmbSecuOptName.Clear
cmbSecuOptName.AddItem "Any" & Space(100) & cUHT_SECUOPTNAME_ANY

Rem Standard Master
cmbSecuOptName.AddItem "Masters" & Space(100) & "<Mast>"
cmbSecuOptName.AddItem "Standard Master" & Space(100) & "<Std_Mast>"
cmbSecuOptName.AddItem "Account Ledger" & Space(100) & "<AchdMast>"
cmbSecuOptName.AddItem "Product Master" & Space(100) & "<ProdMast>"
cmbSecuOptName.AddItem "User Role Master" & Space(100) & "<UserRoleMst>"
cmbSecuOptName.AddItem "User Master" & Space(100) & "<UserMast>"
cmbSecuOptName.AddItem "Station Master" & Space(100) & "<StsnMast>"
cmbSecuOptName.AddItem "Area Master" & Space(100) & "<AreaMast>"
cmbSecuOptName.AddItem "Voucher Type" & Space(100) & "<VTypMast>"

Rem Payroll Master
cmbSecuOptName.AddItem "Payroll Master" & Space(100) & "<Pyr_Mast>"
cmbSecuOptName.AddItem "Department Master" & Space(100) & "<DeptMast>"
cmbSecuOptName.AddItem "Designation Master" & Space(100) & "<DesgMast>"
cmbSecuOptName.AddItem "Employee Master" & Space(100) & "<EmpMast>"

Rem Hospital Master
cmbSecuOptName.AddItem "Patient Category" & Space(100) & "<PatCatgMst>"
cmbSecuOptName.AddItem "Doctor Category" & Space(100) & "<DoctCatgMst>"
cmbSecuOptName.AddItem "Referred Category" & Space(100) & "<RefCatgMst>"
cmbSecuOptName.AddItem "Doctor Role" & Space(100) & "<DoctRoleMst>"
cmbSecuOptName.AddItem "Doctor Master" & Space(100) & "<DoctMast>"
cmbSecuOptName.AddItem "Referred By Master" & Space(100) & "<RefByMast>"
cmbSecuOptName.AddItem "Referred To Master" & Space(100) & "<RefToMast>"
cmbSecuOptName.AddItem "Service Group Master" & Space(100) & "<ServGrpMst>"
cmbSecuOptName.AddItem "Service Master" & Space(100) & "<ServMast>"
cmbSecuOptName.AddItem "Patient Master" & Space(100) & "<PatMast>"
cmbSecuOptName.AddItem "Diagnostic Master" & Space(100) & "<DiagMast>"
cmbSecuOptName.AddItem "Bed Floor Master" & Space(100) & "<FloorMast>"
cmbSecuOptName.AddItem "Bed Ward Master" & Space(100) & "<WardMast>"
cmbSecuOptName.AddItem "Bed Master" & Space(100) & "<BedMast>"

Rem Outdoor Section
cmbSecuOptName.AddItem "Outdoor" & Space(100) & "<Outd>"
cmbSecuOptName.AddItem "OPD Registration" & Space(100) & "<OutdReg>"
cmbSecuOptName.AddItem "OPD Receipt" & Space(100) & "<OutdRcpt>"
cmbSecuOptName.AddItem "OPD Payment" & Space(100) & "<OutdPymt>"
cmbSecuOptName.AddItem "OPD Refund" & Space(100) & "<OutdRefd>"
cmbSecuOptName.AddItem "OPD Bill" & Space(100) & "<OutdBill>"
cmbSecuOptName.AddItem "OPD Bill Payment" & Space(100) & "<OutdBlPymt>"
cmbSecuOptName.AddItem "OPD Bill Refund" & Space(100) & "<OutdBlRefd>"

Rem Indoor Section
cmbSecuOptName.AddItem "Indoor" & Space(100) & "<Indr>"
cmbSecuOptName.AddItem "IPD Registration" & Space(100) & "<IndrReg>"
cmbSecuOptName.AddItem "Bed Status" & Space(100) & "<IBedState>"
cmbSecuOptName.AddItem "IPD Receipt" & Space(100) & "<IndrRcpt>"
cmbSecuOptName.AddItem "IPD Payment" & Space(100) & "<IndrPymt>"
cmbSecuOptName.AddItem "IPD Refund" & Space(100) & "<IndrRefd>"
cmbSecuOptName.AddItem "IPD On A/c. Payment" & Space(100) & "<IndrRgPymt>"
cmbSecuOptName.AddItem "IPD On A/c. Refund" & Space(100) & "<IndrRgRefd>"
cmbSecuOptName.AddItem "IPD Bill" & Space(100) & "<IndrBill>"
cmbSecuOptName.AddItem "IPD Bill Payment" & Space(100) & "<IndrBlPymt>"
cmbSecuOptName.AddItem "IPD Bill Refund" & Space(100) & "<IndrBlRefd>"

Rem Diagnostic / Lab
cmbSecuOptName.AddItem "Diagnostic" & Space(100) & "<Diag>"

Rem Store Keeping
cmbSecuOptName.AddItem "Store Keeping" & Space(100) & "<Store>"

Rem Medical Store
cmbSecuOptName.AddItem "Medical Store" & Space(100) & "<Medical>"

Rem General Transaction
cmbSecuOptName.AddItem "General" & Space(100) & "<General>"
cmbSecuOptName.AddItem "Journal Entry" & Space(100) & "<Journal>"
cmbSecuOptName.AddItem "Stock Journal" & Space(100) & "<StockJrn>"

Rem Display Menu
cmbSecuOptName.AddItem "Display" & Space(100) & "<Display>"
cmbSecuOptName.AddItem "Collection Report" & Space(100) & "<CollRepo>"
cmbSecuOptName.AddItem "Service Report" & Space(100) & "<ServRepo>"
cmbSecuOptName.AddItem "Outdoor Register" & Space(100) & "<OutdRegRepo>"
cmbSecuOptName.AddItem "Indoor Register" & Space(100) & "<IndrRegRepo>"
cmbSecuOptName.AddItem "Ledger View" & Space(100) & "<LdgrView>"
cmbSecuOptName.AddItem "Item View" & Space(100) & "<ItmView>"

Rem Maintenance Menu
cmbSecuOptName.AddItem "Maintenance" & Space(100) & "<Maintenance>"
cmbSecuOptName.AddItem "Standard Options" & Space(100) & "<StdOpt>"
cmbSecuOptName.AddItem "Hospital Outdoor Options" & Space(100) & "<HmsOutdOpt>"
cmbSecuOptName.AddItem "Hospital Indoor Options" & Space(100) & "<HmsIndrOpt>"
cmbSecuOptName.AddItem "A/c Balance Reposting" & Space(100) & "<AcBalPost>"
cmbSecuOptName.AddItem "Remove Null Value" & Space(100) & "<RemoveNull>"
cmbSecuOptName.AddItem "Check Data Structure" & Space(100) & "<DataStru>"

If mRemoteAccess = True Then
    datRecset.Open "Select * from (UserRightMst" _
        & " left join UserRoleMst on UserRightMst.UhtUrlCode = UserRoleMst.UrlCode)" _
        & " left join UserMast on UserRightMst.UhtUsrCode = UserMast.UsrCode" _
        & " where UhtCode=" & CStr(mUhtCode) _
        & " order by UhtCode" _
        , dbCmpDatabase, adOpenKeyset, adLockOptimistic
Else
    datRecset.Open "Select * from (UserRightMst" _
        & " left join UserRoleMst on UserRightMst.UhtUrlCode = UserRoleMst.UrlCode)" _
        & " left join UserMast on UserRightMst.UhtUsrCode = UserMast.UsrCode" _
        & " order by UhtCode" _
        , dbCmpDatabase, adOpenKeyset, adLockOptimistic
End If
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
Set clsUHT = Nothing
Set clsListStru = Nothing
Set fcmbUrlName = Nothing
Set fcmbUsrName = Nothing

CloseTable datRecset
CloseDataSource dbCmpDatabase
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
Dim tRecset As New ADODB.Recordset

Data_Verify = False
If FormAddEditMode = cFORM_EDITMODE And Val(mskFormBoundField.Text) < 1 Then
    ErrorBox "Invalid Key Value !!!"
    txtUrlName.SetFocus
    Exit Function
End If
If (Val(fcmbUrlName.BoundText) = 0 And Val(fcmbUsrName.BoundText) = 0) Or (Val(fcmbUrlName.BoundText) > 0 And Val(fcmbUsrName.BoundText) > 0) Then
    ErrorBox "Either User Role or User Name to be Selected !!!"
    txtUrlName.SetFocus
    Exit Function
End If
If cmbSecuOptName.ListIndex < 0 Then
    ErrorBox "Invalid Selection !!!"
    cmbSecuOptName.SetFocus
    Exit Function
End If

If Val(fcmbUrlName.BoundText) > 0 Then
    With tRecset
    .Open "Select * from UserRightMst" _
        & " where UhtUrlCode = " & CStr(Val(fcmbUrlName.BoundText)) _
        & " and UhtSecuOptName IN ('" & Trim(Right(cmbSecuOptName.List(0), 25)) & "','" & Trim(Right(cmbSecuOptName.List(cmbSecuOptName.ListIndex), 25)) & "')" _
        & " and UhtCode <> " & CStr(mUhtCode) _
        & "", dbCmpDatabase, adOpenKeyset, adLockOptimistic
    If .EOF = False Then
        ErrorBox "Entry Already Exist for this User Role !!!"
        CloseTable tRecset
        txtUrlName.SetFocus
        Exit Function
    End If
    End With
    CloseTable tRecset

ElseIf Val(fcmbUsrName.BoundText) > 0 Then
    With tRecset
    .Open "Select * from UserRightMst" _
        & " where UhtUsrCode = " & CStr(Val(fcmbUsrName.BoundText)) _
        & " and UhtSecuOptName IN ('" & Trim(Right(cmbSecuOptName.List(0), 25)) & "','" & Trim(Right(cmbSecuOptName.List(cmbSecuOptName.ListIndex), 25)) & "')" _
        & " and UhtCode <> " & CStr(mUhtCode) _
        & "", dbCmpDatabase, adOpenKeyset, adLockOptimistic
    If .EOF = False Then
        ErrorBox "Entry Already Exist for this User !!!"
        CloseTable tRecset
        txtUsrName.SetFocus
        Exit Function
    End If
    End With
    CloseTable tRecset

End If

Data_Verify = True
End Function

Private Sub txtUhtRemark_GotFocus()
FlashActiveControl txtUhtRemark, True
End Sub

Private Sub txtUhtRemark_LostFocus()
FlashActiveControl txtUhtRemark, False
End Sub

Private Sub txtUrlName_Change()
If fcmbUrlName.CallFromText_Change = False Then
    fcmbUrlName.CallFromText_Change = True
    If InterActiveChange(txtUrlName) = True Then
        fcmbUrlName.UserText = Array(txtUrlName.Text, txtUrlName.SelStart)
        fcmbUrlName.Show
        txtUrlName.Text = fcmbUrlName.Text
        If fcmbUrlName.ListSelected = True Then
            SendKeys "{tab}"
        End If
    End If
    fcmbUrlName.CallFromText_Change = False
End If

End Sub

Private Sub txtUrlName_GotFocus()
FlashActiveControl txtUrlName, True
End Sub

Private Sub txtUrlName_LostFocus()
FlashActiveControl txtUrlName, False
End Sub

Private Sub txtUrlName_Validate(Cancel As Boolean)
Rem nothing
End Sub

Private Sub txtUsrName_Change()
If fcmbUsrName.CallFromText_Change = False Then
    fcmbUsrName.CallFromText_Change = True
    If InterActiveChange(txtUsrName) = True Then
        fcmbUsrName.UserText = Array(txtUsrName.Text, txtUsrName.SelStart)
        fcmbUsrName.Show
        txtUsrName.Text = fcmbUsrName.Text
        If fcmbUsrName.ListSelected = True Then
            SendKeys "{tab}"
        End If
    End If
    fcmbUsrName.CallFromText_Change = False
End If

End Sub

Private Sub txtUsrName_GotFocus()
FlashActiveControl txtUsrName, True
End Sub

Private Sub txtUsrName_LostFocus()
FlashActiveControl txtUsrName, False
End Sub

Private Sub txtUsrName_Validate(Cancel As Boolean)
Rem nothing
End Sub

Private Sub Data_AddEvent()

If clsUHT.BeginMast(0) = False Then
    Exit Sub
End If
mEntrySaved = False: mEntryAborted = False
FormAddEditMode = cFORM_ADDMODE
    
clsUHT.Clear
mUhtCode = clsUHT.ActiveCode
mskFormBoundField.Text = mUhtCode

fcmbUrlName.BoundText = "": txtUrlName.Text = ""
fcmbUsrName.BoundText = "": txtUsrName.Text = ""
cmbSecuOptName.ListIndex = 0
chkUhtCanAdd.Value = 0
chkUhtCanEdit.Value = 0
chkUhtCanDelete.Value = 0
chkUhtCanView.Value = 0
txtUhtRemark.Text = ""

mUhtUrlCode_old = Val(fcmbUrlName.BoundText)
mUhtUsrCode_old = Val(fcmbUsrName.BoundText)

Call ShowEntryMode(True)
txtUrlName.SetFocus

End Sub

Private Sub Data_EditEvent()
Dim mLCount As Integer, mUCount As Integer, mCount As Integer

If clsUHT.BeginMast(datRecset.fields("UhtCode")) = False Then
    Exit Sub
End If
mEntrySaved = False: mEntryAborted = False
FormAddEditMode = cFORM_EDITMODE
With datRecset
mUhtCode = .fields("UhtCode")
clsUHT.GetData mUhtCode

mskFormBoundField.Text = CStr(.fields("UhtCode"))
fcmbUrlName.BoundText = .fields("UhtUrlCode"): txtUrlName.Text = fcmbUrlName.Text
fcmbUsrName.BoundText = .fields("UhtUsrCode"): txtUsrName.Text = fcmbUsrName.Text
cmbSecuOptName.ListIndex = GetListIndexFromSecuOptName(.fields("UhtSecuOptName"))
chkUhtCanAdd.Value = IIf(.fields("UhtCanAdd") = True, 1, 0)
chkUhtCanEdit.Value = IIf(.fields("UhtCanEdit") = True, 1, 0)
chkUhtCanDelete.Value = IIf(.fields("UhtCanDelete") = True, 1, 0)
chkUhtCanView.Value = IIf(.fields("UhtCanView") = True, 1, 0)
txtUhtRemark.Text = .fields("UhtRemark")

End With

mUhtUrlCode_old = Val(fcmbUrlName.BoundText)
mUhtUsrCode_old = Val(fcmbUsrName.BoundText)
    
Call ShowEntryMode(True)
txtUrlName.SetFocus

End Sub

Private Sub Data_SaveEvent()
With clsUHT
If FormAddEditMode = cFORM_ADDMODE Then
    .Clear
Else
    .GetData mUhtCode
End If

.mUhtUrlCode_lng = Val(fcmbUrlName.BoundText)
.mUhtUsrCode_lng = Val(fcmbUsrName.BoundText)
.mUhtSecuOptName_str = Trim(Right(cmbSecuOptName.List(cmbSecuOptName.ListIndex), 25))
.mUhtSecuOptTitle_str = Trim(Left(cmbSecuOptName.List(cmbSecuOptName.ListIndex), 50))
.mUhtCanAdd_bln = (chkUhtCanAdd.Value = 1)
.mUhtCanEdit_bln = (chkUhtCanEdit.Value = 1)
.mUhtCanDelete_bln = (chkUhtCanDelete.Value = 1)
.mUhtCanView_bln = (chkUhtCanView.Value = 1)
.mUhtRemark_str = txtUhtRemark.Text

If FormAddEditMode = cFORM_ADDMODE Then
    If .AddNew() = True Then
        mskFormBoundField.Text = .mCode_lng
    End If
Else
    .Update mUhtCode
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

mUhtCode = datRecset.fields("UhtCode")
mRecAbsPos = datRecset.AbsolutePosition

If clsUHT.CanDeleteMast(mUhtCode) = True Then
    txtVoid.SetFocus
    With clsUHT
    .BeginMast mUhtCode
    .DeleteMast mUhtCode
    .UpdateMast mUhtCode
    .EndMast mUhtCode
    End With
    
    Call SmryList
    If datRecset.RecordCount > mRecAbsPos And mRecAbsPos > 0 Then
        datRecset.Move mRecAbsPos - 1, 1
    Else
        MoveRecToLast datRecset
    End If
    ShowRecActiveFlexRow datRecset, Mfgrd1
    Mfgrd1.SetFocus
Else
    Mfgrd1.SetFocus
End If

End Sub

Private Sub Data_CancelEvent()
clsUHT.CancelMast mUhtCode
clsUHT.EndMast mUhtCode
mEntryAborted = True

End Sub

Private Sub SmryList()
Dim gcolcount As Integer, acount As Integer, mLow As Integer, mHigh As Integer, mPos As Integer, srow As Long, mColCount As Integer

clsListStru.Clear

Rem column definitions
clsListStru.AddFields mExpr:="UhtCode", mAttrib:=cFAT_SYSTEM
clsListStru.AddFields mExpr:="UrlName", mTitle:="User Role", mAlign:=1, mWidth:=2500, mShowItem:=True
clsListStru.AddFields mExpr:="UsrName", mTitle:="User Name", mAlign:=1, mWidth:=2500, mShowItem:=True
clsListStru.AddFields mExpr:="UhtSecuOptTitle", mTitle:="Entry Menu/Option", mAlign:=1, mWidth:=2500, mShowItem:=True
clsListStru.AddFields mExpr:="UhtCanAdd", mTitle:="Allow Add", mAlign:=1, mWidth:=1400, mShowItem:=True
clsListStru.AddFields mExpr:="UhtCanEdit", mTitle:="Allow Edit", mAlign:=1, mWidth:=1400, mShowItem:=True
clsListStru.AddFields mExpr:="UhtCanDelete", mTitle:="Allow Delete", mAlign:=1, mWidth:=1400, mShowItem:=True
clsListStru.AddFields mExpr:="UhtCanView", mTitle:="Allow View", mAlign:=1, mWidth:=1400, mShowItem:=True

RefreshDatabase dbCmpDatabase
datRecset.Requery

Mfgrd1.Height = Int(Mfgrd1.Height / Mfgrd1.RowHeightMin) * Mfgrd1.RowHeightMin
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
If .EOF = False Then
    Do While .EOF = False
        Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("UhtCode")) = .fields("UhtCode")
        Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("UrlName")) = NoneZero1(.fields("UrlName"), "")
        Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("UsrName")) = NoneZero1(.fields("UsrName"), "")
        Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("UhtSecuOptTitle")) = .fields("UhtSecuOptTitle")
        Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("UhtCanAdd")) = IIf(.fields("UhtCanAdd") = True, "Yes", "")
        Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("UhtCanEdit")) = IIf(.fields("UhtCanEdit") = True, "Yes", "")
        Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("UhtCanDelete")) = IIf(.fields("UhtCanDelete") = True, "Yes", "")
        Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("UhtCanView")) = IIf(.fields("UhtCanView") = True, "Yes", "")
        
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

Private Sub Mfgrd1_KeyDown(KeyCode As Integer, Shift As Integer)
If MyAddNewKey(Shift, KeyCode) = True Then
    Call Data_AddEvent
ElseIf MyDeleteKey(Shift, KeyCode) = True Then
    If Mfgrd1.Row < Mfgrd1.Rows - 1 Then
        Call Data_DeleteEvent
    End If
ElseIf Shift = vbCtrlMask And KeyCode = vbKeySpace Then
    Call cmdFormEnter_Click
'''ElseIf KeyCode = vbKeyDown Or KeyCode = vbKeyUp Then
'''    With datRecset
'''    If .RecordCount > 0 Then
'''        If KeyCode = vbKeyDown Then
'''            If .EOF = False Then
'''                .MoveNext
'''            End If
'''            If .EOF = True Then
'''                Rem .MoveLast
'''            End If
'''        ElseIf KeyCode = vbKeyUp Then
'''            If .BOF = False Then
'''                .MovePrevious
'''            End If
'''            If .BOF = True Then
'''                .MoveFirst
'''            End If
'''        End If
'''    End If
'''    If .EOF = False And .BOF = False Then
'''        txtSearch1Text.Text = .Fields("UsrName")
'''    Else
'''        If txtSearch1Text.Text <> "" Then
'''            txtSearch1Text.Text = ""
'''        Else
'''            Mfgrd1.Row = Mfgrd1.Rows - 1
'''            ShowActiveFlexRow Mfgrd1
'''        End If
'''    End If
'''    txtSearch1Text.SelStart = Len(txtSearch1Text.Text)
'''    KeyCode = 0
'''
'''    End With
End If

End Sub

Private Sub Mfgrd1_KeyPress(KeyAscii As Integer)
mLastKeyPressed = KeyAscii
If mMaskKeyPressed = 0 Or mMaskKeyPressed = vbShiftMask Then
    txtSearch1Text.Text = JoinKeyAscii(txtSearch1Text.Text, KeyAscii)
    Call txtSearch1Text_InterActiveChange
End If

End Sub

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

Private Sub Mfgrd1_RowColChange()
If datRecset.RecordCount > 0 Then
    If datRecset.AbsolutePosition <> Mfgrd1.Row - Mfgrd1.FixedRows + 1 Then
        datRecset.MoveFirst
        datRecset.Move Mfgrd1.Row - Mfgrd1.FixedRows, 1     ' Mfgrd1.Row is already less by one
    End If
End If
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
SearchFlex Mfgrd1, clsListStru.GetItemIndex("UrlName"), mText
ShowActiveFlexRow Mfgrd1

End Sub

Private Sub txtSearch1Text_GotFocus()
FlashActiveControl txtSearch1Text, True
End Sub

Private Sub txtSearch1Text_LostFocus()
FlashActiveControl txtSearch1Text, False
End Sub

Private Function GetListIndexFromSecuOptName(ByVal mOptName As String, Optional ByVal mRtnDefault As Integer = 0) As Integer
Dim mRtnval As Integer, pos As Integer, count As Integer, mSecuOptName As String

mRtnval = mRtnDefault
mOptName = UCase(mOptName)
count = cmbSecuOptName.ListCount
For pos = 1 To count - 1
    mSecuOptName = UCase(cmbSecuOptName.List(pos))
    If Right(mSecuOptName, Len(mOptName)) = mOptName Then
        mRtnval = pos
        Exit For
    End If
Next pos
GetListIndexFromSecuOptName = mRtnval

End Function


Rem ********************************************* end of form *******************************
