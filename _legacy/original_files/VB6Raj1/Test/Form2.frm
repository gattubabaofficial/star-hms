VERSION 5.00
Begin VB.Form Form2 
   Caption         =   "Form2"
   ClientHeight    =   3195
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   7800
   LinkTopic       =   "Form2"
   ScaleHeight     =   3195
   ScaleWidth      =   7800
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton Command1 
      Caption         =   "Command1"
      Height          =   1095
      Left            =   1200
      TabIndex        =   0
      Top             =   720
      Width           =   4095
   End
End
Attribute VB_Name = "Form2"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub Command1_Click()
   Dim intX As Integer   ' Declare counter variable.
   ' Declare and populate an integer array.
   Dim countersA(5) As Integer
      For intX = 0 To 4
         countersA(intX) = 5
      Next intX
   ' Declare and populate a string array.
      Dim countersB(5) As String
         For intX = 0 To 4
            countersB(intX) = "hello"
         Next intX
   Dim arrX(2) As Variant   ' Declare a new two-member
                           ' array.
      arrX(1) = countersA()   ' Populate the array with
                              ' other arrays.
      arrX(2) = countersB()
      MsgBox arrX(1)(2)   ' Display a member of each
                        ' array.
      MsgBox arrX(2)(3)




End Sub

