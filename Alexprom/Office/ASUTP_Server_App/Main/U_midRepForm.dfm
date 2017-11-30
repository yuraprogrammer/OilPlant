object frmMidRep: TfrmMidRep
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #1040#1082#1090#1099' '#1072#1085#1072#1083#1080#1079#1072' '#1091#1089#1088#1077#1076#1085#1077#1085#1085#1086#1075#1086' '#1085#1077#1092#1090#1077#1087#1088#1086#1076#1091#1082#1090#1072
  ClientHeight = 366
  ClientWidth = 601
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
    Width = 289
    Height = 65
    Caption = #1042#1099#1073#1077#1088#1080#1090#1077' '#1087#1077#1088#1080#1086#1076' '#1072#1085#1072#1083#1080#1079#1072':'
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 16
      Width = 30
      Height = 13
      Caption = #1044#1072#1090#1072':'
    end
    object Label2: TLabel
      Left = 104
      Top = 16
      Width = 35
      Height = 13
      Caption = #1052#1077#1089#1103#1094':'
    end
    object Label3: TLabel
      Left = 200
      Top = 16
      Width = 23
      Height = 13
      Caption = #1043#1086#1076':'
    end
    object calendar: TDateTimePicker
      Left = 8
      Top = 32
      Width = 89
      Height = 21
      Date = 40305.350644525460000000
      Time = 40305.350644525460000000
      TabOrder = 0
      OnChange = calendarChange
    end
    object mBox: TComboBox
      Left = 104
      Top = 32
      Width = 89
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 1
      Text = #1071#1085#1074#1072#1088#1100
      OnChange = mBoxChange
      Items.Strings = (
        #1071#1085#1074#1072#1088#1100
        #1060#1077#1074#1088#1072#1083#1100
        #1052#1072#1088#1090
        #1040#1087#1077#1088#1083#1100
        #1052#1072#1081
        #1048#1102#1085#1100
        #1048#1102#1083#1100
        #1040#1074#1075#1091#1089#1090
        #1057#1077#1085#1090#1103#1073#1088#1100
        #1054#1082#1090#1103#1073#1088#1100
        #1053#1086#1103#1073#1088#1100
        #1044#1077#1082#1072#1073#1088#1100)
    end
    object yBox: TComboBox
      Left = 200
      Top = 32
      Width = 81
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 2
      Text = '2010'
      OnChange = yBoxChange
      Items.Strings = (
        '2010'
        '2011'
        '2012'
        '2013'
        '2014'
        '2015'
        '2016'
        '2017'
        '2018'
        '2019'
        '2020')
    end
  end
  object RadioGroup1: TRadioGroup
    Left = 304
    Top = 8
    Width = 289
    Height = 65
    Caption = #1055#1077#1088#1080#1086#1076':'
    Columns = 3
    ItemIndex = 0
    Items.Strings = (
      #1047#1072' '#1089#1091#1090#1082#1080
      #1047#1072' '#1084#1077#1089#1103#1094
      #1047#1072' '#1075#1086#1076)
    TabOrder = 1
    OnClick = RadioGroup1Click
  end
  object ListView1: TListView
    Left = 8
    Top = 79
    Width = 585
    Height = 279
    Columns = <
      item
        Caption = #8470' '#1072#1082#1090#1072
        Width = 55
      end
      item
        Alignment = taCenter
        Caption = #1044#1072#1090#1072
        Width = 75
      end
      item
        Alignment = taCenter
        Caption = #1042#1088#1077#1084#1103
      end
      item
        Alignment = taCenter
        Caption = #1057#1090'. '#1086#1087#1077#1088#1072#1090#1086#1088
        Width = 120
      end
      item
        Alignment = taCenter
        Caption = #1051#1072#1073#1086#1088#1072#1085#1090
        Width = 120
      end
      item
        Alignment = taCenter
        Caption = #1088
      end
      item
        Alignment = taCenter
        Caption = #1088'+20'
      end
      item
        Alignment = taCenter
        Caption = 't'
        Width = 30
      end>
    GridLines = True
    HideSelection = False
    ReadOnly = True
    RowSelect = True
    TabOrder = 2
    ViewStyle = vsReport
    OnDblClick = ListView1DblClick
    OnSelectItem = ListView1SelectItem
  end
end
