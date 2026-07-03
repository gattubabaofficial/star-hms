VERSION 5.00
Begin VB.Form frmAccept 
   Appearance      =   0  'Flat
   BackColor       =   &H008080FF&
   BorderStyle     =   1  'Fixed Single
   ClientHeight    =   1425
   ClientLeft      =   15
   ClientTop       =   15
   ClientWidth     =   1710
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
   ScaleHeight     =   1425
   ScaleWidth      =   1710
   ShowInTaskbar   =   0   'False
   StartUpPosition =   1  'CenterOwner
   Begin VB.TextBox txtVoid 
      Height          =   285
      Left            =   2400
      TabIndex        =   5
      Text            =   "txtVoid"
      Top             =   480
      Width           =   855
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
      Left            =   2400
      MaskColor       =   &H000000FF&
      Style           =   1  'Graphical
      TabIndex        =   4
      TabStop         =   0   'False
      Top             =   120
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
      Left            =   2760
      MaskColor       =   &H000000FF&
      TabIndex        =   3
      TabStop         =   0   'False
      Top             =   120
      UseMaskColor    =   -1  'True
      Width           =   255
   End
   Begin VB.Label lblBtn_No 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      BackStyle       =   0  'Transparent
      BorderStyle     =   1  'Fixed Single
      Caption         =   "&No"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   375
      Left            =   840
      TabIndex        =   2
      Top             =   840
      Width           =   735
   End
   Begin VB.Label lblBtn_Yes 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      BackStyle       =   0  'Transparent
      BorderStyle     =   1  'Fixed Single
      Caption         =   "&Yes"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   375
      Left            =   120
      TabIndex        =   1
      Top             =   840
      Width           =   735
   End
   Begin VB.Label lblFlag 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      BackStyle       =   0  'Transparent
      Caption         =   "Accept ?"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   14.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   495
      Left            =   0
      TabIndex        =   0
      Top             =   120
      Width           =   1695
   End
End
Attribute VB_Name = "frmAccept"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Public mDefaultbyEscape As Boolean
Public mBtnYes As Boolean, mBtnNo As Boolean

Private Sub cmdFormEnter_Click()
Call Btn_Yes_Selected
End Sub

Private Sub cmdFormEscape_Click()
If mDefaultbyEscape = True Then
    Call Btn_Yes_Selected
Else
    Call Btn_No_Selected
End If

End Sub

Private Sub Form_Activate()
txtVoid.SetFocus
End Sub

Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)
Select Case KeyCode
Case vbKeyY, vbKeyReturn
    Call Btn_Yes_Selected
Case vbKeyN
    Call Btn_No_Selected
End Select

End Sub

Private Sub Form_Load()
SetVoidControl txtVoid
mBtnYes = False
mBtnNo = False

End Sub

Private Sub Btn_Yes_Selected()
mBtnYes = True
Unload Me

End Sub

Private Sub Btn_No_Selected()
mBtnNo = True
Unload Me

End Sub

Private Sub lblBtn_No_Click()
Call Btn_No_Selected
End Sub

Private Sub lblBtn_Yes_Click()
Call Btn_Yes_Selected
End Sub

