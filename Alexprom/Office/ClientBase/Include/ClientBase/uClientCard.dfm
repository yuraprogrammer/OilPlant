object frmClientCard: TfrmClientCard
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #1050#1072#1088#1090#1086#1095#1082#1072' '#1082#1083#1080#1077#1085#1090#1072
  ClientHeight = 869
  ClientWidth = 823
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 313
    Height = 193
    Caption = #1044#1072#1085#1085#1099#1077' '#1086' '#1082#1083#1080#1077#1085#1090#1077':'
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 136
      Width = 84
      Height = 13
      Caption = #1044#1072#1090#1072' '#1088#1086#1078#1076#1077#1085#1080#1103':'
    end
    object leLastName: TLabeledEdit
      Left = 11
      Top = 32
      Width = 294
      Height = 21
      EditLabel.Width = 48
      EditLabel.Height = 13
      EditLabel.Caption = #1060#1072#1084#1080#1083#1080#1103':'
      TabOrder = 0
      Text = '_'
      OnChange = leLastNameChange
    end
    object leFirstName: TLabeledEdit
      Left = 11
      Top = 72
      Width = 294
      Height = 21
      EditLabel.Width = 23
      EditLabel.Height = 13
      EditLabel.Caption = #1048#1084#1103':'
      TabOrder = 1
      Text = '_'
      OnChange = leFirstNameChange
    end
    object leSurname: TLabeledEdit
      Left = 11
      Top = 112
      Width = 294
      Height = 21
      EditLabel.Width = 53
      EditLabel.Height = 13
      EditLabel.Caption = #1054#1090#1095#1077#1089#1090#1074#1086':'
      TabOrder = 2
      Text = '_'
      OnChange = leSurnameChange
    end
    object meBirthday: TMaskEdit
      Left = 11
      Top = 160
      Width = 294
      Height = 21
      EditMask = '!99/99/0000;1; '
      MaxLength = 10
      TabOrder = 3
      Text = '  .  .    '
      OnChange = meBirthdayChange
    end
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 207
    Width = 313
    Height = 354
    Caption = #1044#1072#1085#1085#1099#1077' '#1086' '#1087#1088#1077#1076#1087#1088#1080#1103#1090#1080#1080':'
    TabOrder = 1
    object leName: TLabeledEdit
      Left = 11
      Top = 32
      Width = 294
      Height = 21
      EditLabel.Width = 77
      EditLabel.Height = 13
      EditLabel.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077':'
      TabOrder = 0
      Text = '_'
      OnChange = leNameChange
    end
    object leBusiness: TLabeledEdit
      Left = 11
      Top = 120
      Width = 294
      Height = 21
      EditLabel.Width = 98
      EditLabel.Height = 13
      EditLabel.Caption = #1042#1080#1076' '#1076#1077#1103#1090#1077#1083#1100#1085#1086#1089#1090#1080':'
      TabOrder = 1
      Text = '_'
      OnChange = leBusinessChange
    end
    object leInteresting: TLabeledEdit
      Left = 11
      Top = 164
      Width = 294
      Height = 21
      EditLabel.Width = 124
      EditLabel.Height = 13
      EditLabel.Caption = #1048#1085#1090#1077#1088#1077#1089#1099' '#1087#1088#1077#1076#1087#1088#1080#1103#1090#1080#1103':'
      TabOrder = 2
      Text = '_'
      OnChange = leInterestingChange
    end
    object RadioGroup1: TRadioGroup
      Left = 11
      Top = 192
      Width = 142
      Height = 65
      Caption = #1060#1086#1088#1084#1072' '#1082#1083#1080#1077#1085#1090#1072':'
      ItemIndex = 0
      Items.Strings = (
        #1057#1091#1097#1077#1089#1090#1074#1091#1102#1097#1080#1081
        #1055#1086#1090#1077#1085#1094#1080#1072#1083#1100#1085#1099#1081)
      TabOrder = 3
      OnClick = RadioGroup1Click
    end
    object RadioGroup2: TRadioGroup
      Left = 159
      Top = 191
      Width = 146
      Height = 65
      Caption = #1058#1080#1087' '#1082#1083#1080#1077#1085#1090#1072':'
      ItemIndex = 0
      Items.Strings = (
        #1055#1086#1090#1088#1077#1073#1080#1090#1077#1083#1100
        #1055#1086#1089#1088#1077#1076#1085#1080#1082)
      TabOrder = 4
      OnClick = RadioGroup2Click
    end
    object lePrivate: TLabeledEdit
      Left = 11
      Top = 75
      Width = 294
      Height = 21
      EditLabel.Width = 114
      EditLabel.Height = 13
      EditLabel.Caption = #1060#1086#1088#1084#1072' '#1089#1086#1073#1089#1090#1074#1077#1085#1085#1086#1089#1090#1080':'
      TabOrder = 5
      Text = '_'
      OnChange = lePrivateChange
    end
    object leSourceInfo: TLabeledEdit
      Left = 9
      Top = 278
      Width = 294
      Height = 21
      EditLabel.Width = 231
      EditLabel.Height = 13
      EditLabel.Caption = #1048#1089#1090#1086#1095#1085#1080#1082' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1080' '#1086' '#1085#1072#1096#1077#1084' '#1087#1088#1077#1076#1087#1088#1080#1103#1090#1080#1080':'
      TabOrder = 6
      Text = '_'
      OnChange = leSourceInfoChange
    end
    object leClientManager: TLabeledEdit
      Left = 11
      Top = 321
      Width = 294
      Height = 21
      EditLabel.Width = 115
      EditLabel.Height = 13
      EditLabel.Caption = #1050#1091#1088#1072#1090#1086#1088' '#1082#1086#1085#1090#1088#1072#1075#1077#1085#1090#1072':'
      TabOrder = 7
      Text = '_'
      OnChange = leClientManagerChange
    end
  end
  object GroupBox3: TGroupBox
    Left = 327
    Top = 8
    Width = 338
    Height = 553
    Caption = #1040#1076#1088#1077#1089' '#1082#1083#1080#1077#1085#1090#1072':'
    TabOrder = 2
    object GroupBox4: TGroupBox
      Left = 11
      Top = 16
      Width = 318
      Height = 255
      Caption = #1070#1088#1080#1076#1080#1095#1077#1089#1082#1080#1081':'
      TabOrder = 0
      object Label3: TLabel
        Left = 11
        Top = 19
        Width = 39
        Height = 13
        Caption = #1056#1077#1075#1080#1086#1085':'
      end
      object leRegRegion: TLabeledEdit
        Left = 11
        Top = 80
        Width = 294
        Height = 21
        EditLabel.Width = 34
        EditLabel.Height = 13
        EditLabel.Caption = #1056#1072#1081#1086#1085':'
        TabOrder = 0
        Text = '_'
        OnChange = leRegRegionChange
      end
      object leRegCity: TLabeledEdit
        Left = 11
        Top = 117
        Width = 294
        Height = 21
        EditLabel.Width = 35
        EditLabel.Height = 13
        EditLabel.Caption = #1043#1086#1088#1086#1076':'
        TabOrder = 1
        Text = '_'
        OnChange = leRegCityChange
      end
      object leRegStreet: TLabeledEdit
        Left = 11
        Top = 156
        Width = 294
        Height = 21
        EditLabel.Width = 35
        EditLabel.Height = 13
        EditLabel.Caption = #1059#1083#1080#1094#1072':'
        TabOrder = 2
        Text = '_'
        OnChange = leRegStreetChange
      end
      object leRegBuilding: TLabeledEdit
        Left = 11
        Top = 197
        Width = 94
        Height = 21
        EditLabel.Width = 24
        EditLabel.Height = 13
        EditLabel.Caption = #1044#1086#1084':'
        TabOrder = 3
        Text = '_'
        OnChange = leRegBuildingChange
      end
      object leRegAddBuilding: TLabeledEdit
        Left = 111
        Top = 195
        Width = 99
        Height = 21
        EditLabel.Width = 40
        EditLabel.Height = 13
        EditLabel.Caption = #1050#1086#1088#1087#1091#1089':'
        TabOrder = 4
        Text = '_'
        OnChange = leRegAddBuildingChange
      end
      object leRegOffice: TLabeledEdit
        Left = 216
        Top = 195
        Width = 89
        Height = 21
        EditLabel.Width = 31
        EditLabel.Height = 13
        EditLabel.Caption = #1054#1092#1080#1089':'
        TabOrder = 5
        Text = '_'
        OnChange = leRegOfficeChange
      end
      object cbSameAddresses: TCheckBox
        Left = 16
        Top = 224
        Width = 289
        Height = 17
        Caption = #1060#1072#1082#1090#1080#1095#1077#1089#1082#1080#1081' '#1072#1076#1088#1077#1089' '#1089#1086#1074#1087#1072#1076#1072#1077#1090' '#1089' '#1102#1088#1080#1076#1080#1095#1077#1089#1082#1080#1084
        TabOrder = 6
        OnClick = cbSameAddressesClick
      end
      object cbRegRegion: TDBLookupComboBox
        Left = 11
        Top = 38
        Width = 294
        Height = 21
        TabOrder = 7
        OnCloseUp = cbRegRegionCloseUp
        OnKeyPress = cbRegRegionKeyPress
      end
    end
    object GroupBox5: TGroupBox
      Left = 11
      Top = 277
      Width = 318
      Height = 264
      Caption = #1060#1072#1082#1090#1080#1095#1077#1089#1082#1080#1081':'
      TabOrder = 1
      object Label4: TLabel
        Left = 11
        Top = 19
        Width = 39
        Height = 13
        Caption = #1056#1077#1075#1080#1086#1085':'
      end
      object leFactRegion: TLabeledEdit
        Left = 11
        Top = 80
        Width = 294
        Height = 21
        EditLabel.Width = 34
        EditLabel.Height = 13
        EditLabel.Caption = #1056#1072#1081#1086#1085':'
        TabOrder = 0
        Text = '_'
        OnChange = leFactRegionChange
      end
      object leFactCity: TLabeledEdit
        Left = 11
        Top = 117
        Width = 294
        Height = 21
        EditLabel.Width = 35
        EditLabel.Height = 13
        EditLabel.Caption = #1043#1086#1088#1086#1076':'
        TabOrder = 1
        Text = '_'
        OnChange = leFactCityChange
      end
      object leFactStreet: TLabeledEdit
        Left = 11
        Top = 156
        Width = 294
        Height = 21
        EditLabel.Width = 35
        EditLabel.Height = 13
        EditLabel.Caption = #1059#1083#1080#1094#1072':'
        TabOrder = 2
        Text = '_'
        OnChange = leFactStreetChange
      end
      object leFactBuilding: TLabeledEdit
        Left = 11
        Top = 195
        Width = 94
        Height = 21
        EditLabel.Width = 24
        EditLabel.Height = 13
        EditLabel.Caption = #1044#1086#1084':'
        TabOrder = 3
        Text = '_'
        OnChange = leFactBuildingChange
      end
      object leFactAddBuilding: TLabeledEdit
        Left = 111
        Top = 195
        Width = 99
        Height = 21
        EditLabel.Width = 40
        EditLabel.Height = 13
        EditLabel.Caption = #1050#1086#1088#1087#1091#1089':'
        TabOrder = 4
        Text = '_'
        OnChange = leFactAddBuildingChange
      end
      object leFactOffice: TLabeledEdit
        Left = 216
        Top = 195
        Width = 89
        Height = 21
        EditLabel.Width = 31
        EditLabel.Height = 13
        EditLabel.Caption = #1054#1092#1080#1089':'
        TabOrder = 5
        Text = '_'
        OnChange = leFactOfficeChange
      end
      object cbFactRegion: TDBLookupComboBox
        Left = 11
        Top = 38
        Width = 294
        Height = 21
        TabOrder = 6
        OnCloseUp = cbFactRegionCloseUp
        OnKeyPress = cbFactRegionKeyPress
      end
    end
  end
  object btnEdit: TBitBtn
    Left = 672
    Top = 8
    Width = 143
    Height = 25
    Action = actionEdit
    Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
    TabOrder = 3
    Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      18000000000000030000130B0000130B00000000000000000001FF00FFFF00FF
      FF00FF651E0D6E1E0870210770240A70240AFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FF6A1F0F751D06621D0FFF00FFFF00FFFF00FF7A
      29076B280FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF1F110E1F110E
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF732A0C803108803108FF00FFFF00
      FFFF00FFFF00FFFF00FF1F110E0D485D005B93004E8200336EFF00FFFF00FFFF
      00FFFF00FFFF00FF823509923F068F40079041099F4D06954709FF00FF0095CC
      00A3E301517F031C7B040369FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FF00679600ACE9010A0A020784040A80040469FF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF006796
      014FEE020D59000000020784040A81040469FF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FF040DA9133BFF020D5900000002078404
      0A84040468FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FF0614AD133BFF020D59000000020784040A84040469FF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0616B1133BFF020D5900
      0000020784040A84030469FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FF0716B4133AFF020D59000000020784040A86040469FF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0718BA13
      3BFF020D59000000020784020784030469FF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FF081BBF123AFF020D590000000207848184
      CE0A0B7DFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FF091CC40F35FF020D598C8A826060CB000076FF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF091DC597ADFF515BD80000
      90FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FF1B1C8E000595FF00FFFF00FFFF00FFFF00FF}
  end
  object btnClear: TBitBtn
    Left = 672
    Top = 40
    Width = 143
    Height = 25
    Action = actionClear
    Caption = #1054#1095#1080#1089#1090#1080#1090#1100
    TabOrder = 4
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00500005000555
      555557777F777555F55500000000555055557777777755F75555005500055055
      555577F5777F57555555005550055555555577FF577F5FF55555500550050055
      5555577FF77577FF555555005050110555555577F757777FF555555505099910
      555555FF75777777FF555005550999910555577F5F77777775F5500505509990
      3055577F75F77777575F55005055090B030555775755777575755555555550B0
      B03055555F555757575755550555550B0B335555755555757555555555555550
      BBB35555F55555575F555550555555550BBB55575555555575F5555555555555
      50BB555555555555575F555555555555550B5555555555555575}
    NumGlyphs = 2
  end
  object btnSave: TBitBtn
    Left = 672
    Top = 71
    Width = 143
    Height = 25
    Action = actionSave
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    TabOrder = 5
    Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FF7F2B287F2B28A18283A18283A18283A1
      8283A18283A18283A182837A1C1C7F2B28FF00FFFF00FFFF00FFFF00FF7F2B28
      CA4D4DB64545DDD4D5791617791617DCE0E0D7DADECED5D7BDBABD76100F9A2D
      2D7F2B28FF00FFFF00FFFF00FF7F2B28C24A4BB14444E2D9D9791617791617D9
      D8DAD9DEE1D3D9DCC1BDC1761111982D2D7F2B28FF00FFFF00FFFF00FF7F2B28
      C24A4AB04242E6DCDC791617791617D5D3D5D8DEE1D7DDE0C6C2C5700F0F962C
      2C7F2B28FF00FFFF00FFFF00FF7F2B28C24A4AB04141EADEDEE7DDDDDDD4D5D7
      D3D5D5D7D9D7D8DACAC2C57E17179E31317F2B28FF00FFFF00FFFF00FF7F2B28
      BF4748B84545BA4C4CBD5757BB5756B64E4EB44949BD5251BB4B4CB54242BF4A
      4A7F2B28FF00FFFF00FFFF00FF7F2B28A33B39B1605DC68684CB918FCC9190CC
      908FCB8988C98988CB9391CC9696BD4B4C7F2B28FF00FFFF00FFFF00FF7F2B28
      BD4B4CF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7BD4B
      4C7F2B28FF00FFFF00FFFF00FF7F2B28BD4B4CF7F7F7F7F7F7F7F7F7F7F7F7F7
      F7F7F7F7F7F7F7F7F7F7F7F7F7F7BD4B4C7F2B28FF00FFFF00FFFF00FF7F2B28
      BD4B4CF7F7F7BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFF7F7F7BD4B
      4C7F2B28FF00FFFF00FFFF00FF7F2B28BD4B4CF7F7F7F7F7F7F7F7F7F7F7F7F7
      F7F7F7F7F7F7F7F7F7F7F7F7F7F7BD4B4C7F2B28FF00FFFF00FFFF00FF7F2B28
      BD4B4CF7F7F7BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFF7F7F7BD4B
      4C7F2B28FF00FFFF00FFFF00FF7F2B28BD4B4CF7F7F7F7F7F7F7F7F7F7F7F7F7
      F7F7F7F7F7F7F7F7F7F7F7F7F7F7BD4B4C7F2B28FF00FFFF00FFFF00FFFF00FF
      7F2B28F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F77F2B
      28FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
  end
  object btnPrint: TBitBtn
    Left = 672
    Top = 135
    Width = 143
    Height = 25
    Action = actionPrint
    Caption = #1055#1077#1095#1072#1090#1100
    TabOrder = 6
    Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
      FF00FFFF00FF6C6A6A6C6A6AFF00FFFF00FF6C6A6A6C6A6AFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6C6A6AAAA7A7A19F9F6C6A6A6C
      6A6A6C6A6AE5E3E36C6A6A6C6A6A6C6A6AFF00FFFF00FFFF00FFFF00FFFF00FF
      6C6A6ADAD9D9A19F9FA19F9FA19F9F3736363535356C6D6DBFBFBFE1E2E2B7B6
      B66C6A6A6C6A6A6C6A6AFF00FF6C6A6AD4D3D3CACACA8E8C8C8E8C8C8E8C8C3C
      3B3B0A090A0707070B0B0B0707077A7A7ABBBBBB6C6A6AFF00FF6C6A6ACACACA
      CACACA8E8C8CD7D4D4CECBCBBFBCBCB1AFAFA3A0A08886865E5B5C0707070909
      090808086C6A6A7673736C6A6ACACACA8E8C8CEFEEEEFFFEFEFBFAFAE3E0E1DE
      DEDEDEDDDDCFCECEBDBCBCADABAB8B89895856567A78787573736C6A6A8E8C8C
      FFFFFFFEFCFCFAFAFAD5D4D5989193A09899B2ABACC4C0C1D7D7D7D8D8D8C7C6
      C6B7B6B6918F8F6C6969FF00FF6C6A6A6C6A6AEDEBEBB1A6A77A6F728A838896
      92959690919D97989A93959E9899BBBABAD1D1D1C2C2C26C6A6AFF00FFFF00FF
      FF00FF6C6A6ABB897FA7876D8B6F647D67606F62657973798F8B8EA9A3A4CBCA
      CAC1C1C16C6A6AFF00FFFF00FFFF00FFFF00FFFF00FFBD8281FFE3B4FFD39FE9
      B281C99973BA916CBD8281807D7E6C6A6A6C6A6AFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFBD8281FFE0B8FFD3A7FFD09DFFCE90FFC688BD8281FF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFC08683FFE7CFFFE0C0FFD9B2FF
      D3A5FFD099BD8281FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFBD8281FEEBD8FFE6CCFFDEBDFFD8B1FED3A4BD8281FF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFBD8281FFFFF2FFFFF2FFEBD8FFE5CAFF
      E1BDF3C7A7BD8281FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      BD8281BD8281BD8281FBEFE2FBE3CFFBDDC2BD8281FF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFBD8281BD8281BD
      8281FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
  end
  object btnClose: TBitBtn
    Left = 672
    Top = 166
    Width = 143
    Height = 25
    Action = actionClose
    Caption = #1047#1072#1082#1088#1099#1090#1100
    TabOrder = 7
    Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
      FF00FFFF00FFFF00FF000288010893010B99010C99010893000389FF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF000186010D9D021CAF021FB402
      1FB5021FB5021FB2021CB0010F9F000287FF00FFFF00FFFF00FFFF00FFFF00FF
      00038A0118B2021FB7021EB1021DB1021DB1021DB1021DB1021EB2021FB40219
      AC00048EFF00FFFF00FFFF00FF0001830118BB0220CC011CBF0015B4011AB002
      1DB1021DB1011CB00015AD011BB0021FB4021AAC000287FF00FFFF00FF010CA7
      0121E0011CD30726CC4966D70B28BC0018B00019AF0622B44A66CE0D2BB7011B
      B0021FB5010F9FFF00FF000187011CDC0120ED0017DC3655E2FFFFFFA4B4ED05
      20BB0119B28B9EE1FFFFFF4E6ACF0014AC021EB2021CB000038900069A0120F8
      011FF6001DE9031FE1738BEEFFFFFFA0B1ED93A5E7FFFFFF91A4E20823B4011B
      B0021DB1021FB4010895020CAA0A2EFE0323FB011FF6001CEB0018E1788FF0FF
      FFFFFFFFFF96A7EA021BB50019AF021DB1021DB10220B5010C99040EAC294DFE
      0D30FB011FFA001CF7011CEE8EA1F4FFFFFFFFFFFFA6B6EE0520C20018B6021D
      B1021DB10220B5010B980208A04162FB2F51FC001EFA0725FA8AA0FEFFFFFF8E
      A3F67991F2FFFFFFA3B4EE0C29C6011BB8021DB4021FB2000793000189314FEF
      7690FF0F2DFA3354FBFFFFFF91A5FE021EF30017E7738BF3FFFFFF4765E00016
      C2021FBD021CB2000288FF00FF0C1BBC819AFF728BFE1134FA3456FB0526FA00
      1CFA001CF40220ED3353ED0625DA011DD00220CB010DA1FF00FFFF00FF000189
      2943E6A5B7FF849AFC2341FB0323FA011FFA011FFA001EF7011BEE021FE50121
      E20118BF000184FF00FFFF00FFFF00FF01038F2A45E693A9FFABBBFF758FFE49
      69FC3658FB3153FC2346FC092CF70118CB00038BFF00FFFF00FFFF00FFFF00FF
      FF00FF0001890F1DBF3E5BF36B87FE728CFF5E7BFE395BFB1231EB010FB50001
      84FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF000189030AA306
      11B2050FB10107A0000188FF00FFFF00FFFF00FFFF00FFFF00FF}
  end
  object btnClientWork: TBitBtn
    Left = 672
    Top = 104
    Width = 143
    Height = 25
    Action = actionWork
    Caption = #1056#1072#1073#1086#1090#1072' '#1089' '#1082#1083#1080#1077#1085#1090#1086#1084
    TabOrder = 8
    Glyph.Data = {
      36050000424D3605000000000000360400002800000010000000100000000100
      0800000000000001000000000000000000000001000000010000000000000101
      0100020202000303030004040400050505000606060007070700080808000909
      09000A0A0A000B0B0B000C0C0C000D0D0D000E0E0E000F0F0F00101010001111
      1100121212001313130014141400151515001616160017171700181818001919
      19001A1A1A001B1B1B001C1C1C001D1D1D001E1E1E001F1F1F00202020002121
      2100222222002323230024242400252525002626260027272700282828002929
      29002A2A2A002B2B2B002C2C2C002D2D2D002E2E2E002F2F2F00303030003131
      3100323232003333330034343400353535003636360037373700383838003939
      39003A3A3A003B3B3B003C3C3C003D3D3D003E3E3E003F3F3F00404040004141
      41004242420043434300444444004545450041474A003E494F003B4B5400384D
      5800354F5C002B556A00235A75001B5F810014648B000F6691000D6894000B69
      97000B6B9A000A6D9C000A6E9D000B6F9E000B70A0000B71A0000C71A1000B72
      A2000B72A2000B73A3000A73A4000A74A5000B77A9000C7BAD000E7EAF000D82
      B4000D84B7000F88BA00108ABD00118BBE00148DBE00158EC0001791C3001994
      C6001B96C8001F9AC900259DC9002DA2CA0033A7CE0036A9CF0039AAD10037AB
      D30033ABD5002FABD6002CACD9002AAEDC0028B0DF0025B3E30023B6E60020B8
      E9001BBBED0018BFF20019C3F50017C4F70015C5F90014C6FA0011C6FB0011C7
      FC0013C7FC0016C8FB001DC8FA0024C8F80032CBF6003DCDF50045CEF4004BCE
      F30051D0F30054D1F30058D3F3005BD5F30060D4F10064D3EF0068D2EC006ED3
      EB0072D3EA007AD3E90080D3E6008AD4E50093D5E5009ED6E300ACD6DF00BDD5
      DB00C8D6D900D2D8DA00D6D9DA00DAD9D900DDD9D800DED9D800DDD9D800DDD9
      D800DCD8D800DCD8D700DBD7D600DAD6D500D9D5D400D7D4D300D5D1D100D3D0
      CF00D1CECE00CECCCC00CBCAC900C9C8C700C6C5C500C3C3C300C0C0C000BDBD
      BD00BCBBBB00BABABA00B8B8B800B7B7B700B6B6B600B7B7B700B8B8B800BAB7
      B700BDB7B600BFB6B600C1B6B500C2B6B500C4B5B400C5B5B400C7B5B400C8B5
      B400C9B5B400C9B5B400C8B5B300C8B4B200CCA8B300D0A0B500D592BC00DE7A
      C800E365D000E852D700ED41DD00F134E300F429E800F61FED00F915F300FC0A
      F800FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00
      FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00
      FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE01
      FE00FD02FC00F50CF500EA1BE800D831D700C253BF00B06CAD00A47FA0009E89
      99009A8E9600998F9300988F9200978E9000958D8E00938C8C00918A8A008F89
      89008B868600878383008481810083808000817F7F00807F7F00DDDDDDDDDDDD
      DD646951DDDDDDDDDDDDDDDDDD666652616A6B57536C68DDDDDDDDDDDD676C6A
      647A8668717167DDDDDDDD58606D90717881858871979358DDDDDD6E6D719392
      878381878D8E796B67DDDD5F68778F938B6E6D788080807B6BDDDD5D6A768A93
      FFFFFFFF6D80808063DDDD5E6A6B87FF9FF1F7C7FF87949760DDDD5C636A78FF
      9FF2F7C7FF8E969267DDDDDD506577FF9FF2F7C7FF89894FDDDDDDDDDD565EFF
      9FF2F7C6FF615EDDDDDDDDDDDDDDDDFF9EF2F8C6FFDDDDDDDDDDDDDDDDDDDDFF
      F1F9FEF9FFDDDDDDDDDDDDDDDDDDDDFFA4B7F7F4FFDDDDDDDDDDDDDDDDDDDDFF
      9E9FB6FAFFDDDDDDDDDDDDDDDDDDDDDDFFFFFFFFDDDDDDDDDDDD}
  end
  object GroupBox6: TGroupBox
    Left = 8
    Top = 567
    Width = 657
    Height = 145
    Caption = #1044#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1099#1077' '#1089#1074#1077#1076#1077#1085#1080#1103':'
    TabOrder = 9
    object leAge: TLabeledEdit
      Left = 8
      Top = 32
      Width = 65
      Height = 21
      EditLabel.Width = 44
      EditLabel.Height = 13
      EditLabel.Caption = #1042#1086#1079#1088#1072#1089#1090':'
      TabOrder = 0
      OnChange = leAgeChange
    end
    object leRole: TLabeledEdit
      Left = 79
      Top = 32
      Width = 226
      Height = 21
      EditLabel.Width = 61
      EditLabel.Height = 13
      EditLabel.Caption = #1044#1086#1083#1078#1085#1086#1089#1090#1100':'
      TabOrder = 1
      OnChange = leRoleChange
    end
    object leCareere: TLabeledEdit
      Left = 311
      Top = 32
      Width = 337
      Height = 21
      EditLabel.Width = 94
      EditLabel.Height = 13
      EditLabel.Caption = #1057#1090#1091#1087#1077#1085#1080' '#1082#1072#1088#1100#1077#1088#1099':'
      TabOrder = 2
      OnChange = leCareereChange
    end
    object leLimitations: TLabeledEdit
      Left = 8
      Top = 75
      Width = 217
      Height = 21
      EditLabel.Width = 71
      EditLabel.Height = 13
      EditLabel.Caption = #1054#1075#1088#1072#1085#1080#1095#1077#1085#1080#1103':'
      TabOrder = 3
      OnChange = leLimitationsChange
    end
    object lePrivelegies: TLabeledEdit
      Left = 231
      Top = 75
      Width = 226
      Height = 21
      EditLabel.Width = 64
      EditLabel.Height = 13
      EditLabel.Caption = #1055#1088#1080#1074#1077#1083#1077#1075#1080#1080':'
      TabOrder = 4
      OnChange = lePrivelegiesChange
    end
    object lePhone: TLabeledEdit
      Left = 8
      Top = 119
      Width = 154
      Height = 21
      EditLabel.Width = 48
      EditLabel.Height = 13
      EditLabel.Caption = #1058#1077#1083#1077#1092#1086#1085':'
      TabOrder = 5
      OnChange = lePhoneChange
    end
    object leFax: TLabeledEdit
      Left = 168
      Top = 119
      Width = 145
      Height = 21
      EditLabel.Width = 29
      EditLabel.Height = 13
      EditLabel.Caption = #1060#1072#1082#1089':'
      TabOrder = 6
      OnChange = leFaxChange
    end
    object leEMail: TLabeledEdit
      Left = 319
      Top = 119
      Width = 329
      Height = 21
      EditLabel.Width = 32
      EditLabel.Height = 13
      EditLabel.Caption = 'E-Mail:'
      TabOrder = 7
      OnChange = leEMailChange
    end
    object leManager: TLabeledEdit
      Left = 463
      Top = 75
      Width = 185
      Height = 21
      EditLabel.Width = 57
      EditLabel.Height = 13
      EditLabel.Caption = #1052#1077#1085#1077#1076#1078#1077#1088':'
      TabOrder = 8
      OnChange = leManagerChange
    end
  end
  object GroupBox7: TGroupBox
    Left = 8
    Top = 718
    Width = 657
    Height = 143
    Caption = #1055#1088#1080#1084#1077#1095#1077#1085#1080#1077':'
    TabOrder = 10
    object reAddInfo: TRichEdit
      Left = 11
      Top = 18
      Width = 637
      Height = 95
      ScrollBars = ssBoth
      TabOrder = 0
      OnChange = reAddInfoChange
    end
    object cbPrintAddInfo: TCheckBox
      Left = 11
      Top = 119
      Width = 230
      Height = 17
      Caption = #1042#1099#1074#1086#1076#1080#1090#1100' '#1087#1088#1080#1084#1077#1095#1072#1085#1080#1077' '#1085#1072' '#1087#1077#1095#1072#1090#1100
      Checked = True
      State = cbChecked
      TabOrder = 1
    end
  end
  object ActionList1: TActionList
    Left = 720
    Top = 240
    object actionClose: TAction
      Caption = #1047#1072#1082#1088#1099#1090#1100
      OnExecute = actionCloseExecute
    end
    object actionEdit: TAction
      Caption = 'actionEdit'
      OnExecute = actionEditExecute
    end
    object actionClear: TAction
      Caption = #1054#1095#1080#1089#1090#1080#1090#1100
      OnExecute = actionClearExecute
    end
    object actionSave: TAction
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      OnExecute = actionSaveExecute
    end
    object actionPrint: TAction
      Caption = #1055#1077#1095#1072#1090#1100
      OnExecute = actionPrintExecute
    end
    object actionWork: TAction
      Caption = #1056#1072#1073#1086#1090#1072' '#1089' '#1082#1083#1080#1077#1085#1090#1086#1084
      OnExecute = actionWorkExecute
    end
  end
  object ADOQuery1: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = '@ID'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select * from dbo.apClientReport where ID=:@ID')
    Left = 728
    Top = 328
    object ADOQuery1Name: TWideStringField
      FieldName = 'Name'
      Size = 50
    end
    object ADOQuery1privateID: TWideStringField
      FieldName = 'privateID'
      Size = 50
    end
    object ADOQuery1businessID: TWideStringField
      FieldName = 'businessID'
      Size = 50
    end
    object ADOQuery1LastName: TWideStringField
      FieldName = 'LastName'
      Size = 50
    end
    object ADOQuery1FirstName: TWideStringField
      FieldName = 'FirstName'
      Size = 50
    end
    object ADOQuery1Surname: TWideStringField
      FieldName = 'Surname'
      Size = 50
    end
    object ADOQuery1clientMark: TIntegerField
      FieldName = 'clientMark'
    end
    object ADOQuery1Birthday: TWideStringField
      FieldName = 'Birthday'
      Size = 50
    end
    object ADOQuery1Age: TIntegerField
      FieldName = 'Age'
    end
    object ADOQuery1Role: TWideStringField
      FieldName = 'Role'
      Size = 50
    end
    object ADOQuery1Careere: TWideStringField
      FieldName = 'Careere'
      Size = 50
    end
    object ADOQuery1Limitations: TWideStringField
      FieldName = 'Limitations'
      Size = 50
    end
    object ADOQuery1Privelegies: TWideStringField
      FieldName = 'Privelegies'
      Size = 50
    end
    object ADOQuery1Phone: TWideStringField
      FieldName = 'Phone'
    end
    object ADOQuery1Manager: TWideStringField
      FieldName = 'Manager'
      Size = 50
    end
    object ADOQuery1Fax: TWideStringField
      FieldName = 'Fax'
    end
    object ADOQuery1EMail: TWideStringField
      FieldName = 'EMail'
      Size = 50
    end
    object ADOQuery1clientType: TIntegerField
      FieldName = 'clientType'
    end
    object ADOQuery1CallDate: TWideStringField
      FieldName = 'CallDate'
      Size = 10
    end
    object ADOQuery1CallPurpose: TWideStringField
      FieldName = 'CallPurpose'
      Size = 50
    end
    object ADOQuery1Requirement: TWideStringField
      FieldName = 'Requirement'
      Size = 50
    end
    object ADOQuery1Periodic: TWideStringField
      FieldName = 'Periodic'
      Size = 50
    end
    object ADOQuery1SupplyType: TIntegerField
      FieldName = 'SupplyType'
    end
    object ADOQuery1SupplyCondition: TIntegerField
      FieldName = 'SupplyCondition'
    end
    object ADOQuery1WorkResult: TWideStringField
      FieldName = 'WorkResult'
      Size = 50
    end
    object ADOQuery1mat_name: TWideStringField
      FieldName = 'mat_name'
      Size = 50
    end
    object ADOQuery1ID: TIntegerField
      FieldName = 'ID'
    end
    object ADOQuery1Interesting: TWideStringField
      FieldName = 'Interesting'
      Size = 50
    end
    object ADOQuery1regionName: TWideStringField
      FieldName = 'regionName'
      Size = 50
    end
    object ADOQuery1fullFactAddress: TWideStringField
      FieldName = 'fullFactAddress'
      ReadOnly = True
      Size = 134
    end
    object ADOQuery1fullRegAddress: TWideStringField
      FieldName = 'fullRegAddress'
      ReadOnly = True
      Size = 134
    end
    object ADOQuery1SourceInfo: TWideStringField
      FieldName = 'SourceInfo'
      Size = 50
    end
    object ADOQuery1ClientManager: TWideStringField
      FieldName = 'ClientManager'
      Size = 50
    end
    object ADOQuery1AddInfo: TWideMemoField
      FieldName = 'AddInfo'
      BlobType = ftWideMemo
    end
  end
  object ppReport1: TppReport
    AutoStop = False
    DataPipeline = ppDBPipeline1
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.SaveDeviceSettings = False
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    Template.FileName = 'C:\Projects\Delphi\ClientBase\reports\clientReport.rtm'
    Units = utMillimeters
    ArchiveFileName = '($MyDocuments)\ReportArchive.raf'
    DeviceType = 'Screen'
    DefaultFileDeviceType = 'PDF'
    EmailSettings.ReportFormat = 'PDF'
    LanguageID = 'Default'
    OpenFile = False
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = True
    OutlineSettings.Visible = True
    ThumbnailSettings.Enabled = True
    ThumbnailSettings.Visible = True
    ThumbnailSettings.DeadSpace = 30
    PDFSettings.EmbedFontOptions = [efUseSubset]
    PDFSettings.EncryptSettings.AllowCopy = True
    PDFSettings.EncryptSettings.AllowInteract = True
    PDFSettings.EncryptSettings.AllowModify = True
    PDFSettings.EncryptSettings.AllowPrint = True
    PDFSettings.EncryptSettings.AllowExtract = True
    PDFSettings.EncryptSettings.AllowAssemble = True
    PDFSettings.EncryptSettings.AllowQualityPrint = True
    PDFSettings.EncryptSettings.Enabled = False
    PDFSettings.EncryptSettings.KeyLength = kl40Bit
    PDFSettings.EncryptSettings.EncryptionType = etRC4
    PDFSettings.FontEncoding = feAnsi
    PDFSettings.ImageCompressionLevel = 25
    RTFSettings.DefaultFont.Charset = DEFAULT_CHARSET
    RTFSettings.DefaultFont.Color = clWindowText
    RTFSettings.DefaultFont.Height = -13
    RTFSettings.DefaultFont.Name = 'Arial'
    RTFSettings.DefaultFont.Style = []
    TextFileName = '($MyDocuments)\Report.pdf'
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    XLSSettings.AppName = 'ReportBuilder'
    XLSSettings.Author = 'ReportBuilder'
    XLSSettings.Subject = 'Report'
    XLSSettings.Title = 'Report'
    XLSSettings.WorksheetName = 'Report'
    Left = 696
    Top = 288
    Version = '17.0'
    mmColumnWidth = 197300
    DataPipelineName = 'ppDBPipeline1'
    object ppHeaderBand1: TppHeaderBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 10583
      mmPrintPosition = 0
      object ppLabel1: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label1'
        Caption = #1050#1072#1088#1090#1086#1095#1082#1072' '#1082#1083#1080#1077#1085#1090#1072'  '#1054#1054#1054' "'#1040#1083#1077#1082#1089#1087#1088#1086#1084'"'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 16
        Font.Style = []
        Transparent = True
        mmHeight = 6350
        mmLeft = 46567
        mmTop = 2910
        mmWidth = 93398
        BandType = 0
        LayerName = Foreground
      end
    end
    object ppDetailBand1: TppDetailBand
      Background1.Brush.Style = bsClear
      Background2.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 263526
      mmPrintPosition = 0
      object ppTableGrid1: TppTableGrid
        DesignLayer = ppDesignLayer1
        UserName = 'TableGrid1'
        DefaultColWidth = 12.699999809265140000
        DefaultRowHeight = 8.000000000000000000
        mmHeight = 255000
        mmLeft = 2117
        mmTop = 2094
        mmWidth = 188648
        BandType = 4
        LayerName = Foreground
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmMinHeight = 0
        mmDefaultRowHeight = 8000
        mmDefaultColWidth = 12700
        object ppTableRow1: TppTableRow
          DesignLayer = ppDesignLayer1
          UserName = 'TableRow1'
          mmHeight = 8000
          mmLeft = 0
          mmTop = 0
          mmWidth = 48948
          BandType = 4
          LayerName = Foreground
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          mmMinHeight = 0
          object ppTableCell1: TppTableCell
            DesignLayer = ppDesignLayer1
            UserName = 'TableCell1'
            Border.BorderPositions = [bpLeft, bpTop, bpRight, bpBottom]
            Border.Weight = 1.000000000000000000
            Brush.Style = bsClear
            Padding = 1.057999968528748000
            Transparent = True
            mmHeight = 23548
            mmLeft = 0
            mmTop = 0
            mmWidth = 48948
            BandType = 4
            LayerName = Foreground
            mmBottomOffset = 0
            mmOverFlowOffset = 0
            mmStopPosition = 0
            mmMinHeight = 8000
            mmPadding = 1058
            object ppLabel2: TppLabel
              DesignLayer = ppDesignLayer1
              UserName = 'Label2'
              Anchors = [atLeft, atRight]
              AutoSize = False
              Caption = #1060#1072#1084#1080#1083#1080#1103
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 12
              Font.Style = [fsBold, fsItalic]
              Transparent = True
              VerticalAlignment = avCenter
              mmHeight = 6350
              mmLeft = 3175
              mmTop = 3150
              mmWidth = 69054
              BandType = 4
              LayerName = Foreground
            end
          end
          object ppTableCell2: TppTableCell
            DesignLayer = ppDesignLayer1
            UserName = 'TableCell2'
            Border.BorderPositions = [bpLeft, bpTop, bpRight, bpBottom]
            Border.Weight = 1.000000000000000000
            Brush.Style = bsClear
            Padding = 1.057999968528748000
            Transparent = True
            mmHeight = 23548
            mmLeft = 0
            mmTop = 0
            mmWidth = 48948
            BandType = 4
            LayerName = Foreground
            mmBottomOffset = 0
            mmOverFlowOffset = 0
            mmStopPosition = 0
            mmMinHeight = 8000
            mmPadding = 1058
            object ppDBText2: TppDBText
              DesignLayer = ppDesignLayer1
              UserName = 'DBText2'
              Anchors = [atLeft, atRight]
              DataField = 'LastName'
              DataPipeline = ppDBPipeline1
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 12
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppDBPipeline1'
              mmHeight = 4498
              mmLeft = 74345
              mmTop = 3946
              mmWidth = 115362
              BandType = 4
              LayerName = Foreground
            end
          end
        end
        object ppTableRow2: TppTableRow
          DesignLayer = ppDesignLayer1
          UserName = 'TableRow2'
          mmHeight = 8000
          mmLeft = 0
          mmTop = 0
          mmWidth = 48948
          BandType = 4
          LayerName = Foreground
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          mmMinHeight = 0
          object ppTableCell3: TppTableCell
            DesignLayer = ppDesignLayer1
            UserName = 'TableCell3'
            Border.BorderPositions = [bpLeft, bpTop, bpRight, bpBottom]
            Border.Weight = 1.000000000000000000
            Brush.Style = bsClear
            Padding = 1.057999968528748000
            Transparent = True
            mmHeight = 23548
            mmLeft = 0
            mmTop = 0
            mmWidth = 48948
            BandType = 4
            LayerName = Foreground
            mmBottomOffset = 0
            mmOverFlowOffset = 0
            mmStopPosition = 0
            mmMinHeight = 8000
            mmPadding = 1058
            object ppLabel3: TppLabel
              DesignLayer = ppDesignLayer1
              UserName = 'Label3'
              Anchors = [atLeft, atRight]
              AutoSize = False
              Caption = #1048#1084#1103
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 12
              Font.Style = [fsBold, fsItalic]
              Transparent = True
              VerticalAlignment = avCenter
              mmHeight = 4763
              mmLeft = 3175
              mmTop = 11617
              mmWidth = 69054
              BandType = 4
              LayerName = Foreground
            end
          end
          object ppTableCell4: TppTableCell
            DesignLayer = ppDesignLayer1
            UserName = 'TableCell4'
            Border.BorderPositions = [bpLeft, bpTop, bpRight, bpBottom]
            Border.Weight = 1.000000000000000000
            Brush.Style = bsClear
            Padding = 1.057999968528748000
            Transparent = True
            mmHeight = 23548
            mmLeft = 0
            mmTop = 0
            mmWidth = 48948
            BandType = 4
            LayerName = Foreground
            mmBottomOffset = 0
            mmOverFlowOffset = 0
            mmStopPosition = 0
            mmMinHeight = 8000
            mmPadding = 1058
            object ppDBText3: TppDBText
              DesignLayer = ppDesignLayer1
              UserName = 'DBText3'
              Anchors = [atLeft, atRight]
              DataField = 'FirstName'
              DataPipeline = ppDBPipeline1
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 12
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppDBPipeline1'
              mmHeight = 4498
              mmLeft = 74345
              mmTop = 11616
              mmWidth = 115362
              BandType = 4
              LayerName = Foreground
            end
          end
        end
        object ppTableRow3: TppTableRow
          DesignLayer = ppDesignLayer1
          UserName = 'TableRow3'
          mmHeight = 8000
          mmLeft = 0
          mmTop = 0
          mmWidth = 48948
          BandType = 4
          LayerName = Foreground
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          mmMinHeight = 0
          object ppTableCell5: TppTableCell
            DesignLayer = ppDesignLayer1
            UserName = 'TableCell5'
            Border.BorderPositions = [bpLeft, bpTop, bpRight, bpBottom]
            Border.Weight = 1.000000000000000000
            Brush.Style = bsClear
            Padding = 1.057999968528748000
            Transparent = True
            mmHeight = 23548
            mmLeft = 0
            mmTop = 0
            mmWidth = 48948
            BandType = 4
            LayerName = Foreground
            mmBottomOffset = 0
            mmOverFlowOffset = 0
            mmStopPosition = 0
            mmMinHeight = 8000
            mmPadding = 1058
            object ppLabel4: TppLabel
              DesignLayer = ppDesignLayer1
              UserName = 'Label4'
              Anchors = [atLeft, atRight]
              AutoSize = False
              Caption = #1054#1090#1095#1077#1089#1090#1074#1086
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 12
              Font.Style = [fsBold, fsItalic]
              Transparent = True
              VerticalAlignment = avCenter
              mmHeight = 4762
              mmLeft = 3175
              mmTop = 19556
              mmWidth = 69054
              BandType = 4
              LayerName = Foreground
            end
          end
          object ppTableCell6: TppTableCell
            DesignLayer = ppDesignLayer1
            UserName = 'TableCell6'
            Border.BorderPositions = [bpLeft, bpTop, bpRight, bpBottom]
            Border.Weight = 1.000000000000000000
            Brush.Style = bsClear
            Padding = 1.057999968528748000
            Transparent = True
            mmHeight = 23548
            mmLeft = 0
            mmTop = 0
            mmWidth = 48948
            BandType = 4
            LayerName = Foreground
            mmBottomOffset = 0
            mmOverFlowOffset = 0
            mmStopPosition = 0
            mmMinHeight = 8000
            mmPadding = 1058
            object ppDBText4: TppDBText
              DesignLayer = ppDesignLayer1
              UserName = 'DBText4'
              Anchors = [atLeft, atRight]
              DataField = 'Surname'
              DataPipeline = ppDBPipeline1
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 12
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppDBPipeline1'
              mmHeight = 4498
              mmLeft = 74345
              mmTop = 19556
              mmWidth = 115362
              BandType = 4
              LayerName = Foreground
            end
          end
        end
        object ppTableRow4: TppTableRow
          DesignLayer = ppDesignLayer1
          UserName = 'TableRow4'
          mmHeight = 8000
          mmLeft = 0
          mmTop = 0
          mmWidth = 48948
          BandType = 4
          LayerName = Foreground
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          mmMinHeight = 0
          object ppTableCell7: TppTableCell
            DesignLayer = ppDesignLayer1
            UserName = 'TableCell7'
            Border.BorderPositions = [bpLeft, bpTop, bpRight, bpBottom]
            Border.Weight = 1.000000000000000000
            Brush.Style = bsClear
            Padding = 1.057999968528748000
            Transparent = True
            mmHeight = 23548
            mmLeft = 0
            mmTop = 0
            mmWidth = 48948
            BandType = 4
            LayerName = Foreground
            mmBottomOffset = 0
            mmOverFlowOffset = 0
            mmStopPosition = 0
            mmMinHeight = 8000
            mmPadding = 1058
            object ppLabel5: TppLabel
              DesignLayer = ppDesignLayer1
              UserName = 'Label5'
              Anchors = [atLeft, atRight]
              AutoSize = False
              Caption = #1044#1072#1090#1072' '#1088#1086#1078#1076#1077#1085#1080#1103
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 12
              Font.Style = [fsBold, fsItalic]
              Transparent = True
              mmHeight = 4763
              mmLeft = 3175
              mmTop = 27515
              mmWidth = 69054
              BandType = 4
              LayerName = Foreground
            end
          end
          object ppTableCell8: TppTableCell
            DesignLayer = ppDesignLayer1
            UserName = 'TableCell8'
            Border.BorderPositions = [bpLeft, bpTop, bpRight, bpBottom]
            Border.Weight = 1.000000000000000000
            Brush.Style = bsClear
            Padding = 1.057999968528748000
            Transparent = True
            mmHeight = 23548
            mmLeft = 0
            mmTop = 0
            mmWidth = 48948
            BandType = 4
            LayerName = Foreground
            mmBottomOffset = 0
            mmOverFlowOffset = 0
            mmStopPosition = 0
            mmMinHeight = 8000
            mmPadding = 1058
            object ppDBText1: TppDBText
              DesignLayer = ppDesignLayer1
              UserName = 'DBText1'
              Anchors = [atLeft, atRight]
              DataField = 'Birthday'
              DataPipeline = ppDBPipeline1
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 12
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppDBPipeline1'
              mmHeight = 4498
              mmLeft = 74345
              mmTop = 27517
              mmWidth = 115362
              BandType = 4
              LayerName = Foreground
            end
          end
        end
        object ppTableRow5: TppTableRow
          DesignLayer = ppDesignLayer1
          UserName = 'TableRow5'
          mmHeight = 3000
          mmLeft = 0
          mmTop = 0
          mmWidth = 48948
          BandType = 4
          LayerName = Foreground
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          mmMinHeight = 0
          object ppTableCell9: TppTableCell
            DesignLayer = ppDesignLayer1
            UserName = 'TableCell9'
            Border.BorderPositions = [bpLeft, bpTop, bpRight, bpBottom]
            Border.Weight = 1.000000000000000000
            Brush.Style = bsClear
            Padding = 1.057999968528748000
            Transparent = True
            mmHeight = 23548
            mmLeft = 0
            mmTop = 0
            mmWidth = 48948
            BandType = 4
            LayerName = Foreground
            mmBottomOffset = 0
            mmOverFlowOffset = 0
            mmStopPosition = 0
            mmMinHeight = 3000
            mmPadding = 1058
          end
          object ppTableCell10: TppTableCell
            DesignLayer = ppDesignLayer1
            UserName = 'TableCell10'
            Border.BorderPositions = [bpLeft, bpTop, bpRight, bpBottom]
            Border.Weight = 1.000000000000000000
            Brush.Style = bsClear
            Padding = 1.057999968528748000
            Transparent = True
            mmHeight = 23548
            mmLeft = 0
            mmTop = 0
            mmWidth = 48948
            BandType = 4
            LayerName = Foreground
            mmBottomOffset = 0
            mmOverFlowOffset = 0
            mmStopPosition = 0
            mmMinHeight = 3000
            mmPadding = 1058
          end
        end
        object ppTableRow6: TppTableRow
          DesignLayer = ppDesignLayer1
          UserName = 'TableRow6'
          mmHeight = 8000
          mmLeft = 0
          mmTop = 0
          mmWidth = 48948
          BandType = 4
          LayerName = Foreground
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          mmMinHeight = 0
          object ppTableCell11: TppTableCell
            DesignLayer = ppDesignLayer1
            UserName = 'TableCell11'
            Border.BorderPositions = [bpLeft, bpTop, bpRight, bpBottom]
            Border.Weight = 1.000000000000000000
            Brush.Style = bsClear
            Padding = 1.057999968528748000
            Transparent = True
            mmHeight = 23548
            mmLeft = 0
            mmTop = 0
            mmWidth = 48948
            BandType = 4
            LayerName = Foreground
            mmBottomOffset = 0
            mmOverFlowOffset = 0
            mmStopPosition = 0
            mmMinHeight = 8000
            mmPadding = 1058
            object ppLabel6: TppLabel
              DesignLayer = ppDesignLayer1
              UserName = 'Label6'
              Anchors = [atLeft, atRight]
              AutoSize = False
              Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 12
              Font.Style = [fsBold, fsItalic]
              Transparent = True
              mmHeight = 4763
              mmLeft = 3175
              mmTop = 38628
              mmWidth = 69054
              BandType = 4
              LayerName = Foreground
            end
          end
          object ppTableCell12: TppTableCell
            DesignLayer = ppDesignLayer1
            UserName = 'TableCell12'
            Border.BorderPositions = [bpLeft, bpTop, bpRight, bpBottom]
            Border.Weight = 1.000000000000000000
            Brush.Style = bsClear
            Padding = 1.057999968528748000
            Transparent = True
            mmHeight = 23548
            mmLeft = 0
            mmTop = 0
            mmWidth = 48948
            BandType = 4
            LayerName = Foreground
            mmBottomOffset = 0
            mmOverFlowOffset = 0
            mmStopPosition = 0
            mmMinHeight = 8000
            mmPadding = 1058
            object ppDBText5: TppDBText
              DesignLayer = ppDesignLayer1
              UserName = 'DBText5'
              Anchors = [atLeft, atRight]
              DataField = 'Name'
              DataPipeline = ppDBPipeline1
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 12
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppDBPipeline1'
              mmHeight = 4498
              mmLeft = 74345
              mmTop = 38629
              mmWidth = 115362
              BandType = 4
              LayerName = Foreground
            end
          end
        end
        object ppTableRow7: TppTableRow
          DesignLayer = ppDesignLayer1
          UserName = 'TableRow7'
          mmHeight = 8000
          mmLeft = 0
          mmTop = 0
          mmWidth = 48948
          BandType = 4
          LayerName = Foreground
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          mmMinHeight = 0
          object ppTableCell13: TppTableCell
            DesignLayer = ppDesignLayer1
            UserName = 'TableCell13'
            Border.BorderPositions = [bpLeft, bpTop, bpRight, bpBottom]
            Border.Weight = 1.000000000000000000
            Brush.Style = bsClear
            Padding = 1.057999968528748000
            Transparent = True
            mmHeight = 23548
            mmLeft = 0
            mmTop = 0
            mmWidth = 48948
            BandType = 4
            LayerName = Foreground
            mmBottomOffset = 0
            mmOverFlowOffset = 0
            mmStopPosition = 0
            mmMinHeight = 8000
            mmPadding = 1058
            object ppLabel7: TppLabel
              DesignLayer = ppDesignLayer1
              UserName = 'Label7'
              Anchors = [atLeft, atRight]
              AutoSize = False
              Caption = #1060#1086#1088#1084#1072' '#1089#1086#1073#1089#1090#1074#1077#1085#1085#1086#1089#1090#1080
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 12
              Font.Style = [fsBold, fsItalic]
              Transparent = True
              mmHeight = 5027
              mmLeft = 3175
              mmTop = 46566
              mmWidth = 69054
              BandType = 4
              LayerName = Foreground
            end
          end
          object ppTableCell14: TppTableCell
            DesignLayer = ppDesignLayer1
            UserName = 'TableCell14'
            Border.BorderPositions = [bpLeft, bpTop, bpRight, bpBottom]
            Border.Weight = 1.000000000000000000
            Brush.Style = bsClear
            Padding = 1.057999968528748000
            Transparent = True
            mmHeight = 23548
            mmLeft = 0
            mmTop = 0
            mmWidth = 48948
            BandType = 4
            LayerName = Foreground
            mmBottomOffset = 0
            mmOverFlowOffset = 0
            mmStopPosition = 0
            mmMinHeight = 8000
            mmPadding = 1058
            object ppDBText6: TppDBText
              DesignLayer = ppDesignLayer1
              UserName = 'DBText6'
              Anchors = [atLeft, atRight]
              DataField = 'privateID'
              DataPipeline = ppDBPipeline1
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 12
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppDBPipeline1'
              mmHeight = 4498
              mmLeft = 74345
              mmTop = 46831
              mmWidth = 115362
              BandType = 4
              LayerName = Foreground
            end
          end
        end
        object ppTableRow8: TppTableRow
          DesignLayer = ppDesignLayer1
          UserName = 'TableRow8'
          mmHeight = 8000
          mmLeft = 0
          mmTop = 0
          mmWidth = 48948
          BandType = 4
          LayerName = Foreground
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          mmMinHeight = 0
          object ppTableCell15: TppTableCell
            DesignLayer = ppDesignLayer1
            UserName = 'TableCell15'
            Border.BorderPositions = [bpLeft, bpTop, bpRight, bpBottom]
            Border.Weight = 1.000000000000000000
            Brush.Style = bsClear
            Padding = 1.057999968528748000
            Transparent = True
            mmHeight = 23548
            mmLeft = 0
            mmTop = 0
            mmWidth = 48948
            BandType = 4
            LayerName = Foreground
            mmBottomOffset = 0
            mmOverFlowOffset = 0
            mmStopPosition = 0
            mmMinHeight = 8000
            mmPadding = 1058
            object ppLabel8: TppLabel
              DesignLayer = ppDesignLayer1
              UserName = 'Label8'
              Anchors = [atLeft, atRight]
              AutoSize = False
              Caption = #1042#1080#1076' '#1076#1077#1103#1090#1077#1083#1100#1085#1086#1089#1090#1080
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 12
              Font.Style = [fsBold, fsItalic]
              Transparent = True
              mmHeight = 5028
              mmLeft = 3175
              mmTop = 54503
              mmWidth = 69054
              BandType = 4
              LayerName = Foreground
            end
          end
          object ppTableCell16: TppTableCell
            DesignLayer = ppDesignLayer1
            UserName = 'TableCell16'
            Border.BorderPositions = [bpLeft, bpTop, bpRight, bpBottom]
            Border.Weight = 1.000000000000000000
            Brush.Style = bsClear
            Padding = 1.057999968528748000
            Transparent = True
            mmHeight = 23548
            mmLeft = 0
            mmTop = 0
            mmWidth = 48948
            BandType = 4
            LayerName = Foreground
            mmBottomOffset = 0
            mmOverFlowOffset = 0
            mmStopPosition = 0
            mmMinHeight = 8000
            mmPadding = 1058
            object ppDBText7: TppDBText
              DesignLayer = ppDesignLayer1
              UserName = 'DBText7'
              Anchors = [atLeft, atRight]
              DataField = 'businessID'
              DataPipeline = ppDBPipeline1
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 12
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppDBPipeline1'
              mmHeight = 4498
              mmLeft = 74345
              mmTop = 54768
              mmWidth = 115362
              BandType = 4
              LayerName = Foreground
            end
          end
        end
        object ppTableRow9: TppTableRow
          DesignLayer = ppDesignLayer1
          UserName = 'TableRow9'
          mmHeight = 8000
          mmLeft = 0
          mmTop = 0
          mmWidth = 48948
          BandType = 4
          LayerName = Foreground
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          mmMinHeight = 0
          object ppTableCell17: TppTableCell
            DesignLayer = ppDesignLayer1
            UserName = 'TableCell17'
            Border.BorderPositions = [bpLeft, bpTop, bpRight, bpBottom]
            Border.Weight = 1.000000000000000000
            Brush.Style = bsClear
            Padding = 1.057999968528748000
            Transparent = True
            mmHeight = 23548
            mmLeft = 0
            mmTop = 0
            mmWidth = 48948
            BandType = 4
            LayerName = Foreground
            mmBottomOffset = 0
            mmOverFlowOffset = 0
            mmStopPosition = 0
            mmMinHeight = 8000
            mmPadding = 1058
            object ppLabel9: TppLabel
              DesignLayer = ppDesignLayer1
              UserName = 'Label9'
              Anchors = [atLeft, atRight]
              AutoSize = False
              Caption = #1048#1085#1090#1077#1088#1077#1089#1099' '#1087#1088#1077#1076#1087#1088#1080#1103#1090#1080#1103
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 12
              Font.Style = [fsBold, fsItalic]
              Transparent = True
              mmHeight = 5027
              mmLeft = 3175
              mmTop = 62441
              mmWidth = 69054
              BandType = 4
              LayerName = Foreground
            end
          end
          object ppTableCell18: TppTableCell
            DesignLayer = ppDesignLayer1
            UserName = 'TableCell18'
            Border.BorderPositions = [bpLeft, bpTop, bpRight, bpBottom]
            Border.Weight = 1.000000000000000000
            Brush.Style = bsClear
            Padding = 1.057999968528748000
            Transparent = True
            mmHeight = 23548
            mmLeft = 0
            mmTop = 0
            mmWidth = 48948
            BandType = 4
            LayerName = Foreground
            mmBottomOffset = 0
            mmOverFlowOffset = 0
            mmStopPosition = 0
            mmMinHeight = 8000
            mmPadding = 1058
            object ppDBText8: TppDBText
              DesignLayer = ppDesignLayer1
              UserName = 'DBText8'
              Anchors = [atLeft, atRight]
              DataField = 'Interesting'
              DataPipeline = ppDBPipeline1
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 12
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppDBPipeline1'
              mmHeight = 4498
              mmLeft = 74345
              mmTop = 62707
              mmWidth = 115362
              BandType = 4
              LayerName = Foreground
            end
          end
        end
        object ppTableRow10: TppTableRow
          DesignLayer = ppDesignLayer1
          UserName = 'TableRow10'
          mmHeight = 8000
          mmLeft = 0
          mmTop = 0
          mmWidth = 48948
          BandType = 4
          LayerName = Foreground
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          mmMinHeight = 0
          object ppTableCell19: TppTableCell
            DesignLayer = ppDesignLayer1
            UserName = 'TableCell19'
            Border.BorderPositions = [bpLeft, bpTop, bpRight, bpBottom]
            Border.Weight = 1.000000000000000000
            Brush.Style = bsClear
            Padding = 1.057999968528748000
            Transparent = True
            mmHeight = 23548
            mmLeft = 0
            mmTop = 0
            mmWidth = 48948
            BandType = 4
            LayerName = Foreground
            mmBottomOffset = 0
            mmOverFlowOffset = 0
            mmStopPosition = 0
            mmMinHeight = 8000
            mmPadding = 1058
            object ppLabel10: TppLabel
              DesignLayer = ppDesignLayer1
              UserName = 'Label10'
              Anchors = [atLeft, atRight]
              AutoSize = False
              Caption = #1056#1077#1075#1080#1086#1085
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 12
              Font.Style = [fsBold, fsItalic]
              Transparent = True
              mmHeight = 5027
              mmLeft = 3175
              mmTop = 70379
              mmWidth = 69054
              BandType = 4
              LayerName = Foreground
            end
          end
          object ppTableCell20: TppTableCell
            DesignLayer = ppDesignLayer1
            UserName = 'TableCell20'
            Border.BorderPositions = [bpLeft, bpTop, bpRight, bpBottom]
            Border.Weight = 1.000000000000000000
            Brush.Style = bsClear
            Padding = 1.057999968528748000
            Transparent = True
            mmHeight = 23548
            mmLeft = 0
            mmTop = 0
            mmWidth = 48948
            BandType = 4
            LayerName = Foreground
            mmBottomOffset = 0
            mmOverFlowOffset = 0
            mmStopPosition = 0
            mmMinHeight = 8000
            mmPadding = 1058
            object ppDBText9: TppDBText
              DesignLayer = ppDesignLayer1
              UserName = 'DBText9'
              Anchors = [atLeft, atRight]
              DataField = 'regionName'
              DataPipeline = ppDBPipeline1
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 12
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppDBPipeline1'
              mmHeight = 4498
              mmLeft = 74345
              mmTop = 70379
              mmWidth = 115362
              BandType = 4
              LayerName = Foreground
            end
          end
        end
        object ppTableRow11: TppTableRow
          DesignLayer = ppDesignLayer1
          UserName = 'TableRow11'
          mmHeight = 8000
          mmLeft = 0
          mmTop = 0
          mmWidth = 48948
          BandType = 4
          LayerName = Foreground
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          mmMinHeight = 0
          object ppTableCell21: TppTableCell
            DesignLayer = ppDesignLayer1
            UserName = 'TableCell21'
            Border.BorderPositions = [bpLeft, bpTop, bpRight, bpBottom]
            Border.Weight = 1.000000000000000000
            Brush.Style = bsClear
            Padding = 1.057999968528748000
            Transparent = True
            mmHeight = 23548
            mmLeft = 0
            mmTop = 0
            mmWidth = 48948
            BandType = 4
            LayerName = Foreground
            mmBottomOffset = 0
            mmOverFlowOffset = 0
            mmStopPosition = 0
            mmMinHeight = 8000
            mmPadding = 1058
            object ppLabel11: TppLabel
              DesignLayer = ppDesignLayer1
              UserName = 'Label11'
              Anchors = [atLeft, atRight]
              AutoSize = False
              Caption = #1070#1088#1080#1076#1080#1095#1077#1089#1082#1080#1081' '#1072#1076#1088#1077#1089
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 12
              Font.Style = [fsBold, fsItalic]
              Transparent = True
              mmHeight = 5027
              mmLeft = 3175
              mmTop = 78317
              mmWidth = 69054
              BandType = 4
              LayerName = Foreground
            end
          end
          object ppTableCell22: TppTableCell
            DesignLayer = ppDesignLayer1
            UserName = 'TableCell22'
            Border.BorderPositions = [bpLeft, bpTop, bpRight, bpBottom]
            Border.Weight = 1.000000000000000000
            Brush.Style = bsClear
            Padding = 1.057999968528748000
            Transparent = True
            mmHeight = 23548
            mmLeft = 0
            mmTop = 0
            mmWidth = 48948
            BandType = 4
            LayerName = Foreground
            mmBottomOffset = 0
            mmOverFlowOffset = 0
            mmStopPosition = 0
            mmMinHeight = 8000
            mmPadding = 1058
            object ppDBText25: TppDBText
              DesignLayer = ppDesignLayer1
              UserName = 'DBText25'
              Anchors = [atLeft, atRight]
              DataField = 'fullRegAddress'
              DataPipeline = ppDBPipeline1
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 12
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppDBPipeline1'
              mmHeight = 4498
              mmLeft = 74345
              mmTop = 78581
              mmWidth = 115362
              BandType = 4
              LayerName = Foreground
            end
          end
        end
        object ppTableRow12: TppTableRow
          DesignLayer = ppDesignLayer1
          UserName = 'TableRow12'
          mmHeight = 8000
          mmLeft = 0
          mmTop = 0
          mmWidth = 48948
          BandType = 4
          LayerName = Foreground
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          mmMinHeight = 0
          object ppTableCell23: TppTableCell
            DesignLayer = ppDesignLayer1
            UserName = 'TableCell23'
            Border.BorderPositions = [bpLeft, bpTop, bpRight, bpBottom]
            Border.Weight = 1.000000000000000000
            Brush.Style = bsClear
            Padding = 1.057999968528748000
            Transparent = True
            mmHeight = 23548
            mmLeft = 0
            mmTop = 0
            mmWidth = 48948
            BandType = 4
            LayerName = Foreground
            mmBottomOffset = 0
            mmOverFlowOffset = 0
            mmStopPosition = 0
            mmMinHeight = 8000
            mmPadding = 1058
            object ppLabel12: TppLabel
              DesignLayer = ppDesignLayer1
              UserName = 'Label12'
              Anchors = [atLeft, atRight]
              AutoSize = False
              Caption = #1060#1072#1082#1090#1080#1095#1077#1089#1082#1080#1081' '#1072#1076#1088#1077#1089
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 12
              Font.Style = [fsBold, fsItalic]
              Transparent = True
              mmHeight = 5027
              mmLeft = 3175
              mmTop = 86519
              mmWidth = 69054
              BandType = 4
              LayerName = Foreground
            end
          end
          object ppTableCell24: TppTableCell
            DesignLayer = ppDesignLayer1
            UserName = 'TableCell24'
            Border.BorderPositions = [bpLeft, bpTop, bpRight, bpBottom]
            Border.Weight = 1.000000000000000000
            Brush.Style = bsClear
            Padding = 1.057999968528748000
            Transparent = True
            mmHeight = 23548
            mmLeft = 0
            mmTop = 0
            mmWidth = 48948
            BandType = 4
            LayerName = Foreground
            mmBottomOffset = 0
            mmOverFlowOffset = 0
            mmStopPosition = 0
            mmMinHeight = 8000
            mmPadding = 1058
            object ppDBText26: TppDBText
              DesignLayer = ppDesignLayer1
              UserName = 'DBText26'
              Anchors = [atLeft, atRight]
              DataField = 'fullFactAddress'
              DataPipeline = ppDBPipeline1
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 12
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppDBPipeline1'
              mmHeight = 4498
              mmLeft = 74345
              mmTop = 86796
              mmWidth = 115362
              BandType = 4
              LayerName = Foreground
            end
          end
        end
        object ppTableRow13: TppTableRow
          DesignLayer = ppDesignLayer1
          UserName = 'TableRow13'
          mmHeight = 3000
          mmLeft = 0
          mmTop = 0
          mmWidth = 48948
          BandType = 4
          LayerName = Foreground
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          mmMinHeight = 0
          object ppTableCell25: TppTableCell
            DesignLayer = ppDesignLayer1
            UserName = 'TableCell25'
            Border.BorderPositions = [bpLeft, bpTop, bpRight, bpBottom]
            Border.Weight = 1.000000000000000000
            Brush.Style = bsClear
            Padding = 1.057999968528748000
            Transparent = True
            mmHeight = 23548
            mmLeft = 0
            mmTop = 0
            mmWidth = 48948
            BandType = 4
            LayerName = Foreground
            mmBottomOffset = 0
            mmOverFlowOffset = 0
            mmStopPosition = 0
            mmMinHeight = 3000
            mmPadding = 1058
          end
          object ppTableCell26: TppTableCell
            DesignLayer = ppDesignLayer1
            UserName = 'TableCell26'
            Border.BorderPositions = [bpLeft, bpTop, bpRight, bpBottom]
            Border.Weight = 1.000000000000000000
            Brush.Style = bsClear
            Padding = 1.057999968528748000
            Transparent = True
            mmHeight = 23548
            mmLeft = 0
            mmTop = 0
            mmWidth = 48948
            BandType = 4
            LayerName = Foreground
            mmBottomOffset = 0
            mmOverFlowOffset = 0
            mmStopPosition = 0
            mmMinHeight = 3000
            mmPadding = 1058
          end
        end
        object ppTableRow14: TppTableRow
          DesignLayer = ppDesignLayer1
          UserName = 'TableRow14'
          mmHeight = 8000
          mmLeft = 0
          mmTop = 0
          mmWidth = 48948
          BandType = 4
          LayerName = Foreground
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          mmMinHeight = 0
          object ppTableCell27: TppTableCell
            DesignLayer = ppDesignLayer1
            UserName = 'TableCell27'
            Border.BorderPositions = [bpLeft, bpTop, bpRight, bpBottom]
            Border.Weight = 1.000000000000000000
            Brush.Style = bsClear
            Padding = 1.057999968528748000
            Transparent = True
            mmHeight = 23548
            mmLeft = 0
            mmTop = 0
            mmWidth = 48948
            BandType = 4
            LayerName = Foreground
            mmBottomOffset = 0
            mmOverFlowOffset = 0
            mmStopPosition = 0
            mmMinHeight = 8000
            mmPadding = 1058
            object ppLabel13: TppLabel
              DesignLayer = ppDesignLayer1
              UserName = 'Label13'
              Anchors = [atLeft, atRight]
              AutoSize = False
              Caption = #1044#1072#1090#1072' '#1079#1074#1086#1085#1082#1072
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 12
              Font.Style = [fsBold, fsItalic]
              Transparent = True
              mmHeight = 5028
              mmLeft = 3175
              mmTop = 97631
              mmWidth = 69054
              BandType = 4
              LayerName = Foreground
            end
          end
          object ppTableCell28: TppTableCell
            DesignLayer = ppDesignLayer1
            UserName = 'TableCell28'
            Border.BorderPositions = [bpLeft, bpTop, bpRight, bpBottom]
            Border.Weight = 1.000000000000000000
            Brush.Style = bsClear
            Padding = 1.057999968528748000
            Transparent = True
            mmHeight = 23548
            mmLeft = 0
            mmTop = 0
            mmWidth = 48948
            BandType = 4
            LayerName = Foreground
            mmBottomOffset = 0
            mmOverFlowOffset = 0
            mmStopPosition = 0
            mmMinHeight = 8000
            mmPadding = 1058
            object ppDBText10: TppDBText
              DesignLayer = ppDesignLayer1
              UserName = 'DBText10'
              Anchors = [atLeft, atRight]
              DataField = 'CallDate'
              DataPipeline = ppDBPipeline1
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 12
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppDBPipeline1'
              mmHeight = 4498
              mmLeft = 74345
              mmTop = 97896
              mmWidth = 115362
              BandType = 4
              LayerName = Foreground
            end
          end
        end
        object ppTableRow15: TppTableRow
          DesignLayer = ppDesignLayer1
          UserName = 'TableRow15'
          mmHeight = 8000
          mmLeft = 0
          mmTop = 0
          mmWidth = 48948
          BandType = 4
          LayerName = Foreground
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          mmMinHeight = 0
          object ppTableCell29: TppTableCell
            DesignLayer = ppDesignLayer1
            UserName = 'TableCell29'
            Border.BorderPositions = [bpLeft, bpTop, bpRight, bpBottom]
            Border.Weight = 1.000000000000000000
            Brush.Style = bsClear
            Padding = 1.057999968528748000
            Transparent = True
            mmHeight = 23548
            mmLeft = 0
            mmTop = 0
            mmWidth = 48948
            BandType = 4
            LayerName = Foreground
            mmBottomOffset = 0
            mmOverFlowOffset = 0
            mmStopPosition = 0
            mmMinHeight = 8000
            mmPadding = 1058
            object ppLabel14: TppLabel
              DesignLayer = ppDesignLayer1
              UserName = 'Label14'
              Anchors = [atLeft, atRight]
              AutoSize = False
              Caption = #1062#1077#1083#1100' '#1079#1074#1086#1085#1082#1072
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 12
              Font.Style = [fsBold, fsItalic]
              Transparent = True
              mmHeight = 5027
              mmLeft = 3175
              mmTop = 105569
              mmWidth = 69054
              BandType = 4
              LayerName = Foreground
            end
          end
          object ppTableCell30: TppTableCell
            DesignLayer = ppDesignLayer1
            UserName = 'TableCell30'
            Border.BorderPositions = [bpLeft, bpTop, bpRight, bpBottom]
            Border.Weight = 1.000000000000000000
            Brush.Style = bsClear
            Padding = 1.057999968528748000
            Transparent = True
            mmHeight = 23548
            mmLeft = 0
            mmTop = 0
            mmWidth = 48948
            BandType = 4
            LayerName = Foreground
            mmBottomOffset = 0
            mmOverFlowOffset = 0
            mmStopPosition = 0
            mmMinHeight = 8000
            mmPadding = 1058
            object ppDBText11: TppDBText
              DesignLayer = ppDesignLayer1
              UserName = 'DBText11'
              Anchors = [atLeft, atRight]
              DataField = 'CallPurpose'
              DataPipeline = ppDBPipeline1
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 12
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppDBPipeline1'
              mmHeight = 4498
              mmLeft = 74345
              mmTop = 105569
              mmWidth = 115362
              BandType = 4
              LayerName = Foreground
            end
          end
        end
        object ppTableRow16: TppTableRow
          DesignLayer = ppDesignLayer1
          UserName = 'TableRow16'
          mmHeight = 8000
          mmLeft = 0
          mmTop = 0
          mmWidth = 48948
          BandType = 4
          LayerName = Foreground
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          mmMinHeight = 0
          object ppTableCell31: TppTableCell
            DesignLayer = ppDesignLayer1
            UserName = 'TableCell31'
            Border.BorderPositions = [bpLeft, bpTop, bpRight, bpBottom]
            Border.Weight = 1.000000000000000000
            Brush.Style = bsClear
            Padding = 1.057999968528748000
            Transparent = True
            mmHeight = 23548
            mmLeft = 0
            mmTop = 0
            mmWidth = 48948
            BandType = 4
            LayerName = Foreground
            mmBottomOffset = 0
            mmOverFlowOffset = 0
            mmStopPosition = 0
            mmMinHeight = 8000
            mmPadding = 1058
            object ppLabel15: TppLabel
              DesignLayer = ppDesignLayer1
              UserName = 'Label15'
              Anchors = [atLeft, atRight]
              AutoSize = False
              Caption = #1048#1085#1090#1077#1088#1077#1089#1091#1102#1097#1080#1081' '#1087#1088#1086#1076#1091#1082#1090', '#1091#1089#1083#1091#1075#1072
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 12
              Font.Style = [fsBold, fsItalic]
              Transparent = True
              mmHeight = 5027
              mmLeft = 3175
              mmTop = 113506
              mmWidth = 69054
              BandType = 4
              LayerName = Foreground
            end
          end
          object ppTableCell32: TppTableCell
            DesignLayer = ppDesignLayer1
            UserName = 'TableCell32'
            Border.BorderPositions = [bpLeft, bpTop, bpRight, bpBottom]
            Border.Weight = 1.000000000000000000
            Brush.Style = bsClear
            Padding = 1.057999968528748000
            Transparent = True
            mmHeight = 23548
            mmLeft = 0
            mmTop = 0
            mmWidth = 48948
            BandType = 4
            LayerName = Foreground
            mmBottomOffset = 0
            mmOverFlowOffset = 0
            mmStopPosition = 0
            mmMinHeight = 8000
            mmPadding = 1058
            object ppDBText13: TppDBText
              DesignLayer = ppDesignLayer1
              UserName = 'DBText13'
              Anchors = [atLeft, atRight]
              DataField = 'mat_name'
              DataPipeline = ppDBPipeline1
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 12
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppDBPipeline1'
              mmHeight = 4498
              mmLeft = 74345
              mmTop = 113771
              mmWidth = 115362
              BandType = 4
              LayerName = Foreground
            end
          end
        end
        object ppTableRow17: TppTableRow
          DesignLayer = ppDesignLayer1
          UserName = 'TableRow17'
          mmHeight = 8000
          mmLeft = 0
          mmTop = 0
          mmWidth = 48948
          BandType = 4
          LayerName = Foreground
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          mmMinHeight = 0
          object ppTableCell33: TppTableCell
            DesignLayer = ppDesignLayer1
            UserName = 'TableCell33'
            Border.BorderPositions = [bpLeft, bpTop, bpRight, bpBottom]
            Border.Weight = 1.000000000000000000
            Brush.Style = bsClear
            Padding = 1.057999968528748000
            Transparent = True
            mmHeight = 23548
            mmLeft = 0
            mmTop = 0
            mmWidth = 48948
            BandType = 4
            LayerName = Foreground
            mmBottomOffset = 0
            mmOverFlowOffset = 0
            mmStopPosition = 0
            mmMinHeight = 8000
            mmPadding = 1058
            object ppLabel16: TppLabel
              DesignLayer = ppDesignLayer1
              UserName = 'Label16'
              Anchors = [atLeft, atRight]
              AutoSize = False
              Caption = #1055#1086#1090#1088#1077#1073#1085#1086#1089#1090#1100
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 12
              Font.Style = [fsBold, fsItalic]
              Transparent = True
              mmHeight = 5027
              mmLeft = 3175
              mmTop = 121708
              mmWidth = 69054
              BandType = 4
              LayerName = Foreground
            end
          end
          object ppTableCell34: TppTableCell
            DesignLayer = ppDesignLayer1
            UserName = 'TableCell34'
            Border.BorderPositions = [bpLeft, bpTop, bpRight, bpBottom]
            Border.Weight = 1.000000000000000000
            Brush.Style = bsClear
            Padding = 1.057999968528748000
            Transparent = True
            mmHeight = 23548
            mmLeft = 0
            mmTop = 0
            mmWidth = 48948
            BandType = 4
            LayerName = Foreground
            mmBottomOffset = 0
            mmOverFlowOffset = 0
            mmStopPosition = 0
            mmMinHeight = 8000
            mmPadding = 1058
            object ppDBText12: TppDBText
              DesignLayer = ppDesignLayer1
              UserName = 'DBText12'
              Anchors = [atLeft, atRight]
              DataField = 'Requirement'
              DataPipeline = ppDBPipeline1
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 12
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppDBPipeline1'
              mmHeight = 4498
              mmLeft = 74345
              mmTop = 121709
              mmWidth = 115362
              BandType = 4
              LayerName = Foreground
            end
          end
        end
        object ppTableRow18: TppTableRow
          DesignLayer = ppDesignLayer1
          UserName = 'TableRow18'
          mmHeight = 8000
          mmLeft = 0
          mmTop = 0
          mmWidth = 48948
          BandType = 4
          LayerName = Foreground
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          mmMinHeight = 0
          object ppTableCell35: TppTableCell
            DesignLayer = ppDesignLayer1
            UserName = 'TableCell35'
            Border.BorderPositions = [bpLeft, bpTop, bpRight, bpBottom]
            Border.Weight = 1.000000000000000000
            Brush.Style = bsClear
            Padding = 1.057999968528748000
            Transparent = True
            mmHeight = 23548
            mmLeft = 0
            mmTop = 0
            mmWidth = 48948
            BandType = 4
            LayerName = Foreground
            mmBottomOffset = 0
            mmOverFlowOffset = 0
            mmStopPosition = 0
            mmMinHeight = 8000
            mmPadding = 1058
            object ppLabel17: TppLabel
              DesignLayer = ppDesignLayer1
              UserName = 'Label17'
              Anchors = [atLeft, atRight]
              AutoSize = False
              Caption = #1055#1077#1088#1080#1086#1076#1080#1095#1085#1086#1089#1090#1100' '#1074' '#1087#1086#1090#1088#1077#1073#1085#1086#1089#1090#1080
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 12
              Font.Style = [fsBold, fsItalic]
              Transparent = True
              mmHeight = 5027
              mmLeft = 3175
              mmTop = 129646
              mmWidth = 69054
              BandType = 4
              LayerName = Foreground
            end
          end
          object ppTableCell36: TppTableCell
            DesignLayer = ppDesignLayer1
            UserName = 'TableCell36'
            Border.BorderPositions = [bpLeft, bpTop, bpRight, bpBottom]
            Border.Weight = 1.000000000000000000
            Brush.Style = bsClear
            Padding = 1.057999968528748000
            Transparent = True
            mmHeight = 23548
            mmLeft = 0
            mmTop = 0
            mmWidth = 48948
            BandType = 4
            LayerName = Foreground
            mmBottomOffset = 0
            mmOverFlowOffset = 0
            mmStopPosition = 0
            mmMinHeight = 8000
            mmPadding = 1058
            object ppDBText14: TppDBText
              DesignLayer = ppDesignLayer1
              UserName = 'DBText14'
              Anchors = [atLeft, atRight]
              DataField = 'Periodic'
              DataPipeline = ppDBPipeline1
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 12
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppDBPipeline1'
              mmHeight = 4498
              mmLeft = 74345
              mmTop = 129911
              mmWidth = 115362
              BandType = 4
              LayerName = Foreground
            end
          end
        end
        object ppTableRow19: TppTableRow
          DesignLayer = ppDesignLayer1
          UserName = 'TableRow19'
          mmHeight = 8000
          mmLeft = 0
          mmTop = 0
          mmWidth = 48948
          BandType = 4
          LayerName = Foreground
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          mmMinHeight = 0
          object ppTableCell37: TppTableCell
            DesignLayer = ppDesignLayer1
            UserName = 'TableCell37'
            Border.BorderPositions = [bpLeft, bpTop, bpRight, bpBottom]
            Border.Weight = 1.000000000000000000
            Brush.Style = bsClear
            Padding = 1.057999968528748000
            Transparent = True
            mmHeight = 23548
            mmLeft = 0
            mmTop = 0
            mmWidth = 48948
            BandType = 4
            LayerName = Foreground
            mmBottomOffset = 0
            mmOverFlowOffset = 0
            mmStopPosition = 0
            mmMinHeight = 8000
            mmPadding = 1058
            object ppLabel18: TppLabel
              DesignLayer = ppDesignLayer1
              UserName = 'Label18'
              Anchors = [atLeft, atRight]
              AutoSize = False
              Caption = #1058#1080#1087' '#1087#1086#1089#1090#1072#1074#1082#1080
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 12
              Font.Style = [fsBold, fsItalic]
              Transparent = True
              mmHeight = 5027
              mmLeft = 3175
              mmTop = 137319
              mmWidth = 69054
              BandType = 4
              LayerName = Foreground
            end
          end
          object ppTableCell38: TppTableCell
            DesignLayer = ppDesignLayer1
            UserName = 'TableCell38'
            Border.BorderPositions = [bpLeft, bpTop, bpRight, bpBottom]
            Border.Weight = 1.000000000000000000
            Brush.Style = bsClear
            Padding = 1.057999968528748000
            Transparent = True
            mmHeight = 23548
            mmLeft = 0
            mmTop = 0
            mmWidth = 48948
            BandType = 4
            LayerName = Foreground
            mmBottomOffset = 0
            mmOverFlowOffset = 0
            mmStopPosition = 0
            mmMinHeight = 8000
            mmPadding = 1058
            object ppLabel30: TppLabel
              DesignLayer = ppDesignLayer1
              UserName = 'Label30'
              Anchors = [atLeft, atRight]
              AutoSize = False
              Caption = #1057#1042
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 12
              Font.Style = []
              Transparent = True
              mmHeight = 4763
              mmLeft = 74345
              mmTop = 137319
              mmWidth = 8567
              BandType = 4
              LayerName = Foreground
            end
            object ppLabel31: TppLabel
              DesignLayer = ppDesignLayer1
              UserName = 'Label301'
              Anchors = [atLeft, atRight]
              AutoSize = False
              Caption = #1046#1044
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 12
              Font.Style = []
              Transparent = True
              mmHeight = 4763
              mmLeft = 132648
              mmTop = 137319
              mmWidth = 8567
              BandType = 4
              LayerName = Foreground
            end
            object myDBCheckBox1: TmyDBCheckBox
              DesignLayer = ppDesignLayer1
              UserName = 'DBCheckBox1'
              CheckBoxColor = clBlack
              BooleanFalse = '1'
              BooleanTrue = '0'
              Anchors = [atLeft, atRight]
              DataPipeline = ppDBPipeline1
              DataField = 'SupplyType'
              DataPipelineName = 'ppDBPipeline1'
              mmHeight = 6350
              mmLeft = 87595
              mmTop = 137054
              mmWidth = 41957
              BandType = 4
              LayerName = Foreground
            end
          end
        end
        object ppTableRow20: TppTableRow
          DesignLayer = ppDesignLayer1
          UserName = 'TableRow20'
          mmHeight = 8000
          mmLeft = 0
          mmTop = 0
          mmWidth = 48948
          BandType = 4
          LayerName = Foreground
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          mmMinHeight = 0
          object ppTableCell39: TppTableCell
            DesignLayer = ppDesignLayer1
            UserName = 'TableCell39'
            Border.BorderPositions = [bpLeft, bpTop, bpRight, bpBottom]
            Border.Weight = 1.000000000000000000
            Brush.Style = bsClear
            Padding = 1.057999968528748000
            Transparent = True
            mmHeight = 23548
            mmLeft = 0
            mmTop = 0
            mmWidth = 48948
            BandType = 4
            LayerName = Foreground
            mmBottomOffset = 0
            mmOverFlowOffset = 0
            mmStopPosition = 0
            mmMinHeight = 8000
            mmPadding = 1058
            object ppLabel19: TppLabel
              DesignLayer = ppDesignLayer1
              UserName = 'Label19'
              Anchors = [atLeft, atRight]
              AutoSize = False
              Caption = #1059#1089#1083#1086#1074#1080#1103' '#1087#1086#1089#1090#1072#1074#1082#1080
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 12
              Font.Style = [fsBold, fsItalic]
              Transparent = True
              mmHeight = 5027
              mmLeft = 3175
              mmTop = 145520
              mmWidth = 69054
              BandType = 4
              LayerName = Foreground
            end
          end
          object ppTableCell40: TppTableCell
            DesignLayer = ppDesignLayer1
            UserName = 'TableCell40'
            Border.BorderPositions = [bpLeft, bpTop, bpRight, bpBottom]
            Border.Weight = 1.000000000000000000
            Brush.Style = bsClear
            Padding = 1.057999968528748000
            Transparent = True
            mmHeight = 23548
            mmLeft = 0
            mmTop = 0
            mmWidth = 48948
            BandType = 4
            LayerName = Foreground
            mmBottomOffset = 0
            mmOverFlowOffset = 0
            mmStopPosition = 0
            mmMinHeight = 8000
            mmPadding = 1058
          end
        end
        object ppTableRow21: TppTableRow
          DesignLayer = ppDesignLayer1
          UserName = 'TableRow21'
          mmHeight = 8000
          mmLeft = 0
          mmTop = 0
          mmWidth = 48948
          BandType = 4
          LayerName = Foreground
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          mmMinHeight = 0
          object ppTableCell41: TppTableCell
            DesignLayer = ppDesignLayer1
            UserName = 'TableCell41'
            Border.BorderPositions = [bpLeft, bpTop, bpRight, bpBottom]
            Border.Weight = 1.000000000000000000
            Brush.Style = bsClear
            Padding = 1.057999968528748000
            Transparent = True
            mmHeight = 23548
            mmLeft = 0
            mmTop = 0
            mmWidth = 48948
            BandType = 4
            LayerName = Foreground
            mmBottomOffset = 0
            mmOverFlowOffset = 0
            mmStopPosition = 0
            mmMinHeight = 8000
            mmPadding = 1058
            object ppLabel20: TppLabel
              DesignLayer = ppDesignLayer1
              UserName = 'Label20'
              Anchors = [atLeft, atRight]
              AutoSize = False
              Caption = #1056#1077#1079#1091#1083#1100#1090#1072#1090' '#1088#1072#1073#1086#1090#1099' '#1089' '#1082#1083#1080#1077#1085#1090#1086#1084
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 12
              Font.Style = [fsBold, fsItalic]
              Transparent = True
              mmHeight = 5027
              mmLeft = 3175
              mmTop = 153457
              mmWidth = 69054
              BandType = 4
              LayerName = Foreground
            end
          end
          object ppTableCell42: TppTableCell
            DesignLayer = ppDesignLayer1
            UserName = 'TableCell42'
            Border.BorderPositions = [bpLeft, bpTop, bpRight, bpBottom]
            Border.Weight = 1.000000000000000000
            Brush.Style = bsClear
            Padding = 1.057999968528748000
            Transparent = True
            mmHeight = 23548
            mmLeft = 0
            mmTop = 0
            mmWidth = 48948
            BandType = 4
            LayerName = Foreground
            mmBottomOffset = 0
            mmOverFlowOffset = 0
            mmStopPosition = 0
            mmMinHeight = 8000
            mmPadding = 1058
            object ppDBText15: TppDBText
              DesignLayer = ppDesignLayer1
              UserName = 'DBText15'
              Anchors = [atLeft, atRight]
              DataField = 'WorkResult'
              DataPipeline = ppDBPipeline1
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 12
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppDBPipeline1'
              mmHeight = 4498
              mmLeft = 74345
              mmTop = 153459
              mmWidth = 115362
              BandType = 4
              LayerName = Foreground
            end
          end
        end
        object ppTableRow22: TppTableRow
          DesignLayer = ppDesignLayer1
          UserName = 'TableRow22'
          mmHeight = 3000
          mmLeft = 0
          mmTop = 0
          mmWidth = 48948
          BandType = 4
          LayerName = Foreground
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          mmMinHeight = 0
          object ppTableCell43: TppTableCell
            DesignLayer = ppDesignLayer1
            UserName = 'TableCell43'
            Border.BorderPositions = [bpLeft, bpTop, bpRight, bpBottom]
            Border.Weight = 1.000000000000000000
            Brush.Style = bsClear
            Padding = 1.057999968528748000
            Transparent = True
            mmHeight = 23548
            mmLeft = 0
            mmTop = 0
            mmWidth = 48948
            BandType = 4
            LayerName = Foreground
            mmBottomOffset = 0
            mmOverFlowOffset = 0
            mmStopPosition = 0
            mmMinHeight = 3000
            mmPadding = 1058
          end
          object ppTableCell44: TppTableCell
            DesignLayer = ppDesignLayer1
            UserName = 'TableCell44'
            Border.BorderPositions = [bpLeft, bpTop, bpRight, bpBottom]
            Border.Weight = 1.000000000000000000
            Brush.Style = bsClear
            Padding = 1.057999968528748000
            Transparent = True
            mmHeight = 23548
            mmLeft = 0
            mmTop = 0
            mmWidth = 48948
            BandType = 4
            LayerName = Foreground
            mmBottomOffset = 0
            mmOverFlowOffset = 0
            mmStopPosition = 0
            mmMinHeight = 3000
            mmPadding = 1058
          end
        end
        object ppTableRow23: TppTableRow
          DesignLayer = ppDesignLayer1
          UserName = 'TableRow23'
          mmHeight = 8000
          mmLeft = 0
          mmTop = 0
          mmWidth = 48948
          BandType = 4
          LayerName = Foreground
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          mmMinHeight = 0
          object ppTableCell45: TppTableCell
            DesignLayer = ppDesignLayer1
            UserName = 'TableCell45'
            Border.BorderPositions = [bpLeft, bpTop, bpRight, bpBottom]
            Border.Weight = 1.000000000000000000
            Brush.Style = bsClear
            Padding = 1.057999968528748000
            Transparent = True
            mmHeight = 23548
            mmLeft = 0
            mmTop = 0
            mmWidth = 48948
            BandType = 4
            LayerName = Foreground
            mmBottomOffset = 0
            mmOverFlowOffset = 0
            mmStopPosition = 0
            mmMinHeight = 8000
            mmPadding = 1058
            object ppLabel21: TppLabel
              DesignLayer = ppDesignLayer1
              UserName = 'Label21'
              Anchors = [atLeft, atRight]
              AutoSize = False
              Caption = #1042#1086#1079#1088#1072#1089#1090
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 12
              Font.Style = [fsBold, fsItalic]
              Transparent = True
              mmHeight = 5027
              mmLeft = 3175
              mmTop = 164570
              mmWidth = 69054
              BandType = 4
              LayerName = Foreground
            end
          end
          object ppTableCell46: TppTableCell
            DesignLayer = ppDesignLayer1
            UserName = 'TableCell46'
            Border.BorderPositions = [bpLeft, bpTop, bpRight, bpBottom]
            Border.Weight = 1.000000000000000000
            Brush.Style = bsClear
            Padding = 1.057999968528748000
            Transparent = True
            mmHeight = 23548
            mmLeft = 0
            mmTop = 0
            mmWidth = 48948
            BandType = 4
            LayerName = Foreground
            mmBottomOffset = 0
            mmOverFlowOffset = 0
            mmStopPosition = 0
            mmMinHeight = 8000
            mmPadding = 1058
            object ppDBText16: TppDBText
              DesignLayer = ppDesignLayer1
              UserName = 'DBText16'
              Anchors = [atLeft, atRight]
              DataField = 'Age'
              DataPipeline = ppDBPipeline1
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 12
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppDBPipeline1'
              mmHeight = 4498
              mmLeft = 74345
              mmTop = 164571
              mmWidth = 115362
              BandType = 4
              LayerName = Foreground
            end
          end
        end
        object ppTableRow24: TppTableRow
          DesignLayer = ppDesignLayer1
          UserName = 'TableRow24'
          mmHeight = 8000
          mmLeft = 0
          mmTop = 0
          mmWidth = 48948
          BandType = 4
          LayerName = Foreground
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          mmMinHeight = 0
          object ppTableCell47: TppTableCell
            DesignLayer = ppDesignLayer1
            UserName = 'TableCell47'
            Border.BorderPositions = [bpLeft, bpTop, bpRight, bpBottom]
            Border.Weight = 1.000000000000000000
            Brush.Style = bsClear
            Padding = 1.057999968528748000
            Transparent = True
            mmHeight = 23548
            mmLeft = 0
            mmTop = 0
            mmWidth = 48948
            BandType = 4
            LayerName = Foreground
            mmBottomOffset = 0
            mmOverFlowOffset = 0
            mmStopPosition = 0
            mmMinHeight = 8000
            mmPadding = 1058
            object ppLabel22: TppLabel
              DesignLayer = ppDesignLayer1
              UserName = 'Label22'
              Anchors = [atLeft, atRight]
              AutoSize = False
              Caption = #1044#1086#1083#1078#1085#1086#1089#1090#1100
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 12
              Font.Style = [fsBold, fsItalic]
              Transparent = True
              mmHeight = 5028
              mmLeft = 3175
              mmTop = 172507
              mmWidth = 69054
              BandType = 4
              LayerName = Foreground
            end
          end
          object ppTableCell48: TppTableCell
            DesignLayer = ppDesignLayer1
            UserName = 'TableCell48'
            Border.BorderPositions = [bpLeft, bpTop, bpRight, bpBottom]
            Border.Weight = 1.000000000000000000
            Brush.Style = bsClear
            Padding = 1.057999968528748000
            Transparent = True
            mmHeight = 23548
            mmLeft = 0
            mmTop = 0
            mmWidth = 48948
            BandType = 4
            LayerName = Foreground
            mmBottomOffset = 0
            mmOverFlowOffset = 0
            mmStopPosition = 0
            mmMinHeight = 8000
            mmPadding = 1058
            object ppDBText17: TppDBText
              DesignLayer = ppDesignLayer1
              UserName = 'DBText17'
              Anchors = [atLeft, atRight]
              DataField = 'Role'
              DataPipeline = ppDBPipeline1
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 12
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppDBPipeline1'
              mmHeight = 4498
              mmLeft = 74345
              mmTop = 172509
              mmWidth = 115362
              BandType = 4
              LayerName = Foreground
            end
          end
        end
        object ppTableRow25: TppTableRow
          DesignLayer = ppDesignLayer1
          UserName = 'TableRow25'
          mmHeight = 8000
          mmLeft = 0
          mmTop = 0
          mmWidth = 48948
          BandType = 4
          LayerName = Foreground
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          mmMinHeight = 0
          object ppTableCell49: TppTableCell
            DesignLayer = ppDesignLayer1
            UserName = 'TableCell49'
            Border.BorderPositions = [bpLeft, bpTop, bpRight, bpBottom]
            Border.Weight = 1.000000000000000000
            Brush.Style = bsClear
            Padding = 1.057999968528748000
            Transparent = True
            mmHeight = 23548
            mmLeft = 0
            mmTop = 0
            mmWidth = 48948
            BandType = 4
            LayerName = Foreground
            mmBottomOffset = 0
            mmOverFlowOffset = 0
            mmStopPosition = 0
            mmMinHeight = 8000
            mmPadding = 1058
            object ppLabel23: TppLabel
              DesignLayer = ppDesignLayer1
              UserName = 'Label23'
              Anchors = [atLeft, atRight]
              AutoSize = False
              Caption = #1057#1090#1091#1087#1077#1085#1080' '#1082#1072#1088#1100#1077#1088#1099
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 12
              Font.Style = [fsBold, fsItalic]
              Transparent = True
              mmHeight = 5027
              mmLeft = 3175
              mmTop = 180445
              mmWidth = 69054
              BandType = 4
              LayerName = Foreground
            end
          end
          object ppTableCell50: TppTableCell
            DesignLayer = ppDesignLayer1
            UserName = 'TableCell50'
            Border.BorderPositions = [bpLeft, bpTop, bpRight, bpBottom]
            Border.Weight = 1.000000000000000000
            Brush.Style = bsClear
            Padding = 1.057999968528748000
            Transparent = True
            mmHeight = 23548
            mmLeft = 0
            mmTop = 0
            mmWidth = 48948
            BandType = 4
            LayerName = Foreground
            mmBottomOffset = 0
            mmOverFlowOffset = 0
            mmStopPosition = 0
            mmMinHeight = 8000
            mmPadding = 1058
            object ppDBText18: TppDBText
              DesignLayer = ppDesignLayer1
              UserName = 'DBText18'
              Anchors = [atLeft, atRight]
              DataField = 'Careere'
              DataPipeline = ppDBPipeline1
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 12
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppDBPipeline1'
              mmHeight = 4498
              mmLeft = 74345
              mmTop = 180446
              mmWidth = 115362
              BandType = 4
              LayerName = Foreground
            end
          end
        end
        object ppTableRow26: TppTableRow
          DesignLayer = ppDesignLayer1
          UserName = 'TableRow26'
          mmHeight = 8000
          mmLeft = 0
          mmTop = 0
          mmWidth = 48948
          BandType = 4
          LayerName = Foreground
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          mmMinHeight = 0
          object ppTableCell51: TppTableCell
            DesignLayer = ppDesignLayer1
            UserName = 'TableCell51'
            Border.BorderPositions = [bpLeft, bpTop, bpRight, bpBottom]
            Border.Weight = 1.000000000000000000
            Brush.Style = bsClear
            Padding = 1.057999968528748000
            Transparent = True
            mmHeight = 23548
            mmLeft = 0
            mmTop = 0
            mmWidth = 48948
            BandType = 4
            LayerName = Foreground
            mmBottomOffset = 0
            mmOverFlowOffset = 0
            mmStopPosition = 0
            mmMinHeight = 8000
            mmPadding = 1058
            object ppLabel24: TppLabel
              DesignLayer = ppDesignLayer1
              UserName = 'Label24'
              Anchors = [atLeft, atRight]
              AutoSize = False
              Caption = #1054#1075#1088#1072#1085#1080#1095#1077#1085#1080#1103
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 12
              Font.Style = [fsBold, fsItalic]
              Transparent = True
              mmHeight = 5027
              mmLeft = 3175
              mmTop = 188648
              mmWidth = 69054
              BandType = 4
              LayerName = Foreground
            end
          end
          object ppTableCell52: TppTableCell
            DesignLayer = ppDesignLayer1
            UserName = 'TableCell52'
            Border.BorderPositions = [bpLeft, bpTop, bpRight, bpBottom]
            Border.Weight = 1.000000000000000000
            Brush.Style = bsClear
            Padding = 1.057999968528748000
            Transparent = True
            mmHeight = 23548
            mmLeft = 0
            mmTop = 0
            mmWidth = 48948
            BandType = 4
            LayerName = Foreground
            mmBottomOffset = 0
            mmOverFlowOffset = 0
            mmStopPosition = 0
            mmMinHeight = 8000
            mmPadding = 1058
            object ppDBText19: TppDBText
              DesignLayer = ppDesignLayer1
              UserName = 'DBText19'
              Anchors = [atLeft, atRight]
              DataField = 'Limitations'
              DataPipeline = ppDBPipeline1
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 12
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppDBPipeline1'
              mmHeight = 4498
              mmLeft = 74345
              mmTop = 188384
              mmWidth = 115362
              BandType = 4
              LayerName = Foreground
            end
          end
        end
        object ppTableRow27: TppTableRow
          DesignLayer = ppDesignLayer1
          UserName = 'TableRow27'
          mmHeight = 8000
          mmLeft = 0
          mmTop = 0
          mmWidth = 48948
          BandType = 4
          LayerName = Foreground
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          mmMinHeight = 0
          object ppTableCell53: TppTableCell
            DesignLayer = ppDesignLayer1
            UserName = 'TableCell53'
            Border.BorderPositions = [bpLeft, bpTop, bpRight, bpBottom]
            Border.Weight = 1.000000000000000000
            Brush.Style = bsClear
            Padding = 1.057999968528748000
            Transparent = True
            mmHeight = 23548
            mmLeft = 0
            mmTop = 0
            mmWidth = 48948
            BandType = 4
            LayerName = Foreground
            mmBottomOffset = 0
            mmOverFlowOffset = 0
            mmStopPosition = 0
            mmMinHeight = 8000
            mmPadding = 1058
            object ppLabel25: TppLabel
              DesignLayer = ppDesignLayer1
              UserName = 'Label25'
              Anchors = [atLeft, atRight]
              AutoSize = False
              Caption = #1055#1086#1083#1085#1086#1084#1086#1095#1080#1103
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 12
              Font.Style = [fsBold, fsItalic]
              Transparent = True
              mmHeight = 5027
              mmLeft = 3175
              mmTop = 196321
              mmWidth = 69054
              BandType = 4
              LayerName = Foreground
            end
          end
          object ppTableCell54: TppTableCell
            DesignLayer = ppDesignLayer1
            UserName = 'TableCell54'
            Border.BorderPositions = [bpLeft, bpTop, bpRight, bpBottom]
            Border.Weight = 1.000000000000000000
            Brush.Style = bsClear
            Padding = 1.057999968528748000
            Transparent = True
            mmHeight = 23548
            mmLeft = 0
            mmTop = 0
            mmWidth = 48948
            BandType = 4
            LayerName = Foreground
            mmBottomOffset = 0
            mmOverFlowOffset = 0
            mmStopPosition = 0
            mmMinHeight = 8000
            mmPadding = 1058
            object ppDBText20: TppDBText
              DesignLayer = ppDesignLayer1
              UserName = 'DBText20'
              Anchors = [atLeft, atRight]
              DataField = 'Privelegies'
              DataPipeline = ppDBPipeline1
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 12
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppDBPipeline1'
              mmHeight = 4498
              mmLeft = 74345
              mmTop = 196587
              mmWidth = 115362
              BandType = 4
              LayerName = Foreground
            end
          end
        end
        object ppTableRow28: TppTableRow
          DesignLayer = ppDesignLayer1
          UserName = 'TableRow28'
          mmHeight = 3000
          mmLeft = 0
          mmTop = 0
          mmWidth = 48948
          BandType = 4
          LayerName = Foreground
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          mmMinHeight = 0
          object ppTableCell55: TppTableCell
            DesignLayer = ppDesignLayer1
            UserName = 'TableCell55'
            Border.BorderPositions = [bpLeft, bpTop, bpRight, bpBottom]
            Border.Weight = 1.000000000000000000
            Brush.Style = bsClear
            Padding = 1.057999968528748000
            Transparent = True
            mmHeight = 23548
            mmLeft = 0
            mmTop = 0
            mmWidth = 48948
            BandType = 4
            LayerName = Foreground
            mmBottomOffset = 0
            mmOverFlowOffset = 0
            mmStopPosition = 0
            mmMinHeight = 3000
            mmPadding = 1058
          end
          object ppTableCell56: TppTableCell
            DesignLayer = ppDesignLayer1
            UserName = 'TableCell56'
            Border.BorderPositions = [bpLeft, bpTop, bpRight, bpBottom]
            Border.Weight = 1.000000000000000000
            Brush.Style = bsClear
            Padding = 1.057999968528748000
            Transparent = True
            mmHeight = 23548
            mmLeft = 0
            mmTop = 0
            mmWidth = 48948
            BandType = 4
            LayerName = Foreground
            mmBottomOffset = 0
            mmOverFlowOffset = 0
            mmStopPosition = 0
            mmMinHeight = 3000
            mmPadding = 1058
          end
        end
        object ppTableRow29: TppTableRow
          DesignLayer = ppDesignLayer1
          UserName = 'TableRow29'
          mmHeight = 8000
          mmLeft = 0
          mmTop = 0
          mmWidth = 48948
          BandType = 4
          LayerName = Foreground
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          mmMinHeight = 0
          object ppTableCell57: TppTableCell
            DesignLayer = ppDesignLayer1
            UserName = 'TableCell57'
            Border.BorderPositions = [bpLeft, bpTop, bpRight, bpBottom]
            Border.Weight = 1.000000000000000000
            Brush.Style = bsClear
            Padding = 1.057999968528748000
            Transparent = True
            mmHeight = 23548
            mmLeft = 0
            mmTop = 0
            mmWidth = 48948
            BandType = 4
            LayerName = Foreground
            mmBottomOffset = 0
            mmOverFlowOffset = 0
            mmStopPosition = 0
            mmMinHeight = 8000
            mmPadding = 1058
            object ppLabel26: TppLabel
              DesignLayer = ppDesignLayer1
              UserName = 'Label26'
              Anchors = [atLeft, atRight]
              AutoSize = False
              Caption = #1052#1086#1073#1080#1083#1100#1085#1099#1081' '#1090#1077#1083#1077#1092#1086#1085
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 12
              Font.Style = [fsBold, fsItalic]
              Transparent = True
              mmHeight = 5027
              mmLeft = 3175
              mmTop = 207434
              mmWidth = 69054
              BandType = 4
              LayerName = Foreground
            end
          end
          object ppTableCell58: TppTableCell
            DesignLayer = ppDesignLayer1
            UserName = 'TableCell58'
            Border.BorderPositions = [bpLeft, bpTop, bpRight, bpBottom]
            Border.Weight = 1.000000000000000000
            Brush.Style = bsClear
            Padding = 1.057999968528748000
            Transparent = True
            mmHeight = 23548
            mmLeft = 0
            mmTop = 0
            mmWidth = 48948
            BandType = 4
            LayerName = Foreground
            mmBottomOffset = 0
            mmOverFlowOffset = 0
            mmStopPosition = 0
            mmMinHeight = 8000
            mmPadding = 1058
            object ppDBText21: TppDBText
              DesignLayer = ppDesignLayer1
              UserName = 'DBText21'
              Anchors = [atLeft, atRight]
              DataField = 'Phone'
              DataPipeline = ppDBPipeline1
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 12
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppDBPipeline1'
              mmHeight = 4498
              mmLeft = 74345
              mmTop = 207434
              mmWidth = 115362
              BandType = 4
              LayerName = Foreground
            end
          end
        end
        object ppTableRow30: TppTableRow
          DesignLayer = ppDesignLayer1
          UserName = 'TableRow30'
          mmHeight = 8000
          mmLeft = 0
          mmTop = 0
          mmWidth = 48948
          BandType = 4
          LayerName = Foreground
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          mmMinHeight = 0
          object ppTableCell59: TppTableCell
            DesignLayer = ppDesignLayer1
            UserName = 'TableCell59'
            Border.BorderPositions = [bpLeft, bpTop, bpRight, bpBottom]
            Border.Weight = 1.000000000000000000
            Brush.Style = bsClear
            Padding = 1.057999968528748000
            Transparent = True
            mmHeight = 23548
            mmLeft = 0
            mmTop = 0
            mmWidth = 48948
            BandType = 4
            LayerName = Foreground
            mmBottomOffset = 0
            mmOverFlowOffset = 0
            mmStopPosition = 0
            mmMinHeight = 8000
            mmPadding = 1058
            object ppLabel27: TppLabel
              DesignLayer = ppDesignLayer1
              UserName = 'Label27'
              Anchors = [atLeft, atRight]
              AutoSize = False
              Caption = #1052#1077#1085#1077#1076#1078#1077#1088
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 12
              Font.Style = [fsBold, fsItalic]
              Transparent = True
              mmHeight = 5028
              mmLeft = 3175
              mmTop = 215635
              mmWidth = 69054
              BandType = 4
              LayerName = Foreground
            end
          end
          object ppTableCell60: TppTableCell
            DesignLayer = ppDesignLayer1
            UserName = 'TableCell60'
            Border.BorderPositions = [bpLeft, bpTop, bpRight, bpBottom]
            Border.Weight = 1.000000000000000000
            Brush.Style = bsClear
            Padding = 1.057999968528748000
            Transparent = True
            mmHeight = 23548
            mmLeft = 0
            mmTop = 0
            mmWidth = 48948
            BandType = 4
            LayerName = Foreground
            mmBottomOffset = 0
            mmOverFlowOffset = 0
            mmStopPosition = 0
            mmMinHeight = 8000
            mmPadding = 1058
            object ppDBText22: TppDBText
              DesignLayer = ppDesignLayer1
              UserName = 'DBText22'
              Anchors = [atLeft, atRight]
              DataField = 'Manager'
              DataPipeline = ppDBPipeline1
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 12
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppDBPipeline1'
              mmHeight = 4498
              mmLeft = 74345
              mmTop = 215371
              mmWidth = 115362
              BandType = 4
              LayerName = Foreground
            end
          end
        end
        object ppTableRow31: TppTableRow
          DesignLayer = ppDesignLayer1
          UserName = 'TableRow31'
          mmHeight = 8000
          mmLeft = 0
          mmTop = 0
          mmWidth = 48948
          BandType = 4
          LayerName = Foreground
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          mmMinHeight = 0
          object ppTableCell61: TppTableCell
            DesignLayer = ppDesignLayer1
            UserName = 'TableCell61'
            Border.BorderPositions = [bpLeft, bpTop, bpRight, bpBottom]
            Border.Weight = 1.000000000000000000
            Brush.Style = bsClear
            Padding = 1.057999968528748000
            Transparent = True
            mmHeight = 23548
            mmLeft = 0
            mmTop = 0
            mmWidth = 48948
            BandType = 4
            LayerName = Foreground
            mmBottomOffset = 0
            mmOverFlowOffset = 0
            mmStopPosition = 0
            mmMinHeight = 8000
            mmPadding = 1058
            object ppLabel28: TppLabel
              DesignLayer = ppDesignLayer1
              UserName = 'Label28'
              Anchors = [atLeft, atRight]
              AutoSize = False
              Caption = #1060#1072#1082#1089
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 12
              Font.Style = [fsBold, fsItalic]
              Transparent = True
              mmHeight = 5027
              mmLeft = 3175
              mmTop = 223309
              mmWidth = 69054
              BandType = 4
              LayerName = Foreground
            end
          end
          object ppTableCell62: TppTableCell
            DesignLayer = ppDesignLayer1
            UserName = 'TableCell62'
            Border.BorderPositions = [bpLeft, bpTop, bpRight, bpBottom]
            Border.Weight = 1.000000000000000000
            Brush.Style = bsClear
            Padding = 1.057999968528748000
            Transparent = True
            mmHeight = 23548
            mmLeft = 0
            mmTop = 0
            mmWidth = 48948
            BandType = 4
            LayerName = Foreground
            mmBottomOffset = 0
            mmOverFlowOffset = 0
            mmStopPosition = 0
            mmMinHeight = 8000
            mmPadding = 1058
            object ppDBText23: TppDBText
              DesignLayer = ppDesignLayer1
              UserName = 'DBText23'
              Anchors = [atLeft, atRight]
              DataField = 'Fax'
              DataPipeline = ppDBPipeline1
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 12
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppDBPipeline1'
              mmHeight = 4498
              mmLeft = 74345
              mmTop = 223574
              mmWidth = 115362
              BandType = 4
              LayerName = Foreground
            end
          end
        end
        object ppTableRow32: TppTableRow
          DesignLayer = ppDesignLayer1
          UserName = 'TableRow32'
          mmHeight = 8000
          mmLeft = 0
          mmTop = 0
          mmWidth = 48948
          BandType = 4
          LayerName = Foreground
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          mmMinHeight = 0
          object ppTableCell63: TppTableCell
            DesignLayer = ppDesignLayer1
            UserName = 'TableCell63'
            Border.BorderPositions = [bpLeft, bpTop, bpRight, bpBottom]
            Border.Weight = 1.000000000000000000
            Brush.Style = bsClear
            Padding = 1.057999968528748000
            Transparent = True
            mmHeight = 23548
            mmLeft = 0
            mmTop = 0
            mmWidth = 48948
            BandType = 4
            LayerName = Foreground
            mmBottomOffset = 0
            mmOverFlowOffset = 0
            mmStopPosition = 0
            mmMinHeight = 8000
            mmPadding = 1058
          end
          object ppTableCell64: TppTableCell
            DesignLayer = ppDesignLayer1
            UserName = 'TableCell64'
            Border.BorderPositions = [bpLeft, bpTop, bpRight, bpBottom]
            Border.Weight = 1.000000000000000000
            Brush.Style = bsClear
            Padding = 1.057999968528748000
            Transparent = True
            mmHeight = 23548
            mmLeft = 0
            mmTop = 0
            mmWidth = 48948
            BandType = 4
            LayerName = Foreground
            mmBottomOffset = 0
            mmOverFlowOffset = 0
            mmStopPosition = 0
            mmMinHeight = 8000
            mmPadding = 1058
          end
        end
        object ppTableRow65: TppTableRow
          DesignLayer = ppDesignLayer1
          UserName = 'TableRow65'
          mmHeight = 3000
          mmLeft = 0
          mmTop = 0
          mmWidth = 48948
          BandType = 4
          LayerName = Foreground
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          mmMinHeight = 0
          object ppTableCell129: TppTableCell
            DesignLayer = ppDesignLayer1
            UserName = 'TableCell129'
            Border.BorderPositions = [bpLeft, bpTop, bpRight, bpBottom]
            Border.Weight = 1.000000000000000000
            Brush.Style = bsClear
            Padding = 1.057999968528748000
            Transparent = True
            mmHeight = 23548
            mmLeft = 0
            mmTop = 0
            mmWidth = 48948
            BandType = 4
            LayerName = Foreground
            mmBottomOffset = 0
            mmOverFlowOffset = 0
            mmStopPosition = 0
            mmMinHeight = 0
            mmPadding = 1058
          end
          object ppTableCell130: TppTableCell
            DesignLayer = ppDesignLayer1
            UserName = 'TableCell130'
            Border.BorderPositions = [bpLeft, bpTop, bpRight, bpBottom]
            Border.Weight = 1.000000000000000000
            Brush.Style = bsClear
            Padding = 1.057999968528748000
            Transparent = True
            mmHeight = 23548
            mmLeft = 0
            mmTop = 0
            mmWidth = 48948
            BandType = 4
            LayerName = Foreground
            mmBottomOffset = 0
            mmOverFlowOffset = 0
            mmStopPosition = 0
            mmMinHeight = 0
            mmPadding = 1058
          end
        end
        object ppTableRow66: TppTableRow
          DesignLayer = ppDesignLayer1
          UserName = 'TableRow66'
          mmHeight = 8000
          mmLeft = 0
          mmTop = 0
          mmWidth = 48948
          BandType = 4
          LayerName = Foreground
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          mmMinHeight = 0
          object ppTableCell131: TppTableCell
            DesignLayer = ppDesignLayer1
            UserName = 'TableCell131'
            Border.BorderPositions = [bpLeft, bpTop, bpRight, bpBottom]
            Border.Weight = 1.000000000000000000
            Brush.Style = bsClear
            Padding = 1.057999968528748000
            Transparent = True
            mmHeight = 23548
            mmLeft = 0
            mmTop = 0
            mmWidth = 48948
            BandType = 4
            LayerName = Foreground
            mmBottomOffset = 0
            mmOverFlowOffset = 0
            mmStopPosition = 0
            mmMinHeight = 0
            mmPadding = 1058
            object ppLabel67: TppLabel
              DesignLayer = ppDesignLayer1
              UserName = 'Label67'
              Anchors = [atLeft, atRight]
              AutoSize = False
              Caption = #1048#1089#1090#1086#1095#1085#1080#1082' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1080' '#1086' '#1085#1072#1089
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 12
              Font.Style = [fsBold, fsItalic]
              Transparent = True
              mmHeight = 5027
              mmLeft = 3175
              mmTop = 242623
              mmWidth = 69054
              BandType = 4
              LayerName = Foreground
            end
          end
          object ppTableCell132: TppTableCell
            DesignLayer = ppDesignLayer1
            UserName = 'TableCell132'
            Border.BorderPositions = [bpLeft, bpTop, bpRight, bpBottom]
            Border.Weight = 1.000000000000000000
            Brush.Style = bsClear
            Padding = 1.057999968528748000
            Transparent = True
            mmHeight = 23548
            mmLeft = 0
            mmTop = 0
            mmWidth = 48948
            BandType = 4
            LayerName = Foreground
            mmBottomOffset = 0
            mmOverFlowOffset = 0
            mmStopPosition = 0
            mmMinHeight = 0
            mmPadding = 1058
            object ppDBText53: TppDBText
              DesignLayer = ppDesignLayer1
              UserName = 'DBText53'
              Anchors = [atLeft, atRight]
              DataField = 'SourceInfo'
              DataPipeline = ppDBPipeline1
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 12
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppDBPipeline1'
              mmHeight = 4498
              mmLeft = 74345
              mmTop = 242623
              mmWidth = 115362
              BandType = 4
              LayerName = Foreground
            end
          end
        end
        object ppTableRow67: TppTableRow
          DesignLayer = ppDesignLayer1
          UserName = 'TableRow67'
          mmHeight = 8000
          mmLeft = 0
          mmTop = 0
          mmWidth = 48948
          BandType = 4
          LayerName = Foreground
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          mmMinHeight = 0
          object ppTableCell133: TppTableCell
            DesignLayer = ppDesignLayer1
            UserName = 'TableCell133'
            Border.BorderPositions = [bpLeft, bpTop, bpRight, bpBottom]
            Border.Weight = 1.000000000000000000
            Brush.Style = bsClear
            Padding = 1.057999968528748000
            Transparent = True
            mmHeight = 23548
            mmLeft = 0
            mmTop = 0
            mmWidth = 48948
            BandType = 4
            LayerName = Foreground
            mmBottomOffset = 0
            mmOverFlowOffset = 0
            mmStopPosition = 0
            mmMinHeight = 0
            mmPadding = 1058
            object ppLabel68: TppLabel
              DesignLayer = ppDesignLayer1
              UserName = 'Label68'
              Anchors = [atLeft, atRight]
              AutoSize = False
              Caption = 'E-Mail'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 12
              Font.Style = [fsBold, fsItalic]
              Transparent = True
              mmHeight = 5027
              mmLeft = 3175
              mmTop = 231246
              mmWidth = 69054
              BandType = 4
              LayerName = Foreground
            end
            object ppLabel29: TppLabel
              DesignLayer = ppDesignLayer1
              UserName = 'Label29'
              Anchors = [atLeft, atRight]
              AutoSize = False
              Caption = #1050#1091#1088#1072#1090#1086#1088' '#1082#1086#1085#1090#1088#1072#1075#1077#1085#1090#1072
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 12
              Font.Style = [fsBold, fsItalic]
              Transparent = True
              mmHeight = 5027
              mmLeft = 3175
              mmTop = 250561
              mmWidth = 69054
              BandType = 4
              LayerName = Foreground
            end
          end
          object ppTableCell134: TppTableCell
            DesignLayer = ppDesignLayer1
            UserName = 'TableCell134'
            Border.BorderPositions = [bpLeft, bpTop, bpRight, bpBottom]
            Border.Weight = 1.000000000000000000
            Brush.Style = bsClear
            Padding = 1.057999968528748000
            Transparent = True
            mmHeight = 23548
            mmLeft = 0
            mmTop = 0
            mmWidth = 48948
            BandType = 4
            LayerName = Foreground
            mmBottomOffset = 0
            mmOverFlowOffset = 0
            mmStopPosition = 0
            mmMinHeight = 0
            mmPadding = 1058
            object ppDBText54: TppDBText
              DesignLayer = ppDesignLayer1
              UserName = 'DBText54'
              Anchors = [atLeft, atRight]
              DataField = 'EMail'
              DataPipeline = ppDBPipeline1
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 12
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppDBPipeline1'
              mmHeight = 4498
              mmLeft = 74348
              mmTop = 231775
              mmWidth = 115362
              BandType = 4
              LayerName = Foreground
            end
            object ppDBText24: TppDBText
              DesignLayer = ppDesignLayer1
              UserName = 'DBText24'
              Anchors = [atLeft, atRight]
              DataField = 'ClientManager'
              DataPipeline = ppDBPipeline1
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 12
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppDBPipeline1'
              mmHeight = 4498
              mmLeft = 74345
              mmTop = 250561
              mmWidth = 115362
              BandType = 4
              LayerName = Foreground
            end
          end
        end
        object ppTableColumn1: TppTableColumn
          UserName = 'TableColumn1'
          mmWidth = 71170
        end
        object ppTableColumn2: TppTableColumn
          UserName = 'TableColumn2'
          mmWidth = 117478
        end
      end
      object ppLabel32: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label32'
        Anchors = [atLeft, atRight]
        AutoSize = False
        Caption = 'CPT'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4763
        mmLeft = 132553
        mmTop = 145266
        mmWidth = 10422
        BandType = 4
        LayerName = Foreground
      end
      object ppLabel33: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label302'
        Anchors = [atLeft, atRight]
        AutoSize = False
        Caption = 'EXW'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4763
        mmLeft = 74345
        mmTop = 145266
        mmWidth = 10952
        BandType = 4
        LayerName = Foreground
      end
      object myDBCheckBox2: TmyDBCheckBox
        DesignLayer = ppDesignLayer1
        UserName = 'DBCheckBox2'
        CheckBoxColor = clBlack
        BooleanFalse = '0'
        BooleanTrue = '1'
        Anchors = [atLeft, atRight]
        DataPipeline = ppDBPipeline1
        DataField = 'SupplyType'
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 6350
        mmLeft = 145613
        mmTop = 137051
        mmWidth = 41957
        BandType = 4
        LayerName = Foreground
      end
      object myDBCheckBox3: TmyDBCheckBox
        DesignLayer = ppDesignLayer1
        UserName = 'DBCheckBox3'
        CheckBoxColor = clBlack
        BooleanFalse = '1'
        BooleanTrue = '0'
        Anchors = [atLeft, atRight]
        DataPipeline = ppDBPipeline1
        DataField = 'SupplyCondition'
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 6350
        mmLeft = 87574
        mmTop = 144736
        mmWidth = 41957
        BandType = 4
        LayerName = Foreground
      end
      object myDBCheckBox4: TmyDBCheckBox
        DesignLayer = ppDesignLayer1
        UserName = 'DBCheckBox4'
        CheckBoxColor = clBlack
        BooleanFalse = '0'
        BooleanTrue = '1'
        Anchors = [atLeft, atRight]
        DataPipeline = ppDBPipeline1
        DataField = 'SupplyCondition'
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 6350
        mmLeft = 145518
        mmTop = 144736
        mmWidth = 41957
        BandType = 4
        LayerName = Foreground
      end
    end
    object ppPageStyle1: TppPageStyle
      Background.Brush.Style = bsClear
      EndPage = 0
      SinglePage = 0
      StartPage = 0
      mmBottomOffset = 0
      mmHeight = 284300
      mmPrintPosition = 0
    end
    object ppDesignLayers1: TppDesignLayers
      object ppDesignLayer2: TppDesignLayer
        UserName = 'PageLayer1'
        LayerType = ltPage
        Index = 0
      end
      object ppDesignLayer1: TppDesignLayer
        UserName = 'Foreground'
        LayerType = ltBanded
        Index = 1
      end
    end
    object ppParameterList1: TppParameterList
    end
  end
  object ppDBPipeline1: TppDBPipeline
    DataSource = DataSource1
    UserName = 'DBPipeline1'
    Left = 728
    Top = 288
    object ppDBPipeline1ppField1: TppField
      FieldAlias = 'Name'
      FieldName = 'Name'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object ppDBPipeline1ppField2: TppField
      FieldAlias = 'privateID'
      FieldName = 'privateID'
      FieldLength = 50
      DisplayWidth = 50
      Position = 1
    end
    object ppDBPipeline1ppField3: TppField
      FieldAlias = 'businessID'
      FieldName = 'businessID'
      FieldLength = 50
      DisplayWidth = 50
      Position = 2
    end
    object ppDBPipeline1ppField4: TppField
      FieldAlias = 'LastName'
      FieldName = 'LastName'
      FieldLength = 50
      DisplayWidth = 50
      Position = 3
    end
    object ppDBPipeline1ppField5: TppField
      FieldAlias = 'FirstName'
      FieldName = 'FirstName'
      FieldLength = 50
      DisplayWidth = 50
      Position = 4
    end
    object ppDBPipeline1ppField6: TppField
      FieldAlias = 'Surname'
      FieldName = 'Surname'
      FieldLength = 50
      DisplayWidth = 50
      Position = 5
    end
    object ppDBPipeline1ppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'clientMark'
      FieldName = 'clientMark'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 6
    end
    object ppDBPipeline1ppField8: TppField
      FieldAlias = 'Birthday'
      FieldName = 'Birthday'
      FieldLength = 50
      DisplayWidth = 50
      Position = 7
    end
    object ppDBPipeline1ppField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'Age'
      FieldName = 'Age'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 8
    end
    object ppDBPipeline1ppField10: TppField
      FieldAlias = 'Role'
      FieldName = 'Role'
      FieldLength = 50
      DisplayWidth = 50
      Position = 9
    end
    object ppDBPipeline1ppField11: TppField
      FieldAlias = 'Careere'
      FieldName = 'Careere'
      FieldLength = 50
      DisplayWidth = 50
      Position = 10
    end
    object ppDBPipeline1ppField12: TppField
      FieldAlias = 'Limitations'
      FieldName = 'Limitations'
      FieldLength = 50
      DisplayWidth = 50
      Position = 11
    end
    object ppDBPipeline1ppField13: TppField
      FieldAlias = 'Privelegies'
      FieldName = 'Privelegies'
      FieldLength = 50
      DisplayWidth = 50
      Position = 12
    end
    object ppDBPipeline1ppField14: TppField
      FieldAlias = 'Phone'
      FieldName = 'Phone'
      FieldLength = 20
      DisplayWidth = 20
      Position = 13
    end
    object ppDBPipeline1ppField15: TppField
      FieldAlias = 'Manager'
      FieldName = 'Manager'
      FieldLength = 50
      DisplayWidth = 50
      Position = 14
    end
    object ppDBPipeline1ppField16: TppField
      FieldAlias = 'Fax'
      FieldName = 'Fax'
      FieldLength = 20
      DisplayWidth = 20
      Position = 15
    end
    object ppDBPipeline1ppField17: TppField
      FieldAlias = 'EMail'
      FieldName = 'EMail'
      FieldLength = 50
      DisplayWidth = 50
      Position = 16
    end
    object ppDBPipeline1ppField18: TppField
      Alignment = taRightJustify
      FieldAlias = 'clientType'
      FieldName = 'clientType'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 17
    end
    object ppDBPipeline1ppField19: TppField
      FieldAlias = 'CallDate'
      FieldName = 'CallDate'
      FieldLength = 10
      DisplayWidth = 10
      Position = 18
    end
    object ppDBPipeline1ppField20: TppField
      FieldAlias = 'CallPurpose'
      FieldName = 'CallPurpose'
      FieldLength = 50
      DisplayWidth = 50
      Position = 19
    end
    object ppDBPipeline1ppField21: TppField
      FieldAlias = 'Requirement'
      FieldName = 'Requirement'
      FieldLength = 50
      DisplayWidth = 50
      Position = 20
    end
    object ppDBPipeline1ppField22: TppField
      FieldAlias = 'Periodic'
      FieldName = 'Periodic'
      FieldLength = 50
      DisplayWidth = 50
      Position = 21
    end
    object ppDBPipeline1ppField23: TppField
      Alignment = taRightJustify
      FieldAlias = 'SupplyType'
      FieldName = 'SupplyType'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 22
    end
    object ppDBPipeline1ppField24: TppField
      Alignment = taRightJustify
      FieldAlias = 'SupplyCondition'
      FieldName = 'SupplyCondition'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 23
    end
    object ppDBPipeline1ppField25: TppField
      FieldAlias = 'WorkResult'
      FieldName = 'WorkResult'
      FieldLength = 50
      DisplayWidth = 50
      Position = 24
    end
    object ppDBPipeline1ppField26: TppField
      FieldAlias = 'mat_name'
      FieldName = 'mat_name'
      FieldLength = 50
      DisplayWidth = 50
      Position = 25
    end
    object ppDBPipeline1ppField27: TppField
      Alignment = taRightJustify
      FieldAlias = 'ID'
      FieldName = 'ID'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 26
    end
    object ppDBPipeline1ppField28: TppField
      FieldAlias = 'Interesting'
      FieldName = 'Interesting'
      FieldLength = 50
      DisplayWidth = 50
      Position = 27
    end
    object ppDBPipeline1ppField29: TppField
      FieldAlias = 'regionName'
      FieldName = 'regionName'
      FieldLength = 50
      DisplayWidth = 50
      Position = 28
    end
    object ppDBPipeline1ppField30: TppField
      FieldAlias = 'fullFactAddress'
      FieldName = 'fullFactAddress'
      FieldLength = 134
      DisplayWidth = 134
      Position = 29
    end
    object ppDBPipeline1ppField31: TppField
      FieldAlias = 'fullRegAddress'
      FieldName = 'fullRegAddress'
      FieldLength = 134
      DisplayWidth = 134
      Position = 30
    end
    object ppDBPipeline1ppField32: TppField
      FieldAlias = 'SourceInfo'
      FieldName = 'SourceInfo'
      FieldLength = 50
      DisplayWidth = 50
      Position = 31
    end
    object ppDBPipeline1ppField33: TppField
      FieldAlias = 'ClientManager'
      FieldName = 'ClientManager'
      FieldLength = 50
      DisplayWidth = 50
      Position = 32
    end
    object ppDBPipeline1ppField34: TppField
      FieldAlias = 'AddInfo'
      FieldName = 'AddInfo'
      FieldLength = 0
      DataType = dtMemo
      DisplayWidth = 10
      Position = 33
      Searchable = False
      Sortable = False
    end
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 696
    Top = 336
  end
  object ppReport2: TppReport
    AutoStop = False
    DataPipeline = ppDBPipeline1
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.SaveDeviceSettings = False
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    Template.FileName = 'C:\Projects\Delphi\ClientBase\reports\clientReportAdditional.rtm'
    Units = utMillimeters
    ArchiveFileName = '($MyDocuments)\ReportArchive.raf'
    DeviceType = 'Screen'
    DefaultFileDeviceType = 'PDF'
    EmailSettings.ReportFormat = 'PDF'
    LanguageID = 'Default'
    OpenFile = False
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = True
    OutlineSettings.Visible = True
    ThumbnailSettings.Enabled = True
    ThumbnailSettings.Visible = True
    ThumbnailSettings.DeadSpace = 30
    PDFSettings.EmbedFontOptions = [efUseSubset]
    PDFSettings.EncryptSettings.AllowCopy = True
    PDFSettings.EncryptSettings.AllowInteract = True
    PDFSettings.EncryptSettings.AllowModify = True
    PDFSettings.EncryptSettings.AllowPrint = True
    PDFSettings.EncryptSettings.AllowExtract = True
    PDFSettings.EncryptSettings.AllowAssemble = True
    PDFSettings.EncryptSettings.AllowQualityPrint = True
    PDFSettings.EncryptSettings.Enabled = False
    PDFSettings.EncryptSettings.KeyLength = kl40Bit
    PDFSettings.EncryptSettings.EncryptionType = etRC4
    PDFSettings.FontEncoding = feAnsi
    PDFSettings.ImageCompressionLevel = 25
    RTFSettings.DefaultFont.Charset = DEFAULT_CHARSET
    RTFSettings.DefaultFont.Color = clWindowText
    RTFSettings.DefaultFont.Height = -13
    RTFSettings.DefaultFont.Name = 'Arial'
    RTFSettings.DefaultFont.Style = []
    TextFileName = '($MyDocuments)\Report.pdf'
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    XLSSettings.AppName = 'ReportBuilder'
    XLSSettings.Author = 'ReportBuilder'
    XLSSettings.Subject = 'Report'
    XLSSettings.Title = 'Report'
    XLSSettings.WorksheetName = 'Report'
    Left = 760
    Top = 328
    Version = '17.0'
    mmColumnWidth = 197300
    DataPipelineName = 'ppDBPipeline1'
    object ppHeaderBand2: TppHeaderBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 10583
      mmPrintPosition = 0
      object ppLabel34: TppLabel
        DesignLayer = ppDesignLayer4
        UserName = 'Label1'
        Caption = #1050#1072#1088#1090#1086#1095#1082#1072' '#1082#1083#1080#1077#1085#1090#1072'  '#1054#1054#1054' "'#1040#1083#1077#1082#1089#1087#1088#1086#1084'"'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 16
        Font.Style = []
        Transparent = True
        mmHeight = 6350
        mmLeft = 46567
        mmTop = 2910
        mmWidth = 93398
        BandType = 0
        LayerName = Foreground1
      end
    end
    object ppDetailBand2: TppDetailBand
      Background1.Brush.Style = bsClear
      Background2.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 263526
      mmPrintPosition = 0
      object ppTableGrid2: TppTableGrid
        DesignLayer = ppDesignLayer4
        UserName = 'TableGrid1'
        DefaultColWidth = 12.699999809265140000
        DefaultRowHeight = 8.000000000000000000
        mmHeight = 255000
        mmLeft = 2117
        mmTop = 2094
        mmWidth = 188648
        BandType = 4
        LayerName = Foreground1
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmMinHeight = 0
        mmDefaultRowHeight = 8000
        mmDefaultColWidth = 12700
        object ppTableRow33: TppTableRow
          DesignLayer = ppDesignLayer4
          UserName = 'TableRow1'
          mmHeight = 8000
          mmLeft = 0
          mmTop = 0
          mmWidth = 48948
          BandType = 4
          LayerName = Foreground1
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          mmMinHeight = 0
          object ppTableCell65: TppTableCell
            DesignLayer = ppDesignLayer4
            UserName = 'TableCell1'
            Border.BorderPositions = [bpLeft, bpTop, bpRight, bpBottom]
            Border.Weight = 1.000000000000000000
            Brush.Style = bsClear
            Padding = 1.057999968528748000
            Transparent = True
            mmHeight = 23548
            mmLeft = 0
            mmTop = 0
            mmWidth = 48948
            BandType = 4
            LayerName = Foreground1
            mmBottomOffset = 0
            mmOverFlowOffset = 0
            mmStopPosition = 0
            mmMinHeight = 8000
            mmPadding = 1058
            object ppLabel35: TppLabel
              DesignLayer = ppDesignLayer4
              UserName = 'Label2'
              Anchors = [atLeft, atRight]
              AutoSize = False
              Caption = #1060#1072#1084#1080#1083#1080#1103
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 12
              Font.Style = [fsBold, fsItalic]
              Transparent = True
              VerticalAlignment = avCenter
              mmHeight = 6350
              mmLeft = 3175
              mmTop = 3150
              mmWidth = 69054
              BandType = 4
              LayerName = Foreground1
            end
          end
          object ppTableCell66: TppTableCell
            DesignLayer = ppDesignLayer4
            UserName = 'TableCell2'
            Border.BorderPositions = [bpLeft, bpTop, bpRight, bpBottom]
            Border.Weight = 1.000000000000000000
            Brush.Style = bsClear
            Padding = 1.057999968528748000
            Transparent = True
            mmHeight = 23548
            mmLeft = 0
            mmTop = 0
            mmWidth = 48948
            BandType = 4
            LayerName = Foreground1
            mmBottomOffset = 0
            mmOverFlowOffset = 0
            mmStopPosition = 0
            mmMinHeight = 8000
            mmPadding = 1058
            object ppDBText27: TppDBText
              DesignLayer = ppDesignLayer4
              UserName = 'DBText2'
              Anchors = [atLeft, atRight]
              DataField = 'LastName'
              DataPipeline = ppDBPipeline1
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 12
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppDBPipeline1'
              mmHeight = 4498
              mmLeft = 74345
              mmTop = 3946
              mmWidth = 115362
              BandType = 4
              LayerName = Foreground1
            end
          end
        end
        object ppTableRow34: TppTableRow
          DesignLayer = ppDesignLayer4
          UserName = 'TableRow2'
          mmHeight = 8000
          mmLeft = 0
          mmTop = 0
          mmWidth = 48948
          BandType = 4
          LayerName = Foreground1
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          mmMinHeight = 0
          object ppTableCell67: TppTableCell
            DesignLayer = ppDesignLayer4
            UserName = 'TableCell3'
            Border.BorderPositions = [bpLeft, bpTop, bpRight, bpBottom]
            Border.Weight = 1.000000000000000000
            Brush.Style = bsClear
            Padding = 1.057999968528748000
            Transparent = True
            mmHeight = 23548
            mmLeft = 0
            mmTop = 0
            mmWidth = 48948
            BandType = 4
            LayerName = Foreground1
            mmBottomOffset = 0
            mmOverFlowOffset = 0
            mmStopPosition = 0
            mmMinHeight = 8000
            mmPadding = 1058
            object ppLabel36: TppLabel
              DesignLayer = ppDesignLayer4
              UserName = 'Label3'
              Anchors = [atLeft, atRight]
              AutoSize = False
              Caption = #1048#1084#1103
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 12
              Font.Style = [fsBold, fsItalic]
              Transparent = True
              VerticalAlignment = avCenter
              mmHeight = 4763
              mmLeft = 3175
              mmTop = 11617
              mmWidth = 69054
              BandType = 4
              LayerName = Foreground1
            end
          end
          object ppTableCell68: TppTableCell
            DesignLayer = ppDesignLayer4
            UserName = 'TableCell4'
            Border.BorderPositions = [bpLeft, bpTop, bpRight, bpBottom]
            Border.Weight = 1.000000000000000000
            Brush.Style = bsClear
            Padding = 1.057999968528748000
            Transparent = True
            mmHeight = 23548
            mmLeft = 0
            mmTop = 0
            mmWidth = 48948
            BandType = 4
            LayerName = Foreground1
            mmBottomOffset = 0
            mmOverFlowOffset = 0
            mmStopPosition = 0
            mmMinHeight = 8000
            mmPadding = 1058
            object ppDBText28: TppDBText
              DesignLayer = ppDesignLayer4
              UserName = 'DBText3'
              Anchors = [atLeft, atRight]
              DataField = 'FirstName'
              DataPipeline = ppDBPipeline1
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 12
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppDBPipeline1'
              mmHeight = 4498
              mmLeft = 74345
              mmTop = 11616
              mmWidth = 115362
              BandType = 4
              LayerName = Foreground1
            end
          end
        end
        object ppTableRow35: TppTableRow
          DesignLayer = ppDesignLayer4
          UserName = 'TableRow3'
          mmHeight = 8000
          mmLeft = 0
          mmTop = 0
          mmWidth = 48948
          BandType = 4
          LayerName = Foreground1
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          mmMinHeight = 0
          object ppTableCell69: TppTableCell
            DesignLayer = ppDesignLayer4
            UserName = 'TableCell5'
            Border.BorderPositions = [bpLeft, bpTop, bpRight, bpBottom]
            Border.Weight = 1.000000000000000000
            Brush.Style = bsClear
            Padding = 1.057999968528748000
            Transparent = True
            mmHeight = 23548
            mmLeft = 0
            mmTop = 0
            mmWidth = 48948
            BandType = 4
            LayerName = Foreground1
            mmBottomOffset = 0
            mmOverFlowOffset = 0
            mmStopPosition = 0
            mmMinHeight = 8000
            mmPadding = 1058
            object ppLabel37: TppLabel
              DesignLayer = ppDesignLayer4
              UserName = 'Label4'
              Anchors = [atLeft, atRight]
              AutoSize = False
              Caption = #1054#1090#1095#1077#1089#1090#1074#1086
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 12
              Font.Style = [fsBold, fsItalic]
              Transparent = True
              VerticalAlignment = avCenter
              mmHeight = 4762
              mmLeft = 3175
              mmTop = 19556
              mmWidth = 69054
              BandType = 4
              LayerName = Foreground1
            end
          end
          object ppTableCell70: TppTableCell
            DesignLayer = ppDesignLayer4
            UserName = 'TableCell6'
            Border.BorderPositions = [bpLeft, bpTop, bpRight, bpBottom]
            Border.Weight = 1.000000000000000000
            Brush.Style = bsClear
            Padding = 1.057999968528748000
            Transparent = True
            mmHeight = 23548
            mmLeft = 0
            mmTop = 0
            mmWidth = 48948
            BandType = 4
            LayerName = Foreground1
            mmBottomOffset = 0
            mmOverFlowOffset = 0
            mmStopPosition = 0
            mmMinHeight = 8000
            mmPadding = 1058
            object ppDBText29: TppDBText
              DesignLayer = ppDesignLayer4
              UserName = 'DBText4'
              Anchors = [atLeft, atRight]
              DataField = 'Surname'
              DataPipeline = ppDBPipeline1
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 12
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppDBPipeline1'
              mmHeight = 4498
              mmLeft = 74345
              mmTop = 19556
              mmWidth = 115362
              BandType = 4
              LayerName = Foreground1
            end
          end
        end
        object ppTableRow36: TppTableRow
          DesignLayer = ppDesignLayer4
          UserName = 'TableRow4'
          mmHeight = 8000
          mmLeft = 0
          mmTop = 0
          mmWidth = 48948
          BandType = 4
          LayerName = Foreground1
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          mmMinHeight = 0
          object ppTableCell71: TppTableCell
            DesignLayer = ppDesignLayer4
            UserName = 'TableCell7'
            Border.BorderPositions = [bpLeft, bpTop, bpRight, bpBottom]
            Border.Weight = 1.000000000000000000
            Brush.Style = bsClear
            Padding = 1.057999968528748000
            Transparent = True
            mmHeight = 23548
            mmLeft = 0
            mmTop = 0
            mmWidth = 48948
            BandType = 4
            LayerName = Foreground1
            mmBottomOffset = 0
            mmOverFlowOffset = 0
            mmStopPosition = 0
            mmMinHeight = 8000
            mmPadding = 1058
            object ppLabel38: TppLabel
              DesignLayer = ppDesignLayer4
              UserName = 'Label5'
              Anchors = [atLeft, atRight]
              AutoSize = False
              Caption = #1044#1072#1090#1072' '#1088#1086#1078#1076#1077#1085#1080#1103
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 12
              Font.Style = [fsBold, fsItalic]
              Transparent = True
              mmHeight = 4763
              mmLeft = 3175
              mmTop = 27515
              mmWidth = 69054
              BandType = 4
              LayerName = Foreground1
            end
          end
          object ppTableCell72: TppTableCell
            DesignLayer = ppDesignLayer4
            UserName = 'TableCell8'
            Border.BorderPositions = [bpLeft, bpTop, bpRight, bpBottom]
            Border.Weight = 1.000000000000000000
            Brush.Style = bsClear
            Padding = 1.057999968528748000
            Transparent = True
            mmHeight = 23548
            mmLeft = 0
            mmTop = 0
            mmWidth = 48948
            BandType = 4
            LayerName = Foreground1
            mmBottomOffset = 0
            mmOverFlowOffset = 0
            mmStopPosition = 0
            mmMinHeight = 8000
            mmPadding = 1058
            object ppDBText30: TppDBText
              DesignLayer = ppDesignLayer4
              UserName = 'DBText1'
              Anchors = [atLeft, atRight]
              DataField = 'Birthday'
              DataPipeline = ppDBPipeline1
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 12
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppDBPipeline1'
              mmHeight = 4498
              mmLeft = 74345
              mmTop = 27517
              mmWidth = 115362
              BandType = 4
              LayerName = Foreground1
            end
          end
        end
        object ppTableRow37: TppTableRow
          DesignLayer = ppDesignLayer4
          UserName = 'TableRow5'
          mmHeight = 3000
          mmLeft = 0
          mmTop = 0
          mmWidth = 48948
          BandType = 4
          LayerName = Foreground1
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          mmMinHeight = 0
          object ppTableCell73: TppTableCell
            DesignLayer = ppDesignLayer4
            UserName = 'TableCell9'
            Border.BorderPositions = [bpLeft, bpTop, bpRight, bpBottom]
            Border.Weight = 1.000000000000000000
            Brush.Style = bsClear
            Padding = 1.057999968528748000
            Transparent = True
            mmHeight = 23548
            mmLeft = 0
            mmTop = 0
            mmWidth = 48948
            BandType = 4
            LayerName = Foreground1
            mmBottomOffset = 0
            mmOverFlowOffset = 0
            mmStopPosition = 0
            mmMinHeight = 3000
            mmPadding = 1058
          end
          object ppTableCell74: TppTableCell
            DesignLayer = ppDesignLayer4
            UserName = 'TableCell10'
            Border.BorderPositions = [bpLeft, bpTop, bpRight, bpBottom]
            Border.Weight = 1.000000000000000000
            Brush.Style = bsClear
            Padding = 1.057999968528748000
            Transparent = True
            mmHeight = 23548
            mmLeft = 0
            mmTop = 0
            mmWidth = 48948
            BandType = 4
            LayerName = Foreground1
            mmBottomOffset = 0
            mmOverFlowOffset = 0
            mmStopPosition = 0
            mmMinHeight = 3000
            mmPadding = 1058
          end
        end
        object ppTableRow38: TppTableRow
          DesignLayer = ppDesignLayer4
          UserName = 'TableRow6'
          mmHeight = 8000
          mmLeft = 0
          mmTop = 0
          mmWidth = 48948
          BandType = 4
          LayerName = Foreground1
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          mmMinHeight = 0
          object ppTableCell75: TppTableCell
            DesignLayer = ppDesignLayer4
            UserName = 'TableCell11'
            Border.BorderPositions = [bpLeft, bpTop, bpRight, bpBottom]
            Border.Weight = 1.000000000000000000
            Brush.Style = bsClear
            Padding = 1.057999968528748000
            Transparent = True
            mmHeight = 23548
            mmLeft = 0
            mmTop = 0
            mmWidth = 48948
            BandType = 4
            LayerName = Foreground1
            mmBottomOffset = 0
            mmOverFlowOffset = 0
            mmStopPosition = 0
            mmMinHeight = 8000
            mmPadding = 1058
            object ppLabel39: TppLabel
              DesignLayer = ppDesignLayer4
              UserName = 'Label6'
              Anchors = [atLeft, atRight]
              AutoSize = False
              Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 12
              Font.Style = [fsBold, fsItalic]
              Transparent = True
              mmHeight = 4763
              mmLeft = 3175
              mmTop = 38628
              mmWidth = 69054
              BandType = 4
              LayerName = Foreground1
            end
          end
          object ppTableCell76: TppTableCell
            DesignLayer = ppDesignLayer4
            UserName = 'TableCell12'
            Border.BorderPositions = [bpLeft, bpTop, bpRight, bpBottom]
            Border.Weight = 1.000000000000000000
            Brush.Style = bsClear
            Padding = 1.057999968528748000
            Transparent = True
            mmHeight = 23548
            mmLeft = 0
            mmTop = 0
            mmWidth = 48948
            BandType = 4
            LayerName = Foreground1
            mmBottomOffset = 0
            mmOverFlowOffset = 0
            mmStopPosition = 0
            mmMinHeight = 8000
            mmPadding = 1058
            object ppDBText31: TppDBText
              DesignLayer = ppDesignLayer4
              UserName = 'DBText5'
              Anchors = [atLeft, atRight]
              DataField = 'Name'
              DataPipeline = ppDBPipeline1
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 12
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppDBPipeline1'
              mmHeight = 4498
              mmLeft = 74345
              mmTop = 38629
              mmWidth = 115362
              BandType = 4
              LayerName = Foreground1
            end
          end
        end
        object ppTableRow39: TppTableRow
          DesignLayer = ppDesignLayer4
          UserName = 'TableRow7'
          mmHeight = 8000
          mmLeft = 0
          mmTop = 0
          mmWidth = 48948
          BandType = 4
          LayerName = Foreground1
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          mmMinHeight = 0
          object ppTableCell77: TppTableCell
            DesignLayer = ppDesignLayer4
            UserName = 'TableCell13'
            Border.BorderPositions = [bpLeft, bpTop, bpRight, bpBottom]
            Border.Weight = 1.000000000000000000
            Brush.Style = bsClear
            Padding = 1.057999968528748000
            Transparent = True
            mmHeight = 23548
            mmLeft = 0
            mmTop = 0
            mmWidth = 48948
            BandType = 4
            LayerName = Foreground1
            mmBottomOffset = 0
            mmOverFlowOffset = 0
            mmStopPosition = 0
            mmMinHeight = 8000
            mmPadding = 1058
            object ppLabel40: TppLabel
              DesignLayer = ppDesignLayer4
              UserName = 'Label7'
              Anchors = [atLeft, atRight]
              AutoSize = False
              Caption = #1060#1086#1088#1084#1072' '#1089#1086#1073#1089#1090#1074#1077#1085#1085#1086#1089#1090#1080
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 12
              Font.Style = [fsBold, fsItalic]
              Transparent = True
              mmHeight = 5027
              mmLeft = 3175
              mmTop = 46566
              mmWidth = 69054
              BandType = 4
              LayerName = Foreground1
            end
          end
          object ppTableCell78: TppTableCell
            DesignLayer = ppDesignLayer4
            UserName = 'TableCell14'
            Border.BorderPositions = [bpLeft, bpTop, bpRight, bpBottom]
            Border.Weight = 1.000000000000000000
            Brush.Style = bsClear
            Padding = 1.057999968528748000
            Transparent = True
            mmHeight = 23548
            mmLeft = 0
            mmTop = 0
            mmWidth = 48948
            BandType = 4
            LayerName = Foreground1
            mmBottomOffset = 0
            mmOverFlowOffset = 0
            mmStopPosition = 0
            mmMinHeight = 8000
            mmPadding = 1058
            object ppDBText32: TppDBText
              DesignLayer = ppDesignLayer4
              UserName = 'DBText6'
              Anchors = [atLeft, atRight]
              DataField = 'privateID'
              DataPipeline = ppDBPipeline1
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 12
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppDBPipeline1'
              mmHeight = 4498
              mmLeft = 74345
              mmTop = 46831
              mmWidth = 115362
              BandType = 4
              LayerName = Foreground1
            end
          end
        end
        object ppTableRow40: TppTableRow
          DesignLayer = ppDesignLayer4
          UserName = 'TableRow8'
          mmHeight = 8000
          mmLeft = 0
          mmTop = 0
          mmWidth = 48948
          BandType = 4
          LayerName = Foreground1
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          mmMinHeight = 0
          object ppTableCell79: TppTableCell
            DesignLayer = ppDesignLayer4
            UserName = 'TableCell15'
            Border.BorderPositions = [bpLeft, bpTop, bpRight, bpBottom]
            Border.Weight = 1.000000000000000000
            Brush.Style = bsClear
            Padding = 1.057999968528748000
            Transparent = True
            mmHeight = 23548
            mmLeft = 0
            mmTop = 0
            mmWidth = 48948
            BandType = 4
            LayerName = Foreground1
            mmBottomOffset = 0
            mmOverFlowOffset = 0
            mmStopPosition = 0
            mmMinHeight = 8000
            mmPadding = 1058
            object ppLabel41: TppLabel
              DesignLayer = ppDesignLayer4
              UserName = 'Label8'
              Anchors = [atLeft, atRight]
              AutoSize = False
              Caption = #1042#1080#1076' '#1076#1077#1103#1090#1077#1083#1100#1085#1086#1089#1090#1080
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 12
              Font.Style = [fsBold, fsItalic]
              Transparent = True
              mmHeight = 5028
              mmLeft = 3175
              mmTop = 54503
              mmWidth = 69054
              BandType = 4
              LayerName = Foreground1
            end
          end
          object ppTableCell80: TppTableCell
            DesignLayer = ppDesignLayer4
            UserName = 'TableCell16'
            Border.BorderPositions = [bpLeft, bpTop, bpRight, bpBottom]
            Border.Weight = 1.000000000000000000
            Brush.Style = bsClear
            Padding = 1.057999968528748000
            Transparent = True
            mmHeight = 23548
            mmLeft = 0
            mmTop = 0
            mmWidth = 48948
            BandType = 4
            LayerName = Foreground1
            mmBottomOffset = 0
            mmOverFlowOffset = 0
            mmStopPosition = 0
            mmMinHeight = 8000
            mmPadding = 1058
            object ppDBText33: TppDBText
              DesignLayer = ppDesignLayer4
              UserName = 'DBText7'
              Anchors = [atLeft, atRight]
              DataField = 'businessID'
              DataPipeline = ppDBPipeline1
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 12
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppDBPipeline1'
              mmHeight = 4498
              mmLeft = 74345
              mmTop = 54768
              mmWidth = 115362
              BandType = 4
              LayerName = Foreground1
            end
          end
        end
        object ppTableRow41: TppTableRow
          DesignLayer = ppDesignLayer4
          UserName = 'TableRow9'
          mmHeight = 8000
          mmLeft = 0
          mmTop = 0
          mmWidth = 48948
          BandType = 4
          LayerName = Foreground1
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          mmMinHeight = 0
          object ppTableCell81: TppTableCell
            DesignLayer = ppDesignLayer4
            UserName = 'TableCell17'
            Border.BorderPositions = [bpLeft, bpTop, bpRight, bpBottom]
            Border.Weight = 1.000000000000000000
            Brush.Style = bsClear
            Padding = 1.057999968528748000
            Transparent = True
            mmHeight = 23548
            mmLeft = 0
            mmTop = 0
            mmWidth = 48948
            BandType = 4
            LayerName = Foreground1
            mmBottomOffset = 0
            mmOverFlowOffset = 0
            mmStopPosition = 0
            mmMinHeight = 8000
            mmPadding = 1058
            object ppLabel42: TppLabel
              DesignLayer = ppDesignLayer4
              UserName = 'Label9'
              Anchors = [atLeft, atRight]
              AutoSize = False
              Caption = #1048#1085#1090#1077#1088#1077#1089#1099' '#1087#1088#1077#1076#1087#1088#1080#1103#1090#1080#1103
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 12
              Font.Style = [fsBold, fsItalic]
              Transparent = True
              mmHeight = 5027
              mmLeft = 3175
              mmTop = 62441
              mmWidth = 69054
              BandType = 4
              LayerName = Foreground1
            end
          end
          object ppTableCell82: TppTableCell
            DesignLayer = ppDesignLayer4
            UserName = 'TableCell18'
            Border.BorderPositions = [bpLeft, bpTop, bpRight, bpBottom]
            Border.Weight = 1.000000000000000000
            Brush.Style = bsClear
            Padding = 1.057999968528748000
            Transparent = True
            mmHeight = 23548
            mmLeft = 0
            mmTop = 0
            mmWidth = 48948
            BandType = 4
            LayerName = Foreground1
            mmBottomOffset = 0
            mmOverFlowOffset = 0
            mmStopPosition = 0
            mmMinHeight = 8000
            mmPadding = 1058
            object ppDBText34: TppDBText
              DesignLayer = ppDesignLayer4
              UserName = 'DBText8'
              Anchors = [atLeft, atRight]
              DataField = 'Interesting'
              DataPipeline = ppDBPipeline1
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 12
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppDBPipeline1'
              mmHeight = 4498
              mmLeft = 74345
              mmTop = 62707
              mmWidth = 115362
              BandType = 4
              LayerName = Foreground1
            end
          end
        end
        object ppTableRow42: TppTableRow
          DesignLayer = ppDesignLayer4
          UserName = 'TableRow10'
          mmHeight = 8000
          mmLeft = 0
          mmTop = 0
          mmWidth = 48948
          BandType = 4
          LayerName = Foreground1
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          mmMinHeight = 0
          object ppTableCell83: TppTableCell
            DesignLayer = ppDesignLayer4
            UserName = 'TableCell19'
            Border.BorderPositions = [bpLeft, bpTop, bpRight, bpBottom]
            Border.Weight = 1.000000000000000000
            Brush.Style = bsClear
            Padding = 1.057999968528748000
            Transparent = True
            mmHeight = 23548
            mmLeft = 0
            mmTop = 0
            mmWidth = 48948
            BandType = 4
            LayerName = Foreground1
            mmBottomOffset = 0
            mmOverFlowOffset = 0
            mmStopPosition = 0
            mmMinHeight = 8000
            mmPadding = 1058
            object ppLabel43: TppLabel
              DesignLayer = ppDesignLayer4
              UserName = 'Label10'
              Anchors = [atLeft, atRight]
              AutoSize = False
              Caption = #1056#1077#1075#1080#1086#1085
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 12
              Font.Style = [fsBold, fsItalic]
              Transparent = True
              mmHeight = 5027
              mmLeft = 3175
              mmTop = 70379
              mmWidth = 69054
              BandType = 4
              LayerName = Foreground1
            end
          end
          object ppTableCell84: TppTableCell
            DesignLayer = ppDesignLayer4
            UserName = 'TableCell20'
            Border.BorderPositions = [bpLeft, bpTop, bpRight, bpBottom]
            Border.Weight = 1.000000000000000000
            Brush.Style = bsClear
            Padding = 1.057999968528748000
            Transparent = True
            mmHeight = 23548
            mmLeft = 0
            mmTop = 0
            mmWidth = 48948
            BandType = 4
            LayerName = Foreground1
            mmBottomOffset = 0
            mmOverFlowOffset = 0
            mmStopPosition = 0
            mmMinHeight = 8000
            mmPadding = 1058
            object ppDBText35: TppDBText
              DesignLayer = ppDesignLayer4
              UserName = 'DBText9'
              Anchors = [atLeft, atRight]
              DataField = 'regionName'
              DataPipeline = ppDBPipeline1
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 12
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppDBPipeline1'
              mmHeight = 4498
              mmLeft = 74345
              mmTop = 70379
              mmWidth = 115362
              BandType = 4
              LayerName = Foreground1
            end
          end
        end
        object ppTableRow43: TppTableRow
          DesignLayer = ppDesignLayer4
          UserName = 'TableRow11'
          mmHeight = 8000
          mmLeft = 0
          mmTop = 0
          mmWidth = 48948
          BandType = 4
          LayerName = Foreground1
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          mmMinHeight = 0
          object ppTableCell85: TppTableCell
            DesignLayer = ppDesignLayer4
            UserName = 'TableCell21'
            Border.BorderPositions = [bpLeft, bpTop, bpRight, bpBottom]
            Border.Weight = 1.000000000000000000
            Brush.Style = bsClear
            Padding = 1.057999968528748000
            Transparent = True
            mmHeight = 23548
            mmLeft = 0
            mmTop = 0
            mmWidth = 48948
            BandType = 4
            LayerName = Foreground1
            mmBottomOffset = 0
            mmOverFlowOffset = 0
            mmStopPosition = 0
            mmMinHeight = 8000
            mmPadding = 1058
            object ppLabel44: TppLabel
              DesignLayer = ppDesignLayer4
              UserName = 'Label11'
              Anchors = [atLeft, atRight]
              AutoSize = False
              Caption = #1070#1088#1080#1076#1080#1095#1077#1089#1082#1080#1081' '#1072#1076#1088#1077#1089
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 12
              Font.Style = [fsBold, fsItalic]
              Transparent = True
              mmHeight = 5027
              mmLeft = 3175
              mmTop = 78317
              mmWidth = 69054
              BandType = 4
              LayerName = Foreground1
            end
          end
          object ppTableCell86: TppTableCell
            DesignLayer = ppDesignLayer4
            UserName = 'TableCell22'
            Border.BorderPositions = [bpLeft, bpTop, bpRight, bpBottom]
            Border.Weight = 1.000000000000000000
            Brush.Style = bsClear
            Padding = 1.057999968528748000
            Transparent = True
            mmHeight = 23548
            mmLeft = 0
            mmTop = 0
            mmWidth = 48948
            BandType = 4
            LayerName = Foreground1
            mmBottomOffset = 0
            mmOverFlowOffset = 0
            mmStopPosition = 0
            mmMinHeight = 8000
            mmPadding = 1058
            object ppDBText36: TppDBText
              DesignLayer = ppDesignLayer4
              UserName = 'DBText25'
              Anchors = [atLeft, atRight]
              DataField = 'fullRegAddress'
              DataPipeline = ppDBPipeline1
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 12
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppDBPipeline1'
              mmHeight = 4498
              mmLeft = 74345
              mmTop = 78581
              mmWidth = 115362
              BandType = 4
              LayerName = Foreground1
            end
          end
        end
        object ppTableRow44: TppTableRow
          DesignLayer = ppDesignLayer4
          UserName = 'TableRow12'
          mmHeight = 8000
          mmLeft = 0
          mmTop = 0
          mmWidth = 48948
          BandType = 4
          LayerName = Foreground1
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          mmMinHeight = 0
          object ppTableCell87: TppTableCell
            DesignLayer = ppDesignLayer4
            UserName = 'TableCell23'
            Border.BorderPositions = [bpLeft, bpTop, bpRight, bpBottom]
            Border.Weight = 1.000000000000000000
            Brush.Style = bsClear
            Padding = 1.057999968528748000
            Transparent = True
            mmHeight = 23548
            mmLeft = 0
            mmTop = 0
            mmWidth = 48948
            BandType = 4
            LayerName = Foreground1
            mmBottomOffset = 0
            mmOverFlowOffset = 0
            mmStopPosition = 0
            mmMinHeight = 8000
            mmPadding = 1058
            object ppLabel45: TppLabel
              DesignLayer = ppDesignLayer4
              UserName = 'Label12'
              Anchors = [atLeft, atRight]
              AutoSize = False
              Caption = #1060#1072#1082#1090#1080#1095#1077#1089#1082#1080#1081' '#1072#1076#1088#1077#1089
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 12
              Font.Style = [fsBold, fsItalic]
              Transparent = True
              mmHeight = 5027
              mmLeft = 3175
              mmTop = 86519
              mmWidth = 69054
              BandType = 4
              LayerName = Foreground1
            end
          end
          object ppTableCell88: TppTableCell
            DesignLayer = ppDesignLayer4
            UserName = 'TableCell24'
            Border.BorderPositions = [bpLeft, bpTop, bpRight, bpBottom]
            Border.Weight = 1.000000000000000000
            Brush.Style = bsClear
            Padding = 1.057999968528748000
            Transparent = True
            mmHeight = 23548
            mmLeft = 0
            mmTop = 0
            mmWidth = 48948
            BandType = 4
            LayerName = Foreground1
            mmBottomOffset = 0
            mmOverFlowOffset = 0
            mmStopPosition = 0
            mmMinHeight = 8000
            mmPadding = 1058
            object ppDBText37: TppDBText
              DesignLayer = ppDesignLayer4
              UserName = 'DBText26'
              Anchors = [atLeft, atRight]
              DataField = 'fullFactAddress'
              DataPipeline = ppDBPipeline1
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 12
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppDBPipeline1'
              mmHeight = 4498
              mmLeft = 74345
              mmTop = 86796
              mmWidth = 115362
              BandType = 4
              LayerName = Foreground1
            end
          end
        end
        object ppTableRow45: TppTableRow
          DesignLayer = ppDesignLayer4
          UserName = 'TableRow13'
          mmHeight = 3000
          mmLeft = 0
          mmTop = 0
          mmWidth = 48948
          BandType = 4
          LayerName = Foreground1
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          mmMinHeight = 0
          object ppTableCell89: TppTableCell
            DesignLayer = ppDesignLayer4
            UserName = 'TableCell25'
            Border.BorderPositions = [bpLeft, bpTop, bpRight, bpBottom]
            Border.Weight = 1.000000000000000000
            Brush.Style = bsClear
            Padding = 1.057999968528748000
            Transparent = True
            mmHeight = 23548
            mmLeft = 0
            mmTop = 0
            mmWidth = 48948
            BandType = 4
            LayerName = Foreground1
            mmBottomOffset = 0
            mmOverFlowOffset = 0
            mmStopPosition = 0
            mmMinHeight = 3000
            mmPadding = 1058
          end
          object ppTableCell90: TppTableCell
            DesignLayer = ppDesignLayer4
            UserName = 'TableCell26'
            Border.BorderPositions = [bpLeft, bpTop, bpRight, bpBottom]
            Border.Weight = 1.000000000000000000
            Brush.Style = bsClear
            Padding = 1.057999968528748000
            Transparent = True
            mmHeight = 23548
            mmLeft = 0
            mmTop = 0
            mmWidth = 48948
            BandType = 4
            LayerName = Foreground1
            mmBottomOffset = 0
            mmOverFlowOffset = 0
            mmStopPosition = 0
            mmMinHeight = 3000
            mmPadding = 1058
          end
        end
        object ppTableRow46: TppTableRow
          DesignLayer = ppDesignLayer4
          UserName = 'TableRow14'
          mmHeight = 8000
          mmLeft = 0
          mmTop = 0
          mmWidth = 48948
          BandType = 4
          LayerName = Foreground1
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          mmMinHeight = 0
          object ppTableCell91: TppTableCell
            DesignLayer = ppDesignLayer4
            UserName = 'TableCell27'
            Border.BorderPositions = [bpLeft, bpTop, bpRight, bpBottom]
            Border.Weight = 1.000000000000000000
            Brush.Style = bsClear
            Padding = 1.057999968528748000
            Transparent = True
            mmHeight = 23548
            mmLeft = 0
            mmTop = 0
            mmWidth = 48948
            BandType = 4
            LayerName = Foreground1
            mmBottomOffset = 0
            mmOverFlowOffset = 0
            mmStopPosition = 0
            mmMinHeight = 8000
            mmPadding = 1058
            object ppLabel46: TppLabel
              DesignLayer = ppDesignLayer4
              UserName = 'Label13'
              Anchors = [atLeft, atRight]
              AutoSize = False
              Caption = #1044#1072#1090#1072' '#1079#1074#1086#1085#1082#1072
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 12
              Font.Style = [fsBold, fsItalic]
              Transparent = True
              mmHeight = 5028
              mmLeft = 3175
              mmTop = 97631
              mmWidth = 69054
              BandType = 4
              LayerName = Foreground1
            end
          end
          object ppTableCell92: TppTableCell
            DesignLayer = ppDesignLayer4
            UserName = 'TableCell28'
            Border.BorderPositions = [bpLeft, bpTop, bpRight, bpBottom]
            Border.Weight = 1.000000000000000000
            Brush.Style = bsClear
            Padding = 1.057999968528748000
            Transparent = True
            mmHeight = 23548
            mmLeft = 0
            mmTop = 0
            mmWidth = 48948
            BandType = 4
            LayerName = Foreground1
            mmBottomOffset = 0
            mmOverFlowOffset = 0
            mmStopPosition = 0
            mmMinHeight = 8000
            mmPadding = 1058
            object ppDBText38: TppDBText
              DesignLayer = ppDesignLayer4
              UserName = 'DBText10'
              Anchors = [atLeft, atRight]
              DataField = 'CallDate'
              DataPipeline = ppDBPipeline1
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 12
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppDBPipeline1'
              mmHeight = 4498
              mmLeft = 74345
              mmTop = 97896
              mmWidth = 115362
              BandType = 4
              LayerName = Foreground1
            end
          end
        end
        object ppTableRow47: TppTableRow
          DesignLayer = ppDesignLayer4
          UserName = 'TableRow15'
          mmHeight = 8000
          mmLeft = 0
          mmTop = 0
          mmWidth = 48948
          BandType = 4
          LayerName = Foreground1
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          mmMinHeight = 0
          object ppTableCell93: TppTableCell
            DesignLayer = ppDesignLayer4
            UserName = 'TableCell29'
            Border.BorderPositions = [bpLeft, bpTop, bpRight, bpBottom]
            Border.Weight = 1.000000000000000000
            Brush.Style = bsClear
            Padding = 1.057999968528748000
            Transparent = True
            mmHeight = 23548
            mmLeft = 0
            mmTop = 0
            mmWidth = 48948
            BandType = 4
            LayerName = Foreground1
            mmBottomOffset = 0
            mmOverFlowOffset = 0
            mmStopPosition = 0
            mmMinHeight = 8000
            mmPadding = 1058
            object ppLabel47: TppLabel
              DesignLayer = ppDesignLayer4
              UserName = 'Label14'
              Anchors = [atLeft, atRight]
              AutoSize = False
              Caption = #1062#1077#1083#1100' '#1079#1074#1086#1085#1082#1072
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 12
              Font.Style = [fsBold, fsItalic]
              Transparent = True
              mmHeight = 5027
              mmLeft = 3175
              mmTop = 105569
              mmWidth = 69054
              BandType = 4
              LayerName = Foreground1
            end
          end
          object ppTableCell94: TppTableCell
            DesignLayer = ppDesignLayer4
            UserName = 'TableCell30'
            Border.BorderPositions = [bpLeft, bpTop, bpRight, bpBottom]
            Border.Weight = 1.000000000000000000
            Brush.Style = bsClear
            Padding = 1.057999968528748000
            Transparent = True
            mmHeight = 23548
            mmLeft = 0
            mmTop = 0
            mmWidth = 48948
            BandType = 4
            LayerName = Foreground1
            mmBottomOffset = 0
            mmOverFlowOffset = 0
            mmStopPosition = 0
            mmMinHeight = 8000
            mmPadding = 1058
            object ppDBText39: TppDBText
              DesignLayer = ppDesignLayer4
              UserName = 'DBText11'
              Anchors = [atLeft, atRight]
              DataField = 'CallPurpose'
              DataPipeline = ppDBPipeline1
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 12
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppDBPipeline1'
              mmHeight = 4498
              mmLeft = 74345
              mmTop = 105569
              mmWidth = 115362
              BandType = 4
              LayerName = Foreground1
            end
          end
        end
        object ppTableRow48: TppTableRow
          DesignLayer = ppDesignLayer4
          UserName = 'TableRow16'
          mmHeight = 8000
          mmLeft = 0
          mmTop = 0
          mmWidth = 48948
          BandType = 4
          LayerName = Foreground1
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          mmMinHeight = 0
          object ppTableCell95: TppTableCell
            DesignLayer = ppDesignLayer4
            UserName = 'TableCell31'
            Border.BorderPositions = [bpLeft, bpTop, bpRight, bpBottom]
            Border.Weight = 1.000000000000000000
            Brush.Style = bsClear
            Padding = 1.057999968528748000
            Transparent = True
            mmHeight = 23548
            mmLeft = 0
            mmTop = 0
            mmWidth = 48948
            BandType = 4
            LayerName = Foreground1
            mmBottomOffset = 0
            mmOverFlowOffset = 0
            mmStopPosition = 0
            mmMinHeight = 8000
            mmPadding = 1058
            object ppLabel48: TppLabel
              DesignLayer = ppDesignLayer4
              UserName = 'Label15'
              Anchors = [atLeft, atRight]
              AutoSize = False
              Caption = #1048#1085#1090#1077#1088#1077#1089#1091#1102#1097#1080#1081' '#1087#1088#1086#1076#1091#1082#1090', '#1091#1089#1083#1091#1075#1072
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 12
              Font.Style = [fsBold, fsItalic]
              Transparent = True
              mmHeight = 5027
              mmLeft = 3175
              mmTop = 113506
              mmWidth = 69054
              BandType = 4
              LayerName = Foreground1
            end
          end
          object ppTableCell96: TppTableCell
            DesignLayer = ppDesignLayer4
            UserName = 'TableCell32'
            Border.BorderPositions = [bpLeft, bpTop, bpRight, bpBottom]
            Border.Weight = 1.000000000000000000
            Brush.Style = bsClear
            Padding = 1.057999968528748000
            Transparent = True
            mmHeight = 23548
            mmLeft = 0
            mmTop = 0
            mmWidth = 48948
            BandType = 4
            LayerName = Foreground1
            mmBottomOffset = 0
            mmOverFlowOffset = 0
            mmStopPosition = 0
            mmMinHeight = 8000
            mmPadding = 1058
            object ppDBText40: TppDBText
              DesignLayer = ppDesignLayer4
              UserName = 'DBText13'
              Anchors = [atLeft, atRight]
              DataField = 'mat_name'
              DataPipeline = ppDBPipeline1
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 12
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppDBPipeline1'
              mmHeight = 4498
              mmLeft = 74345
              mmTop = 113771
              mmWidth = 115362
              BandType = 4
              LayerName = Foreground1
            end
          end
        end
        object ppTableRow49: TppTableRow
          DesignLayer = ppDesignLayer4
          UserName = 'TableRow17'
          mmHeight = 8000
          mmLeft = 0
          mmTop = 0
          mmWidth = 48948
          BandType = 4
          LayerName = Foreground1
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          mmMinHeight = 0
          object ppTableCell97: TppTableCell
            DesignLayer = ppDesignLayer4
            UserName = 'TableCell33'
            Border.BorderPositions = [bpLeft, bpTop, bpRight, bpBottom]
            Border.Weight = 1.000000000000000000
            Brush.Style = bsClear
            Padding = 1.057999968528748000
            Transparent = True
            mmHeight = 23548
            mmLeft = 0
            mmTop = 0
            mmWidth = 48948
            BandType = 4
            LayerName = Foreground1
            mmBottomOffset = 0
            mmOverFlowOffset = 0
            mmStopPosition = 0
            mmMinHeight = 8000
            mmPadding = 1058
            object ppLabel49: TppLabel
              DesignLayer = ppDesignLayer4
              UserName = 'Label16'
              Anchors = [atLeft, atRight]
              AutoSize = False
              Caption = #1055#1086#1090#1088#1077#1073#1085#1086#1089#1090#1100
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 12
              Font.Style = [fsBold, fsItalic]
              Transparent = True
              mmHeight = 5027
              mmLeft = 3175
              mmTop = 121708
              mmWidth = 69054
              BandType = 4
              LayerName = Foreground1
            end
          end
          object ppTableCell98: TppTableCell
            DesignLayer = ppDesignLayer4
            UserName = 'TableCell34'
            Border.BorderPositions = [bpLeft, bpTop, bpRight, bpBottom]
            Border.Weight = 1.000000000000000000
            Brush.Style = bsClear
            Padding = 1.057999968528748000
            Transparent = True
            mmHeight = 23548
            mmLeft = 0
            mmTop = 0
            mmWidth = 48948
            BandType = 4
            LayerName = Foreground1
            mmBottomOffset = 0
            mmOverFlowOffset = 0
            mmStopPosition = 0
            mmMinHeight = 8000
            mmPadding = 1058
            object ppDBText41: TppDBText
              DesignLayer = ppDesignLayer4
              UserName = 'DBText12'
              Anchors = [atLeft, atRight]
              DataField = 'Requirement'
              DataPipeline = ppDBPipeline1
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 12
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppDBPipeline1'
              mmHeight = 4498
              mmLeft = 74345
              mmTop = 121709
              mmWidth = 115362
              BandType = 4
              LayerName = Foreground1
            end
          end
        end
        object ppTableRow50: TppTableRow
          DesignLayer = ppDesignLayer4
          UserName = 'TableRow18'
          mmHeight = 8000
          mmLeft = 0
          mmTop = 0
          mmWidth = 48948
          BandType = 4
          LayerName = Foreground1
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          mmMinHeight = 0
          object ppTableCell99: TppTableCell
            DesignLayer = ppDesignLayer4
            UserName = 'TableCell35'
            Border.BorderPositions = [bpLeft, bpTop, bpRight, bpBottom]
            Border.Weight = 1.000000000000000000
            Brush.Style = bsClear
            Padding = 1.057999968528748000
            Transparent = True
            mmHeight = 23548
            mmLeft = 0
            mmTop = 0
            mmWidth = 48948
            BandType = 4
            LayerName = Foreground1
            mmBottomOffset = 0
            mmOverFlowOffset = 0
            mmStopPosition = 0
            mmMinHeight = 8000
            mmPadding = 1058
            object ppLabel50: TppLabel
              DesignLayer = ppDesignLayer4
              UserName = 'Label17'
              Anchors = [atLeft, atRight]
              AutoSize = False
              Caption = #1055#1077#1088#1080#1086#1076#1080#1095#1085#1086#1089#1090#1100' '#1074' '#1087#1086#1090#1088#1077#1073#1085#1086#1089#1090#1080
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 12
              Font.Style = [fsBold, fsItalic]
              Transparent = True
              mmHeight = 5027
              mmLeft = 3175
              mmTop = 129646
              mmWidth = 69054
              BandType = 4
              LayerName = Foreground1
            end
          end
          object ppTableCell100: TppTableCell
            DesignLayer = ppDesignLayer4
            UserName = 'TableCell36'
            Border.BorderPositions = [bpLeft, bpTop, bpRight, bpBottom]
            Border.Weight = 1.000000000000000000
            Brush.Style = bsClear
            Padding = 1.057999968528748000
            Transparent = True
            mmHeight = 23548
            mmLeft = 0
            mmTop = 0
            mmWidth = 48948
            BandType = 4
            LayerName = Foreground1
            mmBottomOffset = 0
            mmOverFlowOffset = 0
            mmStopPosition = 0
            mmMinHeight = 8000
            mmPadding = 1058
            object ppDBText42: TppDBText
              DesignLayer = ppDesignLayer4
              UserName = 'DBText14'
              Anchors = [atLeft, atRight]
              DataField = 'Periodic'
              DataPipeline = ppDBPipeline1
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 12
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppDBPipeline1'
              mmHeight = 4498
              mmLeft = 74345
              mmTop = 129911
              mmWidth = 115362
              BandType = 4
              LayerName = Foreground1
            end
          end
        end
        object ppTableRow51: TppTableRow
          DesignLayer = ppDesignLayer4
          UserName = 'TableRow19'
          mmHeight = 8000
          mmLeft = 0
          mmTop = 0
          mmWidth = 48948
          BandType = 4
          LayerName = Foreground1
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          mmMinHeight = 0
          object ppTableCell101: TppTableCell
            DesignLayer = ppDesignLayer4
            UserName = 'TableCell37'
            Border.BorderPositions = [bpLeft, bpTop, bpRight, bpBottom]
            Border.Weight = 1.000000000000000000
            Brush.Style = bsClear
            Padding = 1.057999968528748000
            Transparent = True
            mmHeight = 23548
            mmLeft = 0
            mmTop = 0
            mmWidth = 48948
            BandType = 4
            LayerName = Foreground1
            mmBottomOffset = 0
            mmOverFlowOffset = 0
            mmStopPosition = 0
            mmMinHeight = 8000
            mmPadding = 1058
            object ppLabel51: TppLabel
              DesignLayer = ppDesignLayer4
              UserName = 'Label18'
              Anchors = [atLeft, atRight]
              AutoSize = False
              Caption = #1058#1080#1087' '#1087#1086#1089#1090#1072#1074#1082#1080
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 12
              Font.Style = [fsBold, fsItalic]
              Transparent = True
              mmHeight = 5027
              mmLeft = 3175
              mmTop = 137319
              mmWidth = 69054
              BandType = 4
              LayerName = Foreground1
            end
          end
          object ppTableCell102: TppTableCell
            DesignLayer = ppDesignLayer4
            UserName = 'TableCell38'
            Border.BorderPositions = [bpLeft, bpTop, bpRight, bpBottom]
            Border.Weight = 1.000000000000000000
            Brush.Style = bsClear
            Padding = 1.057999968528748000
            Transparent = True
            mmHeight = 23548
            mmLeft = 0
            mmTop = 0
            mmWidth = 48948
            BandType = 4
            LayerName = Foreground1
            mmBottomOffset = 0
            mmOverFlowOffset = 0
            mmStopPosition = 0
            mmMinHeight = 8000
            mmPadding = 1058
            object ppLabel52: TppLabel
              DesignLayer = ppDesignLayer4
              UserName = 'Label30'
              Anchors = [atLeft, atRight]
              AutoSize = False
              Caption = #1057#1042
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 12
              Font.Style = []
              Transparent = True
              mmHeight = 4763
              mmLeft = 74345
              mmTop = 137319
              mmWidth = 8567
              BandType = 4
              LayerName = Foreground1
            end
            object ppLabel53: TppLabel
              DesignLayer = ppDesignLayer4
              UserName = 'Label301'
              Anchors = [atLeft, atRight]
              AutoSize = False
              Caption = #1046#1044
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 12
              Font.Style = []
              Transparent = True
              mmHeight = 4763
              mmLeft = 132648
              mmTop = 137319
              mmWidth = 8567
              BandType = 4
              LayerName = Foreground1
            end
            object myDBCheckBox5: TmyDBCheckBox
              DesignLayer = ppDesignLayer4
              UserName = 'DBCheckBox1'
              CheckBoxColor = clBlack
              BooleanFalse = '1'
              BooleanTrue = '0'
              Anchors = [atLeft, atRight]
              DataPipeline = ppDBPipeline1
              DataField = 'SupplyType'
              DataPipelineName = 'ppDBPipeline1'
              mmHeight = 6350
              mmLeft = 87595
              mmTop = 137054
              mmWidth = 41957
              BandType = 4
              LayerName = Foreground1
            end
          end
        end
        object ppTableRow52: TppTableRow
          DesignLayer = ppDesignLayer4
          UserName = 'TableRow20'
          mmHeight = 8000
          mmLeft = 0
          mmTop = 0
          mmWidth = 48948
          BandType = 4
          LayerName = Foreground1
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          mmMinHeight = 0
          object ppTableCell103: TppTableCell
            DesignLayer = ppDesignLayer4
            UserName = 'TableCell39'
            Border.BorderPositions = [bpLeft, bpTop, bpRight, bpBottom]
            Border.Weight = 1.000000000000000000
            Brush.Style = bsClear
            Padding = 1.057999968528748000
            Transparent = True
            mmHeight = 23548
            mmLeft = 0
            mmTop = 0
            mmWidth = 48948
            BandType = 4
            LayerName = Foreground1
            mmBottomOffset = 0
            mmOverFlowOffset = 0
            mmStopPosition = 0
            mmMinHeight = 8000
            mmPadding = 1058
            object ppLabel54: TppLabel
              DesignLayer = ppDesignLayer4
              UserName = 'Label19'
              Anchors = [atLeft, atRight]
              AutoSize = False
              Caption = #1059#1089#1083#1086#1074#1080#1103' '#1087#1086#1089#1090#1072#1074#1082#1080
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 12
              Font.Style = [fsBold, fsItalic]
              Transparent = True
              mmHeight = 5027
              mmLeft = 3175
              mmTop = 145520
              mmWidth = 69054
              BandType = 4
              LayerName = Foreground1
            end
          end
          object ppTableCell104: TppTableCell
            DesignLayer = ppDesignLayer4
            UserName = 'TableCell40'
            Border.BorderPositions = [bpLeft, bpTop, bpRight, bpBottom]
            Border.Weight = 1.000000000000000000
            Brush.Style = bsClear
            Padding = 1.057999968528748000
            Transparent = True
            mmHeight = 23548
            mmLeft = 0
            mmTop = 0
            mmWidth = 48948
            BandType = 4
            LayerName = Foreground1
            mmBottomOffset = 0
            mmOverFlowOffset = 0
            mmStopPosition = 0
            mmMinHeight = 8000
            mmPadding = 1058
          end
        end
        object ppTableRow53: TppTableRow
          DesignLayer = ppDesignLayer4
          UserName = 'TableRow21'
          mmHeight = 8000
          mmLeft = 0
          mmTop = 0
          mmWidth = 48948
          BandType = 4
          LayerName = Foreground1
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          mmMinHeight = 0
          object ppTableCell105: TppTableCell
            DesignLayer = ppDesignLayer4
            UserName = 'TableCell41'
            Border.BorderPositions = [bpLeft, bpTop, bpRight, bpBottom]
            Border.Weight = 1.000000000000000000
            Brush.Style = bsClear
            Padding = 1.057999968528748000
            Transparent = True
            mmHeight = 23548
            mmLeft = 0
            mmTop = 0
            mmWidth = 48948
            BandType = 4
            LayerName = Foreground1
            mmBottomOffset = 0
            mmOverFlowOffset = 0
            mmStopPosition = 0
            mmMinHeight = 8000
            mmPadding = 1058
            object ppLabel55: TppLabel
              DesignLayer = ppDesignLayer4
              UserName = 'Label20'
              Anchors = [atLeft, atRight]
              AutoSize = False
              Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 12
              Font.Style = [fsBold, fsItalic]
              Transparent = True
              mmHeight = 5027
              mmLeft = 3175
              mmTop = 153457
              mmWidth = 69054
              BandType = 4
              LayerName = Foreground1
            end
          end
          object ppTableCell106: TppTableCell
            DesignLayer = ppDesignLayer4
            UserName = 'TableCell42'
            Border.BorderPositions = [bpLeft, bpTop, bpRight, bpBottom]
            Border.Weight = 1.000000000000000000
            Brush.Style = bsClear
            Padding = 1.057999968528748000
            Transparent = True
            mmHeight = 23548
            mmLeft = 0
            mmTop = 0
            mmWidth = 48948
            BandType = 4
            LayerName = Foreground1
            mmBottomOffset = 0
            mmOverFlowOffset = 0
            mmStopPosition = 0
            mmMinHeight = 8000
            mmPadding = 1058
            object ppDBText43: TppDBText
              DesignLayer = ppDesignLayer4
              UserName = 'DBText15'
              Anchors = [atLeft, atRight]
              DataField = 'AddInfo'
              DataPipeline = ppDBPipeline1
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 12
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppDBPipeline1'
              mmHeight = 4498
              mmLeft = 74345
              mmTop = 153459
              mmWidth = 115362
              BandType = 4
              LayerName = Foreground1
            end
          end
        end
        object ppTableRow54: TppTableRow
          DesignLayer = ppDesignLayer4
          UserName = 'TableRow22'
          mmHeight = 3000
          mmLeft = 0
          mmTop = 0
          mmWidth = 48948
          BandType = 4
          LayerName = Foreground1
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          mmMinHeight = 0
          object ppTableCell107: TppTableCell
            DesignLayer = ppDesignLayer4
            UserName = 'TableCell43'
            Border.BorderPositions = [bpLeft, bpTop, bpRight, bpBottom]
            Border.Weight = 1.000000000000000000
            Brush.Style = bsClear
            Padding = 1.057999968528748000
            Transparent = True
            mmHeight = 23548
            mmLeft = 0
            mmTop = 0
            mmWidth = 48948
            BandType = 4
            LayerName = Foreground1
            mmBottomOffset = 0
            mmOverFlowOffset = 0
            mmStopPosition = 0
            mmMinHeight = 3000
            mmPadding = 1058
          end
          object ppTableCell108: TppTableCell
            DesignLayer = ppDesignLayer4
            UserName = 'TableCell44'
            Border.BorderPositions = [bpLeft, bpTop, bpRight, bpBottom]
            Border.Weight = 1.000000000000000000
            Brush.Style = bsClear
            Padding = 1.057999968528748000
            Transparent = True
            mmHeight = 23548
            mmLeft = 0
            mmTop = 0
            mmWidth = 48948
            BandType = 4
            LayerName = Foreground1
            mmBottomOffset = 0
            mmOverFlowOffset = 0
            mmStopPosition = 0
            mmMinHeight = 3000
            mmPadding = 1058
          end
        end
        object ppTableRow55: TppTableRow
          DesignLayer = ppDesignLayer4
          UserName = 'TableRow23'
          mmHeight = 8000
          mmLeft = 0
          mmTop = 0
          mmWidth = 48948
          BandType = 4
          LayerName = Foreground1
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          mmMinHeight = 0
          object ppTableCell109: TppTableCell
            DesignLayer = ppDesignLayer4
            UserName = 'TableCell45'
            Border.BorderPositions = [bpLeft, bpTop, bpRight, bpBottom]
            Border.Weight = 1.000000000000000000
            Brush.Style = bsClear
            Padding = 1.057999968528748000
            Transparent = True
            mmHeight = 23548
            mmLeft = 0
            mmTop = 0
            mmWidth = 48948
            BandType = 4
            LayerName = Foreground1
            mmBottomOffset = 0
            mmOverFlowOffset = 0
            mmStopPosition = 0
            mmMinHeight = 8000
            mmPadding = 1058
            object ppLabel56: TppLabel
              DesignLayer = ppDesignLayer4
              UserName = 'Label21'
              Anchors = [atLeft, atRight]
              AutoSize = False
              Caption = #1042#1086#1079#1088#1072#1089#1090
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 12
              Font.Style = [fsBold, fsItalic]
              Transparent = True
              mmHeight = 5027
              mmLeft = 3175
              mmTop = 164570
              mmWidth = 69054
              BandType = 4
              LayerName = Foreground1
            end
          end
          object ppTableCell110: TppTableCell
            DesignLayer = ppDesignLayer4
            UserName = 'TableCell46'
            Border.BorderPositions = [bpLeft, bpTop, bpRight, bpBottom]
            Border.Weight = 1.000000000000000000
            Brush.Style = bsClear
            Padding = 1.057999968528748000
            Transparent = True
            mmHeight = 23548
            mmLeft = 0
            mmTop = 0
            mmWidth = 48948
            BandType = 4
            LayerName = Foreground1
            mmBottomOffset = 0
            mmOverFlowOffset = 0
            mmStopPosition = 0
            mmMinHeight = 8000
            mmPadding = 1058
            object ppDBText44: TppDBText
              DesignLayer = ppDesignLayer4
              UserName = 'DBText16'
              Anchors = [atLeft, atRight]
              DataField = 'Age'
              DataPipeline = ppDBPipeline1
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 12
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppDBPipeline1'
              mmHeight = 4498
              mmLeft = 74345
              mmTop = 164571
              mmWidth = 115362
              BandType = 4
              LayerName = Foreground1
            end
          end
        end
        object ppTableRow56: TppTableRow
          DesignLayer = ppDesignLayer4
          UserName = 'TableRow24'
          mmHeight = 8000
          mmLeft = 0
          mmTop = 0
          mmWidth = 48948
          BandType = 4
          LayerName = Foreground1
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          mmMinHeight = 0
          object ppTableCell111: TppTableCell
            DesignLayer = ppDesignLayer4
            UserName = 'TableCell47'
            Border.BorderPositions = [bpLeft, bpTop, bpRight, bpBottom]
            Border.Weight = 1.000000000000000000
            Brush.Style = bsClear
            Padding = 1.057999968528748000
            Transparent = True
            mmHeight = 23548
            mmLeft = 0
            mmTop = 0
            mmWidth = 48948
            BandType = 4
            LayerName = Foreground1
            mmBottomOffset = 0
            mmOverFlowOffset = 0
            mmStopPosition = 0
            mmMinHeight = 8000
            mmPadding = 1058
            object ppLabel57: TppLabel
              DesignLayer = ppDesignLayer4
              UserName = 'Label22'
              Anchors = [atLeft, atRight]
              AutoSize = False
              Caption = #1044#1086#1083#1078#1085#1086#1089#1090#1100
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 12
              Font.Style = [fsBold, fsItalic]
              Transparent = True
              mmHeight = 5028
              mmLeft = 3175
              mmTop = 172507
              mmWidth = 69054
              BandType = 4
              LayerName = Foreground1
            end
          end
          object ppTableCell112: TppTableCell
            DesignLayer = ppDesignLayer4
            UserName = 'TableCell48'
            Border.BorderPositions = [bpLeft, bpTop, bpRight, bpBottom]
            Border.Weight = 1.000000000000000000
            Brush.Style = bsClear
            Padding = 1.057999968528748000
            Transparent = True
            mmHeight = 23548
            mmLeft = 0
            mmTop = 0
            mmWidth = 48948
            BandType = 4
            LayerName = Foreground1
            mmBottomOffset = 0
            mmOverFlowOffset = 0
            mmStopPosition = 0
            mmMinHeight = 8000
            mmPadding = 1058
            object ppDBText45: TppDBText
              DesignLayer = ppDesignLayer4
              UserName = 'DBText17'
              Anchors = [atLeft, atRight]
              DataField = 'Role'
              DataPipeline = ppDBPipeline1
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 12
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppDBPipeline1'
              mmHeight = 4498
              mmLeft = 74345
              mmTop = 172509
              mmWidth = 115362
              BandType = 4
              LayerName = Foreground1
            end
          end
        end
        object ppTableRow57: TppTableRow
          DesignLayer = ppDesignLayer4
          UserName = 'TableRow25'
          mmHeight = 8000
          mmLeft = 0
          mmTop = 0
          mmWidth = 48948
          BandType = 4
          LayerName = Foreground1
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          mmMinHeight = 0
          object ppTableCell113: TppTableCell
            DesignLayer = ppDesignLayer4
            UserName = 'TableCell49'
            Border.BorderPositions = [bpLeft, bpTop, bpRight, bpBottom]
            Border.Weight = 1.000000000000000000
            Brush.Style = bsClear
            Padding = 1.057999968528748000
            Transparent = True
            mmHeight = 23548
            mmLeft = 0
            mmTop = 0
            mmWidth = 48948
            BandType = 4
            LayerName = Foreground1
            mmBottomOffset = 0
            mmOverFlowOffset = 0
            mmStopPosition = 0
            mmMinHeight = 8000
            mmPadding = 1058
            object ppLabel58: TppLabel
              DesignLayer = ppDesignLayer4
              UserName = 'Label23'
              Anchors = [atLeft, atRight]
              AutoSize = False
              Caption = #1057#1090#1091#1087#1077#1085#1080' '#1082#1072#1088#1100#1077#1088#1099
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 12
              Font.Style = [fsBold, fsItalic]
              Transparent = True
              mmHeight = 5027
              mmLeft = 3175
              mmTop = 180445
              mmWidth = 69054
              BandType = 4
              LayerName = Foreground1
            end
          end
          object ppTableCell114: TppTableCell
            DesignLayer = ppDesignLayer4
            UserName = 'TableCell50'
            Border.BorderPositions = [bpLeft, bpTop, bpRight, bpBottom]
            Border.Weight = 1.000000000000000000
            Brush.Style = bsClear
            Padding = 1.057999968528748000
            Transparent = True
            mmHeight = 23548
            mmLeft = 0
            mmTop = 0
            mmWidth = 48948
            BandType = 4
            LayerName = Foreground1
            mmBottomOffset = 0
            mmOverFlowOffset = 0
            mmStopPosition = 0
            mmMinHeight = 8000
            mmPadding = 1058
            object ppDBText46: TppDBText
              DesignLayer = ppDesignLayer4
              UserName = 'DBText18'
              Anchors = [atLeft, atRight]
              DataField = 'Careere'
              DataPipeline = ppDBPipeline1
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 12
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppDBPipeline1'
              mmHeight = 4498
              mmLeft = 74345
              mmTop = 180446
              mmWidth = 115362
              BandType = 4
              LayerName = Foreground1
            end
          end
        end
        object ppTableRow58: TppTableRow
          DesignLayer = ppDesignLayer4
          UserName = 'TableRow26'
          mmHeight = 8000
          mmLeft = 0
          mmTop = 0
          mmWidth = 48948
          BandType = 4
          LayerName = Foreground1
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          mmMinHeight = 0
          object ppTableCell115: TppTableCell
            DesignLayer = ppDesignLayer4
            UserName = 'TableCell51'
            Border.BorderPositions = [bpLeft, bpTop, bpRight, bpBottom]
            Border.Weight = 1.000000000000000000
            Brush.Style = bsClear
            Padding = 1.057999968528748000
            Transparent = True
            mmHeight = 23548
            mmLeft = 0
            mmTop = 0
            mmWidth = 48948
            BandType = 4
            LayerName = Foreground1
            mmBottomOffset = 0
            mmOverFlowOffset = 0
            mmStopPosition = 0
            mmMinHeight = 8000
            mmPadding = 1058
            object ppLabel59: TppLabel
              DesignLayer = ppDesignLayer4
              UserName = 'Label24'
              Anchors = [atLeft, atRight]
              AutoSize = False
              Caption = #1054#1075#1088#1072#1085#1080#1095#1077#1085#1080#1103
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 12
              Font.Style = [fsBold, fsItalic]
              Transparent = True
              mmHeight = 5027
              mmLeft = 3175
              mmTop = 188648
              mmWidth = 69054
              BandType = 4
              LayerName = Foreground1
            end
          end
          object ppTableCell116: TppTableCell
            DesignLayer = ppDesignLayer4
            UserName = 'TableCell52'
            Border.BorderPositions = [bpLeft, bpTop, bpRight, bpBottom]
            Border.Weight = 1.000000000000000000
            Brush.Style = bsClear
            Padding = 1.057999968528748000
            Transparent = True
            mmHeight = 23548
            mmLeft = 0
            mmTop = 0
            mmWidth = 48948
            BandType = 4
            LayerName = Foreground1
            mmBottomOffset = 0
            mmOverFlowOffset = 0
            mmStopPosition = 0
            mmMinHeight = 8000
            mmPadding = 1058
            object ppDBText47: TppDBText
              DesignLayer = ppDesignLayer4
              UserName = 'DBText19'
              Anchors = [atLeft, atRight]
              DataField = 'Limitations'
              DataPipeline = ppDBPipeline1
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 12
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppDBPipeline1'
              mmHeight = 4498
              mmLeft = 74345
              mmTop = 188384
              mmWidth = 115362
              BandType = 4
              LayerName = Foreground1
            end
          end
        end
        object ppTableRow59: TppTableRow
          DesignLayer = ppDesignLayer4
          UserName = 'TableRow27'
          mmHeight = 8000
          mmLeft = 0
          mmTop = 0
          mmWidth = 48948
          BandType = 4
          LayerName = Foreground1
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          mmMinHeight = 0
          object ppTableCell117: TppTableCell
            DesignLayer = ppDesignLayer4
            UserName = 'TableCell53'
            Border.BorderPositions = [bpLeft, bpTop, bpRight, bpBottom]
            Border.Weight = 1.000000000000000000
            Brush.Style = bsClear
            Padding = 1.057999968528748000
            Transparent = True
            mmHeight = 23548
            mmLeft = 0
            mmTop = 0
            mmWidth = 48948
            BandType = 4
            LayerName = Foreground1
            mmBottomOffset = 0
            mmOverFlowOffset = 0
            mmStopPosition = 0
            mmMinHeight = 8000
            mmPadding = 1058
            object ppLabel60: TppLabel
              DesignLayer = ppDesignLayer4
              UserName = 'Label25'
              Anchors = [atLeft, atRight]
              AutoSize = False
              Caption = #1055#1086#1083#1085#1086#1084#1086#1095#1080#1103
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 12
              Font.Style = [fsBold, fsItalic]
              Transparent = True
              mmHeight = 5027
              mmLeft = 3175
              mmTop = 196321
              mmWidth = 69054
              BandType = 4
              LayerName = Foreground1
            end
          end
          object ppTableCell118: TppTableCell
            DesignLayer = ppDesignLayer4
            UserName = 'TableCell54'
            Border.BorderPositions = [bpLeft, bpTop, bpRight, bpBottom]
            Border.Weight = 1.000000000000000000
            Brush.Style = bsClear
            Padding = 1.057999968528748000
            Transparent = True
            mmHeight = 23548
            mmLeft = 0
            mmTop = 0
            mmWidth = 48948
            BandType = 4
            LayerName = Foreground1
            mmBottomOffset = 0
            mmOverFlowOffset = 0
            mmStopPosition = 0
            mmMinHeight = 8000
            mmPadding = 1058
            object ppDBText48: TppDBText
              DesignLayer = ppDesignLayer4
              UserName = 'DBText20'
              Anchors = [atLeft, atRight]
              DataField = 'Privelegies'
              DataPipeline = ppDBPipeline1
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 12
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppDBPipeline1'
              mmHeight = 4498
              mmLeft = 74345
              mmTop = 196587
              mmWidth = 115362
              BandType = 4
              LayerName = Foreground1
            end
          end
        end
        object ppTableRow60: TppTableRow
          DesignLayer = ppDesignLayer4
          UserName = 'TableRow28'
          mmHeight = 3000
          mmLeft = 0
          mmTop = 0
          mmWidth = 48948
          BandType = 4
          LayerName = Foreground1
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          mmMinHeight = 0
          object ppTableCell119: TppTableCell
            DesignLayer = ppDesignLayer4
            UserName = 'TableCell55'
            Border.BorderPositions = [bpLeft, bpTop, bpRight, bpBottom]
            Border.Weight = 1.000000000000000000
            Brush.Style = bsClear
            Padding = 1.057999968528748000
            Transparent = True
            mmHeight = 23548
            mmLeft = 0
            mmTop = 0
            mmWidth = 48948
            BandType = 4
            LayerName = Foreground1
            mmBottomOffset = 0
            mmOverFlowOffset = 0
            mmStopPosition = 0
            mmMinHeight = 3000
            mmPadding = 1058
          end
          object ppTableCell120: TppTableCell
            DesignLayer = ppDesignLayer4
            UserName = 'TableCell56'
            Border.BorderPositions = [bpLeft, bpTop, bpRight, bpBottom]
            Border.Weight = 1.000000000000000000
            Brush.Style = bsClear
            Padding = 1.057999968528748000
            Transparent = True
            mmHeight = 23548
            mmLeft = 0
            mmTop = 0
            mmWidth = 48948
            BandType = 4
            LayerName = Foreground1
            mmBottomOffset = 0
            mmOverFlowOffset = 0
            mmStopPosition = 0
            mmMinHeight = 3000
            mmPadding = 1058
          end
        end
        object ppTableRow61: TppTableRow
          DesignLayer = ppDesignLayer4
          UserName = 'TableRow29'
          mmHeight = 8000
          mmLeft = 0
          mmTop = 0
          mmWidth = 48948
          BandType = 4
          LayerName = Foreground1
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          mmMinHeight = 0
          object ppTableCell121: TppTableCell
            DesignLayer = ppDesignLayer4
            UserName = 'TableCell57'
            Border.BorderPositions = [bpLeft, bpTop, bpRight, bpBottom]
            Border.Weight = 1.000000000000000000
            Brush.Style = bsClear
            Padding = 1.057999968528748000
            Transparent = True
            mmHeight = 23548
            mmLeft = 0
            mmTop = 0
            mmWidth = 48948
            BandType = 4
            LayerName = Foreground1
            mmBottomOffset = 0
            mmOverFlowOffset = 0
            mmStopPosition = 0
            mmMinHeight = 8000
            mmPadding = 1058
            object ppLabel61: TppLabel
              DesignLayer = ppDesignLayer4
              UserName = 'Label26'
              Anchors = [atLeft, atRight]
              AutoSize = False
              Caption = #1052#1086#1073#1080#1083#1100#1085#1099#1081' '#1090#1077#1083#1077#1092#1086#1085
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 12
              Font.Style = [fsBold, fsItalic]
              Transparent = True
              mmHeight = 5027
              mmLeft = 3175
              mmTop = 207434
              mmWidth = 69054
              BandType = 4
              LayerName = Foreground1
            end
          end
          object ppTableCell122: TppTableCell
            DesignLayer = ppDesignLayer4
            UserName = 'TableCell58'
            Border.BorderPositions = [bpLeft, bpTop, bpRight, bpBottom]
            Border.Weight = 1.000000000000000000
            Brush.Style = bsClear
            Padding = 1.057999968528748000
            Transparent = True
            mmHeight = 23548
            mmLeft = 0
            mmTop = 0
            mmWidth = 48948
            BandType = 4
            LayerName = Foreground1
            mmBottomOffset = 0
            mmOverFlowOffset = 0
            mmStopPosition = 0
            mmMinHeight = 8000
            mmPadding = 1058
            object ppDBText49: TppDBText
              DesignLayer = ppDesignLayer4
              UserName = 'DBText21'
              Anchors = [atLeft, atRight]
              DataField = 'Phone'
              DataPipeline = ppDBPipeline1
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 12
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppDBPipeline1'
              mmHeight = 4498
              mmLeft = 74345
              mmTop = 207434
              mmWidth = 115362
              BandType = 4
              LayerName = Foreground1
            end
          end
        end
        object ppTableRow62: TppTableRow
          DesignLayer = ppDesignLayer4
          UserName = 'TableRow30'
          mmHeight = 8000
          mmLeft = 0
          mmTop = 0
          mmWidth = 48948
          BandType = 4
          LayerName = Foreground1
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          mmMinHeight = 0
          object ppTableCell123: TppTableCell
            DesignLayer = ppDesignLayer4
            UserName = 'TableCell59'
            Border.BorderPositions = [bpLeft, bpTop, bpRight, bpBottom]
            Border.Weight = 1.000000000000000000
            Brush.Style = bsClear
            Padding = 1.057999968528748000
            Transparent = True
            mmHeight = 23548
            mmLeft = 0
            mmTop = 0
            mmWidth = 48948
            BandType = 4
            LayerName = Foreground1
            mmBottomOffset = 0
            mmOverFlowOffset = 0
            mmStopPosition = 0
            mmMinHeight = 8000
            mmPadding = 1058
            object ppLabel62: TppLabel
              DesignLayer = ppDesignLayer4
              UserName = 'Label27'
              Anchors = [atLeft, atRight]
              AutoSize = False
              Caption = #1052#1077#1085#1077#1076#1078#1077#1088
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 12
              Font.Style = [fsBold, fsItalic]
              Transparent = True
              mmHeight = 5028
              mmLeft = 3175
              mmTop = 215635
              mmWidth = 69054
              BandType = 4
              LayerName = Foreground1
            end
          end
          object ppTableCell124: TppTableCell
            DesignLayer = ppDesignLayer4
            UserName = 'TableCell60'
            Border.BorderPositions = [bpLeft, bpTop, bpRight, bpBottom]
            Border.Weight = 1.000000000000000000
            Brush.Style = bsClear
            Padding = 1.057999968528748000
            Transparent = True
            mmHeight = 23548
            mmLeft = 0
            mmTop = 0
            mmWidth = 48948
            BandType = 4
            LayerName = Foreground1
            mmBottomOffset = 0
            mmOverFlowOffset = 0
            mmStopPosition = 0
            mmMinHeight = 8000
            mmPadding = 1058
            object ppDBText50: TppDBText
              DesignLayer = ppDesignLayer4
              UserName = 'DBText22'
              Anchors = [atLeft, atRight]
              DataField = 'Manager'
              DataPipeline = ppDBPipeline1
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 12
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppDBPipeline1'
              mmHeight = 4498
              mmLeft = 74345
              mmTop = 215371
              mmWidth = 115362
              BandType = 4
              LayerName = Foreground1
            end
          end
        end
        object ppTableRow63: TppTableRow
          DesignLayer = ppDesignLayer4
          UserName = 'TableRow31'
          mmHeight = 8000
          mmLeft = 0
          mmTop = 0
          mmWidth = 48948
          BandType = 4
          LayerName = Foreground1
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          mmMinHeight = 0
          object ppTableCell125: TppTableCell
            DesignLayer = ppDesignLayer4
            UserName = 'TableCell61'
            Border.BorderPositions = [bpLeft, bpTop, bpRight, bpBottom]
            Border.Weight = 1.000000000000000000
            Brush.Style = bsClear
            Padding = 1.057999968528748000
            Transparent = True
            mmHeight = 23548
            mmLeft = 0
            mmTop = 0
            mmWidth = 48948
            BandType = 4
            LayerName = Foreground1
            mmBottomOffset = 0
            mmOverFlowOffset = 0
            mmStopPosition = 0
            mmMinHeight = 8000
            mmPadding = 1058
            object ppLabel63: TppLabel
              DesignLayer = ppDesignLayer4
              UserName = 'Label28'
              Anchors = [atLeft, atRight]
              AutoSize = False
              Caption = #1060#1072#1082#1089
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 12
              Font.Style = [fsBold, fsItalic]
              Transparent = True
              mmHeight = 5027
              mmLeft = 3175
              mmTop = 223309
              mmWidth = 69054
              BandType = 4
              LayerName = Foreground1
            end
          end
          object ppTableCell126: TppTableCell
            DesignLayer = ppDesignLayer4
            UserName = 'TableCell62'
            Border.BorderPositions = [bpLeft, bpTop, bpRight, bpBottom]
            Border.Weight = 1.000000000000000000
            Brush.Style = bsClear
            Padding = 1.057999968528748000
            Transparent = True
            mmHeight = 23548
            mmLeft = 0
            mmTop = 0
            mmWidth = 48948
            BandType = 4
            LayerName = Foreground1
            mmBottomOffset = 0
            mmOverFlowOffset = 0
            mmStopPosition = 0
            mmMinHeight = 8000
            mmPadding = 1058
            object ppDBText51: TppDBText
              DesignLayer = ppDesignLayer4
              UserName = 'DBText23'
              Anchors = [atLeft, atRight]
              DataField = 'Fax'
              DataPipeline = ppDBPipeline1
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 12
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppDBPipeline1'
              mmHeight = 4498
              mmLeft = 74345
              mmTop = 223574
              mmWidth = 115362
              BandType = 4
              LayerName = Foreground1
            end
          end
        end
        object ppTableRow64: TppTableRow
          DesignLayer = ppDesignLayer4
          UserName = 'TableRow32'
          mmHeight = 8000
          mmLeft = 0
          mmTop = 0
          mmWidth = 48948
          BandType = 4
          LayerName = Foreground1
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          mmMinHeight = 0
          object ppTableCell127: TppTableCell
            DesignLayer = ppDesignLayer4
            UserName = 'TableCell63'
            Border.BorderPositions = [bpLeft, bpTop, bpRight, bpBottom]
            Border.Weight = 1.000000000000000000
            Brush.Style = bsClear
            Padding = 1.057999968528748000
            Transparent = True
            mmHeight = 23548
            mmLeft = 0
            mmTop = 0
            mmWidth = 48948
            BandType = 4
            LayerName = Foreground1
            mmBottomOffset = 0
            mmOverFlowOffset = 0
            mmStopPosition = 0
            mmMinHeight = 8000
            mmPadding = 1058
          end
          object ppTableCell128: TppTableCell
            DesignLayer = ppDesignLayer4
            UserName = 'TableCell64'
            Border.BorderPositions = [bpLeft, bpTop, bpRight, bpBottom]
            Border.Weight = 1.000000000000000000
            Brush.Style = bsClear
            Padding = 1.057999968528748000
            Transparent = True
            mmHeight = 23548
            mmLeft = 0
            mmTop = 0
            mmWidth = 48948
            BandType = 4
            LayerName = Foreground1
            mmBottomOffset = 0
            mmOverFlowOffset = 0
            mmStopPosition = 0
            mmMinHeight = 8000
            mmPadding = 1058
          end
        end
        object ppTableRow68: TppTableRow
          DesignLayer = ppDesignLayer4
          UserName = 'TableRow68'
          mmHeight = 3000
          mmLeft = 0
          mmTop = 0
          mmWidth = 48948
          BandType = 4
          LayerName = Foreground1
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          mmMinHeight = 0
          object ppTableCell135: TppTableCell
            DesignLayer = ppDesignLayer4
            UserName = 'TableCell135'
            Border.BorderPositions = [bpLeft, bpTop, bpRight, bpBottom]
            Border.Weight = 1.000000000000000000
            Brush.Style = bsClear
            Padding = 1.057999968528748000
            Transparent = True
            mmHeight = 23548
            mmLeft = 0
            mmTop = 0
            mmWidth = 48948
            BandType = 4
            LayerName = Foreground1
            mmBottomOffset = 0
            mmOverFlowOffset = 0
            mmStopPosition = 0
            mmMinHeight = 0
            mmPadding = 1058
          end
          object ppTableCell136: TppTableCell
            DesignLayer = ppDesignLayer4
            UserName = 'TableCell136'
            Border.BorderPositions = [bpLeft, bpTop, bpRight, bpBottom]
            Border.Weight = 1.000000000000000000
            Brush.Style = bsClear
            Padding = 1.057999968528748000
            Transparent = True
            mmHeight = 23548
            mmLeft = 0
            mmTop = 0
            mmWidth = 48948
            BandType = 4
            LayerName = Foreground1
            mmBottomOffset = 0
            mmOverFlowOffset = 0
            mmStopPosition = 0
            mmMinHeight = 0
            mmPadding = 1058
          end
        end
        object ppTableRow69: TppTableRow
          DesignLayer = ppDesignLayer4
          UserName = 'TableRow69'
          mmHeight = 8000
          mmLeft = 0
          mmTop = 0
          mmWidth = 48948
          BandType = 4
          LayerName = Foreground1
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          mmMinHeight = 0
          object ppTableCell137: TppTableCell
            DesignLayer = ppDesignLayer4
            UserName = 'TableCell137'
            Border.BorderPositions = [bpLeft, bpTop, bpRight, bpBottom]
            Border.Weight = 1.000000000000000000
            Brush.Style = bsClear
            Padding = 1.057999968528748000
            Transparent = True
            mmHeight = 23548
            mmLeft = 0
            mmTop = 0
            mmWidth = 48948
            BandType = 4
            LayerName = Foreground1
            mmBottomOffset = 0
            mmOverFlowOffset = 0
            mmStopPosition = 0
            mmMinHeight = 0
            mmPadding = 1058
            object ppLabel64: TppLabel
              DesignLayer = ppDesignLayer4
              UserName = 'Label29'
              Anchors = [atLeft, atRight]
              AutoSize = False
              Caption = #1048#1089#1090#1086#1095#1085#1080#1082' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1080' '#1086' '#1085#1072#1089
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 12
              Font.Style = [fsBold, fsItalic]
              Transparent = True
              mmHeight = 5027
              mmLeft = 3175
              mmTop = 242094
              mmWidth = 69054
              BandType = 4
              LayerName = Foreground1
            end
          end
          object ppTableCell138: TppTableCell
            DesignLayer = ppDesignLayer4
            UserName = 'TableCell138'
            Border.BorderPositions = [bpLeft, bpTop, bpRight, bpBottom]
            Border.Weight = 1.000000000000000000
            Brush.Style = bsClear
            Padding = 1.057999968528748000
            Transparent = True
            mmHeight = 23548
            mmLeft = 0
            mmTop = 0
            mmWidth = 48948
            BandType = 4
            LayerName = Foreground1
            mmBottomOffset = 0
            mmOverFlowOffset = 0
            mmStopPosition = 0
            mmMinHeight = 0
            mmPadding = 1058
            object ppDBText55: TppDBText
              DesignLayer = ppDesignLayer4
              UserName = 'DBText55'
              Anchors = [atLeft, atRight]
              DataField = 'SourceInfo'
              DataPipeline = ppDBPipeline1
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 12
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppDBPipeline1'
              mmHeight = 4498
              mmLeft = 74345
              mmTop = 242094
              mmWidth = 115362
              BandType = 4
              LayerName = Foreground1
            end
          end
        end
        object ppTableRow70: TppTableRow
          DesignLayer = ppDesignLayer4
          UserName = 'TableRow70'
          mmHeight = 8000
          mmLeft = 0
          mmTop = 0
          mmWidth = 48948
          BandType = 4
          LayerName = Foreground1
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          mmMinHeight = 0
          object ppTableCell139: TppTableCell
            DesignLayer = ppDesignLayer4
            UserName = 'TableCell139'
            Border.BorderPositions = [bpLeft, bpTop, bpRight, bpBottom]
            Border.Weight = 1.000000000000000000
            Brush.Style = bsClear
            Padding = 1.057999968528748000
            Transparent = True
            mmHeight = 23548
            mmLeft = 0
            mmTop = 0
            mmWidth = 48948
            BandType = 4
            LayerName = Foreground1
            mmBottomOffset = 0
            mmOverFlowOffset = 0
            mmStopPosition = 0
            mmMinHeight = 0
            mmPadding = 1058
            object ppLabel70: TppLabel
              DesignLayer = ppDesignLayer4
              UserName = 'Label70'
              Anchors = [atLeft, atRight]
              AutoSize = False
              Caption = 'E-Mail'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 12
              Font.Style = [fsBold, fsItalic]
              Transparent = True
              mmHeight = 5027
              mmLeft = 3175
              mmTop = 231246
              mmWidth = 69054
              BandType = 4
              LayerName = Foreground1
            end
            object ppLabel69: TppLabel
              DesignLayer = ppDesignLayer4
              UserName = 'Label69'
              Anchors = [atLeft, atRight]
              AutoSize = False
              Caption = #1050#1091#1088#1072#1090#1086#1088' '#1082#1086#1085#1090#1088#1072#1075#1077#1085#1090#1072
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 12
              Font.Style = [fsBold, fsItalic]
              Transparent = True
              mmHeight = 5027
              mmLeft = 3175
              mmTop = 250561
              mmWidth = 69054
              BandType = 4
              LayerName = Foreground1
            end
          end
          object ppTableCell140: TppTableCell
            DesignLayer = ppDesignLayer4
            UserName = 'TableCell140'
            Border.BorderPositions = [bpLeft, bpTop, bpRight, bpBottom]
            Border.Weight = 1.000000000000000000
            Brush.Style = bsClear
            Padding = 1.057999968528748000
            Transparent = True
            mmHeight = 23548
            mmLeft = 0
            mmTop = 0
            mmWidth = 48948
            BandType = 4
            LayerName = Foreground1
            mmBottomOffset = 0
            mmOverFlowOffset = 0
            mmStopPosition = 0
            mmMinHeight = 0
            mmPadding = 1058
            object ppDBText56: TppDBText
              DesignLayer = ppDesignLayer4
              UserName = 'DBText56'
              Anchors = [atLeft, atRight]
              DataField = 'EMail'
              DataPipeline = ppDBPipeline1
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 12
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppDBPipeline1'
              mmHeight = 4498
              mmLeft = 74348
              mmTop = 231775
              mmWidth = 115362
              BandType = 4
              LayerName = Foreground1
            end
            object ppDBText52: TppDBText
              DesignLayer = ppDesignLayer4
              UserName = 'DBText24'
              Anchors = [atLeft, atRight]
              DataField = 'ClientManager'
              DataPipeline = ppDBPipeline1
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 12
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppDBPipeline1'
              mmHeight = 4498
              mmLeft = 74345
              mmTop = 251090
              mmWidth = 115362
              BandType = 4
              LayerName = Foreground1
            end
          end
        end
        object ppTableColumn3: TppTableColumn
          UserName = 'TableColumn3'
          mmWidth = 71170
        end
        object ppTableColumn4: TppTableColumn
          UserName = 'TableColumn4'
          mmWidth = 117478
        end
      end
      object myDBCheckBox8: TmyDBCheckBox
        DesignLayer = ppDesignLayer4
        UserName = 'DBCheckBox4'
        CheckBoxColor = clBlack
        BooleanFalse = '0'
        BooleanTrue = '1'
        Anchors = [atLeft, atRight]
        DataPipeline = ppDBPipeline1
        DataField = 'SupplyCondition'
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 6350
        mmLeft = 145518
        mmTop = 144736
        mmWidth = 41957
        BandType = 4
        LayerName = Foreground1
      end
      object myDBCheckBox7: TmyDBCheckBox
        DesignLayer = ppDesignLayer4
        UserName = 'DBCheckBox3'
        CheckBoxColor = clBlack
        BooleanFalse = '1'
        BooleanTrue = '0'
        Anchors = [atLeft, atRight]
        DataPipeline = ppDBPipeline1
        DataField = 'SupplyCondition'
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 6350
        mmLeft = 87574
        mmTop = 144736
        mmWidth = 41957
        BandType = 4
        LayerName = Foreground1
      end
      object myDBCheckBox6: TmyDBCheckBox
        DesignLayer = ppDesignLayer4
        UserName = 'DBCheckBox2'
        CheckBoxColor = clBlack
        BooleanFalse = '0'
        BooleanTrue = '1'
        Anchors = [atLeft, atRight]
        DataPipeline = ppDBPipeline1
        DataField = 'SupplyType'
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 6350
        mmLeft = 145613
        mmTop = 137051
        mmWidth = 41957
        BandType = 4
        LayerName = Foreground1
      end
      object ppLabel66: TppLabel
        DesignLayer = ppDesignLayer4
        UserName = 'Label302'
        Anchors = [atLeft, atRight]
        AutoSize = False
        Caption = 'EXW'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4763
        mmLeft = 74345
        mmTop = 145266
        mmWidth = 10952
        BandType = 4
        LayerName = Foreground1
      end
      object ppLabel65: TppLabel
        DesignLayer = ppDesignLayer4
        UserName = 'Label32'
        Anchors = [atLeft, atRight]
        AutoSize = False
        Caption = 'CPT'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4763
        mmLeft = 132553
        mmTop = 145266
        mmWidth = 10422
        BandType = 4
        LayerName = Foreground1
      end
    end
    object ppPageStyle2: TppPageStyle
      Background.Brush.Style = bsClear
      EndPage = 0
      SinglePage = 0
      StartPage = 0
      mmBottomOffset = 0
      mmHeight = 284300
      mmPrintPosition = 0
    end
    object ppDesignLayers2: TppDesignLayers
      object ppDesignLayer3: TppDesignLayer
        UserName = 'PageLayer2'
        LayerType = ltPage
        Index = 0
      end
      object ppDesignLayer4: TppDesignLayer
        UserName = 'Foreground1'
        LayerType = ltBanded
        Index = 1
      end
    end
    object ppParameterList2: TppParameterList
    end
  end
end
