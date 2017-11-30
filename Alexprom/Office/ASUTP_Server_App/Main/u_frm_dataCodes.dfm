object frm_dataCodes: Tfrm_dataCodes
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #1050#1086#1076#1099' '#1076#1072#1085#1085#1099#1093
  ClientHeight = 217
  ClientWidth = 450
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
  object dataCodeView: TListView
    Left = 8
    Top = 8
    Width = 305
    Height = 201
    Columns = <
      item
        Caption = #1050#1086#1076' '#1076#1072#1085#1085#1099#1093
        Width = 100
      end
      item
        Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1076#1072#1085#1085#1099#1093
        Width = 200
      end>
    GridLines = True
    RowSelect = True
    TabOrder = 0
    ViewStyle = vsReport
    OnSelectItem = dataCodeViewSelectItem
  end
  object btnAdd: TButton
    Left = 320
    Top = 48
    Width = 122
    Height = 25
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100
    TabOrder = 1
  end
  object btnEdit: TButton
    Left = 320
    Top = 80
    Width = 122
    Height = 25
    Caption = #1048#1079#1084#1077#1085#1080#1090#1100
    Enabled = False
    TabOrder = 2
  end
  object btnDelete: TButton
    Left = 320
    Top = 112
    Width = 122
    Height = 25
    Caption = #1059#1076#1072#1083#1080#1090#1100
    Enabled = False
    TabOrder = 3
  end
  object btnClose: TButton
    Left = 319
    Top = 143
    Width = 122
    Height = 25
    Caption = #1042#1099#1093#1086#1076
    TabOrder = 4
    OnClick = btnCloseClick
  end
end
