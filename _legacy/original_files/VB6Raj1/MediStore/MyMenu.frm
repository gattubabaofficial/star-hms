VERSION 5.00
Begin VB.Form frmMyMenu 
   Appearance      =   0  'Flat
   BackColor       =   &H00FFF5EB&
   ClientHeight    =   10290
   ClientLeft      =   60
   ClientTop       =   60
   ClientWidth     =   14565
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
   ScaleHeight     =   10290
   ScaleWidth      =   14565
   WindowState     =   2  'Maximized
   Begin VB.Frame frMaintenanceMenu 
      Appearance      =   0  'Flat
      BackColor       =   &H00D7FFC8&
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
      Height          =   4335
      Left            =   9480
      TabIndex        =   49
      Tag             =   "0"
      Top             =   480
      Width           =   3015
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
         Index           =   2
         Left            =   240
         Style           =   1  'Graphical
         TabIndex        =   41
         Top             =   3720
         Visible         =   0   'False
         Width           =   2625
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
         Index           =   1
         Left            =   240
         Style           =   1  'Graphical
         TabIndex        =   40
         Top             =   3120
         Visible         =   0   'False
         Width           =   2625
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
         Index           =   0
         Left            =   240
         Style           =   1  'Graphical
         TabIndex        =   39
         Top             =   2520
         Visible         =   0   'False
         Width           =   2625
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
         Index           =   5
         Left            =   240
         Style           =   1  'Graphical
         TabIndex        =   44
         Top             =   1560
         Width           =   2625
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
         Index           =   4
         Left            =   240
         Style           =   1  'Graphical
         TabIndex        =   43
         Top             =   960
         Width           =   2625
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
         Index           =   3
         Left            =   240
         Style           =   1  'Graphical
         TabIndex        =   42
         Top             =   360
         Width           =   2625
      End
   End
   Begin VB.Frame frDisplayMenu 
      Appearance      =   0  'Flat
      BackColor       =   &H00C8FFC8&
      Caption         =   "                 Display                 "
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
      Left            =   7800
      TabIndex        =   48
      Tag             =   "0"
      Top             =   480
      Width           =   3015
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
         Index           =   1
         Left            =   240
         Style           =   1  'Graphical
         TabIndex        =   33
         Top             =   1080
         Width           =   2535
      End
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
         Index           =   6
         Left            =   240
         Style           =   1  'Graphical
         TabIndex        =   38
         Top             =   4200
         Visible         =   0   'False
         Width           =   2535
      End
      Begin VB.CommandButton cmdDisplayMenu 
         Caption         =   "&Outdoor Register"
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
         TabIndex        =   37
         Top             =   3720
         Visible         =   0   'False
         Width           =   2535
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
         Index           =   4
         Left            =   240
         Style           =   1  'Graphical
         TabIndex        =   36
         Top             =   3240
         Visible         =   0   'False
         Width           =   2535
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
         Index           =   0
         Left            =   240
         Style           =   1  'Graphical
         TabIndex        =   32
         Top             =   480
         Width           =   2535
      End
      Begin VB.CommandButton cmdDisplayMenu 
         Caption         =   "&Product View"
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
         Height          =   375
         Index           =   3
         Left            =   240
         Style           =   1  'Graphical
         TabIndex        =   35
         Top             =   2280
         Width           =   2535
      End
      Begin VB.CommandButton cmdDisplayMenu 
         Caption         =   "&Ledger View"
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
         Height          =   375
         Index           =   2
         Left            =   240
         Style           =   1  'Graphical
         TabIndex        =   34
         Top             =   1680
         Width           =   2535
      End
   End
   Begin VB.Frame frMediStoreMenu 
      Appearance      =   0  'Flat
      BackColor       =   &H00F5FFE1&
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
      Height          =   4215
      Left            =   6000
      TabIndex        =   46
      Tag             =   "0"
      Top             =   480
      Width           =   2775
      Begin VB.CommandButton cmdMediStoreMenu 
         Caption         =   "Purchse Ret&urn"
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
         Top             =   2160
         Width           =   2295
      End
      Begin VB.CommandButton cmdMediStoreMenu 
         Caption         =   "Sales &Return"
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
         Top             =   1560
         Width           =   2295
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
         Index           =   1
         Left            =   240
         Style           =   1  'Graphical
         TabIndex        =   27
         Top             =   960
         Width           =   2295
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
         Left            =   240
         Style           =   1  'Graphical
         TabIndex        =   26
         Top             =   360
         Width           =   2295
      End
      Begin VB.CommandButton cmdMediStoreMenu 
         Caption         =   "&Stock Journal"
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
         Height          =   375
         Index           =   5
         Left            =   240
         Style           =   1  'Graphical
         TabIndex        =   31
         Top             =   3360
         Width           =   2295
      End
      Begin VB.CommandButton cmdMediStoreMenu 
         Caption         =   "&Journal Entry"
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
         Height          =   375
         Index           =   4
         Left            =   240
         Style           =   1  'Graphical
         TabIndex        =   30
         Top             =   2760
         Width           =   2295
      End
   End
   Begin VB.Frame frPyrMasterMenu 
      Appearance      =   0  'Flat
      BackColor       =   &H00D7FFDE&
      Caption         =   "           Payroll Master         "
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
      Left            =   4440
      TabIndex        =   51
      Tag             =   "0"
      Top             =   480
      Width           =   2895
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
         TabIndex        =   25
         Top             =   1320
         Width           =   2415
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
         TabIndex        =   23
         Top             =   360
         Width           =   2415
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
         TabIndex        =   24
         Top             =   840
         Width           =   2415
      End
   End
   Begin VB.Frame frComMasterMenu 
      Appearance      =   0  'Flat
      BackColor       =   &H00E6FFE1&
      Caption         =   "         Standard Master       "
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
      Left            =   3240
      TabIndex        =   50
      Tag             =   "0"
      Top             =   480
      Width           =   2895
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
         TabIndex        =   19
         Top             =   2400
         Width           =   2415
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
         TabIndex        =   22
         Top             =   3840
         Width           =   2415
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
         TabIndex        =   15
         Top             =   480
         Width           =   2415
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
         TabIndex        =   16
         Top             =   960
         Width           =   2415
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
         TabIndex        =   17
         Top             =   1440
         Width           =   2415
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
         TabIndex        =   18
         Top             =   1920
         Width           =   2415
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
         TabIndex        =   20
         Top             =   2880
         Width           =   2415
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
         TabIndex        =   21
         Top             =   3360
         Width           =   2415
      End
   End
   Begin VB.Frame frMasterMenu 
      Appearance      =   0  'Flat
      BackColor       =   &H00D7FFE1&
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
      Height          =   8535
      Left            =   1320
      TabIndex        =   52
      Tag             =   "0"
      Top             =   480
      Width           =   3255
      Begin VB.CommandButton cmdMasterMenu 
         Caption         =   "Doctor Cat&egory Master"
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
         TabIndex        =   13
         Top             =   4800
         Width           =   2775
      End
      Begin VB.CommandButton cmdMasterMenu 
         Caption         =   "Patient &Category Master"
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
         Width           =   2775
      End
      Begin VB.CommandButton cmdMasterMenu 
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
         Index           =   5
         Left            =   240
         Style           =   1  'Graphical
         TabIndex        =   9
         Top             =   2880
         Width           =   2775
      End
      Begin VB.CommandButton cmdMasterMenu 
         Caption         =   "Pa&tient Master"
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
         Width           =   2775
      End
      Begin VB.CommandButton cmdMasterMenu 
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
         Index           =   10
         Left            =   240
         Style           =   1  'Graphical
         TabIndex        =   14
         Top             =   5280
         Width           =   2775
      End
      Begin VB.CommandButton cmdMasterMenu 
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
         Index           =   8
         Left            =   240
         Style           =   1  'Graphical
         TabIndex        =   12
         Top             =   4320
         Width           =   2775
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
         Index           =   0
         Left            =   240
         Style           =   1  'Graphical
         TabIndex        =   4
         Top             =   480
         Width           =   2775
      End
      Begin VB.CommandButton cmdMasterMenu 
         Caption         =   "Pa&yroll Master"
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
         Width           =   2775
      End
      Begin VB.CommandButton cmdMasterMenu 
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
         Index           =   3
         Left            =   240
         Style           =   1  'Graphical
         TabIndex        =   7
         Top             =   1920
         Width           =   2775
      End
      Begin VB.CommandButton cmdMasterMenu 
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
         Index           =   4
         Left            =   240
         Style           =   1  'Graphical
         TabIndex        =   8
         Top             =   2400
         Width           =   2775
      End
      Begin VB.CommandButton cmdMasterMenu 
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
         Index           =   7
         Left            =   240
         Style           =   1  'Graphical
         TabIndex        =   11
         Top             =   3840
         Width           =   2775
      End
   End
   Begin VB.Frame frMainMenu 
      Appearance      =   0  'Flat
      BackColor       =   &H00C8FFE1&
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
      TabIndex        =   45
      Tag             =   "0"
      Top             =   480
      Width           =   3255
      Begin VB.CommandButton cmdMainMenu 
         Caption         =   "Display / Reports"
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
         Caption         =   "&Transactions"
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
      TabIndex        =   53
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
      TabIndex        =   47
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

Dim mFormLoaded As Boolean
Dim cmdMasters As Object, cmdTransactions As Object, cmdDisplay As Object, cmdMaintenance As Object
Dim cmdComMaster As Object, cmdPyrMaster As Object, cmdPatientMast As Object, cmdPartyMast As Object, cmdSubItemMast As Object, cmdDocterMast As Object, cmdPatCatgMast As Object, cmdPartyGrpMast As Object, cmdSubItemGrpMast As Object, cmdDoctCatgMast As Object, cmdOpnStock As Object
Dim cmdAcntLdgr As Object, cmdProdMast As Object, cmdUserRoleMast As Object, cmdUserMast As Object, cmdUserRightMast As Object, cmdStationMast As Object, cmdAreaMast As Object, cmdVTypeMast As Object
Dim cmdDeptMast As Object, cmdDesgMast As Object, cmdEmpMast As Object

Dim cmdSaleEntry As Object, cmdPurchEntry As Object, cmdSaleRetEntry As Object, cmdPurchRetEntry As Object, cmdJournalEntry As Object, cmdStockJrnEntry As Object

Dim cmdStockTranViewRep As Object, cmdStockReg As Object, cmdLedgerView As Object, cmdItemView As Object
Dim cmdComOptions As Object, cmdAcBalRepost As Object, cmdRemoveNullValue As Object, cmdCheckDataStru As Object

Private Sub cmdComMasterMenu_Click(Index As Integer)
cmdComMasterMenu(Index).Container.Tag = Index

Select Case Screen.ActiveControl
Case cmdAcntLdgr:
    Load frmAcntHead
    frmAcntHead.Show 1
Case cmdProdMast:
    Load frmItemMast
    frmItemMast.Show 1
Case cmdUserRoleMast:
    Load frmUserRoleMast
    frmUserRoleMast.Show 1
Case cmdUserMast
    Load frmUserMast
    frmUserMast.Show 1
Case cmdUserRightMast
    Load frmUserRightMast
    frmUserRightMast.Show 1
Case cmdStationMast
    Load frmStationMast
    frmStationMast.Show 1
Case cmdAreaMast
    Load frmAreaMast
    frmAreaMast.Show 1
Case cmdVTypeMast
    Load frmVoucherType
    frmVoucherType.Show 1
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
Case cmdStockTranViewRep:
    Load frmStockTranViewRep
    frmStockTranViewRep.Show 1
Case cmdStockReg:
    Load frmStockRegRep
    frmStockRegRep.Show 1
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

Private Sub cmdMainMenu_Click(Index As Integer)
cmdMainMenu(Index).Container.Tag = Index

Select Case Screen.ActiveControl
Case cmdMasters:
    frMasterMenu.Visible = True
    GoTo HideMainMenu
Case cmdTransactions:
    frTransactionMenu.Visible = True
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
Case cmdComOptions
    Load frmCommonOptions
    frmCommonOptions.Show 1
Case cmdAcBalRepost:
    RepostAllAchdCurBal
Case cmdRemoveNullValue
    RemoveAppNullValue
Case cmdCheckDataStru
    Rem common database
    CreateAcDatabase mAddMode:=False
    CreateStDatabase mAddMode:=False
    CreateGrpDatabase mAddMode:=False
    CreateComDatabase mAddMode:=False
    
    Rem hospital database
    CreateMdsCmpDatabase mAddMode:=False
    CreateMdsMastDatabase mAddMode:=False
    CreateMdsTranDatabase mAddMode:=False
    CreateMdsComDatabase
    
    Rem hospital master database
    CreateHmsMastDatabase mAddMode:=False
    CreateHmsComDatabase mMastLinkOnly:=True
    
    Rem payroll database
    CreatePyrDatabase mAddMode:=False
    CreatePyrComDatabase
        
End Select

End Sub

Private Sub cmdMaintenanceMenu_GotFocus(Index As Integer)
cmdMaintenanceMenu(Index).BackColor = cYELLOWLIGHT

End Sub

Private Sub cmdMaintenanceMenu_LostFocus(Index As Integer)
cmdMaintenanceMenu(Index).BackColor = vbButtonFace

End Sub

Private Sub cmdMasterMenu_Click(Index As Integer)
Dim MyForm As Form
cmdMasterMenu(Index).Container.Tag = Index

Select Case Screen.ActiveControl
Case cmdComMaster
    frComMasterMenu.Visible = True
    frMasterMenu.Visible = False
Case cmdPyrMaster
    frPyrMasterMenu.Visible = True
    frMasterMenu.Visible = False
Case cmdPatientMast
    Load frmPatientMast
    frmPatientMast.Show 1
Case cmdPartyMast
    Load frmPartyMast
    frmPartyMast.Show 1
Case cmdSubItemMast
    Load frmSubItemMast
    frmSubItemMast.Show 1
Case cmdDocterMast
    Load frmDoctorMast
    frmDoctorMast.Show 1
Case cmdPatCatgMast
    Load frmPatCategoryMast
    frmPatCategoryMast.Show 1
Case cmdPartyGrpMast
    Load frmPartyGrpMast
    frmPartyGrpMast.Show 1
Case cmdSubItemGrpMast
    Load frmSubItemGrpMast
    frmSubItemGrpMast.Show 1
Case cmdDoctCatgMast
    Load frmDoctorCatgMast
    frmDoctorCatgMast.Show 1
Case cmdOpnStock
    Set MyForm = New frmPurchaseInv
    Load MyForm
    MyForm.FormSysVchType = cCOM_VTYPE_OPNSTK
    Call MyForm.Form_Load
    MyForm.Show 1

End Select

Me.ZOrder
End Sub

Private Sub cmdMasterMenu_GotFocus(Index As Integer)
cmdMasterMenu(Index).BackColor = cYELLOWLIGHT

End Sub

Private Sub cmdMasterMenu_LostFocus(Index As Integer)
cmdMasterMenu(Index).BackColor = vbButtonFace

End Sub

Private Sub cmdPyrMasterMenu_Click(Index As Integer)
cmdPyrMasterMenu(Index).Container.Tag = Index

Select Case Screen.ActiveControl
Case cmdDeptMast
    Load frmDepartmentMast
    frmDepartmentMast.Show 1
Case cmdDesgMast
    Load frmDesignationMast
    frmDesignationMast.Show 1
Case cmdEmpMast:
    Load frmEmployeeMast
    frmEmployeeMast.Show 1
End Select

Me.ZOrder

End Sub

Private Sub cmdPyrMasterMenu_GotFocus(Index As Integer)
cmdPyrMasterMenu(Index).BackColor = cYELLOWLIGHT

End Sub

Private Sub cmdPyrMasterMenu_LostFocus(Index As Integer)
cmdPyrMasterMenu(Index).BackColor = vbButtonFace

End Sub

Private Sub cmdTransactionMenu_Click(Index As Integer)
Dim MyForm As Form

cmdTransactionMenu(Index).Container.Tag = Index

Select Case Screen.ActiveControl
Case cmdSaleEntry
    Set MyForm = New frmSalesInv
    Load MyForm
    MyForm.FormSysVchType = cCOM_VTYPE_SALES
    Call MyForm.Form_Load
    MyForm.Show 1
    
Case cmdPurchEntry
    Set MyForm = New frmPurchaseInv
    Load MyForm
    MyForm.FormSysVchType = cCOM_VTYPE_PURCHASE
    Call MyForm.Form_Load
    MyForm.Show 1
    
Case cmdSaleRetEntry
    Set MyForm = New frmPurchaseInv
    Load MyForm
    MyForm.FormSysVchType = cCOM_VTYPE_RETNINW
    Call MyForm.Form_Load
    MyForm.Show 1

Case cmdPurchRetEntry
    Set MyForm = New frmSalesInv
    Load MyForm
    MyForm.FormSysVchType = cCOM_VTYPE_RETNOUTW
    Call MyForm.Form_Load
    MyForm.Show 1
    
Case cmdJournalEntry
    Load frmJournal
    frmJournal.Show 1
Case cmdStockJrnEntry
    Load frmStockJrn
    frmStockJrn.Show 1
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
If mFormLoaded = False Then
    frMainMenu.Visible = True   ' after positoning proper location
Else
    Call TraceLastCmdObj
End If
mFormLoaded = True
End Sub

Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)

Select Case KeyCode
Case vbKeyF2
    Load frmSetDefaultDate
    frmSetDefaultDate.Show 1

Case 27
    If frMasterMenu.Visible = True Then
        frMasterMenu.Visible = False
        frMainMenu.Visible = True
        
        Call TraceLastCmdObj
        
    ElseIf frComMasterMenu.Visible = True Then
        frComMasterMenu.Visible = False
        frMasterMenu.Visible = True
        
        Call TraceLastCmdObj
        
    ElseIf frPyrMasterMenu.Visible = True Then
        frPyrMasterMenu.Visible = False
        frMasterMenu.Visible = True
        
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
Set cmdMasters = cmdMainMenu(0)
Set cmdTransactions = cmdMainMenu(1)
Set cmdDisplay = cmdMainMenu(2)
Set cmdMaintenance = cmdMainMenu(3)

Rem main menu button captions
cmdMasters.Caption = "&Masters"
cmdTransactions.Caption = "&Transactions"
cmdDisplay.Caption = "&Display / Reports"
cmdMaintenance.Caption = "Maint&enance"

Set cmdComMaster = cmdMasterMenu(0): cmdComMaster.Caption = "&Standard Master"
Set cmdPyrMaster = cmdMasterMenu(1): cmdPyrMaster.Caption = "Pa&yroll Master"
Set cmdPatientMast = cmdMasterMenu(2): cmdPatientMast.Caption = "Pa&tient Master"
Set cmdPartyMast = cmdMasterMenu(3): cmdPartyMast.Caption = "&Party Master"
Set cmdSubItemMast = cmdMasterMenu(4): cmdSubItemMast.Caption = "&Item Master"
Set cmdDocterMast = cmdMasterMenu(5): cmdDocterMast.Caption = "Doctor Master"
Set cmdPatCatgMast = cmdMasterMenu(6): cmdPatCatgMast.Caption = "Patient &Category Master"
Set cmdPartyGrpMast = cmdMasterMenu(7): cmdPartyGrpMast.Caption = "Party G&roup Master"
Set cmdSubItemGrpMast = cmdMasterMenu(8): cmdSubItemGrpMast.Caption = "Item &Group Master"
Set cmdDoctCatgMast = cmdMasterMenu(9): cmdDoctCatgMast.Caption = "Doctor Cat&egory Master"
Set cmdOpnStock = cmdMasterMenu(10): cmdOpnStock.Caption = "&Opening Stock"

Set cmdAcntLdgr = cmdComMasterMenu(0): cmdAcntLdgr.Caption = "&Account Ledger"
Set cmdProdMast = cmdComMasterMenu(1): cmdProdMast.Caption = "&Product Master"
Set cmdUserRoleMast = cmdComMasterMenu(2): cmdUserRoleMast.Caption = "User R&ole Master"
Set cmdUserMast = cmdComMasterMenu(3): cmdUserMast.Caption = "&User Master"
Set cmdUserRightMast = cmdComMasterMenu(4): cmdUserRightMast.Caption = "User Rig&ht Master"
Set cmdStationMast = cmdComMasterMenu(5): cmdStationMast.Caption = "S&tation Master"
Set cmdAreaMast = cmdComMasterMenu(6): cmdAreaMast.Caption = "A&rea Master"
Set cmdVTypeMast = cmdComMasterMenu(7): cmdVTypeMast.Caption = "&Voucher Type"

Set cmdDeptMast = cmdPyrMasterMenu(0): cmdDeptMast.Caption = "&Department Master"
Set cmdDesgMast = cmdPyrMasterMenu(1): cmdDesgMast.Caption = "Desi&gnation Master"
Set cmdEmpMast = cmdPyrMasterMenu(2): cmdEmpMast.Caption = "&Employee Master"

Set cmdSaleEntry = cmdTransactionMenu(0): cmdSaleEntry.Caption = "&Sales Entry"
Set cmdPurchEntry = cmdTransactionMenu(1): cmdPurchEntry.Caption = "&Purchase Entry"
Set cmdSaleRetEntry = cmdTransactionMenu(2): cmdSaleRetEntry.Caption = "Sales &Return"
Set cmdPurchRetEntry = cmdTransactionMenu(3): cmdPurchRetEntry.Caption = "Purchase Ret&urn"
Set cmdJournalEntry = cmdTransactionMenu(4): cmdJournalEntry.Caption = "&Journal Entry"
Set cmdStockJrnEntry = cmdTransactionMenu(5): cmdStockJrnEntry.Caption = "&Stock Journal"

Set cmdStockTranViewRep = cmdDisplayMenu(0): cmdStockTranViewRep.Caption = "Stock &Day Book"
Set cmdStockReg = cmdDisplayMenu(1): cmdStockReg.Caption = "&Stock Register"
Set cmdLedgerView = cmdDisplayMenu(2): cmdLedgerView.Caption = "&Ledger View"
Set cmdItemView = cmdDisplayMenu(3): cmdItemView.Caption = "&Item View"

Set cmdComOptions = cmdMaintenanceMenu(0): cmdComOptions.Caption = "&Standard Options"
Set cmdAcBalRepost = cmdMaintenanceMenu(3): cmdAcBalRepost.Caption = "&A/c Balance Reposting"
Set cmdRemoveNullValue = cmdMaintenanceMenu(4): cmdRemoveNullValue.Caption = "&Remove Null Value"
Set cmdCheckDataStru = cmdMaintenanceMenu(5): cmdCheckDataStru.Caption = "&Check Data Structure"

frMainMenu.Visible = False
frMasterMenu.Visible = False
frComMasterMenu.Visible = False
frPyrMasterMenu.Visible = False
frTransactionMenu.Visible = False
frDisplayMenu.Visible = False
frMaintenanceMenu.Visible = False

lblCompanyInfo.Caption = MyCompany.mCmpName _
    & vbCrLf & vbCrLf & MyCompany.mCmpAddress _
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

End Sub

Private Sub Form_Resize()
Dim mTop As Double, mLeft As Double

If frmMain.WindowState = vbMinimized Then
    Exit Sub
End If

lblFormHeading.Width = Me.Width

mTop = lblFormHeading.Top + (lblFormHeading.Height * 2)
mLeft = (Me.Width - frMainMenu.Width) / 2
frMainMenu.Top = mTop: frMainMenu.Left = mLeft

mLeft = (Me.Width - frMasterMenu.Width) / 2
frMasterMenu.Top = mTop: frMasterMenu.Left = mLeft

mLeft = (Me.Width - frComMasterMenu.Width) / 2
frComMasterMenu.Top = mTop: frComMasterMenu.Left = mLeft

mLeft = (Me.Width - frPyrMasterMenu.Width) / 2
frPyrMasterMenu.Top = mTop: frPyrMasterMenu.Left = mLeft

mLeft = (Me.Width - frTransactionMenu.Width) / 2
frTransactionMenu.Top = mTop: frTransactionMenu.Left = mLeft

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
Set cmdMasters = Nothing: Set cmdTransactions = Nothing: Set cmdDisplay = Nothing: Set cmdMaintenance = Nothing
Set cmdComMaster = Nothing: Set cmdPyrMaster = Nothing: Set cmdPatientMast = Nothing: Set cmdPartyMast = Nothing: Set cmdSubItemMast = Nothing: Set cmdDocterMast = Nothing: Set cmdPatCatgMast = Nothing: Set cmdPartyGrpMast = Nothing: Set cmdSubItemGrpMast = Nothing: Set cmdDoctCatgMast = Nothing: Set cmdOpnStock = Nothing
Set cmdAcntLdgr = Nothing: Set cmdProdMast = Nothing: Set cmdUserRoleMast = Nothing: Set cmdUserMast = Nothing: Set cmdUserRightMast = Nothing: Set cmdStationMast = Nothing: Set cmdAreaMast = Nothing: Set cmdVTypeMast = Nothing
Set cmdDeptMast = Nothing: Set cmdDesgMast = Nothing: Set cmdEmpMast = Nothing
Set cmdSaleEntry = Nothing: Set cmdPurchEntry = Nothing: Set cmdSaleRetEntry = Nothing: Set cmdPurchRetEntry = Nothing: Set cmdJournalEntry = Nothing: Set cmdStockJrnEntry = Nothing
Set cmdStockTranViewRep = Nothing: Set cmdStockReg = Nothing: Set cmdLedgerView = Nothing: Set cmdItemView = Nothing
Set cmdComOptions = Nothing: Set cmdAcBalRepost = Nothing: Set cmdRemoveNullValue = Nothing: Set cmdCheckDataStru = Nothing

End Sub

