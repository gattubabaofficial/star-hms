VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   8385
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   9780
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   ScaleHeight     =   8385
   ScaleWidth      =   9780
   Begin VB.TextBox Text19 
      Height          =   375
      Left            =   3960
      TabIndex        =   18
      Text            =   "Text1"
      Top             =   2640
      Width           =   1695
   End
   Begin VB.TextBox Text18 
      Height          =   375
      Left            =   2160
      TabIndex        =   17
      Text            =   "Text1"
      Top             =   2640
      Width           =   1695
   End
   Begin VB.TextBox Text17 
      Height          =   375
      Left            =   360
      TabIndex        =   16
      Text            =   "Text1"
      Top             =   2640
      Width           =   1695
   End
   Begin VB.TextBox Text16 
      Height          =   375
      Left            =   5760
      TabIndex        =   15
      Text            =   "Text1"
      Top             =   2040
      Width           =   1695
   End
   Begin VB.TextBox Text15 
      Height          =   375
      Left            =   3960
      TabIndex        =   14
      Text            =   "Text1"
      Top             =   2040
      Width           =   1695
   End
   Begin VB.TextBox Text14 
      Height          =   375
      Left            =   2160
      TabIndex        =   13
      Text            =   "Text1"
      Top             =   2040
      Width           =   1695
   End
   Begin VB.TextBox Text13 
      Height          =   375
      Left            =   360
      TabIndex        =   12
      Text            =   "Text1"
      Top             =   2040
      Width           =   1695
   End
   Begin VB.TextBox Text12 
      Height          =   375
      Left            =   5760
      TabIndex        =   11
      Text            =   "Text1"
      Top             =   1440
      Width           =   1695
   End
   Begin VB.TextBox Text11 
      Height          =   375
      Left            =   3960
      TabIndex        =   10
      Text            =   "Text1"
      Top             =   1440
      Width           =   1695
   End
   Begin VB.TextBox Text10 
      Height          =   375
      Left            =   2160
      TabIndex        =   9
      Text            =   "Text1"
      Top             =   1440
      Width           =   1695
   End
   Begin VB.TextBox Text9 
      Height          =   375
      Left            =   360
      TabIndex        =   8
      Text            =   "Text1"
      Top             =   1440
      Width           =   1695
   End
   Begin VB.TextBox Text8 
      Height          =   375
      Left            =   5760
      TabIndex        =   7
      Text            =   "Text1"
      Top             =   960
      Width           =   1695
   End
   Begin VB.TextBox Text7 
      Height          =   375
      Left            =   3960
      TabIndex        =   6
      Text            =   "Text1"
      Top             =   960
      Width           =   1695
   End
   Begin VB.TextBox Text6 
      Height          =   375
      Left            =   2160
      TabIndex        =   5
      Text            =   "Text1"
      Top             =   960
      Width           =   1695
   End
   Begin VB.TextBox Text5 
      Height          =   375
      Left            =   360
      TabIndex        =   4
      Text            =   "Text1"
      Top             =   960
      Width           =   1695
   End
   Begin VB.TextBox Text4 
      Height          =   375
      Left            =   5760
      TabIndex        =   3
      Text            =   "Text1"
      Top             =   360
      Width           =   1695
   End
   Begin VB.TextBox Text3 
      Height          =   375
      Left            =   3960
      TabIndex        =   2
      Text            =   "Text1"
      Top             =   360
      Width           =   1695
   End
   Begin VB.TextBox Text2 
      Height          =   375
      Left            =   2160
      TabIndex        =   1
      Text            =   "Text1"
      Top             =   360
      Width           =   1695
   End
   Begin VB.TextBox Text1 
      Height          =   375
      Left            =   360
      TabIndex        =   0
      Text            =   "Text1"
      Top             =   360
      Width           =   1695
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)
If Shift = 0 And KeyCode = 13 Then
    SendKeys "{tab}"
End If
End Sub

