object frmInputTankData: TfrmInputTankData
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #1048#1089#1093#1086#1076#1085#1099#1077' '#1076#1072#1085#1085#1099#1077
  ClientHeight = 319
  ClientWidth = 698
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
  object ListView1: TListView
    Left = 0
    Top = 0
    Width = 698
    Height = 319
    Align = alClient
    Columns = <
      item
        Caption = #1056#1077#1079#1077#1088#1074#1091#1072#1088
        Width = 100
      end
      item
        Caption = #1052#1072#1090#1077#1088#1080#1072#1083
        Width = 100
      end
      item
        Caption = #1042#1079#1083#1080#1074
        Width = 100
      end
      item
        Caption = #1054#1073#1098#1077#1084
        Width = 100
      end
      item
        Caption = #1055#1083#1086#1090#1085#1086#1089#1090#1100
        Width = 100
      end
      item
        Caption = #1052#1072#1089#1089#1072
        Width = 100
      end
      item
        Caption = #1058#1077#1084#1087#1077#1088#1072#1090#1091#1088#1072
      end>
    GridLines = True
    ReadOnly = True
    RowSelect = True
    TabOrder = 0
    ViewStyle = vsReport
    OnDblClick = ListView1DblClick
    OnSelectItem = ListView1SelectItem
  end
end
