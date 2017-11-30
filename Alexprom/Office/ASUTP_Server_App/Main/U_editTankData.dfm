object editTankData: TeditTankData
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'editTankData'
  ClientHeight = 192
  ClientWidth = 392
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
    Height = 145
    Caption = #1058#1077#1082#1091#1097#1080#1077' '#1079#1085#1072#1095#1077#1085#1080#1103
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 16
      Width = 125
      Height = 13
      Caption = #1052#1072#1090#1077#1088#1080#1072#1083' '#1074' '#1088#1077#1079#1077#1088#1074#1091#1072#1088#1077':'
    end
    object Label2: TLabel
      Left = 8
      Top = 56
      Width = 58
      Height = 13
      Caption = #1055#1083#1086#1090#1085#1086#1089#1090#1100':'
    end
    object Label3: TLabel
      Left = 8
      Top = 96
      Width = 70
      Height = 13
      Caption = #1058#1077#1084#1087#1077#1088#1072#1090#1091#1088#1072':'
    end
    object DBEdit1: TDBEdit
      Left = 8
      Top = 32
      Width = 169
      Height = 21
      TabOrder = 0
    end
    object DBEdit2: TDBEdit
      Left = 8
      Top = 70
      Width = 169
      Height = 21
      Enabled = False
      TabOrder = 1
    end
    object DBEdit3: TDBEdit
      Left = 8
      Top = 112
      Width = 169
      Height = 21
      Enabled = False
      TabOrder = 2
    end
  end
  object GroupBox2: TGroupBox
    Left = 199
    Top = 8
    Width = 185
    Height = 145
    Caption = #1058#1077#1082#1091#1097#1080#1077' '#1079#1085#1072#1095#1077#1085#1080#1103
    TabOrder = 1
    object Label4: TLabel
      Left = 8
      Top = 16
      Width = 125
      Height = 13
      Caption = #1052#1072#1090#1077#1088#1080#1072#1083' '#1074' '#1088#1077#1079#1077#1088#1074#1091#1072#1088#1077':'
    end
    object Label5: TLabel
      Left = 8
      Top = 56
      Width = 58
      Height = 13
      Caption = #1055#1083#1086#1090#1085#1086#1089#1090#1100':'
    end
    object Label6: TLabel
      Left = 8
      Top = 96
      Width = 70
      Height = 13
      Caption = #1058#1077#1084#1087#1077#1088#1072#1090#1091#1088#1072':'
    end
    object ComboBox1: TComboBox
      Left = 8
      Top = 32
      Width = 169
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 0
    end
    object MaskEdit1: TMaskEdit
      Left = 8
      Top = 72
      Width = 166
      Height = 21
      EditMask = '!9,9999;1; '
      MaxLength = 6
      TabOrder = 1
      Text = ' ,    '
    end
    object Edit1: TEdit
      Left = 8
      Top = 112
      Width = 169
      Height = 21
      TabOrder = 2
    end
  end
  object Button1: TButton
    Left = 119
    Top = 159
    Width = 75
    Height = 25
    Caption = #1048#1079#1084#1077#1085#1080#1090#1100
    Default = True
    TabOrder = 2
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 200
    Top = 160
    Width = 75
    Height = 25
    Caption = #1042#1099#1093#1086#1076
    TabOrder = 3
    OnClick = Button2Click
  end
end
