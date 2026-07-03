VERSION 5.00
Object = "{5E9E78A0-531B-11CF-91F6-C2863C385E30}#1.0#0"; "MSFLXGRD.OCX"
Begin VB.Form frmMacProduction 
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
      TabIndex        =   34
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
      Begin VB.TextBox dtpPdnDate2 
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
      Begin VB.TextBox dtpPdnDate1 
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
         TabIndex        =   57
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
         TabIndex        =   55
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
         TabIndex        =   38
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
         TabIndex        =   37
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
         TabIndex        =   36
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
         TabIndex        =   35
         Top             =   240
         Width           =   1095
      End
   End
   Begin VB.TextBox txtVoid 
      CausesValidation=   0   'False
      Height          =   375
      Left            =   120
      TabIndex        =   28
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
      TabIndex        =   33
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
      TabIndex        =   32
      TabStop         =   0   'False
      Top             =   0
      UseMaskColor    =   -1  'True
      Width           =   255
   End
   Begin VB.ComboBox cmbFormEntryMode 
      Appearance      =   0  'Flat
      Enabled         =   0   'False
      Height          =   315
      ItemData        =   "MatProdn.frx":0000
      Left            =   0
      List            =   "MatProdn.frx":000D
      Style           =   1  'Simple Combo
      TabIndex        =   31
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
      TabIndex        =   30
      Top             =   2280
      Width           =   13815
      Begin VB.Frame frFlexControls 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         ForeColor       =   &H80000008&
         Height          =   2055
         Left            =   120
         TabIndex        =   39
         Top             =   0
         Width           =   13455
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
            Left            =   11160
            TabIndex        =   24
            Tag             =   "AhCode"
            Text            =   "00:00:00"
            Top             =   960
            Width           =   1215
         End
         Begin VB.TextBox mskPdnCompQty 
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
            Left            =   9960
            TabIndex        =   23
            Tag             =   "AhCode"
            Text            =   "0.00"
            Top             =   960
            Width           =   1215
         End
         Begin VB.TextBox mskPdnReqdQty 
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
            TabIndex        =   22
            Tag             =   "AhCode"
            Text            =   "0.00"
            Top             =   960
            Width           =   1215
         End
         Begin VB.TextBox txtMprName 
            Appearance      =   0  'Flat
            Height          =   285
            Left            =   8760
            TabIndex        =   12
            Top             =   360
            Width           =   1935
         End
         Begin VB.TextBox mskBalQtyForPack 
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
            TabIndex        =   26
            Tag             =   "AhCode"
            Text            =   "0.00"
            Top             =   1560
            Width           =   1455
         End
         Begin VB.TextBox mskBalQtyForProdn 
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
            TabIndex        =   25
            Tag             =   "AhCode"
            Text            =   "0.00"
            Top             =   1560
            Width           =   1455
         End
         Begin VB.TextBox txtTimeStr 
            Appearance      =   0  'Flat
            Height          =   285
            Left            =   8040
            TabIndex        =   21
            Text            =   "00:00"
            Top             =   960
            Width           =   735
         End
         Begin VB.TextBox txtCycleTimeStr 
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
            Left            =   6960
            TabIndex        =   20
            Tag             =   "AhCode"
            Text            =   "00:00:00"
            Top             =   960
            Width           =   1095
         End
         Begin VB.TextBox mskPdnTdfOutQty 
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
            Left            =   5640
            TabIndex        =   19
            Tag             =   "AhCode"
            Text            =   "0.00"
            Top             =   960
            Width           =   1335
         End
         Begin VB.TextBox mskPdnRejOutQty 
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
            Left            =   4320
            TabIndex        =   18
            Tag             =   "AhCode"
            Text            =   "0.00"
            Top             =   960
            Width           =   1335
         End
         Begin VB.TextBox mskPdnRghOutQty 
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
            TabIndex        =   17
            Tag             =   "AhCode"
            Text            =   "0.00"
            Top             =   960
            Width           =   1335
         End
         Begin VB.TextBox mskPdnRwkOutQty 
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
            TabIndex        =   16
            Tag             =   "AhCode"
            Text            =   "0.00"
            Top             =   960
            Width           =   1455
         End
         Begin VB.TextBox mskPdnFinOutQty 
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
            TabIndex        =   15
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
            Width           =   3015
         End
         Begin VB.TextBox txtItmName 
            Appearance      =   0  'Flat
            Height          =   285
            Left            =   4320
            TabIndex        =   10
            Top             =   360
            Width           =   2535
         End
         Begin VB.TextBox txtMacName 
            Appearance      =   0  'Flat
            Height          =   285
            Left            =   6840
            TabIndex        =   11
            Top             =   360
            Width           =   1935
         End
         Begin VB.ComboBox cmbSftName 
            Appearance      =   0  'Flat
            Height          =   315
            Left            =   10680
            Style           =   2  'Dropdown List
            TabIndex        =   13
            Top             =   360
            Width           =   1095
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
            Left            =   12360
            Style           =   1  'Graphical
            TabIndex        =   27
            Top             =   960
            Width           =   735
         End
         Begin VB.TextBox dtpPdnDate 
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
         Begin VB.TextBox mskPdnRawInQty 
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
            Left            =   11760
            TabIndex        =   14
            Tag             =   "AhCode"
            Text            =   "0.00"
            Top             =   360
            Width           =   1455
         End
         Begin VB.Label Label1 
            Caption         =   "Comp.Time:"
            Height          =   255
            Index           =   24
            Left            =   11160
            TabIndex        =   60
            Top             =   720
            Width           =   1215
         End
         Begin VB.Label Label1 
            Alignment       =   1  'Right Justify
            Caption         =   "Comp.Qty.:"
            Height          =   255
            Index           =   23
            Left            =   9960
            TabIndex        =   59
            Top             =   720
            Width           =   1215
         End
         Begin VB.Label Label1 
            Alignment       =   1  'Right Justify
            Caption         =   "Reqd.Qty.:"
            Height          =   255
            Index           =   22
            Left            =   8760
            TabIndex        =   58
            Top             =   720
            Width           =   1215
         End
         Begin VB.Label Label1 
            Caption         =   "Process:"
            Height          =   255
            Index           =   20
            Left            =   8760
            TabIndex        =   56
            Top             =   120
            Width           =   1935
         End
         Begin VB.Label Label1 
            Alignment       =   1  'Right Justify
            Caption         =   "Prodn.Bal.:"
            Height          =   255
            Index           =   18
            Left            =   1560
            TabIndex        =   54
            Top             =   1320
            Width           =   1455
         End
         Begin VB.Label Label1 
            Alignment       =   1  'Right Justify
            Caption         =   "Issued Bal.:"
            Height          =   255
            Index           =   17
            Left            =   120
            TabIndex        =   53
            Top             =   1320
            Width           =   1455
         End
         Begin VB.Label Label1 
            Caption         =   "Cycle Time:"
            Height          =   255
            Index           =   16
            Left            =   6960
            TabIndex        =   52
            Top             =   720
            Width           =   1095
         End
         Begin VB.Label Label1 
            Alignment       =   1  'Right Justify
            Caption         =   "T.D.Qty.:"
            Height          =   255
            Index           =   15
            Left            =   5640
            TabIndex        =   51
            Top             =   720
            Width           =   1335
         End
         Begin VB.Label Label1 
            Caption         =   "Time:"
            Height          =   255
            Index           =   14
            Left            =   8040
            TabIndex        =   50
            Top             =   720
            Width           =   735
         End
         Begin VB.Label Label1 
            Alignment       =   1  'Right Justify
            Caption         =   "Rej.Qty.:"
            Height          =   255
            Index           =   13
            Left            =   4320
            TabIndex        =   49
            Top             =   720
            Width           =   1335
         End
         Begin VB.Label Label1 
            Alignment       =   1  'Right Justify
            Caption         =   "Rough Qty.:"
            Height          =   255
            Index           =   12
            Left            =   3000
            TabIndex        =   48
            Top             =   720
            Width           =   1335
         End
         Begin VB.Label Label1 
            Alignment       =   1  'Right Justify
            Caption         =   "Rework Qty.:"
            Height          =   255
            Index           =   11
            Left            =   1560
            TabIndex        =   47
            Top             =   720
            Width           =   1455
         End
         Begin VB.Label Label1 
            Alignment       =   1  'Right Justify
            Caption         =   "OK Qty.:"
            Height          =   255
            Index           =   10
            Left            =   120
            TabIndex        =   46
            Top             =   720
            Width           =   1455
         End
         Begin VB.Label Label1 
            Alignment       =   1  'Right Justify
            Caption         =   "Opr.Qty.:"
            Height          =   255
            Index           =   9
            Left            =   11760
            TabIndex        =   45
            Top             =   120
            Width           =   1455
         End
         Begin VB.Label Label1 
            Caption         =   "Shift:"
            Height          =   255
            Index           =   8
            Left            =   10680
            TabIndex        =   44
            Top             =   120
            Width           =   1095
         End
         Begin VB.Label Label1 
            Caption         =   "Machine Name:"
            Height          =   255
            Index           =   7
            Left            =   6840
            TabIndex        =   43
            Top             =   120
            Width           =   1935
         End
         Begin VB.Label Label1 
            Caption         =   "Item Name:"
            Height          =   255
            Index           =   6
            Left            =   4320
            TabIndex        =   42
            Top             =   120
            Width           =   2535
         End
         Begin VB.Label Label1 
            Caption         =   "Operator Name:"
            Height          =   255
            Index           =   5
            Left            =   1320
            TabIndex        =   41
            Top             =   120
            Width           =   3495
         End
         Begin VB.Label Label1 
            Caption         =   "Date:"
            Height          =   255
            Index           =   4
            Left            =   120
            TabIndex        =   40
            Top             =   120
            Width           =   1215
         End
      End
      Begin MSFlexGridLib.MSFlexGrid Mfgrd2 
         Height          =   3975
         Left            =   120
         TabIndex        =   7
         Top             =   2040
         Width           =   13455
         _ExtentX        =   23733
         _ExtentY        =   7011
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
      Caption         =   "Machine Production"
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
      TabIndex        =   29
      Top             =   0
      Width           =   9015
   End
End
Attribute VB_Name = "frmMacProduction"
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
Dim mPdnDate_old As Date, mPdnEmpCode_old As Long, mPdnItmCode_old As Long, mPdnMacCode_old As Long, mPdnMprCode_old As Long, mPdnConsQty_old As Double, mPdnFinOutQty_old As Double

' StockJrn transaction detail grid Mfgrd2 column definitions
Const X2PDNICODE_COL = 0
Const X2PDNDATE_COL = 1
Const X2EMPNAME_COL = 2
Const X2ITMNAME_COL = 3
Const X2MACNAME_COL = 4
Const X2MPRNAME_COL = 5
Const X2SFTNAME_COL = 6
Const X2PDNRAWINQTY_COL = 7
Const X2PDNFINOUTQTY_COL = 8
Const X2PDNRWKOUTQTY_COL = 9
Const X2PDNRGHOUTQTY_COL = 10
Const X2PDNREJOUTQTY_COL = 11
Const X2PDNTDFOUTQTY_COL = 12
Const X2CYCLETIMESTR_COL = 13
Const X2TIMESTR_COL = 14
Const X2PDNREQDQTY_COL = 15
Const X2PDNCOMPQTY_COL = 16
Const X2COMPTIMESTR_COL = 17
Const X2BALQTYFORPRODN_COL = 18
Const X2BALQTYFORPACK_COL = 19
Const X2PDNCODE_COL = 20
Const X2PDNSNO_COL = 21
Const X2PDNEMPCODE_COL = 22
Const X2PDNITMCODE_COL = 23
Const X2PDNMACCODE_COL = 24
Const X2PDNMPRCODE_COL = 25
Const X2PDNSFTCODE_COL = 26
Const X2PDNCYCLETIME_COL = 27
Const X2PDNTIME_COL = 28
Const X2PDNCOMPTIME_COL = 29
Const X2PDNSTKCODE_COL = 30
Const X2PDNSTKICODEIS_COL = 31
Const X2PDNSTKICODERC_COL = 32
Const X2PDNRECSTATE_COL = 33
Const MFGRD2_COLS = 34

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
    dtpPdnDate1.SetFocus
Else
    Unload Me
End If

End Sub

Private Sub cmdOK_Click()
Dim PDNRecset As New ADODB.Recordset, PDN_LogRS As New ADODB.Recordset
Dim srow As Long, mPdnStkCode As Long, mPdnStkICodeIs As Long, mPdnStkICodeRc As Long, mPdnCode As Long, mPdnICode As Long, mPdnSno As Long, mStkItmRefCode As Long
Dim mPdnRawInQty As Double, mPdnWipInQty As Double, mPdnRawOutQty As Double, mPdnWipOutQty As Double, mPdnFinOutQty As Double, mConsQty As Double

srow = Mfgrd2.Row
If dtlAddMode = True Then
    mPdnCode = GetNextSeqno(dbTlgDatabase, "MacProdn", "PdnCode")
    mPdnStkCode = clsSTK.ActiveStkCode
Else
    mPdnCode = Val(Mfgrd2.TextMatrix(srow, X2PDNCODE_COL))
    mPdnStkCode = Val(Mfgrd2.TextMatrix(srow, X2PDNSTKCODE_COL))
    mPdnICode = Val(Mfgrd2.TextMatrix(srow, X2PDNICODE_COL))
    mPdnStkICodeIs = Val(Mfgrd2.TextMatrix(srow, X2PDNSTKICODEIS_COL))
    mPdnStkICodeRc = Val(Mfgrd2.TextMatrix(srow, X2PDNSTKICODERC_COL))
End If
If dtlEditCanceled = False Then
    Call ValidDtl
End If
If cmdOK.Caption = "&OK" And dtlEditCanceled = False Then
    Rem addnew/update -------------------------
    Rem Production section
    dbTlgDatabase.BeginTrans
    With PDNRecset
    If dtlAddMode = True Then
        mPdnSno = GetNextSeqno(dbTlgDatabase, "MacProdn", "PdnSno", "PdnCode" = CStr(mPdnCode))
        
        PDNRecset.Open "Select * from MacProdn where PdnCode=" & CStr(mPdnCode) & "", dbTlgDatabase, adOpenKeyset, adLockOptimistic
        .AddNew
        Rem .Fields("PdnICode") = AutoNumber
        .Fields("PdnCode") = mPdnCode
        .Fields("PdnSno") = mPdnSno
    Else
        PDNRecset.Open "Select * from MacProdn where PdnCode=" & CStr(mPdnCode) & " and PdnICode=" & CStr(mPdnICode) & "", dbTlgDatabase, adOpenKeyset, adLockOptimistic
    End If
    .Fields("PdnDate") = Ctod(dtpPdnDate.Text)
    .Fields("PdnEmpCode") = Val(fcmbEmpName.BoundText)
    .Fields("PdnItmCode") = Val(fcmbItmName.BoundText)
    .Fields("PdnItmRefCode") = 0
    .Fields("PdnMacCode") = Val(fcmbMacName.BoundText)
    .Fields("PdnMprCode") = Val(fcmbMprName.BoundText)
    .Fields("PdnSftCode") = cmbSftName.ListIndex + 1
    .Fields("PdnRawInQty") = Val(UnMyNumFmt(mskPdnRawInQty.Text))
    .Fields("PdnRwkInQty") = 0
    .Fields("PdnRghInQty") = 0
    .Fields("PdnTdfInQty") = 0
    .Fields("PdnFinOutQty") = Val(UnMyNumFmt(mskPdnFinOutQty.Text))
    .Fields("PdnRwkOutQty") = Val(UnMyNumFmt(mskPdnRwkOutQty.Text))
    .Fields("PdnRghOutQty") = Val(UnMyNumFmt(mskPdnRghOutQty.Text))
    .Fields("PdnRejOutQty") = Val(UnMyNumFmt(mskPdnRejOutQty.Text))
    .Fields("PdnTdfOutQty") = Val(UnMyNumFmt(mskPdnTdfOutQty.Text))
    .Fields("PdnCycleTime") = TimeToSec(txtCycleTimeStr.Text)
    .Fields("PdnCTQty") = 1 ''' future provision
    .Fields("PdnTime") = TimeToMin(txtTimeStr.Text)
    .Fields("PdnReqdQty") = Val(UnMyNumFmt(mskPdnReqdQty.Text))
    .Fields("PdnCompQty") = Val(UnMyNumFmt(mskPdnCompQty.Text))
    .Fields("PdnCompTime") = TimeToSec(txtCompTimeStr.Text)
    .Fields("PdnNarr") = ""
    .Fields("PdnRecState") = ChkEditRecStatus(.Fields("PdnRecState"))
    .Update
    .Fields("PdnWipInQty") = .Fields("PdnRwkInQty") + .Fields("PdnRghInQty") + .Fields("PdnTdfInQty")
    .Fields("PdnWipOutQty") = .Fields("PdnRwkOutQty") + .Fields("PdnRghOutQty") + .Fields("PdnTdfOutQty")
    .Fields("PdnConsQty") = .Fields("PdnFinOutQty") + .Fields("PdnWipOutQty") + .Fields("PdnRejOutQty")     ''' - .Fields("PdnWipInQty") is under consideration
    Rem .Fields("PdnConsQty") = .Fields("PdnFinOutQty") + .Fields("PdnRejOutQty")   ' till WipInQty is not specified, assume RawInQty and WipInQty as mixed
    .Update
    
    mPdnICode = .Fields("PdnICode")
    mConsQty = .Fields("PdnConsQty")
    mPdnRawInQty = .Fields("PdnRawInQty")
    mPdnWipInQty = .Fields("PdnWipInQty")
    mPdnRawOutQty = .Fields("PdnRawOutQty")
    mPdnWipOutQty = .Fields("PdnWipOutQty")
    mPdnFinOutQty = .Fields("PdnFinOutQty")
    
    End With
    dbTlgDatabase.CommitTrans
    CloseTable PDNRecset
    
    Rem StockJrn section
    clsSTK.Clear
    If dtlAddMode = True Then
        Rem issue stock
        clsSTK.mStkDate_dt = Ctod(dtpPdnDate.Text)
        clsSTK.mStkItmCode_lng = Val(fcmbItmName.BoundText)
        clsSTK.mStkItmRefCode_lng = 0
        clsSTK.mStkQty_dbl = ToIssueQty(mConsQty)
        clsSTK.mStkRate_dbl = 0
        clsSTK.mStkValue_dbl = 0
        clsSTK.mStkNarr_str = ""
        clsSTK.mStkRecState_int = cREC_NEW
        clsSTK.mStkLItmCode_lng = 0
        
        clsSTK.AddNew mPdnStkCode
        mPdnStkICodeIs = clsSTK.mStkICode_lng
        
        Rem receipt stock
        clsSTK.mStkSno_int = 0
        Rem clsSTK.mStkQty_dbl = ToRcptQty(Val(UnMyNumFmt(mskPdnFinOutQty.Text)))   ' wipoutqty and rejoutqty is to be considered ???
        clsSTK.mStkQty_dbl = ToRcptQty(mPdnFinOutQty + mPdnWipOutQty)   ' rejoutqty is to be considered ???
        
        clsSTK.AddNew mPdnStkCode, mNewItemRef:=True
        mPdnStkICodeRc = clsSTK.mStkICode_lng
        mStkItmRefCode = clsSTK.mStkItmRefCode_lng
        
        Rem StockJrn Common entry
        clsSTK.mStkSno_int = -1
        clsSTK.mStkItmCode_lng = 0
        clsSTK.mStkItmRefCode_lng = 0
        clsSTK.mStkQty_dbl = 0
        clsSTK.mStkNarr_str = "Machine Production Entry"
        clsSTK.AddNew mPdnStkCode
    Else
        Rem issue stock
        clsSTK.GetData mPdnStkCode, mPdnStkICodeIs
        clsSTK.mStkDate_dt = Ctod(dtpPdnDate.Text)
        clsSTK.mStkItmCode_lng = Val(fcmbItmName.BoundText)
        clsSTK.mStkItmRefCode_lng = 0
        clsSTK.mStkQty_dbl = ToIssueQty(mConsQty)
        clsSTK.mStkRate_dbl = 0
        clsSTK.mStkValue_dbl = 0
        clsSTK.mStkNarr_str = ""
        clsSTK.Update mPdnStkCode, mPdnStkICodeIs
        
        Rem receipt stock
        clsSTK.GetData mPdnStkCode, mPdnStkICodeRc
        clsSTK.mStkDate_dt = Ctod(dtpPdnDate.Text)
        clsSTK.mStkItmCode_lng = Val(fcmbItmName.BoundText)
        Rem clsSTK.mStkItmRefCode_lng = 0
        Rem clsSTK.mStkQty_dbl = ToRcptQty(Val(UnMyNumFmt(mskPdnFinOutQty.Text)))   ' wipoutqty and rejoutqty is to be considered ???
        clsSTK.mStkQty_dbl = ToRcptQty(mPdnFinOutQty + mPdnWipOutQty)   ' rejoutqty is to be considered ???
        clsSTK.mStkRate_dbl = 0
        clsSTK.mStkValue_dbl = 0
        clsSTK.mStkNarr_str = ""
        If mPdnItmCode_old <> clsSTK.mStkItmCode_lng Or clsSTK.mStkItmRefCode_lng = 0 Then
            clsSTK.Update mPdnStkCode, mPdnStkICodeRc, mNewItemRef:=True
        Else
            clsSTK.Update mPdnStkCode, mPdnStkICodeRc
        End If
        mStkItmRefCode = clsSTK.mStkItmRefCode_lng
        
        Rem StockJrn common entry
        clsSTK.GetData mPdnStkCode, 0, -1
        clsSTK.mStkDate_dt = Ctod(dtpPdnDate.Text)
        clsSTK.mStkItmCode_lng = 0
        clsSTK.mStkItmRefCode_lng = 0
        clsSTK.mStkQty_dbl = 0
        clsSTK.mStkRate_dbl = 0
        clsSTK.mStkValue_dbl = 0
        clsSTK.mStkNarr_str = "Machine Production Entry"
        
        clsSTK.Update mPdnStkCode, clsSTK.mStkICode_lng
    End If
    
    Rem update stock ----------------------------------------
    Rem Production updation
    dbTlgDatabase.BeginTrans
    PDNRecset.Open "Select * from MacProdn where PdnCode=" & CStr(mPdnCode) & " order by PdnICode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
    With PDNRecset
    If .RecordCount > 0 Then
        .MoveFirst
        Do While .EOF = False
            If InList(.Fields("PdnRecState"), Array(cREC_ADDED, cREC_EDITED, cREC_UNCHANGED)) = True Then
                If dtlAddMode = True Then
                    .Fields("PdnStkCode") = mPdnStkCode
                    .Fields("PdnStkICodeIs") = mPdnStkICodeIs
                    .Fields("PdnStkICodeRc") = mPdnStkICodeRc
                    .Fields("PdnItmRefCode") = mStkItmRefCode
                Else
                    .Fields("PdnItmRefCode") = mStkItmRefCode
                End If
                .Fields("PdnRecState") = cREC_UNCHANGED
                .Update
            Else
                .Fields("PdnRecState") = ChkDeleteRecStatus(.Fields("PdnRecState"))
                .Update
                .Delete
            End If
            
            .MoveNext
        Loop
    End If
    End With
    dbTlgDatabase.CommitTrans
    CloseTable PDNRecset
    
    Rem StockJrn updation
    clsSTK.CommitStock mPdnStkCode
    
    Rem EndStock routine ----------------------------------
    Rem Production
    Data_RemoveLog mPdnCode
    
    Rem StockJrn
    clsSTK.EndStock mPdnStkCode
    
    Rem show record in flexgrid
    PDNRecset.Open "Select * from MacProdn where PdnCode=" & CStr(mPdnCode) & " and PdnICode=" & CStr(mPdnICode) & "", dbTlgDatabase, adOpenKeyset, adLockOptimistic
    With PDNRecset
    clsEMP.GetData .Fields("PdnEmpCode")
    clsITM.GetData .Fields("PdnItmCode")
    clsMAC.GetData .Fields("PdnMacCode")
    clsMPR.GetData .Fields("PdnMprCode")
    
    Mfgrd2.TextMatrix(srow, X2PDNICODE_COL) = .Fields("PdnICode")
    Mfgrd2.TextMatrix(srow, X2PDNDATE_COL) = Dtoc(.Fields("PdnDate"))
    Mfgrd2.TextMatrix(srow, X2EMPNAME_COL) = clsEMP.mAhName_str
    Mfgrd2.TextMatrix(srow, X2ITMNAME_COL) = clsITM.mItmName_str
    Mfgrd2.TextMatrix(srow, X2MACNAME_COL) = clsMAC.mName_str
    Mfgrd2.TextMatrix(srow, X2MPRNAME_COL) = clsMPR.mName_str
    Mfgrd2.TextMatrix(srow, X2SFTNAME_COL) = cmbSftName.List(.Fields("PdnSftCode") - 1)
    Mfgrd2.TextMatrix(srow, X2PDNRAWINQTY_COL) = ToMyNumFmt(.Fields("PdnRawInQty"), mDecimals:=0)
    Mfgrd2.TextMatrix(srow, X2PDNFINOUTQTY_COL) = ToMyNumFmt(.Fields("PdnFinOutQty"), mDecimals:=0)
    Mfgrd2.TextMatrix(srow, X2PDNRWKOUTQTY_COL) = ToMyNumFmt(.Fields("PdnRwkOutQty"), mDecimals:=0)
    Mfgrd2.TextMatrix(srow, X2PDNRGHOUTQTY_COL) = ToMyNumFmt(.Fields("PdnRghOutQty"), mDecimals:=0)
    Mfgrd2.TextMatrix(srow, X2PDNREJOUTQTY_COL) = ToMyNumFmt(.Fields("PdnRejOutQty"), mDecimals:=0)
    Mfgrd2.TextMatrix(srow, X2PDNTDFOUTQTY_COL) = ToMyNumFmt(.Fields("PdnTdfOutQty"), mDecimals:=0)
    Mfgrd2.TextMatrix(srow, X2CYCLETIMESTR_COL) = SecToTime(.Fields("PdnCycleTime"))
    Mfgrd2.TextMatrix(srow, X2TIMESTR_COL) = MinToTime(.Fields("PdnTime"))
    Mfgrd2.TextMatrix(srow, X2PDNREQDQTY_COL) = ToMyNumFmt(.Fields("PdnReqdQty"), mDecimals:=0)
    Mfgrd2.TextMatrix(srow, X2PDNCOMPQTY_COL) = ToMyNumFmt(.Fields("PdnCompQty"), mDecimals:=0)
    Mfgrd2.TextMatrix(srow, X2COMPTIMESTR_COL) = SecToTime(.Fields("PdnCompTime"))
    Mfgrd2.TextMatrix(srow, X2PDNCODE_COL) = .Fields("PdnCode")
    Mfgrd2.TextMatrix(srow, X2PDNSNO_COL) = .Fields("PdnSno")
    Mfgrd2.TextMatrix(srow, X2PDNEMPCODE_COL) = .Fields("PdnEmpCode")
    Mfgrd2.TextMatrix(srow, X2PDNITMCODE_COL) = .Fields("PdnItmCode")
    Mfgrd2.TextMatrix(srow, X2PDNMACCODE_COL) = .Fields("PdnMacCode")
    Mfgrd2.TextMatrix(srow, X2PDNMPRCODE_COL) = .Fields("PdnMprCode")
    Mfgrd2.TextMatrix(srow, X2PDNSFTCODE_COL) = .Fields("PdnSftCode")
    Mfgrd2.TextMatrix(srow, X2PDNCYCLETIME_COL) = .Fields("PdnCycleTime")
    Mfgrd2.TextMatrix(srow, X2PDNTIME_COL) = .Fields("PdnTime")
    Mfgrd2.TextMatrix(srow, X2PDNCOMPTIME_COL) = .Fields("PdnCompTime")
    Mfgrd2.TextMatrix(srow, X2PDNSTKCODE_COL) = .Fields("PdnStkCode")
    Mfgrd2.TextMatrix(srow, X2PDNSTKICODEIS_COL) = .Fields("PdnStkICodeIs")
    Mfgrd2.TextMatrix(srow, X2PDNSTKICODERC_COL) = .Fields("PdnStkICodeRc")
    Mfgrd2.TextMatrix(srow, X2PDNRECSTATE_COL) = .Fields("PdnRecState")
    
    End With
    CloseTable PDNRecset
    
    If dtlAddMode = True Then
        Mfgrd2.Rows = Mfgrd2.Rows + 1
    End If
    srow = srow + 1
    Mfgrd2.Row = srow
Else
    Rem cance event -----------------------------------
    Rem Production
    PDNRecset.Open "Select * from MacProdn where PdnCode=" & CStr(mPdnCode) & " order by PdnICode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
    PDN_LogRS.Open "Select * from MacProdn_Log where PdnCode=" & CStr(mPdnCode) & " order by PdnICode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
    
    dbTlgDatabase.BeginTrans
    With PDNRecset
    If .RecordCount > 0 Then
        .MoveFirst
        Do While .EOF = False
            Rem stock updation is not required because balance is updated on CommitStock and not on individual item save, hence no need to revert is back
            PDN_LogRS.Find "PdnICode=" & CStr(.Fields("PdnICode")), Start:=1
            If PDN_LogRS.EOF = False Then
                ' any prior updations can be made here
                .Fields("PdnSno") = PDN_LogRS.Fields("PdnSno")
                .Fields("PdnDate") = PDN_LogRS.Fields("PdnDate")
                .Fields("PdnEmpCode") = PDN_LogRS.Fields("PdnEmpCode")
                .Fields("PdnItmCode") = PDN_LogRS.Fields("PdnItmCode")
                .Fields("PdnItmRefCode") = PDN_LogRS.Fields("PdnItmRefCode")
                .Fields("PdnMacCode") = PDN_LogRS.Fields("PdnMacCode")
                .Fields("PdnMprCode") = PDN_LogRS.Fields("PdnMprCode")
                .Fields("PdnSftCode") = PDN_LogRS.Fields("PdnSftCode")
                .Fields("PdnRawInQty") = PDN_LogRS.Fields("PdnRawInQty")
                .Fields("PdnRwkInQty") = PDN_LogRS.Fields("PdnRwkInQty")
                .Fields("PdnRghInQty") = PDN_LogRS.Fields("PdnRghInQty")
                .Fields("PdnTdfInQty") = PDN_LogRS.Fields("PdnTdfInQty")
                .Fields("PdnFinOutQty") = PDN_LogRS.Fields("PdnFinOutQty")
                .Fields("PdnRwkOutQty") = PDN_LogRS.Fields("PdnRwkOutQty")
                .Fields("PdnRghOutQty") = PDN_LogRS.Fields("PdnRghOutQty")
                .Fields("PdnRejOutQty") = PDN_LogRS.Fields("PdnRejOutQty")
                .Fields("PdnTdfOutQty") = PDN_LogRS.Fields("PdnTdfOutQty")
                .Fields("PdnCycleTime") = PDN_LogRS.Fields("PdnCycleTime")
                .Fields("PdnCTQty") = PDN_LogRS.Fields("PdnCTQty")
                .Fields("PdnTime") = PDN_LogRS.Fields("PdnTime")
                .Fields("PdnReqdQty") = PDN_LogRS.Fields("PdnReqdQty")
                .Fields("PdnCompQty") = PDN_LogRS.Fields("PdnCompQty")
                .Fields("PdnCompTime") = PDN_LogRS.Fields("PdnCompTime")
                .Fields("PdnWipInQty") = PDN_LogRS.Fields("PdnWipInQty")
                .Fields("PdnWipOutQty") = PDN_LogRS.Fields("PdnWipOutQty")
                .Fields("PdnConsQty") = PDN_LogRS.Fields("PdnConsQty")
                .Fields("PdnNarr") = PDN_LogRS.Fields("PdnNarr")
                .Fields("PdnRecState") = PDN_LogRS.Fields("PdnRecState")
                .Update
            Else
                ' any prior updations can be made here
                .Fields("PdnRecState") = ChkDeleteRecStatus(.Fields("PdnRecState"))
                .Update
                .Delete
            End If
            
            .MoveNext
        Loop
    End If
    End With
    dbTlgDatabase.CommitTrans
    CloseTable PDNRecset
    CloseTable PDN_LogRS
    
    Rem StockJrn
    clsSTK.CancelStock mPdnStkCode
    
    Rem EndStock --------------------------------------------------
    Rem Production
    Data_RemoveLog mPdnCode
    
    Rem StockJrn
    clsSTK.EndStock mPdnStkCode
    
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
Set PDNRecset = Nothing
Set PDN_LogRS = Nothing

End Sub

Private Sub cmdShowDtlData_Click()
Dim tRecset As New ADODB.Recordset, srow As Long, cnt As Integer
srow = 1

fcmbEmpName.Text = txtEmpName1.Text: txtEmpName1.Text = fcmbEmpName.Text
fcmbItmName.Text = txtItmName1.Text: txtItmName1.Text = fcmbItmName.Text
fcmbMacName.Text = txtMacName1.Text: txtMacName1.Text = fcmbMacName.Text
fcmbMprName.Text = txtMprName1.Text: txtMprName1.Text = fcmbMprName.Text

tRecset.Open "Select * from MacProdn" _
    & " where PdnDate between #" & CStr(ToSysDate(Ctod(dtpPdnDate1.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpPdnDate2.Text))) & "#" _
    & IIf(Val(fcmbEmpName.BoundText) > 0, " and PdnEmpCode=" & CStr(Val(fcmbEmpName.BoundText)), "") _
    & IIf(Val(fcmbItmName.BoundText) > 0, " and PdnItmCode=" & CStr(Val(fcmbItmName.BoundText)), "") _
    & IIf(Val(fcmbMacName.BoundText) > 0, " and PdnMacCode=" & CStr(Val(fcmbMacName.BoundText)), "") _
    & IIf(Val(fcmbMprName.BoundText) > 0, " and PdnMprCode=" & CStr(Val(fcmbMprName.BoundText)), "") _
    & " order by PdnDate,PdnICode" _
    , dbTlgDatabase, adOpenKeyset, adLockOptimistic
With tRecset
If .RecordCount > 0 Then
    Do While .EOF = False
        clsEMP.GetData .Fields("PdnEmpCode")
        clsITM.GetData .Fields("PdnItmCode")
        clsMAC.GetData .Fields("PdnMacCode")
        clsMPR.GetData .Fields("PdnMprCode")
        
        Mfgrd2.TextMatrix(srow, X2PDNICODE_COL) = .Fields("PdnICode")
        Mfgrd2.TextMatrix(srow, X2PDNDATE_COL) = Dtoc(.Fields("PdnDate"))
        Mfgrd2.TextMatrix(srow, X2EMPNAME_COL) = clsEMP.mAhName_str
        Mfgrd2.TextMatrix(srow, X2ITMNAME_COL) = clsITM.mItmName_str
        Mfgrd2.TextMatrix(srow, X2MACNAME_COL) = clsMAC.mName_str
        Mfgrd2.TextMatrix(srow, X2MPRNAME_COL) = clsMPR.mName_str
        Mfgrd2.TextMatrix(srow, X2SFTNAME_COL) = cmbSftName.List(.Fields("PdnSftCode") - 1)
        Mfgrd2.TextMatrix(srow, X2PDNRAWINQTY_COL) = ToMyNumFmt(.Fields("PdnRawInQty"), mDecimals:=0)
        Mfgrd2.TextMatrix(srow, X2PDNFINOUTQTY_COL) = ToMyNumFmt(.Fields("PdnFinOutQty"), mDecimals:=0)
        Mfgrd2.TextMatrix(srow, X2PDNRWKOUTQTY_COL) = ToMyNumFmt(.Fields("PdnRwkOutQty"), mDecimals:=0)
        Mfgrd2.TextMatrix(srow, X2PDNRGHOUTQTY_COL) = ToMyNumFmt(.Fields("PdnRghOutQty"), mDecimals:=0)
        Mfgrd2.TextMatrix(srow, X2PDNREJOUTQTY_COL) = ToMyNumFmt(.Fields("PdnRejOutQty"), mDecimals:=0)
        Mfgrd2.TextMatrix(srow, X2PDNTDFOUTQTY_COL) = ToMyNumFmt(.Fields("PdnTdfOutQty"), mDecimals:=0)
        Mfgrd2.TextMatrix(srow, X2CYCLETIMESTR_COL) = SecToTime(.Fields("PdnCycleTime"))
        Mfgrd2.TextMatrix(srow, X2TIMESTR_COL) = MinToTime(.Fields("PdnTime"))
        Mfgrd2.TextMatrix(srow, X2PDNREQDQTY_COL) = ToMyNumFmt(.Fields("PdnReqdQty"), mDecimals:=0)
        Mfgrd2.TextMatrix(srow, X2PDNCOMPQTY_COL) = ToMyNumFmt(.Fields("PdnCompQty"), mDecimals:=0)
        Mfgrd2.TextMatrix(srow, X2COMPTIMESTR_COL) = SecToTime(.Fields("PdnCompTime"))
        Mfgrd2.TextMatrix(srow, X2PDNCODE_COL) = .Fields("PdnCode")
        Mfgrd2.TextMatrix(srow, X2PDNSNO_COL) = .Fields("PdnSno")
        Mfgrd2.TextMatrix(srow, X2PDNEMPCODE_COL) = .Fields("PdnEmpCode")
        Mfgrd2.TextMatrix(srow, X2PDNITMCODE_COL) = .Fields("PdnItmCode")
        Mfgrd2.TextMatrix(srow, X2PDNMACCODE_COL) = .Fields("PdnMacCode")
        Mfgrd2.TextMatrix(srow, X2PDNMPRCODE_COL) = .Fields("PdnMprCode")
        Mfgrd2.TextMatrix(srow, X2PDNSFTCODE_COL) = .Fields("PdnSftCode")
        Mfgrd2.TextMatrix(srow, X2PDNCYCLETIME_COL) = .Fields("PdnCycleTime")
        Mfgrd2.TextMatrix(srow, X2PDNTIME_COL) = .Fields("PdnTime")
        Mfgrd2.TextMatrix(srow, X2PDNCOMPTIME_COL) = .Fields("PdnCompTime")
        Mfgrd2.TextMatrix(srow, X2PDNSTKCODE_COL) = .Fields("PdnStkCode")
        Mfgrd2.TextMatrix(srow, X2PDNSTKICODEIS_COL) = .Fields("PdnStkICodeIs")
        Mfgrd2.TextMatrix(srow, X2PDNSTKICODERC_COL) = .Fields("PdnStkICodeRc")
        Mfgrd2.TextMatrix(srow, X2PDNRECSTATE_COL) = .Fields("PdnRecState")
        Rem calculate balance quantity for production
        Mfgrd2.TextMatrix(srow, X2BALQTYFORPRODN_COL) = GetBalQtyForProdn(mAddEditMode:=False, srow:=srow)
        Mfgrd2.TextMatrix(srow, X2BALQTYFORPACK_COL) = GetBalQtyForPack(mAddEditMode:=False, srow:=srow)
        
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

Private Sub dtpPdnDate_GotFocus()
FlashActiveControl dtpPdnDate, True
End Sub

Private Sub dtpPdnDate_LostFocus()
FlashActiveControl dtpPdnDate, False
End Sub

Private Sub dtpPdnDate_Validate(Cancel As Boolean)
dtpPdnDate.Text = ToMyDate(dtpPdnDate.Text)
If IsFinYrDate(Ctod(dtpPdnDate.Text)) = False Then
    ErrorBox "Invalid Date !!!"
    dtpPdnDate.SetFocus
    FlashActiveControl dtpPdnDate, True
    Cancel = True
End If
Call ValidDtl

End Sub

Private Sub dtpPdnDate1_GotFocus()
FlashActiveControl dtpPdnDate1, True
End Sub

Private Sub dtpPdnDate1_LostFocus()
FlashActiveControl dtpPdnDate1, False

End Sub

Private Sub dtpPdnDate1_Validate(Cancel As Boolean)
dtpPdnDate1.Text = ToMyDate(dtpPdnDate1.Text)
If IsFinYrDate(Ctod(dtpPdnDate1.Text)) = False Then
    ErrorBox "Invalid Date !!!"
    dtpPdnDate1.SetFocus
    FlashActiveControl dtpPdnDate1, True
    Cancel = True
Else
    dtpPdnDate2.Text = dtpPdnDate1.Text
End If

End Sub

Private Sub dtpPdnDate2_GotFocus()
FlashActiveControl dtpPdnDate2, True
End Sub

Private Sub dtpPdnDate2_LostFocus()
FlashActiveControl dtpPdnDate2, False
End Sub

Private Sub dtpPdnDate2_Validate(Cancel As Boolean)
dtpPdnDate2.Text = ToMyDate(dtpPdnDate2.Text)
If IsFinYrDate(Ctod(dtpPdnDate2.Text)) = False Then
    ErrorBox "Invalid Date !!!"
    dtpPdnDate2.SetFocus
    FlashActiveControl dtpPdnDate2, True
    Cancel = True
Else
    If Ctod(dtpPdnDate1.Text) > Ctod(dtpPdnDate2.Text) Then
        dtpPdnDate1.Text = dtpPdnDate2.Text
    End If
End If

End Sub

Private Sub Form_Activate()
If mFormLoaded = False Then
    dtpPdnDate1.Text = Dtoc(DefaultEntryDate)
    dtpPdnDate2.Text = Dtoc(DefaultEntryDate)
    dtpPdnDate1.SetFocus
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
mskBalQtyForProdn.Enabled = False
mskBalQtyForPack.Enabled = False
mskPdnReqdQty.Enabled = False
mskPdnCompQty.Enabled = False
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
colcnt = X2PDNICODE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2PDNICODE_COL": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2PDNDATE_COL: Mfgrd2.ColWidth(colcnt) = dtpPdnDate.Width: Mfgrd2.TextMatrix(0, colcnt) = "Date": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2EMPNAME_COL: Mfgrd2.ColWidth(colcnt) = txtEmpName.Width: Mfgrd2.TextMatrix(0, colcnt) = "Operator Name": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2ITMNAME_COL: Mfgrd2.ColWidth(colcnt) = txtItmName.Width: Mfgrd2.TextMatrix(0, colcnt) = "Material": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2MACNAME_COL: Mfgrd2.ColWidth(colcnt) = txtMacName.Width: Mfgrd2.TextMatrix(0, colcnt) = "Machine Name": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2MPRNAME_COL: Mfgrd2.ColWidth(colcnt) = txtMprName.Width: Mfgrd2.TextMatrix(0, colcnt) = "Process": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2SFTNAME_COL: Mfgrd2.ColWidth(colcnt) = cmbSftName.Width: Mfgrd2.TextMatrix(0, colcnt) = "Shift": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2PDNRAWINQTY_COL: Mfgrd2.ColWidth(colcnt) = mskPdnRawInQty.Width: Mfgrd2.TextMatrix(0, colcnt) = "Opr.Qty": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2PDNFINOUTQTY_COL: Mfgrd2.ColWidth(colcnt) = mskPdnFinOutQty.Width: Mfgrd2.TextMatrix(0, colcnt) = "OK Qty": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2PDNRWKOUTQTY_COL: Mfgrd2.ColWidth(colcnt) = mskPdnRwkOutQty.Width: Mfgrd2.TextMatrix(0, colcnt) = "Rework Qty": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2PDNRGHOUTQTY_COL: Mfgrd2.ColWidth(colcnt) = mskPdnRghOutQty.Width: Mfgrd2.TextMatrix(0, colcnt) = "Rough Qty": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2PDNREJOUTQTY_COL: Mfgrd2.ColWidth(colcnt) = mskPdnRejOutQty.Width: Mfgrd2.TextMatrix(0, colcnt) = "Rej.Qty": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2PDNTDFOUTQTY_COL: Mfgrd2.ColWidth(colcnt) = mskPdnTdfOutQty.Width: Mfgrd2.TextMatrix(0, colcnt) = "T.D.Qty": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2CYCLETIMESTR_COL: Mfgrd2.ColWidth(colcnt) = txtCycleTimeStr.Width: Mfgrd2.TextMatrix(0, colcnt) = "Cycle Time": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2TIMESTR_COL: Mfgrd2.ColWidth(colcnt) = txtTimeStr.Width: Mfgrd2.TextMatrix(0, colcnt) = "Time": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2PDNREQDQTY_COL: Mfgrd2.ColWidth(colcnt) = mskPdnReqdQty.Width: Mfgrd2.TextMatrix(0, colcnt) = "CT.Qty": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2PDNCOMPQTY_COL: Mfgrd2.ColWidth(colcnt) = mskPdnCompQty.Width: Mfgrd2.TextMatrix(0, colcnt) = "Comp.Qty": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2COMPTIMESTR_COL: Mfgrd2.ColWidth(colcnt) = txtCompTimeStr.Width: Mfgrd2.TextMatrix(0, colcnt) = "Comp.Time": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2BALQTYFORPRODN_COL: Mfgrd2.ColWidth(colcnt) = mskBalQtyForProdn.Width: Mfgrd2.TextMatrix(0, colcnt) = "Issued Bal.": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2BALQTYFORPACK_COL: Mfgrd2.ColWidth(colcnt) = mskBalQtyForPack.Width: Mfgrd2.TextMatrix(0, colcnt) = "Prodn.Bal.": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2PDNCODE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2PDNCODE_COL": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2PDNSNO_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2PDNSNO_COL": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2PDNEMPCODE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2PdnEmpCode_COL": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2PDNITMCODE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2PDNITMCODE_COL": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2PDNMACCODE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2PDNMACCODE_COL": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2PDNMPRCODE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2PDNMPRCODE_COL": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2PDNSFTCODE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2PDNSFTCODE_COL": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2PDNCYCLETIME_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2PDNCYCLETIME_COL": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2PDNTIME_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2PDNTIME_COL": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2PDNCOMPTIME_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2PDNCOMPTIME_COL": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2PDNSTKCODE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2PDNSTKCODE_COL": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2PDNSTKICODEIS_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2PDNSTKICODEIS_COL": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2PDNSTKICODERC_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2PDNSTKICODERC_COL": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2PDNRECSTATE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2PDNRECSTATE_COL": Mfgrd2.ColAlignment(colcnt) = 1

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
Dim PDNRecset As New ADODB.Recordset
Dim srow As Long, mDeleteit As Boolean, mPdnStkCode As Long, mPdnCode As Long
If Mfgrd2.Row = FlexNewRow(Mfgrd2) Then
    GoTo EndSub
End If
srow = Mfgrd2.Row
mPdnStkCode = Val(Mfgrd2.TextMatrix(srow, X2PDNSTKCODE_COL))
mPdnCode = Val(Mfgrd2.TextMatrix(srow, X2PDNCODE_COL))

mDeleteit = True

If mDeleteit = True Then
    Rem entry deletion does not affect inheritant but only successors
    Rem mDeleteit = ChkPdnInQty(mAddEditMode:=False)
End If

If mDeleteit = True Then
    mDeleteit = ChkPdnFinOutQty(mAddEditMode:=False)
End If

If mDeleteit = True Then
    mDeleteit = CanDelete()
End If
If mDeleteit = True Then
    Rem begin transaction --------------------------
    Data_CreateLog mPdnCode
    clsSTK.BeginStock mPdnStkCode
    
    Rem delete transaction ------------------------------
    Rem Production
    dbTlgDatabase.BeginTrans
    With PDNRecset
    .Open "Select * from MacProdn where PdnCode=" & CStr(mPdnCode) & " order by PdnICode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
    If .RecordCount > 0 Then
        .MoveFirst
        Do While .EOF = False
            .Fields("PdnRecState") = ChkDeleteRecStatus(.Fields("PdnRecState"))
            .Update
            Rem marked for deletion only, physically deleted in CommitStock
            .MoveNext
        Loop
    End If
    End With
    dbTlgDatabase.CommitTrans
    CloseTable PDNRecset
    
    Rem StockJrn
    clsSTK.DeleteStock mPdnStkCode
    
    Rem update transaction --------------------------------------
    Rem Production
    dbTlgDatabase.BeginTrans
    PDNRecset.Open "Select * from MacProdn where PdnCode=" & CStr(mPdnCode) & " order by PdnICode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
    With PDNRecset
    If .RecordCount > 0 Then
        .MoveFirst
        Do While .EOF = False
            If InList(.Fields("PdnRecState"), Array(cREC_ADDED, cREC_EDITED, cREC_UNCHANGED)) = True Then
                .Fields("PdnRecState") = cREC_UNCHANGED
                .Update
            Else
                .Fields("PdnRecState") = ChkDeleteRecStatus(.Fields("PdnRecState"))
                .Update
                .Delete
            End If
            
            .MoveNext
        Loop
    End If
    End With
    dbTlgDatabase.CommitTrans
    CloseTable PDNRecset
    
    Rem StockJrn
    clsSTK.CommitStock mPdnStkCode
    
    Rem end transaction -----------------------------------------
    Data_RemoveLog mPdnCode
    clsSTK.EndStock mPdnStkCode
    
    RemoveFlexRow Mfgrd2, srow
    Call RefreshBalQty
    Mfgrd2.Row = srow
    Mfgrd2.SetFocus
Else
    Mfgrd2.SetFocus
End If

EndSub:
Set PDNRecset = Nothing
Exit Sub

End Sub

Private Sub Mfgrd2_KeyPress(KeyAscii As Integer)
Dim srow As Integer, mPdnStkCode As Long, mPdnCode As Long

If KeyAscii = vbKeyReturn Then
    srow = Mfgrd2.Row
    mPdnStkCode = Val(Mfgrd2.TextMatrix(srow, X2PDNSTKCODE_COL))
    mPdnCode = Val(Mfgrd2.TextMatrix(srow, X2PDNCODE_COL))
    
    dtlAddEditMode = True
    dtlAddMode = (srow = FlexNewRow(Mfgrd2))
    EnableControls True
    If dtlAddMode = True Then
        If clsSTK.BeginStock(0) = False Then
            GoTo EndSub
        End If
        mPdnCode = GetNextSeqno(dbTlgDatabase, "MacProdn", "PdnCode")
        Data_CreateLog mPdnCode
        
        Call ChkDefaultValues
        FormAddEditMode = cFORM_ADDMODE
    Else
        If clsSTK.BeginStock(mPdnStkCode) = False Then
            GoTo EndSub
        End If
        Data_CreateLog mPdnCode
        
        ShowControlValues srow
        
        FormAddEditMode = cFORM_EDITMODE
    End If
    Mfgrd2.Col = FlexLeftVisibleCol(Mfgrd2)
    Mfgrd2.LeftCol = Mfgrd2.Col
    
    mPdnDate_old = Ctod(dtpPdnDate.Text)
    mPdnItmCode_old = Val(fcmbItmName.BoundText)
    mPdnEmpCode_old = Val(fcmbEmpName.BoundText)
    mPdnMacCode_old = Val(fcmbMacName.BoundText)
    mPdnMprCode_old = Val(fcmbMprName.BoundText)
    mPdnConsQty_old = CurPdnConsQty(mskPdnFinOutQty)
    mPdnFinOutQty_old = Val(UnMyNumFmt(mskPdnFinOutQty.Text))
    
    dtpPdnDate.SetFocus
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

dtpPdnDate.Text = Dtoc(DefaultEntryDate)
txtEmpName.Text = "": fcmbEmpName.BoundText = ""
txtItmName.Text = "": fcmbItmName.BoundText = ""
txtMacName.Text = "": fcmbMacName.BoundText = ""
txtMprName.Text = "": fcmbMprName.BoundText = ""

cmbSftName.ListIndex = -1
mskPdnRawInQty.Text = ToMyNumFmt(0, mDecimals:=0)
mskPdnFinOutQty.Text = ToMyNumFmt(0, mDecimals:=0)
mskPdnRwkOutQty.Text = ToMyNumFmt(0, mDecimals:=0)
mskPdnRghOutQty.Text = ToMyNumFmt(0, mDecimals:=0)
mskPdnRejOutQty.Text = ToMyNumFmt(0, mDecimals:=0)
mskPdnTdfOutQty.Text = ToMyNumFmt(0, mDecimals:=0)
txtCycleTimeStr.Text = SecToTime(0)
txtTimeStr.Text = MinToTime(0)
mskPdnReqdQty.Text = ToMyNumFmt(0, mDecimals:=0)
mskPdnCompQty.Text = ToMyNumFmt(0, mDecimals:=0)
txtCompTimeStr.Text = SecToTime(0)
mskBalQtyForProdn.Text = ToMyNumFmt(0, mDecimals:=0)
mskBalQtyForPack.Text = ToMyNumFmt(0, mDecimals:=0)

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
mDataOk = (IsFinYrDate(Ctod(dtpPdnDate.Text)) = True And Val(fcmbEmpName.BoundText) > 0 And Val(fcmbItmName.BoundText) > 0 And Val(fcmbMacName.BoundText) > 0 And Val(fcmbMprName.BoundText) > 0 And Val(UnMyNumFmt(mskPdnFinOutQty.Text)) > 0)
If mDataOk = True And InterActiveChange(cmdOK) = True Then
    mDataOk = (ChkPdnInQty(mAddEditMode:=True) = True)
End If
If mDataOk = True And InterActiveChange(cmdOK) = True Then
    mDataOk = (ChkPdnOutQtyTot() = True)
End If
If mDataOk = True And InterActiveChange(cmdOK) = True And dtlAddMode = False Then
    mDataOk = (ChkPdnFinOutQty(mAddEditMode:=True) = True)
End If
If mDataOk = True Then
    mskBalQtyForProdn.Text = ToMyNumFmt(GetBalQtyForProdn(mAddEditMode:=True, srow:=Mfgrd2.Row), mDecimals:=0)
    mskBalQtyForPack.Text = ToMyNumFmt(GetBalQtyForPack(mAddEditMode:=True, srow:=Mfgrd2.Row), mDecimals:=0)
    Call ChkCTComp
Else
    mskBalQtyForProdn.Text = ToMyNumFmt(0, mDecimals:=0)
    mskBalQtyForPack.Text = ToMyNumFmt(0, mDecimals:=0)
    mskPdnReqdQty.Text = ToMyNumFmt(0, mDecimals:=0)
    mskPdnCompQty.Text = ToMyNumFmt(0, mDecimals:=0)
    txtCompTimeStr.Text = SecToTime(0)
End If

cmdOK.Caption = IIf(mDataOk = True, "&OK", "&Cancel")
cmdOK.BackColor = IIf(mDataOk = True, &H80FF80, &H8080FF)
End Sub

Private Sub Mfgrd2_RowColChange()
Dim srow As Long
srow = Mfgrd2.Row

If dtlAddEditMode = False Then
    ShowControlValues srow
End If

End Sub

Private Sub txtCycleTimeStr_GotFocus()
FlashActiveControl txtCycleTimeStr, True
End Sub

Private Sub txtCycleTimeStr_LostFocus()
FlashActiveControl txtCycleTimeStr, False
End Sub

Private Sub txtCycleTimeStr_Validate(Cancel As Boolean)
txtCycleTimeStr.Text = SecToTime(TimeToSec(txtCycleTimeStr.Text))
Call ValidDtl
End Sub

Private Sub mskPdnFinOutQty_GotFocus()
FlashActiveControl mskPdnFinOutQty, True
End Sub

Private Sub mskPdnFinOutQty_LostFocus()
FlashActiveControl mskPdnFinOutQty, False
End Sub

Private Sub mskPdnFinOutQty_Validate(Cancel As Boolean)
mskPdnFinOutQty.Text = ToMyNumFmt(mskPdnFinOutQty.Text, mDecimals:=0)
If Val(UnMyNumFmt(mskPdnFinOutQty.Text)) <= 0 Then
    ErrorBox "Invalid Qty. !!!"
    mskPdnFinOutQty.SetFocus
    Cancel = True
Else
    If ChkPdnInQty(mAddEditMode:=True) = False Then
        Rem only message because other input qty change might be required
    Else
        If dtlAddMode = False Then
            If ChkPdnFinOutQty(mAddEditMode:=True) = False Then
                mskPdnFinOutQty.SetFocus
                Cancel = True
            End If
        End If
    End If
End If
Call ValidDtl

End Sub

Rem finish output production should not fall short for already packed material, and that too for upto current date as well for consequetive dates also
Private Function ChkPdnFinOutQty(ByVal mAddEditMode As Boolean) As Boolean
Dim tRecset As New ADODB.Recordset, mPdnFinOutQty_sum As Double, mMpkItmQty_sum As Double, mBalQty As Double, mShortPdnFinOutQty As Double
Dim mMaxChkDate As Date, mLoopPdnDate As Date
Dim mPdnDate As Date, mPdnEmpCode As Long, mPdnItmCode As Long, mPdnMacCode As Long, mPdnConsQty As Double, mPdnFinOutQty As Double
Dim mPdnICode As Long, srow As Long

Rem control values will be assigned just below and not anywhere in procedural section
srow = Mfgrd2.Row
If mAddEditMode = True Then
    mPdnDate = Ctod(dtpPdnDate.Text)
    mPdnEmpCode = Val(fcmbEmpName.BoundText)
    mPdnItmCode = Val(fcmbItmName.BoundText)
    mPdnMacCode = Val(fcmbMacName.BoundText)
    mPdnConsQty = CurPdnConsQty(mskPdnFinOutQty)
    mPdnFinOutQty = Val(UnMyNumFmt(mskPdnFinOutQty.Text))
Else
    Rem value assignment as done for add edit mode (keypress)
    mPdnDate = Ctod(Mfgrd2.TextMatrix(srow, X2PDNDATE_COL))
    mPdnEmpCode = Val(Mfgrd2.TextMatrix(srow, X2PDNEMPCODE_COL))
    mPdnItmCode = Val(Mfgrd2.TextMatrix(srow, X2PDNITMCODE_COL))
    mPdnMacCode = Val(Mfgrd2.TextMatrix(srow, X2PDNMACCODE_COL))
    mPdnConsQty = CurPdnConsQty(Mfgrd2, srow)
    mPdnFinOutQty = Val(UnMyNumFmt(Mfgrd2.TextMatrix(srow, X2PDNFINOUTQTY_COL)))
    
    Rem old value assignment as done for add edit mode (keypress)
    mPdnDate_old = mPdnDate
    mPdnEmpCode_old = mPdnEmpCode
    mPdnItmCode_old = mPdnItmCode
    mPdnMacCode_old = mPdnMacCode
    mPdnConsQty_old = mPdnConsQty
    mPdnFinOutQty_old = mPdnFinOutQty
End If
mPdnICode = Val(Mfgrd2.TextMatrix(srow, X2PDNICODE_COL))

If mPdnItmCode_old <> mPdnItmCode Then
    Rem check stock availability for packing of old item stock by making quantity zero
    Rem checking of stock availability for packing of new item is not required because it is an addition to stock for packing
    
    ChkPdnFinOutQty = True
    With tRecset
    .Open "Select top 1 * from MatPacking order by MpkDate desc", dbTlgDatabase, adOpenKeyset, adLockOptimistic
    If .RecordCount > 0 Then
        mMaxChkDate = .Fields("MpkDate")
    Else
        mMaxChkDate = mPdnDate_old
    End If
    End With
    CloseTable tRecset
    
    mMaxChkDate = IIf(mPdnDate_old > mMaxChkDate, mPdnDate_old, mMaxChkDate)
    For mLoopPdnDate = mPdnDate_old To mMaxChkDate
        mPdnFinOutQty_sum = 0: mMpkItmQty_sum = 0
        
        tRecset.Open "Select sum(PdnFinOutQty) as PdnFinOutQty_sum from MacProdn where PdnItmCode=" & CStr(mPdnItmCode_old) & " and PdnDate<=#" & CStr(ToSysDate(mLoopPdnDate)) & "#" & IIf(dtlAddMode = False, " and PdnICode<>" & CStr(mPdnICode), "") & " group by PdnItmCode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
        If tRecset.RecordCount > 0 Then
            mPdnFinOutQty_sum = tRecset.Fields("PdnFinOutQty_sum")
        End If
        CloseTable tRecset
        
        tRecset.Open "Select sum(MpkItmQty) as MpkItmQty_sum from MatPacking where MpkItmCode=" & CStr(mPdnItmCode_old) & " and MpkDate<=#" & CStr(ToSysDate(mLoopPdnDate)) & "#" & " group by MpkItmCode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
        If tRecset.RecordCount > 0 Then
            mMpkItmQty_sum = tRecset.Fields("MpkItmQty_sum")
        End If
        CloseTable tRecset
        
        mBalQty = mPdnFinOutQty_sum - mMpkItmQty_sum    ''' - mPdnFinOutQty_old        ''' + mPdnFinOutQty do not add it here
        
        If mBalQty < 0 Then
            ErrorBox "Excess Packing Qty over Production Qty is " & ToMyNumFmt(mBalQty, mDecimals:=0, mUseAbs:=True) & " on dated " & Dtoc(mLoopPdnDate) & " !!!"
            ChkPdnFinOutQty = False
            Exit For
        End If
    Next mLoopPdnDate
ElseIf mPdnDate < mPdnDate_old Then
    Rem check stock availability for packing from new date to till end packing date
    
    ChkPdnFinOutQty = True
    With tRecset
    .Open "Select top 1 * from MatPacking order by MpkDate desc", dbTlgDatabase, adOpenKeyset, adLockOptimistic
    If .RecordCount > 0 Then
        mMaxChkDate = .Fields("MpkDate")
    Else
        mMaxChkDate = mPdnDate
    End If
    End With
    CloseTable tRecset
    
    mMaxChkDate = IIf(mPdnDate > mMaxChkDate, mPdnDate, mMaxChkDate)
    For mLoopPdnDate = mPdnDate To mMaxChkDate
        mPdnFinOutQty_sum = 0: mMpkItmQty_sum = 0
        
        tRecset.Open "Select sum(PdnFinOutQty) as PdnFinOutQty_sum from MacProdn where PdnItmCode=" & CStr(mPdnItmCode) & " and PdnDate<=#" & CStr(ToSysDate(mLoopPdnDate)) & "#" & IIf(dtlAddMode = False, " and PdnICode<>" & CStr(mPdnICode), "") & " group by PdnItmCode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
        If tRecset.RecordCount > 0 Then
            mPdnFinOutQty_sum = tRecset.Fields("PdnFinOutQty_sum")
        End If
        CloseTable tRecset
        
        tRecset.Open "Select sum(MpkItmQty) as MpkItmQty_sum from MatPacking where MpkItmCode=" & CStr(mPdnItmCode) & " and MpkDate<=#" & CStr(ToSysDate(mLoopPdnDate)) & "#" & " group by MpkItmCode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
        If tRecset.RecordCount > 0 Then
            mMpkItmQty_sum = tRecset.Fields("MpkItmQty_sum")
        End If
        CloseTable tRecset
        
        mBalQty = mPdnFinOutQty_sum - mMpkItmQty_sum + mPdnFinOutQty '''- mPdnFinOutQty_old + mPdnFinOutQty
        
        If mBalQty < 0 Then
            ErrorBox "Excess Packing Qty over Production Qty is " & ToMyNumFmt(mBalQty, mDecimals:=0, mUseAbs:=True) & " on dated " & Dtoc(mLoopPdnDate) & " !!!"
            ChkPdnFinOutQty = False
            Exit For
        End If
    Next mLoopPdnDate
ElseIf mPdnDate > mPdnDate_old Then
    Rem check stock availability for packing from old date (back date) to previous date of current date by making production as zero
    Rem and then check stock availability for packing from new date to till end packing date by using production qty
    
    ChkPdnFinOutQty = True
    With tRecset
    .Open "Select top 1 * from MatPacking order by MpkDate desc", dbTlgDatabase, adOpenKeyset, adLockOptimistic
    If .RecordCount > 0 Then
        mMaxChkDate = .Fields("MpkDate")
        If mMaxChkDate >= mPdnDate Then
            mMaxChkDate = mPdnDate - 1
        End If
    Else
        mMaxChkDate = mPdnDate_old
    End If
    End With
    CloseTable tRecset
    
    mMaxChkDate = IIf(mPdnDate_old > mMaxChkDate, mPdnDate_old, mMaxChkDate)
    For mLoopPdnDate = mPdnDate_old To mMaxChkDate
        mPdnFinOutQty_sum = 0: mMpkItmQty_sum = 0
        
        tRecset.Open "Select sum(PdnFinOutQty) as PdnFinOutQty_sum from MacProdn where PdnItmCode=" & CStr(mPdnItmCode) & " and PdnDate<=#" & CStr(ToSysDate(mLoopPdnDate)) & "#" & IIf(dtlAddMode = False, " and PdnICode<>" & CStr(mPdnICode), "") & " group by PdnItmCode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
        If tRecset.RecordCount > 0 Then
            mPdnFinOutQty_sum = tRecset.Fields("PdnFinOutQty_sum")
        End If
        CloseTable tRecset
        
        tRecset.Open "Select sum(MpkItmQty) as MpkItmQty_sum from MatPacking where MpkItmCode=" & CStr(mPdnItmCode) & " and MpkDate<=#" & CStr(ToSysDate(mLoopPdnDate)) & "#" & " group by MpkItmCode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
        If tRecset.RecordCount > 0 Then
            mMpkItmQty_sum = tRecset.Fields("MpkItmQty_sum")
        End If
        CloseTable tRecset
        
        mBalQty = mPdnFinOutQty_sum - mMpkItmQty_sum '''- mPdnFinOutQty_old    ''' + mPdnFinOutQty qty entry deleted
        
        If mBalQty < 0 Then
            ErrorBox "Excess Packing Qty over Production Qty is " & ToMyNumFmt(mBalQty, mDecimals:=0, mUseAbs:=True) & " on dated " & Dtoc(mLoopPdnDate) & " !!!"
            ChkPdnFinOutQty = False
            Exit For
        End If
    Next mLoopPdnDate
    
    If ChkPdnFinOutQty = True Then
        With tRecset
        .Open "Select top 1 * from MatPacking order by MpkDate desc", dbTlgDatabase, adOpenKeyset, adLockOptimistic
        If .RecordCount > 0 Then
            mMaxChkDate = .Fields("MpkDate")
        Else
            mMaxChkDate = mPdnDate
        End If
        End With
        CloseTable tRecset
        
        mMaxChkDate = IIf(mPdnDate > mMaxChkDate, mPdnDate, mMaxChkDate)
        For mLoopPdnDate = mPdnDate To mMaxChkDate
            mPdnFinOutQty_sum = 0: mMpkItmQty_sum = 0
            
            tRecset.Open "Select sum(PdnFinOutQty) as PdnFinOutQty_sum from MacProdn where PdnItmCode=" & CStr(mPdnItmCode) & " and PdnDate<=#" & CStr(ToSysDate(mLoopPdnDate)) & "#" & IIf(dtlAddMode = False, " and PdnICode<>" & CStr(mPdnICode), "") & " group by PdnItmCode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
            If tRecset.RecordCount > 0 Then
                mPdnFinOutQty_sum = tRecset.Fields("PdnFinOutQty_sum")
            End If
            CloseTable tRecset
            
            tRecset.Open "Select sum(MpkItmQty) as MpkItmQty_sum from MatPacking where MpkItmCode=" & CStr(mPdnItmCode) & " and MpkDate<=#" & CStr(ToSysDate(mLoopPdnDate)) & "#" & " group by MpkItmCode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
            If tRecset.RecordCount > 0 Then
                mMpkItmQty_sum = tRecset.Fields("MpkItmQty_sum")
            End If
            CloseTable tRecset
            
            mBalQty = mPdnFinOutQty_sum - mMpkItmQty_sum + mPdnFinOutQty    ''' - mPdnFinOutQty_old
            
            If mBalQty < 0 Then
                ErrorBox "Excess Packing Qty over Production Qty is " & ToMyNumFmt(mBalQty, mDecimals:=0, mUseAbs:=True) & " on dated " & Dtoc(mLoopPdnDate) & " !!!"
                ChkPdnFinOutQty = False
                Exit For
            End If
        Next mLoopPdnDate
    End If
Else
    Rem check stock availability for packing for current date to end packing date
    ChkPdnFinOutQty = True
    With tRecset
    .Open "Select top 1 * from MatPacking order by MpkDate desc", dbTlgDatabase, adOpenKeyset, adLockOptimistic
    If .RecordCount > 0 Then
        mMaxChkDate = .Fields("MpkDate")
    Else
        mMaxChkDate = mPdnDate
    End If
    End With
    CloseTable tRecset
    
    mMaxChkDate = IIf(mPdnDate > mMaxChkDate, mPdnDate, mMaxChkDate)
    For mLoopPdnDate = mPdnDate To mMaxChkDate
        mPdnFinOutQty_sum = 0: mMpkItmQty_sum = 0
        
        tRecset.Open "Select sum(PdnFinOutQty) as PdnFinOutQty_sum from MacProdn where PdnItmCode=" & CStr(mPdnItmCode) & " and PdnDate<=#" & CStr(ToSysDate(mLoopPdnDate)) & "#" & IIf(dtlAddMode = False, " and PdnICode<>" & CStr(mPdnICode), "") & " group by PdnItmCode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
        If tRecset.RecordCount > 0 Then
            mPdnFinOutQty_sum = tRecset.Fields("PdnFinOutQty_sum")
        End If
        CloseTable tRecset
        
        tRecset.Open "Select sum(MpkItmQty) as MpkItmQty_sum from MatPacking where MpkItmCode=" & CStr(mPdnItmCode) & " and MpkDate<=#" & CStr(ToSysDate(mLoopPdnDate)) & "#" & " group by MpkItmCode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
        If tRecset.RecordCount > 0 Then
            mMpkItmQty_sum = tRecset.Fields("MpkItmQty_sum")
        End If
        CloseTable tRecset
        
        mBalQty = mPdnFinOutQty_sum - mMpkItmQty_sum + IIf(mAddEditMode = True, mPdnFinOutQty, 0) ''' - mPdnFinOutQty_old
        
        If mBalQty < 0 Then
            ErrorBox "Excess Packing Qty over Production Qty is " & ToMyNumFmt(mBalQty, mDecimals:=0, mUseAbs:=True) & " on dated " & Dtoc(mLoopPdnDate) & " !!!"
            ChkPdnFinOutQty = False
            Exit For
        End If
    Next mLoopPdnDate
    
End If

End Function

Private Function GetBalQtyForPack(ByVal mAddEditMode As Boolean, ByVal srow As Long) As Double
Dim tRecset As New ADODB.Recordset, mPdnFinOutQty_sum As Double, mMpkItmQty_sum As Double, mBalQty As Double
Dim mPdnDate As Date, mPdnEmpCode As Long, mPdnItmCode As Long, mPdnMacCode As Long, mPdnConsQty As Double, mPdnFinOutQty As Double
Dim mPdnICode As Long

Rem control values will be assigned just below and not anywhere in procedural section
If mAddEditMode = True Then
    mPdnDate = Ctod(dtpPdnDate.Text)
    mPdnEmpCode = Val(fcmbEmpName.BoundText)
    mPdnItmCode = Val(fcmbItmName.BoundText)
    mPdnMacCode = Val(fcmbMacName.BoundText)
    mPdnConsQty = CurPdnConsQty(mskPdnFinOutQty)
    mPdnFinOutQty = Val(UnMyNumFmt(mskPdnFinOutQty.Text))
Else
    mPdnDate = Ctod(Mfgrd2.TextMatrix(srow, X2PDNDATE_COL))
    mPdnEmpCode = Val(Mfgrd2.TextMatrix(srow, X2PDNEMPCODE_COL))
    mPdnItmCode = Val(Mfgrd2.TextMatrix(srow, X2PDNITMCODE_COL))
    mPdnMacCode = Val(Mfgrd2.TextMatrix(srow, X2PDNMACCODE_COL))
    mPdnConsQty = CurPdnConsQty(Mfgrd2, srow)
    mPdnFinOutQty = Val(UnMyNumFmt(Mfgrd2.TextMatrix(srow, X2PDNFINOUTQTY_COL)))
End If
mPdnICode = Val(Mfgrd2.TextMatrix(srow, X2PDNICODE_COL))

Rem check stock availability for packing for current date to end packing date
    
mPdnFinOutQty_sum = 0: mMpkItmQty_sum = 0

tRecset.Open "Select sum(PdnFinOutQty) as PdnFinOutQty_sum from MacProdn where PdnItmCode=" & CStr(mPdnItmCode) & " and PdnDate<=#" & CStr(ToSysDate(mPdnDate)) & "#" & IIf(dtlAddMode = False, " and PdnICode<>" & CStr(mPdnICode), "") & " group by PdnItmCode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
If tRecset.RecordCount > 0 Then
    mPdnFinOutQty_sum = tRecset.Fields("PdnFinOutQty_sum")
End If
CloseTable tRecset

tRecset.Open "Select sum(MpkItmQty) as MpkItmQty_sum from MatPacking where MpkItmCode=" & CStr(mPdnItmCode) & " and MpkDate<=#" & CStr(ToSysDate(mPdnDate)) & "#" & " group by MpkItmCode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
If tRecset.RecordCount > 0 Then
    mMpkItmQty_sum = tRecset.Fields("MpkItmQty_sum")
End If
CloseTable tRecset

mBalQty = mPdnFinOutQty_sum - mMpkItmQty_sum + mPdnFinOutQty
      
GetBalQtyForPack = mBalQty

End Function

Rem aggregate of input quanity must equal finish output + rework output + rough output + rejection output + turning defect output
Private Function ChkPdnOutQtyTot() As Boolean
Dim mPdnOutQtyTot As Double
mPdnOutQtyTot = Val(UnMyNumFmt(mskPdnFinOutQty.Text)) + Val(UnMyNumFmt(mskPdnRwkOutQty.Text)) + Val(UnMyNumFmt(mskPdnRghOutQty.Text)) + Val(UnMyNumFmt(mskPdnRejOutQty.Text)) + Val(UnMyNumFmt(mskPdnTdfOutQty.Text))
If mPdnOutQtyTot <> Val(UnMyNumFmt(mskPdnRawInQty.Text)) Then
    ErrorBox "Mismatch Total Qty " & ToMyNumFmt(mPdnOutQtyTot, mDecimals:=0) & " !!!"
    ChkPdnOutQtyTot = False
Else
    ChkPdnOutQtyTot = True
End If

End Function

Private Sub mskPdnRawInQty_GotFocus()
FlashActiveControl mskPdnRawInQty, True
End Sub

Private Sub mskPdnRawInQty_LostFocus()
FlashActiveControl mskPdnRawInQty, False
End Sub

Private Sub mskPdnRawInQty_Validate(Cancel As Boolean)
mskPdnRawInQty.Text = ToMyNumFmt(mskPdnRawInQty.Text, mDecimals:=0)
Rem checking balance available qty
If ChkPdnInQty(mAddEditMode:=True) = False Then
    Rem only message because other wip input qty change might be required
End If
Call ValidDtl

End Sub

Rem production can not be greater than material issued quantity
Private Function ChkPdnInQty(ByVal mAddEditMode As Boolean) As Boolean
Dim tRecset As New ADODB.Recordset, mMisQty_sum As Double, mPdnConsQty_sum As Double, mPdnWipOutQty_sum As Double, mBalQty As Double
Dim mMaxChkDate As Date, mLoopPdnDate As Date
Dim mPdnDate As Date, mPdnEmpCode As Long, mPdnItmCode As Long, mPdnMacCode As Long, mPdnConsQty As Double, mPdnFinOutQty As Double, mPdnWipOutQty As Double
Dim mPdnICode As Long, srow As Long

Rem control values will be assigned just below and not anywhere in procedural section
srow = Mfgrd2.Row
If mAddEditMode = True Then
    mPdnDate = Ctod(dtpPdnDate.Text)
    mPdnEmpCode = Val(fcmbEmpName.BoundText)
    mPdnItmCode = Val(fcmbItmName.BoundText)
    mPdnMacCode = Val(fcmbMacName.BoundText)
    mPdnConsQty = CurPdnConsQty(mskPdnFinOutQty)
    mPdnFinOutQty = Val(UnMyNumFmt(mskPdnFinOutQty.Text))
    mPdnWipOutQty = CurPdnWipOutQty(mskPdnRwkOutQty)
Else
    Rem value assignment as done for add edit mode (keypress)
    mPdnDate = Ctod(Mfgrd2.TextMatrix(srow, X2PDNDATE_COL))
    mPdnEmpCode = Val(Mfgrd2.TextMatrix(srow, X2PDNEMPCODE_COL))
    mPdnItmCode = Val(Mfgrd2.TextMatrix(srow, X2PDNITMCODE_COL))
    mPdnMacCode = Val(Mfgrd2.TextMatrix(srow, X2PDNMACCODE_COL))
    mPdnConsQty = CurPdnConsQty(Mfgrd2, srow)
    mPdnFinOutQty = Val(UnMyNumFmt(Mfgrd2.TextMatrix(srow, X2PDNFINOUTQTY_COL)))
    mPdnWipOutQty = CurPdnWipOutQty(Mfgrd2, srow)
    
    Rem old value assignment as done for add edit mode (keypress)
    mPdnDate_old = mPdnDate
    mPdnEmpCode_old = mPdnEmpCode
    mPdnItmCode_old = mPdnItmCode
    mPdnMacCode_old = mPdnMacCode
    mPdnConsQty_old = mPdnConsQty
    mPdnFinOutQty_old = mPdnFinOutQty
End If
mPdnICode = Val(Mfgrd2.TextMatrix(srow, X2PDNICODE_COL))
    
Rem assume that old entry has been deleted by ignoring existing entry and then check normally stock availability for production from current date to end production date
ChkPdnInQty = True
With tRecset
.Open "Select top 1 * from MacProdn order by PdnDate desc", dbTlgDatabase, adOpenKeyset, adLockOptimistic
If .RecordCount > 0 Then
    mMaxChkDate = .Fields("PdnDate")
Else
    mMaxChkDate = mPdnDate
End If
End With
CloseTable tRecset

mMaxChkDate = IIf(mPdnDate > mMaxChkDate, mPdnDate, mMaxChkDate)
For mLoopPdnDate = mPdnDate To mMaxChkDate
    mMisQty_sum = 0: mPdnConsQty_sum = 0: mPdnWipOutQty_sum = 0
    
    tRecset.Open "Select sum(MisQty) as MisQty_sum from MatIssue where MisEmpCode=" & CStr(mPdnEmpCode) & " and MisItmCode=" & CStr(mPdnItmCode) & " and MisMacCode=" & CStr(mPdnMacCode) & " and MisDate<=#" & CStr(ToSysDate(mLoopPdnDate)) & "#" & " group by MisEmpCode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
    If tRecset.RecordCount > 0 Then
        mMisQty_sum = tRecset.Fields("MisQty_sum")
    End If
    CloseTable tRecset
    
    tRecset.Open "Select sum(PdnConsQty) as PdnConsQty_sum from MacProdn where PdnEmpCode=" & CStr(mPdnEmpCode) & " and PdnItmCode=" & CStr(mPdnItmCode) & " and PdnMacCode=" & CStr(mPdnMacCode) & " and PdnDate<=#" & CStr(ToSysDate(mLoopPdnDate)) & "#" & IIf(dtlAddMode = False, " and PdnICode<>" & CStr(mPdnICode), "") & " group by PdnEmpCode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
    If tRecset.RecordCount > 0 Then
        mPdnConsQty_sum = tRecset.Fields("PdnConsQty_sum")
    End If
    CloseTable tRecset
    
    tRecset.Open "Select sum(PdnWipOutQty) as PdnWipOutQty_sum from MacProdn where PdnEmpCode=" & CStr(mPdnEmpCode) & " and PdnItmCode=" & CStr(mPdnItmCode) & " and PdnMacCode=" & CStr(mPdnMacCode) & " and PdnDate<=#" & CStr(ToSysDate(mLoopPdnDate)) & "#" & IIf(dtlAddMode = False, " and PdnICode<>" & CStr(mPdnICode), "") & " group by PdnEmpCode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
    If tRecset.RecordCount > 0 Then
        mPdnWipOutQty_sum = tRecset.Fields("PdnWipOutQty_sum")
    End If
    CloseTable tRecset
    
    mBalQty = mMisQty_sum + mPdnWipOutQty_sum - mPdnConsQty_sum + IIf(mLoopPdnDate > mPdnDate, mPdnWipOutQty, 0) - mPdnConsQty
    
    If mBalQty < 0 Then
        ErrorBox "Excess Produciton Qty over Material Issued to Operator is " & ToMyNumFmt(mBalQty, mDecimals:=0, mUseAbs:=True) & " on dated " & Dtoc(mLoopPdnDate) & " !!!"
        ChkPdnInQty = False
        Exit For
    End If
Next mLoopPdnDate

End Function

Private Function GetBalQtyForProdn(ByVal mAddEditMode As Boolean, ByVal srow As Long) As Double
Dim tRecset As New ADODB.Recordset, mMisQty_sum As Double, mPdnConsQty_sum As Double, mPdnWipOutQty_sum As Double, mBalQty As Double
Dim mPdnDate As Date, mPdnEmpCode As Long, mPdnItmCode As Long, mPdnMacCode As Long, mPdnConsQty As Double, mPdnFinOutQty As Double, mPdnWipOutQty As Double
Dim mPdnICode As Long

Rem control values will be assigned just below and not anywhere in procedural section
If mAddEditMode = True Then
    mPdnDate = Ctod(dtpPdnDate.Text)
    mPdnEmpCode = Val(fcmbEmpName.BoundText)
    mPdnItmCode = Val(fcmbItmName.BoundText)
    mPdnMacCode = Val(fcmbMacName.BoundText)
    mPdnConsQty = CurPdnConsQty(mskPdnFinOutQty)
    mPdnFinOutQty = Val(UnMyNumFmt(mskPdnFinOutQty.Text))
    mPdnWipOutQty = CurPdnWipOutQty(mskPdnRwkOutQty)
Else
    Rem value assignment as done for add edit mode (keypress)
    mPdnDate = Ctod(Mfgrd2.TextMatrix(srow, X2PDNDATE_COL))
    mPdnEmpCode = Val(Mfgrd2.TextMatrix(srow, X2PDNEMPCODE_COL))
    mPdnItmCode = Val(Mfgrd2.TextMatrix(srow, X2PDNITMCODE_COL))
    mPdnMacCode = Val(Mfgrd2.TextMatrix(srow, X2PDNMACCODE_COL))
    mPdnConsQty = CurPdnConsQty(Mfgrd2, srow)
    mPdnFinOutQty = Val(UnMyNumFmt(Mfgrd2.TextMatrix(srow, X2PDNFINOUTQTY_COL)))
    mPdnWipOutQty = CurPdnWipOutQty(Mfgrd2, srow)
End If
mPdnICode = Val(Mfgrd2.TextMatrix(srow, X2PDNICODE_COL))
    
mMisQty_sum = 0: mPdnConsQty_sum = 0: mPdnWipOutQty_sum = 0

tRecset.Open "Select sum(MisQty) as MisQty_sum from MatIssue where MisEmpCode=" & CStr(mPdnEmpCode) & " and MisItmCode=" & CStr(mPdnItmCode) & " and MisMacCode=" & CStr(mPdnMacCode) & " and MisDate<=#" & CStr(ToSysDate(mPdnDate)) & "#" & " group by MisEmpCode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
If tRecset.RecordCount > 0 Then
    mMisQty_sum = tRecset.Fields("MisQty_sum")
End If
CloseTable tRecset

tRecset.Open "Select sum(PdnConsQty) as PdnConsQty_sum from MacProdn where PdnEmpCode=" & CStr(mPdnEmpCode) & " and PdnItmCode=" & CStr(mPdnItmCode) & " and PdnMacCode=" & CStr(mPdnMacCode) & " and PdnDate<=#" & CStr(ToSysDate(mPdnDate)) & "#" & IIf(dtlAddMode = False, " and PdnICode<>" & CStr(mPdnICode), "") & " group by PdnEmpCode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
If tRecset.RecordCount > 0 Then
    mPdnConsQty_sum = tRecset.Fields("PdnConsQty_sum")
End If
CloseTable tRecset

tRecset.Open "Select sum(PdnWipOutQty) as PdnWipOutQty_sum from MacProdn where PdnEmpCode=" & CStr(mPdnEmpCode) & " and PdnItmCode=" & CStr(mPdnItmCode) & " and PdnMacCode=" & CStr(mPdnMacCode) & " and PdnDate<=#" & CStr(ToSysDate(mPdnDate)) & "#" & IIf(dtlAddMode = False, " and PdnICode<>" & CStr(mPdnICode), "") & " group by PdnEmpCode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
If tRecset.RecordCount > 0 Then
    mPdnWipOutQty_sum = tRecset.Fields("PdnWipOutQty_sum")
End If
CloseTable tRecset

mBalQty = mMisQty_sum + mPdnWipOutQty_sum - mPdnConsQty_sum + mPdnWipOutQty - mPdnConsQty
    
GetBalQtyForProdn = mBalQty

End Function

Private Sub RefreshBalQty()
Dim srow As Integer
For srow = 1 To Mfgrd2.Rows - 2
    Mfgrd2.TextMatrix(srow, X2BALQTYFORPRODN_COL) = ToMyNumFmt(GetBalQtyForProdn(mAddEditMode:=False, srow:=srow), mDecimals:=0)
    Mfgrd2.TextMatrix(srow, X2BALQTYFORPACK_COL) = ToMyNumFmt(GetBalQtyForPack(mAddEditMode:=False, srow:=srow), mDecimals:=0)
Next srow

End Sub

Private Function CurPdnConsQty(ByRef mObj As Object, Optional ByVal srow As Long) As Double
If TypeOf mObj Is ADODB.Recordset Then
    With mObj
    CurPdnConsQty = .Fields("PdnFinOutQty") + .Fields("PdnRwkOutQty") + .Fields("PdnRghOutQty") + .Fields("PdnTdfOutQty") + .Fields("PdnRejOutQty")
    End With
ElseIf TypeOf mObj Is MSFlexGrid Then
    With mObj
    CurPdnConsQty = Val(UnMyNumFmt(.TextMatrix(srow, X2PDNFINOUTQTY_COL))) + Val(UnMyNumFmt(.TextMatrix(srow, X2PDNRWKOUTQTY_COL))) + Val(UnMyNumFmt(.TextMatrix(srow, X2PDNRGHOUTQTY_COL))) + Val(UnMyNumFmt(.TextMatrix(srow, X2PDNTDFOUTQTY_COL))) + Val(UnMyNumFmt(.TextMatrix(srow, X2PDNREJOUTQTY_COL)))
    End With
ElseIf TypeOf mObj Is TextBox Then
    CurPdnConsQty = Val(UnMyNumFmt(mskPdnFinOutQty.Text)) + Val(UnMyNumFmt(mskPdnRwkOutQty.Text)) + Val(UnMyNumFmt(mskPdnRghOutQty.Text)) + Val(UnMyNumFmt(mskPdnTdfOutQty.Text)) + Val(UnMyNumFmt(mskPdnRejOutQty.Text))
Else
    ErrorBox Me.Name & "_CurPdnConsQty_1011"
End If

End Function

Private Function CurPdnWipOutQty(ByRef mObj As Object, Optional ByVal srow As Long) As Double
If TypeOf mObj Is ADODB.Recordset Then
    With mObj
    CurPdnWipOutQty = .Fields("PdnWipOutQty")
    End With
ElseIf TypeOf mObj Is MSFlexGrid Then
    With mObj
    CurPdnWipOutQty = Val(UnMyNumFmt(.TextMatrix(srow, X2PDNRWKOUTQTY_COL))) + Val(UnMyNumFmt(.TextMatrix(srow, X2PDNRGHOUTQTY_COL))) + Val(UnMyNumFmt(.TextMatrix(srow, X2PDNTDFOUTQTY_COL)))
    End With
ElseIf TypeOf mObj Is TextBox Then
    CurPdnWipOutQty = Val(UnMyNumFmt(mskPdnRwkOutQty.Text)) + Val(UnMyNumFmt(mskPdnRghOutQty.Text)) + Val(UnMyNumFmt(mskPdnTdfOutQty.Text))
Else
    ErrorBox Me.Name & "_CurPdnWipOutQty_1416"
End If

End Function



Private Sub mskPdnRejOutQty_GotFocus()
FlashActiveControl mskPdnRejOutQty, True
End Sub

Private Sub mskPdnRejOutQty_LostFocus()
FlashActiveControl mskPdnRejOutQty, False
End Sub

Private Sub mskPdnRejOutQty_Validate(Cancel As Boolean)
mskPdnRejOutQty.Text = ToMyNumFmt(mskPdnRejOutQty.Text, mDecimals:=0)
If ChkPdnInQty(mAddEditMode:=True) = False Then
    Rem only message because other input qty change might be required
End If

Call ValidDtl
End Sub

Private Sub mskPdnRghOutQty_GotFocus()
FlashActiveControl mskPdnRghOutQty, True
End Sub

Private Sub mskPdnRghOutQty_LostFocus()
FlashActiveControl mskPdnRghOutQty, False
End Sub

Private Sub mskPdnRghOutQty_Validate(Cancel As Boolean)
mskPdnRghOutQty.Text = ToMyNumFmt(mskPdnRghOutQty.Text, mDecimals:=0)
If ChkPdnInQty(mAddEditMode:=True) = False Then
    Rem only message because other input qty change might be required
End If

Call ValidDtl
End Sub

Private Sub mskPdnRwkOutQty_GotFocus()
FlashActiveControl mskPdnRwkOutQty, True
End Sub

Private Sub mskPdnRwkOutQty_LostFocus()
FlashActiveControl mskPdnRwkOutQty, False
End Sub

Private Sub mskPdnRwkOutQty_Validate(Cancel As Boolean)
mskPdnRwkOutQty.Text = ToMyNumFmt(mskPdnRwkOutQty.Text, mDecimals:=0)
If ChkPdnInQty(mAddEditMode:=True) = False Then
    Rem only message because other input qty change might be required
End If

Call ValidDtl
End Sub

Private Sub mskPdnTdfOutQty_GotFocus()
FlashActiveControl mskPdnTdfOutQty, True
End Sub

Private Sub mskPdnTdfOutQty_LostFocus()
FlashActiveControl mskPdnTdfOutQty, False
End Sub

Private Sub mskPdnTdfOutQty_Validate(Cancel As Boolean)
mskPdnTdfOutQty.Text = ToMyNumFmt(mskPdnTdfOutQty.Text, mDecimals:=0)
If ChkPdnInQty(mAddEditMode:=True) = False Then
    Rem only message because other input qty change might be required
Else
    If ChkPdnOutQtyTot() = False Then
        Rem only message because other input qty change might be required
    End If
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
    dtpPdnDate.Text = Mfgrd2.TextMatrix(srow, X2PDNDATE_COL)
    fcmbEmpName.BoundText = Mfgrd2.TextMatrix(srow, X2PDNEMPCODE_COL): txtEmpName.Text = fcmbEmpName.Text
    fcmbItmName.BoundText = Mfgrd2.TextMatrix(srow, X2PDNITMCODE_COL): txtItmName.Text = fcmbItmName.Text
    fcmbMacName.BoundText = Mfgrd2.TextMatrix(srow, X2PDNMACCODE_COL): txtMacName.Text = fcmbMacName.Text
    fcmbMprName.BoundText = Mfgrd2.TextMatrix(srow, X2PDNMPRCODE_COL): txtMprName.Text = fcmbMprName.Text
    cmbSftName.ListIndex = Val(Mfgrd2.TextMatrix(srow, X2PDNSFTCODE_COL)) - 1
    txtCycleTimeStr.Text = Mfgrd2.TextMatrix(srow, X2CYCLETIMESTR_COL)
    txtTimeStr.Text = Mfgrd2.TextMatrix(srow, X2TIMESTR_COL)
Else
    dtpPdnDate.Text = dtpPdnDate1.Text
    fcmbEmpName.Text = txtEmpName1.Text: txtEmpName.Text = fcmbEmpName.Text
    fcmbItmName.Text = txtItmName1.Text: txtItmName.Text = fcmbItmName.Text
    fcmbMacName.Text = txtMacName1.Text: txtMacName.Text = fcmbMacName.Text
    fcmbMprName.Text = txtMprName1.Text: txtMprName.Text = fcmbMprName.Text
    cmbSftName.ListIndex = 0
    txtCycleTimeStr.Text = SecToTime(0)
    txtTimeStr.Text = MinToTime(0)
End If
mskPdnRawInQty.Text = ToMyNumFmt(0, mDecimals:=0)
mskPdnFinOutQty.Text = ToMyNumFmt(0, mDecimals:=0)
mskPdnRwkOutQty.Text = ToMyNumFmt(0, mDecimals:=0)
mskPdnRghOutQty.Text = ToMyNumFmt(0, mDecimals:=0)
mskPdnRejOutQty.Text = ToMyNumFmt(0, mDecimals:=0)
mskPdnTdfOutQty.Text = ToMyNumFmt(0, mDecimals:=0)
mskPdnReqdQty.Text = ToMyNumFmt(0, mDecimals:=0)
mskPdnCompQty.Text = ToMyNumFmt(0, mDecimals:=0)
txtCompTimeStr.Text = SecToTime(0)

End Sub

Private Function Data_CreateLog(ByVal mPdnCode As Long) As Boolean
Dim PDN_LogRS As New ADODB.Recordset
Data_CreateLog = False

PDN_LogRS.Open "Select * from MacProdn_Log where PdnCode=" & CStr(mPdnCode) & "", dbTlgDatabase, adOpenKeyset, adLockOptimistic
With PDN_LogRS
If .RecordCount = 0 Then
    .Close
    Rem only ok records will be taken in log, because not ok records are created out of crashed entries which must be cleared when entry rejected
    dbTlgDatabase.BeginTrans
    dbTlgDatabase.Execute "Insert into MacProdn_Log Select * from MacProdn where PdnCode=" & CStr(mPdnCode) & " and PdnRecState=" & CStr(cREC_UNCHANGED) & ""
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
Set PDN_LogRS = Nothing
Exit Function

End Function

Private Function Data_RemoveLog(ByVal mPdnCode As Long) As Boolean
Data_RemoveLog = False

dbTlgDatabase.BeginTrans
dbTlgDatabase.Execute "Delete from MacProdn_Log where PdnCode=" & CStr(mPdnCode)
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

dtpPdnDate.Text = Mfgrd2.TextMatrix(srow, X2PDNDATE_COL)
fcmbEmpName.BoundText = Mfgrd2.TextMatrix(srow, X2PDNEMPCODE_COL): txtEmpName.Text = fcmbEmpName.Text
fcmbItmName.BoundText = Mfgrd2.TextMatrix(srow, X2PDNITMCODE_COL): txtItmName.Text = fcmbItmName.Text
fcmbMacName.BoundText = Mfgrd2.TextMatrix(srow, X2PDNMACCODE_COL): txtMacName.Text = fcmbMacName.Text
fcmbMprName.BoundText = Mfgrd2.TextMatrix(srow, X2PDNMPRCODE_COL): txtMprName.Text = fcmbMprName.Text
cmbSftName.ListIndex = Val(Mfgrd2.TextMatrix(srow, X2PDNSFTCODE_COL)) - 1
mskPdnRawInQty.Text = Trim(Mfgrd2.TextMatrix(srow, X2PDNRAWINQTY_COL))
mskPdnFinOutQty.Text = Trim(Mfgrd2.TextMatrix(srow, X2PDNFINOUTQTY_COL))
mskPdnRwkOutQty.Text = Trim(Mfgrd2.TextMatrix(srow, X2PDNRWKOUTQTY_COL))
mskPdnRghOutQty.Text = Trim(Mfgrd2.TextMatrix(srow, X2PDNRGHOUTQTY_COL))
mskPdnRejOutQty.Text = Trim(Mfgrd2.TextMatrix(srow, X2PDNREJOUTQTY_COL))
mskPdnTdfOutQty.Text = Trim(Mfgrd2.TextMatrix(srow, X2PDNTDFOUTQTY_COL))
txtCycleTimeStr.Text = Mfgrd2.TextMatrix(srow, X2CYCLETIMESTR_COL)
txtTimeStr.Text = Mfgrd2.TextMatrix(srow, X2TIMESTR_COL)
mskPdnReqdQty.Text = Trim(Mfgrd2.TextMatrix(srow, X2PDNREQDQTY_COL))
mskPdnCompQty.Text = Trim(Mfgrd2.TextMatrix(srow, X2PDNCOMPQTY_COL))
txtCompTimeStr.Text = Mfgrd2.TextMatrix(srow, X2COMPTIMESTR_COL)
mskBalQtyForProdn.Text = Trim(Mfgrd2.TextMatrix(srow, X2BALQTYFORPRODN_COL))
mskBalQtyForPack.Text = Trim(Mfgrd2.TextMatrix(srow, X2BALQTYFORPACK_COL))

End Sub

Private Sub ChkCTComp()
Dim mPdnTime As Long, mPdnCycleTime As Long, mPdnReqdQty As Double, mPdnRawInQty As Double, mPdnCompQty As Double, mPdnCompTime As Long

mPdnRawInQty = UnMyNumFmt(mskPdnRawInQty.Text)
mPdnTime = TimeToSec(txtTimeStr.Text)
mPdnCycleTime = TimeToSec(txtCycleTimeStr.Text)
mPdnReqdQty = MyDivide(mPdnTime, mPdnCycleTime) * 1

mPdnCompQty = mPdnRawInQty - mPdnReqdQty
mPdnCompTime = mPdnCompQty * mPdnCycleTime / 1

mskPdnReqdQty.Text = ToMyNumFmt(mPdnReqdQty, mDecimals:=0)
mskPdnCompQty.Text = ToMyNumFmt(mPdnCompQty, mDecimals:=0)
txtCompTimeStr.Text = SecToTime(mPdnCompTime)

End Sub
