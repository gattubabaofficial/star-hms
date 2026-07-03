Attribute VB_Name = "ApplicationMain"
Option Explicit

Public Sub Main()
Dim ws As New WshNetwork

Call InitCommonVar
Call InitPmtVar
Call InitPyrVar
clsVType.AppName = "Hospital"

sAppPath = App.Path
sAppDataPath = sAppPath & "\PmtData"
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
Rem common
RemoveCmpNullValue
RemoveAcNullValue
RemoveStNullValue
RemoveGrpNullValue
RemoveComNullValue

Rem application specific
RemovePmtNullValue
RemovePyrNullValue

InfoBox "Remove Null Value, Done !!!"

End Sub

