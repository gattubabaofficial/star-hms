VERSION 5.00
Begin VB.Form frmMyMenu 
   Appearance      =   0  'Flat
   BackColor       =   &H00FFF5EB&
   ClientHeight    =   10290
   ClientLeft      =   60
   ClientTop       =   60
   ClientWidth     =   14565
   ControlBox      =   0   'False
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
      Left            =   12600
      TabIndex        =   66
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
         TabIndex        =   58
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
         TabIndex        =   57
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
         TabIndex        =   56
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
         TabIndex        =   61
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
         TabIndex        =   60
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
         TabIndex        =   59
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
      Left            =   10800
      TabIndex        =   65
      Tag             =   "0"
      Top             =   480
      Width           =   3015
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
         Top             =   3120
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
         Index           =   2
         Left            =   240
         Style           =   1  'Graphical
         TabIndex        =   52
         Top             =   2640
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
         Index           =   1
         Left            =   240
         Style           =   1  'Graphical
         TabIndex        =   51
         Top             =   2160
         Visible         =   0   'False
         Width           =   2535
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
         TabIndex        =   50
         Top             =   1680
         Visible         =   0   'False
         Width           =   2535
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
         Top             =   960
         Width           =   2535
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
         Top             =   360
         Width           =   2535
      End
   End
   Begin VB.Frame frIndoorMenu 
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFF80&
      Caption         =   "                     Indoor                   "
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
      Height          =   7335
      Left            =   9360
      TabIndex        =   70
      Tag             =   "0"
      Top             =   480
      Width           =   3375
      Begin VB.CommandButton cmdIndoorMenu 
         Caption         =   "IPD &Bill"
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
         TabIndex        =   47
         Top             =   5160
         Width           =   2775
      End
      Begin VB.CommandButton cmdIndoorMenu 
         Caption         =   "IPD Bill Pay&ment"
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
         TabIndex        =   48
         Top             =   5760
         Width           =   2775
      End
      Begin VB.CommandButton cmdIndoorMenu 
         Caption         =   "IPD Bill Ref&und"
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
         TabIndex        =   49
         Top             =   6360
         Width           =   2775
      End
      Begin VB.CommandButton cmdIndoorMenu 
         Caption         =   "IPD On A/c. Re&fund"
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
         TabIndex        =   46
         Top             =   3960
         Width           =   2775
      End
      Begin VB.CommandButton cmdIndoorMenu 
         Caption         =   "IPD On A/c. Pa&yment"
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
         TabIndex        =   45
         Top             =   3360
         Width           =   2775
      End
      Begin VB.CommandButton cmdIndoorMenu 
         Caption         =   "&IPD Registration"
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
         TabIndex        =   41
         Top             =   360
         Width           =   2775
      End
      Begin VB.CommandButton cmdIndoorMenu 
         Caption         =   "IPD &Receipt"
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
         TabIndex        =   42
         Top             =   960
         Width           =   2775
      End
      Begin VB.CommandButton cmdIndoorMenu 
         Caption         =   "IPD &Payment"
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
         TabIndex        =   43
         Top             =   1560
         Width           =   2775
      End
      Begin VB.CommandButton cmdIndoorMenu 
         Caption         =   "IPD &Refund"
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
         TabIndex        =   44
         Top             =   2160
         Width           =   2775
      End
      Begin VB.Label Label1 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00C0FFC0&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "Final Bills && Proceedings"
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
         Index           =   1
         Left            =   0
         TabIndex        =   73
         Top             =   4680
         Width           =   3375
      End
      Begin VB.Label Label1 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00C0FFC0&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "On Account Proceedings"
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
         Index           =   0
         Left            =   0
         TabIndex        =   72
         Top             =   2880
         Width           =   3375
      End
      Begin VB.Line Line1 
         Index           =   2
         X1              =   0
         X2              =   3360
         Y1              =   4680
         Y2              =   4680
      End
      Begin VB.Line Line1 
         Index           =   1
         X1              =   0
         X2              =   3360
         Y1              =   2880
         Y2              =   2880
      End
   End
   Begin VB.Frame frOutdoorMenu 
      Appearance      =   0  'Flat
      BackColor       =   &H00C0E0FF&
      Caption         =   "                   Outdoor                "
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
      Height          =   5415
      Left            =   7560
      TabIndex        =   71
      Tag             =   "0"
      Top             =   480
      Width           =   3255
      Begin VB.CommandButton cmdOutdoorMenu 
         Caption         =   "OPD Bill Re&fund"
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
         Top             =   4320
         Width           =   2775
      End
      Begin VB.CommandButton cmdOutdoorMenu 
         Caption         =   "OPD Bill Pa&yment"
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
         Top             =   3720
         Width           =   2775
      End
      Begin VB.CommandButton cmdOutdoorMenu 
         Caption         =   "OPD &Bill"
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
         Top             =   3120
         Width           =   2775
      End
      Begin VB.CommandButton cmdOutdoorMenu 
         Caption         =   "OPD &Refund"
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
         Top             =   2160
         Width           =   2775
      End
      Begin VB.CommandButton cmdOutdoorMenu 
         Caption         =   "OPD &Payment"
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
         Top             =   1560
         Width           =   2775
      End
      Begin VB.CommandButton cmdOutdoorMenu 
         Caption         =   "OPD &Receipt"
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
         Width           =   2775
      End
      Begin VB.CommandButton cmdOutdoorMenu 
         Caption         =   "&OPD Registration"
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
      Begin VB.Line Line1 
         Index           =   0
         X1              =   0
         X2              =   3240
         Y1              =   2880
         Y2              =   2880
      End
   End
   Begin VB.Frame frTransactionMenu 
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
      Height          =   3255
      Left            =   5760
      TabIndex        =   63
      Tag             =   "0"
      Top             =   480
      Width           =   2775
      Begin VB.CommandButton cmdTransactionMenu 
         Caption         =   "Job &Issue"
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
         TabIndex        =   31
         Top             =   960
         Width           =   2295
      End
      Begin VB.CommandButton cmdTransactionMenu 
         Caption         =   "Job &Receipts"
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
         TabIndex        =   30
         Top             =   360
         Width           =   2295
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
         TabIndex        =   33
         Top             =   2640
         Width           =   2295
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
         TabIndex        =   32
         Top             =   2160
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
      TabIndex        =   68
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
         TabIndex        =   29
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
         TabIndex        =   27
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
         TabIndex        =   28
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
      Left            =   3360
      TabIndex        =   67
      Tag             =   "0"
      Top             =   480
      Width           =   2895
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
         Index           =   6
         Left            =   240
         Style           =   1  'Graphical
         TabIndex        =   26
         Top             =   3360
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
         TabIndex        =   20
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
         TabIndex        =   21
         Top             =   960
         Width           =   2415
      End
      Begin VB.CommandButton cmdComMasterMenu 
         Caption         =   "&Security Master"
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
         TabIndex        =   22
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
         TabIndex        =   23
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
         Index           =   4
         Left            =   240
         Style           =   1  'Graphical
         TabIndex        =   24
         Top             =   2400
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
         Index           =   5
         Left            =   240
         Style           =   1  'Graphical
         TabIndex        =   25
         Top             =   2880
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
      Left            =   1920
      TabIndex        =   69
      Tag             =   "0"
      Top             =   480
      Width           =   3135
      Begin VB.CommandButton cmdMasterMenu 
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
         Index           =   5
         Left            =   240
         Style           =   1  'Graphical
         TabIndex        =   9
         Top             =   2880
         Visible         =   0   'False
         Width           =   2655
      End
      Begin VB.CommandButton cmdMasterMenu 
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
         Index           =   8
         Left            =   240
         Style           =   1  'Graphical
         TabIndex        =   12
         Top             =   4320
         Visible         =   0   'False
         Width           =   2655
      End
      Begin VB.CommandButton cmdMasterMenu 
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
         Index           =   7
         Left            =   240
         Style           =   1  'Graphical
         TabIndex        =   11
         Top             =   3840
         Visible         =   0   'False
         Width           =   2655
      End
      Begin VB.CommandButton cmdMasterMenu 
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
         Index           =   4
         Left            =   240
         Style           =   1  'Graphical
         TabIndex        =   8
         Top             =   2400
         Visible         =   0   'False
         Width           =   2655
      End
      Begin VB.CommandButton cmdMasterMenu 
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
         Index           =   15
         Left            =   240
         Style           =   1  'Graphical
         TabIndex        =   19
         Top             =   7680
         Visible         =   0   'False
         Width           =   2655
      End
      Begin VB.CommandButton cmdMasterMenu 
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
         Index           =   14
         Left            =   240
         Style           =   1  'Graphical
         TabIndex        =   18
         Top             =   7200
         Visible         =   0   'False
         Width           =   2655
      End
      Begin VB.CommandButton cmdMasterMenu 
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
         Index           =   13
         Left            =   240
         Style           =   1  'Graphical
         TabIndex        =   17
         Top             =   6720
         Visible         =   0   'False
         Width           =   2655
      End
      Begin VB.CommandButton cmdMasterMenu 
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
         Index           =   12
         Left            =   240
         Style           =   1  'Graphical
         TabIndex        =   16
         Top             =   6240
         Visible         =   0   'False
         Width           =   2655
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
         Index           =   11
         Left            =   240
         Style           =   1  'Graphical
         TabIndex        =   15
         Top             =   5760
         Visible         =   0   'False
         Width           =   2655
      End
      Begin VB.CommandButton cmdMasterMenu 
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
         Index           =   10
         Left            =   240
         Style           =   1  'Graphical
         TabIndex        =   14
         Top             =   5280
         Visible         =   0   'False
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
         Index           =   0
         Left            =   240
         Style           =   1  'Graphical
         TabIndex        =   4
         Top             =   480
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
         Index           =   1
         Left            =   240
         Style           =   1  'Graphical
         TabIndex        =   5
         Top             =   960
         Width           =   2655
      End
      Begin VB.CommandButton cmdMasterMenu 
         Caption         =   "&Customer Master"
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
         Width           =   2655
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
         Index           =   3
         Left            =   240
         Style           =   1  'Graphical
         TabIndex        =   7
         Top             =   1920
         Width           =   2655
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
         Index           =   6
         Left            =   240
         Style           =   1  'Graphical
         TabIndex        =   10
         Top             =   3360
         Visible         =   0   'False
         Width           =   2655
      End
      Begin VB.CommandButton cmdMasterMenu 
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
         Index           =   9
         Left            =   240
         Style           =   1  'Graphical
         TabIndex        =   13
         Top             =   4800
         Visible         =   0   'False
         Width           =   2655
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
      TabIndex        =   62
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
      TabIndex        =   74
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

Dim mFormLoaded As Boolean
Dim cmdMasters As Object, cmdTransactions As Object, cmdDisplay As Object, cmdMaintenance As Object
Dim cmdComMaster As Object, cmdPyrMaster As Object, cmdCustMast As Object, cmdSubItemMast As Object, cmdRefCatgMast As Object, cmdDoctRoleMast As Object, cmdDoctMast As Object, cmdRefByMast As Object, cmdRefToMast As Object, cmdServGrpMast As Object, cmdServiceMast As Object, cmdPatMast As Object, cmdDiagMast As Object, cmdFloorMast As Object, cmdWardMast As Object, cmdBedMast As Object
Dim cmdAcntLdgr As Object, cmdProdMast As Object, cmdSecurityMast As Object, cmdUserMast As Object, cmdStationMast As Object, cmdAreaMast As Object, cmdVTypeMast As Object
Dim cmdDeptMast As Object, cmdDesgMast As Object, cmdEmpMast As Object

Dim cmdJournalEntry As Object, cmdStockJrnEntry As Object, cmdJobReceipt As Object, cmdJobIssue As Object
Dim cmdOutdReg As Object, cmdOutdRcpt As Object, cmdOutdPymt As Object, cmdOutdRefd As Object, cmdOutdBill As Object, cmdOutdBlPymt As Object, cmdOutdBlRefd As Object
Dim cmdIndrReg As Object, cmdIndrRcpt As Object, cmdIndrPymt As Object, cmdIndrRefd As Object, cmdIndrBill As Object, cmdIndrRgPymt As Object, cmdIndrRgRefd As Object, cmdIndrBlPymt As Object, cmdIndrBlRefd As Object

Dim cmdCollectionView As Object, cmdServiceView As Object, cmdOutdoorRegView As Object, cmdIndoorRegView As Object, cmdLedgerView As Object, cmdItemView As Object
Dim cmdComOptions As Object, cmdHmsOpdOptions As Object, cmdHmsIpdOptions As Object, cmdAcBalRepost As Object, cmdRemoveNullValue As Object, cmdCheckDataStru As Object

Private Sub cmdComMasterMenu_Click(Index As Integer)
cmdComMasterMenu(Index).Container.Tag = Index

Select Case Screen.ActiveControl
Case cmdAcntLdgr:
    Load frmAcntHead
    frmAcntHead.Show 1
Case cmdProdMast:
    Load frmItemMast
    frmItemMast.Show 1
Case cmdSecurityMast:
    Load frmSecurityMast
    frmSecurityMast.Show 1
Case cmdUserMast
    Load frmUserMast
    frmUserMast.Show 1
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
'Case cmdCollectionView:
'    Load frmCollectionViewRep
'    frmCollectionViewRep.Show 1
'Case cmdServiceView:
'    'Load frmLedgerView
'    'frmLedgerView.Show 1
'Case cmdOutdoorRegView:
'    'Load frmLedgerView
'    'frmLedgerView.Show 1
'Case cmdIndoorRegView:
'    'Load frmLedgerView
'    'frmLedgerView.Show 1

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
Case cmdHmsOpdOptions
    'Load frmHmsOpdOptions
    'frmHmsOpdOptions.Show 1
Case cmdHmsIpdOptions
    'Load frmHmsIpdOptions
    'frmHmsIpdOptions.Show 1
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
    CreatePmtCmpDatabase mAddMode:=False
    CreatePmtMastDatabase mAddMode:=False
    CreatePmtTranDatabase mAddMode:=False
    CreatePmtComDatabase
    
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
cmdMasterMenu(Index).Container.Tag = Index

Select Case Screen.ActiveControl
Case cmdComMaster
    frComMasterMenu.Visible = True
    frMasterMenu.Visible = False
Case cmdPyrMaster
    frPyrMasterMenu.Visible = True
    frMasterMenu.Visible = False
Case cmdCustMast
    Load frmPartyMast
    frmPartyMast.Show 1
Case cmdSubItemMast
    Load frmSubItemMast
    frmSubItemMast.Show 1
'Case cmdRefCatgMast
'    Load frmRefCatgMast
'    frmRefCatgMast.Show 1
'Case cmdDoctRoleMast
'    Load frmDoctorRoleMast
'    frmDoctorRoleMast.Show 1
'Case cmdDoctMast
'    Load frmDoctorMast
'    frmDoctorMast.Show 1
'Case cmdRefByMast
'    Load frmRefByMast
'    frmRefByMast.Show 1
'Case cmdRefToMast
'    Load frmRefToMast
'    frmRefToMast.Show 1
'Case cmdServGrpMast
'    Load frmServGroupMast
'    frmServGroupMast.Show 1
'Case cmdServiceMast
'    Load frmServiceMast
'    frmServiceMast.Show 1
'Case cmdPatMast
'    Load frmPatientMast
'    frmPatientMast.Show 1
'Case cmdDiagMast
'    Load frmDiagnosticMast
'    frmDiagnosticMast.Show 1
'Case cmdFloorMast
'    Load frmFloorMast
'    frmFloorMast.Show 1
'Case cmdWardMast
'    Load frmWardMast
'    frmWardMast.Show 1
'Case cmdBedMast
'    Load frmBedMast
'    frmBedMast.Show 1
End Select

Me.ZOrder
End Sub

Private Sub cmdMasterMenu_GotFocus(Index As Integer)
cmdMasterMenu(Index).BackColor = cYELLOWLIGHT

End Sub

Private Sub cmdMasterMenu_LostFocus(Index As Integer)
cmdMasterMenu(Index).BackColor = vbButtonFace

End Sub

Private Sub cmdOutdoorMenu_Click(Index As Integer)
cmdOutdoorMenu(Index).Container.Tag = Index

Select Case Screen.ActiveControl
'Case cmdOutdReg
'    Load frmOutdoorReg
'    frmOutdoorReg.Show 1
'Case cmdOutdRcpt
'    Load frmOutdoorReceipt
'    frmOutdoorReceipt.Show 1
'Case cmdOutdPymt
'    Load frmOutdoorPymtRcpt
'    frmOutdoorPymtRcpt.Show 1
'Case cmdOutdRefd
'    Load frmOutdoorRefdRcpt
'    frmOutdoorRefdRcpt.Show 1
'Case cmdOutdBill
'    Load frmOutdoorBill
'    frmOutdoorBill.Show 1
'Case cmdOutdBlPymt
'    Load frmOutdoorBlPayment
'    frmOutdoorBlPayment.Show 1
'Case cmdOutdBlRefd
'    Load frmOutdoorBlRefund
'    frmOutdoorBlRefund.Show 1
End Select

Me.ZOrder
End Sub

Private Sub cmdOutdoorMenu_GotFocus(Index As Integer)
cmdOutdoorMenu(Index).BackColor = cYELLOWLIGHT

End Sub

Private Sub cmdOutdoorMenu_LostFocus(Index As Integer)
cmdOutdoorMenu(Index).BackColor = vbButtonFace
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
cmdTransactionMenu(Index).Container.Tag = Index

Select Case Screen.ActiveControl
Case cmdJournalEntry
    Load frmJournal
    frmJournal.Show 1
Case cmdStockJrnEntry
    Load frmStockJrn
    frmStockJrn.Show 1
Case cmdJobReceipt
    Load frmJobReceipt
    frmJobReceipt.Show 1
Case cmdJobIssue
    Load frmJobIssue
    frmJobIssue.Show 1
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
Case 13:
    
Case 27:
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
    
    ElseIf frOutdoorMenu.Visible = True Then
        frOutdoorMenu.Visible = False
        frMainMenu.Visible = True
        
        Call TraceLastCmdObj
    
    ElseIf frIndoorMenu.Visible = True Then
        frIndoorMenu.Visible = False
        frMainMenu.Visible = True
        
        Call TraceLastCmdObj
    
'    ElseIf frDiagnosticMenu.Visible = True Then
'        frDiagnosticMenu.Visible = False
'        frMainMenu.Visible = True
'
'        Call TraceLastCmdObj
'
'    ElseIf frHouseKeepingMenu.Visible = True Then
'        frHouseKeepingMenu.Visible = False
'        frMainMenu.Visible = True
'
'        Call TraceLastCmdObj
'
'    ElseIf frMedicalStoreMenu.Visible = True Then
'        frMedicalStoreMenu.Visible = False
'        frMainMenu.Visible = True
'
'        Call TraceLastCmdObj
    
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
Set cmdPyrMaster = cmdMasterMenu(1): cmdPyrMaster.Caption = "&Payroll Master"
Set cmdCustMast = cmdMasterMenu(2): cmdCustMast.Caption = "&Customer Master"
Set cmdSubItemMast = cmdMasterMenu(3): cmdSubItemMast.Caption = "Item Master"
Set cmdRefCatgMast = cmdMasterMenu(4): cmdRefCatgMast.Caption = "&Referred Category"
Set cmdDoctRoleMast = cmdMasterMenu(5): cmdDoctRoleMast.Caption = "Doctor Rol&e"
Set cmdDoctMast = cmdMasterMenu(6): cmdDoctMast.Caption = "&Doctor Master"
Set cmdRefByMast = cmdMasterMenu(7): cmdRefByMast.Caption = "Referred &By Master"
Set cmdRefToMast = cmdMasterMenu(8): cmdRefToMast.Caption = "Referred &To Master"
Set cmdServGrpMast = cmdMasterMenu(9): cmdServGrpMast.Caption = "Ser&vice Group Master"
Set cmdServiceMast = cmdMasterMenu(10): cmdServiceMast.Caption = "Servi&ce Master"
Set cmdPatMast = cmdMasterMenu(11): cmdPatMast.Caption = "Pa&tient Master"
Set cmdDiagMast = cmdMasterMenu(12): cmdDiagMast.Caption = "D&iagnostic Master"
Set cmdFloorMast = cmdMasterMenu(13): cmdFloorMast.Caption = "Bed &Floor Master"
Set cmdWardMast = cmdMasterMenu(14): cmdWardMast.Caption = "Bed &Ward Master"
Set cmdBedMast = cmdMasterMenu(15): cmdBedMast.Caption = "&Bed Master"

Set cmdAcntLdgr = cmdComMasterMenu(0): cmdAcntLdgr.Caption = "&Account Ledger"
Set cmdProdMast = cmdComMasterMenu(1): cmdProdMast.Caption = "&Product Master"
Set cmdSecurityMast = cmdComMasterMenu(2): cmdSecurityMast.Caption = "&Security Master"
Set cmdUserMast = cmdComMasterMenu(3): cmdUserMast.Caption = "&User Master"
Set cmdStationMast = cmdComMasterMenu(4): cmdStationMast.Caption = "S&tation Master"
Set cmdAreaMast = cmdComMasterMenu(5): cmdAreaMast.Caption = "A&rea Master"
Set cmdVTypeMast = cmdComMasterMenu(6): cmdVTypeMast.Caption = "&Voucher Type"

Set cmdDeptMast = cmdPyrMasterMenu(0): cmdDeptMast.Caption = "&Department Master"
Set cmdDesgMast = cmdPyrMasterMenu(1): cmdDesgMast.Caption = "Desi&gnation Master"
Set cmdEmpMast = cmdPyrMasterMenu(2): cmdEmpMast.Caption = "&Employee Master"

Set cmdJournalEntry = cmdTransactionMenu(0): cmdJournalEntry.Caption = "&Journal Entry"
Set cmdStockJrnEntry = cmdTransactionMenu(1): cmdStockJrnEntry.Caption = "&Stock Journal"
Set cmdJobReceipt = cmdTransactionMenu(2): cmdJobReceipt.Caption = "Job &Receipt"
Set cmdJobIssue = cmdTransactionMenu(3): cmdJobIssue.Caption = "&Job Issue"

Set cmdOutdReg = cmdOutdoorMenu(0): cmdOutdReg.Caption = "&OPD Registration"
Set cmdOutdRcpt = cmdOutdoorMenu(1): cmdOutdRcpt.Caption = "OPD &Receipt"
Set cmdOutdPymt = cmdOutdoorMenu(2): cmdOutdPymt.Caption = "OPD &Payment"
Set cmdOutdRefd = cmdOutdoorMenu(3): cmdOutdRefd.Caption = "OPD &Refund"
Set cmdOutdBill = cmdOutdoorMenu(4): cmdOutdBill.Caption = "OPD &Bill"
Set cmdOutdBlPymt = cmdOutdoorMenu(5): cmdOutdBlPymt.Caption = "OPD Bill Pa&yment"
Set cmdOutdBlRefd = cmdOutdoorMenu(6): cmdOutdBlRefd.Caption = "OPD Bill Re&fund"

Set cmdIndrReg = cmdIndoorMenu(0): cmdIndrReg.Caption = "&IPD Registration"
Set cmdIndrRcpt = cmdIndoorMenu(1): cmdIndrRcpt.Caption = "IPD &Receipt"
Set cmdIndrPymt = cmdIndoorMenu(2): cmdIndrPymt.Caption = "IPD &Payment"
Set cmdIndrRefd = cmdIndoorMenu(3): cmdIndrRefd.Caption = "IPD &Refund"
Set cmdIndrRgPymt = cmdIndoorMenu(4): cmdIndrRgPymt.Caption = "IPD On A/c. Pa&yment"
Set cmdIndrRgRefd = cmdIndoorMenu(5): cmdIndrRgRefd.Caption = "IPD On A/c. Re&fund"
Set cmdIndrBill = cmdIndoorMenu(6): cmdIndrBill.Caption = "IPD &Bill"
Set cmdIndrBlPymt = cmdIndoorMenu(7): cmdIndrBlPymt.Caption = "IPD Bill Pay&ment"
Set cmdIndrBlRefd = cmdIndoorMenu(8): cmdIndrBlRefd.Caption = "IPD Bill Ref&und"

Set cmdCollectionView = cmdDisplayMenu(0): cmdCollectionView.Caption = "&Collection Report"
Set cmdServiceView = cmdDisplayMenu(1): cmdServiceView.Caption = "&Service Report"
Set cmdOutdoorRegView = cmdDisplayMenu(2): cmdOutdoorRegView.Caption = "&Outdoor Register"
Set cmdIndoorRegView = cmdDisplayMenu(3): cmdIndoorRegView.Caption = "&Indoor Register"
Set cmdLedgerView = cmdDisplayMenu(4): cmdLedgerView.Caption = "&Ledger View"
Set cmdItemView = cmdDisplayMenu(5): cmdItemView.Caption = "&Item View"

Set cmdComOptions = cmdMaintenanceMenu(0): cmdComOptions.Caption = "&Standard Options"
Set cmdHmsOpdOptions = cmdMaintenanceMenu(1): cmdHmsOpdOptions.Caption = "&Hospital Outdoor Options"
Set cmdHmsIpdOptions = cmdMaintenanceMenu(2): cmdHmsIpdOptions.Caption = "&Hospital Indoor Options"
Set cmdAcBalRepost = cmdMaintenanceMenu(3): cmdAcBalRepost.Caption = "&A/c Balance Reposting"
Set cmdRemoveNullValue = cmdMaintenanceMenu(4): cmdRemoveNullValue.Caption = "&Remove Null Value"
Set cmdCheckDataStru = cmdMaintenanceMenu(5): cmdCheckDataStru.Caption = "&Check Data Structure"

frMainMenu.Visible = False
frMasterMenu.Visible = False
frComMasterMenu.Visible = False
frPyrMasterMenu.Visible = False
frTransactionMenu.Visible = False
frOutdoorMenu.Visible = False
frIndoorMenu.Visible = False
'frDiagnosticMenu.Visible = False
'frHouseKeepingMenu.Visible = False
'frMedicalStoreMenu.Visible = False
frDisplayMenu.Visible = False
frMaintenanceMenu.Visible = False

lblCompanyInfo.Caption = MyCompany.mCmpName _
    & vbCrLf & MyCompany.mCmpAddress _
    & vbCrLf & MyCompany.mCmpCity _
    & vbCrLf & MyCompany.mCmpState _
    & vbCrLf & MyCompany.mCmpEmail _
    & vbCrLf & MyCompany.mCmpWebsite _
    & vbCrLf & MyCompany.mCmpOPhone _
    & vbCrLf & MyCompany.mCmpRPhone

End Sub

Private Sub Form_Resize()
Dim mTop As Double, mLeft As Double
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

mLeft = (Me.Width - frOutdoorMenu.Width) / 2
frOutdoorMenu.Top = mTop: frOutdoorMenu.Left = mLeft

mLeft = (Me.Width - frIndoorMenu.Width) / 2
frIndoorMenu.Top = mTop: frIndoorMenu.Left = mLeft

'mLeft = (Me.Width - frDiagnosticMenu.Width) / 2
'frDiagnosticMenu.Top = mTop: frDiagnosticMenu.Left = mLeft
'
'mLeft = (Me.Width - frHouseKeepingMenu.Width) / 2
'frHouseKeepingMenu.Top = mTop: frHouseKeepingMenu.Left = mLeft
'
'mLeft = (Me.Width - frMedicalStoreMenu.Width) / 2
'frMedicalStoreMenu.Top = mTop: frMedicalStoreMenu.Left = mLeft

mLeft = (Me.Width - frDisplayMenu.Width) / 2
frDisplayMenu.Top = mTop: frDisplayMenu.Left = mLeft

mLeft = (Me.Width - frMaintenanceMenu.Width) / 2
frMaintenanceMenu.Top = mTop: frMaintenanceMenu.Left = mLeft

lblCompanyInfo.Left = 100
lblCompanyInfo.Top = mTop
lblCompanyInfo.Width = frMainMenu.Left - 200
lblCompanyInfo.Height = frMainMenu.Height / 1.5

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

Private Sub Form_Unload(Cancel As Integer)
Set cmdMasters = Nothing: Set cmdTransactions = Nothing: Set cmdDisplay = Nothing: Set cmdMaintenance = Nothing
Set cmdComMaster = Nothing: Set cmdPyrMaster = Nothing: Set cmdCustMast = Nothing: Set cmdSubItemMast = Nothing: Set cmdRefCatgMast = Nothing: Set cmdDoctRoleMast = Nothing: Set cmdDoctMast = Nothing: Set cmdRefByMast = Nothing: Set cmdRefToMast = Nothing: Set cmdServGrpMast = Nothing: Set cmdServiceMast = Nothing: Set cmdPatMast = Nothing: Set cmdDiagMast = Nothing: Set cmdFloorMast = Nothing: Set cmdWardMast = Nothing: Set cmdBedMast = Nothing
Set cmdAcntLdgr = Nothing: Set cmdProdMast = Nothing: Set cmdSecurityMast = Nothing: Set cmdUserMast = Nothing: Set cmdStationMast = Nothing: Set cmdAreaMast = Nothing: Set cmdVTypeMast = Nothing
Set cmdDeptMast = Nothing: Set cmdDesgMast = Nothing: Set cmdEmpMast = Nothing
Set cmdJournalEntry = Nothing: Set cmdStockJrnEntry = Nothing: Set cmdJobReceipt = Nothing: Set cmdJobIssue = Nothing
Set cmdOutdReg = Nothing: Set cmdOutdRcpt = Nothing: Set cmdOutdPymt = Nothing: Set cmdOutdRefd = Nothing: Set cmdOutdBill = Nothing: Set cmdOutdBlPymt = Nothing: Set cmdOutdBlRefd = Nothing
Set cmdIndrReg = Nothing: Set cmdIndrRcpt = Nothing: Set cmdIndrPymt = Nothing: Set cmdIndrRefd = Nothing: Set cmdIndrBill = Nothing: Set cmdIndrRgPymt = Nothing: Set cmdIndrRgRefd = Nothing: Set cmdIndrBlPymt = Nothing: Set cmdIndrBlRefd = Nothing
Set cmdCollectionView = Nothing: Set cmdServiceView = Nothing: Set cmdOutdoorRegView = Nothing: Set cmdIndoorRegView = Nothing: Set cmdLedgerView = Nothing: Set cmdItemView = Nothing
Set cmdComOptions = Nothing: Set cmdHmsOpdOptions = Nothing: Set cmdHmsIpdOptions = Nothing: Set cmdAcBalRepost = Nothing: Set cmdRemoveNullValue = Nothing: Set cmdCheckDataStru = Nothing

End Sub

