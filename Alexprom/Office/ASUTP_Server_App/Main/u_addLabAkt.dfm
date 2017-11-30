object frmAddLabAkt: TfrmAddLabAkt
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #1057#1086#1079#1076#1072#1090#1100' '#1072#1082#1090' '#1087#1088#1080#1077#1084#1082#1080' '#1085#1077#1092#1090#1077#1087#1088#1086#1076#1091#1082#1090#1086#1074
  ClientHeight = 526
  ClientWidth = 426
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
  object Label1: TLabel
    Left = 8
    Top = 56
    Width = 44
    Height = 13
    Caption = #8470' '#1072#1082#1090#1072':'
  end
  object Label2: TLabel
    Left = 192
    Top = 56
    Width = 30
    Height = 13
    Caption = #1044#1072#1090#1072':'
  end
  object Label3: TLabel
    Left = 8
    Top = 88
    Width = 54
    Height = 13
    Caption = #1040#1082#1090#1099' '#1058#1057#1055':'
  end
  object Label16: TLabel
    Left = 8
    Top = 445
    Width = 46
    Height = 13
    Caption = #1053#1072#1095'. '#1058#1057#1055
  end
  object Label17: TLabel
    Left = 144
    Top = 445
    Width = 73
    Height = 13
    Caption = #1054#1087#1077#1088#1072#1090#1086#1088' '#1058#1057#1055
  end
  object Label18: TLabel
    Left = 278
    Top = 445
    Width = 53
    Height = 13
    Caption = #1051#1072#1073#1086#1088#1072#1085#1090':'
  end
  object Panel1: TPanel
    Left = 56
    Top = 56
    Width = 129
    Height = 20
    BevelInner = bvLowered
    TabOrder = 0
  end
  object DateTimePicker1: TDateTimePicker
    Left = 232
    Top = 56
    Width = 186
    Height = 21
    Date = 40343.584521840280000000
    Time = 40343.584521840280000000
    TabOrder = 1
    OnChange = DateTimePicker1Change
  end
  object RadioGroup1: TRadioGroup
    Left = 6
    Top = 8
    Width = 412
    Height = 33
    Caption = #1058#1080#1087' '#1072#1082#1090#1072':'
    Columns = 2
    ItemIndex = 0
    Items.Strings = (
      #1057#1072#1084#1086#1089#1090#1086#1103#1090#1077#1083#1100#1085#1099#1081
      #1055#1088#1080#1074#1103#1079#1082#1072' '#1082' '#1058#1057#1055)
    TabOrder = 2
    OnClick = RadioGroup1Click
  end
  object ListView1: TListView
    Left = 8
    Top = 104
    Width = 412
    Height = 137
    Columns = <
      item
        Caption = #8470' '#1072#1082#1090#1072
        Width = 55
      end
      item
        Caption = #1044#1072#1090#1072
      end
      item
        Caption = #1055#1088#1080#1085#1080#1084#1072#1077#1084#1099#1081' '#1058#1052#1062
        Width = 110
      end
      item
        Caption = #1050#1072#1083#1080#1073#1088'.'
        Width = 55
      end
      item
        AutoSize = True
        Caption = #1088', '#1082#1075'/'#1084'3'
      end
      item
        Caption = #1042#1077#1089', '#1082#1075
      end
      item
        Caption = 't, C'
        Width = 30
      end>
    GridLines = True
    ReadOnly = True
    RowSelect = True
    TabOrder = 3
    ViewStyle = vsReport
    OnSelectItem = ListView1SelectItem
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 247
    Width = 201
    Height = 192
    Caption = #1055#1086' '#1076#1086#1082#1091#1084#1077#1085#1090#1072#1084':'
    TabOrder = 4
    object Label4: TLabel
      Left = 9
      Top = 64
      Width = 47
      Height = 13
      Caption = #1059#1088#1086#1074#1077#1085#1100':'
    end
    object Label5: TLabel
      Left = 9
      Top = 84
      Width = 70
      Height = 13
      Caption = #1058#1077#1084#1087#1077#1088#1072#1090#1091#1088#1072':'
    end
    object Label6: TLabel
      Left = 9
      Top = 104
      Width = 58
      Height = 13
      Caption = #1055#1083#1086#1090#1085#1086#1089#1090#1100':'
    end
    object Label7: TLabel
      Left = 9
      Top = 124
      Width = 48
      Height = 13
      Caption = #1042#1086#1076#1072', '#1084#1084':'
    end
    object Label8: TLabel
      Left = 9
      Top = 144
      Width = 47
      Height = 13
      Caption = #1042#1086#1076#1072', '#1082#1075':'
    end
    object Label9: TLabel
      Left = 9
      Top = 163
      Width = 39
      Height = 13
      Caption = #1042#1077#1089', '#1082#1075':'
    end
    object Label19: TLabel
      Left = 9
      Top = 24
      Width = 26
      Height = 13
      Caption = #1058#1052#1062':'
    end
    object Label21: TLabel
      Left = 9
      Top = 42
      Width = 70
      Height = 13
      Caption = #1054#1088#1075#1072#1085#1080#1079#1072#1094#1080#1103':'
    end
    object MaskEdit1: TMaskEdit
      Left = 85
      Top = 61
      Width = 105
      Height = 21
      EditMask = '!99999;1; '
      MaxLength = 5
      TabOrder = 0
      Text = '     '
      OnChange = MaskEdit1Change
    end
    object MaskEdit2: TMaskEdit
      Left = 85
      Top = 81
      Width = 105
      Height = 21
      EditMask = '!999,9;1; '
      MaxLength = 5
      TabOrder = 1
      Text = '   , '
      OnChange = MaskEdit2Change
    end
    object MaskEdit3: TMaskEdit
      Left = 85
      Top = 101
      Width = 105
      Height = 21
      EditMask = '!0,999;1; '
      MaxLength = 5
      TabOrder = 2
      Text = ' ,   '
      OnChange = MaskEdit3Change
    end
    object MaskEdit4: TMaskEdit
      Left = 85
      Top = 121
      Width = 105
      Height = 21
      EditMask = '!9999;1; '
      MaxLength = 4
      TabOrder = 3
      Text = '    '
      OnChange = MaskEdit4Change
    end
    object MaskEdit5: TMaskEdit
      Left = 85
      Top = 141
      Width = 105
      Height = 21
      EditMask = '!9999;1; '
      MaxLength = 4
      TabOrder = 4
      Text = '    '
      OnChange = MaskEdit5Change
    end
    object MaskEdit6: TMaskEdit
      Left = 85
      Top = 161
      Width = 105
      Height = 21
      EditMask = '!99999;1; '
      MaxLength = 5
      TabOrder = 5
      Text = '     '
      OnChange = MaskEdit6Change
    end
    object TMC_Box: TComboBox
      Left = 85
      Top = 21
      Width = 105
      Height = 21
      TabOrder = 6
      OnChange = TMC_BoxChange
    end
    object ORG_Box: TComboBox
      Left = 85
      Top = 41
      Width = 105
      Height = 21
      TabOrder = 7
      OnChange = ORG_BoxChange
    end
  end
  object GroupBox2: TGroupBox
    Left = 215
    Top = 246
    Width = 205
    Height = 193
    Caption = #1055#1086' '#1092#1072#1082#1090#1091':'
    Ctl3D = True
    ParentCtl3D = False
    TabOrder = 5
    object Label10: TLabel
      Left = 9
      Top = 164
      Width = 39
      Height = 13
      Caption = #1042#1077#1089', '#1082#1075':'
    end
    object Label11: TLabel
      Left = 9
      Top = 145
      Width = 47
      Height = 13
      Caption = #1042#1086#1076#1072', '#1082#1075':'
    end
    object Label12: TLabel
      Left = 9
      Top = 125
      Width = 48
      Height = 13
      Caption = #1042#1086#1076#1072', '#1084#1084':'
    end
    object Label13: TLabel
      Left = 9
      Top = 105
      Width = 58
      Height = 13
      Caption = #1055#1083#1086#1090#1085#1086#1089#1090#1100':'
    end
    object Label14: TLabel
      Left = 9
      Top = 85
      Width = 70
      Height = 13
      Caption = #1058#1077#1084#1087#1077#1088#1072#1090#1091#1088#1072':'
    end
    object Label15: TLabel
      Left = 9
      Top = 66
      Width = 47
      Height = 13
      Caption = #1059#1088#1086#1074#1077#1085#1100':'
    end
    object Label20: TLabel
      Left = 8
      Top = 23
      Width = 26
      Height = 13
      Caption = #1058#1052#1062':'
    end
    object Label22: TLabel
      Left = 9
      Top = 42
      Width = 70
      Height = 13
      Caption = #1054#1088#1075#1072#1085#1080#1079#1072#1094#1080#1103':'
    end
    object MaskEdit7: TMaskEdit
      Left = 85
      Top = 62
      Width = 105
      Height = 21
      EditMask = '!99999;1; '
      MaxLength = 5
      TabOrder = 0
      Text = '     '
      OnChange = MaskEdit7Change
    end
    object MaskEdit8: TMaskEdit
      Left = 85
      Top = 82
      Width = 105
      Height = 21
      EditMask = '!999,9;1; '
      MaxLength = 5
      TabOrder = 1
      Text = '   , '
      OnChange = MaskEdit8Change
    end
    object MaskEdit9: TMaskEdit
      Left = 85
      Top = 102
      Width = 105
      Height = 21
      EditMask = '!0,999;1; '
      MaxLength = 5
      TabOrder = 2
      Text = ' ,   '
      OnChange = MaskEdit9Change
    end
    object MaskEdit10: TMaskEdit
      Left = 85
      Top = 122
      Width = 105
      Height = 21
      EditMask = '!9999;1; '
      MaxLength = 4
      TabOrder = 3
      Text = '    '
      OnChange = MaskEdit10Change
    end
    object MaskEdit11: TMaskEdit
      Left = 85
      Top = 142
      Width = 105
      Height = 21
      EditMask = '!9999;1; '
      MaxLength = 4
      TabOrder = 4
      Text = '    '
      OnChange = MaskEdit11Change
    end
    object MaskEdit12: TMaskEdit
      Left = 85
      Top = 162
      Width = 105
      Height = 21
      EditMask = '!99999;1; '
      MaxLength = 5
      TabOrder = 5
      Text = '     '
      OnChange = MaskEdit12Change
    end
    object ATMC_Box: TComboBox
      Left = 85
      Top = 20
      Width = 105
      Height = 21
      TabOrder = 6
      OnChange = ATMC_BoxChange
    end
    object AORG_Box: TComboBox
      Left = 85
      Top = 40
      Width = 105
      Height = 21
      TabOrder = 7
      OnChange = AORG_BoxChange
    end
  end
  object Button1: TButton
    Left = 267
    Top = 491
    Width = 75
    Height = 25
    Caption = #1057#1086#1079#1076#1072#1090#1100
    Enabled = False
    TabOrder = 6
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 348
    Top = 491
    Width = 75
    Height = 25
    Caption = #1042#1099#1093#1086#1076
    TabOrder = 7
    OnClick = Button2Click
  end
  object ComboBox1: TComboBox
    Left = 8
    Top = 464
    Width = 130
    Height = 21
    AutoComplete = False
    TabOrder = 8
    OnChange = ComboBox1Change
  end
  object ComboBox2: TComboBox
    Left = 144
    Top = 464
    Width = 130
    Height = 21
    AutoComplete = False
    TabOrder = 9
    OnChange = ComboBox2Change
  end
  object ComboBox3: TComboBox
    Left = 280
    Top = 464
    Width = 138
    Height = 21
    AutoComplete = False
    TabOrder = 10
    OnChange = ComboBox3Change
  end
end
