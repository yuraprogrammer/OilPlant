object frmTankView: TfrmTankView
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #1056#1077#1079#1077#1088#1074#1091#1072#1088#1099
  ClientHeight = 494
  ClientWidth = 765
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Chart1: TChart
    Left = 0
    Top = 0
    Width = 765
    Height = 494
    Title.Text.Strings = (
      #1053#1072#1087#1086#1083#1085#1077#1085#1085#1080#1077' '#1088#1077#1079#1077#1088#1074#1091#1072#1088#1086#1074)
    View3D = False
    Align = alClient
    TabOrder = 0
    ExplicitLeft = 8
    ExplicitTop = 8
    ExplicitWidth = 400
    ExplicitHeight = 250
    ColorPaletteIndex = 11
    object Series1: TAreaSeries
      Marks.Arrow.Visible = True
      Marks.Callout.Brush.Color = clBlack
      Marks.Callout.Arrow.Visible = True
      Marks.Visible = False
      Title = #1056#1077#1079#1077#1088#1074#1091#1072#1088#1099
      DrawArea = True
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      Pointer.Visible = False
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Y'
      YValues.Order = loNone
    end
  end
end
