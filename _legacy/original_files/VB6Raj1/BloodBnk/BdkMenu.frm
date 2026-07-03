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
      TabIndex        =   64
      Tag             =   "0"
      Top             =   6120
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
         TabIndex        =   36
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
         TabIndex        =   34
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
         TabIndex        =   35
         Top             =   840
         Width           =   2775
      End
   End
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
      TabIndex        =   63
      Tag             =   "0"
      Top             =   3120
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
         TabIndex        =   30
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
         TabIndex        =   33
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
         TabIndex        =   26
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
         TabIndex        =   27
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
         TabIndex        =   28
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
         TabIndex        =   29
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
         TabIndex        =   31
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
         TabIndex        =   32
         Top             =   3360
         Width           =   2655
      End
   End
   Begin VB.Frame frGenTranMenu 
      Appearance      =   0  'Flat
      BackColor       =   &H00BCDBF3&
      Caption         =   "        General Transactions      "
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   2175
      Left            =   6840
      TabIndex        =   59
      Tag             =   "0"
      Top             =   5340
      Width           =   3255
      Begin VB.CommandButton cmdGenTranMenu 
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
         TabIndex        =   44
         Top             =   960
         Width           =   2895
      End
      Begin VB.CommandButton cmdGenTranMenu 
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
         TabIndex        =   43
         Top             =   480
         Width           =   2895
      End
   End
   Begin VB.Frame frBdkEntryMenu 
      Appearance      =   0  'Flat
      BackColor       =   &H00F5FFE1&
      Caption         =   "                Blood Bank               "
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   4755
      Left            =   6840
      TabIndex        =   67
      Tag             =   "0"
      Top             =   480
      Width           =   3255
      Begin VB.CommandButton cmdBloodBnkMenu 
         Caption         =   "Blood &Filter"
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
         TabIndex        =   39
         Top             =   1560
         Width           =   2790
      End
      Begin VB.CommandButton cmdBloodBnkMenu 
         Caption         =   "Blood Issue &Receipt"
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
         Left            =   180
         Style           =   1  'Graphical
         TabIndex        =   42
         Top             =   3240
         Width           =   2790
      End
      Begin VB.CommandButton cmdBloodBnkMenu 
         Caption         =   "&New Donor/Patient Registration"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   555
         Index           =   0
         Left            =   180
         Style           =   1  'Graphical
         TabIndex        =   37
         Top             =   300
         Width           =   2790
      End
      Begin VB.CommandButton cmdBloodBnkMenu 
         Caption         =   "Blood &Issue Entry"
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
         Left            =   195
         Style           =   1  'Graphical
         TabIndex        =   41
         Top             =   2685
         Width           =   2790
      End
      Begin VB.CommandButton cmdBloodBnkMenu 
         Caption         =   "Blood &Donate Entry"
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
         Left            =   195
         Style           =   1  'Graphical
         TabIndex        =   38
         Top             =   1035
         Width           =   2790
      End
      Begin VB.CommandButton cmdBloodBnkMenu 
         Caption         =   "Blood &Consumtion"
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
         Left            =   195
         Style           =   1  'Graphical
         TabIndex        =   40
         Top             =   2100
         Width           =   2790
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
      TabIndex        =   62
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
         TabIndex        =   51
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
         TabIndex        =   54
         Top             =   2160
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
         TabIndex        =   53
         Top             =   1560
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
         TabIndex        =   52
         Top             =   960
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
         TabIndex        =   57
         Top             =   3960
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
         TabIndex        =   56
         Top             =   3360
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
         TabIndex        =   55
         Top             =   2760
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
      TabIndex        =   61
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
         TabIndex        =   48
         Top             =   3000
         Visible         =   0   'False
         Width           =   2775
      End
      Begin VB.CommandButton cmdDisplayMenu 
         Caption         =   "&Service Report"
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
         TabIndex        =   46
         Top             =   900
         Width           =   2775
      End
      Begin VB.CommandButton cmdDisplayMenu 
         Caption         =   "&Blood Stock Register"
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
         TabIndex        =   47
         Top             =   1440
         Width           =   2775
      End
      Begin VB.CommandButton cmdDisplayMenu 
         Caption         =   "&Collection Report"
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
         TabIndex        =   45
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
         TabIndex        =   50
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
         TabIndex        =   49
         Top             =   3840
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
      Height          =   2835
      Left            =   120
      TabIndex        =   65
      Tag             =   "0"
      Top             =   3540
      Width           =   3255
      Begin VB.CommandButton cmdMasterMenu 
         Caption         =   "&Blood Bank Master"
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
         TabIndex        =   4
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
         Index           =   1
         Left            =   240
         Style           =   1  'Graphical
         TabIndex        =   5
         Top             =   960
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
         Index           =   2
         Left            =   240
         Style           =   1  'Graphical
         TabIndex        =   6
         Top             =   1560
         Width           =   2655
      End
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
      Height          =   4335
      Left            =   120
      TabIndex        =   58
      Tag             =   "0"
      Top             =   540
      Width           =   3255
      Begin VB.CommandButton cmdMainMenu 
         Caption         =   "&Blood Bank"
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
         Index           =   3
         Left            =   240
         Style           =   1  'Graphical
         TabIndex        =   3
         Top             =   2325
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
         Index           =   2
         Left            =   240
         Style           =   1  'Graphical
         TabIndex        =   2
         Top             =   1680
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
   Begin MSComctlLib.StatusBar StatusBar1 
      Align           =   2  'Align Bottom
      Height          =   315
      Left            =   0
      TabIndex        =   68
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
            TextSave        =   "20:13"
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
   Begin VB.Frame frBdkMasterMenu 
      Appearance      =   0  'Flat
      BackColor       =   &H0076C8E1&
      Caption         =   "            Blood Bank Master        "
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   8595
      Left            =   3480
      TabIndex        =   69
      Tag             =   "0"
      Top             =   540
      Width           =   3255
      Begin VB.CommandButton cmdBdkMasterMenu 
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
         Index           =   18
         Left            =   240
         Style           =   1  'Graphical
         TabIndex        =   25
         Top             =   7860
         Width           =   2775
      End
      Begin VB.CommandButton cmdBdkMasterMenu 
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
         Index           =   15
         Left            =   240
         Style           =   1  'Graphical
         TabIndex        =   22
         Top             =   6730
         Width           =   2775
      End
      Begin VB.CommandButton cmdBdkMasterMenu 
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
         Index           =   14
         Left            =   240
         Style           =   1  'Graphical
         TabIndex        =   21
         Top             =   6350
         Width           =   2775
      End
      Begin VB.CommandButton cmdBdkMasterMenu 
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
         Index           =   13
         Left            =   240
         Style           =   1  'Graphical
         TabIndex        =   20
         Top             =   5975
         Width           =   2775
      End
      Begin VB.CommandButton cmdBdkMasterMenu 
         Caption         =   "Doctor Rol&e"
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
         TabIndex        =   18
         Top             =   5205
         Width           =   2775
      End
      Begin VB.CommandButton cmdBdkMasterMenu 
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
         Index           =   17
         Left            =   240
         Style           =   1  'Graphical
         TabIndex        =   24
         Top             =   7480
         Width           =   2775
      End
      Begin VB.CommandButton cmdBdkMasterMenu 
         Caption         =   "Doctor Cate&gory"
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
         TabIndex        =   17
         Top             =   4815
         Width           =   2775
      End
      Begin VB.CommandButton cmdBdkMasterMenu 
         Caption         =   "&Doctor Master"
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
         TabIndex        =   19
         Top             =   5595
         Width           =   2775
      End
      Begin VB.CommandButton cmdBdkMasterMenu 
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
         Index           =   16
         Left            =   240
         Style           =   1  'Graphical
         TabIndex        =   23
         Top             =   7110
         Width           =   2775
      End
      Begin VB.CommandButton cmdBdkMasterMenu 
         Caption         =   "Donor/Patient &Family Master"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   540
         Index           =   9
         Left            =   240
         Style           =   1  'Graphical
         TabIndex        =   16
         Top             =   4275
         Width           =   2775
      End
      Begin VB.CommandButton cmdBdkMasterMenu 
         Caption         =   "Donor/Patient Family Categ&ory Master"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   540
         Index           =   8
         Left            =   240
         Style           =   1  'Graphical
         TabIndex        =   15
         Top             =   3720
         Width           =   2775
      End
      Begin VB.CommandButton cmdBdkMasterMenu 
         Caption         =   "&Donor/Patient Master"
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
         TabIndex        =   14
         Top             =   3330
         Width           =   2775
      End
      Begin VB.CommandButton cmdBdkMasterMenu 
         Caption         =   "Donor/Patient Cate&gory Master"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   495
         Index           =   6
         Left            =   240
         Style           =   1  'Graphical
         TabIndex        =   13
         Top             =   2820
         Width           =   2775
      End
      Begin VB.CommandButton cmdBdkMasterMenu 
         Caption         =   "Hospital Master"
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
         Left            =   225
         Style           =   1  'Graphical
         TabIndex        =   12
         Top             =   2430
         Width           =   2775
      End
      Begin VB.CommandButton cmdBdkMasterMenu 
         Caption         =   "Hospital &Category Master"
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
         TabIndex        =   11
         Top             =   2040
         Width           =   2775
      End
      Begin VB.CommandButton cmdBdkMasterMenu 
         Caption         =   "Blood &Packing Master"
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
         TabIndex        =   10
         Top             =   1650
         Width           =   2775
      End
      Begin VB.CommandButton cmdBdkMasterMenu 
         Caption         =   "&Blood Master"
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
         TabIndex        =   7
         Top             =   480
         Width           =   2775
      End
      Begin VB.CommandButton cmdBdkMasterMenu 
         Caption         =   "Blood &Group Master"
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
         TabIndex        =   8
         Top             =   870
         Width           =   2775
      End
      Begin VB.CommandButton cmdBdkMasterMenu 
         Caption         =   "Blood &Component Master"
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
         TabIndex        =   9
         Top             =   1260
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
      TabIndex        =   66
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
      TabIndex        =   60
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
Dim cmdMasters As Object, cmdOutdoor As Object, cmdIndoor As Object, cmdDiagnostic As Object, cmdStoreKeeping As Object, cmdBloodBank As Object, cmdGenTransactions As Object, cmdDisplay As Object, cmdMaintenance As Object
Dim cmdHmsMaster As Object, cmdBdkMaster As Object, cmdDglMaster As Object, cmdSkpMaster As Object, cmdMdsMaster As Object, cmdComMaster As Object, cmdPyrMaster As Object

Dim cmdPatCatgMast As Object, cmdDoctCatgMast As Object, cmdRefCatgMast As Object, cmdDoctRoleMast As Object, cmdDoctMast As Object, cmdRefByMast As Object, cmdRefToMast As Object, cmdServGrpMast As Object, cmdServiceMast As Object, cmdPatMast As Object, cmdDiagMast As Object, cmdFloorMast As Object, cmdWardMast As Object, cmdBedMast As Object
Dim cmdPartyMast As Object, cmdSubItemMast As Object, cmdPartyGrpMast As Object, cmdSubItemGrpMast As Object, cmdOpnStock As Object

Dim cmdBloodMast As Object, cmdBloodGrpMast As Object, cmdBloodCompoMast As Object, cmdBloodPackMast As Object, cmdHospCatgMast As Object, cmdHospMast As Object, cmdEntityCatgMast As Object, cmdEntityMast As Object, cmdEFmlyCatgMast As Object, cmdEFamilyMast As Object

Dim cmdAcntLdgr As Object, cmdProdMast As Object, cmdUserRoleMast As Object, cmdUserMast As Object, cmdUserRightMast As Object, cmdStationMast As Object, cmdAreaMast As Object, cmdVTypeMast As Object
Dim cmdDeptMast As Object, cmdDesgMast As Object, cmdEmpMast As Object

Rem Dim cmdJournalEntry As Object, cmdStockJrnEntry As Object
Rem Dim cmdOutdReg As Object, cmdOutdRcpt As Object, cmdOutdPymt As Object, cmdOutdRefd As Object, cmdOutdBill As Object, cmdOutdBlPymt As Object, cmdOutdBlRefd As Object
Rem Dim cmdIndrReg As Object, cmdIndrBedStat As Object, cmdIndrRcpt As Object, cmdIndrPymt As Object, cmdIndrRefd As Object, cmdIndrBill As Object, cmdIndrRgPymt As Object, cmdIndrRgRefd As Object, cmdIndrBlPymt As Object, cmdIndrBlRefd As Object

Dim cmdNewEntityReg As Object, cmdBloodInTran As Object, cmdBloodFilterTran As Object, cmdBloodConsTran As Object, cmdBloodOutEntry As Object, cmdBldIsuRcptEntry As Object

Dim cmdCollectionView As Object, cmdServiceView As Object, cmdStockReg As Object, cmdIndoorRegView As Object, cmdLedgerView As Object, cmdItemView As Object
Dim cmdTakeBackup As Object, cmdComOptions As Object, cmdHmsOpdOptions As Object, cmdHmsIpdOptions As Object, cmdAcBalRepost As Object, cmdRemoveNullValue As Object, cmdCheckDataStru As Object

Private Sub cmdBdkMasterMenu_Click(Index As Integer)
cmdBdkMasterMenu(Index).Container.Tag = Index

Select Case Screen.ActiveControl
Case cmdBloodMast
    ChkFormAccess frmBloodMast
    
Case cmdBloodGrpMast
    ChkFormAccess frmBloodGrpMast
    
Case cmdBloodCompoMast
    ChkFormAccess frmBloodCompoMast
    
Case cmdBloodPackMast
    ChkFormAccess frmBloodPackMast
    
Case cmdHospCatgMast
    ChkFormAccess frmHospCatgMast
    
Case cmdHospMast
    ChkFormAccess frmHospitalMast
    
Case cmdEntityCatgMast
    ChkFormAccess frmEntityCatgMast
    
Case cmdEntityMast
    ChkFormAccess frmEntityMast
    
Case cmdEFmlyCatgMast
    ChkFormAccess frmEFmlyCatgMast
    
Case cmdEFamilyMast
    ChkFormAccess frmEFamilyMast
    
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
    
Case cmdDiagMast
    ChkFormAccess frmDiagnosticMast
    
End Select
Me.ZOrder


End Sub

Private Sub cmdBdkMasterMenu_GotFocus(Index As Integer)
cmdBdkMasterMenu(Index).BackColor = cYELLOWLIGHT
End Sub

Private Sub cmdBdkMasterMenu_LostFocus(Index As Integer)
cmdBdkMasterMenu(Index).BackColor = vbButtonFace
End Sub

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
Case cmdCollectionView:
    ChkFormAccess frmCollectionViewRep
    
Case cmdServiceView:
    ChkFormAccess frmServiceViewRep
    
Case cmdStockReg:
    ChkFormAccess frmStockRegRep
    
Case cmdIndoorRegView:
    'Load frmLedgerView
    'frmLedgerView.Show 1

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

Private Sub cmdHmsMasterMenu_Click(Index As Integer)
'cmdHmsMasterMenu(Index).Container.Tag = Index
'
'Select Case Screen.ActiveControl
'Case cmdPatCatgMast
'    ChkFormAccess frmPatCategoryMast
'
'Case cmdDoctCatgMast
'    ChkFormAccess frmDoctorCatgMast
'
'Case cmdRefCatgMast
'    ChkFormAccess frmRefCatgMast
'
'Case cmdDoctRoleMast
'    ChkFormAccess frmDoctorRoleMast
'
'Case cmdDoctMast
'    ChkFormAccess frmDoctorMast
'
'Case cmdRefByMast
'    ChkFormAccess frmRefByMast
'
'Case cmdRefToMast
'    ChkFormAccess frmRefToMast
'
'Case cmdServGrpMast
'    ChkFormAccess frmServGroupMast
'
'Case cmdServiceMast
'    ChkFormAccess frmServiceMast
'
'Case cmdPatMast
'    ChkFormAccess frmPatientMast
'
'Case cmdDiagMast
'    ChkFormAccess frmDiagnosticMast
'
'Case cmdFloorMast
'    ChkFormAccess frmFloorMast
'
'Case cmdWardMast
'    ChkFormAccess frmWardMast
'
'Case cmdBedMast
'    ChkFormAccess frmBedMast
    
'End Select

Me.ZOrder
End Sub

Private Sub cmdHmsMasterMenu_GotFocus(Index As Integer)
'cmdHmsMasterMenu(Index).BackColor = cYELLOWLIGHT
End Sub

Private Sub cmdHmsMasterMenu_LostFocus(Index As Integer)
'cmdHmsMasterMenu(Index).BackColor = vbButtonFace
End Sub

Private Sub cmdIndoorMenu_Click(Index As Integer)
'cmdIndoorMenu(Index).Container.Tag = Index
'
'Select Case Screen.ActiveControl
'Case cmdIndrReg
'    ChkFormAccess frmIndoorReg
'
'Case cmdIndrBedStat
'    ChkFormAccess frmIndoorBedStatus
'
'Case cmdIndrRcpt
'    ChkFormAccess frmIndoorReceipt
'
'Case cmdIndrPymt
'    ChkFormAccess frmIndoorPymtRcpt
'
'Case cmdIndrRefd
'    ChkFormAccess frmIndoorRefdRcpt
'
'Case cmdIndrRgPymt
'    ChkFormAccess frmIndoorRgPayment
'
'Case cmdIndrRgRefd
'    ChkFormAccess frmIndoorRgRefund
'
'Case cmdIndrBill
'    ChkFormAccess frmIndoorBill
'
'Case cmdIndrBlPymt
'    ChkFormAccess frmIndoorBlPayment
'
'Case cmdIndrBlRefd
'    ChkFormAccess frmIndoorBlRefund
'
'End Select
'
'Me.ZOrder
End Sub

Private Sub cmdIndoorMenu_GotFocus(Index As Integer)
'cmdIndoorMenu(Index).BackColor = cYELLOWLIGHT

End Sub

Private Sub cmdIndoorMenu_LostFocus(Index As Integer)
'cmdIndoorMenu(Index).BackColor = vbButtonFace
End Sub

Private Sub cmdMainMenu_Click(Index As Integer)
cmdMainMenu(Index).Container.Tag = Index

Select Case Screen.ActiveControl
Case cmdMasters:
    frMasterMenu.Visible = True
    GoTo HideMainMenu
'Case cmdGenTransactions:
'    frGenTranMenu.Visible = True
'    GoTo HideMainMenu
'Case cmdOutdoor:
'    frOutdoorMenu.Visible = True
'    GoTo HideMainMenu
'Case cmdIndoor:
'    frIndoorMenu.Visible = True
'    GoTo HideMainMenu
'Case cmdDiagnostic
'
'Case cmdStoreKeeping
'
Case cmdBloodBank
    frBdkEntryMenu.Visible = True
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
'Case cmdComOptions
'    ChkFormAccess frmCommonOptions
    
'Case cmdHmsOpdOptions
'    ChkFormAccess frmHmsOpdOptions
'
'Case cmdHmsIpdOptions
'    ChkFormAccess frmHmsIpdOptions
    
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
    
    Rem hospital database
'    CreateHmsMastDatabase mAddMode:=False, FormProgStatus:=MyProgStatForm
'    CreateHmsMdsMastDatabase mAddMode:=False, FormProgStatus:=MyProgStatForm
'    CreateHmsOpdTranDatabase mAddMode:=False, FormProgStatus:=MyProgStatForm
'    CreateHmsIpdTranDatabase mAddMode:=False, FormProgStatus:=MyProgStatForm
'    CreateHmsComDatabase FormProgStatus:=MyProgStatForm
    
    Rem blood bank database
    CreateBdkCmpDatabase mAddMode:=False, FormProgStatus:=MyProgStatForm
    CreateBdkMastDatabase mAddMode:=False, FormProgStatus:=MyProgStatForm
    CreateBdkTranDatabase mAddMode:=False, FormProgStatus:=MyProgStatForm
    CreateBdkComDatabase FormProgStatus:=MyProgStatForm
    
    Rem medical store database
'    CreateMdsMastDatabase mAddMode:=False, FormProgStatus:=MyProgStatForm
'    CreateMdsTranDatabase mAddMode:=False, FormProgStatus:=MyProgStatForm
'    CreateMdsComDatabase FormProgStatus:=MyProgStatForm
    
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

'Case cmdHmsMaster
'    frHmsMasterMenu.Visible = True
'    frMasterMenu.Visible = False
    
Case cmdBdkMaster
    frBdkMasterMenu.Visible = True
    frMasterMenu.Visible = False
    
'Case cmdMdsMaster
'    frBdkMasterMenu.Visible = True
'    frMasterMenu.Visible = False

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
'Dim MyForm As Form
'cmdMdsMasterMenu(Index).Container.Tag = Index
'
'Select Case Screen.ActiveControl
'Case cmdPartyMast
'    ChkFormAccess frmPartyMast
'
'Case cmdSubItemMast
'    ChkFormAccess frmSubItemMast
'
'Case cmdPartyGrpMast
'    ChkFormAccess frmPartyGrpMast
'
'Case cmdSubItemGrpMast
'    ChkFormAccess frmSubItemGrpMast
'
'Case cmdOpnStock
'    ChkFormAccess frmMedicalPurch, cCOM_VTYPE_OPNSTK
''    Set MyForm = New frmMedicalPurch
''    Load MyForm
''    MyForm.FormSysVchType = cCOM_VTYPE_OPNSTK
''    Call MyForm.Form_Load
''    MyForm.Show 1
'
'End Select
'Me.ZOrder

End Sub

'Private Sub cmdMdsMasterMenu_GotFocus(Index As Integer)
'cmdMdsMasterMenu(Index).BackColor = cYELLOWLIGHT
'End Sub
'
'Private Sub cmdMdsMasterMenu_LostFocus(Index As Integer)
'cmdMdsMasterMenu(Index).BackColor = vbButtonFace
'End Sub

Private Sub cmdBloodBnkMenu_Click(Index As Integer)
Dim MyForm As Form

cmdBloodBnkMenu(Index).Container.Tag = Index

Select Case Screen.ActiveControl
Case cmdNewEntityReg
    ChkFormAccess frmEntityMast

Case cmdBloodInTran
    ChkFormAccess frmBloodInTran, cBDK_VTYPE_BLOODDONATE
    
Case cmdBloodFilterTran
    ChkFormAccess frmBloodInTran, cBDK_VTYPE_BLOODFILTER

Case cmdBloodConsTran
    ChkFormAccess frmBloodOutTran, cBDK_VTYPE_BLOODCONS
    
Case cmdBloodOutEntry
    ChkFormAccess frmBloodOutTran, cBDK_VTYPE_BLOODISSUED
    
Case cmdBldIsuRcptEntry
    ChkFormAccess frmBloodIssueRcpt
    
    
End Select

Me.ZOrder

End Sub

Private Sub cmdBloodBnkMenu_GotFocus(Index As Integer)
cmdBloodBnkMenu(Index).BackColor = cYELLOWLIGHT
End Sub

Private Sub cmdBloodBnkMenu_LostFocus(Index As Integer)
cmdBloodBnkMenu(Index).BackColor = vbButtonFace
End Sub

Private Sub cmdOutdoorMenu_Click(Index As Integer)
'cmdOutdoorMenu(Index).Container.Tag = Index
'
'Select Case Screen.ActiveControl
'Case cmdOutdReg
'    ChkFormAccess frmOutdoorReg
'
'Case cmdOutdRcpt
'    ChkFormAccess frmBloodIssueRcpt
'
'Case cmdOutdPymt
'    ChkFormAccess frmBloodIssuePymt
'
'Case cmdOutdRefd
'    ChkFormAccess frmBloodIssuePymt
'
'Case cmdOutdBill
'    ChkFormAccess frmOutdoorBill
'
'Case cmdOutdBlPymt
'    ChkFormAccess frmOutdoorBlPayment
'
'Case cmdOutdBlRefd
'    ChkFormAccess frmOutdoorBlRefund
'
'End Select
'
'Me.ZOrder
End Sub

Private Sub cmdOutdoorMenu_GotFocus(Index As Integer)
'cmdOutdoorMenu(Index).BackColor = cYELLOWLIGHT

End Sub

Private Sub cmdOutdoorMenu_LostFocus(Index As Integer)
'cmdOutdoorMenu(Index).BackColor = vbButtonFace
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

Private Sub cmdGenTranMenu_Click(Index As Integer)
cmdGenTranMenu(Index).Container.Tag = Index

Select Case Screen.ActiveControl
'Case cmdJournalEntry:
'    ChkFormAccess frmJournal
'
'Case cmdStockJrnEntry:
'    ChkFormAccess frmStockJrn
    
End Select

Me.ZOrder
End Sub

Private Sub cmdGenTranMenu_GotFocus(Index As Integer)
cmdGenTranMenu(Index).BackColor = cYELLOWLIGHT

End Sub

Private Sub cmdGenTranMenu_LostFocus(Index As Integer)
cmdGenTranMenu(Index).BackColor = vbButtonFace
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
        
'    ElseIf frHmsMasterMenu.Visible = True Then
'        frHmsMasterMenu.Visible = False
'        frMasterMenu.Visible = True
'
'        Call TraceLastCmdObj
    
    ElseIf frBdkMasterMenu.Visible = True Then
        frBdkMasterMenu.Visible = False
        frMasterMenu.Visible = True
        
        Call TraceLastCmdObj
    
    ElseIf frBdkMasterMenu.Visible = True Then
        frBdkMasterMenu.Visible = False
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
        
    ElseIf frGenTranMenu.Visible = True Then
        frGenTranMenu.Visible = False
        frMainMenu.Visible = True
        
        Call TraceLastCmdObj
    
'    ElseIf frOutdoorMenu.Visible = True Then
'        frOutdoorMenu.Visible = False
'        frMainMenu.Visible = True
'
'        Call TraceLastCmdObj
    
'    ElseIf frIndoorMenu.Visible = True Then
'        frIndoorMenu.Visible = False
'        frMainMenu.Visible = True
'
'        Call TraceLastCmdObj
    
'    ElseIf frDglEntryMenu.Visible = True Then
'        frDglEntryMenu.Visible = False
'        frMainMenu.Visible = True
'
'        Call TraceLastCmdObj
'
'    ElseIf frSkpEntryMenu.Visible = True Then
'        frSkpEntryMenu.Visible = False
'        frMainMenu.Visible = True
'
'        Call TraceLastCmdObj
'
    ElseIf frBdkEntryMenu.Visible = True Then
        frBdkEntryMenu.Visible = False
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
'Set cmdOutdoor = cmdMainMenu(1): cmdOutdoor.Caption = "&Outdoor"
'Set cmdIndoor = cmdMainMenu(2): cmdIndoor.Caption = "&Indoor"
'Set cmdDiagnostic = cmdMainMenu(3): cmdDiagnostic.Caption = "Dia&gnostic"
'Set cmdStoreKeeping = cmdMainMenu(4): cmdStoreKeeping.Caption = "&Store Keeping"
Set cmdBloodBank = cmdMainMenu(1): cmdBloodBank.Caption = "&Blood Bank"
'Set cmdGenTransactions = cmdMainMenu(6): cmdGenTransactions.Caption = "&General"
Set cmdDisplay = cmdMainMenu(2): cmdDisplay.Caption = "&Display"
Set cmdMaintenance = cmdMainMenu(3): cmdMaintenance.Caption = "Maint&enance"

Rem main master menu
'Set cmdHmsMaster = cmdMasterMenu(0): cmdHmsMaster.Caption = "&Hospital Master"
Set cmdBdkMaster = cmdMasterMenu(0): cmdBdkMaster.Caption = "&Blood Bank Master"
'Set cmdDglMaster = cmdMasterMenu(2): cmdDglMaster.Caption = "&Diagnostic Master"
'Set cmdSkpMaster = cmdMasterMenu(3): cmdSkpMaster.Caption = "S&tore Keeping Master"
'Set cmdMdsMaster = cmdMasterMenu(4): cmdMdsMaster.Caption = "&Medical Store Master"
Set cmdComMaster = cmdMasterMenu(1): cmdComMaster.Caption = "&Standard Master"
Set cmdPyrMaster = cmdMasterMenu(2): cmdPyrMaster.Caption = "&Payroll Master"

Rem hospital master menu
'Set cmdPatCatgMast = cmdHmsMasterMenu(0): cmdPatCatgMast.Caption = "Patient Categ&ory"
'Set cmdDoctCatgMast = cmdHmsMasterMenu(1): cmdDoctCatgMast.Caption = "Doctor Cate&gory"
'Set cmdRefCatgMast = cmdHmsMasterMenu(2): cmdRefCatgMast.Caption = "&Referred Category"
'Set cmdDoctRoleMast = cmdHmsMasterMenu(3): cmdDoctRoleMast.Caption = "Doctor Rol&e"
'Set cmdDoctMast = cmdHmsMasterMenu(4): cmdDoctMast.Caption = "&Doctor Master"
'Set cmdRefByMast = cmdHmsMasterMenu(5): cmdRefByMast.Caption = "Referred &By Master"
'Set cmdRefToMast = cmdHmsMasterMenu(6): cmdRefToMast.Caption = "Referred &To Master"
'Set cmdServGrpMast = cmdHmsMasterMenu(7): cmdServGrpMast.Caption = "Ser&vice Group Master"
'Set cmdServiceMast = cmdHmsMasterMenu(8): cmdServiceMast.Caption = "Servi&ce Master"
'Set cmdPatMast = cmdHmsMasterMenu(9): cmdPatMast.Caption = "Pa&tient Master"
'Set cmdDiagMast = cmdHmsMasterMenu(10): cmdDiagMast.Caption = "D&iagnostic Master"
'Set cmdFloorMast = cmdHmsMasterMenu(11): cmdFloorMast.Caption = "Bed &Floor Master"
'Set cmdWardMast = cmdHmsMasterMenu(12): cmdWardMast.Caption = "Bed &Ward Master"
'Set cmdBedMast = cmdHmsMasterMenu(13): cmdBedMast.Caption = "&Bed Master"

Rem blood bank menu
Set cmdBloodMast = cmdBdkMasterMenu(0): cmdBloodMast.Caption = "&Blood Master"
Set cmdBloodGrpMast = cmdBdkMasterMenu(1): cmdBloodGrpMast.Caption = "Blood &Group Master"
Set cmdBloodCompoMast = cmdBdkMasterMenu(2): cmdBloodCompoMast.Caption = "Blood &Component Master"
Set cmdBloodPackMast = cmdBdkMasterMenu(3): cmdBloodPackMast.Caption = "Blood &Packing Master"
Set cmdHospCatgMast = cmdBdkMasterMenu(4): cmdHospCatgMast.Caption = "Hospital &Category Master"
Set cmdHospMast = cmdBdkMasterMenu(5): cmdHospMast.Caption = "&Hospital Master"
Set cmdEntityCatgMast = cmdBdkMasterMenu(6): cmdEntityCatgMast.Caption = "Donor/Patient Cate&gory Master"
Set cmdEntityMast = cmdBdkMasterMenu(7): cmdEntityMast.Caption = "&Donor/Patient Master"
Set cmdEFmlyCatgMast = cmdBdkMasterMenu(8): cmdEFmlyCatgMast.Caption = "Donor/Patient Family Categ&ory"
Set cmdEFamilyMast = cmdBdkMasterMenu(9): cmdEFamilyMast.Caption = "Donor/Patient &Family Master"
Set cmdDoctCatgMast = cmdBdkMasterMenu(10): cmdDoctCatgMast.Caption = "Doctor Cate&gory"
Set cmdDoctRoleMast = cmdBdkMasterMenu(11): cmdDoctRoleMast.Caption = "Doctor Rol&e"
Set cmdDoctMast = cmdBdkMasterMenu(12): cmdDoctMast.Caption = "&Doctor Master"
Set cmdRefCatgMast = cmdBdkMasterMenu(13): cmdRefCatgMast.Caption = "&Referred Category"
Set cmdRefByMast = cmdBdkMasterMenu(14): cmdRefByMast.Caption = "Referred &By Master"
Set cmdRefToMast = cmdBdkMasterMenu(15): cmdRefToMast.Caption = "Referred &To Master"
Set cmdServGrpMast = cmdBdkMasterMenu(16): cmdServGrpMast.Caption = "Ser&vice Group Master"
Set cmdServiceMast = cmdBdkMasterMenu(17): cmdServiceMast.Caption = "Servi&ce Master"
Set cmdDiagMast = cmdBdkMasterMenu(18): cmdDiagMast.Caption = "D&iagnostic Master"

Rem medical store menu
'Set cmdPartyMast = cmdMdsMasterMenu(0): cmdPartyMast.Caption = "&Party Master"
'Set cmdSubItemMast = cmdMdsMasterMenu(1): cmdSubItemMast.Caption = "&Item Master"
'Set cmdPartyGrpMast = cmdMdsMasterMenu(2): cmdPartyGrpMast.Caption = "Party G&roup Master"
'Set cmdSubItemGrpMast = cmdMdsMasterMenu(3): cmdSubItemGrpMast.Caption = "Item &Group Master"
'Set cmdOpnStock = cmdMdsMasterMenu(4): cmdOpnStock.Caption = "&Opening Stock"

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

Rem general transaction menu
'Set cmdJournalEntry = cmdGenTranMenu(0): cmdJournalEntry.Caption = "&Journal Entry"
'Set cmdStockJrnEntry = cmdGenTranMenu(1): cmdStockJrnEntry.Caption = "&Stock Journal"

Rem outdoor entry menu
'Set cmdOutdReg = cmdOutdoorMenu(0): cmdOutdReg.Caption = "&OPD Registration"
'Set cmdOutdRcpt = cmdOutdoorMenu(1): cmdOutdRcpt.Caption = "OPD &Receipt"
'Set cmdOutdPymt = cmdOutdoorMenu(2): cmdOutdPymt.Caption = "OPD &Payment"
'Set cmdOutdRefd = cmdOutdoorMenu(3): cmdOutdRefd.Caption = "OPD &Refund"
'Set cmdOutdBill = cmdOutdoorMenu(4): cmdOutdBill.Caption = "OPD &Bill"
'Set cmdOutdBlPymt = cmdOutdoorMenu(5): cmdOutdBlPymt.Caption = "OPD Bill Pa&yment"
'Set cmdOutdBlRefd = cmdOutdoorMenu(6): cmdOutdBlRefd.Caption = "OPD Bill Re&fund"

Rem indoor entry menu
'Set cmdIndrReg = cmdIndoorMenu(0): cmdIndrReg.Caption = "&IPD Registration"
'Set cmdIndrBedStat = cmdIndoorMenu(1): cmdIndrBedStat.Caption = "Bed S&tatus"
'Set cmdIndrRcpt = cmdIndoorMenu(2): cmdIndrRcpt.Caption = "IPD &Receipt"
'Set cmdIndrPymt = cmdIndoorMenu(3): cmdIndrPymt.Caption = "IPD &Payment"
'Set cmdIndrRefd = cmdIndoorMenu(4): cmdIndrRefd.Caption = "IPD &Refund"
'Set cmdIndrRgPymt = cmdIndoorMenu(5): cmdIndrRgPymt.Caption = "IPD On A/c. Pa&yment"
'Set cmdIndrRgRefd = cmdIndoorMenu(6): cmdIndrRgRefd.Caption = "IPD On A/c. Re&fund"
'Set cmdIndrBill = cmdIndoorMenu(7): cmdIndrBill.Caption = "IPD &Bill"
'Set cmdIndrBlPymt = cmdIndoorMenu(8): cmdIndrBlPymt.Caption = "IPD Bill Pay&ment"
'Set cmdIndrBlRefd = cmdIndoorMenu(9): cmdIndrBlRefd.Caption = "IPD Bill Ref&und"

Rem blood bank entry menu
Set cmdNewEntityReg = cmdBloodBnkMenu(0): cmdNewEntityReg.Caption = "&New Donor/Patient Registration"
Set cmdBloodInTran = cmdBloodBnkMenu(1): cmdBloodInTran.Caption = "Blood &Donate Entry"
Set cmdBloodFilterTran = cmdBloodBnkMenu(2): cmdBloodFilterTran.Caption = "Blood &Filter"
Set cmdBloodConsTran = cmdBloodBnkMenu(3): cmdBloodConsTran.Caption = "Blood &Consumption"
Set cmdBloodOutEntry = cmdBloodBnkMenu(4): cmdBloodOutEntry.Caption = "Blood &Issue Entry"
Set cmdBldIsuRcptEntry = cmdBloodBnkMenu(5): cmdBldIsuRcptEntry.Caption = "Blood Issue &Receipt Entry"

Rem display menu
Set cmdCollectionView = cmdDisplayMenu(0): cmdCollectionView.Caption = "&Collection Report"
Set cmdServiceView = cmdDisplayMenu(1): cmdServiceView.Caption = "&Service Report"
Set cmdStockReg = cmdDisplayMenu(2): cmdStockReg.Caption = "&Blood Stock Report"
Set cmdIndoorRegView = cmdDisplayMenu(3): cmdIndoorRegView.Caption = "&Indoor Register"
Set cmdLedgerView = cmdDisplayMenu(4): cmdLedgerView.Caption = "&Ledger View"
Set cmdItemView = cmdDisplayMenu(5): cmdItemView.Caption = "&Item View"

Rem maintenance menu
Set cmdTakeBackup = cmdMaintenanceMenu(0): cmdTakeBackup.Caption = "Take &Backup"
Set cmdComOptions = cmdMaintenanceMenu(1): cmdComOptions.Caption = "&Standard Options"
Set cmdHmsOpdOptions = cmdMaintenanceMenu(2): cmdHmsOpdOptions.Caption = "Hospital &Outdoor Options"
Set cmdHmsIpdOptions = cmdMaintenanceMenu(3): cmdHmsIpdOptions.Caption = "&Hospital &Indoor Options"
Set cmdAcBalRepost = cmdMaintenanceMenu(4): cmdAcBalRepost.Caption = "&A/c Balance Reposting"
Set cmdRemoveNullValue = cmdMaintenanceMenu(5): cmdRemoveNullValue.Caption = "&Remove Null Value"
Set cmdCheckDataStru = cmdMaintenanceMenu(6): cmdCheckDataStru.Caption = "&Check Data Structure"

frMainMenu.Visible = False
frMasterMenu.Visible = False
'frHmsMasterMenu.Visible = False
frBdkMasterMenu.Visible = False
'frMdsMasterMenu.Visible = False
frComMasterMenu.Visible = False
frPyrMasterMenu.Visible = False
frGenTranMenu.Visible = False
'frOutdoorMenu.Visible = False
'frIndoorMenu.Visible = False
'frDglEntryMenu.Visible = False
'frSkpEntryMenu.Visible = False
frBdkEntryMenu.Visible = False
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

'mLeft = (Me.Width - frHmsMasterMenu.Width) / 2
'frHmsMasterMenu.Top = mTop: frHmsMasterMenu.Left = mLeft

mLeft = (Me.Width - frBdkMasterMenu.Width) / 2
frBdkMasterMenu.Top = mTop: frBdkMasterMenu.Left = mLeft

mLeft = (Me.Width - frBdkMasterMenu.Width) / 2
frBdkMasterMenu.Top = mTop: frBdkMasterMenu.Left = mLeft

mLeft = (Me.Width - frComMasterMenu.Width) / 2
frComMasterMenu.Top = mTop: frComMasterMenu.Left = mLeft

mLeft = (Me.Width - frPyrMasterMenu.Width) / 2
frPyrMasterMenu.Top = mTop: frPyrMasterMenu.Left = mLeft

mLeft = (Me.Width - frGenTranMenu.Width) / 2
frGenTranMenu.Top = mTop: frGenTranMenu.Left = mLeft

'mLeft = (Me.Width - frOutdoorMenu.Width) / 2
'frOutdoorMenu.Top = mTop: frOutdoorMenu.Left = mLeft

'mLeft = (Me.Width - frIndoorMenu.Width) / 2
'frIndoorMenu.Top = mTop: frIndoorMenu.Left = mLeft

'mLeft = (Me.Width - frDglEntryMenu.Width) / 2
'frDglEntryMenu.Top = mTop: frDglEntryMenu.Left = mLeft
'
'mLeft = (Me.Width - frSkpEntryMenu.Width) / 2
'frSkpEntryMenu.Top = mTop: frSkpEntryMenu.Left = mLeft
'
mLeft = (Me.Width - frBdkEntryMenu.Width) / 2
frBdkEntryMenu.Top = mTop: frBdkEntryMenu.Left = mLeft

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
Set cmdMasters = Nothing: Set cmdGenTransactions = Nothing: Set cmdOutdoor = Nothing: Set cmdIndoor = Nothing: Set cmdDiagnostic = Nothing: Set cmdStoreKeeping = Nothing: Set cmdBloodBank = Nothing: Set cmdDisplay = Nothing: Set cmdMaintenance = Nothing
Set cmdHmsMaster = Nothing: Set cmdBdkMaster = Nothing: Set cmdDglMaster = Nothing: Set cmdSkpMaster = Nothing: Set cmdMdsMaster = Nothing: Set cmdComMaster = Nothing: Set cmdPyrMaster = Nothing

Set cmdPatCatgMast = Nothing: Set cmdDoctCatgMast = Nothing: Set cmdRefCatgMast = Nothing: Set cmdDoctRoleMast = Nothing: Set cmdDoctMast = Nothing: Set cmdRefByMast = Nothing: Set cmdRefToMast = Nothing: Set cmdServGrpMast = Nothing: Set cmdServiceMast = Nothing: Set cmdPatMast = Nothing: Set cmdDiagMast = Nothing: Set cmdFloorMast = Nothing: Set cmdWardMast = Nothing: Set cmdBedMast = Nothing
Set cmdBloodMast = Nothing: Set cmdBloodGrpMast = Nothing: Set cmdBloodCompoMast = Nothing: Set cmdBloodPackMast = Nothing: Set cmdHospCatgMast = Nothing: Set cmdHospMast = Nothing: Set cmdEntityCatgMast = Nothing: Set cmdEntityMast = Nothing: Set cmdEFmlyCatgMast = Nothing: Set cmdEFamilyMast = Nothing
Set cmdPartyMast = Nothing: Set cmdSubItemMast = Nothing: Set cmdPartyGrpMast = Nothing: Set cmdSubItemGrpMast = Nothing: Set cmdOpnStock = Nothing
Set cmdAcntLdgr = Nothing: Set cmdProdMast = Nothing: Set cmdUserRoleMast = Nothing: Set cmdUserMast = Nothing: Set cmdUserRightMast = Nothing: Set cmdStationMast = Nothing: Set cmdAreaMast = Nothing: Set cmdVTypeMast = Nothing
Set cmdDeptMast = Nothing: Set cmdDesgMast = Nothing: Set cmdEmpMast = Nothing

Set cmdNewEntityReg = Nothing: Set cmdBloodInTran = Nothing: Set cmdBloodFilterTran = Nothing: Set cmdBloodConsTran = Nothing: Set cmdBloodOutEntry = Nothing: Set cmdBldIsuRcptEntry = Nothing

Set cmdCollectionView = Nothing: Set cmdServiceView = Nothing: Set cmdStockReg = Nothing: Set cmdIndoorRegView = Nothing: Set cmdLedgerView = Nothing: Set cmdItemView = Nothing
Set cmdTakeBackup = Nothing: Set cmdComOptions = Nothing: Set cmdHmsOpdOptions = Nothing: Set cmdHmsIpdOptions = Nothing: Set cmdAcBalRepost = Nothing: Set cmdRemoveNullValue = Nothing: Set cmdCheckDataStru = Nothing

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

