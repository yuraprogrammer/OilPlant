object frm_editLoaders: Tfrm_editLoaders
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082' '#1075#1088#1091#1079#1086#1074
  ClientHeight = 396
  ClientWidth = 378
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
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object loadersView: TListView
    Left = 8
    Top = 8
    Width = 361
    Height = 313
    Columns = <
      item
        Caption = #1050#1086#1076' '#1075#1088#1091#1079#1072
        Width = 75
      end
      item
        Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1075#1088#1091#1079#1072
        Width = 200
      end
      item
        Caption = #1062#1074#1077#1090
        Width = 75
      end>
    GridLines = True
    RowSelect = True
    TabOrder = 0
    ViewStyle = vsReport
    OnSelectItem = loadersViewSelectItem
  end
  object btn_AddMat: TButton
    Left = 15
    Top = 332
    Width = 112
    Height = 25
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100
    TabOrder = 1
    OnClick = btn_AddMatClick
  end
  object btn_EditMat: TButton
    Left = 133
    Top = 332
    Width = 112
    Height = 25
    Caption = #1048#1079#1084#1077#1085#1080#1090#1100
    Enabled = False
    TabOrder = 2
    OnClick = btn_EditMatClick
  end
  object btn_DeleteMat: TButton
    Left = 251
    Top = 332
    Width = 112
    Height = 25
    Caption = #1059#1076#1072#1083#1080#1090#1100
    Enabled = False
    TabOrder = 3
    OnClick = btn_DeleteMatClick
  end
  object btn_Exit: TButton
    Left = 12
    Top = 363
    Width = 351
    Height = 25
    Caption = #1042#1099#1093#1086#1076
    TabOrder = 4
    OnClick = btn_ExitClick
  end
  object Edit1: TEdit
    Left = 88
    Top = 128
    Width = 201
    Height = 21
    TabOrder = 5
    Visible = False
    OnKeyDown = Edit1KeyDown
  end
end
