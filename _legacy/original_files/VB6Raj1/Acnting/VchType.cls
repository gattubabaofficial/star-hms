VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "clsVoucherType"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit

Private VType As VoucherType

Private Sub Class_Initialize()
Call Clear
End Sub

Public Sub Clear()
With VType
.Type_App = ""
.Type_No = Array()
.Type_Name = Array()
End With

End Sub

Public Property Get AppName() As String
AppName = VType.Type_App
End Property

Public Property Let AppName(ByVal mAppName As String)
VType.Type_App = mAppName
End Property

Public Property Get LFields() As Integer
LFields = LBound(VType.Type_No)
End Property

Public Property Get UFields() As Integer
UFields = UBound(VType.Type_No)
End Property

Public Property Get Type_No(ByVal mDim1 As Integer) As Variant
Type_No = VType.Type_No(mDim1)
End Property

Public Property Get Type_Name(ByVal mDim1 As Integer) As Variant
Type_Name = VType.Type_Name(mDim1)
End Property

Public Sub AddType(ByVal mTypeNo As Integer, ByVal mTypeName As String)
Dim acount As Integer, apos As Integer

With VType
apos = AScan(.Type_No, mTypeNo)
If apos >= LBound(.Type_No) Then
    ErrorBox "System Voucher Type " & CStr(mTypeName) & " (" & CStr(mTypeNo) & ") Already Associated with " & .Type_Name(apos)
    Exit Sub
End If

acount = UBound(.Type_No) + 1

ReDim Preserve .Type_No(acount)
ReDim Preserve .Type_Name(acount)

.Type_No(acount) = mTypeNo
.Type_Name(acount) = mTypeName
End With

End Sub

Public Function GetItemIndexByName(ByVal mTypeName As String) As Integer
Dim acount As Integer
With VType
acount = AScan(.Type_Name, mTypeName)
GetItemIndexByName = acount
End With

End Function

Public Function GetItemIndexByNo(ByVal mTypeNo As Integer) As Integer
Dim acount As Integer
With VType
acount = AScan(.Type_No, mTypeNo)
GetItemIndexByNo = acount
End With

End Function

Public Function GetItemNameByNo(ByVal mTypeNo As Integer) As String
Dim acount As Integer
With VType
acount = AScan(.Type_No, mTypeNo)
GetItemNameByNo = .Type_Name(acount)
End With

End Function

