VERSION 5.00
Begin VB.Form frmMsgBox 
   Appearance      =   0  'Flat
   BackColor       =   &H00C0FFC0&
   BorderStyle     =   1  'Fixed Single
   ClientHeight    =   1320
   ClientLeft      =   15
   ClientTop       =   15
   ClientWidth     =   2025
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
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   1320
   ScaleWidth      =   2025
   ShowInTaskbar   =   0   'False
   StartUpPosition =   1  'CenterOwner
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
      Left            =   2400
      MaskColor       =   &H000000FF&
      Style           =   1  'Graphical
      TabIndex        =   3
      TabStop         =   0   'False
      Top             =   0
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
      Left            =   3120
      MaskColor       =   &H000000FF&
      TabIndex        =   2
      TabStop         =   0   'False
      Top             =   0
      UseMaskColor    =   -1  'True
      Width           =   255
   End
   Begin VB.Label lblBtn_OK 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      BackStyle       =   0  'Transparent
      BorderStyle     =   1  'Fixed Single
      Caption         =   "&OK"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   11.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   375
      Left            =   600
      TabIndex        =   1
      Top             =   720
      Width           =   735
   End
   Begin VB.Label lblFlag 
      Appearance      =   0  'Flat
      AutoSize        =   -1  'True
      BackColor       =   &H80000005&
      BackStyle       =   0  'Transparent
      Caption         =   "Message"
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
      Height          =   240
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   960
   End
End
Attribute VB_Name = "frmMsgBox"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub cmdFormEnter_Click()
Call Btn_Ok_Selected
End Sub

Private Sub cmdFormEscape_Click()
Call Btn_Ok_Selected

End Sub

Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)
If KeyCode = vbKeyO Then
    Call Btn_Ok_Selected
End If

End Sub

Private Sub Form_Load()
Rem any load procedure

End Sub

Private Sub Btn_Ok_Selected()
Unload Me

End Sub

Private Sub lblBtn_Ok_Click()
Call Btn_Ok_Selected

End Sub

Private Sub lblFlag_Change()
If (lblFlag.Width + lblFlag.Left + (lblFlag.Width * 10 / 100)) > (lblBtn_OK.Width * 2) Then
    Me.Width = lblFlag.Width + lblFlag.Left + (lblFlag.Width * 10 / 100)
End If
Me.Height = lblFlag.Height + lblBtn_OK.Height + 750
lblBtn_OK.Top = Me.Height - lblBtn_OK.Height - 150
End Sub

Private Sub Form_Resize()
cmdFormEscape.Left = Me.Width + cmdFormEscape.Width
cmdFormEnter.Left = Me.Width + cmdFormEscape.Width
lblBtn_OK.Left = (Me.Width - lblBtn_OK.Width) / 2

End Sub

