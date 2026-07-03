VERSION 5.00
Begin VB.Form frmTakeBackup 
   Appearance      =   0  'Flat
   BackColor       =   &H80000005&
   BorderStyle     =   1  'Fixed Single
   ClientHeight    =   5505
   ClientLeft      =   15
   ClientTop       =   15
   ClientWidth     =   9555
   ControlBox      =   0   'False
   BeginProperty Font 
      Name            =   "Verdana"
      Size            =   8.25
      Charset         =   0
      Weight          =   700
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   5505
   ScaleWidth      =   9555
   StartUpPosition =   1  'CenterOwner
   Begin VB.TextBox txtVoid 
      CausesValidation=   0   'False
      Height          =   375
      Left            =   0
      TabIndex        =   7
      TabStop         =   0   'False
      Text            =   "Void"
      Top             =   4800
      Width           =   375
   End
   Begin VB.Frame frFormDtl 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      ForeColor       =   &H80000008&
      Height          =   2895
      Left            =   600
      TabIndex        =   5
      Top             =   840
      Width           =   8295
      Begin VB.CommandButton cmdOK 
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFFFF&
         Caption         =   "&OK"
         Height          =   375
         Left            =   3480
         Style           =   1  'Graphical
         TabIndex        =   1
         Top             =   1440
         Width           =   855
      End
      Begin VB.TextBox txtBkpTgtDrivePath 
         Appearance      =   0  'Flat
         Height          =   285
         Left            =   1680
         TabIndex        =   0
         Text            =   "Text1"
         Top             =   360
         Width           =   6375
      End
      Begin VB.Label Label1 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         Caption         =   "Backup Path:"
         ForeColor       =   &H80000008&
         Height          =   285
         Left            =   240
         TabIndex        =   6
         Top             =   360
         Width           =   1335
      End
   End
   Begin VB.CommandButton cmdFormEscape 
      Appearance      =   0  'Flat
      Cancel          =   -1  'True
      Caption         =   "X"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   8040
      MaskColor       =   &H000000FF&
      Style           =   1  'Graphical
      TabIndex        =   3
      TabStop         =   0   'False
      Top             =   0
      Width           =   255
   End
   Begin VB.CommandButton cmdFormEnter 
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      Default         =   -1  'True
      BeginProperty Font 
         Name            =   "Arial Black"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   8760
      MaskColor       =   &H000000FF&
      TabIndex        =   2
      TabStop         =   0   'False
      Top             =   0
      UseMaskColor    =   -1  'True
      Width           =   255
   End
   Begin VB.Label lblFormHeading 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00E0E0E0&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Take Backup"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   14.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   495
      Left            =   0
      TabIndex        =   4
      Top             =   0
      Width           =   9015
   End
End
Attribute VB_Name = "frmTakeBackup"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Dim mFormLoaded As Boolean, mLastKeyPressed As Integer, mMaskKeyPressed As Integer
Dim mBkpSrcFullPathName As String
Dim mBkpTgtDrivePath As String, mBkpTgtFileName As String, mBkpTgtFullPathName As String

Private Sub cmdFormEnter_Click()
mLastKeyPressed = 13
SendKeys "{tab}"

End Sub

Private Sub cmdFormEscape_Click()
mLastKeyPressed = 27

txtVoid.SetFocus
If CanReject() = True Then
    Unload Me
    Exit Sub
    
Else
    txtBkpTgtDrivePath.SetFocus
    
End If

End Sub

Private Sub cmdOK_Click()

mBkpTgtDrivePath = Trim(txtBkpTgtDrivePath.Text)
mBkpTgtFileName = "Kgt_" & MyCompany.mCmpDrive & "_" & Format(Date, "YY") & Format(Date, "MM") & Format(Date, "DD") & ".Ziz"
mBkpTgtFullPathName = Chr(34) & AddBS(mBkpTgtDrivePath) & mBkpTgtFileName & Chr(34)

mBkpSrcFullPathName = AddBS(sCmpDataPath) & "AppBkp.Bkl"

WriteTextToFile mFileFullPath:=mBkpSrcFullPathName, mText:=AddBS(sCmpDataPath) & "*.Mdb// Microsoft Access Database Files", mUnformatted:=True, mFileMode:=cFILEMODE_OUTPUT
WriteTextToFile mFileFullPath:=mBkpSrcFullPathName, mText:=AddBS(sCmpDataPath) & "*.Opt// Runtime Software Options", mUnformatted:=True, mFileMode:=cFILEMODE_APPEND
WriteTextToFile mFileFullPath:=mBkpSrcFullPathName, mText:=AddBS(sCmpDataPath) & "*.Acp// Access Permission Files", mUnformatted:=True, mFileMode:=cFILEMODE_APPEND
WriteTextToFile mFileFullPath:=mBkpSrcFullPathName, mText:=AddBS(sCmpDataPath) & "*.Uid// Unique Id Generation Files", mUnformatted:=True, mFileMode:=cFILEMODE_APPEND
WriteTextToFile mFileFullPath:=mBkpSrcFullPathName, mText:=AddBS(sCmpDataPath) & "*.Old// Old/Last Entry Value Files", mUnformatted:=True, mFileMode:=cFILEMODE_APPEND
WriteTextToFile mFileFullPath:=mBkpSrcFullPathName, mText:=AddBS(sCmpDataPath) & "*.Rpt// Crystal Report Files", mUnformatted:=True, mFileMode:=cFILEMODE_APPEND
WriteTextToFile mFileFullPath:=mBkpSrcFullPathName, mText:=AddBS(sCmpDataPath) & "*.Crl// Crystal Report List", mUnformatted:=True, mFileMode:=cFILEMODE_APPEND

mBkpSrcFullPathName = "@" & Chr(34) & mBkpSrcFullPathName & Chr(34)

Shell sAppPath & "\WinRar.exe a" & Space(1) & mBkpTgtFullPathName & Space(1) & mBkpSrcFullPathName

mBkpTgtFullPathName = Replace(JustPath(mBkpTgtFullPathName), Chr(34), "")
WriteTextToFile AppBkpOldFileFullPath(), mBkpTgtFullPathName

Unload Me

End Sub

Private Sub cmdOK_GotFocus()
FlashActiveControl cmdOK, True
End Sub

Private Sub cmdOK_LostFocus()
FlashActiveControl cmdOK, False
End Sub

Private Sub Form_Activate()
txtBkpTgtDrivePath.SetFocus

End Sub

Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)
mLastKeyPressed = KeyCode
mMaskKeyPressed = Shift

End Sub

Private Sub Form_Load()

Rem SetFormSize Me, frmMain
Call Form_Resize
Call SetVoidControl(txtVoid)

mBkpTgtDrivePath = ""
If FileExist(AppBkpOldFileFullPath()) = False Then
    mBkpTgtDrivePath = AddBS(Left(sAppPath, 2)) & "KgtBackup"
    WriteTextToFile AppBkpOldFileFullPath(), mBkpTgtDrivePath
Else
    mBkpTgtDrivePath = ReadTextFromFile(AppBkpOldFileFullPath())
End If

txtBkpTgtDrivePath.Text = mBkpTgtDrivePath

End Sub

Private Sub Form_Resize()
lblFormHeading.Width = Me.Width
cmdFormEscape.Left = Me.Width - (cmdFormEscape.Width * 2)
cmdFormEnter.Left = Me.Width + cmdFormEscape.Width
frFormDtl.Left = (Me.Width - frFormDtl.Width) / 2: frFormDtl.Top = (Me.Height - frFormDtl.Height) / 2

End Sub

Private Sub txtBkpTgtDrivePath_GotFocus()
FlashActiveControl txtBkpTgtDrivePath, True
End Sub

Private Sub txtBkpTgtDrivePath_LostFocus()
FlashActiveControl txtBkpTgtDrivePath, False
End Sub

Private Sub txtBkpTgtDrivePath_Validate(Cancel As Boolean)
Dim fs As Scripting.FileSystemObject

If Trim(txtBkpTgtDrivePath.Text) = "" Then
    ErrorBox "Invalid Drive / Folder !!!"
    Cancel = True
    txtBkpTgtDrivePath.SetFocus
    
Else
    Set fs = New Scripting.FileSystemObject
    If fs.FolderExists(Trim(txtBkpTgtDrivePath.Text)) = False Then
        ErrorBox "Drive / Folder does not Exist !!!"
        txtBkpTgtDrivePath.SetFocus
        Cancel = True
    End If

End If
Set fs = Nothing

End Sub
