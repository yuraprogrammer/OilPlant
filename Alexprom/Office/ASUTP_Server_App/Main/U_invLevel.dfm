object frmInvLevel: TfrmInvLevel
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #1056#1077#1079#1077#1088#1074#1091#1072#1088':'
  ClientHeight = 160
  ClientWidth = 281
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
    Width = 265
    Height = 113
    Caption = #1056#1077#1079#1077#1088#1074#1091#1072#1088' '
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 16
      Width = 33
      Height = 13
      Caption = #1042#1079#1083#1080#1074':'
    end
    object Label2: TLabel
      Left = 8
      Top = 64
      Width = 52
      Height = 13
      Caption = #1054#1073#1098#1077#1084', '#1084'3'
    end
    object Label3: TLabel
      Left = 132
      Top = 16
      Width = 88
      Height = 13
      Caption = #1055#1083#1086#1090#1085#1086#1089#1090#1100', '#1082#1075'/'#1084'3'
    end
    object Label4: TLabel
      Left = 132
      Top = 64
      Width = 48
      Height = 13
      Caption = #1052#1072#1089#1089#1072', '#1082#1075
    end
    object MaskEdit1: TMaskEdit
      Left = 8
      Top = 33
      Width = 115
      Height = 21
      EditMask = '!99999;1; '
      MaxLength = 5
      TabOrder = 0
      Text = '     '
      OnChange = MaskEdit1Change
    end
    object MaskEdit2: TMaskEdit
      Left = 8
      Top = 80
      Width = 115
      Height = 21
      EditMask = '!999999;1; '
      MaxLength = 6
      TabOrder = 1
      Text = '      '
    end
    object MaskEdit3: TMaskEdit
      Left = 132
      Top = 33
      Width = 122
      Height = 21
      EditMask = '!9,999;1; '
      MaxLength = 5
      TabOrder = 2
      Text = ' ,   '
      OnChange = MaskEdit3Change
    end
    object MaskEdit4: TMaskEdit
      Left = 132
      Top = 80
      Width = 122
      Height = 21
      EditMask = '!999999;1; '
      MaxLength = 6
      TabOrder = 3
      Text = '      '
    end
  end
  object btnSave: TButton
    Left = 56
    Top = 127
    Width = 75
    Height = 25
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    TabOrder = 1
    OnClick = btnSaveClick
  end
  object btnExit: TButton
    Left = 136
    Top = 127
    Width = 75
    Height = 25
    Caption = #1042#1099#1093#1086#1076
    TabOrder = 2
    OnClick = btnExitClick
  end
end
