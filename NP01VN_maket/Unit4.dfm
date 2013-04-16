object Form4: TForm4
  Left = 497
  Top = 374
  Width = 322
  Height = 174
  Caption = #1060#1086#1088#1084#1080#1088#1086#1074#1072#1085#1080#1077' '#1084#1072#1082#1077#1090#1085#1086#1075#1086' '#1092#1072#1081#1083#1072
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 58
    Top = 24
    Width = 143
    Height = 20
    Caption = #1055#1088#1080#1079#1085#1072#1082' '#1084#1072#1082#1077#1090#1072':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 7
    Top = 64
    Width = 201
    Height = 20
    Caption = #1055#1088#1080#1079#1085#1072#1082' '#1084#1086#1076#1080#1092#1080#1082#1072#1094#1080#1080':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object ComboBox1: TComboBox
    Left = 209
    Top = 24
    Width = 81
    Height = 21
    ItemHeight = 13
    ItemIndex = 0
    TabOrder = 0
    Text = '0'
    OnKeyPress = ComboBox1KeyPress
    Items.Strings = (
      '0'
      '1'
      '2'
      '3'
      '4')
  end
  object ComboBox2: TComboBox
    Left = 211
    Top = 64
    Width = 79
    Height = 21
    ItemHeight = 13
    ItemIndex = 0
    TabOrder = 1
    Text = '0'
    OnKeyPress = ComboBox2KeyPress
    Items.Strings = (
      '0'
      '1'
      '2'
      '3'
      '4'
      '5')
  end
  object BitBtn1: TBitBtn
    Left = 216
    Top = 104
    Width = 75
    Height = 25
    Caption = #1042#1099#1093#1086#1076
    TabOrder = 2
    Kind = bkClose
  end
  object BitBtn2: TBitBtn
    Left = 21
    Top = 104
    Width = 75
    Height = 24
    Caption = 'OK'
    TabOrder = 3
    OnClick = BitBtn2Click
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3333333333333333333333330000333333333333333333333333F33333333333
      00003333344333333333333333388F3333333333000033334224333333333333
      338338F3333333330000333422224333333333333833338F3333333300003342
      222224333333333383333338F3333333000034222A22224333333338F338F333
      8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
      33333338F83338F338F33333000033A33333A222433333338333338F338F3333
      0000333333333A222433333333333338F338F33300003333333333A222433333
      333333338F338F33000033333333333A222433333333333338F338F300003333
      33333333A222433333333333338F338F00003333333333333A22433333333333
      3338F38F000033333333333333A223333333333333338F830000333333333333
      333A333333333333333338330000333333333333333333333333333333333333
      0000}
    NumGlyphs = 2
  end
  object Query_create_DPLN: TQuery
    Left = 16
    Top = 16
  end
end
