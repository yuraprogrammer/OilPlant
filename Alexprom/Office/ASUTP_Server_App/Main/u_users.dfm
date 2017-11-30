object editUsers: TeditUsers
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1080
  ClientHeight = 301
  ClientWidth = 368
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
  object usersView: TListView
    Left = 8
    Top = 8
    Width = 352
    Height = 223
    Columns = <
      item
        Caption = #1048#1084#1103' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1103
        Width = 150
      end
      item
        Caption = #1059#1088#1086#1074#1077#1085#1100' '#1076#1086#1089#1090#1091#1087#1072
        Width = 195
      end>
    GridLines = True
    RowSelect = True
    TabOrder = 0
    ViewStyle = vsReport
    OnSelectItem = usersViewSelectItem
  end
  object addUser: TButton
    Left = 8
    Top = 237
    Width = 114
    Height = 25
    Caption = #1053#1086#1074#1099#1081
    TabOrder = 1
  end
  object editUser: TButton
    Left = 128
    Top = 237
    Width = 113
    Height = 25
    Caption = #1048#1079#1084#1077#1085#1080#1090#1100
    Enabled = False
    TabOrder = 2
  end
  object deleteUser: TButton
    Left = 247
    Top = 237
    Width = 113
    Height = 25
    Caption = #1059#1076#1072#1083#1080#1090#1100
    Enabled = False
    TabOrder = 3
    OnClick = deleteUserClick
  end
  object btnClose: TButton
    Left = 8
    Top = 268
    Width = 352
    Height = 25
    Caption = #1042#1099#1093#1086#1076
    TabOrder = 4
    OnClick = btnCloseClick
  end
  object Edit1: TEdit
    Left = 8
    Top = 168
    Width = 153
    Height = 21
    TabOrder = 5
    Text = 'Edit1'
    Visible = False
  end
  object ComboBox1: TComboBox
    Left = 162
    Top = 168
    Width = 193
    Height = 21
    TabOrder = 6
    Text = 'ComboBox1'
    Visible = False
  end
end
