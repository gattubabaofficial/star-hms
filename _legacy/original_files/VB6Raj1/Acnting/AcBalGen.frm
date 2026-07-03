VERSION 5.00
Begin VB.Form frmAcBalRepost 
   Appearance      =   0  'Flat
   BackColor       =   &H80000005&
   ClientHeight    =   9315
   ClientLeft      =   60
   ClientTop       =   60
   ClientWidth     =   13650
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
   ScaleHeight     =   9315
   ScaleWidth      =   13650
   WindowState     =   2  'Maximized
   Begin VB.TextBox txtVoid 
      CausesValidation=   0   'False
      Height          =   375
      Left            =   255
      TabIndex        =   3
      TabStop         =   0   'False
      Text            =   "Void"
      Top             =   8610
      Width           =   735
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
      TabIndex        =   2
      TabStop         =   0   'False
      Top             =   360
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
      TabIndex        =   1
      TabStop         =   0   'False
      Top             =   360
      UseMaskColor    =   -1  'True
      Width           =   255
   End
   Begin VB.Label lblFormHeading 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00E0E0E0&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Account Balance Reposting (Utility)"
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
      TabIndex        =   0
      Top             =   0
      Width           =   9015
   End
End
Attribute VB_Name = "frmAcBalRepost"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Dim dbAcDatabase As New ADODB.Connection, dbGrpDatabase As New ADODB.Connection, dbComDatabase As New ADODB.Connection
Dim mFormLoaded As Boolean, LastKeyPressed As Integer
Dim clsJRN As clsJournal, mActiveControl As Object

Private Sub cmdFormEnter_Click()
LastKeyPressed = 13

End Sub

Private Sub cmdFormEscape_Click()
LastKeyPressed = 27

End Sub

Private Sub Form_Activate()
If mFormLoaded = False Then
    AcBalReposting
Else
    
End If

mFormLoaded = True
End Sub

Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)
LastKeyPressed = KeyCode

End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)
LastKeyPressed = KeyAscii

End Sub

Private Sub Form_Load()
mFormLoaded = False
Call SetVoidControl(txtVoid)

OpenAcDataSource dbAcDatabase
OpenGrpDataSource dbGrpDatabase
OpenComDataSource dbComDatabase

Set clsJRN = New clsJournal
Set clsJRN.dbAcDatabase = dbAcDatabase
Set clsJRN.dbGrpDatabase = dbGrpDatabase

End Sub

Private Sub Form_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
LastKeyPressed = 0
End Sub

Private Sub Form_Resize()
lblFormHeading.Width = Me.Width

End Sub

Private Sub Form_Unload(Cancel As Integer)
Set clsJRN = Nothing

CloseDataSource dbAcDatabase
CloseDataSource dbGrpDatabase
CloseDataSource dbComDatabase

End Sub

Private Sub AcBalReposting()








End Sub
