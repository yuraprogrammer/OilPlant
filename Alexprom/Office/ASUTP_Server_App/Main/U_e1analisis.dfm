object frm_e1analisis: Tfrm_e1analisis
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #1040#1085#1072#1083#1080#1079' '#1091#1089#1088#1077#1076#1085#1077#1085#1085#1086#1075#1086' '#1085#1077#1092#1090#1077#1087#1088#1086#1076#1091#1082#1090#1072' '#1074' '#1045'1'
  ClientHeight = 280
  ClientWidth = 302
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 58
    Height = 13
    Caption = #1055#1083#1086#1090#1085#1086#1089#1090#1100':'
  end
  object Label2: TLabel
    Left = 79
    Top = 8
    Width = 44
    Height = 13
    Caption = #1058#1077#1084#1087'-'#1088#1072':'
  end
  object Label3: TLabel
    Left = 144
    Top = 8
    Width = 109
    Height = 13
    Caption = #1055#1083#1086#1090#1085#1086#1089#1090#1100' '#1087#1088#1080' +20'#1057':'
  end
  object Label4: TLabel
    Left = 8
    Top = 56
    Width = 77
    Height = 13
    Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077':'
  end
  object Label5: TLabel
    Left = 135
    Top = 56
    Width = 68
    Height = 13
    Caption = #1057#1086#1076#1077#1088#1078#1072#1085#1080#1077':'
  end
  object Label6: TLabel
    Left = 207
    Top = 80
    Width = 11
    Height = 13
    Caption = '%'
  end
  object Label7: TLabel
    Left = 207
    Top = 104
    Width = 11
    Height = 13
    Caption = '%'
  end
  object Label8: TLabel
    Left = 207
    Top = 128
    Width = 11
    Height = 13
    Caption = '%'
  end
  object Label9: TLabel
    Left = 207
    Top = 152
    Width = 11
    Height = 13
    Caption = '%'
  end
  object Label10: TLabel
    Left = 207
    Top = 176
    Width = 11
    Height = 13
    Caption = '%'
  end
  object Label11: TLabel
    Left = 207
    Top = 200
    Width = 11
    Height = 13
    Caption = '%'
  end
  object Label12: TLabel
    Left = 207
    Top = 224
    Width = 11
    Height = 13
    Caption = '%'
  end
  object MaskEdit1: TMaskEdit
    Left = 8
    Top = 24
    Width = 65
    Height = 21
    EditMask = '!9,9999;1; '
    MaxLength = 6
    TabOrder = 0
    Text = ' ,    '
    OnChange = MaskEdit1Change
    OnExit = MaskEdit1Change
  end
  object Edit1: TEdit
    Left = 79
    Top = 24
    Width = 57
    Height = 21
    TabOrder = 1
    OnChange = Edit1Change
  end
  object Panel1: TPanel
    Left = 144
    Top = 24
    Width = 109
    Height = 21
    BevelInner = bvLowered
    BevelOuter = bvLowered
    TabOrder = 2
  end
  object Panel2: TPanel
    Left = 8
    Top = 72
    Width = 129
    Height = 25
    BevelInner = bvLowered
    BevelOuter = bvLowered
    Caption = #1060#1041#1043#1057
    TabOrder = 3
  end
  object Panel3: TPanel
    Left = 8
    Top = 96
    Width = 129
    Height = 25
    BevelInner = bvLowered
    BevelOuter = bvLowered
    Caption = #1040#1044#1058
    TabOrder = 4
  end
  object Panel4: TPanel
    Left = 8
    Top = 121
    Width = 129
    Height = 25
    BevelInner = bvLowered
    BevelOuter = bvLowered
    Caption = #1054#1058#1043
    TabOrder = 5
  end
  object Panel5: TPanel
    Left = 8
    Top = 145
    Width = 129
    Height = 25
    BevelInner = bvLowered
    BevelOuter = bvLowered
    Caption = #1055#1072#1088#1072#1092#1080#1085
    TabOrder = 6
  end
  object Panel6: TPanel
    Left = 8
    Top = 168
    Width = 129
    Height = 25
    BevelInner = bvLowered
    BevelOuter = bvLowered
    Caption = #1042#1086#1076#1072
    TabOrder = 7
  end
  object Panel7: TPanel
    Left = 8
    Top = 192
    Width = 129
    Height = 25
    BevelInner = bvLowered
    BevelOuter = bvLowered
    Caption = #1042#1099#1093#1086#1076
    TabOrder = 8
  end
  object Panel8: TPanel
    Left = 8
    Top = 217
    Width = 129
    Height = 25
    BevelInner = bvLowered
    BevelOuter = bvLowered
    Caption = #1055#1086#1090#1077#1088#1080
    TabOrder = 9
  end
  object MaskEdit2: TMaskEdit
    Left = 135
    Top = 72
    Width = 67
    Height = 21
    EditMask = '!999;1; '
    MaxLength = 3
    TabOrder = 10
    Text = '   '
    OnChange = MaskEdit2Change
    OnExit = MaskEdit2Change
  end
  object MaskEdit3: TMaskEdit
    Left = 135
    Top = 96
    Width = 67
    Height = 21
    EditMask = '!999;1; '
    MaxLength = 3
    TabOrder = 11
    Text = '   '
    OnChange = MaskEdit3Change
    OnExit = MaskEdit3Change
  end
  object MaskEdit4: TMaskEdit
    Left = 135
    Top = 120
    Width = 67
    Height = 21
    EditMask = '!999;1; '
    MaxLength = 3
    TabOrder = 12
    Text = '   '
    OnChange = MaskEdit4Change
  end
  object MaskEdit5: TMaskEdit
    Left = 135
    Top = 144
    Width = 65
    Height = 21
    EditMask = '!999;1; '
    MaxLength = 3
    TabOrder = 13
    Text = '   '
    OnChange = MaskEdit5Change
  end
  object MaskEdit6: TMaskEdit
    Left = 135
    Top = 168
    Width = 66
    Height = 21
    EditMask = '!999;1; '
    MaxLength = 3
    TabOrder = 14
    Text = '   '
  end
  object Panel9: TPanel
    Left = 135
    Top = 192
    Width = 68
    Height = 25
    BevelInner = bvLowered
    BevelOuter = bvLowered
    TabOrder = 15
  end
  object Panel10: TPanel
    Left = 135
    Top = 217
    Width = 68
    Height = 25
    BevelInner = bvLowered
    BevelOuter = bvLowered
    TabOrder = 16
  end
  object Button1: TButton
    Left = 79
    Top = 248
    Width = 75
    Height = 25
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    TabOrder = 17
    OnClick = Button1Click
  end
  object Button3: TButton
    Left = 160
    Top = 248
    Width = 75
    Height = 25
    Caption = #1042#1099#1093#1086#1076
    TabOrder = 18
    OnClick = Button3Click
  end
end
