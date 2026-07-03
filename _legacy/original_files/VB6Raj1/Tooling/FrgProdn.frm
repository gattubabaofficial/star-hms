VERSION 5.00
Object = "{5E9E78A0-531B-11CF-91F6-C2863C385E30}#1.0#0"; "MSFLXGRD.OCX"
Begin VB.Form frmForgingProduction 
   Appearance      =   0  'Flat
   BackColor       =   &H80000005&
   ClientHeight    =   9315
   ClientLeft      =   60
   ClientTop       =   60
   ClientWidth     =   14340
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
   ScaleHeight     =   9315
   ScaleWidth      =   14340
   ShowInTaskbar   =   0   'False
   WindowState     =   2  'Maximized
   Begin VB.Frame frHeader 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      ForeColor       =   &H80000008&
      Height          =   1455
      Left            =   120
      TabIndex        =   39
      Top             =   840
      Width           =   13815
      Begin VB.TextBox txtMprName1 
         Appearance      =   0  'Flat
         Height          =   285
         Left            =   5760
         TabIndex        =   5
         Top             =   960
         Width           =   3375
      End
      Begin VB.TextBox dtpFpnDate2 
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
         Height          =   285
         Left            =   3600
         TabIndex        =   1
         Tag             =   "AhCode"
         Text            =   "dd/mm/yyyy"
         Top             =   240
         Width           =   1215
      End
      Begin VB.CommandButton cmdShowDtlData 
         Appearance      =   0  'Flat
         BackColor       =   &H00E0E0E0&
         Caption         =   "&Show"
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
         Left            =   9240
         Style           =   1  'Graphical
         TabIndex        =   6
         Top             =   960
         Width           =   735
      End
      Begin VB.TextBox txtEmpName1 
         Appearance      =   0  'Flat
         Height          =   285
         Left            =   1320
         TabIndex        =   2
         Top             =   600
         Width           =   3495
      End
      Begin VB.TextBox txtMacName1 
         Appearance      =   0  'Flat
         Height          =   285
         Left            =   1320
         TabIndex        =   4
         Top             =   960
         Width           =   3495
      End
      Begin VB.TextBox txtItmName1 
         Appearance      =   0  'Flat
         Height          =   285
         Left            =   5760
         TabIndex        =   3
         Top             =   600
         Width           =   3375
      End
      Begin VB.TextBox dtpFpnDate1 
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
         Height          =   285
         Left            =   1320
         TabIndex        =   0
         Tag             =   "AhCode"
         Text            =   "dd/mm/yyyy"
         Top             =   240
         Width           =   1215
      End
      Begin VB.Label Label1 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Process:"
         ForeColor       =   &H80000008&
         Height          =   255
         Index           =   21
         Left            =   4920
         TabIndex        =   59
         Top             =   960
         Width           =   855
      End
      Begin VB.Label Label1 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "To Date:"
         ForeColor       =   &H80000008&
         Height          =   255
         Index           =   19
         Left            =   2760
         TabIndex        =   57
         Top             =   240
         Width           =   855
      End
      Begin VB.Label Label1 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Machine:"
         ForeColor       =   &H80000008&
         Height          =   255
         Index           =   3
         Left            =   240
         TabIndex        =   43
         Top             =   960
         Width           =   855
      End
      Begin VB.Label Label1 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Operator:"
         ForeColor       =   &H80000008&
         Height          =   255
         Index           =   2
         Left            =   240
         TabIndex        =   42
         Top             =   600
         Width           =   855
      End
      Begin VB.Label Label1 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Material:"
         ForeColor       =   &H80000008&
         Height          =   255
         Index           =   0
         Left            =   4920
         TabIndex        =   41
         Top             =   600
         Width           =   855
      End
      Begin VB.Label Label1 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "From Date:"
         ForeColor       =   &H80000008&
         Height          =   255
         Index           =   1
         Left            =   240
         TabIndex        =   40
         Top             =   240
         Width           =   1095
      End
   End
   Begin VB.TextBox txtVoid 
      CausesValidation=   0   'False
      Height          =   375
      Left            =   120
      TabIndex        =   33
      TabStop         =   0   'False
      Text            =   "Void"
      Top             =   8760
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
      TabIndex        =   38
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
      TabIndex        =   37
      TabStop         =   0   'False
      Top             =   0
      UseMaskColor    =   -1  'True
      Width           =   255
   End
   Begin VB.ComboBox cmbFormEntryMode 
      Appearance      =   0  'Flat
      Enabled         =   0   'False
      Height          =   315
      ItemData        =   "FrgProdn.frx":0000
      Left            =   0
      List            =   "FrgProdn.frx":000D
      Style           =   1  'Simple Combo
      TabIndex        =   36
      TabStop         =   0   'False
      Text            =   "cmbFormMode"
      Top             =   360
      Width           =   1455
   End
   Begin VB.Frame frFormDtl 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      ForeColor       =   &H80000008&
      Height          =   6255
      Left            =   120
      TabIndex        =   35
      Top             =   2280
      Width           =   13815
      Begin VB.Frame frFlexControls 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         ForeColor       =   &H80000008&
         Height          =   2535
         Left            =   120
         TabIndex        =   44
         Top             =   0
         Width           =   13455
         Begin VB.TextBox txtWtCycleTimeStr 
            Appearance      =   0  'Flat
            BeginProperty DataFormat 
               Type            =   0
               Format          =   "0.00"
               HaveTrueFalseNull=   0
               FirstDayOfWeek  =   0
               FirstWeekOfYear =   0
               LCID            =   1033
               SubFormatType   =   0
            EndProperty
            BeginProperty Font 
               Name            =   "Verdana"
               Size            =   6.75
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   285
            Left            =   120
            TabIndex        =   21
            Tag             =   "AhCode"
            Text            =   "00:00:00"
            Top             =   1560
            Width           =   1455
         End
         Begin VB.TextBox mskBalWeightForProdn 
            Alignment       =   1  'Right Justify
            Appearance      =   0  'Flat
            BeginProperty DataFormat 
               Type            =   0
               Format          =   "0.00"
               HaveTrueFalseNull=   0
               FirstDayOfWeek  =   0
               FirstWeekOfYear =   0
               LCID            =   1033
               SubFormatType   =   0
            EndProperty
            BeginProperty Font 
               Name            =   "Verdana"
               Size            =   6.75
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   285
            Left            =   120
            TabIndex        =   29
            Tag             =   "AhCode"
            Text            =   "0.000"
            Top             =   2160
            Width           =   1455
         End
         Begin VB.TextBox mskFpnCompWeight 
            Alignment       =   1  'Right Justify
            Appearance      =   0  'Flat
            BeginProperty DataFormat 
               Type            =   0
               Format          =   "0.00"
               HaveTrueFalseNull=   0
               FirstDayOfWeek  =   0
               FirstWeekOfYear =   0
               LCID            =   1033
               SubFormatType   =   0
            EndProperty
            BeginProperty Font 
               Name            =   "Verdana"
               Size            =   6.75
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   285
            Left            =   6120
            TabIndex        =   26
            Tag             =   "AhCode"
            Text            =   "0.000"
            Top             =   1560
            Width           =   1215
         End
         Begin VB.TextBox mskFpnReqdWeight 
            Alignment       =   1  'Right Justify
            Appearance      =   0  'Flat
            BeginProperty DataFormat 
               Type            =   0
               Format          =   "0.00"
               HaveTrueFalseNull=   0
               FirstDayOfWeek  =   0
               FirstWeekOfYear =   0
               LCID            =   1033
               SubFormatType   =   0
            EndProperty
            BeginProperty Font 
               Name            =   "Verdana"
               Size            =   6.75
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   285
            Left            =   3720
            TabIndex        =   24
            Tag             =   "AhCode"
            Text            =   "0.000"
            Top             =   1560
            Width           =   1215
         End
         Begin VB.TextBox mskFpnRejOutWeight 
            Alignment       =   1  'Right Justify
            Appearance      =   0  'Flat
            BeginProperty DataFormat 
               Type            =   0
               Format          =   "0.00"
               HaveTrueFalseNull=   0
               FirstDayOfWeek  =   0
               FirstWeekOfYear =   0
               LCID            =   1033
               SubFormatType   =   0
            EndProperty
            BeginProperty Font 
               Name            =   "Verdana"
               Size            =   6.75
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   285
            Left            =   7320
            TabIndex        =   19
            Tag             =   "AhCode"
            Text            =   "0.000"
            Top             =   960
            Width           =   1455
         End
         Begin VB.TextBox mskFpnFinOutWeight 
            Alignment       =   1  'Right Justify
            Appearance      =   0  'Flat
            BeginProperty DataFormat 
               Type            =   0
               Format          =   "0.00"
               HaveTrueFalseNull=   0
               FirstDayOfWeek  =   0
               FirstWeekOfYear =   0
               LCID            =   1033
               SubFormatType   =   0
            EndProperty
            BeginProperty Font 
               Name            =   "Verdana"
               Size            =   6.75
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   285
            Left            =   4440
            TabIndex        =   17
            Tag             =   "AhCode"
            Text            =   "0.000"
            Top             =   960
            Width           =   1455
         End
         Begin VB.TextBox mskFpnUnitWeight 
            Alignment       =   1  'Right Justify
            Appearance      =   0  'Flat
            BeginProperty DataFormat 
               Type            =   0
               Format          =   "0.00"
               HaveTrueFalseNull=   0
               FirstDayOfWeek  =   0
               FirstWeekOfYear =   0
               LCID            =   1033
               SubFormatType   =   0
            EndProperty
            BeginProperty Font 
               Name            =   "Verdana"
               Size            =   6.75
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   285
            Left            =   1560
            TabIndex        =   15
            Tag             =   "AhCode"
            Text            =   "0.000"
            Top             =   960
            Width           =   1455
         End
         Begin VB.TextBox mskFpnRawInWeight 
            Alignment       =   1  'Right Justify
            Appearance      =   0  'Flat
            BeginProperty DataFormat 
               Type            =   0
               Format          =   "0.00"
               HaveTrueFalseNull=   0
               FirstDayOfWeek  =   0
               FirstWeekOfYear =   0
               LCID            =   1033
               SubFormatType   =   0
            EndProperty
            BeginProperty Font 
               Name            =   "Verdana"
               Size            =   6.75
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   285
            Left            =   120
            TabIndex        =   14
            Tag             =   "AhCode"
            Text            =   "0.000"
            Top             =   960
            Width           =   1455
         End
         Begin VB.TextBox txtCompTimeStr 
            Appearance      =   0  'Flat
            BeginProperty DataFormat 
               Type            =   0
               Format          =   "0.00"
               HaveTrueFalseNull=   0
               FirstDayOfWeek  =   0
               FirstWeekOfYear =   0
               LCID            =   1033
               SubFormatType   =   0
            EndProperty
            BeginProperty Font 
               Name            =   "Verdana"
               Size            =   6.75
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   285
            Left            =   8520
            TabIndex        =   28
            Tag             =   "AhCode"
            Text            =   "00:00:00"
            Top             =   1560
            Width           =   1215
         End
         Begin VB.TextBox mskFpnCompNos 
            Alignment       =   1  'Right Justify
            Appearance      =   0  'Flat
            BeginProperty DataFormat 
               Type            =   0
               Format          =   "0.00"
               HaveTrueFalseNull=   0
               FirstDayOfWeek  =   0
               FirstWeekOfYear =   0
               LCID            =   1033
               SubFormatType   =   0
            EndProperty
            BeginProperty Font 
               Name            =   "Verdana"
               Size            =   6.75
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   285
            Left            =   7320
            TabIndex        =   27
            Tag             =   "AhCode"
            Text            =   "0.00"
            Top             =   1560
            Width           =   1215
         End
         Begin VB.TextBox mskFpnReqdNos 
            Alignment       =   1  'Right Justify
            Appearance      =   0  'Flat
            BeginProperty DataFormat 
               Type            =   0
               Format          =   "0.00"
               HaveTrueFalseNull=   0
               FirstDayOfWeek  =   0
               FirstWeekOfYear =   0
               LCID            =   1033
               SubFormatType   =   0
            EndProperty
            BeginProperty Font 
               Name            =   "Verdana"
               Size            =   6.75
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   285
            Left            =   4920
            TabIndex        =   25
            Tag             =   "AhCode"
            Text            =   "0.00"
            Top             =   1560
            Width           =   1215
         End
         Begin VB.TextBox txtMprName 
            Appearance      =   0  'Flat
            Height          =   285
            Left            =   9240
            TabIndex        =   12
            Top             =   360
            Width           =   2415
         End
         Begin VB.TextBox mskBalNosForMach 
            Alignment       =   1  'Right Justify
            Appearance      =   0  'Flat
            BeginProperty DataFormat 
               Type            =   0
               Format          =   "0.00"
               HaveTrueFalseNull=   0
               FirstDayOfWeek  =   0
               FirstWeekOfYear =   0
               LCID            =   1033
               SubFormatType   =   0
            EndProperty
            BeginProperty Font 
               Name            =   "Verdana"
               Size            =   6.75
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   285
            Left            =   3000
            TabIndex        =   31
            Tag             =   "AhCode"
            Text            =   "0.00"
            Top             =   2160
            Width           =   1455
         End
         Begin VB.TextBox mskBalNosForProdn 
            Alignment       =   1  'Right Justify
            Appearance      =   0  'Flat
            BeginProperty DataFormat 
               Type            =   0
               Format          =   "0.00"
               HaveTrueFalseNull=   0
               FirstDayOfWeek  =   0
               FirstWeekOfYear =   0
               LCID            =   1033
               SubFormatType   =   0
            EndProperty
            BeginProperty Font 
               Name            =   "Verdana"
               Size            =   6.75
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   285
            Left            =   1560
            TabIndex        =   30
            Tag             =   "AhCode"
            Text            =   "0.00"
            Top             =   2160
            Width           =   1455
         End
         Begin VB.TextBox txtTimeStr 
            Appearance      =   0  'Flat
            Height          =   285
            Left            =   3000
            TabIndex        =   23
            Text            =   "00:00"
            Top             =   1560
            Width           =   735
         End
         Begin VB.TextBox txtNosCycleTimeStr 
            Appearance      =   0  'Flat
            BeginProperty DataFormat 
               Type            =   0
               Format          =   "0.00"
               HaveTrueFalseNull=   0
               FirstDayOfWeek  =   0
               FirstWeekOfYear =   0
               LCID            =   1033
               SubFormatType   =   0
            EndProperty
            BeginProperty Font 
               Name            =   "Verdana"
               Size            =   6.75
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   285
            Left            =   1560
            TabIndex        =   22
            Tag             =   "AhCode"
            Text            =   "00:00:00"
            Top             =   1560
            Width           =   1455
         End
         Begin VB.TextBox mskFpnRejOutNos 
            Alignment       =   1  'Right Justify
            Appearance      =   0  'Flat
            BeginProperty DataFormat 
               Type            =   0
               Format          =   "0.00"
               HaveTrueFalseNull=   0
               FirstDayOfWeek  =   0
               FirstWeekOfYear =   0
               LCID            =   1033
               SubFormatType   =   0
            EndProperty
            BeginProperty Font 
               Name            =   "Verdana"
               Size            =   6.75
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   285
            Left            =   8760
            TabIndex        =   20
            Tag             =   "AhCode"
            Text            =   "0.00"
            Top             =   960
            Width           =   1335
         End
         Begin VB.TextBox mskFpnFinOutNos 
            Alignment       =   1  'Right Justify
            Appearance      =   0  'Flat
            BeginProperty DataFormat 
               Type            =   0
               Format          =   "0.00"
               HaveTrueFalseNull=   0
               FirstDayOfWeek  =   0
               FirstWeekOfYear =   0
               LCID            =   1033
               SubFormatType   =   0
            EndProperty
            BeginProperty Font 
               Name            =   "Verdana"
               Size            =   6.75
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   285
            Left            =   5880
            TabIndex        =   18
            Tag             =   "AhCode"
            Text            =   "0.00"
            Top             =   960
            Width           =   1455
         End
         Begin VB.TextBox txtEmpName 
            Appearance      =   0  'Flat
            Height          =   285
            Left            =   1320
            TabIndex        =   9
            Top             =   360
            Width           =   3135
         End
         Begin VB.TextBox txtItmName 
            Appearance      =   0  'Flat
            Height          =   285
            Left            =   4440
            TabIndex        =   10
            Top             =   360
            Width           =   2655
         End
         Begin VB.TextBox txtMacName 
            Appearance      =   0  'Flat
            Height          =   285
            Left            =   7080
            TabIndex        =   11
            Top             =   360
            Width           =   2175
         End
         Begin VB.ComboBox cmbSftName 
            Appearance      =   0  'Flat
            Height          =   315
            Left            =   11640
            Style           =   2  'Dropdown List
            TabIndex        =   13
            Top             =   360
            Width           =   1455
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
            Left            =   9720
            Style           =   1  'Graphical
            TabIndex        =   32
            Top             =   1560
            Width           =   735
         End
         Begin VB.TextBox dtpFpnDate 
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
            Height          =   285
            Left            =   120
            TabIndex        =   8
            Tag             =   "AhCode"
            Text            =   "dd/mm/yyyy"
            Top             =   360
            Width           =   1215
         End
         Begin VB.TextBox mskFpnRawInNos 
            Alignment       =   1  'Right Justify
            Appearance      =   0  'Flat
            BeginProperty DataFormat 
               Type            =   0
               Format          =   "0.00"
               HaveTrueFalseNull=   0
               FirstDayOfWeek  =   0
               FirstWeekOfYear =   0
               LCID            =   1033
               SubFormatType   =   0
            EndProperty
            BeginProperty Font 
               Name            =   "Verdana"
               Size            =   6.75
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   285
            Left            =   3000
            TabIndex        =   16
            Tag             =   "AhCode"
            Text            =   "0.00"
            Top             =   960
            Width           =   1455
         End
         Begin VB.Label Label1 
            Caption         =   "Wt.Cycle Time:"
            Height          =   255
            Index           =   29
            Left            =   120
            TabIndex        =   70
            Top             =   1320
            Width           =   1455
         End
         Begin VB.Label Label1 
            Alignment       =   1  'Right Justify
            Caption         =   "Issued Bal.Wt:"
            Height          =   255
            Index           =   15
            Left            =   120
            TabIndex        =   69
            Top             =   1920
            Width           =   1455
         End
         Begin VB.Label Label1 
            Alignment       =   1  'Right Justify
            Caption         =   "Comp.Weight"
            Height          =   255
            Index           =   12
            Left            =   6120
            TabIndex        =   68
            Top             =   1320
            Width           =   1215
         End
         Begin VB.Label Label1 
            Alignment       =   1  'Right Justify
            Caption         =   "Reqd.Weight:"
            Height          =   255
            Index           =   11
            Left            =   3720
            TabIndex        =   67
            Top             =   1320
            Width           =   1215
         End
         Begin VB.Label Label1 
            Alignment       =   1  'Right Justify
            Caption         =   "Rej.Weight:"
            Height          =   255
            Index           =   28
            Left            =   7320
            TabIndex        =   66
            Top             =   720
            Width           =   1455
         End
         Begin VB.Label Label1 
            Alignment       =   1  'Right Justify
            Caption         =   "OK Weight:"
            Height          =   255
            Index           =   27
            Left            =   4440
            TabIndex        =   65
            Top             =   720
            Width           =   1455
         End
         Begin VB.Label Label1 
            Alignment       =   1  'Right Justify
            Caption         =   "Weight/Pcs"
            Height          =   255
            Index           =   26
            Left            =   1560
            TabIndex        =   64
            Top             =   720
            Width           =   1455
         End
         Begin VB.Label Label1 
            Alignment       =   1  'Right Justify
            Caption         =   "Opr.Weight:"
            Height          =   255
            Index           =   25
            Left            =   120
            TabIndex        =   63
            Top             =   720
            Width           =   1455
         End
         Begin VB.Label Label1 
            Caption         =   "Comp.Time:"
            Height          =   255
            Index           =   24
            Left            =   8520
            TabIndex        =   62
            Top             =   1320
            Width           =   1215
         End
         Begin VB.Label Label1 
            Alignment       =   1  'Right Justify
            Caption         =   "Comp.Nos.:"
            Height          =   255
            Index           =   23
            Left            =   7320
            TabIndex        =   61
            Top             =   1320
            Width           =   1215
         End
         Begin VB.Label Label1 
            Alignment       =   1  'Right Justify
            Caption         =   "Reqd.Nos.:"
            Height          =   255
            Index           =   22
            Left            =   4920
            TabIndex        =   60
            Top             =   1320
            Width           =   1215
         End
         Begin VB.Label Label1 
            Caption         =   "Process:"
            Height          =   255
            Index           =   20
            Left            =   9240
            TabIndex        =   58
            Top             =   120
            Width           =   2415
         End
         Begin VB.Label Label1 
            Alignment       =   1  'Right Justify
            Caption         =   "Forged.Bal.:"
            Height          =   255
            Index           =   18
            Left            =   3000
            TabIndex        =   56
            Top             =   1920
            Width           =   1455
         End
         Begin VB.Label Label1 
            Alignment       =   1  'Right Justify
            Caption         =   "Issued Bal.Nos.:"
            Height          =   255
            Index           =   17
            Left            =   1560
            TabIndex        =   55
            Top             =   1920
            Width           =   1455
         End
         Begin VB.Label Label1 
            Caption         =   "Nos.Cycle Time:"
            Height          =   255
            Index           =   16
            Left            =   1560
            TabIndex        =   54
            Top             =   1320
            Width           =   1455
         End
         Begin VB.Label Label1 
            Caption         =   "Time:"
            Height          =   255
            Index           =   14
            Left            =   3000
            TabIndex        =   53
            Top             =   1320
            Width           =   735
         End
         Begin VB.Label Label1 
            Alignment       =   1  'Right Justify
            Caption         =   "Rej.Nos.:"
            Height          =   255
            Index           =   13
            Left            =   8760
            TabIndex        =   52
            Top             =   720
            Width           =   1335
         End
         Begin VB.Label Label1 
            Alignment       =   1  'Right Justify
            Caption         =   "OK Nos.:"
            Height          =   255
            Index           =   10
            Left            =   5880
            TabIndex        =   51
            Top             =   720
            Width           =   1455
         End
         Begin VB.Label Label1 
            Alignment       =   1  'Right Justify
            Caption         =   "Opr.Nos.:"
            Height          =   255
            Index           =   9
            Left            =   3000
            TabIndex        =   50
            Top             =   720
            Width           =   1455
         End
         Begin VB.Label Label1 
            Caption         =   "Shift:"
            Height          =   255
            Index           =   8
            Left            =   11640
            TabIndex        =   49
            Top             =   120
            Width           =   1455
         End
         Begin VB.Label Label1 
            Caption         =   "Machine Name:"
            Height          =   255
            Index           =   7
            Left            =   7080
            TabIndex        =   48
            Top             =   120
            Width           =   2175
         End
         Begin VB.Label Label1 
            Caption         =   "Item Name:"
            Height          =   255
            Index           =   6
            Left            =   4440
            TabIndex        =   47
            Top             =   120
            Width           =   2655
         End
         Begin VB.Label Label1 
            Caption         =   "Operator Name:"
            Height          =   255
            Index           =   5
            Left            =   1320
            TabIndex        =   46
            Top             =   120
            Width           =   3135
         End
         Begin VB.Label Label1 
            Caption         =   "Date:"
            Height          =   255
            Index           =   4
            Left            =   120
            TabIndex        =   45
            Top             =   120
            Width           =   1215
         End
      End
      Begin MSFlexGridLib.MSFlexGrid Mfgrd2 
         Height          =   3615
         Left            =   120
         TabIndex        =   7
         Top             =   2520
         Width           =   13455
         _ExtentX        =   23733
         _ExtentY        =   6376
         _Version        =   393216
         FixedCols       =   0
         RowHeightMin    =   285
         FocusRect       =   2
         HighLight       =   2
         AllowUserResizing=   3
         Appearance      =   0
      End
   End
   Begin VB.Label lblFormHeading 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00E0E0E0&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Forging Production"
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
      TabIndex        =   34
      Top             =   0
      Width           =   9015
   End
End
Attribute VB_Name = "frmForgingProduction"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Dim dbAcDatabase As New ADODB.Connection, dbStDatabase As New ADODB.Connection, dbTlgDatabase As New ADODB.Connection, dbPyrDatabase As New ADODB.Connection, dbGrpDatabase As New ADODB.Connection, dbComDatabase As New ADODB.Connection
Dim mFormLoaded As Boolean, mLastKeyPressed As Integer
Dim mRemoteAccess As Boolean, mEntrySaved As Boolean, mEntryAborted As Boolean
Dim dtlAddEditMode As Boolean, dtlAddMode As Boolean, dtlEditCanceled As Boolean
Dim clsSTK As clsStockJrn, clsITM As clsProduct, clsEMP As clsPayrollMasterEntry, clsMAC As clsToolingMasterEntry, clsMPR As clsToolingMasterEntry, mActiveControl As Object
Dim fcmbEmpName As frmFlexSearchList, fcmbItmName As frmFlexSearchList, fcmbMacName As frmFlexSearchList, fcmbMprName As frmFlexSearchList
Dim mFpnDate_old As Date, mFpnEmpCode_old As Long, mFpnItmCode_old As Long, mFpnMacCode_old As Long, mFpnMprCode_old As Long, mFpnConsWeight_old As Double, mFpnConsNos_old As Double, mFpnFinOutWeight_old As Double, mFpnFinOutNos_old As Double

' StockJrn transaction detail grid Mfgrd2 column definitions
Const X2FPNICODE_COL = 0
Const X2FPNDATE_COL = 1
Const X2EMPNAME_COL = 2
Const X2ITMNAME_COL = 3
Const X2MACNAME_COL = 4
Const X2MPRNAME_COL = 5
Const X2SFTNAME_COL = 6
Const X2FPNRAWINWEIGHT_COL = 7
Const X2FPNUNITWEIGHT_COL = 8
Const X2FPNRAWINNOS_COL = 9
Const X2FPNFINOUTWEIGHT_COL = 10
Const X2FPNFINOUTNOS_COL = 11
Const X2FPNREJOUTWEIGHT_COL = 12
Const X2FPNREJOUTNOS_COL = 13
Const X2WTCYCLETIMESTR_COL = 14
Const X2NOSCYCLETIMESTR_COL = 15
Const X2TIMESTR_COL = 16
Const X2FPNREQDWEIGHT_COL = 17
Const X2FPNREQDNOS_COL = 18
Const X2FPNCOMPWEIGHT_COL = 19
Const X2FPNCOMPNOS_COL = 20
Const X2COMPTIMESTR_COL = 21
Const X2BALWEIGHTFORPRODN_COL = 22
Const X2BALNOSFORPRODN_COL = 23
Const X2BALNOSFORMACH_COL = 24
Const X2FPNCODE_COL = 25
Const X2FPNSNO_COL = 26
Const X2FPNEMPCODE_COL = 27
Const X2FPNITMCODE_COL = 28
Const X2FPNMACCODE_COL = 29
Const X2FPNMPRCODE_COL = 30
Const X2FPNSFTCODE_COL = 31
Const X2FPNWTCYCLETIME_COL = 32
Const X2FPNNOSCYCLETIME_COL = 33
Const X2FPNTIME_COL = 34
Const X2FPNCOMPTIME_COL = 35
Const X2FPNSTKCODE_COL = 36
Const X2FPNSTKICODEIS_COL = 37
Const X2FPNSTKICODERC_COL = 38
Const X2FPNRECSTATE_COL = 39
Const MFGRD2_COLS = 40

Rem General declarations
Const NOS_UNIT = 1
Const WEIGHT_UNIT = 2

Private Property Get FormAddEditMode() As Integer
FormAddEditMode = cmbFormEntryMode.ListIndex
End Property

Private Property Let FormAddEditMode(ByVal New_FormEntryMode As Integer)
cmbFormEntryMode.ListIndex = New_FormEntryMode
End Property

Private Sub cmbSftName_Validate(Cancel As Boolean)
If cmbSftName.ListIndex = -1 Then
    ErrorBox "Invalid Shift !!!"
    Cancel = True
    cmbSftName.SetFocus
End If
Call ValidDtl

End Sub

Private Sub cmdFormEnter_Click()
mLastKeyPressed = 13
If TypeOf Screen.ActiveControl Is MSFlexGrid Then
    If Screen.ActiveControl.Name = Mfgrd2.Name Then
        Call Mfgrd2_KeyPress(13)
    End If
Else
    SendKeys "{tab}"
End If

End Sub

Private Sub cmdFormEscape_Click()
Dim mRecAbsPos As Long
mLastKeyPressed = 27
If dtlAddEditMode = True Then
    dtlEditCanceled = True
    Call cmdOK_Click
ElseIf Screen.ActiveControl.Name = Mfgrd2.Name Then
    dtpFpnDate1.SetFocus
Else
    Unload Me
End If

End Sub

Private Sub cmdOK_Click()
Dim FPNRecset As New ADODB.Recordset, FPN_LogRS As New ADODB.Recordset
Dim srow As Long, mFpnStkCode As Long, mFpnStkICodeIs As Long, mFpnStkICodeRc As Long, mFpnCode As Long, mFpnICode As Long, mFpnSno As Long, mStkItmRefCode As Long
Dim mFpnRawInWeight As Double, mFpnRawInNos As Double, mFpnFinOutWeight As Double, mFpnFinOutNos As Double, mConsWeight As Double, mConsNos As Double

srow = Mfgrd2.Row
If dtlAddMode = True Then
    mFpnCode = GetNextSeqno(dbTlgDatabase, "ForgProdn", "FpnCode")
    mFpnStkCode = clsSTK.ActiveStkCode
Else
    mFpnCode = Val(Mfgrd2.TextMatrix(srow, X2FPNCODE_COL))
    mFpnStkCode = Val(Mfgrd2.TextMatrix(srow, X2FPNSTKCODE_COL))
    mFpnICode = Val(Mfgrd2.TextMatrix(srow, X2FPNICODE_COL))
    mFpnStkICodeIs = Val(Mfgrd2.TextMatrix(srow, X2FPNSTKICODEIS_COL))
    mFpnStkICodeRc = Val(Mfgrd2.TextMatrix(srow, X2FPNSTKICODERC_COL))
End If
If dtlEditCanceled = False Then
    Call ValidDtl
End If
If cmdOK.Caption = "&OK" And dtlEditCanceled = False Then
    Rem addnew/update -------------------------
    Rem Forging section
    dbTlgDatabase.BeginTrans
    With FPNRecset
    If dtlAddMode = True Then
        mFpnSno = GetNextSeqno(dbTlgDatabase, "ForgProdn", "FpnSno", "FpnCode" = CStr(mFpnCode))
        
        FPNRecset.Open "Select * from ForgProdn where FpnCode=" & CStr(mFpnCode) & "", dbTlgDatabase, adOpenKeyset, adLockOptimistic
        .AddNew
        Rem .Fields("FpnICode") = AutoNumber
        .Fields("FpnCode") = mFpnCode
        .Fields("FpnSno") = mFpnSno
    Else
        FPNRecset.Open "Select * from ForgProdn where FpnCode=" & CStr(mFpnCode) & " and FpnICode=" & CStr(mFpnICode) & "", dbTlgDatabase, adOpenKeyset, adLockOptimistic
    End If
    .Fields("FpnDate") = Ctod(dtpFpnDate.Text)
    .Fields("FpnEmpCode") = Val(fcmbEmpName.BoundText)
    .Fields("FpnItmCode") = Val(fcmbItmName.BoundText)
    .Fields("FpnItmRefCode") = 0
    .Fields("FpnMacCode") = Val(fcmbMacName.BoundText)
    .Fields("FpnMprCode") = Val(fcmbMprName.BoundText)
    .Fields("FpnSftCode") = cmbSftName.ListIndex + 1
    .Fields("FpnRawInWeight") = Val(UnMyNumFmt(mskFpnRawInWeight.Text))
    .Fields("FpnUnitWeight") = Val(UnMyNumFmt(mskFpnUnitWeight.Text))
    .Fields("FpnUnitNos") = 1  ''' provisional
    .Fields("FpnRawInNos") = Val(UnMyNumFmt(mskFpnRawInNos.Text))
    .Fields("FpnFinOutWeight") = Val(UnMyNumFmt(mskFpnFinOutWeight.Text))
    .Fields("FpnFinOutNos") = Val(UnMyNumFmt(mskFpnFinOutNos.Text))
    .Fields("FpnRejOutWeight") = Val(UnMyNumFmt(mskFpnRejOutWeight.Text))
    .Fields("FpnRejOutNos") = Val(UnMyNumFmt(mskFpnRejOutNos.Text))
    .Fields("FpnWtCycleTime") = TimeToSec(txtWtCycleTimeStr.Text)
    .Fields("FpnNosCycleTime") = TimeToSec(txtNosCycleTimeStr.Text)
    .Fields("FpnCTWeight") = 1 ''' future provision
    .Fields("FpnCTNos") = 1 ''' future provision
    .Fields("FpnTime") = TimeToMin(txtTimeStr.Text)
    .Fields("FpnReqdWeight") = Val(UnMyNumFmt(mskFpnReqdWeight.Text))
    .Fields("FpnReqdNos") = Val(UnMyNumFmt(mskFpnReqdNos.Text))
    .Fields("FpnCompWeight") = Val(UnMyNumFmt(mskFpnCompWeight.Text))
    .Fields("FpnCompNos") = Val(UnMyNumFmt(mskFpnCompNos.Text))
    .Fields("FpnCompTime") = TimeToSec(txtCompTimeStr.Text)
    .Fields("FpnNarr") = ""
    .Fields("FpnRecState") = ChkEditRecStatus(.Fields("FpnRecState"))
    .Update
    .Fields("FpnConsWeight") = .Fields("FpnFinOutWeight") + .Fields("FpnRejOutWeight")
    .Fields("FpnConsNos") = .Fields("FpnFinOutNos") + .Fields("FpnRejOutNos")
    .Update
    
    mFpnICode = .Fields("FpnICode")
    mConsWeight = .Fields("FpnConsWeight")
    mConsNos = .Fields("FpnConsNos")
    mFpnRawInWeight = .Fields("FpnRawInWeight")
    mFpnRawInNos = .Fields("FpnRawInNos")
    mFpnFinOutWeight = .Fields("FpnFinOutWeight")
    mFpnFinOutNos = .Fields("FpnFinOutNos")
    
    End With
    dbTlgDatabase.CommitTrans
    CloseTable FPNRecset
    
    Rem StockJrn section
    clsSTK.Clear
    If dtlAddMode = True Then
        Rem issue stock
        clsSTK.mStkDate_dt = Ctod(dtpFpnDate.Text)
        clsSTK.mStkItmCode_lng = Val(fcmbItmName.BoundText)
        clsSTK.mStkItmRefCode_lng = 0
        clsSTK.mStkQty_dbl = ToIssueQty(mConsWeight)
        clsSTK.mStkRate_dbl = 0
        clsSTK.mStkValue_dbl = 0
        clsSTK.mStkNarr_str = ""
        clsSTK.mStkRecState_int = cREC_NEW
        clsSTK.mStkLItmCode_lng = 0
        
        clsSTK.AddNew mFpnStkCode
        mFpnStkICodeIs = clsSTK.mStkICode_lng
        
        Rem receipt stock
        clsSTK.mStkSno_int = 0
        clsSTK.mStkQty_dbl = ToRcptQty(mFpnFinOutNos)
        
        clsSTK.AddNew mFpnStkCode, mNewItemRef:=True
        mFpnStkICodeRc = clsSTK.mStkICode_lng
        mStkItmRefCode = clsSTK.mStkItmRefCode_lng
        
        Rem StockJrn Common entry
        clsSTK.mStkSno_int = -1
        clsSTK.mStkItmCode_lng = 0
        clsSTK.mStkItmRefCode_lng = 0
        clsSTK.mStkQty_dbl = 0
        clsSTK.mStkNarr_str = "Forging Production Entry"
        clsSTK.AddNew mFpnStkCode
    Else
        Rem issue stock
        clsSTK.GetData mFpnStkCode, mFpnStkICodeIs
        clsSTK.mStkDate_dt = Ctod(dtpFpnDate.Text)
        clsSTK.mStkItmCode_lng = Val(fcmbItmName.BoundText)
        clsSTK.mStkItmRefCode_lng = 0
        clsSTK.mStkQty_dbl = ToIssueQty(mConsWeight)
        clsSTK.mStkRate_dbl = 0
        clsSTK.mStkValue_dbl = 0
        clsSTK.mStkNarr_str = ""
        clsSTK.Update mFpnStkCode, mFpnStkICodeIs
        
        Rem receipt stock
        clsSTK.GetData mFpnStkCode, mFpnStkICodeRc
        clsSTK.mStkDate_dt = Ctod(dtpFpnDate.Text)
        clsSTK.mStkItmCode_lng = Val(fcmbItmName.BoundText)
        Rem clsSTK.mStkItmRefCode_lng = 0
        clsSTK.mStkQty_dbl = ToRcptQty(mFpnFinOutNos)    ' rejoutqty is to be considered ???
        clsSTK.mStkRate_dbl = 0
        clsSTK.mStkValue_dbl = 0
        clsSTK.mStkNarr_str = ""
        If mFpnItmCode_old <> clsSTK.mStkItmCode_lng Or clsSTK.mStkItmRefCode_lng = 0 Then
            clsSTK.Update mFpnStkCode, mFpnStkICodeRc, mNewItemRef:=True
        Else
            clsSTK.Update mFpnStkCode, mFpnStkICodeRc
        End If
        mStkItmRefCode = clsSTK.mStkItmRefCode_lng
        
        Rem StockJrn common entry
        clsSTK.GetData mFpnStkCode, 0, -1
        clsSTK.mStkDate_dt = Ctod(dtpFpnDate.Text)
        clsSTK.mStkItmCode_lng = 0
        clsSTK.mStkItmRefCode_lng = 0
        clsSTK.mStkQty_dbl = 0
        clsSTK.mStkRate_dbl = 0
        clsSTK.mStkValue_dbl = 0
        clsSTK.mStkNarr_str = "Forging Production Entry"
        
        clsSTK.Update mFpnStkCode, clsSTK.mStkICode_lng
    End If
    
    Rem update stock ----------------------------------------
    Rem Production updation
    dbTlgDatabase.BeginTrans
    FPNRecset.Open "Select * from ForgProdn where FpnCode=" & CStr(mFpnCode) & " order by FpnICode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
    With FPNRecset
    If .RecordCount > 0 Then
        .MoveFirst
        Do While .EOF = False
            If InList(.Fields("FpnRecState"), Array(cREC_ADDED, cREC_EDITED, cREC_UNCHANGED)) = True Then
                If dtlAddMode = True Then
                    .Fields("FpnStkCode") = mFpnStkCode
                    .Fields("FpnStkICodeIs") = mFpnStkICodeIs
                    .Fields("FpnStkICodeRc") = mFpnStkICodeRc
                    .Fields("FpnItmRefCode") = mStkItmRefCode
                Else
                    .Fields("FpnItmRefCode") = mStkItmRefCode
                End If
                .Fields("FpnRecState") = cREC_UNCHANGED
                .Update
            Else
                .Fields("FpnRecState") = ChkDeleteRecStatus(.Fields("FpnRecState"))
                .Update
                .Delete
            End If
            
            .MoveNext
        Loop
    End If
    End With
    dbTlgDatabase.CommitTrans
    CloseTable FPNRecset
    
    Rem StockJrn updation
    clsSTK.CommitStock mFpnStkCode
    
    Rem EndStock routine ----------------------------------
    Rem Production
    Data_RemoveLog mFpnCode
    
    Rem StockJrn
    clsSTK.EndStock mFpnStkCode
    
    Rem show record in flexgrid
    FPNRecset.Open "Select * from ForgProdn where FpnCode=" & CStr(mFpnCode) & " and FpnICode=" & CStr(mFpnICode) & "", dbTlgDatabase, adOpenKeyset, adLockOptimistic
    With FPNRecset
    clsEMP.GetData .Fields("FpnEmpCode")
    clsITM.GetData .Fields("FpnItmCode")
    clsMAC.GetData .Fields("FpnMacCode")
    clsMPR.GetData .Fields("FpnMprCode")
    
    Mfgrd2.TextMatrix(srow, X2FPNICODE_COL) = .Fields("FpnICode")
    Mfgrd2.TextMatrix(srow, X2FPNDATE_COL) = Dtoc(.Fields("FpnDate"))
    Mfgrd2.TextMatrix(srow, X2EMPNAME_COL) = clsEMP.mAhName_str
    Mfgrd2.TextMatrix(srow, X2ITMNAME_COL) = clsITM.mItmName_str
    Mfgrd2.TextMatrix(srow, X2MACNAME_COL) = clsMAC.mName_str
    Mfgrd2.TextMatrix(srow, X2MPRNAME_COL) = clsMPR.mName_str
    Mfgrd2.TextMatrix(srow, X2SFTNAME_COL) = cmbSftName.List(.Fields("FpnSftCode") - 1)
    Mfgrd2.TextMatrix(srow, X2FPNRAWINWEIGHT_COL) = ToMyNumFmt(.Fields("FpnRawInWeight"), mDecimals:=3)
    Mfgrd2.TextMatrix(srow, X2FPNUNITWEIGHT_COL) = ToMyNumFmt(.Fields("FpnUnitWeight"), mDecimals:=3)
    Mfgrd2.TextMatrix(srow, X2FPNRAWINNOS_COL) = ToMyNumFmt(.Fields("FpnRawInNos"), mDecimals:=0)
    Mfgrd2.TextMatrix(srow, X2FPNFINOUTWEIGHT_COL) = ToMyNumFmt(.Fields("FpnFinOutWeight"), mDecimals:=3)
    Mfgrd2.TextMatrix(srow, X2FPNFINOUTNOS_COL) = ToMyNumFmt(.Fields("FpnFinOutNos"), mDecimals:=0)
    Mfgrd2.TextMatrix(srow, X2FPNREJOUTWEIGHT_COL) = ToMyNumFmt(.Fields("FpnRejOutWeight"), mDecimals:=3)
    Mfgrd2.TextMatrix(srow, X2FPNREJOUTNOS_COL) = ToMyNumFmt(.Fields("FpnRejOutNos"), mDecimals:=0)
    Mfgrd2.TextMatrix(srow, X2WTCYCLETIMESTR_COL) = SecToTime(.Fields("FpnWtCycleTime"))
    Mfgrd2.TextMatrix(srow, X2NOSCYCLETIMESTR_COL) = SecToTime(.Fields("FpnNosCycleTime"))
    Mfgrd2.TextMatrix(srow, X2TIMESTR_COL) = MinToTime(.Fields("FpnTime"))
    Mfgrd2.TextMatrix(srow, X2FPNREQDWEIGHT_COL) = ToMyNumFmt(.Fields("FpnReqdWeight"), mDecimals:=3)
    Mfgrd2.TextMatrix(srow, X2FPNREQDNOS_COL) = ToMyNumFmt(.Fields("FpnReqdNos"), mDecimals:=0)
    Mfgrd2.TextMatrix(srow, X2FPNCOMPWEIGHT_COL) = ToMyNumFmt(.Fields("FpnCompWeight"), mDecimals:=3)
    Mfgrd2.TextMatrix(srow, X2FPNCOMPNOS_COL) = ToMyNumFmt(.Fields("FpnCompNos"), mDecimals:=0)
    Mfgrd2.TextMatrix(srow, X2COMPTIMESTR_COL) = SecToTime(.Fields("FpnCompTime"))
    Mfgrd2.TextMatrix(srow, X2FPNCODE_COL) = .Fields("FpnCode")
    Mfgrd2.TextMatrix(srow, X2FPNSNO_COL) = .Fields("FpnSno")
    Mfgrd2.TextMatrix(srow, X2FPNEMPCODE_COL) = .Fields("FpnEmpCode")
    Mfgrd2.TextMatrix(srow, X2FPNITMCODE_COL) = .Fields("FpnItmCode")
    Mfgrd2.TextMatrix(srow, X2FPNMACCODE_COL) = .Fields("FpnMacCode")
    Mfgrd2.TextMatrix(srow, X2FPNMPRCODE_COL) = .Fields("FpnMprCode")
    Mfgrd2.TextMatrix(srow, X2FPNSFTCODE_COL) = .Fields("FpnSftCode")
    Mfgrd2.TextMatrix(srow, X2FPNWTCYCLETIME_COL) = .Fields("FpnWtCycleTime")
    Mfgrd2.TextMatrix(srow, X2FPNNOSCYCLETIME_COL) = .Fields("FpnNosCycleTime")
    Mfgrd2.TextMatrix(srow, X2FPNTIME_COL) = .Fields("FpnTime")
    Mfgrd2.TextMatrix(srow, X2FPNCOMPTIME_COL) = .Fields("FpnCompTime")
    Mfgrd2.TextMatrix(srow, X2FPNSTKCODE_COL) = .Fields("FpnStkCode")
    Mfgrd2.TextMatrix(srow, X2FPNSTKICODEIS_COL) = .Fields("FpnStkICodeIs")
    Mfgrd2.TextMatrix(srow, X2FPNSTKICODERC_COL) = .Fields("FpnStkICodeRc")
    Mfgrd2.TextMatrix(srow, X2FPNRECSTATE_COL) = .Fields("FpnRecState")
    
    End With
    CloseTable FPNRecset
    
    If dtlAddMode = True Then
        Mfgrd2.Rows = Mfgrd2.Rows + 1
    End If
    srow = srow + 1
    Mfgrd2.Row = srow
Else
    Rem cance event -----------------------------------
    Rem Production
    FPNRecset.Open "Select * from ForgProdn where FpnCode=" & CStr(mFpnCode) & " order by FpnICode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
    FPN_LogRS.Open "Select * from ForgProdn_Log where FpnCode=" & CStr(mFpnCode) & " order by FpnICode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
    
    dbTlgDatabase.BeginTrans
    With FPNRecset
    If .RecordCount > 0 Then
        .MoveFirst
        Do While .EOF = False
            Rem stock updation is not required because balance is updated on CommitStock and not on individual item save, hence no need to revert is back
            FPN_LogRS.Find "FpnICode=" & CStr(.Fields("FpnICode")), Start:=1
            If FPN_LogRS.EOF = False Then
                ' any prior updations can be made here
                .Fields("FpnSno") = FPN_LogRS.Fields("FpnSno")
                .Fields("FpnDate") = FPN_LogRS.Fields("FpnDate")
                .Fields("FpnEmpCode") = FPN_LogRS.Fields("FpnEmpCode")
                .Fields("FpnItmCode") = FPN_LogRS.Fields("FpnItmCode")
                .Fields("FpnItmRefCode") = FPN_LogRS.Fields("FpnItmRefCode")
                .Fields("FpnMacCode") = FPN_LogRS.Fields("FpnMacCode")
                .Fields("FpnMprCode") = FPN_LogRS.Fields("FpnMprCode")
                .Fields("FpnSftCode") = FPN_LogRS.Fields("FpnSftCode")
                .Fields("FpnRawInWeight") = FPN_LogRS.Fields("FpnRawInWeight")
                .Fields("FpnUnitWeight") = FPN_LogRS.Fields("FpnUnitWeight")
                .Fields("FpnUnitNos") = FPN_LogRS.Fields("FpnUnitNos")
                .Fields("FpnRawInNos") = FPN_LogRS.Fields("FpnRawInNos")
                .Fields("FpnFinOutWeight") = FPN_LogRS.Fields("FpnFinOutWeight")
                .Fields("FpnFinOutNos") = FPN_LogRS.Fields("FpnFinOutNos")
                .Fields("FpnRejOutWeight") = FPN_LogRS.Fields("FpnRejOutWeight")
                .Fields("FpnRejOutNos") = FPN_LogRS.Fields("FpnRejOutNos")
                .Fields("FpnWtCycleTime") = FPN_LogRS.Fields("FpnWtCycleTime")
                .Fields("FpnNosCycleTime") = FPN_LogRS.Fields("FpnNosCycleTime")
                .Fields("FpnCTWeight") = FPN_LogRS.Fields("FpnCTWeight")
                .Fields("FpnCTNos") = FPN_LogRS.Fields("FpnCTNos")
                .Fields("FpnTime") = FPN_LogRS.Fields("FpnTime")
                .Fields("FpnReqdWeight") = FPN_LogRS.Fields("FpnReqdWeight")
                .Fields("FpnReqdNos") = FPN_LogRS.Fields("FpnReqdNos")
                .Fields("FpnCompWeight") = FPN_LogRS.Fields("FpnCompWeight")
                .Fields("FpnCompNos") = FPN_LogRS.Fields("FpnCompNos")
                .Fields("FpnCompTime") = FPN_LogRS.Fields("FpnCompTime")
                .Fields("FpnConsWeight") = FPN_LogRS.Fields("FpnConsWeight")
                .Fields("FpnConsNos") = FPN_LogRS.Fields("FpnConsNos")
                .Fields("FpnNarr") = FPN_LogRS.Fields("FpnNarr")
                .Fields("FpnRecState") = FPN_LogRS.Fields("FpnRecState")
                .Update
            Else
                ' any prior updations can be made here
                .Fields("FpnRecState") = ChkDeleteRecStatus(.Fields("FpnRecState"))
                .Update
                .Delete
            End If
            
            .MoveNext
        Loop
    End If
    End With
    dbTlgDatabase.CommitTrans
    CloseTable FPNRecset
    CloseTable FPN_LogRS
    
    Rem StockJrn
    clsSTK.CancelStock mFpnStkCode
    
    Rem EndStock --------------------------------------------------
    Rem Production
    Data_RemoveLog mFpnCode
    
    Rem StockJrn
    clsSTK.EndStock mFpnStkCode
    
End If
dtlAddEditMode = False
dtlAddMode = False
dtlEditCanceled = False
Call EnableControls(False)
Call RefreshBalQty
Mfgrd2.SetFocus
GoTo EndSub
Exit Sub

EndSub:
Set FPNRecset = Nothing
Set FPN_LogRS = Nothing

End Sub

Private Sub cmdShowDtlData_Click()
Dim tRecset As New ADODB.Recordset, srow As Long, cnt As Integer
srow = 1

fcmbEmpName.Text = txtEmpName1.Text: txtEmpName1.Text = fcmbEmpName.Text
fcmbItmName.Text = txtItmName1.Text: txtItmName1.Text = fcmbItmName.Text
fcmbMacName.Text = txtMacName1.Text: txtMacName1.Text = fcmbMacName.Text
fcmbMprName.Text = txtMprName1.Text: txtMprName1.Text = fcmbMprName.Text

tRecset.Open "Select * from ForgProdn" _
    & " where FpnDate between #" & CStr(ToSysDate(Ctod(dtpFpnDate1.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpFpnDate2.Text))) & "#" _
    & IIf(Val(fcmbEmpName.BoundText) > 0, " and FpnEmpCode=" & CStr(Val(fcmbEmpName.BoundText)), "") _
    & IIf(Val(fcmbItmName.BoundText) > 0, " and FpnItmCode=" & CStr(Val(fcmbItmName.BoundText)), "") _
    & IIf(Val(fcmbMacName.BoundText) > 0, " and FpnMacCode=" & CStr(Val(fcmbMacName.BoundText)), "") _
    & IIf(Val(fcmbMprName.BoundText) > 0, " and FpnMprCode=" & CStr(Val(fcmbMprName.BoundText)), "") _
    & " order by FpnDate,FpnICode" _
    , dbTlgDatabase, adOpenKeyset, adLockOptimistic
With tRecset
If .RecordCount > 0 Then
    Do While .EOF = False
        clsEMP.GetData .Fields("FpnEmpCode")
        clsITM.GetData .Fields("FpnItmCode")
        clsMAC.GetData .Fields("FpnMacCode")
        clsMPR.GetData .Fields("FpnMprCode")
        
        Mfgrd2.TextMatrix(srow, X2FPNICODE_COL) = .Fields("FpnICode")
        Mfgrd2.TextMatrix(srow, X2FPNDATE_COL) = Dtoc(.Fields("FpnDate"))
        Mfgrd2.TextMatrix(srow, X2EMPNAME_COL) = clsEMP.mAhName_str
        Mfgrd2.TextMatrix(srow, X2ITMNAME_COL) = clsITM.mItmName_str
        Mfgrd2.TextMatrix(srow, X2MACNAME_COL) = clsMAC.mName_str
        Mfgrd2.TextMatrix(srow, X2MPRNAME_COL) = clsMPR.mName_str
        Mfgrd2.TextMatrix(srow, X2SFTNAME_COL) = cmbSftName.List(.Fields("FpnSftCode") - 1)
        Mfgrd2.TextMatrix(srow, X2FPNRAWINWEIGHT_COL) = ToMyNumFmt(.Fields("FpnRawInWeight"), mDecimals:=3)
        Mfgrd2.TextMatrix(srow, X2FPNUNITWEIGHT_COL) = ToMyNumFmt(.Fields("FpnUnitWeight"), mDecimals:=3)
        Mfgrd2.TextMatrix(srow, X2FPNRAWINNOS_COL) = ToMyNumFmt(.Fields("FpnRawInNos"), mDecimals:=0)
        Mfgrd2.TextMatrix(srow, X2FPNFINOUTWEIGHT_COL) = ToMyNumFmt(.Fields("FpnFinOutWeight"), mDecimals:=3)
        Mfgrd2.TextMatrix(srow, X2FPNFINOUTNOS_COL) = ToMyNumFmt(.Fields("FpnFinOutNos"), mDecimals:=0)
        Mfgrd2.TextMatrix(srow, X2FPNREJOUTWEIGHT_COL) = ToMyNumFmt(.Fields("FpnRejOutWeight"), mDecimals:=3)
        Mfgrd2.TextMatrix(srow, X2FPNREJOUTNOS_COL) = ToMyNumFmt(.Fields("FpnRejOutNos"), mDecimals:=0)
        Mfgrd2.TextMatrix(srow, X2WTCYCLETIMESTR_COL) = SecToTime(.Fields("FpnWtCycleTime"))
        Mfgrd2.TextMatrix(srow, X2NOSCYCLETIMESTR_COL) = SecToTime(.Fields("FpnNosCycleTime"))
        Mfgrd2.TextMatrix(srow, X2TIMESTR_COL) = MinToTime(.Fields("FpnTime"))
        Mfgrd2.TextMatrix(srow, X2FPNREQDWEIGHT_COL) = ToMyNumFmt(.Fields("FpnReqdWeight"), mDecimals:=3)
        Mfgrd2.TextMatrix(srow, X2FPNREQDNOS_COL) = ToMyNumFmt(.Fields("FpnReqdNos"), mDecimals:=0)
        Mfgrd2.TextMatrix(srow, X2FPNCOMPWEIGHT_COL) = ToMyNumFmt(.Fields("FpnCompWeight"), mDecimals:=3)
        Mfgrd2.TextMatrix(srow, X2FPNCOMPNOS_COL) = ToMyNumFmt(.Fields("FpnCompNos"), mDecimals:=0)
        Mfgrd2.TextMatrix(srow, X2COMPTIMESTR_COL) = SecToTime(.Fields("FpnCompTime"))
        Mfgrd2.TextMatrix(srow, X2FPNCODE_COL) = .Fields("FpnCode")
        Mfgrd2.TextMatrix(srow, X2FPNSNO_COL) = .Fields("FpnSno")
        Mfgrd2.TextMatrix(srow, X2FPNEMPCODE_COL) = .Fields("FpnEmpCode")
        Mfgrd2.TextMatrix(srow, X2FPNITMCODE_COL) = .Fields("FpnItmCode")
        Mfgrd2.TextMatrix(srow, X2FPNMACCODE_COL) = .Fields("FpnMacCode")
        Mfgrd2.TextMatrix(srow, X2FPNMPRCODE_COL) = .Fields("FpnMprCode")
        Mfgrd2.TextMatrix(srow, X2FPNSFTCODE_COL) = .Fields("FpnSftCode")
        Mfgrd2.TextMatrix(srow, X2FPNWTCYCLETIME_COL) = .Fields("FpnWtCycleTime")
        Mfgrd2.TextMatrix(srow, X2FPNNOSCYCLETIME_COL) = .Fields("FpnNosCycleTime")
        Mfgrd2.TextMatrix(srow, X2FPNTIME_COL) = .Fields("FpnTime")
        Mfgrd2.TextMatrix(srow, X2FPNCOMPTIME_COL) = .Fields("FpnCompTime")
        Mfgrd2.TextMatrix(srow, X2FPNSTKCODE_COL) = .Fields("FpnStkCode")
        Mfgrd2.TextMatrix(srow, X2FPNSTKICODEIS_COL) = .Fields("FpnStkICodeIs")
        Mfgrd2.TextMatrix(srow, X2FPNSTKICODERC_COL) = .Fields("FpnStkICodeRc")
        Mfgrd2.TextMatrix(srow, X2FPNRECSTATE_COL) = .Fields("FpnRecState")
        Rem calculate balance quantity for production
        Mfgrd2.TextMatrix(srow, X2BALWEIGHTFORPRODN_COL) = GetBalUnitForProdn(mAddEditMode:=False, mMeasUnit:=WEIGHT_UNIT, srow:=srow)
        Mfgrd2.TextMatrix(srow, X2BALNOSFORPRODN_COL) = GetBalUnitForProdn(mAddEditMode:=False, mMeasUnit:=NOS_UNIT, srow:=srow)
        Mfgrd2.TextMatrix(srow, X2BALNOSFORMACH_COL) = GetBalNosForMach(mAddEditMode:=False, srow:=srow)
        
        srow = srow + 1
        If Mfgrd2.Rows < srow + 1 Then
            Mfgrd2.Rows = Mfgrd2.Rows + 1
        End If
        
        .MoveNext
    Loop
End If
End With
CloseTable tRecset

ClearFlexRow Mfgrd2, srow
Mfgrd2.Rows = srow + 1
Mfgrd2.SetFocus

End Sub

Private Sub dtpFpnDate_GotFocus()
FlashActiveControl dtpFpnDate, True
End Sub

Private Sub dtpFpnDate_LostFocus()
FlashActiveControl dtpFpnDate, False
End Sub

Private Sub dtpFpnDate_Validate(Cancel As Boolean)
dtpFpnDate.Text = ToMyDate(dtpFpnDate.Text)
If IsFinYrDate(Ctod(dtpFpnDate.Text)) = False Then
    ErrorBox "Invalid Date !!!"
    dtpFpnDate.SetFocus
    FlashActiveControl dtpFpnDate, True
    Cancel = True
End If
Call ValidDtl

End Sub

Private Sub dtpFpnDate1_GotFocus()
FlashActiveControl dtpFpnDate1, True
End Sub

Private Sub dtpFpnDate1_LostFocus()
FlashActiveControl dtpFpnDate1, False

End Sub

Private Sub dtpFpnDate1_Validate(Cancel As Boolean)
dtpFpnDate1.Text = ToMyDate(dtpFpnDate1.Text)
If IsFinYrDate(Ctod(dtpFpnDate1.Text)) = False Then
    ErrorBox "Invalid Date !!!"
    dtpFpnDate1.SetFocus
    FlashActiveControl dtpFpnDate1, True
    Cancel = True
Else
    dtpFpnDate2.Text = dtpFpnDate1.Text
End If

End Sub

Private Sub dtpFpnDate2_GotFocus()
FlashActiveControl dtpFpnDate2, True
End Sub

Private Sub dtpFpnDate2_LostFocus()
FlashActiveControl dtpFpnDate2, False
End Sub

Private Sub dtpFpnDate2_Validate(Cancel As Boolean)
dtpFpnDate2.Text = ToMyDate(dtpFpnDate2.Text)
If IsFinYrDate(Ctod(dtpFpnDate2.Text)) = False Then
    ErrorBox "Invalid Date !!!"
    dtpFpnDate2.SetFocus
    FlashActiveControl dtpFpnDate2, True
    Cancel = True
Else
    If Ctod(dtpFpnDate1.Text) > Ctod(dtpFpnDate2.Text) Then
        dtpFpnDate1.Text = dtpFpnDate2.Text
    End If
End If

End Sub

Private Sub Form_Activate()
If mFormLoaded = False Then
    dtpFpnDate1.Text = Dtoc(DefaultEntryDate)
    dtpFpnDate2.Text = Dtoc(DefaultEntryDate)
    dtpFpnDate1.SetFocus
Else

End If

mFormLoaded = True
End Sub

Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)
mLastKeyPressed = KeyCode
Select Case KeyCode
Case 13:
Case 27:
End Select

End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)
mLastKeyPressed = KeyAscii

End Sub

Private Sub Form_Load()
Dim colcnt As Integer
mFormLoaded = False
mEntrySaved = False: mEntryAborted = False
Call Form_Resize

Call SetVoidControl(txtVoid)
mskFpnRawInNos.Enabled = False  ''' will create rounding difference in reverse calculation
mskFpnFinOutNos.Enabled = False ''' will create rounding difference in reverse calculation
mskFpnRejOutNos.Enabled = False ''' will create rounding difference in reverse calculation
mskBalWeightForProdn.Enabled = False
mskBalNosForProdn.Enabled = False
mskBalNosForMach.Enabled = False
mskFpnReqdWeight.Enabled = False
mskFpnReqdNos.Enabled = False
mskFpnCompWeight.Enabled = False
mskFpnCompNos.Enabled = False
txtCompTimeStr.Enabled = False

OpenAcDataSource dbAcDatabase
OpenStDataSource dbStDatabase
OpenTlgDataSource dbTlgDatabase
OpenPyrDataSource dbPyrDatabase
OpenGrpDataSource dbGrpDatabase
OpenComDataSource dbComDatabase

cmbSftName.Clear
cmbSftName.AddItem "Day" & Space(50) & "_1"
cmbSftName.AddItem "Night" & Space(50) & "_2"

Set clsSTK = New clsStockJrn
Set clsSTK.dbStDatabase = dbStDatabase
Set clsSTK.dbGrpDatabase = dbGrpDatabase

Set clsITM = New clsProduct
Set clsITM.dbStDatabase = dbStDatabase
Set clsITM.dbGrpDatabase = dbGrpDatabase

Set clsEMP = New clsPayrollMasterEntry
Set clsEMP.dbAcDatabase = dbAcDatabase
Set clsEMP.dbPyrDatabase = dbPyrDatabase
clsEMP.MastName = "EmpMast"

Set clsMAC = New clsToolingMasterEntry
Set clsMAC.dbTlgDatabase = dbTlgDatabase
clsMAC.MastName = "MachMast"

Set clsMPR = New clsToolingMasterEntry
Set clsMPR.dbTlgDatabase = dbTlgDatabase
clsMPR.MastName = "MatProcMast"

Set fcmbEmpName = New frmFlexSearchList
Set fcmbEmpName.dbAcDatabase = dbAcDatabase
Set fcmbEmpName.dbComDatabase = dbComDatabase
Set fcmbEmpName.frmAccessMaster = New frmEmployeeMast
fcmbEmpName.mMachOptrList = True
Load fcmbEmpName

Set fcmbItmName = New frmFlexSearchList
Set fcmbItmName.dbStDatabase = dbStDatabase
Set fcmbItmName.frmAccessMaster = New frmItemMast
fcmbItmName.mProdMastList = True
Load fcmbItmName

Set fcmbMacName = New frmFlexSearchList
Set fcmbMacName.dbTlgDatabase = dbTlgDatabase
Set fcmbMacName.frmAccessMaster = New frmMachineMaster
fcmbMacName.mMachMastList = True
Load fcmbMacName

Set fcmbMprName = New frmFlexSearchList
Set fcmbMprName.dbTlgDatabase = dbTlgDatabase
Set fcmbMprName.frmAccessMaster = New frmMaterialProcessMast
fcmbMprName.mMatProcMastList = True
Load fcmbMprName

Mfgrd2.Rows = 2: Mfgrd2.FixedRows = 1: Mfgrd2.Cols = MFGRD2_COLS: Mfgrd2.FixedCols = 0
colcnt = X2FPNICODE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2FPNICODE_COL": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2FPNDATE_COL: Mfgrd2.ColWidth(colcnt) = dtpFpnDate.Width: Mfgrd2.TextMatrix(0, colcnt) = "Date": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2EMPNAME_COL: Mfgrd2.ColWidth(colcnt) = txtEmpName.Width: Mfgrd2.TextMatrix(0, colcnt) = "Operator Name": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2ITMNAME_COL: Mfgrd2.ColWidth(colcnt) = txtItmName.Width: Mfgrd2.TextMatrix(0, colcnt) = "Material": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2MACNAME_COL: Mfgrd2.ColWidth(colcnt) = txtMacName.Width: Mfgrd2.TextMatrix(0, colcnt) = "Machine Name": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2MPRNAME_COL: Mfgrd2.ColWidth(colcnt) = txtMprName.Width: Mfgrd2.TextMatrix(0, colcnt) = "Process": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2SFTNAME_COL: Mfgrd2.ColWidth(colcnt) = cmbSftName.Width: Mfgrd2.TextMatrix(0, colcnt) = "Shift": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2FPNRAWINWEIGHT_COL: Mfgrd2.ColWidth(colcnt) = mskFpnRawInWeight.Width: Mfgrd2.TextMatrix(0, colcnt) = "Opr.Weight": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2FPNUNITWEIGHT_COL: Mfgrd2.ColWidth(colcnt) = mskFpnUnitWeight.Width: Mfgrd2.TextMatrix(0, colcnt) = "Weight/Pcs": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2FPNRAWINNOS_COL: Mfgrd2.ColWidth(colcnt) = mskFpnRawInNos.Width: Mfgrd2.TextMatrix(0, colcnt) = "Opr.Nos.": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2FPNFINOUTWEIGHT_COL: Mfgrd2.ColWidth(colcnt) = mskFpnFinOutWeight.Width: Mfgrd2.TextMatrix(0, colcnt) = "OK Weight": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2FPNFINOUTNOS_COL: Mfgrd2.ColWidth(colcnt) = mskFpnFinOutNos.Width: Mfgrd2.TextMatrix(0, colcnt) = "OK Nos.": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2FPNREJOUTWEIGHT_COL: Mfgrd2.ColWidth(colcnt) = mskFpnRejOutWeight.Width: Mfgrd2.TextMatrix(0, colcnt) = "Rej.Weight": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2FPNREJOUTNOS_COL: Mfgrd2.ColWidth(colcnt) = mskFpnRejOutNos.Width: Mfgrd2.TextMatrix(0, colcnt) = "Rej.Nos.": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2WTCYCLETIMESTR_COL: Mfgrd2.ColWidth(colcnt) = txtWtCycleTimeStr.Width: Mfgrd2.TextMatrix(0, colcnt) = "Wt.Cycle Time": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2NOSCYCLETIMESTR_COL: Mfgrd2.ColWidth(colcnt) = txtNosCycleTimeStr.Width: Mfgrd2.TextMatrix(0, colcnt) = "Nos.Cycle Time": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2TIMESTR_COL: Mfgrd2.ColWidth(colcnt) = txtTimeStr.Width: Mfgrd2.TextMatrix(0, colcnt) = "Time": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2FPNREQDWEIGHT_COL: Mfgrd2.ColWidth(colcnt) = mskFpnReqdWeight.Width: Mfgrd2.TextMatrix(0, colcnt) = "Reqd.Weight": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2FPNREQDNOS_COL: Mfgrd2.ColWidth(colcnt) = mskFpnReqdNos.Width: Mfgrd2.TextMatrix(0, colcnt) = "Reqd.Nos": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2FPNCOMPWEIGHT_COL: Mfgrd2.ColWidth(colcnt) = mskFpnCompWeight.Width: Mfgrd2.TextMatrix(0, colcnt) = "Comp.Weight": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2FPNCOMPNOS_COL: Mfgrd2.ColWidth(colcnt) = mskFpnCompNos.Width: Mfgrd2.TextMatrix(0, colcnt) = "Comp.Nos.": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2COMPTIMESTR_COL: Mfgrd2.ColWidth(colcnt) = txtCompTimeStr.Width: Mfgrd2.TextMatrix(0, colcnt) = "Comp.Time": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2BALWEIGHTFORPRODN_COL: Mfgrd2.ColWidth(colcnt) = mskBalWeightForProdn.Width: Mfgrd2.TextMatrix(0, colcnt) = "Issued Bal.Wt.": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2BALNOSFORPRODN_COL: Mfgrd2.ColWidth(colcnt) = mskBalNosForProdn.Width: Mfgrd2.TextMatrix(0, colcnt) = "Issued Bal.Nos.": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2BALNOSFORMACH_COL: Mfgrd2.ColWidth(colcnt) = mskBalNosForMach.Width: Mfgrd2.TextMatrix(0, colcnt) = "Forged.Bal.": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2FPNCODE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2FPNCODE_COL": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2FPNSNO_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2FPNSNO_COL": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2FPNEMPCODE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2FPNEMPCODE_COL": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2FPNITMCODE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2FPNITMCODE_COL": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2FPNMACCODE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2FPNMACCODE_COL": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2FPNMPRCODE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2FPNMPRCODE_COL": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2FPNSFTCODE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2FPNSFTCODE_COL": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2FPNWTCYCLETIME_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2FPNWTCYCLETIME_COL": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2FPNNOSCYCLETIME_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2FPNNOSCYCLETIME_COL": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2FPNTIME_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2FPNTIME_COL": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2FPNCOMPTIME_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2FPNCOMPTIME_COL": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2FPNSTKCODE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2FPNSTKCODE_COL": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2FPNSTKICODEIS_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2FPNSTKICODEIS_COL": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2FPNSTKICODERC_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2FPNSTKICODERC_COL": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2FPNRECSTATE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2FPNRECSTATE_COL": Mfgrd2.ColAlignment(colcnt) = 1

EnableControls False

End Sub

Private Sub Form_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
mLastKeyPressed = 0
End Sub

Private Sub Form_Resize()
lblFormHeading.Width = Me.Width
cmdFormEscape.Left = Me.Width - (cmdFormEscape.Width * 2)
cmdFormEnter.Left = Me.Width + cmdFormEscape.Width

End Sub

Private Sub Form_Unload(Cancel As Integer)
Set clsSTK = Nothing
Set clsITM = Nothing
Set clsEMP = Nothing
Set clsMAC = Nothing
Set clsMPR = Nothing
Unload fcmbEmpName
Unload fcmbItmName
Unload fcmbMacName
Unload fcmbMprName
Set fcmbEmpName = Nothing
Set fcmbItmName = Nothing
Set fcmbMacName = Nothing
Set fcmbMprName = Nothing

CloseDataSource dbAcDatabase
CloseDataSource dbStDatabase
CloseDataSource dbTlgDatabase
CloseDataSource dbPyrDatabase
CloseDataSource dbGrpDatabase
CloseDataSource dbComDatabase

End Sub

Private Sub Mfgrd2_DblClick()
Call Mfgrd2_KeyPress(13)
End Sub

Private Sub Mfgrd2_GotFocus()
Mfgrd2.Col = FlexLeftVisibleCol(Mfgrd2)
Mfgrd2.LeftCol = Mfgrd2.Col
If Mfgrd2.SelectionMode = flexSelectionByRow Then
    Mfgrd2.ColSel = 0: Mfgrd2.ColSel = Mfgrd2.Cols - 1
End If
Call Mfgrd2_RowColChange

End Sub

Private Sub Mfgrd2_KeyDown(KeyCode As Integer, Shift As Integer)
If Shift = 0 Then
    If InList(KeyCode, Array(vbKeyDelete, vbKeySubtract)) Then
        Call Data_DeleteEvent
    End If
End If

End Sub

Private Sub Data_DeleteEvent()
Dim FPNRecset As New ADODB.Recordset
Dim srow As Long, mDeleteit As Boolean, mFpnStkCode As Long, mFpnCode As Long
If Mfgrd2.Row = FlexNewRow(Mfgrd2) Then
    GoTo EndSub
End If
srow = Mfgrd2.Row
mFpnStkCode = Val(Mfgrd2.TextMatrix(srow, X2FPNSTKCODE_COL))
mFpnCode = Val(Mfgrd2.TextMatrix(srow, X2FPNCODE_COL))

mDeleteit = True

If mDeleteit = True Then
    Rem entry deletion does not affect inheritant but only successors
    Rem mDeleteit = ChkFpnInUnit(mAddEditMode:=False, mMeasUnit:=0)
End If

If mDeleteit = True Then
    mDeleteit = ChkFpnFinOutUnit(mAddEditMode:=False)
End If

If mDeleteit = True Then
    mDeleteit = CanDelete()
End If
If mDeleteit = True Then
    Rem begin transaction --------------------------
    Data_CreateLog mFpnCode
    clsSTK.BeginStock mFpnStkCode
    
    Rem delete transaction ------------------------------
    Rem Production
    dbTlgDatabase.BeginTrans
    With FPNRecset
    .Open "Select * from ForgProdn where FpnCode=" & CStr(mFpnCode) & " order by FpnICode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
    If .RecordCount > 0 Then
        .MoveFirst
        Do While .EOF = False
            .Fields("FpnRecState") = ChkDeleteRecStatus(.Fields("FpnRecState"))
            .Update
            Rem marked for deletion only, physically deleted in CommitStock
            .MoveNext
        Loop
    End If
    End With
    dbTlgDatabase.CommitTrans
    CloseTable FPNRecset
    
    Rem StockJrn
    clsSTK.DeleteStock mFpnStkCode
    
    Rem update transaction --------------------------------------
    Rem Production
    dbTlgDatabase.BeginTrans
    FPNRecset.Open "Select * from ForgProdn where FpnCode=" & CStr(mFpnCode) & " order by FpnICode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
    With FPNRecset
    If .RecordCount > 0 Then
        .MoveFirst
        Do While .EOF = False
            If InList(.Fields("FpnRecState"), Array(cREC_ADDED, cREC_EDITED, cREC_UNCHANGED)) = True Then
                .Fields("FpnRecState") = cREC_UNCHANGED
                .Update
            Else
                .Fields("FpnRecState") = ChkDeleteRecStatus(.Fields("FpnRecState"))
                .Update
                .Delete
            End If
            
            .MoveNext
        Loop
    End If
    End With
    dbTlgDatabase.CommitTrans
    CloseTable FPNRecset
    
    Rem StockJrn
    clsSTK.CommitStock mFpnStkCode
    
    Rem end transaction -----------------------------------------
    Data_RemoveLog mFpnCode
    clsSTK.EndStock mFpnStkCode
    
    RemoveFlexRow Mfgrd2, srow
    Call RefreshBalQty
    Mfgrd2.Row = srow
    Mfgrd2.SetFocus
Else
    Mfgrd2.SetFocus
End If

EndSub:
Set FPNRecset = Nothing
Exit Sub

End Sub

Private Sub Mfgrd2_KeyPress(KeyAscii As Integer)
Dim srow As Integer, mFpnStkCode As Long, mFpnCode As Long

If KeyAscii = vbKeyReturn Then
    srow = Mfgrd2.Row
    mFpnStkCode = Val(Mfgrd2.TextMatrix(srow, X2FPNSTKCODE_COL))
    mFpnCode = Val(Mfgrd2.TextMatrix(srow, X2FPNCODE_COL))
    
    dtlAddEditMode = True
    dtlAddMode = (srow = FlexNewRow(Mfgrd2))
    EnableControls True
    If dtlAddMode = True Then
        If clsSTK.BeginStock(0) = False Then
            GoTo EndSub
        End If
        mFpnCode = GetNextSeqno(dbTlgDatabase, "ForgProdn", "FpnCode")
        Data_CreateLog mFpnCode
        
        Call ChkDefaultValues
        FormAddEditMode = cFORM_ADDMODE
    Else
        If clsSTK.BeginStock(mFpnStkCode) = False Then
            GoTo EndSub
        End If
        Data_CreateLog mFpnCode
        
        ShowControlValues srow
        
        FormAddEditMode = cFORM_EDITMODE
    End If
    Mfgrd2.Col = FlexLeftVisibleCol(Mfgrd2)
    Mfgrd2.LeftCol = Mfgrd2.Col
    
    Calc_ConvQty mskFpnRawInWeight
    Calc_ConvQty mskFpnFinOutWeight
    Calc_ConvQty mskFpnRejOutWeight
    mFpnDate_old = Ctod(dtpFpnDate.Text)
    mFpnItmCode_old = Val(fcmbItmName.BoundText)
    mFpnEmpCode_old = Val(fcmbEmpName.BoundText)
    mFpnMacCode_old = Val(fcmbMacName.BoundText)
    mFpnMprCode_old = Val(fcmbMprName.BoundText)
    mFpnConsWeight_old = CurFpnConsUnit(mskFpnFinOutWeight, mMeasUnit:=WEIGHT_UNIT)
    mFpnConsNos_old = CurFpnConsUnit(mskFpnFinOutNos, mMeasUnit:=NOS_UNIT)
    mFpnFinOutWeight_old = Val(UnMyNumFmt(mskFpnFinOutWeight.Text))
    mFpnFinOutNos_old = Val(UnMyNumFmt(mskFpnFinOutNos.Text))
    
    dtpFpnDate.SetFocus
    Call ValidDtl
End If
Exit Sub

EndSub:
EnableControls False
dtlAddMode = False
dtlAddEditMode = False
FormAddEditMode = cFORM_SMRYMODE
Exit Sub

End Sub

Private Sub EnableControls(ByVal mEditItem As Boolean, Optional ByVal mRowPos)
If Me.Visible = True Then
    txtVoid.SetFocus
End If

dtpFpnDate.Text = Dtoc(DefaultEntryDate)
txtEmpName.Text = "": fcmbEmpName.BoundText = ""
txtItmName.Text = "": fcmbItmName.BoundText = ""
txtMacName.Text = "": fcmbMacName.BoundText = ""
txtMprName.Text = "": fcmbMprName.BoundText = ""

cmbSftName.ListIndex = -1
mskFpnRawInWeight.Text = ToMyNumFmt(0, mDecimals:=3)
mskFpnUnitWeight.Text = ToMyNumFmt(0, mDecimals:=3)
mskFpnRawInNos.Text = ToMyNumFmt(0, mDecimals:=0)
mskFpnFinOutWeight.Text = ToMyNumFmt(0, mDecimals:=3)
mskFpnFinOutNos.Text = ToMyNumFmt(0, mDecimals:=0)
mskFpnRejOutWeight.Text = ToMyNumFmt(0, mDecimals:=3)
mskFpnRejOutNos.Text = ToMyNumFmt(0, mDecimals:=0)
txtWtCycleTimeStr.Text = SecToTime(0)
txtNosCycleTimeStr.Text = SecToTime(0)
txtTimeStr.Text = MinToTime(0)
mskFpnReqdWeight.Text = ToMyNumFmt(0, mDecimals:=3)
mskFpnReqdNos.Text = ToMyNumFmt(0, mDecimals:=0)
mskFpnCompWeight.Text = ToMyNumFmt(0, mDecimals:=3)
mskFpnCompNos.Text = ToMyNumFmt(0, mDecimals:=0)
txtCompTimeStr.Text = SecToTime(0)
mskBalWeightForProdn.Text = ToMyNumFmt(0, mDecimals:=3)
mskBalNosForProdn.Text = ToMyNumFmt(0, mDecimals:=0)
mskBalNosForMach.Text = ToMyNumFmt(0, mDecimals:=0)

Call ValidDtl

frFlexControls.Enabled = mEditItem

Rem list of header and grid controls are common so resetting it to header values after addition/editing ends
If mEditItem = False Then
    fcmbEmpName.Text = txtEmpName1.Text: txtEmpName1.Text = fcmbEmpName.Text
    fcmbItmName.Text = txtItmName1.Text: txtItmName1.Text = fcmbItmName.Text
    fcmbMacName.Text = txtMacName1.Text: txtMacName1.Text = fcmbMacName.Text
    fcmbMprName.Text = txtMprName1.Text: txtMprName1.Text = fcmbMprName.Text
End If

frHeader.Enabled = (mEditItem = False)
Mfgrd2.Enabled = (mEditItem = False)
If mEditItem = False Then
    FormAddEditMode = cFORM_SMRYMODE
End If

End Sub

Private Sub ValidDtl()
Dim mDataOk As Boolean
mDataOk = (IsFinYrDate(Ctod(dtpFpnDate.Text)) = True And Val(fcmbEmpName.BoundText) > 0 And Val(fcmbItmName.BoundText) > 0 And Val(fcmbMacName.BoundText) > 0 And Val(fcmbMprName.BoundText) > 0 And Val(UnMyNumFmt(mskFpnFinOutNos.Text)) > 0)
If mDataOk = True And InterActiveChange(cmdOK) = True Then
    mDataOk = (ChkFpnInUnit(mAddEditMode:=True, mMeasUnit:=0) = True)
End If
If mDataOk = True And InterActiveChange(cmdOK) = True Then
    mDataOk = (ChkFpnOutUnitTot() = True)
End If
If mDataOk = True And InterActiveChange(cmdOK) = True And dtlAddMode = False Then
    mDataOk = (ChkFpnFinOutUnit(mAddEditMode:=True) = True)
End If
If mDataOk = True Then
    mskBalWeightForProdn.Text = ToMyNumFmt(GetBalUnitForProdn(mAddEditMode:=True, mMeasUnit:=WEIGHT_UNIT, srow:=Mfgrd2.Row), mDecimals:=3)
    mskBalNosForProdn.Text = ToMyNumFmt(GetBalUnitForProdn(mAddEditMode:=True, mMeasUnit:=NOS_UNIT, srow:=Mfgrd2.Row), mDecimals:=0)
    mskBalNosForMach.Text = ToMyNumFmt(GetBalNosForMach(mAddEditMode:=True, srow:=Mfgrd2.Row), mDecimals:=0)
    Call ChkCTComp
Else
    mskBalWeightForProdn.Text = ToMyNumFmt(0, mDecimals:=3)
    mskBalNosForProdn.Text = ToMyNumFmt(0, mDecimals:=0)
    mskBalNosForMach.Text = ToMyNumFmt(0, mDecimals:=0)
    mskFpnReqdWeight.Text = ToMyNumFmt(0, mDecimals:=3)
    mskFpnReqdNos.Text = ToMyNumFmt(0, mDecimals:=0)
    mskFpnCompWeight.Text = ToMyNumFmt(0, mDecimals:=3)
    mskFpnCompNos.Text = ToMyNumFmt(0, mDecimals:=0)
    txtCompTimeStr.Text = SecToTime(0)
End If

cmdOK.Caption = IIf(mDataOk = True, "&OK", "&Cancel")
cmdOK.BackColor = IIf(mDataOk = True, &H80FF80, &H8080FF)
End Sub

Private Sub Calc_ConvQty(ByRef mObj As Object)
If mObj.Name = mskFpnRawInWeight.Name Then
    mskFpnRawInNos.Text = ToMyNumFmt(MyDivide(Val(UnMyNumFmt(mskFpnRawInWeight.Text)), Val(UnMyNumFmt(mskFpnUnitWeight.Text))), mDecimals:=0)
ElseIf mObj.Name = mskFpnFinOutWeight.Name Then
    mskFpnFinOutNos.Text = ToMyNumFmt(MyDivide(Val(UnMyNumFmt(mskFpnFinOutWeight.Text)), Val(UnMyNumFmt(mskFpnUnitWeight.Text))), mDecimals:=0)
ElseIf mObj.Name = mskFpnRejOutWeight.Name Then
    mskFpnRejOutNos.Text = ToMyNumFmt(MyDivide(Val(UnMyNumFmt(mskFpnRejOutWeight.Text)), Val(UnMyNumFmt(mskFpnUnitWeight.Text))), mDecimals:=0)
End If

End Sub

Private Sub Mfgrd2_RowColChange()
Dim srow As Long
srow = Mfgrd2.Row
If dtlAddEditMode = False Then
    ShowControlValues srow
End If

End Sub

Private Sub mskFpnRejOutWeight_GotFocus()
FlashActiveControl mskFpnRejOutWeight, True
End Sub

Private Sub mskFpnRejOutWeight_LostFocus()
FlashActiveControl mskFpnRejOutWeight, False
End Sub

Private Sub mskFpnRejOutWeight_Validate(Cancel As Boolean)
mskFpnRejOutWeight.Text = ToMyNumFmt(mskFpnRejOutWeight.Text, mDecimals:=3)

Calc_ConvQty mskFpnRejOutWeight
If ChkFpnInUnit(mAddEditMode:=True, mMeasUnit:=WEIGHT_UNIT) = False Then
    Rem only message because other input qty change might be required
End If

Call ValidDtl
End Sub

Private Sub mskFpnUnitWeight_GotFocus()
FlashActiveControl mskFpnUnitWeight, True
End Sub

Private Sub mskFpnUnitWeight_LostFocus()
FlashActiveControl mskFpnUnitWeight, False
End Sub

Private Sub mskFpnUnitWeight_Validate(Cancel As Boolean)
mskFpnUnitWeight.Text = ToMyNumFmt(mskFpnUnitWeight.Text, mDecimals:=3)
If Val(UnMyNumFmt(mskFpnUnitWeight.Text)) <= 0 Then
    ErrorBox "Invalid Unit Weight !!!"
    Cancel = True
    mskFpnUnitWeight.SetFocus
Else
    Calc_ConvQty mskFpnRawInWeight
    Calc_ConvQty mskFpnFinOutWeight
    Calc_ConvQty mskFpnRejOutWeight
    Rem checking balance available qty
    If ChkFpnInUnit(mAddEditMode:=True, mMeasUnit:=0) = False Then
        Rem only message because other wip input qty change might be required
    End If
End If


Call ValidDtl

End Sub

Private Sub txtNosCycleTimeStr_GotFocus()
FlashActiveControl txtNosCycleTimeStr, True
End Sub

Private Sub txtNosCycleTimeStr_LostFocus()
FlashActiveControl txtNosCycleTimeStr, False
End Sub

Private Sub txtNosCycleTimeStr_Validate(Cancel As Boolean)
txtNosCycleTimeStr.Text = SecToTime(TimeToSec(txtNosCycleTimeStr.Text))
Call ValidDtl
End Sub

Private Sub txtWtCycleTimeStr_GotFocus()
FlashActiveControl txtWtCycleTimeStr, True
End Sub

Private Sub txtWtCycleTimeStr_LostFocus()
FlashActiveControl txtWtCycleTimeStr, False
End Sub

Private Sub txtWtCycleTimeStr_Validate(Cancel As Boolean)
txtWtCycleTimeStr.Text = SecToTime(TimeToSec(txtWtCycleTimeStr.Text))
Call ValidDtl
End Sub

Private Sub mskFpnFinOutWeight_GotFocus()
FlashActiveControl mskFpnFinOutWeight, True
End Sub

Private Sub mskFpnFinOutWeight_LostFocus()
FlashActiveControl mskFpnFinOutWeight, False
End Sub

Private Sub mskFpnFinOutWeight_Validate(Cancel As Boolean)
mskFpnFinOutWeight.Text = ToMyNumFmt(mskFpnFinOutWeight.Text, mDecimals:=3)
If Val(UnMyNumFmt(mskFpnFinOutWeight.Text)) <= 0 Then
    ErrorBox "Invalid Ok Weight !!!"
    mskFpnFinOutWeight.SetFocus
    Cancel = True
Else
    Calc_ConvQty mskFpnFinOutWeight
    
    If ChkFpnInUnit(mAddEditMode:=True, mMeasUnit:=WEIGHT_UNIT) = False Then
        Rem only message because other input qty change might be required
    Else
        If dtlAddMode = False Then
            If ChkFpnFinOutUnit(mAddEditMode:=True) = False Then
                mskFpnFinOutWeight.SetFocus
                Cancel = True
            End If
        End If
    End If
End If
Call ValidDtl

End Sub

Private Sub mskFpnFinOutNos_GotFocus()
FlashActiveControl mskFpnFinOutNos, True
End Sub

Private Sub mskFpnFinOutNos_LostFocus()
FlashActiveControl mskFpnFinOutNos, False
End Sub

Private Sub mskFpnFinOutNos_Validate(Cancel As Boolean)
mskFpnFinOutNos.Text = ToMyNumFmt(mskFpnFinOutNos.Text, mDecimals:=0)
If Val(UnMyNumFmt(mskFpnFinOutNos.Text)) <= 0 Then
    ErrorBox "Invalid Nos. !!!"
    mskFpnFinOutNos.SetFocus
    Cancel = True
Else
    If ChkFpnInUnit(mAddEditMode:=True, mMeasUnit:=NOS_UNIT) = False Then
        Rem only message because other input qty change might be required
    Else
        If dtlAddMode = False Then
            If ChkFpnFinOutUnit(mAddEditMode:=True) = False Then
                mskFpnFinOutNos.SetFocus
                Cancel = True
            End If
        End If
    End If
End If
Call ValidDtl

End Sub

Rem finish output production should not fall short for already packed material, and that too for upto current date as well for consequetive dates also
Private Function ChkFpnFinOutUnit(ByVal mAddEditMode As Boolean) As Boolean
'''Dim tRecset As New ADODB.Recordset, mFpnFinOutWeight_sum As Double, mFpnFinOutNos_sum As Double, mMpkItmQty_sum As Double, mBalNos As Double, mShortFpnFinOutNos As Double
'''Dim mMaxChkDate As Date, mLoopFpnDate As Date
'''Dim mFpnDate As Date, mFpnEmpCode As Long, mFpnItmCode As Long, mFpnMacCode As Long, mFpnConsWeight As Double, mFpnConsNos As Double, mFpnFinOutWeight As Double, mFpnFinOutNos As Double
'''Dim mFpnICode As Long, srow As Long
'''
'''Rem control values will be assigned just below and not anywhere in procedural section
'''srow = Mfgrd2.Row
'''If mAddEditMode = True Then
'''    mFpnDate = Ctod(dtpFpnDate.Text)
'''    mFpnEmpCode = Val(fcmbEmpName.BoundText)
'''    mFpnItmCode = Val(fcmbItmName.BoundText)
'''    mFpnMacCode = Val(fcmbMacName.BoundText)
'''    mFpnConsWeight = CurFpnConsUnit(mskFpnFinOutWeight, mMeasUnit:=WEIGHT_UNIT)
'''    mFpnConsNos = CurFpnConsUnit(mskFpnFinOutNos, mMeasUnit:=NOS_UNIT)
'''    mFpnFinOutWeight = Val(UnMyNumFmt(mskFpnFinOutWeight.Text))
'''    mFpnFinOutNos = Val(UnMyNumFmt(mskFpnFinOutNos.Text))
'''Else
'''    Rem value assignment as done for add edit mode (keypress)
'''    mFpnDate = Ctod(Mfgrd2.TextMatrix(srow, X2FPNDATE_COL))
'''    mFpnEmpCode = Val(Mfgrd2.TextMatrix(srow, X2FPNEMPCODE_COL))
'''    mFpnItmCode = Val(Mfgrd2.TextMatrix(srow, X2FPNITMCODE_COL))
'''    mFpnMacCode = Val(Mfgrd2.TextMatrix(srow, X2FPNMACCODE_COL))
'''    mFpnConsWeight = CurFpnConsUnit(Mfgrd2, mMeasUnit:=WEIGHT_UNIT, srow:=srow)
'''    mFpnConsNos = CurFpnConsUnit(Mfgrd2, mMeasUnit:=NOS_UNIT, srow:=srow)
'''    mFpnFinOutWeight = Val(UnMyNumFmt(Mfgrd2.TextMatrix(srow, X2FPNFINOUTWEIGHT_COL)))
'''    mFpnFinOutNos = Val(UnMyNumFmt(Mfgrd2.TextMatrix(srow, X2FPNFINOUTNOS_COL)))
'''
'''    Rem old value assignment as done for add edit mode (keypress)
'''    mFpnDate_old = mFpnDate
'''    mFpnEmpCode_old = mFpnEmpCode
'''    mFpnItmCode_old = mFpnItmCode
'''    mFpnMacCode_old = mFpnMacCode
'''    mFpnConsWeight_old = mFpnConsWeight
'''    mFpnConsNos_old = mFpnConsNos
'''    mFpnFinOutWeight_old = mFpnFinOutWeight
'''    mFpnFinOutNos_old = mFpnFinOutNos
'''End If
'''mFpnICode = Val(Mfgrd2.TextMatrix(srow, X2FPNICODE_COL))
'''
'''If mFpnItmCode_old <> mFpnItmCode Then
'''    Rem check stock availability for packing of old item stock by making quantity zero
'''    Rem checking of stock availability for packing of new item is not required because it is an addition to stock for packing
'''
'''    ChkFpnFinOutUnit = True
'''    With tRecset
'''    .Open "Select top 1 * from MatPacking order by MpkDate desc", dbTlgDatabase, adOpenKeyset, adLockOptimistic
'''    If .RecordCount > 0 Then
'''        mMaxChkDate = .Fields("MpkDate")
'''    Else
'''        mMaxChkDate = mFpnDate_old
'''    End If
'''    End With
'''    CloseTable tRecset
'''
'''    mMaxChkDate = IIf(mFpnDate_old > mMaxChkDate, mFpnDate_old, mMaxChkDate)
'''    For mLoopFpnDate = mFpnDate_old To mMaxChkDate
'''        mFpnFinOutNos_sum = 0: mMpkItmQty_sum = 0
'''
'''        tRecset.Open "Select sum(FpnFinOutNos) as FpnFinOutNos_sum from ForgProdn where FpnItmCode=" & CStr(mFpnItmCode_old) & " and FpnDate<=#" & CStr(ToSysDate(mLoopFpnDate)) & "#" & IIf(dtlAddMode = False, " and FpnICode<>" & CStr(mFpnICode), "") & " group by FpnItmCode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
'''        If tRecset.RecordCount > 0 Then
'''            mFpnFinOutNos_sum = tRecset.Fields("FpnFinOutNos_sum")
'''        End If
'''        CloseTable tRecset
'''
'''        tRecset.Open "Select sum(MpkItmQty) as MpkItmQty_sum from MatPacking where MpkItmCode=" & CStr(mFpnItmCode_old) & " and MpkDate<=#" & CStr(ToSysDate(mLoopFpnDate)) & "#" & " group by MpkItmCode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
'''        If tRecset.RecordCount > 0 Then
'''            mMpkItmQty_sum = tRecset.Fields("MpkItmQty_sum")
'''        End If
'''        CloseTable tRecset
'''
'''        mBalNos = mFpnFinOutNos_sum - mMpkItmQty_sum    ''' - mFpnFinOutNos_old        ''' + mFpnFinOutNos do not add it here
'''
'''        If mBalNos < 0 Then
'''            ErrorBox "Excess Packing Qty over Production Qty is " & ToMyNumFmt(mBalNos, mDecimals:=0, mUseAbs:=True) & " on dated " & Dtoc(mLoopFpnDate) & " !!!"
'''            ChkFpnFinOutUnit = False
'''            Exit For
'''        End If
'''    Next mLoopFpnDate
'''ElseIf mFpnDate < mFpnDate_old Then
'''    Rem check stock availability for packing from new date to till end packing date
'''
'''    ChkFpnFinOutUnit = True
'''    With tRecset
'''    .Open "Select top 1 * from MatPacking order by MpkDate desc", dbTlgDatabase, adOpenKeyset, adLockOptimistic
'''    If .RecordCount > 0 Then
'''        mMaxChkDate = .Fields("MpkDate")
'''    Else
'''        mMaxChkDate = mFpnDate
'''    End If
'''    End With
'''    CloseTable tRecset
'''
'''    mMaxChkDate = IIf(mFpnDate > mMaxChkDate, mFpnDate, mMaxChkDate)
'''    For mLoopFpnDate = mFpnDate To mMaxChkDate
'''        mFpnFinOutNos_sum = 0: mMpkItmQty_sum = 0
'''
'''        tRecset.Open "Select sum(FpnFinOutNos) as FpnFinOutNos_sum from ForgProdn where FpnItmCode=" & CStr(mFpnItmCode) & " and FpnDate<=#" & CStr(ToSysDate(mLoopFpnDate)) & "#" & IIf(dtlAddMode = False, " and FpnICode<>" & CStr(mFpnICode), "") & " group by FpnItmCode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
'''        If tRecset.RecordCount > 0 Then
'''            mFpnFinOutNos_sum = tRecset.Fields("FpnFinOutNos_sum")
'''        End If
'''        CloseTable tRecset
'''
'''        tRecset.Open "Select sum(MpkItmQty) as MpkItmQty_sum from MatPacking where MpkItmCode=" & CStr(mFpnItmCode) & " and MpkDate<=#" & CStr(ToSysDate(mLoopFpnDate)) & "#" & " group by MpkItmCode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
'''        If tRecset.RecordCount > 0 Then
'''            mMpkItmQty_sum = tRecset.Fields("MpkItmQty_sum")
'''        End If
'''        CloseTable tRecset
'''
'''        mBalNos = mFpnFinOutNos_sum - mMpkItmQty_sum + mFpnFinOutNos '''- mFpnFinOutNos_old + mFpnFinOutNos
'''
'''        If mBalNos < 0 Then
'''            ErrorBox "Excess Packing Qty over Production Qty is " & ToMyNumFmt(mBalNos, mDecimals:=0, mUseAbs:=True) & " on dated " & Dtoc(mLoopFpnDate) & " !!!"
'''            ChkFpnFinOutUnit = False
'''            Exit For
'''        End If
'''    Next mLoopFpnDate
'''ElseIf mFpnDate > mFpnDate_old Then
'''    Rem check stock availability for packing from old date (back date) to previous date of current date by making production as zero
'''    Rem and then check stock availability for packing from new date to till end packing date by using production qty
'''
'''    ChkFpnFinOutUnit = True
'''    With tRecset
'''    .Open "Select top 1 * from MatPacking order by MpkDate desc", dbTlgDatabase, adOpenKeyset, adLockOptimistic
'''    If .RecordCount > 0 Then
'''        mMaxChkDate = .Fields("MpkDate")
'''        If mMaxChkDate >= mFpnDate Then
'''            mMaxChkDate = mFpnDate - 1
'''        End If
'''    Else
'''        mMaxChkDate = mFpnDate_old
'''    End If
'''    End With
'''    CloseTable tRecset
'''
'''    mMaxChkDate = IIf(mFpnDate_old > mMaxChkDate, mFpnDate_old, mMaxChkDate)
'''    For mLoopFpnDate = mFpnDate_old To mMaxChkDate
'''        mFpnFinOutNos_sum = 0: mMpkItmQty_sum = 0
'''
'''        tRecset.Open "Select sum(FpnFinOutNos) as FpnFinOutNos_sum from ForgProdn where FpnItmCode=" & CStr(mFpnItmCode) & " and FpnDate<=#" & CStr(ToSysDate(mLoopFpnDate)) & "#" & IIf(dtlAddMode = False, " and FpnICode<>" & CStr(mFpnICode), "") & " group by FpnItmCode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
'''        If tRecset.RecordCount > 0 Then
'''            mFpnFinOutNos_sum = tRecset.Fields("FpnFinOutNos_sum")
'''        End If
'''        CloseTable tRecset
'''
'''        tRecset.Open "Select sum(MpkItmQty) as MpkItmQty_sum from MatPacking where MpkItmCode=" & CStr(mFpnItmCode) & " and MpkDate<=#" & CStr(ToSysDate(mLoopFpnDate)) & "#" & " group by MpkItmCode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
'''        If tRecset.RecordCount > 0 Then
'''            mMpkItmQty_sum = tRecset.Fields("MpkItmQty_sum")
'''        End If
'''        CloseTable tRecset
'''
'''        mBalNos = mFpnFinOutNos_sum - mMpkItmQty_sum '''- mFpnFinOutNos_old    ''' + mFpnFinOutNos qty entry deleted
'''
'''        If mBalNos < 0 Then
'''            ErrorBox "Excess Packing Qty over Production Qty is " & ToMyNumFmt(mBalNos, mDecimals:=0, mUseAbs:=True) & " on dated " & Dtoc(mLoopFpnDate) & " !!!"
'''            ChkFpnFinOutUnit = False
'''            Exit For
'''        End If
'''    Next mLoopFpnDate
'''
'''    If ChkFpnFinOutUnit = True Then
'''        With tRecset
'''        .Open "Select top 1 * from MatPacking order by MpkDate desc", dbTlgDatabase, adOpenKeyset, adLockOptimistic
'''        If .RecordCount > 0 Then
'''            mMaxChkDate = .Fields("MpkDate")
'''        Else
'''            mMaxChkDate = mFpnDate
'''        End If
'''        End With
'''        CloseTable tRecset
'''
'''        mMaxChkDate = IIf(mFpnDate > mMaxChkDate, mFpnDate, mMaxChkDate)
'''        For mLoopFpnDate = mFpnDate To mMaxChkDate
'''            mFpnFinOutNos_sum = 0: mMpkItmQty_sum = 0
'''
'''            tRecset.Open "Select sum(FpnFinOutNos) as FpnFinOutNos_sum from ForgProdn where FpnItmCode=" & CStr(mFpnItmCode) & " and FpnDate<=#" & CStr(ToSysDate(mLoopFpnDate)) & "#" & IIf(dtlAddMode = False, " and FpnICode<>" & CStr(mFpnICode), "") & " group by FpnItmCode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
'''            If tRecset.RecordCount > 0 Then
'''                mFpnFinOutNos_sum = tRecset.Fields("FpnFinOutNos_sum")
'''            End If
'''            CloseTable tRecset
'''
'''            tRecset.Open "Select sum(MpkItmQty) as MpkItmQty_sum from MatPacking where MpkItmCode=" & CStr(mFpnItmCode) & " and MpkDate<=#" & CStr(ToSysDate(mLoopFpnDate)) & "#" & " group by MpkItmCode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
'''            If tRecset.RecordCount > 0 Then
'''                mMpkItmQty_sum = tRecset.Fields("MpkItmQty_sum")
'''            End If
'''            CloseTable tRecset
'''
'''            mBalNos = mFpnFinOutNos_sum - mMpkItmQty_sum + mFpnFinOutNos    ''' - mFpnFinOutNos_old
'''
'''            If mBalNos < 0 Then
'''                ErrorBox "Excess Packing Qty over Production Qty is " & ToMyNumFmt(mBalNos, mDecimals:=0, mUseAbs:=True) & " on dated " & Dtoc(mLoopFpnDate) & " !!!"
'''                ChkFpnFinOutUnit = False
'''                Exit For
'''            End If
'''        Next mLoopFpnDate
'''    End If
'''Else
'''    Rem check stock availability for packing for current date to end packing date
'''    ChkFpnFinOutUnit = True
'''    With tRecset
'''    .Open "Select top 1 * from MatPacking order by MpkDate desc", dbTlgDatabase, adOpenKeyset, adLockOptimistic
'''    If .RecordCount > 0 Then
'''        mMaxChkDate = .Fields("MpkDate")
'''    Else
'''        mMaxChkDate = mFpnDate
'''    End If
'''    End With
'''    CloseTable tRecset
'''
'''    mMaxChkDate = IIf(mFpnDate > mMaxChkDate, mFpnDate, mMaxChkDate)
'''    For mLoopFpnDate = mFpnDate To mMaxChkDate
'''        mFpnFinOutNos_sum = 0: mMpkItmQty_sum = 0
'''
'''        tRecset.Open "Select sum(FpnFinOutNos) as FpnFinOutNos_sum from ForgProdn where FpnItmCode=" & CStr(mFpnItmCode) & " and FpnDate<=#" & CStr(ToSysDate(mLoopFpnDate)) & "#" & IIf(dtlAddMode = False, " and FpnICode<>" & CStr(mFpnICode), "") & " group by FpnItmCode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
'''        If tRecset.RecordCount > 0 Then
'''            mFpnFinOutNos_sum = tRecset.Fields("FpnFinOutNos_sum")
'''        End If
'''        CloseTable tRecset
'''
'''        tRecset.Open "Select sum(MpkItmQty) as MpkItmQty_sum from MatPacking where MpkItmCode=" & CStr(mFpnItmCode) & " and MpkDate<=#" & CStr(ToSysDate(mLoopFpnDate)) & "#" & " group by MpkItmCode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
'''        If tRecset.RecordCount > 0 Then
'''            mMpkItmQty_sum = tRecset.Fields("MpkItmQty_sum")
'''        End If
'''        CloseTable tRecset
'''
'''        mBalNos = mFpnFinOutNos_sum - mMpkItmQty_sum + IIf(mAddEditMode = True, mFpnFinOutNos, 0) ''' - mFpnFinOutNos_old
'''
'''        If mBalNos < 0 Then
'''            ErrorBox "Excess Packing Qty over Production Qty is " & ToMyNumFmt(mBalNos, mDecimals:=0, mUseAbs:=True) & " on dated " & Dtoc(mLoopFpnDate) & " !!!"
'''            ChkFpnFinOutUnit = False
'''            Exit For
'''        End If
'''    Next mLoopFpnDate
'''
'''End If

ChkFpnFinOutUnit = True

End Function

Private Function GetBalNosForMach(ByVal mAddEditMode As Boolean, ByVal srow As Long) As Double
Dim tRecset As New ADODB.Recordset, mFpnFinOutNos_sum As Double, mMpkItmQty_sum As Double, mBalNos As Double
Dim mFpnDate As Date, mFpnEmpCode As Long, mFpnItmCode As Long, mFpnMacCode As Long, mFpnConsNos As Double, mFpnFinOutNos As Double
Dim mFpnICode As Long

Rem control values will be assigned just below and not anywhere in procedural section
If mAddEditMode = True Then
    mFpnDate = Ctod(dtpFpnDate.Text)
    mFpnEmpCode = Val(fcmbEmpName.BoundText)
    mFpnItmCode = Val(fcmbItmName.BoundText)
    mFpnMacCode = Val(fcmbMacName.BoundText)
    mFpnConsNos = CurFpnConsUnit(mskFpnFinOutNos, mMeasUnit:=NOS_UNIT)
    mFpnFinOutNos = Val(UnMyNumFmt(mskFpnFinOutNos.Text))
Else
    mFpnDate = Ctod(Mfgrd2.TextMatrix(srow, X2FPNDATE_COL))
    mFpnEmpCode = Val(Mfgrd2.TextMatrix(srow, X2FPNEMPCODE_COL))
    mFpnItmCode = Val(Mfgrd2.TextMatrix(srow, X2FPNITMCODE_COL))
    mFpnMacCode = Val(Mfgrd2.TextMatrix(srow, X2FPNMACCODE_COL))
    mFpnConsNos = CurFpnConsUnit(Mfgrd2, srow)
    mFpnFinOutNos = Val(UnMyNumFmt(Mfgrd2.TextMatrix(srow, X2FPNFINOUTNOS_COL)))
End If
mFpnICode = Val(Mfgrd2.TextMatrix(srow, X2FPNICODE_COL))

Rem check stock availability for packing for current date to end packing date
    
mFpnFinOutNos_sum = 0: mMpkItmQty_sum = 0

tRecset.Open "Select sum(FpnFinOutNos) as FpnFinOutNos_sum from ForgProdn where FpnItmCode=" & CStr(mFpnItmCode) & " and FpnDate<=#" & CStr(ToSysDate(mFpnDate)) & "#" & IIf(dtlAddMode = False, " and FpnICode<>" & CStr(mFpnICode), "") & " group by FpnItmCode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
If tRecset.RecordCount > 0 Then
    mFpnFinOutNos_sum = tRecset.Fields("FpnFinOutNos_sum")
End If
CloseTable tRecset

tRecset.Open "Select sum(MpkItmQty) as MpkItmQty_sum from MatPacking where MpkItmCode=" & CStr(mFpnItmCode) & " and MpkDate<=#" & CStr(ToSysDate(mFpnDate)) & "#" & " group by MpkItmCode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
If tRecset.RecordCount > 0 Then
    mMpkItmQty_sum = tRecset.Fields("MpkItmQty_sum")
End If
CloseTable tRecset

mBalNos = mFpnFinOutNos_sum - mMpkItmQty_sum + mFpnFinOutNos
      
GetBalNosForMach = mBalNos

End Function

Rem aggregate of input quanity must equal finish output + rework output + rough output + rejection output + turning defect output
Private Function ChkFpnOutUnitTot() As Boolean
Dim mFpnOutWeightTot As Double, mFpnOutNosTot As Double
mFpnOutWeightTot = Val(UnMyNumFmt(mskFpnFinOutWeight.Text)) + Val(UnMyNumFmt(mskFpnRejOutWeight.Text))
mFpnOutNosTot = Val(UnMyNumFmt(mskFpnFinOutNos.Text)) + Val(UnMyNumFmt(mskFpnRejOutNos.Text))
If mFpnOutWeightTot <> Val(UnMyNumFmt(mskFpnRawInWeight.Text)) Then
    ErrorBox "Mismatch Weight Total " & ToMyNumFmt(mFpnOutWeightTot, mDecimals:=3) & " !!!"
    ChkFpnOutUnitTot = False
ElseIf mFpnOutNosTot <> Val(UnMyNumFmt(mskFpnRawInNos.Text)) Then
    ErrorBox "Mismatch Nos. Total " & ToMyNumFmt(mFpnOutNosTot, mDecimals:=0) & " !!!"
    ChkFpnOutUnitTot = False
Else
    ChkFpnOutUnitTot = True
End If

End Function

Private Sub mskFpnRawInWeight_GotFocus()
FlashActiveControl mskFpnRawInWeight, True
End Sub

Private Sub mskFpnRawInWeight_LostFocus()
FlashActiveControl mskFpnRawInWeight, False
End Sub

Private Sub mskFpnRawInWeight_Validate(Cancel As Boolean)
mskFpnRawInWeight.Text = ToMyNumFmt(mskFpnRawInWeight.Text, mDecimals:=3)
If Val(UnMyNumFmt(mskFpnRawInWeight.Text)) <= 0 Then
    ErrorBox "Invalid Weight !!!"
    Cancel = True
    mskFpnRawInWeight.SetFocus
Else
    Calc_ConvQty mskFpnRawInWeight
    Rem checking balance available qty
    If ChkFpnInUnit(mAddEditMode:=True, mMeasUnit:=0) = False Then
        Rem only message because other wip input qty change might be required
    End If
End If
Call ValidDtl

End Sub

Private Sub mskFpnRawInNos_GotFocus()
FlashActiveControl mskFpnRawInNos, True
End Sub

Private Sub mskFpnRawInNos_LostFocus()
FlashActiveControl mskFpnRawInNos, False
End Sub

Private Sub mskFpnRawInNos_Validate(Cancel As Boolean)
mskFpnRawInNos.Text = ToMyNumFmt(mskFpnRawInNos.Text, mDecimals:=3)
If Val(UnMyNumFmt(mskFpnRawInNos.Text)) <= 0 Then
    ErrorBox "Invalid Nos. !!!"
    Cancel = True
    mskFpnRawInNos.SetFocus
Else
    Rem Calc_ConvQty ''' will create rounding difference in reverse calculation
    Rem checking balance available qty
    If ChkFpnInUnit(mAddEditMode:=True, mMeasUnit:=0) = False Then
        Rem only message because other wip input qty change might be required
    End If
End If
Call ValidDtl

End Sub

Rem production can not be greater than material issued quantity
Private Function ChkFpnInUnit(ByVal mAddEditMode As Boolean, ByVal mMeasUnit As Integer) As Boolean
Dim tRecset As New ADODB.Recordset, mFisWeight_sum As Double, mFisNos_sum As Double, mFpnConsWeight_sum As Double, mFpnConsNos_sum As Double, mBalNos As Double, mBalWeight As Double
Dim mMaxChkDate As Date, mLoopFpnDate As Date
Dim mFpnDate As Date, mFpnEmpCode As Long, mFpnItmCode As Long, mFpnMacCode As Long, mFpnConsWeight As Double, mFpnConsNos As Double, mFpnFinOutWeight As Double, mFpnFinOutNos As Double
Dim mFpnICode As Long, srow As Long

Rem control values will be assigned just below and not anywhere in procedural section
srow = Mfgrd2.Row
If mAddEditMode = True Then
    mFpnDate = Ctod(dtpFpnDate.Text)
    mFpnEmpCode = Val(fcmbEmpName.BoundText)
    mFpnItmCode = Val(fcmbItmName.BoundText)
    mFpnMacCode = Val(fcmbMacName.BoundText)
    mFpnConsWeight = CurFpnConsUnit(mskFpnFinOutWeight, mMeasUnit:=WEIGHT_UNIT)
    mFpnConsNos = CurFpnConsUnit(mskFpnFinOutNos, mMeasUnit:=NOS_UNIT)
    mFpnFinOutWeight = Val(UnMyNumFmt(mskFpnFinOutWeight.Text))
    mFpnFinOutNos = Val(UnMyNumFmt(mskFpnFinOutNos.Text))
Else
    Rem value assignment as done for add edit mode (keypress)
    mFpnDate = Ctod(Mfgrd2.TextMatrix(srow, X2FPNDATE_COL))
    mFpnEmpCode = Val(Mfgrd2.TextMatrix(srow, X2FPNEMPCODE_COL))
    mFpnItmCode = Val(Mfgrd2.TextMatrix(srow, X2FPNITMCODE_COL))
    mFpnMacCode = Val(Mfgrd2.TextMatrix(srow, X2FPNMACCODE_COL))
    mFpnConsWeight = CurFpnConsUnit(Mfgrd2, mMeasUnit:=WEIGHT_UNIT, srow:=srow)
    mFpnConsNos = CurFpnConsUnit(Mfgrd2, mMeasUnit:=NOS_UNIT, srow:=srow)
    mFpnFinOutWeight = Val(UnMyNumFmt(Mfgrd2.TextMatrix(srow, X2FPNFINOUTWEIGHT_COL)))
    mFpnFinOutNos = Val(UnMyNumFmt(Mfgrd2.TextMatrix(srow, X2FPNFINOUTNOS_COL)))
    
    Rem old value assignment as done for add edit mode (keypress)
    mFpnDate_old = mFpnDate
    mFpnEmpCode_old = mFpnEmpCode
    mFpnItmCode_old = mFpnItmCode
    mFpnMacCode_old = mFpnMacCode
    mFpnConsWeight_old = mFpnConsWeight
    mFpnConsNos_old = mFpnConsNos
    mFpnFinOutWeight_old = mFpnFinOutWeight
    mFpnFinOutNos_old = mFpnFinOutNos
End If
mFpnICode = Val(Mfgrd2.TextMatrix(srow, X2FPNICODE_COL))
    
Rem assume that old entry has been deleted by ignoring existing entry and then check normally stock availability for production from current date to end production date
ChkFpnInUnit = True
With tRecset
.Open "Select top 1 * from ForgProdn order by FpnDate desc", dbTlgDatabase, adOpenKeyset, adLockOptimistic
If .RecordCount > 0 Then
    mMaxChkDate = .Fields("FpnDate")
Else
    mMaxChkDate = mFpnDate
End If
End With
CloseTable tRecset

mMaxChkDate = IIf(mFpnDate > mMaxChkDate, mFpnDate, mMaxChkDate)
For mLoopFpnDate = mFpnDate To mMaxChkDate
    mFisWeight_sum = 0: mFisNos_sum = 0: mFpnConsWeight_sum = 0: mFpnConsNos_sum = 0
    
    tRecset.Open "Select sum(FisWeight) as FisWeight_sum, sum(FisNos) as FisNos_sum from ForgIssue where FisEmpCode=" & CStr(mFpnEmpCode) & " and FisItmCode=" & CStr(mFpnItmCode) & " and FisMacCode=" & CStr(mFpnMacCode) & " and FisDate<=#" & CStr(ToSysDate(mLoopFpnDate)) & "#" & " group by FisEmpCode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
    If tRecset.RecordCount > 0 Then
        mFisWeight_sum = tRecset.Fields("FisWeight_sum")
        mFisNos_sum = tRecset.Fields("FisNos_sum")
    End If
    CloseTable tRecset
    
    tRecset.Open "Select sum(FpnConsWeight) as FpnConsWeight_sum, sum(FpnConsNos) as FpnConsNos_sum from ForgProdn where FpnEmpCode=" & CStr(mFpnEmpCode) & " and FpnItmCode=" & CStr(mFpnItmCode) & " and FpnMacCode=" & CStr(mFpnMacCode) & " and FpnDate<=#" & CStr(ToSysDate(mLoopFpnDate)) & "#" & IIf(dtlAddMode = False, " and FpnICode<>" & CStr(mFpnICode), "") & " group by FpnEmpCode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
    If tRecset.RecordCount > 0 Then
        mFpnConsWeight_sum = tRecset.Fields("FpnConsWeight_sum")
        mFpnConsNos_sum = tRecset.Fields("FpnConsNos_sum")
    End If
    CloseTable tRecset
    
    mBalWeight = mFisWeight_sum - mFpnConsWeight_sum - mFpnConsWeight
    mBalNos = mFisNos_sum - mFpnConsNos_sum - mFpnConsNos
    
    If (mMeasUnit = WEIGHT_UNIT Or mMeasUnit = 0) And mBalWeight < 0 Then
        ErrorBox "Excess Produciton Weight over Material Issued to Operator is " & ToMyNumFmt(mBalWeight, mDecimals:=3, mUseAbs:=True) & " on dated " & Dtoc(mLoopFpnDate) & " !!!"
        ChkFpnInUnit = False
        Exit For
    ElseIf (mMeasUnit = NOS_UNIT Or mMeasUnit = 0) And mBalNos < 0 Then
        ErrorBox "Excess Produciton Nos. over Material Issued to Operator is " & ToMyNumFmt(mBalNos, mDecimals:=0, mUseAbs:=True) & " on dated " & Dtoc(mLoopFpnDate) & " !!!"
        ChkFpnInUnit = False
        Exit For
    End If
Next mLoopFpnDate

End Function

Private Function GetBalUnitForProdn(ByVal mAddEditMode As Boolean, ByVal mMeasUnit As Integer, ByVal srow As Long) As Double
Dim tRecset As New ADODB.Recordset, mFisWeight_sum As Double, mFisNos_sum As Double, mFpnConsWeight_sum As Double, mFpnConsNos_sum As Double, mBalWeight As Double, mBalNos As Double
Dim mFpnDate As Date, mFpnEmpCode As Long, mFpnItmCode As Long, mFpnMacCode As Long, mFpnConsWeight As Double, mFpnConsNos As Double, mFpnFinOutWeight As Double, mFpnFinOutNos As Double
Dim mFpnICode As Long

Rem control values will be assigned just below and not anywhere in procedural section
If mAddEditMode = True Then
    mFpnDate = Ctod(dtpFpnDate.Text)
    mFpnEmpCode = Val(fcmbEmpName.BoundText)
    mFpnItmCode = Val(fcmbItmName.BoundText)
    mFpnMacCode = Val(fcmbMacName.BoundText)
    mFpnConsWeight = CurFpnConsUnit(mskFpnFinOutNos, mMeasUnit:=WEIGHT_UNIT)
    mFpnConsNos = CurFpnConsUnit(mskFpnFinOutNos, mMeasUnit:=NOS_UNIT)
    mFpnFinOutWeight = Val(UnMyNumFmt(mskFpnFinOutWeight.Text))
    mFpnFinOutNos = Val(UnMyNumFmt(mskFpnFinOutNos.Text))
Else
    Rem value assignment as done for add edit mode (keypress)
    mFpnDate = Ctod(Mfgrd2.TextMatrix(srow, X2FPNDATE_COL))
    mFpnEmpCode = Val(Mfgrd2.TextMatrix(srow, X2FPNEMPCODE_COL))
    mFpnItmCode = Val(Mfgrd2.TextMatrix(srow, X2FPNITMCODE_COL))
    mFpnMacCode = Val(Mfgrd2.TextMatrix(srow, X2FPNMACCODE_COL))
    mFpnConsWeight = CurFpnConsUnit(Mfgrd2, mMeasUnit:=WEIGHT_UNIT, srow:=srow)
    mFpnConsNos = CurFpnConsUnit(Mfgrd2, mMeasUnit:=NOS_UNIT, srow:=srow)
    mFpnFinOutWeight = Val(UnMyNumFmt(Mfgrd2.TextMatrix(srow, X2FPNFINOUTWEIGHT_COL)))
    mFpnFinOutNos = Val(UnMyNumFmt(Mfgrd2.TextMatrix(srow, X2FPNFINOUTNOS_COL)))
End If
mFpnICode = Val(Mfgrd2.TextMatrix(srow, X2FPNICODE_COL))
    
mFisNos_sum = 0: mFpnConsNos_sum = 0

tRecset.Open "Select sum(FisWeight) as FisWeight_sum, sum(FisNos) as FisNos_sum from ForgIssue where FisEmpCode=" & CStr(mFpnEmpCode) & " and FisItmCode=" & CStr(mFpnItmCode) & " and FisMacCode=" & CStr(mFpnMacCode) & " and FisDate<=#" & CStr(ToSysDate(mFpnDate)) & "#" & " group by FisEmpCode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
If tRecset.RecordCount > 0 Then
    mFisWeight_sum = tRecset.Fields("FisWeight_sum")
    mFisNos_sum = tRecset.Fields("FisNos_sum")
End If
CloseTable tRecset

tRecset.Open "Select sum(FpnConsWeight) as FpnConsWeight_sum, sum(FpnConsNos) as FpnConsNos_sum from ForgProdn where FpnEmpCode=" & CStr(mFpnEmpCode) & " and FpnItmCode=" & CStr(mFpnItmCode) & " and FpnMacCode=" & CStr(mFpnMacCode) & " and FpnDate<=#" & CStr(ToSysDate(mFpnDate)) & "#" & IIf(dtlAddMode = False, " and FpnICode<>" & CStr(mFpnICode), "") & " group by FpnEmpCode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
If tRecset.RecordCount > 0 Then
    mFpnConsWeight_sum = tRecset.Fields("FpnConsWeight_sum")
    mFpnConsNos_sum = tRecset.Fields("FpnConsNos_sum")
End If
CloseTable tRecset

mBalWeight = mFisWeight_sum - mFpnConsWeight_sum - mFpnConsWeight
mBalNos = mFisNos_sum - mFpnConsNos_sum - mFpnConsNos

If mMeasUnit = WEIGHT_UNIT Then
    GetBalUnitForProdn = mBalWeight
ElseIf mMeasUnit = NOS_UNIT Then
    GetBalUnitForProdn = mBalNos
Else
    GetBalUnitForProdn = 0
End If

End Function

Private Sub RefreshBalQty()
Dim srow As Integer
For srow = 1 To Mfgrd2.Rows - 2
    Mfgrd2.TextMatrix(srow, X2BALWEIGHTFORPRODN_COL) = ToMyNumFmt(GetBalUnitForProdn(mAddEditMode:=False, mMeasUnit:=WEIGHT_UNIT, srow:=srow), mDecimals:=3)
    Mfgrd2.TextMatrix(srow, X2BALNOSFORPRODN_COL) = ToMyNumFmt(GetBalUnitForProdn(mAddEditMode:=False, mMeasUnit:=NOS_UNIT, srow:=srow), mDecimals:=0)
    Mfgrd2.TextMatrix(srow, X2BALNOSFORMACH_COL) = ToMyNumFmt(GetBalNosForMach(mAddEditMode:=False, srow:=srow), mDecimals:=0)
Next srow

End Sub

Rem function to calculate ConsQty when Work in Process is in existence otherwise this will be input qty only
Private Function CurFpnConsUnit(ByRef mObj As Object, ByVal mMeasUnit As Integer, Optional ByVal srow As Long) As Double
If TypeOf mObj Is ADODB.Recordset Then
    With mObj
    If mMeasUnit = WEIGHT_UNIT Then
        Rem CurFpnConsUnit = .Fields("FpnFinOutWeight") + .Fields("FpnRejOutWeight")
        CurFpnConsUnit = .Fields("FpnRawInWeight")
    ElseIf mMeasUnit = NOS_UNIT Then
        Rem CurFpnConsUnit = .Fields("FpnFinOutNos") + .Fields("FpnRejOutNos")
        CurFpnConsUnit = .Fields("FpnRawInNos")
    End If
    End With
ElseIf TypeOf mObj Is MSFlexGrid Then
    With mObj
    If mMeasUnit = WEIGHT_UNIT Then
        Rem CurFpnConsUnit = Val(UnMyNumFmt(.TextMatrix(srow, X2FPNFINOUTWEIGHT_COL))) + Val(UnMyNumFmt(.TextMatrix(srow, X2FPNREJOUTWEIGHT_COL)))
        CurFpnConsUnit = Val(UnMyNumFmt(.TextMatrix(srow, X2FPNRAWINWEIGHT_COL)))
    ElseIf mMeasUnit = NOS_UNIT Then
        Rem CurFpnConsUnit = Val(UnMyNumFmt(.TextMatrix(srow, X2FPNFINOUTNOS_COL))) + Val(UnMyNumFmt(.TextMatrix(srow, X2FPNREJOUTNOS_COL)))
        CurFpnConsUnit = Val(UnMyNumFmt(.TextMatrix(srow, X2FPNRAWINNOS_COL)))
    End If
    End With
ElseIf TypeOf mObj Is TextBox Then
    If mMeasUnit = WEIGHT_UNIT Then
        Rem CurFpnConsUnit = Val(UnMyNumFmt(mskFpnFinOutWeight.Text)) + Val(UnMyNumFmt(mskFpnRejOutWeight.Text))
        CurFpnConsUnit = Val(UnMyNumFmt(mskFpnRawInWeight.Text))
    ElseIf mMeasUnit = NOS_UNIT Then
        Rem CurFpnConsUnit = Val(UnMyNumFmt(mskFpnFinOutNos.Text)) + Val(UnMyNumFmt(mskFpnRejOutNos.Text))
        CurFpnConsUnit = Val(UnMyNumFmt(mskFpnRawInNos.Text))
    End If
Else
    ErrorBox Me.Name & "_CurFpnConsUnit_1011"
End If

End Function

Private Sub mskFpnRejOutNos_GotFocus()
FlashActiveControl mskFpnRejOutNos, True
End Sub

Private Sub mskFpnRejOutNos_LostFocus()
FlashActiveControl mskFpnRejOutNos, False
End Sub

Private Sub mskFpnRejOutNos_Validate(Cancel As Boolean)
mskFpnRejOutNos.Text = ToMyNumFmt(mskFpnRejOutNos.Text, mDecimals:=0)
If ChkFpnInUnit(mAddEditMode:=True, mMeasUnit:=NOS_UNIT) = False Then
    Rem only message because other input qty change might be required
End If

Call ValidDtl
End Sub

Private Sub txtItmName_Change()
If fcmbItmName.CallFromText_Change = False Then
    fcmbItmName.CallFromText_Change = True
    If InterActiveChange(txtItmName) = True And dtlAddEditMode = True Then
        fcmbItmName.UserText = Array(txtItmName.Text, txtItmName.SelStart)
        fcmbItmName.Show 1
        txtItmName.Text = fcmbItmName.Text
    End If
    fcmbItmName.CallFromText_Change = False
End If

End Sub

Private Sub txtItmName_GotFocus()
FlashActiveControl txtItmName, True
End Sub

Private Sub txtItmName_LostFocus()
FlashActiveControl txtItmName, False
End Sub

Private Sub txtItmName_Validate(Cancel As Boolean)
If fcmbItmName.BoundText = "" Then
    ErrorBox "Invalid Item Name !!!"
    txtItmName.SetFocus
    Cancel = True
End If
Call ValidDtl

End Sub

''Private Sub ShowActiveFlexRow()
''Dim mReqdRow As Long
''
''With datRecset
''mReqdRow = .AbsolutePosition + Mfgrd1.FixedRows - 1
''If .RecordCount > 0 And .EOF = False And .BOF = False Then
''    If Mfgrd1.RowIsVisible(mReqdRow) = False Then
''        If mReqdRow > Mfgrd1.TopRow Then
''            Mfgrd1.TopRow = mReqdRow - Int(Mfgrd1.Height / Mfgrd1.RowHeightMin) + Mfgrd1.FixedRows + 1
''        Else
''            Mfgrd1.TopRow = mReqdRow
''        End If
''    End If
''    Mfgrd1.Row = mReqdRow
''Else
''    Mfgrd1.Row = Mfgrd1.FixedRows
''End If
''End With
''
''End Sub

Private Sub txtItmName1_Change()
If fcmbItmName.CallFromText_Change = False Then
    fcmbItmName.CallFromText_Change = True
    If InterActiveChange(txtItmName1) = True Then
        fcmbItmName.UserText = Array(txtItmName1.Text, txtItmName1.SelStart)
        fcmbItmName.Show 1
        txtItmName1.Text = fcmbItmName.Text
    End If
    fcmbItmName.CallFromText_Change = False
End If

End Sub

Private Sub txtItmName1_GotFocus()
FlashActiveControl txtItmName1, True

End Sub

Private Sub txtItmName1_LostFocus()
FlashActiveControl txtItmName1, False

End Sub

Private Sub txtMacName_Change()
If fcmbMacName.CallFromText_Change = False Then
    fcmbMacName.CallFromText_Change = True
    If InterActiveChange(txtMacName) = True Then
        fcmbMacName.UserText = Array(txtMacName.Text, txtMacName.SelStart)
        fcmbMacName.Show 1
        txtMacName.Text = fcmbMacName.Text
    End If
    fcmbMacName.CallFromText_Change = False
End If

End Sub

Private Sub txtMacName_GotFocus()
FlashActiveControl txtMacName, True
End Sub

Private Sub txtMacName_LostFocus()
FlashActiveControl txtMacName, False
End Sub

Private Sub txtMacName_Validate(Cancel As Boolean)
If fcmbMacName.BoundText = "" Then
    ErrorBox "Invalid Machine Selection !!!"
    txtMacName.SetFocus
    Cancel = True
End If
Call ValidDtl

End Sub

Private Sub txtMacName1_Change()
If fcmbMacName.CallFromText_Change = False Then
    fcmbMacName.CallFromText_Change = True
    If InterActiveChange(txtMacName1) = True Then
        fcmbMacName.UserText = Array(txtMacName1.Text, txtMacName1.SelStart)
        fcmbMacName.Show 1
        txtMacName1.Text = fcmbMacName.Text
    End If
    fcmbMacName.CallFromText_Change = False
End If

End Sub

Private Sub txtMacName1_GotFocus()
FlashActiveControl txtMacName1, True
End Sub

Private Sub txtMacName1_LostFocus()
FlashActiveControl txtMacName1, False
End Sub

Private Sub txtEmpName_Change()
If fcmbEmpName.CallFromText_Change = False Then
    fcmbEmpName.CallFromText_Change = True
    If InterActiveChange(txtEmpName) = True Then
        fcmbEmpName.UserText = Array(txtEmpName.Text, txtEmpName.SelStart)
        fcmbEmpName.Show 1
        txtEmpName.Text = fcmbEmpName.Text
    End If
    fcmbEmpName.CallFromText_Change = False
End If

End Sub

Private Sub txtEmpName_GotFocus()
FlashActiveControl txtEmpName, True
End Sub

Private Sub txtEmpName_LostFocus()
FlashActiveControl txtEmpName, False
End Sub

Private Sub txtEmpName_Validate(Cancel As Boolean)
If fcmbEmpName.BoundText = "" Then
    ErrorBox "Invalid Operator Selection !!!"
    txtEmpName.SetFocus
    Cancel = True
End If
Call ValidDtl

End Sub

Private Sub txtEmpName1_Change()
If fcmbEmpName.CallFromText_Change = False Then
    fcmbEmpName.CallFromText_Change = True
    If InterActiveChange(txtEmpName1) = True Then
        fcmbEmpName.UserText = Array(txtEmpName1.Text, txtEmpName1.SelStart)
        fcmbEmpName.Show 1
        txtEmpName1.Text = fcmbEmpName.Text
    End If
    fcmbEmpName.CallFromText_Change = False
End If

End Sub

Private Sub txtEmpName1_GotFocus()
FlashActiveControl txtEmpName1, True
End Sub

Private Sub txtEmpName1_LostFocus()
FlashActiveControl txtEmpName1, False
End Sub

Private Sub ChkDefaultValues()
Dim srow As Long
srow = Mfgrd2.Row - 1
If srow > FlexHeadingRow(Mfgrd2) Then
    dtpFpnDate.Text = Mfgrd2.TextMatrix(srow, X2FPNDATE_COL)
    fcmbEmpName.BoundText = Mfgrd2.TextMatrix(srow, X2FPNEMPCODE_COL): txtEmpName.Text = fcmbEmpName.Text
    fcmbItmName.BoundText = Mfgrd2.TextMatrix(srow, X2FPNITMCODE_COL): txtItmName.Text = fcmbItmName.Text
    fcmbMacName.BoundText = Mfgrd2.TextMatrix(srow, X2FPNMACCODE_COL): txtMacName.Text = fcmbMacName.Text
    fcmbMprName.BoundText = Mfgrd2.TextMatrix(srow, X2FPNMPRCODE_COL): txtMprName.Text = fcmbMprName.Text
    cmbSftName.ListIndex = Val(Mfgrd2.TextMatrix(srow, X2FPNSFTCODE_COL)) - 1
    txtWtCycleTimeStr.Text = Mfgrd2.TextMatrix(srow, X2WTCYCLETIMESTR_COL)
    txtNosCycleTimeStr.Text = Mfgrd2.TextMatrix(srow, X2NOSCYCLETIMESTR_COL)
    txtTimeStr.Text = Mfgrd2.TextMatrix(srow, X2TIMESTR_COL)
Else
    dtpFpnDate.Text = dtpFpnDate1.Text
    fcmbEmpName.Text = txtEmpName1.Text: txtEmpName.Text = fcmbEmpName.Text
    fcmbItmName.Text = txtItmName1.Text: txtItmName.Text = fcmbItmName.Text
    fcmbMacName.Text = txtMacName1.Text: txtMacName.Text = fcmbMacName.Text
    fcmbMprName.Text = txtMprName1.Text: txtMprName.Text = fcmbMprName.Text
    cmbSftName.ListIndex = 0
    txtWtCycleTimeStr.Text = SecToTime(0)
    txtNosCycleTimeStr.Text = SecToTime(0)
    txtTimeStr.Text = MinToTime(0)
End If
mskFpnRawInNos.Text = ToMyNumFmt(0, mDecimals:=0)
mskFpnFinOutNos.Text = ToMyNumFmt(0, mDecimals:=0)
mskFpnRejOutNos.Text = ToMyNumFmt(0, mDecimals:=0)
mskFpnReqdNos.Text = ToMyNumFmt(0, mDecimals:=0)
mskFpnCompNos.Text = ToMyNumFmt(0, mDecimals:=0)
txtCompTimeStr.Text = SecToTime(0)

End Sub

Private Function Data_CreateLog(ByVal mFpnCode As Long) As Boolean
Dim FPN_LogRS As New ADODB.Recordset
Data_CreateLog = False

FPN_LogRS.Open "Select * from ForgProdn_Log where FpnCode=" & CStr(mFpnCode) & "", dbTlgDatabase, adOpenKeyset, adLockOptimistic
With FPN_LogRS
If .RecordCount = 0 Then
    .Close
    Rem only ok records will be taken in log, because not ok records are created out of crashed entries which must be cleared when entry rejected
    dbTlgDatabase.BeginTrans
    dbTlgDatabase.Execute "Insert into ForgProdn_Log Select * from ForgProdn where FpnCode=" & CStr(mFpnCode) & " and FpnRecState=" & CStr(cREC_UNCHANGED) & ""
    dbTlgDatabase.CommitTrans
Else
    .Close
    AlertBox Me.Name & "_Data_CreateLog_920"
End If
End With

Data_CreateLog = True
GoTo EndSub
Exit Function

EndSub:
Set FPN_LogRS = Nothing
Exit Function

End Function

Private Function Data_RemoveLog(ByVal mFpnCode As Long) As Boolean
Data_RemoveLog = False

dbTlgDatabase.BeginTrans
dbTlgDatabase.Execute "Delete from ForgProdn_Log where FpnCode=" & CStr(mFpnCode)
dbTlgDatabase.CommitTrans

Data_RemoveLog = True
End Function

Private Sub txtMprName_Change()
If fcmbMprName.CallFromText_Change = False Then
    fcmbMprName.CallFromText_Change = True
    If InterActiveChange(txtMprName) = True Then
        fcmbMprName.UserText = Array(txtMprName.Text, txtMprName.SelStart)
        fcmbMprName.Show 1
        txtMprName.Text = fcmbMprName.Text
    End If
    fcmbMprName.CallFromText_Change = False
End If

End Sub

Private Sub txtMprName_GotFocus()
FlashActiveControl txtMprName, True
End Sub

Private Sub txtMprName_LostFocus()
FlashActiveControl txtMprName, False
End Sub

Private Sub txtMprName_Validate(Cancel As Boolean)
If fcmbMprName.BoundText = "" Then
    ErrorBox "Invalid Process Selection !!!"
    txtMprName.SetFocus
    Cancel = True
End If
Call ValidDtl

End Sub

Private Sub txtMprName1_Change()
If fcmbMprName.CallFromText_Change = False Then
    fcmbMprName.CallFromText_Change = True
    If InterActiveChange(txtMprName1) = True Then
        fcmbMprName.UserText = Array(txtMprName1.Text, txtMprName1.SelStart)
        fcmbMprName.Show 1
        txtMprName1.Text = fcmbMprName.Text
    End If
    fcmbMprName.CallFromText_Change = False
End If

End Sub

Private Sub txtMprName1_GotFocus()
FlashActiveControl txtMprName1, True
End Sub

Private Sub txtMprName1_LostFocus()
FlashActiveControl txtMprName1, False
End Sub

Private Sub txtTimeStr_GotFocus()
FlashActiveControl txtTimeStr, True
End Sub

Private Sub txtTimeStr_LostFocus()
FlashActiveControl txtTimeStr, False
End Sub

Private Sub txtTimeStr_Validate(Cancel As Boolean)
txtTimeStr.Text = MinToTime(TimeToMin(txtTimeStr.Text))
Call ValidDtl
End Sub

Private Sub ShowControlValues(ByVal srow As Long)

dtpFpnDate.Text = Mfgrd2.TextMatrix(srow, X2FPNDATE_COL)
fcmbEmpName.BoundText = Mfgrd2.TextMatrix(srow, X2FPNEMPCODE_COL): txtEmpName.Text = fcmbEmpName.Text
fcmbItmName.BoundText = Mfgrd2.TextMatrix(srow, X2FPNITMCODE_COL): txtItmName.Text = fcmbItmName.Text
fcmbMacName.BoundText = Mfgrd2.TextMatrix(srow, X2FPNMACCODE_COL): txtMacName.Text = fcmbMacName.Text
fcmbMprName.BoundText = Mfgrd2.TextMatrix(srow, X2FPNMPRCODE_COL): txtMprName.Text = fcmbMprName.Text
cmbSftName.ListIndex = Val(Mfgrd2.TextMatrix(srow, X2FPNSFTCODE_COL)) - 1
mskFpnRawInWeight.Text = Trim(Mfgrd2.TextMatrix(srow, X2FPNRAWINWEIGHT_COL))
mskFpnUnitWeight.Text = Trim(Mfgrd2.TextMatrix(srow, X2FPNUNITWEIGHT_COL))
mskFpnRawInNos.Text = Trim(Mfgrd2.TextMatrix(srow, X2FPNRAWINNOS_COL))
mskFpnFinOutWeight.Text = Trim(Mfgrd2.TextMatrix(srow, X2FPNFINOUTWEIGHT_COL))
mskFpnFinOutNos.Text = Trim(Mfgrd2.TextMatrix(srow, X2FPNFINOUTNOS_COL))
mskFpnRejOutWeight.Text = Trim(Mfgrd2.TextMatrix(srow, X2FPNREJOUTWEIGHT_COL))
mskFpnRejOutNos.Text = Trim(Mfgrd2.TextMatrix(srow, X2FPNREJOUTNOS_COL))
txtWtCycleTimeStr.Text = Mfgrd2.TextMatrix(srow, X2WTCYCLETIMESTR_COL)
txtNosCycleTimeStr.Text = Mfgrd2.TextMatrix(srow, X2NOSCYCLETIMESTR_COL)
txtTimeStr.Text = Mfgrd2.TextMatrix(srow, X2TIMESTR_COL)
mskFpnReqdWeight.Text = Trim(Mfgrd2.TextMatrix(srow, X2FPNREQDWEIGHT_COL))
mskFpnReqdNos.Text = Trim(Mfgrd2.TextMatrix(srow, X2FPNREQDNOS_COL))
mskFpnCompWeight.Text = Trim(Mfgrd2.TextMatrix(srow, X2FPNCOMPWEIGHT_COL))
mskFpnCompNos.Text = Trim(Mfgrd2.TextMatrix(srow, X2FPNCOMPNOS_COL))
txtCompTimeStr.Text = Mfgrd2.TextMatrix(srow, X2COMPTIMESTR_COL)
mskBalWeightForProdn.Text = Trim(Mfgrd2.TextMatrix(srow, X2BALWEIGHTFORPRODN_COL))
mskBalNosForProdn.Text = Trim(Mfgrd2.TextMatrix(srow, X2BALNOSFORPRODN_COL))
mskBalNosForMach.Text = Trim(Mfgrd2.TextMatrix(srow, X2BALNOSFORMACH_COL))

End Sub

Private Sub ChkCTComp()
Dim mFpnTime As Long, mFpnWtCycleTime As Long, mFpnNosCycleTime As Long, mFpnReqdWeight As Double, mFpnReqdNos As Double, mFpnRawInWeight As Double, mFpnRawInNos As Double, mFpnCompWeight As Double, mFpnCompNos As Double, mFpnCompTime As Long

mFpnRawInWeight = UnMyNumFmt(mskFpnRawInWeight.Text)
mFpnRawInNos = UnMyNumFmt(mskFpnRawInNos.Text)
mFpnTime = TimeToSec(txtTimeStr.Text)
mFpnWtCycleTime = TimeToSec(txtWtCycleTimeStr.Text)
mFpnNosCycleTime = TimeToSec(txtNosCycleTimeStr.Text)
mFpnReqdWeight = MyDivide(mFpnTime, mFpnWtCycleTime) * 1
mFpnReqdNos = MyDivide(mFpnTime, mFpnNosCycleTime) * 1

mFpnCompWeight = mFpnRawInWeight - mFpnReqdWeight
mFpnCompNos = mFpnRawInNos - mFpnReqdNos
mFpnCompTime = mFpnCompNos * mFpnNosCycleTime / 1

mskFpnReqdWeight.Text = ToMyNumFmt(mFpnReqdWeight, mDecimals:=3)
mskFpnReqdNos.Text = ToMyNumFmt(mFpnReqdNos, mDecimals:=0)
mskFpnCompWeight.Text = ToMyNumFmt(mFpnCompWeight, mDecimals:=3)
mskFpnCompNos.Text = ToMyNumFmt(mFpnCompNos, mDecimals:=0)
txtCompTimeStr.Text = SecToTime(mFpnCompTime)

End Sub
