VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "clsProduct"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Rem Important hints
Rem change in qty,item,item ref.,date,party etc. are the causes of balance update not just mere qty
Rem use ItmCode and ItmRefCode simultaneously to have strict imposition/checking, donot use ItmRefCode in isolation
Rem ************************************************************************
Option Explicit

Dim mCrashedEntry As Boolean
Dim m_dbStDatabase As ADODB.Connection, m_dbGrpDatabase As ADODB.Connection
Public mItmCode_lng As Long, mItmName_str As String, mItmDesc_str As String
Dim mClassUIdCode As Long, mClassUIdFileName As String, mClassAcsPermFileName As String
#If cMULTIITEMREF = False Then
    Public mItmOpQty_dbl As Double, mItmOpRate_dbl As Double, mItmOpValue_dbl As Double, mItmCurQty_dbl As Double, mItmCurAvgRate_dbl As Double, mItmCurValue_dbl As Double
    Public mItrRefCode_lng As Long, mItrRef1Name_str As String, mItrRef2Name_str As String, mItrPRate_dbl As Double, mItrMRP_dbl As Double, mItrSRate_dbl As Double
#End If

Dim adtlProdRef As ProdRef, adtlOpnStock As OpnStock, adtlCurStock As CurStock
Dim mActiveItem As Integer, aItemTran() As Variant, mTitleName As String

Private Type ProdRef
ItrRefCode() As Variant
ItrStkCode() As Variant
ItrStkICode() As Variant
ItrRef1Name() As Variant
ItrRef2Name() As Variant
ItrPRate() As Variant
ItrMRP() As Variant
ItrSRate() As Variant
ItrRecState() As Variant
End Type

Private Type OpnStock
StkCode() As Variant
StkICode() As Variant
StkItmRefCode() As Variant
StkQty() As Variant
StkRate() As Variant
StkValue() As Variant
StkRecState() As Variant
End Type

Private Type CurStock
StkItmRefCode() As Variant
StkQty() As Variant
StkRate() As Variant
StkValue() As Variant
End Type

Public Property Get LProdRef() As Integer
LProdRef = LBound(adtlProdRef.ItrRefCode)
End Property

Public Property Get UProdRef() As Integer
UProdRef = UBound(adtlProdRef.ItrRefCode)
End Property

Public Property Get ItrRefCode(ByVal mDim1 As Integer) As Variant
ItrRefCode = adtlProdRef.ItrRefCode(mDim1)
End Property

Public Property Get ItrStkCode(ByVal mDim1 As Integer) As Variant
ItrStkCode = adtlProdRef.ItrStkCode(mDim1)
End Property

Public Property Get ItrStkICode(ByVal mDim1 As Integer) As Variant
ItrStkICode = adtlProdRef.ItrStkICode(mDim1)
End Property

Public Property Get ItrRef1Name(ByVal mDim1 As Integer) As Variant
ItrRef1Name = adtlProdRef.ItrRef1Name(mDim1)
End Property

Public Property Get ItrRef2Name(ByVal mDim1 As Integer) As Variant
ItrRef2Name = adtlProdRef.ItrRef2Name(mDim1)
End Property

Public Property Get ItrPRate(ByVal mDim1 As Integer) As Variant
ItrPRate = adtlProdRef.ItrPRate(mDim1)
End Property

Public Property Get ItrMRP(ByVal mDim1 As Integer) As Variant
ItrMRP = adtlProdRef.ItrMRP(mDim1)
End Property

Public Property Get ItrSRate(ByVal mDim1 As Integer) As Variant
ItrSRate = adtlProdRef.ItrSRate(mDim1)
End Property

Public Property Get ItrRecState(ByVal mDim1 As Integer) As Variant
ItrRecState = adtlProdRef.ItrRecState(mDim1)
End Property

Public Sub AddProdRef(ByVal mItrRef1Name As String, ByVal mItrRef2Name As String, ByVal mItrPRate As Double, ByVal mItrMRP As Double, ByVal mItrSRate As Double, Optional ByVal mItrStkCode As Long = cOPSTKCODE)
Dim acount As Integer, mItrRefCode As Long, mItrStkICode As Long
With adtlProdRef
acount = UBound(.ItrRefCode) + 1

ReDim Preserve .ItrRefCode(acount)
ReDim Preserve .ItrStkCode(acount)
ReDim Preserve .ItrStkICode(acount)
ReDim Preserve .ItrRef1Name(acount)
ReDim Preserve .ItrRef2Name(acount)
ReDim Preserve .ItrPRate(acount)
ReDim Preserve .ItrMRP(acount)
ReDim Preserve .ItrSRate(acount)
ReDim Preserve .ItrRecState(acount)

mItrRefCode = acount 'GetNextSeqno(m_dbStDatabase, "ProdRef", "ItrRefCode") * -(acount + 1)     ' acount must never fall to 0
mItrStkICode = acount

.ItrRefCode(acount) = mItrRefCode
.ItrStkCode(acount) = mItrStkCode
.ItrStkICode(acount) = mItrStkICode
.ItrRef1Name(acount) = mItrRef1Name
.ItrRef2Name(acount) = mItrRef2Name
.ItrPRate(acount) = mItrPRate
.ItrMRP(acount) = mItrMRP
.ItrSRate(acount) = mItrSRate
.ItrRecState(acount) = cREC_ADDED
End With

End Sub

Public Sub EditProdRef(ByVal mItrRefCode As Long, ByVal mItrRef1Name As String, ByVal mItrRef2Name As String, ByVal mItrPRate As Double, ByVal mItrMRP As Double, ByVal mItrSRate As Double)
Dim acount As Integer, mLCount As Integer, mUCount As Integer, mItmRefFound As Boolean

With adtlProdRef
mLCount = LBound(.ItrRefCode)
mUCount = UBound(.ItrRefCode)
mItmRefFound = False
For acount = mLCount To mUCount
    If .ItrRefCode(acount) = mItrRefCode Then
        mItmRefFound = True
        Exit For
    End If
Next acount
If mItmRefFound = False Then
    Err.Raise Number:=vbObjectError + 513, Description:="clsProduct_EditProdRef_107"
Else
    Rem .ItrRefCode(acount) = mItrRefCode not required
    Rem .ItrStkCode(acount) = mItrStkCode
    Rem .ItrStkICode(acount) = mItrStkICode
    .ItrRef1Name(acount) = mItrRef1Name
    .ItrRef2Name(acount) = mItrRef2Name
    .ItrPRate(acount) = mItrPRate
    .ItrMRP(acount) = mItrMRP
    .ItrSRate(acount) = mItrSRate
    .ItrRecState(acount) = ChkEditRecStatus(.ItrRecState(acount))
End If
End With

End Sub

Public Sub DeleteProdRef(ByVal mItrRefCode As Long)
Dim acount As Integer, mLCount As Integer, mUCount As Integer, mItmRefFound As Boolean

With adtlProdRef
mLCount = LBound(.ItrRefCode)
mUCount = UBound(.ItrRefCode)
mItmRefFound = False
For acount = mLCount To mUCount
    If .ItrRefCode(acount) = mItrRefCode Then
        mItmRefFound = True
        Exit For
    End If
Next acount
If mItmRefFound = False Then
    Err.Raise Number:=vbObjectError + 513, Description:="clsProduct_DeleteProdRef_132"
Else
    Rem .ItrRefCode(acount) = mItrRefCode not required
    Rem .ItrStkCode(acount) = mItrStkCode
    Rem .ItrStkICode(acount) = mItrStkICode
    Rem .ItrPRate(acount) = mItrPRate
    Rem .ItrMRP(acount) = mItrMRP
    Rem .ItrSRate(acount) = mItrSRate
    Rem .ItrRef1Name(acount) = mItrRef1Name
    Rem .ItrRef2Name(acount) = mItrRef2Name
    .ItrRecState(acount) = ChkDeleteRecStatus(.ItrRecState(acount))
End If
End With

End Sub

Public Property Get LOpnStock() As Integer
LOpnStock = LBound(adtlOpnStock.StkICode)
End Property

Public Property Get UOpnStock() As Integer
UOpnStock = UBound(adtlOpnStock.StkICode)
End Property

Public Property Get OpnCode(ByVal mDim1 As Integer) As Variant
OpnCode = adtlOpnStock.StkCode(mDim1)
End Property

Public Property Get OpnICode(ByVal mDim1 As Integer) As Variant
OpnICode = adtlOpnStock.StkICode(mDim1)
End Property

Public Property Get OpnItmRefCode(ByVal mDim1 As Integer) As Variant
OpnItmRefCode = adtlOpnStock.StkItmRefCode(mDim1)
End Property

Public Property Get OpnQty(ByVal mDim1 As Integer) As Variant
OpnQty = adtlOpnStock.StkQty(mDim1)
End Property

Public Property Get OpnRate(ByVal mDim1 As Integer) As Variant
OpnRate = adtlOpnStock.StkRate(mDim1)
End Property

Public Property Get OpnValue(ByVal mDim1 As Integer) As Variant
OpnValue = adtlOpnStock.StkValue(mDim1)
End Property

Public Property Get OpnRecState(ByVal mDim1 As Integer) As Variant
OpnRecState = adtlOpnStock.StkRecState(mDim1)
End Property

Public Sub AddOpnStock(ByVal mStkQty As Double, ByVal mStkRate As Double, ByVal mStkValue As Double, Optional ByVal mStkCode As Long = cOPSTKCODE)
Dim acount As Integer, mStkICode As Long, mStkItmRefCode As Long
With adtlOpnStock
acount = UBound(.StkICode) + 1

ReDim Preserve .StkICode(acount)
ReDim Preserve .StkCode(acount)
ReDim Preserve .StkItmRefCode(acount)
ReDim Preserve .StkQty(acount)
ReDim Preserve .StkRate(acount)
ReDim Preserve .StkValue(acount)
ReDim Preserve .StkRecState(acount)

mStkICode = acount   'GetNextSeqno(m_dbStDatabase, "StockJrn", "StkICode") * -(acount + 1)      ' acount must never fall to 0
mStkItmRefCode = acount  'GetNextSeqno(m_dbStDatabase, "ProdRef", "ItrRefCode") * -(acount + 1)      ' acount must never fall to 0

.StkICode(acount) = mStkICode
.StkCode(acount) = mStkCode
.StkItmRefCode(acount) = mStkItmRefCode
.StkQty(acount) = mStkQty
.StkRate(acount) = mStkRate
.StkValue(acount) = mStkValue
.StkRecState(acount) = cREC_ADDED
End With

End Sub

Public Sub EditOpnStock(ByVal mStkICode As Long, ByVal mStkQty As Double, ByVal mStkRate As Double, ByVal mStkValue As Double)
Dim acount As Integer, mLCount As Integer, mUCount As Integer, mItmRefFound As Boolean
With adtlOpnStock
mLCount = LBound(.StkICode)
mUCount = UBound(.StkICode)
mItmRefFound = False
For acount = mLCount To mUCount
    If .StkICode(acount) = mStkICode Then
        mItmRefFound = True
        Exit For
    End If
Next acount

If mItmRefFound = False Then
    ErrorBox "clsProduct_EditOpnStock_235"
Else
    Rem .StkICode(acount) = mStkICode ' not required
    Rem .StkCode(acount) = mStkCode ' not required
    Rem .StkItmRefCode(acount) = mStkItmRefCode not required
    .StkQty(acount) = mStkQty
    .StkRate(acount) = mStkRate
    .StkValue(acount) = mStkValue
    .StkRecState(acount) = ChkEditRecStatus(.StkRecState(acount))
End If
End With

End Sub

Public Sub DeleteOpnStock(ByVal mStkICode As Long)
Dim acount As Integer, mLCount As Integer, mUCount As Integer, mItmRefFound As Boolean
With adtlOpnStock
mLCount = LBound(.StkICode)
mUCount = UBound(.StkICode)
mItmRefFound = False
For acount = mLCount To mUCount
    If .StkICode(acount) = mStkICode Then
        mItmRefFound = True
        Exit For
    End If
Next acount

If mItmRefFound = False Then
    ErrorBox "clsProduct_DeleteOpnStock_265"
Else
    Rem .StkICode(acount) = mStkICode ' not required
    Rem .StkCode(acount) = mStkCode ' not required
    Rem .StkItmRefCode(acount) = mStkItmRefCode not required
    Rem .StkQty(acount) = mStkQty
    Rem .StkRate(acount) = mStkRate
    Rem .StkValue(acount) = mStkValue
    .StkRecState(acount) = ChkDeleteRecStatus(.StkRecState(acount))
End If
End With

End Sub

Public Property Get LCurStock() As Integer
LCurStock = LBound(adtlCurStock.StkItmRefCode)
End Property

Public Property Get UCurStock() As Integer
UCurStock = UBound(adtlCurStock.StkItmRefCode)
End Property

Public Property Get CurItmRefCode(ByVal mDim1 As Integer) As Variant
CurItmRefCode = adtlCurStock.StkItmRefCode(mDim1)
End Property

Public Property Get CurQty(ByVal mDim1 As Integer) As Variant
CurQty = adtlCurStock.StkQty(mDim1)
End Property

Public Property Get CurRate(ByVal mDim1 As Integer) As Variant
CurRate = adtlCurStock.StkRate(mDim1)
End Property

Public Property Get CurValue(ByVal mDim1 As Integer) As Variant
CurValue = adtlCurStock.StkValue(mDim1)
End Property

Public Property Set dbStDatabase(ByRef db As ADODB.Connection)
Set m_dbStDatabase = db

End Property

Public Property Set dbGrpDatabase(ByRef db As ADODB.Connection)
Set m_dbGrpDatabase = db
End Property

Private Sub Class_Initialize()
mTitleName = "Product Master"
aItemTran = Array()
mActiveItem = UBound(aItemTran)

mClassUIdFileName = "clItmMst.UId"
mClassAcsPermFileName = "clItmMst.Acp"
mClassUIdCode = GetUIdCode("clsProduct_Initialize", mUIdFileName:=mClassUIdFileName, mAcsPermFileName:=mClassAcsPermFileName)
If mClassUIdCode = 0 Then
    ErrorBox cSYSBUSY_ACS_DENIED
End If

End Sub

Public Sub GetData(ByVal mItmCode As Long, Optional ByVal mStkCode As Long = cOPSTKCODE)
Dim acount As Integer, tRecset As ADODB.Recordset
Me.Clear

Set tRecset = m_dbStDatabase.Execute("Select * from ProdMast where ItmCode = " & CStr(mItmCode) & "")
With tRecset
If .EOF = False Then
    mItmCode_lng = .fields("ItmCode")
    mItmName_str = .fields("ItmName")
    mItmDesc_str = .fields("ItmDesc")
Else
    ErrorBox "clsProduct_GetData(#311)_ProdMast_[Record Not Found]"
End If
End With
CloseTable tRecset

Rem item reference
Set tRecset = m_dbStDatabase.Execute("Select * from ProdRef where ItrStkCode=" & CStr(mStkCode) & " and ItrItmCode=" & CStr(mItmCode) & " order by ItrRefcode")
If tRecset.EOF = False Then
    Do While tRecset.EOF = False
        With adtlProdRef
        acount = UBound(.ItrRefCode) + 1
        
        ReDim Preserve .ItrRefCode(acount)
        ReDim Preserve .ItrStkCode(acount)
        ReDim Preserve .ItrStkICode(acount)
        ReDim Preserve .ItrRef1Name(acount)
        ReDim Preserve .ItrRef2Name(acount)
        ReDim Preserve .ItrPRate(acount)
        ReDim Preserve .ItrMRP(acount)
        ReDim Preserve .ItrSRate(acount)
        ReDim Preserve .ItrRecState(acount)
        
        .ItrRefCode(acount) = tRecset.fields("ItrRefCode")
        .ItrStkCode(acount) = tRecset.fields("ItrStkCode")
        .ItrStkICode(acount) = tRecset.fields("ItrStkICode")
        .ItrRef1Name(acount) = tRecset.fields("ItrRef1Name")
        .ItrRef2Name(acount) = tRecset.fields("ItrRef2Name")
        .ItrPRate(acount) = tRecset.fields("ItrPRate")
        .ItrMRP(acount) = tRecset.fields("ItrMRP")
        .ItrSRate(acount) = tRecset.fields("ItrSRate")
        .ItrRecState(acount) = tRecset.fields("ItrRecState")
        End With
        
        tRecset.MoveNext
    Loop
End If
CloseTable tRecset

Rem opening stock
Set tRecset = m_dbStDatabase.Execute("Select * from StockJrn where StkCode=" & CStr(mStkCode) & " and StkItmCode=" & CStr(mItmCode) & " and StkDate=#" & CStr(ToSysDate(sCmpBookStartDate - 1)) & "#")
If tRecset.EOF = False Then
    Do While tRecset.EOF = False
        With adtlOpnStock
        acount = UBound(.StkICode) + 1
        
        ReDim Preserve .StkICode(acount)
        ReDim Preserve .StkCode(acount)
        ReDim Preserve .StkItmRefCode(acount)
        ReDim Preserve .StkQty(acount)
        ReDim Preserve .StkRate(acount)
        ReDim Preserve .StkValue(acount)
        ReDim Preserve .StkRecState(acount)
        
        .StkICode(acount) = tRecset.fields("StkICode")
        .StkCode(acount) = tRecset.fields("StkCode")
        .StkItmRefCode(acount) = tRecset.fields("StkItmRefCode")
        .StkQty(acount) = tRecset.fields("StkQty")
        .StkRate(acount) = tRecset.fields("StkRate")
        .StkValue(acount) = tRecset.fields("StkValue")
        .StkRecState(acount) = tRecset.fields("StkRecState")
        End With
        
        tRecset.MoveNext
    Loop
Else
    ErrorBox "clsProduct_GetData(#368)_StockJrn_Opn_[Record Not Found]"
End If
CloseTable tRecset

Rem current stock
Set tRecset = m_dbGrpDatabase.Execute("Select gpsItmRefCode,sum(gpsQty) as gpsQty_sum from gProdSum where gpsItmCode=" & CStr(mItmCode) & " group by gpsItmRefCode order by gpsItmRefCode")
If tRecset.EOF = False Then
    Do While tRecset.EOF = False
        With adtlCurStock
        acount = UBound(.StkItmRefCode) + 1
        
        ReDim Preserve .StkItmRefCode(acount)
        ReDim Preserve .StkQty(acount)
        ReDim Preserve .StkRate(acount)
        ReDim Preserve .StkValue(acount)
        
        .StkItmRefCode(acount) = tRecset.fields("gpsItmRefCode")
        .StkQty(acount) = tRecset.fields("gpsQty_sum")
        .StkRate(acount) = 0
        .StkValue(acount) = 0
        End With
        
        tRecset.MoveNext
    Loop
End If
CloseTable tRecset

End Sub

Public Sub Clear()
mItmCode_lng = 0
mItmName_str = ""
mItmDesc_str = ""

With adtlProdRef
.ItrRefCode = Array()
.ItrStkCode = Array()
.ItrStkICode = Array()
.ItrRef1Name = Array()
.ItrRef2Name = Array()
.ItrPRate = Array()
.ItrMRP = Array()
.ItrSRate = Array()
.ItrRecState = Array()
End With

With adtlOpnStock
.StkCode = Array()
.StkICode = Array()
.StkItmRefCode = Array()
.StkQty = Array()
.StkRate = Array()
.StkValue = Array()
.StkRecState = Array()
End With

With adtlCurStock
.StkItmRefCode = Array()
.StkQty = Array()
.StkRate = Array()
.StkValue = Array()
End With

End Sub

Public Sub Requery()
RefreshDatabase m_dbStDatabase
RefreshDatabase m_dbGrpDatabase

End Sub

Private Sub Class_Terminate()
If UBound(aItemTran) >= LBound(aItemTran) Then
    ErrorBox "Product Master Entry in Process !!!"
End If

End Sub

Public Function BeginItem(ByVal mItmCode As Long) As Boolean
Dim tRecset As ADODB.Recordset

BeginItem = False
If mItmCode = 0 Then
    mItmCode = GetUIdCode("clsProduct_BeginItem", mUIdFileName:=mClassUIdFileName, mAcsPermFileName:=mClassAcsPermFileName) * -1
    If mItmCode = 0 Then
        ErrorBox "clsProduct_BeginItem_#482_[Invalid " & mTitleName & " Code]"
        Exit Function
    End If
ElseIf mItmCode > 0 Then
    Set tRecset = m_dbStDatabase.Execute("Select * from ProdMast where ItmCode = " & CStr(mItmCode) & "")
    If tRecset.EOF = True Then
        ErrorBox "clsProduct_BeginItem_#489_[Entry not Found]"
        CloseTable tRecset
        Exit Function
    Else
        CloseTable tRecset
    End If
Else
    ErrorBox "clsProduct_BeginItem_#496_[Invalid " & mTitleName & " Entry Code Request]"
    Exit Function
End If
mActiveItem = UBound(aItemTran) + 1
ReDim Preserve aItemTran(mActiveItem)
aItemTran(mActiveItem) = mItmCode

Call Data_CreateLog(mItmCode)

BeginItem = True

End Function

Public Function EndItem(ByVal mItmCode As Long) As Boolean
Dim mCnt As Integer
EndItem = False
If Chk_ActiveItem() = False Or IIf(ActiveItmCode > 0, mItmCode <> ActiveItmCode, False) Then
    ErrorBox "clsProduct_EndItem_#513_[InActive " & mTitleName & " Entry]"
    Exit Function
End If
Call Data_RemoveLog(mItmCode)

For mCnt = (mActiveItem + 1) To UBound(aItemTran)
    If (mCnt - 1) >= LBound(aItemTran) Then
        aItemTran(mCnt - 1) = aItemTran(mCnt)
    End If
Next mCnt
If LBound(aItemTran) = UBound(aItemTran) Then
    aItemTran = Array()
Else
    ReDim Preserve aItemTran(UBound(aItemTran) - 1)
End If
If mActiveItem > UBound(aItemTran) Then
    mActiveItem = mActiveItem - 1
End If

EndItem = True
End Function

Public Property Get ActiveItmCode() As Long
On Error GoTo errhand

ActiveItmCode = aItemTran(mActiveItem)

Exit Property

errhand:
ErrorBox Err.Description
ActiveItmCode = -1
Exit Property

End Property

Rem update transactional sum up, physically deletes records marked for deletion or marks ok records for added or edited
Public Function CommitItem(ByVal mItmCode As Long, Optional ByVal mStkCode As Long = cOPSTKCODE) As Boolean
Dim t1Recset As New ADODB.Recordset, t2Recset As New ADODB.Recordset, tRecset As New ADODB.Recordset
Dim mTmpItmCode As Long, mStkSno As Integer, mDeletedRec As Boolean, mAddedRec As Boolean, mEditedRec As Boolean, mUnknownRec As Boolean, mCanceledRec As Boolean, mHdrDateChanged As Boolean

CommitItem = False
mTmpItmCode = ActiveItmCode

On Error GoTo errhand

Rem StockJrn - opening stock
m_dbStDatabase.BeginTrans
With t1Recset
If mItmCode = mTmpItmCode Then
    .open "Select * from StockJrn where StkCode = " & CStr(mStkCode) & " and StkItmCode = " & CStr(mItmCode) & " order by StkICode", m_dbStDatabase, adOpenKeyset, adLockOptimistic     ''' & " and StkRecState<>" & CStr(cREC_UNCHANGED)
    t2Recset.open "Select * from StockJrn_Log where StkCode = " & CStr(mStkCode) & " and StkItmCode = " & CStr(mItmCode) & " order by StkICode", m_dbStDatabase, adOpenKeyset, adLockOptimistic
Else
    .open "Select * from StockJrn where StkCode = " & CStr(mStkCode) & " and StkItmCode = " & CStr(mTmpItmCode) & " order by StkICode", m_dbStDatabase, adOpenKeyset, adLockOptimistic      ''' & " and StkRecState<>" & CStr(cREC_UNCHANGED)
    t2Recset.open "Select * from StockJrn_Log where StkCode = " & CStr(mStkCode) & " and StkItmCode = " & CStr(mTmpItmCode) & " order by StkICode", m_dbStDatabase, adOpenKeyset, adLockOptimistic
End If
If .RecordCount > 0 Then
    mStkSno = 1
    Do While .EOF = False
        mDeletedRec = False: mAddedRec = False: mEditedRec = False: mUnknownRec = False: mCanceledRec = False: mHdrDateChanged = False
        
        Select Case .fields("StkRecState")
        Case cREC_ADDED
            mAddedRec = True
        Case cREC_EDITED
            mEditedRec = True
        Case cREC_DELETED
            mDeletedRec = True
        Case cREC_CANCELED
            mCanceledRec = True
        Case cREC_UNCHANGED
            Rem no action
        Case Else
            ErrorBox "clsProduct_CommitItem_#584_[Invalid Record Status]"
            mUnknownRec = True
        End Select
        If InList(.fields("StkRecState"), Array(cREC_ADDED, cREC_EDITED, cREC_UNCHANGED)) = True Then
            If .fields("StkDate") <> (sCmpBookStartDate - 1) Then
                mHdrDateChanged = True
            End If
            If mItmCode <> mTmpItmCode Then
                .fields("StkItmCode") = mItmCode
                
                m_dbStDatabase.BeginTrans
                m_dbStDatabase.Execute "Update ProdRef set ItrItmCode=" & CStr(mItmCode) & " where ItrRefCode=" & CStr(.fields("StkItmRefCode")) & " and ItrItmCode=" & CStr(mTmpItmCode) & " and ItrStkCode=" & CStr(.fields("StkCode")) & " and ItrStkICode=" & CStr(.fields("StkICode"))
                m_dbStDatabase.CommitTrans
            End If
            
            .fields("StkSno") = mStkSno
            .fields("StkDate") = (sCmpBookStartDate - 1)
            .Update
        End If
        t2Recset.Find "StkICode=" & CStr(.fields("StkICode")), Start:=1
        If t2Recset.EOF = False Then
            If mEditedRec = True Or mDeletedRec = True Or mUnknownRec = True Or mHdrDateChanged = True Then
                Rem remove old transaction balance
                UpdateGrpQtySum t2Recset.fields("StkItmCode"), t2Recset.fields("StkItmRefCode"), t2Recset.fields("StkQty"), 0, cREMOVEBAL, t2Recset.fields("StkDate")
                
                Rem in case any field value is changed and not deleted
                Rem check here any unlinked gProdSum for deletion (old record)
                If t2Recset.fields("StkDate") <> .fields("StkDate") _
                  Or t2Recset.fields("StkItmCode") <> .fields("StkItmCode") _
                  Or t2Recset.fields("StkItmRefCode") <> .fields("StkItmRefCode") Then
                    tRecset.open "Select * from StockJrn where StkItmCode=" & CStr(t2Recset.fields("StkItmCode")) & " and StkItmRefCode=" & CStr(t2Recset.fields("StkItmRefCode")) & " and StkDate=#" & CStr(ToSysDate(t2Recset.fields("StkDate"))) & "# and StkICode<>" & CStr(t2Recset.fields("StkICode")) & " order by StkICode", m_dbStDatabase, adOpenKeyset, adLockOptimistic
                    If tRecset.RecordCount = 0 Then
                        m_dbGrpDatabase.BeginTrans
                        m_dbGrpDatabase.Execute "Delete from gProdSum where gpsItmCode=" & CStr(t2Recset.fields("StkItmCode")) & " and gpsItmRefCode=" & CStr(t2Recset.fields("StkItmRefCode")) & " and gpsDate=#" & CStr(ToSysDate(t2Recset.fields("StkDate"))) & "# and gpsQty=0" & ""
                        m_dbGrpDatabase.CommitTrans
                    End If
                    CloseTable tRecset
                End If
                
                Rem in case old ItmRefCode no longer required
                If t2Recset.fields("StkItmCode") <> .fields("StkItmCode") _
                  Or t2Recset.fields("StkItmRefCode") <> .fields("StkItmRefCode") Then
                    tRecset.open "Select * from StockJrn where StkItmCode=" & CStr(t2Recset.fields("StkItmCode")) & " and StkItmRefCode=" & CStr(t2Recset.fields("StkItmRefCode")) & " and StkICode<>" & CStr(t2Recset.fields("StkICode")) & " order by StkICode", m_dbStDatabase, adOpenKeyset, adLockOptimistic
                    If tRecset.RecordCount = 0 Then
                        m_dbStDatabase.BeginTrans
                        m_dbStDatabase.Execute "Delete from ProdRef where ItrItmCode=" & CStr(t2Recset.fields("StkItmCode")) & " and ItrRefCode=" & CStr(t2Recset.fields("StkItmRefCode")) & " and ItrStkCode=" & CStr(t2Recset.fields("StkCode")) & " and ItrStkICode=" & CStr(t2Recset.fields("StkICode")) & ""
                        m_dbStDatabase.CommitTrans
                    End If
                    CloseTable tRecset
                End If
                Rem --------------------------
            End If
        Else    ' for newly added,changed,canceled entries in add mode or edit mode
            If mAddedRec = True Or mCanceledRec = True Then
                m_dbStDatabase.BeginTrans
                'If mItmCode <> mTmpItmCode Then
                '    m_dbStDatabase.Execute "Delete from ProdRef where (ItrRefCode<>" & CStr(.fields("StkItmRefCode")) & " or ItrItmCode<>" & CStr(.fields("StkItmCode")) & ") and ItrStkCode=" & CStr(mTmpStkCode) & " and ItrStkICode=" & CStr(.fields("StkICode"))
                '    If mCanceledRec = True Then
                '        m_dbStDatabase.Execute "Delete from ProdRef where ItrRefCode=" & CStr(.fields("StkItmRefCode")) & " and ItrItmCode=" & CStr(.fields("StkItmCode")) & " and ItrStkCode=" & CStr(mTmpStkCode) & " and ItrStkICode=" & CStr(.fields("StkICode"))
                '    End If
                'Else
                    m_dbStDatabase.Execute "Delete from ProdRef where (ItrRefCode<>" & CStr(.fields("StkItmRefCode")) & " or ItrItmCode<>" & CStr(.fields("StkItmCode")) & ") and ItrStkCode=" & CStr(mStkCode) & " and ItrStkICode=" & CStr(.fields("StkICode"))
                    If mCanceledRec = True Then
                        m_dbStDatabase.Execute "Delete from ProdRef where ItrRefCode=" & CStr(.fields("StkItmRefCode")) & " and ItrItmCode=" & CStr(.fields("StkItmCode")) & " and ItrStkCode=" & CStr(mStkCode) & " and ItrStkICode=" & CStr(.fields("StkICode"))
                    End If
                'End If
                m_dbStDatabase.CommitTrans
            End If
        End If
''        If .fields("StkRecState") = cREC_EDITED Or .fields("StkRecState") = cREC_DELETED Then
''            t2Recset.Find "StkICode=" & CStr(.fields("StkICode")), Start:=1
''            If t2Recset.EOF = False Then
''                UpdateGrpQtySum t2Recset.fields("StkItmCode"), t2Recset.fields("StkItmRefCode"), t2Recset.fields("StkQty"), 0, cREMOVEBAL, t2Recset.fields("StkDate")
''            Else
''                ErrorBox "clsProduct_UpdateItem_626"
''            End If
''        End If
''        If .fields("StkRecState") = cREC_ADDED Or .fields("StkRecState") = cREC_EDITED Then
''            UpdateGrpQtySum .fields("StkItmCode"), .fields("StkItmRefCode"), .fields("StkQty"), 0, cADDBAL, .fields("StkDate")
''        End If
        If mAddedRec = True Or mEditedRec = True Or mHdrDateChanged = True Then
            Rem add new/edited transaction balances at entry date (edited/unchanged)
            UpdateGrpQtySum .fields("StkItmCode"), .fields("StkItmRefCode"), .fields("StkQty"), 0, cADDBAL, .fields("StkDate")
        End If
        If InList(.fields("StkRecState"), Array(cREC_ADDED, cREC_EDITED, cREC_UNCHANGED)) = True Then
            .fields("StkRecState") = cREC_UNCHANGED
            .Update
            mStkSno = mStkSno + 1
        Else
            Rem check here any unlinked gProdSum for deletion
            tRecset.open "Select * from StockJrn where StkItmCode=" & CStr(.fields("StkItmCode")) & " and StkItmRefCode=" & CStr(.fields("StkItmRefCode")) & " and StkDate=#" & CStr(ToSysDate(.fields("StkDate"))) & "# and StkICode<>" & CStr(.fields("StkICode")) & " order by StkICode", m_dbStDatabase, adOpenKeyset, adLockOptimistic
            If tRecset.RecordCount = 0 Then
                m_dbGrpDatabase.BeginTrans
                m_dbGrpDatabase.Execute "Delete from gProdSum where gpsItmCode=" & CStr(.fields("StkItmCode")) & " and gpsItmRefCode=" & CStr(.fields("StkItmRefCode")) & " and gpsDate=#" & CStr(ToSysDate(.fields("StkDate"))) & "# and gpsQty=0" & ""
                m_dbGrpDatabase.CommitTrans
            End If
            CloseTable tRecset
            
            Rem check here ItmRefCode for deletion not used anywhere else
            tRecset.open "Select * from StockJrn where StkItmCode=" & CStr(.fields("StkItmCode")) & " and StkItmRefCode=" & CStr(.fields("StkItmRefCode")) & " and StkICode<>" & CStr(.fields("StkICode")) & " order by StkICode", m_dbStDatabase, adOpenKeyset, adLockOptimistic
            If tRecset.RecordCount = 0 Then
                m_dbStDatabase.BeginTrans
                m_dbStDatabase.Execute "Delete from ProdRef where ItrItmCode=" & CStr(.fields("StkItmCode")) & " and ItrRefCode=" & CStr(.fields("StkItmRefCode")) & " and ItrStkCode=" & CStr(.fields("StkCode")) & " and ItrStkICode=" & CStr(.fields("StkICode"))
                m_dbStDatabase.CommitTrans
            End If
            CloseTable tRecset
            Rem --------------------------
        
            .fields("StkRecState") = ChkDeleteRecStatus(.fields("StkRecState"))
            .Update
            .Delete
        End If
        .MoveNext
    Loop
End If
End With
m_dbStDatabase.CommitTrans
CloseTable t1Recset
CloseTable t2Recset

Rem ProdRef table
m_dbStDatabase.BeginTrans
With tRecset
.open "Select * from ProdRef where ItrStkCode=" & CStr(mStkCode) & " and ItrItmCode=" & CStr(mItmCode) & " order by ItrRefCode", m_dbStDatabase, adOpenKeyset, adLockOptimistic
If .RecordCount > 0 Then
    Do While .EOF = False
        If InList(.fields("ItrRecState"), Array(cREC_ADDED, cREC_EDITED, cREC_UNCHANGED)) = True Then
            .fields("ItrRecState") = cREC_UNCHANGED
            .Update
        Else
            .fields("ItrRecState") = ChkDeleteRecStatus(.fields("ItrRecState"))
            .Update
            .Delete
        End If
    
        .MoveNext
    Loop
End If
End With
m_dbStDatabase.CommitTrans
CloseTable tRecset

Rem gProdSum -  stock day balances
m_dbGrpDatabase.BeginTrans
t1Recset.open "Select * from StockJrn where StkCode=" & CStr(mStkCode) & " and StkItmCode=" & CStr(mItmCode) & " order by StkICode", m_dbStDatabase, adOpenKeyset, adLockOptimistic
If t1Recset.RecordCount > 0 Then
    t1Recset.MoveFirst
    Do While t1Recset.EOF = False
        With t2Recset
        .open "Select * from gProdSum where gpsItmCode=" & CStr(t1Recset.fields("StkItmCode")) & " and gpsItmRefCode=" & CStr(t1Recset.fields("StkItmRefCode")) & " and gpsDate=#" & CStr(ToSysDate(t1Recset.fields("StkDate"))) & "# order by gpsICode", m_dbGrpDatabase, adOpenKeyset, adLockOptimistic       ''' & " and gpsRecState<>" & CStr(cREC_UNCHANGED)
        If .RecordCount > 0 Then
            If InList(.fields("gpsRecState"), Array(cREC_ADDED, cREC_EDITED, cREC_UNCHANGED)) = True Then
                .fields("gpsRecState") = cREC_UNCHANGED
                .Update
            Else
                Rem though already done above
                tRecset.open "Select * from StockJrn where StkItmCode=" & CStr(t1Recset.fields("StkItmCode")) & " and StkItmRefCode=" & CStr(t1Recset.fields("StkItmRefCode")) & " and StkDate=#" & CStr(ToSysDate(t1Recset.fields("StkDate"))) & "# and StkICode<>" & CStr(t1Recset.fields("StkICode")) & " order by StkICode", m_dbStDatabase, adOpenKeyset, adLockOptimistic
                If tRecset.RecordCount = 0 Then
                    .fields("gpsRecState") = ChkDeleteRecStatus(.fields("gpsRecState"))
                    .Update
                    .Delete
                    .MoveNext
                End If
                CloseTable tRecset
            End If
        End If
        End With
        CloseTable t2Recset
        
        t1Recset.MoveNext
    Loop
End If
CloseTable t1Recset
m_dbGrpDatabase.CommitTrans

''m_dbGrpDatabase.BeginTrans
''With t1Recset
''.Open "Select * from gProdSum where gpsItmCode=" & CStr(mItmCode) & " and gpsDate=#" & CStr(ToSysDate(sCmpBookStartDate - 1)) & "# order by gpsICode", m_dbGrpDatabase, adOpenKeyset, adLockOptimistic      ''' & " and gpsRecState<>" & CStr(cREC_UNCHANGED)
''If .RecordCount > 0 Then
''    Do While .EOF = False
''        If InList(.fields("gpsRecState"), Array(cREC_ADDED, cREC_EDITED, cREC_UNCHANGED)) = True Then
''            .fields("gpsRecState") = cREC_UNCHANGED
''            .Update
''        Else
''            .fields("gpsRecState") = ChkDeleteRecStatus(.fields("gpsRecState"))
''            .Update
''            .Delete
''        End If
''        .MoveNext
''    Loop
''End If
''End With
''m_dbGrpDatabase.CommitTrans
''CloseTable t1Recset

Rem updating ProdMast
m_dbStDatabase.BeginTrans
With t1Recset
.open "Select * from ProdMast where ItmCode=" & CStr(mItmCode) & "", m_dbStDatabase, adOpenKeyset, adLockOptimistic
'If .RecordCount > 0 Then
    If InList(.fields("ItmRecState"), Array(cREC_ADDED, cREC_EDITED, cREC_UNCHANGED)) = True Then
        .fields("ItmRecState") = cREC_UNCHANGED
        .Update
    Else
        Rem removing all gProdSum entries of item to be deleted
        m_dbGrpDatabase.BeginTrans
        m_dbGrpDatabase.Execute "Delete from gProdSum where gpsItmCode=" & CStr(mItmCode) & ""
        m_dbGrpDatabase.CommitTrans
        Rem removing all ProdRef entries of Item to be deleted
        m_dbStDatabase.BeginTrans
        m_dbStDatabase.Execute "Delete from ProdRef where ItrItmCode=" & CStr(mItmCode) & ""
        m_dbStDatabase.CommitTrans
        Rem --------------------
        
        .fields("ItmRecState") = ChkDeleteRecStatus(.fields("ItmRecState"))
        .Update
        .Delete
    End If
'End If
End With
m_dbStDatabase.CommitTrans
CloseTable t1Recset

CommitItem = True

Exit Function
errhand:
MsgBox Err.Description
m_dbStDatabase.Cancel
Exit Function

End Function

Rem checks entries with log table, if log exist restores log records else delete records (assuming new records added), stock updation part not done here because master entries does not have effect while in process
Public Function CancelItem(ByVal mItmCode As Long, Optional ByVal mStkCode As Long = cOPSTKCODE) As Boolean
Dim t1Recset As New ADODB.Recordset, t2Recset As New ADODB.Recordset
Dim pStkQty As Double, pItrPRate As Double, pItrMRP As Double, pItrSRate As Double, mRecEdited As Boolean, mRecDeleted As Boolean

CancelItem = False
If Chk_ActiveItem() = False Or mItmCode <> ActiveItmCode Then
    ErrorBox "clsProduct_CancelItem_#679_[InActive " & mTitleName & " Entry]"
    Exit Function
End If
If mCrashedEntry = True Then
    ErrorBox "Cancel/Undo Strictly Prohibited for Crashed/Uncomplete Entries, User Must Save it !!!"
    Exit Function
End If
'mItmCode = ActiveItmCode
On Error GoTo errhand

m_dbStDatabase.BeginTrans
With t1Recset
.open "Select * from ProdMast where ItmCode=" & CStr(mItmCode) & "", m_dbStDatabase, adOpenKeyset, adLockOptimistic
If .EOF = False Then
    t2Recset.open "Select * from ProdMast_Log where ItmCode=" & CStr(mItmCode) & "", m_dbStDatabase, adOpenKeyset, adLockOptimistic
    If t2Recset.EOF = False Then
        ' any prior updations can be made here
        .fields("ItmName") = t2Recset.fields("ItmName")
        .fields("ItmDesc") = t2Recset.fields("ItmDesc")
        .fields("ItmDepends") = t2Recset.fields("ItmDepends")
        .fields("ItmRecState") = t2Recset.fields("ItmRecState")
        .Update
    Else
        ' any prior updations can be made here
        .fields("ItmRecState") = ChkDeleteRecStatus(.fields("ItmRecState"))
        .Update
        .Delete
    End If
    CloseTable t2Recset
End If
End With
CloseTable t1Recset

With t1Recset
.open "Select * from ProdRef where ItrStkCode=" & CStr(mStkCode) & " and ItrItmCode=" & CStr(mItmCode) & " order by ItrRefCode", m_dbStDatabase, adOpenKeyset, adLockOptimistic
t2Recset.open "Select * from ProdRef_Log where ItrStkCode=" & CStr(mStkCode) & " and ItrItmCode=" & CStr(mItmCode) & " order by ItrRefCode", m_dbStDatabase, adOpenKeyset, adLockOptimistic
If .EOF = False Then
    Do While .EOF = False
        t2Recset.Find "ItrRefCode=" & CStr(.fields("ItrRefCode")), Start:=1
        If t2Recset.EOF = False Then
            ' any prior updations can be made here
            .fields("ItrItmCode") = t2Recset.fields("ItrItmCode")
            Rem .fields("ItrStkCode") = t2Recset.fields("ItrStkCode")
            .fields("ItrStkICode") = t2Recset.fields("ItrStkICode")
            .fields("ItrRef1Name") = t2Recset.fields("ItrRef1Name")
            .fields("ItrRef2Name") = t2Recset.fields("ItrRef2Name")
            .fields("ItrPRate") = t2Recset.fields("ItrPRate")
            .fields("ItrMRP") = t2Recset.fields("ItrMRP")
            .fields("ItrSRate") = t2Recset.fields("ItrSRate")
            .fields("ItrCmpCode") = t2Recset.fields("ItrCmpCode")
            .fields("ItrRecState") = t2Recset.fields("ItrRecState")
            .Update
        Else
            ' any prior updations can be made here
            .fields("ItrRecState") = ChkDeleteRecStatus(.fields("ItrRecState"))
            .Update
            .Delete
        End If
        .MoveNext
    Loop
End If
End With
CloseTable t1Recset
CloseTable t2Recset

With t1Recset
.open "Select * from StockJrn where StkCode=" & CStr(mStkCode) & " and StkItmCode=" & CStr(mItmCode) & " order by StkICode", m_dbStDatabase, adOpenKeyset, adLockOptimistic
t2Recset.open "Select * from StockJrn_Log where StkCode=" & CStr(mStkCode) & " and StkItmCode=" & CStr(mItmCode) & " order by StkICode", m_dbStDatabase, adOpenKeyset, adLockOptimistic
If .RecordCount > 0 Then
    Do While .EOF = False
        t2Recset.Find "StkICode=" & CStr(.fields("StkICode")), Start:=1
        If t2Recset.EOF = False Then
            ' any prior updations can be made here
            .fields("StkSno") = t2Recset.fields("StkSno")
            .fields("StkVtmCode") = t2Recset.fields("StkVtmCode")
            .fields("StkPrefix") = t2Recset.fields("StkPrefix")
            .fields("StkVchNo") = t2Recset.fields("StkVchNo")
            .fields("StkPostfix") = t2Recset.fields("StkPostfix")
            .fields("StkDate") = t2Recset.fields("StkDate")
            .fields("StkItmCode") = t2Recset.fields("StkItmCode")
            .fields("StkItmRefCode") = t2Recset.fields("StkItmRefCode")
            .fields("StkQty") = t2Recset.fields("StkQty")
            .fields("StkRate") = t2Recset.fields("StkRate")
            .fields("StkValue") = t2Recset.fields("StkValue")
            .fields("StkNarr") = t2Recset.fields("StkNarr")
            .fields("StkLItmCode") = t2Recset.fields("StkLItmCode")
            .fields("StkAutoGen") = t2Recset.fields("StkAutoGen")
            .fields("StkCmpCode") = t2Recset.fields("StkCmpCode")
            .fields("StkRecState") = t2Recset.fields("StkRecState")
            .Update
        Else
            ' any prior updations can be made here
            .fields("StkRecState") = ChkDeleteRecStatus(.fields("StkRecState"))
            .Update
            .Delete
        End If
        
        .MoveNext
    Loop
End If
End With
m_dbStDatabase.CommitTrans
CloseTable t1Recset
CloseTable t2Recset

CancelItem = True

Exit Function

errhand:
MsgBox Err.Description
m_dbStDatabase.Cancel
CloseTable t1Recset, mCheckOpen:=True
CloseTable t2Recset, mCheckOpen:=True
Exit Function

End Function

Rem marking records for deletion
Public Function DeleteItem(ByVal mItmCode As Long, Optional ByVal mStkCode As Long = cOPSTKCODE) As Boolean
Dim tRecset As New ADODB.Recordset

DeleteItem = False
If Chk_ActiveItem() = False Or mItmCode <> ActiveItmCode Then
    ErrorBox "clsProduct_DeleteItem_#792_[InActive " & mTitleName & " Entry]"
    Exit Function
End If
On Error GoTo errhand

m_dbStDatabase.BeginTrans
With tRecset
.open "Select * from ProdMast where ItmCode=" & CStr(mItmCode) & "", m_dbStDatabase, adOpenKeyset, adLockOptimistic
If .RecordCount > 0 Then
    .fields("ItmRecState") = ChkDeleteRecStatus(.fields("ItmRecState"))
    .Update
Else
    ErrorBox "clsProduct_DeleteItem_824"
End If
End With
CloseTable tRecset

With tRecset
.open "Select * from ProdRef where ItrStkCode=" & CStr(mStkCode) & " and ItrItmCode=" & CStr(mItmCode) & " order by ItrRefCode", m_dbStDatabase, adOpenKeyset, adLockOptimistic
If .RecordCount > 0 Then
    Do While .EOF = False
        .fields("ItrRecState") = ChkDeleteRecStatus(.fields("ItrRecState"))
        .Update
        
        .MoveNext
    Loop
Else
    ErrorBox "clsProduct_DeleteItem_835"
End If
End With
CloseTable tRecset

With tRecset
.open "Select * from StockJrn where StkCode=" & CStr(mStkCode) & " and StkItmCode=" & CStr(mItmCode) & " order by StkICode", m_dbStDatabase, adOpenKeyset, adLockOptimistic
If .RecordCount > 0 Then
    Do While .EOF = False
        .fields("StkRecState") = ChkDeleteRecStatus(.fields("StkRecState"))
        .Update
        
        .MoveNext
    Loop
Else
    ErrorBox "clsProduct_DeleteItem_849"
End If
End With
m_dbStDatabase.CommitTrans
CloseTable tRecset

DeleteItem = True

Exit Function

errhand:
MsgBox Err.Description
m_dbStDatabase.Cancel
Exit Function

End Function

Public Function SelectItem(ByVal mItmCode As Long) As Boolean
Dim mEntryFound As Boolean
SelectItem = False
If mItmCode < 1 Then
    ErrorBox "Invalid Product Master Entry !!!"
    Exit Function
End If
mEntryFound = False
For mActiveItem = LBound(aItemTran) To UBound(aItemTran)
    If aItemTran(mActiveItem) = mItmCode Then
        mEntryFound = True
        Exit For
    End If
Next mActiveItem
If mEntryFound = False Then
    mActiveItem = UBound(aItemTran) + 1
End If

SelectItem = True
End Function

Public Function NextStock() As Boolean
NextStock = False
If EOStk = True Then
    ErrorBox "End of Stock Entry !!!"
    Exit Function
End If
mActiveItem = mActiveItem + 1

NextStock = True
End Function

Public Function PreviousStock()
PreviousStock = False
If BOStk = True Then
    ErrorBox "Begining of Stock Entry !!!"
    Exit Function
End If
mActiveItem = mActiveItem - 1

PreviousStock = True
End Function

Public Function FirstStock() As Boolean
FirstStock = False
If CountStock = 0 Then
    ErrorBox "No Stock Entry !!!"
    Exit Function
End If
mActiveItem = LBound(aItemTran)

FirstStock = True

End Function

Public Function LastStock() As Boolean
LastStock = False
If CountStock = 0 Then
    ErrorBox "No Stock Entry !!!"
    Exit Function
End If
mActiveItem = UBound(aItemTran)

LastStock = True

End Function

Public Property Get CountStock() As Integer
If UBound(aItemTran) = -1 Then
    CountStock = 0
Else
    CountStock = UBound(aItemTran) - LBound(aItemTran) + 1
End If

End Property

Public Property Get EOStk() As Boolean
EOStk = (mActiveItem > UBound(aItemTran) Or UBound(aItemTran) = -1)
End Property

Public Property Get BOStk() As Boolean
BOStk = (mActiveItem < LBound(aItemTran) Or UBound(aItemTran) = -1)
End Property

Public Function Chk_ActiveItem() As Boolean
If BOStk = False And EOStk = False Then
    Chk_ActiveItem = True
Else
    Chk_ActiveItem = False
End If

End Function

Private Function Data_CreateLog(ByVal mItmCode As Long, Optional ByVal mStkCode As Long = cOPSTKCODE) As Boolean
Dim Itm_LogRS As New ADODB.Recordset, ProdRef_LogRS As New ADODB.Recordset, OpnStk_LogRS As New ADODB.Recordset

Data_CreateLog = False
If Chk_ActiveItem() = False Or mItmCode <> ActiveItmCode Then
    ErrorBox "clsProduct_Data_CreateLog_#948_[InActive " & mTitleName & " Entry]"
    Exit Function
End If
mCrashedEntry = False

With Itm_LogRS
.open "Select * from ProdMast_Log where ItmCode=" & CStr(mItmCode) & "", m_dbStDatabase, adOpenKeyset, adLockOptimistic
If .RecordCount = 0 Then
    m_dbStDatabase.BeginTrans
    m_dbStDatabase.Execute "Insert into ProdMast_Log Select * from ProdMast where ItmCode=" & CStr(mItmCode) & " and ItmRecState=" & CStr(cREC_UNCHANGED)
    m_dbStDatabase.CommitTrans
Else
    AlertBox "Unsaved Product Master Entry !!!"
    mCrashedEntry = True
End If
End With
CloseTable Itm_LogRS

With ProdRef_LogRS
.open "Select * from ProdRef_Log where ItrStkCode=" & CStr(mStkCode) & " and ItrItmCode=" & CStr(mItmCode) & " order by ItrRefCode", m_dbStDatabase, adOpenKeyset, adLockOptimistic
If .RecordCount = 0 Then
    m_dbStDatabase.BeginTrans
    m_dbStDatabase.Execute "Insert into ProdRef_Log Select * from ProdRef where ItrStkCode=" & CStr(mStkCode) & " and ItrItmCode=" & CStr(mItmCode) & " and ItrRecState=" & CStr(cREC_UNCHANGED)
    m_dbStDatabase.CommitTrans
Else
    AlertBox "Unsaved Product Master(Ref.) Entry !!!"
    mCrashedEntry = True
End If
End With
CloseTable ProdRef_LogRS

With OpnStk_LogRS
.open "Select * from StockJrn_Log where StkCode=" & CStr(mStkCode) & " and StkItmCode=" & CStr(mItmCode) & "", m_dbStDatabase, adOpenKeyset, adLockOptimistic
If .RecordCount = 0 Then
    m_dbStDatabase.BeginTrans
    m_dbStDatabase.Execute "Insert into StockJrn_Log Select * from StockJrn where StkCode=" & CStr(mStkCode) & " and StkItmCode=" & CStr(mItmCode) & " and StkRecState=" & CStr(cREC_UNCHANGED)
    m_dbStDatabase.CommitTrans
    .Requery
Else
    AlertBox "Unsaved Product Master(Opn.Stk) Entry !!!"
    mCrashedEntry = True
End If
End With
CloseTable OpnStk_LogRS

Data_CreateLog = True

End Function

Private Function Data_RemoveLog(ByVal mItmCode As Long, Optional ByVal mStkCode As Long = cOPSTKCODE) As Boolean

Data_RemoveLog = False
If Chk_ActiveItem() = False Then
    ErrorBox "clsProduct_Data_RemoveLog_#998_[InActive " & mTitleName & " Entry]"
    Exit Function
End If
If mCrashedEntry = True Then
    ErrorBox "Remove Entry Log Aborted for Crashed/Uncomplete Entries, User Must Save Entry !!!"
    Exit Function
End If

m_dbStDatabase.BeginTrans
m_dbStDatabase.Execute "Delete from ProdMast_Log where ItmCode=" & CStr(mItmCode)
m_dbStDatabase.Execute "Delete from ProdRef_Log where ItrStkCode=" & CStr(mStkCode) & " and ItrItmCode=" & CStr(mItmCode) & ""
m_dbStDatabase.Execute "Delete from StockJrn_Log where StkCode=" & CStr(mStkCode) & " and StkItmCode=" & CStr(mItmCode) & ""
m_dbStDatabase.CommitTrans

Data_RemoveLog = True

End Function

Public Function AddNewHdr() As Boolean
Dim tRecset As New ADODB.Recordset, mCanAddNew As Boolean

AddNewHdr = False
mCanAddNew = True
If Chk_ActiveItem() = False Then
    ErrorBox "clsProduct_AddNewHdr_#1156_[InActive " & mTitleName & " Entry]"
    Exit Function
End If

tRecset.open "Select ItmName from ProdMast where ItmName='" & mItmName_str & "'", m_dbStDatabase, adOpenKeyset, adLockOptimistic
If tRecset.EOF = False Then
    mCanAddNew = False
    ErrorBox "Duplicate Name !!!"
End If
CloseTable tRecset

On Error GoTo errhand
mItmCode_lng = 0
If mCanAddNew = True Then
    m_dbStDatabase.BeginTrans
    With tRecset
    .open "Select * from ProdMast where ItmCode=0.1", m_dbStDatabase, adOpenKeyset, adLockOptimistic
    .AddNew
    Rem .Fields("ItmCode") = mItmCode_lng
    .fields("ItmName") = mItmName_str
    .fields("ItmDesc") = mItmDesc_str
    .fields("ItmRecState") = cREC_ADDED
    .Update
    mItmCode_lng = .fields("ItmCode")
    Rem aItemTran(mActiveItem) = mItmCode_lng   dated 08-06-2014
    End With
    CloseTable tRecset
    m_dbStDatabase.CommitTrans
End If
AddNewHdr = True
Exit Function

errhand:
MsgBox Err.Description
m_dbStDatabase.Cancel
CloseTable tRecset, mCheckOpen:=True
Exit Function

End Function

Public Function AddNewDtl(ByVal mItmCode As Long, Optional ByVal mStkCode As Long = cOPSTKCODE) As Boolean
Dim tRecset As New ADODB.Recordset, mCanAddNew As Boolean, acount As Integer, mLCount As Integer, mUCount As Integer, mStkSno As Integer

AddNewDtl = False
mCanAddNew = True
If Chk_ActiveItem() = False And IIf(ActiveItmCode > 0, mItmCode = ActiveItmCode, False) Then
    ErrorBox "clsProduct_AddNewDtl_#1201_[InActive " & mTitleName & " Entry]"
    Exit Function
End If

On Error GoTo errhand
If mCanAddNew = True Then
    m_dbStDatabase.BeginTrans
    Rem updating ProdRef
    tRecset.open "Select * from ProdRef where ItrStkCode=" & CStr(mStkCode) & " and ItrItmCode=" & CStr(mItmCode) & " order by ItrRefCode", m_dbStDatabase, adOpenKeyset, adLockOptimistic
    If tRecset.RecordCount > 0 Then
        #If cMULTIITEMREF = False Then
            ErrorBox "clsProduct_AddNewDtl_#1213_[Unexpected Records]"
        #End If
    End If
    With adtlProdRef
    mLCount = LBound(.ItrRefCode)
    mUCount = UBound(.ItrRefCode)
    For acount = mLCount To mUCount
        Rem we will find added record only in addnew
        If .ItrRecState(acount) = cREC_ADDED Then     ' newly added
            tRecset.AddNew
            Rem .Fields("ItrRefCode") = AutoNumber
            tRecset.fields("ItrItmCode") = mItmCode
            tRecset.fields("ItrStkCode") = .ItrStkCode(acount)
            tRecset.fields("ItrStkICode") = .ItrStkICode(acount)
            tRecset.fields("ItrRef1Name") = .ItrRef1Name(acount)
            tRecset.fields("ItrRef2Name") = .ItrRef2Name(acount)
            tRecset.fields("ItrPRate") = .ItrPRate(acount)
            tRecset.fields("ItrMRP") = .ItrMRP(acount)
            tRecset.fields("ItrSRate") = .ItrSRate(acount)
            tRecset.fields("ItrRecState") = cREC_ADDED
            tRecset.Update
            
            .ItrRefCode(acount) = tRecset.fields("ItrRefCode")
            adtlOpnStock.StkItmRefCode(acount) = tRecset.fields("ItrRefCode")
        ElseIf .ItrRecState(acount) = cREC_EDITED Then      ' edit mode
            ErrorBox "clsProduct_AddNewDtl_#1236_[Unexpected Record Mode]"
        ElseIf .ItrRecState(acount) = cREC_DELETED Then      ' existing rec deleted
            ErrorBox "clsProduct_AddNewDtl_#1238_[Unexpected Record Mode]"
        ElseIf .ItrRecState(acount) = cREC_CANCELED Then      ' newly added rec deleted
            Rem may occur
        ElseIf .ItrRecState(acount) = cREC_UNCHANGED Then      ' existing rec unchanged
            ErrorBox "clsProduct_AddNewDtl_#1242_[Unexpected Record Mode]"
        Else  ' unknown
            ErrorBox "clsProduct_AddNewDtl_#1244_[Invalid Record Mode]"
            Rem Err.Raise Number:=vbObjectError + 513, Description:="clsProduct_AddNewDtl_1063"
        End If
    Next acount
    End With
    CloseTable tRecset
    
    Rem updating opening stock
    tRecset.open "Select * from StockJrn where StkCode=" & CStr(mStkCode) & " and StkItmCode=" & CStr(mItmCode) & " order by StkICode", m_dbStDatabase, adOpenKeyset, adLockOptimistic
    If tRecset.RecordCount > 0 Then
        #If cMULTIITEMREF = False Then
            ErrorBox "clsProduct_AddNewDtl_#1255_[Unexpected Records]"
        #End If
    End If
    
    With adtlOpnStock
    mLCount = LBound(.StkICode)
    mUCount = UBound(.StkICode)
    For acount = mLCount To mUCount
        If .StkRecState(acount) = cREC_ADDED Then     ' newly added. we will find added record only in addnew
            mStkSno = GetNextSeqno(m_dbStDatabase, "StockJrn", "StkSno", "StkCode=" & CStr(mStkCode) & "")
            
            tRecset.AddNew
            Rem tRecset.Fields("StkICode") = AutoNumber
            tRecset.fields("StkCode") = .StkCode(acount)
            tRecset.fields("StkSno") = mStkSno
            tRecset.fields("StkVtmCode") = 0
            tRecset.fields("StkPrefix") = ""
            tRecset.fields("StkVchNo") = 0
            tRecset.fields("StkPostfix") = ""
            tRecset.fields("StkDate") = (sCmpBookStartDate - 1)
            tRecset.fields("StkItmCode") = mItmCode
            tRecset.fields("StkItmRefCode") = .StkItmRefCode(acount)
            tRecset.fields("StkQty") = .StkQty(acount)
            tRecset.fields("StkRate") = .StkRate(acount)
            tRecset.fields("StkValue") = .StkValue(acount)
            tRecset.fields("StkNarr") = ""
            tRecset.fields("StkAutoGen") = True
            tRecset.fields("StkCmpCode") = 0
            tRecset.fields("StkRecState") = cREC_ADDED
            tRecset.Update
            
            adtlProdRef.ItrStkICode(acount) = tRecset.fields("StkICode")
            adtlProdRef.ItrStkCode(acount) = tRecset.fields("StkCode")
        ElseIf .StkRecState(acount) = cREC_EDITED Then      ' edit mode
            ErrorBox "clsProduct_AddNewDtl_#1289_[Unexpected Record Mode]"
        ElseIf .StkRecState(acount) = cREC_DELETED Then      ' existing rec deleted
            ErrorBox "clsProduct_AddNewDtl_#1291_[Unexpected Record Mode]"
        ElseIf .StkRecState(acount) = cREC_CANCELED Then      ' newly added rec deleted
            Rem may occur
        ElseIf .StkRecState(acount) = cREC_UNCHANGED Then      ' existing rec unchanged
            ErrorBox "clsProduct_AddNewDtl_#1295_[Unexpected Record Mode]"
        Else  ' error/mistake
            ErrorBox "clsProduct_AddNewDtl_#1297_[Invalid Record Mode]"
        End If
    Next acount
    End With
    CloseTable tRecset
    
    Rem updating ProdRef StkICode
    tRecset.open "Select * from ProdRef where ItrStkCode=" & CStr(mStkCode) & " and ItrItmCode=" & CStr(mItmCode) & " order by ItrRefCode", m_dbStDatabase, adOpenKeyset, adLockOptimistic
    If tRecset.RecordCount = 0 Then
        #If cMULTIITEMREF = False Then
            ErrorBox "clsProduct_AddNewDtl_#1307_[Record not Found]"
        #End If
    End If
    With adtlProdRef
    mLCount = LBound(.ItrRefCode)
    mUCount = UBound(.ItrRefCode)
    For acount = mLCount To mUCount
        Rem we will find added record only in addnew
        If .ItrRecState(acount) = cREC_ADDED Then     ' newly added
            tRecset.Find "ItrRefCode=" & CStr(.ItrRefCode(acount)), Start:=1
            
            tRecset.fields("ItrStkCode") = .ItrStkCode(acount)
            tRecset.fields("ItrStkICode") = .ItrStkICode(acount)
            tRecset.Update
        ElseIf .ItrRecState(acount) = cREC_EDITED Then      ' edit mode
            ErrorBox "clsProduct_AddNewDtl_#1322_[Unexpected Record Mode]"
        ElseIf .ItrRecState(acount) = cREC_DELETED Then      ' existing rec deleted
            ErrorBox "clsProduct_AddNewDtl_#1324_[Unexpected Record Mode]"
        ElseIf .ItrRecState(acount) = cREC_CANCELED Then      ' newly added rec deleted
            Rem may occur
        ElseIf .ItrRecState(acount) = cREC_UNCHANGED Then      ' existing rec unchanged
            ErrorBox "clsProduct_AddNewDtl_#1328_[Unexpected Record Mode]"
        Else  ' unknown
            ErrorBox "clsProduct_AddNewDtl_#1330_[Invalid Record Mode]"
            Rem Err.Raise Number:=vbObjectError + 513, Description:="clsProduct_AddNewDtl_1063"
        End If
    Next acount
    End With
    CloseTable tRecset
    m_dbStDatabase.CommitTrans
End If

AddNewDtl = True
Exit Function

errhand:
MsgBox Err.Description
m_dbStDatabase.Cancel
CloseTable tRecset, mCheckOpen:=True
Exit Function

End Function

Public Function UpdateHdr(ByVal mItmCode As Long) As Boolean
Dim tRecset As New ADODB.Recordset, mCanUpdate As Boolean

UpdateHdr = False
mCanUpdate = True
If Chk_ActiveItem() = False Or mItmCode <> ActiveItmCode Then
    ErrorBox "clsProduct_UpdateHdr_#1357_[InActive " & mTitleName & " Entry]"
    Exit Function
End If

tRecset.open "Select ItmName from ProdMast where ItmName='" & mItmName_str & "' and ItmCode<>" & CStr(mItmCode) & "", m_dbStDatabase, adOpenKeyset, adLockOptimistic
If tRecset.EOF = False Then
    mCanUpdate = False
    ErrorBox "Duplicate Name !!!"
End If
CloseTable tRecset

On Error GoTo errhand
mItmCode_lng = 0
If mCanUpdate = True Then
    m_dbStDatabase.BeginTrans
    With tRecset
    .open "Select * from ProdMast where ItmCode=" & CStr(mItmCode) & "", m_dbStDatabase, adOpenKeyset, adLockOptimistic
    
    .fields("ItmName") = mItmName_str
    .fields("ItmDesc") = mItmDesc_str
    .fields("ItmRecState") = ChkEditRecStatus(.fields("ItmRecState"))
    .Update
    mItmCode_lng = .fields("ItmCode")
    End With
    CloseTable tRecset
    m_dbStDatabase.CommitTrans
End If
UpdateHdr = True
Exit Function

errhand:
MsgBox Err.Description
m_dbStDatabase.Cancel
CloseTable tRecset, mCheckOpen:=True

End Function

Public Function UpdateDtl(ByVal mItmCode As Long, Optional ByVal mStkCode As Long = cOPSTKCODE) As Boolean
Dim tRecset As New ADODB.Recordset, mCanUpdate As Boolean, mLCount As Integer, mUCount As Integer, acount As Integer, mStkSno As Integer

UpdateDtl = False
mCanUpdate = True
If Chk_ActiveItem() = False Or mItmCode <> ActiveItmCode Then
    ErrorBox "clsProduct_UpdateDtl_#1192_[InActive " & mTitleName & " Entry]"
    Exit Function
End If

On Error GoTo errhand
If mCanUpdate = True Then
    m_dbStDatabase.BeginTrans
    Rem Updating ProdRef
    tRecset.open "Select * from ProdRef where ItrStkCode=" & CStr(mStkCode) & " and ItrItmCode=" & CStr(mItmCode) & " order by ItrRefCode", m_dbStDatabase, adOpenKeyset, adLockOptimistic
    If tRecset.RecordCount = 0 Then
        #If cMULTIITEMREF = False Then
            ErrorBox "clsProduct_UpdateDtl_#1209_[Record not found]"
        #End If
    End If
    With adtlProdRef
    mLCount = LBound(.ItrRefCode)
    mUCount = UBound(.ItrRefCode)
    For acount = mLCount To mUCount
        If .ItrRecState(acount) = cREC_ADDED Then     ' newly added
            tRecset.AddNew
            Rem tRecset.Fields("ItrRefCode") = AutoNumber
            tRecset.fields("ItrItmCode") = mItmCode
            tRecset.fields("ItrStkCode") = .ItrStkCode(acount)
            tRecset.fields("ItrStkICode") = .ItrStkICode(acount)
            tRecset.fields("ItrRef1Name") = .ItrRef1Name(acount)
            tRecset.fields("ItrRef2Name") = .ItrRef2Name(acount)
            tRecset.fields("ItrPRate") = .ItrPRate(acount)
            tRecset.fields("ItrMRP") = .ItrMRP(acount)
            tRecset.fields("ItrSRate") = .ItrSRate(acount)
            tRecset.fields("ItrRecState") = cREC_ADDED
            tRecset.Update
            
            .ItrRefCode(acount) = tRecset.fields("ItrRefCode")
            adtlOpnStock.StkItmRefCode(acount) = tRecset.fields("ItrRefCode")
        ElseIf .ItrRecState(acount) = cREC_EDITED Then      ' edit mode
            MoveRecToFirst tRecset
            tRecset.Find "ItrRefCode=" & CStr(.ItrRefCode(acount)), Start:=1
            If tRecset.EOF = False Then
                Rem tRecset.Fields("ItrRefCode") = AutoNumber
                Rem tRecset.Fields("ItrItmCode") = mItmCode
                Rem tRecset.Fields("ItrStkCode") = .ItrStkCode(acount)
                Rem tRecset.Fields("ItrStkICode") = .ItrStkICode(acount)
                tRecset.fields("ItrRef1Name") = .ItrRef1Name(acount)
                tRecset.fields("ItrRef2Name") = .ItrRef2Name(acount)
                tRecset.fields("ItrPRate") = .ItrPRate(acount)
                tRecset.fields("ItrMRP") = .ItrMRP(acount)
                tRecset.fields("ItrSRate") = .ItrSRate(acount)
                tRecset.fields("ItrRecState") = ChkEditRecStatus(tRecset.fields("ItrRecState"))
                tRecset.Update
            Else
                ErrorBox "clsProduct_UpdateDtl_#1244_[Record not Found]"
            End If
        ElseIf .ItrRecState(acount) = cREC_DELETED Or .ItrRecState(acount) = cREC_CANCELED Then      ' existing rec deleted/canceled
            MoveRecToFirst tRecset
            tRecset.Find "ItrRefCode=" & CStr(.ItrRefCode(acount)), Start:=1
            If tRecset.EOF = False Then
                Rem marking for deletion from ProdRef table
                tRecset.fields("ItrRecState") = ChkDeleteRecStatus(tRecset.fields("ItrRecState"))
                tRecset.Update
            Else
                If .ItrRecState(acount) = cREC_DELETED Then     ' .ItrRecState(acount) = cREC_CANCELED in case of Multiple batches if detail entry saved online
                    ErrorBox "clsProduct_UpdateDtl_#1255_[Record not Found]"
                End If
            End If
        ElseIf .ItrRecState(acount) = cREC_UNCHANGED Then      ' existing rec unchanged
            MoveRecToFirst tRecset
            tRecset.Find "ItrRefCode=" & CStr(.ItrRefCode(acount)), Start:=1
            If tRecset.EOF = False Then
                Rem no change required
            Else
                ErrorBox "clsProduct_UpdateDtl_#1264_[Record not Found]"
            End If
        Else  ' error/mistake
            ErrorBox "clsProduct_UpdateDtl_#1267_[Invalid Record Mode]"
        End If
    Next acount
    End With
    CloseTable tRecset
    
    Rem updating opening stock
    tRecset.open "Select * from StockJrn where StkCode=" & CStr(mStkCode) & " and StkItmCode=" & CStr(mItmCode) & " order by StkICode", m_dbStDatabase, adOpenKeyset, adLockOptimistic
    If tRecset.RecordCount = 0 Then
        #If cMULTIITEMREF = False Then
            ErrorBox "clsProduct_UpdateDtl_#1279_[Record not Found]"
        #End If
    End If
    
    With adtlOpnStock
    mLCount = LBound(.StkICode)
    mUCount = UBound(.StkICode)
    For acount = mLCount To mUCount
        If .StkRecState(acount) = cREC_ADDED Then     ' newly added. we will find added record only in addnew
            mStkSno = GetNextSeqno(m_dbStDatabase, "StockJrn", "StkSno", "StkCode=" & CStr(mStkCode) & "")
            
            tRecset.AddNew
            Rem tRecset.Fields("StkICode") = AutoNumber
            tRecset.fields("StkCode") = .StkCode(acount)
            tRecset.fields("StkSno") = mStkSno
            tRecset.fields("StkVtmCode") = 0
            tRecset.fields("StkPrefix") = ""
            tRecset.fields("StkVchNo") = 0
            tRecset.fields("StkPostfix") = ""
            tRecset.fields("StkDate") = (sCmpBookStartDate - 1)
            tRecset.fields("StkItmCode") = mItmCode
            tRecset.fields("StkItmRefCode") = .StkItmRefCode(acount)
            tRecset.fields("StkQty") = .StkQty(acount)
            tRecset.fields("StkRate") = .StkRate(acount)
            tRecset.fields("StkValue") = .StkValue(acount)
            tRecset.fields("StkAutoGen") = True
            tRecset.fields("StkCmpCode") = 0
            tRecset.fields("StkRecState") = cREC_ADDED
            tRecset.Update
            
            adtlProdRef.ItrStkICode(acount) = tRecset.fields("StkICode")
            adtlProdRef.ItrStkCode(acount) = tRecset.fields("StkCode")
        ElseIf .StkRecState(acount) = cREC_EDITED Then      ' edit mode
            MoveRecToFirst tRecset
            tRecset.Find "StkICode=" & CStr(.StkICode(acount)), Start:=1
            If tRecset.EOF = False Then
                Rem tRecset.Fields("StkICode") = AutoNumber
                Rem tRecset.Fields("StkCode") = .StkCode(acount)
                Rem tRecset.Fields("StkSno") = mStkSno
                Rem tRecset.Fields("StkDate") = (sCmpBookStartDate - 1)
                Rem tRecset.Fields("StkItmCode") = mItmCode
                Rem tRecset.Fields("StkItmRefCode") = .StkItmRefCode(acount)
                tRecset.fields("StkQty") = .StkQty(acount)
                tRecset.fields("StkRate") = .StkRate(acount)
                tRecset.fields("StkValue") = .StkValue(acount)
                tRecset.fields("StkRecState") = ChkEditRecStatus(tRecset.fields("StkRecState"))
                tRecset.Update
            Else
                ErrorBox "clsProduct_UpdateDtl_#1327_[Record not Found]"
            End If
        ElseIf .StkRecState(acount) = cREC_DELETED Or .StkRecState(acount) = cREC_CANCELED Then      ' existing rec deleted or new rec canceled
            MoveRecToFirst tRecset
            tRecset.Find "StkICode=" & CStr(.StkICode(acount)), Start:=1
            If tRecset.EOF = False Then
                tRecset.fields("StkRecState") = ChkDeleteRecStatus(tRecset.fields("StkRecState"))
                tRecset.Update
            Else
                If .StkRecState(acount) = cREC_DELETED Then
                    ErrorBox "clsProduct_UpdateDtl_#1337_[Record not Found]"
                End If
            End If
        ElseIf .StkRecState(acount) = cREC_UNCHANGED Then      ' existing rec unchanged
            MoveRecToFirst tRecset
            tRecset.Find "StkICode=" & CStr(.StkICode(acount)), Start:=1
            If tRecset.EOF = False Then
                Rem nochange required
            Else
                ErrorBox "clsProduct_UpdateDtl_#1346_[Record not Found]"
            End If
        Else  ' error/mistake
            ErrorBox "clsProduct_UpdateDtl_#1279_[Unexpected Record Mode]"
        End If
    Next acount
    End With
    CloseTable tRecset
    
    Rem Updating ProdRef CrossRef StkCode and StkICode fields
    tRecset.open "Select * from ProdRef where ItrStkCode=" & CStr(mStkCode) & " and ItrItmCode=" & CStr(mItmCode) & " order by ItrRefCode", m_dbStDatabase, adOpenKeyset, adLockOptimistic
    If tRecset.RecordCount = 0 Then
        #If cMULTIITEMREF = False Then
            ErrorBox "clsProduct_UpdateDtl_#1361_[Record not Found]"
        #End If
    End If
    With adtlProdRef
    mLCount = LBound(.ItrRefCode)
    mUCount = UBound(.ItrRefCode)
    For acount = mLCount To mUCount
        If .ItrRecState(acount) = cREC_ADDED Then     ' newly added
            tRecset.Find "ItrRefCode=" & CStr(.ItrRefCode(acount)), Start:=1
            
            tRecset.fields("ItrStkCode") = .ItrStkCode(acount)
            tRecset.fields("ItrStkICode") = .ItrStkICode(acount)
            tRecset.Update
        ElseIf .ItrRecState(acount) = cREC_EDITED Then      ' edit mode
            Rem no action
        ElseIf .ItrRecState(acount) = cREC_DELETED Or .ItrRecState(acount) = cREC_CANCELED Then      ' existing rec deleted/canceled
            Rem no action
        ElseIf .ItrRecState(acount) = cREC_UNCHANGED Then      ' existing rec unchanged
            Rem no action
        Else  ' error/mistake
            ErrorBox "clsProduct_UpdateDtl_#1381_[Unexpected Record Mode]"
        End If
    Next acount
    End With
    CloseTable tRecset
    m_dbStDatabase.CommitTrans
End If
UpdateDtl = True
Exit Function

errhand:
MsgBox Err.Description
m_dbStDatabase.Cancel

End Function

Public Function CanDeleteItem(ByVal mItmCode As Long, Optional ByVal mSkipConfirm As Boolean = False, Optional mSkipDependency As Boolean = False) As Boolean
Dim mDeleteit As Boolean

mDeleteit = True

If ChkEntryExist(mItmCode) = True Then
    ErrorBox "Entry Exist !!!"
    mDeleteit = False
ElseIf mSkipDependency = False Then
    If ChkDependencyExist(mItmCode) = True Then
        ErrorBox "Dependency Exist !!!"
        mDeleteit = False
    End If
End If
If mDeleteit = True And mSkipConfirm = False Then
    mDeleteit = CanDelete()
End If

CanDeleteItem = mDeleteit

End Function

Rem returns wheather item code or item reference is having any transaction
Public Function ChkEntryExist(ByVal mAltCode As Long, Optional ByVal mRefItem As Boolean = False, Optional ByVal mStkCode As Long = cOPSTKCODE) As Boolean
Dim tRecset As New ADODB.Recordset

With tRecset
If mRefItem = False Then
    .open "Select * from StockJrn where StkItmCode=" & CStr(mAltCode) & " and StkCode <> " & CStr(mStkCode) & "", m_dbStDatabase, adOpenKeyset, adLockReadOnly
Else
    .open "Select * from StockJrn where StkItmRefCode=" & CStr(mAltCode) & " and StkCode <> " & CStr(mStkCode) & "", m_dbStDatabase, adOpenKeyset, adLockReadOnly
End If
ChkEntryExist = (.RecordCount > 0)
End With
CloseTable tRecset

End Function

Public Function ChkDependencyExist(ByVal mItmCode As Long) As Boolean
Dim tRecset As New ADODB.Recordset

With tRecset
.open "Select * from ProdMast where ItmCode = " & CStr(mItmCode) & " and ItmDepends = 0" & "", m_dbStDatabase, adOpenKeyset, adLockReadOnly
ChkDependencyExist = (.RecordCount = 0)
End With
CloseTable tRecset

End Function

Rem updates transacted qty to group item summation
Public Sub UpdateGrpQtySum(ByVal mItmCode As Long, ByVal mItmRefCode As Long, ByVal mTargetQty As Double, ByVal mOldQty As Double, ByVal mAddBal As Boolean, ByVal mDate As Date)
Dim tRecset As New ADODB.Recordset, gProdSumRS As New ADODB.Recordset
Dim mCanUpdate As Boolean

mCanUpdate = True

On Error GoTo errhand
If mCanUpdate = True Then
    m_dbGrpDatabase.BeginTrans
    With gProdSumRS
    .open "Select * from gProdSum where gpsItmRefCode=" & CStr(mItmRefCode) & " and gpsItmCode=" & CStr(mItmCode) & " and gpsDate=#" & CStr(ToSysDate(mDate)) & "#", m_dbGrpDatabase, adOpenKeyset, adLockOptimistic
    If .RecordCount > 0 Then
        If mAddBal = True Then
            .fields("gpsQty") = .fields("gpsQty") + mTargetQty - mOldQty
        Else
            .fields("gpsQty") = .fields("gpsQty") - mTargetQty
        End If
        .fields("gpsRecState") = ChkEditRecStatus(.fields("gpsRecState"))
        .Update
    Else
        If mAddBal = True Then
            .AddNew
            .fields("gpsDate") = mDate
            .fields("gpsItmCode") = mItmCode
            .fields("gpsItmRefCode") = mItmRefCode
            .fields("gpsQty") = mTargetQty
            .fields("gpsRecState") = cREC_ADDED
            .Update
        Else
            ErrorBox "clsProduct_UpdateQtyBal_1679"
        End If
    End If
    End With
    m_dbGrpDatabase.CommitTrans
    CloseTable gProdSumRS
    
End If

Exit Sub

errhand:
MsgBox Err.Description
m_dbStDatabase.Cancel
Exit Sub

End Sub

Public Sub Calc_Value()
mItmOpValue_dbl = (mItmOpQty_dbl * mItmOpRate_dbl)
mItmCurValue_dbl = (mItmCurQty_dbl * mItmCurAvgRate_dbl)

End Sub

Rem returns closing qty as on date for specified item
Public Function GetItmQtyAsOnDate(ByVal mItmCode As Long, ByVal mDate As Date) As Double
Dim mRtnval As Double, tRecset As New ADODB.Recordset

mRtnval = 0
With tRecset
.open "Select sum(gpsQty) as gpsQty_sum from gProdSum where gpsItmCode=" & CStr(mItmCode) & " and gpsDate<=#" & CStr(ToSysDate(mDate)) & "#", m_dbGrpDatabase, adOpenKeyset, adLockOptimistic
If .RecordCount > 0 Then
    mRtnval = .fields("gpsQty_sum")
End If
End With
CloseTable tRecset

GetItmQtyAsOnDate = mRtnval

End Function

Rem returns opening qty, avg.rate and value in array or string for specified item
Public Function GetItmOpnQtyRateValue(ByVal mItmCode As Long, Optional ByVal mIsRcSeperated As Boolean = False, Optional ByVal mStkCode As Long = cOPSTKCODE) As Variant
Dim aRtnval(0 To 1, 0 To 2) As Variant, tRecset As New ADODB.Recordset

aRtnval(0, 0) = 0 ' qty receipt/combined
aRtnval(0, 1) = 0 ' avg.rate receipt/combined
aRtnval(0, 2) = 0 ' value receipt/combined
aRtnval(1, 0) = 0 ' qty issue
aRtnval(1, 1) = 0 ' avg.rate issue
aRtnval(1, 2) = 0 ' value issue

With tRecset
If mIsRcSeperated = True Then
    .open "Select sum(iif(StkQty>0,StkQty,0)) as RcStkQty_sum, sum(iif(StkQty<0,StkQty,0)) as IsStkQty_sum, sum(iif(StkValue>0,StkValue,0)) as DrStkValue_sum, sum(iif(StkValue<0,StkValue,0)) as CrStkValue_sum from StockJrn where StkCode=" & CStr(mStkCode) & " and StkItmCode=" & CStr(mItmCode) & " and StkDate=#" & CStr(ToSysDate(sCmpBookStartDate - 1)) & "#", m_dbStDatabase, adOpenKeyset, adLockOptimistic
    If .RecordCount > 0 Then
        Rem plus stock
        aRtnval(0, 0) = .fields("RcStkQty_sum")
        If .fields("RcStkQty_sum") <> 0 And .fields("DrStkValue_sum") <> 0 Then
            aRtnval(0, 1) = .fields("DrStkValue_sum") / .fields("RcStkQty_sum")
        End If
        aRtnval(0, 2) = .fields("DrStkValue_sum")
        
        Rem minus stock
        aRtnval(1, 0) = .fields("IsStkQty_sum")
        If .fields("IsStkQty_sum") <> 0 And .fields("CrStkValue_sum") <> 0 Then
            aRtnval(1, 1) = .fields("CrStkValue_sum") / .fields("IsStkQty_sum")
        End If
        aRtnval(1, 2) = .fields("CrStkValue_sum")
    End If
Else
    .open "Select sum(StkQty) as StkQty_sum,sum(StkValue) as StkValue_sum from StockJrn group by StkCode,StkItmCode,StkDate having StkCode=" & CStr(mStkCode) & " and StkItmCode=" & CStr(mItmCode) & " and StkDate=#" & CStr(ToSysDate(sCmpBookStartDate - 1)) & "#", m_dbStDatabase, adOpenKeyset, adLockOptimistic
    If .RecordCount > 0 Then
        aRtnval(0, 0) = .fields("StkQty_sum")
        If .fields("StkQty_sum") <> 0 And .fields("StkValue_sum") <> 0 Then
            aRtnval(0, 1) = .fields("StkValue_sum") / .fields("StkQty_sum")
        End If
        aRtnval(0, 2) = .fields("StkValue_sum")
    End If
End If
End With
CloseTable tRecset

GetItmOpnQtyRateValue = aRtnval

End Function

Rem returns current qty, avg.rate and value as on date in array or string for specified item
Public Function GetItmCurQtyRateValue(ByVal mItmCode As Long, ByVal mDate As Date, Optional ByVal mIsRcSeperated As Boolean = False) As Variant
Dim aRtnval(0 To 1, 0 To 2) As Variant, tRecset As ADODB.Recordset

aRtnval(0, 0) = 0 ' qty receipt/combined
aRtnval(0, 1) = 0 ' avg.rate receipt/combined
aRtnval(0, 2) = 0 ' value receipt/combined
aRtnval(1, 0) = 0 ' qty issue
aRtnval(1, 1) = 0 ' avg.rate issue
aRtnval(1, 2) = 0 ' value issue

'''With tRecset
If mIsRcSeperated = True Then
    Set tRecset = m_dbGrpDatabase.Execute("Select sum(iif(GpsQty>0,GpsQty,0)) as RcGpsQty_sum, sum(iif(GpsQty<0,GpsQty,0)) as IsGpsQty_sum, sum(iif(GpsValue>0,GpsValue,0)) as DrGpsValue_sum, sum(iif(GpsValue<0,GpsValue,0)) as CrGpsValue_sum from gProdSum where GpsItmCode=" & CStr(mItmCode) & " and GpsDate<=#" & CStr(ToSysDate(mDate)) & "#")
    With tRecset
    If tRecset.EOF = False Then
        Rem plus stock
        aRtnval(0, 0) = .fields("RcGpsQty_sum")
        If .fields("RcGpsQty_sum") <> 0 And .fields("DrGpsValue_sum") <> 0 Then
            aRtnval(0, 1) = .fields("DrGpsValue_sum") / .fields("RcGpsQty_sum")
        End If
        aRtnval(0, 2) = .fields("DrGpsValue_sum")
        
        Rem minus stock
        aRtnval(1, 0) = .fields("IsGpsQty_sum")
        If .fields("IsGpsQty_sum") <> 0 And .fields("CrGpsValue_sum") <> 0 Then
            aRtnval(1, 1) = .fields("CrGpsValue_sum") / .fields("IsGpsQty_sum")
        End If
        aRtnval(1, 2) = .fields("CrGpsValue_sum")
    End If
    End With
    CloseTable tRecset
Else
    Set tRecset = m_dbGrpDatabase.Execute("Select sum(GpsQty) as GpsQty_sum,sum(GpsValue) as GpsValue_sum from gProdSum where GpsItmCode=" & CStr(mItmCode) & " and GpsDate<=#" & CStr(ToSysDate(mDate)) & "#")
    With tRecset
    If tRecset.EOF = False Then
        aRtnval(0, 0) = .fields("GpsQty_sum")
        If .fields("GpsQty_sum") <> 0 And .fields("GpsValue_sum") <> 0 Then
            aRtnval(0, 1) = .fields("GpsValue_sum") / .fields("GpsQty_sum")
        End If
        aRtnval(0, 2) = .fields("GpsValue_sum")
    End If
    End With
    CloseTable tRecset
End If
'''End With

GetItmCurQtyRateValue = aRtnval

End Function

Rem returns current qty, avg.rate and value as on date in array or string for all item
Public Function GetAllItmCurQtyRateValue(ByVal mDate As Date, Optional ByVal mIsRcSeperated As Boolean = False) As Variant
Dim aRtnval(0 To 1, 0 To 2) As Variant, tRecset As New ADODB.Recordset

aRtnval(0, 0) = 0 ' qty receipt/combined
aRtnval(0, 1) = 0 ' avg.rate receipt/combined
aRtnval(0, 2) = 0 ' value receipt/combined
aRtnval(1, 0) = 0 ' qty issue
aRtnval(1, 1) = 0 ' avg.rate issue
aRtnval(1, 2) = 0 ' value issue

With tRecset
.open "Select GpsDate from gProdSum where GpsDate<=#" & CStr(ToSysDate(mDate)) & "#", m_dbGrpDatabase, adOpenKeyset, adLockOptimistic
If .RecordCount > 0 Then
    .Close
    If mIsRcSeperated = True Then
        .open "Select sum(iif(GpsQty>0,GpsQty,0)) as RcGpsQty_sum, sum(iif(GpsQty<0,GpsQty,0)) as IsGpsQty_sum, sum(iif(GpsValue>0,GpsValue,0)) as DrGpsValue_sum, sum(iif(GpsValue<0,GpsValue,0)) as CrGpsValue_sum from gProdSum where GpsDate<=#" & CStr(ToSysDate(mDate)) & "#", m_dbGrpDatabase, adOpenKeyset, adLockOptimistic
        If tRecset.RecordCount > 0 Then
            Rem plus stock
            aRtnval(0, 0) = .fields("RcGpsQty_sum")
            If .fields("RcGpsQty_sum") <> 0 And .fields("DrGpsValue_sum") <> 0 Then
                aRtnval(0, 1) = .fields("DrGpsValue_sum") / .fields("RcGpsQty_sum")
            End If
            aRtnval(0, 2) = .fields("DrGpsValue_sum")
            
            Rem minus stock
            aRtnval(1, 0) = .fields("IsGpsQty_sum")
            If .fields("IsGpsQty_sum") <> 0 And .fields("CrGpsValue_sum") <> 0 Then
                aRtnval(1, 1) = .fields("CrGpsValue_sum") / .fields("IsGpsQty_sum")
            End If
            aRtnval(1, 2) = .fields("CrGpsValue_sum")
        End If
    Else
        .open "Select sum(GpsQty) as GpsQty_sum,sum(GpsValue) as GpsValue_sum from gProdSum where GpsDate<=#" & CStr(ToSysDate(mDate)) & "#", m_dbGrpDatabase, adOpenKeyset, adLockOptimistic
        If tRecset.RecordCount > 0 Then
            aRtnval(0, 0) = .fields("GpsQty_sum")
            If .fields("GpsQty_sum") <> 0 And .fields("GpsValue_sum") <> 0 Then
                aRtnval(0, 1) = .fields("GpsValue_sum") / .fields("GpsQty_sum")
            End If
            aRtnval(0, 2) = .fields("GpsValue_sum")
        End If
    End If
End If
End With
CloseTable tRecset

GetAllItmCurQtyRateValue = aRtnval

End Function

Rem returns an array containing item reference and closing qty as on date for specified item
Public Function GetItmQtyAryAsOnDate(ByVal mItmCode As Long, ByVal mDate As Date) As Variant
Dim tRecset As New ADODB.Recordset
Dim aItmQtyList As Variant, aItmRefList As Variant, aQtyList As Variant, aCnt As Long

aItmRefList = Array()
aQtyList = Array()
aItmQtyList = Array()

With tRecset
.open "Select ItmRefCode,sum(gpsQty) as gpsQty_sum from gProdSum where gpsItmCode=" & CStr(mItmCode) & " and gpsDate<=#" & CStr(ToSysDate(mDate)) & "# group by ItmRefCode order by ItmRefCode", m_dbGrpDatabase, adOpenKeyset, adLockOptimistic
If .RecordCount > 0 Then
Do While .EOF = False
    AddToArray aItmRefList, .fields("ItmRefCode")
    AddToArray aQtyList, .fields("gpsQty_sum")
    
    .MoveNext
Loop
End If
End With
CloseTable tRecset

If ALen(aItmRefList) > 0 Then
    ReDim aItmQtyList(LBound(aItmRefList) To UBound(aItmRefList), 0 To 1)
    For aCnt = LBound(aItmRefList) To UBound(aItmRefList)
        aItmQtyList(aCnt, 0) = aItmRefList(aCnt)
        aItmQtyList(aCnt, 1) = aQtyList(aCnt)
    Next aCnt
End If

GetItmQtyAryAsOnDate = aItmQtyList

End Function

Rem returns closing qty as on date for a particular item reference
Public Function GetItmRefQtyAsOnDate(ByVal mItmCode As Long, ByVal mItmRefCode As Long, ByVal mDate As Date) As Double
Dim mRtnval As Double, tRecset As New ADODB.Recordset

mRtnval = 0
With tRecset
.open "Select sum(gpsQty) as gpsQty_sum from gProdSum where gpsItmRefCode=" & CStr(mItmRefCode) & " and gpsItmCode=" & CStr(mItmCode) & " and gpsDate<=#" & CStr(ToSysDate(mDate)) & "#", m_dbGrpDatabase, adOpenKeyset, adLockOptimistic
If .RecordCount > 0 Then
    mRtnval = .fields("gpsQty_sum")
End If
End With
CloseTable tRecset

GetItmRefQtyAsOnDate = mRtnval

End Function

Rem returns item rate for specified item code and item reference
Public Function GetItmValueRate(ByVal mItmCode As Long, ByVal mItmRefCode As Long) As Double
Dim mRtnval As Double, mItmName As String, tRecset As New ADODB.Recordset

mRtnval = 0
With tRecset
.open "Select * from ProdRef where ItrRefCode=" & CStr(mItmRefCode) & " and ItrItmCode=" & CStr(mItmCode) & "", m_dbStDatabase, adOpenKeyset, adLockOptimistic
If .EOF = False Then
    mRtnval = .fields("ItrPRate")
Else
    mItmName = GetItmName(mItmCode)
    ErrorBox "clsProduct_GetItmValueRate_1453"
End If
End With
CloseTable tRecset

GetItmValueRate = mRtnval

End Function

Rem returns item name for either item code or item reference
Public Function GetItmName(ByVal mAltCode As Long, Optional ByVal mRefItem As Boolean = False) As String
Dim tRecset As New ADODB.Recordset, t1Recset As New ADODB.Recordset, mRtnval As String

mRtnval = ""
With tRecset
If mRefItem = False Then
    .open "Select * from ProdMast where ItmCode=" & CStr(mAltCode) & "", m_dbStDatabase, adOpenKeyset, adLockOptimistic
Else
    t1Recset.open "Select * from ProdRef where ItrRefCode=" & CStr(mAltCode) & "", m_dbStDatabase, adOpenKeyset, adLockOptimistic
    If t1Recset.RecordCount > 0 Then
        .open "Select * from ProdMast where ItmCode=" & CStr(t1Recset.fields("ItrItmCode")) & "", m_dbStDatabase, adOpenKeyset, adLockOptimistic
    Else
        .open "Select * from ProdMast where ItmCode=" & CStr(0.1) & "", m_dbStDatabase, adOpenKeyset, adLockOptimistic
    End If
    CloseTable t1Recset
End If
If .RecordCount > 0 Then
    mRtnval = .fields("ItmName")
End If
End With
CloseTable tRecset
GetItmName = mRtnval

End Function

Rem returns the item code for specified item reference
Public Function GetItmCode(ByVal mItmRefCode As Long) As Long
Dim tRecset As New ADODB.Recordset, mRtnval As Long
mRtnval = 0
With tRecset
.open "Select * from ProdRef where ItrRefCode = " & CStr(mItmRefCode) & "", m_dbStDatabase, adOpenKeyset, adLockOptimistic
If .RecordCount > 0 Then
    mRtnval = .fields("ItrItmCode")
End If
CloseTable tRecset
End With

GetItmCode = mRtnval

End Function

Public Sub UpdateDependency(ByVal mItmCode As Long, ByVal mAddCount As Boolean)
Dim tRecset As New ADODB.Recordset

m_dbStDatabase.BeginTrans
With tRecset
.open "Select * from ProdMast where ItmCode = " & CStr(mItmCode) & "", m_dbStDatabase, adOpenKeyset, adLockOptimistic
If .RecordCount > 0 Then
    .fields("ItmDepends") = .fields("ItmDepends") + IIf(mAddCount = True, 1, -1)
    .Update
Else
    ErrorBox "clsProduct_UpdateDependency_1760_[Record Not Found]"
End If
End With
m_dbStDatabase.CommitTrans
CloseTable tRecset

End Sub

