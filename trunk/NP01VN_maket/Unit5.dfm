object Form5: TForm5
  Left = 220
  Top = 54
  AutoScroll = False
  Caption = #1052#1072#1082#1077#1090#1085#1099#1081' '#1092#1072#1081#1083' '#1056'1'
  ClientHeight = 490
  ClientWidth = 608
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Microsoft Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnResize = FormResize
  OnShow = FormShow
  DesignSize = (
    608
    490)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 64
    Width = 42
    Height = 13
    Caption = #1063#1077#1088#1090#1077#1078':'
  end
  object lbl1: TLabel
    Left = 176
    Top = 465
    Width = 26
    Height = 16
    Anchors = [akLeft, akBottom]
    Caption = 'lbl1'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblDoc: TLabel
    Left = 0
    Top = 0
    Width = 601
    Height = 17
    Hint = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
    AutoSize = False
    Caption = 'lblDoc'
    ParentShowHint = False
    ShowHint = True
    WordWrap = True
  end
  object lblTable: TLabel
    Left = 0
    Top = 24
    Width = 601
    Height = 17
    Hint = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1082#1086#1088#1088#1077#1082#1090#1080#1088#1086#1074#1082#1080
    AutoSize = False
    Caption = 'lblTable'
    ParentShowHint = False
    ShowHint = True
  end
  object DBGrid1: TDBGrid
    Left = 9
    Top = 160
    Width = 593
    Height = 297
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = DataSource1
    DefaultDrawing = False
    Options = [dgEditing, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 0
    TitleFont.Charset = RUSSIAN_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Microsoft Sans Serif'
    TitleFont.Style = []
    OnDrawColumnCell = DBGrid1DrawColumnCell
    Columns = <
      item
        Expanded = False
        FieldName = 'NM'
        Width = 17
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Pmak'
        PickList.Strings = (
          '0'
          '1'
          '2'
          '3'
          '4')
        Width = 28
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'KI'
        Width = 46
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Chert'
        Width = 83
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Pmod'
        PickList.Strings = (
          '0'
          '1'
          '2'
          '3'
          '4'
          '5')
        Width = 28
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'SumKol'
        Width = 48
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Kol1'
        Width = 39
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Kol2'
        Width = 39
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Kol3'
        Width = 39
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Marshryt'
        Width = 180
        Visible = True
      end>
  end
  object StaticText1: TStaticText
    Left = 9
    Top = 84
    Width = 32
    Height = 76
    Alignment = taCenter
    AutoSize = False
    BorderStyle = sbsSingle
    Caption = '            '#1053#1052
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
  end
  object StaticText2: TStaticText
    Left = 40
    Top = 103
    Width = 30
    Height = 57
    Alignment = taCenter
    AutoSize = False
    BorderStyle = sbsSingle
    Caption = #1087#1088'. '#1084#1072#1082
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
  end
  object StaticText3: TStaticText
    Left = 69
    Top = 103
    Width = 48
    Height = 57
    Alignment = taCenter
    AutoSize = False
    BorderStyle = sbsSingle
    Caption = #1082#1086#1076'. '#1080#1079#1076
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
  end
  object StaticText4: TStaticText
    Left = 116
    Top = 103
    Width = 86
    Height = 57
    Alignment = taCenter
    AutoSize = False
    BorderStyle = sbsSingle
    Caption = '             '#1095#1077#1088#1090#1077#1078
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
  end
  object StaticText5: TStaticText
    Left = 200
    Top = 103
    Width = 30
    Height = 57
    Alignment = taCenter
    AutoSize = False
    BorderStyle = sbsSingle
    Caption = #1087#1088'. '#1084#1076#1092
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
  end
  object StaticText6: TStaticText
    Left = 229
    Top = 103
    Width = 51
    Height = 57
    Alignment = taCenter
    AutoSize = False
    BorderStyle = sbsSingle
    Caption = #1082#1086#1083'-'#1074#1086' '#1085#1072' '#1082#1074#1072#1088#1090#1072#1083
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 6
  end
  object StaticText7: TStaticText
    Left = 279
    Top = 129
    Width = 40
    Height = 31
    Alignment = taCenter
    AutoSize = False
    BorderStyle = sbsSingle
    Caption = 'I'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 7
  end
  object StaticText8: TStaticText
    Left = 318
    Top = 129
    Width = 41
    Height = 31
    Alignment = taCenter
    AutoSize = False
    BorderStyle = sbsSingle
    Caption = 'II'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 8
  end
  object StaticText9: TStaticText
    Left = 358
    Top = 129
    Width = 41
    Height = 31
    Alignment = taCenter
    AutoSize = False
    BorderStyle = sbsSingle
    Caption = 'III'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 9
  end
  object StaticText10: TStaticText
    Left = 279
    Top = 103
    Width = 120
    Height = 27
    Alignment = taCenter
    AutoSize = False
    BorderStyle = sbsSingle
    Caption = #1082#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1087#1086' '#1084#1077#1089#1103#1094#1072#1084
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 10
  end
  object StaticText11: TStaticText
    Left = 398
    Top = 103
    Width = 203
    Height = 57
    Alignment = taCenter
    AutoSize = False
    BorderStyle = sbsSingle
    Caption = '                                 '#1090#1077#1093#1084#1072#1088#1096#1088#1091#1090
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 11
  end
  object StaticText12: TStaticText
    Left = 40
    Top = 84
    Width = 561
    Height = 21
    Alignment = taCenter
    AutoSize = False
    BorderStyle = sbsSingle
    Caption = #1056#1077#1082#1074#1080#1079#1080#1090#1099' '#1084#1072#1082#1077#1090#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 12
  end
  object DBNavigator1: TDBNavigator
    Left = 11
    Top = 463
    Width = 156
    Height = 25
    DataSource = DataSource1
    VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete]
    Anchors = [akLeft, akBottom]
    TabOrder = 13
  end
  object BitBtn1: TBitBtn
    Left = 512
    Top = 463
    Width = 90
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = '&'#1042#1099#1093#1086#1076
    TabOrder = 14
    Kind = bkClose
  end
  object MaskEdit1: TMaskEdit
    Left = 64
    Top = 56
    Width = 79
    Height = 21
    EditMask = '!999 999999 99;1;_'
    MaxLength = 13
    TabOrder = 15
    Text = '             '
  end
  object BitBtn3: TBitBtn
    Left = 152
    Top = 54
    Width = 75
    Height = 25
    Caption = #1055#1086#1080#1089#1082
    TabOrder = 16
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
  object BitBtn2: TBitBtn
    Left = 433
    Top = 54
    Width = 169
    Height = 25
    Anchors = [akTop, akRight]
    Caption = #1047#1072#1087#1080#1089#1072#1090#1100' '#1084#1072#1082#1077#1090#1085#1099#1081' '#1092#1072#1081#1083
    TabOrder = 17
    OnClick = BitBtn2Click
    Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      1800000000000003000000000000000000000000000000000000FF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FF00000000000000000000000000000000
      0000000000000000000000000000000000000000000000FF00FFFF00FF000000
      008484008484000000000000000000000000000000000000C6C6C6C6C6C60000
      00008484000000FF00FFFF00FF00000000848400848400000000000000000000
      0000000000000000C6C6C6C6C6C6000000008484000000FF00FFFF00FF000000
      008484008484000000000000000000000000000000000000C6C6C6C6C6C60000
      00008484000000FF00FFFF00FF00000000848400848400000000000000000000
      0000000000000000000000000000000000008484000000FF00FFFF00FF000000
      0084840084840084840084840084840084840084840084840084840084840084
      84008484000000FF00FFFF00FF00000000848400848400000000000000000000
      0000000000000000000000000000008484008484000000FF00FFFF00FF000000
      008484000000C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C60000
      00008484000000FF00FFFF00FF000000008484000000C6C6C6C6C6C6C6C6C6C6
      C6C6C6C6C6C6C6C6C6C6C6C6C6C6000000008484000000FF00FFFF00FF000000
      008484000000C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C60000
      00008484000000FF00FFFF00FF000000008484000000C6C6C6C6C6C6C6C6C6C6
      C6C6C6C6C6C6C6C6C6C6C6C6C6C6000000008484000000FF00FFFF00FF000000
      008484000000C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C60000
      00000000000000FF00FFFF00FF000000008484000000C6C6C6C6C6C6C6C6C6C6
      C6C6C6C6C6C6C6C6C6C6C6C6C6C6000000C6C6C6000000FF00FFFF00FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
  end
  object chkMonth1: TCheckBox
    Left = 292
    Top = 142
    Width = 17
    Height = 17
    Hint = #1042#1082#1083#1102#1095#1080#1090#1100' '#1084#1077#1089#1103#1094' '#1074' '#1084#1072#1082#1077#1090
    Checked = True
    ParentShowHint = False
    ShowHint = True
    State = cbChecked
    TabOrder = 18
  end
  object chkMonth2: TCheckBox
    Left = 332
    Top = 142
    Width = 17
    Height = 17
    Hint = #1042#1082#1083#1102#1095#1080#1090#1100' '#1084#1077#1089#1103#1094' '#1074' '#1084#1072#1082#1077#1090
    Checked = True
    ParentShowHint = False
    ShowHint = True
    State = cbChecked
    TabOrder = 19
  end
  object chkMonth3: TCheckBox
    Left = 372
    Top = 142
    Width = 17
    Height = 17
    Hint = #1042#1082#1083#1102#1095#1080#1090#1100' '#1084#1077#1089#1103#1094' '#1074' '#1084#1072#1082#1077#1090
    Checked = True
    ParentShowHint = False
    ShowHint = True
    State = cbChecked
    TabOrder = 20
  end
  object Query1: TQuery
    Left = 49
    Top = 261
  end
  object Table_DPLN: TTable
    AfterInsert = Table_DPLNAfterInsert
    BeforeEdit = Table_DPLNBeforeEdit
    AfterPost = Table_DPLNAfterPost
    OnCalcFields = Table_DPLNCalcFields
    Left = 81
    Top = 261
    object Table_DPLNNM: TStringField
      DefaultExpression = #39'P1'#39
      FieldName = 'NM'
    end
    object Table_DPLNPmak: TStringField
      FieldName = 'Pmak'
      OnChange = Table_DPLNPmakChange
      OnSetText = Table_DPLNPmakSetText
      EditMask = '9;1;_'
      Size = 1
    end
    object Table_DPLNKI: TStringField
      FieldName = 'KI'
      EditMask = '9999;1;_'
      Size = 4
    end
    object Table_DPLNChert: TStringField
      FieldName = 'Chert'
      EditMask = '999 999999 99;1;_'
    end
    object Table_DPLNPmod: TStringField
      FieldName = 'Pmod'
      OnSetText = Table_DPLNPmodSetText
      EditMask = '9;1;_'
      Size = 1
    end
    object Table_DPLNKol1: TIntegerField
      DisplayWidth = 12
      FieldName = 'Kol1'
      OnSetText = Table_DPLNKol1SetText
    end
    object Table_DPLNKol2: TIntegerField
      FieldName = 'Kol2'
      OnSetText = Table_DPLNKol2SetText
    end
    object Table_DPLNKol3: TIntegerField
      FieldName = 'Kol3'
      OnSetText = Table_DPLNKol3SetText
    end
    object Table_DPLNMarshryt: TStringField
      DisplayWidth = 35
      FieldName = 'Marshryt'
      EditMask = '99 99 99 99 99 99 99 99 99 99 99 99;1;_'
      Size = 35
    end
    object Table_DPLNSumKol: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'SumKol'
      Calculated = True
    end
  end
  object DataSource1: TDataSource
    DataSet = Table_DPLN
    OnDataChange = DataSource1DataChange
    Left = 145
    Top = 261
  end
  object Query_ins_del_upd: TQuery
    Left = 113
    Top = 261
  end
  object Query_ins_DPLN: TQuery
    SQL.Strings = (
      'values ('#39'P1'#39',:pm,:ki,:ch,:pmod,:k,:k1,:k2,:k3,:m)'
      '')
    Left = 177
    Top = 261
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'pm'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ki'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ch'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'pmod'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'k'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'k1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'k2'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'k3'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'm'
        ParamType = ptUnknown
      end>
  end
end
