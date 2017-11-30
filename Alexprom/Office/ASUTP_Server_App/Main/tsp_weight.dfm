object frmTSP: TfrmTSP
  Left = 485
  Top = 215
  BorderStyle = bsDialog
  Caption = #1042#1079#1074#1077#1096#1080#1074#1072#1085#1080#1077
  ClientHeight = 416
  ClientWidth = 757
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormCreate
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 561
    Height = 107
    Caption = #1048#1089#1093#1086#1076#1085#1099#1077' '#1076#1072#1085#1085#1099#1077':'
    TabOrder = 0
    object Label4: TLabel
      Left = 8
      Top = 16
      Width = 70
      Height = 13
      Caption = #1044#1072#1090#1072' '#1074#1098#1077#1079#1076#1072':'
    end
    object Label5: TLabel
      Left = 100
      Top = 16
      Width = 74
      Height = 13
      Caption = #1042#1088#1077#1084#1103' '#1074#1098#1077#1079#1076#1072':'
    end
    object Label6: TLabel
      Left = 178
      Top = 16
      Width = 87
      Height = 13
      Caption = #8470' '#1074#1079#1074#1077#1096#1080#1074#1072#1085#1080#1103':'
    end
    object Label13: TLabel
      Left = 9
      Top = 59
      Width = 71
      Height = 13
      Caption = #1044#1072#1090#1072' '#1074#1099#1077#1079#1076#1072':'
    end
    object Label14: TLabel
      Left = 101
      Top = 59
      Width = 75
      Height = 13
      Caption = #1042#1088#1077#1084#1103' '#1074#1099#1077#1079#1076#1072':'
    end
    object Label16: TLabel
      Left = 270
      Top = 16
      Width = 60
      Height = 13
      Caption = #8470' '#1084#1072#1096#1080#1085#1099':'
    end
    object Label21: TLabel
      Left = 367
      Top = 16
      Width = 84
      Height = 13
      Caption = #1050#1072#1083#1080#1073#1088#1086#1074#1082#1072' '#1073'/'#1074':'
    end
    object Label9: TLabel
      Left = 461
      Top = 16
      Width = 58
      Height = 13
      Caption = #1055#1083#1086#1090#1085#1086#1089#1090#1100':'
    end
    object Edit1: TEdit
      Left = 8
      Top = 32
      Width = 87
      Height = 21
      Enabled = False
      TabOrder = 0
    end
    object Edit2: TEdit
      Left = 101
      Top = 32
      Width = 73
      Height = 21
      Enabled = False
      TabOrder = 1
    end
    object Edit3: TEdit
      Left = 179
      Top = 32
      Width = 86
      Height = 21
      Enabled = False
      TabOrder = 2
    end
    object Edit4: TEdit
      Left = 9
      Top = 75
      Width = 86
      Height = 21
      Enabled = False
      TabOrder = 3
    end
    object Edit5: TEdit
      Left = 101
      Top = 75
      Width = 75
      Height = 21
      Enabled = False
      TabOrder = 4
    end
    object Edit7: TMaskEdit
      Left = 367
      Top = 32
      Width = 88
      Height = 21
      EditMask = '!99999;1; '
      MaxLength = 5
      TabOrder = 5
      Text = '     '
      OnChange = Edit7Change
    end
    object Edit6: TMaskEdit
      Left = 271
      Top = 32
      Width = 90
      Height = 21
      EditMask = '!99999;1; '
      MaxLength = 5
      TabOrder = 6
      Text = '     '
    end
    object MaskEdit1: TMaskEdit
      Left = 461
      Top = 32
      Width = 86
      Height = 21
      EditMask = '!9,999;1; '
      MaxLength = 5
      TabOrder = 7
      Text = ' ,   '
      OnChange = MaskEdit1Change
    end
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 289
    Width = 361
    Height = 89
    Caption = #1057#1080#1089#1090#1077#1084#1072':'
    TabOrder = 1
    object Label2: TLabel
      Left = 9
      Top = 17
      Width = 106
      Height = 13
      Caption = #1055#1088#1080#1085#1103#1090#1086' '#1089#1086#1086#1073#1097#1077#1085#1080#1077':'
    end
    object Label3: TLabel
      Left = 101
      Top = 36
      Width = 249
      Height = 45
      Alignment = taCenter
      AutoSize = False
      Caption = '0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -43
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label1: TLabel
      Left = 9
      Top = 52
      Width = 86
      Height = 13
      Caption = #1048#1079#1084#1077#1088#1077#1085#1085#1099#1081' '#1074#1077#1089':'
    end
    object inputString: TLabel
      Left = 140
      Top = 17
      Width = 100
      Height = 13
      Alignment = taCenter
      AutoSize = False
    end
  end
  object GroupBox3: TGroupBox
    Left = 8
    Top = 121
    Width = 561
    Height = 162
    Caption = #1044#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1072#1103' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1103':'
    TabOrder = 2
    object Label7: TLabel
      Left = 8
      Top = 24
      Width = 70
      Height = 13
      Caption = #1054#1088#1075#1072#1085#1080#1079#1072#1094#1080#1103':'
    end
    object Label8: TLabel
      Left = 9
      Top = 67
      Width = 27
      Height = 13
      Caption = #1043#1088#1091#1079':'
    end
    object Label15: TLabel
      Left = 271
      Top = 21
      Width = 211
      Height = 13
      Caption = #1042#1079#1074#1077#1096#1080#1074#1072#1085#1080#1077' '#1085#1077#1074#1099#1077#1093#1072#1074#1096#1077#1075#1086' '#1090#1088#1072#1085#1089#1087#1086#1088#1090#1072':'
    end
    object SpeedButton1: TSpeedButton
      Left = 488
      Top = 12
      Width = 23
      Height = 22
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
        5555555555555555555555555555555555555555555555555555555555555555
        55555555FFFFFFFFFF5555500000000005555557777777777F55550BFBFBFBFB
        0555557F555555557F55550FBFBFBFBF0555557F555555557F55550BFBFBFBFB
        0555557F555555557F55550FBFBFBFBF0555557F555555557F55550BFBFBFBFB
        0555557F555555557F55550FBFBFBFBF0555557FFFFFFFFF7555550000000000
        555555777777777755555550FBFB0555555555575FFF75555555555700007555
        5555555577775555555555555555555555555555555555555555555555555555
        5555555555555555555555555555555555555555555555555555}
      NumGlyphs = 2
      OnClick = SpeedButton1Click
    end
    object Label12: TLabel
      Left = 8
      Top = 112
      Width = 47
      Height = 13
      Caption = #1055#1086#1084#1077#1090#1082#1072':'
    end
    object ComboBox1: TComboBox
      Left = 8
      Top = 40
      Width = 145
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 0
    end
    object ComboBox2: TComboBox
      Left = 8
      Top = 88
      Width = 145
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 1
    end
    object ListView1: TListView
      Left = 223
      Top = 40
      Width = 330
      Height = 113
      Columns = <
        item
          Caption = #8470' '#1074#1079#1074#1077#1096'.'
          Width = 65
        end
        item
          Caption = #1054#1088#1075#1072#1085#1080#1079#1072#1094#1080#1103
          Width = 185
        end
        item
          Caption = #1042#1077#1089', '#1082#1075
          Width = 60
        end>
      GridLines = True
      ReadOnly = True
      RowSelect = True
      TabOrder = 2
      ViewStyle = vsReport
      Visible = False
      OnSelectItem = ListView1SelectItem
    end
    object addFirm: TButton
      Left = 159
      Top = 40
      Width = 58
      Height = 17
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      TabOrder = 3
      OnClick = addFirmClick
    end
    object addMat: TButton
      Left = 159
      Top = 88
      Width = 58
      Height = 17
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      TabOrder = 4
      OnClick = addMatClick
    end
    object Edit8: TEdit
      Left = 8
      Top = 128
      Width = 209
      Height = 21
      TabOrder = 5
    end
  end
  object GroupBox5: TGroupBox
    Left = 375
    Top = 289
    Width = 194
    Height = 89
    Caption = #1057#1086#1089#1090#1086#1103#1085#1080#1077' '#1074#1079#1074#1077#1096#1080#1074#1072#1085#1080#1103':'
    TabOrder = 3
    object Label10: TLabel
      Left = 10
      Top = 23
      Width = 30
      Height = 13
      Caption = #1042#1077#1089' 1:'
    end
    object Label11: TLabel
      Left = 46
      Top = 13
      Width = 42
      Height = 25
      Caption = '0 '#1082#1075
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label23: TLabel
      Left = 10
      Top = 47
      Width = 30
      Height = 13
      Caption = #1042#1077#1089' 2:'
    end
    object Label24: TLabel
      Left = 46
      Top = 37
      Width = 42
      Height = 25
      Caption = '0 '#1082#1075
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label22: TLabel
      Left = 10
      Top = 63
      Width = 179
      Height = 19
      Caption = #1053#1072#1095#1072#1090#1086' '#1074#1079#1074#1077#1096#1080#1074#1072#1085#1080#1077
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
  end
  object Button1: TButton
    Left = 178
    Top = 384
    Width = 117
    Height = 25
    Caption = #1053#1086#1074#1086#1077' '#1074#1079#1074#1077#1096#1080#1074#1072#1085#1080#1077
    TabOrder = 4
    OnClick = Button1Click
  end
  object GroupBox4: TGroupBox
    Left = 575
    Top = 8
    Width = 177
    Height = 370
    Caption = #1056#1077#1079#1091#1083#1100#1090#1072#1090#1099' '#1074#1079#1074#1077#1096#1080#1074#1072#1085#1080#1103':'
    TabOrder = 5
    object Label17: TLabel
      Left = 22
      Top = 141
      Width = 54
      Height = 33
      Caption = '0 '#1082#1075
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -27
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label18: TLabel
      Left = 8
      Top = 128
      Width = 35
      Height = 13
      Caption = #1053#1077#1090#1090#1086':'
    end
    object Label19: TLabel
      Left = 8
      Top = 23
      Width = 40
      Height = 13
      Caption = #1041#1088#1091#1090#1090#1086':'
    end
    object Label20: TLabel
      Left = 22
      Top = 37
      Width = 54
      Height = 33
      Caption = '0 '#1082#1075
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -27
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label25: TLabel
      Left = 8
      Top = 76
      Width = 28
      Height = 13
      Caption = #1058#1072#1088#1072':'
    end
    object Label26: TLabel
      Left = 22
      Top = 89
      Width = 54
      Height = 33
      Caption = '0 '#1082#1075
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -27
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label27: TLabel
      Left = 8
      Top = 180
      Width = 113
      Height = 13
      Caption = #1053#1077#1090#1090#1086' '#1087#1086' '#1082#1072#1083#1080#1073#1088#1086#1074#1082#1077':'
    end
    object Label28: TLabel
      Left = 22
      Top = 199
      Width = 54
      Height = 33
      Caption = '0 '#1082#1075
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -27
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label29: TLabel
      Left = 8
      Top = 240
      Width = 37
      Height = 13
      Caption = #1054#1073#1098#1077#1084':'
    end
    object Label30: TLabel
      Left = 22
      Top = 259
      Width = 43
      Height = 33
      Caption = '0 '#1083
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -27
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object Button3: TButton
    Left = 516
    Top = 385
    Width = 103
    Height = 25
    Caption = #1057#1073#1088#1086#1089
    Enabled = False
    TabOrder = 6
    OnClick = Button3Click
  end
  object Button2: TButton
    Left = 301
    Top = 385
    Width = 117
    Height = 25
    Caption = #1047#1072#1092#1080#1082#1089#1080#1088#1086#1074#1072#1090#1100
    Enabled = False
    TabOrder = 7
    OnClick = Button2Click
  end
  object Button4: TButton
    Left = 421
    Top = 385
    Width = 89
    Height = 25
    Caption = #1047#1072#1087#1080#1089#1072#1090#1100
    Enabled = False
    TabOrder = 8
    OnClick = Timer3Timer
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 500
    OnTimer = Timer1Timer
    Left = 104
    Top = 384
  end
  object Timer3: TTimer
    Enabled = False
    Interval = 30000
    OnTimer = Timer3Timer
    Left = 72
    Top = 384
  end
  object ADOStoredProc1: TADOStoredProc
    ProcedureName = 'addWeightings;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@dataNode'
        Attributes = [paNullable]
        DataType = ftWord
        Precision = 3
        Value = Null
      end
      item
        Name = '@weightTime'
        Attributes = [paNullable]
        DataType = ftWideString
        Size = 8
        Value = Null
      end
      item
        Name = '@weightNumber'
        Attributes = [paNullable]
        DataType = ftLargeint
        Precision = 19
        Value = Null
      end
      item
        Name = '@opid'
        Attributes = [paNullable]
        DataType = ftWord
        Precision = 3
        Value = Null
      end
      item
        Name = '@in_date'
        Attributes = [paNullable]
        DataType = ftWideString
        Size = 10
        Value = Null
      end
      item
        Name = '@in_time'
        Attributes = [paNullable]
        DataType = ftWideString
        Size = 8
        Value = Null
      end
      item
        Name = '@netto_1'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@brutto_1'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@present'
        Attributes = [paNullable]
        DataType = ftSmallint
        Precision = 5
        Value = Null
      end
      item
        Name = '@trucknumber'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@org_id'
        Attributes = [paNullable]
        DataType = ftWord
        Precision = 3
        Value = Null
      end
      item
        Name = '@load_id'
        Attributes = [paNullable]
        DataType = ftWord
        Precision = 3
        Value = Null
      end
      item
        Name = '@truckCode'
        Attributes = [paNullable]
        DataType = ftLargeint
        Precision = 19
        Value = Null
      end>
    Left = 136
    Top = 384
  end
  object ADOStoredProc2: TADOStoredProc
    ProcedureName = 'updateWeightings;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@updateRecord'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@netto2'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@brutto2'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@out_date'
        Attributes = [paNullable]
        DataType = ftWideString
        Size = 10
        Value = Null
      end
      item
        Name = '@out_time'
        Attributes = [paNullable]
        DataType = ftWideString
        Size = 8
        Value = Null
      end
      item
        Name = '@present'
        Attributes = [paNullable]
        DataType = ftSmallint
        Precision = 5
        Value = Null
      end>
    Left = 168
    Top = 384
  end
end
