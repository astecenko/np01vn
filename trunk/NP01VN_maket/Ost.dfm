object frm42: Tfrm42
  Left = 376
  Top = 67
  BorderStyle = bsSingle
  Caption = #1050#1086#1088#1088#1077#1082#1090#1080#1088#1086#1074#1082#1072' '#1083#1080#1084#1080#1090#1072' '#1074' '#1085#1086#1084#1077#1085#1082#1083#1072#1090#1091#1088#1077' '#1058#1052#1062
  ClientHeight = 601
  ClientWidth = 879
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
    879
    601)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 93
    Top = 442
    Width = 610
    Height = 13
    Alignment = taCenter
    Anchors = [akLeft, akRight, akBottom]
    Caption = 
      'Esc -'#1054#1090#1084#1077#1085#1072' '#1088#1077#1076'.  Tab -'#1055#1077#1088#1077#1084#1077#1097'. ->  Shift+Tab -'#1055#1077#1088#1077#1084#1077#1097' <-  Ins -' +
      #1042#1089#1090#1072#1074#1080#1090#1100' '#1089#1090#1088'. Ctrl+Del -'#1059#1076#1072#1083#1080#1090#1100' '#1089#1090#1088'.'
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
    Left = 772
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
    Width = 449
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
    Width = 879
    Height = 297
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = DataSource1
    Options = [dgEditing, dgAlwaysShowEditor, dgIndicator, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    PopupMenu = pm1
    ReadOnly = True
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
        Title.Alignment = taCenter
        Width = 37
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Norma'
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
        Width = 78
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
        Width = 77
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
    Left = 800
    Top = 570
    Width = 76
    Height = 28
    Anchors = [akRight, akBottom]
    Caption = #1042#1099#1093#1086#1076
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    Kind = bkClose
  end
  object mmo1: TMemo
    Left = 256
    Top = 2
    Width = 411
    Height = 71
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
    Width = 853
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
      Left = 256
      Top = 0
      Width = 324
      Height = 18
      Alignment = taCenter
      AutoSize = False
      BevelKind = bkTile
      Caption = #1050#1086#1083'-'#1074#1086' '#1084#1072#1090#1077#1088'-'#1083#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
    end
    object txt5: TStaticText
      Left = 256
      Top = 16
      Width = 113
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
      Left = 367
      Top = 16
      Width = 111
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
      Left = 578
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
      Left = 624
      Top = 0
      Width = 50
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
      Left = 672
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
      Width = 61
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
      Left = 256
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
      Left = 288
      Top = 32
      Width = 81
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
      Left = 367
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
      Left = 398
      Top = 32
      Width = 80
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
      Left = 476
      Top = 16
      Width = 104
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
      Left = 507
      Top = 32
      Width = 73
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
      Left = 476
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
  end
  object btn1: TBitBtn
    Left = 673
    Top = 1
    Width = 200
    Height = 20
    Anchors = [akTop, akRight]
    Caption = #1050#1086#1087#1080#1088#1086#1074#1072#1090#1100
    Enabled = False
    TabOrder = 4
    OnClick = btn1Click
  end
  object btn3: TBitBtn
    Left = 673
    Top = 21
    Width = 200
    Height = 20
    Anchors = [akTop, akRight]
    Caption = #1042#1089#1090#1072#1074#1080#1090#1100' '#1074#1089#1077
    Enabled = False
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
    Left = 673
    Top = 41
    Width = 200
    Height = 20
    Anchors = [akTop, akRight]
    Caption = #1042#1089#1090#1072#1074#1080#1090#1100' '#1084#1072#1090#1077#1088#1080#1072#1083#1099
    Enabled = False
    TabOrder = 8
    OnClick = btn4Click
  end
  object medt1: TMaskEdit
    Left = 48
    Top = 32
    Width = 63
    Height = 21
    EditMask = '99999999;1;_'
    MaxLength = 8
    TabOrder = 9
    Text = '        '
  end
  object se1: TSpinEdit
    Left = 48
    Top = 4
    Width = 65
    Height = 22
    MaxLength = 4
    MaxValue = 9999
    MinValue = 0
    TabOrder = 10
    Value = 0
    OnExit = se1Exit
  end
  object btnExcel: TButton
    Left = 673
    Top = 61
    Width = 200
    Height = 20
    Caption = 'Excel'
    TabOrder = 11
    OnClick = btnExcelClick
  end
  object grp1: TGroupBox
    Left = 168
    Top = 0
    Width = 81
    Height = 80
    Caption = ' '#1057#1086#1088#1090#1080#1088#1086#1074#1082#1072' '
    TabOrder = 12
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
  object Table42: TTable
    BeforeInsert = Table42BeforeInsert
    AfterInsert = Table42AfterInsert
    BeforePost = Table42BeforePost
    AfterDelete = Table42AfterDelete
    DatabaseName = 'Data\'
    ReadOnly = True
    TableName = 'MP02TMS.DB'
    Left = 392
    Top = 216
    object Table42KI: TStringField
      DisplayLabel = #1050#1086#1076' '#1080#1079#1076#1077#1083#1080#1103
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
      FieldName = 'Norma'
      OnSetText = strngfldTable42NormaSetText
      EditMask = '!999,99999;1; '
      Size = 9
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
      ReadOnly = True
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
    Left = 240
    Top = 240
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
      Enabled = False
      OnClick = btn1Click
    end
    object N5: TMenuItem
      Caption = #1042#1089#1090#1072#1074#1080#1090#1100' '#1074#1089#1077
      Enabled = False
      OnClick = btn3Click
    end
    object N6: TMenuItem
      Caption = #1042#1089#1090#1072#1074#1080#1090#1100' '#1084#1072#1090#1077#1088#1080#1072#1083#1099
      Enabled = False
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
  end
  object actlst1: TActionList
    Left = 104
    Top = 208
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
  object dlgSave1: TSaveDialog
    DefaultExt = '.xls'
    Filter = 'Ms Excel 2003 (*.xls)|*.xls|'#1042#1089#1077' '#1092#1072#1081#1083#1099' (*.*)|*.*'
    Left = 432
    Top = 280
  end
end
