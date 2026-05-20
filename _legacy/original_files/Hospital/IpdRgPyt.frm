VERSION 5.00
Object = "{5E9E78A0-531B-11CF-91F6-C2863C385E30}#1.0#0"; "MSFLXGRD.OCX"
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form frmIndoorRgPayment 
   Appearance      =   0  'Flat
   BackColor       =   &H80000005&
   ClientHeight    =   10860
   ClientLeft      =   60
   ClientTop       =   60
   ClientWidth     =   14505
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
   ScaleHeight     =   10860
   ScaleWidth      =   14505
   ShowInTaskbar   =   0   'False
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
      TabIndex        =   47
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
      TabIndex        =   46
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
      ItemData        =   "IpdRgPyt.frx":0000
      Left            =   0
      List            =   "IpdRgPyt.frx":000D
      Style           =   1  'Simple Combo
      TabIndex        =   45
      TabStop         =   0   'False
      Text            =   "cmbFormEntryMode"
      Top             =   360
      Width           =   1455
   End
   Begin VB.TextBox txtVoid 
      CausesValidation=   0   'False
      Height          =   375
      Left            =   0
      TabIndex        =   41
      TabStop         =   0   'False
      Text            =   "Void"
      Top             =   9960
      Width           =   375
   End
   Begin MSComctlLib.StatusBar StatusBar1 
      Align           =   2  'Align Bottom
      Height          =   315
      Left            =   0
      TabIndex        =   136
      Top             =   10545
      Width           =   14505
      _ExtentX        =   25585
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
            TextSave        =   "11:36"
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
      TabIndex        =   44
      Top             =   720
      Width           =   13215
      Begin VB.Frame frFooter 
         Appearance      =   0  'Flat
         BackColor       =   &H00D7EBFF&
         ForeColor       =   &H80000008&
         Height          =   1935
         Left            =   120
         TabIndex        =   105
         Top             =   7560
         Width           =   12855
         Begin VB.TextBox txtIpgAdjTranVchr 
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
               Name            =   "Courier New"
               Size            =   9
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   1365
            Left            =   0
            Locked          =   -1  'True
            MultiLine       =   -1  'True
            ScrollBars      =   2  'Vertical
            TabIndex        =   38
            TabStop         =   0   'False
            Text            =   "IpdRgPyt.frx":002D
            Top             =   120
            Width           =   5655
         End
         Begin VB.TextBox txtIpgLinkTranVchr 
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
               Name            =   "Courier New"
               Size            =   9
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   1365
            Left            =   5760
            Locked          =   -1  'True
            MultiLine       =   -1  'True
            ScrollBars      =   2  'Vertical
            TabIndex        =   39
            TabStop         =   0   'False
            Text            =   "IpdRgPyt.frx":0047
            Top             =   120
            Width           =   6975
         End
         Begin VB.Label Label2 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Last Payment:"
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
            TabIndex        =   108
            Top             =   1560
            Width           =   1815
         End
         Begin VB.Label lblOldIgtCodeDesc 
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
            TabIndex        =   107
            Top             =   1560
            Width           =   9015
         End
      End
      Begin VB.Frame frHeader 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         ForeColor       =   &H80000008&
         Height          =   7215
         Left            =   120
         TabIndex        =   77
         Top             =   240
         Width           =   12855
         Begin VB.TextBox mskIgtBalAmt 
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
            TabIndex        =   37
            Text            =   "0.00"
            Top             =   5760
            Width           =   1455
         End
         Begin VB.TextBox mskIgtAdjAmt 
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
            TabIndex        =   36
            Text            =   "0.00"
            Top             =   5400
            Width           =   1455
         End
         Begin VB.TextBox mskIgtDpogAmt 
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
            Left            =   2040
            TabIndex        =   35
            Text            =   "0.00"
            Top             =   5040
            Width           =   1455
         End
         Begin VB.TextBox txtIpgRemark 
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
            Left            =   7440
            MaxLength       =   50
            TabIndex        =   28
            TabStop         =   0   'False
            Top             =   3720
            Width           =   5175
         End
         Begin VB.TextBox txtPttRefRela 
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
            MaxLength       =   10
            TabIndex        =   12
            TabStop         =   0   'False
            Top             =   1440
            Width           =   1215
         End
         Begin VB.TextBox txtPttSex 
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
            MaxLength       =   10
            TabIndex        =   6
            TabStop         =   0   'False
            Top             =   1080
            Width           =   1215
         End
         Begin VB.TextBox mskIgtIpgCode 
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
         Begin VB.TextBox txtIgtTime_str 
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
            Left            =   10200
            MaxLength       =   50
            TabIndex        =   33
            TabStop         =   0   'False
            Text            =   "00:00"
            Top             =   4200
            Width           =   855
         End
         Begin VB.TextBox dtpIgtDate 
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
            Left            =   8040
            MaxLength       =   50
            TabIndex        =   32
            Text            =   "dd/mm/yyyy"
            Top             =   4200
            Width           =   1455
         End
         Begin VB.TextBox mskIgtVchNo 
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
            Left            =   6000
            TabIndex        =   31
            TabStop         =   0   'False
            Text            =   "0"
            Top             =   4200
            Width           =   1335
         End
         Begin VB.TextBox txtIgtVtmName 
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
            TabIndex        =   29
            TabStop         =   0   'False
            Top             =   4200
            Width           =   1815
         End
         Begin VB.TextBox txtIgtPrefix 
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
            Left            =   4800
            TabIndex        =   30
            Tag             =   "AhCode"
            Text            =   "[Prefix]"
            Top             =   4200
            Width           =   1095
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
         Begin VB.TextBox txtPttName 
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
            TabIndex        =   3
            Top             =   720
            Width           =   5295
         End
         Begin VB.TextBox txtPcgName 
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
            TabIndex        =   18
            TabStop         =   0   'False
            Top             =   2160
            Width           =   3735
         End
         Begin VB.TextBox dtpPttRegDate 
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
            Left            =   11160
            MaxLength       =   50
            TabIndex        =   5
            TabStop         =   0   'False
            Text            =   "dd/mm/yyyy"
            Top             =   720
            Width           =   1455
         End
         Begin VB.TextBox mskPttRegNo 
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
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   285
            Left            =   8880
            TabIndex        =   4
            Tag             =   "AhCode"
            Text            =   "0"
            Top             =   720
            Width           =   1455
         End
         Begin VB.TextBox txtPttRefName 
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
            Left            =   3360
            MaxLength       =   50
            TabIndex        =   13
            TabStop         =   0   'False
            Top             =   1440
            Width           =   3975
         End
         Begin VB.TextBox txtPttAddr 
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
            MaxLength       =   250
            TabIndex        =   15
            TabStop         =   0   'False
            Top             =   1800
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
            TabIndex        =   17
            TabStop         =   0   'False
            Top             =   2160
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
            Left            =   2040
            MaxLength       =   50
            TabIndex        =   19
            TabStop         =   0   'False
            Top             =   2520
            Width           =   5295
         End
         Begin VB.TextBox txtPttTelNo 
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
            TabIndex        =   14
            TabStop         =   0   'False
            Top             =   1440
            Width           =   3735
         End
         Begin VB.TextBox txtPttSMSNo 
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
            TabIndex        =   16
            TabStop         =   0   'False
            Top             =   1800
            Width           =   3735
         End
         Begin VB.TextBox mskPttAgeYr 
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
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   285
            Left            =   5280
            TabIndex        =   7
            TabStop         =   0   'False
            Text            =   "0"
            Top             =   1080
            Width           =   735
         End
         Begin VB.TextBox mskPttAgeMn 
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
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   285
            Left            =   6000
            TabIndex        =   8
            TabStop         =   0   'False
            Tag             =   "AhCode"
            Text            =   "0"
            Top             =   1080
            Width           =   615
         End
         Begin VB.TextBox mskPttAgeDy 
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
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   285
            Left            =   6600
            TabIndex        =   9
            TabStop         =   0   'False
            Tag             =   "AhCode"
            Text            =   "0"
            Top             =   1080
            Width           =   735
         End
         Begin VB.TextBox dtpPttDob 
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
            Left            =   11160
            MaxLength       =   50
            TabIndex        =   11
            TabStop         =   0   'False
            Text            =   "dd/mm/yyyy"
            Top             =   1080
            Width           =   1455
         End
         Begin VB.TextBox dtpPttAgeAsOnDt 
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
            TabIndex        =   10
            TabStop         =   0   'False
            Text            =   "dd/mm/yyyy"
            Top             =   1080
            Width           =   1455
         End
         Begin VB.TextBox txtIpgVtmName 
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
            TabIndex        =   20
            Top             =   3000
            Width           =   1815
         End
         Begin VB.TextBox mskIpgVchNo 
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
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   285
            Left            =   6000
            TabIndex        =   22
            Text            =   "0"
            Top             =   3000
            Width           =   1335
         End
         Begin VB.TextBox txtIpgPrefix 
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
            Left            =   4800
            TabIndex        =   21
            TabStop         =   0   'False
            Tag             =   "AhCode"
            Text            =   "[Prefix]"
            Top             =   3000
            Width           =   1095
         End
         Begin VB.TextBox dtpIpgDate 
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
            MaxLength       =   50
            TabIndex        =   23
            TabStop         =   0   'False
            Text            =   "dd/mm/yyyy"
            Top             =   3000
            Width           =   1455
         End
         Begin VB.TextBox txtIpgTime_str 
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
            Left            =   10200
            MaxLength       =   50
            TabIndex        =   24
            TabStop         =   0   'False
            Text            =   "00:00"
            Top             =   3000
            Width           =   855
         End
         Begin VB.TextBox txtCDctName 
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
            TabIndex        =   25
            TabStop         =   0   'False
            Top             =   3360
            Width           =   3975
         End
         Begin VB.TextBox txtRByName 
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
            Left            =   7440
            MaxLength       =   50
            TabIndex        =   26
            TabStop         =   0   'False
            Top             =   3360
            Width           =   5175
         End
         Begin VB.TextBox txtFDigName 
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
            TabIndex        =   27
            TabStop         =   0   'False
            Top             =   3720
            Width           =   3975
         End
         Begin VB.TextBox mskIgtPttCode 
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
            Left            =   5160
            TabIndex        =   2
            Tag             =   "AhCode"
            Text            =   "-1"
            Top             =   240
            Width           =   1455
         End
         Begin VB.TextBox txtIgtRemark 
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
            TabIndex        =   34
            Top             =   4560
            Width           =   5295
         End
         Begin VB.Label Label2 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Balance:"
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
            Index           =   44
            Left            =   120
            TabIndex        =   135
            Top             =   5760
            Width           =   1935
         End
         Begin VB.Label Label2 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Adjusted:"
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
            Index           =   30
            Left            =   120
            TabIndex        =   134
            Top             =   5400
            Width           =   1935
         End
         Begin VB.Label lblRefdTot 
            Alignment       =   1  'Right Justify
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
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
            Left            =   8760
            TabIndex        =   133
            Top             =   6480
            Width           =   1455
         End
         Begin VB.Label lblPymtTot 
            Alignment       =   1  'Right Justify
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
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
            Left            =   5640
            TabIndex        =   132
            Top             =   6480
            Width           =   1455
         End
         Begin VB.Label lblIgfRfugAmtTot 
            Alignment       =   1  'Right Justify
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
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
            Left            =   8760
            TabIndex        =   131
            Top             =   5760
            Width           =   1455
         End
         Begin VB.Label lblIgtDpogAmtTot 
            Alignment       =   1  'Right Justify
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
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
            Left            =   5640
            TabIndex        =   130
            Top             =   5760
            Width           =   1455
         End
         Begin VB.Label lblIrcBalAmtTot 
            Alignment       =   1  'Right Justify
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
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
            Left            =   11280
            TabIndex        =   129
            Top             =   5400
            Width           =   1455
         End
         Begin VB.Label lblIrcRecdAmtTot 
            Alignment       =   1  'Right Justify
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
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
            Left            =   8760
            TabIndex        =   128
            Top             =   5400
            Width           =   1455
         End
         Begin VB.Label lblIrcAmtAftDiscTot 
            Alignment       =   1  'Right Justify
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
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
            Left            =   5640
            TabIndex        =   127
            Top             =   5400
            Width           =   1455
         End
         Begin VB.Label Label2 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Due Amt:"
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
            Index           =   43
            Left            =   10320
            TabIndex        =   126
            Top             =   5400
            Width           =   1215
         End
         Begin VB.Label Label2 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Received Amt:"
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
            Index           =   42
            Left            =   7200
            TabIndex        =   125
            Top             =   5400
            Width           =   1575
         End
         Begin VB.Label Label2 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Total Receipt Amt:"
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
            Index           =   41
            Left            =   3840
            TabIndex        =   124
            Top             =   5400
            Width           =   1815
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
            Index           =   40
            Left            =   120
            TabIndex        =   123
            Top             =   5040
            Width           =   1935
         End
         Begin VB.Label Label2 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Balance Amt:"
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
            Index           =   35
            Left            =   3840
            TabIndex        =   122
            Top             =   6840
            Width           =   1815
         End
         Begin VB.Label Label2 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Total Refunds:"
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
            Index           =   32
            Left            =   7200
            TabIndex        =   121
            Top             =   6480
            Width           =   1575
         End
         Begin VB.Label Label2 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Total Payments:"
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
            Index           =   31
            Left            =   3840
            TabIndex        =   120
            Top             =   6480
            Width           =   1815
         End
         Begin VB.Label Label2 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "On A/c Refunds:"
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
            Index           =   29
            Left            =   7200
            TabIndex        =   119
            Top             =   5760
            Width           =   1575
         End
         Begin VB.Label Label2 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "On A/c Payments:"
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
            Index           =   28
            Left            =   3840
            TabIndex        =   118
            Top             =   5760
            Width           =   1815
         End
         Begin VB.Label Label2 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Final Refunds:"
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
            Index           =   27
            Left            =   7200
            TabIndex        =   117
            Top             =   6120
            Width           =   1575
         End
         Begin VB.Label Label2 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Final Payments:"
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
            Index           =   26
            Left            =   3840
            TabIndex        =   116
            Top             =   6120
            Width           =   1815
         End
         Begin VB.Label Label2 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Advance Amt:"
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
            Index           =   21
            Left            =   7200
            TabIndex        =   115
            Top             =   5040
            Width           =   1575
         End
         Begin VB.Label Label2 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Total Bill Amt:"
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
            Index           =   15
            Left            =   3840
            TabIndex        =   114
            Top             =   5040
            Width           =   1815
         End
         Begin VB.Label lblIblAmtAftDiscTot 
            Alignment       =   1  'Right Justify
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
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
            Left            =   5640
            TabIndex        =   113
            Top             =   5040
            Width           =   1455
         End
         Begin VB.Label lblIbpyDepoAmtTot 
            Alignment       =   1  'Right Justify
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
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
            Left            =   5640
            TabIndex        =   112
            Top             =   6120
            Width           =   1455
         End
         Begin VB.Label lblBalAmtTot 
            Alignment       =   1  'Right Justify
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
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
            Left            =   5640
            TabIndex        =   111
            Top             =   6840
            Width           =   1455
         End
         Begin VB.Label lblIpgAdvAmtTot 
            Alignment       =   1  'Right Justify
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
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
            Left            =   8760
            TabIndex        =   110
            Top             =   5040
            Width           =   1455
         End
         Begin VB.Label lblIbfdRefuAmtTot 
            Alignment       =   1  'Right Justify
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
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
            Left            =   8760
            TabIndex        =   109
            Top             =   6120
            Width           =   1455
         End
         Begin VB.Shape Shape1 
            BackColor       =   &H00C0E0FF&
            BackStyle       =   1  'Opaque
            Height          =   2295
            Index           =   3
            Left            =   0
            Top             =   4920
            Width           =   12855
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
            Index           =   13
            Left            =   6120
            TabIndex        =   106
            Top             =   3720
            Width           =   1095
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
            Left            =   7440
            TabIndex        =   104
            Top             =   4200
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
            Left            =   9600
            TabIndex        =   103
            Top             =   4200
            Width           =   495
         End
         Begin VB.Label Label2 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Pymt.No:"
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
            Left            =   3960
            TabIndex        =   102
            Top             =   4200
            Width           =   855
         End
         Begin VB.Label Label2 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Payment Type:"
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
            Index           =   36
            Left            =   120
            TabIndex        =   101
            Top             =   4200
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
            TabIndex        =   100
            Top             =   240
            Width           =   1935
         End
         Begin VB.Label Label2 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Patient Name:"
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
            TabIndex        =   99
            Top             =   720
            Width           =   1935
         End
         Begin VB.Label Label2 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Category:"
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
            Left            =   7440
            TabIndex        =   98
            Top             =   2160
            Width           =   1455
         End
         Begin VB.Label Label2 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Care of:"
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
            TabIndex        =   97
            Top             =   1440
            Width           =   1935
         End
         Begin VB.Line Line3 
            Index           =   1
            X1              =   0
            X2              =   12240
            Y1              =   600
            Y2              =   600
         End
         Begin VB.Label Label2 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Reg.No.:"
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
            Left            =   7440
            TabIndex        =   96
            Top             =   720
            Width           =   1575
         End
         Begin VB.Label Label2 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Reg.Dt:"
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
            Left            =   10440
            TabIndex        =   95
            Top             =   720
            Width           =   735
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
            TabIndex        =   94
            Top             =   1800
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
            TabIndex        =   93
            Top             =   2160
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
            Left            =   120
            TabIndex        =   92
            Top             =   2520
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
            TabIndex        =   91
            Top             =   1440
            Width           =   1455
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
            TabIndex        =   90
            Top             =   1800
            Width           =   1575
         End
         Begin VB.Label Label2 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Age (Yrs/Mn/Dys):"
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
            Index           =   16
            Left            =   3360
            TabIndex        =   89
            Top             =   1080
            Width           =   1935
         End
         Begin VB.Label Label2 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "DOB:"
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
            Index           =   17
            Left            =   10680
            TabIndex        =   88
            Top             =   1080
            Width           =   495
         End
         Begin VB.Label Label2 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "As On:"
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
            Index           =   18
            Left            =   7440
            TabIndex        =   87
            Top             =   1080
            Width           =   615
         End
         Begin VB.Label Label2 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "IPD Type:"
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
            TabIndex        =   86
            Top             =   3000
            Width           =   1935
         End
         Begin VB.Label Label2 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Ipd No:"
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
            Index           =   19
            Left            =   3960
            TabIndex        =   85
            Top             =   3000
            Width           =   855
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
            Index           =   20
            Left            =   7440
            TabIndex        =   84
            Top             =   3000
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
            Index           =   22
            Left            =   9600
            TabIndex        =   83
            Top             =   3000
            Width           =   495
         End
         Begin VB.Label Label2 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Consulting Doctor:"
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
            Index           =   23
            Left            =   120
            TabIndex        =   82
            Top             =   3360
            Width           =   1935
         End
         Begin VB.Label Label2 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Ref.By:"
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
            Index           =   24
            Left            =   6120
            TabIndex        =   81
            Top             =   3360
            Width           =   1095
         End
         Begin VB.Label Label2 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Final Diagnosis:"
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
            Index           =   25
            Left            =   120
            TabIndex        =   80
            Top             =   3720
            Width           =   1935
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
            Left            =   120
            TabIndex        =   79
            Top             =   4560
            Width           =   1935
         End
         Begin VB.Label Label2 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Sex:"
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
            Index           =   34
            Left            =   120
            TabIndex        =   78
            Top             =   1080
            Width           =   1935
         End
         Begin VB.Shape Shape1 
            BackColor       =   &H00FFD7B7&
            BackStyle       =   1  'Opaque
            Height          =   2775
            Index           =   0
            Left            =   0
            Top             =   120
            Width           =   12855
         End
         Begin VB.Shape Shape1 
            BackColor       =   &H00FFFFC0&
            BackStyle       =   1  'Opaque
            Height          =   1215
            Index           =   1
            Left            =   0
            Top             =   2880
            Width           =   12855
         End
         Begin VB.Shape Shape1 
            BackColor       =   &H00FFFF80&
            BackStyle       =   1  'Opaque
            Height          =   855
            Index           =   2
            Left            =   0
            Top             =   4080
            Width           =   12855
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
         Left            =   12840
         Style           =   1  'Graphical
         TabIndex        =   40
         Top             =   9240
         Width           =   375
      End
      Begin VB.Label Label2 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Current Balance:"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   -1  'True
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   255
         Index           =   2
         Left            =   8400
         TabIndex        =   48
         Top             =   8640
         Width           =   1575
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
      TabIndex        =   43
      Top             =   720
      Width           =   14175
      Begin VB.Frame frPrintCRList 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         ForeColor       =   &H80000008&
         Height          =   3615
         Left            =   3480
         TabIndex        =   137
         Top             =   1200
         Width           =   5895
         Begin VB.ComboBox cmbPrinterList 
            Height          =   315
            Left            =   2160
            Style           =   2  'Dropdown List
            TabIndex        =   66
            Top             =   1680
            Width           =   3495
         End
         Begin VB.ComboBox cmbPrintDest 
            Height          =   315
            Left            =   2160
            Style           =   2  'Dropdown List
            TabIndex        =   68
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
            TabIndex        =   67
            Text            =   "0"
            Top             =   2040
            Width           =   1455
         End
         Begin VB.ComboBox cmbCRList 
            Height          =   315
            Left            =   2160
            Style           =   2  'Dropdown List
            TabIndex        =   65
            Top             =   1320
            Width           =   3495
         End
         Begin VB.TextBox mskIgtVchNo 
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
            TabIndex        =   64
            Tag             =   "AhCode"
            Text            =   "0"
            Top             =   960
            Width           =   1455
         End
         Begin VB.TextBox txtIgtVtmName 
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
            TabIndex        =   62
            Top             =   600
            Width           =   3495
         End
         Begin VB.TextBox mskIgtVchNo 
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
            TabIndex        =   63
            Tag             =   "AhCode"
            Text            =   "0"
            Top             =   960
            Width           =   1455
         End
         Begin VB.CommandButton cmdPrintCRL 
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
            Left            =   2520
            TabIndex        =   69
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
            Index           =   12
            Left            =   120
            TabIndex        =   145
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
            Index           =   11
            Left            =   120
            TabIndex        =   144
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
            Index           =   10
            Left            =   120
            TabIndex        =   143
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
            Index           =   9
            Left            =   120
            TabIndex        =   142
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
            Index           =   8
            Left            =   3720
            TabIndex        =   141
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
            Index           =   7
            Left            =   120
            TabIndex        =   140
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
            Index           =   6
            Left            =   120
            TabIndex        =   139
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
            Index           =   45
            Left            =   0
            TabIndex        =   138
            Top             =   0
            Width           =   5895
         End
      End
      Begin VB.Frame frConfigure 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         ForeColor       =   &H80000008&
         Height          =   4935
         Left            =   3000
         TabIndex        =   71
         Top             =   720
         Width           =   6735
         Begin VB.TextBox mskQryPttRegNo 
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
            Left            =   1680
            TabIndex        =   54
            Text            =   "0"
            Top             =   1080
            Width           =   1455
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
            TabIndex        =   61
            Top             =   4320
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
            Height          =   2295
            Left            =   2160
            TabIndex        =   56
            Top             =   1800
            Width           =   2655
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
               TabIndex        =   57
               Top             =   360
               Value           =   -1  'True
               Width           =   2055
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
               TabIndex        =   58
               Top             =   840
               Width           =   2055
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
               TabIndex        =   59
               Top             =   1320
               Width           =   2055
            End
            Begin VB.OptionButton optPatientwise 
               Appearance      =   0  'Flat
               BackColor       =   &H80000005&
               Caption         =   "Patient-wise"
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
               TabIndex        =   60
               Top             =   1800
               Width           =   2055
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
            Left            =   4680
            TabIndex        =   53
            Tag             =   "AhCode"
            Text            =   "dd/mm/yyyy"
            Top             =   720
            Width           =   1455
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
            TabIndex        =   52
            Tag             =   "AhCode"
            Text            =   "dd/mm/yyyy"
            Top             =   720
            Width           =   1455
         End
         Begin VB.TextBox txtQryPttName 
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
            TabIndex        =   55
            Top             =   1440
            Width           =   4455
         End
         Begin VB.Label Label1 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Patient Reg.No:"
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
            TabIndex        =   76
            Top             =   1080
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
            Left            =   3720
            TabIndex        =   75
            Top             =   720
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
            TabIndex        =   74
            Top             =   720
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
            TabIndex        =   73
            Top             =   0
            Width           =   6735
         End
         Begin VB.Label Label1 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Patient Name:"
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
            TabIndex        =   72
            Top             =   1440
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
         TabIndex        =   51
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
         TabIndex        =   49
         Top             =   360
         Width           =   4215
      End
      Begin MSFlexGridLib.MSFlexGrid Mfgrd1 
         Height          =   6495
         Left            =   120
         TabIndex        =   50
         Top             =   720
         Width           =   13815
         _ExtentX        =   24368
         _ExtentY        =   11456
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
         TabIndex        =   70
         Top             =   360
         Width           =   735
      End
   End
   Begin VB.Label lblFormHeading 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00E0E0E0&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Indoor Advance Payments"
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
      TabIndex        =   42
      Top             =   0
      Width           =   9015
   End
End
Attribute VB_Name = "frmIndoorRgPayment"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Option Explicit

Dim mFormLoaded As Boolean, mLastKeyPressed As Integer, mMaskKeyPressed As Integer
Dim mFormUIdCode As Long, mFormUIdFileName As String, mFormAcsPermFileName As String
Dim mIgtCode As Long, mIgtIpgCode As Long, mIgtPttCode As Long, mQryPttCode As Long, mIgtOldIgtCode As Long, dtlAddEditMode As Boolean, dtlAddMode As Boolean, dtlEditCanceled As Boolean
Dim mRemoteAccess As Boolean, mEntrySaved As Boolean, mEntryAborted As Boolean
Dim dbAcDatabase As New ADODB.Connection, dbHmsDatabase As New ADODB.Connection, dbGrpDatabase As New ADODB.Connection, dbComDatabase As New ADODB.Connection
Dim datRecset As New ADODB.Recordset
Dim mPttRegNo_old As Long
Dim mIgtCode_old As Long, mIgtDate_old As Date, mIgtVtmCode_old As Long, mIgtVchNo_old As Long
Dim mIblCode_old As Long, mIgtDpogAmt_old As Double, mIgtAdjAmt_old As Double
Dim clsJRN As clsJournal, clsAH As clsAccountHead, clsIPG As clsHmsSnglTranEntry, clsIGT As clsHmsSnglTranEntry, clsARA As clsComMastEntry, clsSTN As clsComMastEntry, clsVTM As clsComMastEntry, clsHOPT As clsHmsIpdOptionsEntry          ' clsIBL As clsHmsIpdMultiTranEntry,
Dim clsPAT As clsHmsMasterEntry, clsPCG As clsHmsMasterEntry, clsDCT As clsHmsMasterEntry, clsDIG As clsHmsMasterEntry, clsSRV As clsHmsMasterEntry
Dim mActiveControl As Object, clsListStru As clsSelectQueryStructure
Dim fcmbIgtVtmName As clsComFlexSearch
Dim fcmbAdmIpgByIpgNo As clsHmsFlexSearch, fcmbAdmIpgByPttRegNo As clsHmsFlexSearch, fcmbAdmIpgByPttName As clsHmsFlexSearch, fcmbPttName As clsHmsFlexSearch, fcmbPttRegNo As clsHmsFlexSearch             ' , fcmbIblVchNo As clsHmsFlexSearch

Private Type SmryPara
mIndex() As Variant
mFromDate() As Variant
mToDate() As Variant
mPttRegNo() As Variant
mPttCode() As Variant
mDetailed() As Variant
mMonthwise() As Variant
mDatewise() As Variant
mPatwise() As Variant
mRowIndex() As Variant

End Type

Dim SmryParaLayer As SmryPara

Rem deposited amount column definitions
''Const X2IBPYICODE_COL = 0
''Const X2IBPYSNO_COL = 1
''Const X2IBLVCHNO_COL = 2
''Const X2IBLVTMNAME_COL = 3
''Const X2IBLDATE_COL = 4
''Const X2IBLAMTAFTDISC_COL = 5
''Const X2IBLADVAMT_COL = 6
''Const X2IBLDEPOAMTEXCL_COL = 7
''Const X2IBPYDEPOAMT_COL = 8
''Const X2IBLREFUAMT_COL = 9
''Const X2IBLBALAMT_COL = 10
''Const X2IBLCODE_COL = 11
''Const X2IBPYRECSTATE_COL = 12
''Const MFGRD2_COLS = 13

Private Sub ClearSmryParaLayer()

With SmryParaLayer
.mIndex = Array()
.mFromDate = Array()
.mToDate = Array()
.mPttRegNo = Array()
.mPttCode = Array()
.mDetailed = Array()
.mMonthwise = Array()
.mDatewise = Array()
.mPatwise = Array()
.mRowIndex = Array()
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
    ReDim Preserve .mPttRegNo(mIndex)
    ReDim Preserve .mPttCode(mIndex)
    ReDim Preserve .mDetailed(mIndex)
    ReDim Preserve .mMonthwise(mIndex)
    ReDim Preserve .mDatewise(mIndex)
    ReDim Preserve .mPatwise(mIndex)
    ReDim Preserve .mRowIndex(mIndex)
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
ReDim Preserve .mPttRegNo(mIndex)
ReDim Preserve .mPttCode(mIndex)
ReDim Preserve .mDetailed(mIndex)
ReDim Preserve .mMonthwise(mIndex)
ReDim Preserve .mDatewise(mIndex)
ReDim Preserve .mPatwise(mIndex)
ReDim Preserve .mRowIndex(mIndex)
' -----------------------
.mIndex(mIndex) = mIndex
.mFromDate(mIndex) = Ctod(dtpFromDate.Text)
.mToDate(mIndex) = Ctod(dtpToDate.Text)
    fcmbPttRegNo.BoundText = CStr(mQryPttCode)
    fcmbPttName.BoundText = CStr(mQryPttCode)
.mPttRegNo(mIndex) = Val(fcmbPttRegNo.Text)
.mPttCode(mIndex) = Val(fcmbPttName.BoundText)
.mDetailed(mIndex) = optDetailed.Value
.mMonthwise(mIndex) = optMonthwise.Value
.mDatewise(mIndex) = optDatewise.Value
.mPatwise(mIndex) = optPatientwise.Value
.mRowIndex(mIndex) = -1

End With

End Sub

Private Sub RestoreDefaultSmryPara()

dtpFromDate.Text = Dtoc(DefaultEntryDate)
dtpToDate.Text = Dtoc(DefaultEntryDate)
mQryPttCode = 0
mskQryPttRegNo.Text = "": fcmbPttRegNo.BoundText = ""
txtQryPttName.Text = "": fcmbPttName.BoundText = ""
optDetailed.Value = True
optMonthwise.Value = False
optDatewise.Value = False
optPatientwise.Value = False
' ----------
AddSmryParaLayer mClear:=True

End Sub

Private Sub RestoreRecentSmryPara()
Dim mIndex As Integer

With SmryParaLayer
mIndex = UBound(.mIndex)
dtpFromDate.Text = Dtoc(.mFromDate(mIndex))
dtpToDate.Text = Dtoc(.mToDate(mIndex))
    mQryPttCode = .mPttCode(mIndex)
fcmbPttRegNo.BoundText = CStr(mQryPttCode): mskQryPttRegNo.Text = fcmbPttRegNo.Text
fcmbPttName.BoundText = CStr(mQryPttCode): txtQryPttName.Text = fcmbPttName.Text
optDetailed.Value = .mDetailed(mIndex)
optMonthwise.Value = .mMonthwise(mIndex)
optDatewise.Value = .mDatewise(mIndex)
optPatientwise.Value = .mPatwise(mIndex)
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

Public Property Let RemoteAccessCode(ByVal mAccessCode As Long)
mRemoteAccess = True
mIgtCode = mAccessCode
End Property

Public Property Get EntryBoundCode() As Long
EntryBoundCode = Val(mskFormBoundField.Text)
End Property

Public Property Get EntryDate() As Date
EntryDate = Ctod(dtpIgtDate.Text)
End Property

Public Property Get EntryType() As String
EntryType = "Igt"
End Property

Public Property Get EntryVtmCode() As Integer
EntryVtmCode = Val(fcmbIgtVtmName.BoundText)
End Property

Public Property Get EntrySaved() As Boolean
EntrySaved = mEntrySaved
End Property

Public Property Get EntryAborted() As Boolean
EntryAborted = mEntryAborted
End Property

Public Property Get PttName() As String
PttName = txtPttName.Text
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

Private Sub cmdConfigure_Click()
If Between(Ctod(dtpFromDate.Text), sFinYrStartDate, sFinYrEndDate) = False Then
    ErrorBox "Invalid Date Range !!!"
    'dtpFromDate.SetFocus
    'Exit Sub
End If
If Between(Ctod(dtpToDate.Text), sFinYrStartDate, sFinYrEndDate) = False Then
    ErrorBox "Invalid Date Range !!!"
    'dtpToDate.SetFocus
    'Exit Sub
End If
If UBound(SmryParaLayer.mIndex) >= LBound(SmryParaLayer.mIndex) Then
    SmryParaLayer.mRowIndex(UBound(SmryParaLayer.mIndex)) = Mfgrd1.Row
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

Private Sub cmdConfigure_GotFocus()
FlashActiveControl cmdConfigure, True
End Sub

Private Sub cmdConfigure_LostFocus()
FlashActiveControl cmdConfigure, False
End Sub

Private Sub cmdFormEnter_Click()
mLastKeyPressed = 13
If TypeOf Screen.ActiveControl Is MSFlexGrid Then
    If Screen.ActiveControl.Name = Mfgrd1.Name Then
        With datRecset
        If .EOF = False And .BOF = False Then
            If optDetailed.Value = True Then
                Call Data_EditEvent
            Else
                fcmbPttRegNo.BoundText = CStr(mQryPttCode)
                fcmbPttName.BoundText = CStr(mQryPttCode)

                txtVoid.SetFocus
                If optMonthwise.Value = True Then
                    dtpFromDate.Text = Dtoc(MonthStartDate(DateSerial(Val(Left(.fields("IgtYrMonth"), 4)), Val(Right(.fields("IgtYrMonth"), 2)), 1)))
                    dtpToDate.Text = Dtoc(MonthEndDate(DateSerial(Val(Left(.fields("IgtYrMonth"), 4)), Val(Right(.fields("IgtYrMonth"), 2)), 1)))
                    optMonthwise.Value = False
                    optDatewise.Value = True
                ElseIf optDatewise.Value = True Then
                    dtpFromDate.Text = Dtoc(.fields("IgtDate"))
                    dtpToDate.Text = Dtoc(.fields("IgtDate"))
                    optDatewise.Value = False
                    optDetailed.Value = True
                ElseIf optPatientwise.Value = True Then
                    Call ChkPttNameListFirstTime
                    Call ChkPttRegNoListFirstTime
                    
                    mQryPttCode = .fields("IgtPttCode")
                    fcmbPttRegNo.BoundText = CStr(mQryPttCode)
                    fcmbPttName.BoundText = CStr(mQryPttCode)
                    mskQryPttRegNo.Text = fcmbPttRegNo.Text
                    txtQryPttName.Text = fcmbPttName.Text
                    optPatientwise.Value = False
                    optDatewise.Value = True
                End If
                If UBound(SmryParaLayer.mIndex) >= LBound(SmryParaLayer.mIndex) Then
                    SmryParaLayer.mRowIndex(UBound(SmryParaLayer.mIndex)) = Mfgrd1.Row
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
''    ElseIf Screen.ActiveControl.Name = Mfgrd2.Name Then
''        Mfgrd2_KeyPress vbKeyReturn
    End If
ElseIf FormAddEditMode = cFORM_SMRYMODE And frConfigure.Visible = False And frPrintCRList.Visible = False Then

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
            
            srow = SmryParaLayer.mRowIndex(UBound(SmryParaLayer.mIndex))
            If Mfgrd1.Rows - 1 > srow And srow > 0 Then
                Mfgrd1.Row = srow
            Else
                MoveRecToLast datRecset
                ShowRecActiveFlexRow datRecset, Mfgrd1
            End If
            Mfgrd1.SetFocus
        Else
            Unload Me
        End If
    End If
''ElseIf dtlAddEditMode = True Then
''    dtlEditCanceled = True
''    Call cmdOK_Click
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
        txtPttName.SetFocus
    End If
End If

End Sub

''Private Sub cmdOK_Click()
''Dim tRecset As New ADODB.Recordset, srow As Integer, mIgtSno As Integer, mIgtICode As Long
''
''srow = Mfgrd2.Row
''mIgtSno = Val(Mfgrd2.TextMatrix(srow, X2IBPYSNO_COL))
''mIgtICode = Val(Mfgrd2.TextMatrix(srow, X2IBPYICODE_COL))
''
''If cmdOK.Caption = "&OK" And dtlEditCanceled = False Then
''    With clsIGT
''    If dtlAddMode = True Then
''        .ClearDtl
''    Else
''        .GetDtlData mIgtCode, mIgtICode
''    End If
''    .mTrnCode_lng = mIgtCode
''    .mTrnDtlSno_int = Val(UnMyNumFmt(mskIgtSno.Text))
''    .mTrnDate_dt = Ctod(dtpIgtDate.Text)
''    .mTrnCmpCode_int = sFinYrCmpCode
''
''    .mIgtPttCode_lng = mIgtPttCode
''    .mIgtIbhCode_lng = Val(fcmbIblVchNo.BoundText)
''    .mIgtDpogAmt_dbl = Val(UnMyNumFmt(mskIgtDpogAmt.Text))
''    .mIgtRemark_str = ""
''
''    If dtlAddMode = True Then
''        .AddNewDtl mIgtCode
''        mIgtICode = .mTrnDtlICode_lng
''    Else
''        .UpdateDtl mIgtCode, mIgtICode
''    End If
''    End With
''
''    RefreshDatabase dbHmsDatabase
''    With tRecset
''    .Open "Select * from IndrRgPymtDtl where IgtCode=" & CStr(mIgtCode) & " and IgtICode=" & CStr(mIgtICode) & "", dbHmsDatabase, adOpenKeyset, adLockOptimistic
''
''    clsIBL.GetHdrData .fields("IgtIbhCode")
''    clsVTM.GetData clsIBL.mTrnVtmCode_lng
''
''    Mfgrd2.TextMatrix(srow, X2IBPYICODE_COL) = .fields("IgtICode")
''    Mfgrd2.TextMatrix(srow, X2IBPYSNO_COL) = ToMyNumFmt(.fields("IgtSno"), mDecimals:=0)
''    Mfgrd2.TextMatrix(srow, X2IBLVCHNO_COL) = clsIBL.mTrnVchNo_lng
''    Mfgrd2.TextMatrix(srow, X2IBLVTMNAME_COL) = clsVTM.mName_str
''    Mfgrd2.TextMatrix(srow, X2IBLDATE_COL) = clsIBL.mTrnDate_dt
''    Mfgrd2.TextMatrix(srow, X2IBLAMTAFTDISC_COL) = ToMyNumFmt(clsIBL.mIbhAmtAftDisc_dbl)
''    Mfgrd2.TextMatrix(srow, X2IBLADVAMT_COL) = ToMyNumFmt(clsIBL.mIbhAdvAmt_dbl)
''    Mfgrd2.TextMatrix(srow, X2IBLDEPOAMTEXCL_COL) = ToMyNumFmt(clsIBL.mIbhDepoAmt_dbl - .fields("IgtDpogAmt"))
''    Mfgrd2.TextMatrix(srow, X2IBPYDEPOAMT_COL) = ToMyNumFmt(.fields("IgtDpogAmt"))
''    Mfgrd2.TextMatrix(srow, X2IBLREFUAMT_COL) = ToMyNumFmt(clsIBL.mIbhRefuAmt_dbl)
''    Mfgrd2.TextMatrix(srow, X2IBLBALAMT_COL) = ToMyNumFmt(clsIBL.mIbhBalAmt_dbl)
''    Mfgrd2.TextMatrix(srow, X2IBLCODE_COL) = .fields("IgtIbhCode")
''    Mfgrd2.TextMatrix(srow, X2IBPYRECSTATE_COL) = .fields("IgtRecState")
''
''    End With
''    CloseTable tRecset
''
''    If dtlAddMode = True Then
''        Mfgrd2.Rows = Mfgrd2.Rows + 1
''    End If
''    srow = srow + 1
''    Mfgrd2.Row = srow
''
''    Call CalcFtrTotal
''End If
''dtlAddEditMode = False
''dtlAddMode = False
''dtlEditCanceled = False
''VisibleControls False
''txtVoid.SetFocus
''Mfgrd2.SetFocus
''CloseTable tRecset, mCheckOpen:=True
''
''End Sub

Private Sub cmdSaveForm_Click()
txtVoid.SetFocus
Call Data_SaveEvent
Call SmryList

If optDetailed.Value = True Then
    txtSearch1Text_InterActiveChange Format(Ctod(dtpIgtDate.Text), "yyyymmdd") + Format(mIgtCode, "0000000")
ElseIf optMonthwise.Value = True Then
    txtSearch1Text_InterActiveChange Format(Ctod(dtpIgtDate.Text), "yyyy") & "/" & Format(Ctod(dtpIgtDate.Text), "mm")
ElseIf optDatewise.Value = True Then
    txtSearch1Text_InterActiveChange Format(Ctod(dtpIgtDate.Text), "yyyymmdd")
ElseIf optPatientwise.Value = True Then
    txtSearch1Text_InterActiveChange txtPttName.Text
End If

Call ShowEntryMode(False)
Mfgrd1.SetFocus

End Sub

Private Sub cmdSaveForm_GotFocus()
Dim mIblAcsPermNo As Integer, mRetryCount As Integer

txtVoid.SetFocus
cmdSaveForm.Enabled = False
If Data_Verify() = True Then
    If CanAccept() = True Then
        If GetAccessPerm(mIblAcsPermNo, mRetryCount, mFormAcsPermFileName) = True And mRetryCount = 0 Then
            If Data_NetwAuth() = True Then
                Call cmdSaveForm_Click
                Close #mIblAcsPermNo
                If mRemoteAccess = True Then
                    ''Unload Me
                    Me.Hide
                    Exit Sub
                Else
                    Call Mfgrd1_RowColChange
                    Data_PrintDialog "SaveEvent"
                End If
            Else
                Close #mIblAcsPermNo
            End If
        Else
            Close #mIblAcsPermNo
            AlertBox "System Busy, Try Again !!!"
            
            txtPttName.SetFocus
        End If
    Else
        txtPttName.SetFocus
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
If Between(Ctod(dtpFromDate.Text), sFinYrStartDate, sFinYrEndDate) = False Then
    ErrorBox "Invalid Date Range !!!"
    'dtpFromDate.SetFocus
    'Cancel = True
End If

End Sub

Private Sub dtpIpgDate_GotFocus()
FlashActiveControl dtpIpgDate, True
End Sub

Private Sub dtpIpgDate_LostFocus()
FlashActiveControl dtpIpgDate, False
End Sub

Private Sub dtpIpgDate_Validate(Cancel As Boolean)
dtpIpgDate.Text = ToMyDate(dtpIpgDate.Text)
If IsDate(dtpIpgDate.Text) = False Then
    ErrorBox "Invalid Input !!!"
    dtpIpgDate.SetFocus
    Cancel = True
End If

End Sub

Private Sub dtpIgtDate_GotFocus()
FlashActiveControl dtpIgtDate, True
End Sub

Private Sub dtpIgtDate_LostFocus()
FlashActiveControl dtpIgtDate, False
End Sub

Private Sub dtpIgtDate_Validate(Cancel As Boolean)
dtpIgtDate.Text = ToMyDate(dtpIgtDate.Text)
If IsFinYrDate(Ctod(dtpIgtDate.Text)) = False Then
    ErrorBox "Invalid Input !!!"
    dtpIgtDate.SetFocus
    Cancel = True
End If

End Sub

Private Sub dtpPttAgeAsOnDt_GotFocus()
FlashActiveControl dtpPttAgeAsOnDt, True
End Sub

Private Sub dtpPttAgeAsOnDt_LostFocus()
FlashActiveControl dtpPttAgeAsOnDt, False
End Sub

Private Sub dtpPttDob_GotFocus()
FlashActiveControl dtpPttDob, True
End Sub

Private Sub dtpPttDob_LostFocus()
FlashActiveControl dtpPttDob, False
End Sub

Private Sub dtpPttRegDate_GotFocus()
FlashActiveControl dtpPttRegDate, True
End Sub

Private Sub dtpPttRegDate_LostFocus()
FlashActiveControl dtpPttRegDate, False
End Sub

Private Sub dtpToDate_GotFocus()
FlashActiveControl dtpToDate, True
End Sub

Private Sub dtpToDate_LostFocus()
FlashActiveControl dtpToDate, False
End Sub

Private Sub dtpToDate_Validate(Cancel As Boolean)
dtpToDate.Text = ToMyDate(dtpToDate.Text)
If Between(Ctod(dtpToDate.Text), sFinYrStartDate, sFinYrEndDate) = False Then
    ErrorBox "Invalid Date Range !!!"
    'dtpToDate.SetFocus
    'Cancel = True
End If

End Sub

Private Sub Form_Activate()
If mFormLoaded = False Then
    If mRemoteAccess = True Then
        MoveRecToFirst datRecset
        ShowRecActiveFlexRow datRecset, Mfgrd1
        Mfgrd1.SetFocus
        If mIgtCode = 0 Then
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
    RefreshDatabase dbHmsDatabase
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

Private Sub Form_Load()
Dim colcnt As Integer

mFormUIdFileName = "IndrRgPy.Uid"
mFormAcsPermFileName = "IndrRgPy.Acp"
mFormUIdCode = GetUIdCode(mProcess:=Me.Name, mUIdFileName:=mFormUIdFileName, mAcsPermFileName:=mFormAcsPermFileName)

mFormLoaded = False
mEntrySaved = False: mEntryAborted = False
SetFormSize Me, frmMain
Call Form_Resize

Call SetVoidControl(txtVoid)
txtSearch1Text.Enabled = False
frConfigure.Visible = False
frPrintCRList.Visible = False

ChkCustomForm Me, CfsFileFullPath("IndrRgPy.Cfs")

OpenAcDataSource dbAcDatabase
OpenHmsDataSource dbHmsDatabase
OpenGrpDataSource dbGrpDatabase
OpenComDataSource dbComDatabase

Set clsListStru = New clsSelectQueryStructure

Set clsHOPT = New clsHmsIpdOptionsEntry
clsHOPT.blnIndrRgPymtOptMast = True
clsHOPT.Init
clsHOPT.GetIndrRgPymtOptData

Set clsAH = New clsAccountHead
Set clsAH.dbAcDatabase = dbAcDatabase
Set clsAH.dbGrpDatabase = dbGrpDatabase

Set clsIPG = New clsHmsSnglTranEntry
Set clsIPG.dbAcDatabase = dbAcDatabase
Set clsIPG.dbHmsDatabase = dbHmsDatabase
clsIPG.blnIndrRegTran = True
clsIPG.Init

Set clsIGT = New clsHmsSnglTranEntry
Set clsIGT.dbAcDatabase = dbAcDatabase
Set clsIGT.dbHmsDatabase = dbHmsDatabase
clsIGT.blnIndrRgPymtTran = True
clsIGT.Init

''Set clsIBL = New clsHmsIpdMultiTranEntry
''Set clsIBL.dbAcDatabase = dbAcDatabase
''Set clsIBL.dbHmsDatabase = dbHmsDatabase
''clsIBL.blnIndrBillTran = True
''clsIBL.Init

Set clsPAT = New clsHmsMasterEntry
Set clsPAT.dbAcDatabase = dbAcDatabase
Set clsPAT.dbHmsDatabase = dbHmsDatabase
clsPAT.blnPatMast = True
clsPAT.Init

Set clsPCG = New clsHmsMasterEntry
Set clsPCG.dbHmsDatabase = dbHmsDatabase
clsPCG.blnPatCatgMast = True
clsPCG.Init

Set clsDCT = New clsHmsMasterEntry
Set clsDCT.dbHmsDatabase = dbHmsDatabase
clsDCT.blnDoctMast = True
clsDCT.Init

Set clsDIG = New clsHmsMasterEntry
Set clsDIG.dbHmsDatabase = dbHmsDatabase
clsDIG.blnDiagMast = True
clsDIG.Init

Set clsSRV = New clsHmsMasterEntry
Set clsSRV.dbHmsDatabase = dbHmsDatabase
clsSRV.blnServMast = True
clsSRV.Init

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

Set fcmbIgtVtmName = New clsComFlexSearch
Set fcmbIgtVtmName.dbAcDatabase = dbAcDatabase
fcmbIgtVtmName.blnVTypeMastList = True
fcmbIgtVtmName.mListSqlExpr = "Select * from VTypMast where VtmSysCode=" & CStr(cHMS_VTYPE_INDOOR_RGPYMT) & " order by VtmName"
fcmbIgtVtmName.Init

''Set fcmbIblVchNo = New clsHmsFlexSearch
''Set fcmbIblVchNo.dbHmsDatabase = dbHmsDatabase
''Set fcmbIblVchNo.dbComDatabase = dbComDatabase
''fcmbIblVchNo.blnOldIblListByIblNo = True
''fcmbIblVchNo.Init

Set fcmbPttRegNo = New clsHmsFlexSearch
Set fcmbPttRegNo.dbHmsDatabase = dbHmsDatabase
Set fcmbPttRegNo.dbComDatabase = dbComDatabase
fcmbPttRegNo.blnPatMastListByRegNo = True
fcmbPttRegNo.mFiltCond = "0 = 1"
fcmbPttRegNo.Init

Set fcmbPttName = New clsHmsFlexSearch
Set fcmbPttName.dbHmsDatabase = dbHmsDatabase
Set fcmbPttName.dbComDatabase = dbComDatabase
fcmbPttName.blnPatMastListByName = True
fcmbPttName.mFiltCond = "0 = 1"
fcmbPttName.Init

Set fcmbAdmIpgByIpgNo = New clsHmsFlexSearch
Set fcmbAdmIpgByIpgNo.dbHmsDatabase = dbHmsDatabase
Set fcmbAdmIpgByIpgNo.dbComDatabase = dbComDatabase
fcmbAdmIpgByIpgNo.blnAdmIpgListByIpgNo = True
fcmbAdmIpgByIpgNo.mFiltCond = "0 = 1"
fcmbAdmIpgByIpgNo.Init

Set fcmbAdmIpgByPttRegNo = New clsHmsFlexSearch
Set fcmbAdmIpgByPttRegNo.dbHmsDatabase = dbHmsDatabase
Set fcmbAdmIpgByPttRegNo.dbComDatabase = dbComDatabase
fcmbAdmIpgByPttRegNo.blnAdmIpgListByPttRegNo = True
fcmbAdmIpgByPttRegNo.mFiltCond = "0 = 1"
fcmbAdmIpgByPttRegNo.Init

Set fcmbAdmIpgByPttName = New clsHmsFlexSearch
Set fcmbAdmIpgByPttName.dbHmsDatabase = dbHmsDatabase
Set fcmbAdmIpgByPttName.dbComDatabase = dbComDatabase
fcmbAdmIpgByPttName.blnAdmIpgListByPttName = True
fcmbAdmIpgByPttName.mFiltCond = "0 = 1"
fcmbAdmIpgByPttName.Init

Call RestoreDefaultSmryPara
If mRemoteAccess = True Then
    optDetailed.Value = True
    AddSmryParaLayer mClear:=True
End If

If mRemoteAccess = True Then
    datRecset.open "Select * from IndrRgPymt inner join PatMast on IndrRgPymt.IgtPttCode = PatMast.PttCode where IgtCode=" & CStr(mIgtCode) & " order by IgtDate,IgtTime", dbHmsDatabase, adOpenKeyset, adLockOptimistic
    dtpFromDate.Text = Dtoc(datRecset.fields("IgtDate"))
    dtpToDate.Text = Dtoc(datRecset.fields("IgtDate"))
    AddSmryParaLayer mClear:=True
    
Else
    datRecset.open "Select * from IndrRgPymt inner join PatMast on IndrRgPymt.IgtPttCode=PatMast.PttCode order by IgtDate,IgtTime", dbHmsDatabase, adOpenKeyset, adLockOptimistic
End If
Mfgrd1.FixedCols = 0
Call SmryList

ShowEntryMode False
ShowStatusBarText StatusBar1

End Sub

Private Sub StatusBar1_PanelClick(ByVal Panel As MSComctlLib.Panel)
ShowStatusBarText StatusBar1
End Sub

Private Sub Form_Resize()
lblFormHeading.Width = Me.Width
cmdFormEscape.Left = Me.Width - (cmdFormEscape.Width * 2)
cmdFormEnter.Left = Me.Width + cmdFormEscape.Width
frFormSmry.Left = (Me.Width - frFormSmry.Width) / 2: frFormSmry.Top = cmbFormEntryMode.Top + (cmbFormEntryMode.Height * 2)
frFormDtl.Left = (Me.Width - frFormDtl.Width) / 2: frFormDtl.Top = frFormSmry.Top

End Sub

Private Sub Form_Unload(Cancel As Integer)
Set clsHOPT = Nothing
Set clsJRN = Nothing
Set clsAH = Nothing
Set clsIPG = Nothing
Set clsIGT = Nothing
''Set clsIBL = Nothing
Set clsPAT = Nothing
Set clsPCG = Nothing
Set clsDCT = Nothing
Set clsDIG = Nothing
Set clsSRV = Nothing
Set clsARA = Nothing
Set clsSTN = Nothing
Set clsVTM = Nothing
Set fcmbAdmIpgByIpgNo = Nothing
Set fcmbAdmIpgByPttRegNo = Nothing
Set fcmbAdmIpgByPttName = Nothing
Set fcmbPttRegNo = Nothing
Set fcmbPttName = Nothing
Set fcmbIgtVtmName = Nothing
''Set fcmbIblVchNo = Nothing
Set clsListStru = Nothing

CloseTable datRecset
CloseDataSource dbAcDatabase
CloseDataSource dbHmsDatabase
CloseDataSource dbGrpDatabase
CloseDataSource dbComDatabase
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
Dim mPttRegNo As Long, mIgtPttCode As Long, mIpgVchNo As Long, mIgtVchNo As Long
Dim mIblAmtAftDiscAmtTot As Double, mIblAdvAmtTot As Double, mIblDepoAmtExclTot As Double, mIgtDpogAmtTot As Double, mIblRefuAmtTot As Double
Dim mIgtDpogAmt As Double, mIgtAdjAmt As Double, mIgtBalAmt As Double

Data_Verify = False
If FormAddEditMode = cFORM_EDITMODE And Val(mskFormBoundField.Text) < 1 Then
    ErrorBox "Invalid Key Value !!!"
    txtPttName.SetFocus
    GoTo EndSub
End If
Rem patient validation
mIgtPttCode = Val(mskIgtPttCode.Text)
If mIgtPttCode < 1 Then
    ErrorBox "Invalid Key Value !!!"
    txtPttName.SetFocus
    GoTo EndSub
End If
If Trim(txtPttName.Text) = "" Then
    ErrorBox "Invalid Input !!!"
    txtPttName.SetFocus
    GoTo EndSub
End If
mPttRegNo = Val(UnMyNumFmt(mskPttRegNo.Text))
If mPttRegNo < 0 Then
    ErrorBox "Invalid Input !!!"
    mskPttRegNo.SetFocus
    GoTo EndSub
Else
    If mPttRegNo = 0 And clsHOPT.mIgtPttRegNoNotZero_bln = True Then
        AlertBox "Prohibited Zero Patient Reg.No. !!!"
        mskPttRegNo.SetFocus
        GoTo EndSub
    End If
End If
Rem indoor registration validation
If Val(mskIgtIpgCode.Text) < 1 Then
    ErrorBox "Invalid Key Value !!!"
    txtPttName.SetFocus
    GoTo EndSub
End If
mIpgVchNo = Val(UnMyNumFmt(mskIpgVchNo.Text))
If mIpgVchNo < 1 Then
    ErrorBox "Invalid Input !!!"
    mskIpgVchNo.SetFocus
    GoTo EndSub
End If
If IsDate(dtpIpgDate.Text) = False Then
    ErrorBox "Invalid Input !!!"
    dtpIpgDate.SetFocus
    GoTo EndSub
End If
Rem indoor bill payment receipt validations
mIgtVchNo = Val(UnMyNumFmt(mskIgtVchNo(0).Text))
If mIgtVchNo > 0 Then
    If mIgtVchNo <> mIgtVchNo_old Or Val(fcmbIgtVtmName.BoundText) <> mIgtVtmCode_old Or Ctod(dtpIgtDate.Text) <> mIgtDate_old Or FormAddEditMode = cFORM_ADDMODE Then
        If ChkIsDuplVTypeNo(dbHmsDatabase, dbAcDatabase, mTableName:="IndrRgPymt", mChkFieldName:="IgtVchNo", mChkFieldValue:=mIgtVchNo, mKeyFieldName:="IgtCode", mKeyFieldValue:=mIgtCode, mVtmFieldName:="IgtVtmCode", mVtmFieldValue:=Val(fcmbIgtVtmName.BoundText), mFinYrFieldName:="IgtCmpCode", mFinYrFieldValue:=sFinYrCmpCode, mDateFieldName:="IgtDate", mDateFieldValue:=Ctod(dtpIgtDate.Text)) = True Then
            ErrorBox "Duplicate Voucher No. !!!"
            mskIgtVchNo(0).SetFocus
            ' ---------------
            If FormAddEditMode = True Then
                mIgtVchNo = GetNextVTypeNo(dbHmsDatabase, dbAcDatabase, dbComDatabase, mTableName:="IndrRgPymt", mFieldName:="IgtVchNo", mVtmFieldName:="IgtVtmCode", mVtmFieldValue:=Val(fcmbIgtVtmName.BoundText), mFinYrFieldName:="IgtCmpCode", mFinYrFieldValue:=sFinYrCmpCode, mDateFieldName:="IgtDate", mDateFieldValue:=Ctod(dtpIgtDate.Text), mModuleCode:=mFormUIdCode, mModuleName:=Me.Name, mAcsPermFileName:=mFormAcsPermFileName)
            Else
                mIgtVchNo = mIgtVchNo_old
            End If
            mskIgtVchNo(0).Text = ToMyNumFmt(mIgtVchNo, mDecimals:=0)
            GoTo EndSub
        End If
    End If
Else
    ErrorBox "Invalid Input !!!"
    mskIgtVchNo(0).SetFocus
    GoTo EndSub
End If
If IsDate(dtpIgtDate.Text) = False Then
    ErrorBox "Invalid Input !!!"
    dtpIgtDate.SetFocus
    GoTo EndSub
Else
    If IsFinYrDate(Ctod(dtpIgtDate.Text)) = False Then
        ErrorBox "Invalid Input !!!"
        dtpIgtDate.SetFocus
        GoTo EndSub
    End If
End If
If TimeToMin(txtIgtTime_str.Text) > cDAYMINUTES Then
    ErrorBox "Invalid Input !!!"
    txtIgtTime_str.SetFocus
    GoTo EndSub
End If
mIgtDpogAmt = Val(UnMyNumFmt(mskIgtDpogAmt.Text))
If mIgtDpogAmt <= 0 Then
    ErrorBox "Invalid Amount !!!"
    mskIgtDpogAmt.SetFocus
    GoTo EndSub
End If
mIgtAdjAmt = Val(UnMyNumFmt(mskIgtAdjAmt.Text))
If mIgtAdjAmt < 0 Then
    ErrorBox "Invalid Adjusted Amount !!!"
    Rem mskIgtAdjAmt.SetFocus
    Rem GoTo EndSub
ElseIf mIgtAdjAmt > mIgtDpogAmt Then
    ErrorBox "Excess Amount Adjusted !!!"
    Rem mskIgtAdjAmt.SetFocus
    Rem GoTo EndSub
End If
mIgtBalAmt = Val(UnMyNumFmt(mskIgtBalAmt.Text))
If mIgtBalAmt < 0 Then
    ErrorBox "Invalid Balance Amount !!!"
    Rem mskIgtBalAmt.SetFocus
    Rem GoTo EndSub
End If

''mIgtDpogAmtTot = Val(UnMyNumFmt(lblIgtDpogAmtTot.Caption))
''If mIgtDpogAmtTot < 0 Then
''    ErrorBox "Invalid Input !!!"
''    Mfgrd2.SetFocus
''    GoTo EndSub
''End If
mIblAmtAftDiscAmtTot = Val(UnMyNumFmt(lblIblAmtAftDiscTot.Caption))
mIblAdvAmtTot = Val(UnMyNumFmt(lblIpgAdvAmtTot.Caption))
mIblRefuAmtTot = Val(UnMyNumFmt(lblIbfdRefuAmtTot.Caption))
''If (mIblAdvAmtTot + mIblDepoAmtExclTot + mIgtDpogAmtTot) > mIblAmtAftDiscAmtTot Then
''    ErrorBox "Excess Received Amount !!!"
''    Mfgrd2.SetFocus
''    GoTo EndSub
''End If

Data_Verify = True

EndSub:
Exit Function

End Function

Private Function Data_NetwAuth() As Boolean
Dim mIgtVchNo As Long
Data_NetwAuth = False

mIgtVchNo = Val(UnMyNumFmt(mskIgtVchNo(0).Text))
If mIgtVchNo <> mIgtVchNo_old Or Val(fcmbIgtVtmName.BoundText) <> mIgtVtmCode_old Or Ctod(dtpIgtDate.Text) <> mIgtDate_old Or FormAddEditMode = cFORM_ADDMODE Then
    If ChkIsDuplVTypeNo(dbHmsDatabase, dbAcDatabase, mTableName:="IndrRgPymt", mChkFieldName:="IgtVchNo", mChkFieldValue:=mIgtVchNo, mKeyFieldName:="IgtCode", mKeyFieldValue:=mIgtCode, mVtmFieldName:="IgtVtmCode", mVtmFieldValue:=Val(fcmbIgtVtmName.BoundText), mFinYrFieldName:="IgtCmpCode", mFinYrFieldValue:=sFinYrCmpCode, mDateFieldName:="IgtDate", mDateFieldValue:=Ctod(dtpIgtDate.Text)) = True Then
        ErrorBox "Duplicate Voucher No. !!!"
        mskIgtVchNo(0).SetFocus
        ' ---------------
        If FormAddEditMode = True Then
            mIgtVchNo = GetNextVTypeNo(dbHmsDatabase, dbAcDatabase, dbComDatabase, mTableName:="IndrRgPymt", mFieldName:="IgtVchNo", mVtmFieldName:="IgtVtmCode", mVtmFieldValue:=Val(fcmbIgtVtmName.BoundText), mFinYrFieldName:="IgtCmpCode", mFinYrFieldValue:=sFinYrCmpCode, mDateFieldName:="IgtDate", mDateFieldValue:=Ctod(dtpIgtDate.Text), mModuleCode:=mFormUIdCode, mModuleName:=Me.Name, mAcsPermFileName:=mFormAcsPermFileName)
        Else
            mIgtVchNo = mIgtVchNo_old
        End If
        mskIgtVchNo(0).Text = ToMyNumFmt(mIgtVchNo, mDecimals:=0)
        Exit Function
    End If
End If

Data_NetwAuth = True

End Function

Private Sub mskIgtAdjAmt_GotFocus()
FlashActiveControl mskIgtAdjAmt, True
End Sub

Private Sub mskIgtAdjAmt_LostFocus()
FlashActiveControl mskIgtAdjAmt, False
End Sub

Private Sub mskIgtBalAmt_GotFocus()
FlashActiveControl mskIgtBalAmt, True
End Sub

Private Sub mskIgtBalAmt_LostFocus()
FlashActiveControl mskIgtBalAmt, False
End Sub

Private Sub mskIgtDpogAmt_GotFocus()
FlashActiveControl mskIgtDpogAmt, True
End Sub

Private Sub mskIgtDpogAmt_LostFocus()
FlashActiveControl mskIgtDpogAmt, False
End Sub

Private Sub mskIgtDpogAmt_Validate(Cancel As Boolean)

mskIgtDpogAmt.Text = ToMyNumFmt(mskIgtDpogAmt.Text)
If Val(UnMyNumFmt(mskIgtDpogAmt.Text)) <= 0 Then
    ErrorBox "Invalid Amount !!!"
    mskIgtDpogAmt.SetFocus
    Cancel = True
Else
    If Val(UnMyNumFmt(mskIgtDpogAmt.Text)) <> mIgtDpogAmt_old Or FormAddEditMode = cFORM_ADDMODE Then
        ShowIpgLinkTranAmt Val(UnMyNumFmt(mskIgtIpgCode.Text))
        mskIgtBalAmt.Text = Val(UnMyNumFmt(mskIgtDpogAmt.Text)) - Val(UnMyNumFmt(mskIgtAdjAmt.Text))
    End If
End If

End Sub

Private Sub mskIpgVchNo_GotFocus()
FlashActiveControl mskIpgVchNo, True
End Sub

Private Sub mskIpgVchNo_LostFocus()
FlashActiveControl mskIpgVchNo, False
End Sub

Private Sub mskIpgVchNo_Validate(Cancel As Boolean)
Dim mIpgVchNo As Long

mIpgVchNo = Val(UnMyNumFmt(mskIpgVchNo.Text))
mskIpgVchNo.Text = ToMyNumFmt(mIpgVchNo, mDecimals:=0)
If mIpgVchNo < 0 Then
    ErrorBox "Invalid Input !!!"
    mskIpgVchNo.SetFocus
    Cancel = True
End If

End Sub

Private Sub mskIgtVchNo_GotFocus(Index As Integer)
FlashActiveControl mskIgtVchNo(Index), True
End Sub

Private Sub mskIgtVchNo_LostFocus(Index As Integer)
FlashActiveControl mskIgtVchNo(Index), False
End Sub

Private Sub mskIgtVchNo_Validate(Index As Integer, Cancel As Boolean)
Dim mIgtVchNo As Long

mIgtVchNo = Val(UnMyNumFmt(mskIgtVchNo(Index).Text))
If mIgtVchNo < 0 And Index = 0 Then
    mIgtVchNo = GetNextVTypeNo(dbHmsDatabase, dbAcDatabase, dbComDatabase, mTableName:="IndrRgPymt", mFieldName:="IgtVchNo", mVtmFieldName:="IgtVtmCode", mVtmFieldValue:=Val(fcmbIgtVtmName.BoundText), mFinYrFieldName:="IgtCmpCode", mFinYrFieldValue:=sFinYrCmpCode, mDateFieldName:="IgtDate", mDateFieldValue:=Ctod(dtpIgtDate.Text), mModuleCode:=mFormUIdCode, mModuleName:=Me.Name, mAcsPermFileName:=mFormAcsPermFileName)
    mskIgtVchNo(Index).Text = ToMyNumFmt(mIgtVchNo, mDecimals:=0)
ElseIf mIgtVchNo > 0 And Index = 0 Then
    If mIgtVchNo <> mIgtVchNo_old Or Val(fcmbIgtVtmName.BoundText) <> mIgtVtmCode_old Or Ctod(dtpIgtDate.Text) <> mIgtDate_old Or FormAddEditMode = cFORM_ADDMODE Then
        If ChkIsDuplVTypeNo(dbHmsDatabase, dbAcDatabase, mTableName:="IndrRgPymt", mChkFieldName:="IgtVchNo", mChkFieldValue:=mIgtVchNo, mKeyFieldName:="IgtCode", mKeyFieldValue:=mIgtCode, mVtmFieldName:="IgtVtmCode", mVtmFieldValue:=Val(fcmbIgtVtmName.BoundText), mFinYrFieldName:="IgtCmpCode", mFinYrFieldValue:=sFinYrCmpCode, mDateFieldName:="IgtDate", mDateFieldValue:=Ctod(dtpIgtDate.Text)) = True Then
            ErrorBox "Duplicate Voucher No. !!!"
            Cancel = True
            mskIgtVchNo(Index).SetFocus
            ' ----------
            If FormAddEditMode = cFORM_ADDMODE Then
                mIgtVchNo = GetNextVTypeNo(dbHmsDatabase, dbAcDatabase, dbComDatabase, mTableName:="IndrRgPymt", mFieldName:="IgtVchNo", mVtmFieldName:="IgtVtmCode", mVtmFieldValue:=Val(fcmbIgtVtmName.BoundText), mFinYrFieldName:="IgtCmpCode", mFinYrFieldValue:=sFinYrCmpCode, mDateFieldName:="IgtDate", mDateFieldValue:=Ctod(dtpIgtDate.Text), mModuleCode:=mFormUIdCode, mModuleName:=Me.Name, mAcsPermFileName:=mFormAcsPermFileName)
            Else
                mIgtVchNo = mIgtVchNo_old
            End If
            mskIgtVchNo(Index).Text = ToMyNumFmt(mIgtVchNo, mDecimals:=0)
        End If
    End If
    If Cancel = False Then
        mskIgtVchNo(Index).Text = ToMyNumFmt(mIgtVchNo, mDecimals:=0)
    End If
ElseIf mIgtVchNo < 1 Then
    ErrorBox "Invalid Input !!!"
    mskIgtVchNo(Index).SetFocus
    Cancel = True
End If

End Sub

''Private Sub mskIblVchNo_KeyDown(KeyCode As Integer, Shift As Integer)
''If MyDropDownKey(Shift, KeyCode) = True Then
''    Call mskIblVchNo_Change
''End If
''
''End Sub

Private Sub mskPttAgeDy_GotFocus()
FlashActiveControl mskPttAgeDy, True
End Sub

Private Sub mskPttAgeDy_LostFocus()
FlashActiveControl mskPttAgeDy, False
End Sub

Private Sub mskPttAgeMn_GotFocus()
FlashActiveControl mskPttAgeMn, True
End Sub

Private Sub mskPttAgeMn_LostFocus()
FlashActiveControl mskPttAgeMn, False
End Sub

Private Sub mskPttAgeYr_GotFocus()
FlashActiveControl mskPttAgeYr, True
End Sub

Private Sub mskPttAgeYr_LostFocus()
FlashActiveControl mskPttAgeYr, False
End Sub

Private Sub mskPttRegNo_GotFocus()
FlashActiveControl mskPttRegNo, True
End Sub

Private Sub mskPttRegNo_KeyDown(KeyCode As Integer, Shift As Integer)
If MyDropDownKey(Shift, KeyCode) = True Then
    Call ShowOldIpgListByPttRegNo
ElseIf MyAddNewKey(Shift, KeyCode) = True Then
    If FormAddEditMode = cFORM_ADDMODE Then
        clsIGT.EndTran mIgtCode
        Call Data_AddEvent
    Else
        AlertBox "Prohibited in Edit Mode !!!"
    End If
End If

End Sub

Private Sub mskPttRegNo_LostFocus()
FlashActiveControl mskPttRegNo, False
End Sub

Private Sub mskPttRegNo_Validate(Cancel As Boolean)
Dim mPttRegNo As Long

mPttRegNo = Val(UnMyNumFmt(mskPttRegNo.Text))
If mPttRegNo < 0 Then
    ErrorBox "Invalid Input !!!"
    Rem Cancel = True
    Rem mskPttRegNo.SetFocus
Else
    If mPttRegNo <> mPttRegNo_old Or FormAddEditMode = cFORM_ADDMODE Then
        If mPttRegNo = 0 And clsHOPT.mIgtPttRegNoNotZero_bln = True Then
            AlertBox "Prohibited Zero Patient Reg.No. !!!"
        End If
    End If
End If

End Sub

Private Sub mskQryPttRegNo_Change()
If fcmbPttRegNo.CallFromText_Change = False Then
    fcmbPttRegNo.CallFromText_Change = True
    If InterActiveChange(mskQryPttRegNo) = True Then
        Call ChkPttRegNoListFirstTime
        
        fcmbPttRegNo.UserText = Array(mskQryPttRegNo.Text, mskQryPttRegNo.SelStart)
        fcmbPttRegNo.Show
        mskQryPttRegNo.Text = fcmbPttRegNo.Text
        mQryPttCode = Val(fcmbPttRegNo.BoundText)
        fcmbPttName.BoundText = CStr(mQryPttCode)
        txtQryPttName.Text = fcmbPttName.Text
        If fcmbPttRegNo.ListSelected = True Then
            SendKeys "{tab}"
        End If
    End If
    fcmbPttRegNo.CallFromText_Change = False
End If

End Sub

Private Sub ChkPttRegNoListFirstTime()
If fcmbPttRegNo.LRecordCount = 0 Then
    fcmbPttRegNo.mFiltCond = ""
    fcmbPttRegNo.ReInit
End If

End Sub

Private Sub mskQryPttRegNo_GotFocus()
FlashActiveControl mskQryPttRegNo, True
End Sub

Private Sub mskQryPttRegNo_KeyDown(KeyCode As Integer, Shift As Integer)
If MyDropDownKey(Shift, KeyCode) = True Then
    Call mskQryPttRegNo_Change
ElseIf MyAddNewKey(Shift, KeyCode) = True Then
    Rem not required here
End If

End Sub

Private Sub mskQryPttRegNo_LostFocus()
FlashActiveControl mskQryPttRegNo, False
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

Private Sub optMonthwise_GotFocus()
FlashActiveControl optMonthwise, True
End Sub

Private Sub optMonthwise_LostFocus()
FlashActiveControl optMonthwise, False
End Sub

Private Sub optPatientwise_GotFocus()
FlashActiveControl optPatientwise, True
End Sub

Private Sub optPatientwise_LostFocus()
FlashActiveControl optPatientwise, False
End Sub

Private Sub txtAraName_GotFocus()
FlashActiveControl txtAraName, True
End Sub

Private Sub txtAraName_LostFocus()
FlashActiveControl txtAraName, False
End Sub

Private Sub txtCDctName_GotFocus()
FlashActiveControl txtCDctName, True
End Sub

Private Sub txtCDctName_LostFocus()
FlashActiveControl txtCDctName, False
End Sub

Private Sub txtFDigName_GotFocus()
FlashActiveControl txtFDigName, True
End Sub

Private Sub txtFDigName_LostFocus()
FlashActiveControl txtFDigName, False
End Sub

Private Sub txtIgtRemark_GotFocus()
FlashActiveControl txtIgtRemark, True
End Sub

Private Sub txtIgtRemark_LostFocus()
FlashActiveControl txtIgtRemark, False
End Sub

Private Sub txtIgtRemark_Validate(Cancel As Boolean)
txtIgtRemark.Text = ToMyWord(txtIgtRemark.Text)
End Sub

Private Sub txtIpgTime_str_GotFocus()
FlashActiveControl txtIpgTime_str, True
End Sub

Private Sub txtIpgTime_str_LostFocus()
FlashActiveControl txtIpgTime_str, False
End Sub

Private Sub txtIpgTime_str_Validate(Cancel As Boolean)
txtIpgTime_str.Text = MinToTime(TimeToMin(txtIpgTime_str.Text))
If TimeToMin(txtIpgTime_str.Text) > cDAYMINUTES Then
    ErrorBox "Invalid Input !!!"
    txtIpgTime_str.SetFocus
    Cancel = True
End If

End Sub

Private Sub txtIgtTime_str_GotFocus()
FlashActiveControl txtIgtTime_str, True
End Sub

Private Sub txtIgtTime_str_LostFocus()
FlashActiveControl txtIgtTime_str, False
End Sub

Private Sub txtIgtTime_str_Validate(Cancel As Boolean)
txtIgtTime_str.Text = MinToTime(TimeToMin(txtIgtTime_str.Text))
If TimeToMin(txtIgtTime_str.Text) > cDAYMINUTES Then
    ErrorBox "Invalid Input !!!"
    txtIgtTime_str.SetFocus
    Cancel = True
End If

End Sub

Private Sub txtIgtVtmName_Change(Index As Integer)
If fcmbIgtVtmName.CallFromText_Change = False Then
    fcmbIgtVtmName.CallFromText_Change = True
    If InterActiveChange(txtIgtVtmName(Index)) = True Then
        fcmbIgtVtmName.UserText = Array(txtIgtVtmName(Index).Text, txtIgtVtmName(Index).SelStart)
        fcmbIgtVtmName.Show
        txtIgtVtmName(Index).Text = fcmbIgtVtmName.Text
        If fcmbIgtVtmName.ListSelected = True Then
            SendKeys "{tab}"
        End If
    End If
    fcmbIgtVtmName.CallFromText_Change = False
End If

End Sub

Private Sub txtIgtVtmName_GotFocus(Index As Integer)
FlashActiveControl txtIgtVtmName(Index), True
End Sub

Private Sub txtIgtVtmName_KeyDown(Index As Integer, KeyCode As Integer, Shift As Integer)
If MyDropDownKey(Shift, KeyCode) = True Then
    Call txtIgtVtmName_Change(Index)
ElseIf MyAddNewKey(Shift, KeyCode) = True Then

ElseIf Shift = 0 And KeyCode = vbKeyF6 Then
    Rem Call ShowOldIpgListByIpgNo show here all indoor bills details
End If

End Sub

Private Sub txtIgtVtmName_LostFocus(Index As Integer)
FlashActiveControl txtIgtVtmName(Index), False
End Sub

Private Sub txtIgtVtmName_Validate(Index As Integer, Cancel As Boolean)
Dim mIgtVchNo As Long

If Val(fcmbIgtVtmName.BoundText) < 1 Then
    ErrorBox "Invalid Selection !!!"
    txtIgtVtmName(Index).SetFocus
    Cancel = True
ElseIf Index = 0 Then
    If Val(fcmbIgtVtmName.BoundText) <> mIgtVtmCode_old Or Ctod(dtpIgtDate.Text) <> mIgtDate_old Or FormAddEditMode = cFORM_ADDMODE Then
        mIgtVchNo = GetNextVTypeNo(dbHmsDatabase, dbAcDatabase, dbComDatabase, mTableName:="IndrRgPymt", mFieldName:="IgtVchNo", mVtmFieldName:="IgtVtmCode", mVtmFieldValue:=Val(fcmbIgtVtmName.BoundText), mFinYrFieldName:="IgtCmpCode", mFinYrFieldValue:=sFinYrCmpCode, mDateFieldName:="IgtDate", mDateFieldValue:=Ctod(dtpIgtDate.Text), mModuleCode:=mFormUIdCode, mModuleName:=Me.Name, mAcsPermFileName:=mFormAcsPermFileName)
        mskIgtVchNo(Index).Text = ToMyNumFmt(mIgtVchNo, mDecimals:=0)
    End If
End If

End Sub

Private Sub txtPttAddr_GotFocus()
FlashActiveControl txtPttAddr, True
End Sub

Private Sub txtPttAddr_LostFocus()
FlashActiveControl txtPttAddr, False
End Sub

Private Sub txtPttAddr_Validate(Cancel As Boolean)
txtPttAddr.Text = ToMyWord(txtPttAddr.Text)
End Sub

Private Sub txtPttName_GotFocus()
FlashActiveControl txtPttName, True
End Sub

Private Sub txtPttName_KeyDown(KeyCode As Integer, Shift As Integer)
If MyDropDownKey(Shift, KeyCode) = True Then
    Call ShowOldIpgListByPttName
ElseIf MyAddNewKey(Shift, KeyCode) = True Then
    If FormAddEditMode = cFORM_ADDMODE Then
        clsIGT.EndTran mIgtCode
        Call Data_AddEvent
    Else
        AlertBox "Prohibited in Edit Mode !!!"
    End If
End If

End Sub

Private Sub txtPttName_LostFocus()
FlashActiveControl txtPttName, False
End Sub

Private Sub txtPttName_Validate(Cancel As Boolean)
txtPttName.Text = ToMyWord(txtPttName.Text)
If Trim(txtPttName.Text) = "" Then
    ErrorBox "Invalid Input !!!"
    Rem Cancel = True
    Rem txtPttName.SetFocus
End If

End Sub

Private Sub Data_AddEvent()

If CanUserAddOpt(mUsrCode:=MyCompany.mUserCode, mMenuOptName:=Me.SecuMenuName) = False Then
    AlertBox "Not Permitted !!!"
    Exit Sub
End If
If clsIGT.BeginTran(0) = False Then
    Exit Sub
End If
mEntrySaved = False: mEntryAborted = False
FormAddEditMode = cFORM_ADDMODE

clsIGT.Clear
clsIPG.Clear
clsPAT.Clear

mIgtCode = clsIGT.ActiveCode
mIgtIpgCode = 0
mIgtPttCode = 0

ShowIgtData mIgtCode
ShowIpgData mIgtIpgCode
ShowPatData mIgtPttCode

Rem restoring user editing features
Call ShowIgtDefData
Call ShowPatDefData
Call ShowIpgDefData

Rem old values
Call StoreIgtOldData
Call StorePatOldData
Call StoreIpgOldData

Call ShowEntryMode(True)
txtPttName.SetFocus

End Sub

Private Sub Data_EditEvent()

If CanUserEditOpt(mUsrCode:=MyCompany.mUserCode, mMenuOptName:=Me.SecuMenuName) = False Then
    AlertBox "Not Permitted !!!"
    Exit Sub
End If
If clsIGT.BeginTran(datRecset.fields("IgtCode")) = False Then
    Exit Sub
End If
mEntrySaved = False: mEntryAborted = False
FormAddEditMode = cFORM_EDITMODE

With datRecset
mIgtCode = .fields("IgtCode")
mIgtIpgCode = .fields("IgtIpgCode")
mIgtPttCode = .fields("IgtPttCode")

clsIGT.GetData mIgtCode
clsIPG.GetData mIgtIpgCode
clsPAT.GetData mIgtPttCode
End With

ShowIgtData mIgtCode
ShowIpgData mIgtIpgCode
ShowPatData mIgtPttCode

Rem old values
Call StoreIgtOldData
Call StoreIpgOldData
Call StorePatOldData

Call ShowEntryMode(True)
txtPttName.SetFocus

End Sub

Private Sub ShowPatData(ByVal mPttCode As Long)

With clsPAT
.GetData mPttCode

mskIgtPttCode.Text = mPttCode
txtPttName.Text = .mName_str
mskPttRegNo.Text = ToMyNumFmt(.mPttRegNo_lng, mDecimals:=0)
dtpPttRegDate.Text = Dtoc(.mPttRegDate_dt)
txtPttSex.Text = .mPttSex_str
mskPttAgeYr.Text = 0
mskPttAgeMn.Text = 0
mskPttAgeDy.Text = 0
dtpPttAgeAsOnDt.Text = Dtoc(.mPttAgeAsOnDt_dt)
dtpPttDob.Text = Dtoc(.mPttDob_dt)
clsPCG.GetData .mPttPcgCode_lng: txtPcgName.Text = clsPCG.mName_str
txtPttRefRela.Text = .mPttRefRela_str
txtPttRefName.Text = .mPttRefName_str
txtPttAddr.Text = .mPttAddr_str
clsARA.GetData .mPttAraCode_lng: txtAraName.Text = clsARA.mName_str
clsSTN.GetData .mPttStnCode_lng: txtStnName.Text = clsSTN.mName_str
txtPttTelNo.Text = .mPttTelNo_str
txtPttSMSNo.Text = .mPttSMSNo_str
End With

Call ShowPatAge
'Call ShowPatBal

Rem disallow editing for exising patients, strictly from patient master only
txtPttName.Locked = (mPttCode > 0)
mskPttRegNo.Locked = (mPttCode > 0)
dtpPttRegDate.Locked = (mPttCode > 0)
txtPttSex.Locked = (mPttCode > 0)
mskPttAgeYr.Locked = (mPttCode > 0)
mskPttAgeMn.Locked = (mPttCode > 0)
mskPttAgeDy.Locked = (mPttCode > 0)
dtpPttAgeAsOnDt.Locked = (mPttCode > 0)
dtpPttDob.Locked = (mPttCode > 0)
txtPcgName.Locked = (mPttCode > 0)
txtPttRefRela.Locked = (mPttCode > 0)
txtPttRefName.Locked = (mPttCode > 0)
txtPttAddr.Locked = (mPttCode > 0)
txtAraName.Locked = (mPttCode > 0)
txtStnName.Locked = (mPttCode > 0)
txtPttTelNo.Locked = (mPttCode > 0)
txtPttSMSNo.Locked = (mPttCode > 0)

End Sub

Private Sub ShowPatDefData()
dtpPttRegDate.Text = Dtoc(DefaultEntryDate)
dtpPttAgeAsOnDt.Text = dtpPttRegDate.Text

End Sub

Private Sub StorePatOldData()
mPttRegNo_old = Val(UnMyNumFmt(mskPttRegNo.Text))

End Sub

Private Sub ShowPatBal()
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

Private Sub ShowIpgData(ByVal mIpgCode As Long)
With clsIPG
.GetData mIpgCode

mskIgtIpgCode.Text = mIpgCode
clsVTM.GetData .mVtmCode_lng: txtIpgVtmName.Text = clsVTM.mName_str
txtIpgPrefix.Text = .mIpgPrefix_str
mskIpgVchNo.Text = ToMyNumFmt(.mVchNo_lng, mDecimals:=0)
dtpIpgDate.Text = Dtoc(.mVchDate_dt)
txtIpgTime_str.Text = MinToTime(.mIpgTime_lng)
clsDCT.GetData .mIpgCDctCode_lng: txtCDctName.Text = clsDCT.mName_str
clsDCT.GetData .mIpgRByCode_lng: txtRByName.Text = clsDCT.mName_str
clsDIG.GetData .mIpgFDigCode_lng: txtFDigName.Text = clsDIG.mName_str
txtIpgRemark.Text = .mIpgRemark_str
End With
ShowIpgLinkTranAmt mIpgCode

txtIpgVtmName.Locked = (mIpgCode > 0)
txtIpgPrefix.Locked = (mIpgCode > 0)
mskIpgVchNo.Locked = (mIpgCode > 0)
dtpIpgDate.Locked = (mIpgCode > 0)
txtIpgTime_str.Locked = (mIpgCode > 0)
txtCDctName.Locked = (mIpgCode > 0)
txtRByName.Locked = (mIpgCode > 0)
txtFDigName.Locked = (mIpgCode > 0)
txtIpgRemark.Locked = (mIpgCode > 0)

End Sub

Private Sub ShowIpgDefData()
Dim mIpgVchNo As Long

dtpIpgDate.Text = Dtoc(DefaultEntryDate)
txtIpgTime_str.Text = MinToTime(TimeToMin(DateTime.Time$))
txtIpgVtmName.Text = ""
txtIpgPrefix.Text = ""
mskIpgVchNo.Text = 0

End Sub

Private Sub StoreIpgOldData()
Rem nothing
End Sub

Private Sub ShowIgtData(ByVal mIgtCode As Long)

With clsIGT
.GetData mIgtCode

mskFormBoundField.Text = mIgtCode
fcmbIgtVtmName.BoundText = CStr(.mVtmCode_lng): txtIgtVtmName(0).Text = fcmbIgtVtmName.Text
txtIgtPrefix.Text = .mIgtPrefix_str
mskIgtVchNo(0).Text = ToMyNumFmt(.mVchNo_lng, mDecimals:=0)
dtpIgtDate.Text = Dtoc(.mVchDate_dt)
txtIgtTime_str.Text = MinToTime(.mIgtTime_lng)
txtIgtRemark.Text = .mIgtRemark_str
mskIgtDpogAmt.Text = ToMyNumFmt(.mIgtDpogAmt_dbl)
mskIgtAdjAmt.Text = ToMyNumFmt(.mIgtAdjAmt_dbl)
mskIgtBalAmt.Text = ToMyNumFmt(.mIgtBalAmt_dbl)
Rem old indoor bill
mIgtOldIgtCode = .mIgtOldIgtCode_lng
ShowOldIgtCodeDesc mIgtOldIgtCode
End With

''Call CalcIblChg
''ShowDtlData mIgtCode

End Sub

Private Sub ShowIgtDefData()
Dim mIgtVchNo As Long

dtpIgtDate.Text = Dtoc(DefaultEntryDate)
txtIgtTime_str.Text = MinToTime(TimeToMin(DateTime.Time$))

fcmbIgtVtmName.BoundText = CStr(clsHOPT.GetIndrRgPymtOptBoundCode("IgtVtmCode")): txtIgtVtmName(0).Text = fcmbIgtVtmName.Text

mIgtVchNo = GetNextVTypeNo(dbHmsDatabase, dbAcDatabase, dbComDatabase, mTableName:="IndrRgPymt", mFieldName:="IgtVchNo", mVtmFieldName:="IgtVtmCode", mVtmFieldValue:=Val(fcmbIgtVtmName.BoundText), mFinYrFieldName:="IgtCmpCode", mFinYrFieldValue:=sFinYrCmpCode, mDateFieldName:="IgtDate", mDateFieldValue:=Ctod(dtpIgtDate.Text), mModuleCode:=mFormUIdCode, mModuleName:=Me.Name, mAcsPermFileName:=mFormAcsPermFileName)
mskIgtVchNo(0).Text = ToMyNumFmt(mIgtVchNo, mDecimals:=0)

End Sub

Private Sub StoreIgtOldData()
mIgtCode_old = mIgtCode
mIgtDate_old = Ctod(dtpIgtDate.Text)
mIgtVtmCode_old = Val(fcmbIgtVtmName.BoundText)
mIgtVchNo_old = Val(UnMyNumFmt(mskIgtVchNo(0).Text))
mIgtDpogAmt_old = Val(UnMyNumFmt(mskIgtDpogAmt.Text))
mIgtAdjAmt_old = Val(UnMyNumFmt(mskIgtAdjAmt.Text))

End Sub

Private Sub Data_SaveEvent()

With clsIGT
If FormAddEditMode = cFORM_ADDMODE Then
    .Clear
Else
    .GetData mIgtCode
End If
.mVchDate_dt = Ctod(dtpIgtDate.Text)
.mVtmCode_lng = Val(fcmbIgtVtmName.BoundText)
.mIgtPrefix_str = txtIgtPrefix.Text
.mVchNo_lng = Val(UnMyNumFmt(mskIgtVchNo(0).Text))
.mIgtPostfix_str = ""
.mCmpCode_int = sFinYrCmpCode

.mIgtTime_lng = TimeToMin(txtIgtTime_str.Text)
.mIgtIpgCode_lng = mIgtIpgCode
.mIgtPttCode_lng = mIgtPttCode
.mIgtOldIgtCode_lng = mIgtOldIgtCode
.mIgtDpogAmt_dbl = Val(UnMyNumFmt(mskIgtDpogAmt.Text))
.mIgtAdjAmt_dbl = .mIgtAdjAmt_dbl
.mIgtBalAmt_dbl = .mIgtDpogAmt_dbl - .mIgtAdjAmt_dbl
.mIgtRemark_str = txtIgtRemark.Text
If FormAddEditMode = cFORM_ADDMODE Then
    If .AddNew() = True Then
        mskFormBoundField.Text = .mCode_lng
    End If
Else
    .Update mIgtCode
End If
If .mCode_lng > 0 Then   ' updated successfully
    mIgtCode = .mCode_lng
    
    .UpdateTran .mCode_lng
    .EndTran .mCode_lng
        
    Rem updating user editing carry forward features
    clsHOPT.mIgtVtmCodeOld_lng = .mVtmCode_lng
    clsHOPT.UpdateIndrRgPymtOld
    
    mEntrySaved = True
Else
    Call Data_CancelEvent
    ErrorBox "Entry Cancelled !!!"
End If
End With

If clsIGT.mCode_lng > 0 Then   ' updated successfully
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

If CanUserDeleteOpt(mUsrCode:=MyCompany.mUserCode, mMenuOptName:=Me.SecuMenuName) = False Then
    AlertBox "Not Permitted !!!"
    Exit Sub
End If
If (datRecset.EOF Or datRecset.BOF) = True Then
    Exit Sub
End If

mIgtCode = datRecset.fields("IgtCode")
mIgtPttCode = datRecset.fields("IgtPttCode")
mRecAbsPos = datRecset.AbsolutePosition

If clsIGT.CanDeleteTran(mIgtCode) = True Then
    txtVoid.SetFocus
    If clsIGT.BeginTran(mIgtCode) = True Then
        clsIGT.DeleteTran mIgtCode
        clsIGT.UpdateTran mIgtCode
        clsIGT.EndTran mIgtCode
    
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
clsIGT.CancelTran mIgtCode
clsIGT.EndTran mIgtCode

mEntryAborted = True

End Sub

Private Sub txtPttRefName_GotFocus()
FlashActiveControl txtPttRefName, True
End Sub

Private Sub txtPttRefName_LostFocus()
FlashActiveControl txtPttRefName, False
End Sub

Private Sub txtPttRefName_Validate(Cancel As Boolean)
txtPttRefName.Text = ToMyWord(txtPttRefName.Text)
End Sub

Private Sub txtPttRefRela_GotFocus()
FlashActiveControl txtPttRefRela, True
End Sub

Private Sub txtPttRefRela_LostFocus()
FlashActiveControl txtPttRefRela, False
End Sub

Private Sub txtPttSex_GotFocus()
FlashActiveControl txtPttSex, True
End Sub

Private Sub txtPttSex_LostFocus()
FlashActiveControl txtPttSex, False
End Sub

Private Sub txtPttSMSNo_GotFocus()
FlashActiveControl txtPttSMSNo, True
End Sub

Private Sub txtPttSMSNo_LostFocus()
FlashActiveControl txtPttSMSNo, False
End Sub

Private Sub txtPttTelNo_GotFocus()
FlashActiveControl txtPttTelNo, True
End Sub

Private Sub txtPttTelNo_LostFocus()
FlashActiveControl txtPttTelNo, False
End Sub

Private Sub txtPcgName_GotFocus()
FlashActiveControl txtPcgName, True
End Sub

Private Sub txtPcgName_LostFocus()
FlashActiveControl txtPcgName, False
End Sub

Private Sub SmryList()
Dim gcolcount As Integer, acount As Integer, mLow As Integer, mHigh As Integer, mPos As Integer, srow As Long, mColCount As Integer
Dim aAcntBal As Variant, mBal As Double

If datRecset.State = 1 Then
    CloseTable datRecset
End If
RefreshDatabase dbHmsDatabase
RefreshDatabase dbAcDatabase
RefreshDatabase dbGrpDatabase
RefreshDatabase dbComDatabase
clsListStru.Clear

If optMonthwise.Value = True Or optDatewise.Value = True Or optPatientwise.Value = True Then
    If optMonthwise.Value = True Then
        clsListStru.AddFields mExpr:="IgtYrMonth", mAttrib:=cFAT_SYSTEM
        clsListStru.AddFields mExpr:="IgtMnYear", mTitle:="Month", mShowItem:=True, mAlign:=1, mWidth:=2000
        clsListStru.AddFields mExpr:="IgtCount", mTitle:="Count", mShowItem:=True, mAlign:=7, mWidth:=1500
        clsListStru.AddFields mExpr:="IgtDpogAmt_sum", mTitle:="Depo.Amt", mShowItem:=True, mAlign:=7, mWidth:=1500
        
        datRecset.open "Select format(IgtDate,'yyyy/MM') as IgtYrMonth" _
         & ",Count(IgtCode) as IgtCount" _
         & ",Sum(IgtDpogAmt) as IgtDpogAmt_sum" _
         & " from IndrRgPymt" _
         & " where IgtDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
         & " and IgtCode>0" _
         & IIf(mQryPttCode > 0, " and IgtPttCode=" & CStr(mQryPttCode), "") _
         & " group by format(IgtDate,'yyyy/MM')" _
         & " order by format(IgtDate,'yyyy/MM')" _
         , dbHmsDatabase, adOpenKeyset, adLockReadOnly

    ElseIf optDatewise.Value = True Then
        clsListStru.AddFields mExpr:="IgtDateYMD", mAttrib:=cFAT_SYSTEM
        clsListStru.AddFields mExpr:="IgtDate", mTitle:="Date", mShowItem:=True, mAlign:=1, mWidth:=2000
        clsListStru.AddFields mExpr:="IgtCount", mTitle:="Count", mShowItem:=True, mAlign:=7, mWidth:=1500
        clsListStru.AddFields mExpr:="IgtDpogAmt_sum", mTitle:="Depo.Amt", mShowItem:=True, mAlign:=7, mWidth:=1500
        
        datRecset.open "Select IgtDate" _
         & ",Count(IgtCode) as IgtCount" _
         & ",Sum(IgtDpogAmt) as IgtDpogAmt_sum" _
         & " from IndrRgPymt" _
         & " where IgtDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
         & " and IgtCode>0" _
         & IIf(mQryPttCode > 0, " and IgtPttCode=" & CStr(mQryPttCode), "") _
         & " group by IgtDate" _
         & " order by IgtDate" _
         , dbHmsDatabase, adOpenKeyset, adLockReadOnly
        
    ElseIf optPatientwise.Value = True Then
        clsListStru.AddFields mExpr:="PttName", mTitle:="Patient Name", mShowItem:=True, mAlign:=1, mWidth:=3000
        clsListStru.AddFields mExpr:="PttRegNo", mTitle:="Reg.No", mShowItem:=True, mAlign:=7, mWidth:=1500
        clsListStru.AddFields mExpr:="PttRefName", mTitle:="Care of", mShowItem:=True, mAlign:=1, mWidth:=2000
        clsListStru.AddFields mExpr:="IgtCount", mTitle:="Count", mShowItem:=True, mAlign:=7, mWidth:=1500
        clsListStru.AddFields mExpr:="IgtDpogAmt_sum", mTitle:="Depo.Amt", mShowItem:=True, mAlign:=7, mWidth:=1500
        
        datRecset.open "Select PatMast.PttName,PatMast.PttRegNo,IndrRgPymt.IgtPttCode" _
         & ",Count(IgtCode) as IgtCount" _
         & ",Sum(IgtDpogAmt) as IgtDpogAmt_sum" _
         & " from IndrRgPymt inner join PatMast on IndrRgPymt.IgtPttCode=PatMast.PttCode" _
         & " where IgtDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
         & " and IgtCode>0" _
         & IIf(mQryPttCode > 0, " and IgtPttCode=" & CStr(mQryPttCode), "") _
         & " group by PatMast.PttName,PatMast.PttRegNo,IndrRgPymt.IgtPttCode" _
         & " order by PatMast.PttName,PatMast.PttRegNo,IndrRgPymt.IgtPttCode" _
         , dbHmsDatabase, adOpenKeyset, adLockReadOnly
    End If
    
ElseIf optDetailed.Value = True Then
    clsListStru.AddFields mExpr:="tIgtSmryId", mAttrib:=cFAT_SYSTEM
    clsListStru.AddFields mExpr:="IgtCode", mAttrib:=cFAT_SYSTEM
    clsListStru.AddFields mExpr:="VtmName", mTitle:="Voucher", mAlign:=1, mWidth:=1500, mShowItem:=True
    clsListStru.AddFields mExpr:="IblVchNo", mTitle:="Vchr.No", mAlign:=7, mWidth:=1250, mShowItem:=True
    clsListStru.AddFields mExpr:="IgtDate", mTitle:="Date", mAlign:=1, mWidth:=1300, mShowItem:=True
    ' -------------------------------------
    clsListStru.AddFields mExpr:="PttCode", mAttrib:=cFAT_SYSTEM
    clsListStru.AddFields mExpr:="PttName", mTitle:="Patient Name", mAlign:=1, mWidth:=2500, mShowItem:=True
    clsListStru.AddFields mExpr:="PttRegNo", mTitle:="Reg.No", mAlign:=7, mWidth:=1250, mShowItem:=True
    clsListStru.AddFields mExpr:="IgtDpogAmt", mTitle:="Depo.Amt", mAlign:=7, mWidth:=1250, mShowItem:=True
    ' --------------------------------------
    clsListStru.AddFields mExpr:="PttRefName", mTitle:="Care of", mAlign:=1, mWidth:=2000, mShowItem:=True
    clsListStru.AddFields mExpr:="PttAddr", mTitle:="Address", mAlign:=1, mWidth:=2000, mShowItem:=True
    clsListStru.AddFields mExpr:="PatAraName", mTitle:="Area", mAlign:=1, mWidth:=1500, mShowItem:=True
    clsListStru.AddFields mExpr:="PatStnName", mTitle:="Station", mAlign:=1, mWidth:=1500, mShowItem:=True
    clsListStru.AddFields mExpr:="PatPcgName", mTitle:="Category", mAlign:=1, mWidth:=2000, mShowItem:=True
    
    datRecset.open "Select IndrRgPymt.*,PatMast.*" _
     & ",format(IgtDate,'yyyymmdd')+format(IgtCode,'0000000') as tIgtSmryId" _
     & " from IndrRgPymt inner join PatMast on IndrRgPymt.IgtPttCode=PatMast.PttCode" _
     & " where IgtDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
     & IIf(mRemoteAccess = True, " and IgtCode=" & CStr(mIgtCode) & "", "") _
     & " and IgtCode>0" _
     & IIf(mQryPttCode > 0, " and IgtPttCode=" & CStr(mQryPttCode), "") _
     & " order by IgtDate,IgtCode" _
     , dbHmsDatabase, adOpenKeyset, adLockReadOnly
    
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
MoveRecToFirst datRecset
With datRecset
If .RecordCount > 0 Then
    Do While .EOF = False
        If optMonthwise.Value = True Or optDatewise.Value = True Or optPatientwise.Value = True Then
            If optMonthwise.Value = True Then
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("IgtYrMonth")) = .fields("IgtYrMonth")
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("IgtMnYear")) = MonthName(Val(Right(.fields("IgtYrMonth"), 2))) & "-" & Left(.fields("IgtYrMonth"), 4)
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("IgtCount")) = ToMyNumFmt(.fields("IgtCount"), mDecimals:=0)
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("IgtDpogAmt_sum")) = ToMyNumFmt(.fields("IgtDpogAmt_sum"))
                
            ElseIf optDatewise.Value = True Then
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("IgtDateYMD")) = Format(.fields("IgtDate"), "yyyymmdd")
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("IgtDate")) = Dtoc(.fields("IgtDate"))
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("IgtCount")) = ToMyNumFmt(.fields("IgtCount"), mDecimals:=0)
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("IgtDpogAmt_sum")) = ToMyNumFmt(.fields("IgtDpogAmt_sum"))
                
            ElseIf optPatientwise.Value = True Then
                clsPAT.GetData .fields("IgtPttCode")
                
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("PttName")) = .fields("PttName")
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("PttRegNo")) = ToMyNumFmt(.fields("PttRegNo"), mDecimals:=0)
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("PttRefName")) = clsPAT.mPttRefName_str
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("IgtCount")) = ToMyNumFmt(.fields("IgtCount"), mDecimals:=0)
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("IgtDpogAmt_sum")) = ToMyNumFmt(.fields("IgtDpogAmt_sum"))
                
            End If
        
        ElseIf optDetailed.Value = True Then
            clsPCG.GetData .fields("PttPcgCode")
            clsARA.GetData .fields("PttAraCode")
            clsSTN.GetData .fields("PttStnCode")
            clsVTM.GetData .fields("IgtVtmCode")
            
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("tIgtSmryId")) = Format(.fields("IgtDate"), "yyyymmdd") & Format(.fields("IgtCode"), "0000000")
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("IgtCode")) = .fields("IgtCode")
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("VtmName")) = clsVTM.mName_str
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("IblVchNo")) = .fields("IgtVchNo")
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("IgtDate")) = Dtoc(.fields("IgtDate"))
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("IgtDpogAmt")) = ToMyNumFmt(.fields("IgtDpogAmt"))
            ' ------------------------------------
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("PttCode")) = .fields("PttCode")
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("PttName")) = .fields("PttName")
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("PttRegNo")) = .fields("PttRegNo")
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("PttRefName")) = .fields("PttRefName")
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("PttAddr")) = .fields("PttAddr")
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("PatAraName")) = clsARA.mName_str
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("PatStnName")) = clsSTN.mName_str
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("PatPcgName")) = clsPCG.mName_str
        
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
    fcmbPttRegNo.BoundText = CStr(mQryPttCode)
    fcmbPttName.BoundText = CStr(mQryPttCode)
    mskQryPttRegNo.Text = fcmbPttRegNo.Text
    txtQryPttName.Text = fcmbPttName.Text
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
    If optDetailed.Value = True Then
        SearchFlex Mfgrd1, clsListStru.GetItemIndex("tIgtSmryId"), mText
    ElseIf optMonthwise.Value = True Then
        SearchFlex Mfgrd1, clsListStru.GetItemIndex("IgtYrMonth"), mText
    ElseIf optDatewise.Value = True Then
        SearchFlex Mfgrd1, clsListStru.GetItemIndex("IgtDateYMD"), mText
    ElseIf optPatientwise.Value = True Then
        SearchFlex Mfgrd1, clsListStru.GetItemIndex("PttName"), mText
    End If
End If
ShowActiveFlexRow Mfgrd1

End Sub

Private Sub txtQryPttName_Change()
If fcmbPttName.CallFromText_Change = False Then
    fcmbPttName.CallFromText_Change = True
    If InterActiveChange(txtQryPttName) = True Then
        Call ChkPttNameListFirstTime
        
        fcmbPttName.UserText = Array(txtQryPttName.Text, txtQryPttName.SelStart)
        fcmbPttName.Show
        txtQryPttName.Text = fcmbPttName.Text
        mQryPttCode = Val(fcmbPttName.BoundText)
        fcmbPttRegNo.BoundText = CStr(mQryPttCode)
        mskQryPttRegNo.Text = fcmbPttRegNo.Text
        If fcmbPttName.ListSelected = True Then
            SendKeys "{tab}"
        End If
    End If
    fcmbPttName.CallFromText_Change = False
End If

End Sub

Private Sub ChkPttNameListFirstTime()
If fcmbPttName.LRecordCount = 0 Then
    fcmbPttName.mFiltCond = ""
    fcmbPttName.ReInit
End If

End Sub

Private Sub txtQryPttName_GotFocus()
FlashActiveControl txtQryPttName, True
End Sub

Private Sub txtQryPttName_KeyDown(KeyCode As Integer, Shift As Integer)
If MyDropDownKey(Shift, KeyCode) = True Then
    Call txtQryPttName_Change
ElseIf MyAddNewKey(Shift, KeyCode) = True Then
    Rem not required
End If

End Sub

Private Sub txtQryPttName_LostFocus()
FlashActiveControl txtQryPttName, False
End Sub

Private Sub txtRByName_GotFocus()
FlashActiveControl txtRByName, True
End Sub

Private Sub txtRByName_LostFocus()
FlashActiveControl txtRByName, False
End Sub

Private Sub txtSearch1Text_GotFocus()
FlashActiveControl txtSearch1Text, True
End Sub

Private Sub txtSearch1Text_LostFocus()
FlashActiveControl txtSearch1Text, False
End Sub

Private Sub txtStnName_GotFocus()
FlashActiveControl txtStnName, True
End Sub

Private Sub txtStnName_LostFocus()
FlashActiveControl txtStnName, False
End Sub

Private Sub ShowPttDob()
Dim mPttDob As Date

mPttDob = CalcDob(Ctod(dtpPttAgeAsOnDt.Text), Val(mskPttAgeYr.Text), Val(mskPttAgeMn.Text), Val(mskPttAgeDy.Text))
dtpPttDob.Text = Dtoc(mPttDob)

End Sub

Private Sub ShowPatAge()
Dim mYears As Long, mMonths As Long, mDays As Long

CalcAge Ctod(dtpPttDob.Text), Ctod(dtpPttAgeAsOnDt.Text), mYears, mMonths, mDays
mskPttAgeYr.Text = CStr(mYears)
mskPttAgeMn.Text = CStr(mMonths)
mskPttAgeDy.Text = CStr(mDays)

End Sub

Private Sub txtIpgVtmName_GotFocus()
FlashActiveControl txtIpgVtmName, True
End Sub

Private Sub txtIpgVtmName_KeyDown(KeyCode As Integer, Shift As Integer)
If MyDropDownKey(Shift, KeyCode) = True Then
    Call ShowOldIpgListByIpgNo
ElseIf MyAddNewKey(Shift, KeyCode) = True Then

ElseIf Shift = 0 And KeyCode = vbKeyF6 Then
    
End If

End Sub

Private Sub txtIpgVtmName_LostFocus()
FlashActiveControl txtIpgVtmName, False
End Sub

Private Sub ShowOldIgtCodeDesc(ByVal mOldIgtCode As Long)
Dim tRecset As New ADODB.Recordset

With tRecset
.open "Select * from IndrRgPymt where IgtCode=" & CStr(mOldIgtCode) & "", dbHmsDatabase, adOpenKeyset, adLockOptimistic
If .RecordCount > 0 Then
    clsVTM.GetData .fields("IgtVtmCode")
    lblOldIgtCodeDesc.Caption = RTrim(clsVTM.mName_str) & " No.:" & CStr(.fields("IgtVchNo")) & " Dated:" & Dtoc(.fields("IgtDate"))
Else
    lblOldIgtCodeDesc.Caption = "#" & CStr(mOldIgtCode) & "#"
End If
End With
CloseTable tRecset

End Sub

Private Sub ShowIpgLinkTranAmt(ByVal mIgtIpgCode As Long)
Dim mIblAmtAftDiscTot As Double, mIpgAdvAmtTot As Double, mIrcAmtAftDiscTot As Double, mIrcRecdAmtTot As Double, mIrcDepoAmtTot As Double, mIrcRefuAmtTot As Double, mIrcBalAmtTot As Double, mIgtDpogAmtTot As Double, mIgfRfugAmtTot As Double, mIbpyDepoAmtTot As Double, mIbfdRefuAmtTot As Double, mPymtTot As Double, mRefdTot As Double, mBalAmtTot As Double
Dim mLinkTranStr As String, mAdjTranStr As String

GetIndrLinkTranAmt cnn:=dbHmsDatabase, mIpgCode:=mIgtIpgCode, mIblAmtAftDiscTot:=mIblAmtAftDiscTot, mIpgAdvAmtTot:=mIpgAdvAmtTot, mIrcAmtAftDiscTot:=mIrcAmtAftDiscTot, mIrcRecdAmtTot:=mIrcRecdAmtTot, mIrcDepoAmtTot:=mIrcDepoAmtTot, mIrcRefuAmtTot:=mIrcRefuAmtTot, mIrcBalAmtTot:=mIrcBalAmtTot, mIgtDpogAmtTot:=mIgtDpogAmtTot, mIgfRfugAmtTot:=mIgfRfugAmtTot, mIbpyDepoAmtTot:=mIbpyDepoAmtTot, mIbfdRefuAmtTot:=mIbfdRefuAmtTot
If InterActiveChange(mskIgtDpogAmt) = True Then
    mIgtDpogAmtTot = mIgtDpogAmtTot - mIgtDpogAmt_old + Val(UnMyNumFmt(mskIgtDpogAmt.Text))
Else
    mIgtDpogAmtTot = mIgtDpogAmtTot
End If

mBalAmtTot = mIblAmtAftDiscTot - (mIpgAdvAmtTot + mIgtDpogAmtTot + mIbpyDepoAmtTot) + (mIgfRfugAmtTot + mIbfdRefuAmtTot) + mIrcBalAmtTot
mPymtTot = (mIpgAdvAmtTot + mIgtDpogAmtTot + mIbpyDepoAmtTot + mIrcRecdAmtTot)
mRefdTot = (mIgfRfugAmtTot + mIbfdRefuAmtTot + mIrcRefuAmtTot)

lblIblAmtAftDiscTot.Caption = ToMyNumFmt(mIblAmtAftDiscTot)
lblIpgAdvAmtTot.Caption = ToMyNumFmt(mIpgAdvAmtTot)
lblIrcAmtAftDiscTot.Caption = ToMyNumFmt(mIrcAmtAftDiscTot)
lblIrcRecdAmtTot.Caption = ToMyNumFmt(mIrcRecdAmtTot)
lblIrcBalAmtTot.Caption = ToMyNumFmt(mIrcBalAmtTot)
lblIgtDpogAmtTot.Caption = ToMyNumFmt(mIgtDpogAmtTot)
lblIgfRfugAmtTot.Caption = ToMyNumFmt(mIgfRfugAmtTot)
lblIbpyDepoAmtTot.Caption = ToMyNumFmt(mIbpyDepoAmtTot)
lblIbfdRefuAmtTot.Caption = ToMyNumFmt(mIbfdRefuAmtTot)
lblPymtTot.Caption = ToMyNumFmt(mPymtTot)
lblRefdTot.Caption = ToMyNumFmt(mRefdTot)
lblBalAmtTot.Caption = ToMyNumFmt(mBalAmtTot)

mAdjTranStr = GetIndrIgtAdjTranVchr(cnn:=dbComDatabase, mIpgCode:=mIgtIpgCode, mIgtCode:=mIgtCode)
txtIpgAdjTranVchr.Text = mAdjTranStr ''' Replace(mLinkTranStr, vbCrLf, "; ")

mLinkTranStr = GetIndrLinkTranVchr(cnn:=dbComDatabase, mIpgCode:=mIgtIpgCode)
txtIpgLinkTranVchr.Text = mLinkTranStr ''' Replace(mLinkTranStr, vbCrLf, "; ")

End Sub

Private Function GetOldIgtCodeFromPttCode(ByVal mPttCode As Long) As Long
Dim tRecset As New ADODB.Recordset

With tRecset
.open "Select top 1 * from IndrRgPymt where IgtPttCode=" & CStr(mPttCode) & " order by IgtDate desc,IgtVchNo desc,IgtCode desc", dbHmsDatabase, adOpenKeyset, adLockOptimistic
If .RecordCount > 0 Then
    GetOldIgtCodeFromPttCode = .fields("IgtCode")
Else
    GetOldIgtCodeFromPttCode = 0
End If
End With
CloseTable tRecset

End Function

Private Function GetOldIpgCodeFromPttCode(ByVal mPttCode As Long) As Long
Dim tRecset As New ADODB.Recordset

With tRecset
.open "Select top 1 * from IndrReg where IpgPttCode=" & CStr(mPttCode) & " order by IpgDate desc,IpgVchNo desc,IpgCode desc", dbHmsDatabase, adOpenKeyset, adLockOptimistic
If .RecordCount > 0 Then
    GetOldIpgCodeFromPttCode = .fields("IpgCode")
Else
    GetOldIpgCodeFromPttCode = 0
End If
End With
CloseTable tRecset

End Function

Private Sub ShowOldIpgListByIpgNo()
Dim tRecset As New ADODB.Recordset, mOldIpgCode As Long, mOldIpgPttCode As Long

If fcmbAdmIpgByIpgNo.CallFromText_Change = False Then
    fcmbAdmIpgByIpgNo.CallFromText_Change = True
    If InterActiveChange(txtIpgVtmName) = True Then
        If fcmbAdmIpgByIpgNo.LRecordCount = 0 Then
            fcmbAdmIpgByIpgNo.mFiltCond = ""
            fcmbAdmIpgByIpgNo.ReInit
        End If
        
        fcmbAdmIpgByIpgNo.UserText = Array("", 0)
        fcmbAdmIpgByIpgNo.Show
        If FormAddEditMode = cFORM_ADDMODE And fcmbAdmIpgByIpgNo.ListSelected = True And Val(fcmbAdmIpgByIpgNo.BoundText) > 0 Then
            mOldIpgCode = Val(fcmbAdmIpgByIpgNo.BoundText)
            tRecset.open "Select * from IndrReg where IpgCode=" & CStr(mOldIpgCode) & "", dbHmsDatabase, adOpenKeyset, adLockOptimistic
            If tRecset.RecordCount > 0 Then
                mOldIpgPttCode = tRecset.fields("IpgPttCode")
            End If
            CloseTable tRecset
            If mOldIpgCode > 0 And mOldIpgPttCode > 0 Then
                mIgtPttCode = mOldIpgPttCode
                ShowPatData mIgtPttCode
                Call StorePatOldData
                'ShowPttDiscPer mIgtPttCode
                
                mIgtIpgCode = mOldIpgCode
                ShowIpgData mIgtIpgCode
                Call StoreIpgOldData
                
                mIgtOldIgtCode = GetOldIgtCodeFromPttCode(mIgtPttCode)
                ShowOldIgtCodeDesc mIgtOldIgtCode
            End If
        Else
            If fcmbAdmIpgByIpgNo.ListSelected = True And Val(fcmbAdmIpgByIpgNo.BoundText) > 0 Then
                If FormAddEditMode = cFORM_EDITMODE Then
                    AlertBox "Prohibited in Edit Mode !!!"
                End If
            End If
        End If
    End If
    fcmbAdmIpgByIpgNo.CallFromText_Change = False
End If
CloseTable tRecset, mCheckOpen:=True

End Sub

Private Sub ShowOldIpgListByPttRegNo()
Dim tRecset As New ADODB.Recordset, mOldIpgCode As Long, mOldIpgPttCode As Long

If fcmbAdmIpgByPttRegNo.CallFromText_Change = False Then
    fcmbAdmIpgByPttRegNo.CallFromText_Change = True
    If InterActiveChange(mskPttRegNo) = True Then
        If fcmbAdmIpgByPttRegNo.LRecordCount = 0 Then
            fcmbAdmIpgByPttRegNo.mFiltCond = ""
            fcmbAdmIpgByPttRegNo.ReInit
        End If
        
        fcmbAdmIpgByPttRegNo.UserText = Array("", 0)
        fcmbAdmIpgByPttRegNo.Show
        If FormAddEditMode = cFORM_ADDMODE And fcmbAdmIpgByPttRegNo.ListSelected = True And Val(fcmbAdmIpgByPttRegNo.BoundText) > 0 Then
            mOldIpgCode = Val(fcmbAdmIpgByPttRegNo.LFieldValue("IpgCode"))
            tRecset.open "Select * from IndrReg where IpgCode=" & CStr(mOldIpgCode) & "", dbHmsDatabase, adOpenKeyset, adLockOptimistic
            If tRecset.RecordCount > 0 Then
                mOldIpgPttCode = tRecset.fields("IpgPttCode")
            End If
            CloseTable tRecset
            If mOldIpgCode > 0 And mOldIpgPttCode > 0 Then
                mIgtPttCode = mOldIpgPttCode
                ShowPatData mIgtPttCode
                Call StorePatOldData
                'ShowPttDiscPer mIgtPttCode
                
                mIgtIpgCode = mOldIpgCode
                ShowIpgData mIgtIpgCode
                Call StoreIpgOldData
                
                mIgtOldIgtCode = GetOldIgtCodeFromPttCode(mIgtPttCode)
                ShowOldIgtCodeDesc mIgtOldIgtCode
            End If
        Else
            If fcmbAdmIpgByPttRegNo.ListSelected = True And Val(fcmbAdmIpgByPttRegNo.BoundText) > 0 Then
                If FormAddEditMode = cFORM_EDITMODE Then
                    AlertBox "Prohibited in Edit Mode !!!"
                End If
            End If
        End If
    End If
    fcmbAdmIpgByPttRegNo.CallFromText_Change = False
End If
CloseTable tRecset, mCheckOpen:=True

End Sub

Private Sub ShowOldIpgListByPttName()
Dim tRecset As New ADODB.Recordset, mOldIpgCode As Long, mOldIpgPttCode As Long

If fcmbAdmIpgByPttName.CallFromText_Change = False Then
    fcmbAdmIpgByPttName.CallFromText_Change = True
    If InterActiveChange(txtPttName) = True Then
        If fcmbAdmIpgByPttName.LRecordCount = 0 Then
            fcmbAdmIpgByPttName.mFiltCond = ""
            fcmbAdmIpgByPttName.ReInit
        End If
        
        fcmbAdmIpgByPttName.UserText = Array("", 0)
        fcmbAdmIpgByPttName.Show
        If FormAddEditMode = cFORM_ADDMODE And fcmbAdmIpgByPttName.ListSelected = True And Val(fcmbAdmIpgByPttName.BoundText) > 0 Then
            mOldIpgCode = Val(fcmbAdmIpgByPttName.LFieldValue("IpgCode"))
            tRecset.open "Select * from IndrReg where IpgCode=" & CStr(mOldIpgCode) & "", dbHmsDatabase, adOpenKeyset, adLockOptimistic
            If tRecset.RecordCount > 0 Then
                mOldIpgPttCode = tRecset.fields("IpgPttCode")
            End If
            CloseTable tRecset
            If mOldIpgCode > 0 And mOldIpgPttCode > 0 Then
                mIgtPttCode = mOldIpgPttCode
                ShowPatData mIgtPttCode
                Call StorePatOldData
                'ShowPttDiscPer mIgtPttCode
                
                mIgtIpgCode = mOldIpgCode
                ShowIpgData mIgtIpgCode
                Call StoreIpgOldData
                
                mIgtOldIgtCode = GetOldIgtCodeFromPttCode(mIgtPttCode)
                ShowOldIgtCodeDesc mIgtOldIgtCode
            End If
        Else
            If fcmbAdmIpgByPttName.ListSelected = True And Val(fcmbAdmIpgByPttName.BoundText) > 0 Then
                If FormAddEditMode = cFORM_EDITMODE Then
                    AlertBox "Prohibited in Edit Mode !!!"
                End If
            End If
        End If
    End If
    fcmbAdmIpgByPttName.CallFromText_Change = False
End If
CloseTable tRecset, mCheckOpen:=True

End Sub

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
Dim mIgtVchNo As Long

If Val(fcmbIgtVtmName.BoundText) < 1 Then
    ErrorBox "Invalid Voucher Type !!!"
    txtIgtVtmName(1).SetFocus
    Exit Sub
End If
If Val(UnMyNumFmt(mskIgtVchNo(1).Text)) < 1 Then
    ErrorBox "Invalid Voucher No. !!!"
    mskIgtVchNo(1).SetFocus
    Exit Sub
Else
    mIgtVchNo = Val(UnMyNumFmt(mskIgtVchNo(1).Text))
    If ChkIsExistVTypeNo(dbHmsDatabase, mTableName:="IndrRgPymt", mChkFieldName:="IgtVchNo", mChkFieldValue:=CStr(mIgtVchNo), mVtmFieldName:="IgtVtmCode", mVtmFieldValue:=Val(fcmbIgtVtmName.BoundText), mFinYrFieldName:="IgtCmpCode", mFinYrFieldValue:=sFinYrCmpCode) = False Then
        ErrorBox "Voucher No. does not Exist !!!"
        mskIgtVchNo(1).SetFocus
        Exit Sub
    End If
End If
If Val(UnMyNumFmt(mskIgtVchNo(2).Text)) < 1 Then
    ErrorBox "Invalid Voucher No. !!!"
    mskIgtVchNo(2).SetFocus
    Exit Sub
Else
    mIgtVchNo = Val(UnMyNumFmt(mskIgtVchNo(2).Text))
    If ChkIsExistVTypeNo(dbHmsDatabase, mTableName:="IndrRgPymt", mChkFieldName:="IgtVchNo", mChkFieldValue:=CStr(mIgtVchNo), mVtmFieldName:="IgtVtmCode", mVtmFieldValue:=Val(fcmbIgtVtmName.BoundText), mFinYrFieldName:="IgtCmpCode", mFinYrFieldValue:=sFinYrCmpCode) = False Then
        ErrorBox "Voucher No. does not Exist !!!"
        mskIgtVchNo(2).SetFocus
        Exit Sub
    End If
End If
If cmbCRList.ListIndex < 0 Then
    ErrorBox "Invalid Print Format Name !!!"
    cmbCRList.SetFocus
    Exit Sub
End If
If cmbPrinterList.ListIndex < 0 Then
    ErrorBox "Invalid Print Selection !!!"
    cmbPrinterList.SetFocus
    Exit Sub
End If
If Val(mskPrintCopies.Text) < 1 Then
    ErrorBox "Invalid Input !!!"
    mskPrintCopies.SetFocus
    Exit Sub
End If
If cmbPrintDest.ListIndex < 0 Then
    ErrorBox "Invalid Print Destination !!!"
    cmbPrintDest.SetFocus
    Exit Sub
End If
Call Data_PrintEvent

End Sub

Private Sub Data_PrintEvent()
Dim mFromIgtVchNo As Long, mToIgtVchNo As Long, mIgtVtmCode As Long
Dim fCRView As Form

mFromIgtVchNo = Val(UnMyNumFmt(mskIgtVchNo(1).Text))
mToIgtVchNo = Val(UnMyNumFmt(mskIgtVchNo(2).Text))
mIgtVtmCode = Val(fcmbIgtVtmName.BoundText)

frmMain.Cryst.Reset
frmMain.Cryst.ReportFileName = Trim(Right(cmbCRList.List(cmbCRList.ListIndex), 100))
frmMain.Cryst.DiscardSavedData = True
frmMain.Cryst.DataFiles(0) = dbComDatabaseFullPath

frmMain.Cryst.SelectionFormula = "{vewIndrRgPymt.IgtVchNo}>=" & CStr(mFromIgtVchNo) & " and {vewIndrRgPymt.IgtVchNo}<=" & CStr(mToIgtVchNo) & " and {vewIndrRgPymt.IgtVtmCode}=" & CStr(mIgtVtmCode) & " and {vewIndrRgPymt.IgtCmpCode}=" & CStr(sFinYrCmpCode)
frmMain.Cryst.CopiesToPrinter = Val(mskPrintCopies.Text)
frmMain.Cryst.PrinterName = Trim(Left(cmbPrinterList.List(cmbPrinterList.ListIndex), 100))
frmMain.Cryst.PrinterDriver = Trim(Right(cmbPrinterList.List(cmbPrinterList.ListIndex), 100))
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
        fcmbIgtVtmName.BoundText = CStr(datRecset.fields("IgtVtmCode"))
        txtIgtVtmName(1).Text = fcmbIgtVtmName.Text
        mskIgtVchNo(1).Text = datRecset.fields("IgtVchNo")
        mskIgtVchNo(2).Text = datRecset.fields("IgtVchNo")
        ' ----------------
        Call AssignPrintPara
        frPrintCRList.ZOrder
        frPrintCRList.Visible = True
        Mfgrd1.Enabled = False
        cmbPrintDest.SetFocus
    End If
    
ElseIf mCallSource = "SaveEvent" Then
    txtIgtVtmName(1).Text = fcmbIgtVtmName.Text
    mskIgtVchNo(1).Text = CStr(Val(UnMyNumFmt(mskIgtVchNo(0).Text)))
    mskIgtVchNo(2).Text = CStr(Val(UnMyNumFmt(mskIgtVchNo(0).Text)))
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

mDefaultCRLIndex = -1
mskPrintCopies.Text = 1

AddPrinterToCombo cmbPrinterList

AddPrintDestToCombo cmbPrintDest

If Dir(IndrRgPymtCRLFileFullPath) = "" Then
    fhand = FreeFile
    Open IndrRgPymtCRLFileFullPath For Output As #fhand
    Write #fhand, "Indoor Advance Payment", "IndrRgPymt.Rpt", True
    Close #fhand
End If

cmbCRList.Clear
fhand = FreeFile
Open IndrRgPymtCRLFileFullPath For Input As #fhand
Do While EOF(fhand) = False
    Input #fhand, mCRLTitle, mCRLFileName, mCRLDefault
    If Dir(IndrRgPymtCRLFileFullPath(mFileName:=mCRLFileName)) <> "" Then
        cmbCRList.AddItem mCRLTitle & Space(100) & IndrRgPymtCRLFileFullPath(mFileName:=mCRLFileName)
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








Rem ***************************************** end of form *******************************************

