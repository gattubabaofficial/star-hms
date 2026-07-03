VERSION 5.00
Begin VB.Form frmCRViewer 
   Caption         =   "Form1"
   ClientHeight    =   4635
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   6375
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   ScaleHeight     =   4635
   ScaleWidth      =   6375
   WindowState     =   2  'Maximized
End
Attribute VB_Name = "frmCRViewer"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Dim mFormLoaded As Boolean

Private Sub Form_Activate()
If mFormLoaded = False Then
    Me.WindowState = vbMaximized
End If
mFormLoaded = True

End Sub

Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)
If KeyCode = 27 Then
    Unload Me
ElseIf Shift = vbCtrlMask And KeyCode = vbKeyP Then
    frmMain.Cryst.Destination = crptToPrinter
    frmMain.Cryst.Action = 1
End If

End Sub

Private Sub Form_Load()
mFormLoaded = False

End Sub

