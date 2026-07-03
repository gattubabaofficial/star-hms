VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "clsPmtFlexSearch"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit

Public fcmb As New frmFlexSearchList
Public dbAcDatabase As ADODB.Connection, dbStDatabase As ADODB.Connection, dbPmtDatabase As ADODB.Connection, dbCmpDatabase As ADODB.Connection, dbComDatabase As ADODB.Connection
Public mListSqlExpr As String, mBoundSqlExpr As String, mFiltCond As String
Public blnSecuMastList As Boolean, blnUserMastList As Boolean
Public blnSubItmMastList As Boolean, blnPartyMastList As Boolean, blnBalSimRefNoList As Boolean
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
If blnSecuMastList = True Then
    Load fcmb
    fcmb.lblFormHeading.Caption = "Security Master"
    fcmb.TableName = "SecuMast"
    fcmb.BoundField = "SecCode"
    fcmb.ListField = "SecName"
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
    Set fcmb.frmAccessMaster = New frmSecurityMast
    
    fcmb.ClearFlexColList
    fcmb.AddFlexColList mFldName:="SecCode", mFldTitle:="SecCode", mFldWidth:=0, mFldAlign:=8
    fcmb.AddFlexColList mFldName:="SecName", mFldTitle:="Security Name", mFldWidth:=3000, mFldAlign:=1
    
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
    fcmb.AddFlexColList mFldName:="UsrCode", mFldTitle:="UsrCode", mFldWidth:=0, mFldAlign:=8
    fcmb.AddFlexColList mFldName:="UsrName", mFldTitle:="User Name", mFldWidth:=3000, mFldAlign:=1
    
    fcmb.Init
    
'ElseIf blnPatCatgMstList = True Then
'    Load fcmb
'    fcmb.lblFormHeading.Caption = "Patient Category Master"
'    fcmb.TableName = "PatCatgMst"
'    fcmb.BoundField = "PcgCode"
'    fcmb.ListField = "PcgName"
'    fcmb.lblSearchCaption.Caption = "Name:"
'
'    BRecset.Open fcmb.TableName, dbPmtDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect
'    BRecset.Index = fcmb.BoundField
'    If mListSqlExpr = "" Then
'        LRecset.Open "Select * from " & fcmb.TableName & " order by " & fcmb.ListField, dbPmtDatabase, adOpenKeyset, adLockOptimistic
'    Else
'        LRecset.Open mListSqlExpr, dbPmtDatabase, adOpenKeyset, adLockOptimistic
'    End If
'
'    Set fcmb.BRecset = BRecset
'    Set fcmb.LRecset = LRecset
'    Set fcmb.dbPmtDatabase = dbPmtDatabase
'    Set fcmb.frmAccessMaster = New frmPatCategoryMast
'
'    fcmb.ClearFlexColList
'    fcmb.AddFlexColList mFldName:="PcgCode", mFldTitle:="PcgCode", mFldWidth:=0, mFldAlign:=8
'    fcmb.AddFlexColList mFldName:="PcgName", mFldTitle:="Patient Category", mFldWidth:=3000, mFldAlign:=1
'
'    fcmb.Init
'

ElseIf blnSubItmMastList = True Then
    Load fcmb
    fcmb.lblFormHeading.Caption = "Item Master"
    fcmb.TableName = "SubItmMast"
    fcmb.BoundField = "SimCode"
    fcmb.ListField = "SimName"
    fcmb.lblSearchCaption.Caption = "Name:"
    
    BRecset.Open fcmb.TableName, dbPmtDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect
    BRecset.Index = fcmb.BoundField
    If mListSqlExpr = "" Then
        LRecset.Open "Select SubItmMast.*,ProdMast.ItmName from SubItmMast inner join ProdMast on SubItmMast.SimItmCode=ProdMast.ItmCode order by SimName", dbComDatabase, adOpenKeyset, adLockOptimistic
    Else
        LRecset.Open mListSqlExpr, dbComDatabase, adOpenKeyset, adLockOptimistic
    End If

    Set fcmb.BRecset = BRecset
    Set fcmb.LRecset = LRecset
    Set fcmb.frmAccessMaster = New frmSubItemMast
    
    fcmb.ClearFlexColList
    fcmb.AddFlexColList mFldName:="SimCode", mFldTitle:="SimCode", mFldWidth:=0, mFldAlign:=8
    fcmb.AddFlexColList mFldName:="SimName", mFldTitle:="Item Name", mFldWidth:=3000, mFldAlign:=1
    
    fcmb.Init
    
ElseIf blnBalSimRefNoList = True Then
    Load fcmb
    fcmb.lblFormHeading.Caption = "Item Reference List"
    fcmb.TableName = "[Query]"
    fcmb.BoundField = "ItrCode"
    fcmb.ListField = "SimRefNo"
    fcmb.ListFieldUnq = "SimRefNoUnq"
    fcmb.lblSearchCaption.Caption = "Ref.No:"
    
    Rem difference between BoundSql and ListSql is only it's order by sequence
    Rem while preparing query on entry form let remain inner join of jobrcpt but jobissue inner join only in form edit mode
    Rem list will show entries of completed job receipt entry but under unsaved entries of job receipt in add mode so as to avoid duplicate entry of any unsaved entry
    If mBoundSqlExpr = "" Then
        BRecset.Open "Select *,SimRefNo+'_'+format(ItrCode,'" & cLONGCODESTRFMT & "') as SimRefNoUnq from (" _
            & "Select SimRefNo,ItrCode,sum(Qty) as Qty_sum from (" _
            & "Select JrcItrCode as ItrCode,JrcSimRefNo as SimRefNo,JrcQty as Qty from JobRcpt inner join JobRcHdr on JobRcpt.JrcCode=JobRcHdr.JrhCode" & IIf(mFiltCond <> "", " where " & mFiltCond, "") _
            & " Union All " _
            & "Select JisItrCode as ItrCode,JisSimRefNo as SimRefNo,(JisQty*-1) as Qty from JobIssu inner join JobIsHdr on JobIssu.JisCode=JobIsHdr.JihCode" & IIf(mFiltCond <> "", " where " & mFiltCond, "") _
            & ")" _
            & " group by ItrCode,SimRefNo order by ItrCode,SimRefNo" _
            & ")" _
            & " where Qty_sum>0" _
            , dbPmtDatabase, adOpenKeyset, adLockOptimistic
    Else
        BRecset.Open mBoundSqlExpr, dbPmtDatabase, adOpenKeyset, adLockOptimistic
    End If
    If mListSqlExpr = "" Then
        LRecset.Open "Select *,SimRefNo+'_'+format(ItrCode,'" & cLONGCODESTRFMT & "') as SimRefNoUnq from (" _
            & "Select SimRefNo,ItrCode,sum(Qty) as Qty_sum from (" _
            & "Select JrcItrCode as ItrCode,JrcSimRefNo as SimRefNo,JrcQty as Qty from JobRcpt inner join JobRcHdr on JobRcpt.JrcCode=JobRcHdr.JrhCode" & IIf(mFiltCond <> "", " where " & mFiltCond, "") _
            & " Union All " _
            & "Select JisItrCode as ItrCode,JisSimRefNo as SimRefNo,(JisQty*-1) as Qty from JobIssu inner join JobIsHdr on JobIssu.JisCode=JobIsHdr.JihCode" & IIf(mFiltCond <> "", " where " & mFiltCond, "") _
            & ")" _
            & " group by SimRefNo,ItrCode order by SimRefNo,ItrCode" _
            & ")" _
            & " where Qty_sum>0" _
            , dbPmtDatabase, adOpenKeyset, adLockOptimistic
    Else
        LRecset.Open mListSqlExpr, dbPmtDatabase, adOpenKeyset, adLockOptimistic
    End If

    Set fcmb.BRecset = BRecset
    Set fcmb.LRecset = LRecset
    Rem Set fcmb.frmAccessMaster = New frmSubItemMast
    
    fcmb.ClearFlexColList
    fcmb.AddFlexColList mFldName:="ItrCode", mFldTitle:="ItrCode", mFldWidth:=0, mFldAlign:=7
    fcmb.AddFlexColList mFldName:="SimRefNo", mFldTitle:="Item Ref.No.", mFldWidth:=3000, mFldAlign:=1
    fcmb.AddFlexColList mFldName:="Qty_sum", mFldTitle:="Qty", mFldWidth:=1500, mFldAlign:=7
    fcmb.AddFlexColList mFldName:="SimRefNoUnq", mFldTitle:="SimRefNoUnq", mFldWidth:=0, mFldAlign:=7
    
    fcmb.Init
    
ElseIf blnPartyMastList = True Then
    Load fcmb
    fcmb.lblFormHeading.Caption = "Party Master"
    fcmb.TableName = "PartyMast"
    fcmb.BoundField = "PrtCode"
    fcmb.ListField = "PrtName"
    fcmb.lblSearchCaption.Caption = "Name:"
    
    BRecset.Open fcmb.TableName, dbPmtDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect
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

'ElseIf blnPatMastListByRegNo = True Then
'    Load fcmb
'    fcmb.lblFormHeading.Caption = "Patient Master"
'    fcmb.TableName = "PatMast"
'    fcmb.BoundField = "PttCode"
'    fcmb.ListField = "PttRegNo"
'    fcmb.ListFieldUnq = "PttRegNoUnq"
'    fcmb.lblSearchCaption.Caption = "Reg.No:"
'
'    BRecset.Open fcmb.TableName, dbPmtDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect
'    BRecset.Index = fcmb.BoundField
'    If mListSqlExpr = "" Then
'        LRecset.Open "Select PatMast.*,cstr(PatMast.PttRegNo)+'_'+format(PatMast.PttCode,'" & cLONGCODESTRFMT & "') as PttRegNoUnq,AreaMast.AraName,StsnMast.StnName from (PatMast left join AreaMast on PatMast.PttAraCode=AreaMast.AraCode) left join StsnMast on PatMast.PttStnCode=StsnMast.StnCode order by PttRegNo,PttName", dbComDatabase, adOpenKeyset, adLockOptimistic
'    Else
'        LRecset.Open mListSqlExpr, dbComDatabase, adOpenKeyset, adLockOptimistic
'    End If
'
'    Set fcmb.BRecset = BRecset
'    Set fcmb.LRecset = LRecset
'    Set fcmb.dbPmtDatabase = dbPmtDatabase
'    Set fcmb.frmAccessMaster = New frmPatientMast
'
'    fcmb.ClearFlexColList
'    fcmb.AddFlexColList mFldName:="PttCode", mFldTitle:="PttCode", mFldWidth:=0, mFldAlign:=8
'    fcmb.AddFlexColList mFldName:="PttRegNo", mFldTitle:="Reg.No", mFldWidth:=1500, mFldAlign:=8
'    fcmb.AddFlexColList mFldName:="PttName", mFldTitle:="Patient Name", mFldWidth:=3000, mFldAlign:=1
'    fcmb.AddFlexColList mFldName:="PttRefName", mFldTitle:="Care of", mFldWidth:=2500, mFldAlign:=1
'    fcmb.AddFlexColList mFldName:="AraName", mFldTitle:="Area", mFldWidth:=2500, mFldAlign:=1
'    fcmb.AddFlexColList mFldName:="StnName", mFldTitle:="Station", mFldWidth:=2500, mFldAlign:=1
'
'    fcmb.Init
'
'ElseIf blnDoctMastList = True Then
'    Load fcmb
'    fcmb.lblFormHeading.Caption = "Doctor Master"
'    fcmb.TableName = "DoctMast"
'    fcmb.BoundField = "DctCode"
'    fcmb.ListField = "DctName"
'    fcmb.lblSearchCaption.Caption = "Name:"
'
'    BRecset.Open fcmb.TableName, dbPmtDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect
'    BRecset.Index = fcmb.BoundField
'    If mListSqlExpr = "" Then
'        LRecset.Open "Select * from " & fcmb.TableName & " order by " & fcmb.ListField, dbPmtDatabase, adOpenKeyset, adLockOptimistic
'    Else
'        LRecset.Open mListSqlExpr, dbPmtDatabase, adOpenKeyset, adLockOptimistic
'    End If
'
'    Set fcmb.BRecset = BRecset
'    Set fcmb.LRecset = LRecset
'    Set fcmb.dbPmtDatabase = dbPmtDatabase
'    Set fcmb.frmAccessMaster = New frmDoctorMast
'
'    fcmb.ClearFlexColList
'    fcmb.AddFlexColList mFldName:="DctCode", mFldTitle:="DctCode", mFldWidth:=0, mFldAlign:=8
'    fcmb.AddFlexColList mFldName:="DctName", mFldTitle:="Doctor Name", mFldWidth:=3000, mFldAlign:=1
'
'    fcmb.Init
'
'ElseIf blnDoctRoleMastList = True Then
'    Load fcmb
'    fcmb.lblFormHeading.Caption = "Doctor Category Master"
'    fcmb.TableName = "DoctRoleMst"
'    fcmb.BoundField = "DrlCode"
'    fcmb.ListField = "DrlName"
'    fcmb.lblSearchCaption.Caption = "Name:"
'
'    BRecset.Open fcmb.TableName, dbPmtDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect
'    BRecset.Index = fcmb.BoundField
'    If mListSqlExpr = "" Then
'        LRecset.Open "Select * from " & fcmb.TableName & " order by " & fcmb.ListField, dbPmtDatabase, adOpenKeyset, adLockOptimistic
'    Else
'        LRecset.Open mListSqlExpr, dbPmtDatabase, adOpenKeyset, adLockOptimistic
'    End If
'
'    Set fcmb.BRecset = BRecset
'    Set fcmb.LRecset = LRecset
'    Set fcmb.dbPmtDatabase = dbPmtDatabase
'    Set fcmb.frmAccessMaster = New frmDoctorRoleMast
'
'    fcmb.ClearFlexColList
'    fcmb.AddFlexColList mFldName:="DrlCode", mFldTitle:="DrlCode", mFldWidth:=0, mFldAlign:=8
'    fcmb.AddFlexColList mFldName:="DrlName", mFldTitle:="Doctor Role", mFldWidth:=3000, mFldAlign:=1
'
'    fcmb.Init
'
'ElseIf blnRefByMastList = True Then
'    Load fcmb
'    fcmb.lblFormHeading.Caption = "Referred By"
'    fcmb.TableName = "RefByMast"
'    fcmb.BoundField = "RByCode"
'    fcmb.ListField = "RByName"
'    fcmb.lblSearchCaption.Caption = "Name:"
'
'    BRecset.Open fcmb.TableName, dbPmtDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect
'    BRecset.Index = fcmb.BoundField
'    If mListSqlExpr = "" Then
'        LRecset.Open "Select * from " & fcmb.TableName & " order by " & fcmb.ListField, dbPmtDatabase, adOpenKeyset, adLockOptimistic
'    Else
'        LRecset.Open mListSqlExpr, dbPmtDatabase, adOpenKeyset, adLockOptimistic
'    End If
'
'    Set fcmb.BRecset = BRecset
'    Set fcmb.LRecset = LRecset
'    Set fcmb.dbPmtDatabase = dbPmtDatabase
'    Set fcmb.frmAccessMaster = New frmRefByMast
'
'    fcmb.ClearFlexColList
'    fcmb.AddFlexColList mFldName:="RByCode", mFldTitle:="RByCode", mFldWidth:=0, mFldAlign:=8
'    fcmb.AddFlexColList mFldName:="RByName", mFldTitle:="Referred By Name", mFldWidth:=3000, mFldAlign:=1
'
'    fcmb.Init
'
'ElseIf blnRefToMastList = True Then
'    Load fcmb
'    fcmb.lblFormHeading.Caption = "Referred To"
'    fcmb.TableName = "RefToMast"
'    fcmb.BoundField = "RToCode"
'    fcmb.ListField = "RToName"
'    fcmb.lblSearchCaption.Caption = "Name:"
'
'    BRecset.Open fcmb.TableName, dbPmtDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect
'    BRecset.Index = fcmb.BoundField
'    If mListSqlExpr = "" Then
'        LRecset.Open "Select * from " & fcmb.TableName & " order by " & fcmb.ListField, dbPmtDatabase, adOpenKeyset, adLockOptimistic
'    Else
'        LRecset.Open mListSqlExpr, dbPmtDatabase, adOpenKeyset, adLockOptimistic
'    End If
'
'    Set fcmb.BRecset = BRecset
'    Set fcmb.LRecset = LRecset
'    Set fcmb.dbPmtDatabase = dbPmtDatabase
'    Set fcmb.frmAccessMaster = New frmRefToMast
'
'    fcmb.ClearFlexColList
'    fcmb.AddFlexColList mFldName:="RToCode", mFldTitle:="RToCode", mFldWidth:=0, mFldAlign:=8
'    fcmb.AddFlexColList mFldName:="RToName", mFldTitle:="Referred To Name", mFldWidth:=3000, mFldAlign:=1
'
'    fcmb.Init
'
'ElseIf blnDoctCatgMstList = True Then
'    Load fcmb
'    fcmb.lblFormHeading.Caption = "Doctor Category Master"
'    fcmb.TableName = "DoctCatgMst"
'    fcmb.BoundField = "DcgCode"
'    fcmb.ListField = "DcgName"
'    fcmb.lblSearchCaption.Caption = "Name:"
'
'    BRecset.Open fcmb.TableName, dbPmtDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect
'    BRecset.Index = fcmb.BoundField
'    If mListSqlExpr = "" Then
'        LRecset.Open "Select * from " & fcmb.TableName & " order by " & fcmb.ListField, dbPmtDatabase, adOpenKeyset, adLockOptimistic
'    Else
'        LRecset.Open mListSqlExpr, dbPmtDatabase, adOpenKeyset, adLockOptimistic
'    End If
'
'    Set fcmb.BRecset = BRecset
'    Set fcmb.LRecset = LRecset
'    Set fcmb.dbPmtDatabase = dbPmtDatabase
'    Set fcmb.frmAccessMaster = New frmDoctorCatgMast
'
'    fcmb.ClearFlexColList
'    fcmb.AddFlexColList mFldName:="DcgCode", mFldTitle:="DcgCode", mFldWidth:=0, mFldAlign:=8
'    fcmb.AddFlexColList mFldName:="DcgName", mFldTitle:="Doctor Category", mFldWidth:=3000, mFldAlign:=1
'
'    fcmb.Init
'
'ElseIf blnRefCatgMstList = True Then
'    Load fcmb
'    fcmb.lblFormHeading.Caption = "Referred Category Master"
'    fcmb.TableName = "RefCatgMst"
'    fcmb.BoundField = "RfgCode"
'    fcmb.ListField = "RfgName"
'    fcmb.lblSearchCaption.Caption = "Name:"
'
'    BRecset.Open fcmb.TableName, dbPmtDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect
'    BRecset.Index = fcmb.BoundField
'    If mListSqlExpr = "" Then
'        LRecset.Open "Select * from " & fcmb.TableName & " order by " & fcmb.ListField, dbPmtDatabase, adOpenKeyset, adLockOptimistic
'    Else
'        LRecset.Open mListSqlExpr, dbPmtDatabase, adOpenKeyset, adLockOptimistic
'    End If
'
'    Set fcmb.BRecset = BRecset
'    Set fcmb.LRecset = LRecset
'    Set fcmb.dbPmtDatabase = dbPmtDatabase
'    Set fcmb.frmAccessMaster = New frmRefCatgMast
'
'    fcmb.ClearFlexColList
'    fcmb.AddFlexColList mFldName:="RfgCode", mFldTitle:="RfgCode", mFldWidth:=0, mFldAlign:=8
'    fcmb.AddFlexColList mFldName:="RfgName", mFldTitle:="Referred Category", mFldWidth:=3000, mFldAlign:=1
'
'    fcmb.Init
'
'ElseIf blnServGrpMstList = True Then
'    Load fcmb
'    fcmb.lblFormHeading.Caption = "Service Group Master"
'    fcmb.TableName = "ServGrpMst"
'    fcmb.BoundField = "SgpCode"
'    fcmb.ListField = "SgpName"
'    fcmb.lblSearchCaption.Caption = "Name:"
'
'    BRecset.Open fcmb.TableName, dbPmtDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect    ' SgpShowInList=True
'    BRecset.Index = fcmb.BoundField
'    If mListSqlExpr = "" Then
'        LRecset.Open "Select * from " & fcmb.TableName & " where SgpShowInList=True order by " & fcmb.ListField, dbPmtDatabase, adOpenKeyset, adLockOptimistic
'    Else
'        LRecset.Open mListSqlExpr, dbPmtDatabase, adOpenKeyset, adLockOptimistic
'    End If
'
'    Set fcmb.BRecset = BRecset
'    Set fcmb.LRecset = LRecset
'    Set fcmb.dbPmtDatabase = dbPmtDatabase
'    Set fcmb.frmAccessMaster = New frmServGroupMast
'
'    fcmb.ClearFlexColList
'    fcmb.AddFlexColList mFldName:="SgpCode", mFldTitle:="SgpCode", mFldWidth:=0, mFldAlign:=8
'    fcmb.AddFlexColList mFldName:="SgpName", mFldTitle:="Group Name", mFldWidth:=3000, mFldAlign:=1
'
'    fcmb.Init
'
'ElseIf blnServMastList = True Then
'    Load fcmb
'    fcmb.lblFormHeading.Caption = "Service Master"
'    fcmb.TableName = "ServMast"
'    fcmb.BoundField = "SrvCode"
'    fcmb.ListField = "SrvName"
'    fcmb.lblSearchCaption.Caption = "Name:"
'
'    BRecset.Open fcmb.TableName, dbPmtDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect    ' SrvShowInList=True
'    BRecset.Index = fcmb.BoundField
'    If mListSqlExpr = "" Then
'        LRecset.Open "Select * from " & fcmb.TableName & " where SrvShowInList=True order by " & fcmb.ListField, dbPmtDatabase, adOpenKeyset, adLockOptimistic
'    Else
'        LRecset.Open mListSqlExpr, dbPmtDatabase, adOpenKeyset, adLockOptimistic
'    End If
'
'    Set fcmb.BRecset = BRecset
'    Set fcmb.LRecset = LRecset
'    Set fcmb.dbPmtDatabase = dbPmtDatabase
'    Set fcmb.frmAccessMaster = New frmServiceMast
'
'    fcmb.ClearFlexColList
'    fcmb.AddFlexColList mFldName:="SrvCode", mFldTitle:="SrvCode", mFldWidth:=0, mFldAlign:=8
'    fcmb.AddFlexColList mFldName:="SrvName", mFldTitle:="Service Name", mFldWidth:=3000, mFldAlign:=1
'    fcmb.AddFlexColList mFldName:="SrvOpdGenChg", mFldTitle:="Opd.Chg", mFldWidth:=1000, mFldAlign:=7
'
'    fcmb.Init
'
'ElseIf blnDiagMastList = True Then
'    Load fcmb
'    fcmb.lblFormHeading.Caption = "Diagnostic Master"
'    fcmb.TableName = "DiagMast"
'    fcmb.BoundField = "DigCode"
'    fcmb.ListField = "DigName"
'    fcmb.lblSearchCaption.Caption = "Name:"
'
'    BRecset.Open fcmb.TableName, dbPmtDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect
'    BRecset.Index = fcmb.BoundField
'    If mListSqlExpr = "" Then
'        LRecset.Open "Select * from " & fcmb.TableName & " order by " & fcmb.ListField, dbPmtDatabase, adOpenKeyset, adLockOptimistic
'    Else
'        LRecset.Open mListSqlExpr, dbPmtDatabase, adOpenKeyset, adLockOptimistic
'    End If
'
'    Set fcmb.BRecset = BRecset
'    Set fcmb.LRecset = LRecset
'    Set fcmb.dbPmtDatabase = dbPmtDatabase
'    Set fcmb.frmAccessMaster = New frmDiagnosticMast
'
'    fcmb.ClearFlexColList
'    fcmb.AddFlexColList mFldName:="DigCode", mFldTitle:="DigCode", mFldWidth:=0, mFldAlign:=8
'    fcmb.AddFlexColList mFldName:="DigName", mFldTitle:="Diagnosis", mFldWidth:=3000, mFldAlign:=1
'
'    fcmb.Init
'
'ElseIf blnFloorMastList = True Then
'    Load fcmb
'    fcmb.lblFormHeading.Caption = "Floor Master"
'    fcmb.TableName = "FloorMast"
'    fcmb.BoundField = "FlrCode"
'    fcmb.ListField = "FlrName"
'    fcmb.lblSearchCaption.Caption = "Name:"
'
'    BRecset.Open fcmb.TableName, dbPmtDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect
'    BRecset.Index = fcmb.BoundField
'    If mListSqlExpr = "" Then
'        LRecset.Open "Select * from " & fcmb.TableName & " where FlrShowInList=True order by " & fcmb.ListField, dbPmtDatabase, adOpenKeyset, adLockOptimistic
'    Else
'        LRecset.Open mListSqlExpr, dbPmtDatabase, adOpenKeyset, adLockOptimistic
'    End If
'
'    Set fcmb.BRecset = BRecset
'    Set fcmb.LRecset = LRecset
'    Set fcmb.dbPmtDatabase = dbPmtDatabase
'    Set fcmb.frmAccessMaster = New frmFloorMast
'
'    fcmb.ClearFlexColList
'    fcmb.AddFlexColList mFldName:="FlrCode", mFldTitle:="FlrCode", mFldWidth:=0, mFldAlign:=8
'    fcmb.AddFlexColList mFldName:="FlrName", mFldTitle:="Floor Name", mFldWidth:=3000, mFldAlign:=1
'
'    fcmb.Init
'
'ElseIf blnWardMastList = True Then
'    Load fcmb
'    fcmb.lblFormHeading.Caption = "Ward Master"
'    fcmb.TableName = "WardMast"
'    fcmb.BoundField = "WrdCode"
'    fcmb.ListField = "WrdName"
'    fcmb.lblSearchCaption.Caption = "Name:"
'
'    BRecset.Open fcmb.TableName, dbPmtDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect
'    BRecset.Index = fcmb.BoundField
'    If mListSqlExpr = "" Then
'        LRecset.Open "Select * from " & fcmb.TableName & " where WrdShowInList=True order by " & fcmb.ListField, dbPmtDatabase, adOpenKeyset, adLockOptimistic
'    Else
'        LRecset.Open mListSqlExpr, dbPmtDatabase, adOpenKeyset, adLockOptimistic
'    End If
'
'    Set fcmb.BRecset = BRecset
'    Set fcmb.LRecset = LRecset
'    Set fcmb.dbPmtDatabase = dbPmtDatabase
'    Set fcmb.frmAccessMaster = New frmWardMast
'
'    fcmb.ClearFlexColList
'    fcmb.AddFlexColList mFldName:="WrdCode", mFldTitle:="WrdCode", mFldWidth:=0, mFldAlign:=8
'    fcmb.AddFlexColList mFldName:="WrdName", mFldTitle:="Ward Name", mFldWidth:=3000, mFldAlign:=1
'
'    fcmb.Init
'
'ElseIf blnBedMastList = True Then
'    Load fcmb
'    fcmb.lblFormHeading.Caption = "Bed Master"
'    fcmb.TableName = "BedMast"
'    fcmb.BoundField = "BdmCode"
'    fcmb.ListField = "BdmName"
'    fcmb.lblSearchCaption.Caption = "Name:"
'
'    BRecset.Open fcmb.TableName, dbPmtDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect
'    BRecset.Index = fcmb.BoundField
'    If mListSqlExpr = "" Then
'        LRecset.Open "Select * from " & fcmb.TableName & " where BdmShowInList=True order by " & fcmb.ListField, dbPmtDatabase, adOpenKeyset, adLockOptimistic
'    Else
'        LRecset.Open mListSqlExpr, dbPmtDatabase, adOpenKeyset, adLockOptimistic
'    End If
'
'    Set fcmb.BRecset = BRecset
'    Set fcmb.LRecset = LRecset
'    Set fcmb.dbPmtDatabase = dbPmtDatabase
'    Set fcmb.frmAccessMaster = New frmBedMast
'
'    fcmb.ClearFlexColList
'    fcmb.AddFlexColList mFldName:="BdmCode", mFldTitle:="BdmCode", mFldWidth:=0, mFldAlign:=8
'    fcmb.AddFlexColList mFldName:="BdmName", mFldTitle:="Bed Name", mFldWidth:=3000, mFldAlign:=1
'
'    fcmb.Init
'
'ElseIf blnOldOpgListByOpgNo = True Then
'    Load fcmb
'    fcmb.lblFormHeading.Caption = "Old Outdoor List by Opd No."
'    fcmb.TableName = "OutdReg"
'    fcmb.BoundField = "OpgCode"
'    fcmb.ListField = "OpgVchNo"
'    fcmb.ListFieldUnq = "OpgVchNoUnq"
'    fcmb.lblSearchCaption.Caption = "No.:"
'
'    BRecset.Open fcmb.TableName, dbPmtDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect
'    BRecset.Index = fcmb.BoundField
'    If mListSqlExpr = "" Then
'        LRecset.Open "Select OutdReg.OpgCode,OutdReg.OpgVchNo,OutdReg.OpgDate,cstr(OutdReg.OpgVchNo)+'_'+format(OutdReg.OpgCode,'" & cLONGCODESTRFMT & "') as OpgVchNoUnq,PatMast.PttName,PatMast.PttRegNo,PatMast.PttRefName,AreaMast.AraName,StsnMast.StnName from ((OutdReg inner join PatMast on OutdReg.OpgPttCode=PatMast.PttCode) inner join AreaMast on PatMast.PttAraCode=AreaMast.AraCode) inner join StsnMast on PatMast.PttStnCode=StsnMast.StnCode order by OpgVchNo,OpgCode", dbComDatabase, adOpenKeyset, adLockOptimistic
'    Else
'        LRecset.Open mListSqlExpr, dbComDatabase, adOpenKeyset, adLockOptimistic
'    End If
'
'    Set fcmb.BRecset = BRecset
'    Set fcmb.LRecset = LRecset
'    Set fcmb.dbPmtDatabase = dbPmtDatabase
'    Set fcmb.frmAccessMaster = New frmOutdoorReg
'
'    fcmb.ClearFlexColList
'    fcmb.AddFlexColList mFldName:="OpgCode", mFldTitle:="OpgCode", mFldWidth:=0, mFldAlign:=8
'    fcmb.AddFlexColList mFldName:="OpgVchNo", mFldTitle:="Opd No", mFldWidth:=1200, mFldAlign:=8
'    fcmb.AddFlexColList mFldName:="OpgDate", mFldTitle:="Date", mFldWidth:=1200, mFldAlign:=1
'    fcmb.AddFlexColList mFldName:="PttName", mFldTitle:="Patient Name", mFldWidth:=2500, mFldAlign:=1
'    fcmb.AddFlexColList mFldName:="PttRegNo", mFldTitle:="PttRegNo", mFldWidth:=1200, mFldAlign:=8
'    fcmb.AddFlexColList mFldName:="PttRefName", mFldTitle:="Care of", mFldWidth:=2000, mFldAlign:=1
'    fcmb.AddFlexColList mFldName:="AraName", mFldTitle:="Area", mFldWidth:=1750, mFldAlign:=1
'    fcmb.AddFlexColList mFldName:="StnName", mFldTitle:="Station", mFldWidth:=1750, mFldAlign:=1
'
'    fcmb.Init
'
'ElseIf blnOldOpgListByPttRegNo = True Then
'    Load fcmb
'    fcmb.lblFormHeading.Caption = "Old Outdoor List by Patient Reg.No."
'    fcmb.TableName = "PatMast"
'    fcmb.BoundField = "PttCode"
'    fcmb.ListField = "PttRegNo"
'    fcmb.ListFieldUnq = "PttRegNoUnq"
'    fcmb.lblSearchCaption.Caption = "Reg.No.:"
'
'    BRecset.Open fcmb.TableName, dbPmtDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect
'    BRecset.Index = fcmb.BoundField
'    If mListSqlExpr = "" Then
'        LRecset.Open "Select PatMast.PttCode,PatMast.PttRegNo,PatMast.PttName,OutdReg.OpgCode,OutdReg.OpgVchNo,OutdReg.OpgDate,cstr(PatMast.PttRegNo)+'_'+format(PatMast.PttCode,'" & cLONGCODESTRFMT & "') as PttRegNoUnq,PatMast.PttRefName,AreaMast.AraName,StsnMast.StnName from ((PatMast inner join OutdReg on PatMast.PttCode=OutdReg.OpgPttCode) inner join AreaMast on PatMast.PttAraCode=AreaMast.AraCode) inner join StsnMast on PatMast.PttStnCode=StsnMast.StnCode order by PttRegNo,PttCode", dbComDatabase, adOpenKeyset, adLockOptimistic
'    Else
'        LRecset.Open mListSqlExpr, dbComDatabase, adOpenKeyset, adLockOptimistic
'    End If
'
'    Set fcmb.BRecset = BRecset
'    Set fcmb.LRecset = LRecset
'    Set fcmb.dbPmtDatabase = dbPmtDatabase
'    Set fcmb.frmAccessMaster = New frmOutdoorReg
'
'    fcmb.ClearFlexColList
'    fcmb.AddFlexColList mFldName:="PttCode", mFldTitle:="PttCode", mFldWidth:=0, mFldAlign:=8
'    fcmb.AddFlexColList mFldName:="OpgCode", mFldTitle:="OpgCode", mFldWidth:=0, mFldAlign:=8
'    fcmb.AddFlexColList mFldName:="PttRegNo", mFldTitle:="Pat.Reg.No", mFldWidth:=1200, mFldAlign:=8
'    fcmb.AddFlexColList mFldName:="PttName", mFldTitle:="Patient Name", mFldWidth:=2500, mFldAlign:=1
'    fcmb.AddFlexColList mFldName:="OpgVchNo", mFldTitle:="Opd No", mFldWidth:=1200, mFldAlign:=8
'    fcmb.AddFlexColList mFldName:="OpgDate", mFldTitle:="Date", mFldWidth:=1200, mFldAlign:=1
'    fcmb.AddFlexColList mFldName:="PttRefName", mFldTitle:="Care of", mFldWidth:=2000, mFldAlign:=1
'    fcmb.AddFlexColList mFldName:="AraName", mFldTitle:="Area", mFldWidth:=1750, mFldAlign:=1
'    fcmb.AddFlexColList mFldName:="StnName", mFldTitle:="Station", mFldWidth:=1750, mFldAlign:=1
'
'    fcmb.Init
'
'ElseIf blnOldOpgListByPttName = True Then
'    Load fcmb
'    fcmb.lblFormHeading.Caption = "Old Outdoor List by Patient Name"
'    fcmb.TableName = "PatMast"
'    fcmb.BoundField = "PttCode"
'    fcmb.ListField = "PttName"
'    fcmb.ListFieldUnq = "PttNameUnq"
'    fcmb.lblSearchCaption.Caption = "Name:"
'
'    BRecset.Open fcmb.TableName, dbPmtDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect
'    BRecset.Index = fcmb.BoundField
'    If mListSqlExpr = "" Then
'        LRecset.Open "Select PatMast.PttCode,PatMast.PttName,PatMast.PttRegNo,OutdReg.OpgCode,OutdReg.OpgVchNo,OutdReg.OpgDate,PatMast.PttName+'_'+format(PatMast.PttCode,'" & cLONGCODESTRFMT & "') as PttNameUnq,PatMast.PttRefName,AreaMast.AraName,StsnMast.StnName from ((PatMast inner join OutdReg on PatMast.PttCode=OutdReg.OpgPttCode) inner join AreaMast on PatMast.PttAraCode=AreaMast.AraCode) inner join StsnMast on PatMast.PttStnCode=StsnMast.StnCode order by PttName,PttCode", dbComDatabase, adOpenKeyset, adLockOptimistic
'    Else
'        LRecset.Open mListSqlExpr, dbComDatabase, adOpenKeyset, adLockOptimistic
'    End If
'
'    Set fcmb.BRecset = BRecset
'    Set fcmb.LRecset = LRecset
'    Set fcmb.dbPmtDatabase = dbPmtDatabase
'    Set fcmb.frmAccessMaster = New frmOutdoorReg
'
'    fcmb.ClearFlexColList
'    fcmb.AddFlexColList mFldName:="PttCode", mFldTitle:="PttCode", mFldWidth:=0, mFldAlign:=8
'    fcmb.AddFlexColList mFldName:="OpgCode", mFldTitle:="OpgCode", mFldWidth:=0, mFldAlign:=8
'    fcmb.AddFlexColList mFldName:="PttName", mFldTitle:="Patient Name", mFldWidth:=2500, mFldAlign:=1
'    fcmb.AddFlexColList mFldName:="PttRegNo", mFldTitle:="Pat.Reg.No", mFldWidth:=1200, mFldAlign:=8
'    fcmb.AddFlexColList mFldName:="OpgVchNo", mFldTitle:="Opd No", mFldWidth:=1200, mFldAlign:=8
'    fcmb.AddFlexColList mFldName:="OpgDate", mFldTitle:="Date", mFldWidth:=1200, mFldAlign:=1
'    fcmb.AddFlexColList mFldName:="PttRefName", mFldTitle:="Care of", mFldWidth:=2000, mFldAlign:=1
'    fcmb.AddFlexColList mFldName:="AraName", mFldTitle:="Area", mFldWidth:=1750, mFldAlign:=1
'    fcmb.AddFlexColList mFldName:="StnName", mFldTitle:="Station", mFldWidth:=1750, mFldAlign:=1
'
'    fcmb.Init
'
'ElseIf blnOldOrcListByOrcNo = True Then
'    Load fcmb
'    fcmb.lblFormHeading.Caption = "Outdoor Receipt List by Rceipt No."
'    fcmb.TableName = "OutdHdr"
'    fcmb.BoundField = "OhrCode"
'    fcmb.ListField = "OhrVchNo"
'    fcmb.ListFieldUnq = "OhrVchNoUnq"
'    fcmb.lblSearchCaption.Caption = "No.:"
'
'    BRecset.Open fcmb.TableName, dbPmtDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect
'    BRecset.Index = fcmb.BoundField
'    If mListSqlExpr = "" Then
'        LRecset.Open "Select OutdHdr.OhrCode,OutdHdr.OhrVchNo,OutdHdr.OhrDate,OutdHdr.OhrAmtAftDisc,OutdHdr.OhrAdvAmt,OutdHdr.OhrRecdAmt,OutdHdr.OhrDepoAmt,OutdHdr.OhrRefuAmt,OutdHdr.OhrBalAmt,cstr(OutdHdr.OhrVchNo)+'_'+format(OutdHdr.OhrCode,'" & cLONGCODESTRFMT & "') as OhrVchNoUnq,PatMast.PttName,PatMast.PttRegNo,PatMast.PttRefName,AreaMast.AraName,StsnMast.StnName from ((OutdHdr inner join PatMast on OutdHdr.OhrPttCode=PatMast.PttCode) inner join AreaMast on PatMast.PttAraCode=AreaMast.AraCode) inner join StsnMast on PatMast.PttStnCode=StsnMast.StnCode" & IIf(mFiltCond <> "", " where " & mFiltCond, "") & " order by OhrVchNo,OhrCode", dbComDatabase, adOpenKeyset, adLockOptimistic
'    Else
'        LRecset.Open mListSqlExpr, dbComDatabase, adOpenKeyset, adLockOptimistic
'    End If
'
'    Set fcmb.BRecset = BRecset
'    Set fcmb.LRecset = LRecset
'    Set fcmb.dbPmtDatabase = dbPmtDatabase
'    Set fcmb.frmAccessMaster = New frmOutdoorReceipt
'
'    fcmb.ClearFlexColList
'    fcmb.AddFlexColList mFldName:="OhrCode", mFldTitle:="OhrCode", mFldWidth:=0, mFldAlign:=8
'    fcmb.AddFlexColList mFldName:="OhrVchNo", mFldTitle:="Rcpt.No", mFldWidth:=1200, mFldAlign:=8
'    fcmb.AddFlexColList mFldName:="OhrDate", mFldTitle:="Date", mFldWidth:=1300, mFldAlign:=1
'    fcmb.AddFlexColList mFldName:="OhrAmtAftDisc", mFldTitle:="Rcpt.Amt", mFldWidth:=1200, mFldAlign:=8
'    fcmb.AddFlexColList mFldName:="OhrBalAmt", mFldTitle:="Due.Amt", mFldWidth:=1200, mFldAlign:=8
'    fcmb.AddFlexColList mFldName:="PttName", mFldTitle:="Patient Name", mFldWidth:=2500, mFldAlign:=1
'    fcmb.AddFlexColList mFldName:="PttRegNo", mFldTitle:="RegNo", mFldWidth:=1200, mFldAlign:=8
'    fcmb.AddFlexColList mFldName:="PttRefName", mFldTitle:="Care of", mFldWidth:=2000, mFldAlign:=1
'    fcmb.AddFlexColList mFldName:="AraName", mFldTitle:="Area", mFldWidth:=1750, mFldAlign:=1
'    fcmb.AddFlexColList mFldName:="StnName", mFldTitle:="Station", mFldWidth:=1750, mFldAlign:=1
'    fcmb.AddFlexColList mFldName:="OhrAdvAmt", mFldTitle:="Adv.Amt", mFldWidth:=1200, mFldAlign:=8
'    fcmb.AddFlexColList mFldName:="OhrRecdAmt", mFldTitle:="Recd.Amt", mFldWidth:=1200, mFldAlign:=8
'    fcmb.AddFlexColList mFldName:="OhrDepoAmt", mFldTitle:="Depo.Amt", mFldWidth:=1200, mFldAlign:=8
'    fcmb.AddFlexColList mFldName:="OhrRefuAmt", mFldTitle:="Refd.Amt", mFldWidth:=1200, mFldAlign:=8
'
'    fcmb.Init
'
'ElseIf blnOldOblListByOblNo = True Then
'    Load fcmb
'    fcmb.lblFormHeading.Caption = "Outdoor Bill List by Bill No."
'    fcmb.TableName = "OutdBlHdr"
'    fcmb.BoundField = "ObhCode"
'    fcmb.ListField = "ObhVchNo"
'    fcmb.ListFieldUnq = "ObhVchNoUnq"
'    fcmb.lblSearchCaption.Caption = "No.:"
'
'    BRecset.Open fcmb.TableName, dbPmtDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect
'    BRecset.Index = fcmb.BoundField
'    If mListSqlExpr = "" Then
'        LRecset.Open "Select OutdBlHdr.ObhCode,OutdBlHdr.ObhVchNo,OutdBlHdr.ObhDate,OutdBlHdr.ObhAmtAftDisc,OutdBlHdr.ObhDepoAmt,OutdBlHdr.ObhRefuAmt,OutdBlHdr.ObhBalAmt,cstr(OutdBlHdr.ObhVchNo)+'_'+format(OutdBlHdr.ObhCode,'" & cLONGCODESTRFMT & "') as ObhVchNoUnq,PatMast.PttName,PatMast.PttRegNo,PatMast.PttRefName,AreaMast.AraName,StsnMast.StnName from ((OutdBlHdr inner join PatMast on OutdBlHdr.ObhPttCode=PatMast.PttCode) inner join AreaMast on PatMast.PttAraCode=AreaMast.AraCode) inner join StsnMast on PatMast.PttStnCode=StsnMast.StnCode" & IIf(mFiltCond <> "", " where " & mFiltCond, "") & " order by ObhVchNo,ObhCode", dbComDatabase, adOpenKeyset, adLockOptimistic
'    Else
'        LRecset.Open mListSqlExpr, dbComDatabase, adOpenKeyset, adLockOptimistic
'    End If
'
'    Set fcmb.BRecset = BRecset
'    Set fcmb.LRecset = LRecset
'    Set fcmb.dbPmtDatabase = dbPmtDatabase
'    Set fcmb.frmAccessMaster = New frmOutdoorBill
'
'    fcmb.ClearFlexColList
'    fcmb.AddFlexColList mFldName:="ObhCode", mFldTitle:="ObhCode", mFldWidth:=0, mFldAlign:=8
'    fcmb.AddFlexColList mFldName:="ObhVchNo", mFldTitle:="Bill No", mFldWidth:=1200, mFldAlign:=8
'    fcmb.AddFlexColList mFldName:="ObhDate", mFldTitle:="Date", mFldWidth:=1300, mFldAlign:=1
'    fcmb.AddFlexColList mFldName:="ObhAmtAftDisc", mFldTitle:="Bill Amt", mFldWidth:=1200, mFldAlign:=8
'    fcmb.AddFlexColList mFldName:="ObhBalAmt", mFldTitle:="Due.Amt", mFldWidth:=1200, mFldAlign:=8
'    fcmb.AddFlexColList mFldName:="PttName", mFldTitle:="Patient Name", mFldWidth:=2500, mFldAlign:=1
'    fcmb.AddFlexColList mFldName:="PttRegNo", mFldTitle:="RegNo", mFldWidth:=1200, mFldAlign:=8
'    fcmb.AddFlexColList mFldName:="PttRefName", mFldTitle:="Care of", mFldWidth:=2000, mFldAlign:=1
'    fcmb.AddFlexColList mFldName:="AraName", mFldTitle:="Area", mFldWidth:=1750, mFldAlign:=1
'    fcmb.AddFlexColList mFldName:="StnName", mFldTitle:="Station", mFldWidth:=1750, mFldAlign:=1
'    fcmb.AddFlexColList mFldName:="ObhDepoAmt", mFldTitle:="Depo.Amt", mFldWidth:=1200, mFldAlign:=8
'    fcmb.AddFlexColList mFldName:="ObhRefuAmt", mFldTitle:="Refd.Amt", mFldWidth:=1200, mFldAlign:=8
'
'    fcmb.Init
'
'ElseIf blnOldIpgListByIpgNo = True Then
'    Load fcmb
'    fcmb.lblFormHeading.Caption = "Old Indoor List by Ipd No."
'    fcmb.TableName = "IndrReg"
'    fcmb.BoundField = "IpgCode"
'    fcmb.ListField = "IpgVchNo"
'    fcmb.ListFieldUnq = "IpgVchNoUnq"
'    fcmb.lblSearchCaption.Caption = "No.:"
'
'    BRecset.Open fcmb.TableName, dbPmtDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect
'    BRecset.Index = fcmb.BoundField
'    If mListSqlExpr = "" Then
'        LRecset.Open "Select IndrReg.IpgCode,IndrReg.IpgVchNo,IndrReg.IpgDate,cstr(IndrReg.IpgVchNo)+'_'+format(IndrReg.IpgCode,'" & cLONGCODESTRFMT & "') as IpgVchNoUnq,PatMast.PttName,PatMast.PttRegNo,PatMast.PttRefName,AreaMast.AraName,StsnMast.StnName from ((IndrReg inner join PatMast on IndrReg.IpgPttCode=PatMast.PttCode) inner join AreaMast on PatMast.PttAraCode=AreaMast.AraCode) inner join StsnMast on PatMast.PttStnCode=StsnMast.StnCode order by IpgVchNo,IpgCode", dbComDatabase, adOpenKeyset, adLockOptimistic
'    Else
'        LRecset.Open mListSqlExpr, dbComDatabase, adOpenKeyset, adLockOptimistic
'    End If
'
'    Set fcmb.BRecset = BRecset
'    Set fcmb.LRecset = LRecset
'    Set fcmb.dbPmtDatabase = dbPmtDatabase
'    Set fcmb.frmAccessMaster = New frmIndoorReg
'
'    fcmb.ClearFlexColList
'    fcmb.AddFlexColList mFldName:="IpgCode", mFldTitle:="IpgCode", mFldWidth:=0, mFldAlign:=8
'    fcmb.AddFlexColList mFldName:="IpgVchNo", mFldTitle:="Ipd No", mFldWidth:=1200, mFldAlign:=8
'    fcmb.AddFlexColList mFldName:="IpgDate", mFldTitle:="Date", mFldWidth:=1200, mFldAlign:=1
'    fcmb.AddFlexColList mFldName:="PttName", mFldTitle:="Patient Name", mFldWidth:=2500, mFldAlign:=1
'    fcmb.AddFlexColList mFldName:="PttRegNo", mFldTitle:="PttRegNo", mFldWidth:=1200, mFldAlign:=8
'    fcmb.AddFlexColList mFldName:="PttRefName", mFldTitle:="Care of", mFldWidth:=2000, mFldAlign:=1
'    fcmb.AddFlexColList mFldName:="AraName", mFldTitle:="Area", mFldWidth:=1750, mFldAlign:=1
'    fcmb.AddFlexColList mFldName:="StnName", mFldTitle:="Station", mFldWidth:=1750, mFldAlign:=1
'
'    fcmb.Init
'
'ElseIf blnOldIpgListByPttRegNo = True Then
'    Load fcmb
'    fcmb.lblFormHeading.Caption = "Old Indoor List by Patient Reg.No."
'    fcmb.TableName = "PatMast"
'    fcmb.BoundField = "PttCode"
'    fcmb.ListField = "PttRegNo"
'    fcmb.ListFieldUnq = "PttRegNoUnq"
'    fcmb.lblSearchCaption.Caption = "Reg.No.:"
'
'    BRecset.Open fcmb.TableName, dbPmtDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect
'    BRecset.Index = fcmb.BoundField
'    If mListSqlExpr = "" Then
'        LRecset.Open "Select PatMast.PttCode,PatMast.PttRegNo,PatMast.PttName,IndrReg.IpgCode,IndrReg.IpgVchNo,IndrReg.IpgDate,cstr(PatMast.PttRegNo)+'_'+format(PatMast.PttCode,'" & cLONGCODESTRFMT & "') as PttRegNoUnq,PatMast.PttRefName,AreaMast.AraName,StsnMast.StnName from ((PatMast inner join IndrReg on PatMast.PttCode=IndrReg.IpgPttCode) inner join AreaMast on PatMast.PttAraCode=AreaMast.AraCode) inner join StsnMast on PatMast.PttStnCode=StsnMast.StnCode order by PttRegNo,PttCode", dbComDatabase, adOpenKeyset, adLockOptimistic
'    Else
'        LRecset.Open mListSqlExpr, dbComDatabase, adOpenKeyset, adLockOptimistic
'    End If
'
'    Set fcmb.BRecset = BRecset
'    Set fcmb.LRecset = LRecset
'    Set fcmb.dbPmtDatabase = dbPmtDatabase
'    Rem Set fcmb.frmAccessMaster = New frmIndoorReg
'
'    fcmb.ClearFlexColList
'    fcmb.AddFlexColList mFldName:="PttCode", mFldTitle:="PttCode", mFldWidth:=0, mFldAlign:=8
'    fcmb.AddFlexColList mFldName:="IpgCode", mFldTitle:="IpgCode", mFldWidth:=0, mFldAlign:=8
'    fcmb.AddFlexColList mFldName:="PttRegNo", mFldTitle:="Pat.Reg.No", mFldWidth:=1200, mFldAlign:=8
'    fcmb.AddFlexColList mFldName:="PttName", mFldTitle:="Patient Name", mFldWidth:=2500, mFldAlign:=1
'    fcmb.AddFlexColList mFldName:="IpgVchNo", mFldTitle:="Ipd No", mFldWidth:=1200, mFldAlign:=8
'    fcmb.AddFlexColList mFldName:="IpgDate", mFldTitle:="Date", mFldWidth:=1200, mFldAlign:=1
'    fcmb.AddFlexColList mFldName:="PttRefName", mFldTitle:="Care of", mFldWidth:=2000, mFldAlign:=1
'    fcmb.AddFlexColList mFldName:="AraName", mFldTitle:="Area", mFldWidth:=1750, mFldAlign:=1
'    fcmb.AddFlexColList mFldName:="StnName", mFldTitle:="Station", mFldWidth:=1750, mFldAlign:=1
'
'    fcmb.Init
'
'ElseIf blnOldIpgListByPttName = True Then
'    Load fcmb
'    fcmb.lblFormHeading.Caption = "Old Indoor List by Patient Name"
'    fcmb.TableName = "PatMast"
'    fcmb.BoundField = "PttCode"
'    fcmb.ListField = "PttName"
'    fcmb.ListFieldUnq = "PttNameUnq"
'    fcmb.lblSearchCaption.Caption = "Name:"
'
'    BRecset.Open fcmb.TableName, dbPmtDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect
'    BRecset.Index = fcmb.BoundField
'    If mListSqlExpr = "" Then
'        LRecset.Open "Select PatMast.PttCode,PatMast.PttName,PatMast.PttRegNo,IndrReg.IpgCode,IndrReg.IpgVchNo,IndrReg.IpgDate,PatMast.PttName+'_'+format(PatMast.PttCode,'" & cLONGCODESTRFMT & "') as PttNameUnq,PatMast.PttRefName,AreaMast.AraName,StsnMast.StnName from ((PatMast inner join IndrReg on PatMast.PttCode=IndrReg.IpgPttCode) inner join AreaMast on PatMast.PttAraCode=AreaMast.AraCode) inner join StsnMast on PatMast.PttStnCode=StsnMast.StnCode order by PttName,PttCode", dbComDatabase, adOpenKeyset, adLockOptimistic
'    Else
'        LRecset.Open mListSqlExpr, dbComDatabase, adOpenKeyset, adLockOptimistic
'    End If
'
'    Set fcmb.BRecset = BRecset
'    Set fcmb.LRecset = LRecset
'    Set fcmb.dbPmtDatabase = dbPmtDatabase
'    Rem Set fcmb.frmAccessMaster = New frmIndoorReg
'
'    fcmb.ClearFlexColList
'    fcmb.AddFlexColList mFldName:="PttCode", mFldTitle:="PttCode", mFldWidth:=0, mFldAlign:=8
'    fcmb.AddFlexColList mFldName:="IpgCode", mFldTitle:="IpgCode", mFldWidth:=0, mFldAlign:=8
'    fcmb.AddFlexColList mFldName:="PttName", mFldTitle:="Patient Name", mFldWidth:=2500, mFldAlign:=1
'    fcmb.AddFlexColList mFldName:="PttRegNo", mFldTitle:="Pat.Reg.No", mFldWidth:=1200, mFldAlign:=8
'    fcmb.AddFlexColList mFldName:="IpgVchNo", mFldTitle:="Ipd No", mFldWidth:=1200, mFldAlign:=8
'    fcmb.AddFlexColList mFldName:="IpgDate", mFldTitle:="Date", mFldWidth:=1200, mFldAlign:=1
'    fcmb.AddFlexColList mFldName:="PttRefName", mFldTitle:="Care of", mFldWidth:=2000, mFldAlign:=1
'    fcmb.AddFlexColList mFldName:="AraName", mFldTitle:="Area", mFldWidth:=1750, mFldAlign:=1
'    fcmb.AddFlexColList mFldName:="StnName", mFldTitle:="Station", mFldWidth:=1750, mFldAlign:=1
'
'    fcmb.Init
'
'ElseIf blnOldIrcListByIrcNo = True Then
'    Load fcmb
'    fcmb.lblFormHeading.Caption = "Indoor Receipt List by Rceipt No."
'    fcmb.TableName = "IndrHdr"
'    fcmb.BoundField = "IhrCode"
'    fcmb.ListField = "IhrVchNo"
'    fcmb.ListFieldUnq = "IhrVchNoUnq"
'    fcmb.lblSearchCaption.Caption = "No.:"
'
'    BRecset.Open fcmb.TableName, dbPmtDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect
'    BRecset.Index = fcmb.BoundField
'    If mListSqlExpr = "" Then
'        LRecset.Open "Select IndrHdr.IhrCode,IndrHdr.IhrVchNo,IndrHdr.IhrDate,IndrHdr.IhrAmtAftDisc,IndrHdr.IhrAdvAmt,IndrHdr.IhrRecdAmt,IndrHdr.IhrDepoAmt,IndrHdr.IhrRefuAmt,IndrHdr.IhrBalAmt,cstr(IndrHdr.IhrVchNo)+'_'+format(IndrHdr.IhrCode,'" & cLONGCODESTRFMT & "') as IhrVchNoUnq,PatMast.PttName,PatMast.PttRegNo,PatMast.PttRefName,AreaMast.AraName,StsnMast.StnName from ((IndrHdr inner join PatMast on IndrHdr.IhrPttCode=PatMast.PttCode) inner join AreaMast on PatMast.PttAraCode=AreaMast.AraCode) inner join StsnMast on PatMast.PttStnCode=StsnMast.StnCode" & IIf(mFiltCond <> "", " where " & mFiltCond, "") & " order by IhrVchNo,IhrCode", dbComDatabase, adOpenKeyset, adLockOptimistic
'    Else
'        LRecset.Open mListSqlExpr, dbComDatabase, adOpenKeyset, adLockOptimistic
'    End If
'
'    Set fcmb.BRecset = BRecset
'    Set fcmb.LRecset = LRecset
'    Set fcmb.dbPmtDatabase = dbPmtDatabase
'    Set fcmb.frmAccessMaster = New frmIndoorReceipt
'
'    fcmb.ClearFlexColList
'    fcmb.AddFlexColList mFldName:="IhrCode", mFldTitle:="IhrCode", mFldWidth:=0, mFldAlign:=8
'    fcmb.AddFlexColList mFldName:="IhrVchNo", mFldTitle:="Rcpt.No", mFldWidth:=1200, mFldAlign:=8
'    fcmb.AddFlexColList mFldName:="IhrDate", mFldTitle:="Date", mFldWidth:=1300, mFldAlign:=1
'    fcmb.AddFlexColList mFldName:="IhrAmtAftDisc", mFldTitle:="Rcpt.Amt", mFldWidth:=1200, mFldAlign:=8
'    fcmb.AddFlexColList mFldName:="IhrBalAmt", mFldTitle:="Due.Amt", mFldWidth:=1200, mFldAlign:=8
'    fcmb.AddFlexColList mFldName:="PttName", mFldTitle:="Patient Name", mFldWidth:=2500, mFldAlign:=1
'    fcmb.AddFlexColList mFldName:="PttRegNo", mFldTitle:="RegNo", mFldWidth:=1200, mFldAlign:=8
'    fcmb.AddFlexColList mFldName:="PttRefName", mFldTitle:="Care of", mFldWidth:=2000, mFldAlign:=1
'    fcmb.AddFlexColList mFldName:="AraName", mFldTitle:="Area", mFldWidth:=1750, mFldAlign:=1
'    fcmb.AddFlexColList mFldName:="StnName", mFldTitle:="Station", mFldWidth:=1750, mFldAlign:=1
'    fcmb.AddFlexColList mFldName:="IhrAdvAmt", mFldTitle:="Adv.Amt", mFldWidth:=1200, mFldAlign:=8
'    fcmb.AddFlexColList mFldName:="IhrRecdAmt", mFldTitle:="Recd.Amt", mFldWidth:=1200, mFldAlign:=8
'    fcmb.AddFlexColList mFldName:="IhrDepoAmt", mFldTitle:="Depo.Amt", mFldWidth:=1200, mFldAlign:=8
'    fcmb.AddFlexColList mFldName:="IhrRefuAmt", mFldTitle:="Refd.Amt", mFldWidth:=1200, mFldAlign:=8
'
'    fcmb.Init
'
'ElseIf blnOldIblListByIblNo = True Then
'    Load fcmb
'    fcmb.lblFormHeading.Caption = "Indoor Bill List by Bill No."
'    fcmb.TableName = "IndrBlHdr"
'    fcmb.BoundField = "IbhCode"
'    fcmb.ListField = "IbhVchNo"
'    fcmb.ListFieldUnq = "IbhVchNoUnq"
'    fcmb.lblSearchCaption.Caption = "No.:"
'
'    BRecset.Open fcmb.TableName, dbPmtDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect
'    BRecset.Index = fcmb.BoundField
'    If mListSqlExpr = "" Then
'        LRecset.Open "Select IndrBlHdr.IbhCode,IndrBlHdr.IbhVchNo,IndrBlHdr.IbhDate,IndrBlHdr.IbhAmtAftDisc,IndrBlHdr.IbhDepoAmt,IndrBlHdr.IbhRefuAmt,IndrBlHdr.IbhBalAmt,cstr(IndrBlHdr.IbhVchNo)+'_'+format(IndrBlHdr.IbhCode,'" & cLONGCODESTRFMT & "') as IbhVchNoUnq,PatMast.PttName,PatMast.PttRegNo,PatMast.PttRefName,AreaMast.AraName,StsnMast.StnName from ((IndrBlHdr inner join PatMast on IndrBlHdr.IbhPttCode=PatMast.PttCode) inner join AreaMast on PatMast.PttAraCode=AreaMast.AraCode) inner join StsnMast on PatMast.PttStnCode=StsnMast.StnCode" & IIf(mFiltCond <> "", " where " & mFiltCond, "") & " order by IbhVchNo,IbhCode", dbComDatabase, adOpenKeyset, adLockOptimistic
'    Else
'        LRecset.Open mListSqlExpr, dbComDatabase, adOpenKeyset, adLockOptimistic
'    End If
'
'    Set fcmb.BRecset = BRecset
'    Set fcmb.LRecset = LRecset
'    Set fcmb.dbPmtDatabase = dbPmtDatabase
'    'Set fcmb.frmAccessMaster = New frmIndoorBill
'
'    fcmb.ClearFlexColList
'    fcmb.AddFlexColList mFldName:="IbhCode", mFldTitle:="IbhCode", mFldWidth:=0, mFldAlign:=8
'    fcmb.AddFlexColList mFldName:="IbhVchNo", mFldTitle:="Bill No", mFldWidth:=1200, mFldAlign:=8
'    fcmb.AddFlexColList mFldName:="IbhDate", mFldTitle:="Date", mFldWidth:=1300, mFldAlign:=1
'    fcmb.AddFlexColList mFldName:="IbhAmtAftDisc", mFldTitle:="Bill Amt", mFldWidth:=1200, mFldAlign:=8
'    fcmb.AddFlexColList mFldName:="IbhBalAmt", mFldTitle:="Due.Amt", mFldWidth:=1200, mFldAlign:=8
'    fcmb.AddFlexColList mFldName:="PttName", mFldTitle:="Patient Name", mFldWidth:=2500, mFldAlign:=1
'    fcmb.AddFlexColList mFldName:="PttRegNo", mFldTitle:="RegNo", mFldWidth:=1200, mFldAlign:=8
'    fcmb.AddFlexColList mFldName:="PttRefName", mFldTitle:="Care of", mFldWidth:=2000, mFldAlign:=1
'    fcmb.AddFlexColList mFldName:="AraName", mFldTitle:="Area", mFldWidth:=1750, mFldAlign:=1
'    fcmb.AddFlexColList mFldName:="StnName", mFldTitle:="Station", mFldWidth:=1750, mFldAlign:=1
'    fcmb.AddFlexColList mFldName:="IbhDepoAmt", mFldTitle:="Depo.Amt", mFldWidth:=1200, mFldAlign:=8
'    fcmb.AddFlexColList mFldName:="IbhRefuAmt", mFldTitle:="Refd.Amt", mFldWidth:=1200, mFldAlign:=8
'
'    fcmb.Init
    
Else
    Err.Raise Number:=vbObjectError + 513, Description:="clsPmtFlexSearch_Class_Init_425"
    
End If

End Sub

Public Sub ReInit()
If blnSecuMastList = True Then
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
    
    BRecset.Open fcmb.TableName, dbPmtDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect
    BRecset.Index = fcmb.BoundField
    If mListSqlExpr = "" Then
        LRecset.Open "Select SubItmMast.*,ProdMast.ItmName from SubItmMast inner join ProdMast on SubItmMast.SimItmCode=ProdMast.ItmCode order by SimName", dbComDatabase, adOpenKeyset, adLockOptimistic
    Else
        LRecset.Open mListSqlExpr, dbComDatabase, adOpenKeyset, adLockOptimistic
    End If
    fcmb.ReInit
    
ElseIf blnBalSimRefNoList = True Then
    BRecset.Close: LRecset.Close
    
    If mBoundSqlExpr = "" Then
        BRecset.Open "Select *,SimRefNo+'_'+format(ItrCode,'" & cLONGCODESTRFMT & "') as SimRefNoUnq from (" _
            & "Select SimRefNo,ItrCode,sum(Qty) as Qty_sum from (" _
            & "Select JrcItrCode as ItrCode,JrcSimRefNo as SimRefNo,JrcQty as Qty from JobRcpt inner join JobRcHdr on JobRcpt.JrcCode=JobRcHdr.JrhCode" & IIf(mFiltCond <> "", " where " & mFiltCond, "") _
            & " Union All " _
            & "Select JisItrCode as ItrCode,JisSimRefNo as SimRefNo,(JisQty*-1) as Qty from JobIssu inner join JobIsHdr on JobIssu.JisCode=JobIsHdr.JihCode" & IIf(mFiltCond <> "", " where " & mFiltCond, "") _
            & ")" _
            & " group by ItrCode,SimRefNo order by ItrCode,SimRefNo" _
            & ")" _
            & " where Qty_sum>0" _
            , dbPmtDatabase, adOpenKeyset, adLockOptimistic
    Else
        BRecset.Open mBoundSqlExpr, dbPmtDatabase, adOpenKeyset, adLockOptimistic
    End If
    If mListSqlExpr = "" Then
        LRecset.Open "Select *,SimRefNo+'_'+format(ItrCode,'" & cLONGCODESTRFMT & "') as SimRefNoUnq from (" _
            & "Select SimRefNo,ItrCode,sum(Qty) as Qty_sum from (" _
            & "Select JrcItrCode as ItrCode,JrcSimRefNo as SimRefNo,JrcQty as Qty from JobRcpt inner join JobRcHdr on JobRcpt.JrcCode=JobRcHdr.JrhCode" & IIf(mFiltCond <> "", " where " & mFiltCond, "") _
            & " Union All " _
            & "Select JisItrCode as ItrCode,JisSimRefNo as SimRefNo,(JisQty*-1) as Qty from JobIssu inner join JobIsHdr on JobIssu.JisCode=JobIsHdr.JihCode" & IIf(mFiltCond <> "", " where " & mFiltCond, "") _
            & ")" _
            & " group by SimRefNo,ItrCode order by SimRefNo,ItrCode" _
            & ")" _
            & " where Qty_sum>0" _
            , dbPmtDatabase, adOpenKeyset, adLockOptimistic
    Else
        LRecset.Open mListSqlExpr, dbPmtDatabase, adOpenKeyset, adLockOptimistic
    End If
    fcmb.ReInit
    
ElseIf blnPartyMastList = True Then
    BRecset.Close: LRecset.Close
    
    BRecset.Open fcmb.TableName, dbPmtDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect
    BRecset.Index = fcmb.BoundField
    If mListSqlExpr = "" Then
        LRecset.Open "Select PartyMast.*,AreaMast.AraName,StsnMast.StnName,AchdMast.AhName from ((PartyMast inner join AreaMast on PartyMast.PrtAraCode=AreaMast.AraCode) inner join StsnMast on PartyMast.PrtStnCode=StsnMast.StnCode) inner join AchdMast on PartyMast.PrtAhCode=AchdMast.AhCode order by PrtName", dbComDatabase, adOpenKeyset, adLockOptimistic
    Else
        LRecset.Open mListSqlExpr, dbComDatabase, adOpenKeyset, adLockOptimistic
    End If
    fcmb.ReInit
    
Else
    Err.Raise Number:=vbObjectError + 513, Description:="clsPmtFlexSearch_Class_ReInit_799"
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

