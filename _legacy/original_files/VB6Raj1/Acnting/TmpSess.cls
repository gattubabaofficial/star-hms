VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "clsTmpSession"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit

Dim m_dbComDatabase As ADODB.Connection, TSRecset As New ADODB.Recordset
Public mTssCode_lng As Long, mTssUserCode_lng As Long

Public Property Get dbComDatabase() As ADODB.Connection
End Property

Public Property Set dbComDatabase(ByRef db As ADODB.Connection)
Set m_dbComDatabase = db
TSRecset.Open "TmpSession", m_dbComDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect
TSRecset.Index = "tssCode"

End Property

Private Sub Class_Initialize()
' Nothing
End Sub

Public Sub GetData(ByVal mTssCode As Long)
Me.Clear
With TSRecset
.Seek Array(mTssCode)
If .EOF = False Then
    mTssCode_lng = .Fields("TssCode")
    mTssUserCode_lng = .Fields("TssUserCode")
End If
End With
End Sub

Public Sub Clear()
mTssCode_lng = 0
mTssUserCode_lng = 0

End Sub

Public Sub Requery()
TSRecset.Requery
End Sub

Private Sub Class_Terminate()
CloseTable TSRecset
End Sub

Public Sub AddNew()
Dim tRecset As New ADODB.Recordset

On Error GoTo errhand
mTssCode_lng = 0

m_dbComDatabase.BeginTrans
With TSRecset
.AddNew
Rem .Fields("TssCode") = mTssCode_lng
.Fields("TssUserCode") = mTssUserCode_lng
.Update
mTssCode_lng = .Fields("TssCode")
End With
m_dbComDatabase.CommitTrans

Exit Sub

errhand:
MsgBox Err.Description
m_dbComDatabase.Cancel
Exit Sub

End Sub

Public Sub Update(ByVal mTssCode As Long)
Dim tRecset As New ADODB.Recordset

On Error GoTo errhand
mTssCode_lng = 0

m_dbComDatabase.BeginTrans
With TSRecset
.Seek Array(mTssCode)

.Fields("TssUserCode") = mTssUserCode_lng
.Update
mTssCode_lng = .Fields("TssCode")
End With
m_dbComDatabase.CommitTrans


Exit Sub

errhand:
MsgBox Err.Description
m_dbComDatabase.Cancel

End Sub

Public Function Delete(ByVal mTssCode As Long) As Boolean
Dim mDeleteit As Boolean

mDeleteit = True
'If ChkEntryExist(mTssCode) = True Then
'    ErrorBox "Entry Exist !!!"
'    mDeleteit = False
'End If
'If mDeleteit = True Then
'    mDeleteit = CanDelete()
'End If
If mDeleteit = True Then
    m_dbComDatabase.BeginTrans
    m_dbComDatabase.Execute "Delete from TmpSession where TssCode=" & CStr(mTssCode) & ""
    m_dbComDatabase.CommitTrans
End If
Delete = mDeleteit

End Function

'Public Function ChkEntryExist(ByVal mTssCode As Long) As Boolean
'Dim tRecset As New ADODB.Recordset
'With tRecset
'.Open "Select * from Journal where JrnAhCode=" & CStr(mTssCode) & "", m_dbComDatabase, adOpenKeyset, adLockReadOnly
'ChkEntryExist = (.RecordCount > 0)
'End With
'CloseTable tRecset
'
'End Function


