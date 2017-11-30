object frmTankMnemo: TfrmTankMnemo
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #1052#1085#1077#1084#1086#1089#1093#1077#1084#1072' '#1089#1086#1089#1090#1086#1103#1085#1080#1103' '#1088#1077#1079#1077#1088#1074#1091#1072#1088#1086#1074' '#1085#1072' '#1058#1057#1055
  ClientHeight = 345
  ClientWidth = 741
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object TabControl1: TTabControl
    Left = 8
    Top = 8
    Width = 725
    Height = 329
    TabOrder = 0
    Tabs.Strings = (
      '1.0'
      '1.1'
      '2.0'
      '2.1')
    TabIndex = 0
    inline TtankSelfMnemo1: TtankSelfMnemo
      Left = 3
      Top = 32
      Width = 650
      Height = 287
      TabOrder = 0
      TabStop = True
      ExplicitLeft = 3
      ExplicitTop = 32
      inherited Image1: TImage
        Left = -13
        Top = 3
        ExplicitLeft = -13
        ExplicitTop = 3
      end
      inherited Gauge1: TGauge
        Left = 46
        Top = 27
        ExplicitLeft = 46
        ExplicitTop = 27
      end
    end
  end
end
