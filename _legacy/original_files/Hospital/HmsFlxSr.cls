VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "clsHmsFlexSearch"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False

Option Explicit

Public fcmb As New frmFlexSearchList
Public dbAcDatabase As ADODB.Connection, dbStDatabase As ADODB.Connection, dbHmsDatabase As ADODB.Connection, dbCmpDatabase As ADODB.Connection, dbComDatabase As ADODB.Connection
Public mListSqlExpr As String, mBoundSqlExpr As String, mFiltCond As String
Rem Public mAchdMastList As Boolean, mProdMastList As Boolean
Rem Public mMachOptrList As Boolean, mMachMastList As Boolean, mPackPerList As Boolean, mMatProcMastList As Boolean, mVendMastList As Boolean
Rem Public mEmpMastList As Boolean, mDeptMastList As Boolean, mDesgMastList As Boolean
Public blnUserRoleMastList As Boolean, blnUserMastList As Boolean
Public blnPatMastListByName As Boolean, blnPatMastListByRegNo As Boolean, blnDoctMastList As Boolean, blnDoctRoleMastList As Boolean, blnRefByMastList As Boolean, blnRefToMastList As Boolean, blnDoctCatgMstList As Boolean, blnRefCatgMstList As Boolean, blnPatCatgMstList As Boolean, blnServGrpMstList As Boolean, blnDiagMastList As Boolean, blnServMastList As Boolean, blnFloorMastList As Boolean, blnWardMastList As Boolean, blnBedMastList As Boolean
Public blnSubItmMastList As Boolean, blnSubItmGrpMastList As Boolean, blnPartyMastList As Boolean, blnPartyGrpMastList As Boolean, blnBalSimRefNoList As Boolean

Rem outdoor entry
Public blnOldOpgListByOpgNo As Boolean, blnOldOpgListByPttRegNo As Boolean, blnOldOpgListByPttName As Boolean
Public blnOldOrcListByOrcNo As Boolean, blnOldOblListByOblNo As Boolean
Rem indoor entry
Public blnOldIpgListByIpgNo As Boolean, blnOldIpgListByPttRegNo As Boolean, blnOldIpgListByPttName As Boolean
Public blnAdmIpgListByIpgNo As Boolean, blnAdmIpgListByPttRegNo As Boolean, blnAdmIpgListByPttName As Boolean
Public blnDueIpgListByIpgNo As Boolean, blnDueIpgListByPttRegNo As Boolean, blnDueIpgListByPttName As Boolean
Public blnOldIgtListByIgtNo As Boolean, blnOldIgfListByIgfNo As Boolean
Public blnOldIrcListByIrcNo As Boolean, blnOldIblListByIblNo As Boolean
Rem lab entry
Public blnOldLrcListByLrcNo As Boolean, blnOldLrcListByPttRegNo As Boolean, blnOldLrcListByPttName As Boolean
Public blnDueLrcListByLrcNo As Boolean, blnDueLrcListByPttRegNo As Boolean, blnDueLrcListByPttName As Boolean
Rem general declaration
Dim BRecset As New ADODB.Recordset, LRecset As New ADODB.Recordset

Public Property Get LRecordCount() As Long
Dim tRecset As ADODB.Recordset

Set tRecset = LRecset.ActiveConnection.Execute("Select count(*) from (" & LRecset.Source & ")")
LRecordCount = tRecset.fields(0)
CloseTable tRecset

End Property

Public Property Get BRecordCount() As Long
Dim tRecset As ADODB.Recordset

Set tRecset = BRecset.ActiveConnection.Execute("Select count(*) from (" & BRecset.Source & ")")
BRecordCount = tRecset.fields(0)
CloseTable tRecset

End Property

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
Dim mSqlStr As String

If blnUserRoleMastList = True Then
    Load fcmb
    fcmb.lblFormHeading.Caption = "User Role Master"
    fcmb.TableName = "UserRoleMst"
    fcmb.BoundField = "UrlCode"
    fcmb.ListField = "UrlName"
    fcmb.lblSearchCaption.Caption = "Name:"
    
    BRecset.open fcmb.TableName, dbCmpDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect
    BRecset.Index = fcmb.BoundField
    If mListSqlExpr = "" Then
        LRecset.open "Select * from " & fcmb.TableName & IIf(mFiltCond <> "", " where " & mFiltCond, "") & " order by " & fcmb.ListField, dbCmpDatabase, adOpenKeyset, adLockOptimistic
    Else
        LRecset.open mListSqlExpr, dbCmpDatabase, adOpenKeyset, adLockOptimistic
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
    
    BRecset.open fcmb.TableName, dbCmpDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect
    BRecset.Index = fcmb.BoundField
    If mListSqlExpr = "" Then
        LRecset.open "Select * from " & fcmb.TableName & IIf(mFiltCond <> "", " where " & mFiltCond, "") & " order by " & fcmb.ListField, dbCmpDatabase, adOpenKeyset, adLockOptimistic
    Else
        LRecset.open mListSqlExpr, dbCmpDatabase, adOpenKeyset, adLockOptimistic
    End If
    
    Set fcmb.BRecset = BRecset
    Set fcmb.LRecset = LRecset
    Set fcmb.frmAccessMaster = New frmUserMast
    
    fcmb.ClearFlexColList
    fcmb.AddFlexColList mFldName:="UsrCode", mFldTitle:="UsrCode", mFldWidth:=0, mFldAlign:=7
    fcmb.AddFlexColList mFldName:="UsrName", mFldTitle:="User Name", mFldWidth:=3000, mFldAlign:=1
    
    fcmb.Init
    
ElseIf blnPatCatgMstList = True Then
    Load fcmb
    fcmb.lblFormHeading.Caption = "Patient Category Master"
    fcmb.TableName = "PatCatgMst"
    fcmb.BoundField = "PcgCode"
    fcmb.ListField = "PcgName"
    fcmb.lblSearchCaption.Caption = "Name:"
    
    BRecset.open fcmb.TableName, dbHmsDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect
    BRecset.Index = fcmb.BoundField
    If mListSqlExpr = "" Then
        LRecset.open "Select * from " & fcmb.TableName & IIf(mFiltCond <> "", " where " & mFiltCond, "") & " order by " & fcmb.ListField, dbHmsDatabase, adOpenKeyset, adLockOptimistic
    Else
        LRecset.open mListSqlExpr, dbHmsDatabase, adOpenKeyset, adLockOptimistic
    End If
    
    Set fcmb.BRecset = BRecset
    Set fcmb.LRecset = LRecset
    Set fcmb.frmAccessMaster = New frmPatCategoryMast
    
    fcmb.ClearFlexColList
    fcmb.AddFlexColList mFldName:="PcgCode", mFldTitle:="PcgCode", mFldWidth:=0, mFldAlign:=7
    fcmb.AddFlexColList mFldName:="PcgName", mFldTitle:="Patient Category", mFldWidth:=3000, mFldAlign:=1
    
    fcmb.Init
    
ElseIf blnPatMastListByName = True Then
    Load fcmb
    fcmb.lblFormHeading.Caption = "Patient Master"
    fcmb.TableName = "PatMast"
    fcmb.BoundField = "PttCode"
    fcmb.ListField = "PttName"
    fcmb.ListFieldUnq = "PttNameUnq"
    fcmb.lblSearchCaption.Caption = "Name:"
    
    BRecset.open fcmb.TableName, dbHmsDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect
    BRecset.Index = fcmb.BoundField
    If mListSqlExpr = "" Then
        LRecset.open "Select PatMast.*,PatMast.PttName+'_'+format(PatMast.PttCode,'" & cLONGCODESTRFMT & "') as PttNameUnq,PttTelNo+';'+PttSmsNo as PttContNo,AreaMast.AraName,StsnMast.StnName from (PatMast left join AreaMast on PatMast.PttAraCode=AreaMast.AraCode) left join StsnMast on PatMast.PttStnCode=StsnMast.StnCode" & IIf(mFiltCond <> "", " where " & mFiltCond, "") & " order by PttName,PttRegDate desc,PttRegNo desc,PttCode", dbComDatabase, adOpenKeyset, adLockOptimistic
    Else
        LRecset.open mListSqlExpr, dbComDatabase, adOpenKeyset, adLockOptimistic
    End If
    
    Set fcmb.BRecset = BRecset
    Set fcmb.LRecset = LRecset
    Set fcmb.frmAccessMaster = New frmPatientMast
    
    fcmb.ClearFlexColList
    fcmb.AddFlexColList mFldName:="PttCode", mFldTitle:="PttCode", mFldWidth:=0, mFldAlign:=7
    fcmb.AddFlexColList mFldName:="PttName", mFldTitle:="Patient Name", mFldWidth:=3000, mFldAlign:=1
    fcmb.AddFlexColList mFldName:="PttRegNo", mFldTitle:="Reg.No", mFldWidth:=1500, mFldAlign:=7
    fcmb.AddFlexColList mFldName:="PttRegDate", mFldTitle:="Reg.Date", mFldWidth:=1500, mFldAlign:=1
    fcmb.AddFlexColList mFldName:="PttRefName", mFldTitle:="Care of", mFldWidth:=2000, mFldAlign:=1
    fcmb.AddFlexColList mFldName:="PttAddr", mFldTitle:="Address", mFldWidth:=2500, mFldAlign:=1
    fcmb.AddFlexColList mFldName:="PttContNo", mFldTitle:="Contact No.", mFldWidth:=2000, mFldAlign:=1
    fcmb.AddFlexColList mFldName:="AraName", mFldTitle:="Area", mFldWidth:=2500, mFldAlign:=1
    fcmb.AddFlexColList mFldName:="StnName", mFldTitle:="Station", mFldWidth:=2500, mFldAlign:=1
    
    fcmb.FormWidth = fcmb.Width + 5000
    fcmb.Init
    
ElseIf blnPatMastListByRegNo = True Then
    Load fcmb
    fcmb.lblFormHeading.Caption = "Patient Master"
    fcmb.TableName = "PatMast"
    fcmb.BoundField = "PttCode"
    fcmb.ListField = "PttRegNo"
    fcmb.ListFieldUnq = "PttRegNoUnq"
    fcmb.lblSearchCaption.Caption = "Reg.No:"
    
    BRecset.open fcmb.TableName, dbHmsDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect
    BRecset.Index = fcmb.BoundField
    If mListSqlExpr = "" Then
        LRecset.open "Select PatMast.*,cstr(PatMast.PttRegNo)+'_'+format(PatMast.PttCode,'" & cLONGCODESTRFMT & "') as PttRegNoUnq,PttTelNo+';'+PttSmsNo as PttContNo,AreaMast.AraName,StsnMast.StnName from (PatMast left join AreaMast on PatMast.PttAraCode=AreaMast.AraCode) left join StsnMast on PatMast.PttStnCode=StsnMast.StnCode" & IIf(mFiltCond <> "", " where " & mFiltCond, "") & " order by PttRegNo,PttName", dbComDatabase, adOpenKeyset, adLockOptimistic
    Else
        LRecset.open mListSqlExpr, dbComDatabase, adOpenKeyset, adLockOptimistic
    End If
    
    Set fcmb.BRecset = BRecset
    Set fcmb.LRecset = LRecset
    Set fcmb.frmAccessMaster = New frmPatientMast
    
    fcmb.ClearFlexColList
    fcmb.AddFlexColList mFldName:="PttCode", mFldTitle:="PttCode", mFldWidth:=0, mFldAlign:=7
    fcmb.AddFlexColList mFldName:="PttRegNo", mFldTitle:="Reg.No", mFldWidth:=1500, mFldAlign:=7
    fcmb.AddFlexColList mFldName:="PttName", mFldTitle:="Patient Name", mFldWidth:=3000, mFldAlign:=1
    fcmb.AddFlexColList mFldName:="PttRegDate", mFldTitle:="Reg.Date", mFldWidth:=1500, mFldAlign:=1
    fcmb.AddFlexColList mFldName:="PttRefName", mFldTitle:="Care of", mFldWidth:=2000, mFldAlign:=1
    fcmb.AddFlexColList mFldName:="PttAddr", mFldTitle:="Address", mFldWidth:=2500, mFldAlign:=1
    fcmb.AddFlexColList mFldName:="PttContNo", mFldTitle:="Contact No.", mFldWidth:=2000, mFldAlign:=1
    fcmb.AddFlexColList mFldName:="AraName", mFldTitle:="Area", mFldWidth:=2000, mFldAlign:=1
    fcmb.AddFlexColList mFldName:="StnName", mFldTitle:="Station", mFldWidth:=2000, mFldAlign:=1
    
    fcmb.FormWidth = fcmb.Width + 5000
    fcmb.Init
    
ElseIf blnDoctMastList = True Then
    Load fcmb
    fcmb.lblFormHeading.Caption = "Doctor Master"
    fcmb.TableName = "DoctMast"
    fcmb.BoundField = "DctCode"
    fcmb.ListField = "DctName"
    fcmb.lblSearchCaption.Caption = "Name:"
    
    BRecset.open fcmb.TableName, dbHmsDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect
    BRecset.Index = fcmb.BoundField
    If mListSqlExpr = "" Then
        LRecset.open "Select * from " & fcmb.TableName & IIf(mFiltCond <> "", " where " & mFiltCond, "") & " order by " & fcmb.ListField, dbHmsDatabase, adOpenKeyset, adLockOptimistic
    Else
        LRecset.open mListSqlExpr, dbHmsDatabase, adOpenKeyset, adLockOptimistic
    End If
    
    Set fcmb.BRecset = BRecset
    Set fcmb.LRecset = LRecset
    Set fcmb.frmAccessMaster = New frmDoctorMast
    
    fcmb.ClearFlexColList
    fcmb.AddFlexColList mFldName:="DctCode", mFldTitle:="DctCode", mFldWidth:=0, mFldAlign:=7
    fcmb.AddFlexColList mFldName:="DctName", mFldTitle:="Doctor Name", mFldWidth:=3000, mFldAlign:=1
    
    fcmb.Init
    
ElseIf blnDoctRoleMastList = True Then
    Load fcmb
    fcmb.lblFormHeading.Caption = "Doctor Category Master"
    fcmb.TableName = "DoctRoleMst"
    fcmb.BoundField = "DrlCode"
    fcmb.ListField = "DrlName"
    fcmb.lblSearchCaption.Caption = "Name:"
    
    BRecset.open fcmb.TableName, dbHmsDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect
    BRecset.Index = fcmb.BoundField
    If mListSqlExpr = "" Then
        LRecset.open "Select * from " & fcmb.TableName & IIf(mFiltCond <> "", " where " & mFiltCond, "") & " order by " & fcmb.ListField, dbHmsDatabase, adOpenKeyset, adLockOptimistic
    Else
        LRecset.open mListSqlExpr, dbHmsDatabase, adOpenKeyset, adLockOptimistic
    End If
    
    Set fcmb.BRecset = BRecset
    Set fcmb.LRecset = LRecset
    #If APP_HOSPITAL = True Then
        Set fcmb.frmAccessMaster = New frmDoctorRoleMast
    #End If
    
    fcmb.ClearFlexColList
    fcmb.AddFlexColList mFldName:="DrlCode", mFldTitle:="DrlCode", mFldWidth:=0, mFldAlign:=7
    fcmb.AddFlexColList mFldName:="DrlName", mFldTitle:="Doctor Role", mFldWidth:=3000, mFldAlign:=1
    
    fcmb.Init

ElseIf blnRefByMastList = True Then
    Load fcmb
    fcmb.lblFormHeading.Caption = "Referred By"
    fcmb.TableName = "RefByMast"
    fcmb.BoundField = "RByCode"
    fcmb.ListField = "RByName"
    fcmb.lblSearchCaption.Caption = "Name:"
    
    BRecset.open fcmb.TableName, dbHmsDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect
    BRecset.Index = fcmb.BoundField
    If mListSqlExpr = "" Then
        LRecset.open "Select * from " & fcmb.TableName & IIf(mFiltCond <> "", " where " & mFiltCond, "") & " order by " & fcmb.ListField, dbHmsDatabase, adOpenKeyset, adLockOptimistic
    Else
        LRecset.open mListSqlExpr, dbHmsDatabase, adOpenKeyset, adLockOptimistic
    End If
    
    Set fcmb.BRecset = BRecset
    Set fcmb.LRecset = LRecset
    #If APP_HOSPITAL = True Then
        Set fcmb.frmAccessMaster = New frmRefByMast
    #End If
    
    fcmb.ClearFlexColList
    fcmb.AddFlexColList mFldName:="RByCode", mFldTitle:="RByCode", mFldWidth:=0, mFldAlign:=7
    fcmb.AddFlexColList mFldName:="RByName", mFldTitle:="Referred By Name", mFldWidth:=3000, mFldAlign:=1
    
    fcmb.Init

ElseIf blnRefToMastList = True Then
    Load fcmb
    fcmb.lblFormHeading.Caption = "Referred To"
    fcmb.TableName = "RefToMast"
    fcmb.BoundField = "RToCode"
    fcmb.ListField = "RToName"
    fcmb.lblSearchCaption.Caption = "Name:"
    
    BRecset.open fcmb.TableName, dbHmsDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect
    BRecset.Index = fcmb.BoundField
    If mListSqlExpr = "" Then
        LRecset.open "Select * from " & fcmb.TableName & IIf(mFiltCond <> "", " where " & mFiltCond, "") & " order by " & fcmb.ListField, dbHmsDatabase, adOpenKeyset, adLockOptimistic
    Else
        LRecset.open mListSqlExpr, dbHmsDatabase, adOpenKeyset, adLockOptimistic
    End If
    
    Set fcmb.BRecset = BRecset
    Set fcmb.LRecset = LRecset
    #If APP_HOSPITAL = True Then
        Set fcmb.frmAccessMaster = New frmRefToMast
    #End If
    
    fcmb.ClearFlexColList
    fcmb.AddFlexColList mFldName:="RToCode", mFldTitle:="RToCode", mFldWidth:=0, mFldAlign:=7
    fcmb.AddFlexColList mFldName:="RToName", mFldTitle:="Referred To Name", mFldWidth:=3000, mFldAlign:=1
    
    fcmb.Init
    
ElseIf blnDoctCatgMstList = True Then
    Load fcmb
    fcmb.lblFormHeading.Caption = "Doctor Category Master"
    fcmb.TableName = "DoctCatgMst"
    fcmb.BoundField = "DcgCode"
    fcmb.ListField = "DcgName"
    fcmb.lblSearchCaption.Caption = "Name:"
    
    BRecset.open fcmb.TableName, dbHmsDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect
    BRecset.Index = fcmb.BoundField
    If mListSqlExpr = "" Then
        LRecset.open "Select * from " & fcmb.TableName & IIf(mFiltCond <> "", " where " & mFiltCond, "") & " order by " & fcmb.ListField, dbHmsDatabase, adOpenKeyset, adLockOptimistic
    Else
        LRecset.open mListSqlExpr, dbHmsDatabase, adOpenKeyset, adLockOptimistic
    End If
    
    Set fcmb.BRecset = BRecset
    Set fcmb.LRecset = LRecset
    Set fcmb.frmAccessMaster = New frmDoctorCatgMast
    
    fcmb.ClearFlexColList
    fcmb.AddFlexColList mFldName:="DcgCode", mFldTitle:="DcgCode", mFldWidth:=0, mFldAlign:=7
    fcmb.AddFlexColList mFldName:="DcgName", mFldTitle:="Doctor Category", mFldWidth:=3000, mFldAlign:=1
    
    fcmb.Init
    
ElseIf blnRefCatgMstList = True Then
    Load fcmb
    fcmb.lblFormHeading.Caption = "Referred Category Master"
    fcmb.TableName = "RefCatgMst"
    fcmb.BoundField = "RfgCode"
    fcmb.ListField = "RfgName"
    fcmb.lblSearchCaption.Caption = "Name:"
    
    BRecset.open fcmb.TableName, dbHmsDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect
    BRecset.Index = fcmb.BoundField
    If mListSqlExpr = "" Then
        LRecset.open "Select * from " & fcmb.TableName & IIf(mFiltCond <> "", " where " & mFiltCond, "") & " order by " & fcmb.ListField, dbHmsDatabase, adOpenKeyset, adLockOptimistic
    Else
        LRecset.open mListSqlExpr, dbHmsDatabase, adOpenKeyset, adLockOptimistic
    End If
    
    Set fcmb.BRecset = BRecset
    Set fcmb.LRecset = LRecset
    #If APP_HOSPITAL = True Then
        Set fcmb.frmAccessMaster = New frmRefCatgMast
    #End If
    
    fcmb.ClearFlexColList
    fcmb.AddFlexColList mFldName:="RfgCode", mFldTitle:="RfgCode", mFldWidth:=0, mFldAlign:=7
    fcmb.AddFlexColList mFldName:="RfgName", mFldTitle:="Referred Category", mFldWidth:=3000, mFldAlign:=1
    
    fcmb.Init
    
ElseIf blnServGrpMstList = True Then
    Load fcmb
    fcmb.lblFormHeading.Caption = "Service Group Master"
    fcmb.TableName = "ServGrpMst"
    fcmb.BoundField = "SgpCode"
    fcmb.ListField = "SgpName"
    fcmb.lblSearchCaption.Caption = "Name:"
    
    BRecset.open fcmb.TableName, dbHmsDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect    ' SgpShowInList=True
    BRecset.Index = fcmb.BoundField
    If mListSqlExpr = "" Then
        LRecset.open "Select * from " & fcmb.TableName & " where SgpShowInList=True" & IIf(mFiltCond <> "", mFiltCond, "") & " order by " & fcmb.ListField, dbHmsDatabase, adOpenKeyset, adLockOptimistic
    Else
        LRecset.open mListSqlExpr, dbHmsDatabase, adOpenKeyset, adLockOptimistic
    End If
    
    Set fcmb.BRecset = BRecset
    Set fcmb.LRecset = LRecset
    #If APP_HOSPITAL = True Then
        Set fcmb.frmAccessMaster = New frmServGroupMast
    #End If
    
    fcmb.ClearFlexColList
    fcmb.AddFlexColList mFldName:="SgpCode", mFldTitle:="SgpCode", mFldWidth:=0, mFldAlign:=7
    fcmb.AddFlexColList mFldName:="SgpName", mFldTitle:="Group Name", mFldWidth:=3000, mFldAlign:=1
    
    fcmb.Init
    
ElseIf blnServMastList = True Then
    Load fcmb
    fcmb.lblFormHeading.Caption = "Service Master"
    fcmb.TableName = "ServMast"
    fcmb.BoundField = "SrvCode"
    fcmb.ListField = "SrvName"
    fcmb.lblSearchCaption.Caption = "Name:"
    
    BRecset.open fcmb.TableName, dbHmsDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect    ' SrvShowInList=True
    BRecset.Index = fcmb.BoundField
    If mListSqlExpr = "" Then
        LRecset.open "Select * from " & fcmb.TableName _
          & " Inner Join ServGrpMst on " & fcmb.TableName & ".SrvSgpCode = ServGrpMst.SgpCode" _
          & " where SrvShowInList = True" & IIf(mFiltCond <> "", mFiltCond, "") _
          & " order by " & fcmb.ListField, dbHmsDatabase, adOpenKeyset, adLockOptimistic
    Else
        LRecset.open mListSqlExpr, dbHmsDatabase, adOpenKeyset, adLockOptimistic
    End If
    
    Set fcmb.BRecset = BRecset
    Set fcmb.LRecset = LRecset
    #If APP_HOSPITAL = True Then
        Set fcmb.frmAccessMaster = New frmServiceMast
    #End If
    
    fcmb.ClearFlexColList
    fcmb.AddFlexColList mFldName:="SrvCode", mFldTitle:="SrvCode", mFldWidth:=0, mFldAlign:=7
    fcmb.AddFlexColList mFldName:="SrvName", mFldTitle:="Service Name", mFldWidth:=3000, mFldAlign:=1
    fcmb.AddFlexColList mFldName:="SrvRate", mFldTitle:="Charges", mFldWidth:=1000, mFldAlign:=7
    fcmb.AddFlexColList mFldName:="SgpName", mFldTitle:="Group Name", mFldWidth:=2500, mFldAlign:=1
    
    fcmb.Init
    
ElseIf blnDiagMastList = True Then
    Load fcmb
    fcmb.lblFormHeading.Caption = "Diagnostic Master"
    fcmb.TableName = "DiagMast"
    fcmb.BoundField = "DigCode"
    fcmb.ListField = "DigName"
    fcmb.lblSearchCaption.Caption = "Name:"
    
    BRecset.open fcmb.TableName, dbHmsDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect
    BRecset.Index = fcmb.BoundField
    If mListSqlExpr = "" Then
        LRecset.open "Select * from " & fcmb.TableName & IIf(mFiltCond <> "", " where " & mFiltCond, "") & " order by " & fcmb.ListField, dbHmsDatabase, adOpenKeyset, adLockOptimistic
    Else
        LRecset.open mListSqlExpr, dbHmsDatabase, adOpenKeyset, adLockOptimistic
    End If
    
    Set fcmb.BRecset = BRecset
    Set fcmb.LRecset = LRecset
    #If APP_HOSPITAL = True Then
        Set fcmb.frmAccessMaster = New frmDiagnosticMast
    #End If
    
    fcmb.ClearFlexColList
    fcmb.AddFlexColList mFldName:="DigCode", mFldTitle:="DigCode", mFldWidth:=0, mFldAlign:=7
    fcmb.AddFlexColList mFldName:="DigName", mFldTitle:="Diagnosis", mFldWidth:=3000, mFldAlign:=1
    
    fcmb.Init
    
ElseIf blnFloorMastList = True Then
    Load fcmb
    fcmb.lblFormHeading.Caption = "Floor Master"
    fcmb.TableName = "FloorMast"
    fcmb.BoundField = "FlrCode"
    fcmb.ListField = "FlrName"
    fcmb.lblSearchCaption.Caption = "Name:"
    
    BRecset.open fcmb.TableName, dbHmsDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect
    BRecset.Index = fcmb.BoundField
    If mListSqlExpr = "" Then
        LRecset.open "Select * from " & fcmb.TableName & " where FlrShowInList=True" & IIf(mFiltCond <> "", mFiltCond, "") & " order by " & fcmb.ListField, dbHmsDatabase, adOpenKeyset, adLockOptimistic
    Else
        LRecset.open mListSqlExpr, dbHmsDatabase, adOpenKeyset, adLockOptimistic
    End If
    
    Set fcmb.BRecset = BRecset
    Set fcmb.LRecset = LRecset
    #If APP_HOSPITAL = True Then
        Set fcmb.frmAccessMaster = New frmFloorMast
    #End If
    
    fcmb.ClearFlexColList
    fcmb.AddFlexColList mFldName:="FlrCode", mFldTitle:="FlrCode", mFldWidth:=0, mFldAlign:=7
    fcmb.AddFlexColList mFldName:="FlrName", mFldTitle:="Floor Name", mFldWidth:=3000, mFldAlign:=1
    
    fcmb.Init
    
ElseIf blnWardMastList = True Then
    Load fcmb
    fcmb.lblFormHeading.Caption = "Ward Master"
    fcmb.TableName = "WardMast"
    fcmb.BoundField = "WrdCode"
    fcmb.ListField = "WrdName"
    fcmb.lblSearchCaption.Caption = "Name:"
    
    BRecset.open fcmb.TableName, dbHmsDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect
    BRecset.Index = fcmb.BoundField
    If mListSqlExpr = "" Then
        LRecset.open "Select * from " & fcmb.TableName & " where WrdShowInList=True" & IIf(mFiltCond <> "", mFiltCond, "") & " order by " & fcmb.ListField, dbHmsDatabase, adOpenKeyset, adLockOptimistic
    Else
        LRecset.open mListSqlExpr, dbHmsDatabase, adOpenKeyset, adLockOptimistic
    End If
    
    Set fcmb.BRecset = BRecset
    Set fcmb.LRecset = LRecset
    #If APP_HOSPITAL = True Then
        Set fcmb.frmAccessMaster = New frmWardMast
    #End If
    
    fcmb.ClearFlexColList
    fcmb.AddFlexColList mFldName:="WrdCode", mFldTitle:="WrdCode", mFldWidth:=0, mFldAlign:=7
    fcmb.AddFlexColList mFldName:="WrdName", mFldTitle:="Ward Name", mFldWidth:=3000, mFldAlign:=1
    
    fcmb.Init
    
ElseIf blnBedMastList = True Then
    Load fcmb
    fcmb.lblFormHeading.Caption = "Bed Master"
    fcmb.TableName = "BedMast"
    fcmb.BoundField = "BdmCode"
    fcmb.ListField = "BdmName"
    fcmb.lblSearchCaption.Caption = "Name:"
    
    BRecset.open fcmb.TableName, dbHmsDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect
    BRecset.Index = fcmb.BoundField
    If mListSqlExpr = "" Then
        LRecset.open "Select * from " & fcmb.TableName & " where BdmShowInList=True" & IIf(mFiltCond <> "", mFiltCond, "") & " order by " & fcmb.ListField, dbHmsDatabase, adOpenKeyset, adLockOptimistic
    Else
        LRecset.open mListSqlExpr, dbHmsDatabase, adOpenKeyset, adLockOptimistic
    End If
    
    Set fcmb.BRecset = BRecset
    Set fcmb.LRecset = LRecset
    #If APP_HOSPITAL = True Then
        Set fcmb.frmAccessMaster = New frmBedMast
    #End If
    
    fcmb.ClearFlexColList
    fcmb.AddFlexColList mFldName:="BdmCode", mFldTitle:="BdmCode", mFldWidth:=0, mFldAlign:=7
    fcmb.AddFlexColList mFldName:="BdmName", mFldTitle:="Bed Name", mFldWidth:=3000, mFldAlign:=1
    
    fcmb.Init
    
ElseIf blnOldOpgListByOpgNo = True Then
    Load fcmb
    fcmb.lblFormHeading.Caption = "Old Outdoor List by Opd No."
    fcmb.TableName = "OutdReg"
    fcmb.BoundField = "OpgCode"
    fcmb.ListField = "OpgVchNo"
    fcmb.ListFieldUnq = "OpgVchNoUnq"
    fcmb.lblSearchCaption.Caption = "No.:"
    
    BRecset.open fcmb.TableName, dbHmsDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect
    BRecset.Index = fcmb.BoundField
    If mListSqlExpr = "" Then
        LRecset.open "Select OutdReg.OpgCode,OutdReg.OpgVchNo,OutdReg.OpgDate,cstr(OutdReg.OpgVchNo)+'_'+format(OutdReg.OpgCode,'" & cLONGCODESTRFMT & "') as OpgVchNoUnq,PatMast.PttName,PatMast.PttRegNo,PatMast.PttRefName,PatMast.PttAddr,AreaMast.AraName,StsnMast.StnName from ((OutdReg inner join PatMast on OutdReg.OpgPttCode=PatMast.PttCode) inner join AreaMast on PatMast.PttAraCode=AreaMast.AraCode) inner join StsnMast on PatMast.PttStnCode=StsnMast.StnCode" & IIf(mFiltCond <> "", " where " & mFiltCond, "") & " order by OpgVchNo,OpgCode", dbComDatabase, adOpenKeyset, adLockOptimistic
    Else
        LRecset.open mListSqlExpr, dbComDatabase, adOpenKeyset, adLockOptimistic
    End If
    
    Set fcmb.BRecset = BRecset
    Set fcmb.LRecset = LRecset
    #If APP_HOSPITAL = True Then
        Set fcmb.frmAccessMaster = New frmOutdoorReg
    #End If
    
    fcmb.ClearFlexColList
    fcmb.AddFlexColList mFldName:="OpgCode", mFldTitle:="OpgCode", mFldWidth:=0, mFldAlign:=7
    fcmb.AddFlexColList mFldName:="OpgVchNo", mFldTitle:="Opd No", mFldWidth:=1200, mFldAlign:=7
    fcmb.AddFlexColList mFldName:="OpgDate", mFldTitle:="Date", mFldWidth:=1500, mFldAlign:=1
    fcmb.AddFlexColList mFldName:="PttName", mFldTitle:="Patient Name", mFldWidth:=2500, mFldAlign:=1
    fcmb.AddFlexColList mFldName:="PttRegNo", mFldTitle:="PttRegNo", mFldWidth:=1200, mFldAlign:=7
    fcmb.AddFlexColList mFldName:="PttRefName", mFldTitle:="Care of", mFldWidth:=2000, mFldAlign:=1
    fcmb.AddFlexColList mFldName:="AraName", mFldTitle:="Area", mFldWidth:=1750, mFldAlign:=1
    fcmb.AddFlexColList mFldName:="StnName", mFldTitle:="Station", mFldWidth:=1750, mFldAlign:=1
    
    fcmb.Init
    
ElseIf blnOldOpgListByPttRegNo = True Then
    Load fcmb
    fcmb.lblFormHeading.Caption = "Old Outdoor List by Patient Reg.No."
    fcmb.TableName = "OutdReg"
    fcmb.BoundField = "OpgCode"
    fcmb.ListField = "PttRegNo"
    fcmb.ListFieldUnq = "PttRegNoUnq"
    fcmb.lblSearchCaption.Caption = "Reg.No.:"
    
    BRecset.open "Select PatMast.PttCode,PatMast.PttRegNo,PatMast.PttName,OutdReg.OpgCode,OutdReg.OpgVchNo,OutdReg.OpgDate" _
        & ",cstr(PatMast.PttRegNo)+'_'+format(OutdReg.OpgCode,'" & cLONGCODESTRFMT & "') as PttRegNoUnq,PatMast.PttRefName,PatMast.PttAddr,PttTelNo+';'+PttSmsNo as PttContNo,AreaMast.AraName,StsnMast.StnName" _
        & " from ((PatMast" _
        & " inner join OutdReg on PatMast.PttCode = OutdReg.OpgPttCode)" _
        & " inner join AreaMast on PatMast.PttAraCode = AreaMast.AraCode)" _
        & " inner join StsnMast on PatMast.PttStnCode = StsnMast.StnCode" _
        & IIf(mFiltCond <> "", " where " & mFiltCond, "") _
        & " order by OpgCode" _
        , dbComDatabase, adOpenKeyset, adLockOptimistic
    If mListSqlExpr = "" Then
        LRecset.open "Select PatMast.PttCode,PatMast.PttRegNo,PatMast.PttName,OutdReg.OpgCode,OutdReg.OpgVchNo,OutdReg.OpgDate" _
            & ",cstr(PatMast.PttRegNo)+'_'+format(OutdReg.OpgCode,'" & cLONGCODESTRFMT & "') as PttRegNoUnq,PatMast.PttRefName,PatMast.PttAddr,PttTelNo+';'+PttSmsNo as PttContNo,AreaMast.AraName,StsnMast.StnName" _
            & " from ((PatMast" _
            & " inner join OutdReg on PatMast.PttCode = OutdReg.OpgPttCode)" _
            & " inner join AreaMast on PatMast.PttAraCode = AreaMast.AraCode)" _
            & " inner join StsnMast on PatMast.PttStnCode = StsnMast.StnCode" _
            & IIf(mFiltCond <> "", " where " & mFiltCond, "") _
            & " order by PttRegNo,OpgDate desc,OpgCode,PttCode" _
            , dbComDatabase, adOpenKeyset, adLockOptimistic
    Else
        LRecset.open mListSqlExpr, dbComDatabase, adOpenKeyset, adLockOptimistic
    End If
    
    Set fcmb.BRecset = BRecset
    Set fcmb.LRecset = LRecset
    #If APP_HOSPITAL = True Then
        Set fcmb.frmAccessMaster = New frmOutdoorReg
    #End If
    
    fcmb.ClearFlexColList
    fcmb.AddFlexColList mFldName:="PttCode", mFldTitle:="PttCode", mFldWidth:=0, mFldAlign:=7
    fcmb.AddFlexColList mFldName:="OpgCode", mFldTitle:="OpgCode", mFldWidth:=0, mFldAlign:=7
    fcmb.AddFlexColList mFldName:="PttRegNo", mFldTitle:="Pat.Reg.No", mFldWidth:=1200, mFldAlign:=7
    fcmb.AddFlexColList mFldName:="PttName", mFldTitle:="Patient Name", mFldWidth:=2500, mFldAlign:=1
    fcmb.AddFlexColList mFldName:="OpgVchNo", mFldTitle:="Opd No", mFldWidth:=1200, mFldAlign:=7
    fcmb.AddFlexColList mFldName:="OpgDate", mFldTitle:="Date", mFldWidth:=1500, mFldAlign:=1
    fcmb.AddFlexColList mFldName:="PttRefName", mFldTitle:="Care of", mFldWidth:=2000, mFldAlign:=1
    fcmb.AddFlexColList mFldName:="PttAddr", mFldTitle:="Address", mFldWidth:=2500, mFldAlign:=1
    fcmb.AddFlexColList mFldName:="PttContNo", mFldTitle:="Contact No", mFldWidth:=2000, mFldAlign:=1
    fcmb.AddFlexColList mFldName:="AraName", mFldTitle:="Area", mFldWidth:=1750, mFldAlign:=1
    fcmb.AddFlexColList mFldName:="StnName", mFldTitle:="Station", mFldWidth:=1750, mFldAlign:=1
    
    fcmb.FormWidth = fcmb.Width + 5000
    fcmb.Init
    
ElseIf blnOldOpgListByPttName = True Then
    Load fcmb
    fcmb.lblFormHeading.Caption = "Old Outdoor List by Patient Name"
    fcmb.TableName = "OutdReg"
    fcmb.BoundField = "OpgCode"
    fcmb.ListField = "PttName"
    fcmb.ListFieldUnq = "PttNameUnq"
    fcmb.lblSearchCaption.Caption = "Name:"
    
    BRecset.open "Select PatMast.PttCode,PatMast.PttName,PatMast.PttRegNo,OutdReg.OpgCode,OutdReg.OpgVchNo,OutdReg.OpgDate" _
        & ",PatMast.PttName+'_'+format(OutdReg.OpgCode,'" & cLONGCODESTRFMT & "') as PttNameUnq,PatMast.PttRefName,PatMast.PttAddr,PttTelNo+';'+PttSmsNo as PttContNo,AreaMast.AraName,StsnMast.StnName" _
        & " from ((PatMast" _
        & " inner join OutdReg on PatMast.PttCode = OutdReg.OpgPttCode)" _
        & " inner join AreaMast on PatMast.PttAraCode = AreaMast.AraCode)" _
        & " inner join StsnMast on PatMast.PttStnCode = StsnMast.StnCode" _
        & IIf(mFiltCond <> "", " where " & mFiltCond, "") _
        & " order by OpgCode" _
        , dbComDatabase, adOpenKeyset, adLockOptimistic
    If mListSqlExpr = "" Then
        Rem LRecset.open "Select PatMast.PttCode,PatMast.PttName,PatMast.PttRegNo,OutdReg.OpgCode,OutdReg.OpgVchNo,OutdReg.OpgDate,PatMast.PttName+'_'+format(PatMast.PttCode,'" & cLONGCODESTRFMT & "') as PttNameUnq,PatMast.PttRefName,PatMast.PttAddr,PttTelNo+';'+PttSmsNo as PttContNo,AreaMast.AraName,StsnMast.StnName from ((PatMast inner join OutdReg on PatMast.PttCode = OutdReg.OpgPttCode) inner join AreaMast on PatMast.PttAraCode = AreaMast.AraCode) inner join StsnMast on PatMast.PttStnCode = StsnMast.StnCode" & IIf(mFiltCond <> "", " where " & mFiltCond, "") & " order by PttName,OutdReg.OpgDate desc,PttCode", dbComDatabase, adOpenKeyset, adLockOptimistic
        LRecset.open "Select PatMast.PttCode,PatMast.PttName,PatMast.PttRegNo,OutdReg.OpgCode,OutdReg.OpgVchNo,OutdReg.OpgDate" _
            & ",PatMast.PttName+'_'+format(OutdReg.OpgCode,'" & cLONGCODESTRFMT & "') as PttNameUnq,PatMast.PttRefName,PatMast.PttAddr,PttTelNo+';'+PttSmsNo as PttContNo,AreaMast.AraName,StsnMast.StnName" _
            & " from ((PatMast" _
            & " inner join OutdReg on PatMast.PttCode = OutdReg.OpgPttCode)" _
            & " inner join AreaMast on PatMast.PttAraCode = AreaMast.AraCode)" _
            & " inner join StsnMast on PatMast.PttStnCode = StsnMast.StnCode" _
            & IIf(mFiltCond <> "", " where " & mFiltCond, "") _
            & " order by PttName,OpgDate desc,OpgCode,PttCode" _
            , dbComDatabase, adOpenKeyset, adLockOptimistic
    Else
        LRecset.open mListSqlExpr, dbComDatabase, adOpenKeyset, adLockOptimistic
    End If
    
    Set fcmb.BRecset = BRecset
    Set fcmb.LRecset = LRecset
    #If APP_HOSPITAL = True Then
        Set fcmb.frmAccessMaster = New frmOutdoorReg
    #End If
    
    fcmb.ClearFlexColList
    fcmb.AddFlexColList mFldName:="PttCode", mFldTitle:="PttCode", mFldWidth:=0, mFldAlign:=7
    fcmb.AddFlexColList mFldName:="OpgCode", mFldTitle:="OpgCode", mFldWidth:=0, mFldAlign:=7
    fcmb.AddFlexColList mFldName:="PttName", mFldTitle:="Patient Name", mFldWidth:=2500, mFldAlign:=1
    fcmb.AddFlexColList mFldName:="PttRegNo", mFldTitle:="Pat.Reg.No", mFldWidth:=1200, mFldAlign:=7
    fcmb.AddFlexColList mFldName:="OpgVchNo", mFldTitle:="Opd No", mFldWidth:=1200, mFldAlign:=7
    fcmb.AddFlexColList mFldName:="OpgDate", mFldTitle:="Date", mFldWidth:=1500, mFldAlign:=1
    fcmb.AddFlexColList mFldName:="PttRefName", mFldTitle:="Care of", mFldWidth:=2000, mFldAlign:=1
    fcmb.AddFlexColList mFldName:="PttAddr", mFldTitle:="Address", mFldWidth:=2500, mFldAlign:=1
    fcmb.AddFlexColList mFldName:="PttContNo", mFldTitle:="Contact No.", mFldWidth:=2000, mFldAlign:=1
    fcmb.AddFlexColList mFldName:="AraName", mFldTitle:="Area", mFldWidth:=1750, mFldAlign:=1
    fcmb.AddFlexColList mFldName:="StnName", mFldTitle:="Station", mFldWidth:=1750, mFldAlign:=1
    
    fcmb.FormWidth = fcmb.Width + 5000
    fcmb.Init
    
ElseIf blnOldOrcListByOrcNo = True Then
    Load fcmb
    fcmb.lblFormHeading.Caption = "Outdoor Receipt List by Receipt No."
    fcmb.TableName = "OutdHdr"
    fcmb.BoundField = "OhrCode"
    fcmb.ListField = "OhrVchNo"
    fcmb.ListFieldUnq = "OhrVchNoUnq"
    fcmb.lblSearchCaption.Caption = "No.:"
    
    BRecset.open fcmb.TableName, dbHmsDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect
    BRecset.Index = fcmb.BoundField
    If mListSqlExpr = "" Then
        LRecset.open "Select OutdHdr.OhrCode,OutdHdr.OhrVchNo,OutdHdr.OhrDate,OutdHdr.OhrAmtAftDisc,OutdHdr.OhrAdvAmt,OutdHdr.OhrRecdAmt,OutdHdr.OhrDepoAmt,OutdHdr.OhrRefuAmt,OutdHdr.OhrBalAmt,cstr(OutdHdr.OhrVchNo)+'_'+format(OutdHdr.OhrCode,'" & cLONGCODESTRFMT & "') as OhrVchNoUnq,PatMast.PttName,PatMast.PttRegNo,PatMast.PttRefName,PatMast.PttAddr,AreaMast.AraName,StsnMast.StnName from ((OutdHdr inner join PatMast on OutdHdr.OhrPttCode=PatMast.PttCode) inner join AreaMast on PatMast.PttAraCode=AreaMast.AraCode) inner join StsnMast on PatMast.PttStnCode=StsnMast.StnCode" & IIf(mFiltCond <> "", " where " & mFiltCond, "") & " order by OhrVchNo,OhrCode", dbComDatabase, adOpenKeyset, adLockOptimistic
    Else
        LRecset.open mListSqlExpr, dbComDatabase, adOpenKeyset, adLockOptimistic
    End If
    
    Set fcmb.BRecset = BRecset
    Set fcmb.LRecset = LRecset
    #If APP_HOSPITAL = True Then
        Set fcmb.frmAccessMaster = New frmOutdoorReceipt
    #End If
    
    fcmb.ClearFlexColList
    fcmb.AddFlexColList mFldName:="OhrCode", mFldTitle:="OhrCode", mFldWidth:=0, mFldAlign:=7
    fcmb.AddFlexColList mFldName:="OhrVchNo", mFldTitle:="Rcpt.No", mFldWidth:=1200, mFldAlign:=7
    fcmb.AddFlexColList mFldName:="OhrDate", mFldTitle:="Date", mFldWidth:=1500, mFldAlign:=1
    fcmb.AddFlexColList mFldName:="OhrAmtAftDisc", mFldTitle:="Rcpt.Amt", mFldWidth:=1200, mFldAlign:=7
    fcmb.AddFlexColList mFldName:="OhrBalAmt", mFldTitle:="Due.Amt", mFldWidth:=1200, mFldAlign:=7
    fcmb.AddFlexColList mFldName:="PttName", mFldTitle:="Patient Name", mFldWidth:=2500, mFldAlign:=1
    fcmb.AddFlexColList mFldName:="PttRegNo", mFldTitle:="RegNo", mFldWidth:=1200, mFldAlign:=7
    fcmb.AddFlexColList mFldName:="PttRefName", mFldTitle:="Care of", mFldWidth:=2000, mFldAlign:=1
    fcmb.AddFlexColList mFldName:="AraName", mFldTitle:="Area", mFldWidth:=1750, mFldAlign:=1
    fcmb.AddFlexColList mFldName:="StnName", mFldTitle:="Station", mFldWidth:=1750, mFldAlign:=1
    fcmb.AddFlexColList mFldName:="OhrAdvAmt", mFldTitle:="Adv.Amt", mFldWidth:=1200, mFldAlign:=7
    fcmb.AddFlexColList mFldName:="OhrRecdAmt", mFldTitle:="Recd.Amt", mFldWidth:=1200, mFldAlign:=7
    fcmb.AddFlexColList mFldName:="OhrDepoAmt", mFldTitle:="Depo.Amt", mFldWidth:=1200, mFldAlign:=7
    fcmb.AddFlexColList mFldName:="OhrRefuAmt", mFldTitle:="Refd.Amt", mFldWidth:=1200, mFldAlign:=7
    
    fcmb.Init
    
ElseIf blnOldOblListByOblNo = True Then
    Load fcmb
    fcmb.lblFormHeading.Caption = "Outdoor Bill List by Bill No."
    fcmb.TableName = "OutdBlHdr"
    fcmb.BoundField = "ObhCode"
    fcmb.ListField = "ObhVchNo"
    fcmb.ListFieldUnq = "ObhVchNoUnq"
    fcmb.lblSearchCaption.Caption = "No.:"
    
    BRecset.open fcmb.TableName, dbHmsDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect
    BRecset.Index = fcmb.BoundField
    If mListSqlExpr = "" Then
        LRecset.open "Select OutdBlHdr.ObhCode,OutdBlHdr.ObhVchNo,OutdBlHdr.ObhDate,OutdBlHdr.ObhAmtAftDisc,OutdBlHdr.ObhDepoAmt,OutdBlHdr.ObhRefuAmt,OutdBlHdr.ObhBalAmt,cstr(OutdBlHdr.ObhVchNo)+'_'+format(OutdBlHdr.ObhCode,'" & cLONGCODESTRFMT & "') as ObhVchNoUnq,PatMast.PttName,PatMast.PttRegNo,PatMast.PttRefName,PatMast.PttAddr,AreaMast.AraName,StsnMast.StnName from ((OutdBlHdr inner join PatMast on OutdBlHdr.ObhPttCode=PatMast.PttCode) inner join AreaMast on PatMast.PttAraCode=AreaMast.AraCode) inner join StsnMast on PatMast.PttStnCode=StsnMast.StnCode" & IIf(mFiltCond <> "", " where " & mFiltCond, "") & " order by ObhVchNo,ObhCode", dbComDatabase, adOpenKeyset, adLockOptimistic
    Else
        LRecset.open mListSqlExpr, dbComDatabase, adOpenKeyset, adLockOptimistic
    End If
    
    Set fcmb.BRecset = BRecset
    Set fcmb.LRecset = LRecset
    #If APP_HOSPITAL = True Then
        Set fcmb.frmAccessMaster = New frmOutdoorBill
    #End If
    
    fcmb.ClearFlexColList
    fcmb.AddFlexColList mFldName:="ObhCode", mFldTitle:="ObhCode", mFldWidth:=0, mFldAlign:=7
    fcmb.AddFlexColList mFldName:="ObhVchNo", mFldTitle:="Bill No", mFldWidth:=1200, mFldAlign:=7
    fcmb.AddFlexColList mFldName:="ObhDate", mFldTitle:="Date", mFldWidth:=1500, mFldAlign:=1
    fcmb.AddFlexColList mFldName:="ObhAmtAftDisc", mFldTitle:="Bill Amt", mFldWidth:=1200, mFldAlign:=7
    fcmb.AddFlexColList mFldName:="ObhBalAmt", mFldTitle:="Due.Amt", mFldWidth:=1200, mFldAlign:=7
    fcmb.AddFlexColList mFldName:="PttName", mFldTitle:="Patient Name", mFldWidth:=2500, mFldAlign:=1
    fcmb.AddFlexColList mFldName:="PttRegNo", mFldTitle:="RegNo", mFldWidth:=1200, mFldAlign:=7
    fcmb.AddFlexColList mFldName:="PttRefName", mFldTitle:="Care of", mFldWidth:=2000, mFldAlign:=1
    fcmb.AddFlexColList mFldName:="AraName", mFldTitle:="Area", mFldWidth:=1750, mFldAlign:=1
    fcmb.AddFlexColList mFldName:="StnName", mFldTitle:="Station", mFldWidth:=1750, mFldAlign:=1
    fcmb.AddFlexColList mFldName:="ObhDepoAmt", mFldTitle:="Depo.Amt", mFldWidth:=1200, mFldAlign:=7
    fcmb.AddFlexColList mFldName:="ObhRefuAmt", mFldTitle:="Refd.Amt", mFldWidth:=1200, mFldAlign:=7
    
    fcmb.Init
    
ElseIf blnOldIpgListByIpgNo = True Then
    Load fcmb
    fcmb.lblFormHeading.Caption = "Old Indoor List by Ipd No."
    fcmb.TableName = "IndrReg"
    fcmb.BoundField = "IpgCode"
    fcmb.ListField = "IpgVchNo"
    fcmb.ListFieldUnq = "IpgVchNoUnq"
    fcmb.lblSearchCaption.Caption = "No.:"
    
    BRecset.open fcmb.TableName, dbHmsDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect
    BRecset.Index = fcmb.BoundField
    If mListSqlExpr = "" Then
        LRecset.open "Select IndrReg.IpgCode,IndrReg.IpgVchNo,IndrReg.IpgDate,cstr(IndrReg.IpgVchNo)+'_'+format(IndrReg.IpgCode,'" & cLONGCODESTRFMT & "') as IpgVchNoUnq" _
            & ",PatMast.PttName,PatMast.PttRegNo,PatMast.PttRefName,PatMast.PttAddr,AreaMast.AraName,StsnMast.StnName" _
            & " from ((IndrReg" _
            & " inner join PatMast on IndrReg.IpgPttCode=PatMast.PttCode)" _
            & " inner join AreaMast on PatMast.PttAraCode=AreaMast.AraCode)" _
            & " inner join StsnMast on PatMast.PttStnCode=StsnMast.StnCode" _
            & IIf(mFiltCond <> "", " where " & mFiltCond, "") _
            & " order by IpgVchNo,IpgCode" _
            , dbComDatabase, adOpenKeyset, adLockReadOnly
            
    Else
        LRecset.open mListSqlExpr, dbComDatabase, adOpenKeyset, adLockOptimistic
    End If
    
    Set fcmb.BRecset = BRecset
    Set fcmb.LRecset = LRecset
    #If APP_HOSPITAL = True Then
        Set fcmb.frmAccessMaster = New frmIndoorReg
    #End If
    
    fcmb.ClearFlexColList
    fcmb.AddFlexColList mFldName:="IpgCode", mFldTitle:="IpgCode", mFldWidth:=0, mFldAlign:=7
    fcmb.AddFlexColList mFldName:="IpgVchNo", mFldTitle:="Ipd No", mFldWidth:=1200, mFldAlign:=7
    fcmb.AddFlexColList mFldName:="IpgDate", mFldTitle:="Date", mFldWidth:=1500, mFldAlign:=1
    fcmb.AddFlexColList mFldName:="PttName", mFldTitle:="Patient Name", mFldWidth:=2500, mFldAlign:=1
    fcmb.AddFlexColList mFldName:="PttRegNo", mFldTitle:="PttRegNo", mFldWidth:=1200, mFldAlign:=7
    fcmb.AddFlexColList mFldName:="PttRefName", mFldTitle:="Care of", mFldWidth:=2000, mFldAlign:=1
    fcmb.AddFlexColList mFldName:="AraName", mFldTitle:="Area", mFldWidth:=1750, mFldAlign:=1
    fcmb.AddFlexColList mFldName:="StnName", mFldTitle:="Station", mFldWidth:=1750, mFldAlign:=1
    
    fcmb.Init
    
ElseIf blnOldIpgListByPttRegNo = True Then
    Load fcmb
    fcmb.lblFormHeading.Caption = "Old Indoor List by Patient Reg.No."
'''    fcmb.TableName = "PatMast"
'''    fcmb.BoundField = "PttCode"
'''    fcmb.ListField = "PttRegNo"
    fcmb.TableName = "IndrReg"
    fcmb.BoundField = "IpgCode"
    fcmb.ListField = "PttRegNo"
    fcmb.ListFieldUnq = "PttRegNoUnq"
    fcmb.lblSearchCaption.Caption = "Reg.No.:"
    
'''    BRecset.open fcmb.TableName, dbHmsDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect
'''    BRecset.Index = fcmb.BoundField
    BRecset.open "Select PatMast.PttCode,PatMast.PttRegNo,PatMast.PttName" _
        & ",IndrReg.IpgCode,IndrReg.IpgVchNo,IndrReg.IpgDate,cstr(PatMast.PttRegNo)+'_'+format(IndrReg.IpgCode,'" & cLONGCODESTRFMT & "') as PttRegNoUnq,PatMast.PttRefName,PatMast.PttAddr,AreaMast.AraName,StsnMast.StnName" _
        & " from ((PatMast inner join IndrReg on PatMast.PttCode = IndrReg.IpgPttCode)" _
        & " inner join AreaMast on PatMast.PttAraCode = AreaMast.AraCode)" _
        & " inner join StsnMast on PatMast.PttStnCode = StsnMast.StnCode" _
        & IIf(mFiltCond <> "", " where " & mFiltCond, "") _
        & " order by IpgCode" _
        , dbComDatabase, adOpenKeyset, adLockOptimistic
    If mListSqlExpr = "" Then
        LRecset.open "Select PatMast.PttCode,PatMast.PttRegNo,PatMast.PttName" _
            & ",IndrReg.IpgCode,IndrReg.IpgVchNo,IndrReg.IpgDate,cstr(PatMast.PttRegNo)+'_'+format(IndrReg.IpgCode,'" & cLONGCODESTRFMT & "') as PttRegNoUnq,PatMast.PttRefName,PatMast.PttAddr,AreaMast.AraName,StsnMast.StnName" _
            & " from ((PatMast" _
            & " inner join IndrReg on PatMast.PttCode = IndrReg.IpgPttCode)" _
            & " inner join AreaMast on PatMast.PttAraCode = AreaMast.AraCode)" _
            & " inner join StsnMast on PatMast.PttStnCode = StsnMast.StnCode" _
            & IIf(mFiltCond <> "", " where " & mFiltCond, "") _
            & " order by PttRegNo,IpgDate desc,IpgCode,PttCode" _
            , dbComDatabase, adOpenKeyset, adLockOptimistic
    Else
        LRecset.open mListSqlExpr, dbComDatabase, adOpenKeyset, adLockOptimistic
    End If
    
    Set fcmb.BRecset = BRecset
    Set fcmb.LRecset = LRecset
    Rem Set fcmb.frmAccessMaster = New frmIndoorReg
    
    fcmb.ClearFlexColList
    fcmb.AddFlexColList mFldName:="PttCode", mFldTitle:="PttCode", mFldWidth:=0, mFldAlign:=7
    fcmb.AddFlexColList mFldName:="IpgCode", mFldTitle:="IpgCode", mFldWidth:=0, mFldAlign:=7
    fcmb.AddFlexColList mFldName:="PttRegNo", mFldTitle:="Pat.Reg.No", mFldWidth:=1200, mFldAlign:=7
    fcmb.AddFlexColList mFldName:="PttName", mFldTitle:="Patient Name", mFldWidth:=2500, mFldAlign:=1
    fcmb.AddFlexColList mFldName:="IpgVchNo", mFldTitle:="Ipd No", mFldWidth:=1200, mFldAlign:=7
    fcmb.AddFlexColList mFldName:="IpgDate", mFldTitle:="Date", mFldWidth:=1500, mFldAlign:=1
    fcmb.AddFlexColList mFldName:="PttRefName", mFldTitle:="Care of", mFldWidth:=2000, mFldAlign:=1
    fcmb.AddFlexColList mFldName:="PttAddr", mFldTitle:="Address", mFldWidth:=2500, mFldAlign:=1
    fcmb.AddFlexColList mFldName:="AraName", mFldTitle:="Area", mFldWidth:=1750, mFldAlign:=1
    fcmb.AddFlexColList mFldName:="StnName", mFldTitle:="Station", mFldWidth:=1750, mFldAlign:=1
    
    fcmb.FormWidth = fcmb.Width + 5000
    fcmb.Init
    
ElseIf blnOldIpgListByPttName = True Then
    Load fcmb
    fcmb.lblFormHeading.Caption = "Old Indoor List by Patient Name"
'''    fcmb.TableName = "PatMast"
'''    fcmb.BoundField = "PttCode"
'''    fcmb.ListField = "PttName"
    fcmb.TableName = "IndrReg"
    fcmb.BoundField = "IpgCode"
    fcmb.ListField = "PttName"
    fcmb.ListFieldUnq = "PttNameUnq"
    fcmb.lblSearchCaption.Caption = "Name:"
    
'''    BRecset.open fcmb.TableName, dbHmsDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect
'''    BRecset.Index = fcmb.BoundField
    BRecset.open "Select PatMast.PttCode,PatMast.PttName,PatMast.PttRegNo" _
        & ",IndrReg.IpgCode,IndrReg.IpgVchNo,IndrReg.IpgDate,PatMast.PttName+'_'+format(IndrReg.IpgCode,'" & cLONGCODESTRFMT & "') as PttNameUnq,PatMast.PttRefName,PatMast.PttAddr,AreaMast.AraName,StsnMast.StnName" _
        & " from ((PatMast" _
        & " inner join IndrReg on PatMast.PttCode = IndrReg.IpgPttCode)" _
        & " inner join AreaMast on PatMast.PttAraCode = AreaMast.AraCode)" _
        & " inner join StsnMast on PatMast.PttStnCode = StsnMast.StnCode" _
        & IIf(mFiltCond <> "", " where " & mFiltCond, "") _
        & " order by IpgCode" _
        , dbComDatabase, adOpenKeyset, adLockOptimistic
    If mListSqlExpr = "" Then
        LRecset.open "Select PatMast.PttCode,PatMast.PttName,PatMast.PttRegNo" _
            & ",IndrReg.IpgCode,IndrReg.IpgVchNo,IndrReg.IpgDate,PatMast.PttName+'_'+format(IndrReg.IpgCode,'" & cLONGCODESTRFMT & "') as PttNameUnq,PatMast.PttRefName,PatMast.PttAddr,AreaMast.AraName,StsnMast.StnName" _
            & " from ((PatMast" _
            & " inner join IndrReg on PatMast.PttCode = IndrReg.IpgPttCode)" _
            & " inner join AreaMast on PatMast.PttAraCode = AreaMast.AraCode)" _
            & " inner join StsnMast on PatMast.PttStnCode = StsnMast.StnCode" _
            & IIf(mFiltCond <> "", " where " & mFiltCond, "") _
            & " order by PttName,IpgDate desc,IpgCode,PttCode" _
            , dbComDatabase, adOpenKeyset, adLockOptimistic
    Else
        LRecset.open mListSqlExpr, dbComDatabase, adOpenKeyset, adLockOptimistic
    End If
    
    Set fcmb.BRecset = BRecset
    Set fcmb.LRecset = LRecset
    Rem Set fcmb.frmAccessMaster = New frmIndoorReg
    
    fcmb.ClearFlexColList
    fcmb.AddFlexColList mFldName:="PttCode", mFldTitle:="PttCode", mFldWidth:=0, mFldAlign:=7
    fcmb.AddFlexColList mFldName:="IpgCode", mFldTitle:="IpgCode", mFldWidth:=0, mFldAlign:=7
    fcmb.AddFlexColList mFldName:="PttName", mFldTitle:="Patient Name", mFldWidth:=2500, mFldAlign:=1
    fcmb.AddFlexColList mFldName:="PttRegNo", mFldTitle:="Pat.Reg.No", mFldWidth:=1200, mFldAlign:=7
    fcmb.AddFlexColList mFldName:="IpgVchNo", mFldTitle:="Ipd No", mFldWidth:=1200, mFldAlign:=7
    fcmb.AddFlexColList mFldName:="IpgDate", mFldTitle:="Date", mFldWidth:=1500, mFldAlign:=1
    fcmb.AddFlexColList mFldName:="PttRefName", mFldTitle:="Care of", mFldWidth:=2000, mFldAlign:=1
    fcmb.AddFlexColList mFldName:="PttAddr", mFldTitle:="Address", mFldWidth:=2500, mFldAlign:=1
    fcmb.AddFlexColList mFldName:="AraName", mFldTitle:="Area", mFldWidth:=1750, mFldAlign:=1
    fcmb.AddFlexColList mFldName:="StnName", mFldTitle:="Station", mFldWidth:=1750, mFldAlign:=1
    
    fcmb.FormWidth = fcmb.Width + 5000
    fcmb.Init

ElseIf blnAdmIpgListByIpgNo = True Then
    Load fcmb
    fcmb.lblFormHeading.Caption = "Admitted Indoor List by Ipd No."
    fcmb.TableName = "IndrReg"
    fcmb.BoundField = "IpgCode"
    fcmb.ListField = "IpgVchNo"
    fcmb.ListFieldUnq = "IpgVchNoUnq"
    fcmb.lblSearchCaption.Caption = "No.:"
    
    BRecset.open fcmb.TableName, dbHmsDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect
    BRecset.Index = fcmb.BoundField
    If mListSqlExpr = "" Then
        LRecset.open "Select IndrReg.IpgCode,IndrReg.IpgVchNo,IndrReg.IpgDate,cstr(IndrReg.IpgVchNo)+'_'+format(IndrReg.IpgCode,'" & cLONGCODESTRFMT & "') as IpgVchNoUnq" _
            & ",PatMast.PttName,PatMast.PttRegNo,PatMast.PttRefName,PatMast.PttAddr,AreaMast.AraName,StsnMast.StnName" _
            & " from (((IndrReg" _
            & " inner join PatMast on IndrReg.IpgPttCode = PatMast.PttCode)" _
            & " inner join AreaMast on PatMast.PttAraCode = AreaMast.AraCode)" _
            & " inner join StsnMast on PatMast.PttStnCode = StsnMast.StnCode)" _
            & " inner join (Select * from IBedState where IbsDischState=" & CStr(cIBS_STATE_OCCUPIED) & ") as IBedState on IndrReg.IpgCode = IBedState.IbsIpgCode" _
            & IIf(mFiltCond <> "", " where " & mFiltCond, "") _
            & " order by IpgVchNo,IpgCode" _
            , dbComDatabase, adOpenKeyset, adLockOptimistic
    Else
        LRecset.open mListSqlExpr, dbComDatabase, adOpenKeyset, adLockOptimistic
    End If
    
    Set fcmb.BRecset = BRecset
    Set fcmb.LRecset = LRecset
    #If APP_HOSPITAL = True Then
        Set fcmb.frmAccessMaster = New frmIndoorReg
    #End If
    
    fcmb.ClearFlexColList
    fcmb.AddFlexColList mFldName:="IpgCode", mFldTitle:="IpgCode", mFldWidth:=0, mFldAlign:=7
    fcmb.AddFlexColList mFldName:="IpgVchNo", mFldTitle:="Ipd No", mFldWidth:=1200, mFldAlign:=7
    fcmb.AddFlexColList mFldName:="IpgDate", mFldTitle:="Date", mFldWidth:=1500, mFldAlign:=1
    fcmb.AddFlexColList mFldName:="PttName", mFldTitle:="Patient Name", mFldWidth:=2500, mFldAlign:=1
    fcmb.AddFlexColList mFldName:="PttRegNo", mFldTitle:="PttRegNo", mFldWidth:=1200, mFldAlign:=7
    fcmb.AddFlexColList mFldName:="PttRefName", mFldTitle:="Care of", mFldWidth:=2000, mFldAlign:=1
    fcmb.AddFlexColList mFldName:="AraName", mFldTitle:="Area", mFldWidth:=1750, mFldAlign:=1
    fcmb.AddFlexColList mFldName:="StnName", mFldTitle:="Station", mFldWidth:=1750, mFldAlign:=1
    
    fcmb.Init
    
ElseIf blnDueIpgListByIpgNo = True Then
    Load fcmb
    fcmb.lblFormHeading.Caption = "Admitted Indoor Due List by Ipd No."
    fcmb.TableName = "IndrReg"
    fcmb.BoundField = "IpgCode"
    fcmb.ListField = "IpgVchNo"
    fcmb.ListFieldUnq = "IpgVchNoUnq"
    fcmb.lblSearchCaption.Caption = "No.:"
    
    BRecset.open fcmb.TableName, dbHmsDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect
    BRecset.Index = fcmb.BoundField
    If mListSqlExpr = "" Then
        LRecset.open "Select IndrReg.IpgCode,IndrReg.IpgVchNo,IndrReg.IpgDate,cstr(IndrReg.IpgVchNo)+'_'+format(IndrReg.IpgCode,'" & cLONGCODESTRFMT & "') as IpgVchNoUnq" _
            & ",PatMast.PttName,PatMast.PttRegNo,PatMast.PttRefName,PatMast.PttAddr,AreaMast.AraName,StsnMast.StnName" _
            & " from ((((IndrReg" _
            & " inner join PatMast on IndrReg.IpgPttCode = PatMast.PttCode)" _
            & " inner join AreaMast on PatMast.PttAraCode = AreaMast.AraCode)" _
            & " inner join StsnMast on PatMast.PttStnCode = StsnMast.StnCode)" _
            & " left join (Select IbhIpgCode,sum(IbhBalAmt) as IbhBalAmt_sum from IndrBlHdr group by IbhIpgCode) as IndrBlHdr on IndrReg.IpgCode = IndrBlHdr.IbhIpgCode)" _
            & " left join (Select IhrIpgCode,sum(IhrBalAmt) as IhrBalAmt_sum from IndrHdr group by IhrIpgCode) as IndrHdr on IndrReg.IpgCode = IndrHdr.IhrIpgCode" _
            & " where (IbhBalAmt_sum <> 0 or IhrBalAmt_sum <> 0)" _
            & IIf(mFiltCond <> "", " and " & mFiltCond, "") _
            & " order by IpgVchNo,IpgCode" _
            , dbComDatabase, adOpenKeyset, adLockOptimistic
    Else
        LRecset.open mListSqlExpr, dbComDatabase, adOpenKeyset, adLockOptimistic
    End If
    
    Set fcmb.BRecset = BRecset
    Set fcmb.LRecset = LRecset
    #If APP_HOSPITAL = True Then
        Set fcmb.frmAccessMaster = New frmIndoorReg
    #End If
    
    fcmb.ClearFlexColList
    fcmb.AddFlexColList mFldName:="IpgCode", mFldTitle:="IpgCode", mFldWidth:=0, mFldAlign:=7
    fcmb.AddFlexColList mFldName:="IpgVchNo", mFldTitle:="Ipd No", mFldWidth:=1200, mFldAlign:=7
    fcmb.AddFlexColList mFldName:="IpgDate", mFldTitle:="Date", mFldWidth:=1500, mFldAlign:=1
    fcmb.AddFlexColList mFldName:="PttName", mFldTitle:="Patient Name", mFldWidth:=2500, mFldAlign:=1
    fcmb.AddFlexColList mFldName:="PttRegNo", mFldTitle:="PttRegNo", mFldWidth:=1200, mFldAlign:=7
    fcmb.AddFlexColList mFldName:="PttRefName", mFldTitle:="Care of", mFldWidth:=2000, mFldAlign:=1
    fcmb.AddFlexColList mFldName:="AraName", mFldTitle:="Area", mFldWidth:=1750, mFldAlign:=1
    fcmb.AddFlexColList mFldName:="StnName", mFldTitle:="Station", mFldWidth:=1750, mFldAlign:=1
    
    fcmb.Init
    
ElseIf blnAdmIpgListByPttRegNo = True Then
    Load fcmb
    fcmb.lblFormHeading.Caption = "Admitted Indoor List by Patient Reg.No."
'''    fcmb.TableName = "PatMast"
'''    fcmb.BoundField = "PttCode"
'''    fcmb.ListField = "PttRegNo"
    fcmb.TableName = "IndrReg"
    fcmb.BoundField = "IpgCode"
    fcmb.ListField = "PttRegNo"
    fcmb.ListFieldUnq = "PttRegNoUnq"
    fcmb.lblSearchCaption.Caption = "Reg.No.:"
    
'''    BRecset.open fcmb.TableName, dbHmsDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect
'''    BRecset.Index = fcmb.BoundField
    BRecset.open "Select PatMast.PttCode,PatMast.PttRegNo,PatMast.PttName" _
        & ",IndrReg.IpgCode,IndrReg.IpgVchNo,IndrReg.IpgDate,cstr(PatMast.PttRegNo)+'_'+format(IndrReg.IpgCode,'" & cLONGCODESTRFMT & "') as PttRegNoUnq,PatMast.PttRefName,PatMast.PttAddr,PttTelNo+';'+PttSmsNo as PttContNo,AreaMast.AraName,StsnMast.StnName" _
        & " from (((PatMast" _
        & " inner join AreaMast on PatMast.PttAraCode = AreaMast.AraCode)" _
        & " inner join StsnMast on PatMast.PttStnCode = StsnMast.StnCode)" _
        & " inner join IndrReg on PatMast.PttCode = IndrReg.IpgPttCode)" _
        & " inner join (Select * from IBedState where IbsDischState = " & CStr(cIBS_STATE_OCCUPIED) & ") as IBedState on IndrReg.IpgCode = IBedState.IbsIpgCode" _
        & IIf(mFiltCond <> "", " where " & mFiltCond, "") _
        & " order by IpgCode" _
        , dbComDatabase, adOpenKeyset, adLockOptimistic
    If mListSqlExpr = "" Then
        LRecset.open "Select PatMast.PttCode,PatMast.PttRegNo,PatMast.PttName" _
            & ",IndrReg.IpgCode,IndrReg.IpgVchNo,IndrReg.IpgDate,cstr(PatMast.PttRegNo)+'_'+format(IndrReg.IpgCode,'" & cLONGCODESTRFMT & "') as PttRegNoUnq,PatMast.PttRefName,PatMast.PttAddr,PttTelNo+';'+PttSmsNo as PttContNo,AreaMast.AraName,StsnMast.StnName" _
            & " from (((PatMast" _
            & " inner join AreaMast on PatMast.PttAraCode = AreaMast.AraCode)" _
            & " inner join StsnMast on PatMast.PttStnCode = StsnMast.StnCode)" _
            & " inner join IndrReg on PatMast.PttCode = IndrReg.IpgPttCode)" _
            & " inner join (Select * from IBedState where IbsDischState = " & CStr(cIBS_STATE_OCCUPIED) & ") as IBedState on IndrReg.IpgCode = IBedState.IbsIpgCode" _
            & IIf(mFiltCond <> "", " where " & mFiltCond, "") _
            & " order by PttRegNo,IpgDate desc,IpgCode,PttCode" _
            , dbComDatabase, adOpenKeyset, adLockOptimistic
    Else
        LRecset.open mListSqlExpr, dbComDatabase, adOpenKeyset, adLockOptimistic
    End If
    
    Set fcmb.BRecset = BRecset
    Set fcmb.LRecset = LRecset
    Rem Set fcmb.frmAccessMaster = New frmIndoorReg
    
    fcmb.ClearFlexColList
    fcmb.AddFlexColList mFldName:="PttCode", mFldTitle:="PttCode", mFldWidth:=0, mFldAlign:=7
    fcmb.AddFlexColList mFldName:="IpgCode", mFldTitle:="IpgCode", mFldWidth:=0, mFldAlign:=7
    fcmb.AddFlexColList mFldName:="PttRegNo", mFldTitle:="Pat.Reg.No", mFldWidth:=1200, mFldAlign:=7
    fcmb.AddFlexColList mFldName:="PttName", mFldTitle:="Patient Name", mFldWidth:=2500, mFldAlign:=1
    fcmb.AddFlexColList mFldName:="IpgVchNo", mFldTitle:="Ipd No", mFldWidth:=1200, mFldAlign:=7
    fcmb.AddFlexColList mFldName:="IpgDate", mFldTitle:="Date", mFldWidth:=1500, mFldAlign:=1
    fcmb.AddFlexColList mFldName:="PttRefName", mFldTitle:="Care of", mFldWidth:=2000, mFldAlign:=1
    fcmb.AddFlexColList mFldName:="PttAddr", mFldTitle:="Address", mFldWidth:=2500, mFldAlign:=1
    fcmb.AddFlexColList mFldName:="PttContNo", mFldTitle:="Contact No.", mFldWidth:=2000, mFldAlign:=1
    fcmb.AddFlexColList mFldName:="AraName", mFldTitle:="Area", mFldWidth:=1750, mFldAlign:=1
    fcmb.AddFlexColList mFldName:="StnName", mFldTitle:="Station", mFldWidth:=1750, mFldAlign:=1
    
    fcmb.FormWidth = fcmb.Width + 5000
    fcmb.Init
    
ElseIf blnDueIpgListByPttRegNo = True Then
    Load fcmb
    fcmb.lblFormHeading.Caption = "Due Indoor List by Patient Reg.No."
    fcmb.TableName = "IndrReg"
    fcmb.BoundField = "IpgCode"
    fcmb.ListField = "PttRegNo"
    fcmb.ListFieldUnq = "PttRegNoUnq"
    fcmb.lblSearchCaption.Caption = "Reg.No.:"
    
    BRecset.open "Select PatMast.PttCode,PatMast.PttRegNo,PatMast.PttName" _
        & ",IndrReg.IpgCode,IndrReg.IpgVchNo,IndrReg.IpgDate,cstr(PatMast.PttRegNo)+'_'+format(IndrReg.IpgCode,'" & cLONGCODESTRFMT & "') as PttRegNoUnq,PatMast.PttRefName,PatMast.PttAddr,PttTelNo+';'+PttSmsNo as PttContNo,AreaMast.AraName,StsnMast.StnName" _
        & " from ((((PatMast" _
        & " inner join AreaMast on PatMast.PttAraCode = AreaMast.AraCode)" _
        & " inner join StsnMast on PatMast.PttStnCode = StsnMast.StnCode)" _
        & " inner join IndrReg on PatMast.PttCode = IndrReg.IpgPttCode)" _
        & " left join (Select IbhIpgCode,sum(IbhBalAmt) as IbhBalAmt_sum from IndrBlHdr group by IbhIpgCode) as IndrBlHdr on IndrReg.IpgCode = IndrBlHdr.IbhIpgCode)" _
        & " left join (Select IhrIpgCode,sum(IhrBalAmt) as IhrBalAmt_sum from IndrHdr group by IhrIpgCode) as IndrHdr on IndrReg.IpgCode = IndrHdr.IhrIpgCode" _
        & " where (IbhBalAmt_sum <> 0 or IhrBalAmt_sum <> 0)" _
        & IIf(mFiltCond <> "", " and " & mFiltCond, "") _
        & " order by IpgCode" _
        , dbComDatabase, adOpenKeyset, adLockOptimistic
    If mListSqlExpr = "" Then
        LRecset.open "Select PatMast.PttCode,PatMast.PttRegNo,PatMast.PttName" _
            & ",IndrReg.IpgCode,IndrReg.IpgVchNo,IndrReg.IpgDate,cstr(PatMast.PttRegNo)+'_'+format(IndrReg.IpgCode,'" & cLONGCODESTRFMT & "') as PttRegNoUnq,PatMast.PttRefName,PatMast.PttAddr,PttTelNo+';'+PttSmsNo as PttContNo,AreaMast.AraName,StsnMast.StnName" _
            & " from ((((PatMast" _
            & " inner join AreaMast on PatMast.PttAraCode = AreaMast.AraCode)" _
            & " inner join StsnMast on PatMast.PttStnCode = StsnMast.StnCode)" _
            & " inner join IndrReg on PatMast.PttCode = IndrReg.IpgPttCode)" _
            & " left join (Select IbhIpgCode,sum(IbhBalAmt) as IbhBalAmt_sum from IndrBlHdr group by IbhIpgCode) as IndrBlHdr on IndrReg.IpgCode = IndrBlHdr.IbhIpgCode)" _
            & " left join (Select IhrIpgCode,sum(IhrBalAmt) as IhrBalAmt_sum from IndrHdr group by IhrIpgCode) as IndrHdr on IndrReg.IpgCode = IndrHdr.IhrIpgCode" _
            & " where (IbhBalAmt_sum <> 0 or IhrBalAmt_sum <> 0)" _
            & IIf(mFiltCond <> "", " and " & mFiltCond, "") _
            & " order by PttRegNo,IpgDate desc,IpgCode,PttCode" _
            , dbComDatabase, adOpenKeyset, adLockOptimistic
    Else
        LRecset.open mListSqlExpr, dbComDatabase, adOpenKeyset, adLockOptimistic
    End If
    
    Set fcmb.BRecset = BRecset
    Set fcmb.LRecset = LRecset
    Rem Set fcmb.frmAccessMaster = New frmIndoorReg
    
    fcmb.ClearFlexColList
    fcmb.AddFlexColList mFldName:="PttCode", mFldTitle:="PttCode", mFldWidth:=0, mFldAlign:=7
    fcmb.AddFlexColList mFldName:="IpgCode", mFldTitle:="IpgCode", mFldWidth:=0, mFldAlign:=7
    fcmb.AddFlexColList mFldName:="PttRegNo", mFldTitle:="Pat.Reg.No", mFldWidth:=1200, mFldAlign:=7
    fcmb.AddFlexColList mFldName:="PttName", mFldTitle:="Patient Name", mFldWidth:=2500, mFldAlign:=1
    fcmb.AddFlexColList mFldName:="IpgVchNo", mFldTitle:="Ipd No", mFldWidth:=1200, mFldAlign:=7
    fcmb.AddFlexColList mFldName:="IpgDate", mFldTitle:="Date", mFldWidth:=1500, mFldAlign:=1
    fcmb.AddFlexColList mFldName:="PttRefName", mFldTitle:="Care of", mFldWidth:=2000, mFldAlign:=1
    fcmb.AddFlexColList mFldName:="PttAddr", mFldTitle:="Address", mFldWidth:=2500, mFldAlign:=1
    fcmb.AddFlexColList mFldName:="PttContNo", mFldTitle:="Contact No.", mFldWidth:=2000, mFldAlign:=1
    fcmb.AddFlexColList mFldName:="AraName", mFldTitle:="Area", mFldWidth:=1750, mFldAlign:=1
    fcmb.AddFlexColList mFldName:="StnName", mFldTitle:="Station", mFldWidth:=1750, mFldAlign:=1
    
    fcmb.FormWidth = fcmb.Width + 5000
    fcmb.Init
    
ElseIf blnAdmIpgListByPttName = True Then
    Load fcmb
    fcmb.lblFormHeading.Caption = "Admitted Indoor List by Patient Name"
    fcmb.TableName = "IndrReg"
    fcmb.BoundField = "IpgCode"
    fcmb.ListField = "PttName"
    fcmb.ListFieldUnq = "PttNameUnq"
    fcmb.lblSearchCaption.Caption = "Name:"
    
    BRecset.open "Select PatMast.PttCode,PatMast.PttName,PatMast.PttRegNo" _
        & ",IndrReg.IpgCode,IndrReg.IpgVchNo,IndrReg.IpgDate" _
        & ",PatMast.PttName+'_'+format(IndrReg.IpgCode,'" & cLONGCODESTRFMT & "') as PttNameUnq,PatMast.PttRefName,PatMast.PttAddr,PttTelNo+';'+PttSmsNo as PttContNo,AreaMast.AraName,StsnMast.StnName" _
        & " from (((PatMast" _
        & " inner join AreaMast on PatMast.PttAraCode = AreaMast.AraCode)" _
        & " inner join StsnMast on PatMast.PttStnCode = StsnMast.StnCode)" _
        & " inner join IndrReg on PatMast.PttCode = IndrReg.IpgPttCode)" _
        & " inner join (Select * from IBedState where IbsDischState = " & CStr(cIBS_STATE_OCCUPIED) & ") as IBedState on IndrReg.IpgCode = IBedState.IbsIpgCode" _
        & IIf(mFiltCond <> "", " where " & mFiltCond, "") _
        & " order by IpgCode" _
        , dbComDatabase, adOpenKeyset, adLockOptimistic
    If mListSqlExpr = "" Then
        LRecset.open "Select PatMast.PttCode,PatMast.PttName,PatMast.PttRegNo" _
            & ",IndrReg.IpgCode,IndrReg.IpgVchNo,IndrReg.IpgDate" _
            & ",PatMast.PttName+'_'+format(IndrReg.IpgCode,'" & cLONGCODESTRFMT & "') as PttNameUnq,PatMast.PttRefName,PatMast.PttAddr,PttTelNo+';'+PttSmsNo as PttContNo,AreaMast.AraName,StsnMast.StnName" _
            & " from (((PatMast" _
            & " inner join AreaMast on PatMast.PttAraCode = AreaMast.AraCode)" _
            & " inner join StsnMast on PatMast.PttStnCode = StsnMast.StnCode)" _
            & " inner join IndrReg on PatMast.PttCode = IndrReg.IpgPttCode)" _
            & " inner join (Select * from IBedState where IbsDischState = " & CStr(cIBS_STATE_OCCUPIED) & ") as IBedState on IndrReg.IpgCode = IBedState.IbsIpgCode" _
            & IIf(mFiltCond <> "", " where " & mFiltCond, "") _
            & " order by PttName,IpgDate desc,IpgCode,PttCode" _
            , dbComDatabase, adOpenKeyset, adLockOptimistic
    Else
        LRecset.open mListSqlExpr, dbComDatabase, adOpenKeyset, adLockOptimistic
    End If
    
    Set fcmb.BRecset = BRecset
    Set fcmb.LRecset = LRecset
    Rem Set fcmb.frmAccessMaster = New frmIndoorReg
    
    fcmb.ClearFlexColList
    fcmb.AddFlexColList mFldName:="PttCode", mFldTitle:="PttCode", mFldWidth:=0, mFldAlign:=7
    fcmb.AddFlexColList mFldName:="IpgCode", mFldTitle:="IpgCode", mFldWidth:=0, mFldAlign:=7
    fcmb.AddFlexColList mFldName:="PttName", mFldTitle:="Patient Name", mFldWidth:=2500, mFldAlign:=1
    fcmb.AddFlexColList mFldName:="PttRegNo", mFldTitle:="Pat.Reg.No", mFldWidth:=1200, mFldAlign:=7
    fcmb.AddFlexColList mFldName:="IpgVchNo", mFldTitle:="Ipd No", mFldWidth:=1200, mFldAlign:=7
    fcmb.AddFlexColList mFldName:="IpgDate", mFldTitle:="Date", mFldWidth:=1500, mFldAlign:=1
    fcmb.AddFlexColList mFldName:="PttRefName", mFldTitle:="Care of", mFldWidth:=2000, mFldAlign:=1
    fcmb.AddFlexColList mFldName:="PttAddr", mFldTitle:="Address", mFldWidth:=2500, mFldAlign:=1
    fcmb.AddFlexColList mFldName:="PttContNo", mFldTitle:="Contact No.", mFldWidth:=2000, mFldAlign:=1
    fcmb.AddFlexColList mFldName:="AraName", mFldTitle:="Area", mFldWidth:=1750, mFldAlign:=1
    fcmb.AddFlexColList mFldName:="StnName", mFldTitle:="Station", mFldWidth:=1750, mFldAlign:=1
    
    fcmb.FormWidth = fcmb.Width + 5000
    fcmb.Init

ElseIf blnDueIpgListByPttName = True Then
    Load fcmb
    fcmb.lblFormHeading.Caption = "Admitted Indoor Due List by Patient Name"
    fcmb.TableName = "IndrReg"
    fcmb.BoundField = "IpgCode"
    fcmb.ListField = "PttName"
    fcmb.ListFieldUnq = "PttNameUnq"
    fcmb.lblSearchCaption.Caption = "Name:"
    
    BRecset.open "Select PatMast.PttCode,PatMast.PttName,PatMast.PttRegNo" _
        & ",IndrReg.IpgCode,IndrReg.IpgVchNo,IndrReg.IpgDate" _
        & ",PatMast.PttName+'_'+format(IndrReg.IpgCode,'" & cLONGCODESTRFMT & "') as PttNameUnq,PatMast.PttRefName,PatMast.PttAddr,PttTelNo+';'+PttSmsNo as PttContNo,AreaMast.AraName,StsnMast.StnName" _
        & " from ((((PatMast" _
        & " inner join AreaMast on PatMast.PttAraCode = AreaMast.AraCode)" _
        & " inner join StsnMast on PatMast.PttStnCode = StsnMast.StnCode)" _
        & " inner join IndrReg on PatMast.PttCode = IndrReg.IpgPttCode)" _
        & " left join (Select IbhIpgCode,sum(IbhBalAmt) as IbhBalAmt_sum from IndrBlHdr group by IbhIpgCode) as IndrBlHdr on IndrReg.IpgCode = IndrBlHdr.IbhIpgCode)" _
        & " left join (Select IhrIpgCode,sum(IhrBalAmt) as IhrBalAmt_sum from IndrHdr group by IhrIpgCode) as IndrHdr on IndrReg.IpgCode = IndrHdr.IhrIpgCode" _
        & " where (IbhBalAmt_sum <> 0 or IhrBalAmt_sum <> 0)" _
        & IIf(mFiltCond <> "", " and " & mFiltCond, "") _
        & " order by IpgCode" _
        , dbComDatabase, adOpenKeyset, adLockOptimistic
    If mListSqlExpr = "" Then
        LRecset.open "Select PatMast.PttCode,PatMast.PttName,PatMast.PttRegNo" _
            & ",IndrReg.IpgCode,IndrReg.IpgVchNo,IndrReg.IpgDate" _
            & ",PatMast.PttName+'_'+format(IndrReg.IpgCode,'" & cLONGCODESTRFMT & "') as PttNameUnq,PatMast.PttRefName,PatMast.PttAddr,PttTelNo+';'+PttSmsNo as PttContNo,AreaMast.AraName,StsnMast.StnName" _
            & " from ((((PatMast" _
            & " inner join AreaMast on PatMast.PttAraCode = AreaMast.AraCode)" _
            & " inner join StsnMast on PatMast.PttStnCode = StsnMast.StnCode)" _
            & " inner join IndrReg on PatMast.PttCode = IndrReg.IpgPttCode)" _
            & " left join (Select IbhIpgCode,sum(IbhBalAmt) as IbhBalAmt_sum from IndrBlHdr group by IbhIpgCode) as IndrBlHdr on IndrReg.IpgCode = IndrBlHdr.IbhIpgCode)" _
            & " left join (Select IhrIpgCode,sum(IhrBalAmt) as IhrBalAmt_sum from IndrHdr group by IhrIpgCode) as IndrHdr on IndrReg.IpgCode = IndrHdr.IhrIpgCode" _
            & " where (IbhBalAmt_sum <> 0 or IhrBalAmt_sum <> 0)" _
            & IIf(mFiltCond <> "", " and " & mFiltCond, "") _
            & " order by PttName,IpgDate desc,IpgCode,PttCode" _
            , dbComDatabase, adOpenKeyset, adLockOptimistic
    Else
        LRecset.open mListSqlExpr, dbComDatabase, adOpenKeyset, adLockOptimistic
    End If
    
    Set fcmb.BRecset = BRecset
    Set fcmb.LRecset = LRecset
    Rem Set fcmb.frmAccessMaster = New frmIndoorReg
    
    fcmb.ClearFlexColList
    fcmb.AddFlexColList mFldName:="PttCode", mFldTitle:="PttCode", mFldWidth:=0, mFldAlign:=7
    fcmb.AddFlexColList mFldName:="IpgCode", mFldTitle:="IpgCode", mFldWidth:=0, mFldAlign:=7
    fcmb.AddFlexColList mFldName:="PttName", mFldTitle:="Patient Name", mFldWidth:=2500, mFldAlign:=1
    fcmb.AddFlexColList mFldName:="PttRegNo", mFldTitle:="Pat.Reg.No", mFldWidth:=1200, mFldAlign:=7
    fcmb.AddFlexColList mFldName:="IpgVchNo", mFldTitle:="Ipd No", mFldWidth:=1200, mFldAlign:=7
    fcmb.AddFlexColList mFldName:="IpgDate", mFldTitle:="Date", mFldWidth:=1500, mFldAlign:=1
    fcmb.AddFlexColList mFldName:="PttRefName", mFldTitle:="Care of", mFldWidth:=2000, mFldAlign:=1
    fcmb.AddFlexColList mFldName:="PttAddr", mFldTitle:="Address", mFldWidth:=2500, mFldAlign:=1
    fcmb.AddFlexColList mFldName:="PttContNo", mFldTitle:="Contact No.", mFldWidth:=2000, mFldAlign:=1
    fcmb.AddFlexColList mFldName:="AraName", mFldTitle:="Area", mFldWidth:=1750, mFldAlign:=1
    fcmb.AddFlexColList mFldName:="StnName", mFldTitle:="Station", mFldWidth:=1750, mFldAlign:=1
    
    fcmb.FormWidth = fcmb.Width + 5000
    fcmb.Init
    
ElseIf blnOldIgtListByIgtNo = True Then
    Load fcmb
    fcmb.lblFormHeading.Caption = "Indoor On A/c. Payment List"
    fcmb.TableName = "IndrRgPymt"
    fcmb.BoundField = "IgtCode"
    fcmb.ListField = "IgtVchNo"
    fcmb.ListFieldUnq = "IgtVchNoUnq"
    fcmb.lblSearchCaption.Caption = "No.:"
    
    BRecset.open fcmb.TableName, dbHmsDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect
    BRecset.Index = fcmb.BoundField
    If mListSqlExpr = "" Then
        LRecset.open "Select IndrRgPymt.IgtCode,IndrRgPymt.IgtVchNo,IndrRgPymt.IgtDate,IndrRgPymt.IgtDpogAmt,IndrRgPymt.IgtAdjAmt,IndrRgPymt.IgtBalAmt,cstr(IndrRgPymt.IgtVchNo)+'_'+format(IndrRgPymt.IgtCode,'" & cLONGCODESTRFMT & "') as IgtVchNoUnq" _
            & ",PatMast.PttName,PatMast.PttRegNo,PatMast.PttRefName,PatMast.PttAddr" _
            & ",AreaMast.AraName,StsnMast.StnName" _
            & " from ((IndrRgPymt" _
            & " inner join PatMast on IndrRgPymt.IgtPttCode=PatMast.PttCode)" _
            & " inner join AreaMast on PatMast.PttAraCode=AreaMast.AraCode)" _
            & " inner join StsnMast on PatMast.PttStnCode=StsnMast.StnCode" _
            & IIf(mFiltCond <> "", " where " & mFiltCond, "") _
            & " order by IgtVchNo,IgtCode" _
            , dbComDatabase, adOpenKeyset, adLockOptimistic
    Else
        LRecset.open mListSqlExpr, dbComDatabase, adOpenKeyset, adLockOptimistic
    End If
    
    Set fcmb.BRecset = BRecset
    Set fcmb.LRecset = LRecset
    #If APP_HOSPITAL = True Then
        Set fcmb.frmAccessMaster = New frmIndoorRgPayment
    #End If
    
    fcmb.ClearFlexColList
    fcmb.AddFlexColList mFldName:="IgtCode", mFldTitle:="IgtCode", mFldWidth:=0, mFldAlign:=7
    fcmb.AddFlexColList mFldName:="IgtVchNo", mFldTitle:="Vch.No", mFldWidth:=1200, mFldAlign:=7
    fcmb.AddFlexColList mFldName:="IgtDate", mFldTitle:="Date", mFldWidth:=1500, mFldAlign:=1
    fcmb.AddFlexColList mFldName:="IgtDpogAmt", mFldTitle:="Depo.Amt", mFldWidth:=1200, mFldAlign:=7
    fcmb.AddFlexColList mFldName:="IgtAdjAmt", mFldTitle:="Adj.Amt", mFldWidth:=1200, mFldAlign:=7
    fcmb.AddFlexColList mFldName:="IgtBalAmt", mFldTitle:="Bal.Amt", mFldWidth:=1200, mFldAlign:=7
    fcmb.AddFlexColList mFldName:="PttName", mFldTitle:="Patient Name", mFldWidth:=2500, mFldAlign:=1
    fcmb.AddFlexColList mFldName:="PttRegNo", mFldTitle:="RegNo", mFldWidth:=1200, mFldAlign:=7
    fcmb.AddFlexColList mFldName:="PttRefName", mFldTitle:="Care of", mFldWidth:=2000, mFldAlign:=1
    fcmb.AddFlexColList mFldName:="AraName", mFldTitle:="Area", mFldWidth:=1750, mFldAlign:=1
    fcmb.AddFlexColList mFldName:="StnName", mFldTitle:="Station", mFldWidth:=1750, mFldAlign:=1
    
    fcmb.Init
    
ElseIf blnOldIgfListByIgfNo = True Then
    Load fcmb
    fcmb.lblFormHeading.Caption = "Indoor On A/c. Refund List"
    fcmb.TableName = "IndrRgRefd"
    fcmb.BoundField = "IgfCode"
    fcmb.ListField = "IgfVchNo"
    fcmb.ListFieldUnq = "IgfVchNoUnq"
    fcmb.lblSearchCaption.Caption = "No.:"
    
    BRecset.open fcmb.TableName, dbHmsDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect
    BRecset.Index = fcmb.BoundField
    If mListSqlExpr = "" Then
        LRecset.open "Select IndrRgRefd.IgfCode,IndrRgRefd.IgfVchNo,IndrRgRefd.IgfDate,IndrRgRefd.IgfRfugAmt,IndrRgRefd.IgfAdjAmt,IndrRgRefd.IgfBalAmt,cstr(IndrRgRefd.IgfVchNo)+'_'+format(IndrRgRefd.IgfCode,'" & cLONGCODESTRFMT & "') as IgfVchNoUnq" _
            & ",PatMast.PttName,PatMast.PttRegNo,PatMast.PttRefName,PatMast.PttAddr" _
            & ",AreaMast.AraName,StsnMast.StnName" _
            & " from ((IndrRgRefd" _
            & " inner join PatMast on IndrRgRefd.IgfPttCode=PatMast.PttCode)" _
            & " inner join AreaMast on PatMast.PttAraCode=AreaMast.AraCode)" _
            & " inner join StsnMast on PatMast.PttStnCode=StsnMast.StnCode" _
            & IIf(mFiltCond <> "", " where " & mFiltCond, "") _
            & " order by IgfVchNo,IgfCode" _
            , dbComDatabase, adOpenKeyset, adLockOptimistic
    Else
        LRecset.open mListSqlExpr, dbComDatabase, adOpenKeyset, adLockOptimistic
    End If
    
    Set fcmb.BRecset = BRecset
    Set fcmb.LRecset = LRecset
    #If APP_HOSPITAL = True Then
        Set fcmb.frmAccessMaster = New frmIndoorRgPayment
    #End If
    
    fcmb.ClearFlexColList
    fcmb.AddFlexColList mFldName:="IgfCode", mFldTitle:="IgfCode", mFldWidth:=0, mFldAlign:=7
    fcmb.AddFlexColList mFldName:="IgfVchNo", mFldTitle:="Vch.No", mFldWidth:=1200, mFldAlign:=7
    fcmb.AddFlexColList mFldName:="IgfDate", mFldTitle:="Date", mFldWidth:=1500, mFldAlign:=1
    fcmb.AddFlexColList mFldName:="IgfRfugAmt", mFldTitle:="Refund Amt", mFldWidth:=1200, mFldAlign:=7
    fcmb.AddFlexColList mFldName:="IgfAdjAmt", mFldTitle:="Adj.Amt", mFldWidth:=1200, mFldAlign:=7
    fcmb.AddFlexColList mFldName:="IgfBalAmt", mFldTitle:="Bal.Amt", mFldWidth:=1200, mFldAlign:=7
    fcmb.AddFlexColList mFldName:="PttName", mFldTitle:="Patient Name", mFldWidth:=2500, mFldAlign:=1
    fcmb.AddFlexColList mFldName:="PttRegNo", mFldTitle:="RegNo", mFldWidth:=1200, mFldAlign:=7
    fcmb.AddFlexColList mFldName:="PttRefName", mFldTitle:="Care of", mFldWidth:=2000, mFldAlign:=1
    fcmb.AddFlexColList mFldName:="AraName", mFldTitle:="Area", mFldWidth:=1750, mFldAlign:=1
    fcmb.AddFlexColList mFldName:="StnName", mFldTitle:="Station", mFldWidth:=1750, mFldAlign:=1
    
    fcmb.Init
    
ElseIf blnOldIrcListByIrcNo = True Then
    Load fcmb
    fcmb.lblFormHeading.Caption = "Indoor Receipt List by Receipt No."
    fcmb.TableName = "IndrHdr"
    fcmb.BoundField = "IhrCode"
    fcmb.ListField = "IhrVchNo"
    fcmb.ListFieldUnq = "IhrVchNoUnq"
    fcmb.lblSearchCaption.Caption = "No.:"
    
    BRecset.open fcmb.TableName, dbHmsDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect
    BRecset.Index = fcmb.BoundField
    If mListSqlExpr = "" Then
        LRecset.open "Select IndrHdr.IhrCode,IndrHdr.IhrVchNo,IndrHdr.IhrDate,IndrHdr.IhrAmtAftDisc,IndrHdr.IhrAdvAmt,IndrHdr.IhrRecdAmt,IndrHdr.IhrDepoAmt,IndrHdr.IhrRefuAmt,IndrHdr.IhrBalAmt,cstr(IndrHdr.IhrVchNo)+'_'+format(IndrHdr.IhrCode,'" & cLONGCODESTRFMT & "') as IhrVchNoUnq" _
            & ",PatMast.PttName,PatMast.PttRegNo,PatMast.PttRefName,PatMast.PttAddr" _
            & ",AreaMast.AraName,StsnMast.StnName" _
            & " from ((IndrHdr" _
            & " inner join PatMast on IndrHdr.IhrPttCode=PatMast.PttCode)" _
            & " inner join AreaMast on PatMast.PttAraCode=AreaMast.AraCode)" _
            & " inner join StsnMast on PatMast.PttStnCode=StsnMast.StnCode" _
            & IIf(mFiltCond <> "", " where " & mFiltCond, "") _
            & " order by IhrVchNo,IhrCode" _
            , dbComDatabase, adOpenKeyset, adLockOptimistic
    Else
        LRecset.open mListSqlExpr, dbComDatabase, adOpenKeyset, adLockOptimistic
    End If
    
    Set fcmb.BRecset = BRecset
    Set fcmb.LRecset = LRecset
    #If APP_HOSPITAL = True Then
        Set fcmb.frmAccessMaster = New frmIndoorReceipt
    #End If
    
    fcmb.ClearFlexColList
    fcmb.AddFlexColList mFldName:="IhrCode", mFldTitle:="IhrCode", mFldWidth:=0, mFldAlign:=7
    fcmb.AddFlexColList mFldName:="IhrVchNo", mFldTitle:="Rcpt.No", mFldWidth:=1200, mFldAlign:=7
    fcmb.AddFlexColList mFldName:="IhrDate", mFldTitle:="Date", mFldWidth:=1500, mFldAlign:=1
    fcmb.AddFlexColList mFldName:="IhrAmtAftDisc", mFldTitle:="Rcpt.Amt", mFldWidth:=1200, mFldAlign:=7
    fcmb.AddFlexColList mFldName:="IhrBalAmt", mFldTitle:="Due.Amt", mFldWidth:=1200, mFldAlign:=7
    fcmb.AddFlexColList mFldName:="PttName", mFldTitle:="Patient Name", mFldWidth:=2500, mFldAlign:=1
    fcmb.AddFlexColList mFldName:="PttRegNo", mFldTitle:="RegNo", mFldWidth:=1200, mFldAlign:=7
    fcmb.AddFlexColList mFldName:="PttRefName", mFldTitle:="Care of", mFldWidth:=2000, mFldAlign:=1
    fcmb.AddFlexColList mFldName:="AraName", mFldTitle:="Area", mFldWidth:=1750, mFldAlign:=1
    fcmb.AddFlexColList mFldName:="StnName", mFldTitle:="Station", mFldWidth:=1750, mFldAlign:=1
    fcmb.AddFlexColList mFldName:="IhrAdvAmt", mFldTitle:="Adv.Amt", mFldWidth:=1200, mFldAlign:=7
    fcmb.AddFlexColList mFldName:="IhrRecdAmt", mFldTitle:="Recd.Amt", mFldWidth:=1200, mFldAlign:=7
    fcmb.AddFlexColList mFldName:="IhrDepoAmt", mFldTitle:="Depo.Amt", mFldWidth:=1200, mFldAlign:=7
    fcmb.AddFlexColList mFldName:="IhrRefuAmt", mFldTitle:="Refd.Amt", mFldWidth:=1200, mFldAlign:=7
    
    fcmb.Init
    
ElseIf blnOldIblListByIblNo = True Then
    Load fcmb
    fcmb.lblFormHeading.Caption = "Indoor Bill List by Bill No."
    fcmb.TableName = "IndrBlHdr"
    fcmb.BoundField = "IbhCode"
    fcmb.ListField = "IbhVchNo"
    fcmb.ListFieldUnq = "IbhVchNoUnq"
    fcmb.lblSearchCaption.Caption = "No.:"
    
    BRecset.open fcmb.TableName, dbHmsDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect
    BRecset.Index = fcmb.BoundField
    If mListSqlExpr = "" Then
        LRecset.open "Select IndrBlHdr.IbhCode,IndrBlHdr.IbhVchNo,IndrBlHdr.IbhDate,IndrBlHdr.IbhAmtAftDisc,IndrBlHdr.IbhDepoAmt,IndrBlHdr.IbhRefuAmt,IndrBlHdr.IbhBalAmt,cstr(IndrBlHdr.IbhVchNo)+'_'+format(IndrBlHdr.IbhCode,'" & cLONGCODESTRFMT & "') as IbhVchNoUnq,PatMast.PttName,PatMast.PttRegNo,PatMast.PttRefName,PatMast.PttAddr,AreaMast.AraName,StsnMast.StnName from ((IndrBlHdr inner join PatMast on IndrBlHdr.IbhPttCode=PatMast.PttCode) inner join AreaMast on PatMast.PttAraCode=AreaMast.AraCode) inner join StsnMast on PatMast.PttStnCode=StsnMast.StnCode" & IIf(mFiltCond <> "", " where " & mFiltCond, "") & " order by IbhVchNo,IbhCode", dbComDatabase, adOpenKeyset, adLockOptimistic
    Else
        LRecset.open mListSqlExpr, dbComDatabase, adOpenKeyset, adLockOptimistic
    End If
    
    Set fcmb.BRecset = BRecset
    Set fcmb.LRecset = LRecset
    'Set fcmb.frmAccessMaster = New frmIndoorBill
    
    fcmb.ClearFlexColList
    fcmb.AddFlexColList mFldName:="IbhCode", mFldTitle:="IbhCode", mFldWidth:=0, mFldAlign:=7
    fcmb.AddFlexColList mFldName:="IbhVchNo", mFldTitle:="Bill No", mFldWidth:=1200, mFldAlign:=7
    fcmb.AddFlexColList mFldName:="IbhDate", mFldTitle:="Date", mFldWidth:=1500, mFldAlign:=1
    fcmb.AddFlexColList mFldName:="IbhAmtAftDisc", mFldTitle:="Bill Amt", mFldWidth:=1200, mFldAlign:=7
    fcmb.AddFlexColList mFldName:="IbhBalAmt", mFldTitle:="Due.Amt", mFldWidth:=1200, mFldAlign:=7
    fcmb.AddFlexColList mFldName:="PttName", mFldTitle:="Patient Name", mFldWidth:=2500, mFldAlign:=1
    fcmb.AddFlexColList mFldName:="PttRegNo", mFldTitle:="RegNo", mFldWidth:=1200, mFldAlign:=7
    fcmb.AddFlexColList mFldName:="PttRefName", mFldTitle:="Care of", mFldWidth:=2000, mFldAlign:=1
    fcmb.AddFlexColList mFldName:="AraName", mFldTitle:="Area", mFldWidth:=1750, mFldAlign:=1
    fcmb.AddFlexColList mFldName:="StnName", mFldTitle:="Station", mFldWidth:=1750, mFldAlign:=1
    fcmb.AddFlexColList mFldName:="IbhDepoAmt", mFldTitle:="Depo.Amt", mFldWidth:=1200, mFldAlign:=7
    fcmb.AddFlexColList mFldName:="IbhRefuAmt", mFldTitle:="Refd.Amt", mFldWidth:=1200, mFldAlign:=7
    
    fcmb.Init
    
ElseIf blnOldLrcListByLrcNo = True Then
    Load fcmb
    fcmb.lblFormHeading.Caption = "Lab Receipt List by Receipt No."
    fcmb.TableName = "LabHdr"
    fcmb.BoundField = "LhrCode"
    fcmb.ListField = "LhrVchNo"
    fcmb.ListFieldUnq = "LhrVchNoUnq"
    fcmb.lblSearchCaption.Caption = "No.:"
    
    BRecset.open fcmb.TableName, dbHmsDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect
    BRecset.Index = fcmb.BoundField
    If mListSqlExpr = "" Then
        LRecset.open "Select LabHdr.LhrCode,LabHdr.LhrVchNo,LabHdr.LhrDate,LabHdr.LhrAmtAftDisc,LabHdr.LhrAdvAmt,LabHdr.LhrRecdAmt,LabHdr.LhrDepoAmt,LabHdr.LhrRefuAmt,LabHdr.LhrBalAmt,cstr(LabHdr.LhrVchNo)+'_'+format(LabHdr.LhrCode,'" & cLONGCODESTRFMT & "') as LhrVchNoUnq" _
            & ",PatMast.PttName,PatMast.PttRegNo,PatMast.PttRefName,PatMast.PttAddr,AreaMast.AraName,StsnMast.StnName" _
            & " from ((LabHdr" _
            & " inner join PatMast on LabHdr.LhrPttCode = PatMast.PttCode)" _
            & " inner join AreaMast on PatMast.PttAraCode = AreaMast.AraCode)" _
            & " inner join StsnMast on PatMast.PttStnCode = StsnMast.StnCode" _
            & IIf(mFiltCond <> "", " where " & mFiltCond, "") _
            & " order by LhrVchNo,LhrCode", dbComDatabase, adOpenKeyset, adLockOptimistic
    Else
        LRecset.open mListSqlExpr, dbComDatabase, adOpenKeyset, adLockOptimistic
    End If
    
    Set fcmb.BRecset = BRecset
    Set fcmb.LRecset = LRecset
    #If APP_HOSPITAL = True Then
        Set fcmb.frmAccessMaster = New frmLabReceipt
    #End If
    
    fcmb.ClearFlexColList
    fcmb.AddFlexColList mFldName:="LhrCode", mFldTitle:="LhrCode", mFldWidth:=0, mFldAlign:=7
    fcmb.AddFlexColList mFldName:="LhrVchNo", mFldTitle:="Rcpt.No", mFldWidth:=1200, mFldAlign:=7
    fcmb.AddFlexColList mFldName:="LhrDate", mFldTitle:="Date", mFldWidth:=1500, mFldAlign:=1
    fcmb.AddFlexColList mFldName:="LhrAmtAftDisc", mFldTitle:="Rcpt.Amt", mFldWidth:=1200, mFldAlign:=7
    fcmb.AddFlexColList mFldName:="LhrBalAmt", mFldTitle:="Due.Amt", mFldWidth:=1200, mFldAlign:=7
    fcmb.AddFlexColList mFldName:="PttName", mFldTitle:="Patient Name", mFldWidth:=2500, mFldAlign:=1
    fcmb.AddFlexColList mFldName:="PttRegNo", mFldTitle:="RegNo", mFldWidth:=1200, mFldAlign:=7
    fcmb.AddFlexColList mFldName:="PttRefName", mFldTitle:="Care of", mFldWidth:=2000, mFldAlign:=1
    fcmb.AddFlexColList mFldName:="AraName", mFldTitle:="Area", mFldWidth:=1750, mFldAlign:=1
    fcmb.AddFlexColList mFldName:="StnName", mFldTitle:="Station", mFldWidth:=1750, mFldAlign:=1
    fcmb.AddFlexColList mFldName:="LhrAdvAmt", mFldTitle:="Adv.Amt", mFldWidth:=1200, mFldAlign:=7
    fcmb.AddFlexColList mFldName:="LhrRecdAmt", mFldTitle:="Recd.Amt", mFldWidth:=1200, mFldAlign:=7
    fcmb.AddFlexColList mFldName:="LhrDepoAmt", mFldTitle:="Depo.Amt", mFldWidth:=1200, mFldAlign:=7
    fcmb.AddFlexColList mFldName:="LhrRefuAmt", mFldTitle:="Refd.Amt", mFldWidth:=1200, mFldAlign:=7
    
    fcmb.FormWidth = fcmb.Width + 5000
    fcmb.Init
    
ElseIf blnOldLrcListByPttRegNo = True Then
    Load fcmb
    fcmb.lblFormHeading.Caption = "Old Lab List by Patient Reg.No."
    fcmb.TableName = "LabHdr"
    fcmb.BoundField = "LhrCode"
    fcmb.ListField = "PttRegNo"
    fcmb.ListFieldUnq = "PttRegNoUnq"
    fcmb.lblSearchCaption.Caption = "Reg.No.:"
    
    BRecset.open "Select PatMast.PttCode,PatMast.PttRegNo,PatMast.PttName,LabHdr.LhrCode,LabHdr.LhrVchNo,LabHdr.LhrDate" _
        & ",cstr(PatMast.PttRegNo)+'_'+format(LabHdr.LhrCode,'" & cLONGCODESTRFMT & "') as PttRegNoUnq,PatMast.PttRefName,PatMast.PttAddr,PttTelNo+';'+PttSmsNo as PttContNo,AreaMast.AraName,StsnMast.StnName" _
        & " from ((PatMast" _
        & " inner join LabHdr on PatMast.PttCode = LabHdr.LhrPttCode)" _
        & " inner join AreaMast on PatMast.PttAraCode = AreaMast.AraCode)" _
        & " inner join StsnMast on PatMast.PttStnCode = StsnMast.StnCode" _
        & IIf(mFiltCond <> "", " where " & mFiltCond, "") _
        & " order by LhrCode" _
        , dbComDatabase, adOpenKeyset, adLockOptimistic
    If mListSqlExpr = "" Then
        LRecset.open "Select PatMast.PttCode,PatMast.PttRegNo,PatMast.PttName,LabHdr.LhrCode,LabHdr.LhrVchNo,LabHdr.LhrDate" _
            & ",cstr(PatMast.PttRegNo)+'_'+format(LabHdr.LhrCode,'" & cLONGCODESTRFMT & "') as PttRegNoUnq,PatMast.PttRefName,PatMast.PttAddr,PttTelNo+';'+PttSmsNo as PttContNo,AreaMast.AraName,StsnMast.StnName" _
            & " from ((PatMast" _
            & " inner join LabHdr on PatMast.PttCode = LabHdr.LhrPttCode)" _
            & " inner join AreaMast on PatMast.PttAraCode = AreaMast.AraCode)" _
            & " inner join StsnMast on PatMast.PttStnCode = StsnMast.StnCode" _
            & IIf(mFiltCond <> "", " where " & mFiltCond, "") _
            & " order by PttRegNo,LhrDate desc,LhrCode,PttCode" _
            , dbComDatabase, adOpenKeyset, adLockOptimistic
    Else
        LRecset.open mListSqlExpr, dbComDatabase, adOpenKeyset, adLockOptimistic
    End If
    
    Set fcmb.BRecset = BRecset
    Set fcmb.LRecset = LRecset
    #If APP_HOSPITAL = True Then
        Set fcmb.frmAccessMaster = New frmLabReceipt
    #End If
    
    fcmb.ClearFlexColList
    fcmb.AddFlexColList mFldName:="PttCode", mFldTitle:="PttCode", mFldWidth:=0, mFldAlign:=7
    fcmb.AddFlexColList mFldName:="LhrCode", mFldTitle:="LhrCode", mFldWidth:=0, mFldAlign:=7
    fcmb.AddFlexColList mFldName:="PttRegNo", mFldTitle:="Reg.No", mFldWidth:=1200, mFldAlign:=7
    fcmb.AddFlexColList mFldName:="PttName", mFldTitle:="Patient Name", mFldWidth:=2500, mFldAlign:=1
    fcmb.AddFlexColList mFldName:="LhrVchNo", mFldTitle:="Rcpt.No", mFldWidth:=1200, mFldAlign:=7
    fcmb.AddFlexColList mFldName:="LhrDate", mFldTitle:="Date", mFldWidth:=1500, mFldAlign:=1
    fcmb.AddFlexColList mFldName:="PttRefName", mFldTitle:="Care of", mFldWidth:=2000, mFldAlign:=1
    fcmb.AddFlexColList mFldName:="PttAddr", mFldTitle:="Address", mFldWidth:=2500, mFldAlign:=1
    fcmb.AddFlexColList mFldName:="PttContNo", mFldTitle:="Contact No", mFldWidth:=2000, mFldAlign:=1
    fcmb.AddFlexColList mFldName:="AraName", mFldTitle:="Area", mFldWidth:=1750, mFldAlign:=1
    fcmb.AddFlexColList mFldName:="StnName", mFldTitle:="Station", mFldWidth:=1750, mFldAlign:=1
    
    fcmb.FormWidth = fcmb.Width + 5000
    fcmb.Init
    
ElseIf blnOldLrcListByPttName = True Then
    Load fcmb
    fcmb.lblFormHeading.Caption = "Old Lab List by Patient Name"
    fcmb.TableName = "LabHdr"
    fcmb.BoundField = "LhrCode"
    fcmb.ListField = "PttName"
    fcmb.ListFieldUnq = "PttNameUnq"
    fcmb.lblSearchCaption.Caption = "Name:"
    
    BRecset.open "Select PatMast.PttCode,PatMast.PttName,PatMast.PttRegNo,LabHdr.LhrCode,LabHdr.LhrVchNo,LabHdr.LhrDate" _
        & ",PatMast.PttName+'_'+format(LabHdr.LhrCode,'" & cLONGCODESTRFMT & "') as PttNameUnq,PatMast.PttRefName,PatMast.PttAddr,PttTelNo+';'+PttSmsNo as PttContNo,AreaMast.AraName,StsnMast.StnName" _
        & " from ((PatMast" _
        & " inner join LabHdr on PatMast.PttCode = LabHdr.LhrPttCode)" _
        & " inner join AreaMast on PatMast.PttAraCode = AreaMast.AraCode)" _
        & " inner join StsnMast on PatMast.PttStnCode = StsnMast.StnCode" _
        & IIf(mFiltCond <> "", " where " & mFiltCond, "") _
        & " order by LhrCode" _
        , dbComDatabase, adOpenKeyset, adLockOptimistic
    If mListSqlExpr = "" Then
        Rem LRecset.open "Select PatMast.PttCode,PatMast.PttName,PatMast.PttRegNo,LabHdr.LhrCode,LabHdr.LhrVchNo,LabHdr.LhrDate,PatMast.PttName+'_'+format(PatMast.PttCode,'" & cLONGCODESTRFMT & "') as PttNameUnq,PatMast.PttRefName,PatMast.PttAddr,PttTelNo+';'+PttSmsNo as PttContNo,AreaMast.AraName,StsnMast.StnName from ((PatMast inner join LabHdr on PatMast.PttCode = LabHdr.LhrPttCode) inner join AreaMast on PatMast.PttAraCode = AreaMast.AraCode) inner join StsnMast on PatMast.PttStnCode = StsnMast.StnCode" & IIf(mFiltCond <> "", " where " & mFiltCond, "") & " order by PttName,LabHdr.LhrDate desc,PttCode", dbComDatabase, adOpenKeyset, adLockOptimistic
        LRecset.open "Select PatMast.PttCode,PatMast.PttName,PatMast.PttRegNo,LabHdr.LhrCode,LabHdr.LhrVchNo,LabHdr.LhrDate" _
            & ",PatMast.PttName+'_'+format(LabHdr.LhrCode,'" & cLONGCODESTRFMT & "') as PttNameUnq,PatMast.PttRefName,PatMast.PttAddr,PttTelNo+';'+PttSmsNo as PttContNo,AreaMast.AraName,StsnMast.StnName" _
            & " from ((PatMast" _
            & " inner join LabHdr on PatMast.PttCode = LabHdr.LhrPttCode)" _
            & " inner join AreaMast on PatMast.PttAraCode = AreaMast.AraCode)" _
            & " inner join StsnMast on PatMast.PttStnCode = StsnMast.StnCode" _
            & IIf(mFiltCond <> "", " where " & mFiltCond, "") _
            & " order by PttName,LhrDate desc,LhrCode,PttCode" _
            , dbComDatabase, adOpenKeyset, adLockOptimistic
    Else
        LRecset.open mListSqlExpr, dbComDatabase, adOpenKeyset, adLockOptimistic
    End If
    
    Set fcmb.BRecset = BRecset
    Set fcmb.LRecset = LRecset
    #If APP_HOSPITAL = True Then
        Set fcmb.frmAccessMaster = New frmLabReceipt
    #End If
    
    fcmb.ClearFlexColList
    fcmb.AddFlexColList mFldName:="PttCode", mFldTitle:="PttCode", mFldWidth:=0, mFldAlign:=7
    fcmb.AddFlexColList mFldName:="LhrCode", mFldTitle:="LhrCode", mFldWidth:=0, mFldAlign:=7
    fcmb.AddFlexColList mFldName:="PttName", mFldTitle:="Patient Name", mFldWidth:=2500, mFldAlign:=1
    fcmb.AddFlexColList mFldName:="PttRegNo", mFldTitle:="Reg.No", mFldWidth:=1200, mFldAlign:=7
    fcmb.AddFlexColList mFldName:="LhrVchNo", mFldTitle:="Rcpt.No", mFldWidth:=1200, mFldAlign:=7
    fcmb.AddFlexColList mFldName:="LhrDate", mFldTitle:="Date", mFldWidth:=1500, mFldAlign:=1
    fcmb.AddFlexColList mFldName:="PttRefName", mFldTitle:="Care of", mFldWidth:=2000, mFldAlign:=1
    fcmb.AddFlexColList mFldName:="PttAddr", mFldTitle:="Address", mFldWidth:=2500, mFldAlign:=1
    fcmb.AddFlexColList mFldName:="PttContNo", mFldTitle:="Contact No.", mFldWidth:=2000, mFldAlign:=1
    fcmb.AddFlexColList mFldName:="AraName", mFldTitle:="Area", mFldWidth:=1750, mFldAlign:=1
    fcmb.AddFlexColList mFldName:="StnName", mFldTitle:="Station", mFldWidth:=1750, mFldAlign:=1
    
    fcmb.FormWidth = fcmb.Width + 5000
    fcmb.Init
    
ElseIf blnDueLrcListByLrcNo = True Then
    Load fcmb
    fcmb.lblFormHeading.Caption = "Old Lab List by Lab Rcpt.No."
    fcmb.TableName = "LabHdr"
    fcmb.BoundField = "LhrCode"
    fcmb.ListField = "LhrVchNo"
    fcmb.ListFieldUnq = "LhrVchNoUnq"
    fcmb.lblSearchCaption.Caption = "No.:"
    
    BRecset.open fcmb.TableName, dbHmsDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect
    BRecset.Index = fcmb.BoundField
    If mListSqlExpr = "" Then
        LRecset.open "Select LabHdr.LhrCode,LabHdr.LhrVchNo,LabHdr.LhrDate,cstr(LabHdr.LhrVchNo)+'_'+format(LabHdr.LhrCode,'" & cLONGCODESTRFMT & "') as LhrVchNoUnq,PatMast.PttName,PatMast.PttRegNo,PatMast.PttRefName,PatMast.PttAddr,AreaMast.AraName,StsnMast.StnName" _
            & " from ((LabHdr" _
            & " inner join PatMast on LabHdr.LhrPttCode=PatMast.PttCode)" _
            & " inner join AreaMast on PatMast.PttAraCode=AreaMast.AraCode)" _
            & " inner join StsnMast on PatMast.PttStnCode=StsnMast.StnCode" _
            & " where (LhrBalAmt <> 0)" _
            & IIf(mFiltCond <> "", " and " & mFiltCond, "") _
            & " order by LhrVchNo,LhrCode", dbComDatabase, adOpenKeyset, adLockOptimistic
    Else
        LRecset.open mListSqlExpr, dbComDatabase, adOpenKeyset, adLockOptimistic
    End If
    
    Set fcmb.BRecset = BRecset
    Set fcmb.LRecset = LRecset
    #If APP_HOSPITAL = True Then
        Set fcmb.frmAccessMaster = New frmOutdoorReg
    #End If
    
    fcmb.ClearFlexColList
    fcmb.AddFlexColList mFldName:="LhrCode", mFldTitle:="LhrCode", mFldWidth:=0, mFldAlign:=7
    fcmb.AddFlexColList mFldName:="LhrVchNo", mFldTitle:="Rcpt.No", mFldWidth:=1200, mFldAlign:=7
    fcmb.AddFlexColList mFldName:="LhrDate", mFldTitle:="Date", mFldWidth:=1500, mFldAlign:=1
    fcmb.AddFlexColList mFldName:="PttName", mFldTitle:="Patient Name", mFldWidth:=2500, mFldAlign:=1
    fcmb.AddFlexColList mFldName:="PttRegNo", mFldTitle:="Reg.No.", mFldWidth:=1200, mFldAlign:=7
    fcmb.AddFlexColList mFldName:="PttRefName", mFldTitle:="Care of", mFldWidth:=2000, mFldAlign:=1
    fcmb.AddFlexColList mFldName:="AraName", mFldTitle:="Area", mFldWidth:=1750, mFldAlign:=1
    fcmb.AddFlexColList mFldName:="StnName", mFldTitle:="Station", mFldWidth:=1750, mFldAlign:=1
    
    fcmb.Init
    
ElseIf blnDueLrcListByPttRegNo = True Then
    Load fcmb
    fcmb.lblFormHeading.Caption = "Due Lab List by Patient Reg.No."
    fcmb.TableName = "LabHdr"
    fcmb.BoundField = "LhrCode"
    fcmb.ListField = "PttRegNo"
    fcmb.ListFieldUnq = "PttRegNoUnq"
    fcmb.lblSearchCaption.Caption = "Reg.No.:"
    
    BRecset.open "Select PatMast.PttCode,PatMast.PttRegNo,PatMast.PttName,LabHdr.LhrCode,LabHdr.LhrVchNo,LabHdr.LhrDate" _
        & ",cstr(PatMast.PttRegNo)+'_'+format(LabHdr.LhrCode,'" & cLONGCODESTRFMT & "') as PttRegNoUnq,PatMast.PttRefName,PatMast.PttAddr,PttTelNo+';'+PttSmsNo as PttContNo,AreaMast.AraName,StsnMast.StnName" _
        & " from ((PatMast" _
        & " inner join AreaMast on PatMast.PttAraCode = AreaMast.AraCode)" _
        & " inner join StsnMast on PatMast.PttStnCode = StsnMast.StnCode)" _
        & " inner join LabHdr on PatMast.PttCode = LabHdr.LhrPttCode" _
        & " where (LhrBalAmt <> 0)" _
        & IIf(mFiltCond <> "", " and " & mFiltCond, "") _
        & " order by LhrCode" _
        , dbComDatabase, adOpenKeyset, adLockOptimistic
    If mListSqlExpr = "" Then
        LRecset.open "Select PatMast.PttCode,PatMast.PttRegNo,PatMast.PttName,LabHdr.LhrCode,LabHdr.LhrVchNo,LabHdr.LhrDate" _
            & ",cstr(PatMast.PttRegNo)+'_'+format(LabHdr.LhrCode,'" & cLONGCODESTRFMT & "') as PttRegNoUnq,PatMast.PttRefName,PatMast.PttAddr,PttTelNo+';'+PttSmsNo as PttContNo,AreaMast.AraName,StsnMast.StnName" _
            & " from ((PatMast" _
            & " inner join AreaMast on PatMast.PttAraCode = AreaMast.AraCode)" _
            & " inner join StsnMast on PatMast.PttStnCode = StsnMast.StnCode)" _
            & " inner join LabHdr on PatMast.PttCode = LabHdr.LhrPttCode" _
            & " where (LhrBalAmt <> 0)" _
            & IIf(mFiltCond <> "", " and " & mFiltCond, "") _
            & " order by PttRegNo,LhrDate desc,LhrCode,PttCode" _
            , dbComDatabase, adOpenKeyset, adLockOptimistic
    Else
        LRecset.open mListSqlExpr, dbComDatabase, adOpenKeyset, adLockOptimistic
    End If
    
    Set fcmb.BRecset = BRecset
    Set fcmb.LRecset = LRecset
    #If APP_HOSPITAL = True Then
        Set fcmb.frmAccessMaster = New frmLabReceipt
    #End If
    
    fcmb.ClearFlexColList
    fcmb.AddFlexColList mFldName:="PttCode", mFldTitle:="PttCode", mFldWidth:=0, mFldAlign:=7
    fcmb.AddFlexColList mFldName:="LhrCode", mFldTitle:="LhrCode", mFldWidth:=0, mFldAlign:=7
    fcmb.AddFlexColList mFldName:="PttRegNo", mFldTitle:="Reg.No", mFldWidth:=1200, mFldAlign:=7
    fcmb.AddFlexColList mFldName:="PttName", mFldTitle:="Patient Name", mFldWidth:=2500, mFldAlign:=1
    fcmb.AddFlexColList mFldName:="LhrVchNo", mFldTitle:="Rcpt.No", mFldWidth:=1200, mFldAlign:=7
    fcmb.AddFlexColList mFldName:="LhrDate", mFldTitle:="Date", mFldWidth:=1500, mFldAlign:=1
    fcmb.AddFlexColList mFldName:="PttRefName", mFldTitle:="Care of", mFldWidth:=2000, mFldAlign:=1
    fcmb.AddFlexColList mFldName:="PttAddr", mFldTitle:="Address", mFldWidth:=2500, mFldAlign:=1
    fcmb.AddFlexColList mFldName:="PttContNo", mFldTitle:="Contact No", mFldWidth:=2000, mFldAlign:=1
    fcmb.AddFlexColList mFldName:="AraName", mFldTitle:="Area", mFldWidth:=1750, mFldAlign:=1
    fcmb.AddFlexColList mFldName:="StnName", mFldTitle:="Station", mFldWidth:=1750, mFldAlign:=1
    
    fcmb.FormWidth = fcmb.Width + 5000
    fcmb.Init
    
ElseIf blnDueLrcListByPttName = True Then
    Load fcmb
    fcmb.lblFormHeading.Caption = "Old Lab List by Patient Name"
    fcmb.TableName = "LabHdr"
    fcmb.BoundField = "LhrCode"
    fcmb.ListField = "PttName"
    fcmb.ListFieldUnq = "PttNameUnq"
    fcmb.lblSearchCaption.Caption = "Name:"
    
    BRecset.open "Select PatMast.PttCode,PatMast.PttName,PatMast.PttRegNo,LabHdr.LhrCode,LabHdr.LhrVchNo,LabHdr.LhrDate" _
        & ",PatMast.PttName+'_'+format(LabHdr.LhrCode,'" & cLONGCODESTRFMT & "') as PttNameUnq,PatMast.PttRefName,PatMast.PttAddr,PttTelNo+';'+PttSmsNo as PttContNo,AreaMast.AraName,StsnMast.StnName" _
        & " from ((PatMast" _
        & " inner join AreaMast on PatMast.PttAraCode = AreaMast.AraCode)" _
        & " inner join StsnMast on PatMast.PttStnCode = StsnMast.StnCode)" _
        & " inner join LabHdr on PatMast.PttCode = LabHdr.LhrPttCode" _
        & " where (LhrBalAmt <> 0)" _
        & IIf(mFiltCond <> "", " and " & mFiltCond, "") _
        & " order by LhrCode" _
        , dbComDatabase, adOpenKeyset, adLockOptimistic
    If mListSqlExpr = "" Then
        LRecset.open "Select PatMast.PttCode,PatMast.PttName,PatMast.PttRegNo,LabHdr.LhrCode,LabHdr.LhrVchNo,LabHdr.LhrDate" _
            & ",PatMast.PttName+'_'+format(LabHdr.LhrCode,'" & cLONGCODESTRFMT & "') as PttNameUnq,PatMast.PttRefName,PatMast.PttAddr,PttTelNo+';'+PttSmsNo as PttContNo,AreaMast.AraName,StsnMast.StnName" _
            & " from ((PatMast" _
            & " inner join AreaMast on PatMast.PttAraCode = AreaMast.AraCode)" _
            & " inner join StsnMast on PatMast.PttStnCode = StsnMast.StnCode)" _
            & " inner join LabHdr on PatMast.PttCode = LabHdr.LhrPttCode" _
            & " where (LhrBalAmt <> 0)" _
            & IIf(mFiltCond <> "", " and " & mFiltCond, "") _
            & " order by PttName,LhrDate desc,LhrCode,PttCode" _
            , dbComDatabase, adOpenKeyset, adLockOptimistic
    Else
        LRecset.open mListSqlExpr, dbComDatabase, adOpenKeyset, adLockOptimistic
    End If
    
    Set fcmb.BRecset = BRecset
    Set fcmb.LRecset = LRecset
    #If APP_HOSPITAL = True Then
        Set fcmb.frmAccessMaster = New frmOutdoorReg
    #End If
    
    fcmb.ClearFlexColList
    fcmb.AddFlexColList mFldName:="PttCode", mFldTitle:="PttCode", mFldWidth:=0, mFldAlign:=7
    fcmb.AddFlexColList mFldName:="LhrCode", mFldTitle:="LhrCode", mFldWidth:=0, mFldAlign:=7
    fcmb.AddFlexColList mFldName:="PttName", mFldTitle:="Patient Name", mFldWidth:=2500, mFldAlign:=1
    fcmb.AddFlexColList mFldName:="PttRegNo", mFldTitle:="Reg.No", mFldWidth:=1200, mFldAlign:=7
    fcmb.AddFlexColList mFldName:="LhrVchNo", mFldTitle:="Rcpt.No", mFldWidth:=1200, mFldAlign:=7
    fcmb.AddFlexColList mFldName:="LhrDate", mFldTitle:="Date", mFldWidth:=1500, mFldAlign:=1
    fcmb.AddFlexColList mFldName:="PttRefName", mFldTitle:="Care of", mFldWidth:=2000, mFldAlign:=1
    fcmb.AddFlexColList mFldName:="PttAddr", mFldTitle:="Address", mFldWidth:=2500, mFldAlign:=1
    fcmb.AddFlexColList mFldName:="PttContNo", mFldTitle:="Contact No.", mFldWidth:=2000, mFldAlign:=1
    fcmb.AddFlexColList mFldName:="AraName", mFldTitle:="Area", mFldWidth:=1750, mFldAlign:=1
    fcmb.AddFlexColList mFldName:="StnName", mFldTitle:="Station", mFldWidth:=1750, mFldAlign:=1
    
    fcmb.FormWidth = fcmb.Width + 5000
    fcmb.Init
    
Rem ---------------------------------------------------------------------------------------------------------------
ElseIf blnSubItmMastList = True Then
    Load fcmb
    fcmb.lblFormHeading.Caption = "Item Master"
    fcmb.TableName = "SubItmMast"
    fcmb.BoundField = "SimCode"
    fcmb.ListField = "SimName"
    fcmb.lblSearchCaption.Caption = "Name:"
    
    BRecset.open fcmb.TableName, dbHmsDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect
    BRecset.Index = fcmb.BoundField
    If mListSqlExpr = "" Then
        LRecset.open "Select SubItmMast.*,SubItmGrpMst.SigName from (SubItmMast" _
            & " inner join ProdMast on SubItmMast.SimItmCode = ProdMast.ItmCode)" _
            & " inner join SubItmGrpMst on SubItmMast.SimSigCode = SubItmGrpMst.SigCode" _
            & IIf(mFiltCond <> "", " where " & mFiltCond, "") _
            & " order by SimName", dbComDatabase, adOpenKeyset, adLockOptimistic
    Else
        LRecset.open mListSqlExpr, dbComDatabase, adOpenKeyset, adLockOptimistic
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
    
ElseIf blnSubItmGrpMastList = True Then
    Load fcmb
    fcmb.lblFormHeading.Caption = "Item Group Master"
    fcmb.TableName = "SubItmGrpMst"
    fcmb.BoundField = "SigCode"
    fcmb.ListField = "SigName"
    fcmb.lblSearchCaption.Caption = "Name:"
    
    BRecset.open fcmb.TableName, dbHmsDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect
    BRecset.Index = fcmb.BoundField
    If mListSqlExpr = "" Then
        LRecset.open "Select SubItmGrpMst.* from SubItmGrpMst" & IIf(mFiltCond <> "", " where " & mFiltCond, "") & " order by SigName", dbHmsDatabase, adOpenKeyset, adLockOptimistic
    Else
        LRecset.open mListSqlExpr, dbHmsDatabase, adOpenKeyset, adLockOptimistic
    End If

    Set fcmb.BRecset = BRecset
    Set fcmb.LRecset = LRecset
    Set fcmb.frmAccessMaster = New frmSubItemGrpMast
    
    fcmb.ClearFlexColList
    fcmb.AddFlexColList mFldName:="SigCode", mFldTitle:="SigCode", mFldWidth:=0, mFldAlign:=8
    fcmb.AddFlexColList mFldName:="SigName", mFldTitle:="Group Name", mFldWidth:=3000, mFldAlign:=1
    
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
    Rem while preparing query on entry form let remain inner join of MedPurchDtl but saledtl inner join only in form edit mode
    Rem list will show entries of completed purchase entry but under unsaved entries of purchase in add mode so as to avoid duplicate entry of any unsaved entry
    If mBoundSqlExpr = "" Then
        BRecset.open "Select *,SimRefNo+'_'+format(ItrCode,'" & cLONGCODESTRFMT & "') as SimRefNoUnq from (" _
            & "Select SimRefNo,ItrCode,sum(Qty) as Qty_sum from (" _
            & "Select PurItrCode as ItrCode,PurSimRefNo as SimRefNo,PurQty as Qty from MedPurchDtl" _
            & " inner join MedPurchHdr on MedPurchDtl.PurCode = MedPurchHdr.PuhCode" _
            & IIf(mFiltCond <> "", " where " & mFiltCond, "") _
            & " Union All " _
            & "Select SalItrCode as ItrCode,SalSimRefNo as SimRefNo,(SalQty*-1) as Qty from MedSaleDtl" _
            & " inner join MedSaleHdr on MedSaleDtl.SalCode = MedSaleHdr.SahCode" _
            & IIf(mFiltCond <> "", " where " & mFiltCond, "") _
            & ")" _
            & " group by ItrCode,SimRefNo order by ItrCode,SimRefNo" _
            & ") as t1 inner join ProdRef on t1.ItrCode = ProdRef.ItrRefCode" _
            & " where Qty_sum > 0" _
            , dbComDatabase, adOpenKeyset, adLockOptimistic
    Else
        BRecset.open mBoundSqlExpr, dbComDatabase, adOpenKeyset, adLockOptimistic
    End If
    If mListSqlExpr = "" Then
        LRecset.open "Select *,SimRefNo+'_'+format(ItrCode,'" & cLONGCODESTRFMT & "') as SimRefNoUnq from (" _
            & "Select SimRefNo,ItrCode,sum(Qty) as Qty_sum from (" _
            & "Select PurItrCode as ItrCode,PurSimRefNo as SimRefNo,PurQty as Qty from MedPurchDtl" _
            & " inner join MedPurchHdr on MedPurchDtl.PurCode = MedPurchHdr.PuhCode" _
            & IIf(mFiltCond <> "", " where " & mFiltCond, "") _
            & " Union All " _
            & "Select SalItrCode as ItrCode,SalSimRefNo as SimRefNo,(SalQty*-1) as Qty from MedSaleDtl" _
            & " inner join MedSaleHdr on MedSaleDtl.SalCode = MedSaleHdr.SahCode" _
            & IIf(mFiltCond <> "", " where " & mFiltCond, "") _
            & ")" _
            & " group by SimRefNo,ItrCode order by SimRefNo,ItrCode" _
            & ") as t1 inner join ProdRef on t1.ItrCode = ProdRef.ItrRefCode" _
            & " where Qty_sum > 0" _
            , dbComDatabase, adOpenKeyset, adLockOptimistic
    Else
        LRecset.open mListSqlExpr, dbComDatabase, adOpenKeyset, adLockOptimistic
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
    
ElseIf blnPartyMastList = True Then
    Load fcmb
    fcmb.lblFormHeading.Caption = "Party Master"
    fcmb.TableName = "PartyMast"
    fcmb.BoundField = "PrtCode"
    fcmb.ListField = "PrtName"
    fcmb.lblSearchCaption.Caption = "Name:"
    
    BRecset.open fcmb.TableName, dbHmsDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect
    BRecset.Index = fcmb.BoundField
    If mListSqlExpr = "" Then
        LRecset.open "Select PartyMast.*,AreaMast.AraName,StsnMast.StnName,AchdMast.AhName from ((PartyMast inner join AreaMast on PartyMast.PrtAraCode=AreaMast.AraCode) inner join StsnMast on PartyMast.PrtStnCode=StsnMast.StnCode) inner join AchdMast on PartyMast.PrtAhCode=AchdMast.AhCode" & IIf(mFiltCond <> "", " where " & mFiltCond, "") & " order by PrtName", dbComDatabase, adOpenKeyset, adLockOptimistic
    Else
        LRecset.open mListSqlExpr, dbComDatabase, adOpenKeyset, adLockOptimistic
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
    
    BRecset.open fcmb.TableName, dbHmsDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect
    BRecset.Index = fcmb.BoundField
    If mListSqlExpr = "" Then
        LRecset.open "Select PartyGrpMst.* from PartyGrpMst" & IIf(mFiltCond <> "", " where " & mFiltCond, "") & " order by PgmName", dbHmsDatabase, adOpenKeyset, adLockOptimistic
    Else
        LRecset.open mListSqlExpr, dbHmsDatabase, adOpenKeyset, adLockOptimistic
    End If
    
    Set fcmb.BRecset = BRecset
    Set fcmb.LRecset = LRecset
    Set fcmb.frmAccessMaster = New frmPartyGrpMast

    fcmb.ClearFlexColList
    fcmb.AddFlexColList mFldName:="PgmCode", mFldTitle:="PgmCode", mFldWidth:=0, mFldAlign:=7
    fcmb.AddFlexColList mFldName:="PgmName", mFldTitle:="Group Name", mFldWidth:=3000, mFldAlign:=1

    fcmb.Init
    
Else
    Err.Raise Number:=vbObjectError + 513, Description:="clsHmsFlexSearch_Class_Init_425"
    
End If

End Sub

Public Sub ReInit()
BRecset.Close: LRecset.Close
If blnUserRoleMastList = True Then
    BRecset.open fcmb.TableName, dbCmpDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect
    BRecset.Index = fcmb.BoundField
    If mListSqlExpr = "" Then
        LRecset.open "Select * from " & fcmb.TableName & IIf(mFiltCond <> "", " where " & mFiltCond, "") & " order by " & fcmb.ListField, dbCmpDatabase, adOpenKeyset, adLockOptimistic
    Else
        LRecset.open mListSqlExpr, dbCmpDatabase, adOpenKeyset, adLockOptimistic
    End If
    fcmb.ReInit
    
ElseIf blnUserMastList = True Then
    BRecset.open fcmb.TableName, dbCmpDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect
    BRecset.Index = fcmb.BoundField
    If mListSqlExpr = "" Then
        LRecset.open "Select * from " & fcmb.TableName & IIf(mFiltCond <> "", " where " & mFiltCond, "") & " order by " & fcmb.ListField, dbCmpDatabase, adOpenKeyset, adLockOptimistic
    Else
        LRecset.open mListSqlExpr, dbCmpDatabase, adOpenKeyset, adLockOptimistic
    End If
    fcmb.ReInit
    
ElseIf blnPatCatgMstList = True Then
    BRecset.open fcmb.TableName, dbHmsDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect
    BRecset.Index = fcmb.BoundField
    If mListSqlExpr = "" Then
        LRecset.open "Select * from " & fcmb.TableName & IIf(mFiltCond <> "", " where " & mFiltCond, "") & " order by " & fcmb.ListField, dbHmsDatabase, adOpenKeyset, adLockOptimistic
    Else
        LRecset.open mListSqlExpr, dbHmsDatabase, adOpenKeyset, adLockOptimistic
    End If
    fcmb.ReInit
    
ElseIf blnPatMastListByName = True Then
    BRecset.open fcmb.TableName, dbHmsDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect
    BRecset.Index = fcmb.BoundField
    If mListSqlExpr = "" Then
        LRecset.open "Select PatMast.*,PatMast.PttName+'_'+format(PatMast.PttCode,'" & cLONGCODESTRFMT & "') as PttNameUnq,PttTelNo+';'+PttSmsNo as PttContNo,AreaMast.AraName,StsnMast.StnName from (PatMast left join AreaMast on PatMast.PttAraCode=AreaMast.AraCode) left join StsnMast on PatMast.PttStnCode=StsnMast.StnCode" & IIf(mFiltCond <> "", " where " & mFiltCond, "") & " order by PttName,PttRegDate desc,PttRegNo desc,PttCode", dbComDatabase, adOpenKeyset, adLockOptimistic
    Else
        LRecset.open mListSqlExpr, dbComDatabase, adOpenKeyset, adLockOptimistic
    End If
    fcmb.ReInit
    
ElseIf blnPatMastListByRegNo = True Then
    BRecset.open fcmb.TableName, dbHmsDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect
    BRecset.Index = fcmb.BoundField
    If mListSqlExpr = "" Then
        LRecset.open "Select PatMast.*,cstr(PatMast.PttRegNo)+'_'+format(PatMast.PttCode,'" & cLONGCODESTRFMT & "') as PttRegNoUnq,PttTelNo+';'+PttSmsNo as PttContNo,AreaMast.AraName,StsnMast.StnName from (PatMast left join AreaMast on PatMast.PttAraCode=AreaMast.AraCode) left join StsnMast on PatMast.PttStnCode=StsnMast.StnCode" & IIf(mFiltCond <> "", " where " & mFiltCond, "") & " order by PttRegNo,PttName", dbComDatabase, adOpenKeyset, adLockOptimistic
    Else
        LRecset.open mListSqlExpr, dbComDatabase, adOpenKeyset, adLockOptimistic
    End If
    fcmb.ReInit
    
ElseIf blnDoctMastList = True Then
    BRecset.open fcmb.TableName, dbHmsDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect
    BRecset.Index = fcmb.BoundField
    If mListSqlExpr = "" Then
        LRecset.open "Select * from " & fcmb.TableName & IIf(mFiltCond <> "", " where " & mFiltCond, "") & " order by " & fcmb.ListField, dbHmsDatabase, adOpenKeyset, adLockOptimistic
    Else
        LRecset.open mListSqlExpr, dbHmsDatabase, adOpenKeyset, adLockOptimistic
    End If
    fcmb.ReInit
    
ElseIf blnDoctRoleMastList = True Then
    BRecset.open fcmb.TableName, dbHmsDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect
    BRecset.Index = fcmb.BoundField
    If mListSqlExpr = "" Then
        LRecset.open "Select * from " & fcmb.TableName & IIf(mFiltCond <> "", " where " & mFiltCond, "") & " order by " & fcmb.ListField, dbHmsDatabase, adOpenKeyset, adLockOptimistic
    Else
        LRecset.open mListSqlExpr, dbHmsDatabase, adOpenKeyset, adLockOptimistic
    End If
    fcmb.ReInit
    
ElseIf blnRefByMastList = True Then
    BRecset.open fcmb.TableName, dbHmsDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect
    BRecset.Index = fcmb.BoundField
    If mListSqlExpr = "" Then
        LRecset.open "Select * from " & fcmb.TableName & IIf(mFiltCond <> "", " where " & mFiltCond, "") & " order by " & fcmb.ListField, dbHmsDatabase, adOpenKeyset, adLockOptimistic
    Else
        LRecset.open mListSqlExpr, dbHmsDatabase, adOpenKeyset, adLockOptimistic
    End If
    fcmb.ReInit
    
ElseIf blnRefToMastList = True Then
    BRecset.open fcmb.TableName, dbHmsDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect
    BRecset.Index = fcmb.BoundField
    If mListSqlExpr = "" Then
        LRecset.open "Select * from " & fcmb.TableName & IIf(mFiltCond <> "", " where " & mFiltCond, "") & " order by " & fcmb.ListField, dbHmsDatabase, adOpenKeyset, adLockOptimistic
    Else
        LRecset.open mListSqlExpr, dbHmsDatabase, adOpenKeyset, adLockOptimistic
    End If
    fcmb.ReInit
    
ElseIf blnDoctCatgMstList = True Then
    BRecset.open fcmb.TableName, dbHmsDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect
    BRecset.Index = fcmb.BoundField
    If mListSqlExpr = "" Then
        LRecset.open "Select * from " & fcmb.TableName & IIf(mFiltCond <> "", " where " & mFiltCond, "") & " order by " & fcmb.ListField, dbHmsDatabase, adOpenKeyset, adLockOptimistic
    Else
        LRecset.open mListSqlExpr, dbHmsDatabase, adOpenKeyset, adLockOptimistic
    End If
    fcmb.ReInit
    
ElseIf blnRefCatgMstList = True Then
    BRecset.open fcmb.TableName, dbHmsDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect
    BRecset.Index = fcmb.BoundField
    If mListSqlExpr = "" Then
        LRecset.open "Select * from " & fcmb.TableName & IIf(mFiltCond <> "", " where " & mFiltCond, "") & " order by " & fcmb.ListField, dbHmsDatabase, adOpenKeyset, adLockOptimistic
    Else
        LRecset.open mListSqlExpr, dbHmsDatabase, adOpenKeyset, adLockOptimistic
    End If
    fcmb.ReInit
    
ElseIf blnServGrpMstList = True Then
    BRecset.open fcmb.TableName, dbHmsDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect    ' SgpShowInList=True
    BRecset.Index = fcmb.BoundField
    If mListSqlExpr = "" Then
        LRecset.open "Select * from " & fcmb.TableName & " where SgpShowInList=True" & IIf(mFiltCond <> "", mFiltCond, "") & " order by " & fcmb.ListField, dbHmsDatabase, adOpenKeyset, adLockOptimistic
    Else
        LRecset.open mListSqlExpr, dbHmsDatabase, adOpenKeyset, adLockOptimistic
    End If
    fcmb.ReInit
    
ElseIf blnServMastList = True Then
    BRecset.open fcmb.TableName, dbHmsDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect    ' SrvShowInList=True
    BRecset.Index = fcmb.BoundField
    If mListSqlExpr = "" Then
        LRecset.open "Select * from " & fcmb.TableName _
          & " Inner Join ServGrpMst on " & fcmb.TableName & ".SrvSgpCode = ServGrpMst.SgpCode" _
          & " where SrvShowInList = True" & IIf(mFiltCond <> "", mFiltCond, "") _
          & " order by " & fcmb.ListField, dbHmsDatabase, adOpenKeyset, adLockOptimistic
        
    Else
        LRecset.open mListSqlExpr, dbHmsDatabase, adOpenKeyset, adLockOptimistic
    End If
    fcmb.ReInit
    
ElseIf blnDiagMastList = True Then
    BRecset.open fcmb.TableName, dbHmsDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect
    BRecset.Index = fcmb.BoundField
    If mListSqlExpr = "" Then
        LRecset.open "Select * from " & fcmb.TableName & IIf(mFiltCond <> "", " where " & mFiltCond, "") & " order by " & fcmb.ListField, dbHmsDatabase, adOpenKeyset, adLockOptimistic
    Else
        LRecset.open mListSqlExpr, dbHmsDatabase, adOpenKeyset, adLockOptimistic
    End If
    fcmb.ReInit
    
ElseIf blnFloorMastList = True Then
    BRecset.open fcmb.TableName, dbHmsDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect
    BRecset.Index = fcmb.BoundField
    If mListSqlExpr = "" Then
        LRecset.open "Select * from " & fcmb.TableName & " where FlrShowInList=True" & IIf(mFiltCond <> "", mFiltCond, "") & " order by " & fcmb.ListField, dbHmsDatabase, adOpenKeyset, adLockOptimistic
    Else
        LRecset.open mListSqlExpr, dbHmsDatabase, adOpenKeyset, adLockOptimistic
    End If
    fcmb.ReInit
    
ElseIf blnWardMastList = True Then
    BRecset.open fcmb.TableName, dbHmsDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect
    BRecset.Index = fcmb.BoundField
    If mListSqlExpr = "" Then
        LRecset.open "Select * from " & fcmb.TableName & " where WrdShowInList=True" & IIf(mFiltCond <> "", mFiltCond, "") & " order by " & fcmb.ListField, dbHmsDatabase, adOpenKeyset, adLockOptimistic
    Else
        LRecset.open mListSqlExpr, dbHmsDatabase, adOpenKeyset, adLockOptimistic
    End If
    fcmb.ReInit
    
ElseIf blnBedMastList = True Then
    BRecset.open fcmb.TableName, dbHmsDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect
    BRecset.Index = fcmb.BoundField
    If mListSqlExpr = "" Then
        LRecset.open "Select * from " & fcmb.TableName & " where BdmShowInList=True" & IIf(mFiltCond <> "", mFiltCond, "") & " order by " & fcmb.ListField, dbHmsDatabase, adOpenKeyset, adLockOptimistic
    Else
        LRecset.open mListSqlExpr, dbHmsDatabase, adOpenKeyset, adLockOptimistic
    End If
    fcmb.ReInit
    
ElseIf blnOldOpgListByOpgNo = True Then
    BRecset.open fcmb.TableName, dbHmsDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect
    BRecset.Index = fcmb.BoundField
    If mListSqlExpr = "" Then
        LRecset.open "Select OutdReg.OpgCode,OutdReg.OpgVchNo,OutdReg.OpgDate,OutdReg.OpgVchNo+'_'+format(OutdReg.OpgCode,'" & cLONGCODESTRFMT & "') as OpgVchNoUnq,PatMast.PttName,PatMast.PttRegNo,PatMast.PttRefName,PatMast.PttAddr,AreaMast.AraName,StsnMast.StnName from ((OutdReg inner join PatMast on OutdReg.OpgPttCode=PatMast.PttCode) inner join AreaMast on PatMast.PttAraCode=AreaMast.AraCode) inner join StsnMast on PatMast.PttStnCode=StsnMast.StnCode" & IIf(mFiltCond <> "", " where " & mFiltCond, "") & " order by OpgVchNo,OpgCode", dbComDatabase, adOpenKeyset, adLockOptimistic
    Else
        LRecset.open mListSqlExpr, dbComDatabase, adOpenKeyset, adLockOptimistic
    End If
    
    fcmb.ReInit
    
ElseIf blnOldOpgListByPttRegNo = True Then
'''    BRecset.open fcmb.TableName, dbHmsDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect
'''    BRecset.Index = fcmb.BoundField
    BRecset.open "Select PatMast.PttCode,PatMast.PttRegNo,PatMast.PttName,OutdReg.OpgCode,OutdReg.OpgVchNo,OutdReg.OpgDate" _
        & ",cstr(PatMast.PttRegNo)+'_'+format(OutdReg.OpgCode,'" & cLONGCODESTRFMT & "') as PttRegNoUnq,PatMast.PttRefName,PatMast.PttAddr,PttTelNo+';'+PttSmsNo as PttContNo,AreaMast.AraName,StsnMast.StnName" _
        & " from ((PatMast" _
        & " inner join OutdReg on PatMast.PttCode = OutdReg.OpgPttCode)" _
        & " inner join AreaMast on PatMast.PttAraCode = AreaMast.AraCode)" _
        & " inner join StsnMast on PatMast.PttStnCode = StsnMast.StnCode" _
        & IIf(mFiltCond <> "", " where " & mFiltCond, "") _
        & " order by OpgCode" _
        , dbComDatabase, adOpenKeyset, adLockOptimistic
    If mListSqlExpr = "" Then
        Rem LRecset.open "Select PatMast.PttCode,PatMast.PttRegNo,PatMast.PttName,OutdReg.OpgCode,OutdReg.OpgVchNo,OutdReg.OpgDate,cstr(PatMast.PttRegNo)+'_'+format(PatMast.PttCode,'" & cLONGCODESTRFMT & "') as PttRegNoUnq,PatMast.PttRefName,PatMast.PttAddr,PttTelNo+';'+PttSmsNo as PttContNo,AreaMast.AraName,StsnMast.StnName from ((PatMast inner join OutdReg on PatMast.PttCode=OutdReg.OpgPttCode) inner join AreaMast on PatMast.PttAraCode=AreaMast.AraCode) inner join StsnMast on PatMast.PttStnCode=StsnMast.StnCode" & IIf(mFiltCond <> "", " where " & mFiltCond, "") & " order by PttRegNo,PttCode", dbComDatabase, adOpenKeyset, adLockOptimistic
        LRecset.open "Select PatMast.PttCode,PatMast.PttRegNo,PatMast.PttName,OutdReg.OpgCode,OutdReg.OpgVchNo,OutdReg.OpgDate" _
            & ",cstr(PatMast.PttRegNo)+'_'+format(OutdReg.OpgCode,'" & cLONGCODESTRFMT & "') as PttRegNoUnq,PatMast.PttRefName,PatMast.PttAddr,PttTelNo+';'+PttSmsNo as PttContNo,AreaMast.AraName,StsnMast.StnName" _
            & " from ((PatMast" _
            & " inner join OutdReg on PatMast.PttCode = OutdReg.OpgPttCode)" _
            & " inner join AreaMast on PatMast.PttAraCode = AreaMast.AraCode)" _
            & " inner join StsnMast on PatMast.PttStnCode = StsnMast.StnCode" _
            & IIf(mFiltCond <> "", " where " & mFiltCond, "") _
            & " order by PttRegNo,OpgDate desc,OpgCode,PttCode" _
            , dbComDatabase, adOpenKeyset, adLockOptimistic
    Else
        LRecset.open mListSqlExpr, dbComDatabase, adOpenKeyset, adLockOptimistic
    End If
    
    fcmb.Init
    
ElseIf blnOldOpgListByPttName = True Then
'''    BRecset.open fcmb.TableName, dbHmsDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect
'''    BRecset.Index = fcmb.BoundField
    BRecset.open "Select PatMast.PttCode,PatMast.PttName,PatMast.PttRegNo,OutdReg.OpgCode,OutdReg.OpgVchNo,OutdReg.OpgDate" _
        & ",PatMast.PttName+'_'+format(OutdReg.OpgCode,'" & cLONGCODESTRFMT & "') as PttNameUnq,PatMast.PttRefName,PatMast.PttAddr,PttTelNo+';'+PttSmsNo as PttContNo,AreaMast.AraName,StsnMast.StnName" _
        & " from ((PatMast" _
        & " inner join OutdReg on PatMast.PttCode = OutdReg.OpgPttCode)" _
        & " inner join AreaMast on PatMast.PttAraCode = AreaMast.AraCode)" _
        & " inner join StsnMast on PatMast.PttStnCode = StsnMast.StnCode" _
        & IIf(mFiltCond <> "", " where " & mFiltCond, "") _
        & " order by OpgCode" _
        , dbComDatabase, adOpenKeyset, adLockOptimistic
    If mListSqlExpr = "" Then
        Rem LRecset.open "Select PatMast.PttCode,PatMast.PttName,PatMast.PttRegNo,OutdReg.OpgCode,OutdReg.OpgVchNo,OutdReg.OpgDate,PatMast.PttName+'_'+format(PatMast.PttCode,'" & cLONGCODESTRFMT & "') as PttNameUnq,PatMast.PttRefName,PatMast.PttAddr,PttTelNo+';'+PttSmsNo as PttContNo,AreaMast.AraName,StsnMast.StnName from ((PatMast inner join OutdReg on PatMast.PttCode=OutdReg.OpgPttCode) inner join AreaMast on PatMast.PttAraCode=AreaMast.AraCode) inner join StsnMast on PatMast.PttStnCode=StsnMast.StnCode" & IIf(mFiltCond <> "", " where " & mFiltCond, "") & " order by PttName,OutdReg.OpgDate desc,PttCode", dbComDatabase, adOpenKeyset, adLockOptimistic
        LRecset.open "Select PatMast.PttCode,PatMast.PttName,PatMast.PttRegNo,OutdReg.OpgCode,OutdReg.OpgVchNo,OutdReg.OpgDate" _
            & ",PatMast.PttName+'_'+format(OutdReg.OpgCode,'" & cLONGCODESTRFMT & "') as PttNameUnq,PatMast.PttRefName,PatMast.PttAddr,PttTelNo+';'+PttSmsNo as PttContNo,AreaMast.AraName,StsnMast.StnName" _
            & " from ((PatMast" _
            & " inner join OutdReg on PatMast.PttCode = OutdReg.OpgPttCode)" _
            & " inner join AreaMast on PatMast.PttAraCode = AreaMast.AraCode)" _
            & " inner join StsnMast on PatMast.PttStnCode = StsnMast.StnCode" _
            & IIf(mFiltCond <> "", " where " & mFiltCond, "") _
            & " order by PttName,OpgDate desc,OpgCode,PttCode" _
            , dbComDatabase, adOpenKeyset, adLockOptimistic
    Else
        LRecset.open mListSqlExpr, dbComDatabase, adOpenKeyset, adLockOptimistic
    End If
    
    fcmb.Init
    
ElseIf blnOldOrcListByOrcNo = True Then
    BRecset.open fcmb.TableName, dbHmsDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect
    BRecset.Index = fcmb.BoundField
    If mListSqlExpr = "" Then
        LRecset.open "Select OutdHdr.OhrCode,OutdHdr.OhrVchNo,OutdHdr.OhrDate,OutdHdr.OhrAmtAftDisc,OutdHdr.OhrAdvAmt,OutdHdr.OhrRecdAmt,OutdHdr.OhrDepoAmt,OutdHdr.OhrRefuAmt,OutdHdr.OhrBalAmt,cstr(OutdHdr.OhrVchNo)+'_'+format(OutdHdr.OhrCode,'" & cLONGCODESTRFMT & "') as OhrVchNoUnq,PatMast.PttName,PatMast.PttRegNo,PatMast.PttRefName,PatMast.PttAddr,AreaMast.AraName,StsnMast.StnName from ((OutdHdr inner join PatMast on OutdHdr.OhrPttCode=PatMast.PttCode) inner join AreaMast on PatMast.PttAraCode=AreaMast.AraCode) inner join StsnMast on PatMast.PttStnCode=StsnMast.StnCode" & IIf(mFiltCond <> "", " where " & mFiltCond, "") & " order by OhrVchNo,OhrCode", dbComDatabase, adOpenKeyset, adLockOptimistic
    Else
        LRecset.open mListSqlExpr, dbComDatabase, adOpenKeyset, adLockOptimistic
    End If
    
    fcmb.ReInit
    
ElseIf blnOldOblListByOblNo = True Then
    BRecset.open fcmb.TableName, dbHmsDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect
    BRecset.Index = fcmb.BoundField
    If mListSqlExpr = "" Then
        LRecset.open "Select OutdBlHdr.ObhCode,OutdBlHdr.ObhVchNo,OutdBlHdr.ObhDate,OutdBlHdr.ObhAmtAftDisc,OutdBlHdr.ObhDepoAmt,OutdBlHdr.ObhRefuAmt,OutdBlHdr.ObhBalAmt,cstr(OutdBlHdr.ObhVchNo)+'_'+format(OutdBlHdr.ObhCode,'" & cLONGCODESTRFMT & "') as ObhVchNoUnq,PatMast.PttName,PatMast.PttRegNo,PatMast.PttRefName,PatMast.PttAddr,AreaMast.AraName,StsnMast.StnName from ((OutdBlHdr inner join PatMast on OutdBlHdr.ObhPttCode=PatMast.PttCode) inner join AreaMast on PatMast.PttAraCode=AreaMast.AraCode) inner join StsnMast on PatMast.PttStnCode=StsnMast.StnCode" & IIf(mFiltCond <> "", " where " & mFiltCond, "") & " order by ObhVchNo,ObhCode", dbComDatabase, adOpenKeyset, adLockOptimistic
    Else
        LRecset.open mListSqlExpr, dbComDatabase, adOpenKeyset, adLockOptimistic
    End If
    
    fcmb.ReInit
    
ElseIf blnOldIpgListByIpgNo = True Then
    BRecset.open fcmb.TableName, dbHmsDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect
    BRecset.Index = fcmb.BoundField
    If mListSqlExpr = "" Then
        LRecset.open "Select IndrReg.IpgCode,IndrReg.IpgVchNo,IndrReg.IpgDate,cstr(IndrReg.IpgVchNo)+'_'+format(IndrReg.IpgCode,'" & cLONGCODESTRFMT & "') as IpgVchNoUnq,PatMast.PttName,PatMast.PttRegNo,PatMast.PttRefName,PatMast.PttAddr,AreaMast.AraName,StsnMast.StnName from ((IndrReg inner join PatMast on IndrReg.IpgPttCode=PatMast.PttCode) inner join AreaMast on PatMast.PttAraCode=AreaMast.AraCode) inner join StsnMast on PatMast.PttStnCode=StsnMast.StnCode" & IIf(mFiltCond <> "", " where " & mFiltCond, "") & " order by IpgVchNo,IpgCode", dbComDatabase, adOpenKeyset, adLockOptimistic
    Else
        LRecset.open mListSqlExpr, dbComDatabase, adOpenKeyset, adLockOptimistic
    End If
    
    fcmb.ReInit
    
ElseIf blnOldIpgListByPttRegNo = True Then
'''    BRecset.open fcmb.TableName, dbHmsDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect
'''    BRecset.Index = fcmb.BoundField
    BRecset.open "Select PatMast.PttCode,PatMast.PttRegNo,PatMast.PttName" _
        & ",IndrReg.IpgCode,IndrReg.IpgVchNo,IndrReg.IpgDate,cstr(PatMast.PttRegNo)+'_'+format(IndrReg.IpgCode,'" & cLONGCODESTRFMT & "') as PttRegNoUnq,PatMast.PttRefName,PatMast.PttAddr,AreaMast.AraName,StsnMast.StnName" _
        & " from ((PatMast" _
        & " inner join IndrReg on PatMast.PttCode = IndrReg.IpgPttCode)" _
        & " inner join AreaMast on PatMast.PttAraCode = AreaMast.AraCode)" _
        & " inner join StsnMast on PatMast.PttStnCode = StsnMast.StnCode" _
        & IIf(mFiltCond <> "", " where " & mFiltCond, "") _
        & " order by IpgCode" _
        , dbComDatabase, adOpenKeyset, adLockOptimistic
    If mListSqlExpr = "" Then
        Rem LRecset.open "Select PatMast.PttCode,PatMast.PttRegNo,PatMast.PttName,IndrReg.IpgCode,IndrReg.IpgVchNo,IndrReg.IpgDate,cstr(PatMast.PttRegNo)+'_'+format(PatMast.PttCode,'" & cLONGCODESTRFMT & "') as PttRegNoUnq,PatMast.PttRefName,PatMast.PttAddr,AreaMast.AraName,StsnMast.StnName from ((PatMast inner join IndrReg on PatMast.PttCode=IndrReg.IpgPttCode) inner join AreaMast on PatMast.PttAraCode=AreaMast.AraCode) inner join StsnMast on PatMast.PttStnCode=StsnMast.StnCode" & IIf(mFiltCond <> "", " where " & mFiltCond, "") & " order by PttRegNo,PttCode", dbComDatabase, adOpenKeyset, adLockOptimistic
        LRecset.open "Select PatMast.PttCode,PatMast.PttRegNo,PatMast.PttName" _
            & ",IndrReg.IpgCode,IndrReg.IpgVchNo,IndrReg.IpgDate,cstr(PatMast.PttRegNo)+'_'+format(IndrReg.IpgCode,'" & cLONGCODESTRFMT & "') as PttRegNoUnq,PatMast.PttRefName,PatMast.PttAddr,AreaMast.AraName,StsnMast.StnName" _
            & " from ((PatMast" _
            & " inner join IndrReg on PatMast.PttCode = IndrReg.IpgPttCode)" _
            & " inner join AreaMast on PatMast.PttAraCode = AreaMast.AraCode)" _
            & " inner join StsnMast on PatMast.PttStnCode = StsnMast.StnCode" _
            & IIf(mFiltCond <> "", " where " & mFiltCond, "") _
            & " order by PttRegNo,IpgDate desc,IpgCode,PttCode" _
            , dbComDatabase, adOpenKeyset, adLockOptimistic
    Else
        LRecset.open mListSqlExpr, dbComDatabase, adOpenKeyset, adLockOptimistic
    End If
    
    fcmb.ReInit
    
ElseIf blnOldIpgListByPttName = True Then
'''    BRecset.open fcmb.TableName, dbHmsDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect
'''    BRecset.Index = fcmb.BoundField
    BRecset.open "Select PatMast.PttCode,PatMast.PttName,PatMast.PttRegNo" _
        & ",IndrReg.IpgCode,IndrReg.IpgVchNo,IndrReg.IpgDate,PatMast.PttName+'_'+format(IndrReg.IpgCode,'" & cLONGCODESTRFMT & "') as PttNameUnq,PatMast.PttRefName,PatMast.PttAddr,AreaMast.AraName,StsnMast.StnName" _
        & " from ((PatMast" _
        & " inner join IndrReg on PatMast.PttCode = IndrReg.IpgPttCode)" _
        & " inner join AreaMast on PatMast.PttAraCode = AreaMast.AraCode)" _
        & " inner join StsnMast on PatMast.PttStnCode = StsnMast.StnCode" _
        & IIf(mFiltCond <> "", " where " & mFiltCond, "") _
        & " order by IpgCode" _
        , dbComDatabase, adOpenKeyset, adLockOptimistic
    If mListSqlExpr = "" Then
        LRecset.open "Select PatMast.PttCode,PatMast.PttName,PatMast.PttRegNo" _
            & ",IndrReg.IpgCode,IndrReg.IpgVchNo,IndrReg.IpgDate,PatMast.PttName+'_'+format(IndrReg.IpgCode,'" & cLONGCODESTRFMT & "') as PttNameUnq,PatMast.PttRefName,PatMast.PttAddr,AreaMast.AraName,StsnMast.StnName" _
            & " from ((PatMast" _
            & " inner join IndrReg on PatMast.PttCode = IndrReg.IpgPttCode)" _
            & " inner join AreaMast on PatMast.PttAraCode = AreaMast.AraCode)" _
            & " inner join StsnMast on PatMast.PttStnCode = StsnMast.StnCode" _
            & IIf(mFiltCond <> "", " where " & mFiltCond, "") _
            & " order by PttName,IpgDate desc,IpgCode,PttCode" _
            , dbComDatabase, adOpenKeyset, adLockOptimistic
    Else
        LRecset.open mListSqlExpr, dbComDatabase, adOpenKeyset, adLockOptimistic
    End If
    
    fcmb.ReInit

ElseIf blnAdmIpgListByIpgNo = True Then
    BRecset.open fcmb.TableName, dbHmsDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect
    BRecset.Index = fcmb.BoundField
    If mListSqlExpr = "" Then
        LRecset.open "Select IndrReg.IpgCode,IndrReg.IpgVchNo,IndrReg.IpgDate,cstr(IndrReg.IpgVchNo)+'_'+format(IndrReg.IpgCode,'" & cLONGCODESTRFMT & "') as IpgVchNoUnq" _
            & ",PatMast.PttName,PatMast.PttRegNo,PatMast.PttRefName,PatMast.PttAddr,AreaMast.AraName,StsnMast.StnName" _
            & " from (((IndrReg" _
            & " inner join PatMast on IndrReg.IpgPttCode = PatMast.PttCode)" _
            & " inner join AreaMast on PatMast.PttAraCode = AreaMast.AraCode)" _
            & " inner join StsnMast on PatMast.PttStnCode = StsnMast.StnCode)" _
            & " inner join (Select * from IBedState where IbsDischState=" & CStr(cIBS_STATE_OCCUPIED) & ") as IBedState on IndrReg.IpgCode = IBedState.IbsIpgCode" _
            & IIf(mFiltCond <> "", " where " & mFiltCond, "") _
            & " order by IpgVchNo,IpgCode" _
            , dbComDatabase, adOpenKeyset, adLockOptimistic
    Else
        LRecset.open mListSqlExpr, dbComDatabase, adOpenKeyset, adLockOptimistic
    End If
    fcmb.ReInit
    
ElseIf blnDueIpgListByIpgNo = True Then
    BRecset.open fcmb.TableName, dbHmsDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect
    BRecset.Index = fcmb.BoundField
    If mListSqlExpr = "" Then
        LRecset.open "Select IndrReg.IpgCode,IndrReg.IpgVchNo,IndrReg.IpgDate,cstr(IndrReg.IpgVchNo)+'_'+format(IndrReg.IpgCode,'" & cLONGCODESTRFMT & "') as IpgVchNoUnq" _
            & ",PatMast.PttName,PatMast.PttRegNo,PatMast.PttRefName,PatMast.PttAddr,AreaMast.AraName,StsnMast.StnName" _
            & " from ((((IndrReg" _
            & " inner join PatMast on IndrReg.IpgPttCode = PatMast.PttCode)" _
            & " inner join AreaMast on PatMast.PttAraCode = AreaMast.AraCode)" _
            & " inner join StsnMast on PatMast.PttStnCode = StsnMast.StnCode)" _
            & " left join (Select IbhIpgCode,sum(IbhBalAmt) as IbhBalAmt_sum from IndrBlHdr group by IbhIpgCode) as IndrBlHdr on IndrReg.IpgCode = IndrBlHdr.IbhIpgCode)" _
            & " left join (Select IhrIpgCode,sum(IhrBalAmt) as IhrBalAmt_sum from IndrHdr group by IhrIpgCode) as IndrHdr on IndrReg.IpgCode = IndrHdr.IhrIpgCode" _
            & " where (IbhBalAmt_sum <> 0 or IhrBalAmt_sum <> 0)" _
            & IIf(mFiltCond <> "", " and " & mFiltCond, "") _
            & " order by IpgVchNo,IpgCode" _
            , dbComDatabase, adOpenKeyset, adLockOptimistic
    Else
        LRecset.open mListSqlExpr, dbComDatabase, adOpenKeyset, adLockOptimistic
    End If
    
    fcmb.ReInit
    
ElseIf blnAdmIpgListByPttRegNo = True Then
'''    BRecset.open fcmb.TableName, dbHmsDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect
'''    BRecset.Index = fcmb.BoundField
    BRecset.open "Select PatMast.PttCode,PatMast.PttRegNo,PatMast.PttName" _
        & ",IndrReg.IpgCode,IndrReg.IpgVchNo,IndrReg.IpgDate,cstr(PatMast.PttRegNo)+'_'+format(IndrReg.IpgCode,'" & cLONGCODESTRFMT & "') as PttRegNoUnq,PatMast.PttRefName,PatMast.PttAddr,PttTelNo+';'+PttSmsNo as PttContNo,AreaMast.AraName,StsnMast.StnName" _
        & " from (((PatMast" _
        & " inner join AreaMast on PatMast.PttAraCode = AreaMast.AraCode)" _
        & " inner join StsnMast on PatMast.PttStnCode = StsnMast.StnCode)" _
        & " inner join IndrReg on PatMast.PttCode = IndrReg.IpgPttCode)" _
        & " inner join (Select * from IBedState where IbsDischState = " & CStr(cIBS_STATE_OCCUPIED) & ") as IBedState on IndrReg.IpgCode = IBedState.IbsIpgCode" _
        & IIf(mFiltCond <> "", " where " & mFiltCond, "") _
        & " order by IpgCode" _
        , dbComDatabase, adOpenKeyset, adLockOptimistic
    If mListSqlExpr = "" Then
        LRecset.open "Select PatMast.PttCode,PatMast.PttRegNo,PatMast.PttName" _
            & ",IndrReg.IpgCode,IndrReg.IpgVchNo,IndrReg.IpgDate,cstr(PatMast.PttRegNo)+'_'+format(IndrReg.IpgCode,'" & cLONGCODESTRFMT & "') as PttRegNoUnq,PatMast.PttRefName,PatMast.PttAddr,PttTelNo+';'+PttSmsNo as PttContNo,AreaMast.AraName,StsnMast.StnName" _
            & " from (((PatMast" _
            & " inner join AreaMast on PatMast.PttAraCode = AreaMast.AraCode)" _
            & " inner join StsnMast on PatMast.PttStnCode = StsnMast.StnCode)" _
            & " inner join IndrReg on PatMast.PttCode = IndrReg.IpgPttCode)" _
            & " inner join (Select * from IBedState where IbsDischState = " & CStr(cIBS_STATE_OCCUPIED) & ") as IBedState on IndrReg.IpgCode = IBedState.IbsIpgCode" _
            & IIf(mFiltCond <> "", " where " & mFiltCond, "") _
            & " order by PttRegNo,IpgDate desc,IpgCode,PttCode" _
            , dbComDatabase, adOpenKeyset, adLockOptimistic
    Else
        LRecset.open mListSqlExpr, dbComDatabase, adOpenKeyset, adLockOptimistic
    End If
    fcmb.ReInit
    
ElseIf blnDueIpgListByPttRegNo = True Then
    BRecset.open "Select PatMast.PttCode,PatMast.PttRegNo,PatMast.PttName" _
        & ",IndrReg.IpgCode,IndrReg.IpgVchNo,IndrReg.IpgDate,cstr(PatMast.PttRegNo)+'_'+format(IndrReg.IpgCode,'" & cLONGCODESTRFMT & "') as PttRegNoUnq,PatMast.PttRefName,PatMast.PttAddr,PttTelNo+';'+PttSmsNo as PttContNo,AreaMast.AraName,StsnMast.StnName" _
        & " from ((((PatMast" _
        & " inner join AreaMast on PatMast.PttAraCode = AreaMast.AraCode)" _
        & " inner join StsnMast on PatMast.PttStnCode = StsnMast.StnCode)" _
        & " inner join IndrReg on PatMast.PttCode = IndrReg.IpgPttCode)" _
        & " left join (Select IbhIpgCode,sum(IbhBalAmt) as IbhBalAmt_sum from IndrBlHdr group by IbhIpgCode) as IndrBlHdr on IndrReg.IpgCode = IndrBlHdr.IbhIpgCode)" _
        & " left join (Select IhrIpgCode,sum(IhrBalAmt) as IhrBalAmt_sum from IndrHdr group by IhrIpgCode) as IndrHdr on IndrReg.IpgCode = IndrHdr.IhrIpgCode" _
        & " where (IbhBalAmt_sum <> 0 or IhrBalAmt_sum <> 0)" _
        & IIf(mFiltCond <> "", " and " & mFiltCond, "") _
        & " order by IpgCode" _
        , dbComDatabase, adOpenKeyset, adLockOptimistic
    If mListSqlExpr = "" Then
        LRecset.open "Select PatMast.PttCode,PatMast.PttRegNo,PatMast.PttName" _
            & ",IndrReg.IpgCode,IndrReg.IpgVchNo,IndrReg.IpgDate,cstr(PatMast.PttRegNo)+'_'+format(IndrReg.IpgCode,'" & cLONGCODESTRFMT & "') as PttRegNoUnq,PatMast.PttRefName,PatMast.PttAddr,PttTelNo+';'+PttSmsNo as PttContNo,AreaMast.AraName,StsnMast.StnName" _
            & " from ((((PatMast" _
            & " inner join AreaMast on PatMast.PttAraCode = AreaMast.AraCode)" _
            & " inner join StsnMast on PatMast.PttStnCode = StsnMast.StnCode)" _
            & " inner join IndrReg on PatMast.PttCode = IndrReg.IpgPttCode)" _
            & " left join (Select IbhIpgCode,sum(IbhBalAmt) as IbhBalAmt_sum from IndrBlHdr group by IbhIpgCode) as IndrBlHdr on IndrReg.IpgCode = IndrBlHdr.IbhIpgCode)" _
            & " left join (Select IhrIpgCode,sum(IhrBalAmt) as IhrBalAmt_sum from IndrHdr group by IhrIpgCode) as IndrHdr on IndrReg.IpgCode = IndrHdr.IhrIpgCode" _
            & " where (IbhBalAmt_sum <> 0 or IhrBalAmt_sum <> 0)" _
            & IIf(mFiltCond <> "", " and " & mFiltCond, "") _
            & " order by PttRegNo,IpgDate desc,IpgCode,PttCode" _
            , dbComDatabase, adOpenKeyset, adLockOptimistic
    Else
        LRecset.open mListSqlExpr, dbComDatabase, adOpenKeyset, adLockOptimistic
    End If
    
    fcmb.ReInit
    
ElseIf blnAdmIpgListByPttName = True Then
    BRecset.open "Select PatMast.PttCode,PatMast.PttName,PatMast.PttRegNo" _
        & ",IndrReg.IpgCode,IndrReg.IpgVchNo,IndrReg.IpgDate" _
        & ",PatMast.PttName+'_'+format(IndrReg.IpgCode,'" & cLONGCODESTRFMT & "') as PttNameUnq,PatMast.PttRefName,PatMast.PttAddr,PttTelNo+';'+PttSmsNo as PttContNo,AreaMast.AraName,StsnMast.StnName" _
        & " from (((PatMast" _
        & " inner join AreaMast on PatMast.PttAraCode = AreaMast.AraCode)" _
        & " inner join StsnMast on PatMast.PttStnCode = StsnMast.StnCode)" _
        & " inner join IndrReg on PatMast.PttCode = IndrReg.IpgPttCode)" _
        & " inner join (Select * from IBedState where IbsDischState = " & CStr(cIBS_STATE_OCCUPIED) & ") as IBedState on IndrReg.IpgCode = IBedState.IbsIpgCode" _
        & IIf(mFiltCond <> "", " where " & mFiltCond, "") _
        & " order by IpgCode" _
        , dbComDatabase, adOpenKeyset, adLockOptimistic
    If mListSqlExpr = "" Then
        LRecset.open "Select PatMast.PttCode,PatMast.PttName,PatMast.PttRegNo" _
            & ",IndrReg.IpgCode,IndrReg.IpgVchNo,IndrReg.IpgDate" _
            & ",PatMast.PttName+'_'+format(IndrReg.IpgCode,'" & cLONGCODESTRFMT & "') as PttNameUnq,PatMast.PttRefName,PatMast.PttAddr,PttTelNo+';'+PttSmsNo as PttContNo,AreaMast.AraName,StsnMast.StnName" _
            & " from (((PatMast" _
            & " inner join AreaMast on PatMast.PttAraCode = AreaMast.AraCode)" _
            & " inner join StsnMast on PatMast.PttStnCode = StsnMast.StnCode)" _
            & " inner join IndrReg on PatMast.PttCode = IndrReg.IpgPttCode)" _
            & " inner join (Select * from IBedState where IbsDischState = " & CStr(cIBS_STATE_OCCUPIED) & ") as IBedState on IndrReg.IpgCode = IBedState.IbsIpgCode" _
            & IIf(mFiltCond <> "", " where " & mFiltCond, "") _
            & " order by PttName,IpgDate desc,IpgCode,PttCode" _
            , dbComDatabase, adOpenKeyset, adLockOptimistic
    Else
        LRecset.open mListSqlExpr, dbComDatabase, adOpenKeyset, adLockOptimistic
    End If
    fcmb.ReInit

ElseIf blnDueIpgListByPttName = True Then
    BRecset.open "Select PatMast.PttCode,PatMast.PttName,PatMast.PttRegNo" _
        & ",IndrReg.IpgCode,IndrReg.IpgVchNo,IndrReg.IpgDate" _
        & ",PatMast.PttName+'_'+format(IndrReg.IpgCode,'" & cLONGCODESTRFMT & "') as PttNameUnq,PatMast.PttRefName,PatMast.PttAddr,PttTelNo+';'+PttSmsNo as PttContNo,AreaMast.AraName,StsnMast.StnName" _
        & " from ((((PatMast" _
        & " inner join AreaMast on PatMast.PttAraCode = AreaMast.AraCode)" _
        & " inner join StsnMast on PatMast.PttStnCode = StsnMast.StnCode)" _
        & " inner join IndrReg on PatMast.PttCode = IndrReg.IpgPttCode)" _
        & " left join (Select IbhIpgCode,sum(IbhBalAmt) as IbhBalAmt_sum from IndrBlHdr group by IbhIpgCode) as IndrBlHdr on IndrReg.IpgCode = IndrBlHdr.IbhIpgCode)" _
        & " left join (Select IhrIpgCode,sum(IhrBalAmt) as IhrBalAmt_sum from IndrHdr group by IhrIpgCode) as IndrHdr on IndrReg.IpgCode = IndrHdr.IhrIpgCode" _
        & " where (IbhBalAmt_sum <> 0 or IhrBalAmt_sum <> 0)" _
        & IIf(mFiltCond <> "", " and " & mFiltCond, "") _
        & " order by IpgCode" _
        , dbComDatabase, adOpenKeyset, adLockOptimistic
    If mListSqlExpr = "" Then
        LRecset.open "Select PatMast.PttCode,PatMast.PttName,PatMast.PttRegNo" _
            & ",IndrReg.IpgCode,IndrReg.IpgVchNo,IndrReg.IpgDate" _
            & ",PatMast.PttName+'_'+format(IndrReg.IpgCode,'" & cLONGCODESTRFMT & "') as PttNameUnq,PatMast.PttRefName,PatMast.PttAddr,PttTelNo+';'+PttSmsNo as PttContNo,AreaMast.AraName,StsnMast.StnName" _
            & " from ((((PatMast" _
            & " inner join AreaMast on PatMast.PttAraCode = AreaMast.AraCode)" _
            & " inner join StsnMast on PatMast.PttStnCode = StsnMast.StnCode)" _
            & " inner join IndrReg on PatMast.PttCode = IndrReg.IpgPttCode)" _
            & " left join (Select IbhIpgCode,sum(IbhBalAmt) as IbhBalAmt_sum from IndrBlHdr group by IbhIpgCode) as IndrBlHdr on IndrReg.IpgCode = IndrBlHdr.IbhIpgCode)" _
            & " left join (Select IhrIpgCode,sum(IhrBalAmt) as IhrBalAmt_sum from IndrHdr group by IhrIpgCode) as IndrHdr on IndrReg.IpgCode = IndrHdr.IhrIpgCode" _
            & " where (IbhBalAmt_sum <> 0 or IhrBalAmt_sum <> 0)" _
            & IIf(mFiltCond <> "", " and " & mFiltCond, "") _
            & " order by PttName,IpgDate desc,IpgCode,PttCode" _
            , dbComDatabase, adOpenKeyset, adLockOptimistic
    Else
        LRecset.open mListSqlExpr, dbComDatabase, adOpenKeyset, adLockOptimistic
    End If
    
    fcmb.ReInit

ElseIf blnOldIgtListByIgtNo = True Then
    BRecset.open fcmb.TableName, dbHmsDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect
    BRecset.Index = fcmb.BoundField
    If mListSqlExpr = "" Then
        LRecset.open "Select IndrRgPymt.IgtCode,IndrRgPymt.IgtVchNo,IndrRgPymt.IgtDate,IndrRgPymt.IgtDpogAmt,IndrRgPymt.IgtAdjAmt,IndrRgPymt.IgtBalAmt,cstr(IndrRgPymt.IgtVchNo)+'_'+format(IndrRgPymt.IgtCode,'" & cLONGCODESTRFMT & "') as IgtVchNoUnq" _
            & ",PatMast.PttName,PatMast.PttRegNo,PatMast.PttRefName,PatMast.PttAddr" _
            & ",AreaMast.AraName,StsnMast.StnName" _
            & " from ((IndrRgPymt" _
            & " inner join PatMast on IndrRgPymt.IgtPttCode=PatMast.PttCode)" _
            & " inner join AreaMast on PatMast.PttAraCode=AreaMast.AraCode)" _
            & " inner join StsnMast on PatMast.PttStnCode=StsnMast.StnCode" _
            & IIf(mFiltCond <> "", " where " & mFiltCond, "") _
            & " order by IgtVchNo,IgtCode" _
            , dbComDatabase, adOpenKeyset, adLockOptimistic
    Else
        LRecset.open mListSqlExpr, dbComDatabase, adOpenKeyset, adLockOptimistic
    End If
    fcmb.ReInit
    
ElseIf blnOldIgfListByIgfNo = True Then
    BRecset.open fcmb.TableName, dbHmsDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect
    BRecset.Index = fcmb.BoundField
    If mListSqlExpr = "" Then
        LRecset.open "Select IndrRgRefd.IgfCode,IndrRgRefd.IgfVchNo,IndrRgRefd.IgfDate,IndrRgRefd.IgfRfugAmt,IndrRgRefd.IgfAdjAmt,IndrRgRefd.IgfBalAmt,cstr(IndrRgRefd.IgfVchNo)+'_'+format(IndrRgRefd.IgfCode,'" & cLONGCODESTRFMT & "') as IgfVchNoUnq" _
            & ",PatMast.PttName,PatMast.PttRegNo,PatMast.PttRefName,PatMast.PttAddr" _
            & ",AreaMast.AraName,StsnMast.StnName" _
            & " from ((IndrRgRefd" _
            & " inner join PatMast on IndrRgRefd.IgfPttCode=PatMast.PttCode)" _
            & " inner join AreaMast on PatMast.PttAraCode=AreaMast.AraCode)" _
            & " inner join StsnMast on PatMast.PttStnCode=StsnMast.StnCode" _
            & IIf(mFiltCond <> "", " where " & mFiltCond, "") _
            & " order by IgfVchNo,IgfCode" _
            , dbComDatabase, adOpenKeyset, adLockOptimistic
    Else
        LRecset.open mListSqlExpr, dbComDatabase, adOpenKeyset, adLockOptimistic
    End If
    fcmb.ReInit

ElseIf blnOldIrcListByIrcNo = True Then
    BRecset.open fcmb.TableName, dbHmsDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect
    BRecset.Index = fcmb.BoundField
    If mListSqlExpr = "" Then
        LRecset.open "Select IndrHdr.IhrCode,IndrHdr.IhrVchNo,IndrHdr.IhrDate,IndrHdr.IhrAmtAftDisc,IndrHdr.IhrAdvAmt,IndrHdr.IhrRecdAmt,IndrHdr.IhrDepoAmt,IndrHdr.IhrRefuAmt,IndrHdr.IhrBalAmt,cstr(IndrHdr.IhrVchNo)+'_'+format(IndrHdr.IhrCode,'" & cLONGCODESTRFMT & "') as IhrVchNoUnq" _
            & ",PatMast.PttName,PatMast.PttRegNo,PatMast.PttRefName,PatMast.PttAddr" _
            & ",AreaMast.AraName,StsnMast.StnName" _
            & " from ((IndrHdr" _
            & " inner join PatMast on IndrHdr.IhrPttCode=PatMast.PttCode)" _
            & " inner join AreaMast on PatMast.PttAraCode=AreaMast.AraCode)" _
            & " inner join StsnMast on PatMast.PttStnCode=StsnMast.StnCode" _
            & IIf(mFiltCond <> "", " where " & mFiltCond, "") _
            & " order by IhrVchNo,IhrCode" _
            , dbComDatabase, adOpenKeyset, adLockOptimistic
    Else
        LRecset.open mListSqlExpr, dbComDatabase, adOpenKeyset, adLockOptimistic
    End If
    fcmb.ReInit
    
ElseIf blnOldIblListByIblNo = True Then
    BRecset.open fcmb.TableName, dbHmsDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect
    BRecset.Index = fcmb.BoundField
    If mListSqlExpr = "" Then
        LRecset.open "Select IndrBlHdr.IbhCode,IndrBlHdr.IbhVchNo,IndrBlHdr.IbhDate,IndrBlHdr.IbhAmtAftDisc,IndrBlHdr.IbhDepoAmt,IndrBlHdr.IbhRefuAmt,IndrBlHdr.IbhBalAmt,cstr(IndrBlHdr.IbhVchNo)+'_'+format(IndrBlHdr.IbhCode,'" & cLONGCODESTRFMT & "') as IbhVchNoUnq,PatMast.PttName,PatMast.PttRegNo,PatMast.PttRefName,PatMast.PttAddr,AreaMast.AraName,StsnMast.StnName from ((IndrBlHdr inner join PatMast on IndrBlHdr.IbhPttCode=PatMast.PttCode) inner join AreaMast on PatMast.PttAraCode=AreaMast.AraCode) inner join StsnMast on PatMast.PttStnCode=StsnMast.StnCode" & IIf(mFiltCond <> "", " where " & mFiltCond, "") & " order by IbhVchNo,IbhCode", dbComDatabase, adOpenKeyset, adLockOptimistic
    Else
        LRecset.open mListSqlExpr, dbComDatabase, adOpenKeyset, adLockOptimistic
    End If
    
    fcmb.ReInit
    
ElseIf blnOldLrcListByLrcNo = True Then
    BRecset.open fcmb.TableName, dbHmsDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect
    BRecset.Index = fcmb.BoundField
    If mListSqlExpr = "" Then
        LRecset.open "Select LabHdr.LhrCode,LabHdr.LhrVchNo,LabHdr.LhrDate,LabHdr.LhrAmtAftDisc,LabHdr.LhrAdvAmt,LabHdr.LhrRecdAmt,LabHdr.LhrDepoAmt,LabHdr.LhrRefuAmt,LabHdr.LhrBalAmt,cstr(LabHdr.LhrVchNo)+'_'+format(LabHdr.LhrCode,'" & cLONGCODESTRFMT & "') as LhrVchNoUnq" _
            & ",PatMast.PttName,PatMast.PttRegNo,PatMast.PttRefName,PatMast.PttAddr,AreaMast.AraName,StsnMast.StnName" _
            & " from ((LabHdr" _
            & " inner join PatMast on LabHdr.LhrPttCode = PatMast.PttCode)" _
            & " inner join AreaMast on PatMast.PttAraCode = AreaMast.AraCode)" _
            & " inner join StsnMast on PatMast.PttStnCode = StsnMast.StnCode" _
            & IIf(mFiltCond <> "", " where " & mFiltCond, "") _
            & " order by LhrVchNo,LhrCode", dbComDatabase, adOpenKeyset, adLockOptimistic
    Else
        LRecset.open mListSqlExpr, dbComDatabase, adOpenKeyset, adLockOptimistic
    End If
    
    fcmb.ReInit
    
ElseIf blnOldLrcListByPttRegNo = True Then
    BRecset.open "Select PatMast.PttCode,PatMast.PttRegNo,PatMast.PttName,LabHdr.LhrCode,LabHdr.LhrVchNo,LabHdr.LhrDate" _
        & ",cstr(PatMast.PttRegNo)+'_'+format(LabHdr.LhrCode,'" & cLONGCODESTRFMT & "') as PttRegNoUnq,PatMast.PttRefName,PatMast.PttAddr,PttTelNo+';'+PttSmsNo as PttContNo,AreaMast.AraName,StsnMast.StnName" _
        & " from ((PatMast" _
        & " inner join LabHdr on PatMast.PttCode = LabHdr.LhrPttCode)" _
        & " inner join AreaMast on PatMast.PttAraCode = AreaMast.AraCode)" _
        & " inner join StsnMast on PatMast.PttStnCode = StsnMast.StnCode" _
        & IIf(mFiltCond <> "", " where " & mFiltCond, "") _
        & " order by LhrCode" _
        , dbComDatabase, adOpenKeyset, adLockOptimistic
    If mListSqlExpr = "" Then
        LRecset.open "Select PatMast.PttCode,PatMast.PttRegNo,PatMast.PttName,LabHdr.LhrCode,LabHdr.LhrVchNo,LabHdr.LhrDate" _
            & ",cstr(PatMast.PttRegNo)+'_'+format(LabHdr.LhrCode,'" & cLONGCODESTRFMT & "') as PttRegNoUnq,PatMast.PttRefName,PatMast.PttAddr,PttTelNo+';'+PttSmsNo as PttContNo,AreaMast.AraName,StsnMast.StnName" _
            & " from ((PatMast" _
            & " inner join LabHdr on PatMast.PttCode = LabHdr.LhrPttCode)" _
            & " inner join AreaMast on PatMast.PttAraCode = AreaMast.AraCode)" _
            & " inner join StsnMast on PatMast.PttStnCode = StsnMast.StnCode" _
            & IIf(mFiltCond <> "", " where " & mFiltCond, "") _
            & " order by PttRegNo,LhrDate desc,LhrCode,PttCode" _
            , dbComDatabase, adOpenKeyset, adLockOptimistic
    Else
        LRecset.open mListSqlExpr, dbComDatabase, adOpenKeyset, adLockOptimistic
    End If
    
    fcmb.ReInit
    
ElseIf blnOldLrcListByPttName = True Then
    BRecset.open "Select PatMast.PttCode,PatMast.PttName,PatMast.PttRegNo,LabHdr.LhrCode,LabHdr.LhrVchNo,LabHdr.LhrDate" _
        & ",PatMast.PttName+'_'+format(LabHdr.LhrCode,'" & cLONGCODESTRFMT & "') as PttNameUnq,PatMast.PttRefName,PatMast.PttAddr,PttTelNo+';'+PttSmsNo as PttContNo,AreaMast.AraName,StsnMast.StnName" _
        & " from ((PatMast" _
        & " inner join LabHdr on PatMast.PttCode = LabHdr.LhrPttCode)" _
        & " inner join AreaMast on PatMast.PttAraCode = AreaMast.AraCode)" _
        & " inner join StsnMast on PatMast.PttStnCode = StsnMast.StnCode" _
        & IIf(mFiltCond <> "", " where " & mFiltCond, "") _
        & " order by LhrCode" _
        , dbComDatabase, adOpenKeyset, adLockOptimistic
    If mListSqlExpr = "" Then
        Rem LRecset.open "Select PatMast.PttCode,PatMast.PttName,PatMast.PttRegNo,LabHdr.LhrCode,LabHdr.LhrVchNo,LabHdr.LhrDate,PatMast.PttName+'_'+format(PatMast.PttCode,'" & cLONGCODESTRFMT & "') as PttNameUnq,PatMast.PttRefName,PatMast.PttAddr,PttTelNo+';'+PttSmsNo as PttContNo,AreaMast.AraName,StsnMast.StnName from ((PatMast inner join LabHdr on PatMast.PttCode = LabHdr.LhrPttCode) inner join AreaMast on PatMast.PttAraCode = AreaMast.AraCode) inner join StsnMast on PatMast.PttStnCode = StsnMast.StnCode" & IIf(mFiltCond <> "", " where " & mFiltCond, "") & " order by PttName,LabHdr.LhrDate desc,PttCode", dbComDatabase, adOpenKeyset, adLockOptimistic
        LRecset.open "Select PatMast.PttCode,PatMast.PttName,PatMast.PttRegNo,LabHdr.LhrCode,LabHdr.LhrVchNo,LabHdr.LhrDate" _
            & ",PatMast.PttName+'_'+format(LabHdr.LhrCode,'" & cLONGCODESTRFMT & "') as PttNameUnq,PatMast.PttRefName,PatMast.PttAddr,PttTelNo+';'+PttSmsNo as PttContNo,AreaMast.AraName,StsnMast.StnName" _
            & " from ((PatMast" _
            & " inner join LabHdr on PatMast.PttCode = LabHdr.LhrPttCode)" _
            & " inner join AreaMast on PatMast.PttAraCode = AreaMast.AraCode)" _
            & " inner join StsnMast on PatMast.PttStnCode = StsnMast.StnCode" _
            & IIf(mFiltCond <> "", " where " & mFiltCond, "") _
            & " order by PttName,LhrDate desc,LhrCode,PttCode" _
            , dbComDatabase, adOpenKeyset, adLockOptimistic
    Else
        LRecset.open mListSqlExpr, dbComDatabase, adOpenKeyset, adLockOptimistic
    End If
    
    fcmb.ReInit
    
ElseIf blnDueLrcListByLrcNo = True Then
    BRecset.open fcmb.TableName, dbHmsDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect
    BRecset.Index = fcmb.BoundField
    If mListSqlExpr = "" Then
        LRecset.open "Select LabHdr.LhrCode,LabHdr.LhrVchNo,LabHdr.LhrDate,cstr(LabHdr.LhrVchNo)+'_'+format(LabHdr.LhrCode,'" & cLONGCODESTRFMT & "') as LhrVchNoUnq,PatMast.PttName,PatMast.PttRegNo,PatMast.PttRefName,PatMast.PttAddr,AreaMast.AraName,StsnMast.StnName" _
            & " from ((LabHdr" _
            & " inner join PatMast on LabHdr.LhrPttCode=PatMast.PttCode)" _
            & " inner join AreaMast on PatMast.PttAraCode=AreaMast.AraCode)" _
            & " inner join StsnMast on PatMast.PttStnCode=StsnMast.StnCode" _
            & " where (LhrBalAmt <> 0)" _
            & IIf(mFiltCond <> "", " and " & mFiltCond, "") _
            & " order by LhrVchNo,LhrCode", dbComDatabase, adOpenKeyset, adLockOptimistic
    Else
        LRecset.open mListSqlExpr, dbComDatabase, adOpenKeyset, adLockOptimistic
    End If
    
    fcmb.ReInit

ElseIf blnDueLrcListByPttRegNo = True Then
    BRecset.open "Select PatMast.PttCode,PatMast.PttRegNo,PatMast.PttName,LabHdr.LhrCode,LabHdr.LhrVchNo,LabHdr.LhrDate" _
        & ",cstr(PatMast.PttRegNo)+'_'+format(LabHdr.LhrCode,'" & cLONGCODESTRFMT & "') as PttRegNoUnq,PatMast.PttRefName,PatMast.PttAddr,PttTelNo+';'+PttSmsNo as PttContNo,AreaMast.AraName,StsnMast.StnName" _
        & " from ((PatMast" _
        & " inner join AreaMast on PatMast.PttAraCode = AreaMast.AraCode)" _
        & " inner join StsnMast on PatMast.PttStnCode = StsnMast.StnCode)" _
        & " inner join LabHdr on PatMast.PttCode = LabHdr.LhrPttCode" _
        & " where (LhrBalAmt <> 0)" _
        & IIf(mFiltCond <> "", " and " & mFiltCond, "") _
        & " order by LhrCode" _
        , dbComDatabase, adOpenKeyset, adLockOptimistic
    If mListSqlExpr = "" Then
        LRecset.open "Select PatMast.PttCode,PatMast.PttRegNo,PatMast.PttName,LabHdr.LhrCode,LabHdr.LhrVchNo,LabHdr.LhrDate" _
            & ",cstr(PatMast.PttRegNo)+'_'+format(LabHdr.LhrCode,'" & cLONGCODESTRFMT & "') as PttRegNoUnq,PatMast.PttRefName,PatMast.PttAddr,PttTelNo+';'+PttSmsNo as PttContNo,AreaMast.AraName,StsnMast.StnName" _
            & " from ((PatMast" _
            & " inner join AreaMast on PatMast.PttAraCode = AreaMast.AraCode)" _
            & " inner join StsnMast on PatMast.PttStnCode = StsnMast.StnCode)" _
            & " inner join LabHdr on PatMast.PttCode = LabHdr.LhrPttCode" _
            & " where (LhrBalAmt <> 0)" _
            & IIf(mFiltCond <> "", " and " & mFiltCond, "") _
            & " order by PttRegNo,LhrDate desc,LhrCode,PttCode" _
            , dbComDatabase, adOpenKeyset, adLockOptimistic
    Else
        LRecset.open mListSqlExpr, dbComDatabase, adOpenKeyset, adLockOptimistic
    End If
    
    fcmb.ReInit
    
ElseIf blnDueLrcListByPttName = True Then
    BRecset.open "Select PatMast.PttCode,PatMast.PttName,PatMast.PttRegNo,LabHdr.LhrCode,LabHdr.LhrVchNo,LabHdr.LhrDate" _
        & ",PatMast.PttName+'_'+format(LabHdr.LhrCode,'" & cLONGCODESTRFMT & "') as PttNameUnq,PatMast.PttRefName,PatMast.PttAddr,PttTelNo+';'+PttSmsNo as PttContNo,AreaMast.AraName,StsnMast.StnName" _
        & " from ((PatMast" _
        & " inner join AreaMast on PatMast.PttAraCode = AreaMast.AraCode)" _
        & " inner join StsnMast on PatMast.PttStnCode = StsnMast.StnCode)" _
        & " inner join LabHdr on PatMast.PttCode = LabHdr.LhrPttCode" _
        & " where (LhrBalAmt <> 0)" _
        & IIf(mFiltCond <> "", " and " & mFiltCond, "") _
        & " order by LhrCode" _
        , dbComDatabase, adOpenKeyset, adLockOptimistic
    If mListSqlExpr = "" Then
        LRecset.open "Select PatMast.PttCode,PatMast.PttName,PatMast.PttRegNo,LabHdr.LhrCode,LabHdr.LhrVchNo,LabHdr.LhrDate" _
            & ",PatMast.PttName+'_'+format(LabHdr.LhrCode,'" & cLONGCODESTRFMT & "') as PttNameUnq,PatMast.PttRefName,PatMast.PttAddr,PttTelNo+';'+PttSmsNo as PttContNo,AreaMast.AraName,StsnMast.StnName" _
            & " from ((PatMast" _
            & " inner join AreaMast on PatMast.PttAraCode = AreaMast.AraCode)" _
            & " inner join StsnMast on PatMast.PttStnCode = StsnMast.StnCode)" _
            & " inner join LabHdr on PatMast.PttCode = LabHdr.LhrPttCode" _
            & " where (LhrBalAmt <> 0)" _
            & IIf(mFiltCond <> "", " and " & mFiltCond, "") _
            & " order by PttName,LhrDate desc,LhrCode,PttCode" _
            , dbComDatabase, adOpenKeyset, adLockOptimistic
    Else
        LRecset.open mListSqlExpr, dbComDatabase, adOpenKeyset, adLockOptimistic
    End If
    
    fcmb.ReInit
    
Rem -------------------------------------------------------------------------------------------------------------
ElseIf blnSubItmMastList = True Then
    BRecset.open fcmb.TableName, dbHmsDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect
    BRecset.Index = fcmb.BoundField
    If mListSqlExpr = "" Then
        LRecset.open "Select SubItmMast.*,SubItmGrpMst.SigName from (SubItmMast" _
            & " inner join ProdMast on SubItmMast.SimItmCode = ProdMast.ItmCode)" _
            & " inner join SubItmGrpMst on SubItmMast.SimSigCode = SubItmGrpMst.SigCode" _
            & IIf(mFiltCond <> "", " where " & mFiltCond, "") _
            & " order by SimName", dbComDatabase, adOpenKeyset, adLockOptimistic
    Else
        LRecset.open mListSqlExpr, dbComDatabase, adOpenKeyset, adLockOptimistic
    End If
    fcmb.ReInit
    
ElseIf blnSubItmGrpMastList = True Then
    BRecset.open fcmb.TableName, dbHmsDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect
    BRecset.Index = fcmb.BoundField
    If mListSqlExpr = "" Then
        LRecset.open "Select SubItmGrpMst.* from SubItmGrpMst" & IIf(mFiltCond <> "", " where " & mFiltCond, "") & " order by SigName", dbHmsDatabase, adOpenKeyset, adLockOptimistic
    Else
        LRecset.open mListSqlExpr, dbHmsDatabase, adOpenKeyset, adLockOptimistic
    End If
    fcmb.ReInit
    
ElseIf blnBalSimRefNoList = True Then
    If mBoundSqlExpr = "" Then
        BRecset.open "Select *,SimRefNo+'_'+format(ItrCode,'" & cLONGCODESTRFMT & "') as SimRefNoUnq from (" _
            & "Select SimRefNo,ItrCode,sum(Qty) as Qty_sum from (" _
            & "Select PurItrCode as ItrCode,PurSimRefNo as SimRefNo,PurQty as Qty from MedPurchDtl" _
            & " inner join MedPurchHdr on MedPurchDtl.PurCode = MedPurchHdr.PuhCode" _
            & IIf(mFiltCond <> "", " where " & mFiltCond, "") _
            & " Union All " _
            & "Select SalItrCode as ItrCode,SalSimRefNo as SimRefNo,(SalQty*-1) as Qty from MedSaleDtl" _
            & " inner join MedSaleHdr on MedSaleDtl.SalCode = MedSaleHdr.SahCode" _
            & IIf(mFiltCond <> "", " where " & mFiltCond, "") _
            & ")" _
            & " group by ItrCode,SimRefNo order by ItrCode,SimRefNo" _
            & ") as t1 inner join ProdRef on t1.ItrCode = ProdRef.ItrRefCode" _
            & " where Qty_sum > 0" _
            , dbComDatabase, adOpenKeyset, adLockOptimistic
    Else
        BRecset.open mBoundSqlExpr, dbComDatabase, adOpenKeyset, adLockOptimistic
    End If
    If mListSqlExpr = "" Then
        LRecset.open "Select *,SimRefNo+'_'+format(ItrCode,'" & cLONGCODESTRFMT & "') as SimRefNoUnq from (" _
            & "Select SimRefNo,ItrCode,sum(Qty) as Qty_sum from (" _
            & "Select PurItrCode as ItrCode,PurSimRefNo as SimRefNo,PurQty as Qty from MedPurchDtl" _
            & " inner join MedPurchHdr on MedPurchDtl.PurCode = MedPurchHdr.PuhCode" _
            & IIf(mFiltCond <> "", " where " & mFiltCond, "") _
            & " Union All " _
            & "Select SalItrCode as ItrCode,SalSimRefNo as SimRefNo,(SalQty*-1) as Qty from MedSaleDtl" _
            & " inner join MedSaleHdr on MedSaleDtl.SalCode = MedSaleHdr.SahCode" _
            & IIf(mFiltCond <> "", " where " & mFiltCond, "") _
            & ")" _
            & " group by SimRefNo,ItrCode order by SimRefNo,ItrCode" _
            & ") as t1 inner join ProdRef on t1.ItrCode = ProdRef.ItrRefCode" _
            & " where Qty_sum > 0" _
            , dbComDatabase, adOpenKeyset, adLockOptimistic
    Else
        LRecset.open mListSqlExpr, dbComDatabase, adOpenKeyset, adLockOptimistic
    End If
    fcmb.ReInit
    
ElseIf blnPartyMastList = True Then
    BRecset.open fcmb.TableName, dbHmsDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect
    BRecset.Index = fcmb.BoundField
    If mListSqlExpr = "" Then
        LRecset.open "Select PartyMast.*,AreaMast.AraName,StsnMast.StnName,AchdMast.AhName from ((PartyMast inner join AreaMast on PartyMast.PrtAraCode=AreaMast.AraCode) inner join StsnMast on PartyMast.PrtStnCode=StsnMast.StnCode) inner join AchdMast on PartyMast.PrtAhCode=AchdMast.AhCode" & IIf(mFiltCond <> "", " where " & mFiltCond, "") & " order by PrtName", dbComDatabase, adOpenKeyset, adLockOptimistic
    Else
        LRecset.open mListSqlExpr, dbComDatabase, adOpenKeyset, adLockOptimistic
    End If
    fcmb.ReInit
    
ElseIf blnPartyGrpMastList = True Then
    BRecset.open fcmb.TableName, dbHmsDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect
    BRecset.Index = fcmb.BoundField
    If mListSqlExpr = "" Then
        LRecset.open "Select PartyGrpMst.* from PartyGrpMst" & IIf(mFiltCond <> "", " where " & mFiltCond, "") & " order by PgmName", dbHmsDatabase, adOpenKeyset, adLockOptimistic
    Else
        LRecset.open mListSqlExpr, dbHmsDatabase, adOpenKeyset, adLockOptimistic
    End If
    
    fcmb.ReInit
    
Else
    Err.Raise Number:=vbObjectError + 513, Description:="clsHmsFlexSearch_Class_ReInit_799"
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

Rem *************************************** end of class ****************************************
