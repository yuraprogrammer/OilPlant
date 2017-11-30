object frmNewWorkTask: TfrmNewWorkTask
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #1053#1086#1074#1086#1077' '#1079#1072#1076#1072#1085#1080#1077' '#1085#1072' '#1087#1077#1088#1077#1088#1072#1073#1086#1090#1082#1091
  ClientHeight = 167
  ClientWidth = 311
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 298
    Top = 28
    Width = 7
    Height = 13
    Caption = 'C'
  end
  object Label2: TLabel
    Left = 298
    Top = 49
    Width = 7
    Height = 13
    Caption = 'C'
  end
  object Label3: TLabel
    Left = 298
    Top = 70
    Width = 7
    Height = 13
    Caption = 'C'
  end
  object Label4: TLabel
    Left = 298
    Top = 91
    Width = 7
    Height = 13
    Caption = 'C'
  end
  object Label5: TLabel
    Left = 298
    Top = 112
    Width = 7
    Height = 13
    Caption = 'C'
  end
  object Label6: TLabel
    Left = 24
    Top = 8
    Width = 44
    Height = 13
    Caption = #1055#1088#1086#1076#1091#1082#1090
  end
  object Label7: TLabel
    Left = 101
    Top = 8
    Width = 35
    Height = 13
    Caption = #1055#1072#1088#1072#1084'.'
  end
  object Label8: TLabel
    Left = 161
    Top = 8
    Width = 24
    Height = 13
    Caption = #1047#1085#1072#1082
  end
  object Label9: TLabel
    Left = 232
    Top = 8
    Width = 48
    Height = 13
    Caption = #1047#1085#1072#1095#1077#1085#1080#1077
  end
  object Panel1: TPanel
    Left = 8
    Top = 24
    Width = 89
    Height = 21
    BevelInner = bvLowered
    BevelOuter = bvLowered
    Caption = #1060#1041#1043#1057
    TabOrder = 0
  end
  object Panel2: TPanel
    Left = 97
    Top = 24
    Width = 44
    Height = 21
    BevelInner = bvLowered
    BevelOuter = bvLowered
    Caption = 't'#1082#1082
    TabOrder = 1
  end
  object ComboBox1: TComboBox
    Left = 141
    Top = 24
    Width = 87
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    ItemIndex = 0
    TabOrder = 2
    Text = '='
    Items.Strings = (
      '='
      '<'
      '>'
      '>='
      '<=')
  end
  object Panel3: TPanel
    Left = 8
    Top = 45
    Width = 89
    Height = 42
    BevelInner = bvLowered
    BevelOuter = bvLowered
    Caption = #1040#1044#1058
    TabOrder = 3
  end
  object Panel4: TPanel
    Left = 97
    Top = 45
    Width = 44
    Height = 21
    BevelInner = bvLowered
    BevelOuter = bvLowered
    Caption = 't'#1074#1089#1087
    TabOrder = 4
  end
  object ComboBox2: TComboBox
    Left = 141
    Top = 45
    Width = 87
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    ItemIndex = 0
    TabOrder = 5
    Text = '='
    Items.Strings = (
      '='
      '<'
      '>'
      '>='
      '<=')
  end
  object Panel5: TPanel
    Left = 97
    Top = 66
    Width = 44
    Height = 21
    BevelInner = bvLowered
    BevelOuter = bvLowered
    Caption = 't'#1087#1086#1084
    TabOrder = 6
  end
  object MaskEdit1: TMaskEdit
    Left = 227
    Top = 24
    Width = 64
    Height = 21
    EditMask = '!999;1; '
    MaxLength = 3
    TabOrder = 7
    Text = '   '
    OnChange = MaskEdit1Change
    OnExit = MaskEdit1Change
  end
  object MaskEdit2: TMaskEdit
    Left = 227
    Top = 45
    Width = 64
    Height = 21
    EditMask = '!999;1; '
    MaxLength = 3
    TabOrder = 8
    Text = '   '
    OnChange = MaskEdit2Change
    OnExit = MaskEdit2Change
  end
  object MaskEdit3: TMaskEdit
    Left = 227
    Top = 66
    Width = 64
    Height = 21
    EditMask = '!999;1; '
    MaxLength = 3
    TabOrder = 9
    Text = '   '
    OnChange = MaskEdit3Change
    OnExit = MaskEdit3Change
  end
  object MaskEdit4: TMaskEdit
    Left = 227
    Top = 87
    Width = 64
    Height = 21
    EditMask = '!999;1; '
    MaxLength = 3
    TabOrder = 10
    Text = '   '
    OnChange = MaskEdit4Change
    OnExit = MaskEdit4Change
  end
  object ComboBox3: TComboBox
    Left = 141
    Top = 66
    Width = 87
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    ItemIndex = 0
    TabOrder = 11
    Text = '='
    Items.Strings = (
      '='
      '<'
      '>'
      '>='
      '<='
      '')
  end
  object ComboBox4: TComboBox
    Left = 141
    Top = 87
    Width = 87
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    ItemIndex = 0
    TabOrder = 12
    Text = '='
    Items.Strings = (
      '='
      '<'
      '>'
      '<='
      '>=')
  end
  object Panel6: TPanel
    Left = 8
    Top = 87
    Width = 89
    Height = 21
    BevelInner = bvLowered
    BevelOuter = bvLowered
    Caption = #1054#1058#1043
    TabOrder = 13
  end
  object Panel7: TPanel
    Left = 97
    Top = 87
    Width = 44
    Height = 21
    BevelInner = bvLowered
    BevelOuter = bvLowered
    Caption = 't'#1074#1089#1087
    TabOrder = 14
  end
  object Button1: TButton
    Left = 80
    Top = 135
    Width = 75
    Height = 25
    Caption = #1057#1086#1079#1076#1072#1090#1100
    TabOrder = 15
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 161
    Top = 134
    Width = 75
    Height = 25
    Caption = #1042#1099#1093#1086#1076
    TabOrder = 16
    OnClick = Button2Click
  end
  object Panel8: TPanel
    Left = 97
    Top = 108
    Width = 44
    Height = 21
    BevelInner = bvLowered
    BevelOuter = bvLowered
    Caption = #1074#1099#1093'. '#1089#1074
    TabOrder = 17
  end
  object ComboBox5: TComboBox
    Left = 141
    Top = 108
    Width = 87
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    ItemIndex = 0
    TabOrder = 18
    Text = '='
    Items.Strings = (
      '='
      '<'
      '>'
      '<='
      '>=')
  end
  object MaskEdit5: TMaskEdit
    Left = 227
    Top = 108
    Width = 64
    Height = 21
    EditMask = '!999;1; '
    MaxLength = 3
    TabOrder = 19
    Text = '   '
    OnChange = MaskEdit5Change
    OnExit = MaskEdit5Change
  end
end
