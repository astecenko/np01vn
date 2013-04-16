object Form2: TForm2
  Left = 0
  Top = 120
  Width = 907
  Height = 473
  Caption = #1055#1088#1086#1089#1084#1086#1090#1088' '#1085#1086#1084#1077#1085#1082#1083#1072#1090#1091#1088#1099' '#1082#1086#1088#1088#1077#1082#1090#1080#1088#1086#1074#1082#1080
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
    Left = 16
    Top = 16
    Width = 42
    Height = 13
    Caption = #1063#1077#1088#1090#1077#1078':'
  end
  object Label2: TLabel
    Left = 184
    Top = 56
    Width = 20
    Height = 16
    Caption = 'title'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 96
    Width = 889
    Height = 305
    DataSource = DataSource1
    Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'Num'
        Title.Caption = #8470#8470
        Width = 30
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Kod'
        Title.Caption = #1050#1086#1076
        Width = 30
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Chert'
        Title.Alignment = taCenter
        Title.Caption = #1063#1077#1088#1090#1077#1078
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Kol'
        Title.Alignment = taCenter
        Title.Caption = #1050#1086#1083
        Width = 42
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Kol1'
        Title.Alignment = taCenter
        Title.Caption = 'I'
        Width = 38
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Kol2'
        Title.Alignment = taCenter
        Title.Caption = 'II'
        Width = 38
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Kol3'
        Title.Alignment = taCenter
        Title.Caption = 'III'
        Width = 38
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TM1'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TM2'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TM3'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TM4'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TM5'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TM6'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TM7'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TM8'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TM9'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TM10'
        Width = 26
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TM11'
        Width = 26
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TM12'
        Width = 26
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Primech'
        Title.Alignment = taCenter
        Title.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
        Width = 221
        Visible = True
      end>
  end
  object BitBtn1: TBitBtn
    Left = 808
    Top = 408
    Width = 75
    Height = 25
    Caption = '&'#1042#1099#1093#1086#1076
    TabOrder = 1
    Kind = bkClose
  end
  object EditMarsh: TEdit
    Left = 317
    Top = 95
    Width = 325
    Height = 21
    ParentColor = True
    TabOrder = 2
    Text = #1052#1072#1088#1096#1088#1091#1090
  end
  object MaskEdit1: TMaskEdit
    Left = 64
    Top = 8
    Width = 79
    Height = 21
    EditMask = '!999 999999 99;1;_'
    MaxLength = 13
    TabOrder = 3
    Text = '             '
    OnChange = MaskEdit1Change
  end
  object BitBtn3: TBitBtn
    Left = 152
    Top = 8
    Width = 75
    Height = 25
    Caption = #1055#1086#1080#1089#1082
    TabOrder = 4
    OnClick = BitBtn3Click
    Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      18000000000000030000120B0000120B00000000000000000000C0CFD0C0CFD0
      C0CFD0C0CFD0C0CFD0C0CFD0C0CFD0C0CFD0C0CFD0C0CFD0C0CFD0C0CFD0C0CF
      D0C0CFD0C0CFD0C0CFD0C0CFD0000000000000000000000000000000C0CFD0C0
      CFD0C0CFD0C0CFD0C0CFD0000000000000000000000000000000C0CFD0000000
      FFFFFF000000000000000000C0CFD0C0CFD0C0CFD0C0CFD0C0CFD0000000FFFF
      FF000000000000000000C0CFD0000000FFFFFF000000000000000000C0CFD0C0
      CFD0C0CFD0C0CFD0C0CFD0000000FFFFFF000000000000000000C0CFD0000000
      000000000000000000000000000000000000C0CFD00000000000000000000000
      00000000000000000000C0CFD0000000000000FFFFFF00000000000000000000
      0000000000000000FFFFFF000000000000000000000000000000C0CFD0000000
      000000FFFFFF000000000000000000C0C7C0000000000000FFFFFF0000000000
      00000000000000000000C0CFD0000000000000FFFFFF000000000000000000C0
      C7C0000000000000FFFFFF000000000000000000000000000000C0CFD0C0CFD0
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000C0CFD0C0CFD0C0CFD0C0CFD0000000FFFFFF00000000000000
      0000C0CFD0000000FFFFFF000000000000000000C0CFD0C0CFD0C0CFD0C0CFD0
      C0CFD0000000000000000000000000000000C0CFD00000000000000000000000
      00000000C0CFD0C0CFD0C0CFD0C0CFD0C0CFD0C0CFD0000000000000000000C0
      CFD0C0CFD0C0CFD0000000000000000000C0CFD0C0CFD0C0CFD0C0CFD0C0CFD0
      C0CFD0C0CFD0000000FFFFFF000000C0CFD0C0CFD0C0CFD0000000FFFFFF0000
      00C0CFD0C0CFD0C0CFD0C0CFD0C0CFD0C0CFD0C0CFD0000000000000000000C0
      CFD0C0CFD0C0CFD0000000000000000000C0CFD0C0CFD0C0CFD0C0CFD0C0CFD0
      C0CFD0C0CFD0C0CFD0C0CFD0C0CFD0C0CFD0C0CFD0C0CFD0C0CFD0C0CFD0C0CF
      D0C0CFD0C0CFD0C0CFD0C0CFD0C0CFD0C0CFD0C0CFD0C0CFD0C0CFD0C0CFD0C0
      CFD0C0CFD0C0CFD0C0CFD0C0CFD0C0CFD0C0CFD0C0CFD0C0CFD0}
  end
  object DBNavigator1: TDBNavigator
    Left = 16
    Top = 408
    Width = 160
    Height = 25
    DataSource = DataSource1
    VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
    TabOrder = 5
  end
  object BitBtn2: TBitBtn
    Left = 256
    Top = 8
    Width = 201
    Height = 25
    Caption = #1057#1092#1086#1088#1084#1080#1088#1080#1074#1072#1090#1100' '#1084#1072#1082#1077#1090#1085#1099#1081' '#1092#1072#1081#1083' P1'
    TabOrder = 6
    OnClick = BitBtn2Click
    Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      18000000000000030000120B0000120B00000000000000000000C0CFD0C0CFD0
      C0CFD0C0CFD0C0CFD0C0CFD0C0CFD0C0CFD0C0CFD0C0CFD0C0CFD0C0CFD0C0CF
      D0C0CFD0C0CFD0C0CFD0C0CFD0C0CFD0C0CFD000000000000000000000000000
      0000000000000000000000000000000000C0CFD0C0CFD0C0CFD0C0CFD0C0CFD0
      7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FF000000C0CFD0C0CFD0C0CFD0C0CFD07F7F7FFFFFFFFFFFFFFFFFFFBFBFBFBF
      BFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000C0CFD0C0CFD0C0CFD0C0CFD0
      7F7F7FFFFFFFFFFFFFFFFFFF00007FBFBFBFBFBFBFFFFFFFFFFFFFFFFFFFFFFF
      FF000000C0CFD0C0CFD0C0CFD0C0CFD07F7F7FFFFFFFFFFFFF00007F00007F00
      007FBFBFBFBFBFBFFFFFFFFFFFFFFFFFFF000000C0CFD0C0CFD0C0CFD0C0CFD0
      7F7F7FFFFFFF00007F00007FFFFFFF00007F00007FBFBFBFFFFFFFFFFFFFFFFF
      FF000000C0CFD0C0CFD0C0CFD0C0CFD07F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFF00007F7F7F7FBFBFBFFFFFFFFFFFFF000000C0CFD0C0CFD0C0CFD0C0CFD0
      7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00007FBFBFBFBFBFBFFFFF
      FF000000C0CFD0C0CFD0C0CFD0C0CFD07F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFF00007FBFBFBFFFFFFF000000C0CFD0C0CFD0C0CFD0C0CFD0
      7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00007FFFFF
      FF000000C0CFD0C0CFD0C0CFD0C0CFD07F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000C0CFD0C0CFD0C0CFD0C0CFD0
      7F7F7FFFFFFFFFFFFF000000000000000000000000000000000000FFFFFFFFFF
      FF000000C0CFD0C0CFD0C0CFD0C0CFD0C0CFD07F7F7F7F7F7F000000FFFFFFBF
      BFBFBFBFBFBFBFBF0000007F7F7F7F7F7FC0CFD0C0CFD0C0CFD0C0CFD0C0CFD0
      C0CFD0C0CFD0C0CFD0C0CFD07F7F7F7F7F7F7F7F7F7F7F7FC0CFD0C0CFD0C0CF
      D0C0CFD0C0CFD0C0CFD0C0CFD0C0CFD0C0CFD0C0CFD0C0CFD0C0CFD0C0CFD0C0
      CFD0C0CFD0C0CFD0C0CFD0C0CFD0C0CFD0C0CFD0C0CFD0C0CFD0}
  end
  object DataSource1: TDataSource
    DataSet = Table_NP01FN
    Left = 472
  end
  object Table_NP01FN: TTable
    DatabaseName = 'K:\PDO\NP01VN\NP01VN_23'
    ReadOnly = True
    Left = 512
    object Table_NP01FNNum: TIntegerField
      FieldName = 'Num'
    end
    object Table_NP01FNKod: TIntegerField
      FieldName = 'Kod'
    end
    object Table_NP01FNChert: TStringField
      FieldName = 'Chert'
      EditMask = '!999 999999 99;1;_'
      Size = 13
    end
    object Table_NP01FNKol: TIntegerField
      FieldName = 'Kol'
    end
    object Table_NP01FNKol1: TIntegerField
      FieldName = 'Kol1'
    end
    object Table_NP01FNKol2: TIntegerField
      FieldName = 'Kol2'
    end
    object Table_NP01FNKol3: TIntegerField
      FieldName = 'Kol3'
    end
    object Table_NP01FNTM1: TStringField
      FieldName = 'TM1'
      Size = 2
    end
    object Table_NP01FNTM2: TStringField
      FieldName = 'TM2'
      Size = 2
    end
    object Table_NP01FNTM3: TStringField
      FieldName = 'TM3'
      Size = 2
    end
    object Table_NP01FNTM4: TStringField
      FieldName = 'TM4'
      Size = 2
    end
    object Table_NP01FNTM5: TStringField
      FieldName = 'TM5'
      Size = 2
    end
    object Table_NP01FNTM6: TStringField
      FieldName = 'TM6'
      Size = 2
    end
    object Table_NP01FNTM7: TStringField
      FieldName = 'TM7'
      Size = 2
    end
    object Table_NP01FNTM8: TStringField
      FieldName = 'TM8'
      Size = 2
    end
    object Table_NP01FNTM9: TStringField
      FieldName = 'TM9'
      Size = 2
    end
    object Table_NP01FNTM10: TStringField
      FieldName = 'TM10'
      Size = 2
    end
    object Table_NP01FNTM11: TStringField
      FieldName = 'TM11'
      Size = 2
    end
    object Table_NP01FNTM12: TStringField
      FieldName = 'TM12'
      Size = 2
    end
    object Table_NP01FNPrimech: TStringField
      FieldName = 'Primech'
      Size = 255
    end
  end
end
