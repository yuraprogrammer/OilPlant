object analisisreport: Tanalisisreport
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #1054#1090#1095#1077#1090' '#1086' '#1088#1077#1079#1091#1083#1100#1090#1072#1090#1072#1093' '#1072#1085#1072#1083#1080#1079#1086#1074' '#1087#1088#1086#1073
  ClientHeight = 471
  ClientWidth = 864
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
  object DateTimePicker1: TDateTimePicker
    Left = 8
    Top = 8
    Width = 89
    Height = 21
    Date = 40249.695309814820000000
    Time = 40249.695309814820000000
    TabOrder = 0
    OnChange = DateTimePicker1Change
  end
  object ListView1: TListView
    Left = 8
    Top = 32
    Width = 849
    Height = 431
    Columns = <
      item
        Caption = #1044#1072#1090#1072
      end
      item
        Caption = #1042#1088#1077#1084#1103
      end
      item
        Caption = #1060#1041#1043#1057' '#1088
      end
      item
        Caption = #1060#1041#1043#1057' t'
      end
      item
        Caption = #1060#1041#1043#1057' p20'
        Width = 65
      end
      item
        Caption = #1060#1041#1043#1057' t'#1082#1082
        Width = 60
      end
      item
        Caption = #1040#1044#1058' '#1088
      end
      item
        Caption = #1040#1044#1058' t'
      end
      item
        Caption = #1040#1044#1058' p20'
        Width = 60
      end
      item
        Caption = #1040#1044#1058' t'#1087#1086#1084
        Width = 60
      end
      item
        Caption = #1040#1044#1058' t'#1074#1089#1087
        Width = 60
      end
      item
        Caption = #1054#1058#1043' '#1088
      end
      item
        Caption = #1054#1058#1043' t'
      end
      item
        Caption = #1054#1058#1043' p20'
        Width = 60
      end
      item
        Caption = #1054#1058#1043' t'#1074#1089#1087
        Width = 60
      end>
    GridLines = True
    TabOrder = 1
    ViewStyle = vsReport
  end
end
