object inputChemicalData: TinputChemicalData
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #1042#1074#1086#1076' '#1088#1077#1079#1091#1083#1100#1090#1072#1090#1086#1074' '#1072#1085#1072#1083#1080#1079#1072
  ClientHeight = 471
  ClientWidth = 888
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
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 137
    Height = 57
    Caption = #1048#1089#1093#1086#1076#1085#1099#1077' '#1076#1072#1085#1085#1099#1077':'
    TabOrder = 0
    object Label1: TLabel
      Left = 7
      Top = 14
      Width = 30
      Height = 13
      Caption = #1044#1072#1090#1072':'
    end
    object Label2: TLabel
      Left = 79
      Top = 11
      Width = 34
      Height = 13
      Caption = #1042#1088#1077#1084#1103':'
    end
    object analisDate: TEdit
      Left = 7
      Top = 30
      Width = 66
      Height = 21
      Enabled = False
      TabOrder = 0
      Text = '11.03.2010'
    end
    object analisTime: TEdit
      Left = 79
      Top = 30
      Width = 50
      Height = 21
      Enabled = False
      TabOrder = 1
      Text = '13:05:00'
    end
  end
  object ListView1: TListView
    Left = 8
    Top = 71
    Width = 873
    Height = 362
    Columns = <
      item
        Caption = #1044#1072#1090#1072
        Width = 75
      end
      item
        Caption = #1042#1088#1077#1084#1103
        Width = 60
      end
      item
        Caption = #1060#1041#1043#1057' '#1088
      end
      item
        Caption = 't, C'
      end
      item
        Caption = #1060#1041#1043#1057' '#1088'20'
        Width = 60
      end
      item
        Caption = #1060#1041#1043#1057' t'#1082#1082
      end
      item
        Caption = #1040#1044#1058' '#1088
        Width = 55
      end
      item
        Caption = 't, C'
      end
      item
        Caption = #1040#1044#1058' '#1088'20'
        Width = 60
      end
      item
        Caption = #1040#1044#1058' t'#1087
      end
      item
        Caption = #1040#1044#1058' t'#1074#1089#1087
        Width = 57
      end
      item
        Caption = #1054#1058#1043' '#1088
        Width = 60
      end
      item
        Caption = 't, C'
      end
      item
        Caption = #1054#1058#1043' '#1088'20'
        Width = 60
      end
      item
        Caption = #1054#1058#1043' t'#1074#1089#1087
        Width = 60
      end>
    GridLines = True
    ReadOnly = True
    RowSelect = True
    TabOrder = 4
    ViewStyle = vsReport
    OnExit = ListView1Exit
    OnSelectItem = ListView1SelectItem
  end
  object Button1: TButton
    Left = 333
    Top = 439
    Width = 105
    Height = 25
    Caption = #1047#1072#1087#1080#1089#1072#1090#1100
    Enabled = False
    TabOrder = 6
    OnClick = Button1Click
  end
  object GroupBox2: TGroupBox
    Left = 151
    Top = 7
    Width = 205
    Height = 58
    Caption = #1060#1041#1043#1057
    TabOrder = 1
    object Label3: TLabel
      Left = 8
      Top = 16
      Width = 40
      Height = 13
      Caption = #1088', '#1082#1075'/'#1084'3'
    end
    object Label4: TLabel
      Left = 100
      Top = 16
      Width = 52
      Height = 13
      Caption = #1088'20, '#1082#1075'/'#1084'3'
    end
    object Label5: TLabel
      Left = 158
      Top = 16
      Width = 30
      Height = 13
      Caption = 't'#1082#1082', '#1057
    end
    object Label13: TLabel
      Left = 57
      Top = 18
      Width = 18
      Height = 13
      Caption = 't, C'
    end
    object MaskEdit1: TMaskEdit
      Left = 8
      Top = 32
      Width = 40
      Height = 21
      EditMask = '!9,9999;1; '
      MaxLength = 6
      TabOrder = 0
      Text = ' ,    '
      OnChange = MaskEdit1Change
      OnExit = MaskEdit1Change
    end
    object MaskEdit2: TMaskEdit
      Left = 97
      Top = 32
      Width = 55
      Height = 21
      Enabled = False
      EditMask = '!9,9999;1; '
      MaxLength = 6
      TabOrder = 2
      Text = ' ,    '
    end
    object Edit1: TEdit
      Left = 158
      Top = 32
      Width = 37
      Height = 21
      TabOrder = 3
      OnChange = Edit1Change
      OnExit = Edit1Change
    end
    object Edit5: TEdit
      Left = 54
      Top = 32
      Width = 37
      Height = 21
      TabOrder = 1
      OnChange = Edit5Change
      OnExit = Edit5Change
    end
  end
  object GroupBox3: TGroupBox
    Left = 362
    Top = 8
    Width = 263
    Height = 57
    Caption = #1040#1044#1058
    TabOrder = 2
    object Label6: TLabel
      Left = 8
      Top = 16
      Width = 40
      Height = 13
      Caption = #1088', '#1082#1075'/'#1084'3'
    end
    object Label7: TLabel
      Left = 105
      Top = 16
      Width = 52
      Height = 13
      Caption = #1088'20, '#1082#1075'/'#1084'3'
    end
    object Label8: TLabel
      Left = 167
      Top = 16
      Width = 24
      Height = 13
      Caption = 't'#1087', '#1057
    end
    object Label9: TLabel
      Left = 212
      Top = 16
      Width = 35
      Height = 13
      Caption = 't'#1074#1089#1087', '#1057
    end
    object Label14: TLabel
      Left = 57
      Top = 17
      Width = 18
      Height = 13
      Caption = 't, C'
    end
    object MaskEdit3: TMaskEdit
      Left = 7
      Top = 31
      Width = 42
      Height = 21
      EditMask = '!9,9999;1; '
      MaxLength = 6
      TabOrder = 0
      Text = ' ,    '
      OnChange = MaskEdit3Change
      OnExit = MaskEdit3Change
    end
    object MaskEdit4: TMaskEdit
      Left = 103
      Top = 31
      Width = 51
      Height = 21
      Enabled = False
      EditMask = '!9,9999;1; '
      MaxLength = 6
      TabOrder = 2
      Text = ' ,    '
    end
    object Edit2: TEdit
      Left = 159
      Top = 31
      Width = 43
      Height = 21
      TabOrder = 3
      OnChange = Edit2Change
      OnExit = Edit2Change
    end
    object Edit3: TEdit
      Left = 208
      Top = 31
      Width = 45
      Height = 21
      TabOrder = 4
      OnChange = Edit3Change
      OnExit = Edit3Change
    end
    object Edit6: TEdit
      Left = 54
      Top = 31
      Width = 37
      Height = 21
      TabOrder = 1
      OnChange = Edit6Change
      OnExit = Edit6Change
    end
  end
  object GroupBox4: TGroupBox
    Left = 631
    Top = 8
    Width = 219
    Height = 57
    Caption = #1054#1058#1043
    TabOrder = 3
    object Label10: TLabel
      Left = 8
      Top = 16
      Width = 40
      Height = 13
      Caption = #1088', '#1082#1075'/'#1084'3'
    end
    object Label11: TLabel
      Left = 104
      Top = 16
      Width = 52
      Height = 13
      Caption = #1088'20, '#1082#1075'/'#1084'3'
    end
    object Label12: TLabel
      Left = 167
      Top = 16
      Width = 35
      Height = 13
      Caption = 't'#1074#1089#1087', '#1057
    end
    object Label15: TLabel
      Left = 56
      Top = 17
      Width = 18
      Height = 13
      Caption = 't, C'
    end
    object Edit4: TEdit
      Left = 161
      Top = 31
      Width = 49
      Height = 21
      TabOrder = 3
      OnChange = Edit4Change
    end
    object MaskEdit5: TMaskEdit
      Left = 9
      Top = 31
      Width = 41
      Height = 21
      EditMask = '!9,9999;1; '
      MaxLength = 6
      TabOrder = 0
      Text = ' ,    '
      OnChange = MaskEdit5Change
      OnExit = MaskEdit5Change
    end
    object MaskEdit6: TMaskEdit
      Left = 104
      Top = 31
      Width = 51
      Height = 21
      Enabled = False
      EditMask = '!9,9999;1; '
      MaxLength = 6
      TabOrder = 2
      Text = ' ,    '
    end
    object Edit7: TEdit
      Left = 53
      Top = 31
      Width = 45
      Height = 21
      TabOrder = 1
      OnChange = Edit7Change
      OnExit = Edit7Change
    end
  end
  object Button2: TButton
    Left = 444
    Top = 439
    Width = 75
    Height = 25
    Caption = #1042#1099#1093#1086#1076
    TabOrder = 7
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 252
    Top = 438
    Width = 75
    Height = 25
    Caption = #1053#1086#1074#1099#1077
    TabOrder = 5
    OnClick = Button3Click
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 136
    Top = 216
  end
end
