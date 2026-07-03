VERSION 5.00
Object = "{67397AA1-7FB1-11D0-B148-00A0C922E820}#6.0#0"; "MSADODC.OCX"
Object = "{CDE57A40-8B86-11D0-B3C6-00A0C90AEA82}#1.0#0"; "MSDATGRD.OCX"
Begin VB.Form frmItemMast 
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
   MDIChild        =   -1  'True
   ScaleHeight     =   8220
   ScaleWidth      =   13890
   WindowState     =   2  'Maximized
   Begin VB.Frame frFormSmry 
      Caption         =   "Summary"
      Height          =   5175
      Left            =   240
      TabIndex        =   8
      Top             =   840
      Width           =   13215
      Begin VB.Frame frConfigure 
         Height          =   4095
         Left            =   3720
         TabIndex        =   30
         Top             =   600
         Width           =   6015
         Begin VB.CommandButton cmdConfigure 
            Appearance      =   0  'Flat
            BackColor       =   &H00FFFF80&
            Caption         =   "&OK"
            BeginProperty Font 
               Name            =   "Verdana"
               Size            =   9
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   375
            Left            =   2400
            TabIndex        =   20
            Top             =   3240
            Width           =   855
         End
         Begin VB.CheckBox chkCurBal 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            Caption         =   "Current Balance"
            ForeColor       =   &H80000008&
            Height          =   285
            Left            =   1200
            TabIndex        =   19
            Top             =   2520
            Value           =   1  'Checked
            Width           =   2175
         End
         Begin VB.CheckBox chkOpBal 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            Caption         =   "Opening Balance"
            ForeColor       =   &H80000008&
            Height          =   285
            Left            =   1200
            TabIndex        =   18
            Top             =   2040
            Value           =   1  'Checked
            Width           =   2175
         End
         Begin VB.CheckBox chkCombinedOpBal 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            Caption         =   "Combined Opening Balance"
            ForeColor       =   &H80000008&
            Height          =   285
            Left            =   1200
            TabIndex        =   16
            Top             =   1080
            Value           =   1  'Checked
            Width           =   2895
         End
         Begin VB.CheckBox chkCombinedCurBal 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            Caption         =   "Combined Current Balance"
            ForeColor       =   &H80000008&
            Height          =   285
            Left            =   1200
            TabIndex        =   17
            Top             =   1560
            Value           =   1  'Checked
            Width           =   2895
         End
         Begin VB.Label Label2 
            Alignment       =   2  'Center
            Appearance      =   0  'Flat
            BackColor       =   &H00E0E0E0&
            BorderStyle     =   1  'Fixed Single
            Caption         =   "Configure"
            BeginProperty Font 
               Name            =   "Verdana"
               Size            =   9
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H80000008&
            Height          =   375
            Index           =   7
            Left            =   0
            TabIndex        =   31
            Top             =   0
            Width           =   6015
         End
      End
      Begin MSDataGridLib.DataGrid dgList 
         Bindings        =   "ProdMast_copy.frx":0000
         Height          =   4335
         Left            =   120
         TabIndex        =   15
         Top             =   480
         Width           =   12615
         _ExtentX        =   22251
         _ExtentY        =   7646
         _Version        =   393216
         AllowUpdate     =   0   'False
         Appearance      =   0
         HeadLines       =   1
         RowHeight       =   15
         FormatLocked    =   -1  'True
         BeginProperty HeadFont {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ColumnCount     =   1
         BeginProperty Column00 
            DataField       =   "ItmCode"
            Caption         =   "ItmCode"
            BeginProperty DataFormat {6D835690-900B-11D0-9484-00A0C91110ED} 
               Type            =   0
               Format          =   ""
               HaveTrueFalseNull=   0
               FirstDayOfWeek  =   0
               FirstWeekOfYear =   0
               LCID            =   1033
               SubFormatType   =   0
            EndProperty
         EndProperty
         SplitCount      =   1
         BeginProperty Split0 
            MarqueeStyle    =   3
            RecordSelectors =   0   'False
            BeginProperty Column00 
               ColumnWidth     =   2894.74
            EndProperty
         EndProperty
      End
   End
   Begin VB.TextBox txtVoid 
      CausesValidation=   0   'False
      Height          =   375
      Left            =   2280
      TabIndex        =   6
      TabStop         =   0   'False
      Text            =   "Text1"
      Top             =   7440
      Width           =   735
   End
   Begin MSAdodcLib.Adodc datList 
      Height          =   330
      Left            =   360
      Top             =   7440
      Visible         =   0   'False
      Width           =   1815
      _ExtentX        =   3201
      _ExtentY        =   582
      ConnectMode     =   0
      CursorLocation  =   3
      IsolationLevel  =   -1
      ConnectionTimeout=   15
      CommandTimeout  =   30
      CursorType      =   3
      LockType        =   3
      CommandType     =   8
      CursorOptions   =   0
      CacheSize       =   50
      MaxRecords      =   0
      BOFAction       =   0
      EOFAction       =   0
      ConnectStringType=   1
      Appearance      =   1
      BackColor       =   -2147483643
      ForeColor       =   -2147483640
      Orientation     =   0
      Enabled         =   -1
      Connect         =   ""
      OLEDBString     =   ""
      OLEDBFile       =   ""
      DataSourceName  =   ""
      OtherAttributes =   ""
      UserName        =   ""
      Password        =   ""
      RecordSource    =   ""
      Caption         =   "adoSmry"
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Verdana"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      _Version        =   393216
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
      TabIndex        =   14
      TabStop         =   0   'False
      Top             =   360
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
      TabIndex        =   13
      TabStop         =   0   'False
      Top             =   360
      Width           =   255
   End
   Begin VB.ComboBox cmbFormEntryMode 
      Appearance      =   0  'Flat
      Enabled         =   0   'False
      Height          =   315
      ItemData        =   "ProdMast_copy.frx":0016
      Left            =   0
      List            =   "ProdMast_copy.frx":0023
      Style           =   1  'Simple Combo
      TabIndex        =   10
      TabStop         =   0   'False
      Text            =   "cmbFormMode"
      Top             =   360
      Width           =   1455
   End
   Begin VB.Frame frFormDtl 
      Caption         =   "Detail"
      Height          =   5175
      Left            =   240
      TabIndex        =   9
      Top             =   1080
      Width           =   9495
      Begin VB.TextBox mskItmOpValue 
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
         Left            =   7320
         TabIndex        =   4
         Tag             =   "AhCode"
         Text            =   "0.00"
         Top             =   1680
         Width           =   1695
      End
      Begin VB.TextBox mskItmOpRate 
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
         Left            =   4680
         TabIndex        =   3
         Tag             =   "AhCode"
         Text            =   "0.00"
         Top             =   1680
         Width           =   1695
      End
      Begin VB.TextBox mskItmOpQty 
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
         Left            =   2400
         TabIndex        =   2
         Tag             =   "AhCode"
         Text            =   "0.00"
         Top             =   1680
         Width           =   1695
      End
      Begin VB.CommandButton cmdSaveForm 
         Appearance      =   0  'Flat
         BackColor       =   &H80000009&
         Caption         =   "      &Save"
         Height          =   255
         Left            =   7920
         Style           =   1  'Graphical
         TabIndex        =   5
         Top             =   4680
         Width           =   375
      End
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
         Caption         =   "Amount:"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   -1  'True
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   255
         Index           =   6
         Left            =   6480
         TabIndex        =   29
         Top             =   2160
         Width           =   735
      End
      Begin VB.Label Label2 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Rate:"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   -1  'True
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   255
         Index           =   5
         Left            =   4200
         TabIndex        =   28
         Top             =   2160
         Width           =   495
      End
      Begin VB.Label lblItmCurValue 
         Alignment       =   1  'Right Justify
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "0.00"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   -1  'True
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   285
         Left            =   7320
         TabIndex        =   27
         Top             =   2160
         Width           =   1695
      End
      Begin VB.Label lblItmCurRate 
         Alignment       =   1  'Right Justify
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "0.00"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   -1  'True
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   285
         Left            =   4800
         TabIndex        =   26
         Top             =   2160
         Width           =   1575
      End
      Begin VB.Label Label2 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Amount:"
         ForeColor       =   &H80000008&
         Height          =   255
         Index           =   4
         Left            =   6480
         TabIndex        =   25
         Top             =   1680
         Width           =   735
      End
      Begin VB.Label Label2 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Rate:"
         ForeColor       =   &H80000008&
         Height          =   255
         Index           =   3
         Left            =   4200
         TabIndex        =   24
         Top             =   1680
         Width           =   495
      End
      Begin VB.Label lblItmCurQty 
         Alignment       =   1  'Right Justify
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "0.00"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   -1  'True
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   285
         Left            =   2400
         TabIndex        =   23
         Top             =   2160
         Width           =   1695
      End
      Begin VB.Label Label2 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Current Qty:"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   -1  'True
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   255
         Index           =   2
         Left            =   840
         TabIndex        =   22
         Top             =   2160
         Width           =   1455
      End
      Begin VB.Label Label2 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Opening Qty:"
         ForeColor       =   &H80000008&
         Height          =   255
         Index           =   1
         Left            =   840
         TabIndex        =   21
         Top             =   1680
         Width           =   1455
      End
      Begin VB.Label Label2 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Item Name:"
         ForeColor       =   &H80000008&
         Height          =   255
         Index           =   0
         Left            =   840
         TabIndex        =   12
         Top             =   1080
         Width           =   1335
      End
      Begin VB.Label Label1 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Code:"
         ForeColor       =   &H80000008&
         Height          =   255
         Left            =   840
         TabIndex        =   11
         Top             =   480
         Width           =   855
      End
   End
   Begin VB.Label lblFormHeading 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00E0E0E0&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Product Master"
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
      TabIndex        =   7
      Top             =   0
      Width           =   9015
   End
End
Attribute VB_Name = "frmItemMast"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Dim FormLoaded As Boolean, LastKeyPressed As Integer
Dim mItmCode As Long, mRemoteAccess As Boolean
Dim dbStDatabase As New ADODB.Connection, dbGrpDatabase As New ADODB.Connection
Dim mItmName_olde As String
Dim clsIT As clsProduct, mActiveControl As Object, clsListStru As clsSelectQueryStructure

Private Type SmryPara
mCombinedOpBal As Integer
mCombinedCurBal As Integer
mOpBal As Integer
mCurBal As Integer
End Type

Dim OldSmryPara As SmryPara

Private Sub RestoreOldSmryPara()
chkCombinedOpBal.Value = OldSmryPara.mCombinedOpBal
chkCombinedCurBal.Value = OldSmryPara.mCombinedCurBal
chkOpBal.Value = OldSmryPara.mOpBal
chkCurBal.Value = OldSmryPara.mCurBal

End Sub

Private Sub RestoreDefaultSmryPara()
chkCombinedOpBal.Value = 1
chkCombinedCurBal.Value = 1
chkOpBal.Value = 1
chkCurBal.Value = 1

End Sub

Private Sub SaveSmryPara()
OldSmryPara.mCombinedOpBal = chkCombinedOpBal.Value
OldSmryPara.mCombinedCurBal = chkCombinedCurBal.Value
OldSmryPara.mOpBal = chkOpBal.Value
OldSmryPara.mCurBal = chkCurBal.Value
End Sub

Public Property Let RemoteAccessCode(ByVal mAccessCode As Long)
mRemoteAccess = True
mItmCode = mAccessCode
End Property

Public Property Get FormAddEditMode() As Integer
FormAddEditMode = cmbFormEntryMode.ListIndex
End Property

Public Property Let FormAddEditMode(ByVal New_FormEntryMode As Integer)
cmbFormEntryMode.ListIndex = New_FormEntryMode
End Property

Private Sub cmdConfigure_Click()
Call SaveSmryPara

Call SmryList
MoveRecToLast datList.RecordSet
txtVoid.SetFocus
dgList.Enabled = True
frConfigure.Visible = False
dgList.SetFocus
End Sub

Private Sub cmdFormEnter_Click()
LastKeyPressed = 13
If TypeOf Screen.ActiveControl Is MSFlexGrid Then
ElseIf FormAddEditMode = cFORM_SMRYMODE And frConfigure.Visible = False Then
    With datList.RecordSet
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
Dim srow As Long
LastKeyPressed = 27
If frConfigure.Visible = True Then
    txtVoid.SetFocus
    dgList.Enabled = True
    frConfigure.Visible = False
    dgList.SetFocus
    Call RestoreOldSmryPara
ElseIf FormAddEditMode = cFORM_SMRYMODE Then
    Unload Me
Else
    Call GetActiveControl
    frFormDtl.Enabled = False
    If CanReject() = True Then
        Call Data_CancelEvent
    
        srow = dgList.Row
        datList.RecordSet.Requery
        datList.Refresh
        dgList.Refresh
        If datList.RecordSet.RecordCount > 0 Then
            If datList.RecordSet.RecordCount > srow And srow > -1 Then
                dgList.Row = srow
            Else
                MoveRecToLast datList.RecordSet
            End If
        End If
        Call ShowEntryMode(False)
        If mRemoteAccess = True Then
            Me.Hide
            ''Unload Me
            Exit Sub
        Else
            dgList.SetFocus
        End If
    Else
        frFormDtl.Enabled = True
        Call SetActiveControl
    End If
End If

End Sub

Private Sub cmdSaveForm_Click()
Call Data_SaveEvent

datList.RecordSet.Requery
datList.Refresh
datList.RecordSet.Find "ItmName='" & txtItmName.Text & "'"

Call ShowEntryMode(False)
dgList.SetFocus

End Sub

Private Sub cmdSaveForm_GotFocus()
frFormDtl.Enabled = False
cmdSaveForm.Enabled = False
If Data_Verify() = True Then
    If CanAccept() = True Then
        Call cmdSaveForm_Click
        If mRemoteAccess = True Then
            Me.Hide
            Exit Sub
        End If
    End If
End If
frFormDtl.Enabled = True
cmdSaveForm.Enabled = True

End Sub

Private Sub dgList_Click()
Call dgList_RowColChange(dgList.Row, dgList.Col)
'dgList.Refresh
End Sub

Private Sub dgList_DblClick()
Call cmdFormEnter_Click
End Sub

Private Sub dgList_Error(ByVal DataError As Integer, Response As Integer)
If DataError = 6148 Then    ' invalid row number
    If datList.RecordSet.RecordCount = 0 Then
        Call Data_AddEvent
        Response = 0
    End If
End If
End Sub

Private Sub dgList_GotFocus()
Call dgList_RowColChange(dgList.Row, dgList.Col)
End Sub

Private Sub dgList_KeyDown(KeyCode As Integer, Shift As Integer)
If KeyCode = vbKeyF12 Then
    frConfigure.Visible = True
    dgList.Enabled = False
    chkCombinedOpBal.SetFocus
End If

End Sub

Private Sub dgList_KeyPress(KeyAscii As Integer)
Select Case KeyAscii
Case 43:    ' plus (+)
    Call Data_AddEvent
Case 45:    ' minus (-)
    Call Data_DeleteEvent
End Select

End Sub

Private Sub dgList_RowColChange(LastRow As Variant, ByVal LastCol As Integer)
With datList.RecordSet
If .RecordCount > 0 Then
    If dgList.Row > .RecordCount - 1 Then
        dgList.Row = .RecordCount - 1
    End If
End If
End With
dgList.LeftCol = 0

End Sub

Private Sub Form_Activate()
If FormLoaded = False Then
    If mRemoteAccess = True Then
        If mItmCode = 0 Then
            Call Data_AddEvent
        Else
            Call Data_EditEvent
        End If
    Else
        MoveRecToLast datList.RecordSet
        dgList.SetFocus
    End If
Else

End If

FormLoaded = True
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
FormLoaded = False
Call SetVoidControl(txtVoid)
mskItmOpValue.Enabled = False
dgList.Columns(0).Width = 0
frConfigure.Visible = False

Call RestoreDefaultSmryPara
Call SaveSmryPara

OpenStDataSource dbStDatabase
OpenGrpDataSource dbGrpDatabase

Set clsIT = New clsProduct
Set clsIT.dbStDatabase = dbStDatabase
Set clsIT.dbGrpDatabase = dbGrpDatabase
Set clsListStru = New clsSelectQueryStructure

datList.ConnectionString = dbStDatabase
Call SmryList
MoveRecToLast datList.RecordSet

Call ShowEntryMode(False)

End Sub

Private Sub Form_Resize()
lblFormHeading.Width = Me.Width
End Sub

Private Sub Form_Unload(Cancel As Integer)
Set clsIT = Nothing
Set clsListStru = Nothing

Set dgList.DataSource = Nothing
CloseTable datList.RecordSet
CloseDataSource dbStDatabase
CloseDataSource dbGrpDatabase
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
    MsgBox "Invalid Key Value !!!"
    txtItmName.SetFocus
    Exit Function
End If
If Trim(txtItmName.Text) = "" Then
    MsgBox "Invalid Item Name !!!"
    txtItmName.SetFocus
    Exit Function
End If

Data_Verify = True
End Function

Private Sub mskItmOpQty_GotFocus()
FlashActiveControl mskItmOpQty, True
End Sub

Private Sub mskItmOpQty_LostFocus()
FlashActiveControl mskItmOpQty, False
End Sub

Private Sub mskItmOpQty_Validate(Cancel As Boolean)
mskItmOpQty.Text = ToMyNumFmt(mskItmOpQty.Text)
Call Calc_Value
End Sub

Private Sub mskItmOpRate_GotFocus()
FlashActiveControl mskItmOpRate, True
End Sub

Private Sub mskItmOpRate_LostFocus()
FlashActiveControl mskItmOpRate, False
End Sub

Private Sub mskItmOpRate_Validate(Cancel As Boolean)
mskItmOpRate.Text = ToMyNumFmt(mskItmOpRate.Text, , True)
Call Calc_Value
End Sub

Private Sub mskItmOpValue_GotFocus()
FlashActiveControl mskItmOpValue, True
End Sub

Private Sub mskItmOpValue_LostFocus()
FlashActiveControl mskItmOpValue, False
End Sub

Private Sub mskItmOpValue_Validate(Cancel As Boolean)
mskItmOpValue.Text = ToMyNumFmt(mskItmOpValue.Text)
End Sub

Private Sub txtItmName_GotFocus()
mItmName_olde = txtItmName.Text
FlashActiveControl txtItmName, True
End Sub

Private Sub txtItmName_LostFocus()
FlashActiveControl txtItmName, False
End Sub

Private Sub txtItmName_Validate(Cancel As Boolean)
If Trim(txtItmName.Text) = "" Then
    MsgBox "Invalid Input !!!"
    Cancel = True
    txtItmName.SetFocus
Else
    If txtItmName.Text <> mItmName_olde Then
        If ChkDuplicate(dbStDatabase, "ProdMast", "ItmName", txtItmName.Text, "ItmCode", Val(mskFormBoundField.Text)) = True Then
            MsgBox "Duplicate Input !!!"
            Cancel = True
            txtItmName.SetFocus
        End If
    End If
End If

End Sub

Private Sub Data_AddEvent()

If clsIT.BeginItem(0) = False Then
    Exit Sub
End If
FormAddEditMode = cFORM_ADDMODE

clsIT.Clear
mItmCode = clsIT.ActiveItmCode
mskFormBoundField.Text = mItmCode
txtItmName.Text = ""

mskItmOpQty.Text = ToMyNumFmt(0)
mskItmOpRate.Text = ToMyNumFmt(0)
mskItmOpValue.Text = ToMyNumFmt(0)
lblItmCurQty.Caption = ToMyNumFmt(0)
lblItmCurRate.Caption = ToMyNumFmt(0)
lblItmCurValue.Caption = ToMyNumFmt(0)

Call ShowEntryMode(True)
txtItmName.SetFocus

End Sub

Private Sub Data_EditEvent()
Dim mLCount As Integer, mUCount As Integer, mCount As Integer, mOpnQty As Double, mOpnAvgRate As Double, mOpnValue As Double, mCurQty As Double, mCurAvgRate As Double, mCurValue As Double

If clsIT.BeginItem(datList.RecordSet.Fields("ItmCode")) = False Then
    Exit Sub
End If
FormAddEditMode = cFORM_EDITMODE
With datList.RecordSet
mItmCode = .Fields("ItmCode")
clsIT.GetData mItmCode

mskFormBoundField.Text = CStr(mItmCode)
txtItmName.Text = .Fields("ItmName")
End With

mOpnQty = 0: mOpnAvgRate = 0: mOpnValue = 0
With clsIT
Rem opn stock
mLCount = .LOpnStock
mUCount = .UOpnStock
For mCount = mLCount To mUCount
    mOpnQty = mOpnQty + .OpnQty(mCount)
    mOpnValue = mOpnValue + .OpnValue(mCount)
Next mCount

Rem current stock
mLCount = .LCurStock
mUCount = .UCurStock
For mCount = mLCount To mUCount
    mCurQty = mCurQty + .CurQty(mCount)
    mCurValue = mCurValue + .CurValue(mCount)
Next mCount

End With

If mOpnQty <> 0 And mOpnValue <> 0 Then
    mOpnAvgRate = mOpnValue / mOpnQty
End If
If mCurQty <> 0 And mCurValue <> 0 Then
    mCurAvgRate = mCurValue / mCurQty
End If

mskItmOpQty.Text = ToMyStqFmt(mOpnQty)
mskItmOpRate.Text = ToMyNumFmt(mOpnAvgRate)
mskItmOpValue.Text = ToMyStvFmt(mOpnValue)

lblItmCurQty.Caption = ToMyStqFmt(mCurQty)
lblItmCurRate.Caption = ToMyNumFmt(mCurAvgRate)
lblItmCurValue.Caption = ToMyStvFmt(mCurValue)

Call ShowEntryMode(True)
txtItmName.SetFocus

End Sub

Private Sub Data_SaveEvent()
With clsIT
.Clear
.mItmName_str = txtItmName.Text
If FormAddEditMode = cFORM_ADDMODE Then
    .AddOpnStock mStkQty:=Val(mskItmOpQty.Text), mStkRate:=Val(mskItmOpRate.Text), mStkValue:=Val(mskItmOpValue.Text)
    .AddProdRef mItrRate:=Val(mskItmOpRate.Text)
    
    .AddNew
    mskFormBoundField.Text = .mItmCode_lng
Else
    .GetData mItmCode
    
    .EditOpnStock mStkICode:=.OpnICode(.LOpnStock), mStkQty:=Val(mskItmOpQty.Text), mStkRate:=Val(mskItmOpRate.Text), mStkValue:=Val(mskItmOpValue.Text)
    .EditProdRef mItrRefCode:=.ItrRefCode(.LProdRef), mItrRate:=Val(mskItmOpRate.Text)
    
    .Update mItmCode
End If

If .mItmCode_lng > 0 Then   ' updated successfully
    .UpdateItem .mItmCode_lng
    .EndItem .mItmCode_lng
Else
    Call Data_CancelEvent
    ErrorBox "Entry Cancelled !!!"
End If

End With

End Sub

Private Sub Data_DeleteEvent()
Dim mDeleteit As Boolean, srow As Long
If (datList.RecordSet.EOF Or datList.RecordSet.BOF) = True Then
    Exit Sub
End If

mItmCode = datList.RecordSet.Fields("ItmCode")
srow = dgList.Row

If clsIT.CanDeleteItem(mItmCode) = True Then
    With clsIT
    .BeginItem mItmCode
    .DeleteItem mItmCode
    .UpdateItem mItmCode
    .EndItem mItmCode
    End With

    datList.RecordSet.Requery
    datList.Refresh
    dgList.Refresh
    
    If srow < datList.RecordSet.RecordCount Then
        dgList.Row = srow
    Else
        If datList.RecordSet.RecordCount > 0 Then
            datList.RecordSet.MoveLast
        End If
    End If
Else
    dgList.SetFocus
End If

End Sub

Private Sub Data_CancelEvent()
If FormAddEditMode = cFORM_EDITMODE Then
    clsIT.CancelItem mItmCode
    clsIT.EndItem mItmCode
End If

End Sub

Private Sub Calc_Value()
With clsIT
.mItmOpQty_dbl = UnMyNumFmt(mskItmOpQty.Text)
.mItmOpRate_dbl = UnMyNumFmt(mskItmOpRate.Text)
.Calc_Value
mskItmOpValue.Text = ToMyNumFmt(.mItmOpValue_dbl)
End With

End Sub

Private Sub SmryList()
Dim gcolcount As Integer, acount As Integer, mLow As Integer, mHigh As Integer

clsListStru.Clear

Rem column definitions
clsListStru.AddFields mExpr:="ItmCode", mAttrib:=cFAT_SYSTEM
clsListStru.AddFields mExpr:="ItmName", mTitle:="Product Name", mShowItem:=True, mWidth:=3500

rajendra singh shekhawat

clsListStru.AddFields mExpr:="Itmopqty", mAttrib:=cFAT_HIDDEN
clsListStru.AddFields mExpr:="ProdMast.Itmoprate", mAttrib:=cFAT_HIDDEN
clsListStru.AddFields mExpr:="ProdMast.Itmopvalue", mAttrib:=cFAT_HIDDEN
clsListStru.AddFields mExpr:="ProdMast.Itmcurqty", mAttrib:=cFAT_HIDDEN
clsListStru.AddFields mExpr:="ProdMast.Itmcurrate", mAttrib:=cFAT_HIDDEN
clsListStru.AddFields mExpr:="ProdMast.Itmcurvalue", mAttrib:=cFAT_HIDDEN

clsListStru.AddFields mExpr:="ProdMast.Itmopqty_sqf", mTitle:="Op.Qty", mShowItem:=False, mAlign:=dbgRight, mWidth:=1500
clsListStru.AddFields mExpr:="IIf(ProdMast.Itmopqty > 0, ProdMast.Itmopqty_sqf, '')", mAlias:="RcOpQty_sqf", mTitle:="Op.Qty", mShowItem:=False, mLink:="Itmopqty", mAlign:=dbgRight, mWidth:=1500
clsListStru.AddFields mExpr:="IIf(ProdMast.Itmopqty < 0, ProdMast.Itmopqty_sqf, '')", mAlias:="IsOpQty_sqf", mTitle:="(-)Op.Qty", mShowItem:=False, mLink:="Itmopqty", mAlign:=dbgRight, mWidth:=1500, mInvert:=True
clsListStru.AddFields mExpr:="ProdMast.Itmoprate_gdf", mTitle:="Op.Rate", mShowItem:=False, mAlign:=dbgRight, mWidth:=1500
clsListStru.AddFields mExpr:="ProdMast.Itmopvalue_svf", mTitle:="Op.Value", mShowItem:=False, mAlign:=dbgRight, mWidth:=1750

clsListStru.AddFields mExpr:="ProdMast.Itmcurqty_sqf", mTitle:="Cur.Qty", mShowItem:=False, mAlign:=dbgRight, mWidth:=1500
clsListStru.AddFields mExpr:="IIf(ProdMast.Itmcurqty > 0, ProdMast.Itmcurqty_sqf, '')", mAlias:="RcCurQty_sqf", mTitle:="Cur.Qty", mShowItem:=False, mLink:="Itmcurqty", mAlign:=dbgRight, mWidth:=1500
clsListStru.AddFields mExpr:="IIf(ProdMast.Itmcurqty < 0, ProdMast.Itmcurqty_sqf, '')", mAlias:="IsCurQty_sqf", mTitle:="(-)Cur.Qty", mShowItem:=False, mLink:="Itmcurqty", mAlign:=dbgRight, mWidth:=1500, mInvert:=True
clsListStru.AddFields mExpr:="ProdMast.Itmcurrate_gdf", mTitle:="Cur.Rate", mShowItem:=False, mAlign:=dbgRight, mWidth:=1500
clsListStru.AddFields mExpr:="ProdMast.Itmcurvalue_svf", mTitle:="Cur.Value", mShowItem:=False, mAlign:=dbgRight, mWidth:=1750

clsListStru.AddJoins mType:="Left Join", mTableName:="StockJrn", mMatchExpr:="ItmCode=StkItmCode and StkCode=" & CStr(cOPSTKCODE) & ""

Rem from table
clsListStru.AddFrom "ProdMast", ""

If mRemoteAccess = True Then
    'datList.RecordSource = "Select * from ProdMast order by ItmName"
    clsListStru.AddFilter "", "Itmcode=" & CStr(mItmCode)
Else
    If chkOpBal.Value = 1 Then
        If chkCombinedOpBal.Value = 1 Then
            clsListStru.UpdateField mAlias:="ProdMast.Itmopqty_sqf", mShowItem:=True
        Else
            clsListStru.UpdateField mAlias:="RcOpQty_sqf", mShowItem:=True
            clsListStru.UpdateField mAlias:="IsOpQty_sqf", mShowItem:=True
        End If
        clsListStru.UpdateField mAlias:="ProdMast.Itmoprate_gdf", mShowItem:=True
        clsListStru.UpdateField mAlias:="ProdMast.Itmopvalue_svf", mShowItem:=True
    Else
        clsListStru.AddFilter "", "Itmopqty=0"
    End If
    If chkCurBal.Value = 1 Then
        If chkCombinedCurBal.Value = 1 Then
            clsListStru.UpdateField mAlias:="ProdMast.Itmcurqty_sqf", mShowItem:=True
        Else
            clsListStru.UpdateField mAlias:="RcCurQty_sqf", mShowItem:=True
            clsListStru.UpdateField mAlias:="IsCurQty_sqf", mShowItem:=True
        End If
        clsListStru.UpdateField mAlias:="ProdMast.Itmcurrate_gdf", mShowItem:=True
        clsListStru.UpdateField mAlias:="ProdMast.Itmcurvalue_svf", mShowItem:=True
    Else
        clsListStru.AddFilter IIf(clsListStru.UFilter >= clsListStru.LFilter, "and", ""), "Itmcurqty=0"
    End If
End If
clsListStru.AddOrderby "ProdMast.Itmname"

clsListStru.GenQuery
datList.RecordSource = clsListStru.SqlQueryStr
datList.Refresh
dgList.Refresh

With dgList
For acount = .Columns.Count - 1 To 1 Step -1
    .Columns.Remove acount
Next acount
End With

gcolcount = 0
mLow = clsListStru.LFields
mHigh = clsListStru.UFields
For acount = mLow To mHigh
    With dgList
    If clsListStru.Field_Show(acount) = True Then
        gcolcount = gcolcount + 1
        .Columns.Add gcolcount
        .Columns(gcolcount).Alignment = clsListStru.Field_Align(acount)
        .Columns(gcolcount).Width = clsListStru.Field_Width(acount)
        If .Columns(gcolcount).Alignment = dbgRight Then
            .Columns(gcolcount).Caption = Space((.Columns(gcolcount).Width - Me.TextWidth(clsListStru.Field_Title(acount))) / Me.TextWidth(cSPC) / 1.5) & clsListStru.Field_Title(acount)
        Else
            .Columns(gcolcount).Caption = clsListStru.Field_Title(acount)
        End If
        .Columns(gcolcount).DataField = clsListStru.Field_Alias(acount, True)
        .Columns(gcolcount).NumberFormat = clsListStru.Field_NumFmt(acount)
        .Columns(gcolcount).Locked = True
    End If
    End With
Next acount

dgList.Rebind
datList.Refresh
dgList.Refresh

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

