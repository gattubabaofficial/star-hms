VERSION 5.00
Begin VB.Form frmMyMenu 
   Appearance      =   0  'Flat
   BackColor       =   &H80000005&
   ClientHeight    =   9120
   ClientLeft      =   60
   ClientTop       =   60
   ClientWidth     =   13845
   ControlBox      =   0   'False
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   ScaleHeight     =   9120
   ScaleWidth      =   13845
   WindowState     =   2  'Maximized
   Begin VB.Frame frMasterMenu 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   "               Masters                "
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
      Height          =   4335
      Left            =   6840
      TabIndex        =   15
      Tag             =   "0"
      Top             =   840
      Width           =   2895
      Begin VB.CommandButton cmdMasterMenu 
         Caption         =   "G&ranted Holidays"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Index           =   6
         Left            =   360
         Style           =   1  'Graphical
         TabIndex        =   10
         Top             =   3360
         Width           =   2175
      End
      Begin VB.CommandButton cmdMasterMenu 
         Caption         =   "&Holiday Master"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Index           =   5
         Left            =   360
         Style           =   1  'Graphical
         TabIndex        =   9
         Top             =   2880
         Width           =   2175
      End
      Begin VB.CommandButton cmdMasterMenu 
         Caption         =   "Desi&gnation Master"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Index           =   4
         Left            =   360
         Style           =   1  'Graphical
         TabIndex        =   8
         Top             =   2400
         Width           =   2175
      End
      Begin VB.CommandButton cmdMasterMenu 
         Caption         =   "&Department Master"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Index           =   3
         Left            =   360
         Style           =   1  'Graphical
         TabIndex        =   7
         Top             =   1920
         Width           =   2175
      End
      Begin VB.CommandButton cmdMasterMenu 
         Caption         =   "&Employee Master"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Index           =   2
         Left            =   360
         Style           =   1  'Graphical
         TabIndex        =   6
         Top             =   1440
         Width           =   2175
      End
      Begin VB.CommandButton cmdMasterMenu 
         Caption         =   "&Product Master"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Index           =   1
         Left            =   360
         Style           =   1  'Graphical
         TabIndex        =   5
         Top             =   960
         Width           =   2175
      End
      Begin VB.CommandButton cmdMasterMenu 
         Caption         =   "&Account Ledger"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Index           =   0
         Left            =   360
         Style           =   1  'Graphical
         TabIndex        =   4
         Top             =   480
         Width           =   2175
      End
   End
   Begin VB.Frame frMaintenanceMenu 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   "             Maintenance          "
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
      Height          =   4335
      Left            =   6840
      TabIndex        =   21
      Tag             =   "0"
      Top             =   5280
      Width           =   2895
      Begin VB.CommandButton cmdMaintenanceMenu 
         Caption         =   "&Check Data Structure"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Index           =   2
         Left            =   180
         Style           =   1  'Graphical
         TabIndex        =   24
         Top             =   1680
         Width           =   2505
      End
      Begin VB.CommandButton cmdMaintenanceMenu 
         Caption         =   "&Remove Null Value"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Index           =   1
         Left            =   180
         Style           =   1  'Graphical
         TabIndex        =   23
         Top             =   1065
         Width           =   2505
      End
      Begin VB.CommandButton cmdMaintenanceMenu 
         Caption         =   "&A/c Balance Reposting"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Index           =   0
         Left            =   180
         Style           =   1  'Graphical
         TabIndex        =   22
         Top             =   480
         Width           =   2505
      End
   End
   Begin VB.Frame frDisplayMenu 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   "               Display                "
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
      Height          =   4335
      Left            =   3840
      TabIndex        =   18
      Tag             =   "0"
      Top             =   5280
      Width           =   2895
      Begin VB.CommandButton cmdDisplayMenu 
         Caption         =   "&Product View"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Index           =   1
         Left            =   480
         Style           =   1  'Graphical
         TabIndex        =   20
         Top             =   1080
         Width           =   1815
      End
      Begin VB.CommandButton cmdDisplayMenu 
         Caption         =   "&Ledger View"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Index           =   0
         Left            =   480
         Style           =   1  'Graphical
         TabIndex        =   19
         Top             =   480
         Width           =   1815
      End
   End
   Begin VB.Frame frTransactionMenu 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   "            Transactions          "
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
      Height          =   4335
      Left            =   840
      TabIndex        =   16
      Tag             =   "0"
      Top             =   840
      Width           =   2895
      Begin VB.CommandButton cmdTransactionMenu 
         Caption         =   "&Attendance"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Index           =   2
         Left            =   480
         Style           =   1  'Graphical
         TabIndex        =   13
         Top             =   1680
         Width           =   1815
      End
      Begin VB.CommandButton cmdTransactionMenu 
         Caption         =   "&Stock Journal"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Index           =   1
         Left            =   480
         Style           =   1  'Graphical
         TabIndex        =   12
         Top             =   1080
         Width           =   1815
      End
      Begin VB.CommandButton cmdTransactionMenu 
         Caption         =   "&Journal Entry"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Index           =   0
         Left            =   480
         Style           =   1  'Graphical
         TabIndex        =   11
         Top             =   480
         Width           =   1815
      End
   End
   Begin VB.Frame frMainMenu 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   "              Main Menu             "
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
      Height          =   4335
      Left            =   3840
      TabIndex        =   14
      Tag             =   "0"
      Top             =   840
      Width           =   2895
      Begin VB.CommandButton cmdMainMenu 
         Caption         =   "&Maint&enance"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Index           =   3
         Left            =   600
         Style           =   1  'Graphical
         TabIndex        =   3
         Top             =   2325
         Width           =   1575
      End
      Begin VB.CommandButton cmdMainMenu 
         Caption         =   "&Display"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Index           =   2
         Left            =   600
         Style           =   1  'Graphical
         TabIndex        =   2
         Top             =   1680
         Width           =   1575
      End
      Begin VB.CommandButton cmdMainMenu 
         Caption         =   "&Transactions"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Index           =   1
         Left            =   600
         Style           =   1  'Graphical
         TabIndex        =   1
         Top             =   1080
         Width           =   1575
      End
      Begin VB.CommandButton cmdMainMenu 
         Caption         =   "&Masters"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Index           =   0
         Left            =   600
         Style           =   1  'Graphical
         TabIndex        =   0
         Top             =   480
         Width           =   1575
      End
   End
   Begin VB.Label lblFormHeading 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00E0E0E0&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Application Start Menu"
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
      TabIndex        =   17
      Top             =   0
      Width           =   9015
   End
End
Attribute VB_Name = "frmMyMenu"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Dim FormLoaded As Boolean
Dim cmdMasters As Object, cmdTransactions As Object, cmdDisplay As Object, cmdMaintenance As Object
Dim cmdAcntLdgr As Object, cmdProdMast As Object, cmdEmpMast As Object, cmdDeptMast As Object, cmdDesgMast As Object, cmdHoliMast As Object, cmdHoliGrant As Object
Dim cmdJournalEntry As Object, cmdStockJrnEntry As Object, cmdAttendanceEntry As Object
Dim cmdLedgerView As Object, cmdItemView As Object
Dim cmdAcBalRepost As Object, cmdRemoveNullValue As Object, cmdCheckDataStru As Object

Private Sub cmdDisplayMenu_Click(Index As Integer)
cmdDisplayMenu(Index).Container.Tag = Index

Select Case Screen.ActiveControl
Case cmdLedgerView:
    Load frmLedgerView
    frmLedgerView.Show 1
Case cmdItemView:
    Load frmItemView
    frmItemView.Show 1

End Select


Me.ZOrder
End Sub

Private Sub cmdDisplayMenu_GotFocus(Index As Integer)
cmdDisplayMenu(Index).BackColor = cYELLOWLIGHT

End Sub

Private Sub cmdDisplayMenu_LostFocus(Index As Integer)
cmdDisplayMenu(Index).BackColor = vbButtonFace

End Sub

Private Sub cmdMainMenu_Click(Index As Integer)
cmdMainMenu(Index).Container.Tag = Index

Select Case Screen.ActiveControl
Case cmdMasters:
    frMasterMenu.Visible = True
Case cmdTransactions:
    frTransactionMenu.Visible = True
Case cmdDisplay:
    frDisplayMenu.Visible = True
Case cmdMaintenance:
    frMaintenanceMenu.Visible = True
End Select
frMainMenu.Visible = False


End Sub

Private Sub cmdMainMenu_GotFocus(Index As Integer)
cmdMainMenu(Index).BackColor = cYELLOWLIGHT
End Sub

Private Sub cmdMainMenu_LostFocus(Index As Integer)
cmdMainMenu(Index).BackColor = vbButtonFace
End Sub

Private Sub cmdMaintenanceMenu_Click(Index As Integer)
cmdMaintenanceMenu(Index).Container.Tag = Index

Select Case Screen.ActiveControl
Case cmdAcBalRepost:
    RepostAllAchdCurBal
Case cmdRemoveNullValue
    RemoveAppNullValue
Case cmdCheckDataStru
    CreateAcDatabase mAddMode:=True
    CreateStDatabase mAddMode:=True
    CreateGrpDatabase mAddMode:=True
    CreateComDatabase mAddMode:=True
    CreatePyrDatabase mAddMode:=True
    CreatePyrComDatabase

End Select

End Sub

Private Sub cmdMaintenanceMenu_GotFocus(Index As Integer)
cmdMaintenanceMenu(Index).BackColor = cYELLOWLIGHT

End Sub

Private Sub cmdMaintenanceMenu_LostFocus(Index As Integer)
cmdMaintenanceMenu(Index).BackColor = vbButtonFace

End Sub

Private Sub cmdMasterMenu_Click(Index As Integer)
cmdMasterMenu(Index).Container.Tag = Index

Select Case Screen.ActiveControl
Case cmdAcntLdgr
    Load frmAcntHead
    frmAcntHead.Show 1
Case cmdProdMast
    Load frmItemMast
    frmItemMast.Show 1
Case cmdEmpMast
    Load frmEmployeeMast
    frmEmployeeMast.Show 1
Case cmdDeptMast
    Load frmDepartmentMast
    frmDepartmentMast.Show 1
Case cmdDesgMast
    Load frmDesignationMast
    frmDesignationMast.Show 1
Case cmdHoliMast
    Load frmHolidayMast
    frmHolidayMast.Show 1
Case cmdHoliGrant
    Load frmHolidayGrant
    frmHolidayGrant.Show 1
    
End Select

Me.ZOrder
End Sub

Private Sub cmdMasterMenu_GotFocus(Index As Integer)
cmdMasterMenu(Index).BackColor = cYELLOWLIGHT

End Sub

Private Sub cmdMasterMenu_LostFocus(Index As Integer)
cmdMasterMenu(Index).BackColor = vbButtonFace

End Sub

Private Sub cmdTransactionMenu_Click(Index As Integer)
cmdTransactionMenu(Index).Container.Tag = Index

Select Case Screen.ActiveControl
Case cmdJournalEntry:
    Load frmJournal
    frmJournal.Show 1
Case cmdStockJrnEntry:
    Load frmStockJrn
    frmStockJrn.Show 1
Case cmdAttendanceEntry
    Load frmEmpAttendance
    frmEmpAttendance.Show 1

End Select

Me.ZOrder
End Sub

Private Sub cmdTransactionMenu_GotFocus(Index As Integer)
cmdTransactionMenu(Index).BackColor = cYELLOWLIGHT

End Sub

Private Sub cmdTransactionMenu_LostFocus(Index As Integer)
cmdTransactionMenu(Index).BackColor = vbButtonFace
End Sub

Private Sub Form_Activate()
If FormLoaded = False Then
    
Else
    Call TraceLastCmdObj
End If
FormLoaded = True
End Sub

Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)

Select Case KeyCode
Case 13:
    
Case 27:
    If frTransactionMenu.Visible = True Then
        frTransactionMenu.Visible = False
        frMainMenu.Visible = True
        
        Call TraceLastCmdObj
    ElseIf frMasterMenu.Visible = True Then
        frMasterMenu.Visible = False
        frMainMenu.Visible = True
        
        Call TraceLastCmdObj
    ElseIf frDisplayMenu.Visible = True Then
        frDisplayMenu.Visible = False
        frMainMenu.Visible = True
        
        Call TraceLastCmdObj
    ElseIf frMaintenanceMenu.Visible = True Then
        frMaintenanceMenu.Visible = False
        frMainMenu.Visible = True
        
        Call TraceLastCmdObj
    ElseIf frMainMenu.Visible = True Then
        If ExitThisApp() = True Then
            Unload Me
            frmMain.ExitThisApp
        End If
    
    End If
    
End Select

End Sub

Private Sub Form_Load()
FormLoaded = False

Rem main menu
Set cmdMasters = cmdMainMenu(0)
Set cmdTransactions = cmdMainMenu(1)
Set cmdDisplay = cmdMainMenu(2)
Set cmdMaintenance = cmdMainMenu(3)

Rem main menu button captions
cmdMasters.Caption = "&Masters"
cmdTransactions.Caption = "&Transactions"
cmdDisplay.Caption = "&Display"
cmdMaintenance.Caption = "Maint&enance"

Set cmdAcntLdgr = cmdMasterMenu(0): cmdAcntLdgr.Caption = "&Account Ledger"
Set cmdProdMast = cmdMasterMenu(1): cmdProdMast.Caption = "&Product Master"
Set cmdEmpMast = cmdMasterMenu(2): cmdEmpMast.Caption = "&Employee Master"
Set cmdDeptMast = cmdMasterMenu(3): cmdDeptMast.Caption = "&Department Master"
Set cmdDesgMast = cmdMasterMenu(4): cmdDesgMast.Caption = "Desi&gnation Master"
Set cmdHoliMast = cmdMasterMenu(5): cmdHoliMast.Caption = "&Holiday Master"
Set cmdHoliGrant = cmdMasterMenu(6): cmdHoliGrant.Caption = "G&ranted Holidays"

Set cmdJournalEntry = cmdTransactionMenu(0): cmdJournalEntry.Caption = "&Journal Entry"
Set cmdStockJrnEntry = cmdTransactionMenu(1): cmdStockJrnEntry.Caption = "&Stock Journal"
Set cmdAttendanceEntry = cmdTransactionMenu(2): cmdAttendanceEntry.Caption = "&Attendance"

Set cmdLedgerView = cmdDisplayMenu(0): cmdLedgerView.Caption = "&Ledger View"
Set cmdItemView = cmdDisplayMenu(1): cmdItemView.Caption = "&Item View"

Set cmdAcBalRepost = cmdMaintenanceMenu(0): cmdAcBalRepost.Caption = "&A/c Balance Reposting"
Set cmdRemoveNullValue = cmdMaintenanceMenu(1): cmdRemoveNullValue.Caption = "&Remove Null Value"
Set cmdCheckDataStru = cmdMaintenanceMenu(2): cmdCheckDataStru.Caption = "&Check Data Structure"

frMainMenu.Visible = True
frMasterMenu.Visible = False
frTransactionMenu.Visible = False
frDisplayMenu.Visible = False
frMaintenanceMenu.Visible = False

End Sub

Private Sub Form_Resize()
lblFormHeading.Width = Me.Width
frMainMenu.Left = (Me.Width - frMainMenu.Width) / 2
frMasterMenu.Left = frMainMenu.Left: frMasterMenu.Top = frMainMenu.Top
frTransactionMenu.Left = frMainMenu.Left: frTransactionMenu.Top = frMainMenu.Top
frDisplayMenu.Left = frMainMenu.Left: frDisplayMenu.Top = frMainMenu.Top
frMaintenanceMenu.Left = frMainMenu.Left: frMaintenanceMenu.Top = frMainMenu.Top

End Sub

Private Sub TraceLastCmdObj()
Dim cnt1 As Integer, cnt2 As Integer, mTotObjCount As Integer, mLastCmdObj As CommandButton, mFrameObj As Frame, mObjFound As Boolean
mTotObjCount = Me.Controls.Count
mObjFound = False
For cnt1 = 0 To mTotObjCount - 1
    If TypeOf Me.Controls(cnt1) Is Frame Then
        If Me.Controls(cnt1).Visible = True Then
            Set mFrameObj = Me.Controls(cnt1)
            For cnt2 = 0 To mTotObjCount - 1
                If TypeOf Me.Controls(cnt2) Is CommandButton Then
                    If Me.Controls(cnt2).Container.Name = mFrameObj.Name And Me.Controls(cnt2).Index = mFrameObj.Tag Then
                        Me.Controls(cnt2).SetFocus
                        mObjFound = True
                        Exit For
                    End If
                End If
            Next
        End If
    End If
    If mObjFound = True Then
        Exit For
    End If
Next

End Sub

