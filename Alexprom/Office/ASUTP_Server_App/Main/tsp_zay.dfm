object frmTSP1: TfrmTSP1
  Left = 0
  Top = 0
  Caption = #1042#1079#1074#1077#1096#1080#1074#1072#1085#1080#1077
  ClientHeight = 644
  ClientWidth = 922
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
  DesignSize = (
    922
    644)
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 8
    Top = 0
    Width = 741
    Height = 53
    Caption = #1048#1089#1093#1086#1076#1085#1099#1077' '#1076#1072#1085#1085#1099#1077':'
    TabOrder = 0
    object Label21: TLabel
      Left = 367
      Top = 3
      Width = 66
      Height = 13
      Caption = #1058#1077#1084#1087#1077#1088#1072#1090#1091#1088#1072
    end
    object Label9: TLabel
      Left = 461
      Top = 3
      Width = 58
      Height = 13
      Caption = #1055#1083#1086#1090#1085#1086#1089#1090#1100':'
    end
    object Edit7: TMaskEdit
      Left = 359
      Top = 22
      Width = 81
      Height = 21
      TabOrder = 1
      OnChange = Edit7Change
    end
    object MaskEdit1: TMaskEdit
      Left = 461
      Top = 22
      Width = 86
      Height = 21
      EditMask = '!9,999;1; '
      MaxLength = 5
      TabOrder = 0
      Text = ' ,   '
      OnChange = MaskEdit1Change
    end
  end
  object GroupBox2: TGroupBox
    Left = 15
    Top = 497
    Width = 433
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
      Top = 28
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
    Top = 49
    Width = 741
    Height = 234
    Caption = #1044#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1072#1103' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1103':'
    TabOrder = 2
    object ListView1: TListView
      Left = 2
      Top = 10
      Width = 737
      Height = 222
      Align = alBottom
      Anchors = []
      Columns = <
        item
          Caption = #8470' '#1079#1072#1103#1074#1082#1080
        end
        item
          Caption = #1044#1072#1090#1072
        end
        item
          Caption = #1050#1086#1085#1090#1088#1072#1075#1077#1085#1090
          Width = 80
        end
        item
          Caption = #1058#1052#1062
          Width = 60
        end
        item
          Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086
          Width = 60
        end
        item
          Caption = #1054#1073#1098#1105#1084
          Width = 60
        end
        item
          Caption = #1058#1077#1084#1087#1077#1088#1072#1090#1091#1088#1072
        end
        item
          Caption = #1055#1083#1086#1090#1085#1086#1089#1090#1100
        end
        item
          Caption = #1052#1072#1089#1089#1072
        end
        item
          Caption = #1055#1086#1075#1088#1091#1079#1082#1072
        end
        item
          Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
          Width = 100
        end
        item
          Caption = #1055#1083#1072#1085#1080#1088#1091#1077#1084#1086#1077' '#1074#1088#1077#1084#1103' '#1087#1088#1080#1073#1099#1090#1080#1103
        end>
      GridLines = True
      HideSelection = False
      ReadOnly = True
      RowSelect = True
      TabOrder = 0
      ViewStyle = vsReport
      OnSelectItem = ListView1SelectItem
    end
  end
  object GroupBox5: TGroupBox
    Left = 664
    Top = 497
    Width = 241
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
    Left = 241
    Top = 611
    Width = 117
    Height = 25
    Caption = #1053#1086#1074#1086#1077' '#1074#1079#1074#1077#1096#1080#1074#1072#1085#1080#1077
    TabOrder = 4
    OnClick = Button1Click
  end
  object Button3: TButton
    Left = 628
    Top = 611
    Width = 103
    Height = 25
    Caption = #1057#1073#1088#1086#1089
    Enabled = False
    TabOrder = 5
    OnClick = Button3Click
  end
  object Button2: TButton
    Left = 375
    Top = 611
    Width = 117
    Height = 25
    Caption = #1047#1072#1092#1080#1082#1089#1080#1088#1086#1074#1072#1090#1100
    Enabled = False
    TabOrder = 6
    OnClick = Button2Click
  end
  object Button4: TButton
    Left = 517
    Top = 611
    Width = 89
    Height = 25
    Caption = #1047#1072#1087#1080#1089#1072#1090#1100
    Enabled = False
    TabOrder = 7
    OnClick = Timer3Timer
  end
  object GroupBox4: TGroupBox
    Left = 755
    Top = 0
    Width = 159
    Height = 370
    Caption = #1056#1077#1079#1091#1083#1100#1090#1072#1090#1099' '#1074#1079#1074#1077#1096#1080#1074#1072#1085#1080#1103':'
    TabOrder = 8
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
  object ListView2: TListView
    Left = 8
    Top = 287
    Width = 741
    Height = 204
    Anchors = []
    Columns = <
      item
        Caption = #8470
        MaxWidth = 1
        Width = 0
      end
      item
        Caption = #1044#1072#1090#1072
        Width = 60
      end
      item
        Caption = #1042#1088#1077#1084#1103' '#1074#1099#1077#1079#1076#1072' '#1089' '#1058#1057#1055
      end
      item
        Caption = #1055#1086#1089#1090#1072#1074#1097#1080#1082
        Width = 100
      end
      item
        Caption = #1058#1052#1062
        Width = 60
      end
      item
        Caption = #1054#1073#1098#1105#1084
        Width = 70
      end
      item
        Caption = #1058#1088#1072#1085#1089#1087#1086#1088#1090
        Width = 150
      end
      item
        Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
        Width = 200
      end>
    GridLines = True
    HideSelection = False
    ReadOnly = True
    RowSelect = True
    TabOrder = 9
    ViewStyle = vsReport
    OnSelectItem = ListView2SelectItem
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 500
    OnTimer = Timer1Timer
    Left = 112
    Top = 608
  end
  object Timer3: TTimer
    Enabled = False
    Interval = 30000
    OnTimer = Timer3Timer
    Left = 80
    Top = 608
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
    Left = 144
    Top = 608
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
    Left = 176
    Top = 608
  end
  object Timer2: TTimer
    Enabled = False
    Interval = 30000
    OnTimer = Timer2Timer
    Left = 48
    Top = 608
  end
end
