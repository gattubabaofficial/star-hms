VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "Mscomctl.ocx"
Begin VB.Form frmMyMenu 
   Appearance      =   0  'Flat
   BackColor       =   &H00FFFFE7&
   ClientHeight    =   10290
   ClientLeft      =   60
   ClientTop       =   60
   ClientWidth     =   15030
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
   MDIChild        =   -1  'True
   ScaleHeight     =   10290
   ScaleWidth      =   15030
   WindowState     =   2  'Maximized
   Begin VB.Frame frComMasterMenu 
      Appearance      =   0  'Flat
      BackColor       =   &H00FFE395&
      Caption         =   "            Standard Master           "
      BeginProperty Font 
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
      Left            =   3480
      TabIndex        =   67
      Tag             =   "0"
      Top             =   1740
      Width           =   3255
      Begin VB.CommandButton cmdComMasterMenu 
         Caption         =   "User Rig&hts Master"
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
         TabIndex        =   38
         Top             =   2400
         Width           =   2655
      End
      Begin VB.CommandButton cmdComMasterMenu 
         Caption         =   "&Voucher Type"
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
         TabIndex        =   41
         Top             =   3840
         Width           =   2655
      End
      Begin VB.CommandButton cmdComMasterMenu 
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
         TabIndex        =   34
         Top             =   480
         Width           =   2655
      End
      Begin VB.CommandButton cmdComMasterMenu 
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
         TabIndex        =   35
         Top             =   960
         Width           =   2655
      End
      Begin VB.CommandButton cmdComMasterMenu 
         Caption         =   "User R&ole Master"
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
         TabIndex        =   36
         Top             =   1440
         Width           =   2655
      End
      Begin VB.CommandButton cmdComMasterMenu 
         Caption         =   "&User Master"
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
         TabIndex        =   37
         Top             =   1920
         Width           =   2655
      End
      Begin VB.CommandButton cmdComMasterMenu 
         Caption         =   "S&tation Master"
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
         TabIndex        =   39
         Top             =   2880
         Width           =   2655
      End
      Begin VB.CommandButton cmdComMasterMenu 
         Caption         =   "A&rea Master"
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
         TabIndex        =   40
         Top             =   3360
         Width           =   2655
      End
   End
   Begin VB.Frame frPyrMasterMenu 
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFEF1&
      Caption         =   "             Payroll Master             "
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   2775
      Left            =   3480
      TabIndex        =   68
      Tag             =   "0"
      Top             =   1260
      Width           =   3255
      Begin VB.CommandButton cmdPyrMasterMenu 
         Caption         =   "&Employee Master"
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
         TabIndex        =   44
         Top             =   1320
         Width           =   2775
      End
      Begin VB.CommandButton cmdPyrMasterMenu 
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
         Index           =   0
         Left            =   240
         Style           =   1  'Graphical
         TabIndex        =   42
         Top             =   360
         Width           =   2775
      End
      Begin VB.CommandButton cmdPyrMasterMenu 
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
         Index           =   1
         Left            =   240
         Style           =   1  'Graphical
         TabIndex        =   43
         Top             =   840
         Width           =   2775
      End
   End
   Begin VB.Frame frMdsMasterMenu 
      Appearance      =   0  'Flat
      BackColor       =   &H00C1FFD7&
      Caption         =   "               Store Master              "
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   3735
      Left            =   3480
      TabIndex        =   73
      Tag             =   "0"
      Top             =   900
      Width           =   3255
      Begin VB.CommandButton cmdMdsMasterMenu 
         Caption         =   "Party G&roup Master"
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
         TabIndex        =   31
         Top             =   1680
         Width           =   2775
      End
      Begin VB.CommandButton cmdMdsMasterMenu 
         Caption         =   "&Item Master"
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
         TabIndex        =   30
         Top             =   1080
         Width           =   2775
      End
      Begin VB.CommandButton cmdMdsMasterMenu 
         Caption         =   "&Party Master"
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
         TabIndex        =   29
         Top             =   480
         Width           =   2775
      End
      Begin VB.CommandButton cmdMdsMasterMenu 
         Caption         =   "Item &Group Maser"
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
         TabIndex        =   32
         Top             =   2280
         Width           =   2775
      End
      Begin VB.CommandButton cmdMdsMasterMenu 
         Caption         =   "&Opening Stock"
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
         TabIndex        =   33
         Top             =   2880
         Width           =   2775
      End
   End
   Begin VB.Frame frMdsEntryMenu 
      Appearance      =   0  'Flat
      BackColor       =   &H00F5FFE1&
      Caption         =   "                     Store                    "
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   4095
      Left            =   6840
      TabIndex        =   71
      Tag             =   "0"
      Top             =   480
      Width           =   3255
      Begin VB.CommandButton cmdMediStoreMenu 
         Caption         =   "Sales &Payment"
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
         TabIndex        =   46
         Top             =   900
         Width           =   2835
      End
      Begin VB.CommandButton cmdMediStoreMenu 
         Caption         =   "&Sales Entry"
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
         TabIndex        =   45
         Top             =   360
         Width           =   2835
      End
      Begin VB.CommandButton cmdMediStoreMenu 
         Caption         =   "&Purchase Entry"
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
         TabIndex        =   47
         Top             =   1440
         Width           =   2835
      End
      Begin VB.CommandButton cmdMediStoreMenu 
         Caption         =   "Monthly Report Format-&1"
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
         Left            =   180
         Style           =   1  'Graphical
         TabIndex        =   48
         Top             =   2040
         Width           =   2835
      End
      Begin VB.CommandButton cmdMediStoreMenu 
         Caption         =   "Monthly Report Format-&2"
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
         Left            =   180
         Style           =   1  'Graphical
         TabIndex        =   49
         Top             =   2580
         Width           =   2835
      End
   End
   Begin VB.Frame frMaintenanceMenu 
      Appearance      =   0  'Flat
      BackColor       =   &H00BFDBF3&
      Caption         =   "               Maintenance              "
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   4815
      Left            =   13560
      TabIndex        =   66
      Tag             =   "0"
      Top             =   480
      Width           =   3255
      Begin VB.CommandButton cmdMaintenanceMenu 
         Caption         =   "Take &Backup"
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
         TabIndex        =   56
         Top             =   360
         Width           =   2985
      End
      Begin VB.CommandButton cmdMaintenanceMenu 
         Caption         =   "Hospital &Indoor Options"
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
         TabIndex        =   61
         Top             =   3540
         Visible         =   0   'False
         Width           =   2985
      End
      Begin VB.CommandButton cmdMaintenanceMenu 
         Caption         =   "Hospital &Outdoor Options"
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
         TabIndex        =   60
         Top             =   3180
         Visible         =   0   'False
         Width           =   2985
      End
      Begin VB.CommandButton cmdMaintenanceMenu 
         Caption         =   "&Standard Options"
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
         TabIndex        =   59
         Top             =   2820
         Visible         =   0   'False
         Width           =   2985
      End
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
         Index           =   6
         Left            =   120
         Style           =   1  'Graphical
         TabIndex        =   58
         Top             =   1620
         Width           =   2985
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
         Index           =   5
         Left            =   120
         Style           =   1  'Graphical
         TabIndex        =   57
         Top             =   1020
         Width           =   2985
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
         Index           =   4
         Left            =   120
         Style           =   1  'Graphical
         TabIndex        =   62
         Top             =   3900
         Visible         =   0   'False
         Width           =   2985
      End
   End
   Begin VB.Frame frDisplayMenu 
      Appearance      =   0  'Flat
      BackColor       =   &H00A4DBF3&
      Caption         =   "                    Display                 "
      BeginProperty Font 
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
      Left            =   10200
      TabIndex        =   65
      Tag             =   "0"
      Top             =   480
      Width           =   3255
      Begin VB.CommandButton cmdDisplayMenu 
         Caption         =   "&Indoor Register"
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
         TabIndex        =   53
         Top             =   3720
         Visible         =   0   'False
         Width           =   1875
      End
      Begin VB.CommandButton cmdDisplayMenu 
         Caption         =   "&Stock Register"
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
         TabIndex        =   52
         Top             =   1320
         Width           =   2775
      End
      Begin VB.CommandButton cmdDisplayMenu 
         Caption         =   "Stock &Day Book"
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
         TabIndex        =   51
         Top             =   840
         Width           =   2775
      End
      Begin VB.CommandButton cmdDisplayMenu 
         Caption         =   "&Registration Report"
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
         TabIndex        =   50
         Top             =   360
         Width           =   2775
      End
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
         Index           =   5
         Left            =   240
         Style           =   1  'Graphical
         TabIndex        =   55
         Top             =   4440
         Visible         =   0   'False
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
         Index           =   4
         Left            =   240
         Style           =   1  'Graphical
         TabIndex        =   54
         Top             =   4080
         Visible         =   0   'False
         Width           =   1815
      End
   End
   Begin VB.Frame frMasterMenu 
      Appearance      =   0  'Flat
      BackColor       =   &H00FFE3B9&
      Caption         =   "                  Masters                   "
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   4275
      Left            =   120
      TabIndex        =   69
      Tag             =   "0"
      Top             =   4320
      Width           =   3255
      Begin VB.CommandButton cmdMasterMenu 
         Caption         =   "&Medical Store Master"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   -1  'True
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Index           =   3
         Left            =   240
         Style           =   1  'Graphical
         TabIndex        =   10
         Top             =   900
         Width           =   2655
      End
      Begin VB.CommandButton cmdMasterMenu 
         Caption         =   "S&tore Keeping Master"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   -1  'True
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Index           =   2
         Left            =   360
         Style           =   1  'Graphical
         TabIndex        =   14
         Top             =   3420
         Visible         =   0   'False
         Width           =   2655
      End
      Begin VB.CommandButton cmdMasterMenu 
         Caption         =   "&Diagnostic Master"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   -1  'True
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Index           =   1
         Left            =   360
         Style           =   1  'Graphical
         TabIndex        =   13
         Top             =   3060
         Visible         =   0   'False
         Width           =   2655
      End
      Begin VB.CommandButton cmdMasterMenu 
         Caption         =   "&Vigen Master"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   -1  'True
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Index           =   0
         Left            =   240
         Style           =   1  'Graphical
         TabIndex        =   9
         Top             =   360
         Width           =   2655
      End
      Begin VB.CommandButton cmdMasterMenu 
         Caption         =   "&Standard Master"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   -1  'True
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Index           =   4
         Left            =   240
         Style           =   1  'Graphical
         TabIndex        =   11
         Top             =   1500
         Width           =   2655
      End
      Begin VB.CommandButton cmdMasterMenu 
         Caption         =   "&Payroll Master"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   -1  'True
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Index           =   5
         Left            =   240
         Style           =   1  'Graphical
         TabIndex        =   12
         Top             =   2100
         Width           =   2655
      End
   End
   Begin MSComctlLib.StatusBar StatusBar1 
      Align           =   2  'Align Bottom
      Height          =   315
      Left            =   0
      TabIndex        =   74
      Top             =   9975
      Width           =   15030
      _ExtentX        =   26511
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
            TextSave        =   "17:10"
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
   Begin VB.Frame frMainMenu 
      Appearance      =   0  'Flat
      BackColor       =   &H00FFCC95&
      Caption         =   "                 Main Menu                "
      BeginProperty Font 
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
      Left            =   120
      TabIndex        =   63
      Tag             =   "0"
      Top             =   480
      Width           =   3255
      Begin VB.CommandButton cmdMainMenu 
         Caption         =   "&Store Management"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   -1  'True
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Index           =   5
         Left            =   240
         Style           =   1  'Graphical
         TabIndex        =   2
         Top             =   1680
         Width           =   2655
      End
      Begin VB.CommandButton cmdMainMenu 
         Caption         =   "&Store Keeping"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   -1  'True
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Index           =   4
         Left            =   240
         Style           =   1  'Graphical
         TabIndex        =   7
         Top             =   5820
         Visible         =   0   'False
         Width           =   2655
      End
      Begin VB.CommandButton cmdMainMenu 
         Caption         =   "Dia&gnostic"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   -1  'True
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Index           =   3
         Left            =   240
         Style           =   1  'Graphical
         TabIndex        =   6
         Top             =   5460
         Visible         =   0   'False
         Width           =   2655
      End
      Begin VB.CommandButton cmdMainMenu 
         Caption         =   "&Indoor"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   -1  'True
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Index           =   2
         Left            =   240
         Style           =   1  'Graphical
         TabIndex        =   5
         Top             =   5100
         Visible         =   0   'False
         Width           =   2655
      End
      Begin VB.CommandButton cmdMainMenu 
         Caption         =   "&Registration"
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
         Width           =   2655
      End
      Begin VB.CommandButton cmdMainMenu 
         Caption         =   "&Maint&enance"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   -1  'True
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Index           =   8
         Left            =   240
         Style           =   1  'Graphical
         TabIndex        =   4
         Top             =   2805
         Width           =   2655
      End
      Begin VB.CommandButton cmdMainMenu 
         Caption         =   "&Display"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   -1  'True
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Index           =   7
         Left            =   240
         Style           =   1  'Graphical
         TabIndex        =   3
         Top             =   2220
         Width           =   2655
      End
      Begin VB.CommandButton cmdMainMenu 
         Caption         =   "&General"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   -1  'True
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Index           =   6
         Left            =   240
         Style           =   1  'Graphical
         TabIndex        =   8
         Top             =   6240
         Visible         =   0   'False
         Width           =   2655
      End
      Begin VB.CommandButton cmdMainMenu 
         Caption         =   "&Masters"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   -1  'True
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Index           =   0
         Left            =   240
         Style           =   1  'Graphical
         TabIndex        =   0
         Top             =   480
         Width           =   2655
      End
   End
   Begin VB.Frame frVgnMasterMenu 
      Appearance      =   0  'Flat
      BackColor       =   &H00FFF101&
      Caption         =   "              Vigen Masters             "
      BeginProperty Font 
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
      Left            =   3480
      TabIndex        =   72
      Tag             =   "0"
      Top             =   480
      Width           =   3255
      Begin VB.CommandButton cmdVgnMasterMenu 
         Caption         =   "Ser&vice Group Master"
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
         TabIndex        =   21
         Top             =   3240
         Width           =   2775
      End
      Begin VB.CommandButton cmdVgnMasterMenu 
         Caption         =   "&Attendant Master"
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
         TabIndex        =   19
         Top             =   2280
         Width           =   2775
      End
      Begin VB.CommandButton cmdVgnMasterMenu 
         Caption         =   "Attendant Cate&gory"
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
         TabIndex        =   16
         Top             =   840
         Width           =   2775
      End
      Begin VB.CommandButton cmdVgnMasterMenu 
         Caption         =   "Patient Categ&ory"
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
         TabIndex        =   15
         Top             =   360
         Width           =   2775
      End
      Begin VB.CommandButton cmdVgnMasterMenu 
         Caption         =   "Servi&ce Master"
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
         TabIndex        =   22
         Top             =   3720
         Width           =   2775
      End
      Begin VB.CommandButton cmdVgnMasterMenu 
         Caption         =   "&Patient Master"
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
         Index           =   9
         Left            =   240
         Style           =   1  'Graphical
         TabIndex        =   23
         Top             =   4200
         Width           =   2775
      End
      Begin VB.CommandButton cmdVgnMasterMenu 
         Caption         =   "D&iagnostic Master"
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
         Index           =   10
         Left            =   240
         Style           =   1  'Graphical
         TabIndex        =   24
         Top             =   4680
         Width           =   2775
      End
      Begin VB.CommandButton cmdVgnMasterMenu 
         Caption         =   "Bed &Floor Master"
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
         Index           =   11
         Left            =   240
         Style           =   1  'Graphical
         TabIndex        =   26
         Top             =   5880
         Visible         =   0   'False
         Width           =   2775
      End
      Begin VB.CommandButton cmdVgnMasterMenu 
         Caption         =   "Bed &Ward Master"
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
         Index           =   12
         Left            =   240
         Style           =   1  'Graphical
         TabIndex        =   27
         Top             =   6240
         Visible         =   0   'False
         Width           =   2775
      End
      Begin VB.CommandButton cmdVgnMasterMenu 
         Caption         =   "&Bed Master"
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
         Index           =   13
         Left            =   240
         Style           =   1  'Graphical
         TabIndex        =   28
         Top             =   6600
         Visible         =   0   'False
         Width           =   2775
      End
      Begin VB.CommandButton cmdVgnMasterMenu 
         Caption         =   "&Referred Category"
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
         TabIndex        =   17
         Top             =   1320
         Width           =   2775
      End
      Begin VB.CommandButton cmdVgnMasterMenu 
         Caption         =   "Referred &By Master"
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
         TabIndex        =   20
         Top             =   2760
         Width           =   2775
      End
      Begin VB.CommandButton cmdVgnMasterMenu 
         Caption         =   "Referred &To Master"
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
         TabIndex        =   25
         Top             =   5520
         Visible         =   0   'False
         Width           =   2775
      End
      Begin VB.CommandButton cmdVgnMasterMenu 
         Caption         =   "Attendant Rol&e"
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
         TabIndex        =   18
         Top             =   1800
         Width           =   2775
      End
   End
   Begin VB.Label lblCompanyInfo 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Company Information"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   11.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FF0000&
      Height          =   3015
      Left            =   5040
      TabIndex        =   70
      Top             =   6240
      Width           =   4335
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
      TabIndex        =   64
      Top             =   0
      Width           =   9015
   End
End
Attribute VB_Name = "frmMyMenu"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Rem general hits for updation
Rem Button Variable Declaration
Rem Button_Click, Button_GotFocus, Button_LostFocus
Rem Form_Load
Rem Form_Resize
Rem Form_Unload

Option Explicit

Dim MyProgStatForm As frmProgressStatus
Dim mFormLoaded As Boolean
Dim cmdMasters As Object, cmdOutdoorReg As Object, cmdMedicalStore As Object, cmdDisplay As Object, cmdMaintenance As Object
Dim cmdVgnMaster As Object, cmdDglMaster As Object, cmdMdsMaster As Object, cmdComMaster As Object, cmdPyrMaster As Object

Dim cmdPatCatgMast As Object, cmdDoctCatgMast As Object, cmdRefCatgMast As Object, cmdDoctRoleMast As Object, cmdDoctMast As Object, cmdRefByMast As Object, cmdRefToMast As Object, cmdServGrpMast As Object, cmdServiceMast As Object, cmdPatMast As Object, cmdDiagMast As Object
Dim cmdMedPartyMast As Object, cmdMedItemMast As Object, cmdMedPartyGrpMast As Object, cmdMedItemGrpMast As Object, cmdOpnStock As Object

Dim cmdAcntLdgr As Object, cmdProdMast As Object, cmdUserRoleMast As Object, cmdUserMast As Object, cmdUserRightMast As Object, cmdStationMast As Object, cmdAreaMast As Object, cmdVTypeMast As Object
Dim cmdDeptMast As Object, cmdDesgMast As Object, cmdEmpMast As Object

Dim cmdJournalEntry As Object, cmdStockJrnEntry As Object
Dim cmdOutdReg As Object, cmdOutdRcpt As Object, cmdOutdPymt As Object, cmdOutdRefd As Object, cmdOutdBill As Object, cmdOutdBlPymt As Object, cmdOutdBlRefd As Object

Dim cmdSaleEntry As Object, cmdSalePymtEntry As Object, cmdPurchEntry As Object, cmdMonthRepFmt1st As Object, cmdMonthRepFmt2nd As Object, cmdSaleRetEntry As Object, cmdPurchRetEntry As Object

Dim cmdOpdRegView As Object, cmdStockDayBookView As Object, cmdStockRegView As Object, cmdLedgerView As Object, cmdItemView As Object
Dim cmdTakeBackup As Object, cmdComOptions As Object, cmdVgnOpdOptions As Object, cmdVgnIpdOptions As Object, cmdAcBalRepost As Object, cmdRemoveNullValue As Object, cmdCheckDataStru As Object

Private Sub cmdComMasterMenu_Click(Index As Integer)

cmdComMasterMenu(Index).Container.Tag = Index

Select Case Screen.ActiveControl
Case cmdAcntLdgr:
    ChkFormAccess frmAcntHead
    
Case cmdProdMast:
    ChkFormAccess frmItemMast
    
Case cmdUserRoleMast:
    ChkFormAccess frmUserRoleMast
    
Case cmdUserMast
    ChkFormAccess frmUserMast
    
Case cmdUserRightMast
    ChkFormAccess frmUserRightMast
    
Case cmdStationMast
    ChkFormAccess frmStationMast
    
Case cmdAreaMast
    ChkFormAccess frmAreaMast
    
Case cmdVTypeMast
    ChkFormAccess frmVoucherType
    
End Select

Me.ZOrder

End Sub

Private Sub cmdComMasterMenu_GotFocus(Index As Integer)
cmdComMasterMenu(Index).BackColor = cYELLOWLIGHT

End Sub

Private Sub cmdComMasterMenu_LostFocus(Index As Integer)
cmdComMasterMenu(Index).BackColor = vbButtonFace

End Sub

Private Sub cmdDisplayMenu_Click(Index As Integer)
cmdDisplayMenu(Index).Container.Tag = Index

Select Case Screen.ActiveControl
Case cmdOpdRegView:
    ChkFormAccess frmOutdoorRegViewRep
    
Case cmdStockDayBookView:
    ChkFormAccess frmStockTranViewRep
    
Case cmdStockRegView:
    ChkFormAccess frmStockRegRep
    
Case cmdLedgerView:
    ChkFormAccess frmLedgerView
    
Case cmdItemView:
    ChkFormAccess frmItemView

End Select


Me.ZOrder
End Sub

Private Sub cmdDisplayMenu_GotFocus(Index As Integer)
cmdDisplayMenu(Index).BackColor = cYELLOWLIGHT

End Sub

Private Sub cmdDisplayMenu_LostFocus(Index As Integer)
cmdDisplayMenu(Index).BackColor = vbButtonFace

End Sub

Private Sub cmdVgnMasterMenu_Click(Index As Integer)
cmdVgnMasterMenu(Index).Container.Tag = Index

Select Case Screen.ActiveControl
Case cmdPatCatgMast
    ChkFormAccess frmPatCategoryMast
    
Case cmdDoctCatgMast
    ChkFormAccess frmDoctorCatgMast
    
Case cmdRefCatgMast
    ChkFormAccess frmRefCatgMast
    
Case cmdDoctRoleMast
    ChkFormAccess frmDoctorRoleMast
    
Case cmdDoctMast
    ChkFormAccess frmDoctorMast
    
Case cmdRefByMast
    ChkFormAccess frmRefByMast
    
Case cmdRefToMast
    ChkFormAccess frmRefToMast
    
Case cmdServGrpMast
    ChkFormAccess frmServGroupMast
    
Case cmdServiceMast
    ChkFormAccess frmServiceMast
    
Case cmdPatMast
    ChkFormAccess frmPatientMast
    
Case cmdDiagMast
    ChkFormAccess frmDiagnosticMast
    
End Select

Me.ZOrder
End Sub

Private Sub cmdVgnMasterMenu_GotFocus(Index As Integer)
cmdVgnMasterMenu(Index).BackColor = cYELLOWLIGHT
End Sub

Private Sub cmdVgnMasterMenu_LostFocus(Index As Integer)
cmdVgnMasterMenu(Index).BackColor = vbButtonFace
End Sub

Private Sub cmdMainMenu_Click(Index As Integer)
cmdMainMenu(Index).Container.Tag = Index

Select Case Screen.ActiveControl
Case cmdMasters:
    frMasterMenu.Visible = True
    GoTo HideMainMenu
Case cmdOutdoorReg:
    ChkFormAccess frmOutdoorReg
    
Case cmdMedicalStore
    frMdsEntryMenu.Visible = True
    GoTo HideMainMenu

Case cmdDisplay:
    frDisplayMenu.Visible = True
    GoTo HideMainMenu
Case cmdMaintenance:
    frMaintenanceMenu.Visible = True
    GoTo HideMainMenu
End Select
Exit Sub

HideMainMenu:
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
Case cmdTakeBackup
    Load frmTakeBackup
    frmTakeBackup.Show 1
Case cmdComOptions
    ChkFormAccess frmCommonOptions
    
Case cmdVgnOpdOptions
    Rem ChkFormAccess frmVgnOpdOptions
    
Case cmdVgnIpdOptions
    Rem ChkFormAccess frmVgnIpdOptions
    
Case cmdAcBalRepost:
    RepostAllAchdCurBal
Case cmdRemoveNullValue
    RemoveAppNullValue
Case cmdCheckDataStru
    Set MyProgStatForm = New frmProgressStatus
    Load MyProgStatForm
    MyProgStatForm.Show
    Rem common database
    CreateAcDatabase mAddMode:=False, FormProgStatus:=MyProgStatForm
    CreateStDatabase mAddMode:=False, FormProgStatus:=MyProgStatForm
    CreateGrpDatabase mAddMode:=False, FormProgStatus:=MyProgStatForm
    CreateComDatabase mAddMode:=False, FormProgStatus:=MyProgStatForm
    
    Rem Vigen database
    CreateVgnCmpDatabase mAddMode:=False, FormProgStatus:=MyProgStatForm
    CreateVgnMastDatabase mAddMode:=False, FormProgStatus:=MyProgStatForm
    CreateVgnTranDatabase mAddMode:=False, FormProgStatus:=MyProgStatForm
    CreateVgnComDatabase FormProgStatus:=MyProgStatForm
    
    Rem payroll database
    CreatePyrDatabase mAddMode:=False, FormProgStatus:=MyProgStatForm
    CreatePyrComDatabase FormProgStatus:=MyProgStatForm
        
    Unload MyProgStatForm
    Set MyProgStatForm = Nothing
    
    InfoBox "Database Structure Updation, Done !!!"
    
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

Case cmdVgnMaster
    frVgnMasterMenu.Visible = True
    frMasterMenu.Visible = False
    
Case cmdMdsMaster
    frMdsMasterMenu.Visible = True
    frMasterMenu.Visible = False

Case cmdComMaster
    frComMasterMenu.Visible = True
    frMasterMenu.Visible = False
    
Case cmdPyrMaster
    frPyrMasterMenu.Visible = True
    frMasterMenu.Visible = False
    
End Select

Me.ZOrder
End Sub

Private Sub cmdMasterMenu_GotFocus(Index As Integer)
cmdMasterMenu(Index).BackColor = cYELLOWLIGHT

End Sub

Private Sub cmdMasterMenu_LostFocus(Index As Integer)
cmdMasterMenu(Index).BackColor = vbButtonFace

End Sub

Private Sub cmdMdsMasterMenu_Click(Index As Integer)
Dim MyForm As Form
cmdMdsMasterMenu(Index).Container.Tag = Index

Select Case Screen.ActiveControl
Case cmdMedPartyMast
    ChkFormAccess frmMedPartyMast
    
Case cmdMedItemMast
    ChkFormAccess frmMedItemMast
    
Case cmdMedPartyGrpMast
    ChkFormAccess frmMedPartyGrpMast
    
Case cmdMedItemGrpMast
    ChkFormAccess frmMedItemGrpMast
    
Case cmdOpnStock
    ChkFormAccess frmMedicalPurch, cCOM_VTYPE_OPNSTK
'    Set MyForm = New frmMedicalPurch
'    Load MyForm
'    MyForm.FormSysVchType = cCOM_VTYPE_OPNSTK
'    Call MyForm.Form_Load
'    MyForm.Show 1

End Select
Me.ZOrder

End Sub

Private Sub cmdMdsMasterMenu_GotFocus(Index As Integer)
cmdMdsMasterMenu(Index).BackColor = cYELLOWLIGHT
End Sub

Private Sub cmdMdsMasterMenu_LostFocus(Index As Integer)
cmdMdsMasterMenu(Index).BackColor = vbButtonFace
End Sub

Private Sub cmdMediStoreMenu_Click(Index As Integer)
Dim MyForm As Form

cmdMediStoreMenu(Index).Container.Tag = Index

Select Case Screen.ActiveControl
Case cmdSaleEntry
    ChkFormAccess frmMedicalSale, cVGN_VTYPE_MEDSALE

Case cmdSalePymtEntry
    ChkFormAccess frmMediSalesPayment
    
Case cmdPurchEntry
    ChkFormAccess frmMedicalPurch, cVGN_VTYPE_MEDPURCH
    
Case cmdMonthRepFmt1st
    ChkFormAccess frmMonthlyRepFmt1st

Case cmdMonthRepFmt2nd
    ChkFormAccess frmMonthlyRepFmt2nd

Case cmdSaleRetEntry
    ChkFormAccess frmMedicalPurch, cVGN_VTYPE_MEDRETNINW

Case cmdPurchRetEntry
    ChkFormAccess frmMedicalSale, cCOM_VTYPE_RETNOUTW
    
End Select

Me.ZOrder

End Sub

Private Sub cmdMediStoreMenu_GotFocus(Index As Integer)
cmdMediStoreMenu(Index).BackColor = cYELLOWLIGHT
End Sub

Private Sub cmdMediStoreMenu_LostFocus(Index As Integer)
cmdMediStoreMenu(Index).BackColor = vbButtonFace
End Sub

Private Sub cmdPyrMasterMenu_Click(Index As Integer)
cmdPyrMasterMenu(Index).Container.Tag = Index

Select Case Screen.ActiveControl
Case cmdDeptMast
    ChkFormAccess frmDepartmentMast
    
Case cmdDesgMast
    ChkFormAccess frmDesignationMast
    
Case cmdEmpMast:
    ChkFormAccess frmEmployeeMast
    
End Select

Me.ZOrder

End Sub

Private Sub cmdPyrMasterMenu_GotFocus(Index As Integer)
cmdPyrMasterMenu(Index).BackColor = cYELLOWLIGHT

End Sub

Private Sub cmdPyrMasterMenu_LostFocus(Index As Integer)
cmdPyrMasterMenu(Index).BackColor = vbButtonFace

End Sub

Private Sub Form_Activate()
If mFormLoaded = False Then
    frMainMenu.Visible = True   ' after positoning proper location
Else
    Call TraceLastCmdObj
End If
mFormLoaded = True
End Sub

Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)

Select Case KeyCode
Case vbKeyF2    ''' common routing from any form
    Load frmSetDefaultDate
    frmSetDefaultDate.Show 1
Case 13:
    
Case 27:
    If frMasterMenu.Visible = True Then
        frMasterMenu.Visible = False
        frMainMenu.Visible = True
        
        Call TraceLastCmdObj
        
    ElseIf frVgnMasterMenu.Visible = True Then
        frVgnMasterMenu.Visible = False
        frMasterMenu.Visible = True
        
        Call TraceLastCmdObj
    
    ElseIf frMdsMasterMenu.Visible = True Then
        frMdsMasterMenu.Visible = False
        frMasterMenu.Visible = True
        
        Call TraceLastCmdObj
    
    ElseIf frComMasterMenu.Visible = True Then
        frComMasterMenu.Visible = False
        frMasterMenu.Visible = True
        
        Call TraceLastCmdObj
        
    ElseIf frPyrMasterMenu.Visible = True Then
        frPyrMasterMenu.Visible = False
        frMasterMenu.Visible = True
        
        Call TraceLastCmdObj
        
    ElseIf frMdsEntryMenu.Visible = True Then
        frMdsEntryMenu.Visible = False
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
    ElseIf frMainMenu.Visible = True Then
        If ExitThisApp() = True Then
            Unload Me
            
            ChDir sAppPath
            Load frmCompanyMaster
            frmCompanyMaster.Show
            frmCompanyMaster.ZOrder
        End If
    End If

Case Else
    If Between(KeyCode, vbKeyA, vbKeyZ) = True And Shift = 0 Then
        SendKeys "%" & CStr(Chr(KeyCode))
    End If

End Select

End Sub

Private Sub Form_Load()
mFormLoaded = False

Rem main menu
Set cmdMasters = cmdMainMenu(0): cmdMasters.Caption = "&Masters"
Set cmdOutdoorReg = cmdMainMenu(1): cmdOutdoorReg.Caption = "&Registration"
Set cmdMedicalStore = cmdMainMenu(5): cmdMedicalStore.Caption = "&Store Management"
Set cmdDisplay = cmdMainMenu(7): cmdDisplay.Caption = "&Display"
Set cmdMaintenance = cmdMainMenu(8): cmdMaintenance.Caption = "Maint&enance"

Rem main master menu
Set cmdVgnMaster = cmdMasterMenu(0): cmdVgnMaster.Caption = "&Vigen Master"
Set cmdDglMaster = cmdMasterMenu(1): cmdDglMaster.Caption = "&Diagnostic Master"
Set cmdMdsMaster = cmdMasterMenu(3): cmdMdsMaster.Caption = "&Store Master"
Set cmdComMaster = cmdMasterMenu(4): cmdComMaster.Caption = "&Standard Master"
Set cmdPyrMaster = cmdMasterMenu(5): cmdPyrMaster.Caption = "&Payroll Master"

Rem Vigen master menu
Set cmdPatCatgMast = cmdVgnMasterMenu(0): cmdPatCatgMast.Caption = "Patient Categ&ory"
Set cmdDoctCatgMast = cmdVgnMasterMenu(1): cmdDoctCatgMast.Caption = "Attendant Cate&gory"
Set cmdRefCatgMast = cmdVgnMasterMenu(2): cmdRefCatgMast.Caption = "&Referred Category"
Set cmdDoctRoleMast = cmdVgnMasterMenu(3): cmdDoctRoleMast.Caption = "Attendant Rol&e"
Set cmdDoctMast = cmdVgnMasterMenu(4): cmdDoctMast.Caption = "&Attendant Master"
Set cmdRefByMast = cmdVgnMasterMenu(5): cmdRefByMast.Caption = "Referred &By Master"
Set cmdRefToMast = cmdVgnMasterMenu(6): cmdRefToMast.Caption = "Referred &To Master"
Set cmdServGrpMast = cmdVgnMasterMenu(7): cmdServGrpMast.Caption = "Ser&vice Group Master"
Set cmdServiceMast = cmdVgnMasterMenu(8): cmdServiceMast.Caption = "Servi&ce Master"
Set cmdPatMast = cmdVgnMasterMenu(9): cmdPatMast.Caption = "&Patient Master"
Set cmdDiagMast = cmdVgnMasterMenu(10): cmdDiagMast.Caption = "D&iagnostic Master"

Rem medical store menu
Set cmdMedPartyMast = cmdMdsMasterMenu(0): cmdMedPartyMast.Caption = "&Party Master"
Set cmdMedItemMast = cmdMdsMasterMenu(1): cmdMedItemMast.Caption = "&Item Master"
Set cmdMedPartyGrpMast = cmdMdsMasterMenu(2): cmdMedPartyGrpMast.Caption = "Party G&roup Master"
Set cmdMedItemGrpMast = cmdMdsMasterMenu(3): cmdMedItemGrpMast.Caption = "Item &Group Master"
Set cmdOpnStock = cmdMdsMasterMenu(4): cmdOpnStock.Caption = "&Opening Stock"

Rem standard master menu
Set cmdAcntLdgr = cmdComMasterMenu(0): cmdAcntLdgr.Caption = "&Account Ledger"
Set cmdProdMast = cmdComMasterMenu(1): cmdProdMast.Caption = "&Product Master"
Set cmdUserRoleMast = cmdComMasterMenu(2): cmdUserRoleMast.Caption = "User R&ole Master"
Set cmdUserMast = cmdComMasterMenu(3): cmdUserMast.Caption = "&User Master"
Set cmdUserRightMast = cmdComMasterMenu(4): cmdUserRightMast.Caption = "User Rig&ht Master"
Set cmdStationMast = cmdComMasterMenu(5): cmdStationMast.Caption = "S&tation Master"
Set cmdAreaMast = cmdComMasterMenu(6): cmdAreaMast.Caption = "A&rea Master"
Set cmdVTypeMast = cmdComMasterMenu(7): cmdVTypeMast.Caption = "&Voucher Type"

Rem payroll master menu
Set cmdDeptMast = cmdPyrMasterMenu(0): cmdDeptMast.Caption = "&Department Master"
Set cmdDesgMast = cmdPyrMasterMenu(1): cmdDesgMast.Caption = "Desi&gnation Master"
Set cmdEmpMast = cmdPyrMasterMenu(2): cmdEmpMast.Caption = "&Employee Master"

Rem medical store entry menu
Set cmdSaleEntry = cmdMediStoreMenu(0): cmdSaleEntry.Caption = "&Sales Entry"
Set cmdSalePymtEntry = cmdMediStoreMenu(1): cmdSalePymtEntry.Caption = "Sales &Payment"
Set cmdPurchEntry = cmdMediStoreMenu(2): cmdPurchEntry.Caption = "&Purchase Entry"
Set cmdMonthRepFmt1st = cmdMediStoreMenu(3): cmdMonthRepFmt1st.Caption = "Monthly Report Format-&1"
Set cmdMonthRepFmt2nd = cmdMediStoreMenu(4): cmdMonthRepFmt2nd.Caption = "Monthly Report Format-&2"
Rem Set cmdSaleRetEntry = cmdMediStoreMenu(3): cmdSaleRetEntry.Caption = "Sales &Return"
Rem Set cmdPurchRetEntry = cmdMediStoreMenu(4): cmdPurchRetEntry.Caption = "Purchase Ret&urn"

Rem display menu
Set cmdOpdRegView = cmdDisplayMenu(0): cmdOpdRegView.Caption = "&Registration Report"
Set cmdStockDayBookView = cmdDisplayMenu(1): cmdStockDayBookView.Caption = "Stock &Day Book"
Set cmdStockRegView = cmdDisplayMenu(2): cmdStockRegView.Caption = "&Stock Register"
Set cmdLedgerView = cmdDisplayMenu(4): cmdLedgerView.Caption = "&Ledger View"
Set cmdItemView = cmdDisplayMenu(5): cmdItemView.Caption = "&Item View"

Rem maintenance menu
Set cmdTakeBackup = cmdMaintenanceMenu(0): cmdTakeBackup.Caption = "Take &Backup"
Set cmdComOptions = cmdMaintenanceMenu(1): cmdComOptions.Caption = "&Standard Options"
Set cmdVgnOpdOptions = cmdMaintenanceMenu(2): cmdVgnOpdOptions.Caption = "Vigen &Outdoor Options"
Set cmdVgnIpdOptions = cmdMaintenanceMenu(3): cmdVgnIpdOptions.Caption = "&Vigen &Indoor Options"
Set cmdAcBalRepost = cmdMaintenanceMenu(4): cmdAcBalRepost.Caption = "&A/c Balance Reposting"
Set cmdRemoveNullValue = cmdMaintenanceMenu(5): cmdRemoveNullValue.Caption = "&Remove Null Value"
Set cmdCheckDataStru = cmdMaintenanceMenu(6): cmdCheckDataStru.Caption = "&Check Data Structure"

frMainMenu.Visible = False
frMasterMenu.Visible = False
frVgnMasterMenu.Visible = False
frMdsMasterMenu.Visible = False
frComMasterMenu.Visible = False
frPyrMasterMenu.Visible = False
frMdsEntryMenu.Visible = False
frDisplayMenu.Visible = False
frMaintenanceMenu.Visible = False

lblCompanyInfo.Caption = MyCompany.mCmpName _
    & vbCrLf & MyCompany.mCmpAddress _
    & vbCrLf & MyCompany.mCmpCity _
    & vbCrLf & MyCompany.mCmpState _
    & vbCrLf & MyCompany.mCmpEmail _
    & vbCrLf & MyCompany.mCmpWebsite _
    & vbCrLf & MyCompany.mCmpOPhone _
    & vbCrLf & MyCompany.mCmpRPhone _
    & vbCrLf & vbCrLf & vbCrLf & vbCrLf & vbCrLf _
    & "Fin.Year: " & Dtoc(MyCompany.mCmpFYStartDt) & " to " & Dtoc(MyCompany.mCmpFYEndDt) _
    & vbCrLf & vbCrLf & vbCrLf & vbCrLf & vbCrLf _
    & "User Logined: " & MyCompany.mUserName & " (" & MyCompany.mUserRoleName & ")"

ShowStatusBarText StatusBar1

Call InitVgnServRateSysParaOpt

End Sub

Private Sub StatusBar1_PanelClick(ByVal Panel As MSComctlLib.Panel)
ShowStatusBarText StatusBar1
End Sub

Private Sub Form_Resize()
Dim mTop As Double, mLeft As Double

If Me.WindowState = vbMinimized Or frmMain.WindowState = vbMinimized Then
    Exit Sub
End If

lblFormHeading.Width = Me.Width

mTop = lblFormHeading.Top + (lblFormHeading.Height * 2)
mLeft = (Me.Width - frMainMenu.Width) / 2
frMainMenu.Top = mTop: frMainMenu.Left = mLeft

mLeft = (Me.Width - frMasterMenu.Width) / 2
frMasterMenu.Top = mTop: frMasterMenu.Left = mLeft

mLeft = (Me.Width - frVgnMasterMenu.Width) / 2
frVgnMasterMenu.Top = mTop: frVgnMasterMenu.Left = mLeft

mLeft = (Me.Width - frMdsMasterMenu.Width) / 2
frMdsMasterMenu.Top = mTop: frMdsMasterMenu.Left = mLeft

mLeft = (Me.Width - frComMasterMenu.Width) / 2
frComMasterMenu.Top = mTop: frComMasterMenu.Left = mLeft

mLeft = (Me.Width - frPyrMasterMenu.Width) / 2
frPyrMasterMenu.Top = mTop: frPyrMasterMenu.Left = mLeft

mLeft = (Me.Width - frMdsEntryMenu.Width) / 2
frMdsEntryMenu.Top = mTop: frMdsEntryMenu.Left = mLeft

mLeft = (Me.Width - frDisplayMenu.Width) / 2
frDisplayMenu.Top = mTop: frDisplayMenu.Left = mLeft

mLeft = (Me.Width - frMaintenanceMenu.Width) / 2
frMaintenanceMenu.Top = mTop: frMaintenanceMenu.Left = mLeft

lblCompanyInfo.Left = 100
lblCompanyInfo.Top = mTop
lblCompanyInfo.Width = frMainMenu.Left - 200
lblCompanyInfo.Height = (Me.Height - lblCompanyInfo.Top) / 1.25

End Sub

Private Sub TraceLastCmdObj()
Dim cnt1 As Integer, cnt2 As Integer, mTotObjCount As Integer, mLastCmdObj As CommandButton, mFrameObj As Frame, mObjFound As Boolean
mTotObjCount = Me.Controls.count
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

Private Sub Form_Unload(Cancel As Integer)
Set MyProgStatForm = Nothing
Set cmdMasters = Nothing: Set cmdOutdoorReg = Nothing: Set cmdMedicalStore = Nothing: Set cmdDisplay = Nothing: Set cmdMaintenance = Nothing
Set cmdVgnMaster = Nothing: Set cmdDglMaster = Nothing: Set cmdMdsMaster = Nothing: Set cmdComMaster = Nothing: Set cmdPyrMaster = Nothing

Set cmdPatCatgMast = Nothing: Set cmdDoctCatgMast = Nothing: Set cmdRefCatgMast = Nothing: Set cmdDoctRoleMast = Nothing: Set cmdDoctMast = Nothing: Set cmdRefByMast = Nothing: Set cmdRefToMast = Nothing: Set cmdServGrpMast = Nothing: Set cmdServiceMast = Nothing: Set cmdPatMast = Nothing: Set cmdDiagMast = Nothing
Set cmdMedPartyMast = Nothing: Set cmdMedItemMast = Nothing: Set cmdMedPartyGrpMast = Nothing: Set cmdMedItemGrpMast = Nothing: Set cmdOpnStock = Nothing
Set cmdAcntLdgr = Nothing: Set cmdProdMast = Nothing: Set cmdUserRoleMast = Nothing: Set cmdUserMast = Nothing: Set cmdUserRightMast = Nothing: Set cmdStationMast = Nothing: Set cmdAreaMast = Nothing: Set cmdVTypeMast = Nothing
Set cmdDeptMast = Nothing: Set cmdDesgMast = Nothing: Set cmdEmpMast = Nothing

Set cmdOutdReg = Nothing: Set cmdOutdRcpt = Nothing: Set cmdOutdPymt = Nothing: Set cmdOutdRefd = Nothing: Set cmdOutdBill = Nothing: Set cmdOutdBlPymt = Nothing: Set cmdOutdBlRefd = Nothing
Set cmdSaleEntry = Nothing: Set cmdSalePymtEntry = Nothing: Set cmdPurchEntry = Nothing: Set cmdMonthRepFmt1st = Nothing: Set cmdMonthRepFmt2nd = Nothing: Set cmdSaleRetEntry = Nothing: Set cmdPurchRetEntry = Nothing
Set cmdJournalEntry = Nothing: Set cmdStockJrnEntry = Nothing

Set cmdOpdRegView = Nothing: Set cmdStockDayBookView = Nothing: Set cmdStockRegView = Nothing: Set cmdLedgerView = Nothing: Set cmdItemView = Nothing
Set cmdTakeBackup = Nothing: Set cmdComOptions = Nothing: Set cmdVgnOpdOptions = Nothing: Set cmdVgnIpdOptions = Nothing: Set cmdAcBalRepost = Nothing: Set cmdRemoveNullValue = Nothing: Set cmdCheckDataStru = Nothing

End Sub

Private Sub ChkFormAccess(ByRef MyForm As Form, Optional mFormSysVchType)
Dim mFrmVewAcsPermitted As Boolean

mFrmVewAcsPermitted = False
Load MyForm
mFrmVewAcsPermitted = CanUserViewOpt(mUsrCode:=MyCompany.mUserCode, mMenuOptName:=MyForm.SecuMenuName)
If mFrmVewAcsPermitted = True Then
    If IsMissing(mFormSysVchType) = False Then
        MyForm.FormSysVchType = mFormSysVchType
        Call MyForm.Form_Load
    End If
    MyForm.Show 1
Else
    AlertBox "Not Permitted !!!"
    Unload MyForm
End If
Set MyForm = Nothing

End Sub

