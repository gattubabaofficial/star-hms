VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "clsComboBox1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
' standard vb6 combo box
Option Explicit

Public rs As ADODB.Recordset, mBoundFieldName As String, mListFieldName As String, Combo1 As ComboBox

Public Sub Rebind()
Combo1.Clear
With rs
.Requery
If .RecordCount > 0 Then
    .MoveFirst
End If
Do While .EOF = False
    Combo1.AddItem .Fields(mListFieldName)
    Combo1.ItemData(Combo1.NewIndex) = .Fields(mBoundFieldName)
    
    .MoveNext
Loop
End With
End Sub


