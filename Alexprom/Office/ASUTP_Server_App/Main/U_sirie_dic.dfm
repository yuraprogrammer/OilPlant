object sirie_dic: Tsirie_dic
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082' '#1089#1099#1088#1100#1103
  ClientHeight = 487
  ClientWidth = 331
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
    Left = 8
    Top = 8
    Width = 313
    Height = 409
    Columns = <
      item
        Caption = #1050#1086#1076
        Width = 100
      end
      item
        Alignment = taCenter
        Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
        Width = 200
      end>
    GridLines = True
    HideSelection = False
    ReadOnly = True
    RowSelect = True
    TabOrder = 0
    ViewStyle = vsReport
    OnSelectItem = ListView1SelectItem
  end
  object btn_AddMat: TButton
    Left = 8
    Top = 423
    Width = 105
    Height = 25
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100
    TabOrder = 1
    OnClick = btn_AddMatClick
  end
  object btn_Edit: TButton
    Left = 119
    Top = 423
    Width = 107
    Height = 25
    Caption = #1048#1079#1084#1077#1085#1080#1090#1100
    Enabled = False
    TabOrder = 2
    OnClick = btn_EditClick
  end
  object btn_Delete: TButton
    Left = 231
    Top = 423
    Width = 92
    Height = 25
    Caption = #1059#1076#1072#1083#1080#1090#1100
    Enabled = False
    TabOrder = 3
    OnClick = btn_DeleteClick
  end
  object btn_Exit: TButton
    Left = 8
    Top = 454
    Width = 315
    Height = 25
    Caption = #1042#1099#1093#1086#1076
    TabOrder = 4
    OnClick = btn_ExitClick
  end
  object Edit1: TEdit
    Left = 114
    Top = 216
    Width = 201
    Height = 21
    TabOrder = 5
    Visible = False
    OnKeyDown = Edit1KeyDown
  end
end
