object FormEdit: TFormEdit
  Left = 0
  Top = 131
  ActiveControl = ComboBoxName
  BorderStyle = bsSingle
  Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077' '#1090#1072#1073#1083#1080#1094#1099
  ClientHeight = 499
  ClientWidth = 876
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  Scaled = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  DesignSize = (
    876
    499)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 112
    Top = 389
    Width = 53
    Height = 13
    Anchors = [akLeft, akBottom]
    Caption = #1052#1072#1088#1096#1088#1091#1090#1099
  end
  object Label2: TLabel
    Left = 0
    Top = 389
    Width = 19
    Height = 13
    Anchors = [akLeft, akBottom]
    Caption = #1062#1077#1093
  end
  object Label3: TLabel
    Left = 10
    Top = 61
    Width = 105
    Height = 13
    Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1073#1072#1079#1099
  end
  object Label4: TLabel
    Left = 248
    Top = 61
    Width = 42
    Height = 13
    Caption = #1050#1074#1072#1088#1090#1072#1083
  end
  object Label5: TLabel
    Left = 336
    Top = 61
    Width = 83
    Height = 13
    Caption = #1055#1088#1080#1084#1077#1085#1103#1077#1084#1086#1089#1090#1100
  end
  object LabelWait: TLabel
    Left = 8
    Top = 477
    Width = 97
    Height = 13
    Anchors = [akLeft, akBottom]
    AutoSize = False
  end
  object lbl3: TLabel
    Left = 0
    Top = 8
    Width = 43
    Height = 13
    Caption = #1050#1086#1076' '#1080#1079#1076'.'
  end
  object lbl4: TLabel
    Left = 0
    Top = 32
    Width = 39
    Height = 13
    Caption = #1063#1077#1088#1090#1077#1078
  end
  object btn3: TSpeedButton
    Left = 144
    Top = 16
    Width = 49
    Height = 33
    AllowAllUp = True
    GroupIndex = 2
    Caption = #1060#1080#1083#1100#1090#1088
    OnClick = btn3Click
  end
  object lbl5: TLabel
    Left = 408
    Top = 480
    Width = 26
    Height = 16
    Anchors = [akLeft, akBottom]
    Caption = 'lbl5'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 102
    Width = 876
    Height = 251
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 9
    DesignSize = (
      876
      251)
    object Label6: TLabel
      Left = 4
      Top = 233
      Width = 868
      Height = 16
      Alignment = taCenter
      Anchors = [akLeft, akRight, akBottom]
      AutoSize = False
      Caption = 
        'F4 -'#1058#1077#1082#1089#1090'   Tab -'#1055#1077#1088#1077#1084#1077#1097'. ->  Shift+Tab -'#1055#1077#1088#1077#1084#1077#1097' <-   Ins -'#1042#1089#1090#1072#1074 +
        #1080#1090#1100' '#1089#1090#1088'.   Ctrl+Del -'#1059#1076#1072#1083#1080#1090#1100' '#1089#1090#1088'.   Home -1-'#1099#1081' '#1089#1090'.   End -'#1055#1086#1089#1083'.'#1089 +
        #1090'.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object txt1: TStaticText
      Left = 203
      Top = 10
      Width = 71
      Height = 24
      Alignment = taCenter
      AutoSize = False
      BevelKind = bkTile
      Caption = #1040#1087#1088#1077#1083#1100
      TabOrder = 0
    end
    object txt2: TStaticText
      Left = 272
      Top = 10
      Width = 71
      Height = 24
      Alignment = taCenter
      AutoSize = False
      BevelKind = bkTile
      Caption = #1052#1072#1081
      TabOrder = 1
    end
    object txt3: TStaticText
      Left = 340
      Top = 10
      Width = 71
      Height = 24
      Alignment = taCenter
      AutoSize = False
      BevelKind = bkTile
      Caption = #1048#1102#1085#1100
      TabOrder = 2
    end
    object txt5: TStaticText
      Left = 203
      Top = 32
      Width = 40
      Height = 20
      Alignment = taCenter
      AutoSize = False
      BevelKind = bkTile
      Caption = #1084#1072#1096#1080#1085
      TabOrder = 3
    end
    object txt6: TStaticText
      Left = 241
      Top = 32
      Width = 33
      Height = 20
      Alignment = taCenter
      AutoSize = False
      BevelKind = bkTile
      Caption = #1080#1090#1086#1075#1086
      TabOrder = 4
    end
  end
  object ListBoxTM: TListBox
    Left = 112
    Top = 405
    Width = 145
    Height = 89
    Anchors = [akLeft, akBottom]
    ExtendedSelect = False
    ItemHeight = 13
    TabOrder = 2
    OnDblClick = ListBoxTMDblClick
    OnKeyDown = ListBoxTMKeyDown
  end
  object EditZeh: TEdit
    Left = 0
    Top = 405
    Width = 105
    Height = 21
    Anchors = [akLeft, akBottom]
    TabOrder = 1
    OnKeyDown = EditZehKeyDown
  end
  object ButtonTM: TButton
    Left = 0
    Top = 437
    Width = 105
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = #1053#1072#1081#1090#1080' '#1084#1072#1088#1096#1088#1091#1090#1099
    TabOrder = 0
    OnClick = ButtonTMClick
  end
  object MemoTitle: TMemo
    Left = 200
    Top = 4
    Width = 524
    Height = 55
    Alignment = taCenter
    Anchors = [akLeft, akTop, akRight]
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
    ScrollBars = ssVertical
    TabOrder = 4
  end
  object BitBtn1: TBitBtn
    Left = 792
    Top = 469
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = '&'#1042#1099#1093#1086#1076
    TabOrder = 5
    Kind = bkClose
  end
  object ComboBoxName: TComboBox
    Left = 8
    Top = 77
    Width = 225
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 6
    OnSelect = ComboBoxNameSelect
    Items.Strings = (
      #1055#1086#1076#1077#1090#1072#1083#1100#1085#1099#1081' '#1089#1086#1089#1090#1072#1074' '#1080#1079#1076#1077#1083#1080#1081' '#1082#1074#1072#1088#1090#1072#1083#1100#1085#1086#1075#1086' '#1087#1083#1072#1085#1072
      #1053#1077#1087#1086#1089#1088#1077#1076#1089#1090#1074#1077#1085#1085#1072#1103' '#1087#1088#1080#1084#1077#1085#1103#1077#1084#1086#1089#1090#1100)
  end
  object ComboBoxQuarter: TComboBox
    Left = 240
    Top = 77
    Width = 81
    Height = 21
    Style = csDropDownList
    Enabled = False
    ItemHeight = 13
    TabOrder = 7
    OnSelect = ComboBoxQuarterSelect
    Items.Strings = (
      '1 '#1082#1074'.'
      '2 '#1082#1074'.'
      '3 '#1082#1074'.'
      '4 '#1082#1074'.')
  end
  object ComboBoxPrim: TComboBox
    Left = 328
    Top = 77
    Width = 145
    Height = 21
    Style = csDropDownList
    Enabled = False
    ItemHeight = 13
    TabOrder = 8
    OnSelect = ComboBoxPrimSelect
    Items.Strings = (
      #1058#1077#1082#1091#1097#1072#1103
      #1050#1074#1072#1088#1090#1072#1083#1100#1085#1072#1103)
  end
  object ButtonSortNum: TButton
    Left = 264
    Top = 414
    Width = 97
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = '<- '#1057#1086#1088#1090'. '#1087#1086' '#1085#1086#1084#1077#1088#1091
    TabOrder = 10
    OnClick = ButtonSortClick
  end
  object ButtonSortKod: TButton
    Left = 264
    Top = 461
    Width = 97
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = '<- '#1057#1086#1088#1090'. '#1087#1086' '#1082#1086#1076#1091
    TabOrder = 11
    OnClick = ButtonSortClick
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 154
    Width = 876
    Height = 169
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = DataSource1
    Options = [dgEditing, dgAlwaysShowEditor, dgIndicator, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnColExit = DBGrid1ColExit
    OnDrawColumnCell = DBGrid1DrawColumnCell
    OnKeyDown = DBGrid1KeyDown
    Columns = <
      item
        Expanded = False
        FieldName = 'Num'
        Title.Alignment = taCenter
        Title.Caption = #8470#8470
        Width = 30
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Kod'
        Title.Alignment = taCenter
        Title.Caption = #1050#1086#1076
        Width = 34
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Chert'
        Title.Alignment = taCenter
        Title.Caption = #1063#1077#1088#1090#1077#1078
        Width = 79
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Kol_1'
        Title.Caption = #1053#1072' 1 '#1084#1072#1096#1080#1085#1091
        Width = 44
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Kol1_v'
        Title.Alignment = taCenter
        Title.Caption = #1084#1072#1096#1080#1085
        Width = 37
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Kol1'
        Title.Alignment = taCenter
        Title.Caption = #1080#1090#1086#1075#1086' 1'
        Width = 29
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Kol2_v'
        Title.Alignment = taCenter
        Title.Caption = #1084#1072#1096#1080#1085
        Width = 37
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Kol2'
        Title.Alignment = taCenter
        Title.Caption = #1080#1090#1086#1075#1086' 2'
        Width = 29
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Kol3_v'
        Title.Alignment = taCenter
        Title.Caption = #1084#1072#1096#1080#1085
        Width = 37
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Kol3'
        Title.Alignment = taCenter
        Title.Caption = #1080#1090#1086#1075#1086' 3'
        Width = 29
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Kol'
        ReadOnly = True
        Title.Caption = #1042#1089#1077#1075#1086
        Width = 32
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'TM1'
        Width = 21
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'TM2'
        Width = 21
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'TM3'
        Width = 21
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'TM4'
        Width = 21
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'TM5'
        Width = 21
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'TM6'
        Width = 21
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'TM7'
        Width = 21
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'TM8'
        Width = 21
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'TM9'
        Width = 21
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'TM10'
        Width = 21
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'TM11'
        Width = 21
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'TM12'
        Width = 21
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Primech'
        Title.Alignment = taCenter
        Title.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
        Width = 125
        Visible = True
      end>
  end
  object EditMarsh: TEdit
    Left = 440
    Top = 112
    Width = 267
    Height = 42
    AutoSize = False
    BevelKind = bkTile
    BorderStyle = bsNone
    ParentColor = True
    TabOrder = 12
    Text = 'EditMarsh'
  end
  object EditPrim: TEdit
    Left = 705
    Top = 112
    Width = 127
    Height = 42
    AutoSize = False
    BevelKind = bkTile
    BorderStyle = bsNone
    ParentColor = True
    TabOrder = 13
    Text = 'EditMarsh'
  end
  object BitBtnUndo: TBitBtn
    Left = 480
    Top = 75
    Width = 23
    Height = 23
    Enabled = False
    TabOrder = 14
    Visible = False
    Glyph.Data = {
      56070000424D5607000000000000360400002800000028000000140000000100
      0800000000002003000000000000000000000001000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
      A6000020400000206000002080000020A0000020C0000020E000004000000040
      20000040400000406000004080000040A0000040C0000040E000006000000060
      20000060400000606000006080000060A0000060C0000060E000008000000080
      20000080400000806000008080000080A0000080C0000080E00000A0000000A0
      200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
      200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
      200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
      20004000400040006000400080004000A0004000C0004000E000402000004020
      20004020400040206000402080004020A0004020C0004020E000404000004040
      20004040400040406000404080004040A0004040C0004040E000406000004060
      20004060400040606000406080004060A0004060C0004060E000408000004080
      20004080400040806000408080004080A0004080C0004080E00040A0000040A0
      200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
      200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
      200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
      20008000400080006000800080008000A0008000C0008000E000802000008020
      20008020400080206000802080008020A0008020C0008020E000804000008040
      20008040400080406000804080008040A0008040C0008040E000806000008060
      20008060400080606000806080008060A0008060C0008060E000808000008080
      20008080400080806000808080008080A0008080C0008080E00080A0000080A0
      200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
      200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
      200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
      2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
      2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
      2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
      2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
      2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
      2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
      2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00030303030303
      0303030303030303030303030303030303030303030303030303030303030303
      0303030303030303030303030303030303030303030303030303030303030303
      0303030303030303030303030303030303030303030303030303030303030303
      030303030303030303FFFF030303030303030303030303030303030307DAED03
      03030303030303030303030303030303A4A4A4FFFF0303030303030303030303
      03030303DAD8D0EC03030303030303030303030303030303A4A4A4A4FFFF0303
      030303030303030303030303D9D8D8D8F5030303030303030303030303030303
      A4A4A4A4A4FFFF0303030303030303030303030307D9D8D8D907030303030303
      0303030303030303A4A4A4A4A4A4FF030303030303030303030303030307D9D8
      D8E303030303030303FFFFFFFFFFFFFFFFA4A4A4A4A4FFFF03030303D0D8D8D8
      D8D8D8D8E303F5D0D8D0070303030303A4A4A4A4A4A4A4A4A4FFA4A4A4A4A4FF
      03030303D8E0D8D8D8D8D8D8DA0303E3D8D8E30303030303A4A4A4A4A4A4A4A4
      A4FF03A4A4A4A4FF03030303D8E0E0D8D0E3E3E307030307D0D8D80303030303
      A4A4A4A4A4A4A4A4A40303A4A4A4A4FF03030303D8E0D8E0D8E3030303030303
      DAD8D00703030303A4A4A4A4A4A4FFFFFF030303A4A4A4FF03030303D8E8D8D8
      E0D8DA0703030303DAD8D00703030303A4A4A4A4A4A4A4A4FFFF0303A4A4A4FF
      03030303D8E8E2ECD8E0D8D9F50303F5D0D8D80303030303A4A4A4A4A4A4A4A4
      A4FFFFA4A4A4A4FF03030303E1EAE203ECD8E0E0D8DAE3D0D8D8E30303030303
      A4A4A4FFA4A4A4A4A4A4A4A4A4A4A4FF03030303E2F3E20303F5D9E0E0E0E0D8
      D8D0070303030303A4A4A4FF03A4A4A4A4A4A4A4A4A4FF0303030303E3E2ED03
      030307E3D8D8D8D8DAF5030303030303A4A4A4030303A4A4A4A4A4A4A4A40303
      03030303030303030303030303EDED0703030303030303030303030303030303
      03A4A4A403030303030303030303030303030303030303030303030303030303
      0303030303030303030303030303030303030303030303030303030303030303
      0303030303030303030303030303030303030303030303030303}
    NumGlyphs = 2
  end
  object ButtonCopy: TButton
    Left = 729
    Top = 5
    Width = 71
    Height = 24
    Anchors = [akTop, akRight]
    Caption = #1050#1086#1087#1080#1088#1086#1074#1072#1090#1100
    TabOrder = 15
    OnClick = ButtonCopyClick
  end
  object ButtonPaste: TButton
    Left = 729
    Top = 34
    Width = 71
    Height = 24
    Anchors = [akTop, akRight]
    Caption = #1042#1089#1090#1072#1074#1080#1090#1100
    TabOrder = 16
    OnClick = ButtonPasteClick
  end
  object txt4: TStaticText
    Left = 158
    Top = 112
    Width = 47
    Height = 42
    Alignment = taCenter
    AutoSize = False
    BevelKind = bkTile
    Caption = #1040#1087#1088#1077#1083#1100
    TabOrder = 17
  end
  object txt7: TStaticText
    Left = 272
    Top = 134
    Width = 40
    Height = 20
    Alignment = taCenter
    AutoSize = False
    BevelKind = bkTile
    Caption = #1084#1072#1096#1080#1085
    TabOrder = 18
  end
  object txt8: TStaticText
    Left = 310
    Top = 134
    Width = 32
    Height = 20
    Alignment = taCenter
    AutoSize = False
    BevelKind = bkTile
    Caption = #1080#1090#1086#1075#1086
    TabOrder = 19
  end
  object txt9: TStaticText
    Left = 340
    Top = 134
    Width = 40
    Height = 20
    Alignment = taCenter
    AutoSize = False
    BevelKind = bkTile
    Caption = #1084#1072#1096#1080#1085
    TabOrder = 20
  end
  object txt10: TStaticText
    Left = 378
    Top = 134
    Width = 32
    Height = 20
    Alignment = taCenter
    AutoSize = False
    BevelKind = bkTile
    Caption = #1080#1090#1086#1075#1086
    TabOrder = 21
  end
  object txt11: TStaticText
    Left = 408
    Top = 112
    Width = 34
    Height = 42
    Alignment = taCenter
    AutoSize = False
    BevelKind = bkTile
    TabOrder = 22
  end
  object txt12: TStaticText
    Left = 78
    Top = 112
    Width = 82
    Height = 42
    Alignment = taCenter
    AutoSize = False
    BevelKind = bkTile
    Caption = #1063#1077#1088#1090#1077#1078
    TabOrder = 23
  end
  object txt13: TStaticText
    Left = 43
    Top = 112
    Width = 37
    Height = 42
    Alignment = taCenter
    AutoSize = False
    BevelKind = bkTile
    Caption = #1050#1086#1076
    TabOrder = 24
  end
  object txt14: TStaticText
    Left = 0
    Top = 112
    Width = 45
    Height = 42
    Alignment = taCenter
    AutoSize = False
    BevelKind = bkTile
    Caption = #8470#8470
    TabOrder = 25
  end
  object grp1: TGroupBox
    Left = 411
    Top = 360
    Width = 465
    Height = 105
    Anchors = [akRight, akBottom]
    TabOrder = 26
    Visible = False
    object lbl1: TLabel
      Left = 8
      Top = 16
      Width = 449
      Height = 17
      AutoSize = False
    end
    object lbl2: TLabel
      Left = 8
      Top = 88
      Width = 417
      Height = 13
      AutoSize = False
      Caption = 
        #1048#1085#1092#1086#1088#1084#1072#1094#1080#1103' '#1086' '#1079#1072#1087#1083#1072#1085#1080#1088#1086#1074#1072#1085#1085#1086#1084' '#1082#1086#1083#1080#1095#1077#1089#1090#1074#1077' '#1080#1079#1076#1077#1083#1080#1081' '#1085#1072' '#1082#1074#1072#1088#1090#1072#1083' '#1086#1090#1089#1091#1090 +
        #1089#1090#1074#1091#1077#1090'!'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Visible = False
    end
    object strngrd1: TStringGrid
      Left = 8
      Top = 32
      Width = 448
      Height = 52
      ColCount = 6
      FixedCols = 0
      RowCount = 2
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goAlwaysShowEditor]
      ScrollBars = ssNone
      TabOrder = 0
      ColWidths = (
        42
        100
        76
        80
        77
        64)
    end
  end
  object btn1: TButton
    Left = 307
    Top = 368
    Width = 97
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = #1053#1072#1081#1090#1080' '#1074' '#1087#1083#1072#1085#1077' ->'
    TabOrder = 27
    Visible = False
    OnClick = btn1Click
  end
  object btnExcel2: TButton
    Left = 728
    Top = 72
    Width = 75
    Height = 25
    Caption = 'Excel'
    TabOrder = 28
    OnClick = btnExcel2Click
  end
  object se1: TSpinEdit
    Left = 48
    Top = 8
    Width = 65
    Height = 22
    MaxLength = 4
    MaxValue = 9999
    MinValue = 0
    TabOrder = 29
    Value = 0
    OnExit = se1Exit
  end
  object medt1: TMaskEdit
    Left = 48
    Top = 32
    Width = 89
    Height = 21
    EditMask = '999 999999 99;1;_'
    MaxLength = 13
    TabOrder = 30
    Text = '             '
  end
  object QueryTM: TQuery
    Left = 176
    Top = 192
  end
  object Table1: TTable
    BeforeEdit = Table1BeforeEdit
    BeforePost = Table1BeforePost
    DatabaseName = 'd:\temp\2'
    DefaultIndex = False
    TableName = 'NP01F1.DB'
    Left = 232
    Top = 184
    object Table1Num: TAutoIncField
      FieldName = 'Num'
      ReadOnly = True
    end
    object Table1Kod: TIntegerField
      FieldName = 'Kod'
    end
    object Table1Chert: TStringField
      FieldName = 'Chert'
      OnSetText = Table1ChertSetText
      Size = 13
    end
    object Table1Kol: TIntegerField
      FieldName = 'Kol'
    end
    object Table1Kol1: TIntegerField
      FieldName = 'Kol1'
    end
    object Table1Kol2: TIntegerField
      FieldName = 'Kol2'
    end
    object Table1Kol3: TIntegerField
      FieldName = 'Kol3'
    end
    object Table1TM1: TStringField
      FieldName = 'TM1'
      Size = 2
    end
    object Table1TM2: TStringField
      FieldName = 'TM2'
      Size = 2
    end
    object Table1TM3: TStringField
      FieldName = 'TM3'
      Size = 2
    end
    object Table1TM4: TStringField
      FieldName = 'TM4'
      Size = 2
    end
    object Table1TM5: TStringField
      FieldName = 'TM5'
      Size = 2
    end
    object Table1TM6: TStringField
      FieldName = 'TM6'
      Size = 2
    end
    object Table1TM7: TStringField
      FieldName = 'TM7'
      Size = 2
    end
    object Table1TM8: TStringField
      FieldName = 'TM8'
      Size = 2
    end
    object Table1TM9: TStringField
      FieldName = 'TM9'
      Size = 2
    end
    object Table1TM10: TStringField
      FieldName = 'TM10'
      Size = 2
    end
    object Table1TM11: TStringField
      FieldName = 'TM11'
      Size = 2
    end
    object Table1TM12: TStringField
      FieldName = 'TM12'
      Size = 2
    end
    object Table1Primech: TStringField
      FieldName = 'Primech'
      Size = 30
    end
    object intgrfldTable1Kol1_v: TIntegerField
      FieldName = 'Kol1_v'
    end
    object intgrfldTable1Kol2_v: TIntegerField
      FieldName = 'Kol2_v'
    end
    object intgrfldTable1Kol3_v: TIntegerField
      FieldName = 'Kol3_v'
    end
    object intgrfldTable1Kol_1: TIntegerField
      FieldName = 'Kol_1'
    end
  end
  object DataSource1: TDataSource
    DataSet = Table1
    OnDataChange = DataSource1DataChange
    Left = 128
    Top = 192
  end
end
