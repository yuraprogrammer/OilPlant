object frmAddNaklad: TfrmAddNaklad
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #1058#1086#1074#1072#1088#1085#1086'-'#1090#1088#1072#1085#1089#1087#1086#1088#1090#1085#1072#1103' '#1085#1072#1082#1083#1072#1076#1085#1072#1103
  ClientHeight = 430
  ClientWidth = 425
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 409
    Height = 383
    Caption = #1044#1072#1085#1085#1099#1077' '#1087#1086' '#1085#1072#1082#1083#1072#1076#1085#1086#1081':'
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 16
      Width = 75
      Height = 13
      Caption = #8470' '#1085#1072#1082#1083#1072#1076#1085#1086#1081':'
    end
    object Label2: TLabel
      Left = 9
      Top = 59
      Width = 74
      Height = 13
      Caption = #1058#1080#1087' '#1094#1080#1089#1090#1077#1088#1085#1099':'
    end
    object Label3: TLabel
      Left = 291
      Top = 16
      Width = 91
      Height = 13
      Caption = #1060'.'#1048'.'#1054'. '#1074#1086#1076#1080#1090#1077#1083#1103':'
    end
    object Label4: TLabel
      Left = 87
      Top = 59
      Width = 128
      Height = 13
      Caption = #1059#1088#1086#1074#1077#1085#1100' '#1079#1072#1087#1086#1083#1085#1077#1085#1080#1103', '#1084#1084':'
    end
    object Label5: TLabel
      Left = 219
      Top = 59
      Width = 92
      Height = 13
      Caption = #1055#1083#1086#1090#1085#1086#1089#1090#1100', '#1082#1075'/'#1084'3:'
    end
    object Label6: TLabel
      Left = 8
      Top = 104
      Width = 139
      Height = 13
      Caption = #1059#1088#1086#1074#1077#1085#1100' '#1079#1072#1087#1086#1083#1085#1077#1085#1080#1103' '#1074#1086#1076#1099':'
    end
    object Label7: TLabel
      Left = 8
      Top = 120
      Width = 12
      Height = 13
      Caption = #1084#1084
    end
    object Label8: TLabel
      Left = 141
      Top = 123
      Width = 11
      Height = 13
      Caption = #1082#1075
    end
    object Label9: TLabel
      Left = 273
      Top = 120
      Width = 85
      Height = 13
      Caption = #1052#1072#1089#1089#1072' '#1085#1077#1090#1090#1086', '#1082#1075':'
    end
    object Label10: TLabel
      Left = 8
      Top = 168
      Width = 108
      Height = 13
      Caption = #1055#1088#1080#1074#1103#1079#1072#1090#1100' '#1082' '#1084#1072#1096#1080#1085#1077':'
    end
    object Label11: TLabel
      Left = 317
      Top = 59
      Width = 84
      Height = 13
      Caption = #1058#1077#1084#1087#1077#1088#1072#1090#1091#1088#1072', '#1057':'
    end
    object Label12: TLabel
      Left = 89
      Top = 16
      Width = 72
      Height = 13
      Caption = #1044#1072#1090#1072' '#1074#1099#1076#1072#1095#1080':'
    end
    object Label13: TLabel
      Left = 177
      Top = 16
      Width = 63
      Height = 13
      Caption = #1052#1072#1088#1082#1072' '#1072#1074#1090#1086':'
    end
    object Edit1: TEdit
      Left = 8
      Top = 32
      Width = 73
      Height = 21
      TabOrder = 0
    end
    object Edit2: TEdit
      Left = 291
      Top = 32
      Width = 108
      Height = 21
      TabOrder = 1
    end
    object MaskEdit1: TMaskEdit
      Left = 87
      Top = 78
      Width = 126
      Height = 21
      EditMask = '!99999;1; '
      MaxLength = 5
      TabOrder = 2
      Text = '     '
    end
    object MaskEdit2: TMaskEdit
      Left = 219
      Top = 78
      Width = 88
      Height = 21
      EditMask = '0,99999;1; '
      MaxLength = 7
      TabOrder = 3
      Text = ' ,     '
    end
    object MaskEdit3: TMaskEdit
      Left = 9
      Top = 139
      Width = 126
      Height = 21
      EditMask = '!99999;1; '
      MaxLength = 5
      TabOrder = 4
      Text = '     '
    end
    object MaskEdit4: TMaskEdit
      Left = 141
      Top = 139
      Width = 126
      Height = 21
      EditMask = '!99999;1; '
      MaxLength = 5
      TabOrder = 5
      Text = '     '
    end
    object MaskEdit5: TMaskEdit
      Left = 273
      Top = 139
      Width = 125
      Height = 21
      EditMask = '!99999;1; '
      MaxLength = 5
      TabOrder = 6
      Text = '     '
    end
    object truckView: TListView
      Left = 9
      Top = 187
      Width = 389
      Height = 182
      Columns = <
        item
          Caption = #1042#1079#1074#1077#1096#1080#1074#1072#1085#1080#1077
          Width = 100
        end
        item
          Caption = #1042#1077#1089', '#1082#1075
          Width = 75
        end
        item
          Caption = #1054#1088#1075#1072#1085#1080#1079#1072#1094#1080#1103
          Width = 200
        end>
      GridLines = True
      RowSelect = True
      TabOrder = 7
      ViewStyle = vsReport
      OnSelectItem = truckViewSelectItem
    end
    object MaskEdit6: TMaskEdit
      Left = 9
      Top = 78
      Width = 74
      Height = 21
      EditMask = '!99999;1; '
      MaxLength = 5
      TabOrder = 8
      Text = '     '
    end
    object calendar: TDateTimePicker
      Left = 89
      Top = 32
      Width = 82
      Height = 21
      Date = 40148.567583912040000000
      Time = 40148.567583912040000000
      TabOrder = 9
    end
    object Edit3: TEdit
      Left = 177
      Top = 32
      Width = 108
      Height = 21
      TabOrder = 10
    end
    object MaskEdit7: TEdit
      Left = 313
      Top = 78
      Width = 89
      Height = 21
      TabOrder = 11
    end
  end
  object saveNaklad: TButton
    Left = 71
    Top = 397
    Width = 131
    Height = 25
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    Default = True
    Enabled = False
    TabOrder = 1
    OnClick = saveNakladClick
  end
  object Button3: TButton
    Left = 208
    Top = 397
    Width = 131
    Height = 25
    Caption = #1042#1099#1093#1086#1076
    TabOrder = 2
    OnClick = Button3Click
  end
  object ADOStoredProc1: TADOStoredProc
    ConnectionString = 
      'Provider=MSDASQL.1;Password=27121979;Persist Security Info=True;' +
      'User ID=db_dev;Data Source=alexprom'
    ProcedureName = 'addNaklad;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@naklad_num'
        Attributes = [paNullable]
        DataType = ftWideString
        Size = 10
        Value = Null
      end
      item
        Name = '@matLevel'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@plotnost'
        Attributes = [paNullable]
        DataType = ftFloat
        Precision = 7
        Value = Null
      end
      item
        Name = '@waterLevel_mm'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@waterLevel_kg'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@weight'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@weightingNumber'
        Attributes = [paNullable]
        DataType = ftLargeint
        Precision = 19
        Value = Null
      end
      item
        Name = '@driverFIO'
        Attributes = [paNullable]
        DataType = ftWideString
        Size = 50
        Value = Null
      end
      item
        Name = '@Temperature'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@naklad_date'
        Attributes = [paNullable]
        DataType = ftWideString
        Size = 10
        Value = Null
      end
      item
        Name = '@truckModel'
        Attributes = [paNullable]
        DataType = ftWideString
        Size = 10
        Value = Null
      end>
    Left = 344
    Top = 392
  end
end
