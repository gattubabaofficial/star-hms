VERSION 5.00
Object = "{5E9E78A0-531B-11CF-91F6-C2863C385E30}#1.0#0"; "MSFLXGRD.OCX"
Begin VB.Form frmBookMast 
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
      BackColor       =   &H00D5EBE6&
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
      Height          =   5895
      Left            =   240
      TabIndex        =   19
      Top             =   1080
      Width           =   10935
      Begin VB.TextBox mskSimItmCode 
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
         Left            =   7080
         TabIndex        =   8
         Tag             =   "AhCode"
         Text            =   "0"
         Top             =   2880
         Visible         =   0   'False
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
         Left            =   2400
         MaxLength       =   50
         TabIndex        =   7
         Top             =   2880
         Width           =   4575
      End
      Begin VB.TextBox txtBdnName 
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
         TabIndex        =   6
         Top             =   2520
         Width           =   4575
      End
      Begin VB.TextBox txtBahName 
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
         TabIndex        =   5
         Top             =   2160
         Width           =   4575
      End
      Begin VB.TextBox txtBpsName 
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
         TabIndex        =   4
         Top             =   1800
         Width           =   4575
      End
      Begin VB.TextBox mskBkmMRPRate 
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
         Left            =   5040
         TabIndex        =   10
         Tag             =   "AhCode"
         Text            =   "0.00"
         Top             =   3480
         Width           =   1695
      End
      Begin VB.TextBox mskBkmSaleRate 
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
         TabIndex        =   11
         Tag             =   "AhCode"
         Text            =   "0.00"
         Top             =   3480
         Visible         =   0   'False
         Width           =   1695
      End
      Begin VB.TextBox mskBkmPurchRate 
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
         TabIndex        =   9
         Tag             =   "AhCode"
         Text            =   "0.00"
         Top             =   3480
         Width           =   1695
      End
      Begin VB.TextBox txtBgpName 
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
         TabIndex        =   3
         Top             =   1440
         Width           =   4575
      End
      Begin VB.TextBox txtBkmDesc 
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
         Top             =   1080
         Width           =   4575
      End
      Begin VB.TextBox mskBkmOpValue 
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
         TabIndex        =   14
         Tag             =   "AhCode"
         Text            =   "0.00"
         Top             =   4200
         Visible         =   0   'False
         Width           =   1695
      End
      Begin VB.TextBox mskBkmOpRate 
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
         Left            =   5040
         TabIndex        =   13
         Tag             =   "AhCode"
         Text            =   "0.00"
         Top             =   4200
         Visible         =   0   'False
         Width           =   1695
      End
      Begin VB.TextBox mskBkmOpQty 
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
         TabIndex        =   12
         Tag             =   "AhCode"
         Text            =   "0.00"
         Top             =   4200
         Visible         =   0   'False
         Width           =   1695
      End
      Begin VB.CommandButton cmdSaveForm 
         Appearance      =   0  'Flat
         BackColor       =   &H80000009&
         Caption         =   "      &Save"
         Height          =   375
         Left            =   10560
         Style           =   1  'Graphical
         TabIndex        =   15
         Top             =   5520
         Width           =   375
      End
      Begin VB.TextBox txtBkmName 
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
         Top             =   720
         Width           =   5295
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
         Top             =   360
         Width           =   1335
      End
      Begin VB.Label Label2 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Sub Item:"
         BeginProperty Font 
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
         Left            =   840
         TabIndex        =   53
         Top             =   2880
         Width           =   1335
      End
      Begin VB.Label Label2 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Edition:"
         BeginProperty Font 
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
         Left            =   840
         TabIndex        =   52
         Top             =   2520
         Width           =   1335
      End
      Begin VB.Label Label2 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Author:"
         BeginProperty Font 
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
         Left            =   840
         TabIndex        =   51
         Top             =   2160
         Width           =   1335
      End
      Begin VB.Label Label2 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Publication:"
         BeginProperty Font 
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
         Left            =   840
         TabIndex        =   50
         Top             =   1800
         Width           =   1335
      End
      Begin VB.Line Line3 
         Index           =   2
         X1              =   0
         X2              =   10920
         Y1              =   3960
         Y2              =   3960
      End
      Begin VB.Line Line3 
         Index           =   1
         X1              =   0
         X2              =   10920
         Y1              =   3360
         Y2              =   3360
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
         Left            =   4440
         TabIndex        =   49
         Top             =   3480
         Width           =   495
      End
      Begin VB.Label Label2 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Sale Rate:"
         BeginProperty Font 
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
         Left            =   6960
         TabIndex        =   48
         Top             =   3480
         Visible         =   0   'False
         Width           =   975
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
         Left            =   840
         TabIndex        =   47
         Top             =   3480
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
         Left            =   840
         TabIndex        =   46
         Top             =   1440
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
         Index           =   8
         Left            =   840
         TabIndex        =   45
         Top             =   1080
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
         Left            =   6960
         TabIndex        =   38
         Top             =   4680
         Width           =   735
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
         Left            =   4440
         TabIndex        =   37
         Top             =   4680
         Width           =   495
      End
      Begin VB.Label lblBkmCurValue 
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
         TabIndex        =   36
         Top             =   4680
         Width           =   1695
      End
      Begin VB.Label lblBkmCurRate 
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
         Left            =   5040
         TabIndex        =   35
         Top             =   4680
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
         Left            =   6960
         TabIndex        =   34
         Top             =   4200
         Visible         =   0   'False
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
         Left            =   4440
         TabIndex        =   33
         Top             =   4200
         Visible         =   0   'False
         Width           =   495
      End
      Begin VB.Label lblBkmCurQty 
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
         TabIndex        =   32
         Top             =   4680
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
         TabIndex        =   31
         Top             =   4680
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
         TabIndex        =   30
         Top             =   4200
         Visible         =   0   'False
         Width           =   1455
      End
      Begin VB.Label Label2 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Book Name:"
         BeginProperty Font 
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
         TabIndex        =   22
         Top             =   720
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
         TabIndex        =   21
         Top             =   360
         Width           =   855
      End
   End
   Begin VB.TextBox txtVoid 
      CausesValidation=   0   'False
      Height          =   375
      Left            =   120
      TabIndex        =   16
      TabStop         =   0   'False
      Text            =   "Text1"
      Top             =   7920
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
      MaskColor       =   &H00E0E0E0&
      TabIndex        =   24
      TabStop         =   0   'False
      Top             =   0
      UseMaskColor    =   -1  'True
      Width           =   255
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
      TabIndex        =   23
      TabStop         =   0   'False
      Top             =   0
      Width           =   255
   End
   Begin VB.ComboBox cmbFormEntryMode 
      Appearance      =   0  'Flat
      Enabled         =   0   'False
      Height          =   315
      ItemData        =   "BookMast.frx":0000
      Left            =   0
      List            =   "BookMast.frx":000D
      Style           =   1  'Simple Combo
      TabIndex        =   20
      TabStop         =   0   'False
      Text            =   "cmbFormMode"
      Top             =   360
      Width           =   1455
   End
   Begin VB.Frame frFormSmry 
      Appearance      =   0  'Flat
      BackColor       =   &H00D5EBE6&
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
      Height          =   6975
      Left            =   240
      TabIndex        =   18
      Top             =   840
      Width           =   13215
      Begin VB.Frame frConfigure 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         ForeColor       =   &H80000008&
         Height          =   4095
         Left            =   3720
         TabIndex        =   39
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
            TabIndex        =   29
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
            TabIndex        =   28
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
            TabIndex        =   27
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
            TabIndex        =   25
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
            TabIndex        =   26
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
            TabIndex        =   40
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
         TabIndex        =   41
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
         TabIndex        =   43
         TabStop         =   0   'False
         Top             =   1680
         Width           =   1335
      End
      Begin MSFlexGridLib.MSFlexGrid Mfgrd1 
         Height          =   5970
         Left            =   225
         TabIndex        =   42
         Top             =   780
         Width           =   12465
         _ExtentX        =   21987
         _ExtentY        =   10530
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
         TabIndex        =   44
         Top             =   360
         Width           =   735
      End
   End
   Begin VB.Label lblFormHeading 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00E0E0E0&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Book Master"
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
      TabIndex        =   17
      Top             =   0
      Width           =   9015
   End
End
Attribute VB_Name = "frmBookMast"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Option Explicit

Dim FormLoaded As Boolean, mLastKeyPressed As Integer, mMaskKeyPressed As Integer
Dim mBkmCode As Long, mSimItmCode As Long
Dim mRemoteAccess As Boolean, mEntrySaved As Boolean, mEntryAborted As Boolean
Dim dbNcbDatabase As New ADODB.Connection, dbStDatabase As New ADODB.Connection, dbGrpDatabase As New ADODB.Connection, dbComDatabase As New ADODB.Connection, datRecset As New ADODB.Recordset
Dim mBkmName_old As String, mBkmMRPRate_old As Double
Dim clsBKM As clsNcbMasterEntry, clsSIM As clsNcbMasterEntry, clsIT As clsProduct, mActiveControl As Object, clsListStru As clsSelectQueryStructure
Dim fcmbBgpName As clsNcbFlexSearch, fcmbBpsName As clsNcbFlexSearch, fcmbBahName As clsNcbFlexSearch, fcmbBdnName As clsNcbFlexSearch, fcmbSimName As clsNcbFlexSearch

Private Type SmryPara
mCombinedOpBal As Integer
mCombinedCurBal As Integer
mOpBal As Integer
mCurBal As Integer
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
mBkmCode = mAccessCode
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

Public Property Get BkmName() As String
BkmName = txtBkmName.Text
End Property

Public Property Get FormAddEditMode() As Integer
FormAddEditMode = cmbFormEntryMode.ListIndex
End Property

Public Property Let FormAddEditMode(ByVal New_FormEntryMode As Integer)
cmbFormEntryMode.ListIndex = New_FormEntryMode
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
        txtBkmName.SetFocus
    End If
End If

End Sub

Private Sub cmdSaveForm_Click()
Call Data_SaveEvent

Call SmryList
txtSearch1Text_InterActiveChange txtBkmName.Text

''If txtSearch1Text.Text <> txtBkmName.Text Then
''    txtSearch1Text.Text = txtBkmName.Text
''Else
''    Call txtSearch1Text_Change
''End If
''datRecset.Find "BkmName='" & txtBkmName.Text & "'", Start:=1
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
        txtBkmName.SetFocus
    End If
End If
cmdSaveForm.Enabled = True

End Sub

Private Sub Form_Activate()
If FormLoaded = False Then
    If mRemoteAccess = True Then
        If mBkmCode = 0 Then
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
mskBkmOpValue.Enabled = False
frConfigure.Visible = False
txtSearch1Text.Enabled = False

Call RestoreDefaultSmryPara
Call SaveSmryPara

OpenNcbDataSource dbNcbDatabase
OpenStDataSource dbStDatabase
OpenGrpDataSource dbGrpDatabase
OpenComDataSource dbComDatabase

Set clsIT = New clsProduct
Set clsIT.dbStDatabase = dbStDatabase
Set clsIT.dbGrpDatabase = dbGrpDatabase

Set clsBKM = New clsNcbMasterEntry
Set clsBKM.dbNcbDatabase = dbNcbDatabase
clsBKM.blnBookMast = True
clsBKM.Init

Set clsSIM = New clsNcbMasterEntry
Set clsSIM.dbNcbDatabase = dbNcbDatabase
clsSIM.blnSubItmMast = True
clsSIM.Init

Set fcmbBgpName = New clsNcbFlexSearch
Set fcmbBgpName.dbNcbDatabase = dbNcbDatabase
fcmbBgpName.blnBookGrpMastList = True
fcmbBgpName.Init

Set fcmbBpsName = New clsNcbFlexSearch
Set fcmbBpsName.dbNcbDatabase = dbNcbDatabase
fcmbBpsName.blnBookPubMastList = True
fcmbBpsName.Init

Set fcmbBahName = New clsNcbFlexSearch
Set fcmbBahName.dbNcbDatabase = dbNcbDatabase
fcmbBahName.blnBookAthMastList = True
fcmbBahName.Init

Set fcmbBdnName = New clsNcbFlexSearch
Set fcmbBdnName.dbNcbDatabase = dbNcbDatabase
fcmbBdnName.blnBookEdtnMastList = True
fcmbBdnName.Init

Set fcmbSimName = New clsNcbFlexSearch
Set fcmbSimName.dbNcbDatabase = dbNcbDatabase
Set fcmbSimName.dbComDatabase = dbComDatabase
fcmbSimName.blnSubItmMastList = True
fcmbSimName.Init

Set clsListStru = New clsSelectQueryStructure

datRecset.Open "Select * from ((((BookMast" _
    & " inner join BookGrpMst on BookMast.BkmBgpCode = BookGrpMst.BgpCode)" _
    & " inner join BookPubMast on BookMast.BkmBpsCode = BookPubMast.BpsCode)" _
    & " inner join BookAthMast on BookMast.BkmBahCode = BookAthMast.BahCode)" _
    & " inner join BookEdtnMast on BookMast.BkmBdnCode = BookEdtnMast.BdnCode)" _
    & " inner join (SubItmMast inner join ProdMast on SubItmMast.SimItmCode = ProdMast.ItmCode) on BookMast.BkmSimCode = SubItmMast.SimCode" _
    & " order by BkmName" _
    , dbComDatabase, adOpenKeyset, adLockOptimistic
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
Set clsBKM = Nothing
Set clsSIM = Nothing
Set fcmbBgpName = Nothing
Set fcmbBpsName = Nothing
Set fcmbBahName = Nothing
Set fcmbBdnName = Nothing
Set fcmbSimName = Nothing
Set clsListStru = Nothing

CloseTable datRecset
CloseDataSource dbNcbDatabase
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
cmdSaveForm.Enabled = EntryMode
If EntryMode = False Then
    FormAddEditMode = cFORM_SMRYMODE
End If

End Sub

Private Function Data_Verify() As Boolean
Data_Verify = False
If Val(mskFormBoundField.Text) < 1 And FormAddEditMode = cFORM_EDITMODE Then
    ErrorBox "Invalid Key Value !!!"
    txtBkmName.SetFocus
    Exit Function
End If
If Trim(txtBkmName.Text) = "" Then
    ErrorBox "Invalid Item Name !!!"
    txtBkmName.SetFocus
    Exit Function
End If
If Val(fcmbBgpName.BoundText) < 1 Then
    ErrorBox "Invalid Selection !!!"
    txtBgpName.SetFocus
    Exit Function
End If
If Val(fcmbBpsName.BoundText) < 1 Then
    ErrorBox "Invalid Selection !!!"
    txtBpsName.SetFocus
    Exit Function
End If
If Val(fcmbBahName.BoundText) < 1 Then
    ErrorBox "Invalid Selection !!!"
    txtBahName.SetFocus
    Exit Function
End If
If Val(fcmbBdnName.BoundText) < 1 Then
    ErrorBox "Invalid Selection !!!"
    txtBdnName.SetFocus
    Exit Function
End If
If Val(fcmbSimName.BoundText) < 1 Then
    ErrorBox "Invalid Selection !!!"
    txtSimName.SetFocus
    Exit Function
ElseIf Val(mskSimItmCode.Text) < 1 Then
    ErrorBox "Invalid Master Item Code for Selection !!!"
    txtSimName.SetFocus
    Exit Function
End If

If Val(UnMyNumFmt(mskBkmPurchRate.Text)) < 0 Then
    ErrorBox "Invalid Input !!!"
    mskBkmPurchRate.SetFocus
    Exit Function
End If
If Val(UnMyNumFmt(mskBkmMRPRate.Text)) < 0 Then
    ErrorBox "Invalid Input !!!"
    mskBkmMRPRate.SetFocus
    Exit Function
End If

If txtBkmName.Text <> mBkmName_old Then
    If ChkIsDuplicate(dbNcbDatabase, "BookMast", "BkmName", txtBkmName.Text, "BkmCode", Val(mskFormBoundField.Text)) = True Then
        ErrorBox "Duplicate Input !!!"
        txtBkmName.SetFocus
        Exit Function
    End If
End If

Data_Verify = True
End Function

Private Sub mskBkmMRPRate_GotFocus()
FlashActiveControl mskBkmMRPRate, True
End Sub

Private Sub mskBkmMRPRate_LostFocus()
FlashActiveControl mskBkmMRPRate, False
End Sub

Private Sub mskBkmMRPRate_Validate(Cancel As Boolean)
mskBkmMRPRate.Text = ToMyNumFmt(mskBkmMRPRate.Text, mUseAbs:=True)
If Val(UnMyNumFmt(mskBkmMRPRate.Text)) < 0 Then
    ErrorBox "Invalid Input !!!"
    mskBkmMRPRate.SetFocus
    Cancel = True
End If

End Sub

Private Sub mskBkmOpQty_GotFocus()
FlashActiveControl mskBkmOpQty, True
End Sub

Private Sub mskBkmOpQty_LostFocus()
FlashActiveControl mskBkmOpQty, False
End Sub

Private Sub mskBkmOpQty_Validate(Cancel As Boolean)
mskBkmOpQty.Text = ToMyStqFmt(UnMyStqFmt(mskBkmOpQty.Text))
Call Calc_Value
End Sub

Private Sub mskBkmOpRate_GotFocus()
FlashActiveControl mskBkmOpRate, True
End Sub

Private Sub mskBkmOpRate_LostFocus()
FlashActiveControl mskBkmOpRate, False
End Sub

Private Sub mskBkmOpRate_Validate(Cancel As Boolean)
mskBkmOpRate.Text = ToMyNumFmt(mskBkmOpRate.Text, , True)
Call Calc_Value
End Sub

Private Sub mskBkmOpValue_GotFocus()
FlashActiveControl mskBkmOpValue, True
End Sub

Private Sub mskBkmOpValue_LostFocus()
FlashActiveControl mskBkmOpValue, False
End Sub

Private Sub mskBkmOpValue_Validate(Cancel As Boolean)
mskBkmOpValue.Text = ToMyNumFmt(mskBkmOpValue.Text)
End Sub

Private Sub mskBkmPurchRate_GotFocus()
FlashActiveControl mskBkmPurchRate, True
End Sub

Private Sub mskBkmPurchRate_LostFocus()
FlashActiveControl mskBkmPurchRate, False
End Sub

Private Sub mskBkmPurchRate_Validate(Cancel As Boolean)
mskBkmPurchRate.Text = ToMyNumFmt(mskBkmPurchRate.Text, mUseAbs:=True)
If Val(UnMyNumFmt(mskBkmPurchRate.Text)) < 0 Then
    ErrorBox "Invalid Input !!!"
    mskBkmPurchRate.SetFocus
    Cancel = True
End If

End Sub

Private Sub txtBahName_Change()
If fcmbBahName.CallFromText_Change = False Then
    fcmbBahName.CallFromText_Change = True
    If InterActiveChange(txtBahName) = True Then
        fcmbBahName.UserText = Array(txtBahName.Text, txtBahName.SelStart)
        fcmbBahName.Show
        txtBahName.Text = fcmbBahName.Text
        If fcmbBahName.ListSelected = True Then
            SendKeys "{tab}"
        End If
    End If
    fcmbBahName.CallFromText_Change = False
End If

End Sub

Private Sub txtBahName_GotFocus()
FlashActiveControl txtBahName, True
End Sub

Private Sub txtBahName_KeyDown(KeyCode As Integer, Shift As Integer)
If MyDropDownKey(Shift, KeyCode) = True Then
    Call txtBahName_Change
End If

End Sub

Private Sub txtBahName_LostFocus()
FlashActiveControl txtBahName, False
End Sub

Private Sub txtBahName_Validate(Cancel As Boolean)
If Val(fcmbBahName.BoundText) < 1 Then
    ErrorBox "Invalid Selection !!!"
    txtBahName.SetFocus
    Cancel = True
End If

End Sub

Private Sub txtBdnName_Change()
If fcmbBdnName.CallFromText_Change = False Then
    fcmbBdnName.CallFromText_Change = True
    If InterActiveChange(txtBdnName) = True Then
        fcmbBdnName.UserText = Array(txtBdnName.Text, txtBdnName.SelStart)
        fcmbBdnName.Show
        txtBdnName.Text = fcmbBdnName.Text
        If fcmbBdnName.ListSelected = True Then
            SendKeys "{tab}"
        End If
    End If
    fcmbBdnName.CallFromText_Change = False
End If

End Sub

Private Sub txtBdnName_GotFocus()
FlashActiveControl txtBdnName, True
End Sub

Private Sub txtBdnName_KeyDown(KeyCode As Integer, Shift As Integer)
If MyDropDownKey(Shift, KeyCode) = True Then
    Call txtBdnName_Change
End If

End Sub

Private Sub txtBdnName_LostFocus()
FlashActiveControl txtBdnName, False
End Sub

Private Sub txtBdnName_Validate(Cancel As Boolean)
If Val(fcmbBdnName.BoundText) < 1 Then
    ErrorBox "Invalid Selection !!!"
    txtBdnName.SetFocus
    Cancel = True
End If

End Sub

Private Sub txtBgpName_Change()
If fcmbBgpName.CallFromText_Change = False Then
    fcmbBgpName.CallFromText_Change = True
    If InterActiveChange(txtBgpName) = True Then
        fcmbBgpName.UserText = Array(txtBgpName.Text, txtBgpName.SelStart)
        fcmbBgpName.Show
        txtBgpName.Text = fcmbBgpName.Text
        If fcmbBgpName.ListSelected = True Then
            SendKeys "{tab}"
        End If
    End If
    fcmbBgpName.CallFromText_Change = False
End If

End Sub

Private Sub txtBgpName_GotFocus()
FlashActiveControl txtBgpName, True
End Sub

Private Sub txtBgpName_KeyDown(KeyCode As Integer, Shift As Integer)
If MyDropDownKey(Shift, KeyCode) = True Then
    Call txtBgpName_Change
End If
End Sub

Private Sub txtBgpName_LostFocus()
FlashActiveControl txtBgpName, False
End Sub

Private Sub txtBgpName_Validate(Cancel As Boolean)
If Val(fcmbBgpName.BoundText) < 1 Then
    ErrorBox "Invalid Selection !!!"
    txtBgpName.SetFocus
    Cancel = True
End If

End Sub

Private Sub txtBkmDesc_GotFocus()
FlashActiveControl txtBkmDesc, True
End Sub

Private Sub txtBkmDesc_LostFocus()
FlashActiveControl txtBkmDesc, False
End Sub

Private Sub txtBkmDesc_Validate(Cancel As Boolean)
txtBkmDesc.Text = ToMyWord(txtBkmDesc.Text)
If txtBkmDesc.Text = "" Then
    txtBkmDesc.Text = txtBkmName.Text
End If

End Sub

Private Sub txtBkmName_GotFocus()
FlashActiveControl txtBkmName, True
End Sub

Private Sub txtBkmName_LostFocus()
FlashActiveControl txtBkmName, False
End Sub

Private Sub txtBkmName_Validate(Cancel As Boolean)
txtBkmName.Text = ToMyWord(txtBkmName.Text)
If Trim(txtBkmName.Text) = "" Then
    ErrorBox "Invalid Input !!!"
    Cancel = True
    txtBkmName.SetFocus
Else
    If txtBkmName.Text <> mBkmName_old Then
        If ChkIsDuplicate(dbNcbDatabase, "BookMast", "BkmName", txtBkmName.Text, "BkmCode", Val(mskFormBoundField.Text)) = True Then
            ErrorBox "Duplicate Input !!!"
            Cancel = True
            txtBkmName.SetFocus
        End If
    End If
End If
If Cancel = False Then
    If txtBkmDesc.Text = "" Then
        txtBkmDesc.Text = txtBkmName.Text
    End If
End If

End Sub

Private Sub Data_AddEvent()

If clsBKM.BeginMast(0) = False Then
    Exit Sub
End If
mEntrySaved = False: mEntryAborted = False
FormAddEditMode = cFORM_ADDMODE

clsIT.Clear
clsBKM.Clear
mBkmCode = clsBKM.ActiveCode

mskFormBoundField.Text = mBkmCode
txtBkmName.Text = ""
txtBkmDesc.Text = ""
txtBgpName.Text = "": fcmbBgpName.BoundText = ""
txtBpsName.Text = "": fcmbBpsName.BoundText = ""
txtBahName.Text = "": fcmbBahName.BoundText = ""
txtBdnName.Text = "": fcmbBdnName.BoundText = ""
txtSimName.Text = "": fcmbSimName.BoundText = ""
mskSimItmCode.Text = 0

mskBkmPurchRate.Text = ToMyNumFmt(0)
mskBkmMRPRate.Text = ToMyNumFmt(0)

mskBkmOpQty.Text = ToMyStqFmt(0)
mskBkmOpRate.Text = ToMyNumFmt(0)
mskBkmOpValue.Text = ToMyStvFmt(0)
lblBkmCurQty.Caption = ToMyStqFmt(0)
lblBkmCurRate.Caption = ToMyNumFmt(0)
lblBkmCurValue.Caption = ToMyStvFmt(0)

mBkmName_old = txtBkmName.Text
mBkmMRPRate_old = Val(UnMyNumFmt(mskBkmMRPRate.Text))

Call ShowEntryMode(True)
txtBkmName.SetFocus

End Sub

Private Sub Data_EditEvent()
Dim mLCount As Integer, mUCount As Integer, mCount As Integer, mOpnQty As Double, mOpnAvgRate As Double, mOpnValue As Double, mCurQty As Double, mCurAvgRate As Double, mCurValue As Double

If clsBKM.BeginMast(datRecset.fields("BkmCode")) = False Then
    Exit Sub
End If
mEntrySaved = False: mEntryAborted = False
FormAddEditMode = cFORM_EDITMODE
With datRecset
mBkmCode = .fields("BkmCode")

clsBKM.GetData mBkmCode

mskFormBoundField.Text = CStr(mBkmCode)

txtBkmName.Text = .fields("BkmName")
txtBkmDesc.Text = .fields("BkmDesc")
fcmbBgpName.BoundText = CStr(.fields("BkmBgpCode")): txtBgpName.Text = fcmbBgpName.Text
fcmbBpsName.BoundText = CStr(.fields("BkmBpsCode")): txtBpsName.Text = fcmbBpsName.Text
fcmbBahName.BoundText = CStr(.fields("BkmBahCode")): txtBahName.Text = fcmbBahName.Text
fcmbBdnName.BoundText = CStr(.fields("BkmBdnCode")): txtBdnName.Text = fcmbBdnName.Text
fcmbSimName.BoundText = CStr(.fields("BkmSimCode")): txtSimName.Text = fcmbSimName.Text
clsSIM.GetData .fields("BkmSimCode")
mskSimItmCode.Text = clsSIM.mSimItmCode_lng
clsIT.GetData clsSIM.mSimItmCode_lng

mskBkmPurchRate.Text = ToMyNumFmt(.fields("BkmPurchRate"))
mskBkmMRPRate.Text = ToMyNumFmt(.fields("BkmMRPRate"))
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

mskBkmOpQty.Text = ToMyStqFmt(mOpnQty)
mskBkmOpRate.Text = ToMyNumFmt(mOpnAvgRate)
mskBkmOpValue.Text = ToMyStvFmt(mOpnValue)

lblBkmCurQty.Caption = ToMyStqFmt(mCurQty)
lblBkmCurRate.Caption = ToMyNumFmt(mCurAvgRate)
lblBkmCurValue.Caption = ToMyStvFmt(mCurValue)

mBkmName_old = txtBkmName.Text
mBkmMRPRate_old = Val(UnMyNumFmt(mskBkmMRPRate.Text))

Call ShowEntryMode(True)
txtBkmName.SetFocus

End Sub

Private Sub Data_SaveEvent()

With clsBKM
If FormAddEditMode = cFORM_ADDMODE Then
    .Clear
Else
    .GetData mBkmCode
End If

.mName_str = txtBkmName.Text
.mBkmDesc_str = txtBkmDesc.Text

.mBkmBgpCode_lng = Val(fcmbBgpName.BoundText)
.mBkmBpsCode_lng = Val(fcmbBpsName.BoundText)
.mBkmBahCode_lng = Val(fcmbBahName.BoundText)
.mBkmBdnCode_lng = Val(fcmbBdnName.BoundText)
.mBkmSimCode_lng = Val(fcmbSimName.BoundText)
    
.mBkmPurchRate_dbl = Val(UnMyNumFmt(mskBkmPurchRate.Text))
.mBkmMRPRate_dbl = Val(UnMyNumFmt(mskBkmMRPRate.Text))
If FormAddEditMode = cFORM_ADDMODE Then
    If .AddNew() = True Then
        mskFormBoundField.Text = .mCode_lng
        mBkmCode = .mCode_lng
    End If
Else
    If .Update(mBkmCode) = True Then
        Rem none
    End If
End If
If .mCode_lng > 0 Then      '''   updated successfully
    .UpdateMast mBkmCode
    .EndMast mBkmCode
    
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

mBkmCode = datRecset.fields("BkmCode")
mRecAbsPos = datRecset.AbsolutePosition

If clsBKM.CanDeleteMast(mBkmCode) = True Then
    If clsBKM.BeginMast(mBkmCode) = True Then
        clsBKM.DeleteMast mBkmCode
        clsBKM.UpdateMast mBkmCode
        clsBKM.EndMast mBkmCode
        
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
clsBKM.CancelMast mBkmCode
clsBKM.EndMast mBkmCode

mEntryAborted = True

End Sub

Private Sub Calc_Value()
With clsIT
.mItmOpQty_dbl = UnMyStqFmt(mskBkmOpQty.Text)
.mItmOpRate_dbl = Val(UnMyNumFmt(mskBkmOpRate.Text))
.Calc_Value
mskBkmOpValue.Text = ToMyStvFmt(.mItmOpValue_dbl)
End With

End Sub

Private Sub SmryList()
Dim aStock As Variant, mQty As Double, mAvgRate As Double, mValue As Double
Dim gcolcount As Integer, acount As Integer, mLow As Integer, mHigh As Integer, mPos As Integer, srow As Long, mColCount As Integer

clsListStru.Clear

Rem column definitions
clsListStru.AddFields mExpr:="BkmCode", mAttrib:=cFAT_SYSTEM
clsListStru.AddFields mExpr:="BkmName", mTitle:="Product Name", mAlign:=flexAlignLeftCenter, mWidth:=3500, mShowItem:=True

clsListStru.AddFields mExpr:="BgpName", mTitle:="Group Name", mAlign:=flexAlignLeftCenter, mWidth:=2500, mShowItem:=True
clsListStru.AddFields mExpr:="BpsName", mTitle:="Publication Name", mAlign:=flexAlignLeftCenter, mWidth:=2500, mShowItem:=True
clsListStru.AddFields mExpr:="BahName", mTitle:="Author Name", mAlign:=flexAlignLeftCenter, mWidth:=2500, mShowItem:=True
clsListStru.AddFields mExpr:="BdnName", mTitle:="Edtion", mAlign:=flexAlignLeftCenter, mWidth:=1500, mShowItem:=True
clsListStru.AddFields mExpr:="SimName", mTitle:="Sub Item", mAlign:=flexAlignLeftCenter, mWidth:=2500, mShowItem:=True

clsListStru.AddFields mExpr:="BkmPurchRate", mTitle:="Purch.Rate", mWidth:="1500", mAlign:=flexAlignRightCenter, mShowItem:=True
clsListStru.AddFields mExpr:="BkmMRPRate", mTitle:="MRP", mWidth:="1500", mAlign:=flexAlignRightCenter, mShowItem:=True

clsListStru.AddFields mExpr:="0.00", mAlias:="BkmOpQty", mTitle:="Op.Qty", mWidth:="1500", mAlign:=flexAlignRightCenter, mShowItem:=False
clsListStru.AddFields mExpr:="0.00", mAlias:="BkmOpRate", mTitle:="Op.Rate", mWidth:="1500", mAlign:=flexAlignRightCenter, mShowItem:=False
clsListStru.AddFields mExpr:="0.00", mAlias:="BkmOpValue", mTitle:="Op.Value", mWidth:="1500", mAlign:=flexAlignRightCenter, mShowItem:=False

clsListStru.AddFields mExpr:="0.00", mAlias:="BkmOpRcQty", mTitle:="Op.Rc.Qty", mWidth:="1500", mAlign:=flexAlignRightCenter, mShowItem:=False
clsListStru.AddFields mExpr:="0.00", mAlias:="BkmOpRcRate", mTitle:="Op.Rc.Rate", mWidth:="1500", mAlign:=flexAlignRightCenter, mShowItem:=False
clsListStru.AddFields mExpr:="0.00", mAlias:="BkmOpRcValue", mTitle:="Op.Rc.Value", mWidth:="1500", mAlign:=flexAlignRightCenter, mShowItem:=False

clsListStru.AddFields mExpr:="0.00", mAlias:="BkmOpIsQty", mTitle:="Op.Is.Qty", mWidth:="1500", mAlign:=flexAlignRightCenter, mShowItem:=False
clsListStru.AddFields mExpr:="0.00", mAlias:="BkmOpIsRate", mTitle:="Op.Is.Rate", mWidth:="1500", mAlign:=flexAlignRightCenter, mShowItem:=False
clsListStru.AddFields mExpr:="0.00", mAlias:="BkmOpIsValue", mTitle:="Op.Is.Value", mWidth:="1500", mAlign:=flexAlignRightCenter, mShowItem:=False

clsListStru.AddFields mExpr:="0.00", mAlias:="BkmCurQty", mTitle:="Cur.Qty", mWidth:="1500", mAlign:=flexAlignRightCenter, mShowItem:=False
clsListStru.AddFields mExpr:="0.00", mAlias:="BkmCurRate", mTitle:="Cur.Rate", mWidth:="1500", mAlign:=flexAlignRightCenter, mShowItem:=False
clsListStru.AddFields mExpr:="0.00", mAlias:="BkmCurValue", mTitle:="Cur.Value", mWidth:="1500", mAlign:=flexAlignRightCenter, mShowItem:=False

clsListStru.AddFields mExpr:="0.00", mAlias:="BkmCurRcQty", mTitle:="Cur.Rc.Qty", mWidth:="1500", mAlign:=flexAlignRightCenter, mShowItem:=False
clsListStru.AddFields mExpr:="0.00", mAlias:="BkmCurRcRate", mTitle:="Cur.Rc.Rate", mWidth:="1500", mAlign:=flexAlignRightCenter, mShowItem:=False
clsListStru.AddFields mExpr:="0.00", mAlias:="BkmCurRcValue", mTitle:="Cur.Rc.Value", mWidth:="1500", mAlign:=flexAlignRightCenter, mShowItem:=False

clsListStru.AddFields mExpr:="0.00", mAlias:="BkmCurIsQty", mTitle:="Cur.Is.Qty", mWidth:="1500", mAlign:=flexAlignRightCenter, mShowItem:=False
clsListStru.AddFields mExpr:="0.00", mAlias:="BkmCurIsRate", mTitle:="Cur.Is.Rate", mWidth:="1500", mAlign:=flexAlignRightCenter, mShowItem:=False
clsListStru.AddFields mExpr:="0.00", mAlias:="BkmCurIsValue", mTitle:="Cur.Is.Value", mWidth:="1500", mAlign:=flexAlignRightCenter, mShowItem:=False

If chkOpBal.Value = 1 Then
    If chkCombinedOpBal.Value = 1 Then
        clsListStru.UpdateField mAlias:="BkmOpQty", mShowItem:=True
        clsListStru.UpdateField mAlias:="BkmOpRate", mShowItem:=True
        clsListStru.UpdateField mAlias:="BkmOpValue", mShowItem:=True
    Else
        clsListStru.UpdateField mAlias:="BkmOpRcQty", mShowItem:=True
        clsListStru.UpdateField mAlias:="BkmOpRcRate", mShowItem:=True
        clsListStru.UpdateField mAlias:="BkmOpRcValue", mShowItem:=True
        
        clsListStru.UpdateField mAlias:="BkmOpIsQty", mShowItem:=True
        clsListStru.UpdateField mAlias:="BkmOpIsRate", mShowItem:=True
        clsListStru.UpdateField mAlias:="BkmOpIsValue", mShowItem:=True
    End If
    
End If
If chkCurBal.Value = 1 Then
    If chkCombinedCurBal.Value = 1 Then
        clsListStru.UpdateField mAlias:="BkmCurQty", mShowItem:=True
        clsListStru.UpdateField mAlias:="BkmCurRate", mShowItem:=True
        clsListStru.UpdateField mAlias:="BkmCurValue", mShowItem:=True
    Else
        clsListStru.UpdateField mAlias:="BkmCurRcQty", mShowItem:=True
        clsListStru.UpdateField mAlias:="BkmCurRcRate", mShowItem:=True
        clsListStru.UpdateField mAlias:="BkmCurRcValue", mShowItem:=True
        
        clsListStru.UpdateField mAlias:="BkmCurIsQty", mShowItem:=True
        clsListStru.UpdateField mAlias:="BkmCurIsRate", mShowItem:=True
        clsListStru.UpdateField mAlias:="BkmCurIsValue", mShowItem:=True
    End If
    
End If

RefreshDatabase dbNcbDatabase
RefreshDatabase dbStDatabase
RefreshDatabase dbGrpDatabase
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
MoveRecToFirst datRecset
With datRecset
If .RecordCount > 0 Then
    Do While .EOF = False
        Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("BkmCode")) = .fields("BkmCode")
        Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("BkmName")) = .fields("BkmName")
        
        Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("BgpName")) = .fields("BgpName")
        Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("BpsName")) = .fields("BpsName")
        Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("BahName")) = .fields("BahName")
        Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("BdnName")) = .fields("BdnName")
        Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("SimName")) = .fields("SimName")
        
        Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("BkmPurchRate")) = ToMyNumFmt(.fields("BkmPurchRate"))
        Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("BkmMRPRate")) = ToMyNumFmt(.fields("BkmMRPRate"))
        
        If chkOpBal.Value = 1 Then
            If chkCombinedOpBal.Value = 1 Then
                aStock = clsIT.GetItmOpnQtyRateValue(.fields("SimItmCode"), mIsRcSeperated:=False)
                
                mQty = aStock(0, 0)
                mAvgRate = aStock(0, 1)
                mValue = aStock(0, 2)
                
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("BkmOpQty")) = ToMyStqFmt(mQty)
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("BkmOpRate")) = ToMyNumFmt(mAvgRate)
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("BkmOpValue")) = ToMyStvFmt(mValue)
                
            Else
                aStock = clsIT.GetItmOpnQtyRateValue(.fields("SimItmCode"), mIsRcSeperated:=True)
                Rem plus stock
                mQty = aStock(0, 0)
                mAvgRate = aStock(0, 1)
                mValue = aStock(0, 2)
                
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("BkmOpRcQty")) = ToMyStqFmt(mQty)
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("BkmOpRcRate")) = ToMyNumFmt(mAvgRate)
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("BkmOpRcValue")) = ToMyStvFmt(mValue)
                
                Rem minus part
                mQty = aStock(1, 0)
                mAvgRate = aStock(1, 1)
                mValue = aStock(1, 2)
                
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("BkmOpIsQty")) = ToMyStqFmt(mQty)
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("BkmOpIsRate")) = ToMyNumFmt(mAvgRate)
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("BkmOpIsValue")) = ToMyStvFmt(mValue)
                
            End If
        End If
        If chkCurBal.Value = 1 Then
            If chkCombinedCurBal.Value = 1 Then
                aStock = clsIT.GetItmCurQtyRateValue(.fields("SimItmCode"), sCmpBookEndDate, mIsRcSeperated:=False)
                
                mQty = aStock(0, 0)
                mAvgRate = aStock(0, 1)
                mValue = aStock(0, 2)
                
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("BkmCurQty")) = ToMyStqFmt(mQty)
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("BkmCurRate")) = ToMyNumFmt(mAvgRate)
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("BkmCurValue")) = ToMyStvFmt(mValue)
                
            Else
                aStock = clsIT.GetItmCurQtyRateValue(.fields("SimItmCode"), sCmpBookEndDate, mIsRcSeperated:=True)
                Rem plus stock
                mQty = aStock(0, 0)
                mAvgRate = aStock(0, 1)
                mValue = aStock(0, 2)
                
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("BkmCurRcQty")) = ToMyStqFmt(mQty)
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("BkmCurRcRate")) = ToMyNumFmt(mAvgRate)
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("BkmCurRcValue")) = ToMyStvFmt(mValue)
                
                Rem minus part
                mQty = aStock(1, 0)
                mAvgRate = aStock(1, 1)
                mValue = aStock(1, 2)
                
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("BkmCurIsQty")) = ToMyStqFmt(mQty)
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("BkmCurIsRate")) = ToMyNumFmt(mAvgRate)
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("BkmCurIsValue")) = ToMyStvFmt(mValue)
                
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

Private Sub txtBpsName_Change()
If fcmbBpsName.CallFromText_Change = False Then
    fcmbBpsName.CallFromText_Change = True
    If InterActiveChange(txtBpsName) = True Then
        fcmbBpsName.UserText = Array(txtBpsName.Text, txtBpsName.SelStart)
        fcmbBpsName.Show
        txtBpsName.Text = fcmbBpsName.Text
        If fcmbBpsName.ListSelected = True Then
            SendKeys "{tab}"
        End If
    End If
    fcmbBpsName.CallFromText_Change = False
End If

End Sub

Private Sub txtBpsName_GotFocus()
FlashActiveControl txtBpsName, True
End Sub

Private Sub txtBpsName_KeyDown(KeyCode As Integer, Shift As Integer)
If MyDropDownKey(Shift, KeyCode) = True Then
    Call txtBpsName_Change
End If

End Sub

Private Sub txtBpsName_LostFocus()
FlashActiveControl txtBpsName, False
End Sub

Private Sub txtBpsName_Validate(Cancel As Boolean)
If Val(fcmbBpsName.BoundText) < 1 Then
    ErrorBox "Invalid Selection !!!"
    txtBpsName.SetFocus
    Cancel = True
End If

End Sub

Private Sub txtList1Col_DblClick(Index As Integer)
Call Mfgrd1_DblClick
End Sub

Private Sub txtList1Col_GotFocus(Index As Integer)
Mfgrd1.SetFocus
End Sub

Private Sub txtSearch1Text_InterActiveChange(Optional ByVal mText)
mText = IIf(IsMissing(mText) = True, txtSearch1Text.Text, mText)
SearchFlex Mfgrd1, clsListStru.GetItemIndex("BkmName"), mText
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
'''        txtSearch1Text.Text = .Fields("BkmName")
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

Private Sub txtSimName_Change()
If fcmbSimName.CallFromText_Change = False Then
    fcmbSimName.CallFromText_Change = True
    If InterActiveChange(txtSimName) = True Then
        fcmbSimName.UserText = Array(txtSimName.Text, txtSimName.SelStart)
        fcmbSimName.Show
        txtSimName.Text = fcmbSimName.Text
        If fcmbSimName.ListSelected = True Then
            SendKeys "{tab}"
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
If Val(fcmbSimName.BoundText) < 1 Then
    ErrorBox "Invalid Selection !!!"
    txtSimName.SetFocus
    Cancel = True
Else
    clsSIM.GetData Val(fcmbSimName.BoundText)
    mskSimItmCode.Text = clsSIM.mSimItmCode_lng
    
End If

End Sub
