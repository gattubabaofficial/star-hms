VERSION 5.00
Object = "{5E9E78A0-531B-11CF-91F6-C2863C385E30}#1.0#0"; "MSFLXGRD.OCX"
Begin VB.Form frmCompanyMaster 
   Appearance      =   0  'Flat
   BackColor       =   &H80000005&
   ClientHeight    =   9090
   ClientLeft      =   60
   ClientTop       =   60
   ClientWidth     =   14160
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
   MDIChild        =   -1  'True
   ScaleHeight     =   9090
   ScaleWidth      =   14160
   ShowInTaskbar   =   0   'False
   WindowState     =   2  'Maximized
   Begin VB.Frame frFormDtl 
      Appearance      =   0  'Flat
      BackColor       =   &H00C0FFC0&
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
      Height          =   7215
      Left            =   240
      TabIndex        =   27
      Top             =   1080
      Width           =   13455
      Begin VB.DirListBox dirList 
         Appearance      =   0  'Flat
         Height          =   2565
         Left            =   7920
         TabIndex        =   38
         Top             =   4440
         Width           =   2175
      End
      Begin VB.Frame frHeader 
         Appearance      =   0  'Flat
         BackColor       =   &H00C0FFC0&
         BorderStyle     =   0  'None
         Caption         =   "frHeader"
         ForeColor       =   &H80000008&
         Height          =   4095
         Left            =   240
         TabIndex        =   39
         Top             =   240
         Width           =   12735
         Begin VB.TextBox txtFormBoundField 
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
            Left            =   1800
            MaxLength       =   8
            TabIndex        =   0
            Tag             =   "AhCode"
            Top             =   360
            Width           =   1335
         End
         Begin VB.TextBox txtCmpName 
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
            Left            =   1800
            MaxLength       =   60
            TabIndex        =   1
            Top             =   720
            Width           =   4935
         End
         Begin VB.TextBox txtCmpAddress 
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
            Height          =   690
            Left            =   1800
            MaxLength       =   100
            MultiLine       =   -1  'True
            TabIndex        =   2
            Top             =   1080
            Width           =   4935
         End
         Begin VB.TextBox txtCmpCity 
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
            Left            =   1800
            MaxLength       =   50
            TabIndex        =   3
            Top             =   1800
            Width           =   4935
         End
         Begin VB.TextBox txtCmpDistrict 
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
            Left            =   1800
            MaxLength       =   50
            TabIndex        =   4
            Top             =   2160
            Width           =   4935
         End
         Begin VB.TextBox txtCmpState 
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
            Left            =   1800
            MaxLength       =   50
            TabIndex        =   5
            Top             =   2520
            Width           =   4935
         End
         Begin VB.TextBox txtCmpContPer 
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
            Left            =   1800
            MaxLength       =   50
            TabIndex        =   6
            Top             =   2880
            Width           =   4935
         End
         Begin VB.TextBox txtCmpOPhone 
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
            Left            =   1800
            MaxLength       =   50
            TabIndex        =   7
            Top             =   3240
            Width           =   4935
         End
         Begin VB.TextBox txtCmpRPhone 
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
            Left            =   1800
            MaxLength       =   50
            TabIndex        =   8
            Top             =   3600
            Width           =   4935
         End
         Begin VB.TextBox txtCmpFax 
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
            Left            =   8400
            MaxLength       =   50
            TabIndex        =   9
            Top             =   720
            Width           =   4215
         End
         Begin VB.TextBox txtCmpEmail 
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
            Left            =   8400
            MaxLength       =   50
            TabIndex        =   10
            Top             =   1080
            Width           =   4215
         End
         Begin VB.TextBox txtCmpWebsite 
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
            Left            =   8400
            MaxLength       =   50
            TabIndex        =   11
            Top             =   1440
            Width           =   4215
         End
         Begin VB.TextBox txtCmpReg1 
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
            Left            =   8400
            MaxLength       =   50
            TabIndex        =   12
            Top             =   1800
            Width           =   4215
         End
         Begin VB.TextBox txtCmpReg2 
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
            Left            =   8400
            MaxLength       =   50
            TabIndex        =   13
            Top             =   2160
            Width           =   4215
         End
         Begin VB.TextBox txtCmpReg3 
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
            Left            =   8400
            MaxLength       =   50
            TabIndex        =   14
            Top             =   2520
            Width           =   4215
         End
         Begin VB.TextBox txtCmpJurisdiction 
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
            Left            =   8400
            MaxLength       =   50
            TabIndex        =   15
            Top             =   2880
            Width           =   4215
         End
         Begin VB.TextBox dtpCmpBooksDate 
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
            Left            =   9600
            MaxLength       =   20
            TabIndex        =   16
            Text            =   "dd/mm/yyyy"
            Top             =   3240
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
            Height          =   285
            Index           =   0
            Left            =   240
            TabIndex        =   56
            Top             =   360
            Width           =   1575
         End
         Begin VB.Label Label2 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Company Name:"
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
            Index           =   0
            Left            =   240
            TabIndex        =   55
            Top             =   720
            Width           =   1575
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
            Height          =   285
            Index           =   1
            Left            =   240
            TabIndex        =   54
            Top             =   1080
            Width           =   1575
         End
         Begin VB.Label Label2 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "City:"
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
            Index           =   3
            Left            =   240
            TabIndex        =   53
            Top             =   1800
            Width           =   1575
         End
         Begin VB.Label Label2 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "District:"
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
            Index           =   4
            Left            =   240
            TabIndex        =   52
            Top             =   2160
            Width           =   1575
         End
         Begin VB.Label Label2 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "State:"
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
            Left            =   240
            TabIndex        =   51
            Top             =   2520
            Width           =   1575
         End
         Begin VB.Label Label2 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Contact Person:"
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
            Left            =   240
            TabIndex        =   50
            Top             =   2880
            Width           =   1575
         End
         Begin VB.Label Label2 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Phone No.(O):"
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
            Left            =   240
            TabIndex        =   49
            Top             =   3240
            Width           =   1575
         End
         Begin VB.Label Label2 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Phone No.(R):"
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
            Index           =   8
            Left            =   240
            TabIndex        =   48
            Top             =   3600
            Width           =   1575
         End
         Begin VB.Label Label2 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Fax No.:"
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
            Index           =   9
            Left            =   6840
            TabIndex        =   47
            Top             =   720
            Width           =   1575
         End
         Begin VB.Label Label2 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Email:"
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
            Index           =   10
            Left            =   6840
            TabIndex        =   46
            Top             =   1080
            Width           =   1575
         End
         Begin VB.Label Label2 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Website:"
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
            Index           =   11
            Left            =   6840
            TabIndex        =   45
            Top             =   1440
            Width           =   1575
         End
         Begin VB.Label Label2 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Reg1.(TIN No.)"
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
            Index           =   12
            Left            =   6840
            TabIndex        =   44
            Top             =   1800
            Width           =   1575
         End
         Begin VB.Label Label2 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Reg2.(PAN No.)"
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
            Left            =   6840
            TabIndex        =   43
            Top             =   2160
            Width           =   1575
         End
         Begin VB.Label Label2 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Reg3.No.:"
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
            Index           =   14
            Left            =   6840
            TabIndex        =   42
            Top             =   2520
            Width           =   1575
         End
         Begin VB.Label Label2 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Books Beginning From Date:"
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
            Left            =   6840
            TabIndex        =   41
            Top             =   3240
            Width           =   2775
         End
         Begin VB.Label Label2 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Jurisdiction:"
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
            Left            =   6840
            TabIndex        =   40
            Top             =   2880
            Width           =   1575
         End
      End
      Begin VB.CommandButton cmdOK 
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
         Height          =   285
         Left            =   5760
         Style           =   1  'Graphical
         TabIndex        =   22
         Top             =   5040
         Width           =   855
      End
      Begin VB.TextBox txtCmpSecPwd 
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
         IMEMode         =   3  'DISABLE
         Left            =   4440
         MaxLength       =   20
         PasswordChar    =   "*"
         TabIndex        =   21
         Top             =   5040
         Width           =   1335
      End
      Begin VB.TextBox dtpCmpFYEndDt 
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
         Left            =   2880
         MaxLength       =   20
         TabIndex        =   20
         Text            =   "dd/mm/yyyy"
         Top             =   5040
         Width           =   1575
      End
      Begin VB.TextBox dtpCmpFYStartDt 
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
         Left            =   1320
         MaxLength       =   20
         TabIndex        =   19
         Text            =   "dd/mm/yyyy"
         Top             =   5040
         Width           =   1575
      End
      Begin VB.TextBox mskCmpCode 
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
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   285
         Left            =   480
         MaxLength       =   20
         TabIndex        =   18
         Text            =   "0"
         Top             =   5040
         Width           =   855
      End
      Begin MSFlexGridLib.MSFlexGrid Mfgrd2 
         Height          =   2295
         Left            =   480
         TabIndex        =   17
         Top             =   4440
         Width           =   6375
         _ExtentX        =   11245
         _ExtentY        =   4048
         _Version        =   393216
         RowHeightMin    =   285
         BackColor       =   12648384
         BackColorBkg    =   12648384
         FocusRect       =   2
         HighLight       =   2
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
         Height          =   255
         Left            =   11040
         Style           =   1  'Graphical
         TabIndex        =   23
         Top             =   5520
         Width           =   375
      End
   End
   Begin VB.TextBox txtVoid 
      CausesValidation=   0   'False
      Height          =   375
      Left            =   120
      TabIndex        =   24
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
      TabIndex        =   30
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
      TabIndex        =   29
      TabStop         =   0   'False
      Top             =   0
      Width           =   255
   End
   Begin VB.ComboBox cmbFormEntryMode 
      Appearance      =   0  'Flat
      Enabled         =   0   'False
      Height          =   315
      ItemData        =   "CompMast.frx":0000
      Left            =   0
      List            =   "CompMast.frx":000D
      Style           =   1  'Simple Combo
      TabIndex        =   28
      TabStop         =   0   'False
      Text            =   "cmbFormMode"
      Top             =   360
      Width           =   1455
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
      Height          =   6735
      Left            =   240
      TabIndex        =   26
      Top             =   840
      Width           =   13455
      Begin VB.Frame frUserLogin 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         ForeColor       =   &H80000008&
         Height          =   3255
         Left            =   3000
         TabIndex        =   57
         Top             =   1080
         Width           =   6375
         Begin VB.CommandButton cmdUserLogin 
            BackColor       =   &H00FFFFFF&
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
            Height          =   375
            Left            =   2640
            Style           =   1  'Graphical
            TabIndex        =   37
            Top             =   2640
            Width           =   855
         End
         Begin VB.TextBox txtFinYrPwd 
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
            IMEMode         =   3  'DISABLE
            Left            =   1800
            MaxLength       =   50
            PasswordChar    =   "*"
            TabIndex        =   36
            Tag             =   "AhCode"
            Top             =   2160
            Width           =   3135
         End
         Begin VB.TextBox txtUrlPwd 
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
            IMEMode         =   3  'DISABLE
            Left            =   1800
            MaxLength       =   50
            PasswordChar    =   "*"
            TabIndex        =   35
            Tag             =   "AhCode"
            Top             =   1800
            Width           =   3135
         End
         Begin VB.TextBox txtUsrPwd 
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
            IMEMode         =   3  'DISABLE
            Left            =   1800
            MaxLength       =   50
            PasswordChar    =   "*"
            TabIndex        =   34
            Tag             =   "AhCode"
            Top             =   1440
            Width           =   3135
         End
         Begin VB.TextBox txtUsrName 
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
            Left            =   1800
            MaxLength       =   50
            TabIndex        =   33
            Tag             =   "AhCode"
            Top             =   600
            Width           =   4095
         End
         Begin VB.Label Label1 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Fin.Year Pswd:"
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
            Left            =   240
            TabIndex        =   63
            Top             =   2160
            Width           =   1575
         End
         Begin VB.Label Label1 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "User Role Pswd:"
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
            Index           =   4
            Left            =   240
            TabIndex        =   62
            Top             =   1800
            Width           =   1575
         End
         Begin VB.Label Label1 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "User Password:"
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
            Index           =   3
            Left            =   240
            TabIndex        =   61
            Top             =   1440
            Width           =   1575
         End
         Begin VB.Label lblUrlName 
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
            Left            =   1800
            TabIndex        =   60
            Top             =   960
            Width           =   4095
         End
         Begin VB.Label Label1 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "User Name:"
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
            Index           =   1
            Left            =   240
            TabIndex        =   59
            Top             =   600
            Width           =   1575
         End
         Begin VB.Label Label3 
            Alignment       =   2  'Center
            Appearance      =   0  'Flat
            BackColor       =   &H00E0E0E0&
            BorderStyle     =   1  'Fixed Single
            Caption         =   "User Login"
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
            TabIndex        =   58
            Top             =   0
            Width           =   6375
         End
      End
      Begin MSFlexGridLib.MSFlexGrid Mfgrd1 
         Height          =   6015
         Left            =   120
         TabIndex        =   31
         Top             =   360
         Width           =   13110
         _ExtentX        =   23125
         _ExtentY        =   10610
         _Version        =   393216
         RowHeightMin    =   315
         BackColor       =   16777152
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
      Begin MSFlexGridLib.MSFlexGrid Mfgrd3 
         Height          =   6015
         Left            =   360
         TabIndex        =   32
         Top             =   600
         Width           =   12255
         _ExtentX        =   21616
         _ExtentY        =   10610
         _Version        =   393216
         RowHeightMin    =   315
         BackColor       =   12640511
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
   End
   Begin VB.Label lblFormHeading 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00E0E0E0&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Company Master"
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
      TabIndex        =   25
      Top             =   0
      Width           =   9015
   End
End
Attribute VB_Name = "frmCompanyMaster"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Option Explicit

Dim MyProgStatForm As frmProgressStatus
Dim mFormLoaded As Boolean, mLastKeyPressed As Integer
Dim mDirName As String, dtlAddEditMode As Boolean, dtlAddMode As Boolean, dtlEditCanceled As Boolean
Dim mRemoteAccess As Boolean, mEntrySaved As Boolean, mEntryAborted As Boolean
Dim datRecset As New ADODB.Recordset
Dim mCmpName_old As String
Dim mActiveControl As Object, clsListStru As clsSelectQueryStructure
Dim aryCompany_Log As Variant

Rem company list column definition
Const X1CMPNAME_COL = 0
Const X1BOOKSTARTDT_COL = 1
Const X1BOOKENDDT_COL = 2
Const X1DIRNAME_COL = 3
Const X1MFGRD1_COLS = 4

Rem financial year list column definition
Const X3CMPCODE_COL = 0
Const X3CMPNAME_COL = 1
Const X3CMPFYSTARTDT_COL = 2
Const X3CMPFYENDDT_COL = 3
Const X3DIRNAME_COL = 4
Const X3BOOKSTARTDT_COL = 5
Const X3BOOKENDDT_COL = 6
Const X3MFGRD3_COLS = 7

Rem DETAIL FLEX COL DEFINITIONS
Const X2CMPCODE_COL = 0
Const X2CMPFYSTARTDT_COL = 1
Const X2CMPFYENDDT_COL = 2
Const X2CMPSECPWDSTR_COL = 3
Const X2CMPSECPWD_COL = 4
Const X2CMPRECSTATE_COL = 5
Const X2MFGRD2_COLS = 6

Public Property Let RemoteAccessCode(ByVal mAccessCode As String)
mRemoteAccess = True
mDirName = mAccessCode
End Property

Public Property Get EntryBoundCode() As String
EntryBoundCode = Trim(txtFormBoundField.Text)
End Property

Public Property Get EntrySaved() As Boolean
EntrySaved = mEntrySaved
End Property

Public Property Get EntryAborted() As Boolean
EntryAborted = mEntryAborted
End Property

Public Property Get CmpName() As String
CmpName = txtCmpName.Text
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

Private Sub cmdFormEnter_Click()
Dim dbCmpDatabase As New ADODB.Connection, tRecset As New ADODB.Recordset, mCanLogin As Boolean, mUserAuthReqd As Boolean

mLastKeyPressed = 13
If TypeOf Screen.ActiveControl Is MSFlexGrid Then
    If Screen.ActiveControl.Name = Mfgrd2.Name Then
        Call Mfgrd2_KeyPress(13)
    ElseIf Screen.ActiveControl.Name = Mfgrd1.Name Then
        If IsFlexNewRow(Mfgrd1, Mfgrd1.Row) = True Then
            Call Data_AddEvent
        Else    ' company selection
            mCanLogin = False
            sCmpDataPath = AddBS(sAppDataPath) & Mfgrd1.TextMatrix(Mfgrd1.Row, X1DIRNAME_COL)
            
            OpenCmpDataSource dbCmpDatabase
            With tRecset
            .open "Select * from Company order by CmpFYStartDt", dbCmpDatabase, adOpenKeyset, adLockOptimistic
            If .RecordCount > 0 Then
                If .RecordCount > 1 Then    ' more than one financial year
                    Mfgrd1.Visible = False
                    Call SmryList2
                    ShowActiveFlexRow Mfgrd3
                    Mfgrd3.SetFocus
                Else    ' only one financial year
                    sCmpBookStartDate = Ctod(Mfgrd1.TextMatrix(Mfgrd1.Row, X1BOOKSTARTDT_COL))
                    sCmpBookEndDate = Ctod(Mfgrd1.TextMatrix(Mfgrd1.Row, X1BOOKENDDT_COL))
                    sFinYrStartDate = sCmpBookStartDate
                    sFinYrEndDate = sCmpBookEndDate
                    sFinYrCmpCode = .fields("CmpCode")
                    GetCompanyInfo sFinYrCmpCode
                    mCanLogin = True
                End If
            Else
                ErrorBox "Financial Year not Defined !!!"
                Call Data_EditEvent
            End If
            
            End With
            CloseTable tRecset
            CloseDataSource dbCmpDatabase
            
            If mCanLogin = True Then
                Call ChkUserAuthReqd
                If MyCompany.mUserAuthReqd = False Then
                    Call StartMyMenu
                Else
                    txtVoid.SetFocus
                    txtUsrName.Text = ""
                    lblUrlName.Caption = ""
                    txtUsrPwd.Text = ""
                    txtUrlPwd.Text = ""
                    txtFinYrPwd.Text = ""
                    
                    frUserLogin.Visible = True
                    Mfgrd1.Enabled = False
                    txtUsrName.SetFocus
                End If
            End If
            
        End If
    ElseIf Screen.ActiveControl.Name = Mfgrd3.Name Then
        If IsFlexNewRow(Mfgrd3, Mfgrd3.Row) = True Then
            Rem do nothing
        Else    ' financial year selection
            sCmpDataPath = AddBS(sAppDataPath) & Mfgrd3.TextMatrix(Mfgrd3.Row, X3DIRNAME_COL)
            
            sCmpBookStartDate = Ctod(Mfgrd3.TextMatrix(Mfgrd3.Row, X3BOOKSTARTDT_COL))
            sCmpBookEndDate = Ctod(Mfgrd3.TextMatrix(Mfgrd3.Row, X3BOOKENDDT_COL))
            sFinYrStartDate = Ctod(Mfgrd3.TextMatrix(Mfgrd3.Row, X3CMPFYSTARTDT_COL))
            sFinYrEndDate = Ctod(Mfgrd3.TextMatrix(Mfgrd3.Row, X3CMPFYENDDT_COL))
            sFinYrCmpCode = Val(Mfgrd3.TextMatrix(Mfgrd3.Row, X3CMPCODE_COL))
            GetCompanyInfo sFinYrCmpCode
            
            Call ChkUserAuthReqd
            If MyCompany.mUserAuthReqd = False Then
                Call StartMyMenu
            Else
                txtVoid.SetFocus
                txtUsrName.Text = ""
                lblUrlName.Caption = ""
                txtUsrPwd.Text = ""
                txtUrlPwd.Text = ""
                txtFinYrPwd.Text = ""
                
                frUserLogin.Visible = True
                Mfgrd3.Enabled = False
                txtUsrName.SetFocus
            End If
            
        End If
    End If
Else
    SendKeys "{tab}"
End If

EndSub:
CloseTable tRecset, mCheckOpen:=True
CloseDataSource dbCmpDatabase, mCheckOpen:=True
Exit Sub

End Sub

Private Sub cmdFormEscape_Click()
Dim mRecAbsPos As Long
mLastKeyPressed = 27
If FormAddEditMode = cFORM_SMRYMODE Then
    If frUserLogin.Visible = True Then
        txtVoid.SetFocus
        frUserLogin.Visible = False
        If Mfgrd1.Visible = True Then
            Mfgrd1.Enabled = True
            Mfgrd1.SetFocus
        ElseIf Mfgrd3.Visible = True Then
            Mfgrd3.Enabled = True
            Mfgrd3.SetFocus
        End If
        
    ElseIf Screen.ActiveControl.Name = Mfgrd3.Name Then
        Call SmryList1
        SearchFlex Mfgrd1, X1DIRNAME_COL, JustFName(sCmpDataPath)
        ShowActiveFlexRow Mfgrd1
        Mfgrd1.SetFocus
        
    ElseIf ExitThisApp() = True Then
        Unload Me
        frmMain.EndThisApp
        
    End If
ElseIf dtlAddEditMode = True Then
    dtlEditCanceled = True
    Call cmdOK_Click
Else
    txtVoid.SetFocus
    If CanReject() = True Then
        mEntryAborted = True
        
        Call SmryList1
        ShowActiveFlexRow Mfgrd1
        
        Call ShowEntryMode(False)
        If mRemoteAccess = True Then
            Me.Hide
            ''Unload Me
            Exit Sub
        Else
            Mfgrd1.SetFocus
        End If
    Else
        txtCmpName.SetFocus
    End If
End If

End Sub

Private Sub cmdOK_Click()
Dim srow As Integer, mCmpCode As Long, tRecset As New ADODB.Recordset

srow = Mfgrd2.Row
mCmpCode = Val(Mfgrd2.TextMatrix(srow, X2CMPCODE_COL))

If cmdOK.Caption = "&OK" And dtlEditCanceled = False Then
    Mfgrd2.TextMatrix(srow, X2CMPCODE_COL) = CStr(mCmpCode)
    Mfgrd2.TextMatrix(srow, X2CMPFYSTARTDT_COL) = dtpCmpFYStartDt.Text
    Mfgrd2.TextMatrix(srow, X2CMPFYENDDT_COL) = dtpCmpFYEndDt.Text
    Mfgrd2.TextMatrix(srow, X2CMPSECPWDSTR_COL) = String(Len(txtCmpSecPwd.Text), txtCmpSecPwd.PasswordChar)
    Mfgrd2.TextMatrix(srow, X2CMPSECPWD_COL) = txtCmpSecPwd.Text
    Mfgrd2.TextMatrix(srow, X2CMPRECSTATE_COL) = ChkEditRecStatus(Val(Mfgrd2.TextMatrix(srow, X2CMPRECSTATE_COL)))
    
    If dtlAddMode = True Then
        Mfgrd2.Rows = Mfgrd2.Rows + 1
    End If
    srow = srow + 1
    Mfgrd2.Row = srow
End If
dtlAddEditMode = False
dtlAddMode = False
dtlEditCanceled = False
Call VisibleControls(False)
Mfgrd2.SetFocus

End Sub

Private Sub cmdSaveForm_Click()
Dim srow As Integer

Call Data_SaveEvent
Call SmryList1

SearchFlex Mfgrd1, X1DIRNAME_COL, txtFormBoundField.Text
ShowActiveFlexRow Mfgrd1

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
        txtCmpName.SetFocus
    End If
End If
cmdSaveForm.Enabled = True

End Sub

Private Sub cmdUserLogin_Click()
Dim cnn As New ADODB.Connection, tRecset As New ADODB.Recordset, mCheckInOk As Boolean, mUsrCode As Long, mUrlCode As Long, mUsrName As String, mUrlName As String

txtUsrName.Text = ToMyString(txtUsrName.Text)
txtUsrPwd.Text = ToMyString(txtUsrPwd.Text)
txtUrlPwd.Text = ToMyString(txtUrlPwd.Text)
txtFinYrPwd.Text = ToMyString(txtFinYrPwd.Text)

mCheckInOk = True
OpenCmpDataSource cnn
With tRecset
If mCheckInOk = True Then
    .open "Select * from UserMast" _
        & " where UsrName = '" & CStr(txtUsrName.Text) & "'" _
        , cnn, adOpenKeyset, adLockOptimistic
    If .EOF = False Then
        .Close
    Else
        .Close
        ErrorBox "Invalid User Name !!!"
        txtUsrName.SetFocus
        mCheckInOk = False
    End If
End If
If mCheckInOk = True Then
    .open "Select * from UserMast" _
        & " where UsrName = '" & CStr(txtUsrName.Text) & "'" _
        & " and UsrPwd = '" & CStr(txtUsrPwd.Text) & "'" _
        , cnn, adOpenKeyset, adLockOptimistic
    If .EOF = False Then
        .Close
    Else
        .Close
        ErrorBox "Invalid User Password !!!"
        txtUsrPwd.SetFocus
        mCheckInOk = False
    End If
End If
If mCheckInOk = True Then
    .open "Select * from UserMast" _
        & " inner join UserRoleMst on UserMast.UsrUrlCode = UserRoleMst.UrlCode" _
        & " where UsrName = '" & CStr(txtUsrName.Text) & "'" _
        & " and UsrPwd = '" & CStr(txtUsrPwd.Text) & "'" _
        , cnn, adOpenKeyset, adLockOptimistic
    If .EOF = False Then
        .Close
    Else
        .Close
        ErrorBox "Invalid User Role !!!"
        txtUsrName.SetFocus
        mCheckInOk = False
    End If
End If
If mCheckInOk = True Then
    .open "Select * from UserMast" _
        & " inner join UserRoleMst on UserMast.UsrUrlCode = UserRoleMst.UrlCode" _
        & " where UsrName = '" & CStr(txtUsrName.Text) & "'" _
        & " and UsrPwd = '" & CStr(txtUsrPwd.Text) & "'" _
        & " and UrlPwd = '" & CStr(txtUrlPwd.Text) & "'" _
        , cnn, adOpenKeyset, adLockOptimistic
    If .EOF = False Then
        mUsrCode = .fields("UsrCode")
        mUsrName = .fields("UsrName")
        mUrlCode = .fields("UrlCode")
        mUrlName = .fields("UrlName")
        .Close
    Else
        .Close
        ErrorBox "Invalid User Role Password !!!"
        txtUrlPwd.SetFocus
        mCheckInOk = False
    End If
End If
If mCheckInOk = True Then
    .open "Select * from Company" _
        & " where CmpCode = " & CStr(MyCompany.mCmpCode) & "" _
        & " and CmpSecPwd = '" & CStr(txtFinYrPwd.Text) & "'" _
        , cnn, adOpenKeyset, adLockOptimistic
    If .EOF = False Then
        .Close
    Else
        .Close
        ErrorBox "Invalid Fin.Year Password !!!"
        txtFinYrPwd.SetFocus
        mCheckInOk = False
    End If
End If
End With
CloseTable tRecset, mCheckOpen:=True

If mCheckInOk = True Then
    MyCompany.mUserCode = mUsrCode
    MyCompany.mUserName = mUsrName
    MyCompany.mUserRoleCode = mUrlCode
    MyCompany.mUserRoleName = mUrlName
    MyCompany.mLoginDate = Date
    MyCompany.mLoginTime = TimeToMin(Time)
    MyCompany.mLogoutDate = Date
    MyCompany.mLogoutTime = TimeToMin(Time)
    
    Call StartMyMenu
Else
    MyCompany.mUserCode = 0
    MyCompany.mUserName = ""
    MyCompany.mUserRoleCode = 0
    MyCompany.mUserRoleName = ""
    MyCompany.mLoginDate = cUNKNOWNDATE
    MyCompany.mLoginTime = 0
    MyCompany.mLogoutDate = cUNKNOWNDATE
    MyCompany.mLogoutTime = 0
    
    Rem txtUsrName.SetFocus
    
End If

End Sub

Private Sub cmdUserLogin_GotFocus()
FlashActiveControl cmdUserLogin, True
End Sub

Private Sub cmdUserLogin_LostFocus()
FlashActiveControl cmdUserLogin, False
End Sub

Private Sub dtpCmpBooksDate_GotFocus()
FlashActiveControl dtpCmpBooksDate, True
End Sub

Private Sub dtpCmpBooksDate_LostFocus()
FlashActiveControl dtpCmpBooksDate, False
End Sub

Private Sub dtpCmpBooksDate_Validate(Cancel As Boolean)
dtpCmpBooksDate.Text = ToMyDate(dtpCmpBooksDate.Text)

End Sub

Private Sub dtpCmpFYEndDt_GotFocus()
FlashActiveControl dtpCmpFYEndDt, True

End Sub

Private Sub dtpCmpFYEndDt_LostFocus()
FlashActiveControl dtpCmpFYEndDt, False
End Sub

Private Sub dtpCmpFYEndDt_Validate(Cancel As Boolean)
dtpCmpFYEndDt.Text = ToMyDate(dtpCmpFYEndDt.Text)
End Sub

Private Sub dtpCmpFYStartDt_GotFocus()
FlashActiveControl dtpCmpFYStartDt, True
End Sub

Private Sub dtpCmpFYStartDt_LostFocus()
FlashActiveControl dtpCmpFYStartDt, False
End Sub

Private Sub dtpCmpFYStartDt_Validate(Cancel As Boolean)
dtpCmpFYStartDt.Text = ToMyDate(dtpCmpFYStartDt.Text)

End Sub

Private Sub Mfgrd1_DblClick()
Call cmdFormEnter_Click
End Sub

Private Sub Mfgrd1_GotFocus()
Mfgrd1.Col = FlexLeftVisibleCol(Mfgrd1)
If Mfgrd1.SelectionMode = flexSelectionByRow Then
    Mfgrd1.ColSel = 0: Mfgrd1.ColSel = Mfgrd1.Cols - 1
End If
Call Mfgrd1_RowColChange
End Sub

Private Sub Mfgrd1_KeyDown(KeyCode As Integer, Shift As Integer)
If MyAddNewKey(Shift, KeyCode) = True Then
    Call Data_AddEvent
ElseIf MyDeleteKey(Shift, KeyCode) = True Then
    Call Data_DeleteEvent
ElseIf Shift = vbCtrlMask And KeyCode = vbKeySpace Then
    If IsFlexNewRow(Mfgrd1, Mfgrd1.Row) = True Then
        Call Data_AddEvent
    Else
        Call Data_EditEvent
    End If
End If

End Sub

Private Sub Mfgrd1_RowColChange()
''If datRecset.RecordCount > 0 Then
''    If datRecset.AbsolutePosition <> Mfgrd1.Row - Mfgrd1.FixedRows + 1 Then
''        datRecset.MoveFirst
''        datRecset.Move Mfgrd1.Row - Mfgrd1.FixedRows, 1     ' Mfgrd1.Row is already less by one
''    End If
''End If

End Sub

Private Sub Form_Activate()
If mFormLoaded = False Then
    If mRemoteAccess = True Then
        If mDirName = "" Then
            Call Data_AddEvent
        Else
            Call Data_EditEvent
        End If
    Else
        Rem Mfgrd1.Row = Mfgrd1.FixedRows
        If Mfgrd1.Visible = True Then
            Mfgrd1.SetFocus
        ElseIf Mfgrd3.Visible = True Then
            Mfgrd3.SetFocus
        End If
    End If
Else
    
End If

mFormLoaded = True
End Sub

Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)
mLastKeyPressed = KeyCode
Select Case KeyCode
Case vbKeyReturn
Case vbKeyEscape
Case vbKeyPageDown
    If InList(FormAddEditMode, Array(cFORM_ADDMODE, cFORM_EDITMODE)) = True And dtlAddEditMode = False Then
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
dirList.Visible = False
dirList.Path = sAppDataPath
dirList.Refresh
mskCmpCode.Enabled = False
dtpCmpFYStartDt.Enabled = False
dtpCmpFYEndDt.Enabled = False
Mfgrd3.Visible = False: Mfgrd3.Left = Mfgrd1.Left: Mfgrd3.Top = Mfgrd1.Top: Mfgrd3.Height = Mfgrd1.Height
frUserLogin.Visible = False

Call Form_Resize

Call SetVoidControl(txtVoid)

Set clsListStru = New clsSelectQueryStructure

Mfgrd1.Rows = 2: Mfgrd1.FixedRows = 1: Mfgrd1.FixedCols = 0: Mfgrd1.Cols = X1MFGRD1_COLS
Mfgrd1.Height = Int(Mfgrd1.Height / Mfgrd1.RowHeightMin) * Mfgrd1.RowHeightMin + 5

Mfgrd3.Rows = 2: Mfgrd3.FixedRows = 1: Mfgrd3.FixedCols = 0: Mfgrd3.Cols = X3MFGRD3_COLS
Mfgrd3.Height = Int(Mfgrd3.Height / Mfgrd3.RowHeightMin) * Mfgrd3.RowHeightMin + 5

Mfgrd2.Rows = 2: Mfgrd2.FixedRows = 1: Mfgrd2.FixedCols = 0: Mfgrd2.Cols = X2MFGRD2_COLS: SetGridAutoHeight Mfgrd2

colcnt = X2CMPCODE_COL: Mfgrd2.ColWidth(colcnt) = mskCmpCode.Width: Mfgrd2.TextMatrix(0, colcnt) = "Code": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2CMPFYSTARTDT_COL: Mfgrd2.ColWidth(colcnt) = dtpCmpFYStartDt.Width: Mfgrd2.TextMatrix(0, colcnt) = "Start Date": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2CMPFYENDDT_COL: Mfgrd2.ColWidth(colcnt) = dtpCmpFYEndDt.Width: Mfgrd2.TextMatrix(0, colcnt) = "End Date": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2CMPSECPWDSTR_COL: Mfgrd2.ColWidth(colcnt) = txtCmpSecPwd.Width: Mfgrd2.TextMatrix(0, colcnt) = "[Password]": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2CMPSECPWD_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2CMPSECPWD_COL": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2CMPRECSTATE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2CMPRECSTATE_COL": Mfgrd2.ColAlignment(colcnt) = 7

colcnt = X2CMPCODE_COL: mskCmpCode.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
colcnt = X2CMPFYSTARTDT_COL: dtpCmpFYStartDt.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
colcnt = X2CMPFYENDDT_COL: dtpCmpFYEndDt.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
colcnt = X2CMPSECPWDSTR_COL: txtCmpSecPwd.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
cmdOK.Left = txtCmpSecPwd.Left + txtCmpSecPwd.Width

If sCmpBookStartDate = sFinYrStartDate And sCmpBookEndDate = sFinYrEndDate Then     ' only one financial year or first time
    Call SmryList1
    If sCmpDataPath <> "" Then
        SearchFlex Mfgrd1, X1DIRNAME_COL, JustFName(sCmpDataPath)
    End If
    ShowActiveFlexRow Mfgrd1
    
    sCmpBookStartDate = cUNKNOWNDATE
    sCmpBookEndDate = cUNKNOWNDATE
    sFinYrStartDate = cUNKNOWNDATE
    sFinYrEndDate = cUNKNOWNDATE
    sCmpDataPath = ""
    sFinYrCmpCode = 0
    Call ClearCompanyInfo
Else    ' more than one financial year
    Call SmryList2
    If sFinYrCmpCode <> 0 Then
        SearchFlex Mfgrd3, X3CMPCODE_COL, CStr(sFinYrCmpCode)
    End If
    ShowActiveFlexRow Mfgrd3
    
    sCmpBookStartDate = cUNKNOWNDATE
    sCmpBookEndDate = cUNKNOWNDATE
    sFinYrStartDate = cUNKNOWNDATE
    sFinYrEndDate = cUNKNOWNDATE
    Rem sCmpDataPath = ""
    sFinYrCmpCode = 0
    Call ClearCompanyInfo
End If

ShowEntryMode False
VisibleControls False

End Sub

Private Sub Form_Resize()
lblFormHeading.Width = Me.Width
cmdFormEnter.Left = Me.Width + TextWidth("abcdefgh")
cmdFormEscape.Left = cmdFormEnter.Left + TextWidth("123456")
frFormSmry.Left = (Me.Width - frFormSmry.Width) / 2: frFormSmry.Top = (Me.Height - (frFormSmry.Height * 1.25)) / 2
frFormDtl.Left = (Me.Width - frFormDtl.Width) / 2: frFormDtl.Top = (Me.Height - (frFormDtl.Height * 1.25)) / 2

End Sub

Private Sub Form_Unload(Cancel As Integer)
Set clsListStru = Nothing
Set MyProgStatForm = Nothing

End Sub

Private Sub ShowEntryMode(ByVal EntryMode As Boolean)
If Me.Visible = True Then
    txtVoid.SetFocus
End If
frFormSmry.Visible = Not EntryMode
frFormDtl.Visible = EntryMode: frFormDtl.Enabled = EntryMode
cmdSaveForm.Enabled = EntryMode
If EntryMode = False Then
    FormAddEditMode = cFORM_SMRYMODE
End If

End Sub

Private Function Data_Verify() As Boolean
Dim fs As Scripting.FileSystemObject

Data_Verify = False
mDirName = txtFormBoundField.Text
If IsValidDosDir(mDirName) = False Then
    ErrorBox "Invalid Directory Name !!!"
    txtFormBoundField.SetFocus
    Exit Function
ElseIf FormAddEditMode = cFORM_ADDMODE Then
    Set fs = New Scripting.FileSystemObject
    If fs.FolderExists(AddBS(sAppDataPath) & mDirName) = True Then
        ErrorBox "Directory Already Exist !!!"
        txtFormBoundField.SetFocus
        GoTo EndSub
    End If
    Set fs = Nothing
End If
If Trim(txtCmpName.Text) = "" Then
    ErrorBox "Invalid Company Name !!!"
    txtCmpName.SetFocus
    Exit Function
End If
If IsDate(dtpCmpBooksDate.Text) = False Then
    ErrorBox "Invalid Book Start Date !!!"
    dtpCmpBooksDate.SetFocus
    Exit Function
End If
If FormAddEditMode = cFORM_ADDMODE And Not (Mfgrd2.Rows > Mfgrd2.FixedRows + 1) Then
    ErrorBox "Financial Year not Defined !!!"
    Mfgrd2.SetFocus
    Exit Function
End If

Data_Verify = True

EndSub:
Set fs = Nothing
Exit Function

End Function

Private Sub Mfgrd2_DblClick()
Mfgrd2_KeyPress vbKeyReturn
End Sub

Private Sub Mfgrd2_KeyDown(KeyCode As Integer, Shift As Integer)
Dim srow As Integer, mCmpCode As Long, mDeleteit As Boolean

srow = Mfgrd2.Row
mCmpCode = Val(Mfgrd2.TextMatrix(srow, X2CMPCODE_COL))

If InList(KeyCode, Array(vbKeyDelete, vbKeySubtract)) And mCmpCode > 0 Then
    AlertBox "Prohibited !!!"
    Exit Sub

    mDeleteit = True
    If mDeleteit = True Then
        mDeleteit = CanDelete()
    End If
    If mDeleteit = True Then
        Rem check transaction before deleting
        RemoveFlexRow Mfgrd2, srow
        
        Mfgrd2.Row = srow
        Mfgrd2.SetFocus
    End If
End If

End Sub

Private Sub Mfgrd2_KeyPress(KeyAscii As Integer)
Dim srow As Integer

If KeyAscii = vbKeyReturn Then
    srow = Mfgrd2.Row
    
    dtlAddEditMode = True
    dtlAddMode = (IsFlexNewRow(Mfgrd2, srow) = True)
    Call VisibleControls(True, Mfgrd2.Top + Mfgrd2.RowPos(Mfgrd2.Row))
    If dtlAddMode = True Then
        mskCmpCode.Text = CStr(0)
        dtpCmpFYStartDt.Text = ""
        dtpCmpFYEndDt.Text = ""
        txtCmpSecPwd.Text = ""
        Call GetNextFYRange
    Else
        mskCmpCode.Text = Val(Mfgrd2.TextMatrix(srow, X2CMPCODE_COL))
        dtpCmpFYStartDt.Text = Mfgrd2.TextMatrix(srow, X2CMPFYSTARTDT_COL)
        dtpCmpFYEndDt.Text = Mfgrd2.TextMatrix(srow, X2CMPFYENDDT_COL)
        txtCmpSecPwd.Text = Mfgrd2.TextMatrix(srow, X2CMPSECPWD_COL)
    End If
    txtCmpSecPwd.SetFocus
    Call ValidDtl

End If

End Sub

Private Sub VisibleControls(ByVal mShowItem As Boolean, Optional ByVal mRowPos)
If Me.Visible = True Then
    txtVoid.SetFocus
End If
If IsMissing(mRowPos) = False Then
    mskCmpCode.Top = mRowPos
    dtpCmpFYStartDt.Top = mRowPos
    dtpCmpFYEndDt.Top = mRowPos
    txtCmpSecPwd.Top = mRowPos
    cmdOK.Top = mRowPos
End If

mskCmpCode.Text = 0
dtpCmpFYStartDt.Text = ""
dtpCmpFYEndDt.Text = ""
txtCmpSecPwd.Text = ""
Call ValidDtl

mskCmpCode.Visible = mShowItem
dtpCmpFYStartDt.Visible = mShowItem
dtpCmpFYEndDt.Visible = mShowItem
txtCmpSecPwd.Visible = mShowItem
cmdOK.Visible = mShowItem

frHeader.Enabled = (mShowItem = False)
Mfgrd2.Enabled = (mShowItem = False)
cmdSaveForm.Enabled = (mShowItem = False)

End Sub

Private Sub ValidDtl()
Dim mDataOk As Boolean
mDataOk = (Val(mskCmpCode.Text) >= 0 And IsDate(dtpCmpFYStartDt.Text) = True And IsDate(dtpCmpFYEndDt.Text) = True And Ctod(dtpCmpFYEndDt.Text) > Ctod(dtpCmpFYStartDt.Text))
cmdOK.Caption = IIf(mDataOk = True, "&OK", "&Cancel")
cmdOK.BackColor = IIf(mDataOk = True, &H80FF80, &H8080FF)

End Sub

Private Sub Mfgrd3_DblClick()
Call cmdFormEnter_Click

End Sub

Private Sub Mfgrd3_GotFocus()
Mfgrd3.Col = FlexLeftVisibleCol(Mfgrd3)
If Mfgrd3.SelectionMode = flexSelectionByRow Then
    Mfgrd3.ColSel = 0: Mfgrd3.ColSel = Mfgrd3.Cols - 1
End If
Call Mfgrd3_RowColChange

End Sub

Private Sub Mfgrd3_RowColChange()
Rem nothing
End Sub

Private Sub txtCmpAddress_GotFocus()
FlashActiveControl txtCmpAddress, True
End Sub

Private Sub txtCmpAddress_LostFocus()
FlashActiveControl txtCmpAddress, False
End Sub

Private Sub txtCmpAddress_Validate(Cancel As Boolean)
txtCmpAddress.Text = ToMyWord(txtCmpAddress.Text)
End Sub

Private Sub txtCmpCity_GotFocus()
FlashActiveControl txtCmpCity, True
End Sub

Private Sub txtCmpCity_LostFocus()
FlashActiveControl txtCmpCity, False
End Sub

Private Sub txtCmpCity_Validate(Cancel As Boolean)
txtCmpCity.Text = ToMyWord(txtCmpCity.Text)
End Sub

Private Sub txtCmpContPer_GotFocus()
FlashActiveControl txtCmpContPer, True
End Sub

Private Sub txtCmpContPer_LostFocus()
FlashActiveControl txtCmpContPer, False
End Sub

Private Sub txtCmpContPer_Validate(Cancel As Boolean)
txtCmpContPer.Text = ToMyWord(txtCmpContPer.Text)
End Sub

Private Sub txtCmpDistrict_GotFocus()
FlashActiveControl txtCmpDistrict, True
End Sub

Private Sub txtCmpDistrict_LostFocus()
FlashActiveControl txtCmpDistrict, False
End Sub

Private Sub txtCmpDistrict_Validate(Cancel As Boolean)
txtCmpDistrict.Text = ToMyWord(txtCmpDistrict.Text)
End Sub

Private Sub txtCmpEmail_GotFocus()
FlashActiveControl txtCmpEmail, True
End Sub

Private Sub txtCmpEmail_LostFocus()
FlashActiveControl txtCmpEmail, False
End Sub

Private Sub txtCmpFax_GotFocus()
FlashActiveControl txtCmpFax, True
End Sub

Private Sub txtCmpFax_LostFocus()
FlashActiveControl txtCmpFax, False
End Sub

Private Sub txtCmpJurisdiction_GotFocus()
FlashActiveControl txtCmpJurisdiction, True
End Sub

Private Sub txtCmpJurisdiction_LostFocus()
FlashActiveControl txtCmpJurisdiction, False
End Sub

Private Sub txtCmpJurisdiction_Validate(Cancel As Boolean)
txtCmpJurisdiction.Text = ToMyWord(txtCmpJurisdiction.Text)
End Sub

Private Sub txtCmpName_GotFocus()
FlashActiveControl txtCmpName, True
End Sub

Private Sub txtCmpName_LostFocus()
FlashActiveControl txtCmpName, False
End Sub

Private Sub txtCmpName_Validate(Cancel As Boolean)
txtCmpName.Text = ToMyWord(txtCmpName.Text)
If Trim(txtCmpName.Text) = "" Then
    ErrorBox "Invalid Input !!!"
    Cancel = True
    txtCmpName.SetFocus
End If

End Sub

Private Sub Data_AddEvent()

mEntrySaved = False: mEntryAborted = False
FormAddEditMode = cFORM_ADDMODE
    
txtFormBoundField.Enabled = True
dtpCmpBooksDate.Enabled = True
mDirName = ""   ' Mfgrd1.TextMatrix(Mfgrd1.Row, X1DIRNAME_COL)
txtFormBoundField.Text = mDirName

Call Data_ReadEvent

Call ShowEntryMode(True)
txtFormBoundField.SetFocus

End Sub

Private Sub Data_EditEvent()
Dim mLCount As Integer, mUCount As Integer, mCount As Integer

mEntrySaved = False: mEntryAborted = False
FormAddEditMode = cFORM_EDITMODE

txtFormBoundField.Enabled = False
dtpCmpBooksDate.Enabled = False
mDirName = Mfgrd1.TextMatrix(Mfgrd1.Row, X1DIRNAME_COL)
txtFormBoundField.Text = mDirName

Call Data_ReadEvent

Call ShowEntryMode(True)
txtCmpName.SetFocus

End Sub

Private Sub Data_ReadEvent()

txtCmpName.Text = ""
txtCmpAddress.Text = ""
txtCmpCity.Text = ""
txtCmpDistrict.Text = ""
txtCmpState.Text = ""
txtCmpContPer.Text = ""
txtCmpOPhone.Text = ""
txtCmpRPhone.Text = ""
txtCmpFax.Text = ""
txtCmpEmail.Text = ""
txtCmpWebsite.Text = ""
txtCmpReg1.Text = ""
txtCmpReg2.Text = ""
txtCmpReg3.Text = ""
txtCmpJurisdiction.Text = ""
dtpCmpBooksDate.Text = Dtoc(DateSerial(IIf(Month(Date) >= 4, Year(Date), Year(Date) - 1), 4, 1))

Call ShowDtlData

mCmpName_old = txtCmpName.Text

End Sub

Private Sub ShowDtlData()
Dim srow As Integer, dbCmpDatabase As New ADODB.Connection, tRecset As New ADODB.Recordset, mColCnt As Integer

srow = 1
Mfgrd2.Rows = 2
aryCompany_Log = Array()

If IsValidDosDir(mDirName) = True And Dir(dbCmpDatabaseFullPath(AddBS(sAppDataPath) & mDirName)) <> "" Then
    OpenCmpDataSource dbCmpDatabase, dbCmpDatabaseFullPath(AddBS(sAppDataPath) & mDirName)
    With tRecset
    .open "Select * from Company order by CmpFYStartDt", dbCmpDatabase, adOpenKeyset, adLockOptimistic
    If .RecordCount > 0 Then
        txtCmpName.Text = .fields("CmpName")
        txtCmpAddress.Text = .fields("CmpAddress")
        txtCmpCity.Text = .fields("CmpCity")
        txtCmpDistrict.Text = .fields("CmpDistrict")
        txtCmpState.Text = .fields("CmpState")
        txtCmpContPer.Text = .fields("CmpContPer")
        txtCmpOPhone.Text = .fields("CmpOPhone")
        txtCmpRPhone.Text = .fields("CmpRPhone")
        txtCmpFax.Text = .fields("CmpFax")
        txtCmpEmail.Text = .fields("CmpEmail")
        txtCmpWebsite.Text = .fields("CmpWebsite")
        txtCmpReg1.Text = .fields("CmpReg1")
        txtCmpReg2.Text = .fields("CmpReg2")
        txtCmpReg3.Text = .fields("CmpReg3")
        txtCmpJurisdiction.Text = .fields("CmpJurisdiction")
        dtpCmpBooksDate.Text = Dtoc(.fields("CmpBooksDate"))
        
        Do While .EOF = False
            Mfgrd2.TextMatrix(srow, X2CMPCODE_COL) = .fields("CmpCode")
            Mfgrd2.TextMatrix(srow, X2CMPFYSTARTDT_COL) = Dtoc(.fields("CmpFYStartDt"))
            Mfgrd2.TextMatrix(srow, X2CMPFYENDDT_COL) = Dtoc(.fields("CmpFYEndDt"))
            Mfgrd2.TextMatrix(srow, X2CMPSECPWDSTR_COL) = String(Len(.fields("CmpSecPwd")), txtCmpSecPwd.PasswordChar)
            Mfgrd2.TextMatrix(srow, X2CMPSECPWD_COL) = .fields("CmpSecPwd")
            Mfgrd2.TextMatrix(srow, X2CMPRECSTATE_COL) = .fields("CmpRecState")
            
            Mfgrd2.Rows = Mfgrd2.Rows + 1
            srow = srow + 1
            
            .MoveNext
        Loop
    End If
    End With
    CloseTable tRecset
    CloseDataSource dbCmpDatabase
End If
For mColCnt = 0 To Mfgrd2.Cols - 1
    Mfgrd2.TextMatrix(srow, mColCnt) = ""
Next

If Mfgrd2.Rows > Mfgrd2.FixedRows + 1 Then
    ReDim aryCompany_Log(0 To Mfgrd2.Rows - Mfgrd2.FixedRows - 2, 0 To Mfgrd2.Cols - 1)
    For srow = 1 To Mfgrd2.Rows - 2
        For mColCnt = 0 To Mfgrd2.Cols - 1
            aryCompany_Log(srow - 1, mColCnt) = Mfgrd2.TextMatrix(srow, mColCnt)
        Next mColCnt
    Next srow
End If

EndSub:
CloseTable tRecset, mCheckOpen:=True
CloseDataSource dbCmpDatabase, mCheckOpen:=True
Exit Sub

End Sub

Private Sub Data_SaveEvent()
Dim fs As Scripting.FileSystemObject, dbCmpDatabase As New ADODB.Connection, tRecset As New ADODB.Recordset, mCmpRecState As Integer, mCmpCode As Integer, srow As Integer
Dim acount As Integer, mRowDeleted As Boolean

sCmpDataPath = AddBS(sAppDataPath) & mDirName
If FormAddEditMode = cFORM_ADDMODE Then
    Set fs = New Scripting.FileSystemObject
    fs.CreateFolder sAppDataPath & "\" & mDirName
    If fs.FolderExists(sAppDataPath & "\" & mDirName) = False Then
        ErrorBox "Unable to Company Create Directory !!!"
        GoTo EndSub
    End If
    Set fs = Nothing
    Set MyProgStatForm = New frmProgressStatus
    Load MyProgStatForm
    MyProgStatForm.Show
    Rem common database
    CreateAcDatabase mAddMode:=True, FormProgStatus:=MyProgStatForm
    CreateStDatabase mAddMode:=True, FormProgStatus:=MyProgStatForm
    CreateGrpDatabase mAddMode:=True, FormProgStatus:=MyProgStatForm
    CreateComDatabase mAddMode:=True, FormProgStatus:=MyProgStatForm
    
    Rem hospital database
    CreateHmsCmpDatabase mAddMode:=True, FormProgStatus:=MyProgStatForm
    CreateHmsMastDatabase mAddMode:=True, FormProgStatus:=MyProgStatForm
    CreateHmsMdsMastDatabase mAddMode:=False, FormProgStatus:=MyProgStatForm    ' already created just above
    CreateHmsOpdTranDatabase mAddMode:=False, FormProgStatus:=MyProgStatForm    ' already created just above
    CreateHmsIpdTranDatabase mAddMode:=False, FormProgStatus:=MyProgStatForm    ' already created just above
    CreateHmsLabTranDatabase mAddMode:=False, FormProgStatus:=MyProgStatForm    ' already created just above
    CreateHmsComDatabase FormProgStatus:=MyProgStatForm
    
    Rem medical store database
    CreateMdsMastDatabase mAddMode:=True, FormProgStatus:=MyProgStatForm
    CreateMdsTranDatabase mAddMode:=False, FormProgStatus:=MyProgStatForm
    CreateMdsComDatabase FormProgStatus:=MyProgStatForm
    
    Rem payroll database
    CreatePyrDatabase mAddMode:=True, FormProgStatus:=MyProgStatForm
    CreatePyrComDatabase FormProgStatus:=MyProgStatForm
    
    Unload MyProgStatForm
    Set MyProgStatForm = Nothing
    
    InfoBox "Database Creation, Done !!!"
End If

OpenCmpDataSource dbCmpDatabase
tRecset.open "Select * from Company order by CmpCode", dbCmpDatabase, adOpenKeyset, adLockOptimistic
dbCmpDatabase.BeginTrans
For srow = 1 To Mfgrd2.Rows - 2
    mCmpCode = Val(Mfgrd2.TextMatrix(srow, X2CMPCODE_COL))
    mCmpRecState = Val(Mfgrd2.TextMatrix(srow, X2CMPRECSTATE_COL))
    
    With tRecset
    If mCmpRecState = cREC_ADDED Then
        .AddNew
        Rem .Fields("CmpCode") = AutoNumber
    ElseIf mCmpRecState = cREC_UNCHANGED Or mCmpRecState = cREC_EDITED Then
        MoveRecToFirst tRecset
        .Find "CmpCode=" & CStr(mCmpCode), Start:=1
    Else
        ErrorBox Me.Name & "_Data_SaveEvent_#608#_Undefined RecState"
        mEntryAborted = True
        Exit For
    End If
    .fields("CmpName") = txtCmpName.Text
    .fields("CmpBooksDate") = Ctod(dtpCmpBooksDate.Text)
    .fields("CmpFYStartDt") = Ctod(Mfgrd2.TextMatrix(srow, X2CMPFYSTARTDT_COL))
    .fields("CmpFYEndDt") = Ctod(Mfgrd2.TextMatrix(srow, X2CMPFYENDDT_COL))
    .fields("CmpAddress") = txtCmpAddress.Text
    .fields("CmpCity") = txtCmpCity.Text
    .fields("CmpDistrict") = txtCmpDistrict.Text
    .fields("CmpState") = txtCmpState.Text
    .fields("CmpReg1") = txtCmpReg1.Text
    .fields("CmpReg2") = txtCmpReg2.Text
    .fields("CmpReg3") = txtCmpReg3.Text
    .fields("CmpContPer") = txtCmpContPer.Text
    .fields("CmpOPhone") = txtCmpOPhone.Text
    .fields("CmpRPhone") = txtCmpRPhone.Text
    .fields("CmpFax") = txtCmpFax.Text
    .fields("CmpEmail") = txtCmpEmail.Text
    .fields("CmpWebsite") = txtCmpWebsite.Text
    .fields("CmpJurisdiction") = txtCmpJurisdiction.Text
    .fields("CmpSecPwd") = Mfgrd2.TextMatrix(srow, X2CMPSECPWD_COL)
    .fields("CmpRecState") = cREC_UNCHANGED
    .Update
    
    Mfgrd2.TextMatrix(srow, X2CMPCODE_COL) = .fields("CmpCode")
    
    End With
Next srow
If mEntryAborted = False Then
    For acount = LBound(aryCompany_Log) To UBound(aryCompany_Log)
        mCmpCode = Val(CStr(aryCompany_Log(acount, X2CMPCODE_COL)))
        mRowDeleted = True
        For srow = 1 To Mfgrd2.Rows - 2
            If Val(Mfgrd2.TextMatrix(srow, X2CMPCODE_COL)) = mCmpCode Then
                mRowDeleted = False
                Exit For
            End If
        Next srow
        If mRowDeleted = True Then
            With tRecset
            MoveRecToFirst tRecset
            .Find "CmpCode=" & CStr(mCmpCode), Start:=1
            .Delete
            .Update
            .MoveNext
            End With
        End If
    Next acount
End If
dbCmpDatabase.CommitTrans
CloseTable tRecset
CloseDataSource dbCmpDatabase

If mEntryAborted = False Then
    mEntrySaved = True
End If

EndSub:
Set fs = Nothing
CloseTable tRecset, mCheckOpen:=True
CloseDataSource dbCmpDatabase, mCheckOpen:=True
Exit Sub

End Sub

Private Sub Data_DeleteEvent()
Dim mDeleteit As Boolean, mRecAbsPos As Long, srow As Integer

AlertBox "Prohibited !!!"
Exit Sub

srow = Mfgrd1.Row
If srow = FlexNewRow(Mfgrd1) Then
    Exit Sub
End If
mDirName = Mfgrd1.TextMatrix(srow, X1DIRNAME_COL)

Rem check for transactions existance
mDeleteit = True
If mDeleteit = True Then
    mDeleteit = CanDelete()
End If
If mDeleteit = True Then
    txtVoid.SetFocus
    
    RemoveFlexRow Mfgrd1, srow
    
    Mfgrd1.Row = srow
    ShowActiveFlexRow Mfgrd1
    Mfgrd1.SetFocus
Else
    Mfgrd1.SetFocus
End If

End Sub

Private Sub Data_CancelEvent()
mEntryAborted = True

End Sub

Private Sub SmryList1()
Dim mDirCnt As Integer, mDirName As String, mCmpBookStartDt As Date, mCmpBookEndDt As Date, dbCmpDatabase As New ADODB.Connection, tRecset As New ADODB.Recordset
Dim gcolcount As Integer, acount As Integer, mLow As Integer, mHigh As Integer, mPos As Integer, srow As Long, mColCount As Integer

frFormSmry.Caption = "Company Selection"
clsListStru.Clear

Rem column definitions
Rem clsListStru.AddFields mExpr:="CmpCode", mAttrib:=cFAT_SYSTEM
clsListStru.AddFields mExpr:="CmpName", mTitle:="Company Name", mAlign:=1, mWidth:=4500, mShowItem:=True
clsListStru.AddFields mExpr:="CmpBookStartDt", mTitle:="Start Date", mAlign:=1, mWidth:=1500, mShowItem:=True
clsListStru.AddFields mExpr:="CmpBookEndDt", mTitle:="End Date", mAlign:=1, mWidth:=1500, mShowItem:=True
clsListStru.AddFields mExpr:="DirName", mTitle:="Directory", mAlign:=1, mWidth:=2000, mShowItem:=True

Mfgrd3.Visible = False
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
Mfgrd1.Width = FlexColsWidth(Mfgrd1) + TextWidth("abcd")
Mfgrd1.Left = (frFormSmry.Width - Mfgrd1.Width) / 2
Mfgrd1.Visible = True   ' after setting proper location
If FlexColsWidth(Mfgrd1) > Mfgrd1.Width Then
    Mfgrd1.SelectionMode = flexSelectionFree
Else
    Mfgrd1.SelectionMode = flexSelectionByRow
End If

srow = 1
dirList.Refresh
For mDirCnt = 0 To dirList.ListCount - 1
    mDirName = dirList.List(mDirCnt)
    If IsValidDosDir(JustFName(mDirName)) = True And Dir(dbCmpDatabaseFullPath(mDirName)) <> "" Then
        OpenCmpDataSource dbCmpDatabase, dbCmpDatabaseFullPath(mDirName)
        With tRecset
        .open "Select * from Company order by CmpFYStartDt", dbCmpDatabase, adOpenKeyset, adLockOptimistic
        If .RecordCount > 0 Then
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("CmpName")) = .fields("CmpName")
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("DirName")) = JustFName(mDirName)
            
            mCmpBookStartDt = .fields("CmpFYStartDt")
            mCmpBookEndDt = .fields("CmpFYEndDt")
            Do While .EOF = False
                If .fields("CmpFYStartDt") < mCmpBookStartDt Then
                    mCmpBookStartDt = .fields("CmpFYStartDt")
                End If
                If .fields("CmpFYEndDt") > mCmpBookEndDt Then
                    mCmpBookEndDt = .fields("CmpFYEndDt")
                End If
            
                .MoveNext
            Loop
            
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("CmpBookStartDt")) = Dtoc(mCmpBookStartDt)
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("CmpBookEndDt")) = Dtoc(mCmpBookEndDt)
        Else
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("CmpName")) = "[Record not found]"
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("DirName")) = JustFName(mDirName)
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("CmpBookStartDt")) = "[None]"
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("CmpBookEndDt")) = "[None]"
        End If
        End With
        CloseTable tRecset
        CloseDataSource dbCmpDatabase
        
        srow = srow + 1
        If Mfgrd1.Rows < srow + 1 Then
            Mfgrd1.Rows = Mfgrd1.Rows + 1
        End If
    End If
Next mDirCnt

For mColCount = 0 To Mfgrd1.Cols - 1
    Mfgrd1.TextMatrix(srow, mColCount) = ""
Next mColCount
Mfgrd1.Rows = srow + 1

EndSub:
CloseTable tRecset, mCheckOpen:=True
CloseDataSource dbCmpDatabase, mCheckOpen:=True
Exit Sub

End Sub

Private Sub SmryList2()
Dim dbCmpDatabase As New ADODB.Connection, tRecset As New ADODB.Recordset
Dim gcolcount As Integer, acount As Integer, mLow As Integer, mHigh As Integer, mPos As Integer, srow As Long, mColCount As Integer
Dim mCmpBookStartDt As Date, mCmpBookEndDt As Date

frFormSmry.Caption = "Financial Year Selection"
clsListStru.Clear

Rem column definitions
clsListStru.AddFields mExpr:="CmpCode", mAttrib:=cFAT_SYSTEM
clsListStru.AddFields mExpr:="CmpName", mTitle:="Company Name", mAlign:=1, mWidth:=4500, mShowItem:=True
clsListStru.AddFields mExpr:="CmpFYStartDt", mTitle:="Start Date", mAlign:=1, mWidth:=1500, mShowItem:=True
clsListStru.AddFields mExpr:="CmpFYEndDt", mTitle:="End Date", mAlign:=1, mWidth:=1500, mShowItem:=True
clsListStru.AddFields mExpr:="DirName", mTitle:="Directory", mAlign:=1, mWidth:=2000, mShowItem:=True
clsListStru.AddFields mExpr:="CmpBookStartDt", mTitle:="Start Date", mAlign:=1, mWidth:=1500, mShowItem:=False
clsListStru.AddFields mExpr:="CmpBookEndDt", mTitle:="End Date", mAlign:=1, mWidth:=1500, mShowItem:=False

Mfgrd1.Visible = False
Mfgrd3.Cols = clsListStru.UFields + 1
gcolcount = 0
mLow = clsListStru.LFields
mHigh = clsListStru.UFields
For acount = mLow To mHigh
    With Mfgrd3
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
Mfgrd3.Width = FlexColsWidth(Mfgrd3) + TextWidth("abcd")
Mfgrd3.Left = (frFormSmry.Width - Mfgrd3.Width) / 2
Mfgrd3.Visible = True   ' after setting proper location
If FlexColsWidth(Mfgrd3) > Mfgrd3.Width Then
    Mfgrd3.SelectionMode = flexSelectionFree
Else
    Mfgrd3.SelectionMode = flexSelectionByRow
End If

srow = 1
OpenCmpDataSource dbCmpDatabase
With tRecset
.open "Select * from Company order by CmpFYStartDt desc", dbCmpDatabase, adOpenKeyset, adLockOptimistic
If .RecordCount > 0 Then
    .MoveFirst
    mCmpBookStartDt = .fields("CmpFYStartDt")
    mCmpBookEndDt = .fields("CmpFYEndDt")
    Do While .EOF = False
        If .fields("CmpFYStartDt") < mCmpBookStartDt Then
            mCmpBookStartDt = .fields("CmpFYStartDt")
        End If
        If .fields("CmpFYEndDt") > mCmpBookEndDt Then
            mCmpBookEndDt = .fields("CmpFYEndDt")
        End If
    
        .MoveNext
    Loop
    .MoveFirst
    Do While .EOF = False
        Mfgrd3.TextMatrix(srow, clsListStru.GetItemIndex("CmpCode")) = .fields("CmpCode")
        Mfgrd3.TextMatrix(srow, clsListStru.GetItemIndex("CmpName")) = .fields("CmpName")
        Mfgrd3.TextMatrix(srow, clsListStru.GetItemIndex("CmpFYStartDt")) = Dtoc(.fields("CmpFYStartDt"))
        Mfgrd3.TextMatrix(srow, clsListStru.GetItemIndex("CmpFYEndDt")) = Dtoc(.fields("CmpFYEndDt"))
        Mfgrd3.TextMatrix(srow, clsListStru.GetItemIndex("DirName")) = JustFName(sCmpDataPath)
        Mfgrd3.TextMatrix(srow, clsListStru.GetItemIndex("CmpBookStartDt")) = Dtoc(mCmpBookStartDt)
        Mfgrd3.TextMatrix(srow, clsListStru.GetItemIndex("CmpBookEndDt")) = Dtoc(mCmpBookEndDt)
        
        .MoveNext
        
        srow = srow + 1
        If Mfgrd3.Rows < srow + 1 Then
            Mfgrd3.Rows = Mfgrd3.Rows + 1
        End If
    Loop
    For mColCount = 0 To Mfgrd3.Cols - 1
        Mfgrd3.TextMatrix(srow, mColCount) = ""
    Next mColCount
Else
    Mfgrd3.TextMatrix(srow, clsListStru.GetItemIndex("CmpCode")) = 0
    Mfgrd3.TextMatrix(srow, clsListStru.GetItemIndex("CmpName")) = "[Financial Year not Defined]"
    Mfgrd3.TextMatrix(srow, clsListStru.GetItemIndex("CmpFYStartDt")) = ""
    Mfgrd3.TextMatrix(srow, clsListStru.GetItemIndex("CmpFYEndDt")) = ""
    Mfgrd3.TextMatrix(srow, clsListStru.GetItemIndex("DirName")) = JustFName(sCmpDataPath)
    Mfgrd3.TextMatrix(srow, clsListStru.GetItemIndex("CmpBookStartDt")) = ""
    Mfgrd3.TextMatrix(srow, clsListStru.GetItemIndex("CmpBookEndDt")) = ""
End If
End With
CloseTable tRecset
CloseDataSource dbCmpDatabase

Mfgrd3.Rows = srow + 1

EndSub:
CloseTable tRecset, mCheckOpen:=True
CloseDataSource dbCmpDatabase, mCheckOpen:=True
Exit Sub

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

'''Private Sub ShowActiveFlexRow(ByRef Mfgrd0 As MSFlexGrid)
'''Dim mReqdRow As Long
'''
'''mReqdRow = Mfgrd0.Row
'''If Mfgrd0.Rows > Mfgrd0.FixedRows + 1 Then
'''    If Mfgrd0.RowIsVisible(mReqdRow) = False Then
'''        If mReqdRow > Mfgrd0.TopRow Then
'''            Mfgrd0.TopRow = mReqdRow - Int(Mfgrd0.Height / Mfgrd0.RowHeightMin) + Mfgrd0.FixedRows + 1
'''        Else
'''            Mfgrd0.TopRow = mReqdRow
'''        End If
'''    End If
'''Else
'''    Mfgrd0.Row = Mfgrd0.FixedRows
'''End If
'''
'''End Sub

Private Sub txtCmpOPhone_GotFocus()
FlashActiveControl txtCmpOPhone, True
End Sub

Private Sub txtCmpOPhone_LostFocus()
FlashActiveControl txtCmpOPhone, False
End Sub

Private Sub txtCmpReg1_GotFocus()
FlashActiveControl txtCmpReg1, True
End Sub

Private Sub txtCmpReg1_LostFocus()
FlashActiveControl txtCmpReg1, False
End Sub

Private Sub txtCmpReg2_GotFocus()
FlashActiveControl txtCmpReg2, True
End Sub

Private Sub txtCmpReg2_LostFocus()
FlashActiveControl txtCmpReg2, False
End Sub

Private Sub txtCmpReg3_GotFocus()
FlashActiveControl txtCmpReg3, True
End Sub

Private Sub txtCmpReg3_LostFocus()
FlashActiveControl txtCmpReg3, False
End Sub

Private Sub txtCmpRPhone_GotFocus()
FlashActiveControl txtCmpRPhone, True
End Sub

Private Sub txtCmpRPhone_LostFocus()
FlashActiveControl txtCmpRPhone, False
End Sub

Private Sub txtCmpSecPwd_GotFocus()
FlashActiveControl txtCmpSecPwd, True
End Sub

Private Sub txtCmpSecPwd_LostFocus()
FlashActiveControl txtCmpSecPwd, False
End Sub

Private Sub txtCmpSecPwd_Validate(Cancel As Boolean)
txtCmpSecPwd.Text = ToMyString(txtCmpSecPwd.Text)

End Sub

Private Sub txtCmpState_GotFocus()
FlashActiveControl txtCmpState, True
End Sub

Private Sub txtCmpState_LostFocus()
FlashActiveControl txtCmpState, False
End Sub

Private Sub txtCmpState_Validate(Cancel As Boolean)
txtCmpState.Text = ToMyWord(txtCmpState.Text)
End Sub

Private Sub txtCmpWebsite_GotFocus()
FlashActiveControl txtCmpWebsite, True
End Sub

Private Sub txtCmpWebsite_LostFocus()
FlashActiveControl txtCmpWebsite, False
End Sub

Private Sub txtFinYrPwd_GotFocus()
FlashActiveControl txtFinYrPwd, True
End Sub

Private Sub txtFinYrPwd_LostFocus()
FlashActiveControl txtFinYrPwd, False
End Sub

Private Sub txtFinYrPwd_Validate(Cancel As Boolean)
txtFinYrPwd.Text = ToMyString(txtFinYrPwd.Text)
End Sub

Private Sub txtFormBoundField_GotFocus()
FlashActiveControl txtFormBoundField, True
End Sub

Private Sub txtFormBoundField_LostFocus()
FlashActiveControl txtFormBoundField, False
End Sub

Private Sub txtFormBoundField_Validate(Cancel As Boolean)
Dim fs As Scripting.FileSystemObject

txtFormBoundField.Text = ToMyWord(txtFormBoundField.Text)
mDirName = txtFormBoundField.Text
If IsValidDosDir(mDirName) = False Then
    ErrorBox "Invalid Directory Name !!!"
    txtFormBoundField.SetFocus
    Cancel = True
ElseIf FormAddEditMode = cFORM_ADDMODE Then
    Set fs = New Scripting.FileSystemObject
    If fs.FolderExists(sAppDataPath & "\" & mDirName) = True Then
        ErrorBox "Directory Already Exist !!!"
        txtFormBoundField.SetFocus
        Cancel = True
    End If
    Set fs = Nothing
End If

End Sub

Private Sub GetNextFYRange()
Dim srow As Integer, mDate1 As Date, mDate2 As Date
srow = Mfgrd2.Row
If srow = Mfgrd2.FixedRows Then
    mDate1 = Ctod(dtpCmpBooksDate.Text)
    mDate2 = Dtoc(DateSerial(IIf(Month(mDate1) >= 4, Year(mDate1) + 1, Year(mDate1)), 3, 31))
    dtpCmpFYStartDt.Text = Dtoc(mDate1)
    dtpCmpFYEndDt.Text = Dtoc(mDate2)
Else
    mDate1 = Ctod(Mfgrd2.TextMatrix(srow - 1, X2CMPFYENDDT_COL)) + 1
    mDate2 = Dtoc(DateSerial(IIf(Month(mDate1) >= 4, Year(mDate1) + 1, Year(mDate1)), 3, 31))
    dtpCmpFYStartDt.Text = Dtoc(mDate1)
    dtpCmpFYEndDt.Text = Dtoc(mDate2)
End If

End Sub

Private Sub txtUrlPwd_GotFocus()
FlashActiveControl txtUrlPwd, True
End Sub

Private Sub txtUrlPwd_LostFocus()
FlashActiveControl txtUrlPwd, False
End Sub

Private Sub txtUrlPwd_Validate(Cancel As Boolean)
txtUrlPwd.Text = ToMyString(txtUrlPwd.Text)
End Sub

Private Sub txtUsrName_GotFocus()
FlashActiveControl txtUsrName, True
End Sub

Private Sub txtUsrName_LostFocus()
FlashActiveControl txtUsrName, False
End Sub

Private Sub txtUsrName_Validate(Cancel As Boolean)
Dim cnn As New ADODB.Connection, tRecset As New ADODB.Recordset

txtUsrName.Text = ToMyString(txtUsrName.Text)
OpenCmpDataSource cnn
With tRecset
.open "Select * from UserMast" _
    & " inner join UserRoleMst on UserMast.UsrUrlCode = UserRoleMst.UrlCode" _
    & " where UsrName = '" & CStr(txtUsrName.Text) & "'" _
    , cnn, adOpenKeyset, adLockOptimistic
If .EOF = False Then
    lblUrlName.Caption = .fields("UrlName")
Else
    lblUrlName.Caption = ""
    ErrorBox "User does not Exist !!!"
    txtUsrName.SetFocus
    Cancel = True
End If
End With
CloseTable tRecset
CloseDataSource cnn

End Sub

Private Sub txtUsrPwd_GotFocus()
FlashActiveControl txtUsrPwd, True
End Sub

Private Sub txtUsrPwd_LostFocus()
FlashActiveControl txtUsrPwd, False
End Sub

Private Sub txtUsrPwd_Validate(Cancel As Boolean)
txtUsrPwd.Text = ToMyString(txtUsrPwd.Text)
End Sub

Private Sub StartMyMenu()
ChDir sCmpDataPath
Load frmMyMenu
frmMyMenu.Show
frmMyMenu.ZOrder

Unload Me

End Sub

Private Sub ChkUserAuthReqd()
Dim cnn As New ADODB.Connection, tRecset As New ADODB.Recordset

OpenCmpDataSource cnn

With tRecset
.open "Select * from UserMast inner join UserRoleMst on UserMast.UsrUrlCode = UserRoleMst.UrlCode", cnn, adOpenKeyset, adLockOptimistic
MyCompany.mUserAuthReqd = (.EOF = False)
End With
CloseTable tRecset
CloseDataSource cnn

End Sub
