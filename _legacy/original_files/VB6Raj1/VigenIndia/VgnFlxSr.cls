VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "clsVgnFlexSearch"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False

Option Explicit

Public fcmb As New frmFlexSearchList
Public dbAcDatabase As ADODB.Connection, dbStDatabase As ADODB.Connection, dbVgnDatabase As ADODB.Connection, dbCmpDatabase As ADODB.Connection, dbComDatabase As ADODB.Connection
Public mListSqlExpr As String, mBoundSqlExpr As String, mFiltCond As String
Rem Public mAchdMastList As Boolean, mProdMastList As Boolean
Rem Public mMachOptrList As Boolean, mMachMastList As Boolean, mPackPerList As Boolean, mMatProcMastList As Boolean, mVendMastList As Boolean
Rem Public mEmpMastList As Boolean, mDeptMastList As Boolean, mDesgMastList As Boolean
Public blnUserRoleMastList As Boolean, blnUserMastList As Boolean
Public blnPatMastListByName As Boolean, blnPatMastListByRegNo As Boolean, blnDoctMastList As Boolean, blnDoctRoleMastList As Boolean, blnRefByMastList As Boolean, blnRefToMastList As Boolean, blnDoctCatgMstList As Boolean, blnRefCatgMstList As Boolean, blnPatCatgMstList As Boolean, blnServGrpMstList As Boolean, blnDiagMastList As Boolean, blnServMastList As Boolean
Public blnOldOpgListByOpgNo As Boolean, blnOldOpgListByPttRegNo As Boolean, blnOldOpgListByPttName As Boolean

Rem ----------------------------- store ---------------------------
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
    
    BRecset.open fcmb.TableName, dbVgnDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect
    BRecset.Index = fcmb.BoundField
    If mListSqlExpr = "" Then
        LRecset.open "Select * from " & fcmb.TableName & IIf(mFiltCond <> "", " where " & mFiltCond, "") & " order by " & fcmb.ListField, dbVgnDatabase, adOpenKeyset, adLockOptimistic
    Else
        LRecset.open mListSqlExpr, dbVgnDatabase, adOpenKeyset, adLockOptimistic
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
    
    BRecset.open fcmb.TableName, dbVgnDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect
    BRecset.Index = fcmb.BoundField
    If mListSqlExpr = "" Then
        LRecset.open "Select PatMast.*,PatMast.PttName+'_'+format(PatMast.PttCode,'" & cLONGCODESTRFMT & "') as PttNameUnq,AreaMast.AraName,StsnMast.StnName from (PatMast left join AreaMast on PatMast.PttAraCode=AreaMast.AraCode) left join StsnMast on PatMast.PttStnCode=StsnMast.StnCode" & IIf(mFiltCond <> "", " where " & mFiltCond, "") & " order by PttName,PttCode,PttRegNo", dbComDatabase, adOpenKeyset, adLockOptimistic
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
    fcmb.AddFlexColList mFldName:="PttRefName", mFldTitle:="Care of", mFldWidth:=2500, mFldAlign:=1
    fcmb.AddFlexColList mFldName:="PttTelNo", mFldTitle:="Tel.No", mFldWidth:=1750, mFldAlign:=1
    fcmb.AddFlexColList mFldName:="PttSMSNo", mFldTitle:="SMS.No", mFldWidth:=1750, mFldAlign:=1
    fcmb.AddFlexColList mFldName:="AraName", mFldTitle:="Area", mFldWidth:=2500, mFldAlign:=1
    fcmb.AddFlexColList mFldName:="StnName", mFldTitle:="Station", mFldWidth:=2500, mFldAlign:=1
    
    fcmb.Init
    
ElseIf blnPatMastListByRegNo = True Then
    Load fcmb
    fcmb.lblFormHeading.Caption = "Patient Master"
    fcmb.TableName = "PatMast"
    fcmb.BoundField = "PttCode"
    fcmb.ListField = "PttRegNo"
    fcmb.ListFieldUnq = "PttRegNoUnq"
    fcmb.lblSearchCaption.Caption = "Reg.No:"
    
    BRecset.open fcmb.TableName, dbVgnDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect
    BRecset.Index = fcmb.BoundField
    If mListSqlExpr = "" Then
        LRecset.open "Select PatMast.*,cstr(PatMast.PttRegNo)+'_'+format(PatMast.PttCode,'" & cLONGCODESTRFMT & "') as PttRegNoUnq,AreaMast.AraName,StsnMast.StnName from (PatMast left join AreaMast on PatMast.PttAraCode=AreaMast.AraCode) left join StsnMast on PatMast.PttStnCode=StsnMast.StnCode" & IIf(mFiltCond <> "", " where " & mFiltCond, "") & " order by PttRegNo,PttName", dbComDatabase, adOpenKeyset, adLockOptimistic
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
    fcmb.AddFlexColList mFldName:="PttRefName", mFldTitle:="Care of", mFldWidth:=2500, mFldAlign:=1
    fcmb.AddFlexColList mFldName:="PttTelNo", mFldTitle:="Tel.No", mFldWidth:=1750, mFldAlign:=1
    fcmb.AddFlexColList mFldName:="PttSMSNo", mFldTitle:="SMS.No", mFldWidth:=1750, mFldAlign:=1
    fcmb.AddFlexColList mFldName:="AraName", mFldTitle:="Area", mFldWidth:=2500, mFldAlign:=1
    fcmb.AddFlexColList mFldName:="StnName", mFldTitle:="Station", mFldWidth:=2500, mFldAlign:=1
    
    fcmb.Init
    
ElseIf blnDoctMastList = True Then
    Load fcmb
    fcmb.lblFormHeading.Caption = "Attendant Master"
    fcmb.TableName = "DoctMast"
    fcmb.BoundField = "DctCode"
    fcmb.ListField = "DctName"
    fcmb.lblSearchCaption.Caption = "Name:"
    
    BRecset.open fcmb.TableName, dbVgnDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect
    BRecset.Index = fcmb.BoundField
    If mListSqlExpr = "" Then
        LRecset.open "Select * from " & fcmb.TableName & IIf(mFiltCond <> "", " where " & mFiltCond, "") & " order by " & fcmb.ListField, dbVgnDatabase, adOpenKeyset, adLockOptimistic
    Else
        LRecset.open mListSqlExpr, dbVgnDatabase, adOpenKeyset, adLockOptimistic
    End If
    
    Set fcmb.BRecset = BRecset
    Set fcmb.LRecset = LRecset
    Set fcmb.frmAccessMaster = New frmDoctorMast
    
    fcmb.ClearFlexColList
    fcmb.AddFlexColList mFldName:="DctCode", mFldTitle:="DctCode", mFldWidth:=0, mFldAlign:=7
    fcmb.AddFlexColList mFldName:="DctName", mFldTitle:="Attendant Name", mFldWidth:=3000, mFldAlign:=1
    
    fcmb.Init
    
ElseIf blnDoctRoleMastList = True Then
    Load fcmb
    fcmb.lblFormHeading.Caption = "Attendant Category Master"
    fcmb.TableName = "DoctRoleMst"
    fcmb.BoundField = "DrlCode"
    fcmb.ListField = "DrlName"
    fcmb.lblSearchCaption.Caption = "Name:"
    
    BRecset.open fcmb.TableName, dbVgnDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect
    BRecset.Index = fcmb.BoundField
    If mListSqlExpr = "" Then
        LRecset.open "Select * from " & fcmb.TableName & IIf(mFiltCond <> "", " where " & mFiltCond, "") & " order by " & fcmb.ListField, dbVgnDatabase, adOpenKeyset, adLockOptimistic
    Else
        LRecset.open mListSqlExpr, dbVgnDatabase, adOpenKeyset, adLockOptimistic
    End If
    
    Set fcmb.BRecset = BRecset
    Set fcmb.LRecset = LRecset
    #If APP_VIGEN = True Then
        Set fcmb.frmAccessMaster = New frmDoctorRoleMast
    #End If
    
    fcmb.ClearFlexColList
    fcmb.AddFlexColList mFldName:="DrlCode", mFldTitle:="DrlCode", mFldWidth:=0, mFldAlign:=7
    fcmb.AddFlexColList mFldName:="DrlName", mFldTitle:="Attendant Role", mFldWidth:=3000, mFldAlign:=1
    
    fcmb.Init

ElseIf blnRefByMastList = True Then
    Load fcmb
    fcmb.lblFormHeading.Caption = "Referred By"
    fcmb.TableName = "RefByMast"
    fcmb.BoundField = "RByCode"
    fcmb.ListField = "RByName"
    fcmb.lblSearchCaption.Caption = "Name:"
    
    BRecset.open fcmb.TableName, dbVgnDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect
    BRecset.Index = fcmb.BoundField
    If mListSqlExpr = "" Then
        LRecset.open "Select * from " & fcmb.TableName & IIf(mFiltCond <> "", " where " & mFiltCond, "") & " order by " & fcmb.ListField, dbVgnDatabase, adOpenKeyset, adLockOptimistic
    Else
        LRecset.open mListSqlExpr, dbVgnDatabase, adOpenKeyset, adLockOptimistic
    End If
    
    Set fcmb.BRecset = BRecset
    Set fcmb.LRecset = LRecset
    #If APP_VIGEN = True Then
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
    
    BRecset.open fcmb.TableName, dbVgnDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect
    BRecset.Index = fcmb.BoundField
    If mListSqlExpr = "" Then
        LRecset.open "Select * from " & fcmb.TableName & IIf(mFiltCond <> "", " where " & mFiltCond, "") & " order by " & fcmb.ListField, dbVgnDatabase, adOpenKeyset, adLockOptimistic
    Else
        LRecset.open mListSqlExpr, dbVgnDatabase, adOpenKeyset, adLockOptimistic
    End If
    
    Set fcmb.BRecset = BRecset
    Set fcmb.LRecset = LRecset
    #If APP_VIGEN = True Then
        Set fcmb.frmAccessMaster = New frmRefToMast
    #End If
    
    fcmb.ClearFlexColList
    fcmb.AddFlexColList mFldName:="RToCode", mFldTitle:="RToCode", mFldWidth:=0, mFldAlign:=7
    fcmb.AddFlexColList mFldName:="RToName", mFldTitle:="Referred To Name", mFldWidth:=3000, mFldAlign:=1
    
    fcmb.Init
    
ElseIf blnDoctCatgMstList = True Then
    Load fcmb
    fcmb.lblFormHeading.Caption = "Attendant Category Master"
    fcmb.TableName = "DoctCatgMst"
    fcmb.BoundField = "DcgCode"
    fcmb.ListField = "DcgName"
    fcmb.lblSearchCaption.Caption = "Name:"
    
    BRecset.open fcmb.TableName, dbVgnDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect
    BRecset.Index = fcmb.BoundField
    If mListSqlExpr = "" Then
        LRecset.open "Select * from " & fcmb.TableName & IIf(mFiltCond <> "", " where " & mFiltCond, "") & " order by " & fcmb.ListField, dbVgnDatabase, adOpenKeyset, adLockOptimistic
    Else
        LRecset.open mListSqlExpr, dbVgnDatabase, adOpenKeyset, adLockOptimistic
    End If
    
    Set fcmb.BRecset = BRecset
    Set fcmb.LRecset = LRecset
    Set fcmb.frmAccessMaster = New frmDoctorCatgMast
    
    fcmb.ClearFlexColList
    fcmb.AddFlexColList mFldName:="DcgCode", mFldTitle:="DcgCode", mFldWidth:=0, mFldAlign:=7
    fcmb.AddFlexColList mFldName:="DcgName", mFldTitle:="Attendant Category", mFldWidth:=3000, mFldAlign:=1
    
    fcmb.Init
    
ElseIf blnRefCatgMstList = True Then
    Load fcmb
    fcmb.lblFormHeading.Caption = "Referred Category Master"
    fcmb.TableName = "RefCatgMst"
    fcmb.BoundField = "RfgCode"
    fcmb.ListField = "RfgName"
    fcmb.lblSearchCaption.Caption = "Name:"
    
    BRecset.open fcmb.TableName, dbVgnDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect
    BRecset.Index = fcmb.BoundField
    If mListSqlExpr = "" Then
        LRecset.open "Select * from " & fcmb.TableName & IIf(mFiltCond <> "", " where " & mFiltCond, "") & " order by " & fcmb.ListField, dbVgnDatabase, adOpenKeyset, adLockOptimistic
    Else
        LRecset.open mListSqlExpr, dbVgnDatabase, adOpenKeyset, adLockOptimistic
    End If
    
    Set fcmb.BRecset = BRecset
    Set fcmb.LRecset = LRecset
    #If APP_VIGEN = True Then
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
    
    BRecset.open fcmb.TableName, dbVgnDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect    ' SgpShowInList=True
    BRecset.Index = fcmb.BoundField
    If mListSqlExpr = "" Then
        LRecset.open "Select * from " & fcmb.TableName & " where SgpShowInList=True" & IIf(mFiltCond <> "", mFiltCond, "") & " order by " & fcmb.ListField, dbVgnDatabase, adOpenKeyset, adLockOptimistic
    Else
        LRecset.open mListSqlExpr, dbVgnDatabase, adOpenKeyset, adLockOptimistic
    End If
    
    Set fcmb.BRecset = BRecset
    Set fcmb.LRecset = LRecset
    #If APP_VIGEN = True Then
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
    
    BRecset.open fcmb.TableName, dbVgnDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect    ' SrvShowInList=True
    BRecset.Index = fcmb.BoundField
    If mListSqlExpr = "" Then
        LRecset.open "Select * from " & fcmb.TableName & " where SrvShowInList=True" & IIf(mFiltCond <> "", mFiltCond, "") & " order by " & fcmb.ListField, dbVgnDatabase, adOpenKeyset, adLockOptimistic
    Else
        LRecset.open mListSqlExpr, dbVgnDatabase, adOpenKeyset, adLockOptimistic
    End If
    
    Set fcmb.BRecset = BRecset
    Set fcmb.LRecset = LRecset
    #If APP_VIGEN = True Then
        Set fcmb.frmAccessMaster = New frmServiceMast
    #End If
    
    fcmb.ClearFlexColList
    fcmb.AddFlexColList mFldName:="SrvCode", mFldTitle:="SrvCode", mFldWidth:=0, mFldAlign:=7
    fcmb.AddFlexColList mFldName:="SrvName", mFldTitle:="Service Name", mFldWidth:=3000, mFldAlign:=1
    fcmb.AddFlexColList mFldName:="SrvRate", mFldTitle:="Charges", mFldWidth:=1000, mFldAlign:=7
    
    fcmb.Init
    
ElseIf blnDiagMastList = True Then
    Load fcmb
    fcmb.lblFormHeading.Caption = "Diagnostic Master"
    fcmb.TableName = "DiagMast"
    fcmb.BoundField = "DigCode"
    fcmb.ListField = "DigName"
    fcmb.lblSearchCaption.Caption = "Name:"
    
    BRecset.open fcmb.TableName, dbVgnDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect
    BRecset.Index = fcmb.BoundField
    If mListSqlExpr = "" Then
        LRecset.open "Select * from " & fcmb.TableName & IIf(mFiltCond <> "", " where " & mFiltCond, "") & " order by " & fcmb.ListField, dbVgnDatabase, adOpenKeyset, adLockOptimistic
    Else
        LRecset.open mListSqlExpr, dbVgnDatabase, adOpenKeyset, adLockOptimistic
    End If
    
    Set fcmb.BRecset = BRecset
    Set fcmb.LRecset = LRecset
    #If APP_VIGEN = True Then
        Set fcmb.frmAccessMaster = New frmDiagnosticMast
    #End If
    
    fcmb.ClearFlexColList
    fcmb.AddFlexColList mFldName:="DigCode", mFldTitle:="DigCode", mFldWidth:=0, mFldAlign:=7
    fcmb.AddFlexColList mFldName:="DigName", mFldTitle:="Diagnosis", mFldWidth:=3000, mFldAlign:=1
    
    fcmb.Init
   
ElseIf blnOldOpgListByOpgNo = True Then
    Load fcmb
    fcmb.lblFormHeading.Caption = "Old Outdoor List by Opd No."
    fcmb.TableName = "OutdReg"
    fcmb.BoundField = "OpgCode"
    fcmb.ListField = "OpgVchNo"
    fcmb.ListFieldUnq = "OpgVchNoUnq"
    fcmb.lblSearchCaption.Caption = "No.:"
    
    BRecset.open fcmb.TableName, dbVgnDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect
    BRecset.Index = fcmb.BoundField
    If mListSqlExpr = "" Then
        LRecset.open "Select OutdReg.OpgCode,OutdReg.OpgVchNo,OutdReg.OpgDate,cstr(OutdReg.OpgVchNo)+'_'+format(OutdReg.OpgCode,'" & cLONGCODESTRFMT & "') as OpgVchNoUnq,PatMast.PttName,PatMast.PttRegNo,PatMast.PttRefName,AreaMast.AraName,StsnMast.StnName from ((OutdReg inner join PatMast on OutdReg.OpgPttCode=PatMast.PttCode) inner join AreaMast on PatMast.PttAraCode=AreaMast.AraCode) inner join StsnMast on PatMast.PttStnCode=StsnMast.StnCode" & IIf(mFiltCond <> "", " where " & mFiltCond, "") & " order by OpgVchNo,OpgCode", dbComDatabase, adOpenKeyset, adLockOptimistic
    Else
        LRecset.open mListSqlExpr, dbComDatabase, adOpenKeyset, adLockOptimistic
    End If
    
    Set fcmb.BRecset = BRecset
    Set fcmb.LRecset = LRecset
    #If APP_VIGEN = True Then
        Set fcmb.frmAccessMaster = New frmOutdoorReg
    #End If
    
    fcmb.ClearFlexColList
    fcmb.AddFlexColList mFldName:="OpgCode", mFldTitle:="OpgCode", mFldWidth:=0, mFldAlign:=7
    fcmb.AddFlexColList mFldName:="OpgVchNo", mFldTitle:="Opd No", mFldWidth:=1200, mFldAlign:=7
    fcmb.AddFlexColList mFldName:="OpgDate", mFldTitle:="Date", mFldWidth:=1200, mFldAlign:=1
    fcmb.AddFlexColList mFldName:="PttName", mFldTitle:="Patient Name", mFldWidth:=2500, mFldAlign:=1
    fcmb.AddFlexColList mFldName:="PttRegNo", mFldTitle:="PttRegNo", mFldWidth:=1200, mFldAlign:=7
    fcmb.AddFlexColList mFldName:="PttRefName", mFldTitle:="Care of", mFldWidth:=2000, mFldAlign:=1
    fcmb.AddFlexColList mFldName:="AraName", mFldTitle:="Area", mFldWidth:=1750, mFldAlign:=1
    fcmb.AddFlexColList mFldName:="StnName", mFldTitle:="Station", mFldWidth:=1750, mFldAlign:=1
    
    fcmb.Init
    
ElseIf blnOldOpgListByPttRegNo = True Then
    Load fcmb
    fcmb.lblFormHeading.Caption = "Old Outdoor List by Patient Reg.No."
    fcmb.TableName = "PatMast"
    fcmb.BoundField = "PttCode"
    fcmb.ListField = "PttRegNo"
    fcmb.ListFieldUnq = "PttRegNoUnq"
    fcmb.lblSearchCaption.Caption = "Reg.No.:"
    
    BRecset.open fcmb.TableName, dbVgnDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect
    BRecset.Index = fcmb.BoundField
    If mListSqlExpr = "" Then
        LRecset.open "Select PatMast.PttCode,PatMast.PttRegNo,PatMast.PttName,OutdReg.OpgCode,OutdReg.OpgVchNo,OutdReg.OpgDate,cstr(PatMast.PttRegNo)+'_'+format(PatMast.PttCode,'" & cLONGCODESTRFMT & "') as PttRegNoUnq,PatMast.PttRefName,AreaMast.AraName,StsnMast.StnName from ((PatMast inner join OutdReg on PatMast.PttCode=OutdReg.OpgPttCode) inner join AreaMast on PatMast.PttAraCode=AreaMast.AraCode) inner join StsnMast on PatMast.PttStnCode=StsnMast.StnCode" & IIf(mFiltCond <> "", " where " & mFiltCond, "") & " order by PttRegNo,PttCode", dbComDatabase, adOpenKeyset, adLockOptimistic
    Else
        LRecset.open mListSqlExpr, dbComDatabase, adOpenKeyset, adLockOptimistic
    End If
    
    Set fcmb.BRecset = BRecset
    Set fcmb.LRecset = LRecset
    #If APP_VIGEN = True Then
        Set fcmb.frmAccessMaster = New frmOutdoorReg
    #End If
    
    fcmb.ClearFlexColList
    fcmb.AddFlexColList mFldName:="PttCode", mFldTitle:="PttCode", mFldWidth:=0, mFldAlign:=7
    fcmb.AddFlexColList mFldName:="OpgCode", mFldTitle:="OpgCode", mFldWidth:=0, mFldAlign:=7
    fcmb.AddFlexColList mFldName:="PttRegNo", mFldTitle:="Pat.Reg.No", mFldWidth:=1200, mFldAlign:=7
    fcmb.AddFlexColList mFldName:="PttName", mFldTitle:="Patient Name", mFldWidth:=2500, mFldAlign:=1
    fcmb.AddFlexColList mFldName:="OpgVchNo", mFldTitle:="Opd No", mFldWidth:=1200, mFldAlign:=7
    fcmb.AddFlexColList mFldName:="OpgDate", mFldTitle:="Date", mFldWidth:=1200, mFldAlign:=1
    fcmb.AddFlexColList mFldName:="PttRefName", mFldTitle:="Care of", mFldWidth:=2000, mFldAlign:=1
    fcmb.AddFlexColList mFldName:="AraName", mFldTitle:="Area", mFldWidth:=1750, mFldAlign:=1
    fcmb.AddFlexColList mFldName:="StnName", mFldTitle:="Station", mFldWidth:=1750, mFldAlign:=1
    
    fcmb.Init
    
ElseIf blnOldOpgListByPttName = True Then
    Load fcmb
    fcmb.lblFormHeading.Caption = "Old Outdoor List by Patient Name"
    fcmb.TableName = "PatMast"
    fcmb.BoundField = "PttCode"
    fcmb.ListField = "PttName"
    fcmb.ListFieldUnq = "PttNameUnq"
    fcmb.lblSearchCaption.Caption = "Name:"
    
    BRecset.open fcmb.TableName, dbVgnDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect
    BRecset.Index = fcmb.BoundField
    If mListSqlExpr = "" Then
        LRecset.open "Select PatMast.PttCode,PatMast.PttName,PatMast.PttRegNo,OutdReg.OpgCode,OutdReg.OpgVchNo,OutdReg.OpgDate,PatMast.PttName+'_'+format(PatMast.PttCode,'" & cLONGCODESTRFMT & "') as PttNameUnq,PatMast.PttRefName,AreaMast.AraName,StsnMast.StnName from ((PatMast inner join OutdReg on PatMast.PttCode=OutdReg.OpgPttCode) inner join AreaMast on PatMast.PttAraCode=AreaMast.AraCode) inner join StsnMast on PatMast.PttStnCode=StsnMast.StnCode" & IIf(mFiltCond <> "", " where " & mFiltCond, "") & " order by PttName,PttCode", dbComDatabase, adOpenKeyset, adLockOptimistic
    Else
        LRecset.open mListSqlExpr, dbComDatabase, adOpenKeyset, adLockOptimistic
    End If
    
    Set fcmb.BRecset = BRecset
    Set fcmb.LRecset = LRecset
    #If APP_VIGEN = True Then
        Set fcmb.frmAccessMaster = New frmOutdoorReg
    #End If
    
    fcmb.ClearFlexColList
    fcmb.AddFlexColList mFldName:="PttCode", mFldTitle:="PttCode", mFldWidth:=0, mFldAlign:=7
    fcmb.AddFlexColList mFldName:="OpgCode", mFldTitle:="OpgCode", mFldWidth:=0, mFldAlign:=7
    fcmb.AddFlexColList mFldName:="PttName", mFldTitle:="Patient Name", mFldWidth:=2500, mFldAlign:=1
    fcmb.AddFlexColList mFldName:="PttRegNo", mFldTitle:="Pat.Reg.No", mFldWidth:=1200, mFldAlign:=7
    fcmb.AddFlexColList mFldName:="OpgVchNo", mFldTitle:="Opd No", mFldWidth:=1200, mFldAlign:=7
    fcmb.AddFlexColList mFldName:="OpgDate", mFldTitle:="Date", mFldWidth:=1200, mFldAlign:=1
    fcmb.AddFlexColList mFldName:="PttRefName", mFldTitle:="Care of", mFldWidth:=2000, mFldAlign:=1
    fcmb.AddFlexColList mFldName:="AraName", mFldTitle:="Area", mFldWidth:=1750, mFldAlign:=1
    fcmb.AddFlexColList mFldName:="StnName", mFldTitle:="Station", mFldWidth:=1750, mFldAlign:=1
    
    fcmb.Init
    

Rem ------------------------------------------------- store -----------------------------------------
ElseIf blnMedItmMastList = True Then
    Load fcmb
    fcmb.lblFormHeading.Caption = "Item Master"
    fcmb.TableName = "MedItmMast"
    fcmb.BoundField = "MdiCode"
    fcmb.ListField = "MdiName"
    fcmb.lblSearchCaption.Caption = "Name:"
    
    BRecset.open fcmb.TableName, dbVgnDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect
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
    
    BRecset.open fcmb.TableName, dbVgnDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect
    BRecset.Index = fcmb.BoundField
    If mListSqlExpr = "" Then
        LRecset.open "Select MedItmGrpMst.* from MedItmGrpMst order by MigName", dbVgnDatabase, adOpenKeyset, adLockOptimistic
    Else
        LRecset.open mListSqlExpr, dbVgnDatabase, adOpenKeyset, adLockOptimistic
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
    
    BRecset.open fcmb.TableName, dbVgnDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect
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
    
    BRecset.open fcmb.TableName, dbVgnDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect
    BRecset.Index = fcmb.BoundField
    If mListSqlExpr = "" Then
        LRecset.open "Select MedPrtGrpMst.* from MedPrtGrpMst order by MpgName", dbVgnDatabase, adOpenKeyset, adLockOptimistic
    Else
        LRecset.open mListSqlExpr, dbVgnDatabase, adOpenKeyset, adLockOptimistic
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
    fcmb.lblFormHeading.Caption = "Store Sale Bill List by Bill No."
    fcmb.TableName = "MedSaleHdr"
    fcmb.BoundField = "SahCode"
    fcmb.ListField = "SahVchNo"
    fcmb.ListFieldUnq = "SahVchNoUnq"
    fcmb.lblSearchCaption.Caption = "No.:"
    
    BRecset.open fcmb.TableName, dbVgnDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect
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
    Err.Raise Number:=vbObjectError + 513, Description:="clsVgnFlexSearch_Class_Init_425"
    
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
    BRecset.open fcmb.TableName, dbVgnDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect
    BRecset.Index = fcmb.BoundField
    If mListSqlExpr = "" Then
        LRecset.open "Select * from " & fcmb.TableName & IIf(mFiltCond <> "", " where " & mFiltCond, "") & " order by " & fcmb.ListField, dbVgnDatabase, adOpenKeyset, adLockOptimistic
    Else
        LRecset.open mListSqlExpr, dbVgnDatabase, adOpenKeyset, adLockOptimistic
    End If
    fcmb.ReInit
    
ElseIf blnPatMastListByName = True Then
    BRecset.open fcmb.TableName, dbVgnDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect
    BRecset.Index = fcmb.BoundField
    If mListSqlExpr = "" Then
        LRecset.open "Select PatMast.*,PatMast.PttName+'_'+format(PatMast.PttCode,'" & cLONGCODESTRFMT & "') as PttNameUnq,AreaMast.AraName,StsnMast.StnName from (PatMast left join AreaMast on PatMast.PttAraCode=AreaMast.AraCode) left join StsnMast on PatMast.PttStnCode=StsnMast.StnCode" & IIf(mFiltCond <> "", " where " & mFiltCond, "") & " order by PttName,PttCode,PttRegNo", dbComDatabase, adOpenKeyset, adLockOptimistic
    Else
        LRecset.open mListSqlExpr, dbComDatabase, adOpenKeyset, adLockOptimistic
    End If
    fcmb.ReInit
    
ElseIf blnPatMastListByRegNo = True Then
    BRecset.open fcmb.TableName, dbVgnDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect
    BRecset.Index = fcmb.BoundField
    If mListSqlExpr = "" Then
        LRecset.open "Select PatMast.*,cstr(PatMast.PttRegNo)+'_'+format(PatMast.PttCode,'" & cLONGCODESTRFMT & "') as PttRegNoUnq,AreaMast.AraName,StsnMast.StnName from (PatMast left join AreaMast on PatMast.PttAraCode=AreaMast.AraCode) left join StsnMast on PatMast.PttStnCode=StsnMast.StnCode" & IIf(mFiltCond <> "", " where " & mFiltCond, "") & " order by PttRegNo,PttName", dbComDatabase, adOpenKeyset, adLockOptimistic
    Else
        LRecset.open mListSqlExpr, dbComDatabase, adOpenKeyset, adLockOptimistic
    End If
    fcmb.ReInit
    
ElseIf blnDoctMastList = True Then
    BRecset.open fcmb.TableName, dbVgnDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect
    BRecset.Index = fcmb.BoundField
    If mListSqlExpr = "" Then
        LRecset.open "Select * from " & fcmb.TableName & IIf(mFiltCond <> "", " where " & mFiltCond, "") & " order by " & fcmb.ListField, dbVgnDatabase, adOpenKeyset, adLockOptimistic
    Else
        LRecset.open mListSqlExpr, dbVgnDatabase, adOpenKeyset, adLockOptimistic
    End If
    fcmb.ReInit
    
ElseIf blnDoctRoleMastList = True Then
    BRecset.open fcmb.TableName, dbVgnDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect
    BRecset.Index = fcmb.BoundField
    If mListSqlExpr = "" Then
        LRecset.open "Select * from " & fcmb.TableName & IIf(mFiltCond <> "", " where " & mFiltCond, "") & " order by " & fcmb.ListField, dbVgnDatabase, adOpenKeyset, adLockOptimistic
    Else
        LRecset.open mListSqlExpr, dbVgnDatabase, adOpenKeyset, adLockOptimistic
    End If
    fcmb.ReInit
    
ElseIf blnRefByMastList = True Then
    BRecset.open fcmb.TableName, dbVgnDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect
    BRecset.Index = fcmb.BoundField
    If mListSqlExpr = "" Then
        LRecset.open "Select * from " & fcmb.TableName & IIf(mFiltCond <> "", " where " & mFiltCond, "") & " order by " & fcmb.ListField, dbVgnDatabase, adOpenKeyset, adLockOptimistic
    Else
        LRecset.open mListSqlExpr, dbVgnDatabase, adOpenKeyset, adLockOptimistic
    End If
    fcmb.ReInit
    
ElseIf blnRefToMastList = True Then
    BRecset.open fcmb.TableName, dbVgnDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect
    BRecset.Index = fcmb.BoundField
    If mListSqlExpr = "" Then
        LRecset.open "Select * from " & fcmb.TableName & IIf(mFiltCond <> "", " where " & mFiltCond, "") & " order by " & fcmb.ListField, dbVgnDatabase, adOpenKeyset, adLockOptimistic
    Else
        LRecset.open mListSqlExpr, dbVgnDatabase, adOpenKeyset, adLockOptimistic
    End If
    fcmb.ReInit
    
ElseIf blnDoctCatgMstList = True Then
    BRecset.open fcmb.TableName, dbVgnDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect
    BRecset.Index = fcmb.BoundField
    If mListSqlExpr = "" Then
        LRecset.open "Select * from " & fcmb.TableName & IIf(mFiltCond <> "", " where " & mFiltCond, "") & " order by " & fcmb.ListField, dbVgnDatabase, adOpenKeyset, adLockOptimistic
    Else
        LRecset.open mListSqlExpr, dbVgnDatabase, adOpenKeyset, adLockOptimistic
    End If
    fcmb.ReInit
    
ElseIf blnRefCatgMstList = True Then
    BRecset.open fcmb.TableName, dbVgnDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect
    BRecset.Index = fcmb.BoundField
    If mListSqlExpr = "" Then
        LRecset.open "Select * from " & fcmb.TableName & IIf(mFiltCond <> "", " where " & mFiltCond, "") & " order by " & fcmb.ListField, dbVgnDatabase, adOpenKeyset, adLockOptimistic
    Else
        LRecset.open mListSqlExpr, dbVgnDatabase, adOpenKeyset, adLockOptimistic
    End If
    fcmb.ReInit
    
ElseIf blnServGrpMstList = True Then
    BRecset.open fcmb.TableName, dbVgnDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect    ' SgpShowInList=True
    BRecset.Index = fcmb.BoundField
    If mListSqlExpr = "" Then
        LRecset.open "Select * from " & fcmb.TableName & " where SgpShowInList=True" & IIf(mFiltCond <> "", mFiltCond, "") & " order by " & fcmb.ListField, dbVgnDatabase, adOpenKeyset, adLockOptimistic
    Else
        LRecset.open mListSqlExpr, dbVgnDatabase, adOpenKeyset, adLockOptimistic
    End If
    fcmb.ReInit
    
ElseIf blnServMastList = True Then
    BRecset.open fcmb.TableName, dbVgnDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect    ' SrvShowInList=True
    BRecset.Index = fcmb.BoundField
    If mListSqlExpr = "" Then
        LRecset.open "Select * from " & fcmb.TableName & " where SrvShowInList=True" & IIf(mFiltCond <> "", mFiltCond, "") & " order by " & fcmb.ListField, dbVgnDatabase, adOpenKeyset, adLockOptimistic
    Else
        LRecset.open mListSqlExpr, dbVgnDatabase, adOpenKeyset, adLockOptimistic
    End If
    fcmb.ReInit
    
ElseIf blnDiagMastList = True Then
    BRecset.open fcmb.TableName, dbVgnDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect
    BRecset.Index = fcmb.BoundField
    If mListSqlExpr = "" Then
        LRecset.open "Select * from " & fcmb.TableName & IIf(mFiltCond <> "", " where " & mFiltCond, "") & " order by " & fcmb.ListField, dbVgnDatabase, adOpenKeyset, adLockOptimistic
    Else
        LRecset.open mListSqlExpr, dbVgnDatabase, adOpenKeyset, adLockOptimistic
    End If
    fcmb.ReInit
    
ElseIf blnOldOpgListByOpgNo = True Then
    BRecset.open fcmb.TableName, dbVgnDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect
    BRecset.Index = fcmb.BoundField
    If mListSqlExpr = "" Then
        LRecset.open "Select OutdReg.OpgCode,OutdReg.OpgVchNo,OutdReg.OpgDate,OutdReg.OpgVchNo+'_'+format(OutdReg.OpgCode,'" & cLONGCODESTRFMT & "') as OpgVchNoUnq,PatMast.PttName,PatMast.PttRegNo,PatMast.PttRefName,AreaMast.AraName,StsnMast.StnName from ((OutdReg inner join PatMast on OutdReg.OpgPttCode=PatMast.PttCode) inner join AreaMast on PatMast.PttAraCode=AreaMast.AraCode) inner join StsnMast on PatMast.PttStnCode=StsnMast.StnCode" & IIf(mFiltCond <> "", " where " & mFiltCond, "") & " order by OpgVchNo,OpgCode", dbComDatabase, adOpenKeyset, adLockOptimistic
    Else
        LRecset.open mListSqlExpr, dbComDatabase, adOpenKeyset, adLockOptimistic
    End If
    
    fcmb.ReInit
    
ElseIf blnOldOpgListByPttRegNo = True Then
    BRecset.open fcmb.TableName, dbVgnDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect
    BRecset.Index = fcmb.BoundField
    If mListSqlExpr = "" Then
        LRecset.open "Select PatMast.PttCode,PatMast.PttRegNo,PatMast.PttName,OutdReg.OpgCode,OutdReg.OpgVchNo,OutdReg.OpgDate,cstr(PatMast.PttRegNo)+'_'+format(PatMast.PttCode,'" & cLONGCODESTRFMT & "') as PttRegNoUnq,PatMast.PttRefName,AreaMast.AraName,StsnMast.StnName from ((PatMast inner join OutdReg on PatMast.PttCode=OutdReg.OpgPttCode) inner join AreaMast on PatMast.PttAraCode=AreaMast.AraCode) inner join StsnMast on PatMast.PttStnCode=StsnMast.StnCode" & IIf(mFiltCond <> "", " where " & mFiltCond, "") & " order by PttRegNo,PttCode", dbComDatabase, adOpenKeyset, adLockOptimistic
    Else
        LRecset.open mListSqlExpr, dbComDatabase, adOpenKeyset, adLockOptimistic
    End If
    
    fcmb.Init
    
ElseIf blnOldOpgListByPttName = True Then
    BRecset.open fcmb.TableName, dbVgnDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect
    BRecset.Index = fcmb.BoundField
    If mListSqlExpr = "" Then
        LRecset.open "Select PatMast.PttCode,PatMast.PttName,PatMast.PttRegNo,OutdReg.OpgCode,OutdReg.OpgVchNo,OutdReg.OpgDate,PatMast.PttName+'_'+format(PatMast.PttCode,'" & cLONGCODESTRFMT & "') as PttNameUnq,PatMast.PttRefName,AreaMast.AraName,StsnMast.StnName from ((PatMast inner join OutdReg on PatMast.PttCode=OutdReg.OpgPttCode) inner join AreaMast on PatMast.PttAraCode=AreaMast.AraCode) inner join StsnMast on PatMast.PttStnCode=StsnMast.StnCode" & IIf(mFiltCond <> "", " where " & mFiltCond, "") & " order by PttName,PttCode", dbComDatabase, adOpenKeyset, adLockOptimistic
    Else
        LRecset.open mListSqlExpr, dbComDatabase, adOpenKeyset, adLockOptimistic
    End If
    
    fcmb.Init
    
Rem --------------------------- store -----------------------------------------------------
ElseIf blnMedItmMastList = True Then
    BRecset.open fcmb.TableName, dbVgnDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect
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
    BRecset.open fcmb.TableName, dbVgnDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect
    BRecset.Index = fcmb.BoundField
    If mListSqlExpr = "" Then
        LRecset.open "Select MedItmGrpMst.* from MedItmGrpMst order by MigName", dbVgnDatabase, adOpenKeyset, adLockOptimistic
    Else
        LRecset.open mListSqlExpr, dbVgnDatabase, adOpenKeyset, adLockOptimistic
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
    BRecset.open fcmb.TableName, dbVgnDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect
    BRecset.Index = fcmb.BoundField
    If mListSqlExpr = "" Then
        LRecset.open "Select MedPrtMast.*,AreaMast.AraName,StsnMast.StnName,AchdMast.AhName from ((MedPrtMast inner join AreaMast on MedPrtMast.MptAraCode=AreaMast.AraCode) inner join StsnMast on MedPrtMast.MptStnCode=StsnMast.StnCode) inner join AchdMast on MedPrtMast.MptAhCode = AchdMast.AhCode order by MptName", dbComDatabase, adOpenKeyset, adLockOptimistic
    Else
        LRecset.open mListSqlExpr, dbComDatabase, adOpenKeyset, adLockOptimistic
    End If
    fcmb.ReInit
    
ElseIf blnMedPrtGrpMastList = True Then
    BRecset.open fcmb.TableName, dbVgnDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect
    BRecset.Index = fcmb.BoundField
    If mListSqlExpr = "" Then
        LRecset.open "Select MedPrtGrpMst.* from MedPrtGrpMst order by MpgName", dbVgnDatabase, adOpenKeyset, adLockOptimistic
    Else
        LRecset.open mListSqlExpr, dbVgnDatabase, adOpenKeyset, adLockOptimistic
    End If
    
    fcmb.ReInit
    
ElseIf blnOldSalListBySalNo = True Then
    BRecset.open fcmb.TableName, dbVgnDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect
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
    Err.Raise Number:=vbObjectError + 513, Description:="clsVgnFlexSearch_Class_ReInit_799"
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
