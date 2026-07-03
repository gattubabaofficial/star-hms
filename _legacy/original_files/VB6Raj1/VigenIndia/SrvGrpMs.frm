VERSION 5.00
Object = "{5E9E78A0-531B-11CF-91F6-C2863C385E30}#1.0#0"; "MSFLXGRD.OCX"
Begin VB.Form frmServGroupMast 
   Appearance      =   0  'Flat
   BackColor       =   &H80000005&
   ClientHeight    =   9090
   ClientLeft      =   60
   ClientTop       =   60
   ClientWidth     =   13485
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
   LockControls    =   -1  'True
   ScaleHeight     =   9090
   ScaleWidth      =   13485
   ShowInTaskbar   =   0   'False
   Begin VB.TextBox txtVoid 
      CausesValidation=   0   'False
      Height          =   375
      Left            =   120
      TabIndex        =   37
      TabStop         =   0   'False
      Text            =   "Void"
      Top             =   8520
      Width           =   375
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
      TabIndex        =   43
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
      TabIndex        =   42
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
      ItemData        =   "SrvGrpMs.frx":0000
      Left            =   0
      List            =   "SrvGrpMs.frx":000D
      Style           =   1  'Simple Combo
      TabIndex        =   41
      TabStop         =   0   'False
      Text            =   "cmbFormMode"
      Top             =   360
      Width           =   1455
   End
   Begin VB.Frame frFormDtl 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
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
      Height          =   6615
      Left            =   240
      TabIndex        =   40
      Top             =   960
      Width           =   12015
      Begin VB.Frame frHeader 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         ForeColor       =   &H80000008&
         Height          =   5115
         Left            =   960
         TabIndex        =   48
         Top             =   360
         Width           =   9405
         Begin VB.TextBox mskSgpDiscPer 
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
            Left            =   5115
            TabIndex        =   6
            Tag             =   "AhCode"
            Text            =   "0.00 %"
            Top             =   2145
            Width           =   1215
         End
         Begin VB.CheckBox chkSgpDiscAllowed 
            Alignment       =   1  'Right Justify
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            Caption         =   "Discount Allowed:"
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
            Left            =   315
            TabIndex        =   5
            Top             =   2145
            Width           =   2355
         End
         Begin VB.CheckBox chkSgpDefAllowed 
            Alignment       =   1  'Right Justify
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            Caption         =   "Decreament Allowed:"
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
            Left            =   3660
            TabIndex        =   4
            Top             =   1695
            Width           =   2670
         End
         Begin VB.CheckBox chkSgpInfAllowed 
            Alignment       =   1  'Right Justify
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            Caption         =   "Increament Allowed:"
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
            Left            =   315
            TabIndex        =   3
            Top             =   1695
            Width           =   2355
         End
         Begin VB.CommandButton cmdExtRateSys 
            Appearance      =   0  'Flat
            Caption         =   "Extended Charges && Share System"
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
            Left            =   4950
            Style           =   1  'Graphical
            TabIndex        =   10
            Top             =   4410
            Width           =   4095
         End
         Begin VB.TextBox mskFormBoundField 
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
            Left            =   2430
            TabIndex        =   0
            Tag             =   "AhCode"
            Text            =   "-1"
            Top             =   360
            Width           =   1335
         End
         Begin VB.TextBox txtSgpName 
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
            Left            =   2430
            MaxLength       =   50
            TabIndex        =   1
            Top             =   810
            Width           =   5655
         End
         Begin VB.CheckBox chkSgpExpanded 
            Alignment       =   1  'Right Justify
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            Caption         =   "Expanded Print:"
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
            Left            =   315
            TabIndex        =   7
            Top             =   2580
            Width           =   2355
         End
         Begin VB.CheckBox chkSgpEditable 
            Alignment       =   1  'Right Justify
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            Caption         =   "Editable:"
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
            Left            =   315
            TabIndex        =   8
            Top             =   3030
            Width           =   2355
         End
         Begin VB.TextBox mskSgpIndex 
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
            Left            =   2430
            TabIndex        =   2
            Tag             =   "AhCode"
            Text            =   "0"
            Top             =   1245
            Width           =   975
         End
         Begin VB.CheckBox chkSgpShowInList 
            Alignment       =   1  'Right Justify
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            Caption         =   "Show in List:"
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
            Left            =   315
            TabIndex        =   9
            Top             =   3480
            Width           =   2355
         End
         Begin VB.Label Label2 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Discount (%):"
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
            Left            =   3660
            TabIndex        =   53
            Top             =   2145
            Width           =   1575
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
            Left            =   360
            TabIndex        =   51
            Top             =   360
            Width           =   855
         End
         Begin VB.Label Label2 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Group Name:"
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
            Left            =   360
            TabIndex        =   50
            Top             =   810
            Width           =   1695
         End
         Begin VB.Label Label2 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Index Order:"
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
            Left            =   360
            TabIndex        =   49
            Top             =   1245
            Width           =   1695
         End
      End
      Begin VB.CommandButton cmdSaveForm 
         Appearance      =   0  'Flat
         BackColor       =   &H80000009&
         Caption         =   "      &Save"
         Height          =   390
         Left            =   11520
         Style           =   1  'Graphical
         TabIndex        =   36
         Top             =   6105
         Width           =   420
      End
      Begin VB.Frame frExtRateSys 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         Caption         =   "Service Charges/Share System"
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
         Height          =   6015
         Left            =   360
         TabIndex        =   52
         Top             =   360
         Width           =   11415
         Begin VB.CheckBox chkSgpExtShareSys 
            Alignment       =   1  'Right Justify
            Appearance      =   0  'Flat
            BackColor       =   &H80000010&
            Caption         =   "                 Extended Share System"
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
            Left            =   5760
            TabIndex        =   29
            Top             =   2880
            Width           =   5055
         End
         Begin VB.CheckBox chkSgpExtBargSys 
            Alignment       =   1  'Right Justify
            Appearance      =   0  'Flat
            BackColor       =   &H80000010&
            Caption         =   "                 Extended Bargain System"
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
            Left            =   5760
            TabIndex        =   23
            Top             =   480
            Width           =   5055
         End
         Begin VB.CheckBox chkSgpExtDiscSys 
            Alignment       =   1  'Right Justify
            Appearance      =   0  'Flat
            BackColor       =   &H80000010&
            Caption         =   "                    Extended Discount System"
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
            Left            =   240
            TabIndex        =   17
            Top             =   2880
            Width           =   5055
         End
         Begin VB.CheckBox chkSgpExtRateSys 
            Alignment       =   1  'Right Justify
            Appearance      =   0  'Flat
            BackColor       =   &H80000010&
            Caption         =   "                      Extended Rate System"
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
            Left            =   240
            TabIndex        =   11
            Top             =   480
            Width           =   5055
         End
         Begin VB.CheckBox chkSgpTimewseShareSys 
            Alignment       =   1  'Right Justify
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            Caption         =   "Time-wise Service Share System"
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
            Left            =   5760
            TabIndex        =   34
            Top             =   4680
            Width           =   5055
         End
         Begin VB.CheckBox chkSgpRTowseShareSys 
            Alignment       =   1  'Right Justify
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            Caption         =   "Ref.To-wise Service Share System"
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
            Left            =   5760
            TabIndex        =   33
            Top             =   4320
            Width           =   5055
         End
         Begin VB.CheckBox chkSgpRBywseShareSys 
            Alignment       =   1  'Right Justify
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            Caption         =   "Ref.By-wise Service Share System"
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
            Left            =   5760
            TabIndex        =   32
            Top             =   3960
            Width           =   5055
         End
         Begin VB.CheckBox chkSgpPcgwseShareSys 
            Alignment       =   1  'Right Justify
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            Caption         =   "Patient Category-wise Service Share System"
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
            Left            =   5760
            TabIndex        =   31
            Top             =   3600
            Width           =   5055
         End
         Begin VB.CheckBox chkSgpDctwseShareSys 
            Alignment       =   1  'Right Justify
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            Caption         =   "Doctor-wise Service Share System"
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
            Left            =   5760
            TabIndex        =   30
            Top             =   3240
            Width           =   5055
         End
         Begin VB.CheckBox chkSgpTimewseBargSys 
            Alignment       =   1  'Right Justify
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            Caption         =   "Time-wise Service Bargain System"
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
            Left            =   5760
            TabIndex        =   28
            Top             =   2280
            Width           =   5055
         End
         Begin VB.CheckBox chkSgpRTowseBargSys 
            Alignment       =   1  'Right Justify
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            Caption         =   "Ref.To-wise Service Bargain System"
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
            Left            =   5760
            TabIndex        =   27
            Top             =   1920
            Width           =   5055
         End
         Begin VB.CheckBox chkSgpRBywseBargSys 
            Alignment       =   1  'Right Justify
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            Caption         =   "Ref.By-wise Service Bargain System"
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
            Left            =   5760
            TabIndex        =   26
            Top             =   1560
            Width           =   5055
         End
         Begin VB.CheckBox chkSgpPcgwseBargSys 
            Alignment       =   1  'Right Justify
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            Caption         =   "Patient Category-wise Service Bargain System"
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
            Left            =   5760
            TabIndex        =   25
            Top             =   1200
            Width           =   5055
         End
         Begin VB.CheckBox chkSgpDctwseBargSys 
            Alignment       =   1  'Right Justify
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            Caption         =   "Doctor-wise Service Bargain System"
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
            Left            =   5760
            TabIndex        =   24
            Top             =   840
            Width           =   5055
         End
         Begin VB.CheckBox chkSgpTimewseDiscSys 
            Alignment       =   1  'Right Justify
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            Caption         =   "Time-wise Service Discount System"
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
            Left            =   240
            TabIndex        =   22
            Top             =   4680
            Width           =   5055
         End
         Begin VB.CheckBox chkSgpTimewseRateSys 
            Alignment       =   1  'Right Justify
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            Caption         =   "Time-wise Service Rate System"
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
            Left            =   240
            TabIndex        =   16
            Top             =   2280
            Width           =   5055
         End
         Begin VB.CheckBox chkSgpRTowseDiscSys 
            Alignment       =   1  'Right Justify
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            Caption         =   "Ref.To-wise Service Discount System"
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
            Left            =   240
            TabIndex        =   21
            Top             =   4320
            Width           =   5055
         End
         Begin VB.CheckBox chkSgpRBywseDiscSys 
            Alignment       =   1  'Right Justify
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            Caption         =   "Ref.By-wise Service Discount System"
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
            Left            =   240
            TabIndex        =   20
            Top             =   3960
            Width           =   5055
         End
         Begin VB.CheckBox chkSgpPcgwseDiscSys 
            Alignment       =   1  'Right Justify
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            Caption         =   "Patient Category-wise Service Discount System"
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
            Left            =   240
            TabIndex        =   19
            Top             =   3600
            Width           =   5055
         End
         Begin VB.CheckBox chkSgpDctwseDiscSys 
            Alignment       =   1  'Right Justify
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            Caption         =   "Doctor-wise Service Discount System"
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
            Left            =   240
            TabIndex        =   18
            Top             =   3240
            Width           =   5055
         End
         Begin VB.CheckBox chkSgpRTowseRateSys 
            Alignment       =   1  'Right Justify
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            Caption         =   "Ref.To-wise Service Rate System"
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
            Left            =   240
            TabIndex        =   15
            Top             =   1920
            Width           =   5055
         End
         Begin VB.CheckBox chkSgpRBywseRateSys 
            Alignment       =   1  'Right Justify
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            Caption         =   "Ref.By-wise Service Rate System"
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
            Left            =   240
            TabIndex        =   14
            Top             =   1560
            Width           =   5055
         End
         Begin VB.CheckBox chkSgpPcgwseRateSys 
            Alignment       =   1  'Right Justify
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            Caption         =   "Patient Category-wise Service Rate System"
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
            Left            =   240
            TabIndex        =   13
            Top             =   1200
            Width           =   5055
         End
         Begin VB.CheckBox chkSgpDctwseRateSys 
            Alignment       =   1  'Right Justify
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            Caption         =   "Doctor-wise Service Rate System"
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
            Left            =   240
            TabIndex        =   12
            Top             =   840
            Width           =   5055
         End
         Begin VB.CommandButton cmdExtRateSysDone 
            Appearance      =   0  'Flat
            Caption         =   "&Done"
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
            Left            =   9480
            Style           =   1  'Graphical
            TabIndex        =   35
            Top             =   5520
            Width           =   1335
         End
      End
   End
   Begin VB.Frame frFormSmry 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
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
      Height          =   5535
      Left            =   240
      TabIndex        =   39
      Top             =   720
      Width           =   8655
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
         Left            =   120
         MousePointer    =   1  'Arrow
         TabIndex        =   46
         TabStop         =   0   'False
         Top             =   1560
         Width           =   1335
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
         Left            =   960
         TabIndex        =   44
         Top             =   360
         Width           =   4215
      End
      Begin MSFlexGridLib.MSFlexGrid Mfgrd1 
         Height          =   4335
         Left            =   120
         TabIndex        =   45
         Top             =   720
         Width           =   6855
         _ExtentX        =   12091
         _ExtentY        =   7646
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
         Left            =   120
         TabIndex        =   47
         Top             =   360
         Width           =   735
      End
   End
   Begin VB.Label lblFormHeading 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00E0E0E0&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Service Group Master"
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
      TabIndex        =   38
      Top             =   0
      Width           =   9015
   End
End
Attribute VB_Name = "frmServGroupMast"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Dim mFormLoaded As Boolean, mLastKeyPressed As Integer, mMaskKeyPressed As Integer
Dim mSgpCode As Long
Dim mRemoteAccess As Boolean, mEntrySaved As Boolean, mEntryAborted As Boolean
Dim dbVgnDatabase As New ADODB.Connection
Dim datRecset As New ADODB.Recordset
Dim mSgpName_old As String, mSgpIndex_old As Integer
Dim clsSGP As clsVgnMasterEntry, mActiveControl As Object, clsListStru As clsSelectQueryStructure

Public Property Let RemoteAccessCode(ByVal mAccessCode As Long)
mRemoteAccess = True
mSgpCode = mAccessCode
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

Public Property Get SgpName() As String
SgpName = txtSgpName.Text
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

Private Sub chkSgpEditable_GotFocus()
FlashActiveControl chkSgpEditable, True
End Sub

Private Sub chkSgpEditable_LostFocus()
FlashActiveControl chkSgpEditable, False
End Sub

Private Sub chkSgpExpanded_GotFocus()
FlashActiveControl chkSgpExpanded, True
End Sub

Private Sub chkSgpExpanded_LostFocus()
FlashActiveControl chkSgpExpanded, False
End Sub

Private Sub chkSgpExtRateSys_GotFocus()
FlashActiveControl chkSgpExtRateSys, True
End Sub

Private Sub chkSgpExtRateSys_LostFocus()
FlashActiveControl chkSgpExtRateSys, False
chkSgpExtRateSys.BackColor = vbButtonShadow
End Sub

Private Sub chkSgpDctwseRateSys_GotFocus()
FlashActiveControl chkSgpDctwseRateSys, True
End Sub

Private Sub chkSgpDctwseRateSys_LostFocus()
FlashActiveControl chkSgpDctwseRateSys, False
End Sub

Private Sub chkSgpDefAllowed_GotFocus()
FlashActiveControl chkSgpDefAllowed, True
End Sub

Private Sub chkSgpDefAllowed_LostFocus()
FlashActiveControl chkSgpDefAllowed, False
End Sub

Private Sub chkSgpDiscAllowed_GotFocus()
FlashActiveControl chkSgpDiscAllowed, True
End Sub

Private Sub chkSgpDiscAllowed_LostFocus()
FlashActiveControl chkSgpDiscAllowed, False
End Sub

Private Sub chkSgpInfAllowed_Click()
FlashActiveControl chkSgpDefAllowed, False
End Sub

Private Sub chkSgpInfAllowed_GotFocus()
FlashActiveControl chkSgpInfAllowed, True
End Sub

Private Sub chkSgpInfAllowed_LostFocus()
FlashActiveControl chkSgpInfAllowed, False
End Sub

Private Sub chkSgpPcgwseRateSys_GotFocus()
FlashActiveControl chkSgpPcgwseRateSys, True
End Sub

Private Sub chkSgpPcgwseRateSys_LostFocus()
FlashActiveControl chkSgpPcgwseRateSys, False
End Sub

Private Sub chkSgpRBywseRateSys_GotFocus()
FlashActiveControl chkSgpRBywseRateSys, True
End Sub

Private Sub chkSgpRBywseRateSys_LostFocus()
FlashActiveControl chkSgpRBywseRateSys, False
End Sub

Private Sub chkSgpRTowseRateSys_GotFocus()
FlashActiveControl chkSgpRTowseRateSys, True
End Sub

Private Sub chkSgpRTowseRateSys_LostFocus()
FlashActiveControl chkSgpRTowseRateSys, False
End Sub

Private Sub chkSgpTimewseRateSys_GotFocus()
FlashActiveControl chkSgpTimewseRateSys, True
End Sub

Private Sub chkSgpTimewseRateSys_LostFocus()
FlashActiveControl chkSgpTimewseRateSys, False
End Sub

Private Sub chkSgpExtDiscSys_GotFocus()
FlashActiveControl chkSgpExtDiscSys, True
End Sub

Private Sub chkSgpExtDiscSys_LostFocus()
FlashActiveControl chkSgpExtDiscSys, False
chkSgpExtDiscSys.BackColor = vbButtonShadow
End Sub

Private Sub chkSgpDctwseDiscSys_GotFocus()
FlashActiveControl chkSgpDctwseDiscSys, True
End Sub

Private Sub chkSgpDctwseDiscSys_LostFocus()
FlashActiveControl chkSgpDctwseDiscSys, False
End Sub

Private Sub chkSgpPcgwseDiscSys_GotFocus()
FlashActiveControl chkSgpPcgwseDiscSys, True
End Sub

Private Sub chkSgpPcgwseDiscSys_LostFocus()
FlashActiveControl chkSgpPcgwseDiscSys, False
End Sub

Private Sub chkSgpRBywseDiscSys_GotFocus()
FlashActiveControl chkSgpRBywseDiscSys, True
End Sub

Private Sub chkSgpRBywseDiscSys_LostFocus()
FlashActiveControl chkSgpRBywseDiscSys, False
End Sub

Private Sub chkSgpRTowseDiscSys_GotFocus()
FlashActiveControl chkSgpRTowseDiscSys, True
End Sub

Private Sub chkSgpRTowseDiscSys_LostFocus()
FlashActiveControl chkSgpRTowseDiscSys, False
End Sub

Private Sub chkSgpTimewseDiscSys_GotFocus()
FlashActiveControl chkSgpTimewseDiscSys, True
End Sub

Private Sub chkSgpTimewseDiscSys_LostFocus()
FlashActiveControl chkSgpTimewseDiscSys, False
End Sub

Private Sub chkSgpExtBargSys_GotFocus()
FlashActiveControl chkSgpExtBargSys, True
End Sub

Private Sub chkSgpExtBargSys_LostFocus()
FlashActiveControl chkSgpExtBargSys, False
chkSgpExtBargSys.BackColor = vbButtonShadow
End Sub

Private Sub chkSgpDctwseBargSys_GotFocus()
FlashActiveControl chkSgpDctwseBargSys, True
End Sub

Private Sub chkSgpDctwseBargSys_LostFocus()
FlashActiveControl chkSgpDctwseBargSys, False
End Sub

Private Sub chkSgpPcgwseBargSys_GotFocus()
FlashActiveControl chkSgpPcgwseBargSys, True
End Sub

Private Sub chkSgpPcgwseBargSys_LostFocus()
FlashActiveControl chkSgpPcgwseBargSys, False
End Sub

Private Sub chkSgpRBywseBargSys_GotFocus()
FlashActiveControl chkSgpRBywseBargSys, True
End Sub

Private Sub chkSgpRBywseBargSys_LostFocus()
FlashActiveControl chkSgpRBywseBargSys, False
End Sub

Private Sub chkSgpRTowseBargSys_GotFocus()
FlashActiveControl chkSgpRTowseBargSys, True
End Sub

Private Sub chkSgpRTowseBargSys_LostFocus()
FlashActiveControl chkSgpRTowseBargSys, False
End Sub

Private Sub chkSgpTimewseBargSys_GotFocus()
FlashActiveControl chkSgpTimewseBargSys, True
End Sub

Private Sub chkSgpTimewseBargSys_LostFocus()
FlashActiveControl chkSgpTimewseBargSys, False
End Sub

Private Sub chkSgpExtShareSys_GotFocus()
FlashActiveControl chkSgpExtShareSys, True
End Sub

Private Sub chkSgpExtShareSys_LostFocus()
FlashActiveControl chkSgpExtShareSys, False
chkSgpExtShareSys.BackColor = vbButtonShadow
End Sub

Private Sub chkSgpDctwseShareSys_GotFocus()
FlashActiveControl chkSgpDctwseShareSys, True
End Sub

Private Sub chkSgpDctwseShareSys_LostFocus()
FlashActiveControl chkSgpDctwseShareSys, False
End Sub

Private Sub chkSgpPcgwseShareSys_GotFocus()
FlashActiveControl chkSgpPcgwseShareSys, True
End Sub

Private Sub chkSgpPcgwseShareSys_LostFocus()
FlashActiveControl chkSgpPcgwseShareSys, False
End Sub

Private Sub chkSgpRBywseShareSys_GotFocus()
FlashActiveControl chkSgpRBywseShareSys, True
End Sub

Private Sub chkSgpRBywseShareSys_LostFocus()
FlashActiveControl chkSgpRBywseShareSys, False
End Sub

Private Sub chkSgpRTowseShareSys_GotFocus()
FlashActiveControl chkSgpRTowseShareSys, True
End Sub

Private Sub chkSgpRTowseShareSys_LostFocus()
FlashActiveControl chkSgpRTowseShareSys, False
End Sub

Private Sub chkSgpTimewseShareSys_GotFocus()
FlashActiveControl chkSgpTimewseShareSys, True
End Sub

Private Sub chkSgpTimewseShareSys_LostFocus()
FlashActiveControl chkSgpTimewseShareSys, False
End Sub

Private Sub chkSgpShowInList_GotFocus()
FlashActiveControl chkSgpShowInList, True
End Sub

Private Sub chkSgpShowInList_LostFocus()
FlashActiveControl chkSgpShowInList, False
End Sub

Private Sub cmdExtRateSys_Click()
ShowExtRateSys True
chkSgpExtRateSys.SetFocus

End Sub

Private Sub ShowExtRateSys(ByVal mShowItem As Boolean)
If Me.Visible = True Then
    txtVoid.SetFocus
End If
frHeader.Enabled = Not mShowItem
frExtRateSys.Visible = mShowItem: frExtRateSys.Enabled = mShowItem
cmdSaveForm.Enabled = Not mShowItem
If mShowItem = True Then
    frExtRateSys.ZOrder
End If

End Sub

Private Sub cmdExtRateSysDone_Click()
ShowExtRateSys False
cmdExtRateSys.SetFocus

End Sub

Private Sub cmdFormEnter_Click()
mLastKeyPressed = 13
If FormAddEditMode = cFORM_SMRYMODE Then
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
If FormAddEditMode = cFORM_SMRYMODE Then
    If Len(txtSearch1Text.Text) > 0 Then
        txtSearch1Text.Text = ""
        Call txtSearch1Text_InterActiveChange
    Else
        Unload Me
    End If
ElseIf frExtRateSys.Visible = True Then
    ShowExtRateSys False
    cmdExtRateSys.SetFocus
Else
    txtVoid.SetFocus
    If CanReject() = True Then
        mEntryAborted = True
        mRecAbsPos = datRecset.AbsolutePosition
        Call Data_CancelEvent
        Call SmryList
        If datRecset.RecordCount > mRecAbsPos And mRecAbsPos > 0 Then
            datRecset.Move mRecAbsPos - 1, Start:=1
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
        txtSgpName.SetFocus
    End If

End If

End Sub

Private Sub cmdSaveForm_Click()
Call Data_SaveEvent

Call SmryList
txtSearch1Text_InterActiveChange txtSgpName.Text

''datRecset.Find "SgpName='" & txtSgpName.Text & "'", Start:=1
''ShowRecActiveFlexRow datRecset, Mfgrd1

Call ShowEntryMode(False)
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
        txtSgpName.SetFocus
    End If
End If
cmdSaveForm.Enabled = True

End Sub

Private Sub Form_Activate()
If mFormLoaded = False Then
    If mRemoteAccess = True Then
        MoveRecToFirst datRecset
        ShowRecActiveFlexRow datRecset, Mfgrd1
        Mfgrd1.SetFocus
        If mSgpCode = 0 Then
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

mFormLoaded = True
End Sub

Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)
mLastKeyPressed = KeyCode
mMaskKeyPressed = Shift
Select Case KeyCode
Case vbKeyPageDown
    If frExtRateSys.Visible = True Then
        Call cmdExtRateSysDone_Click
    ElseIf FormAddEditMode <> cFORM_SMRYMODE Then
        Call cmdSaveForm_GotFocus
    End If
End Select

End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)
mLastKeyPressed = KeyAscii

End Sub

Private Sub Form_Load()
Dim colcnt As Integer
mFormLoaded = False
mEntrySaved = False: mEntryAborted = False
SetFormSize Me, frmMain
Call Form_Resize

Call SetVoidControl(txtVoid)
txtSearch1Text.Enabled = False

OpenVgnDataSource dbVgnDatabase

Set clsSGP = New clsVgnMasterEntry
Set clsSGP.dbVgnDatabase = dbVgnDatabase
clsSGP.blnServGrpMast = True
clsSGP.Init

Set clsListStru = New clsSelectQueryStructure

If mRemoteAccess = True Then
    datRecset.open "Select * from ServGrpMst where SgpCode=" & CStr(mSgpCode) & " order by SgpName", dbVgnDatabase, adOpenKeyset, adLockOptimistic
Else
    datRecset.open "Select * from ServGrpMst order by SgpName", dbVgnDatabase, adOpenKeyset, adLockOptimistic
End If
Call SmryList

ShowEntryMode False
ShowExtRateSys False


End Sub

Private Sub Form_Resize()
lblFormHeading.Width = Me.Width
cmdFormEscape.Left = Me.Width - (cmdFormEscape.Width * 2)
cmdFormEnter.Left = Me.Width + cmdFormEscape.Width
frFormSmry.Left = (Me.Width - frFormSmry.Width) / 2: frFormSmry.Top = cmbFormEntryMode.Top + (cmbFormEntryMode.Height * 2)
frFormDtl.Left = (Me.Width - frFormDtl.Width) / 2: frFormDtl.Top = frFormSmry.Top

End Sub

Private Sub Form_Unload(Cancel As Integer)
Set clsSGP = Nothing

Set clsListStru = Nothing

CloseTable datRecset
CloseDataSource dbVgnDatabase
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
Dim tRecset As New ADODB.Recordset

Data_Verify = False
If Val(mskFormBoundField.Text) < 1 And FormAddEditMode = cFORM_EDITMODE Then
    ErrorBox "Invalid Key Value !!!"
    txtSgpName.SetFocus
    Exit Function
End If
If Trim(txtSgpName.Text) = "" Then
    ErrorBox "Invalid Service Group Name !!!"
    txtSgpName.SetFocus
    Exit Function
End If
If txtSgpName.Text <> mSgpName_old Then
    If ChkIsDuplicate(dbVgnDatabase, "ServGrpMst", "SgpName", txtSgpName.Text, "SgpCode", Val(mskFormBoundField.Text)) = True Then
        ErrorBox "Duplicate Input !!!"
        txtSgpName.SetFocus
        Exit Function
    End If
End If
If Val(mskSgpIndex.Text) < 0 Then
    ErrorBox "Invalid Index !!!"
    mskSgpIndex.SetFocus
    Exit Function
Else
    With tRecset
    .open "Select SgpCode from ServGrpMst order by SgpCode", dbVgnDatabase, adOpenKeyset, adLockOptimistic
    If .RecordCount < Val(mskSgpIndex.Text) Or Val(mskSgpIndex.Text) = 0 Then
        mskSgpIndex.Text = CStr(.RecordCount + IIf(FormAddEditMode = cFORM_ADDMODE, 1, 0))
    End If
    End With
    CloseTable tRecset
End If
CloseTable tRecset, mCheckOpen:=True

Data_Verify = True

End Function

Private Sub mskSgpDiscPer_GotFocus()
FlashActiveControl mskSgpDiscPer, True
End Sub

Private Sub mskSgpDiscPer_LostFocus()
FlashActiveControl mskSgpDiscPer, False
End Sub

Private Sub mskSgpDiscPer_Validate(Cancel As Boolean)
mskSgpDiscPer.Text = ToMyPerFmt(mskSgpDiscPer.Text)
If Val(UnMyPerFmt(mskSgpDiscPer.Text)) < 0 Then
    ErrorBox "Invalid Discount Percentage !!!"
    mskSgpDiscPer.SetFocus
    Cancel = True
End If

End Sub

Private Sub mskSgpIndex_GotFocus()
FlashActiveControl mskSgpIndex, True
End Sub

Private Sub mskSgpIndex_LostFocus()
FlashActiveControl mskSgpIndex, False
End Sub

Private Sub mskSgpIndex_Validate(Cancel As Boolean)
Dim tRecset As New ADODB.Recordset

mskSgpIndex.Text = ToMyNumFmt(mskSgpIndex.Text, mDecimals:=0, mUseAbs:=True, mGroupedDigit:=False)
If Val(mskSgpIndex.Text) < 0 Then
    ErrorBox "Invalid Index !!!"
    mskSgpIndex.SetFocus
    Cancel = True
Else
    With tRecset
    .open "Select SgpCode from ServGrpMst order by SgpCode", dbVgnDatabase, adOpenKeyset, adLockOptimistic
    If .RecordCount < Val(mskSgpIndex.Text) Or Val(mskSgpIndex.Text) = 0 Then
        mskSgpIndex.Text = CStr(.RecordCount + IIf(FormAddEditMode = cFORM_ADDMODE, 1, 0))
    End If
    End With
    CloseTable tRecset
End If

CloseTable tRecset, mCheckOpen:=True

End Sub

Private Sub txtSgpName_GotFocus()
FlashActiveControl txtSgpName, True
End Sub

Private Sub txtSgpName_LostFocus()
FlashActiveControl txtSgpName, False
End Sub

Private Sub txtSgpName_Validate(Cancel As Boolean)
txtSgpName.Text = ToMyWord(txtSgpName.Text)
If Trim(txtSgpName.Text) = "" Then
    ErrorBox "Invalid Input !!!"
    Cancel = True
    txtSgpName.SetFocus
Else
    If txtSgpName.Text <> mSgpName_old Then
        If ChkIsDuplicate(dbVgnDatabase, "ServGrpMst", "SgpName", txtSgpName.Text, "SgpCode", Val(mskFormBoundField.Text)) = True Then
            ErrorBox "Duplicate Input !!!"
            Cancel = True
            txtSgpName.SetFocus
        End If
    End If
End If

End Sub

Private Sub Data_AddEvent()

If CanUserAddOpt(mUsrCode:=MyCompany.mUserCode, mMenuOptName:=Me.SecuMenuName) = False Then
    AlertBox "Not Permitted !!!"
    Exit Sub
End If
If clsSGP.BeginMast(0) = False Then
    Exit Sub
End If
mEntrySaved = False: mEntryAborted = False
FormAddEditMode = cFORM_ADDMODE
    
clsSGP.Clear
mSgpCode = clsSGP.ActiveCode
mskFormBoundField.Text = mSgpCode
txtSgpName.Text = ""
mskSgpIndex.Text = 0
chkSgpInfAllowed.Value = vbChecked
chkSgpDefAllowed.Value = vbChecked
chkSgpDiscAllowed.Value = vbChecked
mskSgpDiscPer.Text = ToMyPerFmt(0)
chkSgpExpanded.Value = vbChecked
chkSgpEditable.Value = vbChecked
chkSgpShowInList.Value = vbChecked

chkSgpExtRateSys.Value = vbUnchecked
chkSgpDctwseRateSys.Value = vbUnchecked
chkSgpPcgwseRateSys.Value = vbUnchecked
chkSgpRBywseRateSys.Value = vbUnchecked
chkSgpRTowseRateSys.Value = vbUnchecked
chkSgpTimewseRateSys.Value = vbUnchecked

chkSgpExtDiscSys.Value = vbUnchecked
chkSgpDctwseDiscSys.Value = vbUnchecked
chkSgpPcgwseDiscSys.Value = vbUnchecked
chkSgpRBywseDiscSys.Value = vbUnchecked
chkSgpRTowseDiscSys.Value = vbUnchecked
chkSgpTimewseDiscSys.Value = vbUnchecked

chkSgpExtBargSys.Value = vbUnchecked
chkSgpDctwseBargSys.Value = vbUnchecked
chkSgpPcgwseBargSys.Value = vbUnchecked
chkSgpRBywseBargSys.Value = vbUnchecked
chkSgpRTowseBargSys.Value = vbUnchecked
chkSgpTimewseBargSys.Value = vbUnchecked

chkSgpExtShareSys.Value = vbUnchecked
chkSgpDctwseShareSys.Value = vbUnchecked
chkSgpPcgwseShareSys.Value = vbUnchecked
chkSgpRBywseShareSys.Value = vbUnchecked
chkSgpRTowseShareSys.Value = vbUnchecked
chkSgpTimewseShareSys.Value = vbUnchecked

mSgpName_old = txtSgpName.Text
mSgpIndex_old = Val(mskSgpIndex.Text)

Call ShowEntryMode(True)
txtSgpName.SetFocus

End Sub

Private Sub Data_EditEvent()
Dim mLCount As Integer, mUCount As Integer, mCount As Integer

If CanUserEditOpt(mUsrCode:=MyCompany.mUserCode, mMenuOptName:=Me.SecuMenuName) = False Then
    AlertBox "Not Permitted !!!"
    Exit Sub
End If
If clsSGP.BeginMast(datRecset.fields("SgpCode")) = False Then
    Exit Sub
End If
mEntrySaved = False: mEntryAborted = False
FormAddEditMode = cFORM_EDITMODE
With datRecset
mSgpCode = .fields("SgpCode")
clsSGP.GetData mSgpCode
mskFormBoundField.Text = CStr(.fields("SgpCode"))
txtSgpName.Text = .fields("SgpName")
mskSgpIndex.Text = .fields("SgpIndex")
chkSgpInfAllowed.Value = IIf(.fields("SgpInfAllowed") = True, vbChecked, vbUnchecked)
chkSgpDefAllowed.Value = IIf(.fields("SgpDefAllowed") = True, vbChecked, vbUnchecked)
chkSgpDiscAllowed.Value = IIf(.fields("SgpDiscAllowed") = True, vbChecked, vbUnchecked)
mskSgpDiscPer.Text = ToMyPerFmt(.fields("SgpDiscPer"))

chkSgpExpanded.Value = IIf(.fields("SgpExpanded") = True, vbChecked, vbUnchecked)
chkSgpEditable.Value = IIf(.fields("SgpEditable") = True, vbChecked, vbUnchecked)
chkSgpShowInList.Value = IIf(.fields("SgpShowInList") = True, vbChecked, vbUnchecked)

chkSgpExtRateSys.Value = IIf(.fields("SgpExtRateSys") = True, vbChecked, vbUnchecked)
chkSgpDctwseRateSys.Value = IIf(.fields("SgpDctwseRateSys") = True, vbChecked, vbUnchecked)
chkSgpPcgwseRateSys.Value = IIf(.fields("SgpPcgwseRateSys") = True, vbChecked, vbUnchecked)
chkSgpRBywseRateSys.Value = IIf(.fields("SgpRBywseRateSys") = True, vbChecked, vbUnchecked)
chkSgpRTowseRateSys.Value = IIf(.fields("SgpRTowseRateSys") = True, vbChecked, vbUnchecked)
chkSgpTimewseRateSys.Value = IIf(.fields("SgpTimewseRateSys") = True, vbChecked, vbUnchecked)

chkSgpExtDiscSys.Value = IIf(.fields("SgpExtDiscSys") = True, vbChecked, vbUnchecked)
chkSgpDctwseDiscSys.Value = IIf(.fields("SgpDctwseDiscSys") = True, vbChecked, vbUnchecked)
chkSgpPcgwseDiscSys.Value = IIf(.fields("SgpPcgwseDiscSys") = True, vbChecked, vbUnchecked)
chkSgpRBywseDiscSys.Value = IIf(.fields("SgpRBywseDiscSys") = True, vbChecked, vbUnchecked)
chkSgpRTowseDiscSys.Value = IIf(.fields("SgpRTowseDiscSys") = True, vbChecked, vbUnchecked)
chkSgpTimewseDiscSys.Value = IIf(.fields("SgpTimewseDiscSys") = True, vbChecked, vbUnchecked)

chkSgpExtBargSys.Value = IIf(.fields("SgpExtBargSys") = True, vbChecked, vbUnchecked)
chkSgpDctwseBargSys.Value = IIf(.fields("SgpDctwseBargSys") = True, vbChecked, vbUnchecked)
chkSgpPcgwseBargSys.Value = IIf(.fields("SgpPcgwseBargSys") = True, vbChecked, vbUnchecked)
chkSgpRBywseBargSys.Value = IIf(.fields("SgpRBywseBargSys") = True, vbChecked, vbUnchecked)
chkSgpRTowseBargSys.Value = IIf(.fields("SgpRTowseBargSys") = True, vbChecked, vbUnchecked)
chkSgpTimewseBargSys.Value = IIf(.fields("SgpTimewseBargSys") = True, vbChecked, vbUnchecked)

chkSgpExtShareSys.Value = IIf(.fields("SgpExtShareSys") = True, vbChecked, vbUnchecked)
chkSgpDctwseShareSys.Value = IIf(.fields("SgpDctwseShareSys") = True, vbChecked, vbUnchecked)
chkSgpPcgwseShareSys.Value = IIf(.fields("SgpPcgwseShareSys") = True, vbChecked, vbUnchecked)
chkSgpRBywseShareSys.Value = IIf(.fields("SgpRBywseShareSys") = True, vbChecked, vbUnchecked)
chkSgpRTowseShareSys.Value = IIf(.fields("SgpRTowseShareSys") = True, vbChecked, vbUnchecked)
chkSgpTimewseShareSys.Value = IIf(.fields("SgpTimewseShareSys") = True, vbChecked, vbUnchecked)

End With

mSgpName_old = txtSgpName.Text
mSgpIndex_old = Val(mskSgpIndex.Text)

Call ShowEntryMode(True)
txtSgpName.SetFocus

End Sub

Private Sub Data_SaveEvent()
Dim tRecset As New ADODB.Recordset

With clsSGP
If FormAddEditMode = cFORM_ADDMODE Then
    .Clear
Else
    .GetData mSgpCode
End If
.mName_str = txtSgpName.Text
.mSgpIndex_int = Val(mskSgpIndex.Text)
.mSgpInfAllowed_bln = (chkSgpInfAllowed.Value = vbChecked)
.mSgpDefAllowed_bln = (chkSgpDefAllowed.Value = vbChecked)
.mSgpDiscAllowed_bln = (chkSgpDiscAllowed.Value = vbChecked)
.mSgpDiscPer_dbl = Val(UnMyPerFmt(mskSgpDiscPer.Text))
.mSgpExpanded_bln = (chkSgpExpanded.Value = vbChecked)
.mSgpEditable_bln = (chkSgpEditable.Value = vbChecked)
.mSgpShowInList_bln = (chkSgpShowInList.Value = vbChecked)

.mSgpExtRateSys_bln = (chkSgpExtRateSys.Value = vbChecked)
.mSgpDctwseRateSys_bln = (chkSgpDctwseRateSys.Value = vbChecked)
.mSgpDctwseRateSys_bln = (chkSgpDctwseRateSys.Value = vbChecked)
.mSgpPcgwseRateSys_bln = (chkSgpPcgwseRateSys.Value = vbChecked)
.mSgpRBywseRateSys_bln = (chkSgpRBywseRateSys.Value = vbChecked)
.mSgpRTowseRateSys_bln = (chkSgpRTowseRateSys.Value = vbChecked)
.mSgpTimewseRateSys_bln = (chkSgpTimewseRateSys.Value = vbChecked)

.mSgpExtDiscSys_bln = (chkSgpExtDiscSys.Value = vbChecked)
.mSgpDctwseDiscSys_bln = (chkSgpDctwseDiscSys.Value = vbChecked)
.mSgpPcgwseDiscSys_bln = (chkSgpPcgwseDiscSys.Value = vbChecked)
.mSgpRBywseDiscSys_bln = (chkSgpRBywseDiscSys.Value = vbChecked)
.mSgpRTowseDiscSys_bln = (chkSgpRTowseDiscSys.Value = vbChecked)
.mSgpTimewseDiscSys_bln = (chkSgpTimewseDiscSys.Value = vbChecked)

.mSgpExtBargSys_bln = (chkSgpExtBargSys.Value = vbChecked)
.mSgpDctwseBargSys_bln = (chkSgpDctwseBargSys.Value = vbChecked)
.mSgpPcgwseBargSys_bln = (chkSgpPcgwseBargSys.Value = vbChecked)
.mSgpRBywseBargSys_bln = (chkSgpRBywseBargSys.Value = vbChecked)
.mSgpRTowseBargSys_bln = (chkSgpRTowseBargSys.Value = vbChecked)
.mSgpTimewseBargSys_bln = (chkSgpTimewseBargSys.Value = vbChecked)

.mSgpExtShareSys_bln = (chkSgpExtShareSys.Value = vbChecked)
.mSgpDctwseShareSys_bln = (chkSgpDctwseShareSys.Value = vbChecked)
.mSgpPcgwseShareSys_bln = (chkSgpPcgwseShareSys.Value = vbChecked)
.mSgpRBywseShareSys_bln = (chkSgpRBywseShareSys.Value = vbChecked)
.mSgpRTowseShareSys_bln = (chkSgpRTowseShareSys.Value = vbChecked)
.mSgpTimewseShareSys_bln = (chkSgpTimewseShareSys.Value = vbChecked)

If FormAddEditMode = cFORM_ADDMODE Then
    .AddNew
    mskFormBoundField.Text = .mCode_lng
Else
    .Update mSgpCode
End If
If .mCode_lng > 0 Then   ' updated successfully
    .UpdateMast .mCode_lng
    .EndMast .mCode_lng
    mEntrySaved = True
    
    Rem re-ordering index order
    RefreshDatabase dbVgnDatabase
    dbVgnDatabase.BeginTrans
    tRecset.open "Select * from ServGrpMst where SgpCode<>" & CStr(.mCode_lng) & " and SgpIndex=" & .mSgpIndex_int & "", dbVgnDatabase, adOpenKeyset, adLockOptimistic
    If tRecset.RecordCount > 0 Then
        If FormAddEditMode = cFORM_ADDMODE Then
            tRecset.fields("SgpIndex") = tRecset.RecordCount
        Else
            tRecset.fields("SgpIndex") = mSgpIndex_old
        End If
        tRecset.Update
    End If
    dbVgnDatabase.CommitTrans
    CloseTable tRecset
Else
    Call Data_CancelEvent
    ErrorBox "Entry Cancelled !!!"
End If

End With

CloseTable tRecset, mCheckOpen:=True
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

mSgpCode = datRecset.fields("SgpCode")
mRecAbsPos = datRecset.AbsolutePosition

If clsSGP.CanDeleteMast(mSgpCode) = True Then
    txtVoid.SetFocus
    If clsSGP.BeginMast(mSgpCode) = True Then
        clsSGP.GetData mSgpCode
        
        clsSGP.DeleteMast mSgpCode
        clsSGP.UpdateMast mSgpCode
        clsSGP.EndMast mSgpCode
        
        dbVgnDatabase.BeginTrans
        dbVgnDatabase.Execute "Update ServGrpMst set SgpIndex=SgpIndex-1 where SgpIndex>=" & CStr(clsSGP.mSgpIndex_int) & " and SgpCode<>" & CStr(mSgpCode) & ""
        dbVgnDatabase.CommitTrans
        
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
clsSGP.CancelMast mSgpCode
clsSGP.EndMast mSgpCode
mEntryAborted = True

End Sub

Private Sub SmryList()
Dim gcolcount As Integer, acount As Integer, mLow As Integer, mHigh As Integer, mPos As Integer, srow As Long, mColCount As Integer

clsListStru.Clear

Rem column definitions
clsListStru.AddFields mExpr:="SgpCode", mAttrib:=cFAT_SYSTEM
clsListStru.AddFields mExpr:="SgpName", mTitle:="Group Name", mAlign:=1, mWidth:=4000, mShowItem:=True
clsListStru.AddFields mExpr:="SgpIndex", mTitle:="Index", mAlign:=7, mWidth:=1000, mShowItem:=True
clsListStru.AddFields mExpr:="SgpShowInList", mTitle:="Show List", mAlign:=1, mWidth:=1000, mShowItem:=True

RefreshDatabase dbVgnDatabase
datRecset.Requery

Mfgrd1.Height = Int(Mfgrd1.Height / Mfgrd1.RowHeightMin) * Mfgrd1.RowHeightMin
Mfgrd1.Cols = clsListStru.UFields + 1
gcolcount = 0
mLow = clsListStru.LFields
mHigh = clsListStru.UFields
For acount = mLow To mHigh
    With Mfgrd1
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
        Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("SgpCode")) = .fields("SgpCode")
        Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("SgpName")) = .fields("SgpName")
        Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("SgpIndex")) = .fields("SgpIndex")
        Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("SgpShowInList")) = IIf(.fields("SgpShowInList") = True, "Yes", "No")
        
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
If MyAddNewKey(Shift, KeyCode) = True Then
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
    txtSearch1Text.Text = JoinKeyAscii(txtSearch1Text.Text, KeyAscii)
    Call txtSearch1Text_InterActiveChange
End If

End Sub

Private Sub Mfgrd1_RowColChange()
If datRecset.RecordCount > 0 Then
    If datRecset.AbsolutePosition <> Mfgrd1.Row - Mfgrd1.FixedRows + 1 Then
        datRecset.MoveFirst
        datRecset.Move Mfgrd1.Row - Mfgrd1.FixedRows, 1     ' Mfgrd1.Row is already less by one
    End If
End If
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
SearchFlex Mfgrd1, clsListStru.GetItemIndex("SgpName"), mText
ShowActiveFlexRow Mfgrd1

End Sub

Private Sub txtSearch1Text_GotFocus()
FlashActiveControl txtSearch1Text, True
End Sub

Private Sub txtSearch1Text_LostFocus()
FlashActiveControl txtSearch1Text, False
End Sub

