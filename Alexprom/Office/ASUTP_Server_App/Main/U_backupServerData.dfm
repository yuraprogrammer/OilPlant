object DBloadData: TDBloadData
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #1042#1086#1089#1089#1090#1072#1085#1086#1074#1083#1077#1085#1080#1077' '#1073#1072#1079#1099' '#1076#1072#1085#1085#1099#1093
  ClientHeight = 130
  ClientWidth = 570
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object RadioGroup1: TRadioGroup
    Left = 8
    Top = 8
    Width = 169
    Height = 81
    Caption = #1042#1099#1073#1077#1088#1080#1090#1077' '#1090#1080#1087' '#1079#1072#1075#1088#1091#1079#1082#1080' '#1041#1044':'
    ItemIndex = 0
    Items.Strings = (
      #1055#1086#1083#1085#1072#1103' '#1079#1072#1075#1088#1091#1079#1082#1072
      #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082#1080)
    TabOrder = 0
  end
  object Button1: TButton
    Left = 208
    Top = 96
    Width = 75
    Height = 25
    Caption = #1053#1072#1095#1072#1090#1100
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 288
    Top = 96
    Width = 75
    Height = 25
    Caption = #1042#1099#1093#1086#1076
    TabOrder = 2
    OnClick = Button2Click
  end
  object GroupBox1: TGroupBox
    Left = 184
    Top = 8
    Width = 378
    Height = 82
    Caption = #1055#1088#1086#1075#1088#1077#1089#1089' '#1079#1072#1075#1088#1091#1079#1082#1080':'
    TabOrder = 3
    object Label1: TLabel
      Left = 8
      Top = 22
      Width = 39
      Height = 13
      Caption = #1054#1073#1097#1080#1081':'
    end
    object Gauge1: TGauge
      Left = 53
      Top = 16
      Width = 316
      Height = 25
      Progress = 0
    end
    object Label2: TLabel
      Left = 8
      Top = 52
      Width = 43
      Height = 13
      Caption = #1054#1073#1098#1077#1082#1090':'
    end
    object Gauge2: TGauge
      Left = 53
      Top = 47
      Width = 316
      Height = 25
      Progress = 0
    end
  end
  object ADO_tt: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=MSDASQL.1;Password=tsp;Persist Security Info=True;User ' +
      'ID=tsp;Data Source=tsp_client'
    LoginPrompt = False
    Left = 104
    Top = 56
  end
  object ADO_sql: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=27121979;Persist Security Info=True' +
      ';User ID=db_dev;Initial Catalog=Alexprom_ASUTP;Data Source=R1'
    LoginPrompt = False
    Mode = cmReadWrite
    Provider = 'SQLOLEDB.1'
    Left = 136
    Top = 56
  end
end
