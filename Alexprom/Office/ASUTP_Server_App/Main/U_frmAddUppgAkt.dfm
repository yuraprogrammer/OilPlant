object frmAddUppgAkt: TfrmAddUppgAkt
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #1057#1086#1079#1076#1072#1090#1100' '#1072#1082#1090' '#1087#1077#1088#1077#1088#1072#1073#1086#1090#1082#1080
  ClientHeight = 367
  ClientWidth = 841
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 185
    Height = 73
    Caption = #1048#1089#1093#1086#1076#1085#1099#1077' '#1076#1072#1085#1085#1099#1077':'
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 16
      Width = 30
      Height = 13
      Caption = #1044#1072#1090#1072':'
    end
    object Label2: TLabel
      Left = 102
      Top = 16
      Width = 34
      Height = 13
      Caption = #1042#1088#1077#1084#1103':'
    end
    object calendar: TDateTimePicker
      Left = 8
      Top = 40
      Width = 89
      Height = 21
      Date = 40255.437249525460000000
      Time = 40255.437249525460000000
      TabOrder = 0
    end
    object timer: TMaskEdit
      Left = 103
      Top = 40
      Width = 71
      Height = 21
      Enabled = False
      EditMask = '!90:00;1; '
      MaxLength = 5
      TabOrder = 1
      Text = '  :  '
    end
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 87
    Width = 185
    Height = 154
    Caption = #1048#1089#1087#1086#1083#1085#1080#1090#1077#1083#1080':'
    TabOrder = 1
    object Label3: TLabel
      Left = 8
      Top = 17
      Width = 72
      Height = 13
      Caption = #1057#1090'. '#1086#1087#1077#1088#1072#1090#1086#1088':'
    end
    object Label4: TLabel
      Left = 8
      Top = 59
      Width = 54
      Height = 13
      Caption = #1054#1087#1077#1088#1072#1090#1086#1088':'
    end
    object Label5: TLabel
      Left = 8
      Top = 101
      Width = 54
      Height = 13
      Caption = #1054#1087#1077#1088#1072#1090#1086#1088':'
    end
    object DBLookupComboBox1: TDBLookupComboBox
      Left = 8
      Top = 38
      Width = 167
      Height = 21
      TabOrder = 0
    end
    object DBLookupComboBox2: TDBLookupComboBox
      Left = 8
      Top = 80
      Width = 167
      Height = 21
      TabOrder = 1
    end
    object DBLookupComboBox3: TDBLookupComboBox
      Left = 8
      Top = 122
      Width = 167
      Height = 21
      TabOrder = 2
    end
  end
  object GroupBox3: TGroupBox
    Left = 199
    Top = 8
    Width = 210
    Height = 233
    Caption = #1055#1088#1086#1094#1077#1085#1090#1086#1074#1082#1072':'
    TabOrder = 2
    object Label6: TLabel
      Left = 118
      Top = 16
      Width = 68
      Height = 13
      Caption = #1057#1086#1076#1077#1088#1078#1072#1085#1080#1077':'
    end
    object Label7: TLabel
      Left = 24
      Top = 16
      Width = 77
      Height = 13
      Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077':'
    end
    object Label8: TLabel
      Left = 191
      Top = 37
      Width = 11
      Height = 13
      Caption = '%'
    end
    object Label9: TLabel
      Left = 191
      Top = 53
      Width = 11
      Height = 13
      Caption = '%'
    end
    object Label10: TLabel
      Left = 191
      Top = 69
      Width = 11
      Height = 13
      Caption = '%'
    end
    object Label11: TLabel
      Left = 191
      Top = 85
      Width = 11
      Height = 13
      Caption = '%'
    end
    object Label12: TLabel
      Left = 191
      Top = 101
      Width = 11
      Height = 13
      Caption = '%'
    end
    object Label13: TLabel
      Left = 191
      Top = 117
      Width = 11
      Height = 13
      Caption = '%'
    end
    object Label14: TLabel
      Left = 192
      Top = 133
      Width = 11
      Height = 13
      Caption = '%'
    end
    object Label15: TLabel
      Left = 191
      Top = 149
      Width = 11
      Height = 13
      Caption = '%'
    end
    object Label16: TLabel
      Left = 191
      Top = 166
      Width = 11
      Height = 13
      Caption = '%'
    end
    object Label17: TLabel
      Left = 191
      Top = 182
      Width = 11
      Height = 13
      Caption = '%'
    end
    object Panel1: TPanel
      Left = 7
      Top = 35
      Width = 110
      Height = 17
      BevelInner = bvLowered
      BevelOuter = bvLowered
      TabOrder = 0
    end
    object Panel2: TPanel
      Left = 7
      Top = 51
      Width = 110
      Height = 17
      BevelInner = bvLowered
      BevelOuter = bvLowered
      TabOrder = 1
    end
    object Panel3: TPanel
      Left = 7
      Top = 67
      Width = 110
      Height = 17
      BevelInner = bvLowered
      BevelOuter = bvLowered
      TabOrder = 2
    end
    object Panel4: TPanel
      Left = 7
      Top = 83
      Width = 110
      Height = 17
      BevelInner = bvLowered
      BevelOuter = bvLowered
      TabOrder = 3
    end
    object Panel5: TPanel
      Left = 7
      Top = 99
      Width = 110
      Height = 17
      BevelInner = bvLowered
      BevelOuter = bvLowered
      TabOrder = 4
    end
    object Panel6: TPanel
      Left = 7
      Top = 115
      Width = 110
      Height = 17
      BevelInner = bvLowered
      BevelOuter = bvLowered
      TabOrder = 5
    end
    object Panel11: TPanel
      Left = 117
      Top = 35
      Width = 69
      Height = 17
      BevelInner = bvLowered
      BevelOuter = bvLowered
      TabOrder = 6
    end
    object Panel12: TPanel
      Left = 117
      Top = 51
      Width = 69
      Height = 17
      BevelInner = bvLowered
      BevelOuter = bvLowered
      TabOrder = 7
    end
    object Panel13: TPanel
      Left = 117
      Top = 67
      Width = 69
      Height = 17
      BevelInner = bvLowered
      BevelOuter = bvLowered
      TabOrder = 8
    end
    object Panel14: TPanel
      Left = 117
      Top = 83
      Width = 69
      Height = 17
      BevelInner = bvLowered
      BevelOuter = bvLowered
      TabOrder = 9
    end
    object Panel15: TPanel
      Left = 117
      Top = 99
      Width = 69
      Height = 17
      BevelInner = bvLowered
      BevelOuter = bvLowered
      TabOrder = 10
    end
    object Panel16: TPanel
      Left = 117
      Top = 115
      Width = 69
      Height = 17
      BevelInner = bvLowered
      BevelOuter = bvLowered
      TabOrder = 11
    end
    object Panel7: TPanel
      Left = 7
      Top = 131
      Width = 110
      Height = 17
      BevelInner = bvLowered
      BevelOuter = bvLowered
      TabOrder = 12
    end
    object Panel8: TPanel
      Left = 7
      Top = 147
      Width = 110
      Height = 17
      BevelInner = bvLowered
      BevelOuter = bvLowered
      TabOrder = 13
    end
    object Panel9: TPanel
      Left = 7
      Top = 164
      Width = 110
      Height = 17
      BevelInner = bvLowered
      BevelOuter = bvLowered
      TabOrder = 14
    end
    object Panel10: TPanel
      Left = 7
      Top = 180
      Width = 110
      Height = 17
      BevelInner = bvLowered
      BevelOuter = bvLowered
      TabOrder = 15
    end
    object Panel17: TPanel
      Left = 117
      Top = 131
      Width = 69
      Height = 17
      BevelInner = bvLowered
      BevelOuter = bvLowered
      TabOrder = 16
    end
    object Panel18: TPanel
      Left = 117
      Top = 147
      Width = 69
      Height = 17
      BevelInner = bvLowered
      BevelOuter = bvLowered
      TabOrder = 17
    end
    object Panel19: TPanel
      Left = 117
      Top = 164
      Width = 69
      Height = 17
      BevelInner = bvLowered
      BevelOuter = bvLowered
      TabOrder = 18
    end
    object Panel20: TPanel
      Left = 117
      Top = 180
      Width = 69
      Height = 17
      BevelInner = bvLowered
      BevelOuter = bvLowered
      TabOrder = 19
    end
  end
  object GroupBox4: TGroupBox
    Left = 8
    Top = 247
    Width = 401
    Height = 82
    Caption = #1058#1088#1077#1073#1086#1074#1072#1085#1080#1103' '#1082' '#1087#1086#1083#1091#1095#1072#1077#1084#1099#1084' '#1087#1088#1086#1076#1091#1082#1090#1072#1084':'
    TabOrder = 3
    object Label18: TLabel
      Left = 142
      Top = 24
      Width = 16
      Height = 13
      Caption = 't'#1082#1082
    end
    object Label19: TLabel
      Left = 142
      Top = 40
      Width = 21
      Height = 13
      Caption = 't'#1074#1089#1087
    end
    object Label20: TLabel
      Left = 249
      Top = 40
      Width = 22
      Height = 13
      Caption = 't'#1087#1086#1084
    end
    object Label21: TLabel
      Left = 142
      Top = 56
      Width = 21
      Height = 13
      Caption = 't'#1074#1089#1087
    end
    object Label22: TLabel
      Left = 249
      Top = 56
      Width = 51
      Height = 13
      Caption = #1074#1099#1093#1086#1076' '#1089#1074'.'
    end
    object Label23: TLabel
      Left = 235
      Top = 24
      Width = 7
      Height = 13
      Caption = #1057
    end
    object Label24: TLabel
      Left = 235
      Top = 40
      Width = 7
      Height = 13
      Caption = #1057
    end
    object Label25: TLabel
      Left = 235
      Top = 56
      Width = 7
      Height = 13
      Caption = #1057
    end
    object Label26: TLabel
      Left = 372
      Top = 40
      Width = 7
      Height = 13
      Caption = #1057
    end
    object Label27: TLabel
      Left = 372
      Top = 56
      Width = 11
      Height = 13
      Caption = '%'
    end
    object Panel21: TPanel
      Left = 8
      Top = 22
      Width = 128
      Height = 17
      BevelInner = bvLowered
      BevelOuter = bvLowered
      Caption = #1060#1041#1043#1057
      TabOrder = 0
    end
    object Panel22: TPanel
      Left = 8
      Top = 38
      Width = 128
      Height = 17
      BevelInner = bvLowered
      BevelOuter = bvLowered
      Caption = #1040#1044#1058
      TabOrder = 1
    end
    object Panel23: TPanel
      Left = 8
      Top = 54
      Width = 128
      Height = 18
      BevelInner = bvLowered
      BevelOuter = bvLowered
      Caption = #1054#1058#1043
      TabOrder = 2
    end
    object Panel24: TPanel
      Left = 166
      Top = 22
      Width = 24
      Height = 18
      BevelInner = bvLowered
      BevelOuter = bvLowered
      TabOrder = 3
    end
    object Panel25: TPanel
      Left = 189
      Top = 22
      Width = 42
      Height = 18
      BevelInner = bvLowered
      BevelOuter = bvLowered
      TabOrder = 4
    end
    object Panel26: TPanel
      Left = 166
      Top = 38
      Width = 24
      Height = 17
      BevelInner = bvLowered
      BevelOuter = bvLowered
      TabOrder = 5
    end
    object Panel27: TPanel
      Left = 189
      Top = 38
      Width = 42
      Height = 17
      BevelInner = bvLowered
      BevelOuter = bvLowered
      TabOrder = 6
    end
    object Panel28: TPanel
      Left = 305
      Top = 38
      Width = 24
      Height = 18
      BevelInner = bvLowered
      BevelOuter = bvLowered
      TabOrder = 7
    end
    object Panel29: TPanel
      Left = 328
      Top = 38
      Width = 42
      Height = 18
      BevelInner = bvLowered
      BevelOuter = bvLowered
      TabOrder = 8
    end
    object Panel30: TPanel
      Left = 166
      Top = 55
      Width = 24
      Height = 17
      BevelInner = bvLowered
      BevelOuter = bvLowered
      TabOrder = 9
    end
    object Panel31: TPanel
      Left = 189
      Top = 55
      Width = 42
      Height = 17
      BevelInner = bvLowered
      BevelOuter = bvLowered
      TabOrder = 10
    end
    object Panel32: TPanel
      Left = 305
      Top = 55
      Width = 24
      Height = 17
      BevelInner = bvLowered
      BevelOuter = bvLowered
      TabOrder = 11
    end
    object Panel33: TPanel
      Left = 328
      Top = 55
      Width = 42
      Height = 17
      BevelInner = bvLowered
      BevelOuter = bvLowered
      TabOrder = 12
    end
  end
  object Button3: TButton
    Left = 326
    Top = 335
    Width = 75
    Height = 25
    Caption = #1057#1086#1079#1076#1072#1090#1100
    TabOrder = 4
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 407
    Top = 335
    Width = 75
    Height = 25
    Caption = #1042#1099#1093#1086#1076
    TabOrder = 5
    OnClick = Button4Click
  end
  object GroupBox5: TGroupBox
    Left = 415
    Top = 8
    Width = 420
    Height = 233
    Caption = #1044#1072#1085#1085#1099#1077' '#1085#1072' '#1085#1072#1095#1072#1083#1086' '#1089#1084#1077#1085#1099':'
    TabOrder = 6
    object Label28: TLabel
      Left = 8
      Top = 16
      Width = 49
      Height = 13
      Caption = #1056#1077#1079'-'#1074#1091#1072#1088':'
    end
    object Label29: TLabel
      Left = 88
      Top = 16
      Width = 33
      Height = 13
      Caption = #1042#1079#1083#1080#1074':'
    end
    object Label30: TLabel
      Left = 140
      Top = 16
      Width = 37
      Height = 13
      Caption = #1054#1073#1098#1077#1084':'
    end
    object Label31: TLabel
      Left = 192
      Top = 16
      Width = 39
      Height = 13
      Caption = #1055#1083#1086#1090#1085'.:'
    end
    object Label32: TLabel
      Left = 242
      Top = 16
      Width = 44
      Height = 13
      Caption = #1058#1077#1084#1087'-'#1088#1072':'
    end
    object Label33: TLabel
      Left = 302
      Top = 16
      Width = 34
      Height = 13
      Caption = #1052#1072#1089#1089#1072':'
    end
    object Label34: TLabel
      Left = 346
      Top = 16
      Width = 58
      Height = 13
      Caption = #1055#1083#1086#1090#1085'. +20'
    end
    object Panel34: TPanel
      Left = 8
      Top = 35
      Width = 68
      Height = 17
      BevelInner = bvLowered
      BevelOuter = bvLowered
      Caption = #1045'1'
      TabOrder = 0
    end
    object Panel35: TPanel
      Left = 76
      Top = 35
      Width = 53
      Height = 17
      BevelInner = bvLowered
      BevelOuter = bvLowered
      TabOrder = 1
    end
    object Panel36: TPanel
      Left = 129
      Top = 35
      Width = 55
      Height = 17
      BevelInner = bvLowered
      BevelOuter = bvLowered
      TabOrder = 2
    end
    object Panel37: TPanel
      Left = 184
      Top = 35
      Width = 54
      Height = 17
      BevelInner = bvLowered
      BevelOuter = bvLowered
      TabOrder = 3
    end
    object Panel38: TPanel
      Left = 238
      Top = 35
      Width = 57
      Height = 17
      BevelInner = bvLowered
      BevelOuter = bvLowered
      TabOrder = 4
    end
    object Panel39: TPanel
      Left = 294
      Top = 35
      Width = 50
      Height = 17
      BevelInner = bvLowered
      BevelOuter = bvLowered
      TabOrder = 5
    end
    object Panel40: TPanel
      Left = 344
      Top = 35
      Width = 68
      Height = 17
      BevelInner = bvLowered
      BevelOuter = bvLowered
      TabOrder = 6
    end
    object Panel41: TPanel
      Left = 8
      Top = 52
      Width = 68
      Height = 17
      BevelInner = bvLowered
      BevelOuter = bvLowered
      Caption = #1056'25'
      TabOrder = 7
    end
    object Panel42: TPanel
      Left = 76
      Top = 52
      Width = 53
      Height = 17
      BevelInner = bvLowered
      BevelOuter = bvLowered
      TabOrder = 8
    end
    object Panel43: TPanel
      Left = 129
      Top = 52
      Width = 55
      Height = 17
      BevelInner = bvLowered
      BevelOuter = bvLowered
      TabOrder = 9
    end
    object Panel44: TPanel
      Left = 184
      Top = 52
      Width = 54
      Height = 17
      BevelInner = bvLowered
      BevelOuter = bvLowered
      TabOrder = 10
    end
    object Panel45: TPanel
      Left = 238
      Top = 52
      Width = 57
      Height = 17
      BevelInner = bvLowered
      BevelOuter = bvLowered
      TabOrder = 11
    end
    object Panel46: TPanel
      Left = 294
      Top = 52
      Width = 50
      Height = 17
      BevelInner = bvLowered
      BevelOuter = bvLowered
      TabOrder = 12
    end
    object Panel47: TPanel
      Left = 344
      Top = 52
      Width = 68
      Height = 17
      BevelInner = bvLowered
      BevelOuter = bvLowered
      TabOrder = 13
    end
    object Panel48: TPanel
      Left = 8
      Top = 69
      Width = 68
      Height = 17
      BevelInner = bvLowered
      BevelOuter = bvLowered
      TabOrder = 14
    end
    object Panel49: TPanel
      Left = 76
      Top = 69
      Width = 53
      Height = 17
      BevelInner = bvLowered
      BevelOuter = bvLowered
      TabOrder = 15
    end
    object Panel50: TPanel
      Left = 129
      Top = 69
      Width = 55
      Height = 17
      BevelInner = bvLowered
      BevelOuter = bvLowered
      TabOrder = 16
    end
    object Panel51: TPanel
      Left = 184
      Top = 69
      Width = 54
      Height = 17
      BevelInner = bvLowered
      BevelOuter = bvLowered
      TabOrder = 17
    end
    object Panel52: TPanel
      Left = 238
      Top = 69
      Width = 57
      Height = 17
      BevelInner = bvLowered
      BevelOuter = bvLowered
      TabOrder = 18
    end
    object Panel53: TPanel
      Left = 294
      Top = 69
      Width = 50
      Height = 17
      BevelInner = bvLowered
      BevelOuter = bvLowered
      TabOrder = 19
    end
    object Panel54: TPanel
      Left = 344
      Top = 69
      Width = 68
      Height = 17
      BevelInner = bvLowered
      BevelOuter = bvLowered
      TabOrder = 20
    end
    object Panel55: TPanel
      Left = 8
      Top = 86
      Width = 68
      Height = 17
      BevelInner = bvLowered
      BevelOuter = bvLowered
      TabOrder = 21
    end
    object Panel56: TPanel
      Left = 76
      Top = 86
      Width = 53
      Height = 17
      BevelInner = bvLowered
      BevelOuter = bvLowered
      TabOrder = 22
    end
    object Panel57: TPanel
      Left = 129
      Top = 86
      Width = 55
      Height = 17
      BevelInner = bvLowered
      BevelOuter = bvLowered
      TabOrder = 23
    end
    object Panel58: TPanel
      Left = 184
      Top = 86
      Width = 54
      Height = 17
      BevelInner = bvLowered
      BevelOuter = bvLowered
      TabOrder = 24
    end
    object Panel59: TPanel
      Left = 238
      Top = 86
      Width = 57
      Height = 17
      BevelInner = bvLowered
      BevelOuter = bvLowered
      TabOrder = 25
    end
    object Panel60: TPanel
      Left = 294
      Top = 86
      Width = 50
      Height = 17
      BevelInner = bvLowered
      BevelOuter = bvLowered
      TabOrder = 26
    end
    object Panel61: TPanel
      Left = 344
      Top = 86
      Width = 68
      Height = 17
      BevelInner = bvLowered
      BevelOuter = bvLowered
      TabOrder = 27
    end
    object Panel62: TPanel
      Left = 8
      Top = 103
      Width = 68
      Height = 17
      BevelInner = bvLowered
      BevelOuter = bvLowered
      TabOrder = 28
    end
    object Panel63: TPanel
      Left = 76
      Top = 103
      Width = 53
      Height = 17
      BevelInner = bvLowered
      BevelOuter = bvLowered
      TabOrder = 29
    end
    object Panel64: TPanel
      Left = 129
      Top = 103
      Width = 55
      Height = 17
      BevelInner = bvLowered
      BevelOuter = bvLowered
      TabOrder = 30
    end
    object Panel65: TPanel
      Left = 184
      Top = 103
      Width = 54
      Height = 17
      BevelInner = bvLowered
      BevelOuter = bvLowered
      TabOrder = 31
    end
    object Panel66: TPanel
      Left = 238
      Top = 103
      Width = 57
      Height = 17
      BevelInner = bvLowered
      BevelOuter = bvLowered
      TabOrder = 32
    end
    object Panel67: TPanel
      Left = 294
      Top = 103
      Width = 50
      Height = 17
      BevelInner = bvLowered
      BevelOuter = bvLowered
      TabOrder = 33
    end
    object Panel68: TPanel
      Left = 344
      Top = 103
      Width = 68
      Height = 17
      BevelInner = bvLowered
      BevelOuter = bvLowered
      TabOrder = 34
    end
    object Panel69: TPanel
      Left = 8
      Top = 120
      Width = 68
      Height = 17
      BevelInner = bvLowered
      BevelOuter = bvLowered
      TabOrder = 35
    end
    object Panel70: TPanel
      Left = 76
      Top = 120
      Width = 53
      Height = 17
      BevelInner = bvLowered
      BevelOuter = bvLowered
      TabOrder = 36
    end
    object Panel71: TPanel
      Left = 129
      Top = 120
      Width = 55
      Height = 17
      BevelInner = bvLowered
      BevelOuter = bvLowered
      TabOrder = 37
    end
    object Panel72: TPanel
      Left = 184
      Top = 120
      Width = 54
      Height = 17
      BevelInner = bvLowered
      BevelOuter = bvLowered
      TabOrder = 38
    end
    object Panel73: TPanel
      Left = 238
      Top = 120
      Width = 57
      Height = 17
      BevelInner = bvLowered
      BevelOuter = bvLowered
      TabOrder = 39
    end
    object Panel74: TPanel
      Left = 294
      Top = 120
      Width = 50
      Height = 17
      BevelInner = bvLowered
      BevelOuter = bvLowered
      TabOrder = 40
    end
    object Panel75: TPanel
      Left = 344
      Top = 120
      Width = 68
      Height = 17
      BevelInner = bvLowered
      BevelOuter = bvLowered
      TabOrder = 41
    end
    object Panel76: TPanel
      Left = 8
      Top = 137
      Width = 68
      Height = 17
      BevelInner = bvLowered
      BevelOuter = bvLowered
      TabOrder = 42
    end
    object Panel77: TPanel
      Left = 76
      Top = 137
      Width = 53
      Height = 17
      BevelInner = bvLowered
      BevelOuter = bvLowered
      TabOrder = 43
    end
    object Panel78: TPanel
      Left = 129
      Top = 137
      Width = 55
      Height = 17
      BevelInner = bvLowered
      BevelOuter = bvLowered
      TabOrder = 44
    end
    object Panel79: TPanel
      Left = 184
      Top = 137
      Width = 54
      Height = 17
      BevelInner = bvLowered
      BevelOuter = bvLowered
      TabOrder = 45
    end
    object Panel80: TPanel
      Left = 238
      Top = 137
      Width = 57
      Height = 17
      BevelInner = bvLowered
      BevelOuter = bvLowered
      TabOrder = 46
    end
    object Panel81: TPanel
      Left = 294
      Top = 137
      Width = 50
      Height = 17
      BevelInner = bvLowered
      BevelOuter = bvLowered
      TabOrder = 47
    end
    object Panel82: TPanel
      Left = 344
      Top = 137
      Width = 68
      Height = 17
      BevelInner = bvLowered
      BevelOuter = bvLowered
      TabOrder = 48
    end
    object Panel83: TPanel
      Left = 8
      Top = 154
      Width = 68
      Height = 17
      BevelInner = bvLowered
      BevelOuter = bvLowered
      TabOrder = 49
    end
    object Panel84: TPanel
      Left = 76
      Top = 154
      Width = 53
      Height = 17
      BevelInner = bvLowered
      BevelOuter = bvLowered
      TabOrder = 50
    end
    object Panel85: TPanel
      Left = 129
      Top = 154
      Width = 55
      Height = 17
      BevelInner = bvLowered
      BevelOuter = bvLowered
      TabOrder = 51
    end
    object Panel86: TPanel
      Left = 184
      Top = 154
      Width = 54
      Height = 17
      BevelInner = bvLowered
      BevelOuter = bvLowered
      TabOrder = 52
    end
    object Panel87: TPanel
      Left = 238
      Top = 154
      Width = 57
      Height = 17
      BevelInner = bvLowered
      BevelOuter = bvLowered
      TabOrder = 53
    end
    object Panel88: TPanel
      Left = 294
      Top = 154
      Width = 50
      Height = 17
      BevelInner = bvLowered
      BevelOuter = bvLowered
      TabOrder = 54
    end
    object Panel89: TPanel
      Left = 344
      Top = 154
      Width = 68
      Height = 17
      BevelInner = bvLowered
      BevelOuter = bvLowered
      TabOrder = 55
    end
    object Panel90: TPanel
      Left = 8
      Top = 171
      Width = 68
      Height = 17
      BevelInner = bvLowered
      BevelOuter = bvLowered
      TabOrder = 56
    end
    object Panel91: TPanel
      Left = 76
      Top = 171
      Width = 53
      Height = 17
      BevelInner = bvLowered
      BevelOuter = bvLowered
      TabOrder = 57
    end
    object Panel92: TPanel
      Left = 129
      Top = 171
      Width = 55
      Height = 17
      BevelInner = bvLowered
      BevelOuter = bvLowered
      TabOrder = 58
    end
    object Panel93: TPanel
      Left = 184
      Top = 171
      Width = 54
      Height = 17
      BevelInner = bvLowered
      BevelOuter = bvLowered
      TabOrder = 59
    end
    object Panel94: TPanel
      Left = 238
      Top = 171
      Width = 57
      Height = 17
      BevelInner = bvLowered
      BevelOuter = bvLowered
      TabOrder = 60
    end
    object Panel95: TPanel
      Left = 294
      Top = 171
      Width = 50
      Height = 17
      BevelInner = bvLowered
      BevelOuter = bvLowered
      TabOrder = 61
    end
    object Panel96: TPanel
      Left = 344
      Top = 171
      Width = 68
      Height = 17
      BevelInner = bvLowered
      BevelOuter = bvLowered
      TabOrder = 62
    end
    object Panel98: TPanel
      Left = 76
      Top = 188
      Width = 53
      Height = 17
      BevelInner = bvLowered
      BevelOuter = bvLowered
      TabOrder = 63
    end
    object Panel99: TPanel
      Left = 129
      Top = 188
      Width = 55
      Height = 17
      BevelInner = bvLowered
      BevelOuter = bvLowered
      TabOrder = 64
    end
    object Panel100: TPanel
      Left = 184
      Top = 188
      Width = 54
      Height = 17
      BevelInner = bvLowered
      BevelOuter = bvLowered
      TabOrder = 65
    end
    object Panel101: TPanel
      Left = 238
      Top = 188
      Width = 57
      Height = 17
      BevelInner = bvLowered
      BevelOuter = bvLowered
      TabOrder = 66
    end
    object Panel102: TPanel
      Left = 294
      Top = 188
      Width = 50
      Height = 17
      BevelInner = bvLowered
      BevelOuter = bvLowered
      TabOrder = 67
    end
    object Panel103: TPanel
      Left = 344
      Top = 188
      Width = 68
      Height = 17
      BevelInner = bvLowered
      BevelOuter = bvLowered
      TabOrder = 68
    end
    object Panel118: TPanel
      Left = 8
      Top = 188
      Width = 68
      Height = 17
      BevelInner = bvLowered
      BevelOuter = bvLowered
      Caption = #1045'3'
      TabOrder = 69
    end
    object Panel125: TPanel
      Left = 8
      Top = 205
      Width = 68
      Height = 17
      BevelInner = bvLowered
      BevelOuter = bvLowered
      Caption = #1074#1099#1082#1072#1095#1082#1072' '#1045'3'
      TabOrder = 70
    end
    object Panel126: TPanel
      Left = 76
      Top = 205
      Width = 53
      Height = 17
      BevelInner = bvLowered
      BevelOuter = bvLowered
      TabOrder = 71
    end
    object Panel127: TPanel
      Left = 129
      Top = 205
      Width = 55
      Height = 17
      BevelInner = bvLowered
      BevelOuter = bvLowered
      TabOrder = 72
    end
    object Panel128: TPanel
      Left = 184
      Top = 205
      Width = 54
      Height = 17
      BevelInner = bvLowered
      BevelOuter = bvLowered
      TabOrder = 73
    end
    object Panel129: TPanel
      Left = 238
      Top = 205
      Width = 57
      Height = 17
      BevelInner = bvLowered
      BevelOuter = bvLowered
      TabOrder = 74
    end
    object Panel130: TPanel
      Left = 294
      Top = 205
      Width = 50
      Height = 17
      BevelInner = bvLowered
      BevelOuter = bvLowered
      TabOrder = 75
    end
    object Panel131: TPanel
      Left = 344
      Top = 205
      Width = 68
      Height = 17
      BevelInner = bvLowered
      BevelOuter = bvLowered
      TabOrder = 76
    end
  end
end
