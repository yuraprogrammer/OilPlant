object grad_table_load_form: Tgrad_table_load_form
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #1047#1072#1075#1088#1091#1079#1082#1072' '#1075#1088#1072#1076#1091#1080#1088#1086#1074#1086#1095#1085#1099#1093' '#1090#1072#1073#1083#1080#1094
  ClientHeight = 581
  ClientWidth = 441
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
  object Label7: TLabel
    Left = 8
    Top = 8
    Width = 118
    Height = 13
    Caption = #1042#1099#1073#1077#1088#1080#1090#1077' '#1088#1077#1079#1077#1088#1074#1091#1072#1088#1099':'
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 400
    Width = 425
    Height = 145
    Caption = #1055#1088#1086#1075#1088#1077#1089#1089' '#1079#1072#1075#1088#1091#1079#1082#1080' '#1076#1072#1085#1085#1099#1093
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 16
      Width = 86
      Height = 13
      Caption = #1044#1083#1103' '#1088#1077#1079#1077#1088#1074#1091#1072#1088#1072':'
    end
    object Label2: TLabel
      Left = 8
      Top = 64
      Width = 39
      Height = 13
      Caption = #1054#1073#1097#1080#1081':'
    end
    object Gauge1: TGauge
      Left = 8
      Top = 34
      Width = 409
      Height = 24
      Progress = 0
    end
    object Gauge2: TGauge
      Left = 8
      Top = 83
      Width = 409
      Height = 24
      Progress = 0
    end
    object Label3: TLabel
      Left = 8
      Top = 120
      Width = 140
      Height = 13
      Caption = #1042#1099#1087#1086#1083#1085#1103#1077#1090#1089#1103' '#1079#1072#1075#1088#1091#1079#1082#1072' '#1076#1083#1103' '
    end
    object Label4: TLabel
      Left = 154
      Top = 120
      Width = 12
      Height = 13
      Caption = '00'
    end
    object Label5: TLabel
      Left = 176
      Top = 120
      Width = 73
      Height = 13
      Caption = #1088#1077#1079#1077#1088#1074#1091#1072#1088#1072' '#1080#1079
    end
    object Label6: TLabel
      Left = 255
      Top = 120
      Width = 12
      Height = 13
      Caption = '00'
    end
  end
  object Button1: TButton
    Left = 128
    Top = 551
    Width = 75
    Height = 25
    Caption = #1053#1072#1095#1072#1090#1100
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 208
    Top = 551
    Width = 75
    Height = 25
    Caption = #1042#1099#1093#1086#1076
    TabOrder = 2
    OnClick = Button2Click
  end
  object CheckListBox1: TCheckListBox
    Left = 8
    Top = 24
    Width = 425
    Height = 370
    Columns = 5
    ItemHeight = 13
    TabOrder = 3
  end
end
