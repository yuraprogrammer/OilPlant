object frm_organizations: Tfrm_organizations
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082' '#1086#1088#1072#1075#1072#1085#1080#1079#1072#1094#1080#1081
  ClientHeight = 463
  ClientWidth = 368
  Color = clBtnFace
  Font.Charset = OEM_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClick = FormClick
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 14
  object orgView: TListView
    Left = 8
    Top = 7
    Width = 353
    Height = 389
    Columns = <
      item
        Caption = #1050#1086#1076' '#1086#1088#1075#1072#1085#1080#1079#1072#1094#1080#1080
        Width = 150
      end
      item
        Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1086#1088#1075#1072#1085#1080#1079#1072#1094#1080#1080
        Width = 200
      end>
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    GridLines = True
    RowSelect = True
    ParentFont = False
    SortType = stData
    TabOrder = 0
    ViewStyle = vsReport
    OnSelectItem = orgViewSelectItem
  end
  object btn_AddOrg: TButton
    Left = 11
    Top = 402
    Width = 112
    Height = 25
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100
    TabOrder = 1
    OnClick = btn_AddOrgClick
  end
  object btn_EditOrg: TButton
    Left = 129
    Top = 402
    Width = 112
    Height = 25
    Caption = #1048#1079#1084#1077#1085#1080#1090#1100
    Enabled = False
    TabOrder = 2
    OnClick = btn_EditOrgClick
  end
  object btn_DeleteOrg: TButton
    Left = 247
    Top = 402
    Width = 112
    Height = 25
    Caption = #1059#1076#1072#1083#1080#1090#1100
    Enabled = False
    TabOrder = 3
    OnClick = btn_DeleteOrgClick
  end
  object btn_Exit: TButton
    Left = 11
    Top = 433
    Width = 348
    Height = 25
    Caption = #1042#1099#1093#1086#1076
    TabOrder = 4
    OnClick = btn_ExitClick
  end
  object Edit1: TEdit
    Left = 159
    Top = 128
    Width = 201
    Height = 21
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    Visible = False
    OnKeyDown = Edit1KeyDown
  end
end
