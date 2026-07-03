VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "clsNcbFlexSearch"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False

Option Explicit

Public fcmb As New frmFlexSearchList
Public dbAcDatabase As ADODB.Connection, dbStDatabase As ADODB.Connection, dbNcbDatabase As ADODB.Connection, dbCmpDatabase As ADODB.Connection, dbComDatabase As ADODB.Connection
Public mListSqlExpr As String, mBoundSqlExpr As String, mFiltCond As String
Public blnUserRoleMastList As Boolean, blnUserMastList As Boolean
Public blnSubItmMastList As Boolean, blnSubItmGrpMastList As Boolean, blnPartyMastList As Boolean, blnPartyGrpMastList As Boolean, blnBalItrRefNoList As Boolean, blnStudCatgMastList As Boolean, blnStudMastListByName As Boolean, blnStudMastListByRegNo As Boolean, blnGodownMastList As Boolean
Public blnBookGrpMastList As Boolean, blnBookAthMastList As Boolean, blnBookPubMastList As Boolean, blnBookEdtnMastList As Boolean, blnBookMastList As Boolean
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
If blnUserRoleMastList = True Then
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
    
ElseIf blnUserMastList = True Then
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
    
ElseIf blnSubItmMastList = True Then
    Load fcmb
    fcmb.lblFormHeading.Caption = "Sub Item Master"
    fcmb.TableName = "SubItmMast"
    fcmb.BoundField = "SimCode"
    fcmb.ListField = "SimName"
    fcmb.lblSearchCaption.Caption = "Name:"
    
    BRecset.Open fcmb.TableName, dbNcbDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect
    BRecset.Index = fcmb.BoundField
    If mListSqlExpr = "" Then
        LRecset.Open "Select SubItmMast.*,SubItmGrpMst.SigName,ProdMast.ItmName" _
            & " from (SubItmMast" _
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
    fcmb.AddFlexColList mFldName:="ItmName", mFldTitle:="Master Item Name", mFldWidth:=2000, mFldAlign:=1
    fcmb.AddFlexColList mFldName:="SimPurchRate", mFldTitle:="P.Rate", mFldWidth:=1400, mFldAlign:=7
    fcmb.AddFlexColList mFldName:="SimSaleRate", mFldTitle:="S.Rate", mFldWidth:=1400, mFldAlign:=7
    
    fcmb.Init
    
ElseIf blnSubItmGrpMastList = True Then
    Load fcmb
    fcmb.lblFormHeading.Caption = "Item Group Master"
    fcmb.TableName = "SubItmGrpMst"
    fcmb.BoundField = "SigCode"
    fcmb.ListField = "SigName"
    fcmb.lblSearchCaption.Caption = "Name:"
    
    BRecset.Open fcmb.TableName, dbNcbDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect
    BRecset.Index = fcmb.BoundField
    If mListSqlExpr = "" Then
        LRecset.Open "Select SubItmGrpMst.* from SubItmGrpMst order by SigName", dbNcbDatabase, adOpenKeyset, adLockOptimistic
    Else
        LRecset.Open mListSqlExpr, dbNcbDatabase, adOpenKeyset, adLockOptimistic
    End If

    Set fcmb.BRecset = BRecset
    Set fcmb.LRecset = LRecset
    Set fcmb.frmAccessMaster = New frmSubItemGrpMast
    
    fcmb.ClearFlexColList
    fcmb.AddFlexColList mFldName:="SigCode", mFldTitle:="SigCode", mFldWidth:=0, mFldAlign:=8
    fcmb.AddFlexColList mFldName:="SigName", mFldTitle:="Group Name", mFldWidth:=3000, mFldAlign:=1
    
    fcmb.Init
    
ElseIf blnBalItrRefNoList = True Then
    Load fcmb
    fcmb.lblFormHeading.Caption = "Item Reference List"
    fcmb.TableName = "[Query]"
    fcmb.BoundField = "ItrCode"
    fcmb.ListField = "ItrRefNo"
    fcmb.ListFieldUnq = "ItrRefNoUnq"
    fcmb.lblSearchCaption.Caption = "Ref.No:"
    
    Rem difference between BoundSql and ListSql is only it's order by sequence
    Rem while preparing query on entry form let remain inner join of PurchDtl but saledtl inner join only in form edit mode
    Rem list will show entries of completed purchase entry but under unsaved entries of purchase in add mode so as to avoid duplicate entry of any unsaved entry
    If mBoundSqlExpr = "" Then
        BRecset.Open "Select *,ItrRefNo+'_'+format(ItrCode,'" & cLONGCODESTRFMT & "') as ItrRefNoUnq from (" _
            & "Select ItrRefNo,ItrCode,sum(Qty) as Qty_sum from (" _
            & "Select PurItrCode as ItrCode,PurItrRefNo as ItrRefNo,PurQty as Qty from PurchDtl" _
            & " inner join PurchHdr on PurchDtl.PurCode = PurchHdr.PuhCode" _
            & IIf(mFiltCond <> "", " where " & mFiltCond, "") _
            & " Union All " _
            & "Select SalItrCode as ItrCode,SalItrRefNo as ItrRefNo,(SalQty*-1) as Qty from SaleDtl" _
            & " inner join SaleHdr on SaleDtl.SalCode = SaleHdr.SahCode" _
            & IIf(mFiltCond <> "", " where " & mFiltCond, "") _
            & ")" _
            & " group by ItrCode,ItrRefNo order by ItrCode,ItrRefNo" _
            & ") as t1 inner join ProdRef on t1.ItrCode = ProdRef.ItrRefCode" _
            & " where Qty_sum > 0" _
            , dbComDatabase, adOpenKeyset, adLockOptimistic
    Else
        BRecset.Open mBoundSqlExpr, dbComDatabase, adOpenKeyset, adLockOptimistic
    End If
    If mListSqlExpr = "" Then
        LRecset.Open "Select *,ItrRefNo+'_'+format(ItrCode,'" & cLONGCODESTRFMT & "') as ItrRefNoUnq from (" _
            & "Select ItrRefNo,ItrCode,sum(Qty) as Qty_sum from (" _
            & "Select PurItrCode as ItrCode,PurItrRefNo as ItrRefNo,PurQty as Qty from PurchDtl" _
            & " inner join PurchHdr on PurchDtl.PurCode=PurchHdr.PuhCode" _
            & IIf(mFiltCond <> "", " where " & mFiltCond, "") _
            & " Union All " _
            & "Select SalItrCode as ItrCode,SalItrRefNo as ItrRefNo,(SalQty*-1) as Qty from SaleDtl" _
            & " inner join SaleHdr on SaleDtl.SalCode = SaleHdr.SahCode" _
            & IIf(mFiltCond <> "", " where " & mFiltCond, "") _
            & ")" _
            & " group by ItrRefNo,ItrCode order by ItrRefNo,ItrCode" _
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
    fcmb.AddFlexColList mFldName:="ItrRefNo", mFldTitle:="Item Ref.No.", mFldWidth:=3000, mFldAlign:=1
    fcmb.AddFlexColList mFldName:="Qty_sum", mFldTitle:="Qty", mFldWidth:=1500, mFldAlign:=7
    fcmb.AddFlexColList mFldName:="ItrSRate", mFldTitle:="Rate", mFldWidth:=1500, mFldAlign:=7
    fcmb.AddFlexColList mFldName:="ItrRefNoUnq", mFldTitle:="ItrRefNoUnq", mFldWidth:=0, mFldAlign:=7
    
    fcmb.Init
    
ElseIf blnPartyMastList = True Then
    Load fcmb
    fcmb.lblFormHeading.Caption = "Party Master"
    fcmb.TableName = "PartyMast"
    fcmb.BoundField = "PrtCode"
    fcmb.ListField = "PrtName"
    fcmb.lblSearchCaption.Caption = "Name:"
    
    BRecset.Open fcmb.TableName, dbNcbDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect
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

ElseIf blnPartyGrpMastList = True Then
    Load fcmb
    fcmb.lblFormHeading.Caption = "Party Group Master"
    fcmb.TableName = "PartyGrpMst"
    fcmb.BoundField = "PgmCode"
    fcmb.ListField = "PgmName"
    fcmb.lblSearchCaption.Caption = "Name:"
    
    BRecset.Open fcmb.TableName, dbNcbDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect
    BRecset.Index = fcmb.BoundField
    If mListSqlExpr = "" Then
        LRecset.Open "Select PartyGrpMst.* from PartyGrpMst order by PgmName", dbNcbDatabase, adOpenKeyset, adLockOptimistic
    Else
        LRecset.Open mListSqlExpr, dbNcbDatabase, adOpenKeyset, adLockOptimistic
    End If
    
    Set fcmb.BRecset = BRecset
    Set fcmb.LRecset = LRecset
    Set fcmb.frmAccessMaster = New frmPartyGrpMast

    fcmb.ClearFlexColList
    fcmb.AddFlexColList mFldName:="PgmCode", mFldTitle:="PgmCode", mFldWidth:=0, mFldAlign:=7
    fcmb.AddFlexColList mFldName:="PgmName", mFldTitle:="Group Name", mFldWidth:=3000, mFldAlign:=1

    fcmb.Init
    
ElseIf blnStudCatgMastList = True Then
    Load fcmb
    fcmb.lblFormHeading.Caption = "Student Category Master"
    fcmb.TableName = "StudCatgMst"
    fcmb.BoundField = "ScgCode"
    fcmb.ListField = "ScgName"
    fcmb.lblSearchCaption.Caption = "Name:"
    
    BRecset.Open fcmb.TableName, dbNcbDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect
    BRecset.Index = fcmb.BoundField
    If mListSqlExpr = "" Then
        LRecset.Open "Select * from " & fcmb.TableName & " order by " & fcmb.ListField, dbNcbDatabase, adOpenKeyset, adLockOptimistic
    Else
        LRecset.Open mListSqlExpr, dbNcbDatabase, adOpenKeyset, adLockOptimistic
    End If
    
    Set fcmb.BRecset = BRecset
    Set fcmb.LRecset = LRecset
    Set fcmb.frmAccessMaster = New frmStudentCatgMast
    
    fcmb.ClearFlexColList
    fcmb.AddFlexColList mFldName:="ScgCode", mFldTitle:="ScgCode", mFldWidth:=0, mFldAlign:=7
    fcmb.AddFlexColList mFldName:="ScgName", mFldTitle:="Student Category", mFldWidth:=3000, mFldAlign:=1
    
    fcmb.Init
    
ElseIf blnStudMastListByName = True Then
    Load fcmb
    fcmb.lblFormHeading.Caption = "Student Master"
    fcmb.TableName = "StudMast"
    fcmb.BoundField = "SdtCode"
    fcmb.ListField = "SdtName"
    fcmb.ListFieldUnq = "SdtNameUnq"
    fcmb.lblSearchCaption.Caption = "Name:"
    
    BRecset.Open fcmb.TableName, dbNcbDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect
    BRecset.Index = fcmb.BoundField
    If mListSqlExpr = "" Then
        LRecset.Open "Select StudMast.*,StudMast.SdtName+'_'+format(StudMast.SdtCode,'" & cLONGCODESTRFMT & "') as SdtNameUnq,AreaMast.AraName,StsnMast.StnName from (StudMast left join AreaMast on StudMast.SdtAraCode=AreaMast.AraCode) left join StsnMast on StudMast.SdtStnCode=StsnMast.StnCode order by SdtName,SdtCode,SdtRegNo", dbComDatabase, adOpenKeyset, adLockOptimistic
    Else
        LRecset.Open mListSqlExpr, dbComDatabase, adOpenKeyset, adLockOptimistic
    End If
    
    Set fcmb.BRecset = BRecset
    Set fcmb.LRecset = LRecset
    Set fcmb.frmAccessMaster = New frmStudentMast
    
    fcmb.ClearFlexColList
    fcmb.AddFlexColList mFldName:="SdtCode", mFldTitle:="SdtCode", mFldWidth:=0, mFldAlign:=7
    fcmb.AddFlexColList mFldName:="SdtName", mFldTitle:="Student Name", mFldWidth:=3000, mFldAlign:=1
    fcmb.AddFlexColList mFldName:="SdtRegNo", mFldTitle:="Reg.No", mFldWidth:=1500, mFldAlign:=7
    fcmb.AddFlexColList mFldName:="SdtRefName", mFldTitle:="Care of", mFldWidth:=2500, mFldAlign:=1
    fcmb.AddFlexColList mFldName:="AraName", mFldTitle:="Area", mFldWidth:=2500, mFldAlign:=1
    fcmb.AddFlexColList mFldName:="StnName", mFldTitle:="Station", mFldWidth:=2500, mFldAlign:=1
    
    fcmb.Init
    
ElseIf blnStudMastListByRegNo = True Then
    Load fcmb
    fcmb.lblFormHeading.Caption = "Student Master"
    fcmb.TableName = "StudMast"
    fcmb.BoundField = "SdtCode"
    fcmb.ListField = "SdtRegNo"
    fcmb.ListFieldUnq = "SdtRegNoUnq"
    fcmb.lblSearchCaption.Caption = "Reg.No:"
    
    BRecset.Open fcmb.TableName, dbNcbDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect
    BRecset.Index = fcmb.BoundField
    If mListSqlExpr = "" Then
        LRecset.Open "Select StudMast.*,cstr(StudMast.SdtRegNo)+'_'+format(StudMast.SdtCode,'" & cLONGCODESTRFMT & "') as SdtRegNoUnq,AreaMast.AraName,StsnMast.StnName from (StudMast left join AreaMast on StudMast.SdtAraCode=AreaMast.AraCode) left join StsnMast on StudMast.SdtStnCode=StsnMast.StnCode order by SdtRegNo,SdtName", dbComDatabase, adOpenKeyset, adLockOptimistic
    Else
        LRecset.Open mListSqlExpr, dbComDatabase, adOpenKeyset, adLockOptimistic
    End If
    
    Set fcmb.BRecset = BRecset
    Set fcmb.LRecset = LRecset
    Set fcmb.frmAccessMaster = New frmStudentMast
    
    fcmb.ClearFlexColList
    fcmb.AddFlexColList mFldName:="SdtCode", mFldTitle:="SdtCode", mFldWidth:=0, mFldAlign:=7
    fcmb.AddFlexColList mFldName:="SdtRegNo", mFldTitle:="Reg.No", mFldWidth:=1500, mFldAlign:=7
    fcmb.AddFlexColList mFldName:="SdtName", mFldTitle:="Student Name", mFldWidth:=3000, mFldAlign:=1
    fcmb.AddFlexColList mFldName:="SdtRefName", mFldTitle:="Care of", mFldWidth:=2500, mFldAlign:=1
    fcmb.AddFlexColList mFldName:="AraName", mFldTitle:="Area", mFldWidth:=2500, mFldAlign:=1
    fcmb.AddFlexColList mFldName:="StnName", mFldTitle:="Station", mFldWidth:=2500, mFldAlign:=1
    
    fcmb.Init
    
ElseIf blnGodownMastList = True Then
    Load fcmb
    fcmb.lblFormHeading.Caption = "Godown Master"
    fcmb.TableName = "GodownMast"
    fcmb.BoundField = "GdmCode"
    fcmb.ListField = "GdmName"
    fcmb.lblSearchCaption.Caption = "Name:"
    
    BRecset.Open fcmb.TableName, dbNcbDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect
    BRecset.Index = fcmb.BoundField
    If mListSqlExpr = "" Then
        LRecset.Open "Select * from " & fcmb.TableName & " order by " & fcmb.ListField, dbNcbDatabase, adOpenKeyset, adLockOptimistic
    Else
        LRecset.Open mListSqlExpr, dbNcbDatabase, adOpenKeyset, adLockOptimistic
    End If
    
    Set fcmb.BRecset = BRecset
    Set fcmb.LRecset = LRecset
    Set fcmb.frmAccessMaster = New frmGodownMast

    fcmb.ClearFlexColList
    fcmb.AddFlexColList mFldName:="GdmCode", mFldTitle:="GdmCode", mFldWidth:=0, mFldAlign:=7
    fcmb.AddFlexColList mFldName:="GdmName", mFldTitle:="Godown Name", mFldWidth:=3000, mFldAlign:=1

    fcmb.Init
    
ElseIf blnBookGrpMastList = True Then
    Load fcmb
    fcmb.lblFormHeading.Caption = "Book Group Master"
    fcmb.TableName = "BookGrpMst"
    fcmb.BoundField = "BgpCode"
    fcmb.ListField = "BgpName"
    fcmb.lblSearchCaption.Caption = "Name:"
    
    BRecset.Open fcmb.TableName, dbNcbDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect
    BRecset.Index = fcmb.BoundField
    If mListSqlExpr = "" Then
        LRecset.Open "Select * from " & fcmb.TableName & " order by " & fcmb.ListField, dbNcbDatabase, adOpenKeyset, adLockOptimistic
    Else
        LRecset.Open mListSqlExpr, dbNcbDatabase, adOpenKeyset, adLockOptimistic
    End If
    
    Set fcmb.BRecset = BRecset
    Set fcmb.LRecset = LRecset
    Set fcmb.frmAccessMaster = New frmBookGrpMast

    fcmb.ClearFlexColList
    fcmb.AddFlexColList mFldName:="BgpCode", mFldTitle:="BgpCode", mFldWidth:=0, mFldAlign:=7
    fcmb.AddFlexColList mFldName:="BgpName", mFldTitle:="Book Group Name", mFldWidth:=3000, mFldAlign:=1

    fcmb.Init
    
ElseIf blnBookAthMastList = True Then
    Load fcmb
    fcmb.lblFormHeading.Caption = "Book Author Master"
    fcmb.TableName = "BookAthMast"
    fcmb.BoundField = "BahCode"
    fcmb.ListField = "BahName"
    fcmb.lblSearchCaption.Caption = "Name:"
    
    BRecset.Open fcmb.TableName, dbNcbDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect
    BRecset.Index = fcmb.BoundField
    If mListSqlExpr = "" Then
        LRecset.Open "Select * from " & fcmb.TableName & " order by " & fcmb.ListField, dbNcbDatabase, adOpenKeyset, adLockOptimistic
    Else
        LRecset.Open mListSqlExpr, dbNcbDatabase, adOpenKeyset, adLockOptimistic
    End If
    
    Set fcmb.BRecset = BRecset
    Set fcmb.LRecset = LRecset
    Set fcmb.frmAccessMaster = New frmBookAuthorMast

    fcmb.ClearFlexColList
    fcmb.AddFlexColList mFldName:="BahCode", mFldTitle:="BahCode", mFldWidth:=0, mFldAlign:=7
    fcmb.AddFlexColList mFldName:="BahName", mFldTitle:="Book Author Name", mFldWidth:=3000, mFldAlign:=1

    fcmb.Init
    
ElseIf blnBookPubMastList = True Then
    Load fcmb
    fcmb.lblFormHeading.Caption = "Book Publication Master"
    fcmb.TableName = "BookPubMast"
    fcmb.BoundField = "BpsCode"
    fcmb.ListField = "BpsName"
    fcmb.lblSearchCaption.Caption = "Name:"
    
    BRecset.Open fcmb.TableName, dbNcbDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect
    BRecset.Index = fcmb.BoundField
    If mListSqlExpr = "" Then
        LRecset.Open "Select * from " & fcmb.TableName & " order by " & fcmb.ListField, dbNcbDatabase, adOpenKeyset, adLockOptimistic
    Else
        LRecset.Open mListSqlExpr, dbNcbDatabase, adOpenKeyset, adLockOptimistic
    End If
    
    Set fcmb.BRecset = BRecset
    Set fcmb.LRecset = LRecset
    Set fcmb.frmAccessMaster = New frmBookPubsMast

    fcmb.ClearFlexColList
    fcmb.AddFlexColList mFldName:="BpsCode", mFldTitle:="BpsCode", mFldWidth:=0, mFldAlign:=7
    fcmb.AddFlexColList mFldName:="BpsName", mFldTitle:="Book Publication Name", mFldWidth:=3000, mFldAlign:=1

    fcmb.Init
    
ElseIf blnBookEdtnMastList = True Then
    Load fcmb
    fcmb.lblFormHeading.Caption = "Book Edition Master"
    fcmb.TableName = "BookEdtnMast"
    fcmb.BoundField = "BdnCode"
    fcmb.ListField = "BdnName"
    fcmb.lblSearchCaption.Caption = "Name:"
    
    BRecset.Open fcmb.TableName, dbNcbDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect
    BRecset.Index = fcmb.BoundField
    If mListSqlExpr = "" Then
        LRecset.Open "Select * from " & fcmb.TableName & " order by " & fcmb.ListField, dbNcbDatabase, adOpenKeyset, adLockOptimistic
    Else
        LRecset.Open mListSqlExpr, dbNcbDatabase, adOpenKeyset, adLockOptimistic
    End If
    
    Set fcmb.BRecset = BRecset
    Set fcmb.LRecset = LRecset
    Set fcmb.frmAccessMaster = New frmBookEdtnMast

    fcmb.ClearFlexColList
    fcmb.AddFlexColList mFldName:="BdnCode", mFldTitle:="BdnCode", mFldWidth:=0, mFldAlign:=7
    fcmb.AddFlexColList mFldName:="BdnName", mFldTitle:="Book Edition", mFldWidth:=3000, mFldAlign:=1
    
    fcmb.Init
    
ElseIf blnBookMastList = True Then
    Load fcmb
    fcmb.lblFormHeading.Caption = "Book Master"
    fcmb.TableName = "BookMast"
    fcmb.BoundField = "BkmCode"
    fcmb.ListField = "BkmName"
    fcmb.lblSearchCaption.Caption = "Name:"
    
    BRecset.Open fcmb.TableName, dbNcbDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect
    BRecset.Index = fcmb.BoundField
    If mListSqlExpr = "" Then
        LRecset.Open "Select * from " & fcmb.TableName & " order by " & fcmb.ListField, dbNcbDatabase, adOpenKeyset, adLockOptimistic
    Else
        LRecset.Open mListSqlExpr, dbNcbDatabase, adOpenKeyset, adLockOptimistic
    End If
    
    Set fcmb.BRecset = BRecset
    Set fcmb.LRecset = LRecset
    Set fcmb.frmAccessMaster = New frmBookMast

    fcmb.ClearFlexColList
    fcmb.AddFlexColList mFldName:="BkmCode", mFldTitle:="BkmCode", mFldWidth:=0, mFldAlign:=7
    fcmb.AddFlexColList mFldName:="BkmName", mFldTitle:="Book Name", mFldWidth:=3000, mFldAlign:=1
    
    fcmb.Init
    
Else
    Err.Raise Number:=vbObjectError + 513, Description:="clsNcbFlexSearch_Class_Init_425"
    
End If

End Sub

Public Sub ReInit()
If blnUserRoleMastList = True Then
    BRecset.Close: LRecset.Close
    
    BRecset.Open fcmb.TableName, dbCmpDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect
    BRecset.Index = fcmb.BoundField
    If mListSqlExpr = "" Then
        LRecset.Open "Select * from " & fcmb.TableName & " order by " & fcmb.ListField, dbCmpDatabase, adOpenKeyset, adLockOptimistic
    Else
        LRecset.Open mListSqlExpr, dbCmpDatabase, adOpenKeyset, adLockOptimistic
    End If
    fcmb.ReInit
    
ElseIf blnUserMastList = True Then
    BRecset.Close: LRecset.Close
    
    BRecset.Open fcmb.TableName, dbCmpDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect
    BRecset.Index = fcmb.BoundField
    If mListSqlExpr = "" Then
        LRecset.Open "Select * from " & fcmb.TableName & " order by " & fcmb.ListField, dbCmpDatabase, adOpenKeyset, adLockOptimistic
    Else
        LRecset.Open mListSqlExpr, dbCmpDatabase, adOpenKeyset, adLockOptimistic
    End If
    fcmb.ReInit
    
ElseIf blnSubItmMastList = True Then
    BRecset.Close: LRecset.Close
    
    BRecset.Open fcmb.TableName, dbNcbDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect
    BRecset.Index = fcmb.BoundField
    If mListSqlExpr = "" Then
        LRecset.Open "Select SubItmMast.*,SubItmGrpMst.SigName,ProdMast.ItmName" _
            & " from (SubItmMast" _
            & " inner join ProdMast on SubItmMast.SimItmCode = ProdMast.ItmCode)" _
            & " inner join SubItmGrpMst on SubItmMast.SimSigCode = SubItmGrpMst.SigCode" _
            & " order by SimName", dbComDatabase, adOpenKeyset, adLockOptimistic
    Else
        LRecset.Open mListSqlExpr, dbComDatabase, adOpenKeyset, adLockOptimistic
    End If
    fcmb.ReInit
    
ElseIf blnSubItmGrpMastList = True Then
    BRecset.Close: LRecset.Close
    
    BRecset.Open fcmb.TableName, dbNcbDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect
    BRecset.Index = fcmb.BoundField
    If mListSqlExpr = "" Then
        LRecset.Open "Select SubItmGrpMst.* from SubItmGrpMst order by SigName", dbNcbDatabase, adOpenKeyset, adLockOptimistic
    Else
        LRecset.Open mListSqlExpr, dbNcbDatabase, adOpenKeyset, adLockOptimistic
    End If
    fcmb.ReInit
    
ElseIf blnBalItrRefNoList = True Then
    BRecset.Close: LRecset.Close
    
    If mBoundSqlExpr = "" Then
        BRecset.Open "Select *,ItrRefNo+'_'+format(ItrCode,'" & cLONGCODESTRFMT & "') as ItrRefNoUnq from (" _
            & "Select ItrRefNo,ItrCode,sum(Qty) as Qty_sum from (" _
            & "Select PurItrCode as ItrCode,PurItrRefNo as ItrRefNo,PurQty as Qty from PurchDtl" _
            & " inner join PurchHdr on PurchDtl.PurCode = PurchHdr.PuhCode" _
            & IIf(mFiltCond <> "", " where " & mFiltCond, "") _
            & " Union All " _
            & "Select SalItrCode as ItrCode,SalItrRefNo as ItrRefNo,(SalQty*-1) as Qty from SaleDtl" _
            & " inner join SaleHdr on SaleDtl.SalCode = SaleHdr.SahCode" _
            & IIf(mFiltCond <> "", " where " & mFiltCond, "") _
            & ")" _
            & " group by ItrCode,ItrRefNo order by ItrCode,ItrRefNo" _
            & ") as t1 inner join ProdRef on t1.ItrCode = ProdRef.ItrRefCode" _
            & " where Qty_sum > 0" _
            , dbComDatabase, adOpenKeyset, adLockOptimistic
    Else
        BRecset.Open mBoundSqlExpr, dbComDatabase, adOpenKeyset, adLockOptimistic
    End If
    If mListSqlExpr = "" Then
        LRecset.Open "Select *,ItrRefNo+'_'+format(ItrCode,'" & cLONGCODESTRFMT & "') as ItrRefNoUnq from (" _
            & "Select ItrRefNo,ItrCode,sum(Qty) as Qty_sum from (" _
            & "Select PurItrCode as ItrCode,PurItrRefNo as ItrRefNo,PurQty as Qty from PurchDtl" _
            & " inner join PurchHdr on PurchDtl.PurCode=PurchHdr.PuhCode" _
            & IIf(mFiltCond <> "", " where " & mFiltCond, "") _
            & " Union All " _
            & "Select SalItrCode as ItrCode,SalItrRefNo as ItrRefNo,(SalQty*-1) as Qty from SaleDtl" _
            & " inner join SaleHdr on SaleDtl.SalCode = SaleHdr.SahCode" _
            & IIf(mFiltCond <> "", " where " & mFiltCond, "") _
            & ")" _
            & " group by ItrRefNo,ItrCode order by ItrRefNo,ItrCode" _
            & ") as t1 inner join ProdRef on t1.ItrCode = ProdRef.ItrRefCode" _
            & " where Qty_sum > 0" _
            , dbComDatabase, adOpenKeyset, adLockOptimistic
    Else
        LRecset.Open mListSqlExpr, dbComDatabase, adOpenKeyset, adLockOptimistic
    End If
    fcmb.ReInit
    
ElseIf blnPartyMastList = True Then
    BRecset.Close: LRecset.Close
    
    BRecset.Open fcmb.TableName, dbNcbDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect
    BRecset.Index = fcmb.BoundField
    If mListSqlExpr = "" Then
        LRecset.Open "Select PartyMast.*,AreaMast.AraName,StsnMast.StnName,AchdMast.AhName from ((PartyMast inner join AreaMast on PartyMast.PrtAraCode=AreaMast.AraCode) inner join StsnMast on PartyMast.PrtStnCode=StsnMast.StnCode) inner join AchdMast on PartyMast.PrtAhCode=AchdMast.AhCode order by PrtName", dbComDatabase, adOpenKeyset, adLockOptimistic
    Else
        LRecset.Open mListSqlExpr, dbComDatabase, adOpenKeyset, adLockOptimistic
    End If
    fcmb.ReInit
    
ElseIf blnPartyGrpMastList = True Then
    BRecset.Close: LRecset.Close
    
    BRecset.Open fcmb.TableName, dbNcbDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect
    BRecset.Index = fcmb.BoundField
    If mListSqlExpr = "" Then
        LRecset.Open "Select PartyGrpMst.* from PartyGrpMst order by PgmName", dbNcbDatabase, adOpenKeyset, adLockOptimistic
    Else
        LRecset.Open mListSqlExpr, dbNcbDatabase, adOpenKeyset, adLockOptimistic
    End If
    
    fcmb.ReInit
    
ElseIf blnStudCatgMastList = True Then
    BRecset.Close: LRecset.Close
    
    BRecset.Open fcmb.TableName, dbNcbDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect
    BRecset.Index = fcmb.BoundField
    If mListSqlExpr = "" Then
        LRecset.Open "Select * from " & fcmb.TableName & " order by " & fcmb.ListField, dbNcbDatabase, adOpenKeyset, adLockOptimistic
    Else
        LRecset.Open mListSqlExpr, dbNcbDatabase, adOpenKeyset, adLockOptimistic
    End If
    
    fcmb.ReInit
    
ElseIf blnStudMastListByName = True Then
    BRecset.Close: LRecset.Close
    
    BRecset.Open fcmb.TableName, dbNcbDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect
    BRecset.Index = fcmb.BoundField
    If mListSqlExpr = "" Then
        LRecset.Open "Select StudMast.*,StudMast.SdtName+'_'+format(StudMast.SdtCode,'" & cLONGCODESTRFMT & "') as SdtNameUnq,AreaMast.AraName,StsnMast.StnName from (StudMast left join AreaMast on StudMast.SdtAraCode=AreaMast.AraCode) left join StsnMast on StudMast.SdtStnCode=StsnMast.StnCode order by SdtName,SdtCode,SdtRegNo", dbComDatabase, adOpenKeyset, adLockOptimistic
    Else
        LRecset.Open mListSqlExpr, dbComDatabase, adOpenKeyset, adLockOptimistic
    End If
    
    fcmb.ReInit
    
ElseIf blnStudMastListByRegNo = True Then
    BRecset.Close: LRecset.Close
    
    BRecset.Open fcmb.TableName, dbNcbDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect
    BRecset.Index = fcmb.BoundField
    If mListSqlExpr = "" Then
        LRecset.Open "Select StudMast.*,cstr(StudMast.SdtRegNo)+'_'+format(StudMast.SdtCode,'" & cLONGCODESTRFMT & "') as SdtRegNoUnq,AreaMast.AraName,StsnMast.StnName from (StudMast left join AreaMast on StudMast.SdtAraCode=AreaMast.AraCode) left join StsnMast on StudMast.SdtStnCode=StsnMast.StnCode order by SdtRegNo,SdtName", dbComDatabase, adOpenKeyset, adLockOptimistic
    Else
        LRecset.Open mListSqlExpr, dbComDatabase, adOpenKeyset, adLockOptimistic
    End If
    
    fcmb.ReInit
    
ElseIf blnGodownMastList = True Then
    BRecset.Close: LRecset.Close
    
    BRecset.Open fcmb.TableName, dbNcbDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect
    BRecset.Index = fcmb.BoundField
    If mListSqlExpr = "" Then
        LRecset.Open "Select GodownMast.* from GodownMast order by GdmMast", dbNcbDatabase, adOpenKeyset, adLockOptimistic
    Else
        LRecset.Open mListSqlExpr, dbNcbDatabase, adOpenKeyset, adLockOptimistic
    End If
    
    fcmb.ReInit
    
ElseIf blnBookGrpMastList = True Then
    BRecset.Close: LRecset.Close
    
    BRecset.Open fcmb.TableName, dbNcbDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect
    BRecset.Index = fcmb.BoundField
    If mListSqlExpr = "" Then
        LRecset.Open "Select * from " & fcmb.TableName & " order by " & fcmb.ListField, dbNcbDatabase, adOpenKeyset, adLockOptimistic
    Else
        LRecset.Open mListSqlExpr, dbNcbDatabase, adOpenKeyset, adLockOptimistic
    End If
    
    fcmb.ReInit
    
ElseIf blnBookAthMastList = True Then
    BRecset.Close: LRecset.Close
    
    BRecset.Open fcmb.TableName, dbNcbDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect
    BRecset.Index = fcmb.BoundField
    If mListSqlExpr = "" Then
        LRecset.Open "Select * from " & fcmb.TableName & " order by " & fcmb.ListField, dbNcbDatabase, adOpenKeyset, adLockOptimistic
    Else
        LRecset.Open mListSqlExpr, dbNcbDatabase, adOpenKeyset, adLockOptimistic
    End If
    
    fcmb.ReInit
    
ElseIf blnBookPubMastList = True Then
    BRecset.Close: LRecset.Close
    
    BRecset.Open fcmb.TableName, dbNcbDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect
    BRecset.Index = fcmb.BoundField
    If mListSqlExpr = "" Then
        LRecset.Open "Select * from " & fcmb.TableName & " order by " & fcmb.ListField, dbNcbDatabase, adOpenKeyset, adLockOptimistic
    Else
        LRecset.Open mListSqlExpr, dbNcbDatabase, adOpenKeyset, adLockOptimistic
    End If
    
    fcmb.ReInit
    
ElseIf blnBookEdtnMastList = True Then
    BRecset.Close: LRecset.Close
    
    BRecset.Open fcmb.TableName, dbNcbDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect
    BRecset.Index = fcmb.BoundField
    If mListSqlExpr = "" Then
        LRecset.Open "Select * from " & fcmb.TableName & " order by " & fcmb.ListField, dbNcbDatabase, adOpenKeyset, adLockOptimistic
    Else
        LRecset.Open mListSqlExpr, dbNcbDatabase, adOpenKeyset, adLockOptimistic
    End If
    
    fcmb.ReInit
    
ElseIf blnBookMastList = True Then
    BRecset.Close: LRecset.Close
    
    BRecset.Open fcmb.TableName, dbNcbDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect
    BRecset.Index = fcmb.BoundField
    If mListSqlExpr = "" Then
        LRecset.Open "Select * from " & fcmb.TableName & " order by " & fcmb.ListField, dbNcbDatabase, adOpenKeyset, adLockOptimistic
    Else
        LRecset.Open mListSqlExpr, dbNcbDatabase, adOpenKeyset, adLockOptimistic
    End If
    
    fcmb.ReInit
    
Else
    Err.Raise Number:=vbObjectError + 513, Description:="clsNcbFlexSearch_Class_ReInit_799"
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

