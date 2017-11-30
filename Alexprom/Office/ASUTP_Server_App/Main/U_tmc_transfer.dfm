object sirie_transfer: Tsirie_transfer
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #1055#1077#1088#1077#1084#1077#1097#1077#1085#1080#1077' '#1058#1052#1062
  ClientHeight = 422
  ClientWidth = 408
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
  object Label11: TLabel
    Left = 8
    Top = 344
    Width = 71
    Height = 13
    Caption = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081':'
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 201
    Height = 137
    Caption = #1056#1077#1079#1077#1088#1074#1091#1072#1088' '#1080#1089#1090#1086#1095#1085#1080#1082':'
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 48
      Width = 121
      Height = 13
      Caption = #1042#1079#1083#1080#1074' '#1076#1086' '#1087#1077#1088#1077#1084#1077#1097#1077#1085#1080#1103':'
    end
    object Label3: TLabel
      Left = 8
      Top = 91
      Width = 137
      Height = 13
      Caption = #1042#1079#1083#1080#1074' '#1087#1086#1089#1083#1077' '#1087#1077#1088#1077#1084#1077#1097#1077#1085#1080#1103':'
    end
    object MaskEdit3: TMaskEdit
      Left = 8
      Top = 110
      Width = 183
      Height = 21
      EditMask = '!99999;1; '
      MaxLength = 5
      TabOrder = 0
      Text = '     '
    end
    object source_tank: TDBLookupComboBox
      Left = 8
      Top = 21
      Width = 183
      Height = 21
      TabOrder = 1
      OnCloseUp = source_tankCloseUp
    end
    object DBEdit1: TDBEdit
      Left = 8
      Top = 64
      Width = 183
      Height = 21
      Enabled = False
      TabOrder = 2
    end
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 151
    Width = 201
    Height = 187
    Caption = #1056#1077#1079#1077#1088#1074#1091#1072#1088' '#1087#1088#1080#1077#1084#1085#1080#1082':'
    TabOrder = 1
    object Label2: TLabel
      Left = 8
      Top = 48
      Width = 121
      Height = 13
      Caption = #1042#1079#1083#1080#1074' '#1076#1086' '#1087#1077#1088#1077#1084#1077#1097#1077#1085#1080#1103':'
    end
    object Label4: TLabel
      Left = 8
      Top = 91
      Width = 137
      Height = 13
      Caption = #1042#1079#1083#1080#1074' '#1087#1086#1089#1083#1077' '#1087#1077#1088#1077#1084#1077#1097#1077#1085#1080#1103':'
    end
    object Label12: TLabel
      Left = 8
      Top = 136
      Width = 184
      Height = 13
      Caption = #1055#1083#1086#1090#1085#1086#1089#1090#1100' '#1087#1088#1080#1085#1080#1084#1072#1077#1084#1086#1075#1086' '#1087#1088#1086#1076#1091#1082#1090#1072':'
    end
    object MaskEdit4: TMaskEdit
      Left = 8
      Top = 107
      Width = 183
      Height = 21
      EditMask = '!99999;1; '
      MaxLength = 5
      TabOrder = 0
      Text = '     '
    end
    object destination_tank: TDBLookupComboBox
      Left = 8
      Top = 24
      Width = 183
      Height = 21
      TabOrder = 1
      OnCloseUp = destination_tankCloseUp
    end
    object DBEdit2: TDBEdit
      Left = 8
      Top = 64
      Width = 183
      Height = 21
      Enabled = False
      TabOrder = 2
    end
    object MaskEdit1: TMaskEdit
      Left = 8
      Top = 152
      Width = 175
      Height = 21
      Enabled = False
      EditMask = '!9,999;1; '
      MaxLength = 5
      TabOrder = 3
      Text = ' ,   '
      OnChange = MaskEdit1Change
    end
  end
  object GroupBox3: TGroupBox
    Left = 215
    Top = 8
    Width = 185
    Height = 330
    Caption = #1056#1077#1079#1091#1083#1100#1090#1072#1090#1099' '#1087#1077#1088#1077#1084#1077#1097#1077#1085#1080#1103':'
    TabOrder = 2
    object Label5: TLabel
      Left = 8
      Top = 20
      Width = 78
      Height = 13
      Caption = #1048#1079' '#1088#1077#1079#1077#1088#1074#1091#1072#1088#1072':'
    end
    object Label6: TLabel
      Left = 8
      Top = 80
      Width = 66
      Height = 13
      Caption = #1054#1090#1087#1088#1072#1074#1083#1077#1085#1086':'
    end
    object Label7: TLabel
      Left = 164
      Top = 80
      Width = 6
      Height = 13
      Caption = #1083
    end
    object Label8: TLabel
      Left = 8
      Top = 164
      Width = 72
      Height = 13
      Caption = #1042' '#1088#1077#1079#1077#1088#1074#1091#1072#1088#1077':'
    end
    object Label9: TLabel
      Left = 8
      Top = 226
      Width = 47
      Height = 13
      Caption = #1055#1088#1080#1085#1103#1090#1086':'
    end
    object Label10: TLabel
      Left = 164
      Top = 226
      Width = 6
      Height = 13
      Caption = #1083
    end
    object Label13: TLabel
      Left = 8
      Top = 100
      Width = 66
      Height = 13
      Caption = #1054#1090#1087#1088#1072#1074#1083#1077#1085#1086':'
    end
    object Label14: TLabel
      Left = 164
      Top = 100
      Width = 11
      Height = 13
      Caption = #1082#1075
    end
    object Label15: TLabel
      Left = 8
      Top = 246
      Width = 47
      Height = 13
      Caption = #1055#1088#1080#1085#1103#1090#1086':'
    end
    object Label16: TLabel
      Left = 164
      Top = 244
      Width = 11
      Height = 13
      Caption = #1082#1075
    end
    object Label17: TLabel
      Left = 8
      Top = 120
      Width = 52
      Height = 13
      Caption = #1054#1089#1090#1072#1083#1086#1089#1100':'
    end
    object Label18: TLabel
      Left = 164
      Top = 120
      Width = 6
      Height = 13
      Caption = #1083
    end
    object Label19: TLabel
      Left = 8
      Top = 266
      Width = 35
      Height = 13
      Caption = #1057#1090#1072#1083#1086':'
    end
    object Label20: TLabel
      Left = 164
      Top = 266
      Width = 6
      Height = 13
      Caption = #1083
    end
    object Label21: TLabel
      Left = 8
      Top = 286
      Width = 35
      Height = 13
      Caption = #1057#1090#1072#1083#1086':'
    end
    object Label22: TLabel
      Left = 164
      Top = 284
      Width = 11
      Height = 13
      Caption = #1082#1075
    end
    object Label23: TLabel
      Left = 8
      Top = 140
      Width = 52
      Height = 13
      Caption = #1054#1089#1090#1072#1083#1086#1089#1100':'
    end
    object Label24: TLabel
      Left = 164
      Top = 140
      Width = 11
      Height = 13
      Caption = #1082#1075
    end
    object Label25: TLabel
      Left = 8
      Top = 40
      Width = 30
      Height = 13
      Caption = #1041#1099#1083#1086':'
    end
    object Label26: TLabel
      Left = 8
      Top = 60
      Width = 30
      Height = 13
      Caption = #1041#1099#1083#1086':'
    end
    object Label27: TLabel
      Left = 164
      Top = 40
      Width = 6
      Height = 13
      Caption = #1083
    end
    object Label28: TLabel
      Left = 164
      Top = 60
      Width = 11
      Height = 13
      Caption = #1082#1075
    end
    object Label29: TLabel
      Left = 8
      Top = 185
      Width = 30
      Height = 13
      Caption = #1041#1099#1083#1086':'
    end
    object Label30: TLabel
      Left = 8
      Top = 205
      Width = 30
      Height = 13
      Caption = #1041#1099#1083#1086':'
    end
    object Label31: TLabel
      Left = 164
      Top = 185
      Width = 6
      Height = 13
      Caption = #1083
    end
    object Label32: TLabel
      Left = 164
      Top = 205
      Width = 11
      Height = 13
      Caption = #1082#1075
    end
    object Panel1: TPanel
      Left = 92
      Top = 17
      Width = 65
      Height = 20
      BevelInner = bvLowered
      BevelOuter = bvLowered
      Caption = '-'
      TabOrder = 0
    end
    object Panel2: TPanel
      Left = 92
      Top = 76
      Width = 65
      Height = 20
      BevelInner = bvLowered
      BevelOuter = bvLowered
      Caption = '-'
      TabOrder = 1
    end
    object Panel3: TPanel
      Left = 92
      Top = 161
      Width = 66
      Height = 20
      BevelInner = bvLowered
      BevelOuter = bvLowered
      Caption = '-'
      TabOrder = 2
    end
    object Panel4: TPanel
      Left = 92
      Top = 221
      Width = 66
      Height = 20
      BevelInner = bvLowered
      BevelOuter = bvLowered
      Caption = '-'
      TabOrder = 3
    end
    object Panel5: TPanel
      Left = 92
      Top = 96
      Width = 65
      Height = 20
      BevelInner = bvLowered
      BevelOuter = bvLowered
      Caption = '-'
      TabOrder = 4
    end
    object Panel6: TPanel
      Left = 92
      Top = 241
      Width = 66
      Height = 20
      BevelInner = bvLowered
      BevelOuter = bvLowered
      Caption = '-'
      TabOrder = 5
    end
    object Panel7: TPanel
      Left = 92
      Top = 116
      Width = 65
      Height = 20
      BevelInner = bvLowered
      BevelOuter = bvLowered
      Caption = '-'
      TabOrder = 6
    end
    object Panel8: TPanel
      Left = 92
      Top = 261
      Width = 66
      Height = 20
      BevelInner = bvLowered
      BevelOuter = bvLowered
      Caption = '-'
      TabOrder = 7
    end
    object Panel9: TPanel
      Left = 92
      Top = 281
      Width = 66
      Height = 20
      BevelInner = bvLowered
      BevelOuter = bvLowered
      Caption = '-'
      TabOrder = 8
    end
    object Panel10: TPanel
      Left = 92
      Top = 136
      Width = 65
      Height = 20
      BevelInner = bvLowered
      BevelOuter = bvLowered
      Caption = '-'
      TabOrder = 9
    end
    object Panel11: TPanel
      Left = 92
      Top = 36
      Width = 65
      Height = 20
      BevelInner = bvLowered
      BevelOuter = bvLowered
      Caption = '-'
      TabOrder = 10
    end
    object Panel12: TPanel
      Left = 92
      Top = 56
      Width = 65
      Height = 20
      BevelInner = bvLowered
      BevelOuter = bvLowered
      Caption = '-'
      TabOrder = 11
    end
    object Panel13: TPanel
      Left = 92
      Top = 181
      Width = 66
      Height = 20
      BevelInner = bvLowered
      BevelOuter = bvLowered
      Caption = '-'
      TabOrder = 12
    end
    object Panel14: TPanel
      Left = 92
      Top = 201
      Width = 66
      Height = 20
      BevelInner = bvLowered
      BevelOuter = bvLowered
      Caption = '-'
      TabOrder = 13
    end
  end
  object btn_transfer: TButton
    Left = 143
    Top = 390
    Width = 104
    Height = 25
    Caption = #1055#1077#1088#1077#1084#1077#1089#1090#1080#1090#1100
    TabOrder = 3
    OnClick = btn_transferClick
  end
  object btn_exit: TButton
    Left = 253
    Top = 390
    Width = 90
    Height = 25
    Caption = #1047#1072#1082#1088#1099#1090#1100
    TabOrder = 4
    OnClick = btn_exitClick
  end
  object Edit1: TEdit
    Left = 8
    Top = 363
    Width = 392
    Height = 21
    TabOrder = 5
  end
  object Button1: TButton
    Left = 62
    Top = 390
    Width = 75
    Height = 25
    Caption = #1042#1079#1083#1080#1074#1099
    TabOrder = 6
    OnClick = Button1Click
  end
end
