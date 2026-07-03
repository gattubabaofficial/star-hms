VERSION 5.00
Object = "{5E9E78A0-531B-11CF-91F6-C2863C385E30}#1.0#0"; "MSFLXGRD.OCX"
Begin VB.Form frmSubItemMast 
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
   LockControls    =   -1  'True
   ScaleHeight     =   8220
   ScaleWidth      =   13890
   ShowInTaskbar   =   0   'False
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
      Height          =   6315
      Left            =   240
      TabIndex        =   25
      Top             =   1080
      Width           =   12255
      Begin VB.TextBox mskSirRtlRate 
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
         Left            =   7680
         TabIndex        =   19
         Tag             =   "AhCode"
         Text            =   "RtlRate"
         Top             =   5040
         Width           =   1395
      End
      Begin VB.Frame frHeader 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         ForeColor       =   &H80000008&
         Height          =   4215
         Left            =   480
         TabIndex        =   33
         Top             =   240
         Width           =   10995
         Begin VB.TextBox mskSimRtlRate 
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
            Left            =   7920
            TabIndex        =   9
            Tag             =   "AhCode"
            Text            =   "0.00"
            Top             =   2760
            Width           =   1695
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
            Left            =   1680
            TabIndex        =   0
            Tag             =   "AhCode"
            Text            =   "-1"
            Top             =   240
            Width           =   1335
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
            MaxLength       =   50
            TabIndex        =   1
            Top             =   660
            Width           =   5295
         End
         Begin VB.TextBox mskSimOpQty 
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
            Left            =   1680
            TabIndex        =   10
            Tag             =   "AhCode"
            Text            =   "0.00"
            Top             =   3060
            Visible         =   0   'False
            Width           =   1695
         End
         Begin VB.TextBox mskSimOpRate 
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
            Left            =   4200
            TabIndex        =   11
            Tag             =   "AhCode"
            Text            =   "0.00"
            Top             =   3060
            Visible         =   0   'False
            Width           =   1695
         End
         Begin VB.TextBox mskSimOpValue 
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
            Left            =   7320
            TabIndex        =   12
            Tag             =   "AhCode"
            Text            =   "0.00"
            Top             =   3060
            Visible         =   0   'False
            Width           =   1695
         End
         Begin VB.TextBox txtSimDesc 
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
            Left            =   1680
            MaxLength       =   50
            TabIndex        =   2
            Top             =   1020
            Width           =   5295
         End
         Begin VB.TextBox txtSigName 
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
            Left            =   1680
            MaxLength       =   50
            TabIndex        =   3
            Top             =   1380
            Width           =   4575
         End
         Begin VB.TextBox mskSimPurchRate 
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
            Left            =   1680
            TabIndex        =   6
            Tag             =   "AhCode"
            Text            =   "0.00"
            Top             =   2460
            Width           =   1695
         End
         Begin VB.TextBox mskSimWslRate 
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
            Left            =   7920
            TabIndex        =   8
            Tag             =   "AhCode"
            Text            =   "0.00"
            Top             =   2460
            Width           =   1695
         End
         Begin VB.TextBox mskSimMRPRate 
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
            Left            =   4200
            TabIndex        =   7
            Tag             =   "AhCode"
            Text            =   "0.00"
            Top             =   2460
            Width           =   1695
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
            Left            =   1680
            MaxLength       =   50
            TabIndex        =   4
            Top             =   1740
            Width           =   4575
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
            MaxLength       =   50
            TabIndex        =   5
            Top             =   2100
            Width           =   4575
         End
         Begin VB.Label Label2 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Retail Rate:"
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
            Left            =   6240
            TabIndex        =   52
            Top             =   2760
            Width           =   1635
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
            TabIndex        =   51
            Top             =   240
            Width           =   1575
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
            Left            =   120
            TabIndex        =   50
            Top             =   660
            Width           =   1575
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
            Left            =   120
            TabIndex        =   49
            Top             =   3060
            Visible         =   0   'False
            Width           =   1575
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
            Left            =   120
            TabIndex        =   48
            Top             =   3420
            Width           =   1575
         End
         Begin VB.Label lblSimCurQty 
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
            Left            =   1680
            TabIndex        =   47
            Top             =   3420
            Width           =   1695
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
            Left            =   3600
            TabIndex        =   46
            Top             =   3060
            Visible         =   0   'False
            Width           =   495
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
            Left            =   6240
            TabIndex        =   45
            Top             =   3060
            Visible         =   0   'False
            Width           =   855
         End
         Begin VB.Label lblSimCurRate 
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
            Left            =   4200
            TabIndex        =   44
            Top             =   3420
            Width           =   1695
         End
         Begin VB.Label lblSimCurValue 
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
            Left            =   7320
            TabIndex        =   43
            Top             =   3420
            Width           =   1695
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
               Italic          =   -1  'True
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H80000008&
            Height          =   255
            Index           =   5
            Left            =   3600
            TabIndex        =   42
            Top             =   3420
            Width           =   495
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
            Left            =   6240
            TabIndex        =   41
            Top             =   3420
            Width           =   735
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
            Index           =   8
            Left            =   120
            TabIndex        =   40
            Top             =   1020
            Width           =   1575
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
            Index           =   9
            Left            =   120
            TabIndex        =   39
            Top             =   1380
            Width           =   1575
         End
         Begin VB.Label Label2 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Purch.Rate:"
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
            TabIndex        =   38
            Top             =   2460
            Width           =   1575
         End
         Begin VB.Label Label2 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Wholesale Rate:"
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
            Left            =   6240
            TabIndex        =   37
            Top             =   2460
            Width           =   1635
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
            Height          =   255
            Index           =   12
            Left            =   3600
            TabIndex        =   36
            Top             =   2460
            Width           =   495
         End
         Begin VB.Label Label2 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Master Item:"
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
            TabIndex        =   35
            Top             =   1740
            Width           =   1575
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
            Height          =   255
            Index           =   14
            Left            =   120
            TabIndex        =   34
            Top             =   2100
            Width           =   1575
         End
      End
      Begin VB.TextBox mskSirWslRate 
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
         Left            =   6240
         TabIndex        =   18
         Tag             =   "AhCode"
         Text            =   "WslRate"
         Top             =   5040
         Width           =   1455
      End
      Begin VB.TextBox mskSirMRPRate 
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
         Left            =   4980
         TabIndex        =   17
         Tag             =   "AhCode"
         Text            =   "MRP"
         Top             =   5040
         Width           =   1275
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
         Left            =   9060
         Style           =   1  'Graphical
         TabIndex        =   20
         Top             =   5040
         Width           =   675
      End
      Begin VB.TextBox mskSirSno 
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
         Left            =   480
         TabIndex        =   14
         Tag             =   "AhCode"
         Text            =   "1)"
         Top             =   5040
         Width           =   495
      End
      Begin VB.TextBox mskSirPurchRate 
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
         Left            =   3720
         TabIndex        =   16
         Tag             =   "AhCode"
         Text            =   "PurRate"
         Top             =   5040
         Width           =   1275
      End
      Begin VB.TextBox txtSirPckName 
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
         Left            =   960
         MaxLength       =   50
         TabIndex        =   15
         Text            =   "PckName"
         Top             =   5040
         Width           =   2775
      End
      Begin VB.CommandButton cmdSaveForm 
         Appearance      =   0  'Flat
         BackColor       =   &H80000009&
         Caption         =   "      &Save"
         Height          =   375
         Left            =   11880
         Style           =   1  'Graphical
         TabIndex        =   21
         Top             =   5940
         Width           =   375
      End
      Begin MSFlexGridLib.MSFlexGrid Mfgrd2 
         Height          =   1755
         Left            =   480
         TabIndex        =   13
         Top             =   4440
         Width           =   10995
         _ExtentX        =   19394
         _ExtentY        =   3096
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
   End
   Begin VB.TextBox txtVoid 
      CausesValidation=   0   'False
      Height          =   375
      Left            =   120
      TabIndex        =   22
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
      MaskColor       =   &H00E0E0E0&
      TabIndex        =   28
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
      TabIndex        =   27
      TabStop         =   0   'False
      Top             =   0
      Width           =   255
   End
   Begin VB.ComboBox cmbFormEntryMode 
      Appearance      =   0  'Flat
      Enabled         =   0   'False
      Height          =   315
      ItemData        =   "SubItMst.frx":0000
      Left            =   0
      List            =   "SubItMst.frx":000D
      Style           =   1  'Simple Combo
      TabIndex        =   26
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
      Height          =   5175
      Left            =   240
      TabIndex        =   24
      Top             =   840
      Width           =   13215
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
         TabIndex        =   29
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
         TabIndex        =   31
         TabStop         =   0   'False
         Top             =   1680
         Width           =   1335
      End
      Begin MSFlexGridLib.MSFlexGrid Mfgrd1 
         Height          =   4050
         Left            =   225
         TabIndex        =   30
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
         TabIndex        =   32
         Top             =   360
         Width           =   735
      End
   End
   Begin VB.Label lblFormHeading 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00E0E0E0&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Item Master"
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
      TabIndex        =   23
      Top             =   0
      Width           =   9015
   End
End
Attribute VB_Name = "frmSubItemMast"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Option Explicit

Dim FormLoaded As Boolean, mLastKeyPressed As Integer, mMaskKeyPressed As Integer
Dim mSimCode As Long, dtlAddEditMode As Boolean, dtlAddMode As Boolean, dtlEditCanceled As Boolean
Dim mRemoteAccess As Boolean, mEntrySaved As Boolean, mEntryAborted As Boolean
Dim dbKgtDatabase As New ADODB.Connection, dbStDatabase As New ADODB.Connection, dbGrpDatabase As New ADODB.Connection, dbComDatabase As New ADODB.Connection, datRecset As New ADODB.Recordset
Dim mSimName_old As String, mSimMRPRate_old As Double
Dim clsSIM As clsKgtMasterEntry, clsSIG As clsKgtMasterEntry, clsIT As clsProduct, mActiveControl As Object, clsListStru As clsSelectQueryStructure
Dim fcmbSigName As clsKgtFlexSearch, fcmbPckName As clsKgtFlexSearch, fcmbItmName As clsComFlexSearch

Rem item packing wise rate columns
Const X2SIRICODE_COL = 0
Const X2SIRSNO_COL = 1
Const X2PCKNAME_COL = 2
Const X2SIRPURCHRATE_COL = 3
Const X2SIRMRPRATE_COL = 4
Const X2SIRWSLRATE_COL = 5
Const X2SIRRTLRATE_COL = 6
Const X2SIRPCKCODE_COL = 7
Const X2SIRRECSTATE_COL = 8
Const MFGRD2_COLS = 9

Public Property Let RemoteAccessCode(ByVal mAccessCode As Long)
mRemoteAccess = True
mSimCode = mAccessCode
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

Public Property Get SimName() As String
SimName = txtSimName.Text
End Property

Public Property Get FormAddEditMode() As Integer
FormAddEditMode = cmbFormEntryMode.ListIndex
End Property

Public Property Let FormAddEditMode(ByVal New_FormEntryMode As Integer)
cmbFormEntryMode.ListIndex = New_FormEntryMode
End Property

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
ElseIf TypeOf Screen.ActiveControl Is MSFlexGrid Then
    If Screen.ActiveControl.Name = Mfgrd2.Name Then
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
        txtSimName.SetFocus
    End If
End If

End Sub

Private Sub cmdOK_Click()
Dim tRecset As ADODB.Recordset, srow As Integer, mSirICode As Long

srow = Mfgrd2.Row
mSirICode = Val(Mfgrd2.TextMatrix(srow, X2SIRICODE_COL))

Call ValidDtl
If cmdOK.Caption = "&OK" And dtlEditCanceled = False Then
    Mfgrd2.TextMatrix(srow, X2SIRICODE_COL) = mSirICode
    Mfgrd2.TextMatrix(srow, X2SIRSNO_COL) = mskSirSno.Text
    Mfgrd2.TextMatrix(srow, X2PCKNAME_COL) = fcmbPckName.Text
    Mfgrd2.TextMatrix(srow, X2SIRPURCHRATE_COL) = mskSirPurchRate.Text
    Mfgrd2.TextMatrix(srow, X2SIRMRPRATE_COL) = mskSirMRPRate.Text
    Mfgrd2.TextMatrix(srow, X2SIRWSLRATE_COL) = mskSirWslRate.Text
    Mfgrd2.TextMatrix(srow, X2SIRRTLRATE_COL) = mskSirRtlRate.Text
    Mfgrd2.TextMatrix(srow, X2SIRPCKCODE_COL) = Val(fcmbPckName.BoundText)
    Mfgrd2.TextMatrix(srow, X2SIRRECSTATE_COL) = ChkEditRecStatus(Val(Mfgrd2.TextMatrix(srow, X2SIRRECSTATE_COL)))
    
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
Mfgrd2.SetFocus
If Not tRecset Is Nothing Then
    CloseTable tRecset, mCheckOpen:=True
End If
fcmbPckName.Text = txtPckName.Text: txtPckName.Text = fcmbPckName.Text

End Sub

Private Sub cmdSaveForm_Click()
Call Data_SaveEvent

Call SmryList
txtSearch1Text_InterActiveChange txtSimName.Text

''If txtSearch1Text.Text <> txtSimName.Text Then
''    txtSearch1Text.Text = txtSimName.Text
''Else
''    Call txtSearch1Text_Change
''End If
''datRecset.Find "SimName='" & txtSimName.Text & "'", Start:=1
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
        txtSimName.SetFocus
    End If
End If
cmdSaveForm.Enabled = True

End Sub

Private Sub Form_Activate()
If FormLoaded = False Then
    If mRemoteAccess = True Then
        If mSimCode = 0 Then
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
txtSearch1Text.Enabled = False

OpenKgtDataSource dbKgtDatabase
OpenStDataSource dbStDatabase
OpenGrpDataSource dbGrpDatabase
OpenComDataSource dbComDatabase

Set clsIT = New clsProduct
Set clsIT.dbStDatabase = dbStDatabase
Set clsIT.dbGrpDatabase = dbGrpDatabase

Set clsSIM = New clsKgtMasterEntry
Set clsSIM.dbKgtDatabase = dbKgtDatabase
clsSIM.blnSubItmMast = True
clsSIM.Init

Set clsSIG = New clsKgtMasterEntry
Set clsSIG.dbKgtDatabase = dbKgtDatabase
clsSIG.blnSubItmGrpMast = True
clsSIG.Init

Set fcmbSigName = New clsKgtFlexSearch
Set fcmbSigName.dbKgtDatabase = dbKgtDatabase
fcmbSigName.blnSubItmGrpMastList = True
fcmbSigName.Init

Set fcmbPckName = New clsKgtFlexSearch
Set fcmbPckName.dbKgtDatabase = dbKgtDatabase
fcmbPckName.blnPackMastList = True
fcmbPckName.Init

Set fcmbItmName = New clsComFlexSearch
Set fcmbItmName.dbComDatabase = dbComDatabase
Set fcmbItmName.dbStDatabase = dbStDatabase
fcmbItmName.blnProdMastList = True
fcmbItmName.Init

Set clsListStru = New clsSelectQueryStructure

If mRemoteAccess = True Then
    datRecset.Open "Select * from (SubItmMast" _
        & " inner join SubItmGrpMst on SubItmMast.SimSigCode = SubItmGrpMst.SigCode)" _
        & " inner join ProdMast itm on SubItmMast.SimItmCode = itm.ItmCode" _
        & " where SimCode = " & CStr(mSimCode) _
        & " order by SimName" _
        , dbComDatabase, adOpenKeyset, adLockOptimistic
Else
    datRecset.Open "Select * from (SubItmMast" _
        & " inner join SubItmGrpMst on SubItmMast.SimSigCode = SubItmGrpMst.SigCode)" _
        & " inner join ProdMast itm on SubItmMast.SimItmCode = itm.ItmCode" _
        & " order by SimName" _
        , dbComDatabase, adOpenKeyset, adLockOptimistic
End If
Call SmryList

Mfgrd2.FixedRows = 1: Mfgrd2.FixedCols = 0: Mfgrd2.Rows = 2: Mfgrd2.Cols = MFGRD2_COLS: SetGridAutoHeight Mfgrd2

colcnt = X2SIRICODE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2SIRICODE_COL": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2SIRSNO_COL: Mfgrd2.ColWidth(colcnt) = mskSirSno.Width: Mfgrd2.TextMatrix(0, colcnt) = "Sno": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2PCKNAME_COL: Mfgrd2.ColWidth(colcnt) = txtSirPckName.Width: Mfgrd2.TextMatrix(0, colcnt) = "Packing Name": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2SIRPURCHRATE_COL: Mfgrd2.ColWidth(colcnt) = mskSirPurchRate.Width: Mfgrd2.TextMatrix(0, colcnt) = "Rate": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2SIRMRPRATE_COL: Mfgrd2.ColWidth(colcnt) = mskSirMRPRate.Width: Mfgrd2.TextMatrix(0, colcnt) = "MRP": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2SIRWSLRATE_COL: Mfgrd2.ColWidth(colcnt) = mskSirWslRate.Width: Mfgrd2.TextMatrix(0, colcnt) = "Wholesale Rate": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2SIRRTLRATE_COL: Mfgrd2.ColWidth(colcnt) = mskSirRtlRate.Width: Mfgrd2.TextMatrix(0, colcnt) = "Retail Rate": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2SIRPCKCODE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2SIRPCKCODE_COL": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2SIRRECSTATE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2SIRRECSTATE_COL": Mfgrd2.ColAlignment(colcnt) = 7
' -----------------
colcnt = X2SIRSNO_COL: mskSirSno.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
colcnt = X2PCKNAME_COL: txtSirPckName.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
colcnt = X2SIRPURCHRATE_COL: mskSirPurchRate.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
colcnt = X2SIRMRPRATE_COL: mskSirMRPRate.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
colcnt = X2SIRWSLRATE_COL: mskSirWslRate.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
colcnt = X2SIRRTLRATE_COL: mskSirRtlRate.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
cmdOK.Left = mskSirRtlRate.Left + mskSirRtlRate.Width

ShowEntryMode False
VisibleControls False

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
Set clsSIM = Nothing
Set clsSIG = Nothing
Set fcmbSigName = Nothing
Set fcmbPckName = Nothing
Set fcmbItmName = Nothing
Set clsListStru = Nothing

CloseTable datRecset
CloseDataSource dbKgtDatabase
CloseDataSource dbStDatabase
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
cmdSaveForm.Enabled = EntryMode

If EntryMode = False Then
    FormAddEditMode = cFORM_SMRYMODE
End If

End Sub

Private Sub VisibleControls(ByVal mShowItem As Boolean, Optional ByVal mRowPos)
If Me.Visible = True Then
    txtVoid.SetFocus
End If
If IsMissing(mRowPos) = False Then
    mskSirSno.Top = mRowPos
    txtSirPckName.Top = mRowPos
    mskSirPurchRate.Top = mRowPos
    mskSirMRPRate.Top = mRowPos
    mskSirWslRate.Top = mRowPos
    mskSirRtlRate.Top = mRowPos
    cmdOK.Top = mRowPos
End If

mskSirSno.Text = 0
txtSirPckName.Text = "": fcmbPckName.BoundText = ""
mskSirPurchRate.Text = ToMyNumFmt(0)
mskSirMRPRate.Text = ToMyNumFmt(0)
mskSirWslRate.Text = ToMyNumFmt(0)
mskSirRtlRate.Text = ToMyNumFmt(0)

Call ValidDtl

mskSirSno.Visible = mShowItem
txtSirPckName.Visible = mShowItem
mskSirPurchRate.Visible = mShowItem
mskSirMRPRate.Visible = mShowItem
mskSirWslRate.Visible = mShowItem
mskSirRtlRate.Visible = mShowItem
cmdOK.Visible = mShowItem

frHeader.Enabled = (mShowItem = False)
Mfgrd2.Enabled = (mShowItem = False)
cmdSaveForm.Enabled = (mShowItem = False)

End Sub

Private Sub ValidDtl()
Dim mDataOk As Boolean, srow As Integer

srow = Mfgrd2.Row
mDataOk = (Val(UnMyNumFmt(mskSirSno.Text)) > 0 And Val(fcmbPckName.BoundText) > 0 And Val(UnMyNumFmt(mskSirPurchRate.Text)) >= 0 And Val(UnMyNumFmt(mskSirMRPRate.Text)) >= 0 And Val(UnMyNumFmt(mskSirWslRate.Text)) >= 0 And Val(UnMyNumFmt(mskSirRtlRate.Text)) >= 0)
If mDataOk = True And Screen.ActiveControl.Name = cmdOK.Name Then
    mDataOk = (ChkNotDuplPack() = True)
End If

cmdOK.Caption = IIf(mDataOk = True, "&OK", "&Cancel")
cmdOK.BackColor = IIf(mDataOk = True, &H80FF80, &H8080FF)
End Sub

Private Function ChkNotDuplPack() As Boolean
Dim mRtnval As Boolean, srow As Integer

mRtnval = True
For srow = 1 To Mfgrd2.Rows - 1
    If srow <> Mfgrd2.Row Then
        If Val(Mfgrd2.TextMatrix(srow, X2SIRPCKCODE_COL)) = Val(fcmbPckName.BoundText) Then
            ErrorBox "Duplicate Packing Exist on Sno." & Mfgrd2.TextMatrix(srow, X2SIRSNO_COL)
            mRtnval = False
            Exit For
        End If
    End If
Next srow
ChkNotDuplPack = mRtnval

End Function

Private Function Data_Verify() As Boolean
Data_Verify = False
If Val(mskFormBoundField.Text) < 1 And FormAddEditMode = cFORM_EDITMODE Then
    ErrorBox "Invalid Key Value !!!"
    txtSimName.SetFocus
    Exit Function
End If
If Trim(txtSimName.Text) = "" Then
    ErrorBox "Invalid Item Name !!!"
    txtSimName.SetFocus
    Exit Function
End If
If Val(fcmbSigName.BoundText) < 1 Then
    ErrorBox "Invalid Selection !!!"
    txtSigName.SetFocus
    Exit Function
End If
If Val(fcmbItmName.BoundText) < 1 Then
    ErrorBox "Invalid Selection !!!"
    txtItmName.SetFocus
    Exit Function
End If
If Val(fcmbPckName.BoundText) < 1 Then
    ErrorBox "Invalid Selection !!!"
    txtPckName.SetFocus
    Exit Function
End If
If Val(UnMyNumFmt(mskSimPurchRate.Text)) < 0 Then
    ErrorBox "Invalid Input !!!"
    mskSimPurchRate.SetFocus
    Exit Function
End If
If Val(UnMyNumFmt(mskSimMRPRate.Text)) < 0 Then
    ErrorBox "Invalid Input !!!"
    mskSimMRPRate.SetFocus
    Exit Function
End If
If Val(UnMyNumFmt(mskSimWslRate.Text)) < 0 Then
    ErrorBox "Invalid Input !!!"
    mskSimWslRate.SetFocus
    Exit Function
End If
If Val(UnMyNumFmt(mskSimRtlRate.Text)) < 0 Then
    ErrorBox "Invalid Input !!!"
    mskSimRtlRate.SetFocus
    Exit Function
End If
If txtSimName.Text <> mSimName_old Then
    If ChkIsDuplicate(dbKgtDatabase, "SubItmMast", "SimName", txtSimName.Text, "SimCode", Val(mskFormBoundField.Text)) = True Then
        ErrorBox "Duplicate Input !!!"
        txtSimName.SetFocus
        Exit Function
    End If
End If

Data_Verify = True
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
Dim srow As Integer, mSirICode As Long, mDeleteit As Boolean

srow = Mfgrd2.Row
mSirICode = Val(Mfgrd2.TextMatrix(srow, X2SIRICODE_COL))

If MyDeleteKey(Shift, KeyCode, mCheckCtrlMask:=False) = True And srow < FlexNewRow(Mfgrd2) Then
    txtVoid.SetFocus
    mDeleteit = True
    If mDeleteit = True Then
        mDeleteit = CanDelete()
    End If
    If mDeleteit = True Then
        RemoveFlexRow Mfgrd2, srow
        
        Mfgrd2.Row = srow
        Mfgrd2.SetFocus
        Call Mfgrd2_RowColChange
    End If
End If

End Sub

Private Sub Mfgrd2_KeyPress(KeyAscii As Integer)
Dim srow As Integer, ary1 As Variant

If KeyAscii = vbKeyReturn Then
    srow = Mfgrd2.Row
    
    dtlAddEditMode = True
    dtlAddMode = IsFlexNewRow(Mfgrd2, srow)
    VisibleControls True, Mfgrd2.Top + Mfgrd2.RowPos(Mfgrd2.Row)
    
    If dtlAddMode = True Then
        mskSirSno.Text = ToMyNumFmt(FlexNextSeqno(Mfgrd2, X2SIRSNO_COL), mDecimals:=0)
    Else
        mskSirSno.Text = Mfgrd2.TextMatrix(srow, X2SIRSNO_COL)
        fcmbPckName.BoundText = Mfgrd2.TextMatrix(srow, X2SIRPCKCODE_COL): txtSirPckName.Text = fcmbPckName.Text
        mskSirPurchRate.Text = Mfgrd2.TextMatrix(srow, X2SIRPURCHRATE_COL)
        mskSirMRPRate.Text = Mfgrd2.TextMatrix(srow, X2SIRMRPRATE_COL)
        mskSirWslRate.Text = Mfgrd2.TextMatrix(srow, X2SIRWSLRATE_COL)
        mskSirRtlRate.Text = Mfgrd2.TextMatrix(srow, X2SIRRTLRATE_COL)
    End If
    txtSirPckName.SetFocus
    Call ValidDtl
    
End If

End Sub

Private Sub Mfgrd2_RowColChange()
ShowActiveFlexRow Mfgrd2
End Sub

Private Sub mskSimMRPRate_GotFocus()
FlashActiveControl mskSimMRPRate, True
End Sub

Private Sub mskSimMRPRate_LostFocus()
FlashActiveControl mskSimMRPRate, False
End Sub

Private Sub mskSimMRPRate_Validate(Cancel As Boolean)
mskSimMRPRate.Text = ToMyNumFmt(mskSimMRPRate.Text, mUseAbs:=True)
If Val(UnMyNumFmt(mskSimMRPRate.Text)) < 0 Then
    ErrorBox "Invalid Input !!!"
    mskSimMRPRate.SetFocus
    Cancel = True
Else
    If FormAddEditMode = cFORM_ADDMODE Or Val(UnMyNumFmt(mskSimMRPRate.Text)) <> mSimMRPRate_old Then
        mskSimWslRate.Text = mskSimMRPRate.Text
        mskSimRtlRate.Text = mskSimMRPRate.Text
    End If
End If

End Sub

Private Sub mskSimOpQty_GotFocus()
FlashActiveControl mskSimOpQty, True
End Sub

Private Sub mskSimOpQty_LostFocus()
FlashActiveControl mskSimOpQty, False
End Sub

Private Sub mskSimOpQty_Validate(Cancel As Boolean)
mskSimOpQty.Text = ToMyStqFmt(UnMyStqFmt(mskSimOpQty.Text))
Call Calc_Value
End Sub

Private Sub mskSimOpRate_GotFocus()
FlashActiveControl mskSimOpRate, True
End Sub

Private Sub mskSimOpRate_LostFocus()
FlashActiveControl mskSimOpRate, False
End Sub

Private Sub mskSimOpRate_Validate(Cancel As Boolean)
mskSimOpRate.Text = ToMyNumFmt(mskSimOpRate.Text, , True)
Call Calc_Value
End Sub

Private Sub mskSimOpValue_GotFocus()
FlashActiveControl mskSimOpValue, True
End Sub

Private Sub mskSimOpValue_LostFocus()
FlashActiveControl mskSimOpValue, False
End Sub

Private Sub mskSimOpValue_Validate(Cancel As Boolean)
mskSimOpValue.Text = ToMyNumFmt(mskSimOpValue.Text)
End Sub

Private Sub mskSimPurchRate_GotFocus()
FlashActiveControl mskSimPurchRate, True
End Sub

Private Sub mskSimPurchRate_LostFocus()
FlashActiveControl mskSimPurchRate, False
End Sub

Private Sub mskSimPurchRate_Validate(Cancel As Boolean)
mskSimPurchRate.Text = ToMyNumFmt(mskSimPurchRate.Text, mUseAbs:=True)
If Val(UnMyNumFmt(mskSimPurchRate.Text)) < 0 Then
    ErrorBox "Invalid Input !!!"
    mskSimPurchRate.SetFocus
    Cancel = True
End If

End Sub

Private Sub mskSimRtlRate_GotFocus()
FlashActiveControl mskSimRtlRate, True
End Sub

Private Sub mskSimRtlRate_LostFocus()
FlashActiveControl mskSimRtlRate, False
End Sub

Private Sub mskSimRtlRate_Validate(Cancel As Boolean)
mskSimRtlRate.Text = ToMyNumFmt(mskSimRtlRate.Text, mUseAbs:=True)
If Val(UnMyNumFmt(mskSimRtlRate.Text)) < 0 Then
    ErrorBox "Invalid Input !!!"
    mskSimRtlRate.SetFocus
    Cancel = True
End If

End Sub

Private Sub mskSimWslRate_GotFocus()
FlashActiveControl mskSimWslRate, True
End Sub

Private Sub mskSimWslRate_LostFocus()
FlashActiveControl mskSimWslRate, False
End Sub

Private Sub mskSimWslRate_Validate(Cancel As Boolean)
mskSimWslRate.Text = ToMyNumFmt(mskSimWslRate.Text, mUseAbs:=True)
If Val(UnMyNumFmt(mskSimWslRate.Text)) < 0 Then
    ErrorBox "Invalid Input !!!"
    mskSimWslRate.SetFocus
    Cancel = True
End If

End Sub

Private Sub mskSirMRPRate_GotFocus()
FlashActiveControl mskSirMRPRate, True
End Sub

Private Sub mskSirMRPRate_LostFocus()
FlashActiveControl mskSirMRPRate, False
End Sub

Private Sub mskSirMRPRate_Validate(Cancel As Boolean)
mskSirMRPRate.Text = ToMyNumFmt(mskSirMRPRate.Text, mUseAbs:=True)
Call ValidDtl

End Sub

Private Sub mskSirPurchRate_GotFocus()
FlashActiveControl mskSirPurchRate, True
End Sub

Private Sub mskSirPurchRate_LostFocus()
FlashActiveControl mskSirPurchRate, False
End Sub

Private Sub mskSirPurchRate_Validate(Cancel As Boolean)
mskSirPurchRate.Text = ToMyNumFmt(mskSirPurchRate.Text, mUseAbs:=True)
Call ValidDtl

End Sub

Private Sub mskSirRtlRate_GotFocus()
FlashActiveControl mskSirRtlRate, True
End Sub

Private Sub mskSirRtlRate_LostFocus()
FlashActiveControl mskSirRtlRate, False
End Sub

Private Sub mskSirRtlRate_Validate(Cancel As Boolean)
mskSirRtlRate.Text = ToMyNumFmt(mskSirRtlRate.Text, mUseAbs:=True)
Call ValidDtl

End Sub

Private Sub mskSirWslRate_GotFocus()
FlashActiveControl mskSirWslRate, True
End Sub

Private Sub mskSirWslRate_LostFocus()
FlashActiveControl mskSirWslRate, False
End Sub

Private Sub mskSirWslRate_Validate(Cancel As Boolean)
mskSirWslRate.Text = ToMyNumFmt(mskSirWslRate.Text, mUseAbs:=True)
Call ValidDtl

End Sub

Private Sub txtItmName_Change()
If fcmbItmName.CallFromText_Change = False Then
    fcmbItmName.CallFromText_Change = True
    If InterActiveChange(txtItmName) = True Then
        fcmbItmName.UserText = Array(txtItmName.Text, txtItmName.SelStart)
        fcmbItmName.Show
        txtItmName.Text = fcmbItmName.Text
        If fcmbItmName.ListSelected = True Then
            SendKeys "{tab}"
        End If
    End If
    fcmbItmName.CallFromText_Change = False
End If

End Sub

Private Sub txtItmName_GotFocus()
FlashActiveControl txtItmName, True
End Sub

Private Sub txtItmName_KeyDown(KeyCode As Integer, Shift As Integer)
If MyDropDownKey(Shift, KeyCode) = True Then
    Call txtItmName_Change
End If

End Sub

Private Sub txtItmName_LostFocus()
FlashActiveControl txtItmName, False
End Sub

Private Sub txtItmName_Validate(Cancel As Boolean)
If Val(fcmbItmName.BoundText) < 1 Then
    ErrorBox "Invalid Selection !!!"
    txtItmName.SetFocus
    Cancel = True
Else
    clsIT.Requery
End If

End Sub

Private Sub txtPckName_Change()
If fcmbPckName.CallFromText_Change = False Then
    fcmbPckName.CallFromText_Change = True
    If InterActiveChange(txtPckName) = True Then
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
If Val(fcmbPckName.BoundText) < 1 Then
    ErrorBox "Invalid Selection !!!"
    txtPckName.SetFocus
    Cancel = True
End If

End Sub

Private Sub txtSigName_Change()
If fcmbSigName.CallFromText_Change = False Then
    fcmbSigName.CallFromText_Change = True
    If InterActiveChange(txtSigName) = True Then
        fcmbSigName.UserText = Array(txtSigName.Text, txtSigName.SelStart)
        fcmbSigName.Show
        txtSigName.Text = fcmbSigName.Text
        If fcmbSigName.ListSelected = True Then
            SendKeys "{tab}"
        End If
    End If
    fcmbSigName.CallFromText_Change = False
End If

End Sub

Private Sub txtSigName_GotFocus()
FlashActiveControl txtSigName, True
End Sub

Private Sub txtSigName_KeyDown(KeyCode As Integer, Shift As Integer)
If MyDropDownKey(Shift, KeyCode) = True Then
    Call txtSigName_Change
End If

End Sub

Private Sub txtSigName_LostFocus()
FlashActiveControl txtSigName, False
End Sub

Private Sub txtSigName_Validate(Cancel As Boolean)
If Val(fcmbSigName.BoundText) < 1 Then
    ErrorBox "Invalid Selection !!!"
    txtSigName.SetFocus
    Cancel = True
End If

End Sub

Private Sub txtSimDesc_GotFocus()
FlashActiveControl txtSimDesc, True
End Sub

Private Sub txtSimDesc_LostFocus()
FlashActiveControl txtSimDesc, False
End Sub

Private Sub txtSimDesc_Validate(Cancel As Boolean)
txtSimDesc.Text = ToMyWord(txtSimDesc.Text)
If txtSimDesc.Text = "" Then
    txtSimDesc.Text = txtSimName.Text
End If

End Sub

Private Sub txtSimName_GotFocus()
FlashActiveControl txtSimName, True
End Sub

Private Sub txtSimName_LostFocus()
FlashActiveControl txtSimName, False
End Sub

Private Sub txtSimName_Validate(Cancel As Boolean)
txtSimName.Text = ToMyWord(txtSimName.Text)
If Trim(txtSimName.Text) = "" Then
    ErrorBox "Invalid Input !!!"
    Cancel = True
    txtSimName.SetFocus
Else
    If txtSimName.Text <> mSimName_old Then
        If ChkIsDuplicate(dbKgtDatabase, "SubItmMast", "SimName", txtSimName.Text, "SimCode", Val(mskFormBoundField.Text)) = True Then
            ErrorBox "Duplicate Input !!!"
            Cancel = True
            txtSimName.SetFocus
        End If
    End If
End If
If Cancel = False Then
    If txtSimDesc.Text = "" Then
        txtSimDesc.Text = txtSimName.Text
    End If
End If

End Sub

Private Sub Data_AddEvent()
If clsSIM.BeginMast(0) = False Then
    Exit Sub
End If
mEntrySaved = False: mEntryAborted = False
FormAddEditMode = cFORM_ADDMODE

clsIT.Clear
clsSIM.Clear
mSimCode = clsSIM.ActiveCode

mskFormBoundField.Text = mSimCode
txtSimName.Text = ""
txtSimDesc.Text = ""
fcmbSigName.BoundText = GetLastValueFromTableCol(cnn:=dbKgtDatabase, mTableName:="SubItmMast", mColumnName:="SimSigCode", mOrderByColName:="SimCode", mRtnDefValue:=0)
txtSigName.Text = fcmbSigName.Text
fcmbItmName.BoundText = GetLastValueFromTableCol(cnn:=dbKgtDatabase, mTableName:="SubItmMast", mColumnName:="SimItmCode", mOrderByColName:="SimCode", mRtnDefValue:=0)
txtItmName.Text = fcmbItmName.Text
fcmbPckName.BoundText = GetLastValueFromTableCol(cnn:=dbKgtDatabase, mTableName:="SubItmMast", mColumnName:="SimPckCode", mOrderByColName:="SimCode", mRtnDefValue:=0)
txtPckName.Text = fcmbPckName.Text
mskSimPurchRate.Text = ToMyNumFmt(0)
mskSimMRPRate.Text = ToMyNumFmt(0)
mskSimWslRate.Text = ToMyNumFmt(0)
mskSimRtlRate.Text = ToMyNumFmt(0)

ShowDtlData mSimCode

mskSimOpQty.Text = ToMyStqFmt(0)
mskSimOpRate.Text = ToMyNumFmt(0)
mskSimOpValue.Text = ToMyStvFmt(0)
lblSimCurQty.Caption = ToMyStqFmt(0)
lblSimCurRate.Caption = ToMyNumFmt(0)
lblSimCurValue.Caption = ToMyStvFmt(0)

mSimName_old = txtSimName.Text
mSimMRPRate_old = Val(UnMyNumFmt(mskSimMRPRate.Text))

ShowEntryMode True
txtSimName.SetFocus

End Sub

Private Sub Data_EditEvent()
Dim mLCount As Integer, mUCount As Integer, mCount As Integer, mOpnQty As Double, mOpnAvgRate As Double, mOpnValue As Double, mCurQty As Double, mCurAvgRate As Double, mCurValue As Double

If clsSIM.BeginMast(datRecset.fields("SimCode")) = False Then
    Exit Sub
End If
mEntrySaved = False: mEntryAborted = False
FormAddEditMode = cFORM_EDITMODE
With datRecset
mSimCode = .fields("SimCode")

clsSIM.GetData mSimCode

mskFormBoundField.Text = CStr(mSimCode)

txtSimName.Text = .fields("SimName")
txtSimDesc.Text = .fields("SimDesc")
fcmbSigName.BoundText = CStr(.fields("SimSigCode")): txtSigName.Text = fcmbSigName.Text
fcmbItmName.BoundText = CStr(.fields("SimItmCode")): txtItmName.Text = fcmbItmName.Text
fcmbPckName.BoundText = CStr(.fields("SimPckCode")): txtPckName.Text = fcmbPckName.Text
mskSimPurchRate.Text = ToMyNumFmt(.fields("SimPurchRate"))
mskSimMRPRate.Text = ToMyNumFmt(.fields("SimMRPRate"))
mskSimWslRate.Text = ToMyNumFmt(.fields("SimWslRate"))
mskSimRtlRate.Text = ToMyNumFmt(.fields("SimRtlRate"))
End With

ShowDtlData mSimCode

mOpnQty = 0: mOpnAvgRate = 0: mOpnValue = 0
With clsIT
.GetData Val(fcmbItmName.BoundText)
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

mskSimOpQty.Text = ToMyStqFmt(mOpnQty)
mskSimOpRate.Text = ToMyNumFmt(mOpnAvgRate)
mskSimOpValue.Text = ToMyStvFmt(mOpnValue)

lblSimCurQty.Caption = ToMyStqFmt(mCurQty)
lblSimCurRate.Caption = ToMyNumFmt(mCurAvgRate)
lblSimCurValue.Caption = ToMyStvFmt(mCurValue)

mSimName_old = txtSimName.Text
mSimMRPRate_old = Val(UnMyNumFmt(mskSimMRPRate.Text))

Call ShowEntryMode(True)
txtSimName.SetFocus

End Sub

Private Sub ShowDtlData(ByVal mSirCode As Long)
Dim srow As Integer, tRecset As ADODB.Recordset, mColCnt As Integer

srow = 1
Mfgrd2.Rows = 2

Set tRecset = dbKgtDatabase.Execute("Select * from SubItmRateMst sir inner join PackMast pck on sir.SirPckCode = pck.PckCode where SirCode = " & CStr(mSirCode) & " order by SirSno")
With tRecset
If .EOF = False Then
    Do While .EOF = False
        If InList(.fields("SirRecState"), Array(cREC_ADDED, cREC_EDITED, cREC_UNCHANGED)) = True Then
            Mfgrd2.TextMatrix(srow, X2SIRICODE_COL) = .fields("SirICode")
            Mfgrd2.TextMatrix(srow, X2SIRSNO_COL) = ToMyNumFmt(.fields("SirSno"), mDecimals:=0)
            Mfgrd2.TextMatrix(srow, X2PCKNAME_COL) = .fields("PckName")
            Mfgrd2.TextMatrix(srow, X2SIRPURCHRATE_COL) = ToMyNumFmt(.fields("SirPurchRate"))
            Mfgrd2.TextMatrix(srow, X2SIRMRPRATE_COL) = ToMyNumFmt(.fields("SirMRPRate"))
            Mfgrd2.TextMatrix(srow, X2SIRWSLRATE_COL) = ToMyNumFmt(.fields("SirWslRate"))
            Mfgrd2.TextMatrix(srow, X2SIRRTLRATE_COL) = ToMyNumFmt(.fields("SirRtlRate"))
            Mfgrd2.TextMatrix(srow, X2SIRPCKCODE_COL) = .fields("SirPckCode")
            Mfgrd2.TextMatrix(srow, X2SIRRECSTATE_COL) = .fields("SirRecState")
            
            Mfgrd2.Rows = Mfgrd2.Rows + 1
            srow = srow + 1
        Else
            If InList(.fields("SirRecState"), Array(cREC_CANCELED, cREC_DELETED)) = False Then
                ErrorBox Me.Name & "_ShowDtlData_#1061_[Invalid Record Status]"
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

Rem Call CalcFtrTotal

End Sub

Private Sub Data_SaveEvent()
Dim tRecset As New ADODB.Recordset, mContinueUpdate As Boolean, mSirICode As Long, srow As Integer

mContinueUpdate = True

With clsSIM
If FormAddEditMode = cFORM_ADDMODE Then
    .Clear
Else
    .GetData mSimCode
End If

.mName_str = txtSimName.Text
.mSimDesc_str = txtSimDesc.Text
.mSimSigCode_lng = Val(fcmbSigName.BoundText)
.mSimItmCode_lng = Val(fcmbItmName.BoundText)
.mSimPckCode_lng = Val(fcmbPckName.BoundText)
.mSimPurchRate_dbl = Val(UnMyNumFmt(mskSimPurchRate.Text))
.mSimMRPRate_dbl = Val(UnMyNumFmt(mskSimMRPRate.Text))
.mSimWslRate_dbl = Val(UnMyNumFmt(mskSimWslRate.Text))
.mSimRtlRate_dbl = Val(UnMyNumFmt(mskSimRtlRate.Text))
If FormAddEditMode = cFORM_ADDMODE Then
    If .AddNew() = True Then
        mskFormBoundField.Text = .mCode_lng
        mSimCode = .mCode_lng
    Else
        mContinueUpdate = False
    End If
Else
    If .Update(mSimCode) = True Then
        Rem none
    Else
        mContinueUpdate = False
    End If
End If
If mContinueUpdate = True Then   ''' .mCode_lng > 0   updated successfully
    .UpdateMast mSimCode
    .EndMast mSimCode
    
    Rem updating Packing-wise Rate information
    dbKgtDatabase.BeginTrans
    dbKgtDatabase.Execute "Update SubItmRateMst set SirRecState = " & cREC_DELETED & " where SirCode = " & CStr(mSimCode)
    
    For srow = 1 To Mfgrd2.Rows - 2
        mSirICode = Val(Mfgrd2.TextMatrix(srow, X2SIRICODE_COL))
        With tRecset
        .Open "Select * from SubItmRateMst where SirICode = " & CStr(mSirICode) & "", dbKgtDatabase, adOpenKeyset, adLockOptimistic
        If mSirICode < 1 Then
            .AddNew
            
            Rem .Fields("SirICode") = AutoNumber
            .fields("SirCode") = mSimCode
        End If
        .fields("SirSno") = srow    ' resetting sno as well (if any row deleted)
        
        .fields("SirPckCode") = Val(Mfgrd2.TextMatrix(srow, X2SIRPCKCODE_COL))
        .fields("SirPurchRate") = UnMyNumFmt(Mfgrd2.TextMatrix(srow, X2SIRPURCHRATE_COL))
        .fields("SirMRPRate") = UnMyNumFmt(Mfgrd2.TextMatrix(srow, X2SIRMRPRATE_COL))
        .fields("SirWslRate") = UnMyNumFmt(Mfgrd2.TextMatrix(srow, X2SIRWSLRATE_COL))
        .fields("SirRtlRate") = UnMyNumFmt(Mfgrd2.TextMatrix(srow, X2SIRRTLRATE_COL))
        .fields("SirRecState") = cREC_UNCHANGED
        .Update
        End With
        CloseTable tRecset
    Next srow
    dbKgtDatabase.Execute "Delete from SubItmRateMst where SirCode = " & CStr(mSimCode) & " and SirRecState = " & cREC_DELETED & ""
    dbKgtDatabase.CommitTrans
    
    ' --------------------------------
    If FormAddEditMode = cFORM_ADDMODE Then
        clsIT.UpdateDependency .mSimItmCode_lng, True
    End If
    
    mEntrySaved = True
Else
    Call Data_CancelEvent
    ErrorBox "Entry Cancelled !!!"
End If
End With

End Sub

Private Sub Data_DeleteEvent()
Dim mDeleteit As Boolean, mRecAbsPos As Long
If (datRecset.EOF Or datRecset.BOF) = True Then
    Exit Sub
End If

mSimCode = datRecset.fields("SimCode")
'''mSimItmCode = datRecset.fields("SimItmCode")
mRecAbsPos = datRecset.AbsolutePosition

If clsSIM.CanDeleteMast(mSimCode, mSkipConfirm:=True) = True Then   ''' clsIT.CanDeleteItem(mSimItmCode, mSkipConfirm:=True, mSkipDependency:=True) = True And
    If CanDelete() = True Then
        If clsSIM.BeginMast(mSimCode) = True Then   ''' clsIT.BeginItem(mSimItmCode) = True And
'''            clsIT.DeleteItem mSimItmCode
'''            clsIT.CommitItem mSimItmCode
'''            clsIT.EndItem mSimItmCode
            
            clsSIM.DeleteMast mSimCode
            clsSIM.UpdateMast mSimCode
            clsSIM.EndMast mSimCode
            
            Rem clsIT.UpdateDependency mSimItmCode, False not required here
            
            dbKgtDatabase.BeginTrans
            dbKgtDatabase.Execute "Delete from SubItmRateMst where SirCode = " & CStr(mSimCode) & ""
            dbKgtDatabase.CommitTrans
            
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
Else
    Mfgrd1.SetFocus
End If

End Sub

Private Sub Data_CancelEvent()
'''clsIT.CancelItem mSimItmCode
'''clsIT.EndItem mSimItmCode

clsSIM.CancelMast mSimCode
clsSIM.EndMast mSimCode

mEntryAborted = True

End Sub

Private Sub Calc_Value()
With clsIT
.mItmOpQty_dbl = UnMyStqFmt(mskSimOpQty.Text)
.mItmOpRate_dbl = Val(UnMyNumFmt(mskSimOpRate.Text))
.Calc_Value
mskSimOpValue.Text = ToMyStvFmt(.mItmOpValue_dbl)
End With

End Sub

Private Sub SmryList()
Dim aStock As Variant, mQty As Double, mAvgRate As Double, mValue As Double
Dim gcolcount As Integer, acount As Integer, mLow As Integer, mHigh As Integer, mPos As Integer, srow As Long, mColCount As Integer
Dim tRecset As ADODB.Recordset

clsListStru.Clear

Rem column definitions
clsListStru.AddFields mExpr:="SimCode", mAttrib:=cFAT_SYSTEM
clsListStru.AddFields mExpr:="SimItmCode", mAttrib:=cFAT_SYSTEM
clsListStru.AddFields mExpr:="SimName", mTitle:="Product Name", mAlign:=flexAlignLeftCenter, mWidth:=3500, mShowItem:=True
clsListStru.AddFields mExpr:="SigName", mTitle:="Group Name", mAlign:=flexAlignLeftCenter, mWidth:=3000, mShowItem:=True
clsListStru.AddFields mExpr:="ItmName", mTitle:="Master Item", mAlign:=flexAlignLeftCenter, mWidth:=2000, mShowItem:=True
clsListStru.AddFields mExpr:="SimPurchRate", mTitle:="Purch.Rate", mWidth:="1500", mAlign:=flexAlignRightCenter, mShowItem:=True
clsListStru.AddFields mExpr:="SimMRPRate", mTitle:="MRP", mWidth:="1500", mAlign:=flexAlignRightCenter, mShowItem:=True
clsListStru.AddFields mExpr:="SimWslRate", mTitle:="Wholesale Rate", mWidth:="1500", mAlign:=flexAlignRightCenter, mShowItem:=True
clsListStru.AddFields mExpr:="SimRtlRate", mTitle:="Retail Rate", mWidth:="1500", mAlign:=flexAlignRightCenter, mShowItem:=True

RefreshDatabase dbKgtDatabase
RefreshDatabase dbComDatabase
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
Rem MoveRecToFirst datRecset
Set tRecset = datRecset.ActiveConnection.Execute(datRecset.Source)
With tRecset
Rem If .RecordCount > 0 Then
If IsValidRec(tRecset) = True Then
    Do While .EOF = False
        Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("SimCode")) = .fields("SimCode")
        Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("SimItmCode")) = .fields("SimItmCode")
        Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("SimName")) = .fields("SimName")
        Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("SigName")) = .fields("SigName")
        Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("ItmName")) = .fields("ItmName")
        Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("SimPurchRate")) = ToMyNumFmt(.fields("SimPurchRate"))
        Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("SimMRPRate")) = ToMyNumFmt(.fields("SimMRPRate"))
        Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("SimWslRate")) = ToMyNumFmt(.fields("SimWslRate"))
        Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("SimRtlRate")) = ToMyNumFmt(.fields("SimRtlRate"))
        
        srow = srow + 1
        If Mfgrd1.Rows < srow + 1 Then
            Mfgrd1.Rows = Mfgrd1.Rows + 1
        End If
        
        .MoveNext
    Loop
End If
End With
CloseTable tRecset
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
SearchFlex Mfgrd1, clsListStru.GetItemIndex("SimName"), mText
ShowActiveFlexRow Mfgrd1

End Sub

Private Sub txtSearch1Text_GotFocus()
FlashActiveControl txtSearch1Text, True

End Sub

Private Sub txtSearch1Text_LostFocus()
FlashActiveControl txtSearch1Text, False
End Sub

Private Sub txtSirPckName_Change()
If fcmbPckName.CallFromText_Change = False Then
    fcmbPckName.CallFromText_Change = True
    If InterActiveChange(txtSirPckName) = True Then
        fcmbPckName.UserText = Array(txtSirPckName.Text, txtSirPckName.SelStart)
        fcmbPckName.Show
        txtSirPckName.Text = fcmbPckName.Text
        If fcmbPckName.ListSelected = True Then
            SendKeys "{tab}"
        End If
    End If
    fcmbPckName.CallFromText_Change = False
End If

End Sub

Private Sub txtSirPckName_GotFocus()
FlashActiveControl txtSirPckName, True
End Sub

Private Sub txtSirPckName_KeyDown(KeyCode As Integer, Shift As Integer)
If MyDropDownKey(Shift, KeyCode) = True Then
    Call txtSirPckName_Change
End If

End Sub

Private Sub txtSirPckName_LostFocus()
FlashActiveControl txtSirPckName, False
End Sub

Private Sub txtSirPckName_Validate(Cancel As Boolean)
If Val(fcmbPckName.BoundText) < 1 Then
    ErrorBox "Invalid Selection !!!"
    txtSirPckName.SetFocus
    Cancel = True
End If
Call ValidDtl

End Sub










Rem -------------------------------------- end of form --------------------------------------------------
