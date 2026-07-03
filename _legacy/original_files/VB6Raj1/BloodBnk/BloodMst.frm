VERSION 5.00
Object = "{5E9E78A0-531B-11CF-91F6-C2863C385E30}#1.0#0"; "MSFLXGRD.OCX"
Begin VB.Form frmBloodMast 
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
   Begin VB.Frame frFormDtl 
      Appearance      =   0  'Flat
      BackColor       =   &H008F8FFF&
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
      Height          =   4215
      Left            =   240
      TabIndex        =   10
      Top             =   1080
      Width           =   9375
      Begin VB.TextBox txtItmName 
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
         TabIndex        =   4
         Top             =   2040
         Width           =   5295
      End
      Begin VB.TextBox txtBldName 
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
         Left            =   3840
         MaxLength       =   100
         TabIndex        =   1
         Top             =   480
         Visible         =   0   'False
         Width           =   3855
      End
      Begin VB.TextBox txtBdcName 
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
         TabIndex        =   3
         Top             =   1560
         Width           =   5295
      End
      Begin VB.TextBox txtBldDesc 
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
         TabIndex        =   5
         Top             =   2580
         Width           =   5295
      End
      Begin VB.CommandButton cmdSaveForm 
         Appearance      =   0  'Flat
         BackColor       =   &H80000009&
         Caption         =   "      &Save"
         Height          =   375
         Left            =   9000
         Style           =   1  'Graphical
         TabIndex        =   6
         Top             =   3840
         Width           =   375
      End
      Begin VB.TextBox txtBdgName 
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
         Caption         =   "Master Item:"
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
         TabIndex        =   22
         Top             =   2040
         Width           =   1575
      End
      Begin VB.Label Label2 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Component:"
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
         TabIndex        =   21
         Top             =   1560
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
         Height          =   285
         Index           =   1
         Left            =   840
         TabIndex        =   20
         Top             =   2580
         Width           =   1575
      End
      Begin VB.Label Label2 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Blood Group:"
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
         TabIndex        =   13
         Top             =   1080
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
         TabIndex        =   12
         Top             =   480
         Width           =   1575
      End
   End
   Begin VB.TextBox txtVoid 
      CausesValidation=   0   'False
      Height          =   375
      Left            =   120
      TabIndex        =   7
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
      MaskColor       =   &H000000FF&
      TabIndex        =   15
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
      TabIndex        =   14
      TabStop         =   0   'False
      Top             =   0
      Width           =   255
   End
   Begin VB.ComboBox cmbFormEntryMode 
      Appearance      =   0  'Flat
      Enabled         =   0   'False
      Height          =   315
      ItemData        =   "BloodMst.frx":0000
      Left            =   0
      List            =   "BloodMst.frx":000D
      Style           =   1  'Simple Combo
      TabIndex        =   11
      TabStop         =   0   'False
      Text            =   "cmbFormMode"
      Top             =   360
      Width           =   1455
   End
   Begin VB.Frame frFormSmry 
      Appearance      =   0  'Flat
      BackColor       =   &H008F8FFF&
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
      Height          =   6435
      Left            =   240
      TabIndex        =   9
      Top             =   840
      Width           =   13275
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
         Height          =   5250
         Left            =   225
         TabIndex        =   17
         Top             =   780
         Width           =   12465
         _ExtentX        =   21987
         _ExtentY        =   9260
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
         TabIndex        =   19
         Top             =   360
         Width           =   735
      End
   End
   Begin VB.Label lblFormHeading 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00E0E0E0&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Blood Master (Combination)"
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
      TabIndex        =   8
      Top             =   0
      Width           =   9015
   End
End
Attribute VB_Name = "frmBloodMast"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Option Explicit

Dim FormLoaded As Boolean, mLastKeyPressed As Integer, mMaskKeyPressed As Integer
Dim mBldCode As Long
Dim mRemoteAccess As Boolean, mEntrySaved As Boolean, mEntryAborted As Boolean
Dim dbBdkDatabase As New ADODB.Connection, dbStDatabase As New ADODB.Connection, dbGrpDatabase As New ADODB.Connection, dbComDatabase As New ADODB.Connection, datRecset As New ADODB.Recordset
Dim mBldName_old As String, mBldItmCode_old As Long
Dim fcmbBdgName As clsBdkFlexSearch, fcmbBdcName As clsBdkFlexSearch, fcmbItmName As clsComFlexSearch
Dim clsBLD As clsBdkMasterEntry, clsITM As clsProduct, mActiveControl As Object, clsListStru As clsSelectQueryStructure

Public Property Let RemoteAccessCode(ByVal mAccessCode As Long)
mRemoteAccess = True
mBldCode = mAccessCode
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

Public Property Get BldName() As String
BldName = txtBldName.Text
End Property

Public Property Get FormAddEditMode() As Integer
FormAddEditMode = cmbFormEntryMode.ListIndex
End Property

Public Property Let FormAddEditMode(ByVal New_FormEntryMode As Integer)
cmbFormEntryMode.ListIndex = New_FormEntryMode
End Property

Public Property Get SecuMenuName() As String
SecuMenuName = Me.Name
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
        txtBdgName.SetFocus
    End If
End If

End Sub

Private Sub cmdSaveForm_Click()
Call Data_SaveEvent

Call SmryList
txtSearch1Text_InterActiveChange txtBldName.Text

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
        txtBdgName.SetFocus
    End If
End If
cmdSaveForm.Enabled = True

End Sub

Private Sub Form_Activate()
If FormLoaded = False Then
    If mRemoteAccess = True Then
        If mBldCode = 0 Then
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

OpenBdkDataSource dbBdkDatabase
OpenStDataSource dbStDatabase
OpenGrpDataSource dbGrpDatabase
OpenComDataSource dbComDatabase

Set clsBLD = New clsBdkMasterEntry
Set clsBLD.dbBdkDatabase = dbBdkDatabase
clsBLD.blnBloodMast = True
clsBLD.Init

Set clsITM = New clsProduct
Set clsITM.dbStDatabase = dbStDatabase
Set clsITM.dbGrpDatabase = dbGrpDatabase

Set fcmbBdgName = New clsBdkFlexSearch
Set fcmbBdgName.dbBdkDatabase = dbBdkDatabase
Set fcmbBdgName.dbComDatabase = dbComDatabase
fcmbBdgName.blnBloodGrpMastList = True
fcmbBdgName.Init

Set fcmbBdcName = New clsBdkFlexSearch
Set fcmbBdcName.dbBdkDatabase = dbBdkDatabase
Set fcmbBdcName.dbComDatabase = dbComDatabase
fcmbBdcName.blnBloodCompoMastList = True
fcmbBdcName.Init

Set fcmbItmName = New clsComFlexSearch
Set fcmbItmName.dbStDatabase = dbStDatabase
Set fcmbItmName.dbComDatabase = dbComDatabase
fcmbItmName.blnProdMastList = True
fcmbItmName.Init

Set clsListStru = New clsSelectQueryStructure

If mRemoteAccess = True Then
    datRecset.open "Select * from ((BloodMast" _
        & " inner join BloodGrpMst on BloodMast.BldBdgCode = BloodGrpMst.BdgCode)" _
        & " inner join BloodCompoMst on BloodMast.BldBdcCode = BloodCompoMst.BdcCode)" _
        & " inner join ProdMast on BloodMast.BldItmCode = ProdMast.ItmCode" _
        & " where BldCode = " & CStr(mBldCode) _
        & " order by BldName" _
        , dbComDatabase, adOpenKeyset, adLockOptimistic
Else
    datRecset.open "Select * from ((BloodMast" _
        & " inner join BloodGrpMst on BloodMast.BldBdgCode = BloodGrpMst.BdgCode)" _
        & " inner join BloodCompoMst on BloodMast.BldBdcCode = BloodCompoMst.BdcCode)" _
        & " inner join ProdMast on BloodMast.BldItmCode = ProdMast.ItmCode" _
        & " order by BldName" _
        , dbComDatabase, adOpenKeyset, adLockOptimistic
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
Set clsBLD = Nothing
Set clsITM = Nothing
Set fcmbBdgName = Nothing
Set fcmbBdcName = Nothing
Set fcmbItmName = Nothing
Set clsListStru = Nothing

CloseTable datRecset
CloseDataSource dbBdkDatabase
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
Dim tRecset As New ADODB.Recordset

Data_Verify = False
If Val(mskFormBoundField.Text) < 1 And FormAddEditMode = cFORM_EDITMODE Then
    ErrorBox "Invalid Key Value !!!"
    txtBdgName.SetFocus
    Exit Function
End If
If Val(fcmbBdgName.BoundText) < 1 Or Trim(txtBdgName.Text) = "" Then
    ErrorBox "Invalid Selection !!!"
    txtBdgName.SetFocus
    Exit Function
End If
If Val(fcmbBdcName.BoundText) < 1 Or Trim(txtBdcName.Text) = "" Then
    ErrorBox "Invalid Selection !!!"
    txtBdcName.SetFocus
    Exit Function
End If
If Val(fcmbItmName.BoundText) < 1 Or Trim(txtItmName.Text) = "" Then
    ErrorBox "Invalid Selection !!!"
    txtItmName.SetFocus
    Exit Function
End If

txtBldName.Text = txtBdgName.Text & "_" & txtBdcName.Text
If Trim(txtBldName.Text) = "" Then
    ErrorBox "Invalid Blood Name !!!"
    txtBdgName.SetFocus
    Exit Function
End If
If txtBldName.Text <> mBldName_old Then
    If ChkIsDuplicate(dbBdkDatabase, "BloodMast", "BldName", txtBldName.Text, "BldCode", Val(mskFormBoundField.Text)) = True Then
        ErrorBox "Duplicate Input !!!"
        txtBdgName.SetFocus
        Exit Function
    End If
End If
With tRecset
.open "Select * from BloodMast" _
    & " where BldBdgCode = " & CStr(Val(fcmbBdgName.BoundText)) _
    & " and BldBdcCode = " & CStr(Val(fcmbBdcName.BoundText)) _
    & " and BldCode <> " & CStr(Val(mskFormBoundField.Text)) _
    , dbBdkDatabase, adOpenKeyset, adLockOptimistic
If .EOF = False Then
    ErrorBox "Duplicate Input !!!"
    txtBdgName.SetFocus
    CloseTable tRecset
    Exit Function
Else
    CloseTable tRecset
End If
End With

Set tRecset = Nothing
Data_Verify = True
End Function

Private Sub txtBdcName_KeyDown(KeyCode As Integer, Shift As Integer)
If MyDropDownKey(Shift, KeyCode) = True Then
    Call txtBdcName_Change
End If

End Sub

Private Sub txtBdcName_Validate(Cancel As Boolean)
If Val(fcmbBdcName.BoundText) < 1 Or Trim(txtBdcName.Text) = "" Then
    ErrorBox "Invalid Selection !!!"
    txtBdcName.SetFocus
    Cancel = True
Else
    txtBldName.Text = txtBdgName.Text & "_" & txtBdcName.Text
End If

End Sub

Private Sub txtBdgName_KeyDown(KeyCode As Integer, Shift As Integer)
If MyDropDownKey(Shift, KeyCode) = True Then
    Call txtBdgName_Change
End If

End Sub

Private Sub txtBdgName_Validate(Cancel As Boolean)
If Val(fcmbBdgName.BoundText) < 1 Or Trim(txtBdgName.Text) = "" Then
    ErrorBox "Invalid Selection !!!"
    txtBdgName.SetFocus
    Cancel = True
Else
    txtBldName.Text = txtBdgName.Text & "_" & txtBdcName.Text
End If

End Sub

Private Sub txtBldDesc_GotFocus()
FlashActiveControl txtBldDesc, True
End Sub

Private Sub txtBldDesc_LostFocus()
FlashActiveControl txtBldDesc, False
End Sub

Private Sub txtBldDesc_Validate(Cancel As Boolean)
txtBldDesc.Text = ToMyWord(txtBldDesc.Text)

End Sub

Private Sub txtBdcName_Change()
If fcmbBdcName.CallFromText_Change = False Then
    fcmbBdcName.CallFromText_Change = True
    If InterActiveChange(txtBdcName) = True Then
        fcmbBdcName.UserText = Array(txtBdcName.Text, txtBdcName.SelStart)
        fcmbBdcName.Show
        txtBdcName.Text = fcmbBdcName.Text
        If fcmbBdcName.ListSelected = True Then
            SendKeys "{tab}"
        End If
    End If
    fcmbBdcName.CallFromText_Change = False
End If

End Sub

Private Sub txtBdcName_GotFocus()
FlashActiveControl txtBdcName, True
End Sub

Private Sub txtBdcName_LostFocus()
FlashActiveControl txtBdcName, False
End Sub

Private Sub txtBdgName_Change()
If fcmbBdgName.CallFromText_Change = False Then
    fcmbBdgName.CallFromText_Change = True
    If InterActiveChange(txtBdgName) = True Then
        fcmbBdgName.UserText = Array(txtBdgName.Text, txtBdgName.SelStart)
        fcmbBdgName.Show
        txtBdgName.Text = fcmbBdgName.Text
        If fcmbBdgName.ListSelected = True Then
            SendKeys "{tab}"
        End If
    End If
    fcmbBdgName.CallFromText_Change = False
End If

End Sub

Private Sub txtBdgName_GotFocus()
FlashActiveControl txtBdgName, True
End Sub

Private Sub txtBdgName_LostFocus()
FlashActiveControl txtBdgName, False
End Sub

Private Sub txtBldName_Validate(Cancel As Boolean)
txtBldName.Text = ToMyWord(txtBldName.Text)
If Trim(txtBldName.Text) = "" Then
    ErrorBox "Invalid Input !!!"
    Cancel = True
    txtBdgName.SetFocus
Else
    If txtBldName.Text <> mBldName_old Then
        If ChkIsDuplicate(dbBdkDatabase, "BloodMast", "BldName", txtBldName.Text, "BldCode", Val(mskFormBoundField.Text)) = True Then
            ErrorBox "Duplicate Input !!!"
            Cancel = True
            txtBdgName.SetFocus
        End If
    End If
End If

End Sub

Private Sub Data_AddEvent()

If CanUserAddOpt(mUsrCode:=MyCompany.mUserCode, mMenuOptName:=Me.SecuMenuName) = False Then
    AlertBox "Not Permitted !!!"
    Exit Sub
End If
If clsBLD.BeginMast(0) = False Then
    Exit Sub
End If
mEntrySaved = False: mEntryAborted = False
FormAddEditMode = cFORM_ADDMODE

clsBLD.Clear
mBldCode = clsBLD.ActiveCode

mskFormBoundField.Text = mBldCode
txtBldName.Text = ""
txtBdgName.Text = "": fcmbBdgName.BoundText = ""
txtBdcName.Text = "": fcmbBdcName.BoundText = ""
fcmbItmName.BoundText = GetLastValueFromTableCol(cnn:=dbBdkDatabase, mTableName:="BloodMast", mColumnName:="BldItmCode", mOrderByColName:="BldCode", mRtnDefValue:=0)
txtItmName.Text = fcmbItmName.Text
txtBldDesc.Text = ""

mBldName_old = txtBldName.Text
mBldItmCode_old = Val(fcmbItmName.BoundText)

Call ShowEntryMode(True)
txtBdgName.SetFocus

End Sub

Private Sub Data_EditEvent()
Dim mLCount As Integer, mUCount As Integer, mCount As Integer, mOpnQty As Double, mOpnAvgRate As Double, mOpnValue As Double, mCurQty As Double, mCurAvgRate As Double, mCurValue As Double

If CanUserEditOpt(mUsrCode:=MyCompany.mUserCode, mMenuOptName:=Me.SecuMenuName) = False Then
    AlertBox "Not Permitted !!!"
    Exit Sub
End If
If clsBLD.BeginMast(datRecset.fields("BldCode")) = False Then
    Exit Sub
End If
mEntrySaved = False: mEntryAborted = False
FormAddEditMode = cFORM_EDITMODE
With datRecset
mBldCode = .fields("BldCode")

clsBLD.GetData mBldCode

mskFormBoundField.Text = CStr(mBldCode)

txtBldName.Text = .fields("BldName")
fcmbBdgName.BoundText = CStr(.fields("BldBdgCode")): txtBdgName.Text = fcmbBdgName.Text
fcmbBdcName.BoundText = CStr(.fields("BldBdcCode")): txtBdcName.Text = fcmbBdcName.Text
fcmbItmName.BoundText = CStr(.fields("BldItmCode")): txtItmName.Text = fcmbItmName.Text
txtBldDesc.Text = .fields("BldDesc")
End With

mBldName_old = txtBldName.Text
mBldItmCode_old = Val(fcmbItmName.BoundText)

Call ShowEntryMode(True)
txtBdgName.SetFocus

End Sub

Private Sub Data_SaveEvent()
Dim mContinueUpdate As Boolean

With clsBLD
If FormAddEditMode = cFORM_ADDMODE Then
    .Clear
Else
    .GetData mBldCode
End If

.mName_str = txtBldName.Text
.mBldBdgCode_lng = Val(fcmbBdgName.BoundText)
.mBldBdcCode_lng = Val(fcmbBdcName.BoundText)
.mBldItmCode_lng = Val(fcmbItmName.BoundText)
.mBldDesc_str = txtBldDesc.Text
If FormAddEditMode = cFORM_ADDMODE Then
    If .AddNew() = True Then
        mskFormBoundField.Text = .mCode_lng
        mBldCode = .mCode_lng
    End If
Else
    If .Update(mBldCode) = True Then
        Rem none
    End If
End If
If .mCode_lng > 0 Then     ''''  updated successfully
    .UpdateMast mBldCode
    .EndMast mBldCode
    
    If FormAddEditMode = cFORM_ADDMODE Then
        clsITM.UpdateDependency Val(fcmbItmName.BoundText), mAddCount:=True
        
    ElseIf FormAddEditMode = cFORM_EDITMODE And Val(fcmbItmName.BoundText) <> mBldItmCode_old Then
        clsITM.UpdateDependency mBldItmCode_old, mAddCount:=False
        clsITM.UpdateDependency Val(fcmbItmName.BoundText), mAddCount:=True
        
    End If
    
    mEntrySaved = True
Else
    Call Data_CancelEvent
    ErrorBox "Entry Cancelled !!!"
End If
End With

End Sub

Private Sub Data_DeleteEvent()
Dim mDeleteit As Boolean, mRecAbsPos As Long

If CanUserDeleteOpt(mUsrCode:=MyCompany.mUserCode, mMenuOptName:=Me.SecuMenuName) = False Then
    AlertBox "Not Permitted !!!"
    Exit Sub
End If
If (datRecset.EOF Or datRecset.BOF) = True Then
    Exit Sub
End If

mBldCode = datRecset.fields("BldCode")
mRecAbsPos = datRecset.AbsolutePosition

If clsBLD.CanDeleteMast(mBldCode) = True Then
    If clsBLD.BeginMast(mBldCode) = True Then
        clsBLD.DeleteMast mBldCode
        clsBLD.UpdateMast mBldCode
        clsBLD.EndMast mBldCode
        
        clsITM.UpdateDependency Val(fcmbItmName.BoundText), mAddCount:=False
        
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
clsBLD.CancelMast mBldCode
clsBLD.EndMast mBldCode

mEntryAborted = True

End Sub

Private Sub SmryList()
Dim aStock As Variant, mQty As Double, mAvgRate As Double, mValue As Double
Dim gcolcount As Integer, acount As Integer, mLow As Integer, mHigh As Integer, mPos As Integer, srow As Long, mColCount As Integer

clsListStru.Clear

Rem column definitions
clsListStru.AddFields mExpr:="BldCode", mAttrib:=cFAT_SYSTEM
clsListStru.AddFields mExpr:="BldName", mTitle:="Blood Name", mAlign:=flexAlignLeftCenter, mWidth:=3500, mShowItem:=False
clsListStru.AddFields mExpr:="BdgName", mTitle:="Group Name", mAlign:=flexAlignLeftCenter, mWidth:=3500, mShowItem:=True
clsListStru.AddFields mExpr:="BdcName", mTitle:="Component Name", mAlign:=flexAlignLeftCenter, mWidth:=3500, mShowItem:=True
clsListStru.AddFields mExpr:="ItmName", mTitle:="Master Item", mAlign:=flexAlignLeftCenter, mWidth:=3000, mShowItem:=True

RefreshDatabase dbBdkDatabase
RefreshDatabase dbStDatabase
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
MoveRecToFirst datRecset
With datRecset
If .RecordCount > 0 Then
    Do While .EOF = False
        Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("BldCode")) = .fields("BldCode")
        Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("BldName")) = .fields("BldName")
        Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("BdgName")) = .fields("BdgName")
        Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("BdcName")) = .fields("BdcName")
        Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("ItmName")) = .fields("ItmName")
        
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

Private Sub txtItmName_Change()
If fcmbItmName.CallFromText_Change = False Then
    fcmbItmName.CallFromText_Change = True
    If InterActiveChange(txtItmName) = True Then
        fcmbItmName.UserText = Array(txtItmName.Text, txtItmName.SelStart)
        fcmbItmName.Show
        txtItmName.Text = fcmbItmName.Text
        If fcmbItmName.ListSelected = True Then
            SendKeys "{tab}"
        End If
    End If
    fcmbItmName.CallFromText_Change = False
End If

End Sub

Private Sub txtItmName_GotFocus()
FlashActiveControl txtItmName, True
End Sub

Private Sub txtItmName_KeyDown(KeyCode As Integer, Shift As Integer)
If MyDropDownKey(Shift, KeyCode) = True Then
    Call txtItmName_Change
End If

End Sub

Private Sub txtItmName_LostFocus()
FlashActiveControl txtItmName, False
End Sub

Private Sub txtItmName_Validate(Cancel As Boolean)
If Val(fcmbItmName.BoundText) < 1 Then
    ErrorBox "Invalid Selection !!!"
    txtItmName.SetFocus
    Cancel = True
End If
End Sub

Private Sub txtList1Col_DblClick(Index As Integer)
Call Mfgrd1_DblClick
End Sub

Private Sub txtList1Col_GotFocus(Index As Integer)
Mfgrd1.SetFocus
End Sub

Private Sub txtSearch1Text_InterActiveChange(Optional ByVal mText)
mText = IIf(IsMissing(mText) = True, txtSearch1Text.Text, mText)
SearchFlex Mfgrd1, clsListStru.GetItemIndex("BldName"), mText
ShowActiveFlexRow Mfgrd1

End Sub

Private Sub txtSearch1Text_GotFocus()
FlashActiveControl txtSearch1Text, True

End Sub

Private Sub txtSearch1Text_LostFocus()
FlashActiveControl txtSearch1Text, False
End Sub

