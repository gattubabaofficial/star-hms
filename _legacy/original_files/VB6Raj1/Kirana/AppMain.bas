Attribute VB_Name = "ApplicationMain"
Option Explicit

Public Sub Main()
Dim ws As New WshNetwork

Call InitCommonVar
Call InitKgtVar
Call InitPyrVar
clsVType.AppName = "General Trading"

sAppPath = App.Path
sAppDataPath = sAppPath & "\KgtData"
sCmpDataPath = ""
sCmpDatabaseName = "Company.Mdb"

sDefaultDate = Date
sCmpBookStartDate = cUNKNOWNDATE
sCmpBookEndDate = cUNKNOWNDATE
sFinYrStartDate = cUNKNOWNDATE
sFinYrEndDate = cUNKNOWNDATE
sFinYrCmpCode = 0
Call ClearCompanyInfo

Rem getting windows/system settings/names
sWinComputerName = ws.ComputerName
sWinUserName = ws.UserName
Set ws = Nothing

sLoginUIdCode = GetUIdCode("Software Login")

Load frmMain
frmMain.Show
frmMain.ZOrder
frmMain.Hide

ChDir sAppPath
Load frmCompanyMaster
frmCompanyMaster.Show
frmCompanyMaster.ZOrder

End Sub

Public Sub RemoveAppNullValue()
Dim MyProgStatForm As New frmProgressStatus

Load MyProgStatForm
MyProgStatForm.Show
Rem common
RemoveCmpNullValue FormProgStatus:=MyProgStatForm
RemoveAcNullValue FormProgStatus:=MyProgStatForm
RemoveStNullValue FormProgStatus:=MyProgStatForm
RemoveGrpNullValue FormProgStatus:=MyProgStatForm
RemoveComNullValue FormProgStatus:=MyProgStatForm

Rem application specific
RemoveKgtNullValue FormProgStatus:=MyProgStatForm
RemovePyrNullValue FormProgStatus:=MyProgStatForm

Unload MyProgStatForm
Set MyProgStatForm = Nothing

InfoBox "Remove Null Value, Done !!!"

End Sub

