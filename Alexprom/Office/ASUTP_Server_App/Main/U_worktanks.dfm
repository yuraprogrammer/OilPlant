object frmCheckWorkTank: TfrmCheckWorkTank
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #1056#1072#1073#1086#1095#1080#1077' '#1088#1077#1079#1077#1088#1074#1091#1072#1088#1099
  ClientHeight = 481
  ClientWidth = 675
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
    Left = 10
    Top = 8
    Width = 177
    Height = 465
    Checkboxes = True
    Columns = <
      item
        Caption = #1056#1077#1079#1077#1088#1074#1091#1072#1088
        Width = 150
      end>
    GridLines = True
    TabOrder = 0
    ViewStyle = vsReport
  end
  object DBGridEh1: TDBGridEh
    Left = 193
    Top = 8
    Width = 474
    Height = 465
    Flat = True
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'Tahoma'
    FooterFont.Style = []
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        AlwaysShowEditButton = True
        ButtonStyle = cbsEllipsis
        Checkboxes = True
        DblClickNextVal = True
        DropDownBox.ColumnDefValues.EndEllipsis = True
        EditButtons = <
          item
          end
          item
          end
          item
          end>
        EndEllipsis = True
        Footers = <>
      end
      item
        EditButtons = <>
        Footers = <>
      end>
  end
end
