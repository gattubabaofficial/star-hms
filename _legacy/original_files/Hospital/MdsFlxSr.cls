VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "clsMdsFlexSearch"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False

Option Explicit

Public fcmb As New frmFlexSearchList
Public dbAcDatabase As ADODB.Connection, dbStDatabase As ADODB.Connection, dbMdsDatabase As ADODB.Connection, dbCmpDatabase As ADODB.Connection, dbComDatabase As ADODB.Connection
Public mListSqlExpr As String, mBoundSqlExpr As String, mFiltCond As String
Public blnUserRoleMastList1 As Boolean, blnUserMastList1 As Boolean
Public blnSubItmMastList1 As Boolean, blnSubItmGrpMastList1 As Boolean, blnPartyMastList1 As Boolean, blnPartyGrpMastList1 As Boolean, blnBalSimRefNoList1 As Boolean
Dim BRecset As New ADODB.Recordset, LRecset As New ADODB.Recordset

Public Property Get BoundText() As String
BoundText = fcmb.BoundText
End Property

Public Property Let BoundText(ByVal mText As String)
fcmb.SearchBoundText mText
End Property

Public Property Get Text() As String
Text = fcmb.Text
End Property

Public Property Let Text(ByVal mText As String)
fcmb.SearchText mText
End Property

Rem mUserPara(0) = User Text
Rem mUserPara(1) = Cursor position
Public Property Let UserText(ByRef mUserPara As Variant)
fcmb.UserText = mUserPara

End Property

Public Property Get CallFromText_Change() As Boolean
CallFromText_Change = fcmb.CallFromText_Change
End Property

Public Property Let CallFromText_Change(ByVal mTrueFalse As Boolean)
fcmb.CallFromText_Change = mTrueFalse
End Property

Public Property Get CallFromBoundText_Change() As Boolean
CallFromBoundText_Change = fcmb.CallFromBoundText_Change
End Property

Public Property Let CallFromBoundText_Change(ByVal mTrueFalse As Boolean)
fcmb.CallFromBoundText_Change = mTrueFalse
End Property

Public Property Get ListSelected() As Boolean
ListSelected = fcmb.ListSelected()
End Property

Public Sub Show()
fcmb.Show 1
End Sub

Public Sub Init()
If blnUserRoleMastList1 = True Then
    Load fcmb
    fcmb.lblFormHeading.Caption = "User Role Master"
    fcmb.TableName = "UserRoleMst"
    fcmb.BoundField = "UrlCode"
    fcmb.ListField = "UrlName"
    fcmb.lblSearchCaption.Caption = "Name:"
    
    BRecset.Open fcmb.TableName, dbCmpDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect
    BRecset.Index = fcmb.BoundField
    If mListSqlExpr = "" Then
        LRecset.Open "Select * from " & fcmb.TableName & " order by " & fcmb.ListField, dbCmpDatabase, adOpenKeyset, adLockOptimistic
    Else
        LRecset.Open mListSqlExpr, dbCmpDatabase, adOpenKeyset, adLockOptimistic
    End If
    
    Set fcmb.BRecset = BRecset
    Set fcmb.LRecset = LRecset
    Set fcmb.frmAccessMaster = New frmUserRoleMast
    
    fcmb.ClearFlexColList
    fcmb.AddFlexColList mFldName:="UrlCode", mFldTitle:="UrlCode", mFldWidth:=0, mFldAlign:=7
    fcmb.AddFlexColList mFldName:="UrlName", mFldTitle:="User Role Name", mFldWidth:=3000, mFldAlign:=1
    
    fcmb.Init
    
ElseIf blnUserMastList1 = True Then
    Load fcmb
    fcmb.lblFormHeading.Caption = "User Master"
    fcmb.TableName = "UserMast"
    fcmb.BoundField = "UsrCode"
    fcmb.ListField = "UsrName"
    fcmb.lblSearchCaption.Caption = "Name:"
    
    BRecset.Open fcmb.TableName, dbCmpDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect
    BRecset.Index = fcmb.BoundField
    If mListSqlExpr = "" Then
        LRecset.Open "Select * from " & fcmb.TableName & " order by " & fcmb.ListField, dbCmpDatabase, adOpenKeyset, adLockOptimistic
    Else
        LRecset.Open mListSqlExpr, dbCmpDatabase, adOpenKeyset, adLockOptimistic
    End If
    
    Set fcmb.BRecset = BRecset
    Set fcmb.LRecset = LRecset
    Set fcmb.frmAccessMaster = New frmUserMast
    
    fcmb.ClearFlexColList
    fcmb.AddFlexColList mFldName:="UsrCode", mFldTitle:="UsrCode", mFldWidth:=0, mFldAlign:=7
    fcmb.AddFlexColList mFldName:="UsrName", mFldTitle:="User Name", mFldWidth:=3000, mFldAlign:=1
    
    fcmb.Init
    
ElseIf blnSubItmMastList1 = True Then
    Load fcmb
    fcmb.lblFormHeading.Caption = "Item Master"
    fcmb.TableName = "SubItmMast"
    fcmb.BoundField = "SimCode"
    fcmb.ListField = "SimName"
    fcmb.lblSearchCaption.Caption = "Name:"
    
    BRecset.Open fcmb.TableName, dbMdsDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect
    BRecset.Index = fcmb.BoundField
    If mListSqlExpr = "" Then
        LRecset.Open "Select SubItmMast.*,SubItmGrpMst.SigName from (SubItmMast" _
            & " inner join ProdMast on SubItmMast.SimItmCode = ProdMast.ItmCode)" _
            & " inner join SubItmGrpMst on SubItmMast.SimSigCode = SubItmGrpMst.SigCode" _
            & " order by SimName", dbComDatabase, adOpenKeyset, adLockOptimistic
    Else
        LRecset.Open mListSqlExpr, dbComDatabase, adOpenKeyset, adLockOptimistic
    End If

    Set fcmb.BRecset = BRecset
    Set fcmb.LRecset = LRecset
    Set fcmb.frmAccessMaster = New frmSubItemMast
    
    fcmb.ClearFlexColList
    fcmb.AddFlexColList mFldName:="SimCode", mFldTitle:="SimCode", mFldWidth:=0, mFldAlign:=8
    fcmb.AddFlexColList mFldName:="SimName", mFldTitle:="Item Name", mFldWidth:=3500, mFldAlign:=1
    fcmb.AddFlexColList mFldName:="SigName", mFldTitle:="Group Name", mFldWidth:=1500, mFldAlign:=1
    fcmb.AddFlexColList mFldName:="SimPurchRate", mFldTitle:="P.Rate", mFldWidth:=1400, mFldAlign:=7
    fcmb.AddFlexColList mFldName:="SimSaleRate", mFldTitle:="S.Rate", mFldWidth:=1400, mFldAlign:=7
    
    fcmb.Init
    
ElseIf blnSubItmGrpMastList1 = True Then
    Load fcmb
    fcmb.lblFormHeading.Caption = "Item Group Master"
    fcmb.TableName = "SubItmGrpMst"
    fcmb.BoundField = "SigCode"
    fcmb.ListField = "SigName"
    fcmb.lblSearchCaption.Caption = "Name:"
    
    BRecset.Open fcmb.TableName, dbMdsDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect
    BRecset.Index = fcmb.BoundField
    If mListSqlExpr = "" Then
        LRecset.Open "Select SubItmGrpMst.* from SubItmGrpMst order by SigName", dbMdsDatabase, adOpenKeyset, adLockOptimistic
    Else
        LRecset.Open mListSqlExpr, dbMdsDatabase, adOpenKeyset, adLockOptimistic
    End If

    Set fcmb.BRecset = BRecset
    Set fcmb.LRecset = LRecset
    Set fcmb.frmAccessMaster = New frmSubItemGrpMast
    
    fcmb.ClearFlexColList
    fcmb.AddFlexColList mFldName:="SigCode", mFldTitle:="SigCode", mFldWidth:=0, mFldAlign:=8
    fcmb.AddFlexColList mFldName:="SigName", mFldTitle:="Group Name", mFldWidth:=3000, mFldAlign:=1
    
    fcmb.Init
    
ElseIf blnBalSimRefNoList1 = True Then
    Load fcmb
    fcmb.lblFormHeading.Caption = "Item Reference List"
    fcmb.TableName = "[Query]"
    fcmb.BoundField = "ItrCode"
    fcmb.ListField = "SimRefNo"
    fcmb.ListFieldUnq = "SimRefNoUnq"
    fcmb.lblSearchCaption.Caption = "Ref.No:"
    
    Rem difference between BoundSql and ListSql is only it's order by sequence
    Rem while preparing query on entry form let remain inner join of PurchDtl but saledtl inner join only in form edit mode
    Rem list will show entries of completed purchase entry but under unsaved entries of purchase in add mode so as to avoid duplicate entry of any unsaved entry
    If mBoundSqlExpr = "" Then
        BRecset.Open "Select *,SimRefNo+'_'+format(ItrCode,'" & cLONGCODESTRFMT & "') as SimRefNoUnq from (" _
            & "Select SimRefNo,ItrCode,sum(Qty) as Qty_sum from (" _
            & "Select PurItrCode as ItrCode,PurSimRefNo as SimRefNo,PurQty as Qty from PurchDtl" _
            & " inner join PurchHdr on PurchDtl.PurCode = PurchHdr.PuhCode" _
            & IIf(mFiltCond <> "", " where " & mFiltCond, "") _
            & " Union All " _
            & "Select SalItrCode as ItrCode,SalSimRefNo as SimRefNo,(SalQty*-1) as Qty from SaleDtl" _
            & " inner join SaleHdr on SaleDtl.SalCode = SaleHdr.SahCode" _
            & IIf(mFiltCond <> "", " where " & mFiltCond, "") _
            & ")" _
            & " group by ItrCode,SimRefNo order by ItrCode,SimRefNo" _
            & ") as t1 inner join ProdRef on t1.ItrCode = ProdRef.ItrRefCode" _
            & " where Qty_sum > 0" _
            , dbComDatabase, adOpenKeyset, adLockOptimistic
    Else
        BRecset.Open mBoundSqlExpr, dbComDatabase, adOpenKeyset, adLockOptimistic
    End If
    If mListSqlExpr = "" Then
        LRecset.Open "Select *,SimRefNo+'_'+format(ItrCode,'" & cLONGCODESTRFMT & "') as SimRefNoUnq from (" _
            & "Select SimRefNo,ItrCode,sum(Qty) as Qty_sum from (" _
            & "Select PurItrCode as ItrCode,PurSimRefNo as SimRefNo,PurQty as Qty from PurchDtl" _
            & " inner join PurchHdr on PurchDtl.PurCode=PurchHdr.PuhCode" _
            & IIf(mFiltCond <> "", " where " & mFiltCond, "") _
            & " Union All " _
            & "Select SalItrCode as ItrCode,SalSimRefNo as SimRefNo,(SalQty*-1) as Qty from SaleDtl" _
            & " inner join SaleHdr on SaleDtl.SalCode = SaleHdr.SahCode" _
            & IIf(mFiltCond <> "", " where " & mFiltCond, "") _
            & ")" _
            & " group by SimRefNo,ItrCode order by SimRefNo,ItrCode" _
            & ") as t1 inner join ProdRef on t1.ItrCode = ProdRef.ItrRefCode" _
            & " where Qty_sum > 0" _
            , dbComDatabase, adOpenKeyset, adLockOptimistic
    Else
        LRecset.Open mListSqlExpr, dbComDatabase, adOpenKeyset, adLockOptimistic
    End If

    Set fcmb.BRecset = BRecset
    Set fcmb.LRecset = LRecset
    Rem Set fcmb.frmAccessMaster = New frmSubItemMast
    
    fcmb.ClearFlexColList
    fcmb.AddFlexColList mFldName:="ItrCode", mFldTitle:="ItrCode", mFldWidth:=0, mFldAlign:=7
    fcmb.AddFlexColList mFldName:="SimRefNo", mFldTitle:="Item Ref.No.", mFldWidth:=3000, mFldAlign:=1
    fcmb.AddFlexColList mFldName:="Qty_sum", mFldTitle:="Qty", mFldWidth:=1500, mFldAlign:=7
    fcmb.AddFlexColList mFldName:="ItrSRate", mFldTitle:="Rate", mFldWidth:=1500, mFldAlign:=7
    fcmb.AddFlexColList mFldName:="SimRefNoUnq", mFldTitle:="SimRefNoUnq", mFldWidth:=0, mFldAlign:=7
    
    fcmb.Init
    
ElseIf blnPartyMastList1 = True Then
    Load fcmb
    fcmb.lblFormHeading.Caption = "Party Master"
    fcmb.TableName = "PartyMast"
    fcmb.BoundField = "PrtCode"
    fcmb.ListField = "PrtName"
    fcmb.lblSearchCaption.Caption = "Name:"
    
    BRecset.Open fcmb.TableName, dbMdsDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect
    BRecset.Index = fcmb.BoundField
    If mListSqlExpr = "" Then
        LRecset.Open "Select PartyMast.*,AreaMast.AraName,StsnMast.StnName,AchdMast.AhName from ((PartyMast inner join AreaMast on PartyMast.PrtAraCode=AreaMast.AraCode) inner join StsnMast on PartyMast.PrtStnCode=StsnMast.StnCode) inner join AchdMast on PartyMast.PrtAhCode=AchdMast.AhCode order by PrtName", dbComDatabase, adOpenKeyset, adLockOptimistic
    Else
        LRecset.Open mListSqlExpr, dbComDatabase, adOpenKeyset, adLockOptimistic
    End If

    Set fcmb.BRecset = BRecset
    Set fcmb.LRecset = LRecset
    Set fcmb.frmAccessMaster = New frmPartyMast

    fcmb.ClearFlexColList
    fcmb.AddFlexColList mFldName:="PrtCode", mFldTitle:="PrtCode", mFldWidth:=0, mFldAlign:=8
    fcmb.AddFlexColList mFldName:="PrtName", mFldTitle:="Party Name", mFldWidth:=3000, mFldAlign:=1
    fcmb.AddFlexColList mFldName:="AraName", mFldTitle:="Area", mFldWidth:=2500, mFldAlign:=1
    fcmb.AddFlexColList mFldName:="StnName", mFldTitle:="Station", mFldWidth:=2500, mFldAlign:=1

    fcmb.Init

ElseIf blnPartyGrpMastList1 = True Then
    Load fcmb
    fcmb.lblFormHeading.Caption = "Party Group Master"
    fcmb.TableName = "PartyGrpMst"
    fcmb.BoundField = "PgmCode"
    fcmb.ListField = "PgmName"
    fcmb.lblSearchCaption.Caption = "Name:"
    
    BRecset.Open fcmb.TableName, dbMdsDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect
    BRecset.Index = fcmb.BoundField
    If mListSqlExpr = "" Then
        LRecset.Open "Select PartyGrpMst.* from PartyGrpMst order by PgmName", dbMdsDatabase, adOpenKeyset, adLockOptimistic
    Else
        LRecset.Open mListSqlExpr, dbMdsDatabase, adOpenKeyset, adLockOptimistic
    End If
    
    Set fcmb.BRecset = BRecset
    Set fcmb.LRecset = LRecset
    Set fcmb.frmAccessMaster = New frmPartyGrpMast

    fcmb.ClearFlexColList
    fcmb.AddFlexColList mFldName:="PgmCode", mFldTitle:="PgmCode", mFldWidth:=0, mFldAlign:=7
    fcmb.AddFlexColList mFldName:="PgmName", mFldTitle:="Group Name", mFldWidth:=3000, mFldAlign:=1

    fcmb.Init

Else
    Err.Raise Number:=vbObjectError + 513, Description:="clsMdsFlexSearch_Class_Init_425"
    
End If

End Sub

Public Sub ReInit()
If blnUserRoleMastList1 = True Then
    BRecset.Close: LRecset.Close
    
    BRecset.Open fcmb.TableName, dbCmpDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect
    BRecset.Index = fcmb.BoundField
    If mListSqlExpr = "" Then
        LRecset.Open "Select * from " & fcmb.TableName & " order by " & fcmb.ListField, dbCmpDatabase, adOpenKeyset, adLockOptimistic
    Else
        LRecset.Open mListSqlExpr, dbCmpDatabase, adOpenKeyset, adLockOptimistic
    End If
    fcmb.ReInit
    
ElseIf blnUserMastList1 = True Then
    BRecset.Close: LRecset.Close
    
    BRecset.Open fcmb.TableName, dbCmpDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect
    BRecset.Index = fcmb.BoundField
    If mListSqlExpr = "" Then
        LRecset.Open "Select * from " & fcmb.TableName & " order by " & fcmb.ListField, dbCmpDatabase, adOpenKeyset, adLockOptimistic
    Else
        LRecset.Open mListSqlExpr, dbCmpDatabase, adOpenKeyset, adLockOptimistic
    End If
    fcmb.ReInit
    
ElseIf blnSubItmMastList1 = True Then
    BRecset.Close: LRecset.Close
    
    BRecset.Open fcmb.TableName, dbMdsDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect
    BRecset.Index = fcmb.BoundField
    If mListSqlExpr = "" Then
        LRecset.Open "Select SubItmMast.*,SubItmGrpMst.SigName from (SubItmMast" _
            & " inner join ProdMast on SubItmMast.SimItmCode = ProdMast.ItmCode)" _
            & " inner join SubItmGrpMst on SubItmMast.SimSigCode = SubItmGrpMst.SigCode" _
            & " order by SimName", dbComDatabase, adOpenKeyset, adLockOptimistic
    Else
        LRecset.Open mListSqlExpr, dbComDatabase, adOpenKeyset, adLockOptimistic
    End If
    fcmb.ReInit
    
ElseIf blnSubItmGrpMastList1 = True Then
    BRecset.Close: LRecset.Close
    
    BRecset.Open fcmb.TableName, dbMdsDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect
    BRecset.Index = fcmb.BoundField
    If mListSqlExpr = "" Then
        LRecset.Open "Select SubItmGrpMst.* from SubItmGrpMst order by SigName", dbMdsDatabase, adOpenKeyset, adLockOptimistic
    Else
        LRecset.Open mListSqlExpr, dbMdsDatabase, adOpenKeyset, adLockOptimistic
    End If
    fcmb.ReInit
    
ElseIf blnBalSimRefNoList1 = True Then
    BRecset.Close: LRecset.Close
    
    If mBoundSqlExpr = "" Then
        BRecset.Open "Select *,SimRefNo+'_'+format(ItrCode,'" & cLONGCODESTRFMT & "') as SimRefNoUnq from (" _
            & "Select SimRefNo,ItrCode,sum(Qty) as Qty_sum from (" _
            & "Select PurItrCode as ItrCode,PurSimRefNo as SimRefNo,PurQty as Qty from PurchDtl" _
            & " inner join PurchHdr on PurchDtl.PurCode = PurchHdr.PuhCode" _
            & IIf(mFiltCond <> "", " where " & mFiltCond, "") _
            & " Union All " _
            & "Select SalItrCode as ItrCode,SalSimRefNo as SimRefNo,(SalQty*-1) as Qty from SaleDtl" _
            & " inner join SaleHdr on SaleDtl.SalCode = SaleHdr.SahCode" _
            & IIf(mFiltCond <> "", " where " & mFiltCond, "") _
            & ")" _
            & " group by ItrCode,SimRefNo order by ItrCode,SimRefNo" _
            & ") as t1 inner join ProdRef on t1.ItrCode = ProdRef.ItrRefCode" _
            & " where Qty_sum > 0" _
            , dbComDatabase, adOpenKeyset, adLockOptimistic
    Else
        BRecset.Open mBoundSqlExpr, dbComDatabase, adOpenKeyset, adLockOptimistic
    End If
    If mListSqlExpr = "" Then
        LRecset.Open "Select *,SimRefNo+'_'+format(ItrCode,'" & cLONGCODESTRFMT & "') as SimRefNoUnq from (" _
            & "Select SimRefNo,ItrCode,sum(Qty) as Qty_sum from (" _
            & "Select PurItrCode as ItrCode,PurSimRefNo as SimRefNo,PurQty as Qty from PurchDtl" _
            & " inner join PurchHdr on PurchDtl.PurCode=PurchHdr.PuhCode" _
            & IIf(mFiltCond <> "", " where " & mFiltCond, "") _
            & " Union All " _
            & "Select SalItrCode as ItrCode,SalSimRefNo as SimRefNo,(SalQty*-1) as Qty from SaleDtl" _
            & " inner join SaleHdr on SaleDtl.SalCode = SaleHdr.SahCode" _
            & IIf(mFiltCond <> "", " where " & mFiltCond, "") _
            & ")" _
            & " group by SimRefNo,ItrCode order by SimRefNo,ItrCode" _
            & ") as t1 inner join ProdRef on t1.ItrCode = ProdRef.ItrRefCode" _
            & " where Qty_sum > 0" _
            , dbComDatabase, adOpenKeyset, adLockOptimistic
    Else
        LRecset.Open mListSqlExpr, dbComDatabase, adOpenKeyset, adLockOptimistic
    End If
    fcmb.ReInit
    
ElseIf blnPartyMastList1 = True Then
    BRecset.Close: LRecset.Close
    
    BRecset.Open fcmb.TableName, dbMdsDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect
    BRecset.Index = fcmb.BoundField
    If mListSqlExpr = "" Then
        LRecset.Open "Select PartyMast.*,AreaMast.AraName,StsnMast.StnName,AchdMast.AhName from ((PartyMast inner join AreaMast on PartyMast.PrtAraCode=AreaMast.AraCode) inner join StsnMast on PartyMast.PrtStnCode=StsnMast.StnCode) inner join AchdMast on PartyMast.PrtAhCode=AchdMast.AhCode order by PrtName", dbComDatabase, adOpenKeyset, adLockOptimistic
    Else
        LRecset.Open mListSqlExpr, dbComDatabase, adOpenKeyset, adLockOptimistic
    End If
    fcmb.ReInit
    
ElseIf blnPartyGrpMastList1 = True Then
    BRecset.Close: LRecset.Close
    
    BRecset.Open fcmb.TableName, dbMdsDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect
    BRecset.Index = fcmb.BoundField
    If mListSqlExpr = "" Then
        LRecset.Open "Select PartyGrpMst.* from PartyGrpMst order by PgmName", dbMdsDatabase, adOpenKeyset, adLockOptimistic
    Else
        LRecset.Open mListSqlExpr, dbMdsDatabase, adOpenKeyset, adLockOptimistic
    End If
    
    fcmb.ReInit
    
Else
    Err.Raise Number:=vbObjectError + 513, Description:="clsMdsFlexSearch_Class_ReInit_799"
End If

End Sub

Public Sub Requery()
fcmb.Requery

End Sub

Private Sub Class_Terminate()
CloseTable BRecset
CloseTable LRecset

End Sub

Public Function BFieldValue(ByVal mFieldName As String) As Variant
BFieldValue = BRecset.fields(mFieldName)
End Function

Public Function LFieldValue(ByVal mFieldName As String) As Variant
LFieldValue = LRecset.fields(mFieldName)
End Function

