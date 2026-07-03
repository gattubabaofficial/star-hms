VERSION 5.00
Object = "{5E9E78A0-531B-11CF-91F6-C2863C385E30}#1.0#0"; "MSFLXGRD.OCX"
Begin VB.Form frmItemMast 
   Appearance      =   0  'Flat
   BackColor       =   &H80000005&
   ClientHeight    =   8220
   ClientLeft      =   60
   ClientTop       =   60
   ClientWidth     =   13890
   ControlBox      =   0   'False
   BeginProperty Font 
      Name            =   "Verdana"
      Size            =   8.25
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   ScaleHeight     =   8220
   ScaleWidth      =   13890
   ShowInTaskbar   =   0   'False
   Begin VB.Frame frFormDtl 
      Appearance      =   0  'Flat
      BackColor       =   &H007E8049&
      Caption         =   "Detail"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   5175
      Left            =   240
      TabIndex        =   10
      Top             =   1080
      Width           =   10335
      Begin VB.TextBox txtItmDesc 
         Appearance      =   0  'Flat
         BeginProperty DataFormat 
            Type            =   0
            Format          =   "0"
            HaveTrueFalseNull=   0
            FirstDayOfWeek  =   0
            FirstWeekOfYear =   0
            LCID            =   1033
            SubFormatType   =   0
         EndProperty
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   285
         Left            =   2400
         MaxLength       =   50
         TabIndex        =   2
         Top             =   1560
         Width           =   5775
      End
      Begin VB.TextBox mskItmOpValue 
         Alignment       =   1  'Right Justify
         Appearance      =   0  'Flat
         BeginProperty DataFormat 
            Type            =   1
            Format          =   "0"
            HaveTrueFalseNull=   0
            FirstDayOfWeek  =   0
            FirstWeekOfYear =   0
            LCID            =   1033
            SubFormatType   =   1
         EndProperty
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   285
         Left            =   8040
         TabIndex        =   5
         Tag             =   "AhCode"
         Text            =   "0.00"
         Top             =   2160
         Width           =   1695
      End
      Begin VB.TextBox mskItmOpRate 
         Alignment       =   1  'Right Justify
         Appearance      =   0  'Flat
         BeginProperty DataFormat 
            Type            =   1
            Format          =   "0"
            HaveTrueFalseNull=   0
            FirstDayOfWeek  =   0
            FirstWeekOfYear =   0
            LCID            =   1033
            SubFormatType   =   1
         EndProperty
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   285
         Left            =   5280
         TabIndex        =   4
         Tag             =   "AhCode"
         Text            =   "0.00"
         Top             =   2160
         Width           =   1695
      End
      Begin VB.TextBox mskItmOpQty 
         Alignment       =   1  'Right Justify
         Appearance      =   0  'Flat
         BeginProperty DataFormat 
            Type            =   1
            Format          =   "0"
            HaveTrueFalseNull=   0
            FirstDayOfWeek  =   0
            FirstWeekOfYear =   0
            LCID            =   1033
            SubFormatType   =   1
         EndProperty
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   285
         Left            =   2400
         TabIndex        =   3
         Tag             =   "AhCode"
         Text            =   "0.00"
         Top             =   2160
         Width           =   1695
      End
      Begin VB.CommandButton cmdSaveForm 
         Appearance      =   0  'Flat
         BackColor       =   &H80000009&
         Caption         =   "      &Save"
         Height          =   255
         Left            =   7920
         Style           =   1  'Graphical
         TabIndex        =   6
         Top             =   4680
         Width           =   375
      End
      Begin VB.TextBox txtItmName 
         Appearance      =   0  'Flat
         BeginProperty DataFormat 
            Type            =   0
            Format          =   "0"
            HaveTrueFalseNull=   0
            FirstDayOfWeek  =   0
            FirstWeekOfYear =   0
            LCID            =   1033
            SubFormatType   =   0
         EndProperty
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   285
         Left            =   2400
         MaxLength       =   50
         TabIndex        =   1
         Top             =   1080
         Width           =   5775
      End
      Begin VB.TextBox mskFormBoundField 
         Appearance      =   0  'Flat
         BeginProperty DataFormat 
            Type            =   1
            Format          =   "0"
            HaveTrueFalseNull=   0
            FirstDayOfWeek  =   0
            FirstWeekOfYear =   0
            LCID            =   1033
            SubFormatType   =   1
         EndProperty
         Enabled         =   0   'False
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   285
         Left            =   2400
         TabIndex        =   0
         Tag             =   "AhCode"
         Text            =   "-1"
         Top             =   480
         Width           =   1335
      End
      Begin VB.Label Label2 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Description:"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   255
         Index           =   9
         Left            =   840
         TabIndex        =   36
         Top             =   1560
         Width           =   1335
      End
      Begin VB.Label Label2 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Amount:"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   -1  'True
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   255
         Index           =   6
         Left            =   7080
         TabIndex        =   29
         Top             =   2760
         Width           =   975
      End
      Begin VB.Label Label2 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Avg.Rate:"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   -1  'True
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   255
         Index           =   5
         Left            =   4200
         TabIndex        =   28
         Top             =   2760
         Width           =   975
      End
      Begin VB.Label lblItmCurValue 
         Alignment       =   1  'Right Justify
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "0.00"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   -1  'True
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   285
         Left            =   8040
         TabIndex        =   27
         Top             =   2760
         Width           =   1695
      End
      Begin VB.Label lblItmCurRate 
         Alignment       =   1  'Right Justify
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "0.00"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   -1  'True
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   285
         Left            =   5280
         TabIndex        =   26
         Top             =   2760
         Width           =   1695
      End
      Begin VB.Label Label2 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Amount:"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   255
         Index           =   4
         Left            =   7080
         TabIndex        =   25
         Top             =   2160
         Width           =   855
      End
      Begin VB.Label Label2 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Rate:"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   255
         Index           =   3
         Left            =   4200
         TabIndex        =   24
         Top             =   2160
         Width           =   975
      End
      Begin VB.Label lblItmCurQty 
         Alignment       =   1  'Right Justify
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "0.00"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   -1  'True
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   285
         Left            =   2400
         TabIndex        =   23
         Top             =   2760
         Width           =   1695
      End
      Begin VB.Label Label2 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Current Qty:"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   -1  'True
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   255
         Index           =   2
         Left            =   840
         TabIndex        =   22
         Top             =   2760
         Width           =   1455
      End
      Begin VB.Label Label2 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Opening Qty:"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   255
         Index           =   1
         Left            =   840
         TabIndex        =   21
         Top             =   2160
         Width           =   1455
      End
      Begin VB.Label Label2 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Item Name:"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   255
         Index           =   0
         Left            =   840
         TabIndex        =   13
         Top             =   1080
         Width           =   1335
      End
      Begin VB.Label Label1 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Code:"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   255
         Index           =   0
         Left            =   840
         TabIndex        =   12
         Top             =   480
         Width           =   855
      End
   End
   Begin VB.TextBox txtVoid 
      CausesValidation=   0   'False
      Height          =   375
      Left            =   120
      TabIndex        =   7
      TabStop         =   0   'False
      Text            =   "Text1"
      Top             =   7680
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
      TabIndex        =   15
      TabStop         =   0   'False
      Top             =   0
      UseMaskColor    =   -1  'True
      Width           =   255
   End
   Begin VB.CommandButton cmdFormEscape 
      Appearance      =   0  'Flat
      BackColor       =   &H008080FF&
      Cancel          =   -1  'True
      Caption         =   "X"
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
      Left            =   8040
      MaskColor       =   &H000000FF&
      Style           =   1  'Graphical
      TabIndex        =   14
      TabStop         =   0   'False
      Top             =   0
      Width           =   255
   End
   Begin VB.ComboBox cmbFormEntryMode 
      Appearance      =   0  'Flat
      Enabled         =   0   'False
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   315
      ItemData        =   "ProdMast.frx":0000
      Left            =   0
      List            =   "ProdMast.frx":000D
      Style           =   1  'Simple Combo
      TabIndex        =   11
      TabStop         =   0   'False
      Text            =   "cmbFormMode"
      Top             =   360
      Width           =   1455
   End
   Begin VB.Frame frFormSmry 
      Appearance      =   0  'Flat
      BackColor       =   &H007E8049&
      Caption         =   "Summary"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   5175
      Left            =   240
      TabIndex        =   9
      Top             =   840
      Width           =   13215
      Begin VB.Frame frConfigure 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         ForeColor       =   &H80000008&
         Height          =   4095
         Left            =   3720
         TabIndex        =   30
         Top             =   720
         Width           =   6015
         Begin VB.CommandButton cmdConfigure 
            Appearance      =   0  'Flat
            BackColor       =   &H00FFFF80&
            Caption         =   "&OK"
            BeginProperty Font 
               Name            =   "Verdana"
               Size            =   9
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   375
            Left            =   2400
            TabIndex        =   20
            Top             =   3240
            Width           =   855
         End
         Begin VB.CheckBox chkCurBal 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            Caption         =   "Current Balance"
            BeginProperty Font 
               Name            =   "Verdana"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H80000008&
            Height          =   285
            Left            =   1200
            TabIndex        =   19
            Top             =   2520
            Value           =   1  'Checked
            Width           =   3375
         End
         Begin VB.CheckBox chkOpBal 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            Caption         =   "Opening Balance"
            BeginProperty Font 
               Name            =   "Verdana"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H80000008&
            Height          =   285
            Left            =   1200
            TabIndex        =   18
            Top             =   2040
            Value           =   1  'Checked
            Width           =   3375
         End
         Begin VB.CheckBox chkCombinedOpBal 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            Caption         =   "Combined Opening Balance"
            BeginProperty Font 
               Name            =   "Verdana"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H80000008&
            Height          =   285
            Left            =   1200
            TabIndex        =   16
            Top             =   1080
            Value           =   1  'Checked
            Width           =   3375
         End
         Begin VB.CheckBox chkCombinedCurBal 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            Caption         =   "Combined Current Balance"
            BeginProperty Font 
               Name            =   "Verdana"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H80000008&
            Height          =   285
            Left            =   1200
            TabIndex        =   17
            Top             =   1560
            Value           =   1  'Checked
            Width           =   3375
         End
         Begin VB.Label Label2 
            Alignment       =   2  'Center
            Appearance      =   0  'Flat
            BackColor       =   &H00E0E0E0&
            BorderStyle     =   1  'Fixed Single
            Caption         =   "Configure"
            BeginProperty Font 
               Name            =   "Verdana"
               Size            =   9
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H80000008&
            Height          =   375
            Index           =   7
            Left            =   0
            TabIndex        =   31
            Top             =   0
            Width           =   6015
         End
      End
      Begin VB.TextBox txtSearch1Text 
         Appearance      =   0  'Flat
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   285
         Left            =   1080
         TabIndex        =   32
         Top             =   360
         Width           =   4695
      End
      Begin VB.TextBox txtList1Col 
         Appearance      =   0  'Flat
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   285
         Index           =   0
         Left            =   240
         MousePointer    =   1  'Arrow
         TabIndex        =   34
         TabStop         =   0   'False
         Top             =   1680
         Width           =   1335
      End
      Begin MSFlexGridLib.MSFlexGrid Mfgrd1 
         Height          =   4050
         Left            =   225
         TabIndex        =   33
         Top             =   780
         Width           =   12465
         _ExtentX        =   21987
         _ExtentY        =   7144
         _Version        =   393216
         RowHeightMin    =   315
         FocusRect       =   2
         HighLight       =   2
         SelectionMode   =   1
         Appearance      =   0
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
      End
      Begin VB.Label Label1 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Search:"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   255
         Index           =   1
         Left            =   240
         TabIndex        =   35
         Top             =   360
         Width           =   735
      End
   End
   Begin VB.Label lblFormHeading 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00E0E0E0&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Product Master"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   375
      Left            =   0
      TabIndex        =   8
      Top             =   0
      Width           =   9015
   End
End
Attribute VB_Name = "frmItemMast"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Dim FormLoaded As Boolean, mLastKeyPressed As Integer, mMaskKeyPressed As Integer
Dim mItmCode As Long
Dim mRemoteAccess As Boolean, mEntrySaved As Boolean, mEntryAborted As Boolean
Dim dbStDatabase As New ADODB.Connection, dbGrpDatabase As New ADODB.Connection, datRecset As New ADODB.Recordset
Dim mItmName_old As String
Dim clsIT As clsProduct, mActiveControl As Object, clsListStru As clsSelectQueryStructure

Private Type SmryPara
mCombinedOpBal As Integer
mCombinedCurBal As Integer
mOpBal As Integer
mCurBal As Integer
mRowIndex() As Variant

End Type

Dim OldSmryPara As SmryPara

Private Sub RestoreOldSmryPara()
chkCombinedOpBal.Value = OldSmryPara.mCombinedOpBal
chkCombinedCurBal.Value = OldSmryPara.mCombinedCurBal
chkOpBal.Value = OldSmryPara.mOpBal
chkCurBal.Value = OldSmryPara.mCurBal

End Sub

Private Sub RestoreDefaultSmryPara()
chkCombinedOpBal.Value = 1
chkCombinedCurBal.Value = 1
chkOpBal.Value = 1
chkCurBal.Value = 1

End Sub

Private Sub SaveSmryPara()
OldSmryPara.mCombinedOpBal = chkCombinedOpBal.Value
OldSmryPara.mCombinedCurBal = chkCombinedCurBal.Value
OldSmryPara.mOpBal = chkOpBal.Value
OldSmryPara.mCurBal = chkCurBal.Value

End Sub

Public Property Let RemoteAccessCode(ByVal mAccessCode As Long)
mRemoteAccess = True
mItmCode = mAccessCode
End Property

Public Property Get EntryBoundCode() As Long
EntryBoundCode = Val(mskFormBoundField.Text)
End Property

Public Property Get EntrySaved() As Boolean
EntrySaved = mEntrySaved
End Property

Public Property Get EntryAborted() As Boolean
EntryAborted = mEntryAborted
End Property

Public Property Get ItmName() As String
ItmName = txtItmName.Text
End Property

Public Property Get FormAddEditMode() As Integer
FormAddEditMode = cmbFormEntryMode.ListIndex
End Property

Public Property Let FormAddEditMode(ByVal New_FormEntryMode As Integer)
cmbFormEntryMode.ListIndex = New_FormEntryMode
ChkEntryModeSign cmbFormEntryMode

End Property

Public Property Get SecuMenuName() As String
SecuMenuName = Me.Name
End Property

Private Sub chkCombinedCurBal_GotFocus()
FlashActiveControl chkCombinedCurBal, True
End Sub

Private Sub chkCombinedCurBal_LostFocus()
FlashActiveControl chkCombinedCurBal, False
End Sub

Private Sub chkCombinedOpBal_GotFocus()
FlashActiveControl chkCombinedOpBal, True
End Sub

Private Sub chkCombinedOpBal_LostFocus()
FlashActiveControl chkCombinedOpBal, False
End Sub

Private Sub chkCurBal_GotFocus()
FlashActiveControl chkCurBal, True
End Sub

Private Sub chkCurBal_LostFocus()
FlashActiveControl chkCurBal, False
End Sub

Private Sub chkOpBal_GotFocus()
FlashActiveControl chkOpBal, True
End Sub

Private Sub chkOpBal_LostFocus()
FlashActiveControl chkOpBal, False
End Sub

Private Sub cmdConfigure_Click()
Call SaveSmryPara

Call SmryList
MoveRecToLast datRecset
txtVoid.SetFocus
Mfgrd1.Enabled = True
frConfigure.Visible = False
Mfgrd1.SetFocus
End Sub

Private Sub cmdFormEnter_Click()
mLastKeyPressed = 13
If FormAddEditMode = cFORM_SMRYMODE And frConfigure.Visible = False Then
    With datRecset
    If .EOF = False And .BOF = False Then
        Call Data_EditEvent
    Else
        Call Data_AddEvent
    End If
    End With
Else
    SendKeys "{tab}"
End If

End Sub

Private Sub cmdFormEscape_Click()
Dim srow As Long, mRecAbsPos As Long
mLastKeyPressed = 27
If frConfigure.Visible = True Then
    txtVoid.SetFocus
    Mfgrd1.Enabled = True
    frConfigure.Visible = False
    Mfgrd1.SetFocus
    Call RestoreOldSmryPara
ElseIf FormAddEditMode = cFORM_SMRYMODE Then
    If Len(txtSearch1Text.Text) > 0 Then
        txtSearch1Text.Text = ""
        Call txtSearch1Text_InterActiveChange
    Else
        Unload Me
    End If
Else
    txtVoid.SetFocus
    If CanReject() = True Then
        mEntryAborted = True
        mRecAbsPos = datRecset.AbsolutePosition
        Call Data_CancelEvent
        Call SmryList
        If datRecset.RecordCount > mRecAbsPos And mRecAbsPos > 0 Then
            datRecset.Move mRecAbsPos - 1, 1
        Else
            MoveRecToLast datRecset
        End If
        ShowRecActiveFlexRow datRecset, Mfgrd1
        
        Call ShowEntryMode(False)
        If mRemoteAccess = True Then
            Me.Hide
            ''Unload Me
            Exit Sub
        Else
            Mfgrd1.SetFocus
        End If
    Else
        txtItmName.SetFocus
    End If
End If

End Sub

Private Sub cmdSaveForm_Click()
Call Data_SaveEvent

Call SmryList
txtSearch1Text_InterActiveChange txtItmName.Text

''If txtSearch1Text.Text <> txtItmName.Text Then
''    txtSearch1Text.Text = txtItmName.Text
''Else
''    Call txtSearch1Text_Change
''End If
''datRecset.Find "ItmName='" & txtItmName.Text & "'", Start:=1
''ShowRecActiveFlexRow datRecset, Mfgrd1

ShowEntryMode False
Mfgrd1.SetFocus

End Sub

Private Sub cmdSaveForm_GotFocus()
txtVoid.SetFocus
cmdSaveForm.Enabled = False
If Data_Verify() = True Then
    If CanAccept() = True Then
        Call cmdSaveForm_Click
        If mRemoteAccess = True Then
            Me.Hide
            Exit Sub
        End If
    Else
        txtItmName.SetFocus
    End If
End If
cmdSaveForm.Enabled = True

End Sub

Private Sub Form_Activate()
If FormLoaded = False Then
    If mRemoteAccess = True Then
        If mItmCode = 0 Then
            Call Data_AddEvent
        Else
            Call Data_EditEvent
        End If
    Else
        MoveRecToFirst datRecset
        ShowRecActiveFlexRow datRecset, Mfgrd1
        Mfgrd1.SetFocus
    End If
Else

End If

FormLoaded = True
End Sub

Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)
mLastKeyPressed = KeyCode
mMaskKeyPressed = Shift
''If ActiveControl.Name = Mfgrd1.Name Then
''    If InList(KeyCode, Array(vbKeyDown, vbKeyUp, vbKeyPageDown, vbKeyPageUp)) = True And Shift = 0 Then
''        Mfgrd1_KeyDown KeyCode, Shift
''        KeyCode = 0
''    End If
''End If

Select Case KeyCode
Case vbKeyPageDown
    If FormAddEditMode <> cFORM_SMRYMODE Then
        Call cmdSaveForm_GotFocus
    End If
End Select

End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)
mLastKeyPressed = KeyAscii

End Sub

Private Sub Form_Load()
Dim colcnt As Integer
FormLoaded = False
mEntrySaved = False: mEntryAborted = False
SetFormSize Me, frmMain
Call Form_Resize

Call SetVoidControl(txtVoid)
mskItmOpValue.Enabled = False
frConfigure.Visible = False
txtSearch1Text.Enabled = False

Call RestoreDefaultSmryPara
Call SaveSmryPara

OpenStDataSource dbStDatabase
OpenGrpDataSource dbGrpDatabase

Set clsIT = New clsProduct
Set clsIT.dbStDatabase = dbStDatabase
Set clsIT.dbGrpDatabase = dbGrpDatabase
Set clsListStru = New clsSelectQueryStructure

datRecset.open "Select * from ProdMast order by ItmName", dbStDatabase, adOpenKeyset, adLockOptimistic
Call SmryList

Call ShowEntryMode(False)

End Sub

Private Sub Form_Resize()
lblFormHeading.Width = Me.Width
cmdFormEscape.Left = Me.Width - (cmdFormEscape.Width * 2)
cmdFormEnter.Left = Me.Width + cmdFormEscape.Width
frFormSmry.Left = (Me.Width - frFormSmry.Width) / 2: frFormSmry.Top = cmbFormEntryMode.Top + (cmbFormEntryMode.Height * 2)
frFormDtl.Left = (Me.Width - frFormDtl.Width) / 2: frFormDtl.Top = frFormSmry.Top

End Sub

Private Sub Form_Unload(Cancel As Integer)
Set clsIT = Nothing
Set clsListStru = Nothing

CloseTable datRecset
CloseDataSource dbStDatabase
CloseDataSource dbGrpDatabase
End Sub

Private Sub ShowEntryMode(ByVal EntryMode As Boolean)
If Me.Visible = True Then
    txtVoid.SetFocus
End If
frFormSmry.Visible = Not EntryMode: frFormSmry.Enabled = Not EntryMode
frFormDtl.Visible = EntryMode: frFormDtl.Enabled = EntryMode
cmdSaveForm.Enabled = EntryMode
If EntryMode = False Then
    FormAddEditMode = cFORM_SMRYMODE
End If

End Sub

Private Function Data_Verify() As Boolean

Data_Verify = False
If FormAddEditMode = cFORM_EDITMODE And Val(mskFormBoundField.Text) < 1 Then
    ErrorBox "Invalid Key Value !!!"
    txtItmName.SetFocus
    Exit Function
End If
If Trim(txtItmName.Text) = "" Then
    ErrorBox "Invalid Item Name !!!"
    txtItmName.SetFocus
    Exit Function
End If
If txtItmName.Text <> mItmName_old Then
    If ChkIsDuplicate(dbStDatabase, "ProdMast", "ItmName", txtItmName.Text, "ItmCode", Val(mskFormBoundField.Text)) = True Then
        ErrorBox "Duplicate Input !!!"
        txtItmName.SetFocus
        Exit Function
    End If
End If

Data_Verify = True
End Function

Private Sub mskItmOpQty_GotFocus()
FlashActiveControl mskItmOpQty, True
End Sub

Private Sub mskItmOpQty_LostFocus()
FlashActiveControl mskItmOpQty, False
End Sub

Private Sub mskItmOpQty_Validate(Cancel As Boolean)
mskItmOpQty.Text = ToMyStqFmt(UnMyStqFmt(mskItmOpQty.Text))
Call Calc_Value
End Sub

Private Sub mskItmOpRate_GotFocus()
FlashActiveControl mskItmOpRate, True
End Sub

Private Sub mskItmOpRate_LostFocus()
FlashActiveControl mskItmOpRate, False
End Sub

Private Sub mskItmOpRate_Validate(Cancel As Boolean)
mskItmOpRate.Text = ToMyNumFmt(mskItmOpRate.Text, mUseAbs:=True)
Call Calc_Value
End Sub

Private Sub mskItmOpValue_GotFocus()
FlashActiveControl mskItmOpValue, True
End Sub

Private Sub mskItmOpValue_LostFocus()
FlashActiveControl mskItmOpValue, False
End Sub

Private Sub mskItmOpValue_Validate(Cancel As Boolean)
mskItmOpValue.Text = ToMyNumFmt(mskItmOpValue.Text)
End Sub

Private Sub txtItmDesc_GotFocus()
FlashActiveControl txtItmDesc, True
End Sub

Private Sub txtItmDesc_LostFocus()
FlashActiveControl txtItmDesc, False
End Sub

Private Sub txtItmDesc_Validate(Cancel As Boolean)
If txtItmDesc.Text = "" Then
    txtItmDesc.Text = txtItmName.Text
End If
txtItmDesc.Text = ToMyWord(txtItmDesc.Text, False)

End Sub

Private Sub txtItmName_GotFocus()
FlashActiveControl txtItmName, True
End Sub

Private Sub txtItmName_LostFocus()
FlashActiveControl txtItmName, False
End Sub

Private Sub txtItmName_Validate(Cancel As Boolean)
txtItmName.Text = ToMyWord(txtItmName.Text)
If Trim(txtItmName.Text) = "" Then
    ErrorBox "Invalid Input !!!"
    Cancel = True
    txtItmName.SetFocus
Else
    If txtItmName.Text <> mItmName_old Then
        If ChkIsDuplicate(dbStDatabase, "ProdMast", "ItmName", txtItmName.Text, "ItmCode", Val(mskFormBoundField.Text)) = True Then
            ErrorBox "Duplicate Input !!!"
            Cancel = True
            txtItmName.SetFocus
        End If
    End If
End If
If Cancel = False Then
    If txtItmDesc.Text = "" Then
        txtItmDesc.Text = txtItmName.Text
    End If
End If

End Sub

Private Sub Data_AddEvent()

If CanUserAddOpt(mUsrCode:=MyCompany.mUserCode, mMenuOptName:=Me.SecuMenuName) = False Then
    AlertBox "Not Permitted !!!"
    Exit Sub
End If
If clsIT.BeginItem(0) = False Then
    Exit Sub
End If
mEntrySaved = False: mEntryAborted = False
FormAddEditMode = cFORM_ADDMODE

clsIT.Clear
mItmCode = clsIT.ActiveItmCode
mskFormBoundField.Text = mItmCode
txtItmName.Text = ""
txtItmDesc.Text = ""

mskItmOpQty.Text = ToMyStqFmt(0)
mskItmOpRate.Text = ToMyNumFmt(0)
mskItmOpValue.Text = ToMyStvFmt(0)
lblItmCurQty.Caption = ToMyStqFmt(0)
lblItmCurRate.Caption = ToMyNumFmt(0)
lblItmCurValue.Caption = ToMyStvFmt(0)

mItmName_old = txtItmName.Text

Call ShowEntryMode(True)
txtItmName.SetFocus

End Sub

Private Sub Data_EditEvent()
Dim mLCount As Integer, mUCount As Integer, mCount As Integer, mOpnQty As Double, mOpnAvgRate As Double, mOpnValue As Double, mCurQty As Double, mCurAvgRate As Double, mCurValue As Double

If CanUserEditOpt(mUsrCode:=MyCompany.mUserCode, mMenuOptName:=Me.SecuMenuName) = False Then
    AlertBox "Not Permitted !!!"
    Exit Sub
End If
If clsIT.BeginItem(datRecset.fields("ItmCode")) = False Then
    Exit Sub
End If
mEntrySaved = False: mEntryAborted = False
FormAddEditMode = cFORM_EDITMODE
With datRecset
mItmCode = .fields("ItmCode")
clsIT.GetData mItmCode

mskFormBoundField.Text = CStr(mItmCode)
txtItmName.Text = .fields("ItmName")
txtItmDesc.Text = .fields("ItmDesc")
End With

mOpnQty = 0: mOpnAvgRate = 0: mOpnValue = 0
With clsIT
Rem opn stock
mLCount = .LOpnStock
mUCount = .UOpnStock
For mCount = mLCount To mUCount
    mOpnQty = mOpnQty + .OpnQty(mCount)
    mOpnValue = mOpnValue + .OpnValue(mCount)
Next mCount

Rem current stock
mLCount = .LCurStock
mUCount = .UCurStock
For mCount = mLCount To mUCount
    mCurQty = mCurQty + .CurQty(mCount)
    mCurValue = mCurValue + .CurValue(mCount)
Next mCount

End With

If mOpnQty <> 0 And mOpnValue <> 0 Then
    mOpnAvgRate = mOpnValue / mOpnQty
End If
If mCurQty <> 0 And mCurValue <> 0 Then
    mCurAvgRate = mCurValue / mCurQty
End If

mskItmOpQty.Text = ToMyStqFmt(mOpnQty)
mskItmOpRate.Text = ToMyNumFmt(mOpnAvgRate)
mskItmOpValue.Text = ToMyStvFmt(mOpnValue)

lblItmCurQty.Caption = ToMyStqFmt(mCurQty)
lblItmCurRate.Caption = ToMyNumFmt(mCurAvgRate)
lblItmCurValue.Caption = ToMyStvFmt(mCurValue)

mItmName_old = txtItmName.Text

Call ShowEntryMode(True)
txtItmName.SetFocus

End Sub

Private Sub Data_SaveEvent()
Dim mContinueUpdate As Boolean

mContinueUpdate = True
With clsIT
If FormAddEditMode = cFORM_ADDMODE Then
    .Clear
Else
    .GetData mItmCode
End If

.mItmName_str = txtItmName.Text
.mItmDesc_str = txtItmDesc.Text
If FormAddEditMode = cFORM_ADDMODE Then
    .AddOpnStock mStkQty:=Val(UnMyStqFmt(mskItmOpQty.Text)), mStkRate:=Val(UnMyNumFmt(mskItmOpRate.Text)), mStkValue:=Val(UnMyStvFmt(mskItmOpValue.Text))
    .AddProdRef mItrRef1Name:="Opn", mItrRef2Name:="", mItrPRate:=Val(UnMyNumFmt(mskItmOpRate.Text)), mItrMRP:=0, mItrSRate:=0
    
    If .AddNewDtl(mItmCode) = True Then
        If .AddNewHdr() = True Then
            mskFormBoundField.Text = .mItmCode_lng
            mItmCode = .mItmCode_lng
        Else
            mContinueUpdate = False
        End If
    Else
        mContinueUpdate = False
    End If
Else
    .EditOpnStock mStkICode:=.OpnICode(.LOpnStock), mStkQty:=Val(UnMyStqFmt(mskItmOpQty.Text)), mStkRate:=Val(UnMyNumFmt(mskItmOpRate.Text)), mStkValue:=Val(UnMyStvFmt(mskItmOpValue.Text))
    .EditProdRef mItrRefCode:=.ItrRefCode(.LProdRef), mItrRef1Name:=.ItrRef1Name(.LProdRef), mItrRef2Name:=.ItrRef2Name(.LProdRef), mItrPRate:=Val(UnMyNumFmt(mskItmOpRate.Text)), mItrMRP:=.ItrMRP(.LProdRef), mItrSRate:=.ItrSRate(.LProdRef)
    
    If .UpdateDtl(mItmCode) = True Then
        If .UpdateHdr(mItmCode) = True Then
            Rem none
        Else
            mContinueUpdate = False
        End If
    Else
        mContinueUpdate = False
    End If
End If

If mContinueUpdate = True Then   '  .mItmCode_lng > 0  updated successfully
    .CommitItem mItmCode
    .EndItem mItmCode
    
    mEntrySaved = True
Else
    Call Data_CancelEvent
    ErrorBox "Entry Cancelled !!!"
End If

End With

End Sub

Private Sub Data_DeleteEvent()
Dim mDeleteit As Boolean, mRecAbsPos As Long

If CanUserDeleteOpt(mUsrCode:=MyCompany.mUserCode, mMenuOptName:=Me.SecuMenuName) = False Then
    AlertBox "Not Permitted !!!"
    Exit Sub
End If
If (datRecset.EOF Or datRecset.BOF) = True Then
    Exit Sub
End If

mItmCode = datRecset.fields("ItmCode")
mRecAbsPos = datRecset.AbsolutePosition

If clsIT.CanDeleteItem(mItmCode) = True Then
    If clsIT.BeginItem(mItmCode) = True Then
        clsIT.DeleteItem mItmCode
        clsIT.CommitItem mItmCode
        clsIT.EndItem mItmCode
        
        Call SmryList
        If datRecset.RecordCount > mRecAbsPos And mRecAbsPos > 0 Then
            datRecset.Move mRecAbsPos - 1, 1
        Else
            MoveRecToLast datRecset
        End If
    End If
    ShowRecActiveFlexRow datRecset, Mfgrd1
    Mfgrd1.SetFocus
Else
    Mfgrd1.SetFocus
End If

End Sub

Private Sub Data_CancelEvent()
clsIT.CancelItem mItmCode
clsIT.EndItem mItmCode
mEntryAborted = True

End Sub

Private Sub Calc_Value()
With clsIT
.mItmOpQty_dbl = UnMyStqFmt(mskItmOpQty.Text)
.mItmOpRate_dbl = Val(UnMyNumFmt(mskItmOpRate.Text))
.Calc_Value
mskItmOpValue.Text = ToMyStvFmt(.mItmOpValue_dbl)
End With

End Sub

Private Sub SmryList()
Dim aStock As Variant, mQty As Double, mAvgRate As Double, mValue As Double
Dim gcolcount As Integer, acount As Integer, mLow As Integer, mHigh As Integer, mPos As Integer, srow As Long, mColCount As Integer

clsListStru.Clear

Rem column definitions
clsListStru.AddFields mExpr:="ItmCode", mAttrib:=cFAT_SYSTEM
clsListStru.AddFields mExpr:="ItmName", mTitle:="Product Name", mAlign:=1, mWidth:=3500, mShowItem:=True
clsListStru.AddFields mExpr:="0.00", mAlias:="ItmOpQty", mTitle:="Op.Qty", mWidth:="1500", mAlign:=7, mShowItem:=False
clsListStru.AddFields mExpr:="0.00", mAlias:="ItmOpRate", mTitle:="Op.Rate", mWidth:="1500", mAlign:=7, mShowItem:=False
clsListStru.AddFields mExpr:="0.00", mAlias:="ItmOpValue", mTitle:="Op.Value", mWidth:="1500", mAlign:=7, mShowItem:=False

clsListStru.AddFields mExpr:="0.00", mAlias:="ItmOpRcQty", mTitle:="Op.Rc.Qty", mWidth:="1500", mAlign:=7, mShowItem:=False
clsListStru.AddFields mExpr:="0.00", mAlias:="ItmOpRcRate", mTitle:="Op.Rc.Rate", mWidth:="1500", mAlign:=7, mShowItem:=False
clsListStru.AddFields mExpr:="0.00", mAlias:="ItmOpRcValue", mTitle:="Op.Rc.Value", mWidth:="1500", mAlign:=7, mShowItem:=False

clsListStru.AddFields mExpr:="0.00", mAlias:="ItmOpIsQty", mTitle:="Op.Is.Qty", mWidth:="1500", mAlign:=7, mShowItem:=False
clsListStru.AddFields mExpr:="0.00", mAlias:="ItmOpIsRate", mTitle:="Op.Is.Rate", mWidth:="1500", mAlign:=7, mShowItem:=False
clsListStru.AddFields mExpr:="0.00", mAlias:="ItmOpIsValue", mTitle:="Op.Is.Value", mWidth:="1500", mAlign:=7, mShowItem:=False

clsListStru.AddFields mExpr:="0.00", mAlias:="ItmCurQty", mTitle:="Cur.Qty", mWidth:="1500", mAlign:=7, mShowItem:=False
clsListStru.AddFields mExpr:="0.00", mAlias:="ItmCurRate", mTitle:="Cur.Rate", mWidth:="1500", mAlign:=7, mShowItem:=False
clsListStru.AddFields mExpr:="0.00", mAlias:="ItmCurValue", mTitle:="Cur.Value", mWidth:="1500", mAlign:=7, mShowItem:=False

clsListStru.AddFields mExpr:="0.00", mAlias:="ItmCurRcQty", mTitle:="Cur.Rc.Qty", mWidth:="1500", mAlign:=7, mShowItem:=False
clsListStru.AddFields mExpr:="0.00", mAlias:="ItmCurRcRate", mTitle:="Cur.Rc.Rate", mWidth:="1500", mAlign:=7, mShowItem:=False
clsListStru.AddFields mExpr:="0.00", mAlias:="ItmCurRcValue", mTitle:="Cur.Rc.Value", mWidth:="1500", mAlign:=7, mShowItem:=False

clsListStru.AddFields mExpr:="0.00", mAlias:="ItmCurIsQty", mTitle:="Cur.Is.Qty", mWidth:="1500", mAlign:=7, mShowItem:=False
clsListStru.AddFields mExpr:="0.00", mAlias:="ItmCurIsRate", mTitle:="Cur.Is.Rate", mWidth:="1500", mAlign:=7, mShowItem:=False
clsListStru.AddFields mExpr:="0.00", mAlias:="ItmCurIsValue", mTitle:="Cur.Is.Value", mWidth:="1500", mAlign:=7, mShowItem:=False

If chkOpBal.Value = 1 Then
    If chkCombinedOpBal.Value = 1 Then
        clsListStru.UpdateField mAlias:="ItmOpQty", mShowItem:=True
        clsListStru.UpdateField mAlias:="ItmOpRate", mShowItem:=True
        clsListStru.UpdateField mAlias:="ItmOpValue", mShowItem:=True
    Else
        clsListStru.UpdateField mAlias:="ItmOpRcQty", mShowItem:=True
        clsListStru.UpdateField mAlias:="ItmOpRcRate", mShowItem:=True
        clsListStru.UpdateField mAlias:="ItmOpRcValue", mShowItem:=True
        
        clsListStru.UpdateField mAlias:="ItmOpIsQty", mShowItem:=True
        clsListStru.UpdateField mAlias:="ItmOpIsRate", mShowItem:=True
        clsListStru.UpdateField mAlias:="ItmOpIsValue", mShowItem:=True
    End If
    
End If
If chkCurBal.Value = 1 Then
    If chkCombinedCurBal.Value = 1 Then
        clsListStru.UpdateField mAlias:="ItmCurQty", mShowItem:=True
        clsListStru.UpdateField mAlias:="ItmCurRate", mShowItem:=True
        clsListStru.UpdateField mAlias:="ItmCurValue", mShowItem:=True
    Else
        clsListStru.UpdateField mAlias:="ItmCurRcQty", mShowItem:=True
        clsListStru.UpdateField mAlias:="ItmCurRcRate", mShowItem:=True
        clsListStru.UpdateField mAlias:="ItmCurRcValue", mShowItem:=True
        
        clsListStru.UpdateField mAlias:="ItmCurIsQty", mShowItem:=True
        clsListStru.UpdateField mAlias:="ItmCurIsRate", mShowItem:=True
        clsListStru.UpdateField mAlias:="ItmCurIsValue", mShowItem:=True
    End If
    
End If

RefreshDatabase dbStDatabase
datRecset.Requery

Mfgrd1.Height = Int(Mfgrd1.Height / Mfgrd1.RowHeightMin) * Mfgrd1.RowHeightMin
Mfgrd1.Cols = clsListStru.UFields + 1
gcolcount = 0
mLow = clsListStru.LFields
mHigh = clsListStru.UFields
For acount = mLow To mHigh
    With Mfgrd1
    'If .Cols <= gcolcount Then
    '    .Cols = gcolcount + 1
    'End If
    .ColAlignment(gcolcount) = clsListStru.Field_Align(acount)
    If clsListStru.Field_Show(acount) = True Then
        .ColWidth(gcolcount) = clsListStru.Field_Width(acount)
    Else
        .ColWidth(gcolcount) = 0
    End If
    .TextMatrix(0, gcolcount) = clsListStru.Field_Title(acount)
    End With
    
    gcolcount = gcolcount + 1
Next acount
If FlexColsWidth(Mfgrd1) > Mfgrd1.Width Then
    Mfgrd1.SelectionMode = flexSelectionFree
Else
    Mfgrd1.SelectionMode = flexSelectionByRow
End If

srow = 1
MoveRecToFirst datRecset
With datRecset
If .RecordCount > 0 Then
    Do While .EOF = False
        Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("ItmCode")) = .fields("ItmCode")
        Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("ItmName")) = .fields("ItmName")
        If chkOpBal.Value = 1 Then
            If chkCombinedOpBal.Value = 1 Then
                aStock = clsIT.GetItmOpnQtyRateValue(.fields("ItmCode"), mIsRcSeperated:=False)
                
                mQty = aStock(0, 0)
                mAvgRate = aStock(0, 1)
                mValue = aStock(0, 2)
                
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("ItmOpQty")) = ToMyStqFmt(mQty)
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("ItmOpRate")) = ToMyNumFmt(mAvgRate)
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("ItmOpValue")) = ToMyStvFmt(mValue)
                
            Else
                aStock = clsIT.GetItmOpnQtyRateValue(.fields("ItmCode"), mIsRcSeperated:=True)
                Rem plus stock
                mQty = aStock(0, 0)
                mAvgRate = aStock(0, 1)
                mValue = aStock(0, 2)
                
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("ItmOpRcQty")) = ToMyStqFmt(mQty)
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("ItmOpRcRate")) = ToMyNumFmt(mAvgRate)
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("ItmOpRcValue")) = ToMyStvFmt(mValue)
                
                Rem minus part
                mQty = aStock(1, 0)
                mAvgRate = aStock(1, 1)
                mValue = aStock(1, 2)
                
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("ItmOpIsQty")) = ToMyStqFmt(mQty)
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("ItmOpIsRate")) = ToMyNumFmt(mAvgRate)
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("ItmOpIsValue")) = ToMyStvFmt(mValue)
                
            End If
        End If
        If chkCurBal.Value = 1 Then
            If chkCombinedCurBal.Value = 1 Then
                aStock = clsIT.GetItmCurQtyRateValue(.fields("ItmCode"), sCmpBookEndDate, mIsRcSeperated:=False)
                
                mQty = aStock(0, 0)
                mAvgRate = aStock(0, 1)
                mValue = aStock(0, 2)
                
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("ItmCurQty")) = ToMyStqFmt(mQty)
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("ItmCurRate")) = ToMyNumFmt(mAvgRate)
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("ItmCurValue")) = ToMyStvFmt(mValue)
                
            Else
                aStock = clsIT.GetItmCurQtyRateValue(.fields("ItmCode"), sCmpBookEndDate, mIsRcSeperated:=True)
                Rem plus stock
                mQty = aStock(0, 0)
                mAvgRate = aStock(0, 1)
                mValue = aStock(0, 2)
                
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("ItmCurRcQty")) = ToMyStqFmt(mQty)
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("ItmCurRcRate")) = ToMyNumFmt(mAvgRate)
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("ItmCurRcValue")) = ToMyStvFmt(mValue)
                
                Rem minus part
                mQty = aStock(1, 0)
                mAvgRate = aStock(1, 1)
                mValue = aStock(1, 2)
                
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("ItmCurIsQty")) = ToMyStqFmt(mQty)
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("ItmCurIsRate")) = ToMyNumFmt(mAvgRate)
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("ItmCurIsValue")) = ToMyStvFmt(mValue)
                
            End If
        End If
        srow = srow + 1
        If Mfgrd1.Rows < srow + 1 Then
            Mfgrd1.Rows = Mfgrd1.Rows + 1
        End If
        
        .MoveNext
    Loop
End If
End With
For mColCount = 0 To Mfgrd1.Cols - 1
    Mfgrd1.TextMatrix(srow, mColCount) = ""
Next mColCount
Mfgrd1.Rows = srow + 1

SetFlexColCursor txtList1Col, Mfgrd1

End Sub

Private Function GetActiveControl() As Boolean
Dim mCnt As Integer

On Error GoTo errhand
GetActiveControl = False
If Screen.ActiveForm.Name = Me.Name Then
    If Screen.ActiveControl.Visible = True And Screen.ActiveControl.Enabled = True Then
        Set mActiveControl = Screen.ActiveControl
        GetActiveControl = True
    End If
End If

errhand:
mCnt = mCnt + 1
If mCnt > 2 Then
    Exit Function
End If

End Function

Private Function SetActiveControl() As Boolean
Dim mCnt As Integer

On Error GoTo errhand
SetActiveControl = False
If Screen.ActiveForm.Name = Me.Name And IsEmpty(mActiveControl) = False Then
    If mActiveControl.Visible = True And mActiveControl.Enabled = True Then
        mActiveControl.SetFocus
        SetActiveControl = True
    End If
End If

errhand:
mCnt = mCnt + 1
If mCnt > 2 Then
    Exit Function
End If

End Function

Private Sub Mfgrd1_DblClick()
Call cmdFormEnter_Click

End Sub

Private Sub Mfgrd1_GotFocus()
Mfgrd1.Col = FlexLeftVisibleCol(Mfgrd1)
Mfgrd1.LeftCol = FlexLeftVisibleCol(Mfgrd1)
If Mfgrd1.SelectionMode = flexSelectionByRow Then
    Mfgrd1.ColSel = 0: Mfgrd1.ColSel = Mfgrd1.Cols - 1
End If
Call Mfgrd1_RowColChange
txtSearch1Text.Text = ""

End Sub

Private Sub Mfgrd1_KeyDown(KeyCode As Integer, Shift As Integer)
If Shift = 0 And KeyCode = vbKeyF12 Then
    frConfigure.ZOrder
    frConfigure.Visible = True
    Mfgrd1.Enabled = False
    chkCombinedOpBal.SetFocus
ElseIf MyAddNewKey(Shift, KeyCode) = True Then
    Call Data_AddEvent
ElseIf MyDeleteKey(Shift, KeyCode) = True Then
    If Mfgrd1.Row < Mfgrd1.Rows - 1 Then
        Call Data_DeleteEvent
    End If
ElseIf Shift = vbCtrlMask And KeyCode = vbKeySpace Then
    Call cmdFormEnter_Click
End If

End Sub

Private Sub Mfgrd1_KeyPress(KeyAscii As Integer)
mLastKeyPressed = KeyAscii
If mMaskKeyPressed = 0 Or mMaskKeyPressed = vbShiftMask Then
    Select Case KeyAscii
    Case vbKeyBack
        If txtSearch1Text.Text <> "" Then
            txtSearch1Text.Text = Left(txtSearch1Text.Text, Len(txtSearch1Text.Text) - 1)
            Call txtSearch1Text_InterActiveChange
        End If
    Case Else
        txtSearch1Text.Text = txtSearch1Text.Text & Chr(KeyAscii)
        Call txtSearch1Text_InterActiveChange
    End Select
End If

End Sub

Private Sub Mfgrd1_RowColChange()
With datRecset
If .RecordCount > 0 Then
    If .AbsolutePosition <> Mfgrd1.Row - Mfgrd1.FixedRows + 1 Then
        .MoveFirst
        .Move Mfgrd1.Row - Mfgrd1.FixedRows, 1     ' Mfgrd1.Row is already less by one
    End If
End If
End With
ShowFlexColCursor txtList1Col, Mfgrd1, datRecset

End Sub

Private Sub Mfgrd1_Scroll()
ShowFlexColCursor txtList1Col, Mfgrd1, datRecset

End Sub

Private Sub txtList1Col_DblClick(Index As Integer)
Call Mfgrd1_DblClick
End Sub

Private Sub txtList1Col_GotFocus(Index As Integer)
Mfgrd1.SetFocus
End Sub

Private Sub txtSearch1Text_InterActiveChange(Optional ByVal mText)
mText = IIf(IsMissing(mText) = True, txtSearch1Text.Text, mText)
SearchFlex Mfgrd1, clsListStru.GetItemIndex("ItmName"), mText
ShowActiveFlexRow Mfgrd1

End Sub

Private Sub txtSearch1Text_GotFocus()
FlashActiveControl txtSearch1Text, True

End Sub

Private Sub txtSearch1Text_KeyDown(KeyCode As Integer, Shift As Integer)
'''If Shift = 0 Then
'''    Select Case KeyCode
'''    Case vbKeyF12
'''        frConfigure.ZOrder
'''        frConfigure.Visible = True
'''        Mfgrd1.Enabled = False
'''        chkCombinedOpBal.SetFocus
'''    End Select
'''ElseIf Shift = vbCtrlMask Then
'''    If KeyCode = vbKeyAdd Then
'''        Call Data_AddEvent
'''    ElseIf KeyCode = vbKeySubtract Then
'''        If Mfgrd1.Row < Mfgrd1.Rows - 1 Then
'''            Call Data_DeleteEvent
'''        End If
'''    ElseIf KeyCode = vbKeySpace Then
'''        Call cmdFormEnter_Click
'''    End If
'''ElseIf KeyCode = vbKeyDown Or KeyCode = vbKeyUp Then
'''    With datRecset
'''    If .RecordCount > 0 Then
'''        If KeyCode = vbKeyDown Then
'''            If .EOF = False Then
'''                .MoveNext
'''            End If
'''            If .EOF = True Then
'''                Rem .MoveLast
'''            End If
'''        ElseIf KeyCode = vbKeyUp Then
'''            If .BOF = False Then
'''                .MovePrevious
'''            End If
'''            If .BOF = True Then
'''                .MoveFirst
'''            End If
'''        End If
'''    End If
'''    If .EOF = False And .BOF = False Then
'''        txtSearch1Text.Text = .Fields("ItmName")
'''    Else
'''        If txtSearch1Text.Text <> "" Then
'''            txtSearch1Text.Text = ""
'''        Else
'''            Mfgrd1.Row = Mfgrd1.Rows - 1
'''            ShowActiveFlexRow Mfgrd1
'''        End If
'''    End If
'''    txtSearch1Text.SelStart = Len(txtSearch1Text.Text)
'''    KeyCode = 0
'''
'''    End With
'''End If

End Sub

Private Sub txtSearch1Text_LostFocus()
FlashActiveControl txtSearch1Text, False
End Sub

