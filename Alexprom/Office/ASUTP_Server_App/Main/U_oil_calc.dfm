object oil_calc: Toil_calc
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #1053#1077#1092#1090#1103#1085#1086#1081' '#1082#1072#1083#1100#1082#1091#1083#1103#1090#1086#1088
  ClientHeight = 183
  ClientWidth = 241
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
    Width = 225
    Height = 169
    Caption = #1056#1077#1079#1077#1088#1074#1091#1072#1088
    TabOrder = 0
    object Label1: TLabel
      Left = 7
      Top = 21
      Width = 110
      Height = 13
      Caption = #1042#1099#1073#1077#1088#1080#1090#1077' '#1088#1077#1079#1077#1088#1074#1091#1072#1088':'
    end
    object Label2: TLabel
      Left = 8
      Top = 72
      Width = 98
      Height = 13
      Caption = #1042#1074#1077#1076#1080#1090#1077' '#1074#1079#1083#1080#1074', '#1084#1084':'
    end
    object Label3: TLabel
      Left = 8
      Top = 120
      Width = 121
      Height = 13
      Caption = #1054#1073#1098#1077#1084' '#1074' '#1088#1077#1079#1077#1088#1074#1091#1072#1088#1077', '#1083':'
    end
    object MaskEdit1: TMaskEdit
      Left = 3
      Top = 91
      Width = 205
      Height = 21
      Enabled = False
      EditMask = '!99999;1; '
      MaxLength = 5
      TabOrder = 0
      Text = '0    '
      OnChange = MaskEdit1Change
    end
    object Panel1: TPanel
      Left = 8
      Top = 136
      Width = 208
      Height = 25
      BevelInner = bvLowered
      BevelOuter = bvLowered
      Caption = '0'
      TabOrder = 1
    end
    object tank_name: TDBLookupComboBox
      Left = 8
      Top = 40
      Width = 207
      Height = 21
      TabOrder = 2
      OnCloseUp = tank_nameCloseUp
    end
  end
end
