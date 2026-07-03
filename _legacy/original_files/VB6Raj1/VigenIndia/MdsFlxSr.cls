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
Public blnMedItmMastList As Boolean, blnMedItmGrpMastList As Boolean, blnMedPrtMastList As Boolean, blnMedPrtGrpMastList As Boolean, blnBalMdiRefNoList As Boolean
Public blnOldSalListBySalNo As Boolean

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
    
If blnMedItmMastList = True Then
    Load fcmb
    fcmb.lblFormHeading.Caption = "Item Master"
    fcmb.TableName = "MedItmMast"
    fcmb.BoundField = "MdiCode"
    fcmb.ListField = "MdiName"
    fcmb.lblSearchCaption.Caption = "Name:"
    
    BRecset.open fcmb.TableName, dbMdsDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect
    BRecset.Index = fcmb.BoundField
    If mListSqlExpr = "" Then
        LRecset.open "Select MedItmMast.*,MedItmGrpMst.MigName from (MedItmMast" _
            & " inner join ProdMast on MedItmMast.MdiItmCode = ProdMast.ItmCode)" _
            & " inner join MedItmGrpMst on MedItmMast.MdiMigCode = MedItmGrpMst.MigCode" _
            & " order by MdiName", dbComDatabase, adOpenKeyset, adLockOptimistic
    Else
        LRecset.open mListSqlExpr, dbComDatabase, adOpenKeyset, adLockOptimistic
    End If

    Set fcmb.BRecset = BRecset
    Set fcmb.LRecset = LRecset
    Set fcmb.frmAccessMaster = New frmMedItemMast
    
    fcmb.ClearFlexColList
    fcmb.AddFlexColList mFldName:="MdiCode", mFldTitle:="MdiCode", mFldWidth:=0, mFldAlign:=8
    fcmb.AddFlexColList mFldName:="MdiName", mFldTitle:="Item Name", mFldWidth:=3500, mFldAlign:=1
    fcmb.AddFlexColList mFldName:="MigName", mFldTitle:="Group Name", mFldWidth:=1500, mFldAlign:=1
    fcmb.AddFlexColList mFldName:="MdiPurchRate", mFldTitle:="P.Rate", mFldWidth:=1400, mFldAlign:=7
    fcmb.AddFlexColList mFldName:="MdiSaleRate", mFldTitle:="S.Rate", mFldWidth:=1400, mFldAlign:=7
    
    fcmb.Init
    
ElseIf blnMedItmGrpMastList = True Then
    Load fcmb
    fcmb.lblFormHeading.Caption = "Item Group Master"
    fcmb.TableName = "MedItmGrpMst"
    fcmb.BoundField = "MigCode"
    fcmb.ListField = "MigName"
    fcmb.lblSearchCaption.Caption = "Name:"
    
    BRecset.open fcmb.TableName, dbMdsDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect
    BRecset.Index = fcmb.BoundField
    If mListSqlExpr = "" Then
        LRecset.open "Select MedItmGrpMst.* from MedItmGrpMst order by MigName", dbMdsDatabase, adOpenKeyset, adLockOptimistic
    Else
        LRecset.open mListSqlExpr, dbMdsDatabase, adOpenKeyset, adLockOptimistic
    End If

    Set fcmb.BRecset = BRecset
    Set fcmb.LRecset = LRecset
    Set fcmb.frmAccessMaster = New frmMedItemGrpMast
    
    fcmb.ClearFlexColList
    fcmb.AddFlexColList mFldName:="MigCode", mFldTitle:="MigCode", mFldWidth:=0, mFldAlign:=8
    fcmb.AddFlexColList mFldName:="MigName", mFldTitle:="Group Name", mFldWidth:=3000, mFldAlign:=1
    
    fcmb.Init
    
ElseIf blnBalMdiRefNoList = True Then
    Load fcmb
    fcmb.lblFormHeading.Caption = "Item Reference List"
    fcmb.TableName = "[Query]"
    fcmb.BoundField = "ItrCode"
    fcmb.ListField = "MdiRefNo"
    fcmb.ListFieldUnq = "MdiRefNoUnq"
    fcmb.lblSearchCaption.Caption = "Ref.No:"
    
    Rem difference between BoundSql and ListSql is only it's order by sequence
    Rem while preparing query on entry form let remain inner join of MedPurchDtl but saledtl inner join only in form edit mode
    Rem list will show entries of completed purchase entry but under unsaved entries of purchase in add mode so as to avoid duplicate entry of any unsaved entry
    If mBoundSqlExpr = "" Then
        BRecset.open "Select *,MdiRefNo+'_'+format(ItrCode,'" & cLONGCODESTRFMT & "') as MdiRefNoUnq from (" _
            & "Select MdiRefNo,ItrCode,sum(Qty) as Qty_sum from (" _
            & "Select PurItrCode as ItrCode,PurMdiRefNo as MdiRefNo,PurQty as Qty from MedPurchDtl" _
            & " inner join MedPurchHdr on MedPurchDtl.PurCode = MedPurchHdr.PuhCode" _
            & IIf(mFiltCond <> "", " where " & mFiltCond, "") _
            & " Union All " _
            & "Select SalItrCode as ItrCode,SalMdiRefNo as MdiRefNo,(SalQty*-1) as Qty from MedSaleDtl" _
            & " inner join MedSaleHdr on MedSaleDtl.SalCode = MedSaleHdr.SahCode" _
            & IIf(mFiltCond <> "", " where " & mFiltCond, "") _
            & ")" _
            & " group by ItrCode,MdiRefNo order by ItrCode,MdiRefNo" _
            & ") as t1 inner join ProdRef on t1.ItrCode = ProdRef.ItrRefCode" _
            & " where Qty_sum > 0" _
            , dbComDatabase, adOpenKeyset, adLockOptimistic
    Else
        BRecset.open mBoundSqlExpr, dbComDatabase, adOpenKeyset, adLockOptimistic
    End If
    If mListSqlExpr = "" Then
        LRecset.open "Select *,MdiRefNo+'_'+format(ItrCode,'" & cLONGCODESTRFMT & "') as MdiRefNoUnq from (" _
            & "Select MdiRefNo,ItrCode,sum(Qty) as Qty_sum from (" _
            & "Select PurItrCode as ItrCode,PurMdiRefNo as MdiRefNo,PurQty as Qty from MedPurchDtl" _
            & " inner join MedPurchHdr on MedPurchDtl.PurCode=MedPurchHdr.PuhCode" _
            & IIf(mFiltCond <> "", " where " & mFiltCond, "") _
            & " Union All " _
            & "Select SalItrCode as ItrCode,SalMdiRefNo as MdiRefNo,(SalQty*-1) as Qty from MedSaleDtl" _
            & " inner join MedSaleHdr on MedSaleDtl.SalCode = MedSaleHdr.SahCode" _
            & IIf(mFiltCond <> "", " where " & mFiltCond, "") _
            & ")" _
            & " group by MdiRefNo,ItrCode order by MdiRefNo,ItrCode" _
            & ") as t1 inner join ProdRef on t1.ItrCode = ProdRef.ItrRefCode" _
            & " where Qty_sum > 0" _
            , dbComDatabase, adOpenKeyset, adLockOptimistic
    Else
        LRecset.open mListSqlExpr, dbComDatabase, adOpenKeyset, adLockOptimistic
    End If

    Set fcmb.BRecset = BRecset
    Set fcmb.LRecset = LRecset
    Rem Set fcmb.frmAccessMaster = New frmMedItemMast
    
    fcmb.ClearFlexColList
    fcmb.AddFlexColList mFldName:="ItrCode", mFldTitle:="ItrCode", mFldWidth:=0, mFldAlign:=7
    fcmb.AddFlexColList mFldName:="MdiRefNo", mFldTitle:="Item Ref.No.", mFldWidth:=3000, mFldAlign:=1
    fcmb.AddFlexColList mFldName:="Qty_sum", mFldTitle:="Qty", mFldWidth:=1500, mFldAlign:=7
    fcmb.AddFlexColList mFldName:="ItrSRate", mFldTitle:="Rate", mFldWidth:=1500, mFldAlign:=7
    fcmb.AddFlexColList mFldName:="MdiRefNoUnq", mFldTitle:="MdiRefNoUnq", mFldWidth:=0, mFldAlign:=7
    
    fcmb.Init
    
ElseIf blnMedPrtMastList = True Then
    Load fcmb
    fcmb.lblFormHeading.Caption = "Party Master"
    fcmb.TableName = "MedPrtMast"
    fcmb.BoundField = "MptCode"
    fcmb.ListField = "MptName"
    fcmb.lblSearchCaption.Caption = "Name:"
    
    BRecset.open fcmb.TableName, dbMdsDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect
    BRecset.Index = fcmb.BoundField
    If mListSqlExpr = "" Then
        LRecset.open "Select MedPrtMast.*,AreaMast.AraName,StsnMast.StnName,AchdMast.AhName from ((MedPrtMast inner join AreaMast on MedPrtMast.MptAraCode=AreaMast.AraCode) inner join StsnMast on MedPrtMast.MptStnCode=StsnMast.StnCode) inner join AchdMast on MedPrtMast.MptAhCode=AchdMast.AhCode order by MptName", dbComDatabase, adOpenKeyset, adLockOptimistic
    Else
        LRecset.open mListSqlExpr, dbComDatabase, adOpenKeyset, adLockOptimistic
    End If

    Set fcmb.BRecset = BRecset
    Set fcmb.LRecset = LRecset
    Set fcmb.frmAccessMaster = New frmMedPartyMast

    fcmb.ClearFlexColList
    fcmb.AddFlexColList mFldName:="MptCode", mFldTitle:="MptCode", mFldWidth:=0, mFldAlign:=8
    fcmb.AddFlexColList mFldName:="MptName", mFldTitle:="Party Name", mFldWidth:=3000, mFldAlign:=1
    fcmb.AddFlexColList mFldName:="AraName", mFldTitle:="Area", mFldWidth:=2500, mFldAlign:=1
    fcmb.AddFlexColList mFldName:="StnName", mFldTitle:="Station", mFldWidth:=2500, mFldAlign:=1

    fcmb.Init

ElseIf blnMedPrtGrpMastList = True Then
    Load fcmb
    fcmb.lblFormHeading.Caption = "Party Group Master"
    fcmb.TableName = "MedPrtGrpMst"
    fcmb.BoundField = "MpgCode"
    fcmb.ListField = "MpgName"
    fcmb.lblSearchCaption.Caption = "Name:"
    
    BRecset.open fcmb.TableName, dbMdsDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect
    BRecset.Index = fcmb.BoundField
    If mListSqlExpr = "" Then
        LRecset.open "Select MedPrtGrpMst.* from MedPrtGrpMst order by MpgName", dbMdsDatabase, adOpenKeyset, adLockOptimistic
    Else
        LRecset.open mListSqlExpr, dbMdsDatabase, adOpenKeyset, adLockOptimistic
    End If
    
    Set fcmb.BRecset = BRecset
    Set fcmb.LRecset = LRecset
    Set fcmb.frmAccessMaster = New frmMedPartyGrpMast

    fcmb.ClearFlexColList
    fcmb.AddFlexColList mFldName:="MpgCode", mFldTitle:="MpgCode", mFldWidth:=0, mFldAlign:=7
    fcmb.AddFlexColList mFldName:="MpgName", mFldTitle:="Party Group Name", mFldWidth:=3000, mFldAlign:=1

    fcmb.Init

ElseIf blnOldSalListBySalNo = True Then
    Load fcmb
    fcmb.lblFormHeading.Caption = "Medical Sale Bill List by Bill No."
    fcmb.TableName = "MedSaleHdr"
    fcmb.BoundField = "SahCode"
    fcmb.ListField = "SahVchNo"
    fcmb.ListFieldUnq = "SahVchNoUnq"
    fcmb.lblSearchCaption.Caption = "No.:"
    
    BRecset.open fcmb.TableName, dbMdsDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect
    BRecset.Index = fcmb.BoundField
    If mListSqlExpr = "" Then
        LRecset.open "Select MedSaleHdr.SahCode,MedSaleHdr.SahVchNo,MedSaleHdr.SahDate,MedSaleHdr.SahAmount,MedSaleHdr.SahAdvAmt,MedSaleHdr.SahRecdAmt,MedSaleHdr.SahDepoAmt,MedSaleHdr.SahRefuAmt,MedSaleHdr.SahBalAmt,cstr(MedSaleHdr.SahVchNo)+'_'+format(MedSaleHdr.SahCode,'" & cLONGCODESTRFMT & "') as SahVchNoUnq,PatMast.PttName,PatMast.PttRegNo,PatMast.PttRefName,AreaMast.AraName,StsnMast.StnName" _
            & " from ((MedSaleHdr inner join PatMast on MedSaleHdr.SahPttCode = PatMast.PttCode)" _
            & " inner join AreaMast on PatMast.PttAraCode = AreaMast.AraCode)" _
            & " inner join StsnMast on PatMast.PttStnCode = StsnMast.StnCode" _
            & IIf(mFiltCond <> "", " where " & mFiltCond, "") _
            & " order by SahVchNo,SahCode", dbComDatabase, adOpenKeyset, adLockOptimistic
    Else
        LRecset.open mListSqlExpr, dbComDatabase, adOpenKeyset, adLockOptimistic
    End If
    
    Set fcmb.BRecset = BRecset
    Set fcmb.LRecset = LRecset
    #If APP_VIGEN = True Then
        Set fcmb.frmAccessMaster = New frmMedicalSale
    #End If
    
    fcmb.ClearFlexColList
    fcmb.AddFlexColList mFldName:="SahCode", mFldTitle:="SahCode", mFldWidth:=0, mFldAlign:=7
    fcmb.AddFlexColList mFldName:="SahVchNo", mFldTitle:="Bill No", mFldWidth:=1200, mFldAlign:=7
    fcmb.AddFlexColList mFldName:="SahDate", mFldTitle:="Date", mFldWidth:=1300, mFldAlign:=1
    fcmb.AddFlexColList mFldName:="SahAmount", mFldTitle:="Sale Amt", mFldWidth:=1200, mFldAlign:=7
    fcmb.AddFlexColList mFldName:="SahBalAmt", mFldTitle:="Due.Amt", mFldWidth:=1200, mFldAlign:=7
    fcmb.AddFlexColList mFldName:="PttName", mFldTitle:="Patient Name", mFldWidth:=2500, mFldAlign:=1
    fcmb.AddFlexColList mFldName:="PttRegNo", mFldTitle:="RegNo", mFldWidth:=1200, mFldAlign:=7
    fcmb.AddFlexColList mFldName:="PttRefName", mFldTitle:="Care of", mFldWidth:=2000, mFldAlign:=1
    fcmb.AddFlexColList mFldName:="AraName", mFldTitle:="Area", mFldWidth:=1750, mFldAlign:=1
    fcmb.AddFlexColList mFldName:="StnName", mFldTitle:="Station", mFldWidth:=1750, mFldAlign:=1
    fcmb.AddFlexColList mFldName:="SahRecdAmt", mFldTitle:="Recd.Amt", mFldWidth:=1200, mFldAlign:=7
    fcmb.AddFlexColList mFldName:="SahDepoAmt", mFldTitle:="Depo.Amt", mFldWidth:=1200, mFldAlign:=7
    fcmb.AddFlexColList mFldName:="SahRefuAmt", mFldTitle:="Refd.Amt", mFldWidth:=1200, mFldAlign:=7
    
    fcmb.Init

Else
    Err.Raise Number:=vbObjectError + 513, Description:="clsMdsFlexSearch_Class_Init_425"
    
End If

End Sub

Public Sub ReInit()
    
BRecset.Close: LRecset.Close
If blnMedItmMastList = True Then
    BRecset.open fcmb.TableName, dbMdsDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect
    BRecset.Index = fcmb.BoundField
    If mListSqlExpr = "" Then
        LRecset.open "Select MedItmMast.*,MedItmGrpMst.MigName from (MedItmMast" _
            & " inner join ProdMast on MedItmMast.MdiItmCode = ProdMast.ItmCode)" _
            & " inner join MedItmGrpMst on MedItmMast.MdiMigCode = MedItmGrpMst.MigCode" _
            & " order by MdiName", dbComDatabase, adOpenKeyset, adLockOptimistic
    Else
        LRecset.open mListSqlExpr, dbComDatabase, adOpenKeyset, adLockOptimistic
    End If
    fcmb.ReInit
    
ElseIf blnMedItmGrpMastList = True Then
    BRecset.open fcmb.TableName, dbMdsDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect
    BRecset.Index = fcmb.BoundField
    If mListSqlExpr = "" Then
        LRecset.open "Select MedItmGrpMst.* from MedItmGrpMst order by MigName", dbMdsDatabase, adOpenKeyset, adLockOptimistic
    Else
        LRecset.open mListSqlExpr, dbMdsDatabase, adOpenKeyset, adLockOptimistic
    End If
    fcmb.ReInit
    
ElseIf blnBalMdiRefNoList = True Then
    If mBoundSqlExpr = "" Then
        BRecset.open "Select *,MdiRefNo+'_'+format(ItrCode,'" & cLONGCODESTRFMT & "') as MdiRefNoUnq from (" _
            & "Select MdiRefNo,ItrCode,sum(Qty) as Qty_sum from (" _
            & "Select PurItrCode as ItrCode,PurMdiRefNo as MdiRefNo,PurQty as Qty from MedPurchDtl" _
            & " inner join MedPurchHdr on MedPurchDtl.PurCode = MedPurchHdr.PuhCode" _
            & IIf(mFiltCond <> "", " where " & mFiltCond, "") _
            & " Union All " _
            & "Select SalItrCode as ItrCode,SalMdiRefNo as MdiRefNo,(SalQty*-1) as Qty from MedSaleDtl" _
            & " inner join MedSaleHdr on MedSaleDtl.SalCode = MedSaleHdr.SahCode" _
            & IIf(mFiltCond <> "", " where " & mFiltCond, "") _
            & ")" _
            & " group by ItrCode,MdiRefNo order by ItrCode,MdiRefNo" _
            & ") as t1 inner join ProdRef on t1.ItrCode = ProdRef.ItrRefCode" _
            & " where Qty_sum > 0" _
            , dbComDatabase, adOpenKeyset, adLockOptimistic
    Else
        BRecset.open mBoundSqlExpr, dbComDatabase, adOpenKeyset, adLockOptimistic
    End If
    If mListSqlExpr = "" Then
        LRecset.open "Select *,MdiRefNo+'_'+format(ItrCode,'" & cLONGCODESTRFMT & "') as MdiRefNoUnq from (" _
            & "Select MdiRefNo,ItrCode,sum(Qty) as Qty_sum from (" _
            & "Select PurItrCode as ItrCode,PurMdiRefNo as MdiRefNo,PurQty as Qty from MedPurchDtl" _
            & " inner join MedPurchHdr on MedPurchDtl.PurCode = MedPurchHdr.PuhCode" _
            & IIf(mFiltCond <> "", " where " & mFiltCond, "") _
            & " Union All " _
            & "Select SalItrCode as ItrCode,SalMdiRefNo as MdiRefNo,(SalQty*-1) as Qty from MedSaleDtl" _
            & " inner join MedSaleHdr on MedSaleDtl.SalCode = MedSaleHdr.SahCode" _
            & IIf(mFiltCond <> "", " where " & mFiltCond, "") _
            & ")" _
            & " group by MdiRefNo,ItrCode order by MdiRefNo,ItrCode" _
            & ") as t1 inner join ProdRef on t1.ItrCode = ProdRef.ItrRefCode" _
            & " where Qty_sum > 0" _
            , dbComDatabase, adOpenKeyset, adLockOptimistic
    Else
        LRecset.open mListSqlExpr, dbComDatabase, adOpenKeyset, adLockOptimistic
    End If
    fcmb.ReInit
    
ElseIf blnMedPrtMastList = True Then
    BRecset.open fcmb.TableName, dbMdsDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect
    BRecset.Index = fcmb.BoundField
    If mListSqlExpr = "" Then
        LRecset.open "Select MedPrtMast.*,AreaMast.AraName,StsnMast.StnName,AchdMast.AhName from ((MedPrtMast inner join AreaMast on MedPrtMast.MptAraCode=AreaMast.AraCode) inner join StsnMast on MedPrtMast.MptStnCode=StsnMast.StnCode) inner join AchdMast on MedPrtMast.MptAhCode = AchdMast.AhCode order by MptName", dbComDatabase, adOpenKeyset, adLockOptimistic
    Else
        LRecset.open mListSqlExpr, dbComDatabase, adOpenKeyset, adLockOptimistic
    End If
    fcmb.ReInit
    
ElseIf blnMedPrtGrpMastList = True Then
    BRecset.open fcmb.TableName, dbMdsDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect
    BRecset.Index = fcmb.BoundField
    If mListSqlExpr = "" Then
        LRecset.open "Select MedPrtGrpMst.* from MedPrtGrpMst order by MpgName", dbMdsDatabase, adOpenKeyset, adLockOptimistic
    Else
        LRecset.open mListSqlExpr, dbMdsDatabase, adOpenKeyset, adLockOptimistic
    End If
    
    fcmb.ReInit
    
ElseIf blnOldSalListBySalNo = True Then
    BRecset.open fcmb.TableName, dbMdsDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect
    BRecset.Index = fcmb.BoundField
    If mListSqlExpr = "" Then
        LRecset.open "Select MedSaleHdr.SahCode,MedSaleHdr.SahVchNo,MedSaleHdr.SahDate,MedSaleHdr.SahAmount,MedSaleHdr.SahAdvAmt,MedSaleHdr.SahRecdAmt,MedSaleHdr.SahDepoAmt,MedSaleHdr.SahRefuAmt,MedSaleHdr.SahBalAmt,cstr(MedSaleHdr.SahVchNo)+'_'+format(MedSaleHdr.SahCode,'" & cLONGCODESTRFMT & "') as SahVchNoUnq,PatMast.PttName,PatMast.PttRegNo,PatMast.PttRefName,AreaMast.AraName,StsnMast.StnName" _
            & " from ((MedSaleHdr inner join PatMast on MedSaleHdr.SahPttCode = PatMast.PttCode)" _
            & " inner join AreaMast on PatMast.PttAraCode = AreaMast.AraCode)" _
            & " inner join StsnMast on PatMast.PttStnCode = StsnMast.StnCode" _
            & IIf(mFiltCond <> "", " where " & mFiltCond, "") _
            & " order by SahVchNo,SahCode", dbComDatabase, adOpenKeyset, adLockOptimistic
    Else
        LRecset.open mListSqlExpr, dbComDatabase, adOpenKeyset, adLockOptimistic
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

