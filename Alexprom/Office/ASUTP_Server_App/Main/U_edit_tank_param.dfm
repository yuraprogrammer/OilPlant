object edit_tank_param: Tedit_tank_param
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099' '#1088#1077#1079#1077#1074#1091#1072#1088#1072
  ClientHeight = 120
  ClientWidth = 529
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 513
    Height = 73
    Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099' '#1088#1077#1079#1077#1088#1074#1091#1072#1088#1072':'
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 24
      Width = 77
      Height = 13
      Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077':'
    end
    object Label2: TLabel
      Left = 138
      Top = 24
      Width = 79
      Height = 13
      Caption = #1042#1099#1089#1086#1090#1072' '#1082#1086#1085#1091#1089#1072':'
    end
    object Label3: TLabel
      Left = 262
      Top = 24
      Width = 36
      Height = 13
      Caption = #1044#1083#1080#1085#1072':'
    end
    object Label4: TLabel
      Left = 388
      Top = 24
      Width = 110
      Height = 13
      Caption = #1042#1085#1091#1090#1088#1077#1085#1085#1080#1081' '#1076#1080#1072#1084#1077#1090#1088':'
    end
    object Edit1: TEdit
      Left = 8
      Top = 43
      Width = 121
      Height = 21
      TabOrder = 0
      OnChange = Edit1Change
    end
    object MaskEdit1: TMaskEdit
      Left = 136
      Top = 43
      Width = 120
      Height = 21
      EditMask = '!9999;1; '
      MaxLength = 4
      TabOrder = 1
      Text = '    '
      OnChange = MaskEdit1Change
    end
    object MaskEdit2: TMaskEdit
      Left = 262
      Top = 43
      Width = 120
      Height = 21
      EditMask = '!9999;1; '
      MaxLength = 4
      TabOrder = 2
      Text = '    '
      OnChange = MaskEdit2Change
    end
    object MaskEdit3: TMaskEdit
      Left = 388
      Top = 43
      Width = 118
      Height = 21
      EditMask = '!9999;1; '
      MaxLength = 4
      TabOrder = 3
      Text = '    '
      OnChange = MaskEdit3Change
    end
  end
  object Button1: TButton
    Left = 176
    Top = 88
    Width = 75
    Height = 25
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 256
    Top = 88
    Width = 75
    Height = 25
    Caption = #1042#1099#1093#1086#1076
    TabOrder = 2
    OnClick = Button2Click
  end
end
