VERSION 5.00
Begin VB.Form frmSetDefaultDate 
   Appearance      =   0  'Flat
   BackColor       =   &H80000005&
   BorderStyle     =   1  'Fixed Single
   ClientHeight    =   2835
   ClientLeft      =   15
   ClientTop       =   15
   ClientWidth     =   5145
   ControlBox      =   0   'False
   BeginProperty Font 
      Name            =   "Verdana"
      Size            =   8.25
      Charset         =   0
      Weight          =   700
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   2835
   ScaleWidth      =   5145
   ShowInTaskbar   =   0   'False
   StartUpPosition =   1  'CenterOwner
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
      Left            =   4800
      MaskColor       =   &H000000FF&
      TabIndex        =   4
      TabStop         =   0   'False
      Top             =   0
      UseMaskColor    =   -1  'True
      Width           =   255
   End
   Begin VB.CommandButton cmdFormEscape 
      Appearance      =   0  'Flat
      Cancel          =   -1  'True
      Caption         =   "X"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   4080
      MaskColor       =   &H000000FF&
      Style           =   1  'Graphical
      TabIndex        =   3
      TabStop         =   0   'False
      Top             =   0
      Width           =   255
   End
   Begin VB.TextBox txtVoid 
      CausesValidation=   0   'False
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   0
      TabIndex        =   2
      TabStop         =   0   'False
      Text            =   "Void"
      Top             =   2400
      Width           =   375
   End
   Begin VB.Frame frDefaultDate 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      ForeColor       =   &H80000008&
      Height          =   1935
      Left            =   120
      TabIndex        =   1
      Top             =   360
      Width           =   4815
      Begin VB.CommandButton cmdOK 
         BackColor       =   &H00FFFFFF&
         Caption         =   "&OK"
         Height          =   375
         Left            =   1920
         Style           =   1  'Graphical
         TabIndex        =   6
         Top             =   1200
         Width           =   855
      End
      Begin VB.TextBox dtpDefaultDate 
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
         Left            =   1560
         MaxLength       =   50
         TabIndex        =   0
         Text            =   "dd/mm/yyyy"
         Top             =   480
         Width           =   1695
      End
   End
   Begin VB.Label lblFormHeading 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00E0E0E0&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Enter Default Date"
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
      Height          =   315
      Left            =   0
      TabIndex        =   5
      Top             =   0
      Width           =   5175
   End
End
Attribute VB_Name = "frmSetDefaultDate"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Dim mFormLoaded As Boolean, mLastKeyPressed As Integer, mMaskKeyPressed As Integer
Dim mDefaultDate_old As Date

Private Sub cmdFormEnter_Click()
mLastKeyPressed = 13
SendKeys "{tab}"

End Sub

Private Sub cmdFormEscape_Click()
mLastKeyPressed = 27

txtVoid.SetFocus
sDefaultDate = mDefaultDate_old
Unload Me

End Sub

Private Sub cmdOK_Click()
Dim f1 As Form, obj As Object

For Each f1 In Forms
    If f1.Name <> Me.Name Then
        If f1.Visible = True Then
            For Each obj In f1.Controls
                If TypeOf obj Is StatusBar Then
                    If obj.Name = "StatusBar1" Then
                        ShowStatusBarText f1.StatusBar1
                    End If
                End If
            Next obj
        End If
    End If
Next f1

Unload Me
Exit Sub

End Sub

Private Sub cmdOK_GotFocus()
FlashActiveControl cmdOK, True
End Sub

Private Sub cmdOK_LostFocus()
FlashActiveControl cmdOK, False
End Sub

Private Sub dtpDefaultDate_GotFocus()
FlashActiveControl dtpDefaultDate, True
End Sub

Private Sub dtpDefaultDate_LostFocus()
FlashActiveControl dtpDefaultDate, False
End Sub

Private Sub dtpDefaultDate_Validate(Cancel As Boolean)

If frDefaultDate.Visible = False Then
    Exit Sub
End If

dtpDefaultDate.Text = ToMyDate(dtpDefaultDate.Text)
If IsFinYrDate(Ctod(dtpDefaultDate.Text)) = False Or Ctod(dtpDefaultDate.Text) > Date Then
    ErrorBox "Invalid Input !!!"
    dtpDefaultDate.SetFocus
    Cancel = True
Else
    sDefaultDate = Ctod(dtpDefaultDate.Text)
End If

End Sub

Private Sub Form_Activate()
Rem dtpDefaultDate.SetFocus

End Sub

Private Sub Form_Load()
Rem SetFormSize Me, frmMain
Call Form_Resize
Call SetVoidControl(txtVoid)
dtpDefaultDate.Text = Dtoc(sDefaultDate)
mDefaultDate_old = sDefaultDate

End Sub

Private Sub Form_QueryUnload(Cancel As Integer, UnloadMode As Integer)
ShowStatusBarText frmMyMenu.StatusBar1

End Sub

Private Sub Form_Resize()
lblFormHeading.Width = Me.Width
cmdFormEscape.Left = Me.Width - (cmdFormEscape.Width * 2)
cmdFormEnter.Left = Me.Width + cmdFormEscape.Width
frDefaultDate.Left = (Me.Width - frDefaultDate.Width) / 2: frDefaultDate.Top = (Me.Height - frDefaultDate.Height) / 2

End Sub

