object GeometricData: TGeometricData
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'GeometricData'
  ClientHeight = 471
  ClientWidth = 978
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
  object Label3: TLabel
    Left = 8
    Top = 440
    Width = 110
    Height = 13
    Caption = #1042#1099#1073#1077#1088#1080#1090#1077' '#1088#1077#1079#1077#1088#1074#1091#1072#1088':'
  end
  object Label4: TLabel
    Left = 216
    Top = 443
    Width = 102
    Height = 13
    Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1087#1086#1103#1089#1086#1074':'
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 978
    Height = 431
    ActivePage = TabSheet1
    Align = alTop
    TabOrder = 0
    OnChange = PageControl1Change
    object TabSheet1: TTabSheet
      Caption = #1057#1090#1077#1087#1077#1085#1100' '#1085#1072#1082#1083#1086#1085#1072
      object Panel1: TPanel
        Left = 0
        Top = -13
        Width = 737
        Height = 431
        BevelInner = bvLowered
        BevelOuter = bvLowered
        TabOrder = 0
        object Label1: TLabel
          Left = 16
          Top = 176
          Width = 154
          Height = 13
          Caption = #1057#1090#1077#1087#1077#1085#1100' '#1085#1072#1082#1083#1086#1085#1072' '#1088#1077#1079#1077#1088#1074#1091#1072#1088#1072':'
        end
        object Label2: TLabel
          Left = 199
          Top = 176
          Width = 16
          Height = 13
          Caption = '0.0'
        end
        object Panel2: TPanel
          Left = 0
          Top = 18
          Width = 105
          Height = 72
          Caption = #8470' '#1080#1079#1084#1077#1088#1077#1085#1080#1103
          TabOrder = 0
        end
        object Panel3: TPanel
          Left = 105
          Top = 0
          Width = 625
          Height = 17
          Caption = #1055#1086#1082#1072#1079#1072#1085#1080#1103', '#1084#1084
          TabOrder = 1
        end
        object Panel4: TPanel
          Left = 105
          Top = 17
          Width = 193
          Height = 73
          Caption = '1-'#1081' '#1083#1080#1085#1077#1081#1082#1080
          TabOrder = 2
        end
        object Panel5: TPanel
          Left = 298
          Top = 17
          Width = 201
          Height = 73
          Caption = '2-'#1081' '#1083#1080#1085#1077#1081#1082#1080
          TabOrder = 3
        end
        object Panel6: TPanel
          Left = 499
          Top = 17
          Width = 231
          Height = 73
          Caption = #1088#1072#1089#1089#1090#1086#1103#1085#1080#1077' '#1084#1077#1078#1076#1091' '#1083#1080#1085#1077#1081#1082#1072#1084#1080' '
          TabOrder = 4
        end
        object Panel7: TPanel
          Left = 0
          Top = 90
          Width = 105
          Height = 31
          Caption = '1'
          TabOrder = 5
        end
        object Panel8: TPanel
          Left = 0
          Top = 121
          Width = 105
          Height = 31
          Caption = '2'
          TabOrder = 6
        end
        object Panel9: TPanel
          Left = 105
          Top = 90
          Width = 193
          Height = 31
          Caption = '1'
          TabOrder = 7
          object MaskEdit1: TMaskEdit
            Left = 6
            Top = 4
            Width = 181
            Height = 21
            TabOrder = 0
            Text = '0'
            OnChange = MaskEdit1Change
          end
        end
        object Panel10: TPanel
          Left = 298
          Top = 90
          Width = 201
          Height = 31
          Caption = '1'
          TabOrder = 8
          object MaskEdit3: TMaskEdit
            Left = 6
            Top = 4
            Width = 189
            Height = 21
            TabOrder = 0
            Text = '0'
            OnChange = MaskEdit1Change
          end
        end
        object Panel11: TPanel
          Left = 499
          Top = 90
          Width = 231
          Height = 31
          Caption = '1'
          TabOrder = 9
          object MaskEdit5: TMaskEdit
            Left = 6
            Top = 4
            Width = 219
            Height = 21
            TabOrder = 0
            Text = '0'
            OnChange = MaskEdit1Change
          end
        end
        object Panel12: TPanel
          Left = 105
          Top = 121
          Width = 193
          Height = 31
          Caption = '1'
          TabOrder = 10
          object MaskEdit2: TMaskEdit
            Left = 6
            Top = 6
            Width = 181
            Height = 21
            TabOrder = 0
            Text = '0'
            OnChange = MaskEdit1Change
          end
        end
        object Panel13: TPanel
          Left = 298
          Top = 121
          Width = 201
          Height = 31
          Caption = '1'
          TabOrder = 11
          object MaskEdit4: TMaskEdit
            Left = 6
            Top = 6
            Width = 189
            Height = 21
            TabOrder = 0
            Text = '0'
            OnChange = MaskEdit1Change
          end
        end
        object Panel14: TPanel
          Left = 499
          Top = 121
          Width = 231
          Height = 31
          Caption = '1'
          TabOrder = 12
          object MaskEdit6: TMaskEdit
            Left = 6
            Top = 4
            Width = 219
            Height = 21
            TabOrder = 0
            Text = '0'
            OnChange = MaskEdit1Change
          end
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = #1042#1085#1091#1090#1088#1077#1085#1085#1080#1077' '#1076#1080#1072#1084#1077#1090#1088#1099' '#1087#1086#1103#1089#1086#1074
      ImageIndex = 1
      object StringGrid1: TStringGrid
        Left = 3
        Top = 88
        Width = 955
        Height = 313
        BevelInner = bvLowered
        ColCount = 13
        DefaultColWidth = 70
        DefaultRowHeight = 15
        FixedCols = 0
        RowCount = 24
        FixedRows = 0
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
        ScrollBars = ssVertical
        TabOrder = 0
      end
      object Panel15: TPanel
        Left = 3
        Top = 27
        Width = 70
        Height = 60
        BevelInner = bvLowered
        BevelOuter = bvLowered
        Caption = #8470' '#1087#1086#1103#1089#1072
        TabOrder = 1
      end
      object Panel16: TPanel
        Left = 73
        Top = 27
        Width = 286
        Height = 19
        BevelInner = bvLowered
        BevelOuter = bvLowered
        Caption = #1051#1077#1074#1086#1077' '#1089#1077#1095#1077#1085#1080#1077
        TabOrder = 2
      end
      object Panel17: TPanel
        Left = 358
        Top = 27
        Width = 287
        Height = 19
        BevelInner = bvLowered
        BevelOuter = bvLowered
        Caption = #1057#1088#1077#1076#1085#1077#1077' '#1089#1077#1095#1077#1085#1080#1077
        TabOrder = 3
      end
      object Panel18: TPanel
        Left = 644
        Top = 27
        Width = 287
        Height = 19
        BevelInner = bvLowered
        BevelOuter = bvLowered
        Caption = #1055#1088#1072#1074#1086#1077' '#1089#1077#1095#1077#1085#1080#1077
        TabOrder = 4
      end
      object Panel19: TPanel
        Left = 73
        Top = 67
        Width = 70
        Height = 20
        BevelInner = bvLowered
        BevelOuter = bvLowered
        Caption = '1 '#1080#1079#1084#1077#1088#1077#1085#1080#1077
        TabOrder = 5
      end
      object Panel20: TPanel
        Left = 145
        Top = 67
        Width = 70
        Height = 20
        BevelInner = bvLowered
        BevelOuter = bvLowered
        Caption = '2 '#1080#1079#1084#1077#1088#1077#1085#1080#1077
        TabOrder = 6
      end
      object Panel21: TPanel
        Left = 289
        Top = 67
        Width = 70
        Height = 20
        BevelInner = bvLowered
        BevelOuter = bvLowered
        Caption = '2 '#1080#1079#1084#1077#1088#1077#1085#1080#1077
        TabOrder = 7
      end
      object Panel22: TPanel
        Left = 217
        Top = 67
        Width = 70
        Height = 20
        BevelInner = bvLowered
        BevelOuter = bvLowered
        Caption = '1 '#1080#1079#1084#1077#1088#1077#1085#1080#1077
        TabOrder = 8
      end
      object Panel23: TPanel
        Left = 72
        Top = 47
        Width = 143
        Height = 19
        BevelInner = bvLowered
        BevelOuter = bvLowered
        Caption = #1043#1086#1088#1080#1079#1086#1085#1090#1072#1083#1100#1085#1086#1077
        TabOrder = 9
      end
      object Panel24: TPanel
        Left = 215
        Top = 47
        Width = 143
        Height = 19
        BevelInner = bvLowered
        BevelOuter = bvLowered
        Caption = #1042#1077#1088#1090#1080#1082#1072#1083#1100#1085#1086#1077
        TabOrder = 10
      end
      object Panel25: TPanel
        Left = 358
        Top = 47
        Width = 143
        Height = 19
        BevelInner = bvLowered
        BevelOuter = bvLowered
        Caption = #1043#1086#1088#1080#1079#1086#1085#1090#1072#1083#1100#1085#1086#1077
        TabOrder = 11
      end
      object Panel26: TPanel
        Left = 501
        Top = 47
        Width = 143
        Height = 19
        BevelInner = bvLowered
        BevelOuter = bvLowered
        Caption = #1042#1077#1088#1090#1080#1082#1072#1083#1100#1085#1086#1077
        TabOrder = 12
      end
      object Panel27: TPanel
        Left = 359
        Top = 67
        Width = 70
        Height = 20
        BevelInner = bvLowered
        BevelOuter = bvLowered
        Caption = '1 '#1080#1079#1084#1077#1088#1077#1085#1080#1077
        TabOrder = 13
      end
      object Panel28: TPanel
        Left = 431
        Top = 67
        Width = 70
        Height = 20
        BevelInner = bvLowered
        BevelOuter = bvLowered
        Caption = '2 '#1080#1079#1084#1077#1088#1077#1085#1080#1077
        TabOrder = 14
      end
      object Panel29: TPanel
        Left = 503
        Top = 67
        Width = 70
        Height = 20
        BevelInner = bvLowered
        BevelOuter = bvLowered
        Caption = '1 '#1080#1079#1084#1077#1088#1077#1085#1080#1077
        TabOrder = 15
      end
      object Panel30: TPanel
        Left = 575
        Top = 67
        Width = 70
        Height = 20
        BevelInner = bvLowered
        BevelOuter = bvLowered
        Caption = '2 '#1080#1079#1084#1077#1088#1077#1085#1080#1077
        TabOrder = 16
      end
      object Panel31: TPanel
        Left = 644
        Top = 47
        Width = 143
        Height = 19
        BevelInner = bvLowered
        BevelOuter = bvLowered
        Caption = #1043#1086#1088#1080#1079#1086#1085#1090#1072#1083#1100#1085#1086#1077
        TabOrder = 17
      end
      object Panel32: TPanel
        Left = 787
        Top = 47
        Width = 143
        Height = 19
        BevelInner = bvLowered
        BevelOuter = bvLowered
        Caption = #1042#1077#1088#1090#1080#1082#1072#1083#1100#1085#1086#1077
        TabOrder = 18
      end
      object Panel33: TPanel
        Left = 645
        Top = 67
        Width = 70
        Height = 20
        BevelInner = bvLowered
        BevelOuter = bvLowered
        Caption = '1 '#1080#1079#1084#1077#1088#1077#1085#1080#1077
        TabOrder = 19
      end
      object Panel34: TPanel
        Left = 717
        Top = 67
        Width = 70
        Height = 20
        BevelInner = bvLowered
        BevelOuter = bvLowered
        Caption = '2 '#1080#1079#1084#1077#1088#1077#1085#1080#1077
        TabOrder = 20
      end
      object Panel35: TPanel
        Left = 789
        Top = 67
        Width = 70
        Height = 20
        BevelInner = bvLowered
        BevelOuter = bvLowered
        Caption = '1 '#1080#1079#1084#1077#1088#1077#1085#1080#1077
        TabOrder = 21
      end
      object Panel36: TPanel
        Left = 861
        Top = 67
        Width = 70
        Height = 20
        BevelInner = bvLowered
        BevelOuter = bvLowered
        Caption = '2 '#1080#1079#1084#1077#1088#1077#1085#1080#1077
        TabOrder = 22
      end
    end
    object TabSheet3: TTabSheet
      Caption = #1053#1072#1088#1091#1078#1085#1099#1077' '#1080#1079#1084#1077#1088#1077#1085#1080#1103
      ImageIndex = 2
      object StringGrid2: TStringGrid
        Left = 3
        Top = 67
        Width = 955
        Height = 334
        BevelInner = bvLowered
        ColCount = 13
        DefaultColWidth = 70
        DefaultRowHeight = 15
        FixedCols = 0
        RowCount = 24
        FixedRows = 0
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
        ScrollBars = ssVertical
        TabOrder = 0
      end
      object Panel37: TPanel
        Left = 3
        Top = 7
        Width = 70
        Height = 59
        BevelInner = bvLowered
        BevelOuter = bvLowered
        Caption = #8470' '#1087#1086#1103#1089#1072
        TabOrder = 1
      end
      object Panel38: TPanel
        Left = 73
        Top = 46
        Width = 70
        Height = 20
        BevelInner = bvLowered
        BevelOuter = bvLowered
        Caption = '1 '#1080#1079#1084#1077#1088#1077#1085#1080#1077
        TabOrder = 2
      end
      object Panel39: TPanel
        Left = 145
        Top = 46
        Width = 70
        Height = 20
        BevelInner = bvLowered
        BevelOuter = bvLowered
        Caption = '2 '#1080#1079#1084#1077#1088#1077#1085#1080#1077
        TabOrder = 3
      end
      object Panel40: TPanel
        Left = 216
        Top = 46
        Width = 70
        Height = 20
        BevelInner = bvLowered
        BevelOuter = bvLowered
        Caption = '1 '#1080#1079#1084#1077#1088#1077#1085#1080#1077
        TabOrder = 4
      end
      object Panel41: TPanel
        Left = 288
        Top = 46
        Width = 70
        Height = 20
        BevelInner = bvLowered
        BevelOuter = bvLowered
        Caption = '2 '#1080#1079#1084#1077#1088#1077#1085#1080#1077
        TabOrder = 5
      end
      object Panel42: TPanel
        Left = 359
        Top = 46
        Width = 70
        Height = 20
        BevelInner = bvLowered
        BevelOuter = bvLowered
        Caption = '1 '#1080#1079#1084#1077#1088#1077#1085#1080#1077
        TabOrder = 6
      end
      object Panel43: TPanel
        Left = 431
        Top = 46
        Width = 70
        Height = 20
        BevelInner = bvLowered
        BevelOuter = bvLowered
        Caption = '2 '#1080#1079#1084#1077#1088#1077#1085#1080#1077
        TabOrder = 7
      end
      object Panel44: TPanel
        Left = 73
        Top = 27
        Width = 142
        Height = 19
        BevelInner = bvLowered
        BevelOuter = bvLowered
        Caption = #1051#1077#1074#1086#1077' '#1089#1077#1095#1077#1085#1080#1077
        TabOrder = 8
      end
      object Panel45: TPanel
        Left = 216
        Top = 27
        Width = 143
        Height = 19
        BevelInner = bvLowered
        BevelOuter = bvLowered
        Caption = #1057#1088#1077#1076#1085#1077#1077' '#1089#1077#1095#1077#1085#1080#1077
        TabOrder = 9
      end
      object Panel46: TPanel
        Left = 359
        Top = 27
        Width = 142
        Height = 19
        BevelInner = bvLowered
        BevelOuter = bvLowered
        Caption = #1055#1088#1072#1074#1086#1077' '#1089#1077#1095#1077#1085#1080#1077
        TabOrder = 10
      end
      object Panel47: TPanel
        Left = 502
        Top = 46
        Width = 70
        Height = 20
        BevelInner = bvLowered
        BevelOuter = bvLowered
        Caption = '1 '#1080#1079#1084#1077#1088#1077#1085#1080#1077
        TabOrder = 11
      end
      object Panel48: TPanel
        Left = 574
        Top = 46
        Width = 70
        Height = 20
        BevelInner = bvLowered
        BevelOuter = bvLowered
        Caption = '2 '#1080#1079#1084#1077#1088#1077#1085#1080#1077
        TabOrder = 12
      end
      object Panel49: TPanel
        Left = 502
        Top = 27
        Width = 142
        Height = 19
        BevelInner = bvLowered
        BevelOuter = bvLowered
        Caption = #1051#1077#1074#1086#1077' '#1089#1077#1095#1077#1085#1080#1077
        TabOrder = 13
      end
      object Panel50: TPanel
        Left = 645
        Top = 27
        Width = 143
        Height = 19
        BevelInner = bvLowered
        BevelOuter = bvLowered
        Caption = #1057#1088#1077#1076#1085#1077#1077' '#1089#1077#1095#1077#1085#1080#1077
        TabOrder = 14
      end
      object Panel51: TPanel
        Left = 645
        Top = 46
        Width = 70
        Height = 20
        BevelInner = bvLowered
        BevelOuter = bvLowered
        Caption = '1 '#1080#1079#1084#1077#1088#1077#1085#1080#1077
        TabOrder = 15
      end
      object Panel52: TPanel
        Left = 717
        Top = 46
        Width = 70
        Height = 20
        BevelInner = bvLowered
        BevelOuter = bvLowered
        Caption = '2 '#1080#1079#1084#1077#1088#1077#1085#1080#1077
        TabOrder = 16
      end
      object Panel53: TPanel
        Left = 788
        Top = 27
        Width = 142
        Height = 19
        BevelInner = bvLowered
        BevelOuter = bvLowered
        Caption = #1055#1088#1072#1074#1086#1077' '#1089#1077#1095#1077#1085#1080#1077
        TabOrder = 17
      end
      object Panel54: TPanel
        Left = 788
        Top = 46
        Width = 70
        Height = 20
        BevelInner = bvLowered
        BevelOuter = bvLowered
        Caption = '1 '#1080#1079#1084#1077#1088#1077#1085#1080#1077
        TabOrder = 18
      end
      object Panel55: TPanel
        Left = 860
        Top = 46
        Width = 70
        Height = 20
        BevelInner = bvLowered
        BevelOuter = bvLowered
        Caption = '2 '#1080#1079#1084#1077#1088#1077#1085#1080#1077
        TabOrder = 19
      end
      object Panel56: TPanel
        Left = 73
        Top = 7
        Width = 428
        Height = 19
        BevelInner = bvLowered
        BevelOuter = bvLowered
        Caption = #1053#1072#1088#1091#1078#1085#1099#1077' '#1076#1080#1072#1084#1077#1090#1088#1099' '#1087#1086#1103#1089#1086#1074
        TabOrder = 20
      end
      object Panel57: TPanel
        Left = 502
        Top = 7
        Width = 428
        Height = 19
        BevelInner = bvLowered
        BevelOuter = bvLowered
        Caption = #1044#1083#1080#1085#1099' '#1086#1082#1088#1091#1078#1085#1086#1089#1090#1080' '#1087#1086#1103#1089#1086#1074
        TabOrder = 21
      end
    end
    object TabSheet4: TTabSheet
      Caption = #1044#1088#1091#1075#1080#1077' '#1087#1072#1088#1072#1084#1077#1090#1088#1099' '#1087#1086#1103#1089#1086#1074
      ImageIndex = 3
      object Panel58: TPanel
        Left = 3
        Top = 27
        Width = 140
        Height = 39
        BevelInner = bvLowered
        BevelOuter = bvLowered
        Caption = #8470' '#1087#1086#1103#1089#1072
        TabOrder = 0
      end
      object Panel59: TPanel
        Left = 145
        Top = 46
        Width = 140
        Height = 20
        BevelInner = bvLowered
        BevelOuter = bvLowered
        Caption = '1 '#1080#1079#1084#1077#1088#1077#1085#1080#1077
        TabOrder = 1
      end
      object Panel60: TPanel
        Left = 287
        Top = 46
        Width = 140
        Height = 20
        BevelInner = bvLowered
        BevelOuter = bvLowered
        Caption = '2 '#1080#1079#1084#1077#1088#1077#1085#1080#1077
        TabOrder = 2
      end
      object Panel64: TPanel
        Left = 145
        Top = 27
        Width = 282
        Height = 19
        BevelInner = bvLowered
        BevelOuter = bvLowered
        Caption = #1044#1083#1080#1085#1072' '#1087#1086#1103#1089#1072
        TabOrder = 3
      end
      object Panel65: TPanel
        Left = 428
        Top = 27
        Width = 140
        Height = 39
        BevelInner = bvLowered
        BevelOuter = bvLowered
        Caption = #1058#1086#1083#1097#1080#1085#1072' '#1089#1090#1077#1085#1082#1080
        TabOrder = 4
      end
      object Panel66: TPanel
        Left = 569
        Top = 27
        Width = 140
        Height = 39
        BevelInner = bvLowered
        BevelOuter = bvLowered
        Caption = #1044#1083#1080#1085#1072' '#1085#1072#1093#1083#1077#1089#1090#1072
        TabOrder = 5
      end
      object StringGrid3: TStringGrid
        Left = 3
        Top = 67
        Width = 955
        Height = 334
        BevelInner = bvLowered
        ColCount = 6
        DefaultColWidth = 140
        DefaultRowHeight = 15
        FixedCols = 0
        RowCount = 24
        FixedRows = 0
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
        ScrollBars = ssVertical
        TabOrder = 6
      end
      object Panel61: TPanel
        Left = 710
        Top = 27
        Width = 140
        Height = 39
        BevelInner = bvLowered
        BevelOuter = bvLowered
        Caption = #1057#1093#1077#1084#1072' '#1085#1072#1093#1083#1077#1089#1090#1072
        TabOrder = 7
      end
    end
    object TabSheet5: TTabSheet
      Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099' '#1076#1085#1080#1097
      ImageIndex = 4
      object GroupBox1: TGroupBox
        Left = 0
        Top = 3
        Width = 966
        Height = 118
        TabOrder = 0
        object Panel62: TPanel
          Left = 10
          Top = 12
          Width = 146
          Height = 19
          BevelInner = bvLowered
          BevelOuter = bvLowered
          Caption = #8470' '#1076#1085#1080#1097#1072
          TabOrder = 0
        end
        object Panel69: TPanel
          Left = 10
          Top = 31
          Width = 146
          Height = 39
          BevelInner = bvLowered
          BevelOuter = bvLowered
          Caption = '1 ('#1087#1077#1088#1077#1076#1085#1077#1077')'
          TabOrder = 1
        end
        object Panel72: TPanel
          Left = 10
          Top = 71
          Width = 146
          Height = 39
          BevelInner = bvLowered
          BevelOuter = bvLowered
          Caption = '2 ('#1079#1072#1076#1085#1077#1077')'
          TabOrder = 2
        end
        object Panel63: TPanel
          Left = 157
          Top = 12
          Width = 225
          Height = 19
          BevelInner = bvLowered
          BevelOuter = bvLowered
          Caption = #1052#1077#1089#1090#1086' '#1080#1079#1084#1077#1088#1077#1085#1080#1081
          TabOrder = 3
        end
        object Panel67: TPanel
          Left = 157
          Top = 31
          Width = 225
          Height = 20
          BevelInner = bvLowered
          BevelOuter = bvLowered
          Caption = #1055#1086' '#1074#1077#1088#1093#1085#1077#1081' '#1086#1073#1088#1072#1079#1091#1102#1097#1077#1081
          TabOrder = 4
        end
        object Panel68: TPanel
          Left = 157
          Top = 50
          Width = 225
          Height = 20
          BevelInner = bvLowered
          BevelOuter = bvLowered
          Caption = #1055#1086' '#1085#1080#1078#1085#1077#1081' '#1086#1073#1088#1072#1079#1091#1102#1097#1077#1081
          TabOrder = 5
        end
        object Panel71: TPanel
          Left = 157
          Top = 70
          Width = 225
          Height = 20
          BevelInner = bvLowered
          BevelOuter = bvLowered
          Caption = #1055#1086' '#1074#1077#1088#1093#1085#1077#1081' '#1086#1073#1088#1072#1079#1091#1102#1097#1077#1081
          TabOrder = 6
        end
        object Panel73: TPanel
          Left = 157
          Top = 89
          Width = 225
          Height = 20
          BevelInner = bvLowered
          BevelOuter = bvLowered
          Caption = #1055#1086' '#1085#1080#1078#1085#1077#1081' '#1086#1073#1088#1072#1079#1091#1102#1097#1077#1081
          TabOrder = 7
        end
        object Panel70: TPanel
          Left = 382
          Top = 12
          Width = 178
          Height = 19
          BevelInner = bvLowered
          BevelOuter = bvLowered
          Caption = #1044#1083#1080#1085#1072' '#1074#1099#1089#1090#1091#1087#1072' '#1076#1085#1080#1097', '#1084#1084
          TabOrder = 8
        end
        object MaskEdit7: TMaskEdit
          Left = 382
          Top = 31
          Width = 178
          Height = 21
          TabOrder = 9
          Text = 'MaskEdit7'
        end
        object MaskEdit8: TMaskEdit
          Left = 382
          Top = 50
          Width = 178
          Height = 21
          TabOrder = 10
          Text = 'MaskEdit7'
        end
        object MaskEdit9: TMaskEdit
          Left = 382
          Top = 70
          Width = 178
          Height = 21
          TabOrder = 11
          Text = 'MaskEdit7'
        end
        object MaskEdit10: TMaskEdit
          Left = 382
          Top = 89
          Width = 178
          Height = 21
          TabOrder = 12
          Text = 'MaskEdit7'
        end
        object Panel83: TPanel
          Left = 560
          Top = 12
          Width = 191
          Height = 19
          BevelInner = bvLowered
          BevelOuter = bvLowered
          Caption = #1044#1083#1080#1085#1072' '#1091#1075#1083#1091#1073#1083#1077#1085#1080#1103' '#1076#1085#1080#1097', '#1084#1084
          TabOrder = 13
        end
        object MaskEdit15: TMaskEdit
          Left = 560
          Top = 31
          Width = 191
          Height = 21
          TabOrder = 14
          Text = 'MaskEdit7'
        end
        object MaskEdit16: TMaskEdit
          Left = 560
          Top = 50
          Width = 191
          Height = 21
          TabOrder = 15
          Text = 'MaskEdit7'
        end
        object MaskEdit17: TMaskEdit
          Left = 560
          Top = 70
          Width = 191
          Height = 21
          TabOrder = 16
          Text = 'MaskEdit7'
        end
        object MaskEdit18: TMaskEdit
          Left = 560
          Top = 89
          Width = 191
          Height = 21
          TabOrder = 17
          Text = 'MaskEdit7'
        end
        object Panel84: TPanel
          Left = 751
          Top = 12
          Width = 193
          Height = 19
          BevelInner = bvLowered
          BevelOuter = bvLowered
          Caption = #1042#1099#1087#1091#1082#1083#1086#1089#1090#1100' ('#1074#1099#1089#1086#1090#1072') '#1076#1085#1080#1097', '#1084#1084
          TabOrder = 18
        end
        object MaskEdit19: TMaskEdit
          Left = 751
          Top = 31
          Width = 193
          Height = 21
          TabOrder = 19
          Text = 'MaskEdit7'
        end
        object MaskEdit20: TMaskEdit
          Left = 751
          Top = 50
          Width = 193
          Height = 21
          TabOrder = 20
          Text = 'MaskEdit7'
        end
        object MaskEdit21: TMaskEdit
          Left = 751
          Top = 70
          Width = 193
          Height = 21
          TabOrder = 21
          Text = 'MaskEdit7'
        end
        object MaskEdit22: TMaskEdit
          Left = 751
          Top = 89
          Width = 193
          Height = 21
          TabOrder = 22
          Text = 'MaskEdit7'
        end
      end
      object GroupBox2: TGroupBox
        Left = 0
        Top = 115
        Width = 966
        Height = 114
        TabOrder = 1
        object Panel74: TPanel
          Left = 6
          Top = 11
          Width = 71
          Height = 19
          BevelInner = bvLowered
          BevelOuter = bvLowered
          Caption = #8470' '#1076#1085#1080#1097#1072
          TabOrder = 0
        end
        object Panel75: TPanel
          Left = 6
          Top = 30
          Width = 71
          Height = 39
          BevelInner = bvLowered
          BevelOuter = bvLowered
          Caption = '1 ('#1087#1077#1088#1077#1076#1085#1077#1077')'
          TabOrder = 1
        end
        object Panel76: TPanel
          Left = 6
          Top = 70
          Width = 71
          Height = 39
          BevelInner = bvLowered
          BevelOuter = bvLowered
          Caption = '2 ('#1079#1072#1076#1085#1077#1077')'
          TabOrder = 2
        end
        object Panel77: TPanel
          Left = 78
          Top = 11
          Width = 76
          Height = 19
          BevelInner = bvLowered
          BevelOuter = bvLowered
          Caption = #8470' '#1080#1079#1084#1077#1088#1077#1085#1080#1103
          TabOrder = 3
        end
        object Panel78: TPanel
          Left = 78
          Top = 30
          Width = 76
          Height = 20
          BevelInner = bvLowered
          BevelOuter = bvLowered
          Caption = '1'
          TabOrder = 4
        end
        object Panel79: TPanel
          Left = 78
          Top = 49
          Width = 76
          Height = 20
          BevelInner = bvLowered
          BevelOuter = bvLowered
          Caption = '2'
          TabOrder = 5
        end
        object Panel80: TPanel
          Left = 78
          Top = 69
          Width = 76
          Height = 20
          BevelInner = bvLowered
          BevelOuter = bvLowered
          Caption = '1'
          TabOrder = 6
        end
        object Panel81: TPanel
          Left = 78
          Top = 88
          Width = 76
          Height = 20
          BevelInner = bvLowered
          BevelOuter = bvLowered
          Caption = '2'
          TabOrder = 7
        end
        object Panel82: TPanel
          Left = 154
          Top = 11
          Width = 159
          Height = 19
          BevelInner = bvLowered
          BevelOuter = bvLowered
          Caption = #1043#1083#1091#1073#1080#1085#1072' '#1079#1072#1083#1086#1078#1077#1085#1080#1103' '#1076#1085#1080#1097', '#1084#1084
          TabOrder = 8
        end
        object MaskEdit11: TMaskEdit
          Left = 154
          Top = 30
          Width = 159
          Height = 21
          TabOrder = 9
          Text = 'MaskEdit7'
        end
        object MaskEdit12: TMaskEdit
          Left = 154
          Top = 49
          Width = 159
          Height = 21
          TabOrder = 10
          Text = 'MaskEdit7'
        end
        object MaskEdit13: TMaskEdit
          Left = 154
          Top = 69
          Width = 159
          Height = 21
          TabOrder = 11
          Text = 'MaskEdit7'
        end
        object MaskEdit14: TMaskEdit
          Left = 154
          Top = 88
          Width = 159
          Height = 21
          TabOrder = 12
          Text = 'MaskEdit7'
        end
        object Panel85: TPanel
          Left = 313
          Top = 11
          Width = 145
          Height = 19
          BevelInner = bvLowered
          BevelOuter = bvLowered
          Caption = #1058#1086#1083#1097#1080#1085#1072' '#1089#1090#1077#1085#1082#1080' '#1076#1085#1080#1097', '#1084#1084
          TabOrder = 13
        end
        object MaskEdit23: TMaskEdit
          Left = 313
          Top = 30
          Width = 145
          Height = 21
          TabOrder = 14
          Text = 'MaskEdit7'
        end
        object MaskEdit24: TMaskEdit
          Left = 313
          Top = 49
          Width = 145
          Height = 21
          TabOrder = 15
          Text = 'MaskEdit7'
        end
        object MaskEdit25: TMaskEdit
          Left = 313
          Top = 69
          Width = 145
          Height = 21
          TabOrder = 16
          Text = 'MaskEdit7'
        end
        object MaskEdit26: TMaskEdit
          Left = 313
          Top = 88
          Width = 145
          Height = 21
          TabOrder = 17
          Text = 'MaskEdit7'
        end
        object Panel86: TPanel
          Left = 459
          Top = 11
          Width = 186
          Height = 19
          BevelInner = bvLowered
          BevelOuter = bvLowered
          Caption = #1043#1083#1091#1073#1080#1085#1072' '#1079#1072#1083#1086#1078#1077#1085#1080#1103' '#1075#1086#1088#1083#1086#1074#1080#1085#1099', '#1084#1084
          TabOrder = 18
        end
        object MaskEdit27: TMaskEdit
          Left = 459
          Top = 30
          Width = 186
          Height = 21
          TabOrder = 19
          Text = 'MaskEdit7'
        end
        object MaskEdit28: TMaskEdit
          Left = 459
          Top = 49
          Width = 186
          Height = 21
          TabOrder = 20
          Text = 'MaskEdit7'
        end
        object MaskEdit29: TMaskEdit
          Left = 459
          Top = 69
          Width = 186
          Height = 21
          TabOrder = 21
          Text = 'MaskEdit7'
        end
        object MaskEdit30: TMaskEdit
          Left = 459
          Top = 88
          Width = 186
          Height = 21
          TabOrder = 22
          Text = 'MaskEdit7'
        end
        object Panel87: TPanel
          Left = 643
          Top = 11
          Width = 226
          Height = 19
          BevelInner = bvLowered
          BevelOuter = bvLowered
          Caption = #1050#1086#1086#1088#1076#1080#1085#1072#1090#1099' '#1090#1086#1095#1082#1080' '#1079#1072#1084#1077#1088#1072' '#1073#1072#1079#1086#1074#1086#1081' '#1074#1099#1089#1086#1090#1099
          TabOrder = 23
        end
        object MaskEdit31: TMaskEdit
          Left = 643
          Top = 30
          Width = 226
          Height = 21
          TabOrder = 24
          Text = 'MaskEdit7'
        end
        object MaskEdit32: TMaskEdit
          Left = 643
          Top = 49
          Width = 226
          Height = 21
          TabOrder = 25
          Text = 'MaskEdit7'
        end
        object MaskEdit33: TMaskEdit
          Left = 643
          Top = 69
          Width = 226
          Height = 21
          TabOrder = 26
          Text = 'MaskEdit7'
        end
        object MaskEdit34: TMaskEdit
          Left = 643
          Top = 88
          Width = 226
          Height = 21
          TabOrder = 27
          Text = 'MaskEdit7'
        end
        object Panel88: TPanel
          Left = 869
          Top = 11
          Width = 90
          Height = 19
          BevelInner = bvLowered
          BevelOuter = bvLowered
          Caption = #1041#1072#1079#1086#1074#1072#1103' '#1074#1099#1089#1086#1090#1072
          TabOrder = 28
        end
        object MaskEdit35: TMaskEdit
          Left = 869
          Top = 88
          Width = 89
          Height = 21
          TabOrder = 29
          Text = 'MaskEdit7'
        end
        object MaskEdit36: TMaskEdit
          Left = 869
          Top = 69
          Width = 89
          Height = 21
          TabOrder = 30
          Text = 'MaskEdit7'
        end
        object MaskEdit37: TMaskEdit
          Left = 869
          Top = 49
          Width = 89
          Height = 21
          TabOrder = 31
          Text = 'MaskEdit7'
        end
        object MaskEdit38: TMaskEdit
          Left = 869
          Top = 30
          Width = 89
          Height = 21
          TabOrder = 32
          Text = 'MaskEdit7'
        end
      end
      object GroupBox3: TGroupBox
        Left = 0
        Top = 235
        Width = 966
        Height = 166
        Caption = #1052#1072#1083#1099#1077' '#1076#1080#1072#1084#1077#1090#1088#1099' '#1091#1089#1077#1095#1077#1085#1085#1086'-'#1082#1086#1085#1080#1095#1077#1089#1082#1080#1093' '#1076#1085#1080#1097':'
        TabOrder = 2
        object Panel89: TPanel
          Left = 6
          Top = 19
          Width = 71
          Height = 57
          BevelInner = bvLowered
          BevelOuter = bvLowered
          Caption = #8470' '#1076#1085#1080#1097#1072
          TabOrder = 0
        end
        object Panel90: TPanel
          Left = 6
          Top = 77
          Width = 75
          Height = 41
          BevelInner = bvLowered
          BevelOuter = bvLowered
          Caption = '1 ('#1087#1077#1088#1077#1076#1085#1077#1077')'
          TabOrder = 1
        end
        object Panel91: TPanel
          Left = 6
          Top = 118
          Width = 71
          Height = 41
          BevelInner = bvLowered
          BevelOuter = bvLowered
          Caption = '2 ('#1079#1072#1076#1085#1077#1077')'
          TabOrder = 2
        end
        object Panel97: TPanel
          Left = 78
          Top = 19
          Width = 880
          Height = 19
          BevelInner = bvLowered
          BevelOuter = bvLowered
          Caption = #1053#1072#1087#1088#1072#1074#1083#1077#1085#1080#1077
          TabOrder = 3
        end
        object MaskEdit39: TMaskEdit
          Left = 78
          Top = 77
          Width = 110
          Height = 21
          TabOrder = 4
          Text = 'MaskEdit7'
        end
        object MaskEdit40: TMaskEdit
          Left = 298
          Top = 77
          Width = 110
          Height = 21
          TabOrder = 5
          Text = 'MaskEdit7'
        end
        object MaskEdit41: TMaskEdit
          Left = 188
          Top = 77
          Width = 110
          Height = 21
          TabOrder = 6
          Text = 'MaskEdit7'
        end
        object MaskEdit42: TMaskEdit
          Left = 408
          Top = 77
          Width = 110
          Height = 21
          TabOrder = 7
          Text = 'MaskEdit7'
        end
        object Panel92: TPanel
          Left = 78
          Top = 38
          Width = 220
          Height = 19
          BevelInner = bvLowered
          BevelOuter = bvLowered
          Caption = #1043#1086#1088#1080#1079#1086#1085#1090#1072#1083#1100#1085#1086#1077
          TabOrder = 8
        end
        object Panel98: TPanel
          Left = 298
          Top = 38
          Width = 220
          Height = 19
          BevelInner = bvLowered
          BevelOuter = bvLowered
          Caption = #1042#1077#1088#1090#1080#1082#1072#1083#1100#1085#1086#1077
          TabOrder = 9
        end
        object Panel99: TPanel
          Left = 518
          Top = 38
          Width = 220
          Height = 19
          BevelInner = bvLowered
          BevelOuter = bvLowered
          Caption = #1043#1086#1088#1080#1079#1086#1085#1090#1072#1083#1100#1085#1086#1077
          TabOrder = 10
        end
        object Panel102: TPanel
          Left = 738
          Top = 57
          Width = 110
          Height = 20
          BevelInner = bvLowered
          BevelOuter = bvLowered
          Caption = '1 '#1080#1079#1084#1077#1088#1077#1085#1080#1077
          TabOrder = 11
        end
        object Panel103: TPanel
          Left = 848
          Top = 57
          Width = 110
          Height = 20
          BevelInner = bvLowered
          BevelOuter = bvLowered
          Caption = '2 '#1080#1079#1084#1077#1088#1077#1085#1080#1077
          TabOrder = 12
        end
        object Panel104: TPanel
          Left = 738
          Top = 38
          Width = 220
          Height = 19
          BevelInner = bvLowered
          BevelOuter = bvLowered
          Caption = #1042#1077#1088#1090#1080#1082#1072#1083#1100#1085#1086#1077
          TabOrder = 13
        end
        object Panel93: TPanel
          Left = 518
          Top = 57
          Width = 110
          Height = 20
          BevelInner = bvLowered
          BevelOuter = bvLowered
          Caption = '1 '#1080#1079#1084#1077#1088#1077#1085#1080#1077
          TabOrder = 14
        end
        object Panel94: TPanel
          Left = 628
          Top = 57
          Width = 110
          Height = 20
          BevelInner = bvLowered
          BevelOuter = bvLowered
          Caption = '2 '#1080#1079#1084#1077#1088#1077#1085#1080#1077
          TabOrder = 15
        end
        object Panel95: TPanel
          Left = 298
          Top = 57
          Width = 110
          Height = 20
          BevelInner = bvLowered
          BevelOuter = bvLowered
          Caption = '1 '#1080#1079#1084#1077#1088#1077#1085#1080#1077
          TabOrder = 16
        end
        object Panel96: TPanel
          Left = 408
          Top = 57
          Width = 110
          Height = 20
          BevelInner = bvLowered
          BevelOuter = bvLowered
          Caption = '2 '#1080#1079#1084#1077#1088#1077#1085#1080#1077
          TabOrder = 17
        end
        object Panel100: TPanel
          Left = 78
          Top = 57
          Width = 110
          Height = 20
          BevelInner = bvLowered
          BevelOuter = bvLowered
          Caption = '1 '#1080#1079#1084#1077#1088#1077#1085#1080#1077
          TabOrder = 18
        end
        object Panel101: TPanel
          Left = 188
          Top = 57
          Width = 110
          Height = 20
          BevelInner = bvLowered
          BevelOuter = bvLowered
          Caption = '2 '#1080#1079#1084#1077#1088#1077#1085#1080#1077
          TabOrder = 19
        end
        object MaskEdit43: TMaskEdit
          Left = 518
          Top = 77
          Width = 110
          Height = 21
          TabOrder = 20
          Text = 'MaskEdit7'
        end
        object MaskEdit44: TMaskEdit
          Left = 628
          Top = 77
          Width = 110
          Height = 21
          TabOrder = 21
          Text = 'MaskEdit7'
        end
        object MaskEdit45: TMaskEdit
          Left = 738
          Top = 77
          Width = 110
          Height = 21
          TabOrder = 22
          Text = 'MaskEdit7'
        end
        object MaskEdit46: TMaskEdit
          Left = 848
          Top = 77
          Width = 110
          Height = 21
          TabOrder = 23
          Text = 'MaskEdit7'
        end
        object MaskEdit47: TMaskEdit
          Left = 518
          Top = 98
          Width = 110
          Height = 21
          TabOrder = 24
          Text = 'MaskEdit7'
        end
        object MaskEdit48: TMaskEdit
          Left = 628
          Top = 98
          Width = 110
          Height = 21
          TabOrder = 25
          Text = 'MaskEdit7'
        end
        object MaskEdit49: TMaskEdit
          Left = 738
          Top = 98
          Width = 110
          Height = 21
          TabOrder = 26
          Text = 'MaskEdit7'
        end
        object MaskEdit50: TMaskEdit
          Left = 848
          Top = 98
          Width = 110
          Height = 21
          TabOrder = 27
          Text = 'MaskEdit7'
        end
        object MaskEdit51: TMaskEdit
          Left = 408
          Top = 98
          Width = 110
          Height = 21
          TabOrder = 28
          Text = 'MaskEdit7'
        end
        object MaskEdit52: TMaskEdit
          Left = 298
          Top = 98
          Width = 110
          Height = 21
          TabOrder = 29
          Text = 'MaskEdit7'
        end
        object MaskEdit53: TMaskEdit
          Left = 188
          Top = 98
          Width = 110
          Height = 21
          TabOrder = 30
          Text = 'MaskEdit7'
        end
        object MaskEdit54: TMaskEdit
          Left = 78
          Top = 98
          Width = 110
          Height = 21
          TabOrder = 31
          Text = 'MaskEdit7'
        end
        object MaskEdit55: TMaskEdit
          Left = 78
          Top = 138
          Width = 110
          Height = 21
          TabOrder = 32
          Text = 'MaskEdit7'
        end
        object MaskEdit56: TMaskEdit
          Left = 78
          Top = 117
          Width = 110
          Height = 21
          TabOrder = 33
          Text = 'MaskEdit7'
        end
        object MaskEdit57: TMaskEdit
          Left = 188
          Top = 117
          Width = 110
          Height = 21
          TabOrder = 34
          Text = 'MaskEdit7'
        end
        object MaskEdit58: TMaskEdit
          Left = 188
          Top = 138
          Width = 110
          Height = 21
          TabOrder = 35
          Text = 'MaskEdit7'
        end
        object MaskEdit59: TMaskEdit
          Left = 298
          Top = 138
          Width = 110
          Height = 21
          TabOrder = 36
          Text = 'MaskEdit7'
        end
        object MaskEdit60: TMaskEdit
          Left = 298
          Top = 117
          Width = 110
          Height = 21
          TabOrder = 37
          Text = 'MaskEdit7'
        end
        object MaskEdit61: TMaskEdit
          Left = 408
          Top = 117
          Width = 110
          Height = 21
          TabOrder = 38
          Text = 'MaskEdit7'
        end
        object MaskEdit62: TMaskEdit
          Left = 408
          Top = 138
          Width = 110
          Height = 21
          TabOrder = 39
          Text = 'MaskEdit7'
        end
        object MaskEdit63: TMaskEdit
          Left = 518
          Top = 138
          Width = 110
          Height = 21
          TabOrder = 40
          Text = 'MaskEdit7'
        end
        object MaskEdit64: TMaskEdit
          Left = 518
          Top = 117
          Width = 110
          Height = 21
          TabOrder = 41
          Text = 'MaskEdit7'
        end
        object MaskEdit65: TMaskEdit
          Left = 628
          Top = 117
          Width = 110
          Height = 21
          TabOrder = 42
          Text = 'MaskEdit7'
        end
        object MaskEdit66: TMaskEdit
          Left = 628
          Top = 138
          Width = 110
          Height = 21
          TabOrder = 43
          Text = 'MaskEdit7'
        end
        object MaskEdit67: TMaskEdit
          Left = 738
          Top = 138
          Width = 110
          Height = 21
          TabOrder = 44
          Text = 'MaskEdit7'
        end
        object MaskEdit68: TMaskEdit
          Left = 738
          Top = 117
          Width = 110
          Height = 21
          TabOrder = 45
          Text = 'MaskEdit7'
        end
        object MaskEdit69: TMaskEdit
          Left = 848
          Top = 138
          Width = 110
          Height = 21
          TabOrder = 46
          Text = 'MaskEdit7'
        end
        object MaskEdit70: TMaskEdit
          Left = 848
          Top = 117
          Width = 110
          Height = 21
          TabOrder = 47
          Text = 'MaskEdit7'
        end
      end
    end
    object TabSheet6: TTabSheet
      Caption = #1054#1073#1098#1077#1084#1099' '#1074#1085#1091#1090#1088#1077#1085#1080#1093' '#1076#1077#1090#1072#1083#1077#1081
      ImageIndex = 5
    end
  end
  object Button1: TButton
    Left = 413
    Top = 437
    Width = 75
    Height = 25
    Caption = #1044#1072#1083#1077#1077' >'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button3: TButton
    Left = 574
    Top = 438
    Width = 75
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 2
    OnClick = Button3Click
  end
  object Button2: TButton
    Left = 494
    Top = 438
    Width = 75
    Height = 25
    Caption = #1043#1086#1090#1086#1074#1086
    TabOrder = 3
    OnClick = Button2Click
  end
  object ComboBox1: TComboBox
    Left = 124
    Top = 439
    Width = 85
    Height = 22
    Style = csOwnerDrawFixed
    ItemHeight = 16
    TabOrder = 4
    OnChange = ComboBox1Change
  end
  object SpinEdit1: TSpinEdit
    Left = 324
    Top = 438
    Width = 37
    Height = 22
    MaxValue = 24
    MinValue = 1
    TabOrder = 5
    Value = 1
    OnChange = SpinEdit1Change
  end
end
