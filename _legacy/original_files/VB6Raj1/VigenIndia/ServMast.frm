VERSION 5.00
Object = "{5E9E78A0-531B-11CF-91F6-C2863C385E30}#1.0#0"; "MSFLXGRD.OCX"
Begin VB.Form frmServiceMast 
   Appearance      =   0  'Flat
   BackColor       =   &H80000005&
   ClientHeight    =   10530
   ClientLeft      =   60
   ClientTop       =   60
   ClientWidth     =   14700
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
   ScaleHeight     =   10530
   ScaleWidth      =   14700
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
      TabIndex        =   69
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
      TabIndex        =   68
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
      ItemData        =   "ServMast.frx":0000
      Left            =   0
      List            =   "ServMast.frx":000D
      Style           =   1  'Simple Combo
      TabIndex        =   67
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
      Height          =   9720
      Left            =   120
      TabIndex        =   66
      Top             =   720
      Width           =   14535
      Begin VB.Frame frHeader 
         Appearance      =   0  'Flat
         BackColor       =   &H00C0FFC0&
         ForeColor       =   &H80000008&
         Height          =   4200
         Left            =   120
         TabIndex        =   74
         Top             =   240
         Width           =   14295
         Begin VB.TextBox mskSrvRate 
            Alignment       =   1  'Right Justify
            Appearance      =   0  'Flat
            BackColor       =   &H00FFFFFF&
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
            TabIndex        =   5
            Tag             =   "AhCode"
            Text            =   "0.00"
            Top             =   1320
            Width           =   1455
         End
         Begin VB.CheckBox chkSrvAutoInsOnceIpdBill 
            Alignment       =   1  'Right Justify
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            Caption         =   "Auto Insert Once in Indoor Bill:"
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
            Left            =   7440
            TabIndex        =   15
            Top             =   2040
            Width           =   3375
         End
         Begin VB.CheckBox chkSrvMultiDctIncl 
            Alignment       =   1  'Right Justify
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            Caption         =   "Multiple Doctors Involved:"
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
            TabIndex        =   6
            Top             =   1680
            Width           =   3255
         End
         Begin VB.CheckBox chkSrvAutoCalcIpdBill 
            Alignment       =   1  'Right Justify
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            Caption         =   "Auto Calculate in Indoor Bill:"
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
            Left            =   4080
            TabIndex        =   14
            Top             =   2040
            Width           =   3255
         End
         Begin VB.CheckBox chkSrvAutoInsIpdBill 
            Alignment       =   1  'Right Justify
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            Caption         =   "Auto Insert in Indoor Bill:"
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
            Top             =   2040
            Width           =   3255
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
            Left            =   7440
            Style           =   1  'Graphical
            TabIndex        =   24
            Top             =   3480
            Width           =   4335
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
            Width           =   1335
         End
         Begin VB.TextBox txtSrvName 
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
            TabIndex        =   1
            Top             =   600
            Width           =   5295
         End
         Begin VB.CheckBox chkSrvUnitEditable 
            Alignment       =   1  'Right Justify
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            Caption         =   "Unit Editable:"
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
            Top             =   2400
            Width           =   3255
         End
         Begin VB.TextBox mskSrvIndex 
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
            Left            =   8760
            TabIndex        =   4
            Tag             =   "AhCode"
            Text            =   "0"
            Top             =   960
            Width           =   855
         End
         Begin VB.CheckBox chkSrvShowInList 
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
            Left            =   240
            TabIndex        =   23
            Top             =   3480
            Width           =   3255
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
            Left            =   8760
            MaxLength       =   50
            TabIndex        =   2
            Top             =   600
            Width           =   4095
         End
         Begin VB.TextBox txtAhName 
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
            TabIndex        =   3
            Top             =   960
            Width           =   5295
         End
         Begin VB.TextBox mskSrvOpdGenChg 
            Alignment       =   1  'Right Justify
            Appearance      =   0  'Flat
            BackColor       =   &H00E0E0E0&
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
            Left            =   12120
            TabIndex        =   8
            Tag             =   "AhCode"
            Text            =   "0.00"
            Top             =   1080
            Visible         =   0   'False
            Width           =   735
         End
         Begin VB.TextBox mskSrvOpdEmgChg 
            Alignment       =   1  'Right Justify
            Appearance      =   0  'Flat
            BackColor       =   &H00E0E0E0&
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
            Left            =   12960
            Locked          =   -1  'True
            TabIndex        =   7
            TabStop         =   0   'False
            Tag             =   "AhCode"
            Text            =   "0.00"
            Top             =   1080
            Visible         =   0   'False
            Width           =   855
         End
         Begin VB.TextBox mskSrvIpdGenChg 
            Alignment       =   1  'Right Justify
            Appearance      =   0  'Flat
            BackColor       =   &H00E0E0E0&
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
            Left            =   12120
            Locked          =   -1  'True
            TabIndex        =   9
            TabStop         =   0   'False
            Tag             =   "AhCode"
            Text            =   "0.00"
            Top             =   1320
            Visible         =   0   'False
            Width           =   735
         End
         Begin VB.TextBox mskSrvIpdEmgChg 
            Alignment       =   1  'Right Justify
            Appearance      =   0  'Flat
            BackColor       =   &H00E0E0E0&
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
            Left            =   12960
            Locked          =   -1  'True
            TabIndex        =   10
            TabStop         =   0   'False
            Tag             =   "AhCode"
            Text            =   "0.00"
            Top             =   1320
            Visible         =   0   'False
            Width           =   855
         End
         Begin VB.TextBox mskSrvLabGenChg 
            Alignment       =   1  'Right Justify
            Appearance      =   0  'Flat
            BackColor       =   &H00E0E0E0&
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
            Left            =   12120
            Locked          =   -1  'True
            TabIndex        =   11
            TabStop         =   0   'False
            Tag             =   "AhCode"
            Text            =   "0.00"
            Top             =   1560
            Visible         =   0   'False
            Width           =   735
         End
         Begin VB.TextBox mskSrvLabEmgChg 
            Alignment       =   1  'Right Justify
            Appearance      =   0  'Flat
            BackColor       =   &H00E0E0E0&
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
            Left            =   12960
            Locked          =   -1  'True
            TabIndex        =   12
            TabStop         =   0   'False
            Tag             =   "AhCode"
            Text            =   "0.00"
            Top             =   1560
            Visible         =   0   'False
            Width           =   855
         End
         Begin VB.CheckBox chkSrvRateEditable 
            Alignment       =   1  'Right Justify
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            Caption         =   "Rate Editable:"
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
            Left            =   4080
            TabIndex        =   17
            Top             =   2400
            Width           =   3255
         End
         Begin VB.CheckBox chkSrvAmtEditable 
            Alignment       =   1  'Right Justify
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            Caption         =   "Amount Editable:"
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
            Left            =   7440
            TabIndex        =   18
            Top             =   2400
            Width           =   2175
         End
         Begin VB.CheckBox chkSrvInfAllowed 
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
            Left            =   240
            TabIndex        =   19
            Top             =   2760
            Width           =   3255
         End
         Begin VB.CheckBox chkSrvDefAllowed 
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
            Left            =   4080
            TabIndex        =   20
            Top             =   2760
            Width           =   3255
         End
         Begin VB.CheckBox chkSrvDiscAllowed 
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
            Left            =   240
            TabIndex        =   21
            Top             =   3120
            Width           =   3255
         End
         Begin VB.TextBox mskSrvDiscPer 
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
            Left            =   6120
            TabIndex        =   22
            Tag             =   "AhCode"
            Text            =   "0.00 %"
            Top             =   3120
            Width           =   1215
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
            Left            =   240
            TabIndex        =   81
            Top             =   240
            Width           =   855
         End
         Begin VB.Label Label2 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Service Name:"
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
            Left            =   240
            TabIndex        =   80
            Top             =   600
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
            Left            =   7440
            TabIndex        =   79
            Top             =   960
            Width           =   1695
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
            Index           =   2
            Left            =   7440
            TabIndex        =   78
            Top             =   600
            Width           =   1335
         End
         Begin VB.Label Label2 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Account Name:"
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
            Left            =   240
            TabIndex        =   77
            Top             =   960
            Width           =   1695
         End
         Begin VB.Label Label2 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Charges:"
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
            Left            =   240
            TabIndex        =   76
            Top             =   1320
            Width           =   1695
         End
         Begin VB.Shape Shape1 
            Height          =   1335
            Left            =   12000
            Top             =   960
            Visible         =   0   'False
            Width           =   2055
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
            Left            =   4080
            TabIndex        =   75
            Top             =   3120
            Width           =   1575
         End
      End
      Begin VB.Frame frGridControls 
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFFC0&
         ForeColor       =   &H80000008&
         Height          =   1695
         Left            =   120
         TabIndex        =   82
         Top             =   4320
         Width           =   14295
         Begin VB.TextBox mskSrmDiscPer 
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
            Left            =   7470
            TabIndex        =   52
            Tag             =   "AhCode"
            Text            =   "0.00 %"
            Top             =   480
            Width           =   1215
         End
         Begin VB.TextBox dtpSrmWefDate 
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
            Left            =   9975
            TabIndex        =   60
            Tag             =   "AhCode"
            Text            =   "dd/mm/yyyy"
            Top             =   1155
            Width           =   1575
         End
         Begin VB.TextBox mskSrmShareAmt 
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
            Left            =   12270
            TabIndex        =   56
            Tag             =   "AhCode"
            Text            =   "0.00"
            Top             =   480
            Width           =   1335
         End
         Begin VB.TextBox mskSrmSharePer 
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
            Left            =   11070
            TabIndex        =   55
            Tag             =   "AhCode"
            Text            =   "0.00 %"
            Top             =   480
            Width           =   1215
         End
         Begin VB.TextBox txtRToName 
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
            Left            =   6960
            MaxLength       =   50
            TabIndex        =   59
            Top             =   1155
            Width           =   3015
         End
         Begin VB.TextBox txtRByName 
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
            Left            =   3600
            MaxLength       =   50
            TabIndex        =   58
            Top             =   1155
            Width           =   3375
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
            Left            =   11610
            Style           =   1  'Graphical
            TabIndex        =   61
            Top             =   1125
            Width           =   735
         End
         Begin VB.TextBox mskSrmSno 
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
            Left            =   120
            TabIndex        =   47
            Tag             =   "AhCode"
            Text            =   "0"
            Top             =   480
            Width           =   615
         End
         Begin VB.TextBox txtDctName 
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
            Left            =   720
            MaxLength       =   50
            TabIndex        =   48
            Top             =   480
            Width           =   3375
         End
         Begin VB.TextBox mskSrmInfByPer 
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
            Left            =   8670
            TabIndex        =   53
            Tag             =   "AhCode"
            Text            =   "0.00 %"
            Top             =   480
            Width           =   1215
         End
         Begin VB.TextBox mskSrmDefByPer 
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
            Left            =   9870
            TabIndex        =   54
            Tag             =   "AhCode"
            Text            =   "0.00 %"
            Top             =   480
            Width           =   1215
         End
         Begin VB.TextBox txtPcgName 
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
            Left            =   120
            MaxLength       =   50
            TabIndex        =   57
            Top             =   1155
            Width           =   3495
         End
         Begin VB.TextBox txtSrmStartTime 
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
            Left            =   4110
            TabIndex        =   49
            Tag             =   "AhCode"
            Text            =   "00:00"
            Top             =   480
            Width           =   1095
         End
         Begin VB.TextBox txtSrmEndTime 
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
            Left            =   5190
            TabIndex        =   50
            Tag             =   "AhCode"
            Text            =   "00:00"
            Top             =   480
            Width           =   975
         End
         Begin VB.TextBox mskSrmRate 
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
            Left            =   6150
            TabIndex        =   51
            Tag             =   "AhCode"
            Text            =   "0.00"
            Top             =   480
            Width           =   1335
         End
         Begin VB.Label Label1 
            Alignment       =   1  'Right Justify
            Appearance      =   0  'Flat
            AutoSize        =   -1  'True
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Disc.%"
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
            Height          =   195
            Index           =   11
            Left            =   8010
            TabIndex        =   96
            Top             =   240
            Width           =   675
         End
         Begin VB.Label Label1 
            Appearance      =   0  'Flat
            AutoSize        =   -1  'True
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "W.e.f."
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
            Height          =   195
            Index           =   10
            Left            =   9975
            TabIndex        =   95
            Top             =   915
            Width           =   555
         End
         Begin VB.Label Label1 
            Alignment       =   1  'Right Justify
            Appearance      =   0  'Flat
            AutoSize        =   -1  'True
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Decr.By %"
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
            Height          =   195
            Index           =   16
            Left            =   10065
            TabIndex        =   94
            Top             =   240
            Width           =   1020
         End
         Begin VB.Label Label1 
            Appearance      =   0  'Flat
            AutoSize        =   -1  'True
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Patient Category"
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
            Height          =   195
            Index           =   15
            Left            =   120
            TabIndex        =   93
            Top             =   915
            Width           =   1635
         End
         Begin VB.Label Label1 
            Alignment       =   1  'Right Justify
            Appearance      =   0  'Flat
            AutoSize        =   -1  'True
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Share Amt."
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
            Height          =   195
            Index           =   14
            Left            =   12525
            TabIndex        =   92
            Top             =   240
            Width           =   1080
         End
         Begin VB.Label Label1 
            Alignment       =   1  'Right Justify
            Appearance      =   0  'Flat
            AutoSize        =   -1  'True
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Share %"
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
            Height          =   195
            Index           =   12
            Left            =   11445
            TabIndex        =   91
            Top             =   240
            Width           =   840
         End
         Begin VB.Label Label1 
            Alignment       =   1  'Right Justify
            Appearance      =   0  'Flat
            AutoSize        =   -1  'True
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Incr.By %"
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
            Height          =   195
            Index           =   9
            Left            =   8910
            TabIndex        =   90
            Top             =   240
            Width           =   975
         End
         Begin VB.Label Label1 
            Alignment       =   1  'Right Justify
            Appearance      =   0  'Flat
            AutoSize        =   -1  'True
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Charges"
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
            Height          =   195
            Index           =   8
            Left            =   6690
            TabIndex        =   89
            Top             =   240
            Width           =   795
         End
         Begin VB.Label Label1 
            Appearance      =   0  'Flat
            AutoSize        =   -1  'True
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "End Time"
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
            Height          =   195
            Index           =   7
            Left            =   5190
            TabIndex        =   88
            Top             =   240
            Width           =   900
         End
         Begin VB.Label Label1 
            Appearance      =   0  'Flat
            AutoSize        =   -1  'True
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Start Time"
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
            Height          =   195
            Index           =   6
            Left            =   4110
            TabIndex        =   87
            Top             =   240
            Width           =   1140
         End
         Begin VB.Label Label1 
            Appearance      =   0  'Flat
            AutoSize        =   -1  'True
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Referred To"
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
            Height          =   195
            Index           =   5
            Left            =   6960
            TabIndex        =   86
            Top             =   915
            Width           =   1155
         End
         Begin VB.Label Label1 
            Appearance      =   0  'Flat
            AutoSize        =   -1  'True
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Referred By"
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
            Height          =   195
            Index           =   4
            Left            =   3600
            TabIndex        =   85
            Top             =   915
            Width           =   1155
         End
         Begin VB.Label Label1 
            Appearance      =   0  'Flat
            AutoSize        =   -1  'True
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Consulting Doctor"
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
            Height          =   195
            Index           =   3
            Left            =   720
            TabIndex        =   84
            Top             =   240
            Width           =   1725
         End
         Begin VB.Label Label1 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Sno."
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
            TabIndex        =   83
            Top             =   240
            Width           =   615
         End
      End
      Begin MSFlexGridLib.MSFlexGrid Mfgrd2 
         Height          =   3330
         Left            =   120
         TabIndex        =   46
         Top             =   6000
         Width           =   14295
         _ExtentX        =   25215
         _ExtentY        =   5874
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
      Begin VB.CommandButton cmdSaveForm 
         Appearance      =   0  'Flat
         BackColor       =   &H80000009&
         Caption         =   "      &Save"
         Height          =   345
         Left            =   14160
         Style           =   1  'Graphical
         TabIndex        =   62
         Top             =   9375
         Width           =   375
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
         Height          =   5535
         Left            =   1440
         TabIndex        =   97
         Top             =   1320
         Width           =   11415
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
            TabIndex        =   45
            Top             =   5040
            Width           =   1335
         End
         Begin VB.CheckBox chkSrvDctwseRateSys 
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
            TabIndex        =   25
            Top             =   840
            Width           =   5055
         End
         Begin VB.CheckBox chkSrvPcgwseRateSys 
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
            TabIndex        =   26
            Top             =   1200
            Width           =   5055
         End
         Begin VB.CheckBox chkSrvRBywseRateSys 
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
            TabIndex        =   27
            Top             =   1560
            Width           =   5055
         End
         Begin VB.CheckBox chkSrvRTowseRateSys 
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
            TabIndex        =   28
            Top             =   1920
            Width           =   5055
         End
         Begin VB.CheckBox chkSrvDctwseDiscSys 
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
            TabIndex        =   30
            Top             =   3240
            Width           =   5055
         End
         Begin VB.CheckBox chkSrvPcgwseDiscSys 
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
            TabIndex        =   31
            Top             =   3600
            Width           =   5055
         End
         Begin VB.CheckBox chkSrvRBywseDiscSys 
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
            TabIndex        =   32
            Top             =   3960
            Width           =   5055
         End
         Begin VB.CheckBox chkSrvRTowseDiscSys 
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
            TabIndex        =   33
            Top             =   4320
            Width           =   5055
         End
         Begin VB.CheckBox chkSrvTimewseRateSys 
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
            TabIndex        =   29
            Top             =   2280
            Width           =   5055
         End
         Begin VB.CheckBox chkSrvTimewseDiscSys 
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
            TabIndex        =   34
            Top             =   4680
            Width           =   5055
         End
         Begin VB.CheckBox chkSrvDctwseBargSys 
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
            TabIndex        =   35
            Top             =   840
            Width           =   5055
         End
         Begin VB.CheckBox chkSrvPcgwseBargSys 
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
            TabIndex        =   36
            Top             =   1200
            Width           =   5055
         End
         Begin VB.CheckBox chkSrvRBywseBargSys 
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
            TabIndex        =   37
            Top             =   1560
            Width           =   5055
         End
         Begin VB.CheckBox chkSrvRTowseBargSys 
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
            TabIndex        =   38
            Top             =   1920
            Width           =   5055
         End
         Begin VB.CheckBox chkSrvTimewseBargSys 
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
            TabIndex        =   39
            Top             =   2280
            Width           =   5055
         End
         Begin VB.CheckBox chkSrvDctwseShareSys 
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
            TabIndex        =   40
            Top             =   3240
            Width           =   5055
         End
         Begin VB.CheckBox chkSrvPcgwseShareSys 
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
            TabIndex        =   41
            Top             =   3600
            Width           =   5055
         End
         Begin VB.CheckBox chkSrvRBywseShareSys 
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
            TabIndex        =   42
            Top             =   3960
            Width           =   5055
         End
         Begin VB.CheckBox chkSrvRTowseShareSys 
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
            TabIndex        =   43
            Top             =   4320
            Width           =   5055
         End
         Begin VB.CheckBox chkSrvTimewseShareSys 
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
            TabIndex        =   44
            Top             =   4680
            Width           =   5055
         End
         Begin VB.Label Label2 
            Alignment       =   2  'Center
            Appearance      =   0  'Flat
            BackColor       =   &H80000010&
            Caption         =   "Share System"
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
            Index           =   13
            Left            =   5760
            TabIndex        =   101
            Top             =   2880
            Width           =   5055
         End
         Begin VB.Label Label2 
            Alignment       =   2  'Center
            Appearance      =   0  'Flat
            BackColor       =   &H80000010&
            Caption         =   "Bargain System"
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
            Index           =   12
            Left            =   5760
            TabIndex        =   100
            Top             =   480
            Width           =   5055
         End
         Begin VB.Label Label2 
            Alignment       =   2  'Center
            Appearance      =   0  'Flat
            BackColor       =   &H80000010&
            Caption         =   "Discount System"
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
            Index           =   11
            Left            =   240
            TabIndex        =   99
            Top             =   2880
            Width           =   5055
         End
         Begin VB.Label Label2 
            Alignment       =   2  'Center
            Appearance      =   0  'Flat
            BackColor       =   &H80000010&
            Caption         =   "Rate System"
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
            Index           =   10
            Left            =   240
            TabIndex        =   98
            Top             =   480
            Width           =   5055
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
      Left            =   120
      TabIndex        =   65
      Top             =   720
      Width           =   12855
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
         TabIndex        =   72
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
         TabIndex        =   70
         Top             =   360
         Width           =   4215
      End
      Begin MSFlexGridLib.MSFlexGrid Mfgrd1 
         Height          =   4335
         Left            =   120
         TabIndex        =   71
         Top             =   720
         Width           =   12375
         _ExtentX        =   21828
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
         TabIndex        =   73
         Top             =   360
         Width           =   735
      End
   End
   Begin VB.TextBox txtVoid 
      CausesValidation=   0   'False
      Height          =   375
      Left            =   0
      TabIndex        =   63
      TabStop         =   0   'False
      Text            =   "Void"
      Top             =   9720
      Width           =   375
   End
   Begin VB.Label lblFormHeading 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00E0E0E0&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Service Master"
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
      TabIndex        =   64
      Top             =   0
      Width           =   9015
   End
End
Attribute VB_Name = "frmServiceMast"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Option Explicit

Dim mFormLoaded As Boolean, mLastKeyPressed As Integer, mMaskKeyPressed As Integer
Dim mSrvCode As Long, dtlAddEditMode As Boolean, dtlAddMode As Boolean, dtlEditCanceled As Boolean
Dim mRemoteAccess As Boolean, mEntrySaved As Boolean, mEntryAborted As Boolean
Dim dbVgnDatabase As New ADODB.Connection, dbAcDatabase As New ADODB.Connection, dbGrpDatabase As New ADODB.Connection, dbComDatabase As New ADODB.Connection
Dim datRecset As New ADODB.Recordset
Dim mSrvName_old As String, mSrvIndex_old As Integer, mSrmRow_Old As Integer
Dim clsSRV As clsVgnMasterEntry, clsAH As clsAccountHead, clsSGP As clsVgnMasterEntry, mActiveControl As Object, clsListStru As clsSelectQueryStructure
Dim clsDCT As clsVgnMasterEntry, clsPCG As clsVgnMasterEntry, clsRBY As clsVgnMasterEntry, clsRTO As clsVgnMasterEntry
Dim fcmbAhName As clsComFlexSearch, fcmbSgpName As clsVgnFlexSearch, fcmbDctName As clsVgnFlexSearch, fcmbPcgName As clsVgnFlexSearch, fcmbRByName As clsVgnFlexSearch, fcmbRToName As clsVgnFlexSearch

Const X2SRMICODE_COL = 0
Const X2SRMSNO_COL = 1
Const X2DCTNAME_COL = 2
Const X2SRMSTARTTIMESTR_COL = 3
Const X2SRMENDTIMESTR_COL = 4
Const X2SRMRATE_COL = 5
Const X2SRMDISCPER_COL = 6
Const X2SRMINFBYPER_COL = 7
Const X2SRMDEFBYPER_COL = 8
Const X2SRMSHAREPER_COL = 9
Const X2SRMSHAREAMT_COL = 10
Const X2PCGNAME_COL = 11
Const X2RBYNAME_COL = 12
Const X2RTONAME_COL = 13
Const X2SRMWEFDATE_COL = 14
Const X2SRMDCTCODE_COL = 15
Const X2SRMPCGCODE_COL = 16
Const X2SRMRBYCODE_COL = 17
Const X2SRMRTOCODE_COL = 18
Const X2SRMSTARTTIME_COL = 19
Const X2SRMENDTIME_COL = 20
Const X2SRMRECSTATE_COL = 21
Const MFGRD2_COLS = 22

Public Property Let RemoteAccessCode(ByVal mAccessCode As Long)
mRemoteAccess = True
mSrvCode = mAccessCode
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

Public Property Get SrvName() As String
SrvName = txtSrvName.Text
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

Private Sub chkSrvAmtEditable_GotFocus()
FlashActiveControl chkSrvAmtEditable, True
End Sub

Private Sub chkSrvAmtEditable_LostFocus()
FlashActiveControl chkSrvAmtEditable, False
End Sub

Private Sub chkSrvAutoCalcIpdBill_GotFocus()
FlashActiveControl chkSrvAutoCalcIpdBill, True
End Sub

Private Sub chkSrvAutoCalcIpdBill_LostFocus()
FlashActiveControl chkSrvAutoCalcIpdBill, False
End Sub

Private Sub chkSrvAutoInsIpdBill_GotFocus()
FlashActiveControl chkSrvAutoInsIpdBill, True
End Sub

Private Sub chkSrvAutoInsIpdBill_LostFocus()
FlashActiveControl chkSrvAutoInsIpdBill, False
End Sub

Private Sub chkSrvAutoInsOnceIpdBill_GotFocus()
FlashActiveControl chkSrvAutoInsOnceIpdBill, True
End Sub

Private Sub chkSrvAutoInsOnceIpdBill_LostFocus()
FlashActiveControl chkSrvAutoInsOnceIpdBill, False
End Sub

Private Sub chkSrvDctwseRateSys_GotFocus()
FlashActiveControl chkSrvDctwseRateSys, True
End Sub

Private Sub chkSrvDctwseRateSys_LostFocus()
FlashActiveControl chkSrvDctwseRateSys, False
End Sub

Private Sub chkSrvMultiDctIncl_GotFocus()
FlashActiveControl chkSrvMultiDctIncl, True
End Sub

Private Sub chkSrvMultiDctIncl_LostFocus()
FlashActiveControl chkSrvMultiDctIncl, False
End Sub

Private Sub chkSrvPcgwseRateSys_GotFocus()
FlashActiveControl chkSrvPcgwseRateSys, True
End Sub

Private Sub chkSrvPcgwseRateSys_LostFocus()
FlashActiveControl chkSrvPcgwseRateSys, False
End Sub

Private Sub chkSrvRBywseRateSys_GotFocus()
FlashActiveControl chkSrvRBywseRateSys, True
End Sub

Private Sub chkSrvRBywseRateSys_LostFocus()
FlashActiveControl chkSrvRBywseRateSys, False
End Sub

Private Sub chkSrvRTowseRateSys_GotFocus()
FlashActiveControl chkSrvRTowseRateSys, True
End Sub

Private Sub chkSrvRTowseRateSys_LostFocus()
FlashActiveControl chkSrvRTowseRateSys, False
End Sub

Private Sub chkSrvTimewseRateSys_GotFocus()
FlashActiveControl chkSrvTimewseRateSys, True
End Sub

Private Sub chkSrvTimewseRateSys_LostFocus()
FlashActiveControl chkSrvTimewseRateSys, False
End Sub

Private Sub chkSrvDctwseDiscSys_GotFocus()
FlashActiveControl chkSrvDctwseDiscSys, True
End Sub

Private Sub chkSrvDctwseDiscSys_LostFocus()
FlashActiveControl chkSrvDctwseDiscSys, False
End Sub

Private Sub chkSrvPcgwseDiscSys_GotFocus()
FlashActiveControl chkSrvPcgwseDiscSys, True
End Sub

Private Sub chkSrvPcgwseDiscSys_LostFocus()
FlashActiveControl chkSrvPcgwseDiscSys, False
End Sub

Private Sub chkSrvRBywseDiscSys_GotFocus()
FlashActiveControl chkSrvRBywseDiscSys, True
End Sub

Private Sub chkSrvRBywseDiscSys_LostFocus()
FlashActiveControl chkSrvRBywseDiscSys, False
End Sub

Private Sub chkSrvRTowseDiscSys_GotFocus()
FlashActiveControl chkSrvRTowseDiscSys, True
End Sub

Private Sub chkSrvRTowseDiscSys_LostFocus()
FlashActiveControl chkSrvRTowseDiscSys, False
End Sub

Private Sub chkSrvTimewseDiscSys_GotFocus()
FlashActiveControl chkSrvTimewseDiscSys, True
End Sub

Private Sub chkSrvTimewseDiscSys_LostFocus()
FlashActiveControl chkSrvTimewseDiscSys, False
End Sub

Private Sub chkSrvDctwseBargSys_GotFocus()
FlashActiveControl chkSrvDctwseBargSys, True
End Sub

Private Sub chkSrvDctwseBargSys_LostFocus()
FlashActiveControl chkSrvDctwseBargSys, False
End Sub

Private Sub chkSrvPcgwseBargSys_GotFocus()
FlashActiveControl chkSrvPcgwseBargSys, True
End Sub

Private Sub chkSrvPcgwseBargSys_LostFocus()
FlashActiveControl chkSrvPcgwseBargSys, False
End Sub

Private Sub chkSrvRBywseBargSys_GotFocus()
FlashActiveControl chkSrvRBywseBargSys, True
End Sub

Private Sub chkSrvRBywseBargSys_LostFocus()
FlashActiveControl chkSrvRBywseBargSys, False
End Sub

Private Sub chkSrvRTowseBargSys_GotFocus()
FlashActiveControl chkSrvRTowseBargSys, True
End Sub

Private Sub chkSrvRTowseBargSys_LostFocus()
FlashActiveControl chkSrvRTowseBargSys, False
End Sub

Private Sub chkSrvTimewseBargSys_GotFocus()
FlashActiveControl chkSrvTimewseBargSys, True
End Sub

Private Sub chkSrvTimewseBargSys_LostFocus()
FlashActiveControl chkSrvTimewseBargSys, False
End Sub

Private Sub chkSrvDctwseShareSys_GotFocus()
FlashActiveControl chkSrvDctwseShareSys, True
End Sub

Private Sub chkSrvDctwseShareSys_LostFocus()
FlashActiveControl chkSrvDctwseShareSys, False
End Sub

Private Sub chkSrvPcgwseShareSys_GotFocus()
FlashActiveControl chkSrvPcgwseShareSys, True
End Sub

Private Sub chkSrvPcgwseShareSys_LostFocus()
FlashActiveControl chkSrvPcgwseShareSys, False
End Sub

Private Sub chkSrvRBywseShareSys_GotFocus()
FlashActiveControl chkSrvRBywseShareSys, True
End Sub

Private Sub chkSrvRBywseShareSys_LostFocus()
FlashActiveControl chkSrvRBywseShareSys, False
End Sub

Private Sub chkSrvRTowseShareSys_GotFocus()
FlashActiveControl chkSrvRTowseShareSys, True
End Sub

Private Sub chkSrvRTowseShareSys_LostFocus()
FlashActiveControl chkSrvRTowseShareSys, False
End Sub

Private Sub chkSrvTimewseShareSys_GotFocus()
FlashActiveControl chkSrvTimewseShareSys, True
End Sub

Private Sub chkSrvTimewseShareSys_LostFocus()
FlashActiveControl chkSrvTimewseShareSys, False
End Sub

Private Sub chkSrvDefAllowed_GotFocus()
FlashActiveControl chkSrvDefAllowed, True
End Sub

Private Sub chkSrvDefAllowed_LostFocus()
FlashActiveControl chkSrvDefAllowed, False
End Sub

Private Sub chkSrvDiscAllowed_GotFocus()
FlashActiveControl chkSrvDiscAllowed, True
End Sub

Private Sub chkSrvDiscAllowed_LostFocus()
FlashActiveControl chkSrvDiscAllowed, False
End Sub

Private Sub chkSrvInfAllowed_Click()
FlashActiveControl chkSrvDefAllowed, False
End Sub

Private Sub chkSrvInfAllowed_GotFocus()
FlashActiveControl chkSrvInfAllowed, True
End Sub

Private Sub chkSrvInfAllowed_LostFocus()
FlashActiveControl chkSrvInfAllowed, False
End Sub

Private Sub chkSrvRateEditable_GotFocus()
FlashActiveControl chkSrvRateEditable, True
End Sub

Private Sub chkSrvRateEditable_LostFocus()
FlashActiveControl chkSrvRateEditable, False
End Sub

Private Sub chkSrvUnitEditable_GotFocus()
FlashActiveControl chkSrvUnitEditable, True
End Sub

Private Sub chkSrvUnitEditable_LostFocus()
FlashActiveControl chkSrvUnitEditable, False
End Sub

Private Sub chkSrvShowInList_GotFocus()
FlashActiveControl chkSrvShowInList, True
End Sub

Private Sub chkSrvShowInList_LostFocus()
FlashActiveControl chkSrvShowInList, False
End Sub

Private Sub cmdExtRateSys_Click()
ShowExtRateSys True
chkSrvDctwseRateSys.SetFocus

End Sub

Private Sub ShowExtRateSys(ByVal mShowItem As Boolean)
If Me.Visible = True Then
    txtVoid.SetFocus
End If
frHeader.Enabled = Not mShowItem
Mfgrd2.Enabled = Not mShowItem
frExtRateSys.Visible = mShowItem: frExtRateSys.Enabled = mShowItem
cmdSaveForm.Enabled = Not mShowItem
If mShowItem = True Then
    frExtRateSys.ZOrder
End If

End Sub

Private Sub cmdExtRateSysDone_Click()
ShowExtRateSys False
Mfgrd2.SetFocus

End Sub

Private Sub cmdFormEnter_Click()
mLastKeyPressed = 13
If TypeOf Screen.ActiveControl Is MSFlexGrid Then
    If Screen.ActiveControl.Name = Mfgrd1.Name Then
        With datRecset
        If .EOF = False And .BOF = False Then
            Call Data_EditEvent
        Else
            Call Data_AddEvent
        End If
        End With
    ElseIf Screen.ActiveControl.Name = Mfgrd2.Name Then
        Mfgrd2_KeyPress vbKeyReturn
    End If
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
ElseIf dtlAddEditMode = True Then
    dtlEditCanceled = True
    Call cmdOK_Click
ElseIf frExtRateSys.Visible = True Then
    ShowExtRateSys False
    Mfgrd2.SetFocus
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
        txtSrvName.SetFocus
    End If

End If

End Sub

Private Sub cmdOK_Click()
Dim tRecset As New ADODB.Recordset, srow As Integer, mSrmSno As Integer, mSrmICode As Long, mReqdRecdAmt As Double

srow = Mfgrd2.Row
mSrmSno = Val(Mfgrd2.TextMatrix(srow, X2SRMSNO_COL))
mSrmICode = Val(Mfgrd2.TextMatrix(srow, X2SRMICODE_COL))

Call ValidDtl
If cmdOK.Caption = "&OK" And dtlEditCanceled = False Then
    Mfgrd2.TextMatrix(srow, X2SRMICODE_COL) = mSrmICode
    Mfgrd2.TextMatrix(srow, X2SRMSNO_COL) = mskSrmSno.Text
    Mfgrd2.TextMatrix(srow, X2DCTNAME_COL) = fcmbDctName.Text
    Mfgrd2.TextMatrix(srow, X2SRMSTARTTIMESTR_COL) = txtSrmStartTime.Text
    Mfgrd2.TextMatrix(srow, X2SRMENDTIMESTR_COL) = txtSrmEndTime.Text
    Mfgrd2.TextMatrix(srow, X2SRMRATE_COL) = mskSrmRate.Text
    Mfgrd2.TextMatrix(srow, X2SRMDISCPER_COL) = mskSrmDiscPer.Text
    Mfgrd2.TextMatrix(srow, X2SRMINFBYPER_COL) = mskSrmInfByPer.Text
    Mfgrd2.TextMatrix(srow, X2SRMDEFBYPER_COL) = mskSrmDefByPer.Text
    Mfgrd2.TextMatrix(srow, X2SRMSHAREPER_COL) = mskSrmSharePer.Text
    Mfgrd2.TextMatrix(srow, X2SRMSHAREAMT_COL) = mskSrmShareAmt.Text
    Mfgrd2.TextMatrix(srow, X2PCGNAME_COL) = fcmbPcgName.Text
    Mfgrd2.TextMatrix(srow, X2RBYNAME_COL) = fcmbRByName.Text
    Mfgrd2.TextMatrix(srow, X2RTONAME_COL) = fcmbRToName.Text
    Mfgrd2.TextMatrix(srow, X2SRMWEFDATE_COL) = dtpSrmWefDate.Text
    Mfgrd2.TextMatrix(srow, X2SRMDCTCODE_COL) = CStr(Val(fcmbDctName.BoundText))
    Mfgrd2.TextMatrix(srow, X2SRMPCGCODE_COL) = CStr(Val(fcmbPcgName.BoundText))
    Mfgrd2.TextMatrix(srow, X2SRMRBYCODE_COL) = CStr(Val(fcmbRByName.BoundText))
    Mfgrd2.TextMatrix(srow, X2SRMRTOCODE_COL) = CStr(Val(fcmbRToName.BoundText))
    Mfgrd2.TextMatrix(srow, X2SRMSTARTTIME_COL) = TimeToMin(txtSrmStartTime.Text)
    Mfgrd2.TextMatrix(srow, X2SRMENDTIME_COL) = TimeToMin(txtSrmEndTime.Text)
    Mfgrd2.TextMatrix(srow, X2SRMRECSTATE_COL) = ChkEditRecStatus(Val(Mfgrd2.TextMatrix(srow, X2SRMRECSTATE_COL)))
    
    If dtlAddMode = True Then
        Mfgrd2.Rows = Mfgrd2.Rows + 1
    End If
    srow = srow + 1
    Mfgrd2.Row = srow
End If
dtlAddEditMode = False
dtlAddMode = False
dtlEditCanceled = False
VisibleControls False
txtVoid.SetFocus
Mfgrd2.SetFocus

End Sub

Private Sub cmdSaveForm_Click()
Call Data_SaveEvent

Call SmryList
txtSearch1Text_InterActiveChange txtSrvName.Text

''datRecset.Find "SrvName='" & txtSrvName.Text & "'", Start:=1
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
        txtSrvName.SetFocus
    End If
End If
cmdSaveForm.Enabled = True

End Sub

Private Sub dtpSrmWefDate_GotFocus()
FlashActiveControl dtpSrmWefDate, True

End Sub

Private Sub dtpSrmWefDate_LostFocus()
FlashActiveControl dtpSrmWefDate, False

End Sub

Private Sub dtpSrmWefDate_Validate(Cancel As Boolean)
dtpSrmWefDate.Text = ToMyDate(dtpSrmWefDate.Text)
If IsDate(Ctod(dtpSrmWefDate.Text)) = False Then
    ErrorBox "Invalid Date !!!"
    dtpSrmWefDate.SetFocus
    Cancel = True
End If
Call ValidDtl

End Sub

Private Sub Form_Activate()
If mFormLoaded = False Then
    If mRemoteAccess = True Then
        MoveRecToFirst datRecset
        ShowRecActiveFlexRow datRecset, Mfgrd1
        Mfgrd1.SetFocus
        If mSrvCode = 0 Then
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
Case vbKeyF2
    Load frmSetDefaultDate
    frmSetDefaultDate.Show 1
Case vbKeyPageDown
    If frExtRateSys.Visible = True Then
        Call cmdExtRateSysDone_Click
    ElseIf FormAddEditMode <> cFORM_SMRYMODE And dtlAddEditMode = False Then
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
OpenAcDataSource dbAcDatabase
OpenGrpDataSource dbGrpDatabase
OpenComDataSource dbComDatabase

Set clsSRV = New clsVgnMasterEntry
Set clsSRV.dbVgnDatabase = dbVgnDatabase
clsSRV.blnServMast = True
clsSRV.Init

Set clsAH = New clsAccountHead
Set clsAH.dbAcDatabase = dbAcDatabase
Set clsAH.dbGrpDatabase = dbGrpDatabase

Set clsSGP = New clsVgnMasterEntry
Set clsSGP.dbVgnDatabase = dbVgnDatabase
clsSGP.blnServGrpMast = True
clsSGP.Init

Set clsListStru = New clsSelectQueryStructure

Set fcmbAhName = New clsComFlexSearch
Set fcmbAhName.dbAcDatabase = dbAcDatabase
fcmbAhName.blnAchdMastList = True
fcmbAhName.Init

Set fcmbSgpName = New clsVgnFlexSearch
Set fcmbSgpName.dbVgnDatabase = dbVgnDatabase
fcmbSgpName.blnServGrpMstList = True
fcmbSgpName.Init

Set fcmbDctName = New clsVgnFlexSearch
Set fcmbDctName.dbVgnDatabase = dbVgnDatabase
fcmbDctName.blnDoctMastList = True
fcmbDctName.Init

Set fcmbPcgName = New clsVgnFlexSearch
Set fcmbPcgName.dbVgnDatabase = dbVgnDatabase
fcmbPcgName.blnPatCatgMstList = True
fcmbPcgName.Init

Set fcmbRByName = New clsVgnFlexSearch
Set fcmbRByName.dbVgnDatabase = dbVgnDatabase
fcmbRByName.blnRefByMastList = True
fcmbRByName.Init

Set fcmbRToName = New clsVgnFlexSearch
Set fcmbRToName.dbVgnDatabase = dbVgnDatabase
fcmbRToName.blnRefToMastList = True
fcmbRToName.Init

Set clsDCT = New clsVgnMasterEntry
Set clsDCT.dbVgnDatabase = dbVgnDatabase
clsDCT.blnDoctMast = True
clsDCT.Init

Set clsPCG = New clsVgnMasterEntry
Set clsPCG.dbVgnDatabase = dbVgnDatabase
clsPCG.blnPatCatgMast = True
clsPCG.Init

Set clsRBY = New clsVgnMasterEntry
Set clsRBY.dbVgnDatabase = dbVgnDatabase
clsRBY.blnRefByMast = True
clsRBY.Init

Set clsRTO = New clsVgnMasterEntry
Set clsRTO.dbVgnDatabase = dbVgnDatabase
clsRTO.blnRefToMast = True
clsRTO.Init

If mRemoteAccess = True Then
    datRecset.open "Select ServMast.*,ServGrpMst.SgpName,AchdMast.AhName from (ServMast inner join ServGrpMst on ServMast.SrvSgpCode=ServGrpMst.SgpCode) left join AchdMast on ServMast.SrvAhCode=AchdMast.AhCode where SrvCode=" & CStr(mSrvCode) & " order by SrvName", dbComDatabase, adOpenKeyset, adLockOptimistic
Else
    datRecset.open "Select ServMast.*,ServGrpMst.SgpName,AchdMast.AhName from (ServMast inner join ServGrpMst on ServMast.SrvSgpCode=ServGrpMst.SgpCode) left join AchdMast on ServMast.SrvAhCode=AchdMast.AhCode order by SrvName", dbComDatabase, adOpenKeyset, adLockOptimistic
End If
Call SmryList

Mfgrd2.FixedRows = 1: Mfgrd2.FixedCols = 0: Mfgrd2.Rows = 2: Mfgrd2.Cols = MFGRD2_COLS: SetGridAutoHeight Mfgrd2

colcnt = X2SRMICODE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2SRMICODE_COL": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2SRMSNO_COL: Mfgrd2.ColWidth(colcnt) = mskSrmSno.Width: Mfgrd2.TextMatrix(0, colcnt) = "Sno": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2DCTNAME_COL: Mfgrd2.ColWidth(colcnt) = txtDctName.Width: Mfgrd2.TextMatrix(0, colcnt) = "Attendant Name": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2SRMSTARTTIMESTR_COL: Mfgrd2.ColWidth(colcnt) = txtSrmStartTime.Width: Mfgrd2.TextMatrix(0, colcnt) = "Start Time": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2SRMENDTIMESTR_COL: Mfgrd2.ColWidth(colcnt) = txtSrmEndTime.Width: Mfgrd2.TextMatrix(0, colcnt) = "End Time": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2SRMRATE_COL: Mfgrd2.ColWidth(colcnt) = mskSrmRate.Width: Mfgrd2.TextMatrix(0, colcnt) = "Charges": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2SRMDISCPER_COL: Mfgrd2.ColWidth(colcnt) = mskSrmDiscPer.Width: Mfgrd2.TextMatrix(0, colcnt) = "Disc%": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2SRMINFBYPER_COL: Mfgrd2.ColWidth(colcnt) = mskSrmInfByPer.Width: Mfgrd2.TextMatrix(0, colcnt) = "Incr.By %": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2SRMDEFBYPER_COL: Mfgrd2.ColWidth(colcnt) = mskSrmDefByPer.Width: Mfgrd2.TextMatrix(0, colcnt) = "Decr.By %": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2SRMSHAREPER_COL: Mfgrd2.ColWidth(colcnt) = mskSrmSharePer.Width: Mfgrd2.TextMatrix(0, colcnt) = "Share %": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2SRMSHAREAMT_COL: Mfgrd2.ColWidth(colcnt) = mskSrmShareAmt.Width: Mfgrd2.TextMatrix(0, colcnt) = "Share Amt.": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2PCGNAME_COL: Mfgrd2.ColWidth(colcnt) = txtPcgName.Width: Mfgrd2.TextMatrix(0, colcnt) = "Patient Category": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2RBYNAME_COL: Mfgrd2.ColWidth(colcnt) = txtRByName.Width: Mfgrd2.TextMatrix(0, colcnt) = "Referred By": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2RTONAME_COL: Mfgrd2.ColWidth(colcnt) = txtRToName.Width: Mfgrd2.TextMatrix(0, colcnt) = "Referred To": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2SRMWEFDATE_COL: Mfgrd2.ColWidth(colcnt) = dtpSrmWefDate.Width: Mfgrd2.TextMatrix(0, colcnt) = "W.e.f.": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2SRMDCTCODE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2SRMDCTCODE_COL": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2SRMPCGCODE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2SRMPCGCODE_COL": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2SRMRBYCODE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2SRMRBYCODE_COL": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2SRMRTOCODE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2SRMRTOCODE_COL": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2SRMSTARTTIME_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2SRMSTARTTIME_COL": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2SRMENDTIME_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2SRMENDTIME_COL": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2SRMRECSTATE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2SRMRECSTATE_COL": Mfgrd2.ColAlignment(colcnt) = 7

'colcnt = X2SRMSNO_COL: mskSrmSno.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
'colcnt = X2DCTNAME_COL: txtDctName.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
'colcnt = X2SRMSTARTTIMESTR_COL: txtSrmStartTime.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
'colcnt = X2SRMENDTIMESTR_COL: txtSrmEndTime.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
'colcnt = X2SRMRATE_COL: mskSrmRate.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
'colcnt = X2SRMDISCPER_COL: mskSrmDiscPer.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
'colcnt = X2SRMINFBYPER_COL: mskSrmInfByPer.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
'colcnt = X2SRMDEFBYPER_COL: mskSrmDefByPer.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
'colcnt = X2SRMSHAREPER_COL: mskSrmSharePer.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
'colcnt = X2SRMSHAREAMT_COL: mskSrmShareAmt.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
'colcnt = X2PCGNAME_COL: txtPcgName.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
'colcnt = X2RBYNAME_COL: txtRByName.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
'colcnt = X2RTONAME_COL: txtRToName.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
'colcnt = X2SRMWEFDATE_COL: dtpSrmWefDate.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)

'cmdOK.Left = mskSrmShareAmt.Left + mskSrmShareAmt.Width

ShowEntryMode False
VisibleControls False
ShowExtRateSys False

End Sub

Private Sub Form_Resize()
lblFormHeading.Width = Me.Width
cmdFormEscape.Left = Me.Width - (cmdFormEscape.Width * 2)
cmdFormEnter.Left = Me.Width + cmdFormEscape.Width
frFormSmry.Left = (Me.Width - frFormSmry.Width) / 2: frFormSmry.Top = cmbFormEntryMode.Top + (cmbFormEntryMode.Height * 1.25)
frFormDtl.Left = (Me.Width - frFormDtl.Width) / 2: frFormDtl.Top = frFormSmry.Top

End Sub

Private Sub Form_Unload(Cancel As Integer)
Set clsSRV = Nothing
Set clsAH = Nothing
Set clsSGP = Nothing
Set clsPCG = Nothing
Set clsDCT = Nothing
Set clsRBY = Nothing
Set clsRTO = Nothing
Set fcmbSgpName = Nothing
Set fcmbAhName = Nothing
Set fcmbDctName = Nothing
Set fcmbPcgName = Nothing
Set fcmbRByName = Nothing
Set fcmbRToName = Nothing

Set clsListStru = Nothing

CloseTable datRecset
CloseDataSource dbVgnDatabase
CloseDataSource dbAcDatabase
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
'frGridControls.Visible = EntryMode: frGridControls.Enabled = EntryMode
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
    txtSrvName.SetFocus
    Exit Function
End If
If Trim(txtSrvName.Text) = "" Then
    ErrorBox "Invalid Service Name !!!"
    txtSrvName.SetFocus
    Exit Function
End If
If txtSrvName.Text <> mSrvName_old Then
    If ChkIsDuplicate(dbVgnDatabase, "ServMast", "SrvName", txtSrvName.Text, "SrvCode", Val(mskFormBoundField.Text)) = True Then
        ErrorBox "Duplicate Input !!!"
        txtSrvName.SetFocus
        Exit Function
    End If
End If
If txtSgpName.Text = "" Or Val(fcmbSgpName.BoundText) = 0 Then
    ErrorBox "Invalid Service Group Selection !!!"
    txtSgpName.SetFocus
    Exit Function
End If
If txtAhName.Text = "" Or Val(fcmbAhName.BoundText) = 0 Then
    ErrorBox "Invalid Account Name Selection !!!"
    txtAhName.SetFocus
    Exit Function
End If
If Val(mskSrvIndex.Text) < 0 Then
    ErrorBox "Invalid Index !!!"
    mskSrvIndex.SetFocus
    Exit Function
Else
    With tRecset
    .open "Select SrvCode from ServMast order by SrvCode", dbVgnDatabase, adOpenKeyset, adLockOptimistic
    If .RecordCount < Val(mskSrvIndex.Text) Or Val(mskSrvIndex.Text) = 0 Then
        mskSrvIndex.Text = CStr(.RecordCount + IIf(FormAddEditMode = cFORM_ADDMODE, 1, 0))
    End If
    End With
    CloseTable tRecset
End If
If Val(UnMyNumFmt(mskSrvRate.Text)) < 0 Then
    ErrorBox "Invalid Input !!!"
    mskSrvRate.SetFocus
    Exit Function
End If
'If Val(UnMyNumFmt(mskSrvOpdGenChg.Text)) < 0 Then
'    ErrorBox "Invalid Input !!!"
'    mskSrvOpdGenChg.SetFocus
'    Exit Function
'End If
'If Val(UnMyNumFmt(mskSrvOpdEmgChg.Text)) < 0 Then
'    ErrorBox "Invalid Input !!!"
'    mskSrvOpdEmgChg.SetFocus
'    Exit Function
'End If
'If Val(UnMyNumFmt(mskSrvIpdGenChg.Text)) < 0 Then
'    ErrorBox "Invalid Input !!!"
'    mskSrvIpdGenChg.SetFocus
'    Exit Function
'End If
'If Val(UnMyNumFmt(mskSrvIpdEmgChg.Text)) < 0 Then
'    ErrorBox "Invalid Input !!!"
'    mskSrvIpdEmgChg.SetFocus
'    Exit Function
'End If
'If Val(UnMyNumFmt(mskSrvLabGenChg.Text)) < 0 Then
'    ErrorBox "Invalid Input !!!"
'    mskSrvLabGenChg.SetFocus
'    Exit Function
'End If
'If Val(UnMyNumFmt(mskSrvLabEmgChg.Text)) < 0 Then
'    ErrorBox "Invalid Input !!!"
'    mskSrvLabEmgChg.SetFocus
'    Exit Function
'End If
If Val(UnMyPerFmt(mskSrvDiscPer.Text)) < 0 Then
    ErrorBox "Invalid Discount Percentage !!!"
    mskSrvDiscPer.SetFocus
    Exit Function
End If

CloseTable tRecset, mCheckOpen:=True

Data_Verify = True

End Function

Private Sub mskSrmDefByPer_GotFocus()
FlashActiveControl mskSrmDefByPer, True

End Sub

Private Sub mskSrmDefByPer_LostFocus()
FlashActiveControl mskSrmDefByPer, False

End Sub

Private Sub mskSrmDefByPer_Validate(Cancel As Boolean)
Dim mSrmDefByPer As Double

mskSrmDefByPer.Text = ToMyPerFmt(mskSrmDefByPer.Text)
If Between(Val(UnMyPerFmt(mskSrmDefByPer.Text)), 0, 100) = False Then
    ErrorBox "Invalid Percentage !!!"
    mskSrmDefByPer.SetFocus
    Cancel = True
Else
    If Val(UnMyPerFmt(mskSrmDefByPer.Text)) > 0 Then
        mskSrmInfByPer.Text = ToMyPerFmt(0)
        mskSrmRate.Text = ToMyNumFmt(0)
    End If
End If
Call ValidDtl

End Sub

Private Sub mskSrmDiscPer_GotFocus()
FlashActiveControl mskSrmDiscPer, True
End Sub

Private Sub mskSrmDiscPer_LostFocus()
FlashActiveControl mskSrmDiscPer, False
End Sub

Private Sub mskSrmDiscPer_Validate(Cancel As Boolean)
mskSrmDiscPer.Text = ToMyPerFmt(mskSrmDiscPer.Text)
If Val(UnMyPerFmt(mskSrmDiscPer.Text)) < 0 Then
    ErrorBox "Invalid Discount Percentage !!!"
    mskSrmDiscPer.SetFocus
    Cancel = True
End If

End Sub

Private Sub mskSrmInfByPer_GotFocus()
FlashActiveControl mskSrmInfByPer, True

End Sub

Private Sub mskSrmInfByPer_LostFocus()
FlashActiveControl mskSrmInfByPer, False

End Sub

Private Sub mskSrmInfByPer_Validate(Cancel As Boolean)
Dim mSrmInfByPer As Double

mskSrmInfByPer.Text = ToMyPerFmt(mskSrmInfByPer.Text)
If Between(Val(UnMyPerFmt(mskSrmInfByPer.Text)), 0, 100) = False Then
    ErrorBox "Invalid Percentage !!!"
    mskSrmInfByPer.SetFocus
    Cancel = True
Else
    If Val(UnMyPerFmt(mskSrmInfByPer.Text)) > 0 Then
        mskSrmDefByPer.Text = ToMyPerFmt(0)
        mskSrmRate.Text = ToMyNumFmt(0)
    End If
End If
Call ValidDtl

End Sub

Private Sub mskSrmRate_GotFocus()
FlashActiveControl mskSrmRate, True

End Sub

Private Sub mskSrmRate_LostFocus()
FlashActiveControl mskSrmRate, False

End Sub

Private Sub mskSrmRate_Validate(Cancel As Boolean)
mskSrmRate.Text = ToMyNumFmt(mskSrmRate.Text)
If Val(UnMyNumFmt(mskSrmRate.Text)) < 0 Then
    ErrorBox "Invalid Charges !!!"
    mskSrmRate.SetFocus
    Cancel = True
Else
    If Val(UnMyNumFmt(mskSrmRate.Text)) > 0 Then
        mskSrmInfByPer.Text = ToMyPerFmt(0)
        mskSrmDefByPer.Text = ToMyPerFmt(0)
    End If
End If
Call ValidDtl

End Sub

Private Sub mskSrmShareAmt_GotFocus()
FlashActiveControl mskSrmShareAmt, True

End Sub

Private Sub mskSrmShareAmt_LostFocus()
FlashActiveControl mskSrmShareAmt, False

End Sub

Private Sub mskSrmShareAmt_Validate(Cancel As Boolean)
mskSrmShareAmt.Text = ToMyNumFmt(mskSrmShareAmt.Text)
If Val(UnMyNumFmt(mskSrmShareAmt.Text)) < 0 Then
    ErrorBox "Invalid Share Amount !!!"
    mskSrmShareAmt.SetFocus
    Cancel = True
Else
    If Val(UnMyNumFmt(mskSrmShareAmt.Text)) > 0 Then
        mskSrmSharePer.Text = ToMyPerFmt(0)
    End If
End If
Call ValidDtl

End Sub

Private Sub mskSrmSharePer_GotFocus()
FlashActiveControl mskSrmSharePer, True

End Sub

Private Sub mskSrmSharePer_LostFocus()
FlashActiveControl mskSrmSharePer, False

End Sub

Private Sub mskSrmSharePer_Validate(Cancel As Boolean)
Dim mSrmSharePer As Double

mskSrmSharePer.Text = ToMyPerFmt(mskSrmSharePer.Text)
If Between(Val(UnMyPerFmt(mskSrmSharePer.Text)), 0, 100) = False Then
    ErrorBox "Invalid Percentage !!!"
    mskSrmSharePer.SetFocus
    Cancel = True
Else
    If Val(UnMyPerFmt(mskSrmSharePer.Text)) > 0 Then
        mskSrmShareAmt.Text = ToMyNumFmt(0)
    End If
End If
Call ValidDtl

End Sub

Private Sub mskSrvDiscPer_GotFocus()
FlashActiveControl mskSrvDiscPer, True
End Sub

Private Sub mskSrvDiscPer_LostFocus()
FlashActiveControl mskSrvDiscPer, False
End Sub

Private Sub mskSrvDiscPer_Validate(Cancel As Boolean)
mskSrvDiscPer.Text = ToMyPerFmt(mskSrvDiscPer.Text)
If Val(UnMyPerFmt(mskSrvDiscPer.Text)) < 0 Then
    ErrorBox "Invalid Discount Percentage !!!"
    mskSrvDiscPer.SetFocus
    Cancel = True
End If

End Sub

Private Sub mskSrvIndex_GotFocus()
FlashActiveControl mskSrvIndex, True
End Sub

Private Sub mskSrvIndex_LostFocus()
FlashActiveControl mskSrvIndex, False
End Sub

Private Sub mskSrvIndex_Validate(Cancel As Boolean)
Dim tRecset As New ADODB.Recordset

mskSrvIndex.Text = ToMyNumFmt(mskSrvIndex.Text, mDecimals:=0, mUseAbs:=True, mGroupedDigit:=False)
If Val(mskSrvIndex.Text) < 0 Then
    ErrorBox "Invalid Index !!!"
    mskSrvIndex.SetFocus
    Cancel = True
Else
    With tRecset
    .open "Select SrvCode from ServMast order by SrvCode", dbVgnDatabase, adOpenKeyset, adLockOptimistic
    If .RecordCount < Val(mskSrvIndex.Text) Or Val(mskSrvIndex.Text) = 0 Then
        mskSrvIndex.Text = CStr(.RecordCount + IIf(FormAddEditMode = cFORM_ADDMODE, 1, 0))
    End If
    End With
    CloseTable tRecset
End If

CloseTable tRecset, mCheckOpen:=True

End Sub

Private Sub mskSrvRate_GotFocus()
FlashActiveControl mskSrvRate, True
End Sub

Private Sub mskSrvRate_LostFocus()
FlashActiveControl mskSrvRate, False
End Sub

Private Sub mskSrvRate_Validate(Cancel As Boolean)
mskSrvRate.Text = ToMyNumFmt(mskSrvRate.Text, mUseAbs:=True)
If Val(UnMyNumFmt(mskSrvRate.Text)) < 0 Then
    ErrorBox "Invalid Input !!!"
    mskSrvRate.SetFocus
    Cancel = True
End If

End Sub

'Private Sub mskSrvIpdEmgChg_GotFocus()
'FlashActiveControl mskSrvIpdEmgChg, True
'End Sub
'
'Private Sub mskSrvIpdEmgChg_LostFocus()
'FlashActiveControl mskSrvIpdEmgChg, False
'End Sub
'
'Private Sub mskSrvIpdEmgChg_Validate(Cancel As Boolean)
'mskSrvIpdEmgChg.Text = ToMyNumFmt(mskSrvIpdEmgChg.Text)
'If Val(UnMyNumFmt(mskSrvIpdEmgChg.Text)) < 0 Then
'    ErrorBox "Invalid Input !!!"
'    mskSrvIpdEmgChg.SetFocus
'    Cancel = True
'End If
'
'End Sub
'
'Private Sub mskSrvIpdGenChg_GotFocus()
'FlashActiveControl mskSrvIpdGenChg, True
'End Sub
'
'Private Sub mskSrvIpdGenChg_LostFocus()
'FlashActiveControl mskSrvIpdGenChg, False
'End Sub
'
'Private Sub mskSrvIpdGenChg_Validate(Cancel As Boolean)
'mskSrvIpdGenChg.Text = ToMyNumFmt(mskSrvIpdGenChg.Text)
'If Val(UnMyNumFmt(mskSrvIpdGenChg.Text)) < 0 Then
'    ErrorBox "Invalid Input !!!"
'    mskSrvIpdGenChg.SetFocus
'    Cancel = True
'Else
'    If FormAddEditMode = cFORM_ADDMODE And Val(UnMyNumFmt(mskSrvIpdEmgChg.Text)) = 0 Then
'        Rem mskSrvIpdEmgChg.Text = mskSrvIpdGenChg.Text
'    End If
'End If
'
'End Sub
'
'Private Sub mskSrvLabEmgChg_GotFocus()
'FlashActiveControl mskSrvLabEmgChg, True
'End Sub
'
'Private Sub mskSrvLabEmgChg_LostFocus()
'FlashActiveControl mskSrvLabEmgChg, False
'End Sub
'
'Private Sub mskSrvLabEmgChg_Validate(Cancel As Boolean)
'mskSrvLabEmgChg.Text = ToMyNumFmt(mskSrvLabEmgChg.Text)
'If Val(UnMyNumFmt(mskSrvLabEmgChg.Text)) < 0 Then
'    ErrorBox "Invalid Input !!!"
'    mskSrvLabEmgChg.SetFocus
'    Cancel = True
'End If
'
'End Sub
'
'Private Sub mskSrvLabGenChg_GotFocus()
'FlashActiveControl mskSrvLabGenChg, True
'End Sub
'
'Private Sub mskSrvLabGenChg_LostFocus()
'FlashActiveControl mskSrvLabGenChg, False
'End Sub
'
'Private Sub mskSrvLabGenChg_Validate(Cancel As Boolean)
'mskSrvLabGenChg.Text = ToMyNumFmt(mskSrvLabGenChg.Text)
'If Val(UnMyNumFmt(mskSrvLabGenChg.Text)) < 0 Then
'    ErrorBox "Invalid Input !!!"
'    mskSrvLabGenChg.SetFocus
'    Cancel = True
'Else
'    If FormAddEditMode = cFORM_ADDMODE And Val(UnMyNumFmt(mskSrvLabEmgChg.Text)) = 0 Then
'        Rem mskSrvLabEmgChg.Text = mskSrvLabGenChg.Text
'    End If
'End If
'
'End Sub
'
'Private Sub mskSrvOpdEmgChg_GotFocus()
'FlashActiveControl mskSrvOpdEmgChg, True
'End Sub
'
'Private Sub mskSrvOpdEmgChg_LostFocus()
'FlashActiveControl mskSrvOpdEmgChg, False
'End Sub
'
'Private Sub mskSrvOpdEmgChg_Validate(Cancel As Boolean)
'mskSrvOpdEmgChg.Text = ToMyNumFmt(mskSrvOpdEmgChg.Text)
'If Val(UnMyNumFmt(mskSrvOpdEmgChg.Text)) < 0 Then
'    ErrorBox "Invalid Input !!!"
'    mskSrvOpdEmgChg.SetFocus
'    Cancel = True
'End If
'
'End Sub
'
'Private Sub mskSrvOpdGenChg_GotFocus()
'FlashActiveControl mskSrvOpdGenChg, True
'End Sub
'
'Private Sub mskSrvOpdGenChg_LostFocus()
'FlashActiveControl mskSrvOpdGenChg, False
'End Sub
'
'Private Sub mskSrvOpdGenChg_Validate(Cancel As Boolean)
'mskSrvOpdGenChg.Text = ToMyNumFmt(mskSrvOpdGenChg.Text)
'If Val(UnMyNumFmt(mskSrvOpdGenChg.Text)) < 0 Then
'    ErrorBox "Invalid Input !!!"
'    mskSrvOpdGenChg.SetFocus
'    Cancel = True
'Else
'    If FormAddEditMode = cFORM_ADDMODE And Val(UnMyNumFmt(mskSrvOpdEmgChg.Text)) = 0 Then
'        Rem mskSrvOpdEmgChg.Text = mskSrvOpdGenChg.Text
'    End If
'End If
'
'End Sub

Private Sub txtAhName_Change()
If fcmbAhName.CallFromText_Change = False Then
    fcmbAhName.CallFromText_Change = True
    If InterActiveChange(txtAhName) = True Then
        fcmbAhName.UserText = Array(txtAhName.Text, txtAhName.SelStart)
        fcmbAhName.Show
        txtAhName.Text = fcmbAhName.Text
        If fcmbAhName.ListSelected = True Then
            SendKeys "{tab}"
        End If
    End If
    fcmbAhName.CallFromText_Change = False
End If

End Sub

Private Sub txtAhName_GotFocus()
FlashActiveControl txtAhName, True
End Sub

Private Sub txtAhName_KeyDown(KeyCode As Integer, Shift As Integer)
If MyDropDownKey(Shift, KeyCode) = True Then
    Call txtAhName_Change
End If

End Sub

Private Sub txtAhName_LostFocus()
FlashActiveControl txtAhName, False
End Sub

Private Sub txtAhname_Validate(Cancel As Boolean)
If txtAhName.Text = "" Or Val(fcmbAhName.BoundText) = 0 Then
    ErrorBox "Invalid Account Name Selection !!!"
    txtAhName.SetFocus
    Cancel = True
End If

End Sub

Private Sub txtDctName_KeyDown(KeyCode As Integer, Shift As Integer)
If MyDropDownKey(Shift, KeyCode) = True Then
    Call txtDctName_Change
End If

End Sub

Private Sub txtPcgName_KeyDown(KeyCode As Integer, Shift As Integer)
If MyDropDownKey(Shift, KeyCode) = True Then
    Call txtPcgName_Change
End If

End Sub

Private Sub txtRByName_KeyDown(KeyCode As Integer, Shift As Integer)
If MyDropDownKey(Shift, KeyCode) = True Then
    Call txtRByName_Change
End If

End Sub

Private Sub txtRToName_KeyDown(KeyCode As Integer, Shift As Integer)
If MyDropDownKey(Shift, KeyCode) = True Then
    Call txtRToName_Change
End If

End Sub

Private Sub txtSgpName_Change()
If fcmbSgpName.CallFromText_Change = False Then
    fcmbSgpName.CallFromText_Change = True
    If InterActiveChange(txtSgpName) = True Then
        fcmbSgpName.UserText = Array(txtSgpName.Text, txtSgpName.SelStart)
        fcmbSgpName.Show
        txtSgpName.Text = fcmbSgpName.Text
        If fcmbSgpName.ListSelected = True Then
            SendKeys "{tab}"
        End If
    End If
    fcmbSgpName.CallFromText_Change = False
End If

End Sub

Private Sub txtSgpName_GotFocus()
FlashActiveControl txtSgpName, True
End Sub

Private Sub txtSgpName_KeyDown(KeyCode As Integer, Shift As Integer)
If MyDropDownKey(Shift, KeyCode) = True Then
    Call txtSgpName_Change
End If

End Sub

Private Sub txtSgpName_LostFocus()
FlashActiveControl txtSgpName, False
End Sub

Private Sub txtSgpName_Validate(Cancel As Boolean)
If txtSgpName.Text = "" Or Val(fcmbSgpName.BoundText) = 0 Then
    ErrorBox "Invalid Service Group Selection !!!"
    txtSgpName.SetFocus
    Cancel = True
End If

End Sub

Private Sub txtSrmEndTime_GotFocus()
FlashActiveControl txtSrmEndTime, True

End Sub

Private Sub txtSrmEndTime_LostFocus()
FlashActiveControl txtSrmEndTime, False

End Sub

Private Sub txtSrmEndTime_Validate(Cancel As Boolean)
Dim mSrmEndTime  As Long

txtSrmEndTime.Text = MinToTime(TimeToMin(txtSrmEndTime.Text))
mSrmEndTime = TimeToMin(txtSrmEndTime.Text)

If Between(mSrmEndTime, 0, 24 * 60) = False Then
    ErrorBox "Invalid Time !!!"
    txtSrmEndTime.SetFocus
    Cancel = True
Else
    If TimeToMin(txtSrmStartTime.Text) > mSrmEndTime Then
        Rem ErrorBox "Invalid Time Range !!!"
    End If
End If
Call ValidDtl

End Sub

Private Sub txtSrmStartTime_GotFocus()
FlashActiveControl txtSrmStartTime, True

End Sub

Private Sub txtSrmStartTime_LostFocus()
FlashActiveControl txtSrmStartTime, False

End Sub

Private Sub txtSrmStartTime_Validate(Cancel As Boolean)
Dim mSrmStartTime  As Long

txtSrmStartTime.Text = MinToTime(TimeToMin(txtSrmStartTime.Text))
mSrmStartTime = TimeToMin(txtSrmStartTime.Text)

If Between(mSrmStartTime, 0, 24 * 60) = False Then
    ErrorBox "Invalid Time !!!"
    txtSrmStartTime.SetFocus
    Cancel = True
Else
    If mSrmStartTime > TimeToMin(txtSrmEndTime.Text) Then
        Rem ErrorBox "Invalid Time Range !!!"
    End If
End If
Call ValidDtl

End Sub

Private Sub txtSrvName_GotFocus()
FlashActiveControl txtSrvName, True
End Sub

Private Sub txtSrvName_LostFocus()
FlashActiveControl txtSrvName, False
End Sub

Private Sub txtSrvName_Validate(Cancel As Boolean)
txtSrvName.Text = ToMyWord(txtSrvName.Text)
If Trim(txtSrvName.Text) = "" Then
    ErrorBox "Invalid Input !!!"
    Cancel = True
    txtSrvName.SetFocus
Else
    If txtSrvName.Text <> mSrvName_old Then
        If ChkIsDuplicate(dbVgnDatabase, "ServMast", "SrvName", txtSrvName.Text, "SrvCode", Val(mskFormBoundField.Text)) = True Then
            ErrorBox "Duplicate Input !!!"
            Cancel = True
            txtSrvName.SetFocus
        End If
    End If
End If

End Sub

Private Sub Data_AddEvent()

If CanUserAddOpt(mUsrCode:=MyCompany.mUserCode, mMenuOptName:=Me.SecuMenuName) = False Then
    AlertBox "Not Permitted !!!"
    Exit Sub
End If
If clsSRV.BeginMast(0) = False Then
    Exit Sub
End If
mEntrySaved = False: mEntryAborted = False
FormAddEditMode = cFORM_ADDMODE
    
clsSRV.Clear
mSrvCode = clsSRV.ActiveCode
mskFormBoundField.Text = mSrvCode
txtSrvName.Text = ""
fcmbSgpName.BoundText = CStr(GetLastValueFromTableCol(cnn:=dbVgnDatabase, mTableName:="ServMast", mColumnName:="SrvSgpCode", mOrderByColName:="SrvCode", mRtnDefValue:=0))
txtSgpName.Text = fcmbSgpName.Text
fcmbAhName.BoundText = CStr(GetLastValueFromTableCol(cnn:=dbVgnDatabase, mTableName:="ServMast", mColumnName:="SrvAhCode", mOrderByColName:="SrvCode", mRtnDefValue:=0))
txtAhName.Text = fcmbAhName.Text
mskSrvIndex.Text = 0
mskSrvRate.Text = ToMyNumFmt(0)
'mskSrvOpdGenChg.Text = ToMyNumFmt(0)
'mskSrvOpdEmgChg.Text = ToMyNumFmt(0)
'mskSrvIpdGenChg.Text = ToMyNumFmt(0)
'mskSrvIpdEmgChg.Text = ToMyNumFmt(0)
'mskSrvLabGenChg.Text = ToMyNumFmt(0)
'mskSrvLabEmgChg.Text = ToMyNumFmt(0)
chkSrvMultiDctIncl.Value = vbUnchecked
chkSrvAutoInsIpdBill.Value = vbUnchecked
chkSrvAutoCalcIpdBill.Value = vbUnchecked
chkSrvAutoInsOnceIpdBill.Value = vbUnchecked
chkSrvUnitEditable.Value = vbChecked
chkSrvRateEditable.Value = vbChecked
chkSrvAmtEditable.Value = vbChecked
chkSrvInfAllowed.Value = vbChecked
chkSrvDefAllowed.Value = vbChecked
chkSrvDiscAllowed.Value = vbChecked
mskSrvDiscPer.Text = ToMyPerFmt(0)
chkSrvShowInList.Value = vbChecked

chkSrvDctwseRateSys.Value = vbUnchecked
chkSrvPcgwseRateSys.Value = vbUnchecked
chkSrvRBywseRateSys.Value = vbUnchecked
chkSrvRTowseRateSys.Value = vbUnchecked
chkSrvTimewseRateSys.Value = vbUnchecked

chkSrvDctwseDiscSys.Value = vbUnchecked
chkSrvPcgwseDiscSys.Value = vbUnchecked
chkSrvRBywseDiscSys.Value = vbUnchecked
chkSrvRTowseDiscSys.Value = vbUnchecked
chkSrvTimewseDiscSys.Value = vbUnchecked

chkSrvDctwseBargSys.Value = vbUnchecked
chkSrvPcgwseBargSys.Value = vbUnchecked
chkSrvRBywseBargSys.Value = vbUnchecked
chkSrvRTowseBargSys.Value = vbUnchecked
chkSrvTimewseBargSys.Value = vbUnchecked

chkSrvDctwseShareSys.Value = vbUnchecked
chkSrvPcgwseShareSys.Value = vbUnchecked
chkSrvRBywseShareSys.Value = vbUnchecked
chkSrvRTowseShareSys.Value = vbUnchecked
chkSrvTimewseShareSys.Value = vbUnchecked

ShowDtlData mSrvCode

mSrvName_old = txtSrvName.Text
mSrvIndex_old = Val(mskSrvIndex.Text)

Call ShowEntryMode(True)
txtSrvName.SetFocus

End Sub

Private Sub Data_EditEvent()
Dim mLCount As Integer, mUCount As Integer, mCount As Integer

If CanUserEditOpt(mUsrCode:=MyCompany.mUserCode, mMenuOptName:=Me.SecuMenuName) = False Then
    AlertBox "Not Permitted !!!"
    Exit Sub
End If
If clsSRV.BeginMast(datRecset.fields("SrvCode")) = False Then
    Exit Sub
End If
mEntrySaved = False: mEntryAborted = False
FormAddEditMode = cFORM_EDITMODE
With datRecset
mSrvCode = .fields("SrvCode")
clsSRV.GetData mSrvCode
mskFormBoundField.Text = CStr(.fields("SrvCode"))
txtSrvName.Text = .fields("SrvName")
fcmbSgpName.BoundText = CStr(.fields("SrvSgpCode")): txtSgpName.Text = fcmbSgpName.Text
fcmbAhName.BoundText = CStr(.fields("SrvAhCode")): txtAhName.Text = fcmbAhName.Text
mskSrvIndex.Text = .fields("SrvIndex")
mskSrvRate.Text = ToMyNumFmt(.fields("SrvRate"))
'mskSrvOpdGenChg.Text = ToMyNumFmt(.fields("SrvOpdGenChg"))
'mskSrvOpdEmgChg.Text = ToMyNumFmt(.fields("SrvOpdEmgChg"))
'mskSrvIpdGenChg.Text = ToMyNumFmt(.fields("SrvIpdGenChg"))
'mskSrvIpdEmgChg.Text = ToMyNumFmt(.fields("SrvIpdEmgChg"))
'mskSrvLabGenChg.Text = ToMyNumFmt(.fields("SrvLabGenChg"))
'mskSrvLabEmgChg.Text = ToMyNumFmt(.fields("SrvLabEmgChg"))
chkSrvMultiDctIncl.Value = IIf(.fields("SrvMultiDctIncl") = True, vbChecked, vbUnchecked)
chkSrvAutoInsIpdBill.Value = IIf(.fields("SrvAutoInsIpdBill") = True, vbChecked, vbUnchecked)
chkSrvAutoCalcIpdBill.Value = IIf(.fields("SrvAutoCalcIpdBill") = True, vbChecked, vbUnchecked)
chkSrvAutoInsOnceIpdBill.Value = IIf(.fields("SrvAutoInsOnceIpdBill") = True, vbChecked, vbUnchecked)
chkSrvUnitEditable.Value = IIf(.fields("SrvUnitEditable") = True, vbChecked, vbUnchecked)
chkSrvRateEditable.Value = IIf(.fields("SrvRateEditable") = True, vbChecked, vbUnchecked)
chkSrvAmtEditable.Value = IIf(.fields("SrvAmtEditable") = True, vbChecked, vbUnchecked)
chkSrvInfAllowed.Value = IIf(.fields("SrvInfAllowed") = True, vbChecked, vbUnchecked)
chkSrvDefAllowed.Value = IIf(.fields("SrvDefAllowed") = True, vbChecked, vbUnchecked)
chkSrvDiscAllowed.Value = IIf(.fields("SrvDiscAllowed") = True, vbChecked, vbUnchecked)
mskSrvDiscPer.Text = ToMyPerFmt(.fields("SrvDiscPer"))
chkSrvShowInList.Value = IIf(.fields("SrvShowInList") = True, vbChecked, vbUnchecked)

chkSrvDctwseRateSys.Value = IIf(.fields("SrvDctwseRateSys") = True, vbChecked, vbUnchecked)
chkSrvPcgwseRateSys.Value = IIf(.fields("SrvPcgwseRateSys") = True, vbChecked, vbUnchecked)
chkSrvRBywseRateSys.Value = IIf(.fields("SrvRBywseRateSys") = True, vbChecked, vbUnchecked)
chkSrvRTowseRateSys.Value = IIf(.fields("SrvRTowseRateSys") = True, vbChecked, vbUnchecked)
chkSrvTimewseRateSys.Value = IIf(.fields("SrvTimewseRateSys") = True, vbChecked, vbUnchecked)

chkSrvDctwseDiscSys.Value = IIf(.fields("SrvDctwseDiscSys") = True, vbChecked, vbUnchecked)
chkSrvPcgwseDiscSys.Value = IIf(.fields("SrvPcgwseDiscSys") = True, vbChecked, vbUnchecked)
chkSrvRBywseDiscSys.Value = IIf(.fields("SrvRBywseDiscSys") = True, vbChecked, vbUnchecked)
chkSrvRTowseDiscSys.Value = IIf(.fields("SrvRTowseDiscSys") = True, vbChecked, vbUnchecked)
chkSrvTimewseDiscSys.Value = IIf(.fields("SrvTimewseDiscSys") = True, vbChecked, vbUnchecked)

chkSrvDctwseBargSys.Value = IIf(.fields("SrvDctwseBargSys") = True, vbChecked, vbUnchecked)
chkSrvPcgwseBargSys.Value = IIf(.fields("SrvPcgwseBargSys") = True, vbChecked, vbUnchecked)
chkSrvRBywseBargSys.Value = IIf(.fields("SrvRBywseBargSys") = True, vbChecked, vbUnchecked)
chkSrvRTowseBargSys.Value = IIf(.fields("SrvRTowseBargSys") = True, vbChecked, vbUnchecked)
chkSrvTimewseBargSys.Value = IIf(.fields("SrvTimewseBargSys") = True, vbChecked, vbUnchecked)

chkSrvDctwseShareSys.Value = IIf(.fields("SrvDctwseShareSys") = True, vbChecked, vbUnchecked)
chkSrvPcgwseShareSys.Value = IIf(.fields("SrvPcgwseShareSys") = True, vbChecked, vbUnchecked)
chkSrvRBywseShareSys.Value = IIf(.fields("SrvRBywseShareSys") = True, vbChecked, vbUnchecked)
chkSrvRTowseShareSys.Value = IIf(.fields("SrvRTowseShareSys") = True, vbChecked, vbUnchecked)
chkSrvTimewseShareSys.Value = IIf(.fields("SrvTimewseShareSys") = True, vbChecked, vbUnchecked)

End With

ShowDtlData mSrvCode

mSrvName_old = txtSrvName.Text
mSrvIndex_old = Val(mskSrvIndex.Text)

Call ShowEntryMode(True)
txtSrvName.SetFocus

End Sub

Private Sub ShowDtlData(ByVal mSrmCode As Long)
Dim srow As Integer, tRecset As New ADODB.Recordset, mColCnt As Integer

srow = 1
Mfgrd2.Rows = 2

With tRecset
.open "Select * from ServRateMst where SrmCode=" & CStr(mSrmCode) & " order by SrmSno", dbVgnDatabase, adOpenKeyset, adLockOptimistic
If .RecordCount > 0 Then
    Do While .EOF = False
        If InList(.fields("SrmRecState"), Array(cREC_ADDED, cREC_EDITED, cREC_UNCHANGED)) = True Then
            clsDCT.GetData .fields("SrmDctCode")
            clsPCG.GetData .fields("SrmPcgCode")
            clsRBY.GetData .fields("SrmRByCode")
            clsRTO.GetData .fields("SrmRToCode")
            
            Mfgrd2.TextMatrix(srow, X2SRMICODE_COL) = .fields("SrmICode")
            Mfgrd2.TextMatrix(srow, X2SRMSNO_COL) = ToMyNumFmt(.fields("SrmSno"), mDecimals:=0)
            Mfgrd2.TextMatrix(srow, X2DCTNAME_COL) = clsDCT.mName_str
            Mfgrd2.TextMatrix(srow, X2SRMSTARTTIMESTR_COL) = MinToTime(.fields("SrmStartTime"))
            Mfgrd2.TextMatrix(srow, X2SRMENDTIMESTR_COL) = MinToTime(.fields("SrmEndTime"))
            Mfgrd2.TextMatrix(srow, X2SRMRATE_COL) = ToMyNumFmt(.fields("SrmRate"))
            Mfgrd2.TextMatrix(srow, X2SRMDISCPER_COL) = ToMyNumFmt(.fields("SrmDiscPer"))
            Mfgrd2.TextMatrix(srow, X2SRMINFBYPER_COL) = ToMyPerFmt(.fields("SrmInfByPer"))
            Mfgrd2.TextMatrix(srow, X2SRMDEFBYPER_COL) = ToMyPerFmt(.fields("SrmDefByPer"))
            Mfgrd2.TextMatrix(srow, X2SRMSHAREPER_COL) = ToMyPerFmt(.fields("SrmSharePer"))
            Mfgrd2.TextMatrix(srow, X2SRMSHAREAMT_COL) = ToMyNumFmt(.fields("SrmShareAmt"))
            Mfgrd2.TextMatrix(srow, X2PCGNAME_COL) = clsPCG.mName_str
            Mfgrd2.TextMatrix(srow, X2RBYNAME_COL) = clsRBY.mName_str
            Mfgrd2.TextMatrix(srow, X2RTONAME_COL) = clsRTO.mName_str
            Mfgrd2.TextMatrix(srow, X2SRMWEFDATE_COL) = Dtoc(.fields("SrmWefDate"))
            Mfgrd2.TextMatrix(srow, X2SRMDCTCODE_COL) = .fields("SrmDctCode")
            Mfgrd2.TextMatrix(srow, X2SRMPCGCODE_COL) = .fields("SrmPcgCode")
            Mfgrd2.TextMatrix(srow, X2SRMRBYCODE_COL) = .fields("SrmRByCode")
            Mfgrd2.TextMatrix(srow, X2SRMRTOCODE_COL) = .fields("SrmRToCode")
            Mfgrd2.TextMatrix(srow, X2SRMSTARTTIME_COL) = .fields("SrmStartTime")
            Mfgrd2.TextMatrix(srow, X2SRMENDTIME_COL) = .fields("SrmEndTime")
            Mfgrd2.TextMatrix(srow, X2SRMRECSTATE_COL) = .fields("SrmRecState")
            
            Mfgrd2.Rows = Mfgrd2.Rows + 1
            srow = srow + 1
        Else
            If InList(.fields("SrmRecState"), Array(cREC_CANCELED, cREC_DELETED)) = False Then
                ErrorBox Me.Name & "_ShowDtlData_#940_[Invalid Record Status]"
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

End Sub

Private Sub Data_SaveEvent()
Dim tRecset As New ADODB.Recordset
Dim srow As Integer, mSrmICode As Long

With clsSRV
If FormAddEditMode = cFORM_ADDMODE Then
    .Clear
Else
    .GetData mSrvCode
End If
.mName_str = txtSrvName.Text
.mSrvSgpCode_lng = Val(fcmbSgpName.BoundText)
.mSrvAhCode_lng = Val(fcmbAhName.BoundText)
.mSrvIndex_int = Val(mskSrvIndex.Text)
.mSrvRate_dbl = Val(UnMyNumFmt(mskSrvRate.Text))
.mSrvOpdGenChg_dbl = 0  ''' Val(UnMyNumFmt(mskSrvOpdGenChg.Text))
.mSrvOpdEmgChg_dbl = 0  ''' Val(UnMyNumFmt(mskSrvOpdEmgChg.Text))
.mSrvIpdGenChg_dbl = 0  ''' Val(UnMyNumFmt(mskSrvIpdGenChg.Text))
.mSrvIpdEmgChg_dbl = 0  ''' Val(UnMyNumFmt(mskSrvIpdEmgChg.Text))
.mSrvLabGenChg_dbl = 0  ''' Val(UnMyNumFmt(mskSrvLabGenChg.Text))
.mSrvLabEmgChg_dbl = 0  ''' Val(UnMyNumFmt(mskSrvLabEmgChg.Text))
.mSrvMultiDctIncl_bln = (chkSrvMultiDctIncl.Value = vbChecked)
.mSrvAutoInsIpdBill_bln = (chkSrvAutoInsIpdBill.Value = vbChecked)
.mSrvAutoCalcIpdBill_bln = (chkSrvAutoCalcIpdBill.Value = vbChecked)
.mSrvAutoInsOnceIpdBill_bln = (chkSrvAutoInsOnceIpdBill.Value = vbChecked)
.mSrvUnitEditable_bln = (chkSrvUnitEditable.Value = vbChecked)
.mSrvRateEditable_bln = (chkSrvRateEditable.Value = vbChecked)
.mSrvAmtEditable_bln = (chkSrvAmtEditable.Value = vbChecked)
.mSrvInfAllowed_bln = (chkSrvInfAllowed.Value = vbChecked)
.mSrvDefAllowed_bln = (chkSrvDefAllowed.Value = vbChecked)
.mSrvDiscAllowed_bln = (chkSrvDiscAllowed.Value = vbChecked)
.mSrvDiscPer_dbl = Val(UnMyPerFmt(mskSrvDiscPer.Text))
.mSrvShowInList_bln = (chkSrvShowInList.Value = vbChecked)

.mSrvDctwseRateSys_bln = (chkSrvDctwseRateSys.Value = vbChecked)
.mSrvPcgwseRateSys_bln = (chkSrvPcgwseRateSys.Value = vbChecked)
.mSrvRBywseRateSys_bln = (chkSrvRBywseRateSys.Value = vbChecked)
.mSrvRTowseRateSys_bln = (chkSrvRTowseRateSys.Value = vbChecked)
.mSrvTimewseRateSys_bln = (chkSrvTimewseRateSys.Value = vbChecked)

.mSrvDctwseDiscSys_bln = (chkSrvDctwseDiscSys.Value = vbChecked)
.mSrvPcgwseDiscSys_bln = (chkSrvPcgwseDiscSys.Value = vbChecked)
.mSrvRBywseDiscSys_bln = (chkSrvRBywseDiscSys.Value = vbChecked)
.mSrvRTowseDiscSys_bln = (chkSrvRTowseDiscSys.Value = vbChecked)
.mSrvTimewseDiscSys_bln = (chkSrvTimewseDiscSys.Value = vbChecked)

.mSrvDctwseBargSys_bln = (chkSrvDctwseBargSys.Value = vbChecked)
.mSrvPcgwseBargSys_bln = (chkSrvPcgwseBargSys.Value = vbChecked)
.mSrvRBywseBargSys_bln = (chkSrvRBywseBargSys.Value = vbChecked)
.mSrvRTowseBargSys_bln = (chkSrvRTowseBargSys.Value = vbChecked)
.mSrvTimewseBargSys_bln = (chkSrvTimewseBargSys.Value = vbChecked)

.mSrvDctwseShareSys_bln = (chkSrvDctwseShareSys.Value = vbChecked)
.mSrvPcgwseShareSys_bln = (chkSrvPcgwseShareSys.Value = vbChecked)
.mSrvRBywseShareSys_bln = (chkSrvRBywseShareSys.Value = vbChecked)
.mSrvRTowseShareSys_bln = (chkSrvRTowseShareSys.Value = vbChecked)
.mSrvTimewseShareSys_bln = (chkSrvTimewseShareSys.Value = vbChecked)

If FormAddEditMode = cFORM_ADDMODE Then
    .AddNew
    
    mSrvCode = .mCode_lng
    mskFormBoundField.Text = .mCode_lng
Else
    .Update mSrvCode
End If
If .mCode_lng > 0 Then   ' updated successfully
    .UpdateMast .mCode_lng
    .EndMast .mCode_lng
    mEntrySaved = True
    
    Rem re-ordering index order
    RefreshDatabase dbVgnDatabase
    dbVgnDatabase.BeginTrans
    tRecset.open "Select * from ServMast where SrvCode<>" & CStr(.mCode_lng) & " and SrvIndex=" & .mSrvIndex_int & "", dbVgnDatabase, adOpenKeyset, adLockOptimistic
    If tRecset.RecordCount > 0 Then
        If FormAddEditMode = cFORM_ADDMODE Then
            tRecset.fields("SrvIndex") = tRecset.RecordCount
        Else
            tRecset.fields("SrvIndex") = mSrvIndex_old
        End If
        tRecset.Update
    End If
    dbVgnDatabase.CommitTrans
    CloseTable tRecset
    
    Rem updating Service Rate & Share information
    dbVgnDatabase.BeginTrans
    dbVgnDatabase.Execute "Update ServRateMst set SrmRecState=" & cREC_DELETED & " where SrmCode=" & CStr(mSrvCode)
    
    For srow = 1 To Mfgrd2.Rows - 2
        mSrmICode = Val(Mfgrd2.TextMatrix(srow, X2SRMICODE_COL))
        With tRecset
        .open "Select * from ServRateMst where SrmICode=" & CStr(mSrmICode) & "", dbVgnDatabase, adOpenKeyset, adLockOptimistic
        If mSrmICode < 1 Then
            .AddNew
            
            Rem .Fields("SrmICode") = AutoNumber
            .fields("SrmCode") = mSrvCode
        End If
        .fields("SrmSno") = srow    ' resetting sno as well (if any row deleted)
        
        .fields("SrmDctCode") = Val(Mfgrd2.TextMatrix(srow, X2SRMDCTCODE_COL))
        .fields("SrmStartTime") = Val(Mfgrd2.TextMatrix(srow, X2SRMSTARTTIME_COL))
        .fields("SrmEndTime") = Val(Mfgrd2.TextMatrix(srow, X2SRMENDTIME_COL))
        .fields("SrmRate") = UnMyNumFmt(Mfgrd2.TextMatrix(srow, X2SRMRATE_COL))
        .fields("SrmDiscPer") = UnMyPerFmt(Mfgrd2.TextMatrix(srow, X2SRMDISCPER_COL))
        .fields("SrmInfByPer") = UnMyPerFmt(Mfgrd2.TextMatrix(srow, X2SRMINFBYPER_COL))
        .fields("SrmDefByPer") = UnMyPerFmt(Mfgrd2.TextMatrix(srow, X2SRMDEFBYPER_COL))
        .fields("SrmSharePer") = UnMyPerFmt(Mfgrd2.TextMatrix(srow, X2SRMSHAREPER_COL))
        .fields("SrmShareAmt") = UnMyNumFmt(Mfgrd2.TextMatrix(srow, X2SRMSHAREAMT_COL))
        .fields("SrmPcgCode") = Val(Mfgrd2.TextMatrix(srow, X2SRMPCGCODE_COL))
        .fields("SrmRByCode") = Val(Mfgrd2.TextMatrix(srow, X2SRMRBYCODE_COL))
        .fields("SrmRToCode") = Val(Mfgrd2.TextMatrix(srow, X2SRMRTOCODE_COL))
        .fields("SrmWefDate") = Ctod(Mfgrd2.TextMatrix(srow, X2SRMWEFDATE_COL))
        .fields("SrmRecState") = cREC_UNCHANGED
        .fields("SrmRemark") = ""
        .Update
        End With
        CloseTable tRecset
    Next srow
    dbVgnDatabase.Execute "Delete from ServRateMst where SrmCode=" & CStr(mSrvCode) & " and SrmRecState=" & cREC_DELETED & ""
    dbVgnDatabase.CommitTrans
    
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

mSrvCode = datRecset.fields("SrvCode")
mRecAbsPos = datRecset.AbsolutePosition

If clsSRV.CanDeleteMast(mSrvCode) = True Then
    txtVoid.SetFocus
    If clsSRV.BeginMast(mSrvCode) = True Then
        Rem deleting service rate master
        dbVgnDatabase.BeginTrans
        dbVgnDatabase.Execute "Delete from ServRateMst where SrmCode=" & CStr(mSrvCode) & ""
        dbVgnDatabase.CommitTrans
        
        clsSRV.GetData mSrvCode
        
        clsSRV.DeleteMast mSrvCode
        clsSRV.UpdateMast mSrvCode
        clsSRV.EndMast mSrvCode
        
        dbVgnDatabase.BeginTrans
        dbVgnDatabase.Execute "Update ServMast set SrvIndex=SrvIndex-1 where SrvIndex>=" & CStr(clsSRV.mSrvIndex_int) & " and SrvCode<>" & CStr(mSrvCode) & ""
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
clsSRV.CancelMast mSrvCode
clsSRV.EndMast mSrvCode
mEntryAborted = True

End Sub

Private Sub SmryList()
Dim gcolcount As Integer, acount As Integer, mLow As Integer, mHigh As Integer, mPos As Integer, srow As Long, mColCount As Integer

clsListStru.Clear

Rem column definitions
clsListStru.AddFields mExpr:="SrvCode", mAttrib:=cFAT_SYSTEM
clsListStru.AddFields mExpr:="SrvName", mTitle:="Service Name", mAlign:=1, mWidth:=4000, mShowItem:=True
clsListStru.AddFields mExpr:="SrvSgpName", mTitle:="Group Name", mAlign:=1, mWidth:=2500, mShowItem:=True
clsListStru.AddFields mExpr:="SrvAhName", mTitle:="Account Name", mAlign:=1, mWidth:=2500, mShowItem:=True
clsListStru.AddFields mExpr:="SrvRate", mTitle:="Charges", mAlign:=7, mWidth:=1000, mShowItem:=True
clsListStru.AddFields mExpr:="SrvIndex", mTitle:="Index", mAlign:=7, mWidth:=1000, mShowItem:=True
clsListStru.AddFields mExpr:="SrvShowInList", mTitle:="Show List", mAlign:=1, mWidth:=1000, mShowItem:=True

RefreshDatabase dbVgnDatabase
RefreshDatabase dbComDatabase
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
        Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("SrvCode")) = .fields("SrvCode")
        Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("SrvName")) = .fields("SrvName")
        Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("SrvSgpName")) = .fields("SgpName")
        Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("SrvAhName")) = .fields("AhName")
        Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("SrvRate")) = ToMyNumFmt(.fields("SrvRate"))
        Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("SrvIndex")) = .fields("SrvIndex")
        Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("SrvShowInList")) = IIf(.fields("SrvShowInList") = True, "Yes", "No")
        
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
SearchFlex Mfgrd1, clsListStru.GetItemIndex("SrvName"), mText
ShowActiveFlexRow Mfgrd1

End Sub

Private Sub txtSearch1Text_GotFocus()
FlashActiveControl txtSearch1Text, True
End Sub

Private Sub txtSearch1Text_LostFocus()
FlashActiveControl txtSearch1Text, False
End Sub

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
Dim srow As Integer, mSrmICode As Long, mDeleteit As Boolean
srow = Mfgrd2.Row
mSrmICode = Val(Mfgrd2.TextMatrix(srow, X2SRMICODE_COL))

If MyDeleteKey(Shift, KeyCode, mCheckCtrlMask:=False) = True And srow < FlexNewRow(Mfgrd2) Then     ' mSrmICode > 0
    mDeleteit = True
    If mDeleteit = True Then
        mDeleteit = CanDelete()
    End If
    If mDeleteit = True Then
        RemoveFlexRow Mfgrd2, srow
        
        Rem ShowDtlData mSrvCode
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
    Call ReadControlValues
    
''    If dtlAddMode = True Then
''        mskSrmSno.Text = ToMyNumFmt(FlexNextSeqno(Mfgrd2, X2SRMSNO_COL), mDecimals:=0)
''    Else
''        mskSrmSno.Text = Mfgrd2.TextMatrix(srow, X2SRMSNO_COL)
''        fcmbDctName.BoundText = Mfgrd2.TextMatrix(srow, X2SRMDCTCODE_COL): txtDctName.Text = fcmbDctName.Text
''        txtSrmStartTime.Text = Mfgrd2.TextMatrix(srow, X2SRMSTARTTIMESTR_COL)
''        txtSrmEndTime.Text = Mfgrd2.TextMatrix(srow, X2SRMENDTIMESTR_COL)
''        mskSrmRate.Text = Mfgrd2.TextMatrix(srow, X2SRMRATE_COL)
''        mskSrmDiscPer.Text = Mfgrd2.TextMatrix(srow, X2SRMDISCPER_COL)
''        mskSrmInfByPer.Text = Mfgrd2.TextMatrix(srow, X2SRMINFBYPER_COL)
''        mskSrmDefByPer.Text = Mfgrd2.TextMatrix(srow, X2SRMDEFBYPER_COL)
''        mskSrmSharePer.Text = Mfgrd2.TextMatrix(srow, X2SRMSHAREPER_COL)
''        mskSrmShareAmt.Text = Mfgrd2.TextMatrix(srow, X2SRMSHAREAMT_COL)
''        fcmbPcgName.BoundText = Mfgrd2.TextMatrix(srow, X2SRMPCGCODE_COL): txtPcgName.Text = fcmbPcgName.Text
''        fcmbRByName.BoundText = Mfgrd2.TextMatrix(srow, X2SRMRBYCODE_COL): txtRByName.Text = fcmbRByName.Text
''        fcmbRToName.BoundText = Mfgrd2.TextMatrix(srow, X2SRMRTOCODE_COL): txtRToName.Text = fcmbRToName.Text
''        dtpSrmWefDate.Text = Mfgrd2.TextMatrix(srow, X2SRMWEFDATE_COL)
''    End If
    txtDctName.SetFocus
    Call ValidDtl
    
End If

End Sub

Private Sub ReadControlValues()
Dim srow As Integer

srow = Mfgrd2.Row

''dtlAddEditMode = True
''dtlAddMode = IsFlexNewRow(Mfgrd2, srow)
''VisibleControls True, Mfgrd2.Top + Mfgrd2.RowPos(Mfgrd2.Row)
If dtlAddMode = True Then
    mskSrmSno.Text = ToMyNumFmt(FlexNextSeqno(Mfgrd2, X2SRMSNO_COL), mDecimals:=0)
Else
    mskSrmSno.Text = Mfgrd2.TextMatrix(srow, X2SRMSNO_COL)
    fcmbDctName.BoundText = Mfgrd2.TextMatrix(srow, X2SRMDCTCODE_COL): txtDctName.Text = fcmbDctName.Text
    txtSrmStartTime.Text = Mfgrd2.TextMatrix(srow, X2SRMSTARTTIMESTR_COL)
    txtSrmEndTime.Text = Mfgrd2.TextMatrix(srow, X2SRMENDTIMESTR_COL)
    mskSrmRate.Text = Mfgrd2.TextMatrix(srow, X2SRMRATE_COL)
    mskSrmDiscPer.Text = Mfgrd2.TextMatrix(srow, X2SRMDISCPER_COL)
    mskSrmInfByPer.Text = Mfgrd2.TextMatrix(srow, X2SRMINFBYPER_COL)
    mskSrmDefByPer.Text = Mfgrd2.TextMatrix(srow, X2SRMDEFBYPER_COL)
    mskSrmSharePer.Text = Mfgrd2.TextMatrix(srow, X2SRMSHAREPER_COL)
    mskSrmShareAmt.Text = Mfgrd2.TextMatrix(srow, X2SRMSHAREAMT_COL)
    fcmbPcgName.BoundText = Mfgrd2.TextMatrix(srow, X2SRMPCGCODE_COL): txtPcgName.Text = fcmbPcgName.Text
    fcmbRByName.BoundText = Mfgrd2.TextMatrix(srow, X2SRMRBYCODE_COL): txtRByName.Text = fcmbRByName.Text
    fcmbRToName.BoundText = Mfgrd2.TextMatrix(srow, X2SRMRTOCODE_COL): txtRToName.Text = fcmbRToName.Text
    dtpSrmWefDate.Text = Mfgrd2.TextMatrix(srow, X2SRMWEFDATE_COL)
End If

End Sub

Private Sub Mfgrd2_RowColChange()
ShowActiveFlexRow Mfgrd2
If Mfgrd2.Row <> mSrmRow_Old Then
    Call ReadControlValues
    mSrmRow_Old = Mfgrd2.Row
End If

End Sub

Private Sub VisibleControls(ByVal mShowItem As Boolean, Optional ByVal mRowPos)
Rem Important - dtlAddEditMode & dtlAddMode must be initialised prior to this
If Me.Visible = True Then
    txtVoid.SetFocus
End If
'If IsMissing(mRowPos) = False Then
'    mskSrmSno.Top = mRowPos
'    txtDctName.Top = mRowPos
'    txtPcgName.Top = mRowPos
'    txtRByName.Top = mRowPos
'    txtRToName.Top = mRowPos
'    txtSrmStartTime.Top = mRowPos
'    txtSrmEndTime.Top = mRowPos
'    mskSrmRate.Top = mRowPos
'    mskSrmInfByPer.Top = mRowPos
'    mskSrmDefByPer.Top = mRowPos
'    mskSrmSharePer.Top = mRowPos
'    mskSrmShareAmt.Top = mRowPos
'    cmdOK.Top = mRowPos
'End If

mskSrmSno.Text = 0
txtDctName.Text = "": fcmbDctName.BoundText = ""
txtPcgName.Text = "": fcmbPcgName.BoundText = ""
txtRByName.Text = "": fcmbRByName.BoundText = ""
txtRToName.Text = "": fcmbRToName.BoundText = ""
dtpSrmWefDate.Text = Dtoc(sFinYrStartDate)
txtSrmStartTime.Text = MinToTime(0)
txtSrmEndTime.Text = MinToTime(0)
mskSrmRate.Text = ToMyNumFmt(0)
mskSrmDiscPer.Text = ToMyPerFmt(0)
mskSrmInfByPer.Text = ToMyPerFmt(0)
mskSrmDefByPer.Text = ToMyPerFmt(0)
mskSrmSharePer.Text = ToMyPerFmt(0)
mskSrmShareAmt.Text = ToMyNumFmt(0)

Call ValidDtl

'mskSrmSno.Visible = mShowItem
'txtDctName.Visible = mShowItem
'txtPcgName.Visible = mShowItem
'txtRByName.Visible = mShowItem
'txtRToName.Visible = mShowItem
'txtSrmStartTime.Visible = mShowItem
'txtSrmEndTime.Visible = mShowItem
'mskSrmRate.Visible = mShowItem
'mskSrmDiscPer.Visible = mShowItem
'mskSrmInfByPer.Visible = mShowItem
'mskSrmDefByPer.Visible = mShowItem
'mskSrmSharePer.Visible = mShowItem
'mskSrmShareAmt.Visible = mShowItem
'cmdOK.Visible = mShowItem

frHeader.Enabled = (mShowItem = False)
Mfgrd2.Enabled = (mShowItem = False)
frGridControls.Enabled = (mShowItem = True)
cmdSaveForm.Enabled = (mShowItem = False)

End Sub

Private Sub ValidDtl()
Dim mDataOk As Boolean, srow As Integer

srow = Mfgrd2.Row
mDataOk = (Val(UnMyNumFmt(mskSrmSno.Text)) > 0 And (Val(fcmbDctName.BoundText) > 0 Or Val(fcmbPcgName.BoundText) > 0 Or Val(fcmbRByName.BoundText) > 0 Or Val(fcmbRToName.BoundText) > 0 Or TimeToMin(txtSrmEndTime.Text) > TimeToMin(txtSrmStartTime.Text)) And IsDate(Ctod(dtpSrmWefDate.Text)) = True And (UnMyNumFmt(mskSrmRate.Text) > 0 Or UnMyPerFmt(mskSrmDiscPer.Text) > 0 Or UnMyPerFmt(mskSrmInfByPer.Text) > 0 Or UnMyPerFmt(mskSrmDefByPer.Text) > 0 Or UnMyPerFmt(mskSrmSharePer.Text) > 0 Or UnMyNumFmt(mskSrmShareAmt.Text) > 0))
If dtlAddEditMode = True And mDataOk = True Then
    mDataOk = Not (UnMyNumFmt(mskSrmRate.Text) > 0 And UnMyPerFmt(mskSrmDiscPer.Text) > 0 And UnMyPerFmt(mskSrmInfByPer.Text) > 0 And UnMyPerFmt(mskSrmDefByPer.Text) > 0)
End If
If dtlAddEditMode = True And mDataOk = True Then
    mDataOk = Not (UnMyPerFmt(mskSrmSharePer.Text) > 0 And UnMyNumFmt(mskSrmShareAmt.Text) > 0)
End If
If dtlAddEditMode = True And mDataOk = True And InterActiveChange(cmdOK) = True Then
    mDataOk = (ChkDuplServRateExist(mChkFromMfgrd2:=False, srow:=srow) = False)
End If
cmdOK.Caption = IIf(mDataOk = True, "&OK", "&Cancel")
cmdOK.BackColor = IIf(mDataOk = True, &H80FF80, &H8080FF)

End Sub

Private Function ChkDuplServRateExist(ByVal mChkFromMfgrd2 As Boolean, Optional ByVal srow As Integer)
Dim tRecset As New ADODB.Recordset, mRtnval As Boolean, cnt As Integer, mLastRow As Integer
Dim mSrmDctCode_tgt As Long, mSrmPcgCode_tgt As Double, mSrmRByCode_tgt As Double, mSrmRToCode_tgt As Double, mSrmWefDate_tgt As Date, mSrmStartTime_tgt As Long, mSrmEndTime_tgt As Long, mSrmRate_tgt As Double, mSrmDiscPer_tgt As Double, mSrmInfByPer_tgt As Double, mSrmDefByPer_tgt As Double, mSrmSharePer_tgt As Double, mSrmShareAmt_tgt As Double
Dim mSrmDctCode_src As Long, mSrmPcgCode_src As Double, mSrmRByCode_src As Double, mSrmRToCode_src As Double, mSrmWefDate_src As Date, mSrmStartTime_src As Long, mSrmEndTime_src As Long, mSrmRate_src As Double, mSrmDiscPer_src As Double, mSrmInfByPer_src As Double, mSrmDefByPer_src As Double, mSrmSharePer_src As Double, mSrmShareAmt_src As Double

If mChkFromMfgrd2 = True Then
    mSrmDctCode_tgt = Val(Mfgrd2.TextMatrix(srow, X2SRMDCTCODE_COL))
    mSrmStartTime_tgt = Val(Mfgrd2.TextMatrix(srow, X2SRMSTARTTIME_COL))
    mSrmEndTime_tgt = Val(Mfgrd2.TextMatrix(srow, X2SRMENDTIME_COL))
    mSrmRate_tgt = UnMyNumFmt(Mfgrd2.TextMatrix(srow, X2SRMRATE_COL))
    mSrmDiscPer_tgt = UnMyPerFmt(Mfgrd2.TextMatrix(srow, X2SRMDISCPER_COL))
    mSrmInfByPer_tgt = UnMyPerFmt(Mfgrd2.TextMatrix(srow, X2SRMINFBYPER_COL))
    mSrmDefByPer_tgt = UnMyPerFmt(Mfgrd2.TextMatrix(srow, X2SRMDEFBYPER_COL))
    mSrmSharePer_tgt = UnMyPerFmt(Mfgrd2.TextMatrix(srow, X2SRMSHAREPER_COL))
    mSrmShareAmt_tgt = UnMyNumFmt(Mfgrd2.TextMatrix(srow, X2SRMSHAREAMT_COL))
    mSrmPcgCode_tgt = Val(Mfgrd2.TextMatrix(srow, X2SRMPCGCODE_COL))
    mSrmRByCode_tgt = Val(Mfgrd2.TextMatrix(srow, X2SRMRBYCODE_COL))
    mSrmRToCode_tgt = Val(Mfgrd2.TextMatrix(srow, X2SRMRTOCODE_COL))
    mSrmWefDate_tgt = Ctod(Mfgrd2.TextMatrix(srow, X2SRMWEFDATE_COL))
Else
    mSrmDctCode_tgt = Val(fcmbDctName.BoundText)
    mSrmStartTime_tgt = TimeToMin(txtSrmStartTime.Text)
    mSrmEndTime_tgt = TimeToMin(txtSrmEndTime.Text)
    mSrmRate_tgt = UnMyNumFmt(mskSrmRate.Text)
    mSrmDiscPer_tgt = UnMyPerFmt(mskSrmDiscPer.Text)
    mSrmInfByPer_tgt = UnMyPerFmt(mskSrmInfByPer.Text)
    mSrmDefByPer_tgt = UnMyPerFmt(mskSrmDefByPer.Text)
    mSrmSharePer_tgt = UnMyPerFmt(mskSrmSharePer.Text)
    mSrmShareAmt_tgt = UnMyNumFmt(mskSrmShareAmt.Text)
    mSrmPcgCode_tgt = Val(fcmbPcgName.BoundText)
    mSrmRByCode_tgt = Val(fcmbRByName.BoundText)
    mSrmRToCode_tgt = Val(fcmbRToName.BoundText)
    mSrmWefDate_tgt = Ctod(dtpSrmWefDate.Text)
End If

'tRecset.Open "Select * from ServRateMst where SrmCode=" & CStr(mSrvCode) & " and SrmDctCode=" & CStr(mSrmDctCode_tgt) & " and SrmPcgCode=" & CStr(mSrmPcgCode_tgt) & " and SrmRByCode=" & CStr(mSrmRByCode_tgt) & " and SrmRToCode=" & CStr(mSrmRToCode_tgt) & " and SrmWefDate=#" & ToSysDate(mSrmWefDate_tgt) & "# and SrmStartTime=" & CStr(mSrmStartTime_tgt) & " and SrmEndTime=" & CStr(mSrmEndTime_tgt) & IIf(mSrmRate_tgt <> 0, " and SrmRate<>0", "") & IIf(mSrmInfByPer_tgt <> 0, " and SrmInfByPer <> 0", "") & IIf(mSrmDefByPer_tgt <> 0, " and SrmDefByPer <> 0", "") & IIf(mSrmSharePer_tgt <> 0, " and SrmSharePer <> 0", "") & IIf(mSrmShareAmt_tgt <> 0, " and SrmShareAmt <> 0", "") & "", dbVgnDatabase, adOpenKeyset, adLockOptimistic
'mRtnval = (tRecset.RecordCount > 0)
'If mRtnval = True Then
'    ErrorBox "Duplicate Rate/Share Entry Exit !!!"
'End If
'CloseTable tRecset
mLastRow = Mfgrd2.Rows - 2
For cnt = 1 To mLastRow
    If cnt <> srow Then
        mSrmDctCode_src = Val(Mfgrd2.TextMatrix(cnt, X2SRMDCTCODE_COL))
        mSrmStartTime_src = Val(Mfgrd2.TextMatrix(cnt, X2SRMSTARTTIME_COL))
        mSrmEndTime_src = Val(Mfgrd2.TextMatrix(cnt, X2SRMENDTIME_COL))
        mSrmRate_src = UnMyNumFmt(Mfgrd2.TextMatrix(cnt, X2SRMRATE_COL))
        mSrmDiscPer_src = UnMyPerFmt(Mfgrd2.TextMatrix(cnt, X2SRMDISCPER_COL))
        mSrmInfByPer_src = UnMyPerFmt(Mfgrd2.TextMatrix(cnt, X2SRMINFBYPER_COL))
        mSrmDefByPer_src = UnMyPerFmt(Mfgrd2.TextMatrix(cnt, X2SRMDEFBYPER_COL))
        mSrmSharePer_src = UnMyPerFmt(Mfgrd2.TextMatrix(cnt, X2SRMSHAREPER_COL))
        mSrmShareAmt_src = UnMyNumFmt(Mfgrd2.TextMatrix(cnt, X2SRMSHAREAMT_COL))
        mSrmPcgCode_src = Val(Mfgrd2.TextMatrix(cnt, X2SRMPCGCODE_COL))
        mSrmRByCode_src = Val(Mfgrd2.TextMatrix(cnt, X2SRMRBYCODE_COL))
        mSrmRToCode_src = Val(Mfgrd2.TextMatrix(cnt, X2SRMRTOCODE_COL))
        mSrmWefDate_src = Ctod(Mfgrd2.TextMatrix(cnt, X2SRMWEFDATE_COL))
        
        If mSrmDctCode_src = mSrmDctCode_tgt And mSrmPcgCode_src = mSrmPcgCode_tgt And mSrmRByCode_src = mSrmRByCode_tgt And mSrmRToCode_src = mSrmRToCode_tgt And mSrmWefDate_src = mSrmWefDate_tgt And mSrmStartTime_src = mSrmStartTime_tgt And mSrmEndTime_src = mSrmEndTime_tgt And IIf(mSrmRate_tgt <> 0, mSrmRate_src <> 0, True) And IIf(mSrmInfByPer_tgt <> 0, mSrmInfByPer_src <> 0, True) And IIf(mSrmDefByPer_tgt <> 0, mSrmDefByPer_src <> 0, True) And IIf(mSrmSharePer_tgt <> 0, mSrmSharePer_src <> 0, True) And IIf(mSrmShareAmt_tgt <> 0, mSrmShareAmt_src <> 0, True) Then
            ErrorBox "Duplicate Rate/Share Entry Exit on Sno." & UnMyNumFmt(Mfgrd2.TextMatrix(cnt, X2SRMSNO_COL)) & " !!!"
            mRtnval = True
            Exit For
        End If
    End If
Next cnt

ChkDuplServRateExist = mRtnval

End Function

Private Sub txtDctName_Change()
If fcmbDctName.CallFromText_Change = False Then
    fcmbDctName.CallFromText_Change = True
    If InterActiveChange(txtDctName) = True Then
        fcmbDctName.UserText = Array(txtDctName.Text, txtDctName.SelStart)
        fcmbDctName.Show
        txtDctName.Text = fcmbDctName.Text
        If fcmbDctName.ListSelected = True Then
            SendKeys "{tab}"
        End If
    End If
    fcmbDctName.CallFromText_Change = False
End If

End Sub

Private Sub txtDctName_GotFocus()
FlashActiveControl txtDctName, True
End Sub

Private Sub txtDctName_LostFocus()
FlashActiveControl txtDctName, False
End Sub

Private Sub txtDctName_Validate(Cancel As Boolean)
'If txtDctName.Text = "" Or Val(fcmbDctName.BoundText) = 0 Then
'    ErrorBox "Invalid Doctor Name Selection !!!"
'    txtDctName.SetFocus
'    Cancel = True
'End If
Call ValidDtl

End Sub

Private Sub txtPcgName_Change()
If fcmbPcgName.CallFromText_Change = False Then
    fcmbPcgName.CallFromText_Change = True
    If InterActiveChange(txtPcgName) = True Then
        fcmbPcgName.UserText = Array(txtPcgName.Text, txtPcgName.SelStart)
        fcmbPcgName.Show
        txtPcgName.Text = fcmbPcgName.Text
        If fcmbPcgName.ListSelected = True Then
            SendKeys "{tab}"
        End If
    End If
    fcmbPcgName.CallFromText_Change = False
End If

End Sub

Private Sub txtPcgName_GotFocus()
FlashActiveControl txtPcgName, True
End Sub

Private Sub txtPcgName_LostFocus()
FlashActiveControl txtPcgName, False
End Sub

Private Sub txtPcgName_Validate(Cancel As Boolean)
'If txtPcgName.Text = "" Or Val(fcmbPcgName.BoundText) = 0 Then
'    ErrorBox "Invalid Patient Category Selection !!!"
'    txtPcgName.SetFocus
'    Cancel = True
'End If
Call ValidDtl

End Sub

Private Sub txtRByName_Change()
If fcmbRByName.CallFromText_Change = False Then
    fcmbRByName.CallFromText_Change = True
    If InterActiveChange(txtRByName) = True Then
        fcmbRByName.UserText = Array(txtRByName.Text, txtRByName.SelStart)
        fcmbRByName.Show
        txtRByName.Text = fcmbRByName.Text
        If fcmbRByName.ListSelected = True Then
            SendKeys "{tab}"
        End If
    End If
    fcmbRByName.CallFromText_Change = False
End If

End Sub

Private Sub txtRByName_GotFocus()
FlashActiveControl txtRByName, True
End Sub

Private Sub txtRByName_LostFocus()
FlashActiveControl txtRByName, False
End Sub

Private Sub txtRByName_Validate(Cancel As Boolean)
'If txtRByName.Text = "" Or Val(fcmbRByName.BoundText) = 0 Then
'    ErrorBox "Invalid Referred By Selection !!!"
'    txtRByName.SetFocus
'    Cancel = True
'End If
Call ValidDtl

End Sub

Private Sub txtRToName_Change()
If fcmbRToName.CallFromText_Change = False Then
    fcmbRToName.CallFromText_Change = True
    If InterActiveChange(txtRToName) = True Then
        fcmbRToName.UserText = Array(txtRToName.Text, txtRToName.SelStart)
        fcmbRToName.Show
        txtRToName.Text = fcmbRToName.Text
        If fcmbRToName.ListSelected = True Then
            SendKeys "{tab}"
        End If
    End If
    fcmbRToName.CallFromText_Change = False
End If

End Sub

Private Sub txtRToName_GotFocus()
FlashActiveControl txtRToName, True
End Sub

Private Sub txtRToName_LostFocus()
FlashActiveControl txtRToName, False
End Sub

Private Sub txtRToName_Validate(Cancel As Boolean)
'If txtRToName.Text = "" Or Val(fcmbRToName.BoundText) = 0 Then
'    ErrorBox "Invalid Referred To Selection !!!"
'    txtRToName.SetFocus
'    Cancel = True
'End If
Call ValidDtl

End Sub

