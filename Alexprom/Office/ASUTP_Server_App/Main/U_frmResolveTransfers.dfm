object frmResolveTransfers: TfrmResolveTransfers
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #1055#1077#1088#1077#1089#1095#1077#1090' '#1090#1088#1072#1085#1089#1092#1077#1088#1086#1074
  ClientHeight = 199
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
    Width = 194
    Height = 73
    Caption = #1042#1099#1073#1077#1088#1080#1090#1077' '#1084#1077#1089#1103#1094' '#1080' '#1075#1086#1076':'
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 21
      Width = 35
      Height = 13
      Caption = #1052#1077#1089#1103#1094':'
    end
    object Label2: TLabel
      Left = 121
      Top = 21
      Width = 23
      Height = 13
      Caption = #1043#1086#1076':'
    end
    object ComboBox1: TComboBox
      Left = 8
      Top = 40
      Width = 107
      Height = 21
      Style = csDropDownList
      ItemIndex = 0
      TabOrder = 0
      Text = #1071#1085#1074#1072#1088#1100
      Items.Strings = (
        #1071#1085#1074#1072#1088#1100
        #1060#1077#1074#1088#1072#1083#1100
        #1052#1072#1088#1090
        #1040#1087#1088#1077#1083#1100
        #1052#1072#1081
        #1048#1102#1085#1100
        #1040#1074#1075#1091#1089#1090
        #1057#1077#1085#1090#1103#1073#1088#1100
        #1054#1082#1090#1103#1073#1088#1100
        #1053#1086#1103#1073#1088#1100
        #1044#1077#1082#1072#1073#1088#1100)
    end
    object ComboBox2: TComboBox
      Left = 121
      Top = 40
      Width = 65
      Height = 21
      TabOrder = 1
      Text = 'ComboBox2'
    end
  end
  object Button1: TButton
    Left = 208
    Top = 24
    Width = 105
    Height = 25
    Caption = #1055#1077#1088#1077#1089#1095#1077#1090
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 319
    Top = 24
    Width = 101
    Height = 25
    Caption = #1042#1099#1093#1086#1076
    TabOrder = 2
    OnClick = Button2Click
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 88
    Width = 412
    Height = 105
    Caption = #1055#1088#1086#1075#1088#1077#1089#1089':'
    TabOrder = 3
    object Label3: TLabel
      Left = 10
      Top = 23
      Width = 49
      Height = 13
      Caption = #1058#1077#1082#1091#1097#1080#1081':'
    end
    object Label4: TLabel
      Left = 8
      Top = 64
      Width = 39
      Height = 13
      Caption = #1054#1073#1097#1080#1081':'
    end
    object ProgressBar1: TProgressBar
      Left = 10
      Top = 39
      Width = 393
      Height = 17
      TabOrder = 0
    end
    object ProgressBar2: TProgressBar
      Left = 8
      Top = 80
      Width = 395
      Height = 17
      TabOrder = 1
    end
  end
end
