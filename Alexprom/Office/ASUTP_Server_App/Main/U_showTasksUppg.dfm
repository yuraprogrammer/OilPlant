object frmUppgTasks: TfrmUppgTasks
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #1047#1072#1076#1072#1085#1080#1103' '#1085#1072' '#1087#1077#1088#1077#1088#1072#1073#1086#1090#1082#1091
  ClientHeight = 182
  ClientWidth = 485
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
    Width = 250
    Height = 137
    Columns = <
      item
        Caption = #8470' '#1079#1072#1076#1072#1085#1080#1103
        Width = 75
      end
      item
        Caption = #1044#1072#1090#1072
        Width = 75
      end
      item
        Caption = #1042#1088#1077#1084#1103
        Width = 75
      end>
    GridLines = True
    HideSelection = False
    RowSelect = True
    TabOrder = 0
    ViewStyle = vsReport
    OnSelectItem = ListView1SelectItem
  end
  object GroupBox1: TGroupBox
    Left = 264
    Top = 8
    Width = 213
    Height = 137
    Caption = #1047#1072#1076#1072#1085#1080#1077':'
    TabOrder = 1
    object Label1: TLabel
      Left = 192
      Top = 25
      Width = 7
      Height = 13
      Caption = 'C'
    end
    object Label2: TLabel
      Left = 192
      Top = 47
      Width = 7
      Height = 13
      Caption = #1057
    end
    object Label3: TLabel
      Left = 192
      Top = 68
      Width = 7
      Height = 13
      Caption = #1057
    end
    object Label4: TLabel
      Left = 192
      Top = 89
      Width = 7
      Height = 13
      Caption = #1057
    end
    object Label5: TLabel
      Left = 192
      Top = 110
      Width = 11
      Height = 13
      Caption = '%'
    end
    object Panel1: TPanel
      Left = 8
      Top = 21
      Width = 74
      Height = 21
      BevelInner = bvLowered
      BevelOuter = bvLowered
      Caption = #1060#1041#1043#1057
      TabOrder = 0
    end
    object Panel2: TPanel
      Left = 82
      Top = 21
      Width = 49
      Height = 21
      BevelInner = bvLowered
      BevelOuter = bvLowered
      Caption = 't'#1082#1082
      TabOrder = 1
    end
    object Panel3: TPanel
      Left = 131
      Top = 21
      Width = 54
      Height = 21
      BevelInner = bvLowered
      BevelOuter = bvLowered
      TabOrder = 2
    end
    object Panel4: TPanel
      Left = 8
      Top = 43
      Width = 74
      Height = 42
      BevelInner = bvLowered
      BevelOuter = bvLowered
      Caption = #1040#1044#1058
      TabOrder = 3
    end
    object Panel5: TPanel
      Left = 82
      Top = 43
      Width = 49
      Height = 21
      BevelInner = bvLowered
      BevelOuter = bvLowered
      Caption = 't'#1074#1089#1087
      TabOrder = 4
    end
    object Panel6: TPanel
      Left = 82
      Top = 64
      Width = 49
      Height = 21
      BevelInner = bvLowered
      BevelOuter = bvLowered
      Caption = 't'#1087#1086#1084
      TabOrder = 5
    end
    object Panel7: TPanel
      Left = 131
      Top = 43
      Width = 54
      Height = 21
      BevelInner = bvLowered
      BevelOuter = bvLowered
      TabOrder = 6
    end
    object Panel8: TPanel
      Left = 131
      Top = 64
      Width = 54
      Height = 21
      BevelInner = bvLowered
      BevelOuter = bvLowered
      TabOrder = 7
    end
    object Panel9: TPanel
      Left = 131
      Top = 85
      Width = 54
      Height = 21
      BevelInner = bvLowered
      BevelOuter = bvLowered
      TabOrder = 8
    end
    object Panel11: TPanel
      Left = 8
      Top = 85
      Width = 74
      Height = 21
      BevelInner = bvLowered
      BevelOuter = bvLowered
      Caption = #1054#1058#1043
      TabOrder = 9
    end
    object Panel12: TPanel
      Left = 82
      Top = 85
      Width = 49
      Height = 21
      BevelInner = bvLowered
      BevelOuter = bvLowered
      Caption = 't'#1074#1089#1087
      TabOrder = 10
    end
    object Panel13: TPanel
      Left = 82
      Top = 106
      Width = 49
      Height = 21
      BevelInner = bvLowered
      BevelOuter = bvLowered
      Caption = #1074#1099#1093'. '#1089#1074
      TabOrder = 11
    end
  end
  object Button2: TButton
    Left = 145
    Top = 151
    Width = 97
    Height = 25
    Caption = #1048#1089#1087#1086#1083#1100#1079#1086#1074#1072#1090#1100
    Enabled = False
    TabOrder = 2
  end
  object Button3: TButton
    Left = 248
    Top = 151
    Width = 75
    Height = 25
    Caption = #1042#1099#1093#1086#1076
    TabOrder = 3
    OnClick = Button3Click
  end
  object Panel10: TPanel
    Left = 395
    Top = 114
    Width = 54
    Height = 21
    BevelInner = bvLowered
    BevelOuter = bvLowered
    TabOrder = 4
  end
end
