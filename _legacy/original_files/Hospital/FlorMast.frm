VERSION 5.00
Object = "{5E9E78A0-531B-11CF-91F6-C2863C385E30}#1.0#0"; "MSFLXGRD.OCX"
Begin VB.Form frmFloorMast 
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
   Begin VB.Frame frFormDtl 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   "Detail"
      ForeColor       =   &H80000008&
      Height          =   7455
      Left            =   240
      TabIndex        =   23
      Top             =   1200
      Width           =   10095
      Begin VB.TextBox mskSrvDiscPer 
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
         Height          =   285
         Left            =   4800
         TabIndex        =   17
         Tag             =   "AhCode"
         Text            =   "0.00 %"
         Top             =   5760
         Width           =   1215
      End
      Begin VB.CheckBox chkSrvDiscAllowed 
         Alignment       =   1  'Right Justify
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         Caption         =   "Discount Allowed:"
         ForeColor       =   &H80000008&
         Height          =   255
         Left            =   840
         TabIndex        =   16
         Top             =   5760
         Width           =   2175
      End
      Begin VB.CheckBox chkSrvDefAllowed 
         Alignment       =   1  'Right Justify
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         Caption         =   "Decreament Allowed:"
         ForeColor       =   &H80000008&
         Height          =   255
         Left            =   3480
         TabIndex        =   15
         Top             =   5280
         Width           =   2535
      End
      Begin VB.CheckBox chkSrvInfAllowed 
         Alignment       =   1  'Right Justify
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         Caption         =   "Increament Allowed:"
         ForeColor       =   &H80000008&
         Height          =   255
         Left            =   840
         TabIndex        =   14
         Top             =   5280
         Width           =   2175
      End
      Begin VB.CheckBox chkSrvAmtEditable 
         Alignment       =   1  'Right Justify
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         Caption         =   "Amount Editable:"
         ForeColor       =   &H80000008&
         Height          =   255
         Left            =   6360
         TabIndex        =   13
         Top             =   4800
         Width           =   1815
      End
      Begin VB.CheckBox chkSrvRateEditable 
         Alignment       =   1  'Right Justify
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         Caption         =   "Rate Editable:"
         ForeColor       =   &H80000008&
         Height          =   255
         Left            =   3480
         TabIndex        =   12
         Top             =   4800
         Width           =   2535
      End
      Begin VB.TextBox mskSrvLabEmgChg 
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
         Height          =   285
         Left            =   4800
         TabIndex        =   10
         Tag             =   "AhCode"
         Text            =   "0.00"
         Top             =   4080
         Width           =   1455
      End
      Begin VB.TextBox mskSrvLabGenChg 
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
         Height          =   285
         Left            =   2640
         TabIndex        =   9
         Tag             =   "AhCode"
         Text            =   "0.00"
         Top             =   4080
         Width           =   1455
      End
      Begin VB.TextBox mskSrvIpdEmgChg 
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
         Height          =   285
         Left            =   4800
         TabIndex        =   8
         Tag             =   "AhCode"
         Text            =   "0.00"
         Top             =   3720
         Width           =   1455
      End
      Begin VB.TextBox mskSrvIpdGenChg 
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
         Height          =   285
         Left            =   2640
         TabIndex        =   7
         Tag             =   "AhCode"
         Text            =   "0.00"
         Top             =   3720
         Width           =   1455
      End
      Begin VB.TextBox mskSrvOpdEmgChg 
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
         Height          =   285
         Left            =   4800
         TabIndex        =   6
         Tag             =   "AhCode"
         Text            =   "0.00"
         Top             =   3360
         Width           =   1455
      End
      Begin VB.TextBox mskSrvOpdGenChg 
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
         Height          =   285
         Left            =   2640
         TabIndex        =   5
         Tag             =   "AhCode"
         Text            =   "0.00"
         Top             =   3360
         Width           =   1455
      End
      Begin VB.TextBox txtAhName 
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
         Left            =   2640
         MaxLength       =   50
         TabIndex        =   3
         Top             =   1920
         Width           =   5295
      End
      Begin VB.TextBox txtSgpName 
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
         Left            =   2640
         MaxLength       =   50
         TabIndex        =   2
         Top             =   1440
         Width           =   5295
      End
      Begin VB.CheckBox chkSrvShowInList 
         Alignment       =   1  'Right Justify
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         Caption         =   "Show in List:"
         ForeColor       =   &H80000008&
         Height          =   255
         Left            =   840
         TabIndex        =   18
         Top             =   6240
         Width           =   2175
      End
      Begin VB.TextBox mskSrvIndex 
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
         Height          =   285
         Left            =   2640
         TabIndex        =   4
         Tag             =   "AhCode"
         Text            =   "0"
         Top             =   2400
         Width           =   855
      End
      Begin VB.CheckBox chkSrvUnitEditable 
         Alignment       =   1  'Right Justify
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         Caption         =   "Unit Editable:"
         ForeColor       =   &H80000008&
         Height          =   255
         Left            =   840
         TabIndex        =   11
         Top             =   4800
         Width           =   2175
      End
      Begin VB.CommandButton cmdSaveForm 
         Appearance      =   0  'Flat
         BackColor       =   &H80000009&
         Caption         =   "      &Save"
         Height          =   255
         Left            =   7680
         Style           =   1  'Graphical
         TabIndex        =   19
         Top             =   6840
         Width           =   375
      End
      Begin VB.TextBox txtSrvName 
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
         Left            =   2640
         MaxLength       =   50
         TabIndex        =   1
         Top             =   960
         Width           =   5295
      End
      Begin VB.TextBox mskFormBoundField 
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
         Enabled         =   0   'False
         Height          =   285
         Left            =   2640
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
         Caption         =   "Discount (%):"
         ForeColor       =   &H80000008&
         Height          =   255
         Index           =   9
         Left            =   3480
         TabIndex        =   41
         Top             =   5760
         Width           =   1215
      End
      Begin VB.Shape Shape1 
         Height          =   1695
         Left            =   720
         Top             =   2880
         Width           =   7335
      End
      Begin VB.Label Label2 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Emergency Charges:"
         ForeColor       =   &H80000008&
         Height          =   255
         Index           =   8
         Left            =   4440
         TabIndex        =   40
         Top             =   3000
         Width           =   1815
      End
      Begin VB.Label Label2 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "General Charges:"
         ForeColor       =   &H80000008&
         Height          =   255
         Index           =   7
         Left            =   2640
         TabIndex        =   39
         Top             =   3000
         Width           =   1695
      End
      Begin VB.Label Label2 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "LAB:"
         ForeColor       =   &H80000008&
         Height          =   255
         Index           =   6
         Left            =   840
         TabIndex        =   38
         Top             =   4080
         Width           =   1695
      End
      Begin VB.Label Label2 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "IPD:"
         ForeColor       =   &H80000008&
         Height          =   255
         Index           =   5
         Left            =   840
         TabIndex        =   37
         Top             =   3720
         Width           =   1695
      End
      Begin VB.Label Label2 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "OPD:"
         ForeColor       =   &H80000008&
         Height          =   255
         Index           =   4
         Left            =   840
         TabIndex        =   36
         Top             =   3360
         Width           =   1695
      End
      Begin VB.Label Label2 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Account Name:"
         ForeColor       =   &H80000008&
         Height          =   255
         Index           =   3
         Left            =   840
         TabIndex        =   35
         Top             =   1920
         Width           =   1695
      End
      Begin VB.Label Label2 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Group Name:"
         ForeColor       =   &H80000008&
         Height          =   255
         Index           =   2
         Left            =   840
         TabIndex        =   34
         Top             =   1440
         Width           =   1695
      End
      Begin VB.Label Label2 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Index Order:"
         ForeColor       =   &H80000008&
         Height          =   255
         Index           =   1
         Left            =   840
         TabIndex        =   33
         Top             =   2400
         Width           =   1695
      End
      Begin VB.Label Label2 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Service Name:"
         ForeColor       =   &H80000008&
         Height          =   255
         Index           =   0
         Left            =   840
         TabIndex        =   26
         Top             =   960
         Width           =   1695
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
         TabIndex        =   25
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
      TabIndex        =   22
      Top             =   960
      Width           =   12855
      Begin VB.TextBox txtList1Col 
         Appearance      =   0  'Flat
         Height          =   285
         Index           =   0
         Left            =   120
         MousePointer    =   1  'Arrow
         TabIndex        =   31
         TabStop         =   0   'False
         Top             =   1560
         Width           =   1335
      End
      Begin VB.TextBox txtSearch1Text 
         Appearance      =   0  'Flat
         Height          =   285
         Left            =   960
         TabIndex        =   29
         Top             =   360
         Width           =   4215
      End
      Begin MSFlexGridLib.MSFlexGrid Mfgrd1 
         Height          =   4335
         Left            =   120
         TabIndex        =   30
         Top             =   720
         Width           =   12375
         _ExtentX        =   21828
         _ExtentY        =   7646
         _Version        =   393216
         RowHeightMin    =   315
         FocusRect       =   2
         HighLight       =   2
         SelectionMode   =   1
         Appearance      =   0
      End
      Begin VB.Label Label1 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Search:"
         ForeColor       =   &H80000008&
         Height          =   255
         Index           =   1
         Left            =   120
         TabIndex        =   32
         Top             =   360
         Width           =   735
      End
   End
   Begin VB.TextBox txtVoid 
      CausesValidation=   0   'False
      Height          =   375
      Left            =   120
      TabIndex        =   20
      TabStop         =   0   'False
      Text            =   "Void"
      Top             =   8760
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
      TabIndex        =   28
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
      TabIndex        =   27
      TabStop         =   0   'False
      Top             =   0
      Width           =   255
   End
   Begin VB.ComboBox cmbFormEntryMode 
      Appearance      =   0  'Flat
      Enabled         =   0   'False
      Height          =   315
      ItemData        =   "FlorMast.frx":0000
      Left            =   0
      List            =   "FlorMast.frx":000D
      Style           =   1  'Simple Combo
      TabIndex        =   24
      TabStop         =   0   'False
      Text            =   "cmbFormMode"
      Top             =   360
      Width           =   1455
   End
   Begin VB.Label lblFormHeading 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00E0E0E0&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Service Master"
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
      TabIndex        =   21
      Top             =   0
      Width           =   9015
   End
End
Attribute VB_Name = "frmFloorMast"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Dim mFormLoaded As Boolean, mLastKeyPressed As Integer, mMaskKeyPressed As Integer
Dim mSrvCode As Long
Dim mRemoteAccess As Boolean, mEntrySaved As Boolean, mEntryAborted As Boolean
Dim dbHmsDatabase As New ADODB.Connection, dbAcDatabase As New ADODB.Connection, dbGrpDatabase As New ADODB.Connection, dbComDatabase As New ADODB.Connection
Dim datRecset As New ADODB.Recordset
Dim mSrvName_old As String, mSrvIndex_old As Integer
Dim clsSRV As clsHmsMasterEntry, clsAH As clsAccountHead, clsSGP As clsHmsMasterEntry, mActiveControl As Object, clsListStru As clsSelectQueryStructure
Dim fcmbAhName As clsComFlexSearch, fcmbSgpName As clsHmsFlexSearch

Public Property Let RemoteAccessCode(ByVal mAccessCode As Long)
mRemoteAccess = True
mSrvCode = mAccessCode
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

Public Property Get SrvName() As String
SrvName = txtSrvName.Text
End Property

Public Property Get FormAddEditMode() As Integer
FormAddEditMode = cmbFormEntryMode.ListIndex
End Property

Public Property Let FormAddEditMode(ByVal New_FormEntryMode As Integer)
cmbFormEntryMode.ListIndex = New_FormEntryMode
End Property

Private Sub chkSrvAmtEditable_GotFocus()
FlashActiveControl chkSrvAmtEditable, True
End Sub

Private Sub chkSrvAmtEditable_LostFocus()
FlashActiveControl chkSrvAmtEditable, False
End Sub

Private Sub chkSrvDefAllowed_GotFocus()
FlashActiveControl chkSrvDefAllowed, True
End Sub

Private Sub chkSrvDefAllowed_LostFocus()
FlashActiveControl chkSrvDefAllowed, False
End Sub

Private Sub chkSrvDiscAllowed_GotFocus()
FlashActiveControl chkSrvDiscAllowed, True
End Sub

Private Sub chkSrvDiscAllowed_LostFocus()
FlashActiveControl chkSrvDiscAllowed, False
End Sub

Private Sub chkSrvInfAllowed_Click()
FlashActiveControl chkSrvDefAllowed, False
End Sub

Private Sub chkSrvInfAllowed_GotFocus()
FlashActiveControl chkSrvInfAllowed, True
End Sub

Private Sub chkSrvInfAllowed_LostFocus()
FlashActiveControl chkSrvInfAllowed, False
End Sub

Private Sub chkSrvRateEditable_GotFocus()
FlashActiveControl chkSrvRateEditable, True
End Sub

Private Sub chkSrvRateEditable_LostFocus()
FlashActiveControl chkSrvRateEditable, False
End Sub

Private Sub chkSrvUnitEditable_GotFocus()
FlashActiveControl chkSrvUnitEditable, True
End Sub

Private Sub chkSrvUnitEditable_LostFocus()
FlashActiveControl chkSrvUnitEditable, False
End Sub

Private Sub chkSrvShowInList_GotFocus()
FlashActiveControl chkSrvShowInList, True
End Sub

Private Sub chkSrvShowInList_LostFocus()
FlashActiveControl chkSrvShowInList, False
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
            datRecset.Move mRecAbsPos - 1, Start:=1
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
        txtSrvName.SetFocus
    End If

End If

End Sub

Private Sub cmdSaveForm_Click()
Call Data_SaveEvent

Call SmryList
txtSearch1Text_InterActiveChange txtSrvName.Text

''datRecset.Find "SrvName='" & txtSrvName.Text & "'", Start:=1
''ShowRecActiveFlexRow datRecset, Mfgrd1

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
        txtSrvName.SetFocus
    End If
End If
cmdSaveForm.Enabled = True

End Sub

Private Sub Form_Activate()
If mFormLoaded = False Then
    If mRemoteAccess = True Then
        If mSrvCode = 0 Then
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

Call SetVoidControl(txtVoid)
txtSearch1Text.Enabled = False

OpenHmsDataSource dbHmsDatabase
OpenAcDataSource dbAcDatabase
OpenGrpDataSource dbGrpDatabase
OpenComDataSource dbComDatabase

Set clsSRV = New clsHmsMasterEntry
Set clsSRV.dbHmsDatabase = dbHmsDatabase
clsSRV.blnServMast = True
clsSRV.Init

Set clsAH = New clsAccountHead
Set clsAH.dbAcDatabase = dbAcDatabase
Set clsAH.dbGrpDatabase = dbGrpDatabase

Set clsSGP = New clsHmsMasterEntry
Set clsSGP.dbHmsDatabase = dbHmsDatabase
clsSGP.blnServGrpMast = True
clsSGP.Init

Set clsListStru = New clsSelectQueryStructure

Set fcmbAhName = New clsComFlexSearch
Set fcmbAhName.dbAcDatabase = dbAcDatabase
fcmbAhName.blnAchdMastList = True
fcmbAhName.Init

Set fcmbSgpName = New clsHmsFlexSearch
Set fcmbSgpName.dbHmsDatabase = dbHmsDatabase
fcmbSgpName.blnServGrpMstList = True
fcmbSgpName.Init

If mRemoteAccess = True Then
    datRecset.Open "Select ServMast.*,ServGrpMst.SgpName,AchdMast.AhName from (ServMast left join ServGrpMst on ServMast.SrvSgpCode=ServGrpMst.SgpCode) left join AchdMast on ServMast.SrvAhCode=AchdMast.AhCode where SrvCode=" & CStr(mSrvCode) & " order by SrvName", dbComDatabase, adOpenKeyset, adLockOptimistic
Else
    datRecset.Open "Select ServMast.*,ServGrpMst.SgpName,AchdMast.AhName from (ServMast left join ServGrpMst on ServMast.SrvSgpCode=ServGrpMst.SgpCode) left join AchdMast on ServMast.SrvAhCode=AchdMast.AhCode order by SrvName", dbComDatabase, adOpenKeyset, adLockOptimistic
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
Set clsSRV = Nothing
Set clsAH = Nothing
Set clsSGP = Nothing
Set fcmbSgpName = Nothing
Set fcmbAhName = Nothing

Set clsListStru = Nothing

CloseTable datRecset
CloseDataSource dbHmsDatabase
CloseDataSource dbAcDatabase
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
Dim tRecset As New ADODB.Recordset

Data_Verify = False
If Val(mskFormBoundField.Text) < 1 And FormAddEditMode = cFORM_EDITMODE Then
    ErrorBox "Invalid Key Value !!!"
    txtSrvName.SetFocus
    Exit Function
End If
If Trim(txtSrvName.Text) = "" Then
    ErrorBox "Invalid Service Name !!!"
    txtSrvName.SetFocus
    Exit Function
End If
If txtSrvName.Text <> mSrvName_old Then
    If ChkIsDuplicate(dbHmsDatabase, "ServMast", "SrvName", txtSrvName.Text, "SrvCode", Val(mskFormBoundField.Text)) = True Then
        ErrorBox "Duplicate Input !!!"
        txtSrvName.SetFocus
        Exit Function
    End If
End If
If txtSgpName.Text = "" Or Val(fcmbSgpName.BoundText) = 0 Then
    ErrorBox "Invalid Service Group Selection !!!"
    txtSgpName.SetFocus
    Exit Function
End If
If txtAhName.Text = "" Or Val(fcmbAhName.BoundText) = 0 Then
    ErrorBox "Invalid Account Name Selection !!!"
    txtAhName.SetFocus
    Exit Function
End If
If Val(mskSrvIndex.Text) < 0 Then
    ErrorBox "Invalid Index !!!"
    mskSrvIndex.SetFocus
    Exit Function
Else
    With tRecset
    .Open "Select SrvCode from ServMast order by SrvCode", dbHmsDatabase, adOpenKeyset, adLockOptimistic
    If .RecordCount < Val(mskSrvIndex.Text) Or Val(mskSrvIndex.Text) = 0 Then
        mskSrvIndex.Text = CStr(.RecordCount + IIf(FormAddEditMode = cFORM_ADDMODE, 1, 0))
    End If
    End With
    CloseTable tRecset
End If
If Val(UnMyNumFmt(mskSrvOpdGenChg.Text)) < 0 Then
    ErrorBox "Invalid Input !!!"
    mskSrvOpdGenChg.SetFocus
    Exit Function
End If
If Val(UnMyNumFmt(mskSrvOpdEmgChg.Text)) < 0 Then
    ErrorBox "Invalid Input !!!"
    mskSrvOpdEmgChg.SetFocus
    Exit Function
End If
If Val(UnMyNumFmt(mskSrvIpdGenChg.Text)) < 0 Then
    ErrorBox "Invalid Input !!!"
    mskSrvIpdGenChg.SetFocus
    Exit Function
End If
If Val(UnMyNumFmt(mskSrvIpdEmgChg.Text)) < 0 Then
    ErrorBox "Invalid Input !!!"
    mskSrvIpdEmgChg.SetFocus
    Exit Function
End If
If Val(UnMyNumFmt(mskSrvLabGenChg.Text)) < 0 Then
    ErrorBox "Invalid Input !!!"
    mskSrvLabGenChg.SetFocus
    Exit Function
End If
If Val(UnMyNumFmt(mskSrvLabEmgChg.Text)) < 0 Then
    ErrorBox "Invalid Input !!!"
    mskSrvLabEmgChg.SetFocus
    Exit Function
End If
If Val(UnMyPerFmt(mskSrvDiscPer.Text)) < 0 Then
    ErrorBox "Invalid Discount Percentage !!!"
    mskSrvDiscPer.SetFocus
    Exit Function
End If

CloseTable tRecset, mCheckOpen:=True

Data_Verify = True

End Function

Private Sub mskSrvDiscPer_GotFocus()
FlashActiveControl mskSrvDiscPer, True
End Sub

Private Sub mskSrvDiscPer_LostFocus()
FlashActiveControl mskSrvDiscPer, False
End Sub

Private Sub mskSrvDiscPer_Validate(Cancel As Boolean)
mskSrvDiscPer.Text = ToMyPerFmt(mskSrvDiscPer.Text)
If Val(UnMyPerFmt(mskSrvDiscPer.Text)) < 0 Then
    ErrorBox "Invalid Discount Percentage !!!"
    mskSrvDiscPer.SetFocus
    Cancel = True
End If

End Sub

Private Sub mskSrvIndex_GotFocus()
FlashActiveControl mskSrvIndex, True
End Sub

Private Sub mskSrvIndex_LostFocus()
FlashActiveControl mskSrvIndex, False
End Sub

Private Sub mskSrvIndex_Validate(Cancel As Boolean)
Dim tRecset As New ADODB.Recordset

mskSrvIndex.Text = ToMyNumFmt(mskSrvIndex.Text, mDecimals:=0, mUseAbs:=True, mGroupedDigit:=False)
If Val(mskSrvIndex.Text) < 0 Then
    ErrorBox "Invalid Index !!!"
    mskSrvIndex.SetFocus
    Cancel = True
Else
    With tRecset
    .Open "Select SrvCode from ServMast order by SrvCode", dbHmsDatabase, adOpenKeyset, adLockOptimistic
    If .RecordCount < Val(mskSrvIndex.Text) Or Val(mskSrvIndex.Text) = 0 Then
        mskSrvIndex.Text = CStr(.RecordCount + IIf(FormAddEditMode = cFORM_ADDMODE, 1, 0))
    End If
    End With
    CloseTable tRecset
End If

CloseTable tRecset, mCheckOpen:=True

End Sub

Private Sub mskSrvIpdEmgChg_GotFocus()
FlashActiveControl mskSrvIpdEmgChg, True
End Sub

Private Sub mskSrvIpdEmgChg_LostFocus()
FlashActiveControl mskSrvIpdEmgChg, False
End Sub

Private Sub mskSrvIpdEmgChg_Validate(Cancel As Boolean)
mskSrvIpdEmgChg.Text = ToMyNumFmt(mskSrvIpdEmgChg.Text)
If Val(UnMyNumFmt(mskSrvIpdEmgChg.Text)) < 0 Then
    ErrorBox "Invalid Input !!!"
    mskSrvIpdEmgChg.SetFocus
    Cancel = True
End If

End Sub

Private Sub mskSrvIpdGenChg_GotFocus()
FlashActiveControl mskSrvIpdGenChg, True
End Sub

Private Sub mskSrvIpdGenChg_LostFocus()
FlashActiveControl mskSrvIpdGenChg, False
End Sub

Private Sub mskSrvIpdGenChg_Validate(Cancel As Boolean)
mskSrvIpdGenChg.Text = ToMyNumFmt(mskSrvIpdGenChg.Text)
If Val(UnMyNumFmt(mskSrvIpdGenChg.Text)) < 0 Then
    ErrorBox "Invalid Input !!!"
    mskSrvIpdGenChg.SetFocus
    Cancel = True
Else
    If FormAddEditMode = cFORM_ADDMODE And Val(UnMyNumFmt(mskSrvIpdEmgChg.Text)) = 0 Then
        mskSrvIpdEmgChg.Text = mskSrvIpdGenChg.Text
    End If
End If

End Sub

Private Sub mskSrvLabEmgChg_GotFocus()
FlashActiveControl mskSrvLabEmgChg, True
End Sub

Private Sub mskSrvLabEmgChg_LostFocus()
FlashActiveControl mskSrvLabEmgChg, False
End Sub

Private Sub mskSrvLabEmgChg_Validate(Cancel As Boolean)
mskSrvLabEmgChg.Text = ToMyNumFmt(mskSrvLabEmgChg.Text)
If Val(UnMyNumFmt(mskSrvLabEmgChg.Text)) < 0 Then
    ErrorBox "Invalid Input !!!"
    mskSrvLabEmgChg.SetFocus
    Cancel = True
End If

End Sub

Private Sub mskSrvLabGenChg_GotFocus()
FlashActiveControl mskSrvLabGenChg, True
End Sub

Private Sub mskSrvLabGenChg_LostFocus()
FlashActiveControl mskSrvLabGenChg, False
End Sub

Private Sub mskSrvLabGenChg_Validate(Cancel As Boolean)
mskSrvLabGenChg.Text = ToMyNumFmt(mskSrvLabGenChg.Text)
If Val(UnMyNumFmt(mskSrvLabGenChg.Text)) < 0 Then
    ErrorBox "Invalid Input !!!"
    mskSrvLabGenChg.SetFocus
    Cancel = True
Else
    If FormAddEditMode = cFORM_ADDMODE And Val(UnMyNumFmt(mskSrvLabEmgChg.Text)) = 0 Then
        mskSrvLabEmgChg.Text = mskSrvLabGenChg.Text
    End If
End If

End Sub

Private Sub mskSrvOpdEmgChg_GotFocus()
FlashActiveControl mskSrvOpdEmgChg, True
End Sub

Private Sub mskSrvOpdEmgChg_LostFocus()
FlashActiveControl mskSrvOpdEmgChg, False
End Sub

Private Sub mskSrvOpdEmgChg_Validate(Cancel As Boolean)
mskSrvOpdEmgChg.Text = ToMyNumFmt(mskSrvOpdEmgChg.Text)
If Val(UnMyNumFmt(mskSrvOpdEmgChg.Text)) < 0 Then
    ErrorBox "Invalid Input !!!"
    mskSrvOpdEmgChg.SetFocus
    Cancel = True
End If

End Sub

Private Sub mskSrvOpdGenChg_GotFocus()
FlashActiveControl mskSrvOpdGenChg, True
End Sub

Private Sub mskSrvOpdGenChg_LostFocus()
FlashActiveControl mskSrvOpdGenChg, False
End Sub

Private Sub mskSrvOpdGenChg_Validate(Cancel As Boolean)
mskSrvOpdGenChg.Text = ToMyNumFmt(mskSrvOpdGenChg.Text)
If Val(UnMyNumFmt(mskSrvOpdGenChg.Text)) < 0 Then
    ErrorBox "Invalid Input !!!"
    mskSrvOpdGenChg.SetFocus
    Cancel = True
Else
    If FormAddEditMode = cFORM_ADDMODE And Val(UnMyNumFmt(mskSrvOpdEmgChg.Text)) = 0 Then
        mskSrvOpdEmgChg.Text = mskSrvOpdGenChg.Text
    End If
End If

End Sub

Private Sub txtAhName_Change()
If fcmbAhName.CallFromText_Change = False Then
    fcmbAhName.CallFromText_Change = True
    If InterActiveChange(txtAhName) = True Then
        fcmbAhName.UserText = Array(txtAhName.Text, txtAhName.SelStart)
        fcmbAhName.Show
        txtAhName.Text = fcmbAhName.Text
        If fcmbAhName.ListSelected = True Then
            SendKeys "{tab}"
        End If
    End If
    fcmbAhName.CallFromText_Change = False
End If

End Sub

Private Sub txtAhName_GotFocus()
FlashActiveControl txtAhName, True
End Sub

Private Sub txtAhName_LostFocus()
FlashActiveControl txtAhName, False
End Sub

Private Sub txtAhname_Validate(Cancel As Boolean)
If txtAhName.Text = "" Or Val(fcmbAhName.BoundText) = 0 Then
    ErrorBox "Invalid Account Name Selection !!!"
    txtAhName.SetFocus
    Cancel = True
End If

End Sub

Private Sub txtSgpName_Change()
If fcmbSgpName.CallFromText_Change = False Then
    fcmbSgpName.CallFromText_Change = True
    If InterActiveChange(txtSgpName) = True Then
        fcmbSgpName.UserText = Array(txtSgpName.Text, txtSgpName.SelStart)
        fcmbSgpName.Show
        txtSgpName.Text = fcmbSgpName.Text
        If fcmbSgpName.ListSelected = True Then
            SendKeys "{tab}"
        End If
    End If
    fcmbSgpName.CallFromText_Change = False
End If

End Sub

Private Sub txtSgpName_GotFocus()
FlashActiveControl txtSgpName, True
End Sub

Private Sub txtSgpName_LostFocus()
FlashActiveControl txtSgpName, False
End Sub

Private Sub txtSgpName_Validate(Cancel As Boolean)
If txtSgpName.Text = "" Or Val(fcmbSgpName.BoundText) = 0 Then
    ErrorBox "Invalid Service Group Selection !!!"
    txtSgpName.SetFocus
    Cancel = True
End If

End Sub

Private Sub txtSrvName_GotFocus()
FlashActiveControl txtSrvName, True
End Sub

Private Sub txtSrvName_LostFocus()
FlashActiveControl txtSrvName, False
End Sub

Private Sub txtSrvName_Validate(Cancel As Boolean)
txtSrvName.Text = ToMyWord(txtSrvName.Text)
If Trim(txtSrvName.Text) = "" Then
    ErrorBox "Invalid Input !!!"
    Cancel = True
    txtSrvName.SetFocus
Else
    If txtSrvName.Text <> mSrvName_old Then
        If ChkIsDuplicate(dbHmsDatabase, "ServMast", "SrvName", txtSrvName.Text, "SrvCode", Val(mskFormBoundField.Text)) = True Then
            ErrorBox "Duplicate Input !!!"
            Cancel = True
            txtSrvName.SetFocus
        End If
    End If
End If

End Sub

Private Sub Data_AddEvent()

If clsSRV.BeginMast(0) = False Then
    Exit Sub
End If
mEntrySaved = False: mEntryAborted = False
FormAddEditMode = cFORM_ADDMODE
    
clsSRV.Clear
mSrvCode = clsSRV.ActiveCode
mskFormBoundField.Text = mSrvCode
txtSrvName.Text = ""
fcmbSgpName.BoundText = "": txtSgpName.Text = ""
fcmbAhName.BoundText = "": txtAhName.Text = ""
mskSrvIndex.Text = 0
mskSrvOpdGenChg.Text = ToMyNumFmt(0)
mskSrvOpdEmgChg.Text = ToMyNumFmt(0)
mskSrvIpdGenChg.Text = ToMyNumFmt(0)
mskSrvIpdEmgChg.Text = ToMyNumFmt(0)
mskSrvLabGenChg.Text = ToMyNumFmt(0)
mskSrvLabEmgChg.Text = ToMyNumFmt(0)
chkSrvUnitEditable.Value = vbChecked
chkSrvRateEditable.Value = vbChecked
chkSrvAmtEditable.Value = vbChecked
chkSrvInfAllowed.Value = vbChecked
chkSrvDefAllowed.Value = vbChecked
chkSrvDiscAllowed.Value = vbChecked
mskSrvDiscPer.Text = ToMyPerFmt(0)
chkSrvShowInList.Value = vbChecked

mSrvName_old = txtSrvName.Text
mSrvIndex_old = Val(mskSrvIndex.Text)

Call ShowEntryMode(True)
txtSrvName.SetFocus

End Sub

Private Sub Data_EditEvent()
Dim mLCount As Integer, mUCount As Integer, mCount As Integer

If clsSRV.BeginMast(datRecset.Fields("SrvCode")) = False Then
    Exit Sub
End If
mEntrySaved = False: mEntryAborted = False
FormAddEditMode = cFORM_EDITMODE
With datRecset
mSrvCode = .Fields("SrvCode")
clsSRV.GetData mSrvCode
mskFormBoundField.Text = CStr(.Fields("SrvCode"))
txtSrvName.Text = .Fields("SrvName")
fcmbSgpName.BoundText = CStr(.Fields("SrvSgpCode")): txtSgpName.Text = fcmbSgpName.Text
fcmbAhName.BoundText = CStr(.Fields("SrvAhCode")): txtAhName.Text = fcmbAhName.Text
mskSrvIndex.Text = .Fields("SrvIndex")
mskSrvOpdGenChg.Text = ToMyNumFmt(.Fields("SrvOpdGenChg"))
mskSrvOpdEmgChg.Text = ToMyNumFmt(.Fields("SrvOpdEmgChg"))
mskSrvIpdGenChg.Text = ToMyNumFmt(.Fields("SrvIpdGenChg"))
mskSrvIpdEmgChg.Text = ToMyNumFmt(.Fields("SrvIpdEmgChg"))
mskSrvLabGenChg.Text = ToMyNumFmt(.Fields("SrvLabGenChg"))
mskSrvLabEmgChg.Text = ToMyNumFmt(.Fields("SrvLabEmgChg"))
chkSrvUnitEditable.Value = IIf(.Fields("SrvUnitEditable") = True, vbChecked, vbUnchecked)
chkSrvRateEditable.Value = IIf(.Fields("SrvRateEditable") = True, vbChecked, vbUnchecked)
chkSrvAmtEditable.Value = IIf(.Fields("SrvAmtEditable") = True, vbChecked, vbUnchecked)
chkSrvInfAllowed.Value = IIf(.Fields("SrvInfAllowed") = True, vbChecked, vbUnchecked)
chkSrvDefAllowed.Value = IIf(.Fields("SrvDefAllowed") = True, vbChecked, vbUnchecked)
chkSrvDiscAllowed.Value = IIf(.Fields("SrvDiscAllowed") = True, vbChecked, vbUnchecked)
mskSrvDiscPer.Text = ToMyPerFmt(.Fields("SrvDiscPer"))
chkSrvShowInList.Value = IIf(.Fields("SrvShowInList") = True, vbChecked, vbUnchecked)
End With

mSrvName_old = txtSrvName.Text
mSrvIndex_old = Val(mskSrvIndex.Text)

Call ShowEntryMode(True)
txtSrvName.SetFocus

End Sub

Private Sub Data_SaveEvent()
Dim tRecset As New ADODB.Recordset

With clsSRV
If FormAddEditMode = cFORM_ADDMODE Then
    .Clear
Else
    .GetData mSrvCode
End If
.mName_str = txtSrvName.Text
.mSrvSgpCode_lng = Val(fcmbSgpName.BoundText)
.mSrvAhCode_lng = Val(fcmbAhName.BoundText)
.mSrvIndex_int = Val(mskSrvIndex.Text)
.mSrvOpdGenChg_dbl = Val(UnMyNumFmt(mskSrvOpdGenChg.Text))
.mSrvOpdEmgChg_dbl = Val(UnMyNumFmt(mskSrvOpdEmgChg.Text))
.mSrvIpdGenChg_dbl = Val(UnMyNumFmt(mskSrvIpdGenChg.Text))
.mSrvIpdEmgChg_dbl = Val(UnMyNumFmt(mskSrvIpdEmgChg.Text))
.mSrvLabGenChg_dbl = Val(UnMyNumFmt(mskSrvLabGenChg.Text))
.mSrvLabEmgChg_dbl = Val(UnMyNumFmt(mskSrvLabEmgChg.Text))
.mSrvUnitEditable_bln = (chkSrvUnitEditable.Value = vbChecked)
.mSrvRateEditable_bln = (chkSrvRateEditable.Value = vbChecked)
.mSrvAmtEditable_bln = (chkSrvAmtEditable.Value = vbChecked)
.mSrvInfAllowed_bln = (chkSrvInfAllowed.Value = vbChecked)
.mSrvDefAllowed_bln = (chkSrvDefAllowed.Value = vbChecked)
.mSrvDiscAllowed_bln = (chkSrvDiscAllowed.Value = vbChecked)
.mSrvDiscPer_dbl = Val(UnMyPerFmt(mskSrvDiscPer.Text))
.mSrvShowInList_bln = (chkSrvShowInList.Value = vbChecked)

If FormAddEditMode = cFORM_ADDMODE Then
    .AddNew
    mskFormBoundField.Text = .mCode_lng
Else
    .Update mSrvCode
End If
If .mCode_lng > 0 Then   ' updated successfully
    .UpdateMast .mCode_lng
    .EndMast .mCode_lng
    mEntrySaved = True
    
    Rem re-ordering index order
    RefreshDatabase dbHmsDatabase
    dbHmsDatabase.BeginTrans
    tRecset.Open "Select * from ServMast where SrvCode<>" & CStr(.mCode_lng) & " and SrvIndex=" & .mSrvIndex_int & "", dbHmsDatabase, adOpenKeyset, adLockOptimistic
    If tRecset.RecordCount > 0 Then
        If FormAddEditMode = cFORM_ADDMODE Then
            tRecset.Fields("SrvIndex") = tRecset.RecordCount
        Else
            tRecset.Fields("SrvIndex") = mSrvIndex_old
        End If
        tRecset.Update
    End If
    dbHmsDatabase.CommitTrans
    CloseTable tRecset
Else
    Call Data_CancelEvent
    ErrorBox "Entry Cancelled !!!"
End If

End With

CloseTable tRecset, mCheckOpen:=True
End Sub

Private Sub Data_DeleteEvent()
Dim mDeleteit As Boolean, mRecAbsPos As Long
If (datRecset.EOF Or datRecset.BOF) = True Then
    Exit Sub
End If

mSrvCode = datRecset.Fields("SrvCode")
mRecAbsPos = datRecset.AbsolutePosition

If clsSRV.CanDeleteMast(mSrvCode) = True Then
    txtVoid.SetFocus
    If clsSRV.BeginMast(mSrvCode) = True Then
        clsSRV.GetData mSrvCode
        
        clsSRV.DeleteMast mSrvCode
        clsSRV.UpdateMast mSrvCode
        clsSRV.EndMast mSrvCode
        
        dbHmsDatabase.BeginTrans
        dbHmsDatabase.Execute "Update ServMast set SrvIndex=SrvIndex-1 where SrvIndex>=" & CStr(clsSRV.mSrvIndex_int) & " and SrvCode<>" & CStr(mSrvCode) & ""
        dbHmsDatabase.CommitTrans
        
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

End Sub

Private Sub Data_CancelEvent()
clsSRV.CancelMast mSrvCode
clsSRV.EndMast mSrvCode
mEntryAborted = True

End Sub

Private Sub SmryList()
Dim gcolcount As Integer, acount As Integer, mLow As Integer, mHigh As Integer, mPos As Integer, srow As Long, mColCount As Integer

clsListStru.Clear

Rem column definitions
clsListStru.AddFields mExpr:="SrvCode", mAttrib:=cFAT_SYSTEM
clsListStru.AddFields mExpr:="SrvName", mTitle:="Service Name", mAlign:=flexAlignLeftCenter, mWidth:=4000, mShowItem:=True
clsListStru.AddFields mExpr:="SrvSgpName", mTitle:="Group Name", mAlign:=flexAlignLeftCenter, mWidth:=2500, mShowItem:=True
clsListStru.AddFields mExpr:="SrvAhName", mTitle:="Account Name", mAlign:=flexAlignLeftCenter, mWidth:=2500, mShowItem:=True
clsListStru.AddFields mExpr:="SrvOpdGenChg", mTitle:="Opd.Chg", mAlign:=flexAlignRightCenter, mWidth:=1000, mShowItem:=True
clsListStru.AddFields mExpr:="SrvIpdGenChg", mTitle:="Ipd.Chg", mAlign:=flexAlignRightCenter, mWidth:=1000, mShowItem:=True
clsListStru.AddFields mExpr:="SrvIndex", mTitle:="Index", mAlign:=flexAlignRightCenter, mWidth:=1000, mShowItem:=True
clsListStru.AddFields mExpr:="SrvShowInList", mTitle:="Show List", mAlign:=flexAlignLeftCenter, mWidth:=1000, mShowItem:=True

RefreshDatabase dbHmsDatabase
RefreshDatabase dbComDatabase
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
If .RecordCount > 0 Then
    Do While .EOF = False
        Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("SrvCode")) = .Fields("SrvCode")
        Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("SrvName")) = .Fields("SrvName")
        Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("SrvSgpName")) = .Fields("SgpName")
        Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("SrvAhName")) = .Fields("AhName")
        Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("SrvOpdGenChg")) = ToMyNumFmt(.Fields("SrvOpdGenChg"))
        Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("SrvIpdGenChg")) = ToMyNumFmt(.Fields("SrvIpdGenChg"))
        Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("SrvIndex")) = .Fields("SrvIndex")
        Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("SrvShowInList")) = IIf(.Fields("SrvShowInList") = True, "Yes", "No")
        
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
If Shift = vbCtrlMask And KeyCode = vbKeyAdd Then
    Call Data_AddEvent
ElseIf Shift = vbCtrlMask And KeyCode = vbKeySubtract Then
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
    txtSearch1Text.Text = JoinKeyAscii(txtSearch1Text.Text, KeyAscii)
    Call txtSearch1Text_InterActiveChange
End If

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
SearchFlex Mfgrd1, clsListStru.GetItemIndex("SrvName"), mText
ShowActiveFlexRow Mfgrd1

End Sub

Private Sub txtSearch1Text_GotFocus()
FlashActiveControl txtSearch1Text, True
End Sub

Private Sub txtSearch1Text_LostFocus()
FlashActiveControl txtSearch1Text, False
End Sub

