VERSION 5.00
Begin VB.Form frmMyColors 
   Appearance      =   0  'Flat
   BackColor       =   &H00FFF5EB&
   ClientHeight    =   7245
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   10590
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   ScaleHeight     =   7245
   ScaleWidth      =   10590
   WindowState     =   2  'Maximized
   Begin VB.TextBox txtHexState 
      Appearance      =   0  'Flat
      BeginProperty Font 
         Name            =   "Courier New"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   480
      TabIndex        =   4
      Text            =   "Text1"
      Top             =   6000
      Width           =   9135
   End
   Begin VB.HScrollBar hsbBlue 
      Height          =   375
      Left            =   480
      Max             =   255
      Min             =   1
      TabIndex        =   3
      TabStop         =   0   'False
      Top             =   5280
      Value           =   1
      Width           =   9135
   End
   Begin VB.HScrollBar hsbGreen 
      Height          =   375
      Left            =   480
      Max             =   255
      Min             =   1
      TabIndex        =   2
      TabStop         =   0   'False
      Top             =   4920
      Value           =   1
      Width           =   9135
   End
   Begin VB.HScrollBar hsbRed 
      Height          =   375
      Left            =   480
      Max             =   255
      Min             =   1
      TabIndex        =   1
      TabStop         =   0   'False
      Top             =   4560
      Value           =   1
      Width           =   9135
   End
   Begin VB.Label lblNumState 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      BorderStyle     =   1  'Fixed Single
      BeginProperty Font 
         Name            =   "Courier New"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   375
      Left            =   480
      TabIndex        =   5
      Top             =   5640
      Width           =   9135
   End
   Begin VB.Label lblFormHeading 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00E0E0E0&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Explore Colors"
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
      Width           =   10575
   End
End
Attribute VB_Name = "frmMyColors"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Dim mFormLoaded As Boolean
Dim mFormXHeight As Long, mFormXWidth As Long, mFormHeightRatio As Double, mFormWidthRatio As Double
Dim mHsbRedXTop As Long, mHsbRedXWidth As Long, mHsbGreenXTop As Long, mHsbGreenXWidth As Long, mHsbBlueXTop As Long, mHsbBlueXWidth As Long
Dim mNumStateXTop As Long, mNumStateXWidth As Long, mHexStateXTop As Long, mHexStateXWidth As Long

Private Sub Form_Activate()
mFormLoaded = True

End Sub

Private Sub Form_DblClick()
Dim mFormHeight As Long, mFormWidth As Long

If frmMain.WindowState = vbMaximized Then
    mFormHeight = frmMain.Height
    mFormWidth = frmMain.Width
    frmMain.WindowState = vbNormal
    frmMain.Height = mFormHeight / 3
    frmMain.Width = mFormWidth / 3
Else
    frmMain.WindowState = vbMaximized
End If

End Sub

Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)
If KeyCode = 27 Then
    Unload Me
End If
End Sub

Private Sub Form_Load()
mFormLoaded = False

End Sub

Private Sub Form_QueryUnload(Cancel As Integer, UnloadMode As Integer)
End

End Sub

Private Sub Form_Resize()
On Error GoTo ErrHand

lblFormHeading.Width = Me.Width - 150

hsbRed.Top = Me.Height - (hsbRed.Height + hsbGreen.Height + hsbBlue.Height + lblNumState.Height + txtHexState.Height + 750)
hsbRed.Width = Me.Width - (hsbRed.Left * 2)

hsbGreen.Top = hsbRed.Top + hsbRed.Height + 10
hsbGreen.Width = hsbRed.Width

hsbBlue.Top = hsbGreen.Top + hsbGreen.Height + 10
hsbBlue.Width = hsbGreen.Width

lblNumState.Top = hsbBlue.Top + hsbBlue.Height + 10
lblNumState.Width = hsbBlue.Width

txtHexState.Top = lblNumState.Top + lblNumState.Height + 10
txtHexState.Width = lblNumState.Width
Exit Sub
    
ErrHand:
MsgBox Err.Description
Resume Next

End Sub

Private Sub hsbBlue_Change()
Call CheckBackColor
End Sub

Private Sub hsbBlue_Scroll()
Call CheckBackColor
End Sub

Private Sub hsbGreen_Change()
Call CheckBackColor
End Sub

Private Sub hsbGreen_Scroll()
Call CheckBackColor
End Sub

Private Sub hsbRed_Change()
Call CheckBackColor
End Sub

Private Sub CheckBackColor()
Me.BackColor = RGB(hsbRed.Value, hsbGreen.Value, hsbBlue.Value)
lblNumState.Caption = "RED = " & CStr(hsbRed.Value) & ", " & "GREEN = " & CStr(hsbGreen.Value) & ", " & "BLUE = " & CStr(hsbBlue.Value)
txtHexState.Text = Hex(RGB(hsbRed.Value, hsbGreen.Value, hsbBlue.Value))

End Sub

Private Sub hsbRed_Scroll()
Call CheckBackColor
End Sub
