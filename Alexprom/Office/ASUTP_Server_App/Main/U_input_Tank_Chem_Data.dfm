object input_Tank_chem_Data: Tinput_Tank_chem_Data
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #1048#1089#1093#1086#1076#1085#1099#1077' '#1076#1072#1085#1085#1099#1077' '#1087#1086' '#1088#1077#1079#1077#1088#1074#1091#1072#1088#1091
  ClientHeight = 160
  ClientWidth = 247
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
    Width = 233
    Height = 113
    Caption = 'GroupBox1'
    TabOrder = 0
    object Label9: TLabel
      Left = 9
      Top = 16
      Width = 74
      Height = 13
      Caption = #1058'-'#1088#1072' '#1074#1089#1087#1099#1096#1082#1080':'
    end
    object Label10: TLabel
      Left = 89
      Top = 38
      Width = 7
      Height = 13
      Caption = #1057
    end
    object Label1: TLabel
      Left = 112
      Top = 16
      Width = 89
      Height = 13
      Caption = #1058'-'#1088#1072' '#1087#1086#1084#1091#1090#1085#1077#1085#1080#1103':'
    end
    object Label2: TLabel
      Left = 208
      Top = 40
      Width = 7
      Height = 13
      Caption = #1057
    end
    object Label3: TLabel
      Left = 10
      Top = 62
      Width = 73
      Height = 13
      Caption = #1058'-'#1088#1072' '#1082#1086#1085'.'#1082#1080#1087'.:'
    end
    object Label4: TLabel
      Left = 93
      Top = 86
      Width = 7
      Height = 13
      Caption = #1057
    end
    object Label5: TLabel
      Left = 112
      Top = 64
      Width = 83
      Height = 13
      Caption = #1060#1080#1083#1100#1090#1088#1091#1077#1084#1086#1089#1090#1100':'
    end
    object Label6: TLabel
      Left = 208
      Top = 88
      Width = 7
      Height = 13
      Caption = #1057
    end
    object Edit3: TEdit
      Left = 9
      Top = 35
      Width = 74
      Height = 21
      TabOrder = 0
      OnExit = Edit3Change
    end
    object Edit1: TEdit
      Left = 112
      Top = 35
      Width = 89
      Height = 21
      TabOrder = 1
      OnExit = Edit1Change
    end
    object Edit2: TEdit
      Left = 14
      Top = 81
      Width = 73
      Height = 21
      TabOrder = 2
      OnExit = Edit2Change
    end
    object Edit4: TEdit
      Left = 113
      Top = 83
      Width = 89
      Height = 21
      TabOrder = 3
      OnExit = Edit4Change
    end
  end
  object Button1: TButton
    Left = 49
    Top = 127
    Width = 75
    Height = 25
    Caption = #1042#1074#1086#1076
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 130
    Top = 127
    Width = 75
    Height = 25
    Caption = #1042#1099#1093#1086#1076
    TabOrder = 2
    OnClick = Button2Click
  end
end
