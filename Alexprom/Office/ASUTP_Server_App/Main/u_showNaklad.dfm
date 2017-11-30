object frmShowNaklad: TfrmShowNaklad
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #1053#1072#1082#1083#1072#1076#1085#1099#1077
  ClientHeight = 627
  ClientWidth = 1274
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object calendar: TDateTimePicker
    Left = 8
    Top = 8
    Width = 186
    Height = 21
    Date = 40148.567583912040000000
    Time = 40148.567583912040000000
    TabOrder = 0
    OnChange = calendarChange
  end
  object nakladView: TListView
    Left = 8
    Top = 35
    Width = 1258
    Height = 584
    Columns = <
      item
        Caption = #8470' '#1085#1072#1082#1083#1072#1076#1085#1086#1081
        Width = 85
      end
      item
        Caption = #1054#1088#1075#1072#1085#1080#1079#1072#1094#1080#1103
        Width = 150
      end
      item
        Caption = #1043#1088#1091#1079
      end
      item
        Caption = #1058#1080#1087' '#1094#1080#1089#1090#1077#1088#1085#1099
        Width = 85
      end
      item
        Caption = #1042#1088#1077#1084#1103' '#1074#1098#1077#1079#1076#1072
        Width = 85
      end
      item
        AutoSize = True
        Caption = #8470' '#1084#1072#1096#1080#1085#1099
      end
      item
        Caption = #1060#1048#1054' '#1074#1086#1076#1080#1090#1077#1083#1103
        Width = 90
      end
      item
        Caption = #1047#1072#1087#1086#1083#1085#1077#1085#1080#1077', '#1084#1084
        Width = 100
      end
      item
        Caption = #1055#1083#1086#1090#1085#1086#1089#1090#1100', '#1082#1075'/'#1084'3'
        Width = 100
      end
      item
        Caption = #1058#1077#1084#1087#1077#1088#1072#1090#1091#1088#1072', '#1057
        Width = 95
      end
      item
        Caption = #1059#1088#1086#1074#1077#1085#1100' '#1074#1086#1076#1099', '#1084#1084
        Width = 105
      end
      item
        Caption = #1059#1088#1086#1074#1077#1085#1100' '#1074#1086#1076#1099', '#1082#1075
        Width = 105
      end
      item
        Caption = #1052#1072#1089#1089#1072' '#1085#1077#1090#1090#1086', '#1082#1075
        Width = 95
      end>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    GridLines = True
    ParentFont = False
    PopupMenu = PopupMenu1
    TabOrder = 1
    ViewStyle = vsReport
    OnSelectItem = nakladViewSelectItem
  end
  object PopupMenu1: TPopupMenu
    Left = 208
    Top = 200
    object editCurrentNaklad: TMenuItem
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100
      Enabled = False
    end
    object deleteCurrentNaklad: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100
      Enabled = False
    end
    object showCurrentNaklad: TMenuItem
      Caption = #1055#1086#1076#1088#1086#1073#1085#1077#1077
      Enabled = False
    end
    object previewList: TMenuItem
      Caption = #1055#1088#1077#1076#1074#1072#1088#1080#1090#1077#1083#1100#1085#1099#1081' '#1087#1088#1086#1089#1084#1086#1090#1088
    end
    object printList: TMenuItem
      Caption = #1055#1077#1095#1072#1090#1100
    end
  end
end
