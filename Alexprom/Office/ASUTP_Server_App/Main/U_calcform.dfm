object frmplotncalc: Tfrmplotncalc
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #1050#1072#1083#1100#1082#1091#1083#1103#1090#1086#1088' '#1087#1083#1086#1090#1085#1086#1089#1090#1077#1081
  ClientHeight = 161
  ClientWidth = 428
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
    Width = 412
    Height = 73
    Caption = #1048#1089#1093#1086#1076#1085#1099#1077' '#1076#1072#1085#1085#1099#1077':'
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 24
      Width = 84
      Height = 13
      Caption = #1058#1077#1084#1087#1077#1088#1072#1090#1091#1088#1072', '#1057':'
    end
    object Label2: TLabel
      Left = 135
      Top = 24
      Width = 92
      Height = 13
      Caption = #1055#1083#1086#1090#1085#1086#1089#1090#1100', '#1082#1075'/'#1084'3:'
    end
    object Label3: TLabel
      Left = 263
      Top = 24
      Width = 134
      Height = 13
      Caption = #1055#1083#1086#1090#1085#1086#1089#1090#1100' '#1087#1088#1080' 20 '#1057', '#1082#1075'/'#1084'3'
    end
    object Edit1: TEdit
      Left = 8
      Top = 42
      Width = 121
      Height = 21
      TabOrder = 0
      OnChange = Edit1Change
    end
    object MaskEdit1: TMaskEdit
      Left = 135
      Top = 43
      Width = 120
      Height = 21
      EditMask = '!9,9999;1; '
      MaxLength = 6
      TabOrder = 1
      Text = ' ,    '
      OnChange = MaskEdit1Change
    end
    object Panel1: TPanel
      Left = 263
      Top = 42
      Width = 138
      Height = 21
      BevelInner = bvLowered
      BevelOuter = bvLowered
      TabOrder = 2
    end
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 88
    Width = 412
    Height = 65
    Caption = #1056#1072#1089#1095#1077#1090':'
    TabOrder = 1
    object Label4: TLabel
      Left = 8
      Top = 16
      Width = 90
      Height = 13
      Caption = #1047#1072#1076#1072#1081#1090#1077' '#1090#1077#1084#1087'-'#1088#1091':'
    end
    object Label5: TLabel
      Left = 144
      Top = 16
      Width = 173
      Height = 13
      Caption = #1055#1083#1086#1090#1085#1086#1089#1090#1100' '#1087#1088#1080' '#1079#1072#1076#1072#1085#1085#1086#1081' '#1090#1077#1084#1087'-'#1088#1077':'
    end
    object Edit2: TEdit
      Left = 8
      Top = 32
      Width = 121
      Height = 21
      TabOrder = 0
      OnChange = Edit2Change
    end
    object Panel2: TPanel
      Left = 135
      Top = 32
      Width = 266
      Height = 20
      BevelInner = bvLowered
      BevelOuter = bvLowered
      TabOrder = 1
    end
  end
end
