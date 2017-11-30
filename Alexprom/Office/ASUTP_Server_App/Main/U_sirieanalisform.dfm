object sirieAnalisForm: TsirieAnalisForm
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #1055#1088#1086#1094#1077#1085#1090#1086#1074#1082#1072
  ClientHeight = 443
  ClientWidth = 616
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
    Width = 297
    Height = 73
    Caption = #1050#1086#1084#1087#1086#1085#1077#1085#1090' 1:'
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 21
      Width = 77
      Height = 13
      Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077':'
    end
    object Label2: TLabel
      Left = 191
      Top = 24
      Width = 68
      Height = 13
      Caption = #1057#1086#1076#1077#1088#1078#1072#1085#1080#1077':'
    end
    object compBox1: TComboBox
      Left = 8
      Top = 40
      Width = 177
      Height = 21
      Style = csDropDownList
      DropDownCount = 15
      ItemHeight = 13
      TabOrder = 0
      OnChange = compBox1Change
    end
    object percentBox1: TComboBox
      Left = 191
      Top = 40
      Width = 98
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 1
      Text = '0,0'
      OnChange = percentBox1Change
      Items.Strings = (
        '0,0'
        '5,0'
        '10,0'
        '15,0'
        '20,0'
        '25,0'
        '30,0'
        '35,0'
        '40,0'
        '45,0'
        '50,0'
        '55,0'
        '60,0'
        '65,0'
        '70,0'
        '75,0'
        '80,0'
        '85,0'
        '90,0'
        '95,0'
        '100,0')
    end
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 87
    Width = 297
    Height = 73
    Caption = #1050#1086#1084#1087#1086#1085#1077#1085#1090' 2:'
    TabOrder = 1
    object Label3: TLabel
      Left = 8
      Top = 24
      Width = 77
      Height = 13
      Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077':'
    end
    object Label4: TLabel
      Left = 191
      Top = 24
      Width = 68
      Height = 13
      Caption = #1057#1086#1076#1077#1088#1078#1072#1085#1080#1077':'
    end
    object compBox2: TComboBox
      Left = 8
      Top = 40
      Width = 177
      Height = 21
      Style = csDropDownList
      DropDownCount = 15
      ItemHeight = 13
      TabOrder = 0
      OnChange = compBox2Change
    end
    object percentBox2: TComboBox
      Left = 191
      Top = 40
      Width = 98
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 1
      Text = '0,0'
      OnChange = percentBox2Change
      Items.Strings = (
        '0,0'
        '5,0'
        '10,0'
        '15,0'
        '20,0'
        '25,0'
        '30,0'
        '35,0'
        '40,0'
        '45,0'
        '50,0'
        '55,0'
        '60,0'
        '65,0'
        '70,0'
        '75,0'
        '80,0'
        '85,0'
        '90,0'
        '95,0'
        '100,0')
    end
  end
  object GroupBox3: TGroupBox
    Left = 8
    Top = 166
    Width = 297
    Height = 73
    Caption = #1050#1086#1084#1087#1086#1085#1077#1085#1090' 3:'
    TabOrder = 2
    object Label5: TLabel
      Left = 8
      Top = 24
      Width = 77
      Height = 13
      Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077':'
    end
    object Label6: TLabel
      Left = 191
      Top = 24
      Width = 68
      Height = 13
      Caption = #1057#1086#1076#1077#1088#1078#1072#1085#1080#1077':'
    end
    object compBox3: TComboBox
      Left = 8
      Top = 40
      Width = 177
      Height = 21
      Style = csDropDownList
      DropDownCount = 15
      ItemHeight = 13
      TabOrder = 0
      OnChange = compBox3Change
    end
    object percentBox3: TComboBox
      Left = 191
      Top = 40
      Width = 98
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 1
      Text = '0,0'
      OnChange = percentBox3Change
      Items.Strings = (
        '0,0'
        '5,0'
        '10,0'
        '15,0'
        '20,0'
        '25,0'
        '30,0'
        '35,0'
        '40,0'
        '45,0'
        '50,0'
        '55,0'
        '60,0'
        '65,0'
        '70,0'
        '75,0'
        '80,0'
        '85,0'
        '90,0'
        '95,0'
        '100,0')
    end
  end
  object GroupBox4: TGroupBox
    Left = 8
    Top = 245
    Width = 297
    Height = 73
    Caption = #1050#1086#1084#1087#1086#1085#1077#1085#1090' 4:'
    TabOrder = 3
    object Label7: TLabel
      Left = 8
      Top = 24
      Width = 77
      Height = 13
      Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077':'
    end
    object Label8: TLabel
      Left = 191
      Top = 24
      Width = 68
      Height = 13
      Caption = #1057#1086#1076#1077#1088#1078#1072#1085#1080#1077':'
    end
    object compBox4: TComboBox
      Left = 8
      Top = 40
      Width = 177
      Height = 21
      Style = csDropDownList
      DropDownCount = 15
      ItemHeight = 13
      TabOrder = 0
      OnChange = compBox4Change
    end
    object percentBox4: TComboBox
      Left = 191
      Top = 40
      Width = 98
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 1
      Text = '0,0'
      OnChange = percentBox4Change
      Items.Strings = (
        '0,0'
        '5,0'
        '10,0'
        '15,0'
        '20,0'
        '25,0'
        '30,0'
        '35,0'
        '40,0'
        '45,0'
        '50,0'
        '55,0'
        '60,0'
        '65,0'
        '70,0'
        '75,0'
        '80,0'
        '85,0'
        '90,0'
        '95,0'
        '100,0')
    end
  end
  object GroupBox5: TGroupBox
    Left = 311
    Top = 245
    Width = 297
    Height = 73
    Caption = #1050#1086#1084#1087#1086#1085#1077#1085#1090' 9:'
    TabOrder = 4
    object Label9: TLabel
      Left = 8
      Top = 24
      Width = 77
      Height = 13
      Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077':'
    end
    object Label10: TLabel
      Left = 191
      Top = 24
      Width = 68
      Height = 13
      Caption = #1057#1086#1076#1077#1088#1078#1072#1085#1080#1077':'
    end
    object compBox9: TComboBox
      Left = 8
      Top = 40
      Width = 177
      Height = 21
      Style = csDropDownList
      DropDownCount = 15
      ItemHeight = 13
      TabOrder = 0
      OnChange = compBox9Change
    end
    object percentBox9: TComboBox
      Left = 191
      Top = 40
      Width = 98
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 1
      Text = '0,0'
      OnChange = percentBox9Change
      Items.Strings = (
        '0,0'
        '5,0'
        '10,0'
        '15,0'
        '20,0'
        '25,0'
        '30,0'
        '35,0'
        '40,0'
        '45,0'
        '50,0'
        '55,0'
        '60,0'
        '65,0'
        '70,0'
        '75,0'
        '80,0'
        '85,0'
        '90,0'
        '95,0'
        '100,0')
    end
  end
  object GroupBox6: TGroupBox
    Left = 8
    Top = 324
    Width = 297
    Height = 73
    Caption = #1050#1086#1084#1087#1086#1085#1077#1085#1090' 5:'
    TabOrder = 5
    object Label11: TLabel
      Left = 8
      Top = 24
      Width = 77
      Height = 13
      Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077':'
    end
    object Label12: TLabel
      Left = 191
      Top = 24
      Width = 68
      Height = 13
      Caption = #1057#1086#1076#1077#1088#1078#1072#1085#1080#1077':'
    end
    object compBox5: TComboBox
      Left = 8
      Top = 40
      Width = 177
      Height = 21
      Style = csDropDownList
      DropDownCount = 15
      ItemHeight = 13
      TabOrder = 0
      OnChange = compBox5Change
    end
    object percentBox5: TComboBox
      Left = 191
      Top = 40
      Width = 98
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 1
      Text = '0,0'
      OnChange = percentBox5Change
      Items.Strings = (
        '0,0'
        '5,0'
        '10,0'
        '15,0'
        '20,0'
        '25,0'
        '30,0'
        '35,0'
        '40,0'
        '45,0'
        '50,0'
        '55,0'
        '60,0'
        '65,0'
        '70,0'
        '75,0'
        '80,0'
        '85,0'
        '90,0'
        '95,0'
        '100,0')
    end
  end
  object GroupBox7: TGroupBox
    Left = 311
    Top = 324
    Width = 297
    Height = 73
    Caption = #1050#1086#1084#1087#1086#1085#1077#1085#1090' 10:'
    TabOrder = 6
    object Label13: TLabel
      Left = 8
      Top = 24
      Width = 77
      Height = 13
      Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077':'
    end
    object Label14: TLabel
      Left = 191
      Top = 24
      Width = 68
      Height = 13
      Caption = #1057#1086#1076#1077#1088#1078#1072#1085#1080#1077':'
    end
    object compBox10: TComboBox
      Left = 8
      Top = 40
      Width = 177
      Height = 21
      Style = csDropDownList
      DropDownCount = 15
      ItemHeight = 13
      TabOrder = 0
      OnChange = compBox10Change
    end
    object percentBox10: TComboBox
      Left = 191
      Top = 40
      Width = 98
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 1
      Text = '0,0'
      OnChange = percentBox10Change
      Items.Strings = (
        '0,0'
        '5,0'
        '10,0'
        '15,0'
        '20,0'
        '25,0'
        '30,0'
        '35,0'
        '40,0'
        '45,0'
        '50,0'
        '55,0'
        '60,0'
        '65,0'
        '70,0'
        '75,0'
        '80,0'
        '85,0'
        '90,0'
        '95,0'
        '100,0')
    end
  end
  object GroupBox8: TGroupBox
    Left = 311
    Top = 8
    Width = 297
    Height = 73
    Caption = #1050#1086#1084#1087#1086#1085#1077#1085#1090' 6:'
    TabOrder = 7
    object Label15: TLabel
      Left = 8
      Top = 24
      Width = 77
      Height = 13
      Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077':'
    end
    object Label16: TLabel
      Left = 191
      Top = 24
      Width = 68
      Height = 13
      Caption = #1057#1086#1076#1077#1088#1078#1072#1085#1080#1077':'
    end
    object compBox6: TComboBox
      Left = 8
      Top = 40
      Width = 177
      Height = 21
      Style = csDropDownList
      DropDownCount = 15
      ItemHeight = 13
      TabOrder = 0
      OnChange = compBox6Change
    end
    object percentBox6: TComboBox
      Left = 191
      Top = 40
      Width = 98
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 1
      Text = '0,0'
      OnChange = percentBox6Change
      Items.Strings = (
        '0,0'
        '5,0'
        '10,0'
        '15,0'
        '20,0'
        '25,0'
        '30,0'
        '35,0'
        '40,0'
        '45,0'
        '50,0'
        '55,0'
        '60,0'
        '65,0'
        '70,0'
        '75,0'
        '80,0'
        '85,0'
        '90,0'
        '95,0'
        '100,0')
    end
  end
  object GroupBox9: TGroupBox
    Left = 311
    Top = 87
    Width = 297
    Height = 73
    Caption = #1050#1086#1084#1087#1086#1085#1077#1085#1090' 7:'
    TabOrder = 8
    object Label17: TLabel
      Left = 8
      Top = 24
      Width = 77
      Height = 13
      Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077':'
    end
    object Label18: TLabel
      Left = 191
      Top = 24
      Width = 68
      Height = 13
      Caption = #1057#1086#1076#1077#1088#1078#1072#1085#1080#1077':'
    end
    object compBox7: TComboBox
      Left = 8
      Top = 40
      Width = 177
      Height = 21
      Style = csDropDownList
      DropDownCount = 15
      ItemHeight = 13
      TabOrder = 0
      OnChange = compBox7Change
    end
    object percentBox7: TComboBox
      Left = 191
      Top = 40
      Width = 98
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 1
      Text = '0,0'
      OnChange = percentBox7Change
      Items.Strings = (
        '0,0'
        '5,0'
        '10,0'
        '15,0'
        '20,0'
        '25,0'
        '30,0'
        '35,0'
        '40,0'
        '45,0'
        '50,0'
        '55,0'
        '60,0'
        '65,0'
        '70,0'
        '75,0'
        '80,0'
        '85,0'
        '90,0'
        '95,0'
        '100,0')
    end
  end
  object GroupBox10: TGroupBox
    Left = 311
    Top = 166
    Width = 297
    Height = 73
    Caption = #1050#1086#1084#1087#1086#1085#1077#1085#1090' 8:'
    TabOrder = 9
    object Label19: TLabel
      Left = 8
      Top = 24
      Width = 77
      Height = 13
      Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077':'
    end
    object Label20: TLabel
      Left = 191
      Top = 24
      Width = 68
      Height = 13
      Caption = #1057#1086#1076#1077#1088#1078#1072#1085#1080#1077':'
    end
    object compBox8: TComboBox
      Left = 8
      Top = 40
      Width = 177
      Height = 21
      Style = csDropDownList
      DropDownCount = 15
      ItemHeight = 13
      TabOrder = 0
      OnChange = compBox8Change
    end
    object percentBox8: TComboBox
      Left = 191
      Top = 40
      Width = 98
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 1
      Text = '0,0'
      OnChange = percentBox8Change
      Items.Strings = (
        '0,0'
        '5,0'
        '10,0'
        '15,0'
        '20,0'
        '25,0'
        '30,0'
        '35,0'
        '40,0'
        '45,0'
        '50,0'
        '55,0'
        '60,0'
        '65,0'
        '70,0'
        '75,0'
        '80,0'
        '85,0'
        '90,0'
        '95,0'
        '100,0')
    end
  end
  object Button1: TButton
    Left = 176
    Top = 408
    Width = 75
    Height = 25
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    TabOrder = 10
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 256
    Top = 408
    Width = 75
    Height = 25
    Caption = #1054#1095#1080#1089#1090#1080#1090#1100
    TabOrder = 11
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 337
    Top = 410
    Width = 75
    Height = 25
    Caption = #1042#1099#1093#1086#1076
    TabOrder = 12
    OnClick = Button3Click
  end
end
