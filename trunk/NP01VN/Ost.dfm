object frm42: Tfrm42
  Left = 0
  Top = 75
  BorderStyle = bsSingle
  Caption = #1050#1086#1088#1088#1077#1082#1090#1080#1088#1086#1074#1082#1072' '#1083#1080#1084#1080#1090#1072' '#1074' '#1085#1086#1084#1077#1085#1082#1083#1072#1090#1091#1088#1077' '#1058#1052#1062
  ClientHeight = 601
  ClientWidth = 942
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  DesignSize = (
    942
    601)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 37
    Top = 442
    Width = 737
    Height = 13
    Alignment = taCenter
    Anchors = [akLeft, akRight, akBottom]
    Caption = 
      'Esc -'#1054#1090#1084#1077#1085#1072' '#1088#1077#1076'. F2 -'#1056#1077#1076#1072#1082#1090#1080#1088' '#1103#1095#1077#1081#1082#1080'  Tab -'#1055#1077#1088#1077#1084#1077#1097'. ->  Shift+Ta' +
      'b -'#1055#1077#1088#1077#1084#1077#1097' <-  Ins -'#1042#1089#1090#1072#1074#1080#1090#1100' '#1089#1090#1088'. Ctrl+Del -'#1059#1076#1072#1083#1080#1090#1100' '#1089#1090#1088'.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbl2: TLabel
    Left = 168
    Top = 461
    Width = 41
    Height = 16
    Caption = #1096#1080#1092#1088
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbl1: TLabel
    Left = 2
    Top = 32
    Width = 29
    Height = 13
    Caption = #1064#1080#1092#1088
  end
  object lbl3: TLabel
    Left = 2
    Top = 8
    Width = 43
    Height = 13
    Caption = #1050#1086#1076' '#1080#1079#1076'.'
  end
  object btn5: TSpeedButton
    Left = 114
    Top = 16
    Width = 50
    Height = 25
    AllowAllUp = True
    GroupIndex = 1
    Caption = #1060#1080#1083#1100#1090#1088
    OnClick = btn5Click
  end
  object lblRecCount: TLabel
    Left = 835
    Top = 440
    Width = 49
    Height = 16
    Hint = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1079#1072#1087#1080#1089#1077#1081
    Anchors = [akRight, akBottom]
    Caption = '000000'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
  end
  object lblShifrTitle: TLabel
    Left = 424
    Top = 464
    Width = 512
    Height = 49
    Anchors = [akLeft, akRight, akBottom]
    AutoSize = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    WordWrap = True
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 144
    Width = 942
    Height = 297
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = DataSource1
    Options = [dgEditing, dgAlwaysShowEditor, dgIndicator, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    PopupMenu = pm1
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnColExit = DBGrid1ColExit
    OnKeyDown = DBGrid1KeyDown
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'KI'
        Title.Alignment = taCenter
        Width = 58
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Shifr'
        Title.Alignment = taCenter
        Width = 69
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Vp'
        PickList.Strings = (
          '2'
          '9')
        Title.Alignment = taCenter
        Width = 29
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Eim'
        ReadOnly = True
        Title.Alignment = taCenter
        Width = 37
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Norma'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -17
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = []
        Width = 85
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Kol_m'
        Width = 30
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'Kol'
        Title.Alignment = taCenter
        Width = 82
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Kol_m2'
        Width = 30
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'Kol2'
        Width = 81
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Kol_m3'
        Width = 30
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Kol3'
        Width = 82
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Cp'
        Title.Alignment = taCenter
        Width = 45
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Znak'
        Title.Alignment = taCenter
        Width = 48
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Podrazd'
        Title.Alignment = taCenter
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Primech'
        Width = 169
        Visible = True
      end>
  end
  object BitBtn1: TBitBtn
    Left = 863
    Top = 570
    Width = 76
    Height = 28
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = #1042#1099#1093#1086#1076
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    OnClick = BitBtn1Click
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00388888888877
      F7F787F8888888888333333F00004444400888FFF444448888888888F333FF8F
      000033334D5007FFF4333388888888883338888F0000333345D50FFFF4333333
      338F888F3338F33F000033334D5D0FFFF43333333388788F3338F33F00003333
      45D50FEFE4333333338F878F3338F33F000033334D5D0FFFF43333333388788F
      3338F33F0000333345D50FEFE4333333338F878F3338F33F000033334D5D0FFF
      F43333333388788F3338F33F0000333345D50FEFE4333333338F878F3338F33F
      000033334D5D0EFEF43333333388788F3338F33F0000333345D50FEFE4333333
      338F878F3338F33F000033334D5D0EFEF43333333388788F3338F33F00003333
      4444444444333333338F8F8FFFF8F33F00003333333333333333333333888888
      8888333F00003333330000003333333333333FFFFFF3333F00003333330AAAA0
      333333333333888888F3333F00003333330000003333333333338FFFF8F3333F
      0000}
    NumGlyphs = 2
  end
  object mmo1: TMemo
    Left = 256
    Top = 2
    Width = 474
    Height = 79
    Alignment = taCenter
    Anchors = [akLeft, akTop, akRight]
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
  end
  object pnl1: TPanel
    Left = 12
    Top = 84
    Width = 917
    Height = 62
    BevelOuter = bvNone
    TabOrder = 0
    object txt1: TStaticText
      Left = 0
      Top = 0
      Width = 61
      Height = 62
      Alignment = taCenter
      AutoSize = False
      BevelKind = bkTile
      Caption = #1050#1086#1076' '#1080#1079#1076#1077#1083#1080#1103
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
    object txt2: TStaticText
      Left = 59
      Top = 0
      Width = 72
      Height = 62
      Alignment = taCenter
      AutoSize = False
      BevelKind = bkTile
      Caption = #1064#1080#1092#1088' '#1084#1072#1090#1077#1088#1080#1072#1083#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
    end
    object txt3: TStaticText
      Left = 159
      Top = 0
      Width = 40
      Height = 62
      Alignment = taCenter
      AutoSize = False
      BevelKind = bkTile
      Caption = #1045#1076'. '#1080#1079#1084
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
    end
    object txt4: TStaticText
      Left = 284
      Top = 0
      Width = 344
      Height = 18
      Alignment = taCenter
      AutoSize = False
      BevelKind = bkTile
      Caption = #1050#1086#1083'-'#1074#1086' '#1084#1072#1090#1077#1088#1080#1072#1083#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
    end
    object txt5: TStaticText
      Left = 284
      Top = 16
      Width = 116
      Height = 18
      Alignment = taCenter
      AutoSize = False
      BevelKind = bkTile
      Caption = #1089#1077#1085#1090#1103#1073#1088#1100
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
    end
    object txt6: TStaticText
      Left = 398
      Top = 16
      Width = 115
      Height = 18
      Alignment = taCenter
      AutoSize = False
      BevelKind = bkTile
      Caption = #1084#1072#1081
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 5
    end
    object txt7: TStaticText
      Left = 626
      Top = 0
      Width = 48
      Height = 62
      Alignment = taCenter
      AutoSize = False
      BevelKind = bkTile
      Caption = #1062#1077#1093'- '#1087#1086#1083
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 6
    end
    object txt8: TStaticText
      Left = 670
      Top = 0
      Width = 52
      Height = 62
      Alignment = taCenter
      AutoSize = False
      BevelKind = bkTile
      Caption = #1047#1085#1072#1082'   0-'#1091#1074#1077#1083'  1-'#1091#1084#1077#1085
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 7
    end
    object txt9: TStaticText
      Left = 720
      Top = 0
      Width = 172
      Height = 62
      Alignment = taCenter
      AutoSize = False
      BevelKind = bkTile
      Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 8
    end
    object txt10: TStaticText
      Left = 197
      Top = 0
      Width = 89
      Height = 62
      Alignment = taCenter
      AutoSize = False
      BevelKind = bkTile
      Caption = #1053#1086#1088#1084#1072' '#1085#1072' '#1084#1072#1096#1080#1085#1091
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 9
    end
    object txt11: TStaticText
      Left = 284
      Top = 32
      Width = 34
      Height = 30
      Hint = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1084#1072#1096#1080#1085
      Alignment = taCenter
      AutoSize = False
      BevelKind = bkTile
      Caption = #1050#1086#1083'. '#1084#1072#1096'.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 10
    end
    object txt12: TStaticText
      Left = 315
      Top = 32
      Width = 85
      Height = 30
      Alignment = taCenter
      AutoSize = False
      BevelKind = bkTile
      Caption = #1048#1090#1086#1075#1086' '#1082#1086#1083'. '#1084#1072#1090#1077#1088#1080#1072#1083#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 11
    end
    object txt13: TStaticText
      Left = 398
      Top = 32
      Width = 33
      Height = 30
      Hint = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1084#1072#1096#1080#1085
      Alignment = taCenter
      AutoSize = False
      BevelKind = bkTile
      Caption = #1050#1086#1083'. '#1084#1072#1096'.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 12
    end
    object txt14: TStaticText
      Left = 429
      Top = 32
      Width = 84
      Height = 30
      Alignment = taCenter
      AutoSize = False
      BevelKind = bkTile
      Caption = #1048#1090#1086#1075#1086' '#1082#1086#1083'. '#1084#1072#1090#1077#1088#1080#1072#1083#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 13
    end
    object txt15: TStaticText
      Left = 511
      Top = 16
      Width = 117
      Height = 18
      Alignment = taCenter
      AutoSize = False
      BevelKind = bkTile
      Caption = #1084#1072#1081
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 14
    end
    object txt16: TStaticText
      Left = 542
      Top = 32
      Width = 86
      Height = 30
      Alignment = taCenter
      AutoSize = False
      BevelKind = bkTile
      Caption = #1048#1090#1086#1075#1086' '#1082#1086#1083'. '#1084#1072#1090#1077#1088#1080#1072#1083#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 15
    end
    object txt17: TStaticText
      Left = 511
      Top = 32
      Width = 33
      Height = 30
      Hint = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1084#1072#1096#1080#1085
      Alignment = taCenter
      AutoSize = False
      BevelKind = bkTile
      Caption = #1050#1086#1083'. '#1084#1072#1096'.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 16
    end
    object txt18: TStaticText
      Left = 129
      Top = 0
      Width = 32
      Height = 62
      Alignment = taCenter
      AutoSize = False
      BevelKind = bkTile
      Caption = #1042#1055' 2=C 9='#1069
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 17
    end
    object txtKodPodr: TStaticText
      Left = 736
      Top = 0
      Width = 59
      Height = 62
      Alignment = taCenter
      AutoSize = False
      BevelKind = bkTile
      Caption = #1050#1086#1076' '#1087#1086#1076#1088#1072#1079#1076'.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 18
      Visible = False
    end
  end
  object btn1: TBitBtn
    Left = 736
    Top = 1
    Width = 200
    Height = 20
    Anchors = [akTop, akRight]
    Caption = #1050#1086#1087#1080#1088#1086#1074#1072#1090#1100
    TabOrder = 4
    OnClick = btn1Click
  end
  object btn3: TBitBtn
    Left = 736
    Top = 21
    Width = 200
    Height = 20
    Anchors = [akTop, akRight]
    Caption = #1042#1089#1090#1072#1074#1080#1090#1100' '#1074#1089#1077
    TabOrder = 5
    OnClick = btn3Click
  end
  object dbgrd1: TDBGrid
    Left = 0
    Top = 480
    Width = 417
    Height = 121
    Anchors = [akLeft, akBottom]
    DataSource = ds1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 6
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = [fsBold]
    Columns = <
      item
        Expanded = False
        FieldName = 'CEHL'
        Title.Alignment = taCenter
        Title.Caption = #1062#1077#1093
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KIL'
        Title.Alignment = taCenter
        Title.Caption = #1050#1086#1076' '#1080#1079#1076'.'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LIMK'
        Title.Alignment = taCenter
        Title.Caption = #1051#1080#1084#1080#1090' '#1084#1077#1089'.'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OLIM'
        Title.Alignment = taCenter
        Title.Caption = #1054#1089#1090#1072#1090'. '#1084#1077#1089#1103#1094
        Width = 90
        Visible = True
      end>
  end
  object btn2: TButton
    Left = 0
    Top = 456
    Width = 161
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = #1057#1074#1077#1076#1077#1085#1080#1103' '#1086' '#1084#1072#1090#1077#1088#1080#1072#1083#1077':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 7
    OnClick = btn2Click
  end
  object btn4: TBitBtn
    Left = 736
    Top = 41
    Width = 200
    Height = 20
    Anchors = [akTop, akRight]
    Caption = #1042#1089#1090#1072#1074#1080#1090#1100' '#1084#1072#1090#1077#1088#1080#1072#1083#1099
    TabOrder = 8
    OnClick = btn4Click
  end
  object medt1: TMaskEdit
    Left = 48
    Top = 32
    Width = 64
    Height = 21
    EditMask = '99999999;1;_'
    MaxLength = 8
    TabOrder = 9
    Text = '        '
  end
  object se1: TSpinEdit
    Left = 48
    Top = 4
    Width = 64
    Height = 22
    MaxLength = 4
    MaxValue = 9999
    MinValue = 0
    TabOrder = 10
    Value = 0
    OnExit = se1Exit
  end
  object btnMSO: TButton
    Left = 735
    Top = 61
    Width = 201
    Height = 20
    Hint = #1069#1050#1057#1055#1045#1056#1048#1052#1045#1053#1058#1040#1051#1068#1053#1040#1071' '#1060#1059#1053#1050#1062#1048#1071'!!!'
    Anchors = [akTop, akRight]
    Caption = #1042#1089#1090#1072#1074#1080#1090#1100' '#1082#1072#1082' '#1090#1077#1082#1089#1090
    ParentShowHint = False
    ShowHint = True
    TabOrder = 11
    OnClick = btnMSOClick
  end
  object btnSave: TBitBtn
    Left = 0
    Top = 56
    Width = 49
    Height = 25
    Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1090#1072#1073#1083#1080#1094#1091
    ParentShowHint = False
    ShowHint = True
    TabOrder = 12
    OnClick = btnSaveClick
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      333333FFFFFFFFFFFFF33000077777770033377777777777773F000007888888
      00037F3337F3FF37F37F00000780088800037F3337F77F37F37F000007800888
      00037F3337F77FF7F37F00000788888800037F3337777777337F000000000000
      00037F3FFFFFFFFFFF7F00000000000000037F77777777777F7F000FFFFFFFFF
      00037F7F333333337F7F000FFFFFFFFF00037F7F333333337F7F000FFFFFFFFF
      00037F7F333333337F7F000FFFFFFFFF00037F7F333333337F7F000FFFFFFFFF
      00037F7F333333337F7F000FFFFFFFFF07037F7F33333333777F000FFFFFFFFF
      0003737FFFFFFFFF7F7330099999999900333777777777777733}
    NumGlyphs = 2
  end
  object grp1: TGroupBox
    Left = 168
    Top = 0
    Width = 81
    Height = 80
    Caption = ' '#1057#1086#1088#1090#1080#1088#1086#1074#1082#1072' '
    TabOrder = 13
    object btnSort0: TSpeedButton
      Left = 12
      Top = 14
      Width = 55
      Height = 18
      Hint = #1055#1086' '#1087#1086#1088#1103#1076#1082#1091' '#1074#1074#1086#1076#1072
      GroupIndex = 8
      Down = True
      Caption = #1087'.'#1087'.'
      ParentShowHint = False
      ShowHint = True
      OnClick = btnSort0Click
    end
    object btnSort2: TSpeedButton
      Left = 12
      Top = 36
      Width = 55
      Height = 18
      Hint = #1055#1086' '#1096#1080#1092#1088#1091
      GroupIndex = 8
      Caption = #1064#1080#1092#1088
      ParentShowHint = False
      ShowHint = True
      OnClick = btnSort2Click
    end
    object btnSort1: TSpeedButton
      Left = 12
      Top = 56
      Width = 55
      Height = 18
      Hint = #1055#1086' '#1082#1086#1076#1091' '#1080#1079#1076#1077#1083#1080#1081' '#1080' '#1096#1080#1092#1088#1091
      GroupIndex = 8
      Caption = #1050#1048'-'#1064#1080#1092#1088
      ParentShowHint = False
      ShowHint = True
      OnClick = btnSort1Click
    end
  end
  object btn6: TBitBtn
    Left = 425
    Top = 570
    Width = 160
    Height = 28
    Hint = #1055#1088#1086#1089#1084#1086#1090#1088' '#1086#1090#1087#1088#1072#1074#1083#1077#1085#1085#1099#1093' '#1074' '#1054#1040#1057#1059#1055' '#1082#1086#1088#1088#1077#1082#1090#1080#1088#1086#1074#1086#1082' '#1058#1052#1062
    Anchors = [akLeft, akBottom]
    Caption = #1054#1090#1087#1088#1072#1074#1083#1077#1085#1085#1099#1077' '#1074' '#1054#1040#1057#1059#1055
    ParentShowHint = False
    ShowHint = True
    TabOrder = 14
    WordWrap = True
    OnClick = btn6Click
    Glyph.Data = {
      36060000424D3606000000000000360000002800000020000000100000000100
      18000000000000060000120B0000120B000000000000000000004498988EA6A6
      86A2A288A3A389A4A489A4A489A4A489A4A489A4A489A5A58AA5A589A4A48AA6
      A68EA6A67CA5A50483830E86864C98984B98984F9C9C4F9C9C509C9C4F9C9C4F
      9C9C4F9B9B4F9B9B4F9C9C4F9B9B4D9A9A4C98984A9A9A0B86867CB4B4F0E4E4
      D9D7D7D7D3D3D6D2D3D6D2D2D5D1D1D4D1D1D4D0D0D3CECED2CECED6D1D1D2CE
      CED8D1D1D8DADA0785852C8A8A918484847F7F76707076707077717176707077
      71717872727B74747770707872727F7979827B7B979494228D8D7FBBBBFFFFFF
      EAE7E6E8E3E2E6E4E4E3E0E0E0DEDEDDDADADAD7D7D8D7D6E0E1E0EDEEEEF5F7
      F7E3E2E2BFC7C7098787258484B4AFAF9B9D9D6C6D6D7576766F707072737372
      74747577777B7D7D7273734547475759595C5C5C585C5C1C868680BDBDFFF5F5
      D7C0B8D7BEB7E7E3E3E1DCDCE2DFDFD9D4D4DDDBDAD4CFCFDDDCDCDEDFDFEEEF
      EFFFFFFFC9CECE088484258585BAB3B39697978585857171718C8C8C7B7B7B87
      87877E7E7E818181AEAEAEA3A3A36E6E6E9A99998081811A828281BDBDFFFAFA
      D9C2BBD8C0B8E7E2E2E1DCDBE2DEDED9D4D3DCD9DAD1CCCCD7D3D3D2CECED0CD
      CDE7E4E4E6E5E6138888238585B4ADADA4A5A59F9F9F747474A7A7A78A8A8A9F
      9F9F9090909B9B9B8D8D8DB4B4B48282826161619E9C9C32939381BDBDFFFAFA
      E0C9C1DFC7C0F0EDEDE9E6E5EBE8E9E3DEDCECE8E5DED8D5E1E0E0D3CFCED9D8
      D8D1CDCCE2E1E1188B8B228484B2ABABA0A1A1999999727272A1A1A185858599
      99998C8C8C9595959494949494949B9B9B7D7E7E747070409C9C81BDBDFFFAFA
      DCC5BDDDC5BDECE8E7E6E0E0EAE5E1D1D2E2B1C4ECB7C1DFE0DCDBD1CBCBD7D4
      D4D0CBCADAD9D9188B8B228383B3ACAC9596968A8A8A6969699191917878788B
      8B8B7B7B7B85858583838388888883838385868694919139969681BDBDFFFAF9
      DEC5BDE1C6BEF4F1F1EEEBEBF6F0EBCBD5F28BB2F0A0B8EBEAE7E7D8D4D3DFDE
      DED5D1D0DBDADA188B8B228383B3ACAC9C9D9D8E8E8E6B6B6B9B9B9B80808094
      94948484849090908C8C8C8F8F8F8D8D8D898A8AAFACAC3D9A9A80BBBBFFFFFF
      EBE3E1ECE2E1F2EEEEE8E1E1EEE9E7DBD9E3CAD5F3C9CDE2E4E0DFD6D0CFDBD8
      D8D6D0D0DEDDDD178B8B238585B2ABAB8889897C7C7C6666668282826F6F6F80
      80807777777E7E7E7777777D7D7D797979797A7AADAAAA3D99997EBABBFFFFFF
      FCFEFEFFFEFEFFFFFFF3EFEFF3F1F2EBE6E5F4EFEBE6E0DCE9E8E8DCD7D8E2E1
      E1DAD5D6DFDEDF188C8C1F8080ADA6A6ACADADA6A7A7AEAEAE9A9A9A86868699
      99998B8B8B9393939191919393939292928D8D8DABA8A83C989879B2B0F3E8E2
      E4E1DCE7E2DDE7E4DFE4E0DADED7D2DDD7D2DAD4D0D7D2CDD6D0CBD3CDC8CFCA
      C5D2CEC9D3D0CC198D8D1C7E7EB4ADADC4C5C5C1C1C1C4C4C4BDBDBD82828287
      8787868686898989878787898989878787898989C3C0C03A97972982AD4A84DD
      4883D44D83D35083D05484CF5987CF5D87CE5B84CA557EC64F77C14A71BD446B
      B83B60B14463AE13888E1677768C85859597979090908D8D8D8C8C8C8D8D8D8C
      8C8C9494949595959797979999999C9C9CA1A1A1B6B2B23994940F77B41270F0
      0F6CE40E67E00D63DB0C5ED60A59D00955CB0850C6074CC10548BC0443B7043F
      B20038AD0D40AA09838B117270ABA5A5B6B8B8AFAFAFABABABA8A8A8A5A5A5A2
      A2A2A3A3A3A5A5A5A8A8A8ABABABAFAFAFB6B6B6C5C2C2359292167BB81F79F8
      1D75EB1D71E81C6DE31C69DE1B65D91B61D4195CCF1757CA1552C4134DBF1148
      B90F42B50D40AB007D85147472BAB5B5C7C9C9C5C5C5C7C7C7C8C9C9C9C9C9C9
      CACAC9C9C9C7C8C8C6C7C7C5C6C6C3C4C4C0C1C1C4C1C1369292127BA41E72D0
      2172C92673C82A74C62F76C43477C33979C23776BF3070BC2A6AB82464B41E5D
      B01855AD1156A3008084137473968E8F898686787575737070706D6D6D69696B
      6868716E6E7572727875757D7A7A848181939090BAB5B536949401807D017D7C
      017D7C017D7C007D7D007E7D007E7D007E7D007E7E007F7E017F7F01807F0280
      7F02818002827F008180037E7E1D7C7C207C7C1E7B7B1D7A7A1C79791B78781B
      77771D7A7A1F7B7B207D7D227F7F2581812884842C8B8B088383}
    NumGlyphs = 2
  end
  object btn7: TButton
    Left = 923
    Top = 440
    Width = 18
    Height = 18
    Hint = #1054#1095#1080#1089#1090#1080#1090#1100' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1102' '#1086#13#10#1087#1088#1077#1076#1099#1076#1091#1097#1077#1084' '#1087#1088#1080#1084#1077#1095#1072#1085#1080#1080
    Anchors = [akRight, akBottom]
    Caption = 'C'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 15
    OnClick = btn7Click
  end
  object Table42: TTable
    BeforeInsert = Table42BeforeInsert
    AfterInsert = Table42AfterInsert
    BeforePost = Table42BeforePost
    AfterDelete = Table42AfterDelete
    DatabaseName = 'Data\'
    DefaultIndex = False
    Exclusive = True
    TableName = 'MP02TMS.DB'
    Left = 392
    Top = 216
    object Table42KI: TStringField
      DisplayWidth = 14
      FieldName = 'KI'
      OnSetText = Table42KISetText
      Size = 4
    end
    object Table42Shifr: TStringField
      DisplayLabel = #1064#1080#1092#1088' '#1084#1072#1090#1077#1088#1080#1072#1083#1072
      DisplayWidth = 32
      FieldName = 'Shifr'
      OnSetText = Table42ShifrSetText
      EditMask = '00000000;1;_'
      Size = 8
    end
    object Table42Vp: TStringField
      DisplayLabel = #1042#1080#1076' '#1087#1088#1086#1076#1091#1082#1094#1080#1080
      FieldName = 'Vp'
      Visible = False
      OnValidate = Table42VpValidate
      Size = 1
    end
    object strngfldTable42Eim: TStringField
      DisplayLabel = #1045#1048
      DisplayWidth = 11
      FieldName = 'Eim'
      Size = 5
    end
    object strngfldTable42Norma: TStringField
      DisplayLabel = #1053#1086#1088#1084#1072' '#1085#1072' '#1084#1072#1096#1080#1085#1091
      DisplayWidth = 13
      FieldName = 'Norma'
      OnSetText = strngfldTable42NormaSetText
      EditMask = '!9999999,99999;1; '
      Size = 13
    end
    object strngfldTable42Kol_m: TStringField
      DisplayLabel = #1050#1086#1083'-'#1074#1086' '#1084#1072#1096#1080#1085' '#1074' 1 '#1084#1077#1089
      FieldName = 'Kol_m'
      EditMask = '!999;1; '
      Size = 3
    end
    object Table42Kol: TStringField
      DisplayLabel = #1050#1086#1083'-'#1074#1086' '#1085#1072' 1 '#1084#1077#1089
      DisplayWidth = 42
      FieldName = 'Kol'
      OnSetText = Table42KolSetText
      EditMask = '!9999999,999;1; '
      Size = 11
    end
    object strngfldTable42Kol_m2: TStringField
      DisplayLabel = #1050#1086#1083'-'#1074#1086' '#1084#1072#1096#1080#1085' '#1074#1086' 2 '#1084#1077#1089
      FieldName = 'Kol_m2'
      EditMask = '!999;1; '
      Size = 3
    end
    object Table42Kol2: TStringField
      DisplayLabel = #1050#1086#1083'-'#1074#1086' '#1085#1072' 2 '#1084#1077#1089
      DisplayWidth = 42
      FieldName = 'Kol2'
      OnSetText = Table42Kol2SetText
      EditMask = '!9999999,999;1; '
      Size = 11
    end
    object strngfldTable42Kol_m3: TStringField
      DisplayLabel = #1050#1086#1083'-'#1074#1086' '#1084#1072#1096#1080#1085' '#1074' 3 '#1084#1077#1089
      FieldName = 'Kol_m3'
      EditMask = '!999;1; '
      Size = 3
    end
    object strngfldTable42Kol3: TStringField
      DisplayLabel = #1050#1086#1083'-'#1074#1086' '#1074' 3 '#1084#1077#1089
      FieldName = 'Kol3'
      OnSetText = strngfldTable42Kol3SetText
      EditMask = '!9999999,999;1; '
      Size = 11
    end
    object Table42Cp: TStringField
      DisplayLabel = #1062#1077#1093' '#1087#1086#1083#1091#1095#1072#1090#1077#1083#1100
      DisplayWidth = 29
      FieldName = 'Cp'
      OnValidate = Table42CpValidate
      Size = 3
    end
    object Table42Znak: TStringField
      DefaultExpression = #39'0'#39
      DisplayLabel = #1047#1085#1072#1082' (0,1)'
      DisplayWidth = 10
      FieldName = 'Znak'
      Size = 1
    end
    object Table42Primech: TStringField
      DisplayLabel = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
      FieldName = 'Primech'
      Size = 50
    end
    object Table42Podrazd: TIntegerField
      DefaultExpression = '104'
      DisplayLabel = #1055#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1077
      FieldName = 'Podrazd'
      Visible = False
    end
  end
  object DataSource1: TDataSource
    DataSet = Table42
    OnDataChange = DataSource1DataChange
    Left = 292
    Top = 214
  end
  object Table42Ar: TTable
    TableName = 'NP01VNF2.DB'
    Left = 358
    Top = 214
    object Table42ArData: TDateField
      FieldName = 'Data'
    end
    object Table42ArNpok: TFloatField
      FieldName = 'Npok'
    end
    object Table42ArVp: TStringField
      FieldName = 'Vp'
      Size = 1
    end
    object Table42ArCp: TStringField
      FieldName = 'Cp'
      Size = 3
    end
    object Table42ArShifr: TStringField
      FieldName = 'Shifr'
      Size = 8
    end
    object Table42ArKi: TStringField
      FieldName = 'Ki'
      Size = 4
    end
    object Table42ArKol: TStringField
      FieldName = 'Kol'
      Size = 11
    end
    object Table42ArPodrazd: TFloatField
      FieldName = 'Podrazd'
    end
    object Table42ArZnak: TStringField
      FieldName = 'Znak'
      Size = 1
    end
  end
  object PrintDialog1: TPrintDialog
    Left = 325
    Top = 214
  end
  object ds1: TDataSource
    DataSet = qry1
    Left = 152
    Top = 536
  end
  object qry1: TQuery
    SQL.Strings = (
      
        'select cehl, kil, limk, olim from "\\nevz\nevz\asup_data1\bd-asu' +
        '\bd06ul.dbf"'
      'where cehl=" 49" and shml="00000122"')
    Left = 184
    Top = 536
  end
  object pm1: TPopupMenu
    Left = 336
    Top = 248
    object N14: TMenuItem
      Action = edtcpy1
    end
    object N12: TMenuItem
      Action = edtct1
    end
    object N15: TMenuItem
      Action = edtpst1
    end
    object N13: TMenuItem
      Caption = '-'
    end
    object N9: TMenuItem
      Caption = #1042#1099#1076#1077#1083#1080#1090#1100' '#1074#1089#1077' '#1089#1090#1088#1086#1082#1080
      ShortCut = 16449
      OnClick = N9Click
    end
    object N4: TMenuItem
      Caption = '-'
    end
    object N1: TMenuItem
      Caption = #1050#1086#1087#1080#1088#1086#1074#1072#1090#1100' '#1074#1099#1076#1077#1083#1077#1085#1085#1099#1077' '#1089#1090#1088#1086#1082#1080
      OnClick = btn1Click
    end
    object N5: TMenuItem
      Caption = #1042#1089#1090#1072#1074#1080#1090#1100' '#1074#1089#1077
      OnClick = btn3Click
    end
    object N6: TMenuItem
      Caption = #1042#1089#1090#1072#1074#1080#1090#1100' '#1084#1072#1090#1077#1088#1080#1072#1083#1099
      OnClick = btn4Click
    end
    object N8: TMenuItem
      Caption = '-'
    end
    object N2: TMenuItem
      Caption = #1050#1086#1087#1080#1088#1086#1074#1072#1090#1100' '#1074#1099#1076#1077#1083#1077#1085#1085#1099#1077' '#1089#1090#1088#1086#1082#1080' '#1082#1072#1082' '#1090#1077#1082#1089#1090
      OnClick = N2Click
    end
    object N3: TMenuItem
      Caption = #1050#1086#1087#1080#1088#1086#1074#1072#1090#1100' '#1074#1089#1077' '#1082#1072#1082' '#1090#1077#1082#1089#1090
      OnClick = N3Click
    end
    object N7: TMenuItem
      Caption = #1042#1089#1090#1072#1074#1080#1090#1100' '#1082#1072#1082' '#1090#1077#1082#1089#1090
      OnClick = btnMSOClick
    end
    object N10: TMenuItem
      Caption = '-'
    end
    object N11: TMenuItem
      Caption = #1047#1072#1087#1086#1083#1085#1080#1090#1100' '#1089#1090#1086#1083#1073#1077#1094
      OnClick = N11Click
    end
  end
  object actlst1: TActionList
    Left = 304
    Top = 248
    object edtct1: TEditCut
      Category = 'Edit'
      Caption = #1042#1099#1088#1077#1079#1072#1090#1100
      Hint = 'Cut|Cuts the selection and puts it on the Clipboard'
      ImageIndex = 0
      ShortCut = 16472
    end
    object edtcpy1: TEditCopy
      Category = 'Edit'
      Caption = #1050#1086#1087#1080#1088#1086#1074#1072#1090#1100
      Hint = 'Copy|Copies the selection and puts it on the Clipboard'
      ImageIndex = 1
      ShortCut = 16451
    end
    object edtpst1: TEditPaste
      Category = 'Edit'
      Caption = #1042#1089#1090#1072#1074#1080#1090#1100
      Hint = 'Paste|Inserts Clipboard contents'
      ImageIndex = 2
      ShortCut = 16470
    end
  end
  object tmr1: TTimer
    Enabled = False
    OnTimer = tmr1Timer
    Left = 368
    Top = 248
  end
end
