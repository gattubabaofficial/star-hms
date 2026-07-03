Attribute VB_Name = "AppLib"
Rem Application specific module
Option Explicit

Public Sub Main()
sAppPath = App.Path
sDefaultDate = Date

ChDir sAppPath

Load Form1
Form1.Show


End Sub

