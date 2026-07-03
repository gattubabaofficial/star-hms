VERSION 5.00
Object = "{5E9E78A0-531B-11CF-91F6-C2863C385E30}#1.0#0"; "MSFLXGRD.OCX"
Begin VB.Form frmVgnOpdOptions 
   Appearance      =   0  'Flat
   BackColor       =   &H80000005&
   ClientHeight    =   9075
   ClientLeft      =   60
   ClientTop       =   60
   ClientWidth     =   14010
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
   ScaleHeight     =   9075
   ScaleWidth      =   14010
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
      Height          =   7815
      Left            =   360
      TabIndex        =   84
      Top             =   960
      Width           =   12615
      Begin VB.CommandButton cmdSaveForm 
         Appearance      =   0  'Flat
         BackColor       =   &H80000009&
         Caption         =   "      &Save"
         Height          =   255
         Left            =   12000
         Style           =   1  'Graphical
         TabIndex        =   79
         Top             =   7440
         Width           =   375
      End
      Begin VB.TextBox txtOptName 
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
         MaxLength       =   50
         TabIndex        =   1
         Top             =   360
         Width           =   5295
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
         Left            =   360
         TabIndex        =   0
         Tag             =   "AhCode"
         Text            =   "-1"
         Top             =   360
         Width           =   855
      End
      Begin VB.Frame frPatMast 
         Appearance      =   0  'Flat
         BackColor       =   &H00FFD7B7&
         Caption         =   "Patient Registration (1):"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   6495
         Left            =   120
         TabIndex        =   81
         Top             =   840
         Width           =   12255
         Begin VB.CheckBox chkPttRegNoAutoNumber 
            Alignment       =   1  'Right Justify
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            Caption         =   "Patient Reg.No. AutoNumbering"
            BeginProperty Font 
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
            TabIndex        =   2
            Top             =   480
            Width           =   4935
         End
         Begin VB.TextBox txtStnName 
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
            Left            =   2040
            MaxLength       =   50
            TabIndex        =   8
            Top             =   3120
            Width           =   3615
         End
         Begin VB.TextBox txtAraName 
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
            Left            =   2040
            MaxLength       =   50
            TabIndex        =   6
            Top             =   2760
            Width           =   3615
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
            Index           =   1
            Left            =   2040
            MaxLength       =   50
            TabIndex        =   12
            Top             =   3840
            Width           =   3615
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
            Index           =   1
            Left            =   2040
            MaxLength       =   50
            TabIndex        =   10
            Top             =   3480
            Width           =   3615
         End
         Begin VB.CheckBox chkAraNameCFD 
            Alignment       =   1  'Right Justify
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            Caption         =   "C/F:"
            BeginProperty Font 
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
            Left            =   5760
            TabIndex        =   7
            Top             =   2760
            Width           =   855
         End
         Begin VB.CheckBox chkStnNameCFD 
            Alignment       =   1  'Right Justify
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            Caption         =   "C/F:"
            BeginProperty Font 
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
            Left            =   5760
            TabIndex        =   9
            Top             =   3120
            Width           =   855
         End
         Begin VB.CheckBox chkPcgNameCFD 
            Alignment       =   1  'Right Justify
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            Caption         =   "C/F:"
            BeginProperty Font 
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
            Left            =   5760
            TabIndex        =   11
            Top             =   3480
            Width           =   855
         End
         Begin VB.CheckBox chkAhNameCFD 
            Alignment       =   1  'Right Justify
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            Caption         =   "C/F:"
            BeginProperty Font 
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
            Left            =   5760
            TabIndex        =   13
            Top             =   3840
            Width           =   855
         End
         Begin VB.CheckBox chkPttRegNoAddModeChange 
            Alignment       =   1  'Right Justify
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            Caption         =   "Allow Changing Patient RegNo. in Add Mode:"
            BeginProperty Font 
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
            TabIndex        =   3
            Top             =   840
            Width           =   4935
         End
         Begin VB.CheckBox chkPttRegNoEditModeChange 
            Alignment       =   1  'Right Justify
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            Caption         =   "Allow Changing Patient RegNo. in Edit Mode:"
            BeginProperty Font 
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
            TabIndex        =   4
            Top             =   1200
            Width           =   4935
         End
         Begin VB.CheckBox chkPttRegNoNotZero 
            Alignment       =   1  'Right Justify
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            Caption         =   "Patient RegNo. not to be Zero:"
            BeginProperty Font 
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
            TabIndex        =   5
            Top             =   1560
            Width           =   4935
         End
         Begin VB.Label Label2 
            Alignment       =   2  'Center
            Caption         =   "Default Value Allocation"
            BeginProperty Font 
               Name            =   "Verdana"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   255
            Index           =   15
            Left            =   240
            TabIndex        =   107
            Top             =   2160
            Width           =   6375
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
            Index           =   8
            Left            =   240
            TabIndex        =   106
            Top             =   3120
            Width           =   1695
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
            Index           =   7
            Left            =   240
            TabIndex        =   105
            Top             =   2760
            Width           =   1695
         End
         Begin VB.Label Label2 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Account Head:"
            BeginProperty Font 
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
            Left            =   240
            TabIndex        =   104
            Top             =   3840
            Width           =   1695
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
            Index           =   4
            Left            =   240
            TabIndex        =   103
            Top             =   3480
            Width           =   1695
         End
      End
      Begin VB.Frame frOutdReg 
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFFC0&
         Caption         =   "Outdoor Registration (2):"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   6495
         Left            =   120
         TabIndex        =   92
         Top             =   840
         Width           =   12255
         Begin VB.TextBox mskOpgRegValidDays 
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
            Left            =   4320
            TabIndex        =   18
            Tag             =   "AhCode"
            Text            =   "0"
            Top             =   1920
            Width           =   855
         End
         Begin VB.CheckBox chkPttRegNoNotZero 
            Alignment       =   1  'Right Justify
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            Caption         =   "Patient RegNo. not to be Zero:"
            BeginProperty Font 
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
            Left            =   240
            TabIndex        =   17
            Top             =   1560
            Width           =   4935
         End
         Begin VB.CheckBox chkPttRegNoEditModeChange 
            Alignment       =   1  'Right Justify
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            Caption         =   "Allow Changing Patient RegNo. in Edit Mode:"
            BeginProperty Font 
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
            Left            =   240
            TabIndex        =   16
            Top             =   1200
            Width           =   4935
         End
         Begin VB.CheckBox chkPttRegNoAddModeChange 
            Alignment       =   1  'Right Justify
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            Caption         =   "Allow Changing Patient RegNo. in Add Mode:"
            BeginProperty Font 
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
            Left            =   240
            TabIndex        =   15
            Top             =   840
            Width           =   4935
         End
         Begin VB.CheckBox chkSrvNameCFD 
            Alignment       =   1  'Right Justify
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            Caption         =   "C/F:"
            BeginProperty Font 
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
            Left            =   5760
            TabIndex        =   36
            Top             =   5640
            Width           =   855
         End
         Begin VB.CheckBox chkFDigNameCFD 
            Alignment       =   1  'Right Justify
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            Caption         =   "C/F:"
            BeginProperty Font 
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
            Left            =   5760
            TabIndex        =   34
            Top             =   5280
            Width           =   855
         End
         Begin VB.CheckBox chkRByNameCFD 
            Alignment       =   1  'Right Justify
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            Caption         =   "C/F:"
            BeginProperty Font 
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
            Left            =   5760
            TabIndex        =   32
            Top             =   4920
            Width           =   855
         End
         Begin VB.CheckBox chkCDctNameCFD 
            Alignment       =   1  'Right Justify
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            Caption         =   "C/F:"
            BeginProperty Font 
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
            Left            =   5760
            TabIndex        =   30
            Top             =   4560
            Width           =   855
         End
         Begin VB.CheckBox chkVtmNameCFD 
            Alignment       =   1  'Right Justify
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            Caption         =   "C/F:"
            BeginProperty Font 
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
            Left            =   5760
            TabIndex        =   28
            Top             =   4200
            Width           =   855
         End
         Begin VB.CheckBox chkAhNameCFD 
            Alignment       =   1  'Right Justify
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            Caption         =   "C/F:"
            BeginProperty Font 
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
            Left            =   5760
            TabIndex        =   26
            Top             =   3840
            Width           =   855
         End
         Begin VB.CheckBox chkPcgNameCFD 
            Alignment       =   1  'Right Justify
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            Caption         =   "C/F:"
            BeginProperty Font 
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
            Left            =   5760
            TabIndex        =   24
            Top             =   3480
            Width           =   855
         End
         Begin VB.CheckBox chkStnNameCFD 
            Alignment       =   1  'Right Justify
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            Caption         =   "C/F:"
            BeginProperty Font 
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
            Left            =   5760
            TabIndex        =   22
            Top             =   3120
            Width           =   855
         End
         Begin VB.CheckBox chkAraNameCFD 
            Alignment       =   1  'Right Justify
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            Caption         =   "C/F:"
            BeginProperty Font 
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
            Left            =   5760
            TabIndex        =   20
            Top             =   2760
            Width           =   855
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
            Index           =   2
            Left            =   2040
            MaxLength       =   50
            TabIndex        =   23
            Top             =   3480
            Width           =   3615
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
            Index           =   2
            Left            =   2040
            MaxLength       =   50
            TabIndex        =   25
            Top             =   3840
            Width           =   3615
         End
         Begin VB.TextBox txtAraName 
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
            Index           =   2
            Left            =   2040
            MaxLength       =   50
            TabIndex        =   19
            Top             =   2760
            Width           =   3615
         End
         Begin VB.TextBox txtStnName 
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
            Left            =   2040
            MaxLength       =   50
            TabIndex        =   21
            Top             =   3120
            Width           =   3615
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
            Index           =   2
            Left            =   2040
            MaxLength       =   50
            TabIndex        =   27
            Top             =   4200
            Width           =   3615
         End
         Begin VB.TextBox txtCDctName 
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
            Index           =   2
            Left            =   2040
            MaxLength       =   50
            TabIndex        =   29
            Top             =   4560
            Width           =   3615
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
            Index           =   2
            Left            =   2040
            MaxLength       =   50
            TabIndex        =   31
            Top             =   4920
            Width           =   3615
         End
         Begin VB.TextBox txtFDigName 
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
            Index           =   2
            Left            =   2040
            MaxLength       =   50
            TabIndex        =   33
            Top             =   5280
            Width           =   3615
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
            Index           =   2
            Left            =   2040
            MaxLength       =   50
            TabIndex        =   35
            Top             =   5640
            Width           =   3615
         End
         Begin VB.CheckBox chkPttRegNoAutoNumber 
            Alignment       =   1  'Right Justify
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            Caption         =   "Patient Reg.No. AutoNumbering"
            BeginProperty Font 
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
            Left            =   240
            TabIndex        =   14
            Top             =   480
            Width           =   4935
         End
         Begin VB.Label Label2 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Outdoor Registration Validity (Days):"
            BeginProperty Font 
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
            Left            =   240
            TabIndex        =   108
            Top             =   1920
            Width           =   3975
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
            Index           =   2
            Left            =   240
            TabIndex        =   102
            Top             =   5640
            Width           =   1695
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
            Left            =   240
            TabIndex        =   101
            Top             =   3480
            Width           =   1695
         End
         Begin VB.Label Label2 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Account Head:"
            BeginProperty Font 
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
            Left            =   240
            TabIndex        =   100
            Top             =   3840
            Width           =   1695
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
            Left            =   240
            TabIndex        =   99
            Top             =   2760
            Width           =   1695
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
            Left            =   240
            TabIndex        =   98
            Top             =   3120
            Width           =   1695
         End
         Begin VB.Label Label2 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "OPD Type:"
            BeginProperty Font 
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
            TabIndex        =   97
            Top             =   4200
            Width           =   1935
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
            Left            =   240
            TabIndex        =   96
            Top             =   4560
            Width           =   1815
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
            Left            =   240
            TabIndex        =   95
            Top             =   4920
            Width           =   1695
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
            Left            =   240
            TabIndex        =   94
            Top             =   5280
            Width           =   1695
         End
         Begin VB.Label Label2 
            Alignment       =   2  'Center
            Caption         =   "Default Value Allocation"
            BeginProperty Font 
               Name            =   "Verdana"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   255
            Index           =   0
            Left            =   240
            TabIndex        =   93
            Top             =   2400
            Width           =   6375
         End
      End
      Begin VB.Frame frOutdRcpt 
         Appearance      =   0  'Flat
         BackColor       =   &H00F0FDEB&
         Caption         =   "Outdoor Receipt (3):"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   6495
         Left            =   120
         TabIndex        =   109
         Top             =   840
         Width           =   12255
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
            Index           =   3
            Left            =   2040
            MaxLength       =   50
            TabIndex        =   38
            Top             =   1800
            Width           =   3615
         End
         Begin VB.CheckBox chkVtmNameCFD 
            Alignment       =   1  'Right Justify
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            Caption         =   "C/F:"
            BeginProperty Font 
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
            Left            =   5760
            TabIndex        =   39
            Top             =   1800
            Width           =   855
         End
         Begin VB.CheckBox chkPttRegNoNotZero 
            Alignment       =   1  'Right Justify
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            Caption         =   "Patient RegNo. not to be Zero:"
            BeginProperty Font 
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
            TabIndex        =   37
            Top             =   600
            Width           =   4335
         End
         Begin VB.Label Label2 
            Alignment       =   2  'Center
            Caption         =   "Default Value Allocation"
            BeginProperty Font 
               Name            =   "Verdana"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   255
            Index           =   40
            Left            =   240
            TabIndex        =   111
            Top             =   1200
            Width           =   6375
         End
         Begin VB.Label Label2 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Receipt Type:"
            BeginProperty Font 
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
            Index           =   36
            Left            =   240
            TabIndex        =   110
            Top             =   1800
            Width           =   1815
         End
      End
      Begin VB.Frame frServRateSystem 
         Appearance      =   0  'Flat
         BackColor       =   &H00F4FFF6&
         Caption         =   "Service Charges/Share System (9)"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   6495
         Left            =   120
         TabIndex        =   118
         Top             =   840
         Width           =   12255
         Begin VB.CheckBox chkTimewseServShareSys 
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
            TabIndex        =   78
            Top             =   4560
            Width           =   5055
         End
         Begin VB.CheckBox chkRTowseServShareSys 
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
            TabIndex        =   77
            Top             =   4200
            Width           =   5055
         End
         Begin VB.CheckBox chkRBywseServShareSys 
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
            TabIndex        =   76
            Top             =   3840
            Width           =   5055
         End
         Begin VB.CheckBox chkPcgwseServShareSys 
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
            TabIndex        =   75
            Top             =   3480
            Width           =   5055
         End
         Begin VB.CheckBox chkDctwseServShareSys 
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
            TabIndex        =   74
            Top             =   3120
            Width           =   5055
         End
         Begin VB.CheckBox chkExtServShareSys 
            Alignment       =   1  'Right Justify
            Appearance      =   0  'Flat
            BackColor       =   &H00C0C0C0&
            Caption         =   "Extended Service Share System"
            BeginProperty Font 
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
            TabIndex        =   73
            Top             =   2760
            Width           =   5055
         End
         Begin VB.CheckBox chkTimewseServBargSys 
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
            TabIndex        =   72
            Top             =   2160
            Width           =   5055
         End
         Begin VB.CheckBox chkRTowseServBargSys 
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
            TabIndex        =   71
            Top             =   1800
            Width           =   5055
         End
         Begin VB.CheckBox chkRBywseServBargSys 
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
            TabIndex        =   70
            Top             =   1440
            Width           =   5055
         End
         Begin VB.CheckBox chkPcgwseServBargSys 
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
            TabIndex        =   69
            Top             =   1080
            Width           =   5055
         End
         Begin VB.CheckBox chkDctwseServBargSys 
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
            TabIndex        =   68
            Top             =   720
            Width           =   5055
         End
         Begin VB.CheckBox chkExtServBargSys 
            Alignment       =   1  'Right Justify
            Appearance      =   0  'Flat
            BackColor       =   &H00C0C0C0&
            Caption         =   "Extended Service Bargain System"
            BeginProperty Font 
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
            TabIndex        =   67
            Top             =   360
            Width           =   5055
         End
         Begin VB.CheckBox chkTimewseServDiscSys 
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
            TabIndex        =   66
            Top             =   4560
            Width           =   5055
         End
         Begin VB.CheckBox chkTimewseServRateSys 
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
            TabIndex        =   60
            Top             =   2160
            Width           =   5055
         End
         Begin VB.CheckBox chkRTowseServDiscSys 
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
            TabIndex        =   65
            Top             =   4200
            Width           =   5055
         End
         Begin VB.CheckBox chkRBywseServDiscSys 
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
            TabIndex        =   64
            Top             =   3840
            Width           =   5055
         End
         Begin VB.CheckBox chkPcgwseServDiscSys 
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
            TabIndex        =   63
            Top             =   3480
            Width           =   5055
         End
         Begin VB.CheckBox chkDctwseServDiscSys 
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
            TabIndex        =   62
            Top             =   3120
            Width           =   5055
         End
         Begin VB.CheckBox chkExtServDiscSys 
            Alignment       =   1  'Right Justify
            Appearance      =   0  'Flat
            BackColor       =   &H00C0C0C0&
            Caption         =   "Extended Service Discount System"
            BeginProperty Font 
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
            TabIndex        =   61
            Top             =   2760
            Width           =   5055
         End
         Begin VB.CheckBox chkRTowseServRateSys 
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
            TabIndex        =   59
            Top             =   1800
            Width           =   5055
         End
         Begin VB.CheckBox chkRBywseServRateSys 
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
            TabIndex        =   58
            Top             =   1440
            Width           =   5055
         End
         Begin VB.CheckBox chkPcgwseServRateSys 
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
            TabIndex        =   57
            Top             =   1080
            Width           =   5055
         End
         Begin VB.CheckBox chkDctwseServRateSys 
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
            TabIndex        =   56
            Top             =   720
            Width           =   5055
         End
         Begin VB.CheckBox chkExtServRateSys 
            Alignment       =   1  'Right Justify
            Appearance      =   0  'Flat
            BackColor       =   &H00C0C0C0&
            Caption         =   "Extended Service Rate System"
            BeginProperty Font 
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
            TabIndex        =   55
            Top             =   360
            Width           =   5055
         End
      End
      Begin VB.Frame frOutdBlRefd 
         Appearance      =   0  'Flat
         BackColor       =   &H00FAFDEB&
         Caption         =   "Outdoor Bill Refund Receipt (8):"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   6495
         Left            =   120
         TabIndex        =   125
         Top             =   840
         Width           =   12255
         Begin VB.CheckBox chkPttRegNoNotZero 
            Alignment       =   1  'Right Justify
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            Caption         =   "Patient RegNo. not to be Zero:"
            BeginProperty Font 
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
            Left            =   240
            TabIndex        =   52
            Top             =   600
            Width           =   4335
         End
         Begin VB.CheckBox chkVtmNameCFD 
            Alignment       =   1  'Right Justify
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            Caption         =   "C/F:"
            BeginProperty Font 
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
            Left            =   5760
            TabIndex        =   54
            Top             =   1800
            Width           =   855
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
            Index           =   8
            Left            =   2040
            MaxLength       =   50
            TabIndex        =   53
            Top             =   1800
            Width           =   3615
         End
         Begin VB.Label Label2 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Bill Refund Type:"
            BeginProperty Font 
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
            Left            =   240
            TabIndex        =   127
            Top             =   1800
            Width           =   1815
         End
         Begin VB.Label Label2 
            Alignment       =   2  'Center
            Caption         =   "Default Value Allocation"
            BeginProperty Font 
               Name            =   "Verdana"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   255
            Index           =   14
            Left            =   240
            TabIndex        =   126
            Top             =   1200
            Width           =   6375
         End
      End
      Begin VB.Frame frOutdRefd 
         Appearance      =   0  'Flat
         BackColor       =   &H00FAF4BE&
         Caption         =   "Outdoor Refund Receipt (5):"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   6495
         Left            =   120
         TabIndex        =   115
         Top             =   840
         Width           =   12255
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
            Index           =   5
            Left            =   2040
            MaxLength       =   50
            TabIndex        =   44
            Top             =   1800
            Width           =   3615
         End
         Begin VB.CheckBox chkVtmNameCFD 
            Alignment       =   1  'Right Justify
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            Caption         =   "C/F:"
            BeginProperty Font 
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
            Left            =   5760
            TabIndex        =   45
            Top             =   1800
            Width           =   855
         End
         Begin VB.CheckBox chkPttRegNoNotZero 
            Alignment       =   1  'Right Justify
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            Caption         =   "Patient RegNo. not to be Zero:"
            BeginProperty Font 
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
            Left            =   240
            TabIndex        =   43
            Top             =   600
            Width           =   4335
         End
         Begin VB.Label Label2 
            Alignment       =   2  'Center
            Caption         =   "Default Value Allocation"
            BeginProperty Font 
               Name            =   "Verdana"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   255
            Index           =   33
            Left            =   240
            TabIndex        =   117
            Top             =   1200
            Width           =   6375
         End
         Begin VB.Label Label2 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Receipt Type:"
            BeginProperty Font 
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
            Index           =   32
            Left            =   240
            TabIndex        =   116
            Top             =   1800
            Width           =   1815
         End
      End
      Begin VB.Frame frOutdBlPymt 
         Appearance      =   0  'Flat
         BackColor       =   &H00C2E1FF&
         Caption         =   "Outdoor Bill Payment Receipt (7):"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   6495
         Left            =   120
         TabIndex        =   122
         Top             =   840
         Width           =   12255
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
            Index           =   7
            Left            =   2040
            MaxLength       =   50
            TabIndex        =   50
            Top             =   1800
            Width           =   3615
         End
         Begin VB.CheckBox chkVtmNameCFD 
            Alignment       =   1  'Right Justify
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            Caption         =   "C/F:"
            BeginProperty Font 
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
            Left            =   5760
            TabIndex        =   51
            Top             =   1800
            Width           =   855
         End
         Begin VB.CheckBox chkPttRegNoNotZero 
            Alignment       =   1  'Right Justify
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            Caption         =   "Patient RegNo. not to be Zero:"
            BeginProperty Font 
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
            Left            =   240
            TabIndex        =   49
            Top             =   600
            Width           =   4335
         End
         Begin VB.Label Label2 
            Alignment       =   2  'Center
            Caption         =   "Default Value Allocation"
            BeginProperty Font 
               Name            =   "Verdana"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   255
            Index           =   13
            Left            =   240
            TabIndex        =   124
            Top             =   1200
            Width           =   6375
         End
         Begin VB.Label Label2 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Bill Payment Type:"
            BeginProperty Font 
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
            Left            =   240
            TabIndex        =   123
            Top             =   1800
            Width           =   1815
         End
      End
      Begin VB.Frame frOutdPymt 
         Appearance      =   0  'Flat
         BackColor       =   &H00D0F4EE&
         Caption         =   "Outdoor Payment Receipt (4):"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   6495
         Left            =   120
         TabIndex        =   112
         Top             =   840
         Width           =   12255
         Begin VB.CheckBox chkPttRegNoNotZero 
            Alignment       =   1  'Right Justify
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            Caption         =   "Patient RegNo. not to be Zero:"
            BeginProperty Font 
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
            TabIndex        =   40
            Top             =   600
            Width           =   4335
         End
         Begin VB.CheckBox chkVtmNameCFD 
            Alignment       =   1  'Right Justify
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            Caption         =   "C/F:"
            BeginProperty Font 
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
            Left            =   5760
            TabIndex        =   42
            Top             =   1800
            Width           =   855
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
            Index           =   4
            Left            =   2040
            MaxLength       =   50
            TabIndex        =   41
            Top             =   1800
            Width           =   3615
         End
         Begin VB.Label Label2 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Receipt Type:"
            BeginProperty Font 
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
            Index           =   31
            Left            =   240
            TabIndex        =   114
            Top             =   1800
            Width           =   1815
         End
         Begin VB.Label Label2 
            Alignment       =   2  'Center
            Caption         =   "Default Value Allocation"
            BeginProperty Font 
               Name            =   "Verdana"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   255
            Index           =   30
            Left            =   240
            TabIndex        =   113
            Top             =   1200
            Width           =   6375
         End
      End
      Begin VB.Frame frOutdBill 
         Appearance      =   0  'Flat
         BackColor       =   &H00E5F4EE&
         Caption         =   "Outdoor Bill (6):"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   6495
         Left            =   120
         TabIndex        =   119
         Top             =   840
         Width           =   12255
         Begin VB.CheckBox chkPttRegNoNotZero 
            Alignment       =   1  'Right Justify
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            Caption         =   "Patient RegNo. not to be Zero:"
            BeginProperty Font 
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
            Left            =   240
            TabIndex        =   46
            Top             =   600
            Width           =   4335
         End
         Begin VB.CheckBox chkVtmNameCFD 
            Alignment       =   1  'Right Justify
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            Caption         =   "C/F:"
            BeginProperty Font 
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
            Left            =   5760
            TabIndex        =   48
            Top             =   1800
            Width           =   855
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
            Index           =   6
            Left            =   2040
            MaxLength       =   50
            TabIndex        =   47
            Top             =   1800
            Width           =   3615
         End
         Begin VB.Label Label2 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Bill Type:"
            BeginProperty Font 
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
            Left            =   240
            TabIndex        =   121
            Top             =   1800
            Width           =   1815
         End
         Begin VB.Label Label2 
            Alignment       =   2  'Center
            Caption         =   "Default Value Allocation"
            BeginProperty Font 
               Name            =   "Verdana"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   255
            Index           =   3
            Left            =   240
            TabIndex        =   120
            Top             =   1200
            Width           =   6375
         End
      End
   End
   Begin VB.TextBox txtVoid 
      CausesValidation=   0   'False
      Height          =   375
      Left            =   0
      TabIndex        =   80
      TabStop         =   0   'False
      Text            =   "Void"
      Top             =   9000
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
      TabIndex        =   87
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
      TabIndex        =   86
      TabStop         =   0   'False
      Top             =   0
      Width           =   255
   End
   Begin VB.ComboBox cmbFormEntryMode 
      Appearance      =   0  'Flat
      Enabled         =   0   'False
      Height          =   315
      Left            =   0
      Style           =   1  'Simple Combo
      TabIndex        =   85
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
      Height          =   5535
      Left            =   1320
      TabIndex        =   83
      Top             =   720
      Width           =   9855
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
         TabIndex        =   90
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
         TabIndex        =   88
         Top             =   360
         Width           =   4215
      End
      Begin MSFlexGridLib.MSFlexGrid Mfgrd1 
         Height          =   4335
         Left            =   120
         TabIndex        =   89
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
         TabIndex        =   91
         Top             =   360
         Width           =   735
      End
   End
   Begin VB.Label lblFormHeading 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00E0E0E0&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Hospital Outdoor Options"
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
      TabIndex        =   82
      Top             =   0
      Width           =   9015
   End
End
Attribute VB_Name = "frmVgnOpdOptions"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Dim mFormLoaded As Boolean, mLastKeyPressed As Integer, mMaskKeyPressed As Integer
Dim mOptCode As Long
Dim mRemoteAccess As Boolean, mEntrySaved As Boolean, mEntryAborted As Boolean
Dim dbVgnDatabase As New ADODB.Connection, dbAcDatabase As New ADODB.Connection
'Dim datRecset As New ADODB.Recordset
Dim mOptName_old As String
Dim clsOPT As clsVgnOpdOptionsEntry, mActiveControl As Object, clsListStru As clsSelectQueryStructure

Dim fcmbAraName As clsComFlexSearch, fcmbStnName As clsComFlexSearch, fcmbAhName As clsComFlexSearch, fcmbVtmName As clsComFlexSearch
Dim fcmbPcgName As clsVgnFlexSearch, fcmbCDctName As clsVgnFlexSearch, fcmbRByName As clsVgnFlexSearch, fcmbFDigName As clsVgnFlexSearch, fcmbSrvName As clsVgnFlexSearch

Const cOPT_PATMAST = 1
Const cOPT_OUTDREG = 2
Const cOPT_OUTDRCPT = 3
Const cOPT_OUTDPYMT = 4
Const cOPT_OUTDREFD = 5
Const cOPT_OUTDBILL = 6
Const cOPT_OUTDBLPYMT = 7
Const cOPT_OUTDBLREFD = 8
Const cOPT_SERVRATESYS = 9

'Public Property Let RemoteAccessCode(ByVal mAccessCode As Long)
'mRemoteAccess = True
'mOptCode = mAccessCode
'End Property

Public Property Get EntryBoundCode() As Long
EntryBoundCode = Val(mskFormBoundField.Text)
End Property

Public Property Get EntrySaved() As Boolean
EntrySaved = mEntrySaved
End Property

Public Property Get EntryAborted() As Boolean
EntryAborted = mEntryAborted
End Property

Public Property Get OptName() As String
OptName = txtOptName.Text
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

Private Sub chkAhNameCFD_GotFocus(Index As Integer)
FlashActiveControl chkAhNameCFD(Index), True
End Sub

Private Sub chkAhNameCFD_LostFocus(Index As Integer)
FlashActiveControl chkAhNameCFD(Index), False
End Sub

Private Sub chkAraNameCFD_GotFocus(Index As Integer)
FlashActiveControl chkAraNameCFD(Index), True
End Sub

Private Sub chkAraNameCFD_LostFocus(Index As Integer)
FlashActiveControl chkAraNameCFD(Index), False
End Sub

Private Sub chkCDctNameCFD_GotFocus(Index As Integer)
FlashActiveControl chkCDctNameCFD(Index), True
End Sub

Private Sub chkCDctNameCFD_LostFocus(Index As Integer)
FlashActiveControl chkCDctNameCFD(Index), False
End Sub

Private Sub chkExtServRateSys_GotFocus()
FlashActiveControl chkExtServRateSys, True
End Sub

Private Sub chkExtServRateSys_LostFocus()
FlashActiveControl chkExtServRateSys, False
chkExtServRateSys.BackColor = vbButtonShadow
End Sub

Private Sub chkDctwseServRateSys_GotFocus()
FlashActiveControl chkDctwseServRateSys, True
End Sub

Private Sub chkDctwseServRateSys_LostFocus()
FlashActiveControl chkDctwseServRateSys, False
End Sub

Private Sub chkPcgwseServRateSys_GotFocus()
FlashActiveControl chkPcgwseServRateSys, True
End Sub

Private Sub chkPcgwseServRateSys_LostFocus()
FlashActiveControl chkPcgwseServRateSys, False
End Sub

Private Sub chkRBywseServRateSys_GotFocus()
FlashActiveControl chkRBywseServRateSys, True
End Sub

Private Sub chkRBywseServRateSys_LostFocus()
FlashActiveControl chkRBywseServRateSys, False
End Sub

Private Sub chkRTowseServRateSys_GotFocus()
FlashActiveControl chkRTowseServRateSys, True
End Sub

Private Sub chkRTowseServRateSys_LostFocus()
FlashActiveControl chkRTowseServRateSys, False
End Sub

Private Sub chkTimewseServRateSys_GotFocus()
FlashActiveControl chkTimewseServRateSys, True
End Sub

Private Sub chkTimewseServRateSys_LostFocus()
FlashActiveControl chkTimewseServRateSys, False
End Sub

Private Sub chkExtServDiscSys_GotFocus()
FlashActiveControl chkExtServDiscSys, True
End Sub

Private Sub chkExtServDiscSys_LostFocus()
FlashActiveControl chkExtServDiscSys, False
chkExtServDiscSys.BackColor = vbButtonShadow
End Sub

Private Sub chkDctwseServDiscSys_GotFocus()
FlashActiveControl chkDctwseServDiscSys, True
End Sub

Private Sub chkDctwseServDiscSys_LostFocus()
FlashActiveControl chkDctwseServDiscSys, False
End Sub

Private Sub chkPcgwseServDiscSys_GotFocus()
FlashActiveControl chkPcgwseServDiscSys, True
End Sub

Private Sub chkPcgwseServDiscSys_LostFocus()
FlashActiveControl chkPcgwseServDiscSys, False
End Sub

Private Sub chkRBywseServDiscSys_GotFocus()
FlashActiveControl chkRBywseServDiscSys, True
End Sub

Private Sub chkRBywseServDiscSys_LostFocus()
FlashActiveControl chkRBywseServDiscSys, False
End Sub

Private Sub chkRTowseServDiscSys_GotFocus()
FlashActiveControl chkRTowseServDiscSys, True
End Sub

Private Sub chkRTowseServDiscSys_LostFocus()
FlashActiveControl chkRTowseServDiscSys, False
End Sub

Private Sub chkTimewseServDiscSys_GotFocus()
FlashActiveControl chkTimewseServDiscSys, True
End Sub

Private Sub chkTimewseServDiscSys_LostFocus()
FlashActiveControl chkTimewseServDiscSys, False
End Sub

Private Sub chkExtServBargSys_GotFocus()
FlashActiveControl chkExtServBargSys, True
End Sub

Private Sub chkExtServBargSys_LostFocus()
FlashActiveControl chkExtServBargSys, False
chkExtServBargSys.BackColor = vbButtonShadow
End Sub

Private Sub chkDctwseServBargSys_GotFocus()
FlashActiveControl chkDctwseServBargSys, True
End Sub

Private Sub chkDctwseServBargSys_LostFocus()
FlashActiveControl chkDctwseServBargSys, False
End Sub

Private Sub chkPcgwseServBargSys_GotFocus()
FlashActiveControl chkPcgwseServBargSys, True
End Sub

Private Sub chkPcgwseServBargSys_LostFocus()
FlashActiveControl chkPcgwseServBargSys, False
End Sub

Private Sub chkRBywseServBargSys_GotFocus()
FlashActiveControl chkRBywseServBargSys, True
End Sub

Private Sub chkRBywseServBargSys_LostFocus()
FlashActiveControl chkRBywseServBargSys, False
End Sub

Private Sub chkRTowseServBargSys_GotFocus()
FlashActiveControl chkRTowseServBargSys, True
End Sub

Private Sub chkRTowseServBargSys_LostFocus()
FlashActiveControl chkRTowseServBargSys, False
End Sub

Private Sub chkTimewseServBargSys_GotFocus()
FlashActiveControl chkTimewseServBargSys, True
End Sub

Private Sub chkTimewseServBargSys_LostFocus()
FlashActiveControl chkTimewseServBargSys, False
End Sub

Private Sub chkExtServShareSys_GotFocus()
FlashActiveControl chkExtServShareSys, True
End Sub

Private Sub chkExtServShareSys_LostFocus()
FlashActiveControl chkExtServShareSys, False
chkExtServShareSys.BackColor = vbButtonShadow
End Sub

Private Sub chkDctwseServShareSys_GotFocus()
FlashActiveControl chkDctwseServShareSys, True
End Sub

Private Sub chkDctwseServShareSys_LostFocus()
FlashActiveControl chkDctwseServShareSys, False
End Sub

Private Sub chkPcgwseServShareSys_GotFocus()
FlashActiveControl chkPcgwseServShareSys, True
End Sub

Private Sub chkPcgwseServShareSys_LostFocus()
FlashActiveControl chkPcgwseServShareSys, False
End Sub

Private Sub chkRBywseServShareSys_GotFocus()
FlashActiveControl chkRBywseServShareSys, True
End Sub

Private Sub chkRBywseServShareSys_LostFocus()
FlashActiveControl chkRBywseServShareSys, False
End Sub

Private Sub chkRTowseServShareSys_GotFocus()
FlashActiveControl chkRTowseServShareSys, True
End Sub

Private Sub chkRTowseServShareSys_LostFocus()
FlashActiveControl chkRTowseServShareSys, False
End Sub

Private Sub chkTimewseServShareSys_GotFocus()
FlashActiveControl chkTimewseServShareSys, True
End Sub

Private Sub chkTimewseServShareSys_LostFocus()
FlashActiveControl chkTimewseServShareSys, False
End Sub

Private Sub chkFDigNameCFD_GotFocus(Index As Integer)
FlashActiveControl chkFDigNameCFD(Index), True
End Sub

Private Sub chkFDigNameCFD_LostFocus(Index As Integer)
FlashActiveControl chkFDigNameCFD(Index), False
End Sub

Private Sub chkPttRegNoAutoNumber_GotFocus(Index As Integer)
FlashActiveControl chkPttRegNoAutoNumber(Index), True
End Sub

Private Sub chkPttRegNoAutoNumber_LostFocus(Index As Integer)
FlashActiveControl chkPttRegNoAutoNumber(Index), False
End Sub

Private Sub chkPttRegNoAddModeChange_GotFocus(Index As Integer)
FlashActiveControl chkPttRegNoAddModeChange(Index), True
End Sub

Private Sub chkPttRegNoAddModeChange_LostFocus(Index As Integer)
FlashActiveControl chkPttRegNoAddModeChange(Index), False
End Sub

Private Sub chkPttRegNoEditModeChange_GotFocus(Index As Integer)
FlashActiveControl chkPttRegNoEditModeChange(Index), True
End Sub

Private Sub chkPttRegNoEditModeChange_LostFocus(Index As Integer)
FlashActiveControl chkPttRegNoEditModeChange(Index), False
End Sub

Private Sub chkPttRegNoNotZero_GotFocus(Index As Integer)
FlashActiveControl chkPttRegNoNotZero(Index), True
End Sub

Private Sub chkPttRegNoNotZero_LostFocus(Index As Integer)
FlashActiveControl chkPttRegNoNotZero(Index), False
End Sub

Private Sub chkPcgNameCFD_GotFocus(Index As Integer)
FlashActiveControl chkPcgNameCFD(Index), True
End Sub

Private Sub chkPcgNameCFD_LostFocus(Index As Integer)
FlashActiveControl chkPcgNameCFD(Index), False
End Sub

Private Sub chkRByNameCFD_GotFocus(Index As Integer)
FlashActiveControl chkRByNameCFD(Index), True
End Sub

Private Sub chkRByNameCFD_LostFocus(Index As Integer)
FlashActiveControl chkRByNameCFD(Index), False
End Sub

Private Sub chkSrvNameCFD_GotFocus(Index As Integer)
FlashActiveControl chkSrvNameCFD(Index), True
End Sub

Private Sub chkSrvNameCFD_LostFocus(Index As Integer)
FlashActiveControl chkSrvNameCFD(Index), False
End Sub

Private Sub chkStnNameCFD_GotFocus(Index As Integer)
FlashActiveControl chkStnNameCFD(Index), True
End Sub

Private Sub chkStnNameCFD_LostFocus(Index As Integer)
FlashActiveControl chkStnNameCFD(Index), False
End Sub

Private Sub chkVtmNameCFD_GotFocus(Index As Integer)
FlashActiveControl chkVtmNameCFD(Index), True
End Sub

Private Sub chkVtmNameCFD_LostFocus(Index As Integer)
FlashActiveControl chkVtmNameCFD(Index), False
End Sub

Private Sub cmdFormEnter_Click()
mLastKeyPressed = 13
If FormAddEditMode = cFORM_SMRYMODE Then
    If IsFlexNewRow(Mfgrd1, Mfgrd1.Row) = False Then
        Call Data_EditEvent
    End If
    'With datRecset
    'If .EOF = False And .BOF = False Then
    '    Call Data_EditEvent
    'Else
    '    Call Data_AddEvent
    'End If
    'End With
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
Else
    txtVoid.SetFocus
    If CanReject() = True Then
        mEntryAborted = True
        'mRecAbsPos = datRecset.AbsolutePosition
        'Call Data_CancelEvent
        'Call SmryList
        'If datRecset.RecordCount > mRecAbsPos And mRecAbsPos > 0 Then
        '    datRecset.Move mRecAbsPos - 1, Start:=1
        'Else
        '    MoveRecToLast datRecset
        'End If
        'ShowRecActiveFlexRow datRecset, Mfgrd1
        
        Call ShowEntryMode(False)
        If mRemoteAccess = True Then
            Me.Hide
            ''Unload Me
            Exit Sub
        Else
            Mfgrd1.SetFocus
        End If
    Else
        Call SetControlFocus
    End If

End If

End Sub

Private Sub cmdSaveForm_Click()
Call Data_SaveEvent

'Call SmryList
txtSearch1Text_InterActiveChange txtOptName.Text

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
        Call SetControlFocus
    End If
End If
cmdSaveForm.Enabled = True

End Sub

Private Sub Form_Activate()
If mFormLoaded = False Then
    If mRemoteAccess = True Then
        If mOptCode = 0 Then
            'Call Data_AddEvent
        Else
            Call Data_EditEvent
        End If
    Else
        'MoveRecToFirst datRecset
        'ShowRecActiveFlexRow datRecset, Mfgrd1
        Mfgrd1.Row = Mfgrd1.FixedRows
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
mFormLoaded = False
mEntrySaved = False: mEntryAborted = False
SetFormSize Me, frmMain
Call Form_Resize

Call SetVoidControl(txtVoid)
txtSearch1Text.Enabled = False

OpenVgnDataSource dbVgnDatabase
OpenAcDataSource dbAcDatabase

Set clsOPT = New clsVgnOpdOptionsEntry
Set clsListStru = New clsSelectQueryStructure

Set fcmbAhName = New clsComFlexSearch
Set fcmbAhName.dbAcDatabase = dbAcDatabase
fcmbAhName.blnAchdMastList = True
fcmbAhName.Init

Set fcmbPcgName = New clsVgnFlexSearch
Set fcmbPcgName.dbVgnDatabase = dbVgnDatabase
fcmbPcgName.blnPatCatgMstList = True
fcmbPcgName.Init

Set fcmbAraName = New clsComFlexSearch
Set fcmbAraName.dbAcDatabase = dbAcDatabase
fcmbAraName.blnAreaMastList = True
fcmbAraName.Init

Set fcmbStnName = New clsComFlexSearch
Set fcmbStnName.dbAcDatabase = dbAcDatabase
fcmbStnName.blnStationMastList = True
fcmbStnName.Init

Set fcmbVtmName = New clsComFlexSearch
Set fcmbVtmName.dbAcDatabase = dbAcDatabase
fcmbVtmName.blnVTypeMastList = True
fcmbVtmName.mListSqlExpr = "Select * from VTypMast order by VtmName"
fcmbVtmName.Init

Set fcmbCDctName = New clsVgnFlexSearch
Set fcmbCDctName.dbVgnDatabase = dbVgnDatabase
fcmbCDctName.blnDoctMastList = True
fcmbCDctName.Init

Set fcmbRByName = New clsVgnFlexSearch
Set fcmbRByName.dbVgnDatabase = dbVgnDatabase
fcmbRByName.blnRefByMastList = True
fcmbRByName.Init

Set fcmbFDigName = New clsVgnFlexSearch
Set fcmbFDigName.dbVgnDatabase = dbVgnDatabase
fcmbFDigName.blnDiagMastList = True
fcmbFDigName.Init

Set fcmbSrvName = New clsVgnFlexSearch
Set fcmbSrvName.dbVgnDatabase = dbVgnDatabase
fcmbSrvName.blnServMastList = True
fcmbSrvName.Init

If mRemoteAccess = True Then
    'datRecset.Open "Select * from DoctCatgMst where DcgCode=" & CStr(mOptCode) & " order by OptName", dbAcDatabase, adOpenKeyset, adLockOptimistic
Else
    'datRecset.Open "Select * from DoctCatgMst order by OptName", dbAcDatabase, adOpenKeyset, adLockOptimistic
End If
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
Set clsOPT = Nothing
Set fcmbAraName = Nothing
Set fcmbStnName = Nothing
Set fcmbAhName = Nothing
Set fcmbVtmName = Nothing
Set fcmbPcgName = Nothing
Set fcmbCDctName = Nothing
Set fcmbRByName = Nothing
Set fcmbFDigName = Nothing
Set fcmbSrvName = Nothing

Set clsListStru = Nothing

'CloseTable datRecset
CloseDataSource dbVgnDatabase
CloseDataSource dbAcDatabase
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
Select Case mOptCode
Case cOPT_PATMAST
    frPatMast.ZOrder
Case cOPT_OUTDREG
    frOutdReg.ZOrder
Case cOPT_OUTDRCPT
    frOutdRcpt.ZOrder
Case cOPT_OUTDPYMT
    frOutdPymt.ZOrder
Case cOPT_OUTDREFD
    frOutdRefd.ZOrder
Case cOPT_OUTDBILL
    frOutdBill.ZOrder
Case cOPT_OUTDBLPYMT
    frOutdBlPymt.ZOrder
Case cOPT_OUTDBLREFD
    frOutdBlRefd.ZOrder
Case cOPT_SERVRATESYS
    frServRateSystem.ZOrder
End Select
frPatMast.Visible = EntryMode And mOptCode = cOPT_PATMAST: frPatMast.Enabled = EntryMode And mOptCode = cOPT_PATMAST
frOutdReg.Visible = EntryMode And mOptCode = cOPT_OUTDREG: frOutdReg.Enabled = EntryMode And mOptCode = cOPT_OUTDREG
frOutdRcpt.Visible = EntryMode And mOptCode = cOPT_OUTDRCPT: frOutdRcpt.Enabled = EntryMode And mOptCode = cOPT_OUTDRCPT
frOutdPymt.Visible = EntryMode And mOptCode = cOPT_OUTDPYMT: frOutdPymt.Enabled = EntryMode And mOptCode = cOPT_OUTDPYMT
frOutdRefd.Visible = EntryMode And mOptCode = cOPT_OUTDREFD: frOutdRefd.Enabled = EntryMode And mOptCode = cOPT_OUTDREFD
frOutdBill.Visible = EntryMode And mOptCode = cOPT_OUTDBILL: frOutdBill.Enabled = EntryMode And mOptCode = cOPT_OUTDBILL
frOutdBlPymt.Visible = EntryMode And mOptCode = cOPT_OUTDBLPYMT: frOutdBlPymt.Enabled = EntryMode And mOptCode = cOPT_OUTDBLPYMT
frOutdBlRefd.Visible = EntryMode And mOptCode = cOPT_OUTDBLREFD: frOutdBlRefd.Enabled = EntryMode And mOptCode = cOPT_OUTDBLREFD
frServRateSystem.Visible = EntryMode And mOptCode = cOPT_SERVRATESYS: frServRateSystem.Enabled = EntryMode And mOptCode = cOPT_SERVRATESYS

End Sub

Private Function Data_Verify() As Boolean
Data_Verify = False
'If Val(mskFormBoundField.Text) < 1 Then
'    ErrorBox "Invalid Key Value !!!"
'    txtOptName.SetFocus
'    Exit Function
'End If
'If Trim(txtOptName.Text) = "" Then
'    ErrorBox "Invalid Operator Name !!!"
'    txtOptName.SetFocus
'    Exit Function
'End If
'If txtOptName.Text <> mOptName_old Then
'    If ChkIsDuplicate(dbAcDatabase, "DoctCatgMst", "OptName", txtOptName.Text, "DcgCode", Val(mskFormBoundField.Text)) = True Then
'        ErrorBox "Duplicate Input !!!"
'        txtOptName.SetFocus
'        Exit Function
'    End If
'End If

Data_Verify = True
End Function

Private Sub mskOpgRegValidDays_GotFocus()
FlashActiveControl mskOpgRegValidDays, True
End Sub

Private Sub mskOpgRegValidDays_LostFocus()
FlashActiveControl mskOpgRegValidDays, False
End Sub

Private Sub mskOpgRegValidDays_Validate(Cancel As Boolean)
mskOpgRegValidDays.Text = Val(mskOpgRegValidDays.Text)
If Val(mskOpgRegValidDays.Text) < 0 Then
    ErrorBox "Invalid Input !!!"
    mskOpgRegValidDays.SetFocus
    Cancel = True
End If

End Sub

Private Sub txtAhName_Change(Index As Integer)
If fcmbAhName.CallFromText_Change = False Then
    fcmbAhName.CallFromText_Change = True
    If InterActiveChange(txtAhName(Index)) = True Then
        fcmbAhName.UserText = Array(txtAhName(Index).Text, txtAhName(Index).SelStart)
        fcmbAhName.Show
        txtAhName(Index).Text = fcmbAhName.Text
        If fcmbAhName.ListSelected = True Then
            SendKeys "{tab}"
        End If
    End If
    fcmbAhName.CallFromText_Change = False
End If

End Sub

Private Sub txtAhName_GotFocus(Index As Integer)
FlashActiveControl txtAhName(Index), True
End Sub

Private Sub txtAhName_KeyDown(Index As Integer, KeyCode As Integer, Shift As Integer)
If MyDropDownKey(Shift, KeyCode) = True Then
    txtAhName_Change Index
End If

End Sub

Private Sub txtAhName_LostFocus(Index As Integer)
FlashActiveControl txtAhName(Index), False
End Sub

Private Sub txtAraName_Change(Index As Integer)
If fcmbAraName.CallFromText_Change = False Then
    fcmbAraName.CallFromText_Change = True
    If InterActiveChange(txtAraName(Index)) = True Then
        fcmbAraName.UserText = Array(txtAraName(Index).Text, txtAraName(Index).SelStart)
        fcmbAraName.Show
        txtAraName(Index).Text = fcmbAraName.Text
        If fcmbAraName.ListSelected = True Then
            SendKeys "{tab}"
        End If
    End If
    fcmbAraName.CallFromText_Change = False
End If

End Sub

Private Sub txtAraName_GotFocus(Index As Integer)
FlashActiveControl txtAraName(Index), True
End Sub

Private Sub txtAraName_KeyDown(Index As Integer, KeyCode As Integer, Shift As Integer)
If MyDropDownKey(Shift, KeyCode) = True Then
    txtAraName_Change Index
End If

End Sub

Private Sub txtAraName_LostFocus(Index As Integer)
FlashActiveControl txtAraName(Index), False
End Sub

Private Sub txtAraName_Validate(Index As Integer, Cancel As Boolean)
If Val(fcmbAraName.BoundText) = 0 Then
    fcmbStnName.BoundText = "": txtStnName(Index).Text = ""
Else
    AutoInitStationFromArea cnn:=dbAcDatabase, txtStnName:=txtStnName(Index), fcmbStnName:=fcmbStnName, mAraCode:=Val(fcmbAraName.BoundText)
End If

End Sub

Private Sub txtCDctName_Change(Index As Integer)
If fcmbCDctName.CallFromText_Change = False Then
    fcmbCDctName.CallFromText_Change = True
    If InterActiveChange(txtCDctName(Index)) = True Then
        fcmbCDctName.UserText = Array(txtCDctName(Index).Text, txtCDctName(Index).SelStart)
        fcmbCDctName.Show
        txtCDctName(Index).Text = fcmbCDctName.Text
        If fcmbCDctName.ListSelected = True Then
            SendKeys "{tab}"
        End If
    End If
    fcmbCDctName.CallFromText_Change = False
End If

End Sub

Private Sub txtCDctName_GotFocus(Index As Integer)
FlashActiveControl txtCDctName(Index), True
End Sub

Private Sub txtCDctName_KeyDown(Index As Integer, KeyCode As Integer, Shift As Integer)
If MyDropDownKey(Shift, KeyCode) = True Then
    txtCDctName_Change Index
End If

End Sub

Private Sub txtCDctName_LostFocus(Index As Integer)
FlashActiveControl txtCDctName(Index), False
End Sub

Private Sub txtFDigName_Change(Index As Integer)
If fcmbFDigName.CallFromText_Change = False Then
    fcmbFDigName.CallFromText_Change = True
    If InterActiveChange(txtFDigName(Index)) = True Then
        fcmbFDigName.UserText = Array(txtFDigName(Index).Text, txtFDigName(Index).SelStart)
        fcmbFDigName.Show
        txtFDigName(Index).Text = fcmbFDigName.Text
        If fcmbFDigName.ListSelected = True Then
            SendKeys "{tab}"
        End If
    End If
    fcmbFDigName.CallFromText_Change = False
End If

End Sub

Private Sub txtFDigName_GotFocus(Index As Integer)
FlashActiveControl txtFDigName(Index), True
End Sub

Private Sub txtFDigName_KeyDown(Index As Integer, KeyCode As Integer, Shift As Integer)
If MyDropDownKey(Shift, KeyCode) = True Then
    txtFDigName_Change Index
End If

End Sub

Private Sub txtFDigName_LostFocus(Index As Integer)
FlashActiveControl txtFDigName(Index), False
End Sub

Private Sub txtOptName_GotFocus()
FlashActiveControl txtOptName, True
End Sub

Private Sub txtOptName_LostFocus()
FlashActiveControl txtOptName, False
End Sub

Private Sub Data_EditEvent()
Dim mLCount As Integer, mUCount As Integer, mCount As Integer, srow As Integer

mEntrySaved = False: mEntryAborted = False
FormAddEditMode = cFORM_EDITMODE
'With datRecset

srow = Mfgrd1.Row
mOptCode = Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("OptCode"))
mskFormBoundField.Text = mOptCode
txtOptName.Text = Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("OptName"))
Select Case mOptCode
Case cOPT_PATMAST
    With clsOPT
    .ResetInit
    .blnPatMastOptMast = True
    .Init
    .GetPatMastOptData
    
    chkPttRegNoAutoNumber(mOptCode).Value = IIf(.mPttRegNoAutoNumber_bln = True, vbChecked, vbUnchecked)
    chkPttRegNoAddModeChange(mOptCode).Value = IIf(.mPttRegNoAddModeChange_bln = True, vbChecked, vbUnchecked)
    chkPttRegNoEditModeChange(mOptCode).Value = IIf(.mPttRegNoEditModeChange_bln = True, vbChecked, vbUnchecked)
    chkPttRegNoNotZero(mOptCode).Value = IIf(.mPttRegNoNotZero_bln = True, vbChecked, vbUnchecked)
    fcmbAraName.BoundText = CStr(.mPttAraCodeDef_lng): txtAraName(mOptCode).Text = fcmbAraName.Text
    fcmbStnName.BoundText = CStr(.mPttStnCodeDef_lng): txtStnName(mOptCode).Text = fcmbStnName.Text
    fcmbPcgName.BoundText = CStr(.mPttPcgCodeDef_lng): txtPcgName(mOptCode).Text = fcmbPcgName.Text
    fcmbAhName.BoundText = CStr(.mPttAhCodeDef_lng): txtAhName(mOptCode).Text = fcmbAhName.Text
    ' ---------------
    chkAraNameCFD(mOptCode).Value = IIf(.mPttAraCodeCfd_bln = True, vbChecked, vbUnchecked)
    chkStnNameCFD(mOptCode).Value = IIf(.mPttStnCodeCfd_bln = True, vbChecked, vbUnchecked)
    chkPcgNameCFD(mOptCode).Value = IIf(.mPttPcgCodeCfd_bln = True, vbChecked, vbUnchecked)
    chkAhNameCFD(mOptCode).Value = IIf(.mPttAhCodeCfd_bln = True, vbChecked, vbUnchecked)
    End With

Case cOPT_OUTDREG
    With clsOPT
    .ResetInit
    .blnOutdRegOptMast = True
    .Init
    .GetOutdRegOptData
    
    fcmbVtmName.mListSqlExpr = "Select * from VTypMast where VtmSysCode=" & CStr(cVGN_VTYPE_OUTDOOR_REG) & " order by VtmName"
    fcmbVtmName.ReInit
    
    chkPttRegNoAutoNumber(mOptCode).Value = IIf(.mOpgPttRegNoAutoNumber_bln = True, vbChecked, vbUnchecked)
    chkPttRegNoAddModeChange(mOptCode).Value = IIf(.mOpgPttRegNoAddModeChange_bln = True, vbChecked, vbUnchecked)
    chkPttRegNoEditModeChange(mOptCode).Value = IIf(.mOpgPttRegNoEditModeChange_bln = True, vbChecked, vbUnchecked)
    chkPttRegNoNotZero(mOptCode).Value = IIf(.mOpgPttRegNoNotZero_bln = True, vbChecked, vbUnchecked)
    mskOpgRegValidDays.Text = .mOpgRegValidDays_int
    fcmbAraName.BoundText = CStr(.mOpgAraCodeDef_lng): txtAraName(mOptCode).Text = fcmbAraName.Text
    fcmbStnName.BoundText = CStr(.mOpgStnCodeDef_lng): txtStnName(mOptCode).Text = fcmbStnName.Text
    fcmbPcgName.BoundText = CStr(.mOpgPcgCodeDef_lng): txtPcgName(mOptCode).Text = fcmbPcgName.Text
    fcmbAhName.BoundText = CStr(.mOpgPttAhCodeDef_lng): txtAhName(mOptCode).Text = fcmbAhName.Text
    fcmbVtmName.BoundText = CStr(.mOpgVtmCodeDef_lng): txtVtmName(mOptCode).Text = fcmbVtmName.Text
    fcmbCDctName.BoundText = CStr(.mOpgCDctCodeDef_lng): txtCDctName(mOptCode).Text = fcmbCDctName.Text
    fcmbRByName.BoundText = CStr(.mOpgRByCodeDef_lng): txtRByName(mOptCode).Text = fcmbRByName.Text
    fcmbFDigName.BoundText = CStr(.mOpgFDigCodeDef_lng): txtFDigName(mOptCode).Text = fcmbFDigName.Text
    fcmbSrvName.BoundText = CStr(.mOpgSrvCodeDef_lng): txtSrvName(mOptCode).Text = fcmbSrvName.Text
    ' ---------------
    chkAraNameCFD(mOptCode).Value = IIf(.mOpgAraCodeCfd_bln = True, vbChecked, vbUnchecked)
    chkStnNameCFD(mOptCode).Value = IIf(.mOpgStnCodeCfd_bln = True, vbChecked, vbUnchecked)
    chkPcgNameCFD(mOptCode).Value = IIf(.mOpgPcgCodeCfd_bln = True, vbChecked, vbUnchecked)
    chkAhNameCFD(mOptCode).Value = IIf(.mOpgPttAhCodeCfd_bln = True, vbChecked, vbUnchecked)
    chkVtmNameCFD(mOptCode).Value = IIf(.mOpgVtmCodeCfd_bln = True, vbChecked, vbUnchecked)
    chkCDctNameCFD(mOptCode).Value = IIf(.mOpgCDctCodeCfd_bln = True, vbChecked, vbUnchecked)
    chkRByNameCFD(mOptCode).Value = IIf(.mOpgRByCodeCfd_bln = True, vbChecked, vbUnchecked)
    chkFDigNameCFD(mOptCode).Value = IIf(.mOpgFDigCodeCfd_bln = True, vbChecked, vbUnchecked)
    chkSrvNameCFD(mOptCode).Value = IIf(.mOpgSrvCodeCfd_bln = True, vbChecked, vbUnchecked)
    End With
    
Case cOPT_OUTDRCPT
    With clsOPT
    .ResetInit
    .blnOutdRcptOptMast = True
    .Init
    .GetOutdRcptOptData
    
    fcmbVtmName.mListSqlExpr = "Select * from VTypMast where VtmSysCode=" & CStr(cVGN_VTYPE_OUTDOOR_RCPT) & " order by VtmName"
    fcmbVtmName.ReInit
    
    chkPttRegNoNotZero(mOptCode).Value = IIf(.mOrcPttRegNoNotZero_bln = True, vbChecked, vbUnchecked)
    fcmbVtmName.BoundText = CStr(.mOrcVtmCodeDef_lng): txtVtmName(mOptCode).Text = fcmbVtmName.Text
    ' ---------------
    chkVtmNameCFD(mOptCode).Value = IIf(.mOrcVtmCodeCfd_bln = True, vbChecked, vbUnchecked)
    End With
    
Case cOPT_OUTDPYMT
    With clsOPT
    .ResetInit
    .blnOutdPymtOptMast = True
    .Init
    .GetOutdPymtOptData
    
    fcmbVtmName.mListSqlExpr = "Select * from VTypMast where VtmSysCode=" & CStr(cVGN_VTYPE_OUTDOOR_PYMT) & " order by VtmName"
    fcmbVtmName.ReInit
    
    chkPttRegNoNotZero(mOptCode).Value = IIf(.mOpyPttRegNoNotZero_bln = True, vbChecked, vbUnchecked)
    fcmbVtmName.BoundText = CStr(.mOpyVtmCodeDef_lng): txtVtmName(mOptCode).Text = fcmbVtmName.Text
    ' ---------------
    chkVtmNameCFD(mOptCode).Value = IIf(.mOpyVtmCodeCfd_bln = True, vbChecked, vbUnchecked)
    End With
    
Case cOPT_OUTDREFD
    With clsOPT
    .ResetInit
    .blnOutdRefdOptMast = True
    .Init
    .GetOutdRefdOptData
    
    fcmbVtmName.mListSqlExpr = "Select * from VTypMast where VtmSysCode=" & CStr(cVGN_VTYPE_OUTDOOR_REFD) & " order by VtmName"
    fcmbVtmName.ReInit
    
    chkPttRegNoNotZero(mOptCode).Value = IIf(.mOfdPttRegNoNotZero_bln = True, vbChecked, vbUnchecked)
    fcmbVtmName.BoundText = CStr(.mOfdVtmCodeDef_lng): txtVtmName(mOptCode).Text = fcmbVtmName.Text
    ' ---------------
    chkVtmNameCFD(mOptCode).Value = IIf(.mOfdVtmCodeCfd_bln = True, vbChecked, vbUnchecked)
    End With
    
Case cOPT_OUTDBILL
    With clsOPT
    .ResetInit
    .blnOutdBillOptMast = True
    .Init
    .GetOutdBillOptData
    
    fcmbVtmName.mListSqlExpr = "Select * from VTypMast where VtmSysCode=" & CStr(cVGN_VTYPE_OUTDOOR_BILL) & " order by VtmName"
    fcmbVtmName.ReInit
    
    chkPttRegNoNotZero(mOptCode).Value = IIf(.mOblPttRegNoNotZero_bln = True, vbChecked, vbUnchecked)
    fcmbVtmName.BoundText = CStr(.mOblVtmCodeDef_lng): txtVtmName(mOptCode).Text = fcmbVtmName.Text
    ' ---------------
    chkVtmNameCFD(mOptCode).Value = IIf(.mOblVtmCodeCfd_bln = True, vbChecked, vbUnchecked)
    End With
    
Case cOPT_OUTDBLPYMT
    With clsOPT
    .ResetInit
    .blnOutdBlPymtOptMast = True
    .Init
    .GetOutdBlPymtOptData
    
    fcmbVtmName.mListSqlExpr = "Select * from VTypMast where VtmSysCode=" & CStr(cVGN_VTYPE_OUTDOOR_BLPYMT) & " order by VtmName"
    fcmbVtmName.ReInit
    
    chkPttRegNoNotZero(mOptCode).Value = IIf(.mObpyPttRegNoNotZero_bln = True, vbChecked, vbUnchecked)
    fcmbVtmName.BoundText = CStr(.mObpyVtmCodeDef_lng): txtVtmName(mOptCode).Text = fcmbVtmName.Text
    ' ---------------
    chkVtmNameCFD(mOptCode).Value = IIf(.mObpyVtmCodeCfd_bln = True, vbChecked, vbUnchecked)
    End With
    
Case cOPT_OUTDBLREFD
    With clsOPT
    .ResetInit
    .blnOutdBlRefdOptMast = True
    .Init
    .GetOutdBlRefdOptData
    
    fcmbVtmName.mListSqlExpr = "Select * from VTypMast where VtmSysCode=" & CStr(cVGN_VTYPE_OUTDOOR_BLREFD) & " order by VtmName"
    fcmbVtmName.ReInit
    
    chkPttRegNoNotZero(mOptCode).Value = IIf(.mObfdPttRegNoNotZero_bln = True, vbChecked, vbUnchecked)
    fcmbVtmName.BoundText = CStr(.mObfdVtmCodeDef_lng): txtVtmName(mOptCode).Text = fcmbVtmName.Text
    ' ---------------
    chkVtmNameCFD(mOptCode).Value = IIf(.mObfdVtmCodeCfd_bln = True, vbChecked, vbUnchecked)
    End With
    
Case cOPT_SERVRATESYS
    With clsOPT
    .ResetInit
    .blnServRateSysOptMast = True
    .Init
    .GetServRateSysOptData
    
    chkExtServRateSys.Value = IIf(.mExtServRateSys_bln = True, vbChecked, vbUnchecked)
    chkDctwseServRateSys.Value = IIf(.mDctwseServRateSys_bln = True, vbChecked, vbUnchecked)
    chkPcgwseServRateSys.Value = IIf(.mPcgwseServRateSys_bln = True, vbChecked, vbUnchecked)
    chkRBywseServRateSys.Value = IIf(.mRBywseServRateSys_bln = True, vbChecked, vbUnchecked)
    chkRTowseServRateSys.Value = IIf(.mRTowseServRateSys_bln = True, vbChecked, vbUnchecked)
    chkTimewseServRateSys.Value = IIf(.mTimewseServRateSys_bln = True, vbChecked, vbUnchecked)
    ' -------------------------------------------------------------------------
    chkExtServDiscSys.Value = IIf(.mExtServDiscSys_bln = True, vbChecked, vbUnchecked)
    chkDctwseServDiscSys.Value = IIf(.mDctwseServDiscSys_bln = True, vbChecked, vbUnchecked)
    chkPcgwseServDiscSys.Value = IIf(.mPcgwseServDiscSys_bln = True, vbChecked, vbUnchecked)
    chkRBywseServDiscSys.Value = IIf(.mRBywseServDiscSys_bln = True, vbChecked, vbUnchecked)
    chkRTowseServDiscSys.Value = IIf(.mRTowseServDiscSys_bln = True, vbChecked, vbUnchecked)
    chkTimewseServDiscSys.Value = IIf(.mTimewseServDiscSys_bln = True, vbChecked, vbUnchecked)
    ' -------------------------------------------------------------------------
    chkExtServBargSys.Value = IIf(.mExtServBargSys_bln = True, vbChecked, vbUnchecked)
    chkDctwseServBargSys.Value = IIf(.mDctwseServBargSys_bln = True, vbChecked, vbUnchecked)
    chkPcgwseServBargSys.Value = IIf(.mPcgwseServBargSys_bln = True, vbChecked, vbUnchecked)
    chkRBywseServBargSys.Value = IIf(.mRBywseServBargSys_bln = True, vbChecked, vbUnchecked)
    chkRTowseServBargSys.Value = IIf(.mRTowseServBargSys_bln = True, vbChecked, vbUnchecked)
    chkTimewseServBargSys.Value = IIf(.mTimewseServBargSys_bln = True, vbChecked, vbUnchecked)
    ' -------------------------------------------------------------------------
    chkExtServShareSys.Value = IIf(.mExtServShareSys_bln = True, vbChecked, vbUnchecked)
    chkDctwseServShareSys.Value = IIf(.mDctwseServShareSys_bln = True, vbChecked, vbUnchecked)
    chkPcgwseServShareSys.Value = IIf(.mPcgwseServShareSys_bln = True, vbChecked, vbUnchecked)
    chkRBywseServShareSys.Value = IIf(.mRBywseServShareSys_bln = True, vbChecked, vbUnchecked)
    chkRTowseServShareSys.Value = IIf(.mRTowseServShareSys_bln = True, vbChecked, vbUnchecked)
    chkTimewseServShareSys.Value = IIf(.mTimewseServShareSys_bln = True, vbChecked, vbUnchecked)
    ' -------------------------------------------------------------------------
    End With
    
Case Else
    ErrorBox Me.Name & "_Data_EditEvent_#649_[Undefined Case]"
End Select

mOptName_old = txtOptName.Text
    
Call ShowEntryMode(True)

Call SetControlFocus

End Sub

Private Sub Data_SaveEvent()
With clsOPT
If FormAddEditMode = cFORM_ADDMODE Then
    .Clear
Else
    If mOptCode = cOPT_PATMAST Then
        .GetPatMastOptData
    ElseIf mOptCode = cOPT_OUTDREG Then
        .GetOutdRegOptData
    ElseIf mOptCode = cOPT_OUTDRCPT Then
        .GetOutdRcptOptData
    ElseIf mOptCode = cOPT_OUTDPYMT Then
        .GetOutdPymtOptData
    ElseIf mOptCode = cOPT_OUTDREFD Then
        .GetOutdRefdOptData
    ElseIf mOptCode = cOPT_OUTDBILL Then
        .GetOutdBillOptData
    ElseIf mOptCode = cOPT_OUTDBLPYMT Then
        .GetOutdBlPymtOptData
    ElseIf mOptCode = cOPT_OUTDBLREFD Then
        .GetOutdBlRefdOptData
    ElseIf mOptCode = cOPT_SERVRATESYS Then
        .GetServRateSysOptData
    Else
        ErrorBox Me.Name & "_Data_SaveEvent_#716_[Undefined Case]"
    End If
End If
If mOptCode = cOPT_PATMAST Then
    .mPttRegNoAutoNumber_bln = (chkPttRegNoAutoNumber(mOptCode).Value = vbChecked)
    .mPttRegNoAddModeChange_bln = (chkPttRegNoAddModeChange(mOptCode).Value = vbChecked)
    .mPttRegNoEditModeChange_bln = (chkPttRegNoEditModeChange(mOptCode).Value = vbChecked)
    .mPttRegNoNotZero_bln = (chkPttRegNoNotZero(mOptCode).Value = vbChecked)
    .mPttAraCodeDef_lng = Val(fcmbAraName.BoundText)
    .mPttStnCodeDef_lng = Val(fcmbStnName.BoundText)
    .mPttPcgCodeDef_lng = Val(fcmbPcgName.BoundText)
    .mPttAhCodeDef_lng = Val(fcmbAhName.BoundText)
    ' ---------------
    .mPttAraCodeCfd_bln = (chkAraNameCFD(mOptCode).Value = vbChecked)
    .mPttStnCodeCfd_bln = (chkStnNameCFD(mOptCode).Value = vbChecked)
    .mPttPcgCodeCfd_bln = (chkPcgNameCFD(mOptCode).Value = vbChecked)
    .mPttAhCodeCfd_bln = (chkAhNameCFD(mOptCode).Value = vbChecked)
    
    .UpdatePatMastOpt
    mEntrySaved = True

ElseIf mOptCode = cOPT_OUTDREG Then
    .mOpgPttRegNoAutoNumber_bln = (chkPttRegNoAutoNumber(mOptCode).Value = vbChecked)
    .mOpgPttRegNoAddModeChange_bln = (chkPttRegNoAddModeChange(mOptCode).Value = vbChecked)
    .mOpgPttRegNoEditModeChange_bln = (chkPttRegNoEditModeChange(mOptCode).Value = vbChecked)
    .mOpgPttRegNoNotZero_bln = (chkPttRegNoNotZero(mOptCode).Value = vbChecked)
    .mOpgRegValidDays_int = Val(mskOpgRegValidDays.Text)
    .mOpgAraCodeDef_lng = Val(fcmbAraName.BoundText)
    .mOpgStnCodeDef_lng = Val(fcmbStnName.BoundText)
    .mOpgPcgCodeDef_lng = Val(fcmbPcgName.BoundText)
    .mOpgPttAhCodeDef_lng = Val(fcmbAhName.BoundText)
    .mOpgVtmCodeDef_lng = Val(fcmbVtmName.BoundText)
    .mOpgCDctCodeDef_lng = Val(fcmbCDctName.BoundText)
    .mOpgRByCodeDef_lng = Val(fcmbRByName.BoundText)
    .mOpgFDigCodeDef_lng = Val(fcmbFDigName.BoundText)
    .mOpgSrvCodeDef_lng = Val(fcmbSrvName.BoundText)
    ' ---------------
    .mOpgAraCodeCfd_bln = (chkAraNameCFD(mOptCode).Value = vbChecked)
    .mOpgStnCodeCfd_bln = (chkStnNameCFD(mOptCode).Value = vbChecked)
    .mOpgPcgCodeCfd_bln = (chkPcgNameCFD(mOptCode).Value = vbChecked)
    .mOpgPttAhCodeCfd_bln = (chkAhNameCFD(mOptCode).Value = vbChecked)
    .mOpgVtmCodeCfd_bln = (chkVtmNameCFD(mOptCode).Value = vbChecked)
    .mOpgCDctCodeCfd_bln = (chkCDctNameCFD(mOptCode).Value = vbChecked)
    .mOpgRByCodeCfd_bln = (chkRByNameCFD(mOptCode).Value = vbChecked)
    .mOpgFDigCodeCfd_bln = (chkFDigNameCFD(mOptCode).Value = vbChecked)
    .mOpgSrvCodeCfd_bln = (chkSrvNameCFD(mOptCode).Value = vbChecked)

    .UpdateOutdRegOpt
    mEntrySaved = True
   
ElseIf mOptCode = cOPT_OUTDRCPT Then
    .mOrcPttRegNoNotZero_bln = (chkPttRegNoNotZero(mOptCode).Value = vbChecked)
    .mOrcVtmCodeDef_lng = Val(fcmbVtmName.BoundText)
    ' ---------------
    .mOrcVtmCodeCfd_bln = (chkVtmNameCFD(mOptCode).Value = vbChecked)

    .UpdateOutdRcptOpt
    mEntrySaved = True
    
ElseIf mOptCode = cOPT_OUTDPYMT Then
    .mOpyPttRegNoNotZero_bln = (chkPttRegNoNotZero(mOptCode).Value = vbChecked)
    .mOpyVtmCodeDef_lng = Val(fcmbVtmName.BoundText)
    ' ---------------
    .mOpyVtmCodeCfd_bln = (chkVtmNameCFD(mOptCode).Value = vbChecked)
    
    .UpdateOutdPymtOpt
    mEntrySaved = True

ElseIf mOptCode = cOPT_OUTDREFD Then
    .mOfdPttRegNoNotZero_bln = (chkPttRegNoNotZero(mOptCode).Value = vbChecked)
    .mOfdVtmCodeDef_lng = Val(fcmbVtmName.BoundText)
    ' ---------------
    .mOfdVtmCodeCfd_bln = (chkVtmNameCFD(mOptCode).Value = vbChecked)
    
    .UpdateOutdRefdOpt
    mEntrySaved = True

ElseIf mOptCode = cOPT_OUTDBILL Then
    .mOblPttRegNoNotZero_bln = (chkPttRegNoNotZero(mOptCode).Value = vbChecked)
    .mOblVtmCodeDef_lng = Val(fcmbVtmName.BoundText)
    ' ---------------
    .mOblVtmCodeCfd_bln = (chkVtmNameCFD(mOptCode).Value = vbChecked)

    .UpdateOutdBillOpt
    mEntrySaved = True
    
ElseIf mOptCode = cOPT_OUTDBLPYMT Then
    .mObpyPttRegNoNotZero_bln = (chkPttRegNoNotZero(mOptCode).Value = vbChecked)
    .mObpyVtmCodeDef_lng = Val(fcmbVtmName.BoundText)
    ' ---------------
    .mObpyVtmCodeCfd_bln = (chkVtmNameCFD(mOptCode).Value = vbChecked)
    
    .UpdateOutdBlPymtOpt
    mEntrySaved = True

ElseIf mOptCode = cOPT_OUTDBLREFD Then
    .mObfdPttRegNoNotZero_bln = (chkPttRegNoNotZero(mOptCode).Value = vbChecked)
    .mObfdVtmCodeDef_lng = Val(fcmbVtmName.BoundText)
    ' ---------------
    .mObfdVtmCodeCfd_bln = (chkVtmNameCFD(mOptCode).Value = vbChecked)
    
    .UpdateOutdBlRefdOpt
    mEntrySaved = True

ElseIf mOptCode = cOPT_SERVRATESYS Then
    .mExtServRateSys_bln = (chkExtServRateSys.Value = vbChecked)
    .mDctwseServRateSys_bln = (chkDctwseServRateSys.Value = vbChecked)
    .mPcgwseServRateSys_bln = (chkPcgwseServRateSys.Value = vbChecked)
    .mRBywseServRateSys_bln = (chkRBywseServRateSys.Value = vbChecked)
    .mRTowseServRateSys_bln = (chkRTowseServRateSys.Value = vbChecked)
    .mTimewseServRateSys_bln = (chkTimewseServRateSys.Value = vbChecked)
    ' ------------------------------------------------------------
    .mExtServDiscSys_bln = (chkExtServDiscSys.Value = vbChecked)
    .mDctwseServDiscSys_bln = (chkDctwseServDiscSys.Value = vbChecked)
    .mPcgwseServDiscSys_bln = (chkPcgwseServDiscSys.Value = vbChecked)
    .mRBywseServDiscSys_bln = (chkRBywseServDiscSys.Value = vbChecked)
    .mRTowseServDiscSys_bln = (chkRTowseServDiscSys.Value = vbChecked)
    .mTimewseServDiscSys_bln = (chkTimewseServDiscSys.Value = vbChecked)
    ' ------------------------------------------------------------
    .mExtServBargSys_bln = (chkExtServBargSys.Value = vbChecked)
    .mDctwseServBargSys_bln = (chkDctwseServBargSys.Value = vbChecked)
    .mPcgwseServBargSys_bln = (chkPcgwseServBargSys.Value = vbChecked)
    .mRBywseServBargSys_bln = (chkRBywseServBargSys.Value = vbChecked)
    .mRTowseServBargSys_bln = (chkRTowseServBargSys.Value = vbChecked)
    .mTimewseServBargSys_bln = (chkTimewseServBargSys.Value = vbChecked)
    ' ------------------------------------------------------------
    .mExtServShareSys_bln = (chkExtServShareSys.Value = vbChecked)
    .mDctwseServShareSys_bln = (chkDctwseServShareSys.Value = vbChecked)
    .mPcgwseServShareSys_bln = (chkPcgwseServShareSys.Value = vbChecked)
    .mRBywseServShareSys_bln = (chkRBywseServShareSys.Value = vbChecked)
    .mRTowseServShareSys_bln = (chkRTowseServShareSys.Value = vbChecked)
    .mTimewseServShareSys_bln = (chkTimewseServShareSys.Value = vbChecked)
    ' ------------------------------------------------------------
    
    .UpdateExtServRateOpt
    mEntrySaved = True
    
    Call InitVgnServRateSysParaOpt

Else
    'Call Data_CancelEvent
    'AlertBox "Entry Cancelled !!!"
    ErrorBox Me.Name & "_Data_SaveEvent_#796_[Undefined Case]"
End If

End With

End Sub

Private Sub Data_DeleteEvent()
Dim mDeleteit As Boolean, mRecAbsPos As Long
'If (datRecset.EOF Or datRecset.BOF) = True Then
'    Exit Sub
'End If

'mOptCode = datRecset.Fields("DcgCode")
'mRecAbsPos = datRecset.AbsolutePosition
'
'If clsOPT.CanDeleteMast(mOptCode) = True Then
'    txtVoid.SetFocus
'    If clsOPT.BeginMast(mOptCode) = True Then
'        clsOPT.DeleteMast mOptCode
'        clsOPT.UpdateMast mOptCode
'        clsOPT.EndMast mOptCode
'
'        Call SmryList
'        If datRecset.RecordCount > mRecAbsPos And mRecAbsPos > 0 Then
'            datRecset.Move mRecAbsPos - 1, 1
'        Else
'            MoveRecToLast datRecset
'        End If
'    End If
'    ShowRecActiveFlexRow datRecset, Mfgrd1
'    Mfgrd1.SetFocus
'Else
'    Mfgrd1.SetFocus
'End If

End Sub

Private Sub Data_CancelEvent()
'clsOPT.CancelMast mOptCode
'clsOPT.EndMast mOptCode
mEntryAborted = True

End Sub

Private Sub SmryList()
Dim gcolcount As Integer, acount As Integer, mLow As Integer, mHigh As Integer, mPos As Integer, srow As Long, mColCount As Integer

clsListStru.Clear

Rem column definitions
clsListStru.AddFields mExpr:="OptCode", mAttrib:=cFAT_SYSTEM
clsListStru.AddFields mExpr:="OptName", mTitle:="Option Name", mAlign:=1, mWidth:=4000, mShowItem:=True

RefreshDatabase dbVgnDatabase
RefreshDatabase dbAcDatabase
'datRecset.Requery

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
'MoveRecToFirst datRecset
'With datRecset
'If .RecordCount > 0 Then
'    Do While .EOF = False
        ' --------------------------------
        Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("OptCode")) = cOPT_PATMAST
        Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("OptName")) = "Patient Registration"
        ' --------------------------------
        srow = srow + 1
        If Mfgrd1.Rows < srow + 1 Then
            Mfgrd1.Rows = Mfgrd1.Rows + 1
        End If
        Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("OptCode")) = cOPT_OUTDREG
        Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("OptName")) = "Outdoor Registration"
        ' --------------------------------
        srow = srow + 1
        If Mfgrd1.Rows < srow + 1 Then
            Mfgrd1.Rows = Mfgrd1.Rows + 1
        End If
        Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("OptCode")) = cOPT_OUTDRCPT
        Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("OptName")) = "Outdoor Receipt"
        ' --------------------------------
        srow = srow + 1
        If Mfgrd1.Rows < srow + 1 Then
            Mfgrd1.Rows = Mfgrd1.Rows + 1
        End If
        Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("OptCode")) = cOPT_OUTDPYMT
        Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("OptName")) = "Outdoor Payment"
        ' --------------------------------
        srow = srow + 1
        If Mfgrd1.Rows < srow + 1 Then
            Mfgrd1.Rows = Mfgrd1.Rows + 1
        End If
        Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("OptCode")) = cOPT_OUTDREFD
        Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("OptName")) = "Outdoor Refund"
        ' --------------------------------
        srow = srow + 1
        If Mfgrd1.Rows < srow + 1 Then
            Mfgrd1.Rows = Mfgrd1.Rows + 1
        End If
        Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("OptCode")) = cOPT_OUTDBILL
        Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("OptName")) = "Outdoor Bill"
        ' --------------------------------
        srow = srow + 1
        If Mfgrd1.Rows < srow + 1 Then
            Mfgrd1.Rows = Mfgrd1.Rows + 1
        End If
        Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("OptCode")) = cOPT_OUTDBLPYMT
        Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("OptName")) = "Outdoor Bill Payment"
        ' --------------------------------
        srow = srow + 1
        If Mfgrd1.Rows < srow + 1 Then
            Mfgrd1.Rows = Mfgrd1.Rows + 1
        End If
        Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("OptCode")) = cOPT_OUTDBLREFD
        Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("OptName")) = "Outdoor Bill Refund"
        ' --------------------------------
        srow = srow + 1
        If Mfgrd1.Rows < srow + 1 Then
            Mfgrd1.Rows = Mfgrd1.Rows + 1
        End If
        Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("OptCode")) = cOPT_SERVRATESYS
        Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("OptName")) = "Service Charges/Share System"
        ' --------------------------------
        srow = srow + 1
        If Mfgrd1.Rows < srow + 1 Then
            Mfgrd1.Rows = Mfgrd1.Rows + 1
        End If
        
'        .MoveNext
'    Loop
'End If
'End With
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
    'Call Data_AddEvent
ElseIf MyDeleteKey(Shift, KeyCode) = True Then
    'If Mfgrd1.Row < Mfgrd1.Rows - 1 Then
    '    Call Data_DeleteEvent
    'End If
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
'If datRecset.RecordCount > 0 Then
'    If datRecset.AbsolutePosition <> Mfgrd1.Row - Mfgrd1.FixedRows + 1 Then
'        datRecset.MoveFirst
'        datRecset.Move Mfgrd1.Row - Mfgrd1.FixedRows, 1     ' Mfgrd1.Row is already less by one
'    End If
'End If
ShowFlexColCursor txtList1Col, Mfgrd1, Mfgrd1

End Sub

Private Sub Mfgrd1_Scroll()
ShowFlexColCursor txtList1Col, Mfgrd1, Mfgrd1

End Sub

Private Sub txtList1Col_DblClick(Index As Integer)
Call Mfgrd1_DblClick
End Sub

Private Sub txtList1Col_GotFocus(Index As Integer)
Mfgrd1.SetFocus
End Sub

Private Sub txtSearch1Text_InterActiveChange(Optional ByVal mText)
mText = IIf(IsMissing(mText) = True, txtSearch1Text.Text, mText)
Rem SearchFlex Mfgrd1, clsListStru.GetItemIndex("OptName"), mText
SearchRawFlex Mfgrd1, clsListStru.GetItemIndex("OptName"), mText
ShowActiveFlexRow Mfgrd1

End Sub

Private Sub txtPcgName_Change(Index As Integer)
If fcmbPcgName.CallFromText_Change = False Then
    fcmbPcgName.CallFromText_Change = True
    If InterActiveChange(txtPcgName(Index)) = True Then
        fcmbPcgName.UserText = Array(txtPcgName(Index).Text, txtPcgName(Index).SelStart)
        fcmbPcgName.Show
        txtPcgName(Index).Text = fcmbPcgName.Text
        If fcmbPcgName.ListSelected = True Then
            SendKeys "{tab}"
        End If
    End If
    fcmbPcgName.CallFromText_Change = False
End If

End Sub

Private Sub txtPcgName_GotFocus(Index As Integer)
FlashActiveControl txtPcgName(Index), True
End Sub

Private Sub txtPcgName_KeyDown(Index As Integer, KeyCode As Integer, Shift As Integer)
If MyDropDownKey(Shift, KeyCode) = True Then
    txtPcgName_Change Index
End If

End Sub

Private Sub txtPcgName_LostFocus(Index As Integer)
FlashActiveControl txtPcgName(Index), False
End Sub

Private Sub txtRByName_Change(Index As Integer)
If fcmbRByName.CallFromText_Change = False Then
    fcmbRByName.CallFromText_Change = True
    If InterActiveChange(txtRByName(Index)) = True Then
        fcmbRByName.UserText = Array(txtRByName(Index).Text, txtRByName(Index).SelStart)
        fcmbRByName.Show
        txtRByName(Index).Text = fcmbRByName.Text
        If fcmbRByName.ListSelected = True Then
            SendKeys "{tab}"
        End If
    End If
    fcmbRByName.CallFromText_Change = False
End If

End Sub

Private Sub txtRByName_GotFocus(Index As Integer)
FlashActiveControl txtRByName(Index), True
End Sub

Private Sub txtRByName_KeyDown(Index As Integer, KeyCode As Integer, Shift As Integer)
If MyDropDownKey(Shift, KeyCode) = True Then
    txtRByName_Change Index
End If

End Sub

Private Sub txtRByName_LostFocus(Index As Integer)
FlashActiveControl txtRByName(Index), False
End Sub

Private Sub txtSearch1Text_GotFocus()
FlashActiveControl txtSearch1Text, True
End Sub

Private Sub txtSearch1Text_LostFocus()
FlashActiveControl txtSearch1Text, False
End Sub

Private Sub txtSrvName_Change(Index As Integer)
If fcmbSrvName.CallFromText_Change = False Then
    fcmbSrvName.CallFromText_Change = True
    If InterActiveChange(txtSrvName(Index)) = True Then
        fcmbSrvName.UserText = Array(txtSrvName(Index).Text, txtSrvName(Index).SelStart)
        fcmbSrvName.Show
        txtSrvName(Index).Text = fcmbSrvName.Text
        If fcmbSrvName.ListSelected = True Then
            SendKeys "{tab}"
        End If
    End If
    fcmbSrvName.CallFromText_Change = False
End If

End Sub

Private Sub txtSrvName_GotFocus(Index As Integer)
FlashActiveControl txtSrvName(Index), True
End Sub

Private Sub txtSrvName_KeyDown(Index As Integer, KeyCode As Integer, Shift As Integer)
If MyDropDownKey(Shift, KeyCode) = True Then
    txtSrvName_Change Index
End If

End Sub

Private Sub txtSrvName_LostFocus(Index As Integer)
FlashActiveControl txtSrvName(Index), False
End Sub

Private Sub txtStnName_Change(Index As Integer)
If fcmbStnName.CallFromText_Change = False Then
    fcmbStnName.CallFromText_Change = True
    If InterActiveChange(txtStnName(Index)) = True Then
        fcmbStnName.UserText = Array(txtStnName(Index).Text, txtStnName(Index).SelStart)
        fcmbStnName.Show
        txtStnName(Index).Text = fcmbStnName.Text
        If fcmbStnName.ListSelected = True Then
            SendKeys "{tab}"
        End If
    End If
    fcmbStnName.CallFromText_Change = False
End If

End Sub

Private Sub txtStnName_GotFocus(Index As Integer)
FlashActiveControl txtStnName(Index), True
End Sub

Private Sub txtStnName_KeyDown(Index As Integer, KeyCode As Integer, Shift As Integer)
If MyDropDownKey(Shift, KeyCode) = True Then
    txtStnName_Change Index
End If

End Sub

Private Sub txtStnName_LostFocus(Index As Integer)
FlashActiveControl txtStnName(Index), False
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
End If

End Sub

Private Sub txtVtmName_LostFocus(Index As Integer)
FlashActiveControl txtVtmName(Index), False
End Sub

Private Sub SetControlFocus()
If mOptCode = cOPT_PATMAST Then
    chkPttRegNoAutoNumber(mOptCode).SetFocus
ElseIf mOptCode = cOPT_OUTDREG Then
    chkPttRegNoAutoNumber(mOptCode).SetFocus
ElseIf mOptCode = cOPT_OUTDRCPT Then
    chkPttRegNoNotZero(mOptCode).SetFocus
ElseIf mOptCode = cOPT_OUTDPYMT Then
    chkPttRegNoNotZero(mOptCode).SetFocus
ElseIf mOptCode = cOPT_OUTDREFD Then
    chkPttRegNoNotZero(mOptCode).SetFocus
ElseIf mOptCode = cOPT_OUTDBILL Then
    chkPttRegNoNotZero(mOptCode).SetFocus
ElseIf mOptCode = cOPT_OUTDBLPYMT Then
    chkPttRegNoNotZero(mOptCode).SetFocus
ElseIf mOptCode = cOPT_OUTDBLREFD Then
    chkPttRegNoNotZero(mOptCode).SetFocus
ElseIf mOptCode = cOPT_SERVRATESYS Then
    chkExtServRateSys.SetFocus
Else

End If

End Sub
