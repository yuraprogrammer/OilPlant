object input_Tank_Data: Tinput_Tank_Data
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #1048#1089#1093#1086#1076#1085#1099#1077' '#1076#1072#1085#1085#1099#1077' '#1087#1086' '#1088#1077#1079#1077#1088#1074#1091#1072#1088#1091
  ClientHeight = 239
  ClientWidth = 345
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
    Width = 329
    Height = 193
    Caption = 'GroupBox1'
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 16
      Width = 33
      Height = 13
      Caption = #1042#1079#1083#1080#1074':'
    end
    object Label2: TLabel
      Left = 118
      Top = 40
      Width = 12
      Height = 13
      Caption = #1084#1084
    end
    object Label3: TLabel
      Left = 8
      Top = 64
      Width = 37
      Height = 13
      Caption = #1054#1073#1098#1077#1084':'
    end
    object Label4: TLabel
      Left = 118
      Top = 90
      Width = 12
      Height = 13
      Caption = #1084'3'
    end
    object Label5: TLabel
      Left = 135
      Top = 16
      Width = 39
      Height = 13
      Caption = #1055#1083#1086#1090#1085'.:'
    end
    object Label6: TLabel
      Left = 199
      Top = 35
      Width = 27
      Height = 13
      Caption = #1082#1075'/'#1084'3'
    end
    object Label7: TLabel
      Left = 140
      Top = 64
      Width = 34
      Height = 13
      Caption = #1052#1072#1089#1089#1072':'
    end
    object Label8: TLabel
      Left = 296
      Top = 90
      Width = 11
      Height = 13
      Caption = #1082#1075
    end
    object Label9: TLabel
      Left = 8
      Top = 120
      Width = 70
      Height = 13
      Caption = #1058#1077#1084#1087#1077#1088#1072#1090#1091#1088#1072':'
    end
    object Label10: TLabel
      Left = 117
      Top = 142
      Width = 7
      Height = 13
      Caption = #1057
    end
    object Label11: TLabel
      Left = 140
      Top = 120
      Width = 54
      Height = 13
      Caption = #1052#1072#1090#1077#1088#1080#1072#1083':'
    end
    object Label12: TLabel
      Left = 232
      Top = 20
      Width = 54
      Height = 13
      Caption = #1055#1083#1086#1090#1085'. 20:'
    end
    object Label13: TLabel
      Left = 296
      Top = 39
      Width = 27
      Height = 13
      Caption = #1082#1075'/'#1084'3'
    end
    object MaskEdit1: TMaskEdit
      Left = 7
      Top = 35
      Width = 105
      Height = 21
      EditMask = '!99999;1; '
      MaxLength = 5
      TabOrder = 0
      Text = '     '
      OnChange = MaskEdit1Change
      OnExit = MaskEdit1Change
    end
    object Edit1: TEdit
      Left = 7
      Top = 83
      Width = 105
      Height = 21
      TabOrder = 1
      OnExit = Edit1Change
    end
    object MaskEdit2: TMaskEdit
      Left = 136
      Top = 35
      Width = 56
      Height = 21
      EditMask = '!9,9999;1; '
      MaxLength = 6
      TabOrder = 2
      Text = ' ,    '
      OnChange = MaskEdit2Change
      OnExit = MaskEdit2Change
    end
    object Edit2: TEdit
      Left = 136
      Top = 83
      Width = 154
      Height = 21
      TabOrder = 3
    end
    object Edit3: TEdit
      Left = 8
      Top = 139
      Width = 105
      Height = 21
      TabOrder = 4
      OnChange = Edit3Change
      OnExit = Edit3Change
    end
    object ComboBox1: TComboBox
      Left = 135
      Top = 139
      Width = 155
      Height = 22
      Style = csOwnerDrawFixed
      TabOrder = 5
    end
    object MaskEdit3: TMaskEdit
      Left = 232
      Top = 36
      Width = 56
      Height = 21
      Enabled = False
      EditMask = '!9,9999;1; '
      MaxLength = 6
      TabOrder = 6
      Text = ' ,    '
    end
    object CheckBox1: TCheckBox
      Left = 56
      Top = 168
      Width = 118
      Height = 17
      Caption = #1056#1077#1079#1077#1088#1074#1091#1072#1088' '#1074' '#1088#1072#1073#1086#1090#1077
      TabOrder = 7
    end
  end
  object Button1: TButton
    Left = 95
    Top = 207
    Width = 75
    Height = 25
    Caption = #1042#1074#1086#1076
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 176
    Top = 207
    Width = 75
    Height = 25
    Caption = #1042#1099#1093#1086#1076
    TabOrder = 2
    OnClick = Button2Click
  end
end
