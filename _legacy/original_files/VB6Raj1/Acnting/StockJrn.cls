VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "clsStockJrn"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False

Option Explicit

Dim mCrashedEntry As Boolean
Dim m_dbStDatabase As ADODB.Connection, m_dbGrpDatabase As ADODB.Connection
Dim mClassUIdCode As Long, mClassUIdFileName As String, mClassAcsPermFileName As String

Public mShrCode_lng As Long, mShrVtmCode_lng As Long, mShrPrefix_str As String, mShrVchNo_lng As Long, mShrPostfix_str As String, mShrDate_dt As Date, mShrQty_dbl As Double, mShrValue_dbl As Double, mShrNarr_str As String, mShrAutoGen_bln As Boolean, mShrCmpCode_int As Integer, mShrRecState_int As Integer
Rem new header fields mShrVtmCode_lng, mShrPrefix_str, mShrVchNo_lng, mShrPostfix_str, mShrAutoGen_bln, mShrCmpCode_int

Public mStkCode_lng As Long, mStkICode_lng As Long, mStkSno_int As Integer, mStkVtmCode_lng As Long, mStkPrefix_str As String, mStkVchNo_lng As Long, mStkPostfix_str As String, mStkDate_dt As Date, mStkItmCode_lng As Long, mStkItmRefCode_lng As Long, mStkItmRef1Name_str As String, mStkItmRef2Name_str As String, mStkQty_dbl As Double, mStkRate_dbl As Double, mStkValue_dbl As Double, mStkNarr_str As String, mStkLItmCode_lng As Long, mStkAutoGen_bln As Boolean, mStkCmpCode_int As Integer, mStkRecState_int As Integer
Public mItrPRate_dbl As Double, mItrMRP_dbl As Double, mItrSRate_dbl As Double
Rem new deatail field mStkVtmCode_lng, mStkPrefix_str, mStkVchNo_lng, mStkPostfix_str, mStkAutoGen_bln, mStkCmpCode_int

Public clsIT As clsProduct
Dim mActiveStock As Integer, aStockTran() As Variant, mTitleName As String

Public Property Set dbStDatabase(ByRef db As ADODB.Connection)
Set m_dbStDatabase = db

If clsIT Is Nothing Then
    Set clsIT = New clsProduct
End If
Set clsIT.dbStDatabase = db

End Property

Public Property Set dbGrpDatabase(ByRef db As ADODB.Connection)
Set m_dbGrpDatabase = db
If clsIT Is Nothing Then
    Set clsIT = New clsProduct
End If
Set clsIT.dbGrpDatabase = db

End Property

Private Sub Class_Initialize()
mTitleName = "Stock Journal"
aStockTran = Array()
mActiveStock = UBound(aStockTran)

mClassUIdFileName = "clsStockJrn.UId"
mClassAcsPermFileName = "clsStockJrn.Acp"
mClassUIdCode = GetUIdCode("clsStockJrn_Initialize", mUIdFileName:=mClassUIdFileName, mAcsPermFileName:=mClassAcsPermFileName)
If mClassUIdCode = 0 Then
    ErrorBox cSYSBUSY_ACS_DENIED
End If

End Sub

Public Sub GetHdrData(ByVal mShrCode As Long)
Dim tRecset As New ADODB.Recordset

Me.ClearHdr

With tRecset
.open "Select * from StockHdr where ShrCode=" & CStr(mShrCode) & "", m_dbStDatabase, adOpenKeyset, adLockOptimistic
If .RecordCount > 0 Then
    mShrCode_lng = .fields("ShrCode")
    mShrVtmCode_lng = .fields("ShrVtmCode")
    mShrPrefix_str = .fields("ShrPrefix")
    mShrVchNo_lng = .fields("ShrVchNo")
    mShrPostfix_str = .fields("ShrPostfix")
    mShrDate_dt = .fields("ShrDate")
    mShrQty_dbl = .fields("ShrQty")
    mShrValue_dbl = .fields("ShrValue")
    mShrNarr_str = .fields("ShrNarr")
    mShrAutoGen_bln = .fields("ShrAutoGen")
    mShrCmpCode_int = .fields("ShrCmpCode")
    mShrRecState_int = .fields("ShrRecState")
End If
End With
CloseTable tRecset

clsIT.Clear

End Sub

Public Sub GetDtlData(ByVal mStkCode As Long, ByVal mStkICode As Long, Optional ByVal mStkSno As Integer)
Dim tRecset As New ADODB.Recordset, t1Recset As New ADODB.Recordset
Me.ClearDtl

With tRecset
If mStkICode > 0 Then
    .open "Select * from StockJrn where StkCode=" & CStr(mStkCode) & " and StkICode=" & CStr(mStkICode) & "", m_dbStDatabase, adOpenKeyset, adLockOptimistic
Else
    .open "Select * from StockJrn where StkCode=" & CStr(mStkCode) & " and StkSno=" & CStr(mStkSno) & "", m_dbStDatabase, adOpenKeyset, adLockOptimistic
End If
If .RecordCount > 0 Then
    mStkCode_lng = .fields("StkCode")
    mStkICode_lng = .fields("StkICode")
    mStkSno_int = .fields("StkSno")
    mStkVtmCode_lng = .fields("StkVtmCode")
    mStkPrefix_str = .fields("StkPrefix")
    mStkVchNo_lng = .fields("StkVchNo")
    mStkPostfix_str = .fields("StkPostfix")
    mStkDate_dt = .fields("StkDate")
    mStkItmCode_lng = .fields("StkItmCode")
    mStkItmRefCode_lng = .fields("StkItmRefCode")
    mStkItmRef1Name_str = ""
    mStkItmRef2Name_str = ""
    mStkQty_dbl = .fields("StkQty")
    mStkRate_dbl = .fields("StkRate")
    mStkValue_dbl = .fields("StkValue")
    mStkNarr_str = .fields("StkNarr")
    mStkLItmCode_lng = .fields("StkLItmCode")
    mStkAutoGen_bln = .fields("StkAutoGen")
    mStkCmpCode_int = .fields("StkCmpCode")
    mStkRecState_int = .fields("StkRecState")
    
    With t1Recset
    .open "Select * from ProdRef where ItrRefCode=" & CStr(mStkItmRefCode_lng) & "", m_dbStDatabase, adOpenKeyset, adLockOptimistic
    If .EOF = False Then
        mStkItmRef1Name_str = .fields("ItrRef1Name")
        mStkItmRef2Name_str = .fields("ItrRef2Name")
    End If
    End With
    CloseTable t1Recset
    
End If
End With
CloseTable tRecset

clsIT.GetData mStkItmCode_lng

End Sub

Public Sub ClearHdr()

mShrCode_lng = 0
mShrVtmCode_lng = 0
mShrPrefix_str = ""
mShrVchNo_lng = 0
mShrPostfix_str = ""
mShrDate_dt = cUNKNOWNDATE
mShrQty_dbl = 0
mShrValue_dbl = 0
mShrNarr_str = ""
mShrAutoGen_bln = False
mShrCmpCode_int = 0
mShrRecState_int = 0

End Sub

Public Sub ClearDtl()

mStkCode_lng = 0
mStkICode_lng = 0
mStkSno_int = 0
mStkVtmCode_lng = 0
mStkPrefix_str = ""
mStkVchNo_lng = 0
mStkPostfix_str = ""
mStkDate_dt = cUNKNOWNDATE
mStkItmCode_lng = 0
mStkItmRefCode_lng = 0
mStkItmRef1Name_str = ""
mStkItmRef2Name_str = ""
mStkQty_dbl = 0
mStkRate_dbl = 0
mStkValue_dbl = 0
mStkNarr_str = ""
mStkLItmCode_lng = 0
mStkAutoGen_bln = False
mStkCmpCode_int = 0
mStkRecState_int = 0

Rem Item Ref.
mItrPRate_dbl = 0
mItrMRP_dbl = 0
mItrSRate_dbl = 0

End Sub

Public Sub Requery()
RefreshDatabase m_dbStDatabase
RefreshDatabase m_dbGrpDatabase
clsIT.Requery

End Sub

Private Sub Class_Terminate()
If UBound(aStockTran) > LBound(aStockTran) Then
    ErrorBox "clsStockJrn_Class_Terminate_#112_" & mTitleName & " in Process]"
End If

Set clsIT = Nothing
End Sub

Public Function BeginStock(ByVal mStkCode As Long) As Boolean
Dim tRecset As New ADODB.Recordset
BeginStock = False

If mStkCode = 0 Then
    mStkCode = GetUIdCode("clsStockJrn_BeginStock", mUIdFileName:=mClassUIdFileName, mAcsPermFileName:=mClassAcsPermFileName) * -1
    If mStkCode = 0 Then
        ErrorBox "clsStockJrn_BeginStock_#125_[Invalid " & mTitleName & " Code]"
        GoTo EndSub
    End If
ElseIf mStkCode = cOPSTKCODE Then
    Rem opening stock entry
ElseIf mStkCode > 0 Then
    tRecset.open "Select * from StockHdr where ShrCode=" & CStr(mStkCode) & "", m_dbStDatabase, adOpenKeyset, adLockOptimistic
    If tRecset.RecordCount > 0 Then
        tRecset.Close
    Else
        tRecset.Close
        ErrorBox "clsStockJrn_BeginStock_#136_[Entry not Found]"
        GoTo EndSub
    End If
Else
    ErrorBox "clsStockJrn_BeginStock_#140_[Invalid " & mTitleName & " Entry Code Request]"
    GoTo EndSub
End If
mActiveStock = UBound(aStockTran) + 1
ReDim Preserve aStockTran(mActiveStock)
aStockTran(mActiveStock) = mStkCode

Call Data_CreateLog(mStkCode)

BeginStock = True

EndSub:
Set tRecset = Nothing
Exit Function

End Function

Public Function EndStock(ByVal mStkCode As Long) As Boolean
Dim mCnt As Integer

EndStock = False
If Chk_ActiveStock() = False Or IIf(ActiveStkCode > 0, mStkCode <> ActiveStkCode, False) Then
    ErrorBox "clsStockJrn_EndStock_#161_[InActive Transaction Entry]"
    Exit Function
End If
Call Data_RemoveLog(mStkCode)

For mCnt = (mActiveStock + 1) To UBound(aStockTran)
    If (mCnt - 1) >= LBound(aStockTran) Then
        aStockTran(mCnt - 1) = aStockTran(mCnt)
    End If
Next mCnt
If LBound(aStockTran) = UBound(aStockTran) Then
    aStockTran = Array()
Else
    ReDim Preserve aStockTran(UBound(aStockTran) - 1)
End If
If mActiveStock > UBound(aStockTran) Then
    mActiveStock = mActiveStock - 1
End If

EndStock = True
End Function

Public Property Get ActiveStkCode() As Long
On Error GoTo errhand

ActiveStkCode = aStockTran(mActiveStock)

Exit Property

errhand:
ErrorBox Err.Description
ActiveStkCode = -1
Exit Property

End Property

Public Function CommitStock(ByVal mStkCode As Long) As Boolean
Dim t1Recset As New ADODB.Recordset, t2Recset As New ADODB.Recordset, tRecset As New ADODB.Recordset, GPSRecset As New ADODB.Recordset, PDRRecset As New ADODB.Recordset
Dim mTmpStkCode As Long, mStkSno As Integer, mStkLItmCode As Long, mDeletedRec As Boolean, mAddedRec As Boolean, mEditedRec As Boolean, mUnknownRec As Boolean, mCanceledRec As Boolean, mHdrDateChanged As Boolean

On Error GoTo errhand

CommitStock = False
mTmpStkCode = ActiveStkCode

Rem header section
m_dbStDatabase.BeginTrans
With tRecset
.open "Select * from StockHdr where ShrCode=" & CStr(mStkCode) & "", m_dbStDatabase, adOpenKeyset, adLockOptimistic
If .RecordCount > 0 Then
    If InList(.fields("ShrRecState"), Array(cREC_ADDED, cREC_EDITED, cREC_UNCHANGED)) = True Then
        .fields("ShrRecState") = cREC_UNCHANGED
        .Update
    Else
        .fields("ShrRecState") = ChkDeleteRecStatus(.fields("ShrRecState"))
        .Update
        .Delete
    End If
End If
End With
m_dbStDatabase.CommitTrans
CloseTable tRecset

Rem detail section
m_dbStDatabase.BeginTrans
If mStkCode = mTmpStkCode Then
    t1Recset.open "Select * from StockJrn where StkCode=" & CStr(mStkCode) & " order by StkICode", m_dbStDatabase, adOpenKeyset, adLockOptimistic
    t2Recset.open "Select * from StockJrn_Log where StkCode=" & CStr(mStkCode) & " order by StkICode", m_dbStDatabase, adOpenKeyset, adLockOptimistic
Else
    t1Recset.open "Select * from StockJrn where StkCode=" & CStr(mTmpStkCode) & " order by StkICode", m_dbStDatabase, adOpenKeyset, adLockOptimistic
    t2Recset.open "Select * from StockJrn_Log where StkCode=" & CStr(mTmpStkCode) & " order by StkICode", m_dbStDatabase, adOpenKeyset, adLockOptimistic
End If
With t1Recset
If .RecordCount > 0 Then
    mStkSno = 1
    .MoveFirst
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
            ErrorBox "clsStockJrn_CommitStock_#224_[Invalid Record Status]"
            mUnknownRec = True
        End Select
        
        If InList(.fields("StkRecState"), Array(cREC_ADDED, cREC_EDITED, cREC_UNCHANGED)) = True Then
            If .fields("StkDate") <> mShrDate_dt Then
                mHdrDateChanged = True
            End If
            If mStkCode <> mTmpStkCode Then
                .fields("StkCode") = mStkCode
                
                m_dbStDatabase.BeginTrans
                m_dbStDatabase.Execute "Update ProdRef set ItrStkCode=" & CStr(mStkCode) & " where ItrRefCode=" & CStr(.fields("StkItmRefCode")) & " and ItrItmCode=" & CStr(.fields("StkItmCode")) & " and ItrStkCode=" & CStr(mTmpStkCode) & " and ItrStkICode=" & CStr(.fields("StkICode"))
                m_dbStDatabase.CommitTrans
            End If
            .fields("StkSno") = mStkSno
            .fields("StkVtmCode") = mShrVtmCode_lng
            .fields("StkPrefix") = mShrPrefix_str
            .fields("StkVchNo") = mShrVchNo_lng
            .fields("StkPostfix") = mShrPostfix_str
            .fields("StkDate") = mShrDate_dt
            Rem .fields("StkRecState") = cREC_UNCHANGED don't here
            .Update
            Rem mStkSno = mStkSno + 1 don't here
        End If
        
        t2Recset.Find "StkICode=" & CStr(.fields("StkICode")), Start:=1
        If t2Recset.EOF = False Then
            If mEditedRec = True Or mDeletedRec = True Or mUnknownRec = True Or mHdrDateChanged = True Then
                Rem remove old transaction balance
                clsIT.UpdateGrpQtySum t2Recset.fields("StkItmCode"), t2Recset.fields("StkItmRefCode"), t2Recset.fields("StkQty"), 0, False, t2Recset.fields("StkDate")
                
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
                If mStkCode <> mTmpStkCode Then
                    m_dbStDatabase.Execute "Delete from ProdRef where (ItrRefCode<>" & CStr(.fields("StkItmRefCode")) & " or ItrItmCode<>" & CStr(.fields("StkItmCode")) & ") and ItrStkCode=" & CStr(mTmpStkCode) & " and ItrStkICode=" & CStr(.fields("StkICode"))
                    If mCanceledRec = True Then
                        m_dbStDatabase.Execute "Delete from ProdRef where ItrRefCode=" & CStr(.fields("StkItmRefCode")) & " and ItrItmCode=" & CStr(.fields("StkItmCode")) & " and ItrStkCode=" & CStr(mTmpStkCode) & " and ItrStkICode=" & CStr(.fields("StkICode"))
                    End If
                Else
                    m_dbStDatabase.Execute "Delete from ProdRef where (ItrRefCode<>" & CStr(.fields("StkItmRefCode")) & " or ItrItmCode<>" & CStr(.fields("StkItmCode")) & ") and ItrStkCode=" & CStr(mStkCode) & " and ItrStkICode=" & CStr(.fields("StkICode"))
                    If mCanceledRec = True Then
                        m_dbStDatabase.Execute "Delete from ProdRef where ItrRefCode=" & CStr(.fields("StkItmRefCode")) & " and ItrItmCode=" & CStr(.fields("StkItmCode")) & " and ItrStkCode=" & CStr(mStkCode) & " and ItrStkICode=" & CStr(.fields("StkICode"))
                    End If
                End If
                m_dbStDatabase.CommitTrans
            End If
        End If
        If mAddedRec = True Or mEditedRec = True Or mHdrDateChanged = True Then
            Rem add new/edited transaction balances at entry date (edited/unchanged)
            clsIT.UpdateGrpQtySum .fields("StkItmCode"), .fields("StkItmRefCode"), .fields("StkQty"), 0, True, .fields("StkDate")
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

Rem updating link product code
m_dbStDatabase.BeginTrans
t1Recset.open "Select * from StockJrn where StkCode=" & CStr(mStkCode) & " order by StkICode", m_dbStDatabase, adOpenKeyset, adLockOptimistic
tRecset.open "Select * from StockJrn where StkCode=" & CStr(mStkCode) & " order by StkICode", m_dbStDatabase, adOpenKeyset, adLockReadOnly
With t1Recset
If .RecordCount > 0 Then
    .MoveFirst
    Do While .EOF = False
        mStkLItmCode = 0
        If tRecset.RecordCount > 0 Then
            tRecset.MoveFirst
            Do While tRecset.EOF = False
                If tRecset.fields("StkICode") <> .fields("StkICode") _
                 And tRecset.fields("StkValue") = .fields("StkValue") Then
                    mStkLItmCode = tRecset.fields("StkItmCode")
                    Exit Do
                End If
                tRecset.MoveNext
            Loop
        End If
        .fields("StkLItmCode") = mStkLItmCode
        .Update

        .MoveNext
    Loop
End If
End With
m_dbStDatabase.CommitTrans
CloseTable tRecset
CloseTable t1Recset

Rem updating linked changes in prodref linked with this entry
m_dbStDatabase.BeginTrans
tRecset.open "Select * from ProdRef where ItrStkCode=" & CStr(mStkCode) & " order by ItrStkICode", m_dbStDatabase, adOpenKeyset, adLockOptimistic
With tRecset
If .RecordCount > 0 Then
    .MoveFirst
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

Rem one person is making new entry for this date,item,itemref entry and one person is deleting this entry, what will you do. nothing but at this stage simply check if linked entries exist, then don't delete else delete it
Rem this is done at above
Rem gProdSum -  stock day balances, updated by clsProduct
m_dbGrpDatabase.BeginTrans
t1Recset.open "Select * from StockJrn where StkCode=" & CStr(mStkCode) & " order by StkICode", m_dbStDatabase, adOpenKeyset, adLockOptimistic
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

CommitStock = True
mCrashedEntry = False
GoTo EndSub
Exit Function

errhand:
MsgBox Err.Description
m_dbStDatabase.Cancel

EndSub:
Set t1Recset = Nothing
Set t2Recset = Nothing
Set tRecset = Nothing
Set GPSRecset = Nothing

Exit Function

End Function

Public Function CancelStock(ByVal mStkCode As Long) As Boolean
Dim t1Recset As New ADODB.Recordset, t2Recset As New ADODB.Recordset, tRecset As New ADODB.Recordset, ProdRef_LogRS As New ADODB.Recordset
Dim pStkQty As Double, mRecEdited As Boolean, mRecDeleted As Boolean, mUpdateNewStk As Boolean

CancelStock = False
If Chk_ActiveStock() = False Or mStkCode <> ActiveStkCode Then
    ErrorBox "clsStockJrn_CancelStock_#450_[InActive Transaction Entry]"
    GoTo EndSub
End If
If mCrashedEntry = True Then
    ErrorBox "Cancel/Undo Strictly Prohibited for Crashed/Uncomplete Entries, User Must Save it !!!"
    GoTo EndSub
End If
On Error GoTo errhand

Rem header section
m_dbStDatabase.BeginTrans
With t1Recset
.open "Select * from StockHdr where ShrCode=" & CStr(mStkCode) & "", m_dbStDatabase, adOpenKeyset, adLockOptimistic
t2Recset.open "Select * from StockHdr_Log where ShrCode=" & CStr(mStkCode) & "", m_dbStDatabase, adOpenKeyset, adLockOptimistic
If .EOF = False Then
    Rem stock updation is not required because balance is updated on CommitStock and not on individual item save, hence no need to revert is back
    If t2Recset.EOF = False Then
        ' any prior updations can be made here
        .fields("ShrVtmCode") = t2Recset.fields("ShrVtmCode")
        .fields("ShrPrefix") = t2Recset.fields("ShrPrefix")
        .fields("ShrVchNo") = t2Recset.fields("ShrVchNo")
        .fields("ShrPostfix") = t2Recset.fields("ShrPostfix")
        .fields("ShrDate") = t2Recset.fields("ShrDate")
        .fields("ShrQty") = t2Recset.fields("ShrQty")
        .fields("ShrValue") = t2Recset.fields("ShrValue")
        .fields("ShrNarr") = t2Recset.fields("ShrNarr")
        .fields("ShrAutoGen") = t2Recset.fields("ShrAutoGen")
        .fields("ShrCmpCode") = t2Recset.fields("ShrCmpCode")
        .fields("ShrRecState") = t2Recset.fields("ShrRecState")
        .Update
    Else
        ' any prior updations can be made here
        .fields("ShrRecState") = ChkDeleteRecStatus(.fields("ShrRecState"))
        .Update
        .Delete
    End If
End If
End With
m_dbStDatabase.CommitTrans
CloseTable t1Recset
CloseTable t2Recset

Rem detail section
m_dbStDatabase.BeginTrans
With t1Recset
.open "Select * from StockJrn where StkCode=" & CStr(mStkCode) & " order by StkICode", m_dbStDatabase, adOpenKeyset, adLockOptimistic
t2Recset.open "Select * from StockJrn_Log where StkCode=" & CStr(mStkCode) & " order by StkICode", m_dbStDatabase, adOpenKeyset, adLockOptimistic
If .RecordCount > 0 Then
    .MoveFirst
    Do While .EOF = False
        Rem stock updation is not required because balance is updated on CommitStock and not on individual item save, hence no need to revert is back
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

Rem updating linked prodref if any
m_dbStDatabase.BeginTrans
With t1Recset
.open "Select * from ProdRef where ItrStkCode=" & CStr(mStkCode) & " order by ItrRefCode", m_dbStDatabase, adOpenKeyset, adLockOptimistic
t2Recset.open "Select * from ProdRef_Log where ItrStkCode=" & CStr(mStkCode) & " order by ItrRefCode", m_dbStDatabase, adOpenKeyset, adLockOptimistic
If .RecordCount > 0 Then
    .MoveFirst
    Do While .EOF = False
        Rem stock updation is not required because balance is updated on CommitStock and not on individual item save, hence no need to revert is back
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
m_dbStDatabase.CommitTrans
CloseTable t1Recset
CloseTable t2Recset

CancelStock = True
GoTo EndSub

Exit Function

errhand:
MsgBox Err.Description
m_dbStDatabase.Cancel

EndSub:
Set t1Recset = Nothing
Set t2Recset = Nothing
Set tRecset = Nothing
Set ProdRef_LogRS = Nothing

Exit Function

End Function

Public Function DeleteStock(ByVal mStkCode As Long) As Boolean
Dim tRecset As New ADODB.Recordset, t1Recset As New ADODB.Recordset
DeleteStock = False
If Chk_ActiveStock() = False Or mStkCode <> ActiveStkCode Then
    ErrorBox "clsStockJrn_DeleteStock_#544_[InActive Transaction Entry]"
    GoTo EndSub
End If
On Error GoTo errhand

Rem header section
m_dbStDatabase.BeginTrans
With tRecset
.open "Select * from StockHdr where ShrCode = " & CStr(mStkCode) & "", m_dbStDatabase, adOpenKeyset, adLockOptimistic
If .EOF = False Then
    .fields("ShrRecState") = ChkDeleteRecStatus(.fields("ShrRecState"))
    .Update
End If
End With
m_dbStDatabase.CommitTrans
CloseTable tRecset

Rem detail section
m_dbStDatabase.BeginTrans
With tRecset
.open "Select * from StockJrn where StkCode=" & CStr(mStkCode) & " order by StkICode", m_dbStDatabase, adOpenKeyset, adLockOptimistic
If .RecordCount > 0 Then
    Do While .EOF = False
        Rem updating gProdSum is done at Commit level not at delete level
        .fields("StkRecState") = ChkDeleteRecStatus(.fields("StkRecState"))
        .Update
        Rem marked for deletion only, physically deleted in CommitStock
        .MoveNext
    Loop
End If
End With
m_dbStDatabase.CommitTrans
CloseTable tRecset

Rem checking linked prodref for deletion if not used anywhere else
m_dbStDatabase.BeginTrans
With t1Recset
.open "Select * from ProdRef where ItrStkCode=" & CStr(mStkCode) & " order by ItrStkICode", m_dbStDatabase, adOpenKeyset, adLockOptimistic
If .RecordCount > 0 Then
    Do While .EOF = False
        tRecset.open "Select * from StockJrn where StkItmRefCode=" & CStr(.fields("ItrRefCode")) & " and StkCode<>" & CStr(mStkCode) & " order by StkICode", m_dbStDatabase, adOpenKeyset, adLockOptimistic
        If tRecset.RecordCount = 0 Then
            .fields("ItrRecState") = ChkDeleteRecStatus(.fields("ItrRecState"))
            .Update
        End If
        Rem marked for deletion only, physically deleted in CommitStock
        .MoveNext
        CloseTable tRecset
    Loop
End If
End With
m_dbStDatabase.CommitTrans
CloseTable t1Recset

DeleteStock = True
GoTo EndSub

Exit Function

errhand:
MsgBox Err.Description
m_dbStDatabase.Cancel

EndSub:
Set tRecset = Nothing
Set t1Recset = Nothing
Exit Function

End Function

Public Function SelectStock(ByVal mStkCode As Long) As Boolean
Dim mEntryFound As Boolean

SelectStock = False
If mStkCode < 1 Then
    ErrorBox "clsStockJrn_SelectStock_#607_[Invalid " & mTitleName & " Entry]"
    Exit Function
End If
mEntryFound = False
For mActiveStock = LBound(aStockTran) To UBound(aStockTran)
    If aStockTran(mActiveStock) = mStkCode Then
        mEntryFound = True
        Exit For
    End If
Next mActiveStock
If mEntryFound = False Then
    mActiveStock = UBound(aStockTran) + 1
End If

SelectStock = True
End Function

Public Function NextStock() As Boolean
NextStock = False
If EOStk = True Then
    ErrorBox "clsStockJrn_NextStock_#628_[End of " & mTitleName & " Entry]"
    Exit Function
End If
mActiveStock = mActiveStock + 1

NextStock = True
End Function

Public Function PreviousStock()
PreviousStock = False
If BOStk = True Then
    ErrorBox "clsStockJrn_PreviousStock_#638_[Begining of " & mTitleName & " Entry]"
    Exit Function
End If
mActiveStock = mActiveStock - 1

PreviousStock = True
End Function

Public Function FirstStock() As Boolean
FirstStock = False
If CountStock = 0 Then
    ErrorBox "clsStockJrn_FirstStock_#649_[No " & mTitleName & " Entry]"
    Exit Function
End If
mActiveStock = LBound(aStockTran)

FirstStock = True

End Function

Public Function LastStock() As Boolean
LastStock = False
If CountStock = 0 Then
    ErrorBox "clsStockJrn_LastStock_#661_[No " & mTitleName & " Entry]"
    Exit Function
End If
mActiveStock = UBound(aStockTran)

LastStock = True

End Function

Public Property Get CountStock() As Integer
If UBound(aStockTran) = -1 Then
    CountStock = 0
Else
    CountStock = UBound(aStockTran) - LBound(aStockTran) + 1
End If

End Property

Public Property Get EOStk() As Boolean
EOStk = (mActiveStock > UBound(aStockTran) Or UBound(aStockTran) = -1)
End Property

Public Property Get BOStk() As Boolean
BOStk = (mActiveStock < LBound(aStockTran) Or UBound(aStockTran) = -1)
End Property

Public Function Chk_ActiveStock() As Boolean
If BOStk = False And EOStk = False Then
    Chk_ActiveStock = True
Else
    Chk_ActiveStock = False
End If

End Function

Private Function Data_CreateLog(ByVal mStkCode As Long) As Boolean
Dim t1Recset As New ADODB.Recordset, t2Recset As New ADODB.Recordset, t3Recset As New ADODB.Recordset

Data_CreateLog = False
If Chk_ActiveStock() = False Or mStkCode <> ActiveStkCode Then
    ErrorBox "clsStockJrn_Data_CreateLog_#856_[InActive " & mTitleName & " Entry]"
    GoTo EndSub
End If
mCrashedEntry = False

t1Recset.open "Select * from StockHdr_Log where ShrCode=" & CStr(mStkCode) & "", m_dbStDatabase, adOpenKeyset, adLockOptimistic
t2Recset.open "Select * from StockJrn_Log where StkCode=" & CStr(mStkCode) & "", m_dbStDatabase, adOpenKeyset, adLockOptimistic
If t1Recset.RecordCount = 0 And t2Recset.RecordCount = 0 Then
    Rem only ok records will be taken in log, because not ok records are created out of crashed entries which must be cleared when entry rejected
    m_dbStDatabase.BeginTrans
    m_dbStDatabase.Execute "Insert into StockHdr_Log Select * from StockHdr where ShrCode=" & CStr(mStkCode) & " and ShrRecState=" & CStr(cREC_UNCHANGED) & ""
    m_dbStDatabase.Execute "Insert into StockJrn_Log Select * from StockJrn where StkCode=" & CStr(mStkCode) & " and StkRecState=" & CStr(cREC_UNCHANGED) & ""
    m_dbStDatabase.CommitTrans
Else
    AlertBox "clsStockJrn_Data_CreateLog_#869_[Unsaved Stock Entry]"
    mCrashedEntry = True
End If
CloseTable t1Recset
CloseTable t2Recset

t3Recset.open "Select * from ProdRef_Log where ItrStkCode=" & CStr(mStkCode) & "", m_dbStDatabase, adOpenKeyset, adLockOptimistic
If t3Recset.RecordCount = 0 Then
    Rem only ok records will be taken in log, because not ok records are created out of crashed entries which must be cleared when entry rejected
    m_dbStDatabase.BeginTrans
    m_dbStDatabase.Execute "Insert into ProdRef_Log Select * from ProdRef where ItrStkCode=" & CStr(mStkCode) & " and ItrRecState=" & CStr(cREC_UNCHANGED) & ""
    m_dbStDatabase.CommitTrans
Else
    AlertBox "clsStockJrn_Data_CreateLog_#883_[Unsaved Stock(ProdRef) Entry]"
    mCrashedEntry = True
End If
CloseTable t3Recset

Data_CreateLog = True
GoTo EndSub
Exit Function

EndSub:
Set t1Recset = Nothing
Set t2Recset = Nothing
Set t3Recset = Nothing
Exit Function

End Function

Public Function AddNewHdr() As Boolean
Dim tRecset As New ADODB.Recordset

AddNewHdr = False
If Chk_ActiveStock() = False Then
    ErrorBox "clsStockJrn_AddNewHdr_#747_[InActive " & mTitleName & " Entry]"
    GoTo EndSub
End If

On Error GoTo errhand
mShrCode_lng = 0

m_dbStDatabase.BeginTrans
tRecset.open "Select * from StockHdr where ShrCode=0.1", m_dbStDatabase, adOpenKeyset, adLockOptimistic
With tRecset
Call Calc_ActiveValue
.AddNew
Rem .Fields("ShrCode") = AutoNumber
.fields("ShrVtmCode") = mShrVtmCode_lng
.fields("ShrPrefix") = mShrPrefix_str
.fields("ShrVchNo") = mShrVchNo_lng
.fields("ShrPostfix") = mShrPostfix_str
.fields("ShrDate") = mShrDate_dt
.fields("ShrQty") = mShrQty_dbl
.fields("ShrValue") = mShrValue_dbl
.fields("ShrNarr") = mShrNarr_str
.fields("ShrAutoGen") = mShrAutoGen_bln
.fields("ShrCmpCode") = mShrCmpCode_int
.fields("ShrRecState") = ChkEditRecStatus(.fields("ShrRecState"))
.Update
mShrCode_lng = .fields("ShrCode")
End With
CloseTable tRecset
m_dbStDatabase.CommitTrans

AddNewHdr = True
GoTo EndSub

Exit Function

errhand:
MsgBox Err.Description
m_dbStDatabase.Cancel

EndSub:
Set tRecset = Nothing
Exit Function

End Function

Public Function AddNewDtl(ByVal mStkCode As Long, Optional ByVal mNewItemRef As Boolean = False) As Boolean
Dim tRecset As New ADODB.Recordset, t1Recset As New ADODB.Recordset

AddNewDtl = False
If Chk_ActiveStock() = False Or mStkCode <> ActiveStkCode Then
    ErrorBox "clsStockJrn_AddNewDtl_#747_[InActive " & mTitleName & " Entry]"
    GoTo EndSub
End If

On Error GoTo errhand
mStkICode_lng = 0

If mNewItemRef = True Then
    m_dbStDatabase.BeginTrans
    With t1Recset
    .open "Select * from ProdRef where ItrRefCode=0.1", m_dbStDatabase, adOpenKeyset, adLockOptimistic
    
    .AddNew
    Rem .Fields("ItrRefCode") = AutoNumber
    .fields("ItrItmCode") = mStkItmCode_lng
    .fields("ItrRef1Name") = mStkItmRef1Name_str
    .fields("ItrRef2Name") = mStkItmRef2Name_str
    .fields("ItrPRate") = mItrPRate_dbl
    .fields("ItrMRP") = mItrMRP_dbl
    .fields("ItrSRate") = mItrSRate_dbl
    .fields("ItrStkCode") = 0
    .fields("ItrStkICode") = 0
    .fields("ItrCmpCode") = mStkCmpCode_int
    .fields("ItrRecState") = ChkEditRecStatus(.fields("ItrRecState"))
    .Update
    
    mStkItmRefCode_lng = .fields("ItrRefCode")
    End With
    m_dbStDatabase.CommitTrans
    CloseTable t1Recset
End If

If mStkSno_int = 0 Then     ' zero value standard means that new sno has to be find
    mStkSno_int = GetNextSeqno(m_dbStDatabase, "StockJrn", "StkSno", "StkCode=" & CStr(mStkCode) & " and StkSno>0")
End If

m_dbStDatabase.BeginTrans
tRecset.open "Select * from StockJrn where StkCode=" & CStr(mStkCode) & " order by StkICode", m_dbStDatabase, adOpenKeyset, adLockOptimistic
With tRecset
Call Calc_ActiveValue
.AddNew
Rem .Fields("StkICode") = AutoNumber
.fields("StkCode") = mStkCode
.fields("StkSno") = mStkSno_int
.fields("StkVtmCode") = mStkVtmCode_lng
.fields("StkPrefix") = mStkPrefix_str
.fields("StkVchNo") = mStkVchNo_lng
.fields("StkPostfix") = mStkPostfix_str
.fields("StkDate") = mStkDate_dt
.fields("StkItmCode") = mStkItmCode_lng
.fields("StkItmRefCode") = mStkItmRefCode_lng
.fields("StkQty") = mStkQty_dbl
.fields("StkRate") = mStkRate_dbl
.fields("StkValue") = mStkValue_dbl
.fields("StkNarr") = mStkNarr_str
.fields("StkAutoGen") = mStkAutoGen_bln
.fields("StkCmpCode") = mStkCmpCode_int
.fields("StkRecState") = ChkEditRecStatus(.fields("StkRecState"))
.Update
mStkICode_lng = .fields("StkICode")
End With
m_dbStDatabase.CommitTrans
CloseTable tRecset

If mNewItemRef = True Then
    m_dbStDatabase.BeginTrans
    With t1Recset
    .open "Select * from ProdRef where ItrRefCode=" & CStr(mStkItmRefCode_lng) & "", m_dbStDatabase, adOpenKeyset, adLockOptimistic
    
    .fields("ItrStkCode") = mStkCode
    .fields("ItrStkICode") = mStkICode_lng
    .Update
    
    End With
    m_dbStDatabase.CommitTrans
    CloseTable t1Recset
End If

Rem balance stock updated in CommitStock

AddNewDtl = True
GoTo EndSub

Exit Function

errhand:
MsgBox Err.Description
m_dbStDatabase.Cancel

EndSub:
Set tRecset = Nothing
Set t1Recset = Nothing
Exit Function

End Function

Public Function UpdateHdr(ByVal mStkCode As Long) As Boolean
Dim tRecset As New ADODB.Recordset, t1Recset As New ADODB.Recordset

UpdateHdr = False
If Chk_ActiveStock() = False Or mStkCode <> ActiveStkCode Then
    ErrorBox "clsStockJrn_UpdateHdr_#1055_[InActive " & mTitleName & " Entry]"
    GoTo EndSub
End If

On Error GoTo errhand

m_dbStDatabase.BeginTrans
With tRecset
.open "Select * from StockHdr where ShrCode=" & CStr(mStkCode) & "", m_dbStDatabase, adOpenKeyset, adLockOptimistic
Call Calc_ActiveValue

.fields("ShrVtmCode") = mShrVtmCode_lng
.fields("ShrPrefix") = mShrPrefix_str
.fields("ShrVchNo") = mShrVchNo_lng
.fields("ShrPostfix") = mShrPostfix_str
.fields("ShrDate") = mShrDate_dt
.fields("ShrQty") = mShrQty_dbl
.fields("ShrValue") = mShrValue_dbl
.fields("ShrNarr") = mShrNarr_str
.fields("ShrCmpCode") = mShrCmpCode_int
.fields("ShrAutoGen") = mShrAutoGen_bln
.fields("ShrRecState") = ChkEditRecStatus(.fields("ShrRecState"))
.Update
End With
m_dbStDatabase.CommitTrans
CloseTable tRecset

UpdateHdr = True
GoTo EndSub

Exit Function

errhand:
MsgBox Err.Description
m_dbStDatabase.Cancel

EndSub:
Set tRecset = Nothing
Set t1Recset = Nothing

Exit Function

End Function

Public Function UpdateDtl(ByVal mStkCode As Long, ByVal mStkICode As Long, Optional ByVal mNewItemRef As Boolean = False) As Boolean
Dim tRecset As New ADODB.Recordset, t1Recset As New ADODB.Recordset, mStkItmRefCode_old As Long

UpdateDtl = False
If Chk_ActiveStock() = False Or mStkCode <> ActiveStkCode Then
    ErrorBox "clsStockJrn_UpdateDtl_#1055_[InActive " & mTitleName & " Entry]"
    GoTo EndSub
End If

On Error GoTo errhand

mStkItmRefCode_old = mStkItmRefCode_lng
If mNewItemRef = True Then
    m_dbStDatabase.BeginTrans
    With t1Recset
    .open "Select * from ProdRef where ItrRefCode=0.1", m_dbStDatabase, adOpenKeyset, adLockOptimistic
    
    .AddNew
    Rem .Fields("ItrRefCode") = AutoNumber
    .fields("ItrItmCode") = mStkItmCode_lng
    .fields("ItrRef1Name") = mStkItmRef1Name_str
    .fields("ItrRef2Name") = mStkItmRef2Name_str
    .fields("ItrPRate") = mItrPRate_dbl
    .fields("ItrMRP") = mItrMRP_dbl
    .fields("ItrSRate") = mItrSRate_dbl
    .fields("ItrStkCode") = 0
    .fields("ItrStkICode") = 0
    .fields("ItrCmpCode") = mStkCmpCode_int
    .fields("ItrRecState") = ChkEditRecStatus(.fields("ItrRecState"))
    .Update
    
    mStkItmRefCode_lng = .fields("ItrRefCode")
    End With
    m_dbStDatabase.CommitTrans
    CloseTable t1Recset
End If

m_dbStDatabase.BeginTrans
With tRecset
.open "Select * from StockJrn where StkCode=" & CStr(mStkCode) & " and StkICode=" & CStr(mStkICode) & "", m_dbStDatabase, adOpenKeyset, adLockOptimistic
Call Calc_ActiveValue

.fields("StkSno") = mStkSno_int
.fields("StkVtmCode") = mStkVtmCode_lng
.fields("StkPrefix") = mStkPrefix_str
.fields("StkVchNo") = mStkVchNo_lng
.fields("StkPostfix") = mStkPostfix_str
.fields("StkDate") = mStkDate_dt
.fields("StkItmCode") = mStkItmCode_lng
.fields("StkItmRefCode") = mStkItmRefCode_lng
.fields("StkQty") = mStkQty_dbl
.fields("StkRate") = mStkRate_dbl
.fields("StkValue") = mStkValue_dbl
.fields("StkNarr") = mStkNarr_str
.fields("StkAutoGen") = mStkAutoGen_bln
.fields("StkCmpCode") = mStkCmpCode_int
.fields("StkRecState") = ChkEditRecStatus(.fields("StkRecState"))
.Update
End With
m_dbStDatabase.CommitTrans
CloseTable tRecset

Rem updating/adding prodref rate if originated from this entry
m_dbStDatabase.BeginTrans
If mNewItemRef = True Then
    With t1Recset
    .open "Select * from ProdRef where ItrRefCode=" & CStr(mStkItmRefCode_lng) & "", m_dbStDatabase, adOpenKeyset, adLockOptimistic
    
    .fields("ItrStkCode") = mStkCode
    .fields("ItrStkICode") = mStkICode
    .Update
    
    End With
    CloseTable t1Recset
Else
    With t1Recset
    .open "Select * from ProdRef where ItrStkCode=" & CStr(mStkCode) & " and ItrStkICode=" & CStr(mStkICode) & "", m_dbStDatabase, adOpenKeyset, adLockOptimistic
    If .RecordCount > 0 Then
        .fields("ItrRef1Name") = mStkItmRef1Name_str
        .fields("ItrRef2Name") = mStkItmRef2Name_str
        .fields("ItrPRate") = mItrPRate_dbl
        .fields("ItrMRP") = mItrMRP_dbl
        .fields("ItrSRate") = mItrSRate_dbl
        .fields("ItrRecState") = ChkEditRecStatus(.fields("ItrRecState"))
        .Update
    End If
    End With
    CloseTable t1Recset
End If
m_dbStDatabase.CommitTrans

Rem balance stock changed in CommitStock

UpdateDtl = True
GoTo EndSub

Exit Function

errhand:
MsgBox Err.Description
m_dbStDatabase.Cancel

EndSub:
Set tRecset = Nothing
Set t1Recset = Nothing

Exit Function

End Function

Public Function DeleteHdr(ByVal mStkCode As Long, Optional mConfirm As Boolean) As Boolean
Dim tRecset As New ADODB.Recordset
Dim mDeleteit As Boolean

DeleteHdr = False
If Chk_ActiveStock() = False Or mStkCode <> ActiveStkCode Then
    ErrorBox "clsStockJrn_DeleteHdr_#1209_[InActive " & mTitleName & " Entry]"
    GoTo EndSub
End If

mDeleteit = True

If mDeleteit = True Then
    If mConfirm = True Then
        mDeleteit = CanDelete()
    End If
End If
If mDeleteit = True Then
    On Error GoTo errhand
    
    m_dbStDatabase.BeginTrans
    tRecset.open "Select * from StockHdr where ShrCode=" & CStr(mStkCode) & "", m_dbStDatabase, adOpenKeyset, adLockOptimistic
    With tRecset
    .fields("ShrRecState") = ChkDeleteRecStatus(.fields("ShrRecState"))
    .Update
    End With
    m_dbStDatabase.CommitTrans
    CloseTable tRecset
    
End If

DeleteHdr = True
GoTo EndSub

Exit Function

errhand:
MsgBox Err.Description
m_dbStDatabase.Cancel

EndSub:
Set tRecset = Nothing

Exit Function

End Function

Public Function DeleteDtl(ByVal mStkCode As Long, ByVal mStkICode As Long, Optional mConfirm As Boolean) As Boolean
Dim tRecset As New ADODB.Recordset, t1Recset As New ADODB.Recordset
Dim mDeleteit As Boolean

DeleteDtl = False
If Chk_ActiveStock() = False Or mStkCode <> ActiveStkCode Then
    ErrorBox "clsStockJrn_DeleteDtl_#1287_[InActive " & mTitleName & " Entry]"
    GoTo EndSub
End If

mDeleteit = True

If mDeleteit = True Then
    If mConfirm = True Then
        mDeleteit = CanDelete()
    End If
End If
If mDeleteit = True Then
    On Error GoTo errhand
    
    m_dbStDatabase.BeginTrans
    tRecset.open "Select * from StockJrn where StkCode=" & CStr(mStkCode) & " and StkICode=" & CStr(mStkICode) & "", m_dbStDatabase, adOpenKeyset, adLockOptimistic
    With tRecset
    .fields("StkRecState") = ChkDeleteRecStatus(.fields("StkRecState"))
    .Update
    End With
    CloseTable tRecset
    m_dbStDatabase.CommitTrans
    Rem stock removed from CommitStock
    
    Rem checking linked prodref for deletion if not used anywhere else
    m_dbStDatabase.BeginTrans
    With t1Recset
    .open "Select * from ProdRef where ItrStkCode=" & CStr(mStkCode) & " and ItrStkICode=" & CStr(mStkICode) & "", m_dbStDatabase, adOpenKeyset, adLockOptimistic
    If .RecordCount > 0 Then
        tRecset.open "Select * from StockJrn where StkItmRefCode=" & CStr(.fields("ItrRefCode")) & " and StkICode<>" & CStr(mStkICode) & "", m_dbStDatabase, adOpenKeyset, adLockOptimistic
        If tRecset.RecordCount = 0 Then
            .fields("ItrRecState") = ChkDeleteRecStatus(.fields("ItrRecState"))
            .Update
        End If
        CloseTable tRecset
    End If
    End With
    CloseTable t1Recset
    m_dbStDatabase.CommitTrans
End If

DeleteDtl = True
GoTo EndSub

Exit Function

errhand:
MsgBox Err.Description
m_dbStDatabase.Cancel

EndSub:
Set tRecset = Nothing
Set t1Recset = Nothing

Exit Function

End Function

Private Function Data_RemoveLog(ByVal mStkCode As Long) As Boolean

Data_RemoveLog = False
If Chk_ActiveStock() = False Then
    ErrorBox "clsStockJrn_Data_RemoveLog_#1315[InActive " & mTitleName & " Entry]"
    Exit Function
End If
If mCrashedEntry = True Then
    ErrorBox "Remove Entry Log Aborted for Crashed/Uncomplete Entries, User Must Save Entry !!!"
    Exit Function
End If

m_dbStDatabase.BeginTrans
m_dbStDatabase.Execute "Delete from StockHdr_Log where ShrCode=" & CStr(mStkCode)
m_dbStDatabase.Execute "Delete from StockJrn_Log where StkCode=" & CStr(mStkCode)
m_dbStDatabase.Execute "Delete from ProdRef_Log where ItrStkCode=" & CStr(mStkCode)
m_dbStDatabase.CommitTrans

Data_RemoveLog = True
End Function

Public Sub Calc_ActiveValue()
mStkValue_dbl = (mStkQty_dbl * mStkRate_dbl)

End Sub
