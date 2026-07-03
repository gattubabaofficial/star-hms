VERSION 5.00
Begin VB.Form frmMyMenu 
   Appearance      =   0  'Flat
   BackColor       =   &H80000005&
   ClientHeight    =   8835
   ClientLeft      =   60
   ClientTop       =   60
   ClientWidth     =   14565
   ControlBox      =   0   'False
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   ScaleHeight     =   8835
   ScaleWidth      =   14565
   WindowState     =   2  'Maximized
   Begin VB.Frame frReceiptFromVendorMenu 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   " Receipt From Vendor  "
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   1935
      Left            =   8640
      TabIndex        =   45
      Tag             =   "0"
      Top             =   5520
      Width           =   2775
      Begin VB.CommandButton cmdReceiptFromVendorMenu 
         Caption         =   "Receipt From &Forging"
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
         Index           =   0
         Left            =   240
         Style           =   1  'Graphical
         TabIndex        =   33
         Top             =   360
         Width           =   2295
      End
      Begin VB.CommandButton cmdReceiptFromVendorMenu 
         Caption         =   "Receipt for &Parting"
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
         Index           =   2
         Left            =   240
         Style           =   1  'Graphical
         TabIndex        =   35
         Top             =   1320
         Width           =   2295
      End
      Begin VB.CommandButton cmdReceiptFromVendorMenu 
         Caption         =   "Receipt From &BOD"
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
         Index           =   1
         Left            =   240
         Style           =   1  'Graphical
         TabIndex        =   34
         Top             =   840
         Width           =   2295
      End
   End
   Begin VB.Frame frIssueToVendorMenu 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   "      Issue to Vendor      "
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   1935
      Left            =   5880
      TabIndex        =   44
      Tag             =   "0"
      Top             =   5520
      Width           =   2655
      Begin VB.CommandButton cmdIssueToVendorMenu 
         Caption         =   "Issue for &Forging"
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
         Index           =   0
         Left            =   240
         Style           =   1  'Graphical
         TabIndex        =   30
         Top             =   360
         Width           =   2175
      End
      Begin VB.CommandButton cmdIssueToVendorMenu 
         Caption         =   "Issue for &BOD"
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
         Index           =   1
         Left            =   240
         Style           =   1  'Graphical
         TabIndex        =   31
         Top             =   840
         Width           =   2175
      End
      Begin VB.CommandButton cmdIssueToVendorMenu 
         Caption         =   "Issue for &Parting"
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
         Index           =   2
         Left            =   240
         Style           =   1  'Graphical
         TabIndex        =   32
         Top             =   1320
         Width           =   2175
      End
   End
   Begin VB.Frame frStockProcessMenu 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   "        Stock Process           "
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   1695
      Left            =   3000
      TabIndex        =   43
      Tag             =   "0"
      Top             =   5520
      Width           =   2775
      Begin VB.CommandButton cmdStockProcessMenu 
         Caption         =   "&Forging Production"
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
         Index           =   1
         Left            =   240
         Style           =   1  'Graphical
         TabIndex        =   29
         Top             =   960
         Width           =   2295
      End
      Begin VB.CommandButton cmdStockProcessMenu 
         Caption         =   "&Machine Production"
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
         Index           =   0
         Left            =   240
         Style           =   1  'Graphical
         TabIndex        =   28
         Top             =   480
         Width           =   2295
      End
   End
   Begin VB.Frame frStockTransferMenu 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   "          Stock Transfer         "
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   3495
      Left            =   0
      TabIndex        =   42
      Tag             =   "0"
      Top             =   5520
      Width           =   2895
      Begin VB.CommandButton cmdStockTransferMenu 
         Caption         =   "Issue to Forging"
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
         Index           =   1
         Left            =   120
         Style           =   1  'Graphical
         TabIndex        =   23
         Top             =   960
         Width           =   2655
      End
      Begin VB.CommandButton cmdStockTransferMenu 
         Caption         =   "&Receipt from Vendor"
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
         Index           =   3
         Left            =   120
         Style           =   1  'Graphical
         TabIndex        =   25
         Top             =   1920
         Width           =   2655
      End
      Begin VB.CommandButton cmdStockTransferMenu 
         Caption         =   "Issue to &Vendor"
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
         Index           =   2
         Left            =   120
         Style           =   1  'Graphical
         TabIndex        =   24
         Top             =   1440
         Width           =   2655
      End
      Begin VB.CommandButton cmdStockTransferMenu 
         Caption         =   "&Issue to Mach. Operator"
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
         Index           =   0
         Left            =   120
         Style           =   1  'Graphical
         TabIndex        =   22
         Top             =   480
         Width           =   2655
      End
      Begin VB.CommandButton cmdStockTransferMenu 
         Caption         =   "Assembling (&Packing)"
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
         Index           =   4
         Left            =   120
         Style           =   1  'Graphical
         TabIndex        =   26
         Top             =   2400
         Width           =   2655
      End
      Begin VB.CommandButton cmdStockTransferMenu 
         Caption         =   "&Dispatch"
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
         Index           =   5
         Left            =   120
         Style           =   1  'Graphical
         TabIndex        =   27
         Top             =   2880
         Width           =   2655
      End
   End
   Begin VB.Frame frMasterMenu 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   "               Masters                "
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   4935
      Left            =   2280
      TabIndex        =   37
      Tag             =   "0"
      Top             =   480
      Width           =   2895
      Begin VB.CommandButton cmdMasterMenu 
         Caption         =   "&Vendor Master"
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
         Index           =   8
         Left            =   240
         Style           =   1  'Graphical
         TabIndex        =   12
         Top             =   4320
         Width           =   2415
      End
      Begin VB.CommandButton cmdMasterMenu 
         Caption         =   "Material P&rocess"
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
         Index           =   7
         Left            =   240
         Style           =   1  'Graphical
         TabIndex        =   11
         Top             =   3840
         Width           =   2415
      End
      Begin VB.CommandButton cmdMasterMenu 
         Caption         =   "Desi&gnation Master"
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
         Index           =   3
         Left            =   240
         Style           =   1  'Graphical
         TabIndex        =   7
         Top             =   1920
         Width           =   2415
      End
      Begin VB.CommandButton cmdMasterMenu 
         Caption         =   "&Department Master"
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
         Index           =   2
         Left            =   240
         Style           =   1  'Graphical
         TabIndex        =   6
         Top             =   1440
         Width           =   2415
      End
      Begin VB.CommandButton cmdMasterMenu 
         Caption         =   "Pac&king Person"
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
         Index           =   6
         Left            =   240
         Style           =   1  'Graphical
         TabIndex        =   10
         Top             =   3360
         Width           =   2415
      End
      Begin VB.CommandButton cmdMasterMenu 
         Caption         =   "&Machine Master"
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
         Index           =   5
         Left            =   240
         Style           =   1  'Graphical
         TabIndex        =   9
         Top             =   2880
         Width           =   2415
      End
      Begin VB.CommandButton cmdMasterMenu 
         Caption         =   "Machine &Operator"
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
         Index           =   4
         Left            =   240
         Style           =   1  'Graphical
         TabIndex        =   8
         Top             =   2400
         Width           =   2415
      End
      Begin VB.CommandButton cmdMasterMenu 
         Caption         =   "&Product Master"
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
         Index           =   1
         Left            =   240
         Style           =   1  'Graphical
         TabIndex        =   5
         Top             =   960
         Width           =   2415
      End
      Begin VB.CommandButton cmdMasterMenu 
         Caption         =   "&Account Ledger"
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
         Index           =   0
         Left            =   240
         Style           =   1  'Graphical
         TabIndex        =   4
         Top             =   480
         Width           =   2415
      End
   End
   Begin VB.Frame frMaintenanceMenu 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   "           Maintenance            "
      BeginProperty Font 
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
      Left            =   10080
      TabIndex        =   41
      Tag             =   "0"
      Top             =   480
      Width           =   2895
      Begin VB.CommandButton cmdMaintenanceMenu 
         Caption         =   "&Check Data Structure"
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
         Index           =   2
         Left            =   180
         Style           =   1  'Graphical
         TabIndex        =   21
         Top             =   1680
         Width           =   2505
      End
      Begin VB.CommandButton cmdMaintenanceMenu 
         Caption         =   "&Remove Null Value"
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
         Index           =   1
         Left            =   180
         Style           =   1  'Graphical
         TabIndex        =   20
         Top             =   1065
         Width           =   2505
      End
      Begin VB.CommandButton cmdMaintenanceMenu 
         Caption         =   "&A/c Balance Reposting"
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
         Index           =   0
         Left            =   180
         Style           =   1  'Graphical
         TabIndex        =   19
         Top             =   480
         Width           =   2505
      End
   End
   Begin VB.Frame frDisplayMenu 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   "          Display            "
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   1935
      Left            =   7680
      TabIndex        =   40
      Tag             =   "0"
      Top             =   480
      Width           =   2295
      Begin VB.CommandButton cmdDisplayMenu 
         Caption         =   "&Product View"
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
         Index           =   1
         Left            =   240
         Style           =   1  'Graphical
         TabIndex        =   18
         Top             =   1080
         Width           =   1815
      End
      Begin VB.CommandButton cmdDisplayMenu 
         Caption         =   "&Ledger View"
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
         Index           =   0
         Left            =   240
         Style           =   1  'Graphical
         TabIndex        =   17
         Top             =   480
         Width           =   1815
      End
   End
   Begin VB.Frame frTransactionMenu 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   "       Transactions      "
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   2895
      Left            =   5280
      TabIndex        =   38
      Tag             =   "0"
      Top             =   480
      Width           =   2295
      Begin VB.CommandButton cmdTransactionMenu 
         Caption         =   "Stock &Process"
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
         Index           =   3
         Left            =   240
         Style           =   1  'Graphical
         TabIndex        =   16
         Top             =   2280
         Width           =   1815
      End
      Begin VB.CommandButton cmdTransactionMenu 
         Caption         =   "Stock &Transfer"
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
         Index           =   2
         Left            =   240
         Style           =   1  'Graphical
         TabIndex        =   15
         Top             =   1680
         Width           =   1815
      End
      Begin VB.CommandButton cmdTransactionMenu 
         Caption         =   "&Stock Journal"
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
         Index           =   1
         Left            =   240
         Style           =   1  'Graphical
         TabIndex        =   14
         Top             =   1080
         Width           =   1815
      End
      Begin VB.CommandButton cmdTransactionMenu 
         Caption         =   "&Journal Entry"
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
         Index           =   0
         Left            =   240
         Style           =   1  'Graphical
         TabIndex        =   13
         Top             =   480
         Width           =   1815
      End
   End
   Begin VB.Frame frMainMenu 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   "      Main Menu       "
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   3015
      Left            =   120
      TabIndex        =   36
      Tag             =   "0"
      Top             =   480
      Width           =   2055
      Begin VB.CommandButton cmdMainMenu 
         Caption         =   "&Maint&enance"
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
         Index           =   3
         Left            =   240
         Style           =   1  'Graphical
         TabIndex        =   3
         Top             =   2325
         Width           =   1575
      End
      Begin VB.CommandButton cmdMainMenu 
         Caption         =   "&Display"
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
         Index           =   2
         Left            =   240
         Style           =   1  'Graphical
         TabIndex        =   2
         Top             =   1680
         Width           =   1575
      End
      Begin VB.CommandButton cmdMainMenu 
         Caption         =   "&Transactions"
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
         Index           =   1
         Left            =   240
         Style           =   1  'Graphical
         TabIndex        =   1
         Top             =   1080
         Width           =   1575
      End
      Begin VB.CommandButton cmdMainMenu 
         Caption         =   "&Masters"
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
         Index           =   0
         Left            =   240
         Style           =   1  'Graphical
         TabIndex        =   0
         Top             =   480
         Width           =   1575
      End
   End
   Begin VB.Label lblFormHeading 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00E0E0E0&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Application Start Menu"
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
      TabIndex        =   39
      Top             =   0
      Width           =   9015
   End
End
Attribute VB_Name = "frmMyMenu"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Dim FormLoaded As Boolean
Dim cmdMasters As Object, cmdTransactions As Object, cmdDisplay As Object, cmdMaintenance As Object
Dim cmdAcntLdgr As Object, cmdProdMast As Object, cmdDeptMast As Object, cmdDesgMast As Object, cmdMachOptr As Object, cmdMachineMast As Object, cmdPackingPerson As Object, cmdMaterialProcess As Object, cmdVendorMast As Object
Dim cmdJournalEntry As Object, cmdStockJrnEntry As Object, cmdStockTransfer As Object, cmdStockProcess As Object
Dim cmdLedgerView As Object, cmdItemView As Object
Dim cmdAcBalRepost As Object, cmdRemoveNullValue As Object, cmdCheckDataStru As Object
Dim cmdMatIssueToMachOptr As Object, cmdMatIssueToForging As Object, cmdMatIssueToVendor As Object, cmdMatReceiptFromVendor As Object, cmdMatPacking As Object, cmdMatDispatch As Object
Dim cmdMacProduction As Object, cmdFrgProduction As Object
Dim cmdVendIssueForg As Object, cmdVendIssueBOD As Object, cmdVendIssueParting As Object
Dim cmdVndRcptFromForg As Object, cmdVndRcptFromBOD As Object, cmdVndRcptFromParting As Object

Private Sub cmdDisplayMenu_Click(Index As Integer)
cmdDisplayMenu(Index).Container.Tag = Index

Select Case Screen.ActiveControl
Case cmdLedgerView:
    Load frmLedgerView
    frmLedgerView.Show 1
Case cmdItemView:
    Load frmItemView
    frmItemView.Show 1

End Select


Me.ZOrder
End Sub

Private Sub cmdDisplayMenu_GotFocus(Index As Integer)
cmdDisplayMenu(Index).BackColor = cYELLOWLIGHT

End Sub

Private Sub cmdDisplayMenu_LostFocus(Index As Integer)
cmdDisplayMenu(Index).BackColor = vbButtonFace

End Sub

Private Sub cmdIssueToVendorMenu_Click(Index As Integer)
cmdIssueToVendorMenu(Index).Container.Tag = Index

Select Case Screen.ActiveControl
Case cmdVendIssueForg
    Load frmVendorIssueForg
    frmVendorIssueForg.Show 1
    
Case cmdVendIssueBOD
    Load frmVendorIssueBod
    frmVendorIssueBod.Show 1
    
Case cmdVendIssueParting
    Load frmVendorIssuePart
    frmVendorIssuePart.Show 1
    
End Select

Me.ZOrder
End Sub

Private Sub cmdIssueToVendorMenu_GotFocus(Index As Integer)
cmdIssueToVendorMenu(Index).BackColor = cYELLOWLIGHT

End Sub

Private Sub cmdIssueToVendorMenu_LostFocus(Index As Integer)
cmdIssueToVendorMenu(Index).BackColor = vbButtonFace

End Sub

Private Sub cmdMainMenu_Click(Index As Integer)
cmdMainMenu(Index).Container.Tag = Index

Select Case Screen.ActiveControl
Case cmdMasters:
    frMasterMenu.Visible = True
Case cmdTransactions:
    frTransactionMenu.Visible = True
Case cmdDisplay:
    frDisplayMenu.Visible = True
Case cmdMaintenance:
    frMaintenanceMenu.Visible = True
End Select
frMainMenu.Visible = False


End Sub

Private Sub cmdMainMenu_GotFocus(Index As Integer)
cmdMainMenu(Index).BackColor = cYELLOWLIGHT
End Sub

Private Sub cmdMainMenu_LostFocus(Index As Integer)
cmdMainMenu(Index).BackColor = vbButtonFace
End Sub

Private Sub cmdMaintenanceMenu_Click(Index As Integer)
cmdMaintenanceMenu(Index).Container.Tag = Index

Select Case Screen.ActiveControl
Case cmdAcBalRepost:
    RepostAllAchdCurBal
Case cmdRemoveNullValue
    RemoveAppNullValue
Case cmdCheckDataStru
    CreateAcDatabase mAddMode:=False
    CreateStDatabase mAddMode:=False
    CreateGrpDatabase mAddMode:=False
    CreateComDatabase mAddMode:=False
    CreatePyrDatabase mAddMode:=False
    CreatePyrComDatabase
    CreateTlgDatabase mAddMode:=False
    CreateTlgComDatabase
    
End Select

End Sub

Private Sub cmdMaintenanceMenu_GotFocus(Index As Integer)
cmdMaintenanceMenu(Index).BackColor = cYELLOWLIGHT

End Sub

Private Sub cmdMaintenanceMenu_LostFocus(Index As Integer)
cmdMaintenanceMenu(Index).BackColor = vbButtonFace

End Sub

Private Sub cmdMasterMenu_Click(Index As Integer)
cmdMasterMenu(Index).Container.Tag = Index

Select Case Screen.ActiveControl
Case cmdAcntLdgr:
    Load frmAcntHead
    frmAcntHead.Show 1
Case cmdProdMast:
    Load frmItemMast
    frmItemMast.Show 1
Case cmdDeptMast
    Load frmDepartmentMast
    frmDepartmentMast.Show 1
Case cmdDesgMast
    Load frmDesignationMast
    frmDesignationMast.Show 1
Case cmdMachOptr:
    Load frmEmployeeMast
    frmEmployeeMast.Show 1
Case cmdMachineMast:
    Load frmMachineMaster
    frmMachineMaster.Show 1
Case cmdPackingPerson
    Load frmEmployeeMast
    frmEmployeeMast.Show 1
Case cmdMaterialProcess
    Load frmMaterialProcessMast
    frmMaterialProcessMast.Show 1
Case cmdVendorMast
    Load frmVendorMast
    frmVendorMast.Show 1
End Select

Me.ZOrder
End Sub

Private Sub cmdMasterMenu_GotFocus(Index As Integer)
cmdMasterMenu(Index).BackColor = cYELLOWLIGHT

End Sub

Private Sub cmdMasterMenu_LostFocus(Index As Integer)
cmdMasterMenu(Index).BackColor = vbButtonFace

End Sub

Private Sub cmdReceiptFromVendorMenu_Click(Index As Integer)
cmdReceiptFromVendorMenu(Index).Container.Tag = Index

Select Case Screen.ActiveControl
Case cmdVndRcptFromForg
    Load frmVendorRcptForg
    frmVendorRcptForg.Show 1
    
Case cmdVndRcptFromBOD
    Load frmVendorRcptBod
    frmVendorRcptBod.Show 1
    
Case cmdVndRcptFromParting
    Load frmVendorRcptPart
    frmVendorRcptPart.Show 1
    
End Select

Me.ZOrder
End Sub

Private Sub cmdReceiptFromVendorMenu_GotFocus(Index As Integer)
cmdReceiptFromVendorMenu(Index).BackColor = cYELLOWLIGHT

End Sub

Private Sub cmdReceiptFromVendorMenu_LostFocus(Index As Integer)
cmdReceiptFromVendorMenu(Index).BackColor = vbButtonFace

End Sub

Private Sub cmdStockProcessMenu_Click(Index As Integer)
cmdStockProcessMenu(Index).Container.Tag = Index

Select Case Screen.ActiveControl
Case cmdMacProduction:
    Load frmMacProduction
    frmMacProduction.Show 1
Case cmdFrgProduction
    Load frmForgingProduction
    frmForgingProduction.Show 1
    
End Select

Me.ZOrder
End Sub

Private Sub cmdStockTransferMenu_Click(Index As Integer)
cmdStockTransferMenu(Index).Container.Tag = Index

Select Case Screen.ActiveControl
Case cmdMatIssueToMachOptr:
    Load frmMaterialIssue
    frmMaterialIssue.Show 1
Case cmdMatIssueToForging
    Load frmForgingIssue
    frmForgingIssue.Show 1
Case cmdMatIssueToVendor
    frIssueToVendorMenu.Visible = True
    frStockTransferMenu.Visible = False
Case cmdMatReceiptFromVendor
    frReceiptFromVendorMenu.Visible = True
    frStockTransferMenu.Visible = False
Case cmdMatPacking
    Load frmMatPacking
    frmMatPacking.Show 1
Case cmdMatDispatch
    Load frmMatDispatch
    frmMatDispatch.Show 1
    
End Select

Me.ZOrder
End Sub

Private Sub cmdStockTransferMenu_GotFocus(Index As Integer)
cmdStockTransferMenu(Index).BackColor = cYELLOWLIGHT

End Sub

Private Sub cmdStockTransferMenu_LostFocus(Index As Integer)
cmdStockTransferMenu(Index).BackColor = vbButtonFace

End Sub

Private Sub cmdStockProcessMenu_GotFocus(Index As Integer)
cmdStockProcessMenu(Index).BackColor = cYELLOWLIGHT

End Sub

Private Sub cmdStockProcessMenu_LostFocus(Index As Integer)
cmdStockProcessMenu(Index).BackColor = vbButtonFace

End Sub

Private Sub cmdTransactionMenu_Click(Index As Integer)
cmdTransactionMenu(Index).Container.Tag = Index

Select Case Screen.ActiveControl
Case cmdJournalEntry:
    Load frmJournal
    frmJournal.Show 1
Case cmdStockJrnEntry:
    Load frmStockJrn
    frmStockJrn.Show 1
Case cmdStockTransfer
    frStockTransferMenu.Visible = True
    frTransactionMenu.Visible = False
Case cmdStockProcess
    frStockProcessMenu.Visible = True
    frTransactionMenu.Visible = False
End Select

Me.ZOrder
End Sub

Private Sub cmdTransactionMenu_GotFocus(Index As Integer)
cmdTransactionMenu(Index).BackColor = cYELLOWLIGHT

End Sub

Private Sub cmdTransactionMenu_LostFocus(Index As Integer)
cmdTransactionMenu(Index).BackColor = vbButtonFace
End Sub

Private Sub Form_Activate()
If FormLoaded = False Then

Else
    Call TraceLastCmdObj
End If
FormLoaded = True
End Sub

Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)

Select Case KeyCode
Case 13:
    
Case 27:
    If frMasterMenu.Visible = True Then
        frMasterMenu.Visible = False
        frMainMenu.Visible = True
        
        Call TraceLastCmdObj
    ElseIf frTransactionMenu.Visible = True Then
        frTransactionMenu.Visible = False
        frMainMenu.Visible = True
        
        Call TraceLastCmdObj
    ElseIf frDisplayMenu.Visible = True Then
        frDisplayMenu.Visible = False
        frMainMenu.Visible = True
        
        Call TraceLastCmdObj
    ElseIf frMaintenanceMenu.Visible = True Then
        frMaintenanceMenu.Visible = False
        frMainMenu.Visible = True
        
        Call TraceLastCmdObj
    ElseIf frStockTransferMenu.Visible = True Then
        frStockTransferMenu.Visible = False
        frTransactionMenu.Visible = True
        
        Call TraceLastCmdObj
    ElseIf frStockProcessMenu.Visible = True Then
        frStockProcessMenu.Visible = False
        frTransactionMenu.Visible = True
        
        Call TraceLastCmdObj
    ElseIf frIssueToVendorMenu.Visible = True Then
        frIssueToVendorMenu.Visible = False
        frStockTransferMenu.Visible = True
        
        Call TraceLastCmdObj
    ElseIf frReceiptFromVendorMenu.Visible = True Then
        frReceiptFromVendorMenu.Visible = False
        frStockTransferMenu.Visible = True
        
        Call TraceLastCmdObj
    ElseIf frMainMenu.Visible = True Then
        If ExitThisApp() = True Then
            Unload Me
            frmMain.ExitThisApp
        End If
    
    End If
    
End Select

End Sub

Private Sub Form_Load()
FormLoaded = False

Rem main menu
Set cmdMasters = cmdMainMenu(0)
Set cmdTransactions = cmdMainMenu(1)
Set cmdDisplay = cmdMainMenu(2)
Set cmdMaintenance = cmdMainMenu(3)

Rem main menu button captions
cmdMasters.Caption = "&Masters"
cmdTransactions.Caption = "&Transactions"
cmdDisplay.Caption = "&Display"
cmdMaintenance.Caption = "Maint&enance"

Set cmdAcntLdgr = cmdMasterMenu(0): cmdAcntLdgr.Caption = "&Account Ledger"
Set cmdProdMast = cmdMasterMenu(1): cmdProdMast.Caption = "&Product Master"
Set cmdDeptMast = cmdMasterMenu(2): cmdDeptMast.Caption = "&Department Master"
Set cmdDesgMast = cmdMasterMenu(3): cmdDesgMast.Caption = "Desi&gnation Master"
Set cmdMachOptr = cmdMasterMenu(4): cmdMachOptr.Caption = "Machine &Operator"
Set cmdMachineMast = cmdMasterMenu(5): cmdMachineMast.Caption = "&Machine Master"
Set cmdPackingPerson = cmdMasterMenu(6): cmdPackingPerson.Caption = "Pac&king Person"
Set cmdMaterialProcess = cmdMasterMenu(7): cmdMaterialProcess.Caption = "Material P&rocess"
Set cmdVendorMast = cmdMasterMenu(8): cmdVendorMast.Caption = "&Vendor Master"

Set cmdJournalEntry = cmdTransactionMenu(0): cmdJournalEntry.Caption = "&Journal Entry"
Set cmdStockJrnEntry = cmdTransactionMenu(1): cmdStockJrnEntry.Caption = "&Stock Journal"
Set cmdStockTransfer = cmdTransactionMenu(2): cmdStockTransfer.Caption = "Stock &Transfer"
Set cmdStockProcess = cmdTransactionMenu(3): cmdStockProcess.Caption = "Stock &Process"

Set cmdLedgerView = cmdDisplayMenu(0): cmdLedgerView.Caption = "&Ledger View"
Set cmdItemView = cmdDisplayMenu(1): cmdItemView.Caption = "&Item View"

Set cmdAcBalRepost = cmdMaintenanceMenu(0): cmdAcBalRepost.Caption = "&A/c Balance Reposting"
Set cmdRemoveNullValue = cmdMaintenanceMenu(1): cmdRemoveNullValue.Caption = "&Remove Null Value"
Set cmdCheckDataStru = cmdMaintenanceMenu(2): cmdCheckDataStru.Caption = "&Check Data Structure"

Set cmdMatIssueToMachOptr = cmdStockTransferMenu(0): cmdMatIssueToMachOptr.Caption = "&Issue to Mach.Operator"
Set cmdMatIssueToForging = cmdStockTransferMenu(1): cmdMatIssueToForging.Caption = "Issue to &Forging"
Set cmdMatIssueToVendor = cmdStockTransferMenu(2): cmdMatIssueToVendor.Caption = "Issue to &Vendor"
Set cmdMatReceiptFromVendor = cmdStockTransferMenu(3): cmdMatReceiptFromVendor.Caption = "&Receipt from Vendor"
Set cmdMatPacking = cmdStockTransferMenu(4): cmdMatPacking.Caption = "Assembling (&Packing)"
Set cmdMatDispatch = cmdStockTransferMenu(5): cmdMatDispatch.Caption = "&Dispatch"

Set cmdVendIssueForg = cmdIssueToVendorMenu(0): cmdVendIssueForg.Caption = "Issue for &Forging"
Set cmdVendIssueBOD = cmdIssueToVendorMenu(1): cmdVendIssueBOD.Caption = "Issue for &BOD"
Set cmdVendIssueParting = cmdIssueToVendorMenu(2): cmdVendIssueParting.Caption = "Issue for &Parting"

Set cmdVndRcptFromForg = cmdReceiptFromVendorMenu(0): cmdVndRcptFromForg.Caption = "Receipt from &Forging"
Set cmdVndRcptFromBOD = cmdReceiptFromVendorMenu(1): cmdVndRcptFromBOD.Caption = "Receipt from &BOD"
Set cmdVndRcptFromParting = cmdReceiptFromVendorMenu(2): cmdVndRcptFromParting.Caption = "Receipt from &Parting"

Set cmdMacProduction = cmdStockProcessMenu(0): cmdMacProduction.Caption = "&Machine Production"
Set cmdFrgProduction = cmdStockProcessMenu(1): cmdFrgProduction.Caption = "&Forging Production"

frMainMenu.Visible = True
frMasterMenu.Visible = False
frTransactionMenu.Visible = False
frDisplayMenu.Visible = False
frMaintenanceMenu.Visible = False
frStockTransferMenu.Visible = False
frStockProcessMenu.Visible = False
frIssueToVendorMenu.Visible = False
frReceiptFromVendorMenu.Visible = False

End Sub

Private Sub Form_Resize()
Dim mTop As Double, mLeft As Double
lblFormHeading.Width = Me.Width

mTop = lblFormHeading.Top + (lblFormHeading.Height * 2)
mLeft = (Me.Width - frMainMenu.Width) / 2
frMainMenu.Top = mTop: frMainMenu.Left = mLeft

mLeft = (Me.Width - frMasterMenu.Width) / 2
frMasterMenu.Top = mTop: frMasterMenu.Left = mLeft

mLeft = (Me.Width - frTransactionMenu.Width) / 2
frTransactionMenu.Top = mTop: frTransactionMenu.Left = mLeft

mLeft = (Me.Width - frTransactionMenu.Width) / 2
frTransactionMenu.Top = mTop: frTransactionMenu.Left = mLeft

mLeft = (Me.Width - frDisplayMenu.Width) / 2
frDisplayMenu.Top = mTop: frDisplayMenu.Left = mLeft

mLeft = (Me.Width - frMaintenanceMenu.Width) / 2
frMaintenanceMenu.Top = mTop: frMaintenanceMenu.Left = mLeft

mLeft = (Me.Width - frStockTransferMenu.Width) / 2
frStockTransferMenu.Top = mTop: frStockTransferMenu.Left = mLeft

mLeft = (Me.Width - frStockProcessMenu.Width) / 2
frStockProcessMenu.Top = mTop: frStockProcessMenu.Left = mLeft

mLeft = (Me.Width - frIssueToVendorMenu.Width) / 2
frIssueToVendorMenu.Top = mTop: frIssueToVendorMenu.Left = mLeft

mLeft = (Me.Width - frReceiptFromVendorMenu.Width) / 2
frReceiptFromVendorMenu.Top = mTop: frReceiptFromVendorMenu.Left = mLeft

End Sub

Private Sub TraceLastCmdObj()
Dim cnt1 As Integer, cnt2 As Integer, mTotObjCount As Integer, mLastCmdObj As CommandButton, mFrameObj As Frame, mObjFound As Boolean
mTotObjCount = Me.Controls.Count
mObjFound = False
For cnt1 = 0 To mTotObjCount - 1
    If TypeOf Me.Controls(cnt1) Is Frame Then
        If Me.Controls(cnt1).Visible = True Then
            Set mFrameObj = Me.Controls(cnt1)
            For cnt2 = 0 To mTotObjCount - 1
                If TypeOf Me.Controls(cnt2) Is CommandButton Then
                    If Me.Controls(cnt2).Container.Name = mFrameObj.Name And Me.Controls(cnt2).Index = mFrameObj.Tag Then
                        Me.Controls(cnt2).SetFocus
                        mObjFound = True
                        Exit For
                    End If
                End If
            Next
        End If
    End If
    If mObjFound = True Then
        Exit For
    End If
Next

End Sub

