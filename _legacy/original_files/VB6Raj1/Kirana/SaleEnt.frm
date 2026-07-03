VERSION 5.00
Object = "{5E9E78A0-531B-11CF-91F6-C2863C385E30}#1.0#0"; "MSFLXGRD.OCX"
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form frmSalesInv 
   Appearance      =   0  'Flat
   BackColor       =   &H80000005&
   ClientHeight    =   10860
   ClientLeft      =   60
   ClientTop       =   60
   ClientWidth     =   15180
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
   ScaleHeight     =   10860
   ScaleWidth      =   15180
   ShowInTaskbar   =   0   'False
   Begin MSComctlLib.StatusBar StatusBar1 
      Align           =   2  'Align Bottom
      Height          =   315
      Left            =   0
      TabIndex        =   115
      Top             =   10545
      Width           =   15180
      _ExtentX        =   26776
      _ExtentY        =   556
      _Version        =   393216
      BeginProperty Panels {8E3867A5-8586-11D1-B16A-00C0F0283628} 
         NumPanels       =   9
         BeginProperty Panel1 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            Object.Width           =   6174
            MinWidth        =   6174
            Text            =   "CompanyName"
            TextSave        =   "CompanyName"
         EndProperty
         BeginProperty Panel2 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            Object.Width           =   2646
            MinWidth        =   2646
            Text            =   "Fin-Year"
            TextSave        =   "Fin-Year"
         EndProperty
         BeginProperty Panel3 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            Object.Width           =   3087
            MinWidth        =   3087
            Text            =   "UserName"
            TextSave        =   "UserName"
         EndProperty
         BeginProperty Panel4 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            Text            =   "UserRole"
            TextSave        =   "UserRole"
         EndProperty
         BeginProperty Panel5 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            Object.Width           =   2381
            MinWidth        =   2381
            Text            =   "CurrentDate"
            TextSave        =   "CurrentDate"
         EndProperty
         BeginProperty Panel6 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            Object.Width           =   2381
            MinWidth        =   2381
            Text            =   "SystemDate"
            TextSave        =   "SystemDate"
         EndProperty
         BeginProperty Panel7 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            Style           =   5
            Object.Width           =   1764
            MinWidth        =   1764
            Text            =   "SystemTime"
            TextSave        =   "12:19"
         EndProperty
         BeginProperty Panel8 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            Style           =   1
            Enabled         =   0   'False
            Object.Width           =   1764
            MinWidth        =   1764
            Text            =   "CapsLock"
            TextSave        =   "CAPS"
         EndProperty
         BeginProperty Panel9 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            Style           =   2
            Object.Width           =   1764
            MinWidth        =   1764
            Text            =   "NumLock"
            TextSave        =   "NUM"
         EndProperty
      EndProperty
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
      TabIndex        =   55
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
      TabIndex        =   54
      TabStop         =   0   'False
      Top             =   0
      Width           =   255
   End
   Begin VB.ComboBox cmbFormEntryMode 
      Appearance      =   0  'Flat
      Enabled         =   0   'False
      Height          =   315
      ItemData        =   "SaleEnt.frx":0000
      Left            =   0
      List            =   "SaleEnt.frx":000D
      Style           =   1  'Simple Combo
      TabIndex        =   53
      TabStop         =   0   'False
      Text            =   "cmbFormEntryMode"
      Top             =   480
      Width           =   1455
   End
   Begin VB.TextBox txtVoid 
      CausesValidation=   0   'False
      Height          =   375
      Left            =   0
      TabIndex        =   49
      TabStop         =   0   'False
      Text            =   "Void"
      Top             =   10080
      Width           =   375
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
      Height          =   9615
      Left            =   120
      TabIndex        =   52
      Top             =   840
      Width           =   14895
      Begin VB.Frame frHeader 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         ForeColor       =   &H80000008&
         Height          =   2895
         Left            =   120
         TabIndex        =   87
         Top             =   240
         Width           =   14655
         Begin VB.TextBox mskSalStkCode 
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
            Left            =   3600
            TabIndex        =   1
            Tag             =   "AhCode"
            Text            =   "-1"
            Top             =   240
            Width           =   1455
         End
         Begin VB.TextBox dtpSalTrnRefDt 
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
            Left            =   5400
            MaxLength       =   50
            TabIndex        =   14
            Text            =   "dd/mm/yyyy"
            Top             =   2520
            Width           =   1455
         End
         Begin VB.TextBox txtSalTrnRefNo 
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
            Left            =   2040
            MaxLength       =   15
            TabIndex        =   13
            Tag             =   "AhCode"
            Top             =   2520
            Width           =   2355
         End
         Begin VB.TextBox txtSalTime_str 
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
            Left            =   11040
            MaxLength       =   50
            TabIndex        =   12
            TabStop         =   0   'False
            Text            =   "00:00"
            Top             =   2160
            Width           =   855
         End
         Begin VB.TextBox dtpSalDate 
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
            Left            =   8880
            MaxLength       =   50
            TabIndex        =   11
            Text            =   "dd/mm/yyyy"
            Top             =   2160
            Width           =   1455
         End
         Begin VB.TextBox mskSalVchNo 
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
            Index           =   0
            Left            =   6360
            TabIndex        =   10
            Tag             =   "AhCode"
            Text            =   "0"
            Top             =   2160
            Width           =   1455
         End
         Begin VB.TextBox txtVtmName 
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
            Index           =   0
            Left            =   2040
            MaxLength       =   50
            TabIndex        =   8
            Top             =   2160
            Width           =   2355
         End
         Begin VB.TextBox txtSalPrefix 
            Alignment       =   1  'Right Justify
            Appearance      =   0  'Flat
            BorderStyle     =   0  'None
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
            Left            =   5400
            TabIndex        =   9
            Tag             =   "AhCode"
            Text            =   "[Prefix]"
            Top             =   2160
            Width           =   975
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
            Left            =   2040
            TabIndex        =   0
            Tag             =   "AhCode"
            Text            =   "-1"
            Top             =   240
            Width           =   1455
         End
         Begin VB.TextBox txtPrtName 
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
            Left            =   2040
            MaxLength       =   50
            TabIndex        =   2
            Top             =   720
            Width           =   5295
         End
         Begin VB.TextBox txtPrtAddr 
            Appearance      =   0  'Flat
            BorderStyle     =   0  'None
            BeginProperty DataFormat 
               Type            =   0
               Format          =   "0"
               HaveTrueFalseNull=   0
               FirstDayOfWeek  =   0
               FirstWeekOfYear =   0
               LCID            =   1033
               SubFormatType   =   0
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
            Height          =   645
            Left            =   2040
            Locked          =   -1  'True
            MaxLength       =   250
            TabIndex        =   3
            TabStop         =   0   'False
            Top             =   1020
            Width           =   5295
         End
         Begin VB.TextBox txtAraName 
            Appearance      =   0  'Flat
            BorderStyle     =   0  'None
            BeginProperty DataFormat 
               Type            =   0
               Format          =   "0"
               HaveTrueFalseNull=   0
               FirstDayOfWeek  =   0
               FirstWeekOfYear =   0
               LCID            =   1033
               SubFormatType   =   0
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
            Left            =   2040
            Locked          =   -1  'True
            MaxLength       =   50
            TabIndex        =   6
            TabStop         =   0   'False
            Top             =   1680
            Width           =   5295
         End
         Begin VB.TextBox txtStnName 
            Appearance      =   0  'Flat
            BorderStyle     =   0  'None
            BeginProperty DataFormat 
               Type            =   0
               Format          =   "0"
               HaveTrueFalseNull=   0
               FirstDayOfWeek  =   0
               FirstWeekOfYear =   0
               LCID            =   1033
               SubFormatType   =   0
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
            Left            =   8880
            Locked          =   -1  'True
            MaxLength       =   50
            TabIndex        =   7
            TabStop         =   0   'False
            Top             =   1680
            Width           =   5295
         End
         Begin VB.TextBox txtPrtTelNo 
            Appearance      =   0  'Flat
            BorderStyle     =   0  'None
            BeginProperty DataFormat 
               Type            =   0
               Format          =   "0"
               HaveTrueFalseNull=   0
               FirstDayOfWeek  =   0
               FirstWeekOfYear =   0
               LCID            =   1033
               SubFormatType   =   0
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
            Left            =   8880
            Locked          =   -1  'True
            MaxLength       =   50
            TabIndex        =   4
            TabStop         =   0   'False
            Top             =   1020
            Width           =   5295
         End
         Begin VB.TextBox txtPrtSMSNo 
            Appearance      =   0  'Flat
            BorderStyle     =   0  'None
            BeginProperty DataFormat 
               Type            =   0
               Format          =   "0"
               HaveTrueFalseNull=   0
               FirstDayOfWeek  =   0
               FirstWeekOfYear =   0
               LCID            =   1033
               SubFormatType   =   0
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
            Left            =   8880
            Locked          =   -1  'True
            MaxLength       =   50
            TabIndex        =   5
            TabStop         =   0   'False
            Top             =   1320
            Width           =   5295
         End
         Begin VB.TextBox txtSahRemark 
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
            Left            =   7920
            MaxLength       =   50
            TabIndex        =   15
            Top             =   2520
            Width           =   5295
         End
         Begin VB.Label Label2 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Ref.Date:"
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
            Index           =   2
            Left            =   4440
            TabIndex        =   106
            Top             =   2520
            Width           =   975
         End
         Begin VB.Label Label2 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Ref.No.:"
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
            TabIndex        =   105
            Top             =   2520
            Width           =   1935
         End
         Begin VB.Label Label2 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Date:"
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
            Index           =   39
            Left            =   8160
            TabIndex        =   99
            Top             =   2160
            Width           =   495
         End
         Begin VB.Label Label2 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Time:"
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
            Index           =   38
            Left            =   10440
            TabIndex        =   98
            Top             =   2160
            Width           =   495
         End
         Begin VB.Label Label2 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Vch.No.:"
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
            Index           =   37
            Left            =   4440
            TabIndex        =   97
            Top             =   2160
            Width           =   855
         End
         Begin VB.Label lblVchType 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Vch.Type:"
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
            Left            =   120
            TabIndex        =   96
            Top             =   2160
            Width           =   1935
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
            Left            =   120
            TabIndex        =   95
            Top             =   240
            Width           =   1935
         End
         Begin VB.Label Label2 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Party Name:"
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
            Left            =   120
            TabIndex        =   94
            Top             =   720
            Width           =   1935
         End
         Begin VB.Line Line3 
            Index           =   1
            X1              =   0
            X2              =   14640
            Y1              =   600
            Y2              =   600
         End
         Begin VB.Label Label2 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Address:"
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
            Index           =   8
            Left            =   120
            TabIndex        =   93
            Top             =   1020
            Width           =   1935
         End
         Begin VB.Label Label2 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Area:"
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
            Left            =   120
            TabIndex        =   92
            Top             =   1680
            Width           =   855
         End
         Begin VB.Label Label2 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Station:"
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
            Index           =   10
            Left            =   7440
            TabIndex        =   91
            Top             =   1680
            Width           =   1455
         End
         Begin VB.Label Label2 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Contact No.:"
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
            Index           =   11
            Left            =   7440
            TabIndex        =   90
            Top             =   1020
            Width           =   1575
         End
         Begin VB.Label Label2 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "SMS Mobile No:"
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
            Index           =   12
            Left            =   7440
            TabIndex        =   89
            Top             =   1320
            Width           =   1575
         End
         Begin VB.Label Label2 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Remark:"
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
            Index           =   33
            Left            =   6960
            TabIndex        =   88
            Top             =   2520
            Width           =   975
         End
         Begin VB.Shape Shape1 
            BackColor       =   &H00D9FFB3&
            BackStyle       =   1  'Opaque
            Height          =   1935
            Index           =   0
            Left            =   0
            Top             =   120
            Width           =   14655
         End
         Begin VB.Shape Shape1 
            BackColor       =   &H00F7D987&
            BackStyle       =   1  'Opaque
            Height          =   855
            Index           =   2
            Left            =   0
            Top             =   2040
            Width           =   14655
         End
      End
      Begin VB.CommandButton cmdSaveForm 
         Appearance      =   0  'Flat
         BackColor       =   &H80000009&
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Left            =   10440
         Style           =   1  'Graphical
         TabIndex        =   48
         Top             =   9180
         Width           =   375
      End
      Begin MSFlexGridLib.MSFlexGrid Mfgrd2 
         Height          =   2415
         Left            =   120
         TabIndex        =   16
         Top             =   4680
         Width           =   14655
         _ExtentX        =   25850
         _ExtentY        =   4260
         _Version        =   393216
         RowHeightMin    =   285
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
      Begin VB.Frame frFooter 
         Appearance      =   0  'Flat
         BackColor       =   &H00E0E0E0&
         ForeColor       =   &H80000008&
         Height          =   2475
         Left            =   120
         TabIndex        =   100
         Top             =   7080
         Width           =   14655
         Begin VB.TextBox mskSahDiscAmt 
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
            Left            =   12840
            TabIndex        =   42
            Text            =   "SahDiscAmt"
            Top             =   540
            Width           =   1575
         End
         Begin VB.TextBox mskSahDiscPer 
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
            Left            =   11760
            TabIndex        =   41
            Text            =   "SahDiscPer"
            Top             =   540
            Width           =   1095
         End
         Begin VB.TextBox mskSahAmount 
            Alignment       =   1  'Right Justify
            Appearance      =   0  'Flat
            BorderStyle     =   0  'None
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
               Italic          =   -1  'True
               Strikethrough   =   0   'False
            EndProperty
            Height          =   285
            Left            =   12840
            Locked          =   -1  'True
            TabIndex        =   47
            Text            =   "SahAmount"
            Top             =   1740
            Width           =   1575
         End
         Begin VB.TextBox mskSahTaxPer 
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
            Left            =   11760
            TabIndex        =   43
            Text            =   "SahTaxPer"
            Top             =   840
            Width           =   1095
         End
         Begin VB.TextBox mskSahTaxAmt 
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
            Left            =   12840
            TabIndex        =   44
            Text            =   "SahTaxAmt"
            Top             =   840
            Width           =   1575
         End
         Begin VB.TextBox mskSahOtherAmt 
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
            Left            =   12840
            TabIndex        =   45
            Text            =   "SahOtherAmt"
            Top             =   1140
            Width           =   1575
         End
         Begin VB.TextBox mskSahROffAmt 
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
            Left            =   12840
            TabIndex        =   46
            Text            =   "SahROffAmt"
            Top             =   1440
            Width           =   1575
         End
         Begin VB.Label Label2 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Discount:"
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
            Index           =   15
            Left            =   10320
            TabIndex        =   140
            Top             =   540
            Width           =   1455
         End
         Begin VB.Label lblSalOutPckQtyTot 
            Alignment       =   1  'Right Justify
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            Caption         =   "SalOutPckQtyTot"
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
            Left            =   5520
            TabIndex        =   139
            Top             =   120
            Width           =   855
         End
         Begin VB.Label lblSalDiscAmtTot 
            Alignment       =   1  'Right Justify
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            Caption         =   "SalDiscAmtTot"
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
            Left            =   10620
            TabIndex        =   138
            Top             =   120
            Width           =   1095
         End
         Begin VB.Label lblSalBasicAmtTot 
            Alignment       =   1  'Right Justify
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            Caption         =   "SalAmtBefTax"
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
            Left            =   12840
            TabIndex        =   112
            Top             =   120
            Width           =   1575
         End
         Begin VB.Label lblSalTaxAmtTot 
            Alignment       =   1  'Right Justify
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            Caption         =   "SalTaxAmtTot"
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
            Left            =   11760
            TabIndex        =   111
            Top             =   120
            Width           =   1095
         End
         Begin VB.Label Label2 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Tax:"
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
            Index           =   5
            Left            =   10320
            TabIndex        =   110
            Top             =   840
            Width           =   1455
         End
         Begin VB.Label Label2 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Other Chg.:"
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
            Index           =   6
            Left            =   10320
            TabIndex        =   109
            Top             =   1140
            Width           =   1455
         End
         Begin VB.Label Label2 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Round Off:"
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
            Index           =   7
            Left            =   10320
            TabIndex        =   108
            Top             =   1440
            Width           =   1455
         End
         Begin VB.Label Label2 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Net Amount:"
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
            Index           =   13
            Left            =   10320
            TabIndex        =   107
            Top             =   1740
            Width           =   1455
         End
         Begin VB.Label Label2 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Last Sale:"
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
            Index           =   14
            Left            =   120
            TabIndex        =   104
            Top             =   2040
            Width           =   1695
         End
         Begin VB.Label lblOldSalCodeDesc 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
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
            Left            =   1920
            TabIndex        =   103
            Top             =   2040
            Width           =   6135
         End
         Begin VB.Label lblLinkTranDesc 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BorderStyle     =   1  'Fixed Single
            Caption         =   "Job Issue Detail:"
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
            Height          =   1455
            Left            =   0
            TabIndex        =   102
            Top             =   480
            Width           =   9975
            WordWrap        =   -1  'True
         End
         Begin VB.Label lblSalQtyTot 
            Alignment       =   1  'Right Justify
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            Caption         =   "SalQtyTot"
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
            Left            =   6420
            TabIndex        =   101
            Top             =   120
            Width           =   855
         End
      End
      Begin VB.Frame frDetail 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         ForeColor       =   &H80000008&
         Height          =   1635
         Left            =   120
         TabIndex        =   116
         Top             =   3060
         Width           =   14295
         Begin VB.TextBox mskSalItrCode 
            Alignment       =   1  'Right Justify
            Appearance      =   0  'Flat
            BackColor       =   &H8000000B&
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
            Left            =   4380
            TabIndex        =   141
            Tag             =   "AhCode"
            Text            =   "SalItrCode"
            Top             =   1380
            Visible         =   0   'False
            Width           =   1335
         End
         Begin VB.TextBox mskSalPurCode 
            Alignment       =   1  'Right Justify
            Appearance      =   0  'Flat
            BackColor       =   &H00C0C0C0&
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
            Left            =   5700
            TabIndex        =   137
            Tag             =   "AhCode"
            Text            =   "SalPurCode"
            Top             =   1380
            Visible         =   0   'False
            Width           =   1335
         End
         Begin VB.TextBox mskSalPurICode 
            Alignment       =   1  'Right Justify
            Appearance      =   0  'Flat
            BackColor       =   &H00C0C0C0&
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
            Left            =   7020
            TabIndex        =   136
            Tag             =   "AhCode"
            Text            =   "SalPurICode"
            Top             =   1380
            Visible         =   0   'False
            Width           =   1335
         End
         Begin VB.ComboBox cmbSalTaxType 
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
            Left            =   11520
            Style           =   2  'Dropdown List
            TabIndex        =   35
            Top             =   420
            Width           =   1275
         End
         Begin VB.ComboBox cmbSalDiscType 
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
            Left            =   10080
            Style           =   2  'Dropdown List
            TabIndex        =   31
            Top             =   420
            Width           =   1335
         End
         Begin VB.TextBox mskSalTaxableAmt 
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
            Left            =   11520
            TabIndex        =   37
            Text            =   "TaxableAmt"
            Top             =   1020
            Width           =   1275
         End
         Begin VB.TextBox mskSalDiscableAmt 
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
            Left            =   10080
            TabIndex        =   33
            Text            =   "DiscableAmt"
            Top             =   1020
            Width           =   1335
         End
         Begin VB.TextBox mskSalDiscPer 
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
               Name            =   "MS Sans Serif"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   285
            Left            =   10080
            TabIndex        =   32
            Tag             =   "AhCode"
            Text            =   "DiscPer"
            Top             =   720
            Width           =   1335
         End
         Begin VB.TextBox mskSalDiscAmt 
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
               Name            =   "MS Sans Serif"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   285
            Left            =   10080
            TabIndex        =   34
            Tag             =   "AhCode"
            Text            =   "DiscAmt"
            Top             =   1320
            Width           =   1335
         End
         Begin VB.TextBox txtSalInrPckNm 
            Alignment       =   1  'Right Justify
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
               Name            =   "MS Sans Serif"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   285
            Left            =   6480
            MaxLength       =   5
            TabIndex        =   25
            TabStop         =   0   'False
            Text            =   "InrPckNm"
            Top             =   720
            Width           =   1215
         End
         Begin VB.TextBox mskSalInrPckSz 
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
               Name            =   "MS Sans Serif"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   285
            Left            =   5400
            TabIndex        =   24
            Tag             =   "AhCode"
            Text            =   "InrPckSz"
            Top             =   720
            Width           =   1095
         End
         Begin VB.TextBox txtSalOutPckNm 
            Alignment       =   1  'Right Justify
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
               Name            =   "MS Sans Serif"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   285
            Left            =   6480
            MaxLength       =   5
            TabIndex        =   23
            TabStop         =   0   'False
            Text            =   "OutPckNm"
            Top             =   420
            Width           =   1215
         End
         Begin VB.TextBox mskSalOutPckQty 
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
               Name            =   "MS Sans Serif"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   285
            Left            =   5400
            TabIndex        =   22
            Tag             =   "AhCode"
            Text            =   "OutPckQty"
            Top             =   420
            Width           =   1095
         End
         Begin VB.TextBox mskSalBasicAmt 
            Alignment       =   1  'Right Justify
            Appearance      =   0  'Flat
            BackColor       =   &H8000000B&
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
            Left            =   8340
            TabIndex        =   120
            Text            =   "SalBasicAmt"
            Top             =   1380
            Visible         =   0   'False
            Width           =   1455
         End
         Begin VB.TextBox mskSalTaxAmt 
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
               Name            =   "MS Sans Serif"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   285
            Left            =   11520
            TabIndex        =   38
            Tag             =   "AhCode"
            Text            =   "TaxAmt"
            Top             =   1320
            Width           =   1275
         End
         Begin VB.TextBox mskSalTaxPer 
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
               Name            =   "MS Sans Serif"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   285
            Left            =   11520
            TabIndex        =   36
            Tag             =   "AhCode"
            Text            =   "TaxPer"
            Top             =   720
            Width           =   1275
         End
         Begin VB.TextBox mskSalWslRate 
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
               Name            =   "MS Sans Serif"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   285
            Left            =   8820
            TabIndex        =   29
            Tag             =   "AhCode"
            Text            =   "WslRate"
            Top             =   720
            Width           =   1215
         End
         Begin VB.TextBox mskSalMRP 
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
               Name            =   "MS Sans Serif"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   285
            Left            =   8820
            TabIndex        =   28
            Tag             =   "AhCode"
            Text            =   "MRP"
            Top             =   420
            Width           =   1215
         End
         Begin VB.TextBox txtSalNarr 
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
               Name            =   "MS Sans Serif"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   285
            Left            =   1020
            MaxLength       =   150
            TabIndex        =   19
            Text            =   "SalNarr"
            Top             =   720
            Width           =   3135
         End
         Begin VB.TextBox mskSalStkICode 
            Alignment       =   1  'Right Justify
            Appearance      =   0  'Flat
            BackColor       =   &H8000000B&
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
            Left            =   420
            TabIndex        =   119
            Tag             =   "AhCode"
            Text            =   "SalStkICode"
            Top             =   1380
            Visible         =   0   'False
            Width           =   1335
         End
         Begin VB.TextBox mskSalItmCode 
            Alignment       =   1  'Right Justify
            Appearance      =   0  'Flat
            BackColor       =   &H8000000B&
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
            Left            =   3060
            TabIndex        =   118
            Tag             =   "AhCode"
            Text            =   "SalItmCode"
            Top             =   1380
            Visible         =   0   'False
            Width           =   1335
         End
         Begin VB.TextBox txtSalSimRefNo 
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
               Name            =   "MS Sans Serif"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   285
            Left            =   1020
            MaxLength       =   25
            TabIndex        =   20
            Text            =   "SalSimRefNo"
            Top             =   1020
            Width           =   3135
         End
         Begin VB.TextBox mskSalICode 
            Alignment       =   1  'Right Justify
            Appearance      =   0  'Flat
            BackColor       =   &H8000000B&
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
            Left            =   1740
            TabIndex        =   117
            Tag             =   "AhCode"
            Text            =   "SalICode"
            Top             =   1380
            Visible         =   0   'False
            Width           =   1335
         End
         Begin VB.CommandButton cmdOK 
            Appearance      =   0  'Flat
            BackColor       =   &H008080FF&
            Caption         =   "&OK"
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
            Left            =   13500
            Style           =   1  'Graphical
            TabIndex        =   40
            Top             =   720
            Width           =   735
         End
         Begin VB.TextBox mskSalSno 
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
               Name            =   "MS Sans Serif"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   285
            Left            =   1020
            TabIndex        =   17
            Tag             =   "AhCode"
            Text            =   "1)"
            Top             =   120
            Width           =   555
         End
         Begin VB.TextBox txtSimName 
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
               Name            =   "MS Sans Serif"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   285
            Left            =   1020
            MaxLength       =   50
            TabIndex        =   18
            Text            =   "SimName"
            Top             =   420
            Width           =   3135
         End
         Begin VB.TextBox mskSalAmount 
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
               Name            =   "MS Sans Serif"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   285
            Left            =   12840
            TabIndex        =   39
            Text            =   "SalAmount"
            Top             =   420
            Width           =   1395
         End
         Begin VB.TextBox mskSalRate 
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
               Name            =   "MS Sans Serif"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   285
            Left            =   8820
            TabIndex        =   27
            Tag             =   "AhCode"
            Text            =   "SalRate"
            Top             =   120
            Width           =   1215
         End
         Begin VB.TextBox mskSalQty 
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
               Name            =   "MS Sans Serif"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   285
            Left            =   5400
            TabIndex        =   26
            Tag             =   "AhCode"
            Text            =   "SalQty"
            Top             =   1020
            Width           =   1095
         End
         Begin VB.TextBox txtPckName 
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
            Enabled         =   0   'False
            BeginProperty Font 
               Name            =   "MS Sans Serif"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   285
            Left            =   5400
            MaxLength       =   50
            TabIndex        =   21
            Text            =   "PckName"
            Top             =   120
            Width           =   2295
         End
         Begin VB.TextBox mskSalRtlRate 
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
               Name            =   "MS Sans Serif"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   285
            Left            =   8820
            TabIndex        =   30
            Tag             =   "AhCode"
            Text            =   "RtlRate"
            Top             =   1020
            Width           =   1215
         End
         Begin VB.Label Label2 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Sno.:"
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
            Index           =   16
            Left            =   60
            TabIndex        =   135
            Top             =   120
            Width           =   915
         End
         Begin VB.Label Label2 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Item Nm:"
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
            Index           =   17
            Left            =   60
            TabIndex        =   134
            Top             =   420
            Width           =   975
         End
         Begin VB.Label Label2 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Remark:"
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
            Index           =   18
            Left            =   60
            TabIndex        =   133
            Top             =   720
            Width           =   975
         End
         Begin VB.Label Label2 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Ref.No.:"
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
            Index           =   19
            Left            =   60
            TabIndex        =   132
            Top             =   1020
            Width           =   975
         End
         Begin VB.Label Label2 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Packing:"
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
            Index           =   20
            Left            =   4200
            TabIndex        =   131
            Top             =   120
            Width           =   1215
         End
         Begin VB.Label Label2 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Pack.Qty:"
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
            Index           =   21
            Left            =   4200
            TabIndex        =   130
            Top             =   420
            Width           =   1215
         End
         Begin VB.Label Label2 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Inner Size:"
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
            Index           =   22
            Left            =   4200
            TabIndex        =   129
            Top             =   720
            Width           =   1215
         End
         Begin VB.Label Label2 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Sal.Rate:"
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
            Index           =   23
            Left            =   7740
            TabIndex        =   128
            Top             =   120
            Width           =   1035
         End
         Begin VB.Label Label2 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Inner Qty.:"
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
            Index           =   24
            Left            =   4200
            TabIndex        =   127
            Top             =   1020
            Width           =   1215
         End
         Begin VB.Label Label2 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "MRP:"
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
            Index           =   25
            Left            =   7740
            TabIndex        =   126
            Top             =   420
            Width           =   1035
         End
         Begin VB.Label Label2 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Wsl.Rate:"
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
            Index           =   26
            Left            =   7740
            TabIndex        =   125
            Top             =   720
            Width           =   1035
         End
         Begin VB.Label Label2 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Rtl.Rate:"
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
            Index           =   27
            Left            =   7740
            TabIndex        =   124
            Top             =   1020
            Width           =   1035
         End
         Begin VB.Label Label2 
            Alignment       =   2  'Center
            Appearance      =   0  'Flat
            BackColor       =   &H00FFFF80&
            Caption         =   "Discount"
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
            Index           =   28
            Left            =   10080
            TabIndex        =   123
            Top             =   120
            Width           =   1335
         End
         Begin VB.Label Label2 
            Alignment       =   2  'Center
            Appearance      =   0  'Flat
            BackColor       =   &H00C0FFC0&
            Caption         =   "Tax"
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
            Index           =   29
            Left            =   11520
            TabIndex        =   122
            Top             =   120
            Width           =   1215
         End
         Begin VB.Label Label2 
            Alignment       =   1  'Right Justify
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Amount"
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
            Index           =   30
            Left            =   12960
            TabIndex        =   121
            Top             =   120
            Width           =   1215
         End
         Begin VB.Shape Shape1 
            BackColor       =   &H00C0E0FF&
            BackStyle       =   1  'Opaque
            Height          =   1635
            Index           =   1
            Left            =   0
            Top             =   0
            Width           =   14295
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
      Height          =   7575
      Left            =   120
      TabIndex        =   51
      Top             =   840
      Width           =   15015
      Begin VB.Frame frPrintCRList 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         ForeColor       =   &H80000008&
         Height          =   3615
         Left            =   3660
         TabIndex        =   142
         Top             =   2880
         Width           =   5895
         Begin VB.ComboBox cmbPrinterList 
            Height          =   315
            Left            =   2160
            Style           =   2  'Dropdown List
            TabIndex        =   77
            Top             =   1680
            Width           =   3495
         End
         Begin VB.ComboBox cmbPrintDest 
            Height          =   315
            Left            =   2160
            Style           =   2  'Dropdown List
            TabIndex        =   79
            Top             =   2400
            Width           =   3495
         End
         Begin VB.TextBox mskPrintCopies 
            Alignment       =   1  'Right Justify
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
            Left            =   2160
            TabIndex        =   78
            Text            =   "0"
            Top             =   2040
            Width           =   1455
         End
         Begin VB.ComboBox cmbCRList 
            Height          =   315
            Left            =   2160
            Style           =   2  'Dropdown List
            TabIndex        =   76
            Top             =   1320
            Width           =   3495
         End
         Begin VB.TextBox mskSalVchNo 
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
            Index           =   2
            Left            =   4200
            TabIndex        =   75
            Tag             =   "AhCode"
            Text            =   "0"
            Top             =   960
            Width           =   1455
         End
         Begin VB.TextBox txtVtmName 
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
            Index           =   1
            Left            =   2160
            MaxLength       =   50
            TabIndex        =   73
            Top             =   600
            Width           =   3495
         End
         Begin VB.TextBox mskSalVchNo 
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
            Index           =   1
            Left            =   2160
            TabIndex        =   74
            Tag             =   "AhCode"
            Text            =   "0"
            Top             =   960
            Width           =   1455
         End
         Begin VB.CommandButton cmdPrintCRL 
            Appearance      =   0  'Flat
            BackColor       =   &H00FFFFFF&
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
            Left            =   2520
            Style           =   1  'Graphical
            TabIndex        =   80
            Top             =   3000
            Width           =   855
         End
         Begin VB.Label Label1 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Printer Name:"
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
            Index           =   13
            Left            =   120
            TabIndex        =   150
            Top             =   1680
            Width           =   1935
         End
         Begin VB.Label Label1 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Destination:"
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
            Index           =   12
            Left            =   120
            TabIndex        =   149
            Top             =   2400
            Width           =   1935
         End
         Begin VB.Label Label1 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "No. of Copies:"
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
            Index           =   11
            Left            =   120
            TabIndex        =   148
            Top             =   2040
            Width           =   1935
         End
         Begin VB.Label Label1 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Print Format Name:"
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
            Index           =   10
            Left            =   120
            TabIndex        =   147
            Top             =   1320
            Width           =   1935
         End
         Begin VB.Label Label1 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "To:"
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
            Left            =   3720
            TabIndex        =   146
            Top             =   960
            Width           =   375
         End
         Begin VB.Label Label1 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "From Vch.No.:"
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
            Index           =   8
            Left            =   120
            TabIndex        =   145
            Top             =   960
            Width           =   1935
         End
         Begin VB.Label Label1 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Voucher Type:"
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
            Index           =   7
            Left            =   120
            TabIndex        =   144
            Top             =   600
            Width           =   1935
         End
         Begin VB.Label Label2 
            Alignment       =   2  'Center
            Appearance      =   0  'Flat
            BackColor       =   &H00E0E0E0&
            BorderStyle     =   1  'Fixed Single
            Caption         =   "Print Dialog"
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
            Index           =   31
            Left            =   0
            TabIndex        =   143
            Top             =   0
            Width           =   5895
         End
      End
      Begin VB.Frame frConfigure 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         ForeColor       =   &H80000008&
         Height          =   6495
         Left            =   3000
         TabIndex        =   82
         Top             =   720
         Width           =   7035
         Begin VB.TextBox txtQrySimName 
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
            Left            =   1680
            TabIndex        =   62
            Top             =   1260
            Width           =   4455
         End
         Begin VB.TextBox txtQryVtmName 
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
            Left            =   1680
            TabIndex        =   63
            Top             =   1620
            Width           =   4455
         End
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
            Left            =   3000
            TabIndex        =   72
            Top             =   5880
            Width           =   855
         End
         Begin VB.Frame frGroupOpt 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            Caption         =   "Grouped"
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
            Height          =   3675
            Left            =   2160
            TabIndex        =   64
            Top             =   1980
            Width           =   3255
            Begin VB.OptionButton optItemwise 
               Appearance      =   0  'Flat
               BackColor       =   &H80000005&
               Caption         =   "Item-wise"
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
               Left            =   240
               TabIndex        =   70
               Top             =   2700
               Width           =   2355
            End
            Begin VB.OptionButton optVTypewise 
               Appearance      =   0  'Flat
               BackColor       =   &H80000005&
               Caption         =   "Voucher Type-wise"
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
               Left            =   240
               TabIndex        =   71
               Top             =   3120
               Width           =   2355
            End
            Begin VB.OptionButton optExpanded 
               Appearance      =   0  'Flat
               BackColor       =   &H80000005&
               Caption         =   "Expanded"
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
               Left            =   240
               TabIndex        =   65
               Top             =   360
               Width           =   2355
            End
            Begin VB.OptionButton optDetailed 
               Appearance      =   0  'Flat
               BackColor       =   &H80000005&
               Caption         =   "Detailed"
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
               Left            =   240
               TabIndex        =   66
               Top             =   840
               Value           =   -1  'True
               Width           =   2355
            End
            Begin VB.OptionButton optMonthwise 
               Appearance      =   0  'Flat
               BackColor       =   &H80000005&
               Caption         =   "Month-wise"
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
               Left            =   240
               TabIndex        =   67
               Top             =   1320
               Width           =   2355
            End
            Begin VB.OptionButton optDatewise 
               Appearance      =   0  'Flat
               BackColor       =   &H80000005&
               Caption         =   "Date-wise"
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
               Left            =   240
               TabIndex        =   68
               Top             =   1800
               Width           =   2355
            End
            Begin VB.OptionButton optPartywise 
               Appearance      =   0  'Flat
               BackColor       =   &H80000005&
               Caption         =   "Party-wise"
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
               Left            =   240
               TabIndex        =   69
               Top             =   2280
               Width           =   2355
            End
         End
         Begin VB.TextBox dtpToDate 
            Appearance      =   0  'Flat
            BeginProperty DataFormat 
               Type            =   1
               Format          =   "dd/MM/yyyy"
               HaveTrueFalseNull=   0
               FirstDayOfWeek  =   0
               FirstWeekOfYear =   0
               LCID            =   1033
               SubFormatType   =   3
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
            Left            =   4560
            TabIndex        =   60
            Tag             =   "AhCode"
            Text            =   "dd/mm/yyyy"
            Top             =   540
            Width           =   1575
         End
         Begin VB.TextBox dtpFromDate 
            Appearance      =   0  'Flat
            BeginProperty DataFormat 
               Type            =   1
               Format          =   "dd/MM/yyyy"
               HaveTrueFalseNull=   0
               FirstDayOfWeek  =   0
               FirstWeekOfYear =   0
               LCID            =   1033
               SubFormatType   =   3
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
            Left            =   1680
            TabIndex        =   59
            Tag             =   "AhCode"
            Text            =   "dd/mm/yyyy"
            Top             =   540
            Width           =   1455
         End
         Begin VB.TextBox txtQryPrtName 
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
            Left            =   1680
            TabIndex        =   61
            Top             =   900
            Width           =   4455
         End
         Begin VB.Label Label1 
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
            Index           =   6
            Left            =   120
            TabIndex        =   114
            Top             =   1260
            Width           =   1575
         End
         Begin VB.Label Label1 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Voucher Type:"
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
            Index           =   5
            Left            =   120
            TabIndex        =   113
            Top             =   1620
            Width           =   1575
         End
         Begin VB.Label Label1 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "To Date:"
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
            Left            =   3600
            TabIndex        =   86
            Top             =   540
            Width           =   855
         End
         Begin VB.Label Label1 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "From Date:"
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
            Index           =   2
            Left            =   120
            TabIndex        =   85
            Top             =   540
            Width           =   1455
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
            Index           =   3
            Left            =   0
            TabIndex        =   84
            Top             =   0
            Width           =   7035
         End
         Begin VB.Label Label1 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Party Name:"
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
            TabIndex        =   83
            Top             =   900
            Width           =   1455
         End
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
         Left            =   120
         MousePointer    =   1  'Arrow
         TabIndex        =   58
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
         TabIndex        =   56
         Top             =   360
         Width           =   4215
      End
      Begin MSFlexGridLib.MSFlexGrid Mfgrd1 
         Height          =   6375
         Left            =   120
         TabIndex        =   57
         Top             =   720
         Width           =   14055
         _ExtentX        =   24791
         _ExtentY        =   11245
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
         Index           =   4
         Left            =   120
         TabIndex        =   81
         Top             =   360
         Width           =   735
      End
   End
   Begin VB.Label lblFormHeading 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00E0E0E0&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Outgoing Stock Voucher"
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
      TabIndex        =   50
      Top             =   0
      Width           =   9015
   End
End
Attribute VB_Name = "frmSalesInv"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Option Explicit

Dim mFormLoaded As Boolean, mLastKeyPressed As Integer, mMaskKeyPressed As Integer
Dim mFormUIdCode As Long, mFormUIdFileName As String, mFormAcsPermFileName As String
Dim mFormSysVchType As Integer, mFormVchTypeList As String, mSalCode As Long, mSalStkCode As Long, mQryPrtCode As Long, mQrySimCode As Long, mQryVtmCode As Long, dtlAddEditMode As Boolean, dtlAddMode As Boolean, dtlEditCanceled As Boolean
Dim mRemoteAccess As Boolean, mEntrySaved As Boolean, mEntryAborted As Boolean
Dim dbAcDatabase As New ADODB.Connection, dbStDatabase As New ADODB.Connection, dbKgtDatabase As New ADODB.Connection, dbGrpDatabase As New ADODB.Connection, dbComDatabase As New ADODB.Connection
Dim datRecset As New ADODB.Recordset
Dim mSalCode_old As Long, mSalStkCode_old As Long, mSalPrtCode_old As Long, mSalDate_old As Date, mSalVtmCode_old As Long, mSalVchNo_old As Long, mSalTime_old As Long
Dim mSalSimCode_old As Long, mSalPckCode_old As Long, mSalItmCode_old As Long, mSalItrCode_old As Long, mSalPurCode_old As Long, mSalPurICode_old As Long, mSalBasicAmt_old As Double, mSalDiscPer_old As Double, mSalTaxPer_old As Double
Dim mSahAmount_old As Double, mOutPckQtyChanged As Boolean, mInrPckSzChanged As Boolean, mInrQtyChanged As Boolean, mDiscTypeChanged As Boolean, mDiscPerChanged As Boolean, mDiscAmtChanged As Boolean, mTaxTypeChanged As Boolean, mTaxPerChanged As Boolean, mTaxAmtChanged As Boolean, mWslRateChanged As Boolean, mRtlRateChanged As Boolean
Dim clsAH As clsAccountHead, clsSTK As clsStockJrn, clsSAL As clsKgtMultiTranEntry, clsARA As clsComMastEntry, clsSTN As clsComMastEntry, clsVTM As clsComMastEntry
Dim clsPRT As clsKgtMasterEntry, clsSIM As clsKgtMasterEntry
Dim mActiveControl As Object, clsListStru As clsSelectQueryStructure
Dim fcmbVtmName As clsComFlexSearch
Dim fcmbPrtName As clsKgtFlexSearch, fcmbSimName As clsKgtFlexSearch, fcmbSimRefNo As clsKgtFlexSearch, fcmbPckName As clsKgtFlexSearch

Private Type SmryPara
mIndex() As Variant
mFromDate() As Variant
mToDate() As Variant
mPrtCode() As Variant
mSimCode() As Variant
mVtmCode() As Variant
mExpanded() As Variant
mDetailed() As Variant
mMonthwise() As Variant
mDatewise() As Variant
mPartywise() As Variant
mItemwise() As Variant
mVTypewise() As Variant

End Type

Dim SmryParaLayer As SmryPara

Rem service charges column definitions
Const X2SALICODE_COL = 0
Const X2SALSNO_COL = 1
Const X2SIMNAME_COL = 2
Const X2SALSIMREFNO_COL = 3
Const X2PCKNAME_COL = 4
Const X2SALOUTPCKQTY_COL = 5
Const X2SALOUTPCKNM_COL = 6
Const X2SALINRPCKSZ_COL = 7
Const X2SALINRPCKNM_COL = 8
Const X2SALQTY_COL = 9
Const X2SALRATE_COL = 10
Const X2SALMRP_COL = 11
Const X2SALWSLRATE_COL = 12
Const X2SALRTLRATE_COL = 13
Const X2SALDISCTYPENM_COL = 14
Const X2SALDISCPER_COL = 15
Const X2SALDISCABLEAMT_COL = 16
Const X2SALDISCAMT_COL = 17
Const X2SALTAXTYPENM_COL = 18
Const X2SALTAXPER_COL = 19
Const X2SALTAXABLEAMT_COL = 20
Const X2SALTAXAMT_COL = 21
Const X2SALAMOUNT_COL = 22
Const X2SALNARR_COL = 23
Const X2SALBASICAMT_COL = 24
Const X2SALDISCTYPENO_COL = 25
Const X2SALTAXTYPENO_COL = 26
Const X2SALSIMCODE_COL = 27
Const X2SALITMCODE_COL = 28
Const X2SALITRCODE_COL = 29
Const X2SALPCKCODE_COL = 30
Const X2SALPURCODE_COL = 31
Const X2SALPURICODE_COL = 32
Const X2SALSTKICODE_COL = 33
Const X2SALRECSTATE_COL = 34
Const MFGRD2_COLS = 35

Private Sub ClearSmryParaLayer()

With SmryParaLayer
.mIndex = Array()
.mFromDate = Array()
.mToDate = Array()
.mPrtCode = Array()
.mSimCode = Array()
.mVtmCode = Array()
.mExpanded = Array()
.mDetailed = Array()
.mMonthwise = Array()
.mDatewise = Array()
.mPartywise = Array()
.mItemwise = Array()
.mVTypewise = Array()
End With

End Sub

Private Sub ClearRecentSmryParaLayer()
Dim mIndex As Integer

With SmryParaLayer
mIndex = UBound(.mIndex)
If mIndex > LBound(.mIndex) Then
    mIndex = mIndex - 1
    ReDim Preserve .mIndex(mIndex)
    ReDim Preserve .mFromDate(mIndex)
    ReDim Preserve .mToDate(mIndex)
    ReDim Preserve .mPrtCode(mIndex)
    ReDim Preserve .mSimCode(mIndex)
    ReDim Preserve .mVtmCode(mIndex)
    ReDim Preserve .mExpanded(mIndex)
    ReDim Preserve .mDetailed(mIndex)
    ReDim Preserve .mMonthwise(mIndex)
    ReDim Preserve .mDatewise(mIndex)
    ReDim Preserve .mPartywise(mIndex)
    ReDim Preserve .mItemwise(mIndex)
    ReDim Preserve .mVTypewise(mIndex)
Else
    Call ClearSmryParaLayer
End If
End With

End Sub

Private Sub AddSmryParaLayer(Optional ByVal mClear As Boolean = False)
Dim mIndex As Integer

If mClear = True Then
    Call ClearSmryParaLayer
End If
With SmryParaLayer
mIndex = UBound(.mIndex) + 1
ReDim Preserve .mIndex(mIndex)
ReDim Preserve .mFromDate(mIndex)
ReDim Preserve .mToDate(mIndex)
ReDim Preserve .mPrtCode(mIndex)
ReDim Preserve .mSimCode(mIndex)
ReDim Preserve .mVtmCode(mIndex)
ReDim Preserve .mExpanded(mIndex)
ReDim Preserve .mDetailed(mIndex)
ReDim Preserve .mMonthwise(mIndex)
ReDim Preserve .mDatewise(mIndex)
ReDim Preserve .mPartywise(mIndex)
ReDim Preserve .mItemwise(mIndex)
ReDim Preserve .mVTypewise(mIndex)
' -----------------------
.mIndex(mIndex) = mIndex
.mFromDate(mIndex) = Ctod(dtpFromDate.Text)
.mToDate(mIndex) = Ctod(dtpToDate.Text)
    fcmbPrtName.BoundText = CStr(mQryPrtCode)
    fcmbSimName.BoundText = CStr(mQrySimCode)
    fcmbVtmName.BoundText = CStr(mQryVtmCode)
.mPrtCode(mIndex) = Val(fcmbPrtName.BoundText)
.mSimCode(mIndex) = Val(fcmbSimName.BoundText)
.mVtmCode(mIndex) = Val(fcmbVtmName.BoundText)
.mExpanded(mIndex) = optExpanded.Value
.mDetailed(mIndex) = optDetailed.Value
.mMonthwise(mIndex) = optMonthwise.Value
.mDatewise(mIndex) = optDatewise.Value
.mPartywise(mIndex) = optPartywise.Value
.mItemwise(mIndex) = optItemWise.Value
.mVTypewise(mIndex) = optVTypewise.Value

End With

End Sub

Private Sub RestoreDefaultSmryPara()

dtpFromDate.Text = Dtoc(DefaultEntryDate)
dtpToDate.Text = Dtoc(DefaultEntryDate)
mQryPrtCode = 0: mQrySimCode = 0: mQryVtmCode = 0
txtQryPrtName.Text = "": fcmbPrtName.BoundText = ""
txtQrySimName.Text = "": fcmbSimName.BoundText = ""
txtQryVtmName.Text = "": fcmbVtmName.BoundText = ""
optExpanded.Value = False
optDetailed.Value = True
optMonthwise.Value = False
optDatewise.Value = False
optPartywise.Value = False
optItemWise.Value = False
optVTypewise.Value = False
' ----------
AddSmryParaLayer mClear:=True

End Sub

Private Sub RestoreRecentSmryPara()
Dim mIndex As Integer

With SmryParaLayer
mIndex = UBound(.mIndex)
dtpFromDate.Text = Dtoc(.mFromDate(mIndex))
dtpToDate.Text = Dtoc(.mToDate(mIndex))
    mQryPrtCode = .mPrtCode(mIndex)
    mQrySimCode = .mSimCode(mIndex)
    mQryVtmCode = .mVtmCode(mIndex)
fcmbPrtName.BoundText = CStr(mQryPrtCode): txtQryPrtName.Text = fcmbPrtName.Text
fcmbSimName.BoundText = CStr(mQrySimCode): txtQrySimName.Text = fcmbSimName.Text
fcmbVtmName.BoundText = CStr(mQryVtmCode): txtQryVtmName.Text = fcmbVtmName.Text
optExpanded.Value = .mExpanded(mIndex)
optDetailed.Value = .mDetailed(mIndex)
optMonthwise.Value = .mMonthwise(mIndex)
optDatewise.Value = .mDatewise(mIndex)
optPartywise.Value = .mPartywise(mIndex)
optItemWise.Value = .mItemwise(mIndex)
optVTypewise.Value = .mVTypewise(mIndex)
End With

End Sub

Private Sub RestoreBackSmryPara()

Call ClearRecentSmryParaLayer

With SmryParaLayer
If UBound(.mIndex) >= LBound(.mIndex) Then
    Call RestoreRecentSmryPara
Else
    Call RestoreDefaultSmryPara
End If
End With

End Sub

Public Property Let FormSysVchType(ByVal mSysVchType As Integer)
mFormSysVchType = mSysVchType
End Property

Public Property Let RemoteAccessCode(ByVal mAccessCode As Long)
mRemoteAccess = True
mSalCode = mAccessCode
End Property

Public Property Get EntryBoundCode() As Long
EntryBoundCode = Val(mskFormBoundField.Text)
End Property

Public Property Get EntryDate() As Date
EntryDate = Ctod(dtpSalDate.Text)
End Property

Public Property Get EntryVtmCode() As Integer
EntryVtmCode = Val(fcmbVtmName.BoundText)
End Property

Public Property Get EntrySaved() As Boolean
EntrySaved = mEntrySaved
End Property

Public Property Get EntryAborted() As Boolean
EntryAborted = mEntryAborted
End Property

Public Property Get PrtName() As String
PrtName = txtPrtName.Text
End Property

Public Property Get FormAddEditMode() As Integer
FormAddEditMode = cmbFormEntryMode.ListIndex
End Property

Public Property Let FormAddEditMode(ByVal New_FormEntryMode As Integer)
cmbFormEntryMode.ListIndex = New_FormEntryMode
End Property

Private Sub cmbSalDiscType_Click()
If InterActiveChange(cmbSalDiscType) = True Then
    mDiscTypeChanged = True
End If

End Sub

Private Sub cmbSalDiscType_GotFocus()
FlashActiveControl cmbSalDiscType, True
mDiscTypeChanged = False
End Sub

Private Sub cmbSalDiscType_LostFocus()
FlashActiveControl cmbSalDiscType, False
End Sub

Private Sub cmbSalDiscType_Validate(Cancel As Boolean)
If cmbSalDiscType.ListIndex < 1 Then
    ErrorBox "Invalid Selection !!!"
    cmbSalDiscType.SetFocus
    Cancel = True
Else
    Call CalcSalChg
End If
Call ValidDtl

End Sub

Private Sub cmbSalTaxType_Click()
If InterActiveChange(cmbSalTaxType) = True Then
    mTaxTypeChanged = True
End If

End Sub

Private Sub cmbSalTaxType_GotFocus()
FlashActiveControl cmbSalTaxType, True
mTaxTypeChanged = False
End Sub

Private Sub cmbSalTaxType_LostFocus()
FlashActiveControl cmbSalTaxType, False
End Sub

Private Sub cmbSalTaxType_Validate(Cancel As Boolean)
If cmbSalTaxType.ListIndex < 1 Then
    ErrorBox "Invalid Selection !!!"
    cmbSalTaxType.SetFocus
    Cancel = True
Else
    Call CalcSalChg
End If
Call ValidDtl

End Sub

Private Sub cmdConfigure_Click()
If IsFinYrDate(Ctod(dtpFromDate.Text)) = False Then
    ErrorBox "Invalid Date Range !!!"
    dtpFromDate.SetFocus
    Exit Sub
End If
If IsFinYrDate(Ctod(dtpToDate.Text)) = False Then
    ErrorBox "Invalid Date Range !!!"
    dtpToDate.SetFocus
    Exit Sub
End If
If mQrySimCode > 0 And optDetailed.Value = True Then
    optDetailed.Value = False
    optExpanded.Value = True
End If

Call AddSmryParaLayer

Call SmryList
MoveRecToLast datRecset
ShowRecActiveFlexRow datRecset, Mfgrd1
txtVoid.SetFocus
Mfgrd1.Enabled = True
frConfigure.Visible = False
Mfgrd1.SetFocus

End Sub

Private Sub cmdFormEnter_Click()
mLastKeyPressed = 13
If TypeOf Screen.ActiveControl Is MSFlexGrid Then
    If Screen.ActiveControl.Name = Mfgrd1.Name Then
        With datRecset
        If .EOF = False And .BOF = False Then
            If optDetailed.Value = True Or optExpanded.Value = True Then
                Call Data_EditEvent
            Else
                fcmbPrtName.BoundText = CStr(mQryPrtCode)
                fcmbSimName.BoundText = CStr(mQrySimCode)
                fcmbVtmName.BoundText = CStr(mQryVtmCode)
                
                txtVoid.SetFocus
                If optMonthwise.Value = True Then
                    dtpFromDate.Text = Dtoc(MonthStartDate(DateSerial(Val(Left(.fields("SalYrMonth"), 4)), Val(Right(.fields("SalYrMonth"), 2)), 1)))
                    dtpToDate.Text = Dtoc(MonthEndDate(DateSerial(Val(Left(.fields("SalYrMonth"), 4)), Val(Right(.fields("SalYrMonth"), 2)), 1)))
                    optMonthwise.Value = False
                    optDatewise.Value = True
                    
                ElseIf optDatewise.Value = True Then
                    dtpFromDate.Text = Dtoc(.fields("SahDate"))
                    dtpToDate.Text = Dtoc(.fields("SahDate"))
                    optDatewise.Value = False
                    If mQrySimCode > 0 Then
                        optExpanded.Value = True
                    Else
                        optDetailed.Value = True
                    End If
                    
                ElseIf optPartywise.Value = True Then
                    mQryPrtCode = .fields("SahPrtCode")
                    fcmbPrtName.BoundText = CStr(mQryPrtCode)
                    txtQryPrtName.Text = fcmbPrtName.Text
                    optPartywise.Value = False
                    optDatewise.Value = True
                    
                ElseIf optItemWise.Value = True Then
                    mQrySimCode = .fields("SalSimCode")
                    fcmbSimName.BoundText = CStr(mQrySimCode)
                    txtQrySimName.Text = fcmbSimName.Text
                    optItemWise.Value = False
                    optDatewise.Value = True
                    
                ElseIf optVTypewise.Value = True Then
                    mQryVtmCode = .fields("SahVtmCode")
                    fcmbVtmName.BoundText = CStr(mQryVtmCode)
                    txtQryVtmName.Text = fcmbVtmName.Text
                    optVTypewise.Value = False
                    optDatewise.Value = True
                    
                End If
                Call AddSmryParaLayer
                
                Call SmryList
                MoveRecToLast datRecset
                ShowRecActiveFlexRow datRecset, Mfgrd1
                Mfgrd1.SetFocus
            End If
        Else
            Call Data_AddEvent
        End If
        End With
    ElseIf Screen.ActiveControl.Name = Mfgrd2.Name Then
        Mfgrd2_KeyPress vbKeyReturn
    End If
ElseIf FormAddEditMode = cFORM_SMRYMODE And frConfigure.Visible = False And frPrintCRList.Visible = False Then

Else
    SendKeys "{TAB}"
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
    Call RestoreRecentSmryPara
    
ElseIf frPrintCRList.Visible = True Then
    txtVoid.SetFocus
    Mfgrd1.Enabled = True
    frPrintCRList.Visible = False
    Mfgrd1.SetFocus
    
ElseIf FormAddEditMode = cFORM_SMRYMODE Then
    If Len(txtSearch1Text.Text) > 0 Then
        txtSearch1Text.Text = ""
        Call txtSearch1Text_InterActiveChange
    Else
        If UBound(SmryParaLayer.mIndex) > LBound(SmryParaLayer.mIndex) Then
            txtVoid.SetFocus
            Call RestoreBackSmryPara
            Call SmryList
            MoveRecToLast datRecset
            ShowRecActiveFlexRow datRecset, Mfgrd1
            Mfgrd1.SetFocus
        Else
            Unload Me
            Exit Sub
        End If
    End If

ElseIf dtlAddEditMode = True Then
    dtlEditCanceled = True
    Call cmdOK_Click
    Call Mfgrd2_RowColChange

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
            Me.Hide     ''' Unload Me
            Exit Sub
        Else
            Mfgrd1.SetFocus
        End If
    Else
        txtPrtName.SetFocus
    End If
End If

End Sub

Private Sub cmdOK_Click()
Dim tRecset As New ADODB.Recordset, srow As Integer, mSalICode As Long, mSalStkICode As Long, mSalItrCode As Long

srow = Mfgrd2.Row
mSalICode = Val(Mfgrd2.TextMatrix(srow, X2SALICODE_COL))
mSalStkICode = Val(Mfgrd2.TextMatrix(srow, X2SALSTKICODE_COL))
mSalItrCode = Val(mskSalItrCode.Text)  ''' Val(Mfgrd2.TextMatrix(srow, X2SALITRCODE_COL))

If cmdOK.Caption = "&OK" And dtlEditCanceled = False Then
    Rem updating values in saledtl table
    With clsSAL
    If dtlAddMode = True Then
        .ClearDtl
    Else
        .GetDtlData mSalCode, mSalICode
    End If
    .mTrnCode_lng = mSalCode
    .mTrnDtlSno_int = Val(UnMyNumFmt(mskSalSno.Text))
    .mTrnDate_dt = Ctod(dtpSalDate.Text)
    .mTrnCmpCode_int = sFinYrCmpCode
    
    .mSalStkCode_lng = mSalStkCode
    .mSalStkICode_lng = mSalStkICode
    .mSalPrtCode_lng = Val(fcmbPrtName.BoundText)
    .mSalSimCode_lng = Val(fcmbSimName.BoundText)
    .mSalPckCode_lng = Val(fcmbPckName.BoundText)
    .mSalNarr_str = txtSalNarr.Text
    .mSalItmCode_lng = Val(mskSalItmCode.Text)
    .mSalItrCode_lng = Val(mskSalItrCode.Text)
    .mSalSimRefNo_str = txtSalSimRefNo.Text
    .mSalPurCode_lng = Val(mskSalPurCode.Text)
    .mSalPurICode_lng = Val(mskSalPurICode.Text)
    .mSalOutPckQty_dbl = Val(UnMyNumFmt(mskSalOutPckQty.Text))
    .mSalOutPckNm_str = txtSalOutPckNm.Text
    .mSalInrPckSz_dbl = Val(UnMyNumFmt(mskSalInrPckSz.Text))
    .mSalInrPckNm_str = txtSalInrPckNm.Text
    .mSalQty_dbl = Val(UnMyNumFmt(mskSalQty.Text))
    .mSalRate_dbl = Val(UnMyNumFmt(mskSalRate.Text))
    .mSalMrp_dbl = Val(UnMyNumFmt(mskSalMRP.Text))
    .mSalWslRate_dbl = Val(UnMyNumFmt(mskSalWslRate.Text))
    .mSalRtlRate_dbl = Val(UnMyNumFmt(mskSalRtlRate.Text))
    .mSalDiscableAmt_dbl = Val(UnMyNumFmt(mskSalDiscableAmt.Text))
    .mSalDiscPer_dbl = Val(UnMyPerFmt(mskSalDiscPer.Text))
    .mSalDiscType_int = cmbSalDiscType.ListIndex
    .mSalDiscAmt_dbl = Val(UnMyNumFmt(mskSalDiscAmt.Text))
    .mSalTaxableAmt_dbl = Val(UnMyNumFmt(mskSalTaxableAmt))
    .mSalTaxPer_dbl = Val(UnMyPerFmt(mskSalTaxPer.Text))
    .mSalTaxType_int = cmbSalTaxType.ListIndex
    .mSalTaxAmt_dbl = Val(UnMyNumFmt(mskSalTaxAmt.Text))
    .mSalBasicAmt_dbl = Val(UnMyNumFmt(mskSalBasicAmt.Text))
    .mSalAmount_dbl = Val(UnMyNumFmt(mskSalAmount.Text))
    .mSalRemark_str = ""
    
    If dtlAddMode = True Then
        If .AddNewDtl(mSalCode) = True Then
            mSalICode = .mTrnDtlICode_lng
        End If
    Else
        .UpdateDtl mSalCode, mSalICode
    End If
    End With
    
    Rem updating values in stock table
    With clsSTK
    If dtlAddMode = True Then
        .ClearDtl
    Else
        .GetDtlData mSalStkCode, mSalStkICode
    End If
    .mStkSno_int = Val(UnMyNumFmt(mskSalSno.Text))
    .mStkVtmCode_lng = Val(fcmbVtmName.BoundText)
    .mStkPrefix_str = txtSalPrefix.Text
    .mStkVchNo_lng = Val(UnMyNumFmt(mskSalVchNo(0).Text))
    .mStkPostfix_str = ""
    .mStkDate_dt = Ctod(dtpSalDate.Text)
    .mStkItmCode_lng = Val(mskSalItmCode.Text)
    .mStkItmRefCode_lng = Val(mskSalItrCode.Text)
    .mStkItmRef1Name_str = txtSalSimRefNo.Text
    .mStkItmRef2Name_str = ""
    .mStkQty_dbl = ToIssueQty(Val(UnMyNumFmt(mskSalQty.Text)))
    .mStkRate_dbl = Val(UnMyNumFmt(mskSalRate.Text))
    .mStkValue_dbl = Val(UnMyNumFmt(mskSalAmount.Text))
    .mStkNarr_str = ""
    .mStkAutoGen_bln = True
    .mStkCmpCode_int = sFinYrCmpCode
    If dtlAddMode = True Then
        If .AddNewDtl(mSalStkCode) = True Then          ''' , mNewItemRef:=False
            mSalStkICode = .mStkICode_lng
        End If
    Else
        .UpdateDtl mSalStkCode, mSalStkICode
    End If
    End With
    
    Rem updating StkICode in SaleDtl
    With clsSAL
    If mSalICode > 0 And mSalStkICode > 0 And mSalItrCode > 0 Then
        If dtlAddMode = True Then
            .GetDtlData mSalCode, mSalICode
            
            .mSalStkICode_lng = mSalStkICode
            .UpdateDtl mSalCode, mSalICode
        Else
        End If
    End If
    End With
    
    RefreshDatabase dbKgtDatabase
    ChkAnyExcessIsuExist mSalICode
    ChkAnyMisLinkedRcExist mSalICode
    
    Set tRecset = dbKgtDatabase.Execute("Select * from ((SaleDtl sal" _
        & " inner join SubItmMast sim on sal.SalSimCode = sim.SimCode)" _
        & " inner join PackMast pck on sal.SalPckCode = pck.PckCode)" _
        & " left join (PurchDtl pur left join PurchHdr puh on pur.PurCode = puh.PuhCode)" _
        & " on sal.SalPurCode = pur.PurCode and sal.SalPurICode = pur.PurICode and sal.SalSimCode = pur.PurSimCode and sal.SalItmCode = pur.PurItmCode and sal.SalItrCode = pur.PurItrCode" _
        & " where SalCode = " & CStr(mSalCode) & " and SalICode = " & CStr(mSalICode) _
        & " order by SalSno")
    With tRecset
    Mfgrd2.TextMatrix(srow, X2SALICODE_COL) = .fields("SalICode")
    Mfgrd2.TextMatrix(srow, X2SALSNO_COL) = ToMyNumFmt(.fields("SalSno"), mDecimals:=0)
    Mfgrd2.TextMatrix(srow, X2SIMNAME_COL) = .fields("SimName")
    Mfgrd2.TextMatrix(srow, X2SALSIMREFNO_COL) = .fields("SalSimRefNo")
    Mfgrd2.TextMatrix(srow, X2PCKNAME_COL) = .fields("PckName")
    Mfgrd2.TextMatrix(srow, X2SALOUTPCKQTY_COL) = ToMyNumFmt(.fields("SalOutPckQty"), mDecimals:=-1)
    Mfgrd2.TextMatrix(srow, X2SALOUTPCKNM_COL) = .fields("SalOutPckNm")
    Mfgrd2.TextMatrix(srow, X2SALINRPCKSZ_COL) = ToMyNumFmt(.fields("SalInrPckSz"), mDecimals:=-1)
    Mfgrd2.TextMatrix(srow, X2SALINRPCKNM_COL) = .fields("SalInrPckNm")
    Mfgrd2.TextMatrix(srow, X2SALQTY_COL) = ToMyNumFmt(.fields("SalQty"), mDecimals:=-1)
    Mfgrd2.TextMatrix(srow, X2SALRATE_COL) = ToMyNumFmt(.fields("SalRate"))
    Mfgrd2.TextMatrix(srow, X2SALMRP_COL) = ToMyNumFmt(.fields("SalMRP"))
    Mfgrd2.TextMatrix(srow, X2SALWSLRATE_COL) = ToMyNumFmt(.fields("SalWslRate"))
    Mfgrd2.TextMatrix(srow, X2SALRTLRATE_COL) = ToMyNumFmt(.fields("SalRtlRate"))
'''    If mFormSysVchType = cCOM_VTYPE_RETNOUTW Then
'''        Mfgrd2.TextMatrix(srow, X2PURRATE_COL) = ToMyNumFmt(.fields("PurWslRate"))
'''    Else
'''        Mfgrd2.TextMatrix(srow, X2PURRATE_COL) = ToMyNumFmt(.fields("PurRate"))
'''    End If
    Mfgrd2.TextMatrix(srow, X2SALDISCTYPENM_COL) = GetListTextFromItemData(mCmbObj:=cmbSalDiscType, mTargetItemData:=.fields("SalDiscType"))
    Mfgrd2.TextMatrix(srow, X2SALDISCPER_COL) = ToMyPerFmt(.fields("SalDiscPer"), mDecimals:=-1)
    Mfgrd2.TextMatrix(srow, X2SALDISCABLEAMT_COL) = ToMyNumFmt(.fields("SalDiscableAmt"))
    Mfgrd2.TextMatrix(srow, X2SALDISCAMT_COL) = ToMyNumFmt(.fields("SalDiscAmt"))
    Mfgrd2.TextMatrix(srow, X2SALTAXTYPENM_COL) = GetListTextFromItemData(mCmbObj:=cmbSalTaxType, mTargetItemData:=.fields("SalTaxType"))
    Mfgrd2.TextMatrix(srow, X2SALTAXPER_COL) = ToMyPerFmt(.fields("SalTaxPer"), mDecimals:=-1)
    Mfgrd2.TextMatrix(srow, X2SALTAXABLEAMT_COL) = ToMyNumFmt(.fields("SalTaxableAmt"))
    Mfgrd2.TextMatrix(srow, X2SALTAXAMT_COL) = ToMyNumFmt(.fields("SalTaxAmt"))
    Mfgrd2.TextMatrix(srow, X2SALAMOUNT_COL) = ToMyNumFmt(.fields("SalAmount"))
    Mfgrd2.TextMatrix(srow, X2SALNARR_COL) = .fields("SalNarr")
    Mfgrd2.TextMatrix(srow, X2SALBASICAMT_COL) = ToMyNumFmt(.fields("SalBasicAmt"))
    Mfgrd2.TextMatrix(srow, X2SALDISCTYPENO_COL) = .fields("SalDiscType")
    Mfgrd2.TextMatrix(srow, X2SALTAXTYPENO_COL) = .fields("SalTaxType")
    Mfgrd2.TextMatrix(srow, X2SALSIMCODE_COL) = .fields("SalSimCode")
    Mfgrd2.TextMatrix(srow, X2SALITMCODE_COL) = .fields("SalItmCode")
    Mfgrd2.TextMatrix(srow, X2SALITRCODE_COL) = .fields("SalItrCode")
    Mfgrd2.TextMatrix(srow, X2SALPCKCODE_COL) = .fields("SalPckCode")
    Mfgrd2.TextMatrix(srow, X2SALPURCODE_COL) = .fields("SalPurCode")
    Mfgrd2.TextMatrix(srow, X2SALPURICODE_COL) = .fields("SalPurICode")
    Mfgrd2.TextMatrix(srow, X2SALSTKICODE_COL) = .fields("SalStkICode")
    Mfgrd2.TextMatrix(srow, X2SALRECSTATE_COL) = .fields("SalRecState")
    End With
    CloseTable tRecset
    
    If dtlAddMode = True Then
        Mfgrd2.Rows = Mfgrd2.Rows + 1
    End If
    srow = srow + 1
    Mfgrd2.Row = srow
    
    Call CalcFtrTotal
End If
dtlAddEditMode = False
dtlAddMode = False
dtlEditCanceled = False
VisibleControls False
Mfgrd2.SetFocus
CloseTable tRecset, mCheckOpen:=True

End Sub

Private Sub cmdSaveForm_Click()
txtVoid.SetFocus
Call Data_SaveEvent
Call SmryList

If optDetailed.Value = True Or optExpanded.Value = True Then
    txtSearch1Text_InterActiveChange Format(Ctod(dtpSalDate.Text), "yyyymmdd") + Format(mSalCode, cLONGCODESTRFMT)
ElseIf optMonthwise.Value = True Then
    txtSearch1Text_InterActiveChange Format(Ctod(dtpSalDate.Text), "yyyy") & "/" & Format(Ctod(dtpSalDate.Text), "mm")
ElseIf optDatewise.Value = True Then
    txtSearch1Text_InterActiveChange Format(Ctod(dtpSalDate.Text), "yyyymmdd")
ElseIf optPartywise.Value = True Then
    txtSearch1Text_InterActiveChange txtPrtName.Text
ElseIf optItemWise.Value = True Then
    txtSearch1Text_InterActiveChange Mfgrd2.TextMatrix(1, X2SIMNAME_COL)
ElseIf optVTypewise.Value = True Then
    txtSearch1Text_InterActiveChange txtVtmName(0).Text
    
End If

Call ShowEntryMode(False)
Mfgrd1.SetFocus

End Sub

Private Sub cmdSaveForm_GotFocus()
Dim mSalAcsPermNo As Integer, mRetryCount As Integer

txtVoid.SetFocus
cmdSaveForm.Enabled = False
If Data_Verify() = True Then
    If CanAccept() = True Then
        If GetAccessPerm(mSalAcsPermNo, mRetryCount, mFormAcsPermFileName) = True And mRetryCount = 0 Then
            If Data_NetwAuth() = True Then
                Call cmdSaveForm_Click
                Close #mSalAcsPermNo
                If mRemoteAccess = True Then
                    Me.Hide     '''Unload Me
                    Exit Sub
                Else
                    Call Mfgrd1_RowColChange
                    Data_PrintDialog "SaveEvent"
                End If
            Else
                Close #mSalAcsPermNo
            End If
        Else
            Close #mSalAcsPermNo
            AlertBox "System Busy, Try Again !!!"
            
            txtPrtName.SetFocus
        End If
    Else
        txtPrtName.SetFocus
    End If
End If
cmdSaveForm.Enabled = True
End Sub

Private Sub dtpFromDate_GotFocus()
FlashActiveControl dtpFromDate, True
End Sub

Private Sub dtpFromDate_LostFocus()
FlashActiveControl dtpFromDate, False
End Sub

Private Sub dtpFromDate_Validate(Cancel As Boolean)
dtpFromDate.Text = ToMyDate(dtpFromDate.Text)
If IsFinYrDate(Ctod(dtpFromDate.Text)) = False Then
    ErrorBox "Invalid Date Range !!!"
    dtpFromDate.SetFocus
    Cancel = True
End If

End Sub

Private Sub dtpSalDate_GotFocus()
FlashActiveControl dtpSalDate, True
End Sub

Private Sub dtpSalDate_LostFocus()
FlashActiveControl dtpSalDate, False
End Sub

Private Sub dtpSalDate_Validate(Cancel As Boolean)
dtpSalDate.Text = ToMyDate(dtpSalDate.Text)
If IsFinYrDate(Ctod(dtpSalDate.Text)) = False Then
    ErrorBox "Invalid Input !!!"
    dtpSalDate.SetFocus
    Cancel = True
End If

End Sub

Private Sub dtpSalTrnRefDt_GotFocus()
FlashActiveControl dtpSalTrnRefDt, True
End Sub

Private Sub dtpSalTrnRefDt_LostFocus()
FlashActiveControl dtpSalTrnRefDt, False
End Sub

Private Sub dtpSalTrnRefDt_Validate(Cancel As Boolean)
dtpSalTrnRefDt.Text = ToMyDate(dtpSalTrnRefDt.Text)

End Sub

Private Sub dtpToDate_GotFocus()
FlashActiveControl dtpToDate, True
End Sub

Private Sub dtpToDate_LostFocus()
FlashActiveControl dtpToDate, False
End Sub

Private Sub dtpToDate_Validate(Cancel As Boolean)
dtpToDate.Text = ToMyDate(dtpToDate.Text)
If IsFinYrDate(Ctod(dtpToDate.Text)) = False Then
    ErrorBox "Invalid Date Range !!!"
    dtpToDate.SetFocus
    Cancel = True
End If

End Sub

Private Sub Form_Activate()
If mFormLoaded = False Then
    Select Case mFormSysVchType
    Case cKGT_VTYPE_WSLSALES
        lblFormHeading.Caption = "Whole Sale Voucher"
        lblVchType.Caption = "Sale Type"
        lblFormHeading.BackColor = RGB(1, 255, 220)
        
    Case cKGT_VTYPE_SWLSALES
        lblFormHeading.Caption = "Semi-Whole Sale Voucher"
        lblVchType.Caption = "Sale Type"
        lblFormHeading.BackColor = RGB(50, 200, 200)
        
    Case cKGT_VTYPE_RTLSALES
        lblFormHeading.Caption = "Retail Sale Voucher"
        lblVchType.Caption = "Sale Type"
        lblFormHeading.BackColor = RGB(75, 200, 220)
        
    Case cCOM_VTYPE_RETNOUTW
        lblFormHeading.Caption = "Purchase Return Voucher"
        lblVchType.Caption = "PRet.Type"
        lblFormHeading.BackColor = RGB(150, 255, 220)
    Case Else
        ErrorBox "Invalid Voucher Type !!!"
        If mRemoteAccess = True Then
            Me.Hide
            Exit Sub
        Else
            Unload Me
            Exit Sub
        End If
    End Select
    If mRemoteAccess = True Then
        MoveRecToFirst datRecset
        ShowRecActiveFlexRow datRecset, Mfgrd1
        Mfgrd1.SetFocus
        If mSalCode = 0 Then
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
    RefreshDatabase dbKgtDatabase
    RefreshDatabase dbAcDatabase
    RefreshDatabase dbGrpDatabase
    RefreshDatabase dbComDatabase
    
End If

mFormLoaded = True
End Sub

Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)
mLastKeyPressed = KeyCode
mMaskKeyPressed = Shift
Select Case KeyCode
Case vbKeyF2
    Load frmSetDefaultDate
    frmSetDefaultDate.Show 1
Case vbKeyPageDown
    If FormAddEditMode <> cFORM_SMRYMODE Then
        Call cmdSaveForm_GotFocus
    End If
End Select

End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)
mLastKeyPressed = KeyAscii

End Sub

Public Sub Form_Load()
Dim colcnt As Integer

If mFormSysVchType < 1 Then
    Exit Sub
End If

mFormUIdFileName = "SaleDtl.Uid"
mFormAcsPermFileName = "SaleDtl.Acp"
mFormUIdCode = GetUIdCode(mProcess:=Me.Name, mUIdFileName:=mFormUIdFileName, mAcsPermFileName:=mFormAcsPermFileName)
If mFormUIdCode = 0 Then
    ErrorBox cSYSBUSY_ACS_DENIED
    Unload Me
    Exit Sub
End If

mFormLoaded = False
mFormVchTypeList = ""
mEntrySaved = False: mEntryAborted = False
SetFormSize Me, frmMain
Call Form_Resize

Call SetVoidControl(txtVoid)
txtSearch1Text.Enabled = False
frConfigure.Visible = False
frPrintCRList.Visible = False
'''mskPurMRP.Enabled = False
'''mskPurRate.Enabled = False

OpenAcDataSource dbAcDatabase
OpenStDataSource dbStDatabase
OpenKgtDataSource dbKgtDatabase
OpenGrpDataSource dbGrpDatabase
OpenComDataSource dbComDatabase

mFormVchTypeList = GetSubVchTypeList(cnn:=dbAcDatabase, mSysVchType:=mFormSysVchType, mRtnDefValue:="0")

Set clsListStru = New clsSelectQueryStructure

AddItemToComboFromArray mCmbObj:=cmbSalDiscType, mAryList:=Array("(Select)", "Bef.Tax", "Aft.Tax")
AddItemToComboFromArray mCmbObj:=cmbSalTaxType, mAryList:=Array("(Select)", "Excl", "Incl")

Set clsSTK = New clsStockJrn
Set clsSTK.dbStDatabase = dbStDatabase
Set clsSTK.dbGrpDatabase = dbGrpDatabase

Set clsAH = New clsAccountHead
Set clsAH.dbAcDatabase = dbAcDatabase
Set clsAH.dbGrpDatabase = dbGrpDatabase

Set clsSAL = New clsKgtMultiTranEntry
Set clsSAL.dbAcDatabase = dbAcDatabase
Set clsSAL.dbStDatabase = dbStDatabase
Set clsSAL.dbKgtDatabase = dbKgtDatabase
clsSAL.blnSaleTran = True
clsSAL.Init

Set clsPRT = New clsKgtMasterEntry
Set clsPRT.dbAcDatabase = dbAcDatabase
Set clsPRT.dbKgtDatabase = dbKgtDatabase
clsPRT.blnPartyMast = True
clsPRT.Init

Set clsSIM = New clsKgtMasterEntry
Set clsSIM.dbKgtDatabase = dbKgtDatabase
Set clsSIM.dbStDatabase = dbStDatabase
clsSIM.blnSubItmMast = True
clsSIM.Init

Set clsARA = New clsComMastEntry
Set clsARA.dbAcDatabase = dbAcDatabase
clsARA.blnAreaMast = True
clsARA.Init

Set clsSTN = New clsComMastEntry
Set clsSTN.dbAcDatabase = dbAcDatabase
clsSTN.blnStationMast = True
clsSTN.Init

Set clsVTM = New clsComMastEntry
Set clsVTM.dbAcDatabase = dbAcDatabase
clsVTM.blnVTypeMast = True
clsVTM.Init

Set fcmbVtmName = New clsComFlexSearch
Set fcmbVtmName.dbAcDatabase = dbAcDatabase
fcmbVtmName.blnVTypeMastList = True
fcmbVtmName.mListSqlExpr = "Select * from VTypMast where VtmSysCode=" & CStr(mFormSysVchType) & " order by VtmName"
fcmbVtmName.Init

Set fcmbSimName = New clsKgtFlexSearch
Set fcmbSimName.dbKgtDatabase = dbKgtDatabase
Set fcmbSimName.dbComDatabase = dbComDatabase
fcmbSimName.blnSubItmMastList = True
fcmbSimName.Init

Set fcmbSimRefNo = New clsKgtFlexSearch
Set fcmbSimRefNo.dbKgtDatabase = dbKgtDatabase
Set fcmbSimRefNo.dbComDatabase = dbComDatabase
fcmbSimRefNo.mFiltCond = "True=False"
fcmbSimRefNo.blnBalSimRefNoList = True
fcmbSimRefNo.Init

Set fcmbPrtName = New clsKgtFlexSearch
Set fcmbPrtName.dbKgtDatabase = dbKgtDatabase
Set fcmbPrtName.dbComDatabase = dbComDatabase
fcmbPrtName.blnPartyMastList = True
fcmbPrtName.Init

Set fcmbPckName = New clsKgtFlexSearch
Set fcmbPckName.dbKgtDatabase = dbKgtDatabase
Set fcmbPckName.dbComDatabase = dbComDatabase
fcmbPckName.blnPackMastList = True
fcmbPckName.Init

Call RestoreDefaultSmryPara
If mRemoteAccess = True Then
    optDetailed.Value = True
    AddSmryParaLayer mClear:=True
End If

If mRemoteAccess = True Then
    datRecset.Open "Select * from SaleHdr" _
        & " inner join PartyMast on SaleHdr.SahPrtCode = PartyMast.PrtCode" _
        & " where SahCode = " & CStr(mSalCode) _
        & " and SahVtmCode IN (" & mFormVchTypeList & ")" _
        & " order by SahDate,SahTime" _
        , dbKgtDatabase, adOpenKeyset, adLockOptimistic
    dtpFromDate.Text = Dtoc(datRecset.fields("SahDate"))
    dtpToDate.Text = Dtoc(datRecset.fields("SahDate"))
    AddSmryParaLayer mClear:=True
Else
    datRecset.Open "Select * from SaleHdr" _
        & " inner join PartyMast on SaleHdr.SahPrtCode = PartyMast.PrtCode" _
        & " where SahVtmCode IN (" & mFormVchTypeList & ")" _
        & " order by SahDate,SahTime" _
        , dbKgtDatabase, adOpenKeyset, adLockOptimistic
End If
Mfgrd1.FixedCols = 0
Call SmryList

Mfgrd2.FixedRows = 1: Mfgrd2.FixedCols = 0: Mfgrd2.Rows = 2: Mfgrd2.Cols = MFGRD2_COLS: SetGridAutoHeight Mfgrd2

colcnt = X2SALICODE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2SALICODE_COL": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2SALSNO_COL: Mfgrd2.ColWidth(colcnt) = mskSalSno.Width: Mfgrd2.TextMatrix(0, colcnt) = "Sno": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2SIMNAME_COL: Mfgrd2.ColWidth(colcnt) = txtSimName.Width: Mfgrd2.TextMatrix(0, colcnt) = "Item Name": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2SALSIMREFNO_COL: Mfgrd2.ColWidth(colcnt) = txtSalSimRefNo.Width: Mfgrd2.TextMatrix(0, colcnt) = "Ref.No": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2PCKNAME_COL: Mfgrd2.ColWidth(colcnt) = txtPckName.Width: Mfgrd2.TextMatrix(0, colcnt) = "Packing": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2SALOUTPCKQTY_COL: Mfgrd2.ColWidth(colcnt) = mskSalOutPckQty.Width: Mfgrd2.TextMatrix(0, colcnt) = "Outer Qty": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2SALOUTPCKNM_COL: Mfgrd2.ColWidth(colcnt) = txtSalOutPckNm.Width: Mfgrd2.TextMatrix(0, colcnt) = "Outer Nm": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2SALINRPCKSZ_COL: Mfgrd2.ColWidth(colcnt) = mskSalInrPckSz.Width: Mfgrd2.TextMatrix(0, colcnt) = "Inner Sz": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2SALINRPCKNM_COL: Mfgrd2.ColWidth(colcnt) = txtSalInrPckNm.Width: Mfgrd2.TextMatrix(0, colcnt) = "Inner Nm": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2SALQTY_COL: Mfgrd2.ColWidth(colcnt) = mskSalQty.Width: Mfgrd2.TextMatrix(0, colcnt) = "Inner Qty": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2SALQTY_COL: Mfgrd2.ColWidth(colcnt) = mskSalQty.Width: Mfgrd2.TextMatrix(0, colcnt) = "Unit": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2SALRATE_COL: Mfgrd2.ColWidth(colcnt) = mskSalRate.Width: Mfgrd2.TextMatrix(0, colcnt) = "Rate": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2SALMRP_COL: Mfgrd2.ColWidth(colcnt) = mskSalMRP.Width: Mfgrd2.TextMatrix(0, colcnt) = "MRP": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2SALWSLRATE_COL: Mfgrd2.ColWidth(colcnt) = mskSalWslRate.Width: Mfgrd2.TextMatrix(0, colcnt) = "WholSal Rate": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2SALRTLRATE_COL: Mfgrd2.ColWidth(colcnt) = mskSalRtlRate.Width: Mfgrd2.TextMatrix(0, colcnt) = "Retail Rate": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2SALDISCTYPENM_COL: Mfgrd2.ColWidth(colcnt) = cmbSalDiscType.Width: Mfgrd2.TextMatrix(0, colcnt) = "Disc.Type": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2SALDISCPER_COL: Mfgrd2.ColWidth(colcnt) = mskSalDiscPer.Width: Mfgrd2.TextMatrix(0, colcnt) = "Disc%": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2SALDISCABLEAMT_COL: Mfgrd2.ColWidth(colcnt) = mskSalDiscableAmt.Width: Mfgrd2.TextMatrix(0, colcnt) = "Discable.Amt": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2SALDISCAMT_COL: Mfgrd2.ColWidth(colcnt) = mskSalDiscAmt.Width: Mfgrd2.TextMatrix(0, colcnt) = "Disc.Amt": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2SALTAXTYPENM_COL: Mfgrd2.ColWidth(colcnt) = cmbSalTaxType.Width: Mfgrd2.TextMatrix(0, colcnt) = "Tax Type": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2SALTAXPER_COL: Mfgrd2.ColWidth(colcnt) = mskSalTaxPer.Width: Mfgrd2.TextMatrix(0, colcnt) = "Tax%": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2SALTAXABLEAMT_COL: Mfgrd2.ColWidth(colcnt) = mskSalTaxableAmt.Width: Mfgrd2.TextMatrix(0, colcnt) = "Taxable.Amt": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2SALTAXAMT_COL: Mfgrd2.ColWidth(colcnt) = mskSalTaxAmt.Width: Mfgrd2.TextMatrix(0, colcnt) = "Tax Amt": Mfgrd2.ColAlignment(colcnt) = 7
'''If mFormSysVchType = cCOM_VTYPE_RETNOUTW Then
'''    colcnt = X2PURRATE_COL: Mfgrd2.ColWidth(colcnt) = mskPurRate.Width: Mfgrd2.TextMatrix(0, colcnt) = "S.Rate": Mfgrd2.ColAlignment(colcnt) = 7
'''Else
'''    colcnt = X2PURRATE_COL: Mfgrd2.ColWidth(colcnt) = mskPurRate.Width: Mfgrd2.TextMatrix(0, colcnt) = "P.Rate": Mfgrd2.ColAlignment(colcnt) = 7
'''End If
colcnt = X2SALAMOUNT_COL: Mfgrd2.ColWidth(colcnt) = mskSalAmount.Width: Mfgrd2.TextMatrix(0, colcnt) = "Amount": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2SALNARR_COL: Mfgrd2.ColWidth(colcnt) = txtSalNarr.Width: Mfgrd2.TextMatrix(0, colcnt) = "Description": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2SALBASICAMT_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2SALBASICAMT_COL": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2SALDISCTYPENO_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2SALDISCTYPENO_COL": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2SALTAXTYPENO_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2SALTAXTYPENO_COL": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2SALSIMCODE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2SALSIMCODE_COL": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2SALITMCODE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2SALITMCODE_COL": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2SALITRCODE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2SALITRCODE_COL": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2SALPCKCODE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2SALPCKCODE_COL": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2SALPURCODE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2SALPURCODE_COL": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2SALPURICODE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2SALPURICODE_COL": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2SALSTKICODE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2SALSTKICODE_COL": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2SALRECSTATE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2SALRECSTATE_COL": Mfgrd2.ColAlignment(colcnt) = 7
' ---------------------------
'''colcnt = X2SALSNO_COL: mskSalSno.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
'''colcnt = X2SIMNAME_COL: txtSimName.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
'''colcnt = X2SALSIMREFNO_COL: txtSalSimRefNo.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
'''colcnt = X2SALQTY_COL: mskSalQty.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
'''colcnt = X2SALRATE_COL: mskSalRate.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
'''colcnt = X2PURMRP_COL: mskPurMRP.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
'''colcnt = X2PURRATE_COL: mskPurRate.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
'''colcnt = X2SALTAXPER_COL: mskSalTaxPer.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
'''colcnt = X2SALTAXAMT_COL: mskSalTaxAmt.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
'''colcnt = X2SALAMOUNT_COL: mskSalAmount.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
'''txtSalNarr.Left = txtSimName.Left
'''cmdOK.Left = mskSalAmount.Left + mskSalAmount.Width - cmdOK.Width

lblSalOutPckQtyTot.Left = mskSalOutPckQty.Left - frFooter.Left: lblSalOutPckQtyTot.Width = mskSalOutPckQty.Width
lblSalQtyTot.Left = lblSalOutPckQtyTot.Left + lblSalOutPckQtyTot.Width + 50: lblSalQtyTot.Width = mskSalQty.Width
lblSalDiscAmtTot.Left = mskSalDiscAmt.Left - frFooter.Left: lblSalDiscAmtTot.Width = mskSalDiscAmt.Width
lblSalTaxAmtTot.Left = mskSalTaxAmt.Left - frFooter.Left: lblSalTaxAmtTot.Width = mskSalTaxAmt.Width
lblSalBasicAmtTot.Left = mskSalAmount.Left - frFooter.Left: lblSalBasicAmtTot.Width = mskSalAmount.Width

mskSahDiscPer.Left = lblSalTaxAmtTot.Left: mskSahDiscPer.Width = lblSalTaxAmtTot.Width
mskSahDiscAmt.Left = lblSalBasicAmtTot.Left: mskSahDiscAmt.Width = lblSalBasicAmtTot.Width
mskSahTaxPer.Left = lblSalTaxAmtTot.Left: mskSahTaxPer.Width = lblSalTaxAmtTot.Width
mskSahTaxAmt.Left = lblSalBasicAmtTot.Left: mskSahTaxAmt.Width = lblSalBasicAmtTot.Width
mskSahOtherAmt.Left = lblSalBasicAmtTot.Left: mskSahOtherAmt.Width = lblSalBasicAmtTot.Width
mskSahROffAmt.Left = lblSalBasicAmtTot.Left: mskSahROffAmt.Width = lblSalBasicAmtTot.Width
mskSahAmount.Left = lblSalBasicAmtTot.Left: mskSahAmount.Width = lblSalBasicAmtTot.Width

ShowEntryMode False
VisibleControls False
ShowStatusBarText StatusBar1

End Sub

Private Sub Form_Resize()
lblFormHeading.Width = Me.Width
cmdFormEscape.Left = Me.Width - (cmdFormEscape.Width * 2)
cmdFormEnter.Left = Me.Width + cmdFormEscape.Width
frFormSmry.Left = (Me.Width - frFormSmry.Width) / 2: frFormSmry.Top = cmbFormEntryMode.Top + (cmbFormEntryMode.Height * 1.1)
frFormDtl.Left = (Me.Width - frFormDtl.Width) / 2: frFormDtl.Top = frFormSmry.Top

End Sub

Private Sub Form_Unload(Cancel As Integer)
Set clsSTK = Nothing
Set clsAH = Nothing
Set clsSAL = Nothing
Set clsPRT = Nothing
Set clsSIM = Nothing
Set clsARA = Nothing
Set clsSTN = Nothing
Set clsVTM = Nothing
Set fcmbPrtName = Nothing
Set fcmbVtmName = Nothing
Set fcmbSimName = Nothing
Set fcmbSimRefNo = Nothing
Set fcmbPckName = Nothing
Set clsListStru = Nothing

CloseTable datRecset
CloseDataSource dbAcDatabase
CloseDataSource dbStDatabase
CloseDataSource dbKgtDatabase
CloseDataSource dbGrpDatabase
CloseDataSource dbComDatabase
mFormSysVchType = 0
End Sub

Private Sub ShowEntryMode(ByVal EntryMode As Boolean)
If Me.Visible = True Then
    txtVoid.SetFocus
End If
frFormSmry.Visible = Not EntryMode: frFormSmry.Enabled = Not EntryMode
frFormDtl.Visible = EntryMode: frFormDtl.Enabled = EntryMode
frHeader.Visible = EntryMode: frHeader.Enabled = EntryMode
frFooter.Visible = EntryMode: frFooter.Enabled = EntryMode
cmdSaveForm.Enabled = EntryMode
If EntryMode = False Then
    FormAddEditMode = cFORM_SMRYMODE
End If

End Sub

Private Function Data_Verify() As Boolean
Dim mOpgVchNo As Long, mSalVchNo As Long
Dim mSalAmountTot As Double

Data_Verify = False
If FormAddEditMode = cFORM_EDITMODE And Val(mskFormBoundField.Text) < 1 Then
    ErrorBox "Invalid Key Value !!!"
    txtPrtName.SetFocus
    GoTo EndSub
End If
If Val(fcmbPrtName.BoundText) < 1 Then
    ErrorBox "Invalid Party Selection !!!"
    txtPrtName.SetFocus
    GoTo EndSub
End If
Rem sale validations
mSalVchNo = Val(UnMyNumFmt(mskSalVchNo(0).Text))
If mSalVchNo > 0 Then
    If mSalVchNo <> mSalVchNo_old Or Val(fcmbVtmName.BoundText) <> mSalVtmCode_old Or Ctod(dtpSalDate.Text) <> mSalDate_old Or FormAddEditMode = cFORM_ADDMODE Then
        If ChkIsDuplVTypeNo(dbKgtDatabase, dbAcDatabase, mTableName:="SaleHdr", mChkFieldName:="SahVchNo", mChkFieldValue:=mSalVchNo, mKeyFieldName:="SahCode", mKeyFieldValue:=mSalCode, mVtmFieldName:="SahVtmCode", mVtmFieldValue:=Val(fcmbVtmName.BoundText), mFinYrFieldName:="SahCmpCode", mFinYrFieldValue:=sFinYrCmpCode, mDateFieldName:="SahDate", mDateFieldValue:=Ctod(dtpSalDate.Text)) = True Then
            ErrorBox "Duplicate Voucher No. !!!"
            mskSalVchNo(0).SetFocus
            ' ---------------
            If FormAddEditMode = cFORM_ADDMODE Then
                mSalVchNo = GetNextVTypeNo(dbKgtDatabase, dbAcDatabase, dbComDatabase, mTableName:="SaleHdr", mFieldName:="SahVchNo", mVtmFieldName:="SahVtmCode", mVtmFieldValue:=Val(fcmbVtmName.BoundText), mFinYrFieldName:="SahCmpCode", mFinYrFieldValue:=sFinYrCmpCode, mDateFieldName:="SahDate", mDateFieldValue:=Ctod(dtpSalDate.Text), mModuleCode:=mFormUIdCode, mModuleName:=Me.Name, mAcsPermFileName:=mFormAcsPermFileName)
            Else
                mSalVchNo = mSalVchNo_old
            End If
            mskSalVchNo(0).Text = ToMyNumFmt(mSalVchNo, mDecimals:=0)
            GoTo EndSub
        End If
    End If
Else
    ErrorBox "Invalid Input !!!"
    mskSalVchNo(0).SetFocus
    GoTo EndSub
End If
If IsDate(dtpSalDate.Text) = False Then
    ErrorBox "Invalid Input !!!"
    dtpSalDate.SetFocus
    GoTo EndSub
Else
    If IsFinYrDate(Ctod(dtpSalDate.Text)) = False Then
        ErrorBox "Invalid Input !!!"
        dtpSalDate.SetFocus
        GoTo EndSub
    End If
End If
If TimeToMin(txtSalTime_str.Text) > cDAYMINUTES Then
    ErrorBox "Invalid Input !!!"
    txtSalTime_str.SetFocus
    GoTo EndSub
End If
If IsDate(dtpSalTrnRefDt.Text) = False Then
    ErrorBox "Invalid Input !!!"
    dtpSalTrnRefDt.SetFocus
    GoTo EndSub
End If
If ChkAnyExcessIsuExist() = True Then
    Mfgrd2.SetFocus
    GoTo EndSub
End If
If ChkAnyMisLinkedRcExist() = True Then
    ErrorBox "Invalid Linking !!!"
    Mfgrd2.SetFocus
    GoTo EndSub
End If

Data_Verify = True

EndSub:
Exit Function

End Function

Private Function Data_NetwAuth() As Boolean
Dim mSalVchNo As Long
Data_NetwAuth = False

mSalVchNo = Val(UnMyNumFmt(mskSalVchNo(0).Text))
If mSalVchNo <> mSalVchNo_old Or Val(fcmbVtmName.BoundText) <> mSalVtmCode_old Or Ctod(dtpSalDate.Text) <> mSalDate_old Or FormAddEditMode = cFORM_ADDMODE Then
    If ChkIsDuplVTypeNo(dbKgtDatabase, dbAcDatabase, mTableName:="SaleHdr", mChkFieldName:="SahVchNo", mChkFieldValue:=mSalVchNo, mKeyFieldName:="SahCode", mKeyFieldValue:=mSalCode, mVtmFieldName:="SahVtmCode", mVtmFieldValue:=Val(fcmbVtmName.BoundText), mFinYrFieldName:="SahCmpCode", mFinYrFieldValue:=sFinYrCmpCode, mDateFieldName:="SahDate", mDateFieldValue:=Ctod(dtpSalDate.Text)) = True Then
        ErrorBox "Duplicate Voucher No. !!!"
        mskSalVchNo(0).SetFocus
        ' ---------------
        If FormAddEditMode = True Then
            mSalVchNo = GetNextVTypeNo(dbKgtDatabase, dbAcDatabase, dbComDatabase, mTableName:="SaleHdr", mFieldName:="SahVchNo", mVtmFieldName:="SahVtmCode", mVtmFieldValue:=Val(fcmbVtmName.BoundText), mFinYrFieldName:="SahCmpCode", mFinYrFieldValue:=sFinYrCmpCode, mDateFieldName:="SahDate", mDateFieldValue:=Ctod(dtpSalDate.Text), mModuleCode:=mFormUIdCode, mModuleName:=Me.Name, mAcsPermFileName:=mFormAcsPermFileName)
        Else
            mSalVchNo = mSalVchNo_old
        End If
        mskSalVchNo(0).Text = ToMyNumFmt(mSalVchNo, mDecimals:=0)
        Exit Function
    End If
End If

Data_NetwAuth = True

End Function

Private Sub Mfgrd2_DblClick()
Mfgrd2_KeyPress vbKeyReturn
End Sub

Private Sub Mfgrd2_GotFocus()
Mfgrd2.Col = FlexLeftVisibleCol(Mfgrd2)
Mfgrd2.LeftCol = FlexLeftVisibleCol(Mfgrd2)
If Mfgrd2.SelectionMode = flexSelectionByRow Then
    Mfgrd2.ColSel = 0: Mfgrd2.ColSel = Mfgrd2.Cols - 1
End If

Rem Call Mfgrd2_RowColChange
End Sub

Private Sub Mfgrd2_KeyDown(KeyCode As Integer, Shift As Integer)
Dim srow As Integer, mSalICode As Long, mSalStkICode As Long, mDeleteit As Boolean

srow = Mfgrd2.Row
mSalICode = Val(Mfgrd2.TextMatrix(srow, X2SALICODE_COL))
mSalStkICode = Val(Mfgrd2.TextMatrix(srow, X2SALSTKICODE_COL))

If MyDeleteKey(Shift, KeyCode, mCheckCtrlMask:=False) = True And mSalICode > 0 Then
    mDeleteit = True
    If mDeleteit = True Then
        mDeleteit = CanDelete()
    End If
    If mDeleteit = True Then
        clsSAL.DeleteDtl mSalCode, mSalICode
        clsSTK.DeleteDtl mSalStkCode, mSalStkICode
        
        ShowDtlData mSalCode
        Mfgrd2.Row = srow
        Mfgrd2.SetFocus
        Call Mfgrd2_RowColChange
    End If
End If

End Sub

Private Sub Mfgrd2_KeyPress(KeyAscii As Integer)
Dim srow As Integer

If KeyAscii = vbKeyReturn Then
    srow = Mfgrd2.Row
    
    dtlAddEditMode = True
    dtlAddMode = IsFlexNewRow(Mfgrd2, srow)
    VisibleControls True, Mfgrd2.Top + Mfgrd2.RowPos(Mfgrd2.Row)
    If dtlAddMode = True Then
        mskSalSno.Text = ToMyNumFmt(FlexNextSeqno(Mfgrd2, X2SALSNO_COL), mDecimals:=0)
        mskSalQty.Text = ToMyNumFmt(1, mDecimals:=-1)
        cmbSalDiscType.ListIndex = 1
        cmbSalTaxType.ListIndex = 1
    Else
        ShowControlValues srow, mRefreshList:=True
    End If
    txtSimName.SetFocus
    Call ValidDtl
    
    mOutPckQtyChanged = False
    mInrPckSzChanged = False
    mInrQtyChanged = False
    mDiscPerChanged = False: mDiscAmtChanged = False
    mTaxPerChanged = False: mTaxAmtChanged = False
    mWslRateChanged = False
    mRtlRateChanged = False
    mSalSimCode_old = Val(fcmbSimName.BoundText)
    mSalPckCode_old = Val(fcmbPckName.BoundText)
    mSalItmCode_old = Val(mskSalItmCode.Text)
    mSalItrCode_old = Val(mskSalItrCode.Text)
    mSalPurCode_old = Val(mskSalPurCode.Text)
    mSalPurICode_old = Val(mskSalPurICode.Text)
    mSalBasicAmt_old = Val(UnMyNumFmt(mskSalBasicAmt.Text))
    mSalDiscPer_old = Val(UnMyPerFmt(mskSalDiscPer.Text))
    mSalTaxPer_old = Val(UnMyPerFmt(mskSalTaxPer.Text))

End If

End Sub

Private Sub Mfgrd2_RowColChange()
ShowActiveFlexRow Mfgrd2
ShowControlValues Mfgrd2.Row, mRefreshList:=False
End Sub

Private Sub ShowControlValues(ByVal srow As Integer, ByVal mRefreshList As Boolean)
Dim tRecset As ADODB.Recordset

mskSalICode.Text = Val(Mfgrd2.TextMatrix(srow, X2SALICODE_COL))
mskSalStkICode.Text = Val(Mfgrd2.TextMatrix(srow, X2SALSTKICODE_COL))
mskSalSno.Text = Mfgrd2.TextMatrix(srow, X2SALSNO_COL)
fcmbSimName.BoundText = Mfgrd2.TextMatrix(srow, X2SALSIMCODE_COL): txtSimName.Text = fcmbSimName.Text
txtSalNarr.Text = Mfgrd2.TextMatrix(srow, X2SALNARR_COL)
mskSalItmCode.Text = Val(Mfgrd2.TextMatrix(srow, X2SALITMCODE_COL))
mskSalItrCode.Text = Val(Mfgrd2.TextMatrix(srow, X2SALITRCODE_COL))
mskSalPurCode.Text = Mfgrd2.TextMatrix(srow, X2SALPURCODE_COL)
mskSalPurICode.Text = Mfgrd2.TextMatrix(srow, X2SALPURICODE_COL)
' ---------------------
txtSalSimRefNo.Text = Mfgrd2.TextMatrix(srow, X2SALSIMREFNO_COL)
If mRefreshList = True Then
    Call ChkSimRefNoList
    fcmbSimRefNo.BoundText = Val(mskSalPurICode.Text)  ''' txtSalSimRefNo.Text & "_" & Format(Val(mskSalPurICode.Text), cLONGCODESTRFMT) & "_" & Format(Val(Mfgrd2.TextMatrix(srow, X2SALITRCODE_COL)), cLONGCODESTRFMT)
    txtSalSimRefNo.Text = fcmbSimRefNo.Text
    
    Set tRecset = dbKgtDatabase.Execute("Select * from PurchDtl pur inner join PurchHdr puh on pur.PurCode = puh.PuhCode where pur.PurICode = " & CStr(Val(mskSalPurICode.Text)) & "")
    If tRecset.EOF = False Then
        If Val(mskSalPurCode.Text) <> tRecset.fields("PurCode") Or Val(mskSalItmCode.Text) <> tRecset.fields("PurItmCode") Or Val(mskSalItrCode.Text) <> tRecset.fields("PurItrCode") Then
            ErrorBox "Unexpected Linked Values found in Sales Detail !!!"
        End If
    End If
    CloseTable tRecset
End If
fcmbPckName.BoundText = Mfgrd2.TextMatrix(srow, X2SALPCKCODE_COL): txtPckName.Text = fcmbPckName.Text
mskSalOutPckQty.Text = Mfgrd2.TextMatrix(srow, X2SALOUTPCKQTY_COL)
txtSalOutPckNm.Text = Mfgrd2.TextMatrix(srow, X2SALOUTPCKNM_COL)
mskSalInrPckSz.Text = Mfgrd2.TextMatrix(srow, X2SALINRPCKSZ_COL)
txtSalInrPckNm.Text = Mfgrd2.TextMatrix(srow, X2SALINRPCKNM_COL)
mskSalQty.Text = Mfgrd2.TextMatrix(srow, X2SALQTY_COL)
mskSalRate.Text = Mfgrd2.TextMatrix(srow, X2SALRATE_COL)
mskSalMRP.Text = Mfgrd2.TextMatrix(srow, X2SALMRP_COL)
mskSalWslRate.Text = Mfgrd2.TextMatrix(srow, X2SALWSLRATE_COL)
mskSalRtlRate.Text = Mfgrd2.TextMatrix(srow, X2SALRTLRATE_COL)
'''mskPurMRP.Text = Mfgrd2.TextMatrix(srow, X2PURMRP_COL)
'''mskPurRate.Text = Mfgrd2.TextMatrix(srow, X2PURRATE_COL)
cmbSalDiscType.ListIndex = Val(Mfgrd2.TextMatrix(srow, X2SALDISCTYPENO_COL))
mskSalDiscPer.Text = Mfgrd2.TextMatrix(srow, X2SALDISCPER_COL)
mskSalDiscableAmt.Text = Mfgrd2.TextMatrix(srow, X2SALDISCABLEAMT_COL)
mskSalDiscAmt.Text = Mfgrd2.TextMatrix(srow, X2SALDISCAMT_COL)
cmbSalTaxType.ListIndex = Val(Mfgrd2.TextMatrix(srow, X2SALTAXTYPENO_COL))
mskSalTaxPer.Text = Mfgrd2.TextMatrix(srow, X2SALTAXPER_COL)
mskSalTaxableAmt.Text = Mfgrd2.TextMatrix(srow, X2SALTAXABLEAMT_COL)
mskSalTaxAmt.Text = Mfgrd2.TextMatrix(srow, X2SALTAXAMT_COL)
mskSalAmount.Text = Mfgrd2.TextMatrix(srow, X2SALAMOUNT_COL)
mskSalBasicAmt.Text = Mfgrd2.TextMatrix(srow, X2SALBASICAMT_COL)

Set tRecset = Nothing

End Sub

Private Sub mskSahAmount_GotFocus()
FlashActiveControl mskSahAmount, True
End Sub

Private Sub mskSahAmount_LostFocus()
FlashActiveControl mskSahAmount, False
End Sub

Private Sub mskSahDiscAmt_GotFocus()
FlashActiveControl mskSahDiscAmt, True
End Sub

Private Sub mskSahDiscAmt_LostFocus()
FlashActiveControl mskSahDiscAmt, False
End Sub

Private Sub mskSahDiscAmt_Validate(Cancel As Boolean)
mskSahDiscAmt.Text = ToMyNumFmt(mskSahDiscAmt.Text, mUseAbs:=True)
Call CalcFtrTotal

End Sub

Private Sub mskSahDiscPer_GotFocus()
FlashActiveControl mskSahDiscPer, True
End Sub

Private Sub mskSahDiscPer_LostFocus()
FlashActiveControl mskSahDiscPer, False
End Sub

Private Sub mskSahDiscPer_Validate(Cancel As Boolean)
mskSahDiscPer.Text = ToMyPerFmt(mskSahDiscPer.Text, mDecimals:=-1, mUseAbs:=True)
Call CalcFtrTotal
End Sub

Private Sub mskSahOtherAmt_GotFocus()
FlashActiveControl mskSahOtherAmt, True
End Sub

Private Sub mskSahOtherAmt_LostFocus()
FlashActiveControl mskSahOtherAmt, False
End Sub

Private Sub mskSahOtherAmt_Validate(Cancel As Boolean)
mskSahOtherAmt.Text = ToMyNumFmt(mskSahOtherAmt.Text, mUseAbs:=True)
Call CalcFtrTotal

End Sub

Private Sub mskSahROffAmt_GotFocus()
FlashActiveControl mskSahROffAmt, True
End Sub

Private Sub mskSahROffAmt_LostFocus()
FlashActiveControl mskSahROffAmt, False
End Sub

Private Sub mskSahROffAmt_Validate(Cancel As Boolean)
mskSahROffAmt.Text = ToMyNumFmt(mskSahROffAmt.Text, mUseAbs:=True)
Call CalcFtrTotal

End Sub

Private Sub mskSahTaxAmt_GotFocus()
FlashActiveControl mskSahTaxAmt, True
End Sub

Private Sub mskSahTaxAmt_LostFocus()
FlashActiveControl mskSahTaxAmt, False
End Sub

Private Sub mskSahTaxAmt_Validate(Cancel As Boolean)
mskSahTaxAmt.Text = ToMyNumFmt(mskSahTaxAmt.Text, mUseAbs:=True)
Call CalcFtrTotal

End Sub

Private Sub mskSahTaxPer_GotFocus()
FlashActiveControl mskSahTaxPer, True
End Sub

Private Sub mskSahTaxPer_LostFocus()
FlashActiveControl mskSahTaxPer, False
End Sub

Private Sub mskSahTaxPer_Validate(Cancel As Boolean)
mskSahTaxPer.Text = ToMyPerFmt(mskSahTaxPer.Text, mDecimals:=-1, mUseAbs:=True)
Call CalcFtrTotal

End Sub

Private Sub mskSalAmount_GotFocus()
FlashActiveControl mskSalAmount, True
End Sub

Private Sub mskSalAmount_LostFocus()
FlashActiveControl mskSalAmount, False
End Sub

Private Sub mskSalAmount_Validate(Cancel As Boolean)
mskSalAmount.Text = ToMyNumFmt(mskSalAmount.Text, mUseAbs:=True)
If Val(UnMyNumFmt(mskSalAmount.Text)) < 0 Then
    ErrorBox "Invalid Input !!!"
    mskSalAmount.SetFocus
    Cancel = True
End If
Call ValidDtl

End Sub

Rem discart this validation, instead use validation at sale hdr level
Private Function chkSalAmount() As Boolean
Dim mRtnval As Boolean, srow As Integer, mSalAmount As Double

mRtnval = True
srow = Mfgrd2.Row
mSalAmount = Val(UnMyNumFmt(mskSalAmount.Text))

chkSalAmount = mRtnval

End Function

Private Sub mskSalDiscAmt_Change()
If InterActiveChange(mskSalDiscAmt) = True Then
    mDiscAmtChanged = True
    mDiscPerChanged = False
End If

End Sub

Private Sub mskSalDiscAmt_GotFocus()
FlashActiveControl mskSalDiscAmt, True
End Sub

Private Sub mskSalDiscAmt_LostFocus()
FlashActiveControl mskSalDiscAmt, False
End Sub

Private Sub mskSalDiscAmt_Validate(Cancel As Boolean)
mskSalDiscAmt.Text = ToMyNumFmt(mskSalDiscAmt.Text, mUseAbs:=True)
Call CalcSalChg
Call ValidDtl

End Sub

Private Sub mskSalDiscPer_Change()
If InterActiveChange(mskSalDiscPer) = True Then
    mDiscPerChanged = True
    mDiscAmtChanged = False
End If
End Sub

Private Sub mskSalDiscPer_GotFocus()
FlashActiveControl mskSalDiscPer, True
End Sub

Private Sub mskSalDiscPer_LostFocus()
FlashActiveControl mskSalDiscPer, False
End Sub

Private Sub mskSalDiscPer_Validate(Cancel As Boolean)
mskSalDiscPer.Text = ToMyPerFmt(mskSalDiscPer.Text, mDecimals:=-1, mUseAbs:=True)
Call CalcSalChg
Call ValidDtl
End Sub

Private Sub mskSalInrPckSz_Change()
If InterActiveChange(mskSalInrPckSz) = True Then
    mInrPckSzChanged = True
    mInrQtyChanged = False
End If

End Sub

Private Sub mskSalInrPckSz_GotFocus()
FlashActiveControl mskSalInrPckSz, True
Rem mInrPckSzChanged = False
End Sub

Private Sub mskSalInrPckSz_LostFocus()
FlashActiveControl mskSalInrPckSz, False
End Sub

Private Sub mskSalInrPckSz_Validate(Cancel As Boolean)
mskSalInrPckSz.Text = ToMyNumFmt(mskSalInrPckSz.Text, mDecimals:=-1, mUseAbs:=True)
If Val(UnMyNumFmt(mskSalInrPckSz.Text)) < 0 Then
    ErrorBox "Invalid Input !!!"
    mskSalInrPckSz.SetFocus
    Cancel = True
Else
    Call CalcSalChg
End If
Call ValidDtl

End Sub

Private Sub mskSalMRP_GotFocus()
FlashActiveControl mskSalMRP, True
End Sub

Private Sub mskSalMRP_LostFocus()
FlashActiveControl mskSalMRP, False
End Sub

Private Sub mskSalMRP_Validate(Cancel As Boolean)
mskSalMRP.Text = ToMyNumFmt(mskSalMRP.Text, mUseAbs:=True)
If dtlAddMode = True Or Val(UnMyNumFmt(mskSalWslRate.Text)) = 0 Then
    If mWslRateChanged = False Then
        Rem mskSalWslRate.Text = mskSalMRP.Text
    End If
End If
If dtlAddMode = True Or Val(UnMyNumFmt(mskSalRtlRate.Text)) = 0 Then
    If mRtlRateChanged = False Then
        Rem mskSalRtlRate.Text = mskSalMRP.Text
    End If
End If
Call CalcSalChg
Call ValidDtl

End Sub

Private Sub mskSalOutPckQty_Change()
If InterActiveChange(mskSalOutPckQty) = True Then
    mOutPckQtyChanged = True
    mInrQtyChanged = False
End If
End Sub

Private Sub mskSalOutPckQty_GotFocus()
FlashActiveControl mskSalOutPckQty, True
Rem mOutPckQtyChanged = False
End Sub

Private Sub mskSalOutPckQty_LostFocus()
FlashActiveControl mskSalOutPckQty, False
End Sub

Private Sub mskSalOutPckQty_Validate(Cancel As Boolean)
mskSalOutPckQty.Text = ToMyNumFmt(mskSalOutPckQty.Text, mDecimals:=-1, mUseAbs:=True)
If Val(UnMyNumFmt(mskSalOutPckQty.Text)) < 0 Then
    ErrorBox "Invalid Input !!!"
    mskSalOutPckQty.SetFocus
    Cancel = True
Else
    Call CalcSalChg
End If
Call ValidDtl

End Sub

Private Sub mskSalQty_Change()
If InterActiveChange(mskSalQty) = True Then
    mInrQtyChanged = True
    mOutPckQtyChanged = False
    mInrPckSzChanged = False
End If

End Sub

Private Sub mskSalRate_GotFocus()
FlashActiveControl mskSalRate, True
End Sub

Private Sub mskSalRate_LostFocus()
FlashActiveControl mskSalRate, False
End Sub

Private Sub mskSalRate_Validate(Cancel As Boolean)
mskSalRate.Text = ToMyNumFmt(mskSalRate.Text, mUseAbs:=True)
If Val(UnMyNumFmt(mskSalRate.Text)) < 0 Then
    ErrorBox "Invalid Input !!!"
    mskSalRate.SetFocus
    Cancel = True
Else
    Call CalcSalChg
End If
Call ValidDtl

End Sub

Private Sub mskSalQty_GotFocus()
FlashActiveControl mskSalQty, True
End Sub

Private Sub mskSalQty_LostFocus()
FlashActiveControl mskSalQty, False
End Sub

Private Sub mskSalQty_Validate(Cancel As Boolean)
mskSalQty.Text = ToMyNumFmt(mskSalQty.Text, mDecimals:=-1, mUseAbs:=True)
If Val(UnMyNumFmt(mskSalQty.Text)) < 0 Then
    ErrorBox "Invalid Input !!!"
    mskSalQty.SetFocus
    Cancel = True
Else
    Call CalcSalChg
End If
Call ValidDtl

End Sub

Private Sub mskSalRtlRate_Change()
If InterActiveChange(mskSalRtlRate) = True Then
    mRtlRateChanged = True
End If
End Sub

Private Sub mskSalRtlRate_GotFocus()
FlashActiveControl mskSalRtlRate, True
End Sub

Private Sub mskSalRtlRate_LostFocus()
FlashActiveControl mskSalRtlRate, False
End Sub

Private Sub mskSalRtlRate_Validate(Cancel As Boolean)
mskSalRtlRate.Text = ToMyNumFmt(mskSalRtlRate.Text, mUseAbs:=True)
If Val(UnMyNumFmt(mskSalRtlRate.Text)) = 0 Then
    Rem mskSalRtlRate.Text = mskSalMRP.Text
End If
Call CalcSalChg
Call ValidDtl

End Sub

Private Sub mskSalTaxAmt_Change()
If InterActiveChange(mskSalTaxAmt) = True Then
    mTaxAmtChanged = True
    mTaxPerChanged = False
End If

End Sub

Private Sub mskSalTaxAmt_GotFocus()
FlashActiveControl mskSalTaxAmt, True
End Sub

Private Sub mskSalTaxAmt_LostFocus()
FlashActiveControl mskSalTaxAmt, False
End Sub

Private Sub mskSalTaxAmt_Validate(Cancel As Boolean)
mskSalTaxAmt.Text = ToMyNumFmt(mskSalTaxAmt.Text, mUseAbs:=True)
Call CalcSalChg
Call ValidDtl

End Sub

Private Sub mskSalTaxPer_Change()
If InterActiveChange(mskSalTaxPer) = True Then
    mTaxPerChanged = True
    mTaxAmtChanged = False
End If

End Sub

Private Sub mskSalTaxPer_GotFocus()
FlashActiveControl mskSalTaxPer, True
End Sub

Private Sub mskSalTaxPer_LostFocus()
FlashActiveControl mskSalTaxPer, False
End Sub

Private Sub mskSalTaxPer_Validate(Cancel As Boolean)
mskSalTaxPer.Text = ToMyPerFmt(mskSalTaxPer.Text, mDecimals:=-1, mUseAbs:=True)
Call CalcSalChg
Call ValidDtl

End Sub

Private Sub mskSalVchNo_GotFocus(Index As Integer)
FlashActiveControl mskSalVchNo(Index), True
End Sub

Private Sub mskSalVchNo_LostFocus(Index As Integer)
FlashActiveControl mskSalVchNo(Index), False
End Sub

Private Sub mskSalVchNo_Validate(Index As Integer, Cancel As Boolean)
Dim mSalVchNo As Long

mSalVchNo = Val(UnMyNumFmt(mskSalVchNo(Index).Text))
If mSalVchNo < 0 Then
    If Index = 0 Then
        mSalVchNo = GetNextVTypeNo(dbKgtDatabase, dbAcDatabase, dbComDatabase, mTableName:="SaleHdr", mFieldName:="SahVchNo", mVtmFieldName:="SahVtmCode", mVtmFieldValue:=Val(fcmbVtmName.BoundText), mFinYrFieldName:="SahCmpCode", mFinYrFieldValue:=sFinYrCmpCode, mDateFieldName:="SahDate", mDateFieldValue:=Ctod(dtpSalDate.Text), mModuleCode:=mFormUIdCode, mModuleName:=Me.Name, mAcsPermFileName:=mFormAcsPermFileName)
        mskSalVchNo(Index).Text = ToMyNumFmt(mSalVchNo, mDecimals:=0)
    Else
        ErrorBox "Invalid Input !!!"
        mskSalVchNo(Index).SetFocus
        Cancel = True
    End If
ElseIf mSalVchNo > 0 Then
    If Index = 0 Then
        If mSalVchNo <> mSalVchNo_old Or Val(fcmbVtmName.BoundText) <> mSalVtmCode_old Or Ctod(dtpSalDate.Text) <> mSalDate_old Or FormAddEditMode = cFORM_ADDMODE Then
            If ChkIsDuplVTypeNo(dbKgtDatabase, dbAcDatabase, mTableName:="SaleHdr", mChkFieldName:="SahVchNo", mChkFieldValue:=mSalVchNo, mKeyFieldName:="SahCode", mKeyFieldValue:=mSalCode, mVtmFieldName:="SahVtmCode", mVtmFieldValue:=Val(fcmbVtmName.BoundText), mFinYrFieldName:="SahCmpCode", mFinYrFieldValue:=sFinYrCmpCode, mDateFieldName:="SahDate", mDateFieldValue:=Ctod(dtpSalDate.Text)) = True Then
                ErrorBox "Duplicate Voucher No. !!!"
                Cancel = True
                mskSalVchNo(Index).SetFocus
                ' ----------
                If FormAddEditMode = cFORM_ADDMODE Then
                    mSalVchNo = GetNextVTypeNo(dbKgtDatabase, dbAcDatabase, dbComDatabase, mTableName:="SaleHdr", mFieldName:="SahVchNo", mVtmFieldName:="SahVtmCode", mVtmFieldValue:=Val(fcmbVtmName.BoundText), mFinYrFieldName:="SahCmpCode", mFinYrFieldValue:=sFinYrCmpCode, mDateFieldName:="SahDate", mDateFieldValue:=Ctod(dtpSalDate.Text), mModuleCode:=mFormUIdCode, mModuleName:=Me.Name, mAcsPermFileName:=mFormAcsPermFileName)
                Else
                    mSalVchNo = mSalVchNo_old
                End If
                mskSalVchNo(Index).Text = ToMyNumFmt(mSalVchNo, mDecimals:=0)
            End If
        End If
        If Cancel = False Then
            mskSalVchNo(Index).Text = ToMyNumFmt(mSalVchNo, mDecimals:=0)
        End If
    Else
        If ChkIsExistVTypeNo(dbKgtDatabase, mTableName:="SaleHdr", mChkFieldName:="SahVchNo", mChkFieldValue:=CStr(mSalVchNo), mVtmFieldName:="SahVtmCode", mVtmFieldValue:=Val(fcmbVtmName.BoundText), mFinYrFieldName:="SahCmpCode", mFinYrFieldValue:=sFinYrCmpCode) = False Then
            ErrorBox "Voucher No. does not Exist !!!"
            mskSalVchNo(Index).SetFocus
            Rem Cancel = True
        End If
    End If
Else
    ErrorBox "Invalid Input !!!"
    mskSalVchNo(Index).SetFocus
    Cancel = True
End If

End Sub

Private Sub mskSalWslRate_Change()
If InterActiveChange(mskSalWslRate) = True Then
    mWslRateChanged = True
End If
End Sub

Private Sub mskSalWslRate_GotFocus()
FlashActiveControl mskSalWslRate, True
End Sub

Private Sub mskSalWslRate_LostFocus()
FlashActiveControl mskSalWslRate, False
End Sub

Private Sub mskSalWslRate_Validate(Cancel As Boolean)
mskSalWslRate.Text = ToMyNumFmt(mskSalWslRate.Text, mUseAbs:=True)
If Val(UnMyNumFmt(mskSalWslRate.Text)) = 0 Then
    Rem mskSalWslRate.Text = mskSalMRP.Text
End If
Call CalcSalChg
Call ValidDtl

End Sub

Private Sub optDatewise_GotFocus()
FlashActiveControl optDatewise, True
End Sub

Private Sub optDatewise_LostFocus()
FlashActiveControl optDatewise, False
End Sub

Private Sub optDetailed_GotFocus()
FlashActiveControl optDetailed, True
End Sub

Private Sub optDetailed_LostFocus()
FlashActiveControl optDetailed, False
End Sub

Private Sub optExpanded_GotFocus()
FlashActiveControl optExpanded, True
End Sub

Private Sub optExpanded_LostFocus()
FlashActiveControl optExpanded, False
End Sub

Private Sub optItemwise_GotFocus()
FlashActiveControl optItemWise, True
End Sub

Private Sub optItemwise_LostFocus()
FlashActiveControl optItemWise, False
End Sub

Private Sub optMonthwise_GotFocus()
FlashActiveControl optMonthwise, True
End Sub

Private Sub optMonthwise_LostFocus()
FlashActiveControl optMonthwise, False
End Sub

Private Sub optPartywise_GotFocus()
FlashActiveControl optPartywise, True
End Sub

Private Sub optPartywise_LostFocus()
FlashActiveControl optPartywise, False
End Sub

Private Sub optVTypewise_GotFocus()
FlashActiveControl optVTypewise, True
End Sub

Private Sub optVTypewise_LostFocus()
FlashActiveControl optVTypewise, False
End Sub

Private Sub StatusBar1_PanelClick(ByVal Panel As MSComctlLib.Panel)
ShowStatusBarText StatusBar1
End Sub

Private Sub txtAraName_GotFocus()
FlashActiveControl txtAraName, True
End Sub

Private Sub txtAraName_LostFocus()
FlashActiveControl txtAraName, False
End Sub

Private Sub txtPckName_Change()
If fcmbPckName.CallFromText_Change = False Then
    fcmbPckName.CallFromText_Change = True
    If InterActiveChange(txtPckName) = True Then
        fcmbPckName.ReInit
        fcmbPckName.UserText = Array(txtPckName.Text, txtPckName.SelStart)
        fcmbPckName.Show
        txtPckName.Text = fcmbPckName.Text
        If fcmbPckName.ListSelected = True Then
            SendKeys "{tab}"
        End If
    End If
    fcmbPckName.CallFromText_Change = False
End If

End Sub

Private Sub txtPckName_GotFocus()
FlashActiveControl txtPckName, True
End Sub

Private Sub txtPckName_KeyDown(KeyCode As Integer, Shift As Integer)
If MyDropDownKey(Shift, KeyCode) = True Then
    Call txtPckName_Change
End If
End Sub

Private Sub txtPckName_LostFocus()
FlashActiveControl txtPckName, False
End Sub

Private Sub txtPckName_Validate(Cancel As Boolean)
Dim tRecset As ADODB.Recordset

If Val(fcmbPckName.BoundText) < 1 Then
    ErrorBox "Invalid Selection !!!"
    txtPckName.SetFocus
    Cancel = True
Else
    If dtlAddMode = True Or Val(fcmbPckName.BoundText) <> mSalPckCode_old Then
'        clsPCK.GetData Val(fcmbPckName.BoundText)
'
'        txtSalOutPckNm.Text = clsPCK.mPckOutNm_str
'        mskSalInrPckSz.Text = ToMyNumFmt(clsPCK.mPckInrSz_dbl, mDecimals:=-1)
'        txtSalInrPckNm.Text = clsPCK.mPckInrNm_str
'
'        Set tRecset = dbKgtDatabase.Execute("Select * from SubItmRateMst where SirCode = " & CStr(Val(fcmbSimName.BoundText)) & " and SirPckCode = " & CStr(Val(fcmbPckName.BoundText)))
'        With tRecset
'        If .EOF = False Then
'            mskSalRate.Text = ToMyNumFmt(.fields("SirSalchRate"))
'            mskSalMRP.Text = ToMyNumFmt(.fields("SirMrpRate"))
'            mskSalWslRate.Text = ToMyNumFmt(.fields("SirWslRate"))
'            mskSalRtlRate.Text = ToMyNumFmt(.fields("SirRtlRate"))
'        End If
'        End With
'        CloseTable tRecset
'
'        Call CalcSalChg
    End If
End If
Call ValidDtl

End Sub

Private Sub txtQrySimName_Change()
If fcmbSimName.CallFromText_Change = False Then
    fcmbSimName.CallFromText_Change = True
    If InterActiveChange(txtQrySimName) = True Then
        fcmbSimName.UserText = Array(txtQrySimName.Text, txtQrySimName.SelStart)
        fcmbSimName.Show
        txtQrySimName.Text = fcmbSimName.Text
        mQrySimCode = Val(fcmbSimName.BoundText)
        If fcmbSimName.ListSelected = True Then
            SendKeys "{tab}"
        End If
    End If
    fcmbSimName.CallFromText_Change = False
End If

End Sub

Private Sub txtQrySimName_GotFocus()
FlashActiveControl txtQrySimName, True
End Sub

Private Sub txtQrySimName_KeyDown(KeyCode As Integer, Shift As Integer)
If MyDropDownKey(Shift, KeyCode) = True Then
    Call txtQrySimName_Change
ElseIf MyAddNewKey(Shift, KeyCode) = True Then
    Rem not required
End If

End Sub

Private Sub txtQrySimName_LostFocus()
FlashActiveControl txtQrySimName, False
End Sub

Private Sub txtQryVtmName_Change()
If fcmbVtmName.CallFromText_Change = False Then
    fcmbVtmName.CallFromText_Change = True
    If InterActiveChange(txtQryVtmName) = True Then
        fcmbVtmName.UserText = Array(txtQryVtmName.Text, txtQryVtmName.SelStart)
        fcmbVtmName.Show
        txtQryVtmName.Text = fcmbVtmName.Text
        mQryVtmCode = Val(fcmbVtmName.BoundText)
        If fcmbVtmName.ListSelected = True Then
            SendKeys "{tab}"
        End If
    End If
    fcmbVtmName.CallFromText_Change = False
End If

End Sub

Private Sub txtQryVtmName_GotFocus()
FlashActiveControl txtQryVtmName, True
End Sub

Private Sub txtQryVtmName_KeyDown(KeyCode As Integer, Shift As Integer)
If MyDropDownKey(Shift, KeyCode) = True Then
    Call txtQryVtmName_Change
ElseIf MyAddNewKey(Shift, KeyCode) = True Then
    Rem not required
End If

End Sub

Private Sub txtQryVtmName_LostFocus()
FlashActiveControl txtQryVtmName, False
End Sub

Private Sub txtSalInrPckNm_GotFocus()
FlashActiveControl txtSalInrPckNm, True
End Sub

Private Sub txtSalInrPckNm_LostFocus()
FlashActiveControl txtSalInrPckNm, False
End Sub

Private Sub txtSalInrPckNm_Validate(Cancel As Boolean)
txtSalInrPckNm.Text = ToMyString(Trim(txtSalInrPckNm.Text))
If txtSalInrPckNm.Text = "" Then
    ErrorBox "Invalid Input !!!"
    txtSalInrPckNm.SetFocus
    Cancel = True
End If
Call ValidDtl

End Sub

Private Sub txtSalNarr_GotFocus()
FlashActiveControl txtSalNarr, True
End Sub

Private Sub txtSalNarr_LostFocus()
FlashActiveControl txtSalNarr, False
End Sub

Private Sub txtSalNarr_Validate(Cancel As Boolean)
txtSalNarr.Text = ToMyWord(txtSalNarr.Text, mFilterStr:=False)
End Sub

Private Sub txtSalOutPckNm_GotFocus()
FlashActiveControl txtSalOutPckNm, True
End Sub

Private Sub txtSalOutPckNm_LostFocus()
FlashActiveControl txtSalOutPckNm, False
End Sub

Private Sub txtSalOutPckNm_Validate(Cancel As Boolean)
txtSalOutPckNm.Text = ToMyString(Trim(txtSalOutPckNm.Text))
If txtSalOutPckNm.Text = "" Then
    ErrorBox "Invalid Input !!!"
    txtSalOutPckNm.SetFocus
    Cancel = True
End If
Call ValidDtl

End Sub

Private Sub txtSalSimRefNo_Change()
If fcmbSimRefNo.CallFromText_Change = False Then
    fcmbSimRefNo.CallFromText_Change = True
    If InterActiveChange(txtSalSimRefNo) = True Then
        fcmbSimRefNo.UserText = Array(txtSalSimRefNo.Text, txtSalSimRefNo.SelStart)
        fcmbSimRefNo.Show
        txtSalSimRefNo.Text = fcmbSimRefNo.Text
        If fcmbSimRefNo.ListSelected = True Then
            SendKeys "{TAB}"
        End If
    End If
    fcmbSimRefNo.CallFromText_Change = False
End If

End Sub

Private Sub txtSalSimRefNo_GotFocus()
FlashActiveControl txtSalSimRefNo, True
End Sub

Private Sub txtSalSimRefNo_KeyDown(KeyCode As Integer, Shift As Integer)
If MyDropDownKey(Shift, KeyCode) = True Then
    Call txtSalSimRefNo_Change
End If

End Sub

Private Sub txtSalSimRefNo_LostFocus()
FlashActiveControl txtSalSimRefNo, False
End Sub

Private Sub txtSalSimRefNo_Validate(Cancel As Boolean)
Dim tRecset As ADODB.Recordset

If Val(fcmbSimRefNo.BoundText) < 1 Then
    ErrorBox "Invalid Selection !!!"
    Rem txtSalSimRefNo.SetFocus
    Rem Cancel = True
Else
    Rem If dtlAddMode = True Or Val(fcmbSimName.BoundText) <> mSalSimCode_old Or Val(mskSalItmCode.Text) <> mSalItmCode_old Or Val(mskSalItrCode.Text) <> mSalItrCode_old Then
    mskSalPurICode.Text = Val(fcmbSimRefNo.BoundText)
    If dtlAddMode = True Or Val(fcmbSimName.BoundText) <> mSalSimCode_old Or Val(mskSalPurICode.Text) <> mSalPurICode_old Then
        Set tRecset = dbKgtDatabase.Execute("Select * from PurchDtl pur" _
            & " inner join PurchHdr puh on pur.PurCode = puh.PuhCode" _
            & " where pur.PurICode = " & CStr(Val(mskSalPurICode.Text)))
        Rem & " where pur.PurPrtCode=" & CStr(Val(fcmbPrtName.BoundText))
        With tRecset
        fcmbPckName.BoundText = .fields("PurPckCode")
        txtPckName.Text = fcmbPckName.Text
        mskSalPurCode.Text = .fields("PurCode")
        Rem mskSalPurICode.Text = .fields("PurICode")
        mskSalItrCode.Text = .fields("PurItrcode")
        
        txtSalOutPckNm.Text = .fields("PurOutPckNm")
        mskSalInrPckSz.Text = ToMyNumFmt(.fields("PurInrPckSz"), mDecimals:=-1)
        txtSalInrPckNm.Text = .fields("PurInrPckNm")
        If mFormSysVchType = cKGT_VTYPE_SWLSALES Or mFormSysVchType = cKGT_VTYPE_RTLSALES Then
            If mFormSysVchType = cKGT_VTYPE_SWLSALES Then
                mskSalRate.Text = ToMyNumFmt(MyDivide(CDec(.fields("PurWslRate")), CDec(.fields("PurInrPckSz"))))
            ElseIf mFormSysVchType = cKGT_VTYPE_RTLSALES Then
                mskSalRate.Text = ToMyNumFmt(MyDivide(CDec(.fields("PurRtlRate")), CDec(.fields("PurInrPckSz"))))
            Else
                mskSalRate.Text = ToMyNumFmt(0)
            End If
            mskSalMRP.Text = ToMyNumFmt(MyDivide(CDec(.fields("PurMrp")), CDec(.fields("PurInrPckSz"))))
            mskSalWslRate.Text = ToMyNumFmt(MyDivide(CDec(.fields("PurWslRate")), CDec(.fields("PurInrPckSz"))))
            mskSalRtlRate.Text = ToMyNumFmt(MyDivide(CDec(.fields("PurRtlRate")), CDec(.fields("PurInrPckSz"))))
            
        ElseIf mFormSysVchType = cKGT_VTYPE_WSLSALES Then
            mskSalRate.Text = ToMyNumFmt(.fields("PurWslRate"))
            mskSalMRP.Text = ToMyNumFmt(.fields("PurMrp"))
            mskSalWslRate.Text = ToMyNumFmt(.fields("PurWslRate"))
            mskSalRtlRate.Text = ToMyNumFmt(.fields("PurRtlRate"))
        
        End If
'''        If mFormSysVchType = cCOM_VTYPE_RETNOUTW Then
'''            mskSalRate.Text = ToMyNumFmt(.fields("PurRate"))
'''            '''mskPurRate.Text = ToMyNumFmt(.fields("PurWslRate"))
'''        Else
'''            mskSalRate.Text = ToMyNumFmt(.fields("PurWslRate"))
'''            '''mskPurRate.Text = ToMyNumFmt(.fields("PurRate"))
'''        End If
        '''mskPurMRP.Text = ToMyNumFmt(.fields("PurMRP"))
        End With
        CloseTable tRecset
        
        Call CalcSalChg
    End If
    Set tRecset = dbKgtDatabase.Execute("Select * from PurchDtl pur" _
        & " inner join PurchHdr puh on pur.PurCode = puh.PuhCode" _
        & " where pur.PurICode = " & CStr(Val(mskSalPurICode.Text)))
    If tRecset.EOF = False Then
        If Val(mskSalPurCode.Text) <> tRecset.fields("PurCode") Or Val(mskSalItmCode.Text) <> tRecset.fields("PurItmCode") Or Val(mskSalItrCode.Text) <> tRecset.fields("PurItrCode") Then
            ErrorBox "Unexpected Linked Values found in Sales Detail !!!"
            mskSalPurCode.Text = 0
            mskSalPurICode.Text = 0
            mskSalItmCode.Text = 0
            mskSalItrCode.Text = 0
        End If
    End If
    CloseTable tRecset
End If
Call ValidDtl

Set tRecset = Nothing
End Sub

Private Sub txtSalTrnRefNo_GotFocus()
FlashActiveControl txtSalTrnRefNo, True
End Sub

Private Sub txtSalTrnRefNo_LostFocus()
FlashActiveControl txtSalTrnRefNo, False
End Sub

Private Sub txtSalTrnRefNo_Validate(Cancel As Boolean)
Rem nothing
End Sub

Private Sub txtSahRemark_GotFocus()
FlashActiveControl txtSahRemark, True
End Sub

Private Sub txtSahRemark_LostFocus()
FlashActiveControl txtSahRemark, False
End Sub

Private Sub txtSahRemark_Validate(Cancel As Boolean)
txtSahRemark.Text = ToMyWord(txtSahRemark.Text, mFilterStr:=False)
End Sub

Private Sub txtSalTime_str_GotFocus()
FlashActiveControl txtSalTime_str, True
End Sub

Private Sub txtSalTime_str_LostFocus()
FlashActiveControl txtSalTime_str, False
End Sub

Private Sub txtSalTime_str_Validate(Cancel As Boolean)
txtSalTime_str.Text = MinToTime(TimeToMin(txtSalTime_str.Text))
If TimeToMin(txtSalTime_str.Text) > cDAYMINUTES Then
    ErrorBox "Invalid Input !!!"
    txtSalTime_str.SetFocus
    Cancel = True
End If

End Sub

Private Sub txtVtmName_Change(Index As Integer)
If fcmbVtmName.CallFromText_Change = False Then
    fcmbVtmName.CallFromText_Change = True
    If InterActiveChange(txtVtmName(Index)) = True Then
        fcmbVtmName.UserText = Array(txtVtmName(Index).Text, txtVtmName(Index).SelStart)
        fcmbVtmName.Show
        txtVtmName(Index).Text = fcmbVtmName.Text
        If fcmbVtmName.ListSelected = True Then
            SendKeys "{tab}"
        End If
    End If
    fcmbVtmName.CallFromText_Change = False
End If

End Sub

Private Sub txtVtmName_GotFocus(Index As Integer)
FlashActiveControl txtVtmName(Index), True

End Sub

Private Sub txtVtmName_KeyDown(Index As Integer, KeyCode As Integer, Shift As Integer)
If MyDropDownKey(Shift, KeyCode) = True Then
    txtVtmName_Change Index
ElseIf MyAddNewKey(Shift, KeyCode) = True Then

ElseIf Shift = 0 And KeyCode = vbKeyF6 Then
    Rem Call ShowOldOpgListByOpgNo show here all sale details
End If

End Sub

Private Sub txtVtmName_LostFocus(Index As Integer)
FlashActiveControl txtVtmName(Index), False
End Sub

Private Sub txtVtmName_Validate(Index As Integer, Cancel As Boolean)
Dim mSalVchNo As Long

If Val(fcmbVtmName.BoundText) < 1 Then
    ErrorBox "Invalid Selection !!!"
    txtVtmName(Index).SetFocus
    Cancel = True
Else
    If Index = 0 Then
        If Val(fcmbVtmName.BoundText) <> mSalVtmCode_old Or Ctod(dtpSalDate.Text) <> mSalDate_old Or FormAddEditMode = cFORM_ADDMODE Then
            mSalVchNo = GetNextVTypeNo(dbKgtDatabase, dbAcDatabase, dbComDatabase, mTableName:="SaleHdr", mFieldName:="SahVchNo", mVtmFieldName:="SahVtmCode", mVtmFieldValue:=Val(fcmbVtmName.BoundText), mFinYrFieldName:="SahCmpCode", mFinYrFieldValue:=sFinYrCmpCode, mDateFieldName:="SahDate", mDateFieldValue:=Ctod(dtpSalDate.Text), mModuleCode:=mFormUIdCode, mModuleName:=Me.Name, mAcsPermFileName:=mFormAcsPermFileName)
            mskSalVchNo(Index).Text = ToMyNumFmt(mSalVchNo, mDecimals:=0)
        End If
    End If
End If

End Sub

Private Sub txtPrtAddr_GotFocus()
FlashActiveControl txtPrtAddr, True
End Sub

Private Sub txtPrtAddr_LostFocus()
FlashActiveControl txtPrtAddr, False
End Sub

Private Sub txtPrtName_Change()
If fcmbPrtName.CallFromText_Change = False Then
    fcmbPrtName.CallFromText_Change = True
    If InterActiveChange(txtPrtName) = True Then
        fcmbPrtName.UserText = Array(txtPrtName.Text, txtPrtName.SelStart)
        fcmbPrtName.Show
        txtPrtName.Text = fcmbPrtName.Text
        If fcmbPrtName.ListSelected = True Then
            SendKeys "{tab}"
        End If
    End If
    fcmbPrtName.CallFromText_Change = False
End If

End Sub

Private Sub txtPrtName_GotFocus()
FlashActiveControl txtPrtName, True

End Sub

Private Sub txtPrtName_KeyDown(KeyCode As Integer, Shift As Integer)
If MyDropDownKey(Shift, KeyCode) = True Then
    Call txtPrtName_Change
End If

End Sub

Private Sub txtPrtName_LostFocus()
FlashActiveControl txtPrtName, False
End Sub

Private Sub txtPrtName_Validate(Cancel As Boolean)
If Val(fcmbPrtName.BoundText) < 1 Then
    ErrorBox "Invalid Party Selection !!!"
    Cancel = True
    txtPrtName.SetFocus
ElseIf ChkAnyMisLinkedRcExist() = True Then
    ErrorBox "Invalid Party Selection !!!"
    Cancel = True
    txtPrtName.SetFocus
    
    fcmbPrtName.BoundText = CStr(mSalPrtCode_old)
    txtPrtName.Text = fcmbPrtName.Text
Else
    ShowPartyData Val(fcmbPrtName.BoundText)
End If

End Sub

Private Sub ShowPartyData(ByVal mSalPrtCode As Long)
Dim tRecset As New ADODB.Recordset

txtPrtAddr.Text = ""
txtAraName.Text = ""
txtStnName.Text = ""
txtPrtTelNo.Text = ""
txtPrtSMSNo.Text = ""

With tRecset
.Open "Select * from (PartyMast prt inner join AreaMast ara on prt.PrtAraCode=ara.AraCode) inner join StsnMast stn on prt.PrtStnCode=stn.StnCode where prt.PrtCode=" & CStr(mSalPrtCode) & "", dbComDatabase, adOpenKeyset, adLockOptimistic
If .EOF = False Then
    txtPrtAddr.Text = .fields("PrtAddr")
    txtAraName.Text = .fields("AraName")
    txtStnName.Text = .fields("StnName")
    txtPrtTelNo.Text = .fields("PrtTelNo")
    txtPrtSMSNo.Text = .fields("PrtSMSNo")
End If
End With
CloseTable tRecset

End Sub

Private Sub Data_AddEvent()
If clsSAL.BeginTran(0) = False Then
    Exit Sub
ElseIf clsSTK.BeginStock(0) = False Then
    Exit Sub
End If
mEntrySaved = False: mEntryAborted = False
FormAddEditMode = cFORM_ADDMODE

clsSAL.ClearHdr: clsSAL.ClearDtl
clsSTK.ClearHdr

mSalCode = clsSAL.ActiveTrnCode
mSalStkCode = clsSTK.ActiveStkCode

ShowSalData mSalCode
ShowStkData mSalStkCode

Rem restoring user editing features
Call ShowSalDefData

Rem old values
Call StoreSalOldData
Call StoreStkOldData

Call ShowEntryMode(True)
txtPrtName.SetFocus

End Sub

Private Sub Data_EditEvent()

If clsSAL.BeginTran(datRecset.fields("SahCode")) = False Then
    Exit Sub
ElseIf clsSTK.BeginStock(datRecset.fields("SahStkCode")) = False Then
    Exit Sub
End If
mEntrySaved = False: mEntryAborted = False
FormAddEditMode = cFORM_EDITMODE

With datRecset
mSalCode = .fields("SahCode")
mSalStkCode = .fields("SahStkCode")

End With

ShowSalData mSalCode
ShowStkData mSalStkCode

Rem old values
Call StoreSalOldData
Call StoreStkOldData

Call ShowEntryMode(True)
txtPrtName.SetFocus

End Sub

Private Sub ShowPartyBal()
Dim mOpnBal As Double, mCurBal As Double, mLCount As Integer, mUCount As Integer, mCount As Integer

'mOpnBal = 0
'With clsAH
'.GetData Val(fcmbAhName.BoundText)
'Rem opn balance
'mLCount = .LOpnBal
'mUCount = .UOpnBal
'For mCount = mLCount To mUCount
'    mOpnBal = mOpnBal + .OpnAmt(mCount)
'Next mCount
'
'Rem current balance
'mLCount = .LCurBal
'mUCount = .UCurBal
'For mCount = mLCount To mUCount
'    mCurBal = mCurBal + .CurAmt(mCount)
'Next mCount
'End With
'
''mskAhOpBal.Text = ToMyNumFmt(mOpnBal, mUseAbs:=True)
''lblAhCurBal.Caption = ToMyAcFmt(mCurBal)
''txtDrCrFlag.Text = SenseDrCrFlag(mOpnBal)

End Sub

Private Sub ShowSalData(ByVal mSalCode As Long)
With clsSAL
.GetHdrData mSalCode

mskFormBoundField.Text = mSalCode
fcmbPrtName.BoundText = CStr(.mSahPrtCode_lng): txtPrtName.Text = fcmbPrtName.Text
fcmbVtmName.BoundText = CStr(.mTrnVtmCode_lng): txtVtmName(0).Text = fcmbVtmName.Text
txtSalPrefix.Text = .mTrnPrefix_str
mskSalVchNo(0).Text = ToMyNumFmt(.mTrnVchNo_lng, mDecimals:=0)
dtpSalDate.Text = Dtoc(.mTrnDate_dt)
txtSalTime_str.Text = MinToTime(.mSahTime_lng)
txtSalTrnRefNo.Text = .mSahTrnRefNo_str
dtpSalTrnRefDt.Text = Dtoc(.mSahTrnRefDt_dt)
mskSahDiscPer.Text = ToMyPerFmt(.mSahDiscPer_dbl, mDecimals:=-1)
mskSahDiscAmt.Text = ToMyNumFmt(.mSahDiscAmt_dbl)
mskSahTaxPer.Text = ToMyPerFmt(.mSahTaxPer_dbl, mDecimals:=-1)
mskSahTaxAmt.Text = ToMyNumFmt(.mSahTaxAmt_dbl)
mskSahOtherAmt.Text = ToMyNumFmt(.mSahOtherAmt_dbl)
mskSahROffAmt.Text = ToMyNumFmt(.mSahROffAmt_dbl)
mskSahAmount.Text = ToMyNumFmt(.mSahAmount_dbl)
txtSahRemark.Text = .mSahRemark_str

ShowPartyData .mSahPrtCode_lng
Call ShowOldSalCodeDesc
End With

ShowDtlData mSalCode
ShowControlValues Mfgrd2.Rows - 1, mRefreshList:=False
Call ShowLinkTranDtl

End Sub

Private Sub ShowStkData(ByVal mSalStkCode As Long)
mskSalStkCode.Text = mSalStkCode

End Sub

Private Sub ShowSalDefData()
Dim tRecset As New ADODB.Recordset, t1Recset As New ADODB.Recordset, mSalVchNo As Long

With tRecset
.Open "Select top 1 * from SaleHdr where SahVtmCode IN (" & mFormVchTypeList & ") and SahCmpCode = " & CStr(sFinYrCmpCode) & " order by SahCode desc", dbKgtDatabase, adOpenKeyset, adLockOptimistic
If .EOF = False Then
    dtpSalDate.Text = Dtoc(DefaultEntryDate)
    fcmbVtmName.BoundText = CStr(.fields("SahVtmCode"))
Else
    dtpSalDate.Text = Dtoc(DefaultEntryDate)
    With t1Recset
    .Open "Select top 1 * from VTypMast where VtmSysCode=" & CStr(mFormSysVchType) & "", dbAcDatabase, adOpenKeyset, adLockOptimistic
    If .EOF = False Then
        fcmbVtmName.BoundText = .fields("VtmCode")
    Else
        fcmbVtmName.BoundText = ""
    End If
    End With
    CloseTable t1Recset
End If
End With
CloseTable tRecset

txtVtmName(0).Text = fcmbVtmName.Text
txtSalTime_str.Text = MinToTime(TimeToMin(DateTime.Time$))

mSalVchNo = GetNextVTypeNo(dbKgtDatabase, dbAcDatabase, dbComDatabase, mTableName:="SaleHdr", mFieldName:="SahVchNo", mVtmFieldName:="SahVtmCode", mVtmFieldValue:=Val(fcmbVtmName.BoundText), mFinYrFieldName:="SahCmpCode", mFinYrFieldValue:=sFinYrCmpCode, mDateFieldName:="SahDate", mDateFieldValue:=Ctod(dtpSalDate.Text), mModuleCode:=mFormUIdCode, mModuleName:=Me.Name, mAcsPermFileName:=mFormAcsPermFileName)
mskSalVchNo(0).Text = ToMyNumFmt(mSalVchNo, mDecimals:=0)
dtpSalTrnRefDt.Text = dtpSalDate.Text

End Sub

Private Sub StoreSalOldData()
mSalCode_old = mSalCode
mSalPrtCode_old = Val(fcmbPrtName.BoundText)
mSalDate_old = Ctod(dtpSalDate.Text)
mSalTime_old = TimeToMin(txtSalTime_str.Text)
mSalVtmCode_old = Val(fcmbVtmName.BoundText)
mSalVchNo_old = Val(UnMyNumFmt(mskSalVchNo(0).Text))
mSahAmount_old = Val(UnMyNumFmt(mskSahAmount.Text))

End Sub

Private Sub StoreStkOldData()
mSalStkCode_old = mSalStkCode

End Sub

Private Sub ShowDtlData(ByVal mSalCode As Long)
Dim srow As Integer, tRecset As New ADODB.Recordset, mColCnt As Integer

srow = 1
Mfgrd2.Rows = 2

Set tRecset = dbKgtDatabase.Execute("Select * from ((SaleDtl sal" _
    & " inner join SubItmMast sim on sal.SalSimCode = sim.SimCode)" _
    & " inner join PackMast pck on sal.SalPckCode = pck.PckCode)" _
    & " left join (PurchDtl pur left join PurchHdr puh on pur.PurCode = puh.PuhCode)" _
    & " on sal.SalPurCode = pur.PurCode and sal.SalPurICode = pur.PurICode and sal.SalSimCode = pur.PurSimCode and sal.SalItmCode = pur.PurItmCode and sal.SalItrCode = pur.PurItrCode" _
    & " where SalCode = " & CStr(mSalCode) _
    & " order by SalSno")
With tRecset
If .EOF = False Then
    Do While .EOF = False
        If InList(.fields("SalRecState"), Array(cREC_ADDED, cREC_EDITED, cREC_UNCHANGED)) = True Then
            Mfgrd2.TextMatrix(srow, X2SALICODE_COL) = .fields("SalICode")
            Mfgrd2.TextMatrix(srow, X2SALSNO_COL) = ToMyNumFmt(.fields("SalSno"), mDecimals:=0)
            Mfgrd2.TextMatrix(srow, X2SIMNAME_COL) = .fields("SimName")
            Mfgrd2.TextMatrix(srow, X2SALSIMREFNO_COL) = .fields("SalSimRefNo")
            Mfgrd2.TextMatrix(srow, X2PCKNAME_COL) = .fields("PckName")
            Mfgrd2.TextMatrix(srow, X2SALOUTPCKQTY_COL) = ToMyNumFmt(.fields("SalOutPckQty"), mDecimals:=-1)
            Mfgrd2.TextMatrix(srow, X2SALOUTPCKNM_COL) = .fields("SalOutPckNm")
            Mfgrd2.TextMatrix(srow, X2SALINRPCKSZ_COL) = ToMyNumFmt(.fields("SalInrPckSz"), mDecimals:=-1)
            Mfgrd2.TextMatrix(srow, X2SALINRPCKNM_COL) = .fields("SalInrPckNm")
            Mfgrd2.TextMatrix(srow, X2SALQTY_COL) = ToMyNumFmt(.fields("SalQty"), mDecimals:=-1)
            Mfgrd2.TextMatrix(srow, X2SALRATE_COL) = ToMyNumFmt(.fields("SalRate"))
            Mfgrd2.TextMatrix(srow, X2SALMRP_COL) = ToMyNumFmt(.fields("SalMRP"))
            Mfgrd2.TextMatrix(srow, X2SALWSLRATE_COL) = ToMyNumFmt(.fields("SalWslRate"))
            Mfgrd2.TextMatrix(srow, X2SALRTLRATE_COL) = ToMyNumFmt(.fields("SalRtlRate"))
'''            If mFormSysVchType = cCOM_VTYPE_RETNOUTW Then
'''                Mfgrd2.TextMatrix(srow, X2PURRATE_COL) = ToMyNumFmt(NoneZero1(.fields("PurWslRate"), 0))
'''            Else
'''                Mfgrd2.TextMatrix(srow, X2PURRATE_COL) = ToMyNumFmt(NoneZero1(.fields("PurRate"), 0))
'''            End If
            Mfgrd2.TextMatrix(srow, X2SALDISCTYPENM_COL) = GetListTextFromItemData(mCmbObj:=cmbSalDiscType, mTargetItemData:=.fields("SalDiscType"))
            Mfgrd2.TextMatrix(srow, X2SALDISCPER_COL) = ToMyPerFmt(.fields("SalDiscPer"), mDecimals:=-1)
            Mfgrd2.TextMatrix(srow, X2SALDISCABLEAMT_COL) = ToMyNumFmt(.fields("SalDiscableAmt"))
            Mfgrd2.TextMatrix(srow, X2SALDISCAMT_COL) = ToMyNumFmt(.fields("SalDiscAmt"))
            Mfgrd2.TextMatrix(srow, X2SALTAXTYPENM_COL) = GetListTextFromItemData(mCmbObj:=cmbSalTaxType, mTargetItemData:=.fields("SalTaxType"))
            Mfgrd2.TextMatrix(srow, X2SALTAXPER_COL) = ToMyPerFmt(.fields("SalTaxPer"), mDecimals:=-1)
            Mfgrd2.TextMatrix(srow, X2SALTAXABLEAMT_COL) = ToMyNumFmt(.fields("SalTaxableAmt"))
            Mfgrd2.TextMatrix(srow, X2SALTAXAMT_COL) = ToMyNumFmt(.fields("SalTaxAmt"))
            Mfgrd2.TextMatrix(srow, X2SALAMOUNT_COL) = ToMyNumFmt(.fields("SalAmount"))
            Mfgrd2.TextMatrix(srow, X2SALNARR_COL) = .fields("SalNarr")
            Mfgrd2.TextMatrix(srow, X2SALBASICAMT_COL) = ToMyNumFmt(.fields("SalBasicAmt"))
            Mfgrd2.TextMatrix(srow, X2SALDISCTYPENO_COL) = .fields("SalDiscType")
            Mfgrd2.TextMatrix(srow, X2SALTAXTYPENO_COL) = .fields("SalTaxType")
            Mfgrd2.TextMatrix(srow, X2SALSIMCODE_COL) = .fields("SalSimCode")
            Mfgrd2.TextMatrix(srow, X2SALITMCODE_COL) = .fields("SalItmCode")
            Mfgrd2.TextMatrix(srow, X2SALITRCODE_COL) = .fields("SalItrCode")
            Mfgrd2.TextMatrix(srow, X2SALPCKCODE_COL) = .fields("SalPckCode")
            Mfgrd2.TextMatrix(srow, X2SALPURCODE_COL) = .fields("SalPurCode")
            Mfgrd2.TextMatrix(srow, X2SALPURICODE_COL) = .fields("SalPurICode")
            Mfgrd2.TextMatrix(srow, X2SALSTKICODE_COL) = .fields("SalStkICode")
            Mfgrd2.TextMatrix(srow, X2SALRECSTATE_COL) = .fields("SalRecState")
            
            Mfgrd2.Rows = Mfgrd2.Rows + 1
            srow = srow + 1
        Else
            If InList(.fields("SalRecState"), Array(cREC_CANCELED, cREC_DELETED)) = False Then
                ErrorBox Me.Name & "_ShowDtlData_#2316_[Invalid Record Status]"
            End If
        End If
    
        .MoveNext
    Loop
    If srow = 1 Then
        For mColCnt = 0 To Mfgrd2.Cols - 1
            Mfgrd2.TextMatrix(srow, mColCnt) = ""
        Next
    End If
Else
    For mColCnt = 0 To Mfgrd2.Cols - 1
        Mfgrd2.TextMatrix(srow, mColCnt) = ""
    Next
End If
End With
CloseTable tRecset

Call CalcFtrTotal

End Sub

Private Sub Data_SaveEvent()

With clsSAL
If FormAddEditMode = cFORM_ADDMODE Then
    .ClearHdr
Else
    .GetHdrData mSalCode
End If
.mTrnDate_dt = Ctod(dtpSalDate.Text)
.mTrnVtmCode_lng = Val(fcmbVtmName.BoundText)
.mTrnPrefix_str = txtSalPrefix.Text
.mTrnVchNo_lng = Val(UnMyNumFmt(mskSalVchNo(0).Text))
.mTrnPostfix_str = ""
.mTrnCmpCode_int = sFinYrCmpCode

.mSahStkCode_lng = mSalStkCode
.mSahTime_lng = TimeToMin(txtSalTime_str.Text)
.mSahPrtCode_lng = Val(fcmbPrtName.BoundText)
.mSahTrnRefNo_str = txtSalTrnRefNo.Text
.mSahTrnRefDt_dt = Ctod(dtpSalTrnRefDt.Text)
.mSahOutPckQty_dbl = Val(UnMyNumFmt(lblSalOutPckQtyTot.Caption))
.mSahQty_dbl = Val(UnMyNumFmt(lblSalQtyTot.Caption))
.mSahBasicAmt_dbl = Val(UnMyNumFmt(lblSalBasicAmtTot.Caption))
.mSahDiscPer_dbl = Val(UnMyPerFmt(mskSahDiscPer.Text))
.mSahDiscAmt_dbl = Val(UnMyNumFmt(mskSahDiscAmt.Text))
.mSahTaxPer_dbl = Val(UnMyPerFmt(mskSahTaxPer.Text))
.mSahTaxAmt_dbl = Val(UnMyNumFmt(mskSahTaxAmt.Text))
.mSahOtherAmt_dbl = Val(UnMyNumFmt(mskSahOtherAmt.Text))
.mSahROffAmt_dbl = Val(UnMyNumFmt(mskSahROffAmt.Text))
.mSahAmount_dbl = Val(UnMyNumFmt(mskSahAmount.Text))
.mSahRemark_str = txtSahRemark.Text

If FormAddEditMode = cFORM_ADDMODE Then
    If .AddNewHdr() = True Then
        mskFormBoundField.Text = .mTrnCode_lng
        mSalCode = .mTrnCode_lng
    End If
Else
    .UpdateHdr mSalCode
End If
If .mTrnCode_lng > 0 Then   ' updated successfully
    With clsSTK
    If FormAddEditMode = cFORM_ADDMODE Then
        .ClearHdr
    Else
        .GetHdrData mSalStkCode
    End If
    .mShrVtmCode_lng = Val(fcmbVtmName.BoundText)
    .mShrPrefix_str = txtSalPrefix.Text
    .mShrVchNo_lng = Val(UnMyNumFmt(mskSalVchNo(0).Text))
    .mShrPostfix_str = ""
    .mShrDate_dt = Ctod(dtpSalDate.Text)
    .mShrQty_dbl = Val(UnMyNumFmt(lblSalQtyTot.Caption))
    .mShrValue_dbl = Val(UnMyNumFmt(mskSahAmount.Text))
    .mShrNarr_str = "Automated Sale"
    .mShrAutoGen_bln = True
    .mShrCmpCode_int = sFinYrCmpCode
    If FormAddEditMode = cFORM_ADDMODE Then
        If .AddNewHdr() = True Then
            mskSalStkCode.Text = .mShrCode_lng
            mSalStkCode = .mShrCode_lng
        End If
    Else
        .UpdateHdr mSalStkCode
    End If
    If .mShrCode_lng > 0 Then
        If FormAddEditMode = cFORM_ADDMODE Then
            clsSAL.GetHdrData mSalCode
            clsSAL.mSahStkCode_lng = mSalStkCode
            
            dbKgtDatabase.BeginTrans
            dbKgtDatabase.Execute "Update SaleHdr set SahStkCode = " & CStr(mSalStkCode) & " where SahCode = " & CStr(mSalCode)
            dbKgtDatabase.Execute "Update SaleDtl set SalStkCode = " & CStr(mSalStkCode) & " where SalCode = " & CStr(mSalCode)
            dbKgtDatabase.CommitTrans
        End If
        clsSAL.UpdateTran mSalCode
        clsSAL.EndTran mSalCode
        
        .CommitStock mSalStkCode
        .EndStock mSalStkCode
        
        mEntrySaved = True
    Else
        Call Data_CancelEvent
        ErrorBox "Entry Cancelled !!!"
    End If
    End With
Else
    Call Data_CancelEvent
    ErrorBox "Entry Cancelled !!!"
End If
End With

If clsSAL.mTrnCode_lng > 0 Then   ' updated successfully
'''    Rem refreshing required here if new account created done at form_activate
'''    If clsAH.BeginAchd(Val(fcmbAhName.BoundText)) = True Then
'''        'clsAH.EditOpnBal mJrnICode:=clsAH.OpnICode(clsAH.LOpnBal), mJrnAmt:=Val(UnMyAcFmt(mskAhOpBal.Text, txtDrCrFlag.Text))
'''        clsAH.Update Val(fcmbAhName.BoundText), mUpdOpnBalOnly:=True
'''        clsAH.UpdateAchd Val(fcmbAhName.BoundText)
'''        clsAH.EndAchd Val(fcmbAhName.BoundText)
'''    End If
'''    If FormAddEditMode = cFORM_ADDMODE Then
'''        clsAH.UpdateDependency Val(fcmbAhName.BoundText), True
'''    Else
'''        If mPttAhCode_old <> Val(fcmbAhName.BoundText) Then
'''            clsAH.UpdateDependency mPttAhCode_old, False
'''            clsAH.UpdateDependency Val(fcmbAhName.BoundText), True
'''        End If
'''    End If
    
'''    mEntrySaved = True
'''Else
'''    Call Data_CancelEvent
'''    ErrorBox "Entry Cancelled !!!"
End If

End Sub

Private Sub Data_DeleteEvent()
Dim mDeleteit As Boolean, mRecAbsPos As Long
If (datRecset.EOF Or datRecset.BOF) = True Then
    Exit Sub
End If

mSalCode = datRecset.fields("SahCode")
mSalStkCode = datRecset.fields("SahStkCode")
mRecAbsPos = datRecset.AbsolutePosition

If clsSAL.CanDeleteTran(mSalCode) = True Then
    txtVoid.SetFocus
    If clsSAL.BeginTran(mSalCode) = True And clsSTK.BeginStock(mSalStkCode) = True Then
        clsSAL.DeleteTran mSalCode
        clsSAL.UpdateTran mSalCode
        clsSAL.EndTran mSalCode
        
        clsSTK.DeleteStock mSalStkCode
        clsSTK.CommitStock mSalStkCode
        clsSTK.EndStock mSalStkCode
        
        Call SmryList
        If datRecset.RecordCount > mRecAbsPos And mRecAbsPos > 0 Then
            datRecset.Move mRecAbsPos - 1, 1
        Else
            MoveRecToLast datRecset
        End If
        
        Rem clsAH.UpdateDependency mPttAhCode, False
    End If
    ShowRecActiveFlexRow datRecset, Mfgrd1
    Mfgrd1.SetFocus
Else
    Mfgrd1.SetFocus
End If

End Sub

Private Sub Data_CancelEvent()
clsSAL.CancelTran mSalCode
clsSAL.EndTran mSalCode

clsSTK.CancelStock mSalStkCode
clsSTK.EndStock mSalStkCode

mEntryAborted = True

End Sub

Private Sub txtPrtSMSNo_GotFocus()
FlashActiveControl txtPrtSMSNo, True
End Sub

Private Sub txtPrtSMSNo_LostFocus()
FlashActiveControl txtPrtSMSNo, False
End Sub

Private Sub txtPrtTelNo_GotFocus()
FlashActiveControl txtPrtTelNo, True
End Sub

Private Sub txtPrtTelNo_LostFocus()
FlashActiveControl txtPrtTelNo, False
End Sub

Private Sub SmryList()
Dim gcolcount As Integer, acount As Integer, mLow As Integer, mHigh As Integer, mPos As Integer, srow As Long, mColCount As Integer
Dim aAcntBal As Variant, mBal As Double
Dim mCount_Tot As Double, mOutPckQty_Tot As Double, mQty_Tot As Double, mAmount_Tot As Double
Dim tRecset As ADODB.Recordset

If datRecset.State = 1 Then
    CloseTable datRecset
End If
RefreshDatabase dbKgtDatabase
RefreshDatabase dbAcDatabase
RefreshDatabase dbGrpDatabase
RefreshDatabase dbComDatabase
clsListStru.Clear

If optMonthwise.Value = True Or optDatewise.Value = True Or optPartywise.Value = True Or optItemWise.Value = True Or optVTypewise.Value = True Then
    If optMonthwise.Value = True Then
        clsListStru.AddFields mExpr:="SalYrMonth", mAttrib:=cFAT_SYSTEM
        clsListStru.AddFields mExpr:="SalMnYear", mTitle:="Month", mShowItem:=True, mAlign:=flexAlignLeftCenter, mWidth:=2000
        clsListStru.AddFields mExpr:="SalCount", mTitle:="Count", mShowItem:=True, mAlign:=flexAlignRightCenter, mWidth:=1500
        clsListStru.AddFields mExpr:="SalOutPckQty_sum", mTitle:="Pack/Bag", mShowItem:=True, mAlign:=flexAlignRightCenter, mWidth:=1500
        clsListStru.AddFields mExpr:="SalQty_sum", mTitle:="Qty", mShowItem:=True, mAlign:=flexAlignRightCenter, mWidth:=1500
        clsListStru.AddFields mExpr:="SalAmount_sum", mTitle:="Amount", mShowItem:=True, mAlign:=flexAlignRightCenter, mWidth:=1500
        
        datRecset.Open "Select format(SahDate,'yyyy/MM') as SalYrMonth" _
         & ",Count(SalCode) as SalCount" _
         & ",Sum(SalOutPckQty) as SalOutPckQty_sum" _
         & ",Sum(SalQty) as SalQty_sum" _
         & ",Sum(SalAmount) as SalAmount_sum" _
         & " from SaleDtl sal" _
         & " inner join SaleHdr sah on sal.SalCode = sah.SahCode" _
         & " where SahDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
         & " and SahCode > 0 and SahVtmCode IN (" & mFormVchTypeList & ")" _
         & IIf(mQryPrtCode > 0, " and SahPrtCode = " & CStr(mQryPrtCode), "") _
         & IIf(mQrySimCode > 0, " and SalSimCode = " & CStr(mQrySimCode), "") _
         & IIf(mQryVtmCode > 0, " and SahVtmCode = " & CStr(mQryVtmCode), "") _
         & " group by format(SahDate,'yyyy/MM')" _
         & " order by format(SahDate,'yyyy/MM')" _
         , dbComDatabase, adOpenKeyset, adLockReadOnly

    ElseIf optDatewise.Value = True Then
        clsListStru.AddFields mExpr:="SalDateYMD", mAttrib:=cFAT_SYSTEM
        clsListStru.AddFields mExpr:="SalDate", mTitle:="Date", mShowItem:=True, mAlign:=flexAlignLeftCenter, mWidth:=2000
        clsListStru.AddFields mExpr:="SalCount", mTitle:="Count", mShowItem:=True, mAlign:=flexAlignRightCenter, mWidth:=1500
        clsListStru.AddFields mExpr:="SalOutPckQty_sum", mTitle:="Pack/Bag", mShowItem:=True, mAlign:=flexAlignRightCenter, mWidth:=1500
        clsListStru.AddFields mExpr:="SalQty_sum", mTitle:="Qty", mShowItem:=True, mAlign:=flexAlignRightCenter, mWidth:=1500
        clsListStru.AddFields mExpr:="SalAmount_sum", mTitle:="Amount", mShowItem:=True, mAlign:=flexAlignRightCenter, mWidth:=1500
        
        datRecset.Open "Select SahDate" _
         & ",Count(SalCode) as SalCount" _
         & ",Sum(SalOutPckQty) as SalOutPckQty_sum" _
         & ",Sum(SalQty) as SalQty_sum" _
         & ",Sum(SalAmount) as SalAmount_sum" _
         & " from SaleDtl sal" _
         & " inner join SaleHdr sah on sal.SalCode = sah.SahCode" _
         & " where SahDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
         & " and SahCode > 0 and SahVtmCode IN (" & mFormVchTypeList & ")" _
         & IIf(mQryPrtCode > 0, " and SahPrtCode = " & CStr(mQryPrtCode), "") _
         & IIf(mQrySimCode > 0, " and SalSimCode = " & CStr(mQrySimCode), "") _
         & IIf(mQryVtmCode > 0, " and SahVtmCode = " & CStr(mQryVtmCode), "") _
         & " group by SahDate" _
         & " order by SahDate" _
         , dbComDatabase, adOpenKeyset, adLockReadOnly
        
    ElseIf optPartywise.Value = True Then
        clsListStru.AddFields mExpr:="PrtName", mTitle:="Party Name", mShowItem:=True, mAlign:=flexAlignLeftCenter, mWidth:=3000
        clsListStru.AddFields mExpr:="SalCount", mTitle:="Count", mShowItem:=True, mAlign:=flexAlignRightCenter, mWidth:=1500
        clsListStru.AddFields mExpr:="SalOutPckQty_sum", mTitle:="Pack/Bag", mShowItem:=True, mAlign:=flexAlignRightCenter, mWidth:=1500
        clsListStru.AddFields mExpr:="SalQty_sum", mTitle:="Qty", mShowItem:=True, mAlign:=flexAlignRightCenter, mWidth:=1500
        clsListStru.AddFields mExpr:="SalAmount_sum", mTitle:="Amount", mShowItem:=True, mAlign:=flexAlignRightCenter, mWidth:=1500
        
        datRecset.Open "Select prt.PrtName,sah.SahPrtCode" _
         & ",Count(SalCode) as SalCount" _
         & ",Sum(SalOutPckQty) as SalOutPckQty_sum" _
         & ",Sum(SalQty) as SalQty_sum" _
         & ",Sum(SalAmount) as SalAmount_sum" _
         & " from SaleDtl sal" _
         & " inner join (SaleHdr sah" _
         & " inner join PartyMast prt on sah.SahPrtCode = prt.PrtCode)" _
         & " on sal.SalCode = sah.SahCode" _
         & " where SahDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
         & " and SahCode > 0 and SahVtmCode IN (" & mFormVchTypeList & ")" _
         & IIf(mQryPrtCode > 0, " and SahPrtCode = " & CStr(mQryPrtCode), "") _
         & IIf(mQrySimCode > 0, " and SalSimCode = " & CStr(mQrySimCode), "") _
         & IIf(mQryVtmCode > 0, " and SahVtmCode = " & CStr(mQryVtmCode), "") _
         & " group by prt.PrtName,sah.SahPrtCode" _
         & " order by prt.PrtName,sah.SahPrtCode" _
         , dbComDatabase, adOpenKeyset, adLockReadOnly
         
    ElseIf optItemWise.Value = True Then
        clsListStru.AddFields mExpr:="SimName", mTitle:="Item Name", mShowItem:=True, mAlign:=flexAlignLeftCenter, mWidth:=3000
        clsListStru.AddFields mExpr:="SalCount", mTitle:="Count", mShowItem:=True, mAlign:=flexAlignRightCenter, mWidth:=1500
        clsListStru.AddFields mExpr:="SalOutPckQty_sum", mTitle:="Pack/Bag", mShowItem:=True, mAlign:=flexAlignRightCenter, mWidth:=1500
        clsListStru.AddFields mExpr:="SalQty_sum", mTitle:="Qty", mShowItem:=True, mAlign:=flexAlignRightCenter, mWidth:=1500
        clsListStru.AddFields mExpr:="SalAmount_sum", mTitle:="Amount", mShowItem:=True, mAlign:=flexAlignRightCenter, mWidth:=1500
        
        datRecset.Open "Select sim.SimName,sal.SalSimCode" _
         & ",Count(SalCode) as SalCount" _
         & ",Sum(SalOutPckQty) as SalOutPckQty_sum" _
         & ",Sum(SalQty) as SalQty_sum" _
         & ",Sum(SalAmount) as SalAmount_sum" _
         & " from (SaleDtl sal" _
         & " inner join SaleHdr sah on sal.SalCode = sah.SahCode)" _
         & " inner join SubItmMast sim on sal.SalSimCode = sim.SimCode" _
         & " where SahDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
         & " and SahCode > 0 and SahVtmCode in (" & mFormVchTypeList & ")" _
         & IIf(mQryPrtCode > 0, " and SahPrtCode = " & CStr(mQryPrtCode), "") _
         & IIf(mQrySimCode > 0, " and SalSimCode = " & CStr(mQrySimCode), "") _
         & IIf(mQryVtmCode > 0, " and SahVtmCode = " & CStr(mQryVtmCode), "") _
         & " group by sim.SimName,sal.SalSimCode" _
         & " order by sim.SimName,sal.SalSimCode" _
         , dbComDatabase, adOpenKeyset, adLockReadOnly
         
    ElseIf optVTypewise.Value = True Then
        clsListStru.AddFields mExpr:="VtmName", mTitle:="Voucher Type", mShowItem:=True, mAlign:=flexAlignLeftCenter, mWidth:=3000
        clsListStru.AddFields mExpr:="SalCount", mTitle:="Count", mShowItem:=True, mAlign:=flexAlignRightCenter, mWidth:=1500
        clsListStru.AddFields mExpr:="SalOutPckQty_sum", mTitle:="Pack/Bag", mShowItem:=True, mAlign:=flexAlignRightCenter, mWidth:=1500
        clsListStru.AddFields mExpr:="SalQty_sum", mTitle:="Qty", mShowItem:=True, mAlign:=flexAlignRightCenter, mWidth:=1500
        clsListStru.AddFields mExpr:="SalAmount_sum", mTitle:="Amount", mShowItem:=True, mAlign:=flexAlignRightCenter, mWidth:=1500
        
        datRecset.Open "Select vtm.VtmName,sah.SahVtmCode" _
         & ",Count(SalCode) as SalCount" _
         & ",Sum(SalOutPckQty) as SalOutPckQty_sum" _
         & ",Sum(SalQty) as SalQty_sum" _
         & ",Sum(SalAmount) as SalAmount_sum" _
         & " from (SaleDtl sal" _
         & " inner join SaleHdr sah on sal.SalCode = sah.SahCode)" _
         & " inner join VTypMast vtm on sah.SahVtmCode = vtm.VtmCode" _
         & " where SahDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
         & " and SahCode > 0 and SahVtmCode in (" & mFormVchTypeList & ")" _
         & IIf(mQryPrtCode > 0, " and SahPrtCode = " & CStr(mQryPrtCode), "") _
         & IIf(mQrySimCode > 0, " and SalSimCode = " & CStr(mQrySimCode), "") _
         & IIf(mQryVtmCode > 0, " and SahVtmCode = " & CStr(mQryVtmCode), "") _
         & " group by vtm.VtmName,sah.SahVtmCode" _
         & " order by vtm.VtmName,sah.SahVtmCode" _
         , dbComDatabase, adOpenKeyset, adLockReadOnly
         
    End If
    
ElseIf optDetailed.Value = True Then
    clsListStru.AddFields mExpr:="tSalSmryId", mAttrib:=cFAT_SYSTEM
    clsListStru.AddFields mExpr:="SalCode", mAttrib:=cFAT_SYSTEM
    clsListStru.AddFields mExpr:="VtmName", mTitle:="Voucher", mAlign:=flexAlignLeftCenter, mWidth:=1500, mShowItem:=True
    clsListStru.AddFields mExpr:="SalVchNo", mTitle:="Vchr.No", mAlign:=flexAlignRightCenter, mWidth:=1250, mShowItem:=True
    clsListStru.AddFields mExpr:="SalDate", mTitle:="Date", mAlign:=flexAlignLeftCenter, mWidth:=1300, mShowItem:=True
    ' --------------------------------------
    clsListStru.AddFields mExpr:="PrtCode", mAttrib:=cFAT_SYSTEM
    clsListStru.AddFields mExpr:="PrtName", mTitle:="Party Name", mAlign:=flexAlignLeftCenter, mWidth:=2500, mShowItem:=True
    ' --------------------------------------
    clsListStru.AddFields mExpr:="SalOutPckQty", mTitle:="Pack/Bag", mAlign:=flexAlignRightCenter, mWidth:=1250, mShowItem:=True
    clsListStru.AddFields mExpr:="SalQty", mTitle:="Qty", mAlign:=flexAlignRightCenter, mWidth:=1250, mShowItem:=True
    clsListStru.AddFields mExpr:="SalAmount", mTitle:="Amount", mAlign:=flexAlignRightCenter, mWidth:=1250, mShowItem:=True
    ' --------------------------------------
'''    clsListStru.AddFields mExpr:="PrtAddr", mTitle:="Address", mAlign:=flexAlignLeftCenter, mWidth:=2000, mShowItem:=True
'''    clsListStru.AddFields mExpr:="PatAraName", mTitle:="Area", mAlign:=flexAlignLeftCenter, mWidth:=1500, mShowItem:=True
'''    clsListStru.AddFields mExpr:="PatStnName", mTitle:="Station", mAlign:=flexAlignLeftCenter, mWidth:=1500, mShowItem:=True
    
    datRecset.Open "Select sah.*,prt.*,ara.AraName,stn.StnName,vtm.VtmName" _
     & ",format(SahDate,'yyyymmdd')+format(SahCode,'" & cLONGCODESTRFMT & "') as tSalSmryId" _
     & " from (SaleHdr sah" _
     & " inner join ((PartyMast prt" _
     & " inner join AreaMast ara on prt.PrtAraCode = ara.AraCode)" _
     & " inner join StsnMast stn on prt.PrtStnCode = stn.StnCode)" _
     & " on sah.SahPrtCode = prt.PrtCode)" _
     & " inner join VTypMast vtm on sah.SahVtmCode = vtm.VtmCode" _
     & " where SahDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
     & IIf(mRemoteAccess = True, " and SahCode=" & CStr(mSalCode) & "", "") _
     & " and SahCode > 0 and SahVtmCode IN (" & mFormVchTypeList & ")" _
     & IIf(mQryPrtCode > 0, " and SahPrtCode = " & CStr(mQryPrtCode), "") _
     & IIf(mQrySimCode > 0, " and SalSimCode = " & CStr(mQrySimCode), "") _
     & IIf(mQryVtmCode > 0, " and SahVtmCode = " & CStr(mQryVtmCode), "") _
     & " order by SahDate,SahTime,SahCode" _
     , dbComDatabase, adOpenKeyset, adLockReadOnly
    
ElseIf optExpanded.Value = True Then
    clsListStru.AddFields mExpr:="tSalSmryId", mAttrib:=cFAT_SYSTEM
    clsListStru.AddFields mExpr:="SalCode", mAttrib:=cFAT_SYSTEM
    clsListStru.AddFields mExpr:="VtmName", mTitle:="Voucher", mAlign:=flexAlignLeftCenter, mWidth:=1500, mShowItem:=True
    clsListStru.AddFields mExpr:="SalVchNo", mTitle:="Vchr.No", mAlign:=flexAlignRightCenter, mWidth:=1250, mShowItem:=True
    clsListStru.AddFields mExpr:="SalDate", mTitle:="Date", mAlign:=flexAlignLeftCenter, mWidth:=1300, mShowItem:=True
    ' --------------------------------------
    clsListStru.AddFields mExpr:="PrtCode", mAttrib:=cFAT_SYSTEM
    clsListStru.AddFields mExpr:="PrtName", mTitle:="Party Name", mAlign:=flexAlignLeftCenter, mWidth:=2500, mShowItem:=True
    ' --------------------------------------
    clsListStru.AddFields mExpr:="SimCode", mAttrib:=cFAT_SYSTEM
    clsListStru.AddFields mExpr:="SimName", mTitle:="Item Name", mAlign:=flexAlignLeftCenter, mWidth:=2500, mShowItem:=True
    clsListStru.AddFields mExpr:="SalOutPckQty", mTitle:="Pack/Bag", mAlign:=flexAlignRightCenter, mWidth:=1250, mShowItem:=True
    clsListStru.AddFields mExpr:="SalQty", mTitle:="Qty", mAlign:=flexAlignRightCenter, mWidth:=1250, mShowItem:=True
    clsListStru.AddFields mExpr:="SalAmount", mTitle:="Amount", mAlign:=flexAlignRightCenter, mWidth:=1250, mShowItem:=True
    ' --------------------------------------
'''    clsListStru.AddFields mExpr:="PrtAddr", mTitle:="Address", mAlign:=flexAlignLeftCenter, mWidth:=2000, mShowItem:=True
'''    clsListStru.AddFields mExpr:="PatAraName", mTitle:="Area", mAlign:=flexAlignLeftCenter, mWidth:=1500, mShowItem:=True
'''    clsListStru.AddFields mExpr:="PatStnName", mTitle:="Station", mAlign:=flexAlignLeftCenter, mWidth:=1500, mShowItem:=True
    
    datRecset.Open "Select sah.*,sal.*,prt.*,sim.*,ara.AraName,stn.StnName,vtm.VtmName" _
     & ",format(SahDate,'yyyymmdd')+format(SahCode,'" & cLONGCODESTRFMT & "') as tSalSmryId" _
     & " from (SaleDtl Sal" _
     & " inner join ((SaleHdr sah" _
     & " inner join ((PartyMast prt" _
     & " inner join AreaMast ara on prt.PrtAraCode = ara.AraCode)" _
     & " inner join StsnMast stn on prt.PrtStnCode = stn.StnCode)" _
     & " on sah.SahPrtCode = prt.PrtCode)" _
     & " inner join VTypMast vtm on sah.SahVtmCode = vtm.VtmCode)" _
     & " on Sal.SalCode = sah.SahCode)" _
     & " inner join SubItmMast sim on Sal.SalSimCode = sim.SimCode" _
     & " where SahDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
     & IIf(mRemoteAccess = True, " and SahCode=" & CStr(mSalCode) & "", "") _
     & " and SahCode > 0 and SahVtmCode IN (" & mFormVchTypeList & ")" _
     & IIf(mQryPrtCode > 0, " and SahPrtCode = " & CStr(mQryPrtCode), "") _
     & IIf(mQrySimCode > 0, " and SalSimCode = " & CStr(mQrySimCode), "") _
     & IIf(mQryVtmCode > 0, " and SahVtmCode = " & CStr(mQryVtmCode), "") _
     & " order by SahDate,SahTime,SahCode" _
     , dbComDatabase, adOpenKeyset, adLockReadOnly
    
End If

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
mCount_Tot = 0: mOutPckQty_Tot = 0: mQty_Tot = 0: mAmount_Tot = 0
Rem MoveRecToFirst datRecset
Set tRecset = datRecset.ActiveConnection.Execute(datRecset.Source)
With tRecset
Rem If .RecordCount > 0 Then
If IsValidRec(tRecset) = True Then
    Do While .EOF = False
        If optMonthwise.Value = True Or optDatewise.Value = True Or optPartywise.Value = True Or optItemWise.Value = True Or optVTypewise.Value = True Then
            If optMonthwise.Value = True Then
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("SalYrMonth")) = .fields("SalYrMonth")
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("SalMnYear")) = MonthName(Val(Right(.fields("SalYrMonth"), 2))) & "-" & Left(.fields("SalYrMonth"), 4)
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("SalCount")) = ToMyNumFmt(.fields("SalCount"), mDecimals:=0)
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("SalOutPckQty_sum")) = ToMyNumFmt(.fields("SalOutPckQty_sum"), mDecimals:=-1)
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("SalQty_sum")) = ToMyNumFmt(.fields("SalQty_sum"), mDecimals:=-1)
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("SalAmount_sum")) = ToMyNumFmt(.fields("SalAmount_sum"))
                
            ElseIf optDatewise.Value = True Then
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("SalDateYMD")) = Format(.fields("SahDate"), "yyyymmdd")
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("SalDate")) = Dtoc(.fields("SahDate"))
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("SalCount")) = ToMyNumFmt(.fields("SalCount"), mDecimals:=0)
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("SalOutPckQty_sum")) = ToMyNumFmt(.fields("SalOutPckQty_sum"), mDecimals:=-1)
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("SalQty_sum")) = ToMyNumFmt(.fields("SalQty_sum"), mDecimals:=-1)
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("SalAmount_sum")) = ToMyNumFmt(.fields("SalAmount_sum"))
                
            ElseIf optPartywise.Value = True Then
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("PrtName")) = .fields("PrtName")
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("SalCount")) = ToMyNumFmt(.fields("SalCount"), mDecimals:=0)
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("SalOutPckQty_sum")) = ToMyNumFmt(.fields("SalOutPckQty_sum"), mDecimals:=-1)
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("SalQty_sum")) = ToMyNumFmt(.fields("SalQty_sum"), mDecimals:=-1)
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("SalAmount_sum")) = ToMyNumFmt(.fields("SalAmount_sum"))
                
            ElseIf optItemWise.Value = True Then
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("SimName")) = .fields("SimName")
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("SalCount")) = ToMyNumFmt(.fields("SalCount"), mDecimals:=0)
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("SalOutPckQty_sum")) = ToMyNumFmt(.fields("SalOutPckQty_sum"), mDecimals:=-1)
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("SalQty_sum")) = ToMyNumFmt(.fields("SalQty_sum"), mDecimals:=-1)
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("SalAmount_sum")) = ToMyNumFmt(.fields("SalAmount_sum"))
                
            ElseIf optVTypewise.Value = True Then
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("VtmName")) = .fields("VtmName")
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("SalCount")) = ToMyNumFmt(.fields("SalCount"), mDecimals:=0)
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("SalOutPckQty_sum")) = ToMyNumFmt(.fields("SalOutPckQty_sum"), mDecimals:=-1)
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("SalQty_sum")) = ToMyNumFmt(.fields("SalQty_sum"), mDecimals:=-1)
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("SalAmount_sum")) = ToMyNumFmt(.fields("SalAmount_sum"))
                
            End If
        
        ElseIf optDetailed.Value = True Or optExpanded.Value = True Then
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("tSalSmryId")) = .fields("tSalSmryId")
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("SalCode")) = .fields("SahCode")
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("VtmName")) = .fields("VtmName")
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("SalVchNo")) = .fields("SahVchNo")
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("SalDate")) = Dtoc(.fields("SahDate"))
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("PrtCode")) = .fields("PrtCode")
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("PrtName")) = .fields("PrtName")
            If optExpanded.Value = True Then
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("SimCode")) = .fields("SimCode")
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("SimName")) = .fields("SimName")
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("SalOutPckQty")) = ToMyNumFmt(.fields("SalOutPckQty"), mDecimals:=-1)
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("SalQty")) = ToMyNumFmt(.fields("SalQty"), mDecimals:=-1)
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("SalAmount")) = ToMyNumFmt(.fields("SalAmount"))
            Else
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("SalOutPckQty")) = ToMyNumFmt(.fields("SahOutPckQty"), mDecimals:=-1)
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("SalQty")) = ToMyNumFmt(.fields("SahQty"), mDecimals:=-1)
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("SalAmount")) = ToMyNumFmt(.fields("SahAmount"))
            End If
'''            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("PrtAddr")) = .fields("PrtAddr")
'''            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("PatAraName")) = .fields("AraName")
'''            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("PatStnName")) = .fields("StnName")
        
        End If
        If optDetailed.Value = True Then
            mCount_Tot = mCount_Tot + 1
            mOutPckQty_Tot = mOutPckQty_Tot + .fields("SahOutPckQty")
            mQty_Tot = mQty_Tot + .fields("SahQty")
            mAmount_Tot = mAmount_Tot + .fields("SahAmount")
        ElseIf optExpanded.Value = True Then
            mCount_Tot = mCount_Tot + 1
            mOutPckQty_Tot = mOutPckQty_Tot + .fields("SalOutPckQty")
            mQty_Tot = mQty_Tot + .fields("SalQty")
            mAmount_Tot = mAmount_Tot + .fields("SalAmount")
        Else
            mCount_Tot = mCount_Tot + .fields("SalCount")
            mOutPckQty_Tot = mOutPckQty_Tot + .fields("SalOutPckQty_sum")
            mQty_Tot = mQty_Tot + .fields("SalQty_sum")
            mAmount_Tot = mAmount_Tot + .fields("SalAmount_sum")
        End If
        
        srow = srow + 1
        If Mfgrd1.Rows < srow + 1 Then
            Mfgrd1.Rows = Mfgrd1.Rows + 1
        End If
        
        .MoveNext
    Loop
End If
End With
CloseTable tRecset

Rem grand total
If optMonthwise.Value = True Then
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("SalYrMonth")) = ""
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("SalMnYear")) = "Grand Total"
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("SalCount")) = ToMyNumFmt(mCount_Tot, mDecimals:=0)
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("SalOutPckQty_sum")) = ToMyNumFmt(mOutPckQty_Tot, mDecimals:=-1)
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("SalQty_sum")) = ToMyNumFmt(mQty_Tot, mDecimals:=-1)
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("SalAmount_sum")) = ToMyNumFmt(mAmount_Tot)
    
ElseIf optDatewise.Value = True Then
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("SalDateYMD")) = ""
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("SalDate")) = "Grand Total"
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("SalCount")) = ToMyNumFmt(mCount_Tot, mDecimals:=0)
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("SalOutPckQty_sum")) = ToMyNumFmt(mOutPckQty_Tot, mDecimals:=-1)
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("SalQty_sum")) = ToMyNumFmt(mQty_Tot, mDecimals:=-1)
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("SalAmount_sum")) = ToMyNumFmt(mAmount_Tot)

ElseIf optPartywise.Value = True Then
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("PrtName")) = "Grand Total"
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("SalCount")) = ToMyNumFmt(mCount_Tot, mDecimals:=0)
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("SalOutPckQty_sum")) = ToMyNumFmt(mOutPckQty_Tot, mDecimals:=-1)
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("SalQty_sum")) = ToMyNumFmt(mQty_Tot, mDecimals:=-1)
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("SalAmount_sum")) = ToMyNumFmt(mAmount_Tot)

ElseIf optItemWise.Value = True Then
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("SimName")) = "Grand Total"
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("SalCount")) = ToMyNumFmt(mCount_Tot, mDecimals:=0)
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("SalOutPckQty_sum")) = ToMyNumFmt(mOutPckQty_Tot, mDecimals:=-1)
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("SalQty_sum")) = ToMyNumFmt(mQty_Tot, mDecimals:=-1)
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("SalAmount_sum")) = ToMyNumFmt(mAmount_Tot)
    
ElseIf optVTypewise.Value = True Then
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("VtmName")) = "Grand Total"
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("SalCount")) = ToMyNumFmt(mCount_Tot, mDecimals:=0)
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("SalOutPckQty_sum")) = ToMyNumFmt(mOutPckQty_Tot, mDecimals:=-1)
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("SalQty_sum")) = ToMyNumFmt(mQty_Tot, mDecimals:=-1)
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("SalAmount_sum")) = ToMyNumFmt(mAmount_Tot)
    
ElseIf optDetailed.Value = True Or optExpanded.Value = True Then
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("tSalSmryId")) = ""
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("SalCode")) = ""
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("VtmName")) = ""
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("SalVchNo")) = ""
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("SalDate")) = ""
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("PrtCode")) = ""
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("PrtName")) = "Grand Total (" & CStr(mCount_Tot) & ")"
    If optExpanded.Value = True Then
        Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("SimCode")) = ""
        Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("SimName")) = ""
    End If
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("SalOutPckQty")) = ToMyNumFmt(mOutPckQty_Tot, mDecimals:=-1)
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("SalQty")) = ToMyNumFmt(mQty_Tot, mDecimals:=-1)
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("SalAmount")) = ToMyNumFmt(mAmount_Tot)
    ' ------------------------------------
'''    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("PrtAddr")) = ""
'''    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("PatAraName")) = ""
'''    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("PatStnName")) = ""

End If
srow = srow + 1
If Mfgrd1.Rows < srow + 1 Then
    Mfgrd1.Rows = Mfgrd1.Rows + 1
End If

For mColCount = 0 To Mfgrd1.Cols - 1
    Mfgrd1.TextMatrix(srow, mColCount) = ""
Next mColCount
Mfgrd1.Rows = srow + 1

SetFlexColCursor txtList1Col, Mfgrd1

Rem Call CalcDrCrAmtTot

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

'''Private Sub CalcDrCrAmtTot()
'''Dim mOpnDrAmtTot As Double, mOpnCrAmtTot As Double, mOpnNetBal As Double, mCurDrAmtTot As Double, mCurCrAmtTot As Double, mCurNetBal As Double
'''Dim aAhOpBal As Variant, aAhCurBal As Variant, mRowPos As Integer
'''
'''lblOpnDrAmtTot.Caption = ToMyAcFmt(0)
'''lblOpnCrAmtTot.Caption = ToMyAcFmt(0)
'''lblOpnNetBal.Caption = ToMyAcFmt(0)
'''lblCurDrAmtTot.Caption = ToMyAcFmt(0)
'''lblCurCrAmtTot.Caption = ToMyAcFmt(0)
'''lblCurNetBal.Caption = ToMyAcFmt(0)
'''
'''mOpnDrAmtTot = 0: mOpnCrAmtTot = 0: mOpnNetBal = 0
'''mCurDrAmtTot = 0: mCurCrAmtTot = 0: mCurNetBal = 0
'''
'''MoveRecToFirst datRecset
'''Do While datRecset.EOF = False
'''    Rem opening balance
'''    aAhOpBal = clsAH.GetAhOpnBal(datRecset.Fields("PrtAhCode"), mDrCrSeperated:=True)
'''    mOpnDrAmtTot = mOpnDrAmtTot + aAhOpBal(0)
'''    mOpnCrAmtTot = mOpnCrAmtTot + aAhOpBal(1)
'''
'''    Rem current balance
'''    aAhCurBal = clsAH.GetAhCurBal(datRecset.Fields("PrtAhCode"), sFinYrEndDate, mDrCrSeperated:=True)
'''    mCurDrAmtTot = mCurDrAmtTot + aAhCurBal(0)
'''    mCurCrAmtTot = mCurCrAmtTot + aAhCurBal(1)
'''
'''    datRecset.MoveNext
'''Loop
'''mOpnNetBal = mOpnDrAmtTot + mOpnCrAmtTot
'''mCurNetBal = mCurDrAmtTot + mCurCrAmtTot
'''
'''lblOpnDrAmtTot.Caption = ToMyAcFmt(mOpnDrAmtTot)
'''lblOpnCrAmtTot.Caption = ToMyAcFmt(mOpnCrAmtTot)
'''lblOpnNetBal.Caption = ToMyAcFmt(mOpnNetBal)
'''lblCurDrAmtTot.Caption = ToMyAcFmt(mCurDrAmtTot)
'''lblCurCrAmtTot.Caption = ToMyAcFmt(mCurCrAmtTot)
'''lblCurNetBal.Caption = ToMyAcFmt(mCurNetBal)
'''
''''frBottomTotal.Left = (dgList.Columns(dgList.Columns.Count - 1).Left + dgList.Columns(dgList.Columns.Count - 1).Width - frBottomTotal.Width)
'''
'''End Sub

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
    fcmbPrtName.BoundText = CStr(mQryPrtCode): txtQryPrtName.Text = fcmbPrtName.Text
    fcmbSimName.BoundText = CStr(mQrySimCode): txtQrySimName.Text = fcmbSimName.Text
    fcmbVtmName.BoundText = CStr(mQryVtmCode): txtQryVtmName.Text = fcmbVtmName.Text
    ' ----------------
    frConfigure.ZOrder
    frConfigure.Visible = True
    Mfgrd1.Enabled = False
    dtpFromDate.SetFocus
ElseIf MyAddNewKey(Shift, KeyCode) = True Then
    Call Data_AddEvent
ElseIf MyDeleteKey(Shift, KeyCode) = True Then
    If Mfgrd1.Row < Mfgrd1.Rows - 1 And optDetailed.Value = True Then
        Call Data_DeleteEvent
    End If
ElseIf MyPrintKey(Shift, KeyCode) = True Then
    Data_PrintDialog "Keydown"
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

If IsMissing(mText) = True Then ' user is typing is search text box
    mText = txtSearch1Text.Text
    SearchRawFlex Mfgrd1, FlexLeftVisibleCol(Mfgrd1), mText
Else    ' system field search has been requested by programmer
    If optDetailed.Value = True Or optExpanded.Value = True Then
        SearchRawFlex Mfgrd1, clsListStru.GetItemIndex("tSalSmryId"), mText
    ElseIf optMonthwise.Value = True Then
        SearchRawFlex Mfgrd1, clsListStru.GetItemIndex("SalYrMonth"), mText
    ElseIf optDatewise.Value = True Then
        SearchRawFlex Mfgrd1, clsListStru.GetItemIndex("SalDateYMD"), mText
    ElseIf optPartywise.Value = True Then
        SearchRawFlex Mfgrd1, clsListStru.GetItemIndex("PrtName"), mText
    ElseIf optItemWise.Value = True Then
        SearchRawFlex Mfgrd1, clsListStru.GetItemIndex("SimName"), mText
    ElseIf optVTypewise.Value = True Then
        SearchRawFlex Mfgrd1, clsListStru.GetItemIndex("VtmName"), mText
    End If
End If
ShowActiveFlexRow Mfgrd1

End Sub

Private Sub txtQryPrtName_Change()
If fcmbPrtName.CallFromText_Change = False Then
    fcmbPrtName.CallFromText_Change = True
    If InterActiveChange(txtQryPrtName) = True Then
        fcmbPrtName.UserText = Array(txtQryPrtName.Text, txtQryPrtName.SelStart)
        fcmbPrtName.Show
        txtQryPrtName.Text = fcmbPrtName.Text
        mQryPrtCode = Val(fcmbPrtName.BoundText)
        If fcmbPrtName.ListSelected = True Then
            SendKeys "{tab}"
        End If
    End If
    fcmbPrtName.CallFromText_Change = False
End If

End Sub

Private Sub txtQryPrtName_GotFocus()
FlashActiveControl txtQryPrtName, True
End Sub

Private Sub txtQryPrtName_KeyDown(KeyCode As Integer, Shift As Integer)
If MyDropDownKey(Shift, KeyCode) = True Then
    Call txtQryPrtName_Change
ElseIf MyAddNewKey(Shift, KeyCode) = True Then
    Rem not required
End If

End Sub

Private Sub txtQryPrtName_LostFocus()
FlashActiveControl txtQryPrtName, False
End Sub

Private Sub txtSearch1Text_GotFocus()
FlashActiveControl txtSearch1Text, True
End Sub

Private Sub txtSearch1Text_LostFocus()
FlashActiveControl txtSearch1Text, False
End Sub

Private Sub txtSimName_Change()
If fcmbSimName.CallFromText_Change = False Then
    fcmbSimName.CallFromText_Change = True
    If InterActiveChange(txtSimName) = True Then
        fcmbSimName.UserText = Array(txtSimName.Text, txtSimName.SelStart)
        fcmbSimName.Show
        txtSimName.Text = fcmbSimName.Text
        If fcmbSimName.ListSelected = True Then
            SendKeys "{TAB}"
        End If
    End If
    fcmbSimName.CallFromText_Change = False
End If

End Sub

Private Sub txtSimName_GotFocus()
FlashActiveControl txtSimName, True

End Sub

Private Sub txtSimName_KeyDown(KeyCode As Integer, Shift As Integer)
If MyDropDownKey(Shift, KeyCode) = True Then
    Call txtSimName_Change
End If

End Sub

Private Sub txtSimName_LostFocus()
FlashActiveControl txtSimName, False
End Sub

Private Sub txtSimName_Validate(Cancel As Boolean)
If Val(fcmbSimName.BoundText) <= 0 Then
    ErrorBox "Invalid Selection !!!"
    txtSimName.SetFocus
    Cancel = True
Else
    If dtlAddMode = True Or Val(fcmbSimName.BoundText) <> mSalSimCode_old Then
        clsSIM.GetData Val(fcmbSimName.BoundText)
        mskSalItmCode.Text = clsSIM.mSimItmCode_lng
        
        Call ChkSimRefNoList
    End If
End If
Call ValidDtl

End Sub

Private Sub txtStnName_GotFocus()
FlashActiveControl txtStnName, True
End Sub

Private Sub txtStnName_LostFocus()
FlashActiveControl txtStnName, False
End Sub

Private Sub CalcSalChg()
Dim mSalOutPckQty As Double, mSalInrPckSz As Double, mSalQty As Double, mSalRate As Double, mSalWslRate As Double, mSalRtlRate As Double, mSalAmount As Double, mSalBasicAmt As Double, mSalDiscPer As Double, mSalDiscAmt As Double, mSalTaxPer As Double, mSalTaxAmt As Double
Dim mSalDiscableAmt As Double, mSalTaxableAmt As Double

mSalOutPckQty = Val(UnMyNumFmt(mskSalOutPckQty.Text))
mSalInrPckSz = Val(UnMyNumFmt(mskSalInrPckSz.Text))
mSalQty = Val(UnMyNumFmt(mskSalQty.Text))
If mOutPckQtyChanged = True Or mInrPckSzChanged = True Then
    mSalQty = Round(mSalOutPckQty * mSalInrPckSz, 3)
End If
mSalRate = Val(UnMyNumFmt(mskSalRate.Text))
mSalWslRate = Val(UnMyNumFmt(mskSalWslRate.Text))
mSalRtlRate = Val(UnMyNumFmt(mskSalRtlRate.Text))
mSalDiscPer = Val(UnMyPerFmt(mskSalDiscPer.Text))
mSalDiscAmt = Val(UnMyNumFmt(mskSalDiscAmt.Text))
mSalTaxPer = Val(UnMyPerFmt(mskSalTaxPer.Text))
mSalTaxAmt = Val(UnMyNumFmt(mskSalTaxAmt.Text))
If mFormSysVchType = cCOM_VTYPE_RETNOUTW Then
    MsgBox "Pending !!!"
'''    mSalBasicAmt = Round(mSalQty * mSalWslRate, 2)
'''    If FormAddEditMode = cFORM_ADDMODE Or dtlAddMode = True Or mSalTaxPer <> mSalTaxPer_old Or Val(UnMyNumFmt(mskSalTaxAmt.Text)) = 0 Then
'''        mSalTaxAmt = Round(CDec(Round(mSalQty * mSalRate, 2)) * CDec(mSalTaxPer) / 100, 2)
'''    Else
'''        mSalTaxAmt = Val(UnMyNumFmt(mskSalTaxAmt.Text))
'''    End If
'''    mSalAmount = Round(mSalBasicAmt + mSalTaxAmt, 2)
Else
    If mFormSysVchType = cKGT_VTYPE_SWLSALES Or mFormSysVchType = cKGT_VTYPE_RTLSALES Then
        mSalBasicAmt = Round(CDec(mSalQty) * CDec(mSalRate), 2)
    ElseIf mFormSysVchType = cKGT_VTYPE_WSLSALES Then
        mSalBasicAmt = Round(MyDivide((CDec(mSalQty) * CDec(mSalRate)), CDec(mSalInrPckSz)), 2)
    Else
        mSalBasicAmt = 0
    End If
    If cmbSalDiscType.ListIndex = 1 Then
        mSalDiscableAmt = mSalBasicAmt
        If mDiscTypeChanged = True Or (mTaxTypeChanged = True And cmbSalDiscType.ListIndex = 2) Or mDiscAmtChanged = False Or mSalDiscAmt = 0 Then
            If dtlAddMode = True Or mSalDiscPer <> mSalDiscPer_old Or mSalDiscAmt = 0 Then
                mSalDiscAmt = Round(CDec(mSalDiscableAmt) * CDec(mSalDiscPer) / 100, 2)
            End If
        End If
        mSalTaxableAmt = mSalBasicAmt - mSalDiscAmt
        If mTaxTypeChanged = True Or mDiscTypeChanged = True Or mTaxAmtChanged = False Or mSalTaxAmt = 0 Then
            If dtlAddMode = True Or mSalTaxPer <> mSalTaxPer_old Or mSalTaxAmt = 0 Then
                If cmbSalTaxType.ListIndex = 1 Then
                    mSalTaxAmt = Round(CDec(mSalTaxableAmt) * CDec(mSalTaxPer) / 100, 2)
                Else
                    mSalTaxAmt = Round(CDec(MyDivide(CDec(mSalTaxableAmt) * 100, 100 + mSalTaxPer)) * CDec(mSalTaxPer) / 100, 2)
                End If
            End If
        End If
    Else
        mSalTaxableAmt = mSalBasicAmt
        If mTaxTypeChanged = True Or mDiscTypeChanged = True Or mTaxAmtChanged = False Or mSalTaxAmt = 0 Then
            If dtlAddMode = True Or mSalTaxPer <> mSalTaxPer_old Or mSalTaxAmt = 0 Then
                If cmbSalTaxType.ListIndex = 1 Then
                    mSalTaxAmt = Round(CDec(mSalTaxableAmt) * CDec(mSalTaxPer) / 100, 2)
                Else
                    mSalTaxAmt = Round(CDec(MyDivide(CDec(mSalTaxableAmt) * 100, 100 + mSalTaxPer)) * CDec(mSalTaxPer) / 100, 2)
                End If
            End If
        End If
        mSalDiscableAmt = mSalBasicAmt + mSalTaxAmt
        If mDiscTypeChanged = True Or (mTaxTypeChanged = True And cmbSalDiscType.ListIndex = 2) Or mDiscAmtChanged = False Or mSalDiscAmt = 0 Then
            If dtlAddMode = True Or mSalDiscPer <> mSalDiscPer_old Or mSalDiscAmt = 0 Then
                mSalDiscAmt = Round(CDec(mSalDiscableAmt) * CDec(mSalDiscPer) / 100, 2)
            End If
        End If
    End If
    mSalAmount = Round(mSalBasicAmt - mSalDiscAmt + mSalTaxAmt, 2)
End If
' --------
mskSalQty.Text = ToMyNumFmt(mSalQty, mDecimals:=-1)
mskSalBasicAmt.Text = ToMyNumFmt(mSalBasicAmt)
mskSalDiscableAmt.Text = ToMyNumFmt(mSalDiscableAmt)
mskSalDiscAmt.Text = ToMyNumFmt(mSalDiscAmt)
mskSalTaxableAmt.Text = ToMyNumFmt(mSalTaxableAmt)
mskSalTaxAmt.Text = ToMyNumFmt(mSalTaxAmt)
mskSalAmount.Text = ToMyNumFmt(mSalAmount)

Exit Sub

Rem --------------- discount calculation
'''ProcCalcDisc:
'''If mDiscTypeChanged = True Or (mTaxTypeChanged = True And cmbSalDiscType.ListIndex = 2) Or mDiscAmtChanged = False Or mSalDiscAmt = 0 Then
'''    If dtlAddMode = True Or mSalDiscPer <> mSalDiscPer_old Or mSalDiscAmt = 0 Then
'''        mSalDiscAmt = Round(CDec(mSalDiscableAmt) * CDec(mSalDiscPer) / 100, 2)
'''    End If
'''End If

Rem ---------------- tax calculation
'''ProcCalcTax:
'''If mTaxTypeChanged = True Or mDiscTypeChanged = True Or mTaxAmtChanged = False Or mSalTaxAmt = 0 Then
'''    If dtlAddMode = True Or mSalTaxPer <> mSalTaxPer_old Or mSalTaxAmt = 0 Then
'''        If cmbSalTaxType.ListIndex = 1 Then
'''            mSalTaxAmt = Round(CDec(mSalTaxableAmt) * CDec(mSalTaxPer) / 100, 2)
'''        Else
'''            'rajendra singh shekhawat
'''        End If
'''    End If
'''End If

''''Dim mSalQty As Double, mSalRate As Double, mSalAmount As Double, mSalBasicAmt As Double, mSalTaxPer As Double, mSalTaxAmt As Double

''''mSalQty = Val(UnMyNumFmt(mskSalQty.Text))
''''mSalRate = Val(UnMyNumFmt(mskSalRate.Text))
''''mSalTaxPer = Val(UnMyPerFmt(mskSalTaxPer.Text))
'''''If mFormSysVchType = cCOM_VTYPE_RETNOUTW Then
''''    mSalBasicAmt = Round(mSalQty * mSalRate, 2)
''''    If FormAddEditMode = cFORM_ADDMODE Or dtlAddMode = True Or mSalTaxPer <> mSalTaxPer_old Or mSalBasicAmt <> mSalBasicAmt_old Or Val(UnMyNumFmt(mskSalTaxAmt.Text)) = 0 Then
''''        mSalTaxAmt = Round(CDec(mSalBasicAmt) * CDec(mSalTaxPer) / 100, 2)
''''    Else
''''        mSalTaxAmt = Val(UnMyNumFmt(mskSalTaxAmt.Text))
''''    End If
''''    mSalAmount = Round(mSalBasicAmt + mSalTaxAmt, 2)
'''''Else
'''''    mSalBasicAmt = Round(mSalQty * mSalRate, 2)
'''''    If FormAddEditMode = cFORM_ADDMODE Or dtlAddMode = True Or mSalTaxPer <> mSalTaxPer_old Or mSalBasicAmt <> mSalBasicAmt_old Or Val(UnMyNumFmt(mskSalTaxAmt.Text)) = 0 Then
'''''        mSalTaxAmt = Round(CDec(mSalBasicAmt) * CDec(mSalTaxPer) / 100, 2)
'''''    Else
'''''        mSalTaxAmt = Val(UnMyNumFmt(mskSalTaxAmt.Text))
'''''    End If
'''''    mSalAmount = Round(mSalBasicAmt + mSalTaxAmt, 2)
'''''End If
''''' --------
''''mskSalBasicAmt.Text = ToMyNumFmt(mSalBasicAmt)
''''mskSalAmount.Text = ToMyNumFmt(mSalAmount)
''''mskSalTaxAmt.Text = ToMyNumFmt(mSalTaxAmt)

End Sub

Private Sub ShowOldSalCodeDesc()
Dim tRecset As New ADODB.Recordset, mSalDate As Date, mSalPrtCode As Long

mSalPrtCode = Val(fcmbPrtName.BoundText)
mSalDate = Ctod(dtpSalDate.Text)
With tRecset
'If FormAddEditMode = cFORM_ADDMODE Then
'    .Open "Select top 1 sah.*,vtm.VtmName from SaleHdr sah inner join VTypMast vtm on sah.SahVtmCode=vtm.VtmCode where sah.SahPrtCode=" & CStr(mSalPrtCode) & " order by sah.SahDate Desc", dbComDatabase, adOpenKeyset, adLockOptimistic
'Else
    .Open "Select top 1 sah.*,vtm.VtmName from SaleHdr sah" _
        & " inner join VTypMast vtm on sah.SahVtmCode = vtm.VtmCode" _
        & " where sah.SahPrtCode = " & CStr(mSalPrtCode) _
        & " and sah.SahCode <> " & CStr(mSalCode) _
        & " and sah.SahDate <= #" & ToSysDate(mSalDate) & "#" _
        & " and sah.SahVtmCode IN (" & mFormVchTypeList & ")" _
        & " order by sah.SahDate Desc", dbComDatabase, adOpenKeyset, adLockOptimistic
'End If
If .RecordCount > 0 Then
    lblOldSalCodeDesc.Caption = RTrim(.fields("VtmName")) & " No.:" & CStr(.fields("SahVchNo")) & " Dated:" & Dtoc(.fields("SahDate"))
Else
    lblOldSalCodeDesc.Caption = "#" & CStr(mSalPrtCode) & "#"
End If
End With
CloseTable tRecset

End Sub

Private Sub VisibleControls(ByVal mShowItem As Boolean, Optional ByVal mRowPos)
Rem Important - dtlAddEditMode & dtlAddMode must be initialised prior to this
If Me.Visible = True Then
    txtVoid.SetFocus
End If
If IsMissing(mRowPos) = False And True = False Then
    Rem mskSalICode.Top = mRowPos
    Rem mskSalStkICode.Top = mRowPos
    mskSalSno.Top = mRowPos
    txtSimName.Top = mRowPos
    txtSalNarr.Top = mRowPos + txtSimName.Height
    Rem mskSalItmCode.Top = mRowPos
    txtSalSimRefNo.Top = mRowPos
    Rem mskSalPurCode.Top = mRowPos
    Rem mskSalPurICode.Top = mRowPos
    mskSalQty.Top = mRowPos
    mskSalRate.Top = mRowPos
    Rem mskSalBasicAmt.Top = mRowPos
    '''mskPurMRP.Top = mRowPos
    '''mskPurRate.Top = mRowPos
    mskSalTaxPer.Top = mRowPos
    mskSalTaxAmt.Top = mRowPos
    mskSalAmount.Top = mRowPos
    cmdOK.Top = mRowPos + mskSalAmount.Height
End If

mskSalICode.Text = 0
mskSalSno.Text = 0
txtSimName.Text = "": fcmbSimName.BoundText = ""
txtSalNarr.Text = ""
txtSalSimRefNo.Text = "": fcmbSimRefNo.BoundText = ""
txtPckName.Text = "": fcmbPckName.BoundText = ""
mskSalOutPckQty.Text = 0
txtSalOutPckNm.Text = ""
mskSalInrPckSz.Text = 0
txtSalInrPckNm.Text = ""
mskSalQty.Text = ToMyNumFmt(0, mDecimals:=-1)
mskSalRate.Text = ToMyNumFmt(0)
mskSalMRP.Text = ToMyNumFmt(0)
mskSalWslRate.Text = ToMyNumFmt(0)
mskSalRtlRate.Text = ToMyNumFmt(0)
cmbSalDiscType.ListIndex = 0
mskSalDiscPer.Text = ToMyPerFmt(0, mDecimals:=-1)
mskSalDiscableAmt.Text = ToMyNumFmt(0)
mskSalDiscAmt.Text = ToMyNumFmt(0)
cmbSalTaxType.ListIndex = 0
mskSalTaxPer.Text = ToMyPerFmt(0, mDecimals:=-1)
mskSalTaxableAmt.Text = ToMyNumFmt(0)
mskSalTaxAmt.Text = ToMyNumFmt(0)
mskSalBasicAmt.Text = ToMyNumFmt(0)
mskSalAmount.Text = ToMyNumFmt(0)
mskSalItmCode.Text = 0
mskSalItrCode.Text = 0
mskSalPurCode.Text = 0
mskSalPurICode.Text = 0
mskSalStkICode.Text = 0

Call ValidDtl

mskSalICode.Visible = False     '''  mShowItem
mskSalStkICode.Visible = False     '''  mShowItem
'''mskSalSno.Visible = mShowItem
'''txtSimName.Visible = mShowItem
'''txtSalNarr.Visible = mShowItem
mskSalItmCode.Visible = False     '''  mShowItem
mskSalItrCode.Visible = False     '''  mShowItem
'''txtSalSimRefNo.Visible = mShowItem
mskSalPurCode.Visible = False     '''  mShowItem
mskSalPurICode.Visible = False     '''  mShowItem
'''mskSalQty.Visible = mShowItem
'''mskSalRate.Visible = mShowItem
Rem mskSalBasicAmt.Visible = mShowItem
'''mskPurMRP.Visible = mShowItem
'''mskPurRate.Visible = mShowItem
'''mskSalTaxPer.Visible = mShowItem
'''mskSalTaxAmt.Visible = mShowItem
'''mskSalAmount.Visible = mShowItem
'''cmdOK.Visible = mShowItem

frHeader.Enabled = (mShowItem = False)
frDetail.Enabled = (mShowItem = True)
Mfgrd2.Enabled = (mShowItem = False)
frFooter.Enabled = (mShowItem = False)
cmdSaveForm.Enabled = (mShowItem = False)

End Sub

Private Sub ValidDtl()
Dim mDataOk As Boolean, srow As Integer

srow = Mfgrd2.Row
Rem mDataOk = (Trim(txtPrtName.Text) <> "" And Val(fcmbPrtName.BoundText) > 0 And Val(UnMyNumFmt(mskSalSno.Text)) > 0 And Trim(txtSimName.Text) <> "" And Val(fcmbSimName.BoundText) > 0 And Val(mskSalItmCode.Text) > 0 And Trim(txtSalSimRefNo.Text) <> "" And Val(fcmbSimRefNo.BoundText) > 0 And Val(mskSalPurCode.Text) > 0 And Val(mskSalPurICode.Text) > 0 And Val(UnMyNumFmt(mskSalQty.Text)) > 0 And Val(UnMyNumFmt(mskSalRate.Text)) > 0 And Val(UnMyNumFmt(mskSalAmount.Text)) > 0)
mDataOk = (Val(fcmbPrtName.BoundText) > 0 And Val(UnMyNumFmt(mskSalSno.Text)) > 0 And Val(fcmbSimName.BoundText) > 0 And Val(mskSalItmCode.Text) > 0 And Val(mskSalItrCode.Text) > 0 And Trim(txtSalSimRefNo.Text) <> "" _
    And IIf(dtlAddMode = True, True, Val(mskSalICode.Text) > 0 And Val(mskSalStkICode.Text) > 0) _
    And Val(UnMyNumFmt(mskSalOutPckQty.Text)) >= 0 And txtSalOutPckNm.Text <> "" And Val(UnMyNumFmt(mskSalInrPckSz.Text)) >= 0 And txtSalInrPckNm.Text <> "" _
    And Val(UnMyNumFmt(mskSalQty.Text)) >= 0 And Val(UnMyNumFmt(mskSalRate.Text)) >= 0 And Val(UnMyNumFmt(mskSalWslRate.Text)) >= 0 And Val(UnMyNumFmt(mskSalRtlRate.Text)) >= 0 _
    And cmbSalDiscType.ListIndex > 0 And Val(UnMyPerFmt(mskSalDiscPer.Text)) >= 0 And Val(UnMyNumFmt(mskSalDiscableAmt.Text)) >= 0 And Val(UnMyNumFmt(mskSalDiscAmt.Text)) >= 0 _
    And cmbSalTaxType.ListIndex > 0 And Val(UnMyPerFmt(mskSalTaxPer.Text)) >= 0 And Val(UnMyNumFmt(mskSalTaxableAmt.Text)) >= 0 And Val(UnMyNumFmt(mskSalTaxAmt.Text)) >= 0 _
    And Val(UnMyNumFmt(mskSalBasicAmt.Text)) >= 0 And Val(UnMyNumFmt(mskSalAmount.Text)) >= 0)

cmdOK.Caption = IIf(mDataOk = True, "&OK", "&Cancel")
cmdOK.BackColor = IIf(mDataOk = True, &H80FF80, &H8080FF)
End Sub

Private Sub CalcFtrTotal(Optional ByVal mCalcBalOnly As Boolean = False)
Dim mSalOutPckQtyTot As Double, mSalQtyTot As Double, mSalBasicAmtTot As Double, mSalDiscAmtTot As Double, mSalTaxAmtTot As Double
Dim mSahDiscPer As Double, mSahDiscableAmtTot As Double, mSahDiscAmt As Double, mSahTaxPer As Double, mSahTaxableAmtTot As Double, mSahTaxAmt As Double, mSahOtherAmt As Double, mSahROffAmt As Double, mSahAmount As Double
Dim srow As Integer

mSalOutPckQtyTot = FlexColSum(Mfgrd2, X2SALOUTPCKQTY_COL)
mSalQtyTot = FlexColSum(Mfgrd2, X2SALQTY_COL)
mSalBasicAmtTot = FlexColSum(Mfgrd2, X2SALBASICAMT_COL)
mSalDiscAmtTot = FlexColSum(Mfgrd2, X2SALDISCAMT_COL)
mSalTaxAmtTot = FlexColSum(Mfgrd2, X2SALTAXAMT_COL)

lblSalOutPckQtyTot.Caption = ToMyNumFmt(mSalOutPckQtyTot, mDecimals:=-1)
lblSalQtyTot.Caption = ToMyNumFmt(mSalQtyTot, mDecimals:=-1)
lblSalBasicAmtTot.Caption = ToMyNumFmt(mSalBasicAmtTot)
lblSalDiscAmtTot.Caption = ToMyNumFmt(mSalDiscAmtTot)
lblSalTaxAmtTot.Caption = ToMyNumFmt(mSalTaxAmtTot)

Rem calculate header discount if any
mSahDiscableAmtTot = 0
With Mfgrd2
For srow = .FixedRows To .Rows - 1
    If Val(UnMyNumFmt(.TextMatrix(srow, X2SALDISCAMT_COL))) = 0 Then
        mSahDiscableAmtTot = mSahDiscableAmtTot + Val(UnMyNumFmt(.TextMatrix(srow, X2SALDISCABLEAMT_COL)))
    End If
Next srow
End With
mSahDiscPer = Val(UnMyPerFmt(mskSahDiscPer.Text))
If mSahDiscPer <> 0 Then
    mSahDiscAmt = CDec(mSahDiscableAmtTot) * CDec(mSahDiscPer) / 100
Else
    mSahDiscAmt = 0
End If

Rem calculate header tax if any
mSahTaxableAmtTot = 0
With Mfgrd2
For srow = .FixedRows To .Rows - 1
    If Val(UnMyNumFmt(.TextMatrix(srow, X2SALTAXAMT_COL))) = 0 Then
        mSahTaxableAmtTot = mSahTaxableAmtTot + Val(UnMyNumFmt(.TextMatrix(srow, X2SALTAXABLEAMT_COL)))
    End If
Next srow
End With
mSahTaxPer = Val(UnMyPerFmt(mskSahTaxPer.Text))
If mSahTaxPer <> 0 Then
    mSahTaxAmt = CDec(mSahTaxableAmtTot) * CDec(mSahTaxPer) / 100
Else
    mSahTaxAmt = 0
End If

mSahOtherAmt = Val(UnMyPerFmt(mskSahOtherAmt.Text))
mSahDiscAmt = mSahDiscAmt + mSalDiscAmtTot
mSahTaxAmt = mSahTaxAmt + mSalTaxAmtTot
mSahROffAmt = Val(UnMyPerFmt(mskSahROffAmt.Text))
mSahAmount = mSalBasicAmtTot - mSahDiscAmt + mSahTaxAmt + mSahOtherAmt + mSahROffAmt
mskSahDiscAmt.Text = ToMyNumFmt(mSahDiscAmt)
mskSahTaxAmt.Text = ToMyNumFmt(mSahTaxAmt)
mskSahAmount.Text = ToMyNumFmt(mSahAmount)

End Sub

Private Sub ShowLinkTranDtl()
Dim tRecset As New ADODB.Recordset, mLinkTranStr As String

mLinkTranStr = ""

With tRecset
.Open "Select * from ((((SaleDtl sal" _
    & " inner join SaleHdr sah on sal.SalCode = sah.SahCode)" _
    & " inner join PurchDtl pur on sal.SalPurICode = pur.PurICode)" _
    & " inner join PurchHdr puh on pur.PurCode = puh.PuhCode)" _
    & " inner join SubItmMast sim on pur.PurSimCode = sim.SimCode)" _
    & " inner join VTypMast vtm on puh.PuhVtmCode = vtm.VtmCode" _
    & " where SalCode = " & CStr(mSalCode) _
    & " order by PurDate,PurCode,PurSno" _
    , dbComDatabase, adOpenKeyset, adLockOptimistic
If .EOF = False Then
    Do While .EOF = False
        mLinkTranStr = mLinkTranStr & .fields("VtmName") & " No." & CStr(.fields("PuhVchNo")) & " Dt." & Dtoc(.fields("PuhDate")) & " It." & .fields("SimName") & " Rf." & .fields("PurSimRefNo") & " Qty." & ToMyNumFmt(.fields("PurQty"), mDecimals:=-1) & vbCrLf
    
        .MoveNext
    Loop
End If
End With
CloseTable tRecset

lblLinkTranDesc.Caption = mLinkTranStr

End Sub

Private Sub ChkSimRefNoList()
Rem important: below queries not almost same as in flexsearch class
fcmbSimRefNo.mBoundSqlExpr = "Select *,SimRefNo+'_'+format(ICode,'" & cLONGCODESTRFMT & "') as SimRefNoUnq from ((" _
    & "Select SimRefNo,ICode,ItrCode,sum(OutPckQty) as OutPckQty_sum,sum(Qty) as Qty_sum from (" _
    & "Select PurSimRefNo as SimRefNo,PurICode as ICode,PurItrCode as ItrCode,PurOutPckQty as OutPckQty,PurQty as Qty from PurchDtl" _
    & " inner join PurchHdr on PurchDtl.PurCode = PurchHdr.PuhCode" _
    & " where PurSimCode = " & CStr(Val(fcmbSimName.BoundText)) _
    & " and PurItmCode = " & CStr(Val(mskSalItmCode.Text)) _
    & " and PurDate <= #" & CStr(ToSysDate(Ctod(dtpSalDate.Text))) & "#" _
    & " Union All " _
    & "Select SalSimRefNo as SimRefNo,SalPurICode as ICode,SalItrCode as ItrCode,(SalOutPckQty*-1) as OutPckQty,(SalQty*-1) as Qty from SaleDtl" _
    & IIf(FormAddEditMode = cFORM_EDITMODE, " inner join SaleHdr on SaleDtl.SalCode = SaleHdr.SahCode", "") _
    & " where SalSimCode = " & CStr(Val(fcmbSimName.BoundText)) _
    & " and SalItmCode = " & CStr(Val(mskSalItmCode.Text)) _
    & " and SalICode <> " & CStr(Val(mskSalICode.Text)) _
    & " and (SalRecState <> " & CStr(cREC_CANCELED) & " and SalRecState <> " & CStr(cREC_DELETED) & ")" _
    & ")" _
    & " group by SimRefNo,ICode,ItrCode order by SimRefNo,ICode,ItrCode" _
    & ") as t1 inner join ProdRef on t1.ItrCode = ProdRef.ItrRefCode)" _
    & " inner join PurchDtl on t1.ICode = PurchDtl.PurICode" _
    & " where Qty_sum > 0"
    Rem & " where PurPrtCode = " & CStr(Val(fcmbPrtName.BoundText)) & " where SalPrtCode = " & CStr(Val(fcmbPrtName.BoundText))
    Rem & " and (SalRecState <> " & CStr(cREC_CANCELED) & " and SalRecState <> " & CStr(cREC_DELETED) & " and SalCode = " & CStr(mSalCode) & ")"
fcmbSimRefNo.mListSqlExpr = "Select *,SimRefNo+'_'+format(ICode,'" & cLONGCODESTRFMT & "') as SimRefNoUnq from ((" _
    & "Select SimRefNo,ICode,ItrCode,sum(OutPckQty) as OutPckQty_sum,sum(Qty) as Qty_sum from (" _
    & "Select PurSimRefNo as SimRefNo,PurICode as ICode,PurItrCode as ItrCode,PurOutPckQty as OutPckQty,PurQty as Qty from PurchDtl" _
    & " inner join PurchHdr on PurchDtl.PurCode = PurchHdr.PuhCode" _
    & " where PurSimCode = " & CStr(Val(fcmbSimName.BoundText)) _
    & " and PurItmCode = " & CStr(Val(mskSalItmCode.Text)) _
    & " and PurDate <= #" & CStr(ToSysDate(Ctod(dtpSalDate.Text))) & "#" _
    & " Union All " _
    & "Select SalSimRefNo as SimRefNo,SalPurICode as ICode,SalItrCode as ItrCode,(SalOutPckQty*-1) as OutPckQty,(SalQty*-1) as Qty from SaleDtl" _
    & IIf(FormAddEditMode = cFORM_EDITMODE, " inner join SaleHdr on SaleDtl.SalCode = SaleHdr.SahCode", "") _
    & " where SalSimCode = " & CStr(Val(fcmbSimName.BoundText)) _
    & " and SalItmCode = " & CStr(Val(mskSalItmCode.Text)) _
    & " and SalICode <> " & CStr(Val(mskSalICode.Text)) _
    & " and (SalRecState <> " & CStr(cREC_CANCELED) & " and SalRecState <> " & CStr(cREC_DELETED) & ")" _
    & ")" _
    & " group by SimRefNo,ICode,ItrCode order by SimRefNo,ICode,ItrCode" _
    & ") as t1 inner join ProdRef on t1.ItrCode = ProdRef.ItrRefCode)" _
    & " inner join PurchDtl on t1.ICode = PurchDtl.PurICode" _
    & " where Qty_sum > 0"
    Rem & " where PurPrtCode=" & CStr(Val(fcmbPrtName.BoundText)) & " where SalPrtCode = " & CStr(Val(fcmbPrtName.BoundText))
    Rem & " and (SalRecState <> " & CStr(cREC_CANCELED) & " and SalRecState <> " & CStr(cREC_DELETED) & " and SalCode = " & CStr(mSalCode) & ")"
fcmbSimRefNo.ReInit

End Sub

Private Function ChkAnyPostRcExist() As Boolean
Dim tRecset As New ADODB.Recordset

ChkAnyPostRcExist = False

With tRecset
.Open "Select top 1 * from ((PurchDtl" _
    & " inner join PurchHdr on PurchDtl.PurCode = PurchHdr.PuhCode)" _
    & " inner join SaleDtl on PurchDtl.PurICode = SaleDtl.SalPurICode)" _
    & " Inner Join SaleHdr on SaleDtl.SalCode = SaleHdr.SahCode" _
    & " where SalCode = " & CStr(mSalCode) _
    & " and PurDate > #" & CStr(ToSysDate(Ctod(dtpSalDate.Text))) & "#" _
    & " order by PurDate,PurCode" _
    , dbKgtDatabase, adOpenKeyset, adLockOptimistic
If .EOF = False Then
    clsVTM.GetData .fields("PuhVtmCode")
    ErrorBox "Post Purchase Exist !!!" _
        & vbCrLf & clsVTM.mName_str & " No." & CStr(.fields("PuhVchNo")) & " Dated " & Dtoc(.fields("PuhDate")) & ""
    ChkAnyPostRcExist = True
End If
End With
CloseTable tRecset

End Function

Private Function ChkAnyMisLinkedRcExist(Optional ByVal mSalICode) As Boolean
Dim tRecset As New ADODB.Recordset, mMisLinkedDesc As String

ChkAnyMisLinkedRcExist = False
mMisLinkedDesc = ""

With tRecset
.Open "Select top 1 * from ((PurchDtl" _
    & " inner join PurchHdr on PurchDtl.PurCode = PurchHdr.PuhCode)" _
    & " inner join SaleDtl on PurchDtl.PurICode = SaleDtl.SalPurICode)" _
    & " Inner Join SaleHdr on SaleDtl.SalCode = SaleHdr.SahCode" _
    & " where SalCode = " & CStr(mSalCode) _
    & IIf(IsMissing(mSalICode) = False, " and SalICode=" & CStr(mSalICode), "") _
    & " and (SalSimCode <> PurSimCode or SalItmCode <> PurItmCode or SalItrCode <> PurItrCode or SalSimRefNo <> PurSimRefNo)" _
    & " order by PuhDate,PuhCode" _
    , dbKgtDatabase, adOpenKeyset, adLockOptimistic
    Rem PuhPrtCode<>" & CStr(Val(fcmbPrtName.BoundText)) & " or
If .EOF = False Then
    clsVTM.GetData .fields("PuhVtmCode")
    'If .fields("PuhPrtCode") <> Val(fcmbPrtName.BoundText) Then
    '    mMisLinkedDesc = mMisLinkedDesc & "<Party Name>"
    'End If
    If .fields("SalSimCode") <> .fields("PurSimCode") Then
        mMisLinkedDesc = mMisLinkedDesc & "<Item Name>"
    End If
    If .fields("SalItmCode") <> .fields("PurItmCode") Then
        mMisLinkedDesc = mMisLinkedDesc & "<Main Product Name>"
    End If
    If .fields("SalItrCode") <> .fields("PurItrCode") Then
        mMisLinkedDesc = mMisLinkedDesc & "<Item Ref.Code>"
    End If
    If .fields("SalSimRefNo") <> .fields("PurSimRefNo") Then
        mMisLinkedDesc = mMisLinkedDesc & "<Item Ref.No.>"
    End If
    ErrorBox "Mis-Linked Purchase Exist !!!" _
        & vbCrLf & clsVTM.mName_str & " No." & CStr(.fields("PuhVchNo")) & " Dated " & Dtoc(.fields("PuhDate")) _
        & vbCrLf & "Alteration made in " _
        & vbCrLf & mMisLinkedDesc
    ChkAnyMisLinkedRcExist = True
End If
End With
CloseTable tRecset

End Function

Private Function ChkAnyExcessIsuExist(Optional ByVal mSalICode) As Boolean
Dim tRecset As New ADODB.Recordset

ChkAnyExcessIsuExist = False

With tRecset
.Open "Select top 1 * from (" _
    & "Select PurICode,SimCode,ItmCode,ItrCode,SimRefNo,sum(Qty) as Qty_sum from (" _
    & "Select PurICode,PurSimCode as SimCode,PurItmCode as ItmCode,PurItrCode as ItrCode,PurSimRefNo as SimRefNo,PurQty as Qty from (PurchDtl" _
    & " inner join PurchHdr on PurchDtl.PurCode = PurchHdr.PuhCode)" _
    & " inner join SaleDtl on PurchDtl.PurICode = SaleDtl.SalPurICode" _
    & " where SalCode = " & CStr(mSalCode) & IIf(IsMissing(mSalICode) = False, " and SalICode=" & CStr(mSalICode), "") _
    & " and PurRecState IN (" & CStr(cREC_ADDED) & "," & CStr(cREC_EDITED) & "," & CStr(cREC_UNCHANGED) & ")" _
    & " Union All " _
    & "Select SalPurICode as PurICode,SalSimCode as SimCode,SalItmCode as ItmCode,SalItrCode as ItrCode,SalSimRefNo as SimRefNo,(SalQty*-1) as Qty from SaleDtl" _
    & " left join SaleHdr on SaleDtl.SalCode=SaleHdr.SahCode" _
    & " where SalCode = " & CStr(mSalCode) & IIf(IsMissing(mSalICode) = False, " and SalICode=" & CStr(mSalICode), "") _
    & " and SalRecState <> " & CStr(cREC_CANCELED) _
    & " Union All " _
    & "Select sal.SalPurICode as PurICode,sal.SalSimCode as SimCode,sal.SalItmCode as ItmCode,sal.SalItrCode as ItrCode,sal.SalSimRefNo as SimRefNo,(sal.SalQty*-1) as Qty from ((SaleDtl" _
    & " left join SaleHdr on SaleDtl.SalCode = SaleHdr.SahCode)" _
    & " inner join SaleDtl sal on SaleDtl.SalPurICode = sal.SalPurICode)" _
    & " left join SaleHdr sah on sal.SalCode = sah.SahCode" _
    & " where SaleDtl.SalCode = " & CStr(mSalCode) & " and sal.SalCode <> " & CStr(mSalCode) & IIf(IsMissing(mSalICode) = False, " and SaleDtl.SalICode = " & CStr(mSalICode) & " and sal.SalICode <> " & CStr(mSalICode), "") _
    & " and sal.SalRecState <> " & CStr(cREC_CANCELED) _
    & ")" _
    & " group by PurICode,SimCode,ItmCode,ItrCode,SimRefNo order by PurICode,SimCode,ItmCode,ItrCode,SimRefNo" _
    & ") as a" _
    & " inner join SubItmMast on a.SimCode = SubItmMast.SimCode" _
    & " where Qty_sum < 0" _
    , dbKgtDatabase, adOpenKeyset, adLockOptimistic
If .EOF = False Then
    ErrorBox "Sale/Purch.Return going Excess for Item " & vbCrLf & .fields("SimName") & " Ref.No." & CStr(.fields("SimRefNo")) & " by Qty " & CStr(.fields("Qty_sum"))
    ChkAnyExcessIsuExist = True
End If
End With
CloseTable tRecset

End Function

Private Sub cmbCRList_GotFocus()
FlashActiveControl cmbCRList, True
End Sub

Private Sub cmbCRList_LostFocus()
FlashActiveControl cmbCRList, False
End Sub

Private Sub cmbPrintDest_GotFocus()
FlashActiveControl cmbPrintDest, True
End Sub

Private Sub cmbPrintDest_LostFocus()
FlashActiveControl cmbPrintDest, False
End Sub

Private Sub cmbPrinterList_GotFocus()
FlashActiveControl cmbPrinterList, True
End Sub

Private Sub cmbPrinterList_LostFocus()
FlashActiveControl cmbPrinterList, False
End Sub

Private Sub mskPrintCopies_GotFocus()
FlashActiveControl mskPrintCopies, True
End Sub

Private Sub mskPrintCopies_LostFocus()
FlashActiveControl mskPrintCopies, False
End Sub

Private Sub mskPrintCopies_Validate(Cancel As Boolean)
mskPrintCopies.Text = Val(mskPrintCopies.Text)
If Val(mskPrintCopies.Text) < 1 Then
    ErrorBox "Invalid Input !!!"
    mskPrintCopies.SetFocus
    Cancel = True
End If

End Sub

Private Sub cmdPrintCRL_GotFocus()
FlashActiveControl cmdPrintCRL, True
End Sub

Private Sub cmdPrintCRL_LostFocus()
FlashActiveControl cmdPrintCRL, False
End Sub

Private Sub cmdPrintCRL_Click()
Dim mSalVchNo As Long

txtVoid.SetFocus
cmdPrintCRL.Enabled = False
If Val(fcmbVtmName.BoundText) < 1 Then
    ErrorBox "Invalid Voucher Type !!!"
    txtVtmName(1).SetFocus
    GoTo EndSub
End If
If Val(UnMyNumFmt(mskSalVchNo(1).Text)) < 1 Then
    ErrorBox "Invalid Voucher No. !!!"
    mskSalVchNo(1).SetFocus
    GoTo EndSub
Else
    mSalVchNo = Val(UnMyNumFmt(mskSalVchNo(1).Text))
    If ChkIsExistVTypeNo(dbKgtDatabase, mTableName:="SaleHdr", mChkFieldName:="SahVchNo", mChkFieldValue:=CStr(mSalVchNo), mVtmFieldName:="SahVtmCode", mVtmFieldValue:=Val(fcmbVtmName.BoundText), mFinYrFieldName:="SahCmpCode", mFinYrFieldValue:=sFinYrCmpCode) = False Then
        ErrorBox "Voucher No. does not Exist !!!"
        mskSalVchNo(1).SetFocus
        GoTo EndSub
    End If
End If
If Val(UnMyNumFmt(mskSalVchNo(2).Text)) < 1 Then
    ErrorBox "Invalid Voucher No. !!!"
    mskSalVchNo(2).SetFocus
    GoTo EndSub
Else
    mSalVchNo = Val(UnMyNumFmt(mskSalVchNo(2).Text))
    If ChkIsExistVTypeNo(dbKgtDatabase, mTableName:="SaleHdr", mChkFieldName:="SahVchNo", mChkFieldValue:=CStr(mSalVchNo), mVtmFieldName:="SahVtmCode", mVtmFieldValue:=Val(fcmbVtmName.BoundText), mFinYrFieldName:="SahCmpCode", mFinYrFieldValue:=sFinYrCmpCode) = False Then
        ErrorBox "Voucher No. does not Exist !!!"
        mskSalVchNo(2).SetFocus
        GoTo EndSub
    End If
End If
If cmbCRList.ListIndex < 0 Then
    ErrorBox "Invalid Print Format Name !!!"
    cmbCRList.SetFocus
    GoTo EndSub
End If
If cmbPrinterList.ListIndex < 0 Then
    ErrorBox "Invalid Print Selection !!!"
    cmbPrinterList.SetFocus
    GoTo EndSub
End If
If Val(mskPrintCopies.Text) < 1 Then
    ErrorBox "Invalid Input !!!"
    mskPrintCopies.SetFocus
    GoTo EndSub
End If
If cmbPrintDest.ListIndex < 0 Then
    ErrorBox "Invalid Print Destination !!!"
    cmbPrintDest.SetFocus
    GoTo EndSub
End If
Call Data_PrintEvent

EndSub:
cmdPrintCRL.Enabled = True
Exit Sub

End Sub

Private Sub Data_PrintEvent()
Dim mFromSalVchNo As Long, mToSalVchNo As Long, mSalVtmCode As Long
Dim fCRView As Form

mFromSalVchNo = Val(UnMyNumFmt(mskSalVchNo(1).Text))
mToSalVchNo = Val(UnMyNumFmt(mskSalVchNo(2).Text))
mSalVtmCode = Val(fcmbVtmName.BoundText)

frmMain.Cryst.Reset
frmMain.Cryst.ReportFileName = Trim(Right(cmbCRList.List(cmbCRList.ListIndex), 100))
frmMain.Cryst.DiscardSavedData = True
frmMain.Cryst.DataFiles(0) = dbComDatabaseFullPath

frmMain.Cryst.SelectionFormula = "{vewSaleTran.SahVchNo} >= " & CStr(mFromSalVchNo) & " and {vewSaleTran.SahVchNo} <= " & CStr(mToSalVchNo) & " and {vewSaleTran.SahVtmCode} = " & CStr(mSalVtmCode) & " and {vewSaleTran.SahCmpCode} = " & CStr(sFinYrCmpCode)
frmMain.Cryst.CopiesToPrinter = Val(mskPrintCopies.Text)
frmMain.Cryst.PrinterName = Trim(Left(cmbPrinterList.List(cmbPrinterList.ListIndex), 100))
frmMain.Cryst.PrinterDriver = Trim(Right(cmbPrinterList.List(cmbPrinterList.ListIndex), 100))
frmMain.Cryst.ReportTitle = MyCompany.mUserName
If cmbPrintDest.ListIndex = 0 Then
    frmMain.Cryst.Destination = crptToPrinter
Else
    frmMain.Cryst.Destination = crptToWindow
    frmMain.Cryst.WindowState = crptMaximized
    frmMain.Cryst.WindowShowExportBtn = True
    frmMain.Cryst.WindowShowPrintBtn = True
    frmMain.Cryst.WindowShowPrintSetupBtn = True
    frmMain.Cryst.WindowShowRefreshBtn = True
    frmMain.Cryst.WindowShowSearchBtn = True
    frmMain.Cryst.WindowShowZoomCtl = True
    
    Set fCRView = New frmCRViewer
    fCRView.WindowState = 2
    fCRView.Height = frmMain.Height
    fCRView.Width = frmMain.Width
    frmMain.Cryst.WindowParentHandle = fCRView.hWnd
    fCRView.Caption = cmbCRList.List(cmbCRList.ListIndex)
End If
txtVoid.SetFocus
Mfgrd1.Enabled = True
frPrintCRList.Visible = False
Mfgrd1.SetFocus

frmMain.Cryst.Action = 1
If cmbPrintDest.ListIndex = 1 Then
    Load fCRView
    fCRView.ZOrder
    fCRView.Show 1
    Set fCRView = Nothing
End If

End Sub

Private Sub Data_PrintDialog(ByVal mCallSource As String)
If mCallSource = "Keydown" Then
    If Mfgrd1.Row < Mfgrd1.Rows - 1 And optDetailed.Value = True And datRecset.BOF = False And datRecset.EOF = False Then
        fcmbVtmName.BoundText = CStr(datRecset.fields("SahVtmCode"))
        txtVtmName(1).Text = fcmbVtmName.Text
        mskSalVchNo(1).Text = datRecset.fields("SahVchNo")
        mskSalVchNo(2).Text = datRecset.fields("SahVchNo")
        ' ----------------
        Call AssignPrintPara
        frPrintCRList.ZOrder
        frPrintCRList.Visible = True
        Mfgrd1.Enabled = False
        cmbPrintDest.SetFocus
    End If
    
ElseIf mCallSource = "SaveEvent" Then
    txtVtmName(1).Text = fcmbVtmName.Text
    mskSalVchNo(1).Text = CStr(Val(UnMyNumFmt(mskSalVchNo(0).Text)))
    mskSalVchNo(2).Text = CStr(Val(UnMyNumFmt(mskSalVchNo(0).Text)))
    ' ----------------
    Call AssignPrintPara
    frPrintCRList.ZOrder
    frPrintCRList.Visible = True
    Mfgrd1.Enabled = False
    cmbPrintDest.SetFocus

End If


End Sub

Private Sub AssignPrintPara()
Dim fhand As Integer, mCRLTitle As String, mCRLFileName As String, mCRLDefault As Boolean, mDefaultCRLIndex As Integer
Dim SaleTranCRLFileFullPath As String

mDefaultCRLIndex = -1
mskPrintCopies.Text = 1

AddPrinterToCombo cmbPrinterList
AddPrintDestToCombo cmbPrintDest

Select Case mFormSysVchType
Case cKGT_VTYPE_WSLSALES
    SaleTranCRLFileFullPath = WslSaleCRLFileFullPath
Case cKGT_VTYPE_SWLSALES
    SaleTranCRLFileFullPath = SwlSaleCRLFileFullPath
Case cKGT_VTYPE_RTLSALES
    SaleTranCRLFileFullPath = RtlSaleCRLFileFullPath
End Select

If Dir(SaleTranCRLFileFullPath) = "" Then
    fhand = FreeFile
    Open SaleTranCRLFileFullPath For Output As #fhand
    Select Case mFormSysVchType
    Case cKGT_VTYPE_WSLSALES
        Write #fhand, "WholeSale Sales", "WslSale.Rpt", True
    Case cKGT_VTYPE_SWLSALES
        Write #fhand, "Semi WholeSale Sales", "SwlSale.Rpt", True
    Case cKGT_VTYPE_RTLSALES
        Write #fhand, "Retail Sales", "RtlSale.Rpt", True
    End Select
    Close #fhand
End If

cmbCRList.Clear
fhand = FreeFile
Open SaleTranCRLFileFullPath For Input As #fhand
Do While EOF(fhand) = False
    Input #fhand, mCRLTitle, mCRLFileName, mCRLDefault
    If Dir(RtlSaleCRLFileFullPath(mFileName:=mCRLFileName)) <> "" Then
        cmbCRList.AddItem mCRLTitle & Space(100) & RtlSaleCRLFileFullPath(mFileName:=mCRLFileName)
        If mCRLDefault = True Then
            mDefaultCRLIndex = cmbCRList.NewIndex
        End If
    End If
Loop
Close #fhand
If cmbCRList.ListCount > 0 Then
    If mDefaultCRLIndex > -1 Then
        cmbCRList.ListIndex = mDefaultCRLIndex
    Else
        cmbCRList.ListIndex = 0
    End If
End If

End Sub

