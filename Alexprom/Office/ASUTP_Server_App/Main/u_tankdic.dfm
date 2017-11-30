object tank_dic: Ttank_dic
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082' '#1088#1077#1079#1077#1088#1074#1091#1072#1088#1086#1074
  ClientHeight = 485
  ClientWidth = 761
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
  object tankView: TListView
    Left = 8
    Top = 8
    Width = 609
    Height = 469
    Columns = <
      item
        AutoSize = True
        Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
      end
      item
        Alignment = taCenter
        AutoSize = True
        Caption = #1042#1085#1091#1090#1088'. '#1076#1080#1072#1084#1077#1090#1088', '#1084#1084
      end
      item
        Alignment = taCenter
        AutoSize = True
        Caption = #1044#1083#1080#1085#1072' '#1094#1080#1083#1080#1085#1076#1088'. '#1095#1072#1089#1090#1080', '#1084#1084
      end
      item
        Alignment = taCenter
        AutoSize = True
        Caption = #1042#1099#1089#1086#1090#1072' '#1082#1086#1085#1091#1089#1072', '#1084#1084
      end>
    GridLines = True
    HideSelection = False
    ReadOnly = True
    RowSelect = True
    TabOrder = 0
    ViewStyle = vsReport
    OnDblClick = tankViewDblClick
    OnSelectItem = tankViewSelectItem
  end
  object btnAdd: TButton
    Left = 624
    Top = 184
    Width = 128
    Height = 25
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100
    TabOrder = 1
    OnClick = btnAddClick
  end
  object Button3: TButton
    Left = 623
    Top = 216
    Width = 128
    Height = 25
    Caption = #1059#1076#1072#1083#1080#1090#1100
    Enabled = False
    TabOrder = 2
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 623
    Top = 247
    Width = 128
    Height = 25
    Caption = #1042#1099#1093#1086#1076
    TabOrder = 3
    OnClick = Button4Click
  end
end
