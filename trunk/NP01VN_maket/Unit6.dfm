object Form6: TForm6
  Left = 369
  Top = 274
  Width = 474
  Height = 348
  Caption = #1047#1072#1087#1080#1089#1100' '#1084#1072#1082#1077#1090#1085#1086#1075#1086' '#1092#1072#1081#1083#1072
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnActivate = FormActivate
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 16
  object Label1: TLabel
    Left = 16
    Top = 8
    Width = 189
    Height = 20
    Caption = #1056#1077#1082#1074#1080#1079#1080#1090#1099' '#1084#1072#1082#1077#1090#1072' '#1056'0:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 13
    Top = 32
    Width = 109
    Height = 16
    Caption = #1050#1086#1076' '#1085#1072#1079#1085#1072#1095#1077#1085#1080#1103':'
  end
  object Label3: TLabel
    Left = 1
    Top = 72
    Width = 123
    Height = 16
    Caption = #1058#1077#1082#1089#1090' '#1085#1072#1079#1085#1072#1095#1077#1085#1080#1103':'
  end
  object MaskEdit1: TMaskEdit
    Left = 128
    Top = 32
    Width = 41
    Height = 24
    EditMask = 'AC9a;1;_'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    MaxLength = 4
    ParentFont = False
    TabOrder = 0
    Text = '    '
  end
  object BitBtn1: TBitBtn
    Left = 296
    Top = 112
    Width = 75
    Height = 25
    Caption = '&'#1042#1099#1093#1086#1076
    TabOrder = 1
    Kind = bkClose
  end
  object BitBtn2: TBitBtn
    Left = 32
    Top = 112
    Width = 75
    Height = 25
    Caption = #1054#1050
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Pitch = fpFixed
    Font.Style = []
    ParentFont = False
    TabOrder = 2
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
  object Edit1: TEdit
    Left = 128
    Top = 72
    Width = 321
    Height = 24
    MaxLength = 74
    TabOrder = 3
  end
  object lst1: TListBox
    Left = 8
    Top = 148
    Width = 417
    Height = 169
    ItemHeight = 16
    TabOrder = 4
    OnClick = lst1Click
  end
  object btn1: TButton
    Left = 431
    Top = 152
    Width = 33
    Height = 25
    Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1074' '#1089#1087#1080#1089#1086#1082
    Caption = '+'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 5
    OnClick = btn1Click
  end
  object btn2: TButton
    Left = 431
    Top = 184
    Width = 33
    Height = 25
    Hint = #1059#1076#1072#1083#1080#1090#1100' '#1080#1079' '#1089#1087#1080#1089#1082#1072
    Caption = '-'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 6
    OnClick = btn2Click
  end
end
