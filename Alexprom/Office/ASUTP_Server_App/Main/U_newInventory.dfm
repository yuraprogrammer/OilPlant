object newInventory: TnewInventory
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #1053#1086#1074#1072#1103' '#1080#1085#1074#1077#1085#1090#1072#1088#1080#1079#1072#1094#1080#1103
  ClientHeight = 551
  ClientWidth = 664
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
    Width = 649
    Height = 65
    Caption = #1048#1089#1093#1086#1076#1085#1099#1077' '#1076#1072#1085#1085#1099#1077
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 16
      Width = 35
      Height = 13
      Caption = #1052#1077#1089#1103#1094':'
    end
    object Label2: TLabel
      Left = 84
      Top = 16
      Width = 23
      Height = 13
      Caption = #1043#1086#1076':'
    end
    object Label3: TLabel
      Left = 154
      Top = 16
      Width = 59
      Height = 13
      Caption = #1044#1072#1085#1085#1099#1077' '#1085#1072':'
    end
    object Label4: TLabel
      Left = 237
      Top = 16
      Width = 34
      Height = 13
      Caption = #1042#1088#1077#1084#1103':'
    end
    object monthbox: TComboBox
      Left = 9
      Top = 32
      Width = 70
      Height = 21
      Style = csDropDownList
      TabOrder = 0
      OnChange = monthboxChange
      Items.Strings = (
        #1071#1085#1074#1072#1088#1100
        #1060#1077#1074#1088#1072#1083#1100
        #1052#1072#1088#1090
        #1040#1087#1088#1077#1083#1100
        #1052#1072#1081
        #1048#1102#1085#1100
        #1048#1102#1083#1100
        #1040#1074#1075#1091#1089#1090
        #1057#1077#1085#1090#1103#1073#1088#1100
        #1054#1082#1090#1103#1073#1088#1100
        #1053#1086#1103#1073#1088#1100
        #1044#1077#1082#1072#1073#1088#1100)
    end
    object yearbox: TComboBox
      Left = 82
      Top = 32
      Width = 67
      Height = 21
      Style = csDropDownList
      TabOrder = 1
      OnChange = yearboxChange
      Items.Strings = (
        '2010')
    end
    object calendar: TDateTimePicker
      Left = 153
      Top = 32
      Width = 82
      Height = 21
      Date = 40315.522531828700000000
      Time = 40315.522531828700000000
      TabOrder = 2
      OnChange = calendarChange
    end
    object TimePicker: TDateTimePicker
      Left = 237
      Top = 32
      Width = 74
      Height = 21
      Date = 40315.522833831020000000
      Time = 40315.522833831020000000
      DateMode = dmUpDown
      Kind = dtkTime
      TabOrder = 3
    end
    object RadioGroup1: TRadioGroup
      Left = 315
      Top = 16
      Width = 326
      Height = 39
      Caption = #1048#1089#1087#1086#1083#1100#1079#1086#1074#1072#1090#1100' '#1082#1072#1082':'
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        #1053#1072#1095#1072#1083#1086' '#1084#1077#1089#1103#1094#1072
        #1050#1086#1085#1077#1094' '#1084#1077#1089#1103#1094#1072)
      TabOrder = 4
      OnClick = RadioGroup1Click
    end
  end
  object ListView1: TListView
    Left = 8
    Top = 80
    Width = 649
    Height = 463
    Columns = <
      item
        Caption = #1056'-'#1074#1091#1072#1088
      end
      item
        Caption = #1042#1079#1083#1080#1074' '#1076#1086', '#1084#1084
        Width = 80
      end
      item
        Caption = 'V '#1076#1086', '#1083
      end
      item
        Caption = #1088' '#1076#1086', '#1082#1075'/'#1084'3'
        Width = 70
      end
      item
        Caption = 'm '#1076#1086', '#1082#1075
        Width = 55
      end
      item
        Caption = #1042#1079#1083#1080#1074' '#1087#1086#1089#1083#1077', '#1084#1084
        Width = 95
      end
      item
        Caption = 'V '#1087#1086#1089#1083#1077', '#1083
        Width = 65
      end
      item
        Caption = #1088' '#1087#1086#1089#1083#1077', '#1082#1075'/'#1084'3'
        Width = 85
      end
      item
        Caption = 'm '#1087#1086#1089#1083#1077', '#1082#1075
        Width = 70
      end>
    GridLines = True
    RowSelect = True
    TabOrder = 1
    ViewStyle = vsReport
    OnDblClick = ListView1DblClick
    OnSelectItem = ListView1SelectItem
  end
end
