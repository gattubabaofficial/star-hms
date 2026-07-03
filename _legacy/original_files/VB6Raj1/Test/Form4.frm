VERSION 5.00
Begin VB.Form Form4 
   Caption         =   "Form3"
   ClientHeight    =   4980
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   7665
   LinkTopic       =   "Form3"
   ScaleHeight     =   4980
   ScaleWidth      =   7665
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton Command3 
      Caption         =   "Command1"
      Height          =   495
      Left            =   3960
      TabIndex        =   3
      Top             =   480
      Width           =   2175
   End
   Begin VB.TextBox Text1 
      Height          =   2295
      Left            =   1920
      MultiLine       =   -1  'True
      TabIndex        =   2
      Text            =   "Form4.frx":0000
      Top             =   2160
      Width           =   3855
   End
   Begin VB.CommandButton Command2 
      Caption         =   "Command1"
      Height          =   495
      Left            =   3960
      TabIndex        =   1
      Top             =   1200
      Width           =   2175
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Command1"
      Height          =   495
      Left            =   1200
      TabIndex        =   0
      Top             =   1200
      Width           =   2175
   End
End
Attribute VB_Name = "Form4"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub Command1_Click()
Dim fhand As Integer
fhand = FreeFile
Open App.Path & "\Raj.txt" For Output As #1

Write #fhand, "UserName"; "rajendra"
Write #fhand, "UserPwd"; "hello"

Close #fhand

End Sub

Private Sub Command2_Click()
Dim fhand As Integer, mTitle As String, mValue As String, fhand2 As Integer
fhand = FreeFile
Open App.Path & "\Raj.txt" For Input As #1

Input #fhand, mTitle, mValue
Text1.Text = mTitle & "=" & mValue & vbCrLf

Input #fhand, mTitle, mValue
Text1.Text = Text1.Text & mTitle & "=" & mValue

Close #fhand

fhand = FreeFile
Open "E:\VB6Raj\HMSWin\UIdCode.Jar" For Input Lock Read Write As #fhand
fhand2 = FreeFile
Open "E:\VB6Raj\HMSWin\AcsPerm.Jar" For Input Lock Read Write As #fhand2

Close #fhand
Close #fhand2

End Sub

Private Sub Command3_Click()
sub1 "rajendra"
End Sub

Private Sub sub1(Optional ByVal opt1, Optional ByVal opt2)
sub2 opt1, opt2
End Sub

Private Sub sub2(Optional ByVal opt1, Optional ByVal opt2)
Dim mis1 As Boolean, mis2 As Boolean
mis1 = IsMissing(opt1)
mis2 = IsMissing(opt2)

End Sub

