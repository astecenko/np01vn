object FormEdit: TFormEdit
  Left = 152
  Top = 98
  ActiveControl = ComboBoxName
  BorderStyle = bsSingle
  Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077' '#1090#1072#1073#1083#1080#1094#1099
  ClientHeight = 499
  ClientWidth = 916
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
    916
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
    Top = 69
    Width = 105
    Height = 13
    Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1073#1072#1079#1099
  end
  object Label4: TLabel
    Left = 368
    Top = 69
    Width = 42
    Height = 13
    Caption = #1050#1074#1072#1088#1090#1072#1083
  end
  object Label5: TLabel
    Left = 456
    Top = 69
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
    Top = 35
    Width = 39
    Height = 13
    Caption = #1063#1077#1088#1090#1077#1078
  end
  object lbl4: TLabel
    Left = 0
    Top = 8
    Width = 43
    Height = 13
    Caption = #1050#1086#1076' '#1080#1079#1076'.'
  end
  object btn3: TSpeedButton
    Left = 144
    Top = 8
    Width = 57
    Height = 33
    AllowAllUp = True
    GroupIndex = 1
    Caption = #1060#1080#1083#1100#1090#1088
    OnClick = btn3Click
  end
  object lblRecCount: TLabel
    Left = 836
    Top = 88
    Width = 33
    Height = 16
    Hint = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1079#1072#1087#1080#1089#1077#1081
    Anchors = [akTop, akRight]
    Caption = '0000'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
  end
  object lblChertTitle: TLabel
    Left = 0
    Top = 352
    Width = 337
    Height = 33
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
  object GroupBox1: TGroupBox
    Left = 0
    Top = 102
    Width = 916
    Height = 251
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 9
    DesignSize = (
      916
      251)
    object Label6: TLabel
      Left = 72
      Top = 224
      Width = 793
      Height = 25
      Hint = 
        'Ctrl+'#1042#1074#1077#1088#1093', Ctrl+Home, Ctrl+PageUp - '#1053#1072' '#1087#1077#1088#1074#1091#1102' '#1089#1090#1088#1086#1082#1091' '#1090#1072#1073#1083#1080#1094#1099' '#1089' ' +
        #1086#1090#1084#1077#1085#1086#1081' '#1074#1099#1073#1086#1088#1072' '#1089#1090#1088#1086#1082#1080#13#10'Ctrl+'#1042#1085#1080#1079', Ctrl+End, Ctrl+PageDown - '#1053#1072' '#1087 +
        #1086#1089#1083#1077#1076#1085#1102#1102' '#1089#1090#1088#1086#1082#1091' '#1090#1072#1073#1083#1080#1094#1099' '#1089' '#1086#1090#1084#1077#1085#1086#1081' '#1074#1099#1073#1086#1088#1072' '#1089#1090#1088#1086#1082#1080#13#10'PageUp - '#1042#1074#1077#1088#1093' ' +
        #1085#1072' '#1086#1076#1080#1085' '#1082#1088#1072#1085' '#1090#1072#1073#1083#1080#1094#1099#13#10'PageDown - '#1042#1085#1080#1079' '#1085#1072' '#1086#1076#1080#1085' '#1082#1088#1072#1085' '#1090#1072#1073#1083#1080#1094#1099#13#10'Home' +
        ', Ctrl+'#1042#1083#1077#1074#1086' - '#1053#1072' '#1087#1077#1088#1074#1099#1081' '#1089#1090#1086#1083#1073#1077#1094' '#1089#1090#1088#1086#1082#1080#13#10'End, Ctrl+'#1042#1087#1088#1072#1074#1086' - '#1053#1072' '#1087 +
        #1086#1089#1083#1077#1076#1085#1080#1081' '#1089#1090#1086#1083#1073#1077#1094' '#1089#1090#1088#1086#1082#1080#13#10'Escape - '#1054#1090#1084#1077#1085#1072' '#1085#1077' '#1087#1086#1076#1090#1074#1077#1088#1078#1076#1077#1085#1085#1099#1093' '#1080#1079#1084#1077#1085 +
        #1077#1085#1080#1081#13#10'F2 - '#1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100' '#1103#1095#1077#1081#1082#1091
      Alignment = taCenter
      Anchors = [akLeft, akRight, akBottom]
      AutoSize = False
      Caption = 
        'F4 -'#1058#1077#1082#1089#1090'   F2 -'#1056#1077#1076'.'#1103#1095#1077#1081#1082#1080'   Tab -'#1055#1077#1088#1077#1084#1077#1097'. ->  Shift+Tab -'#1055#1077#1088#1077#1084#1077 +
        #1097' <-   Ins -'#1042#1089#1090#1072#1074#1080#1090#1100' '#1089#1090#1088'.   Ctrl+Del -'#1059#1076#1072#1083#1080#1090#1100' '#1089#1090#1088'.   Home -1-'#1099#1081' ' +
        #1089#1090'.   End -'#1055#1086#1089#1083'.'#1089#1090'.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      WordWrap = True
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
    object btn5: TButton
      Left = 896
      Top = 232
      Width = 18
      Height = 18
      Hint = #1054#1095#1080#1089#1090#1080#1090#1100' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1102' '#1086#13#10#1087#1088#1077#1076#1099#1076#1091#1097#1077#1084' '#1087#1088#1080#1084#1077#1095#1072#1085#1080#1080
      Anchors = [akRight, akBottom]
      Caption = 'C'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 5
      OnClick = btn5Click
    end
  end
  object ListBoxTM: TListBox
    Left = 112
    Top = 405
    Width = 225
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
    Left = 208
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
    Left = 832
    Top = 469
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = '&'#1042#1099#1093#1086#1076
    TabOrder = 5
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
  object ComboBoxName: TComboBox
    Left = 8
    Top = 82
    Width = 345
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 6
    OnSelect = ComboBoxNameSelect
    Items.Strings = (
      #1055#1086#1076#1077#1090#1072#1083#1100#1085#1099#1081' '#1089#1086#1089#1090#1072#1074' '#1080#1079#1076#1077#1083#1080#1081' '#1082#1074#1072#1088#1090#1072#1083#1100#1085#1086#1075#1086' '#1087#1083#1072#1085#1072
      #1053#1077#1087#1086#1089#1088#1077#1076#1089#1090#1074#1077#1085#1085#1072#1103' '#1087#1088#1080#1084#1077#1085#1103#1077#1084#1086#1089#1090#1100' ('#1050#1086#1085#1089#1090#1088#1091#1082#1090'. '#1089#1087#1077#1094#1080#1092#1080#1082'.)')
  end
  object ComboBoxQuarter: TComboBox
    Left = 360
    Top = 82
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
    Left = 448
    Top = 82
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
    Left = 352
    Top = 422
    Width = 89
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = #1057#1086#1088#1090'. '#1087#1086' '#8470#1087'.'#1087'.'
    TabOrder = 10
    OnClick = ButtonSortClick
  end
  object ButtonSortKod: TButton
    Left = 352
    Top = 464
    Width = 89
    Height = 22
    Anchors = [akLeft, akBottom]
    Caption = #1057#1086#1088#1090'. '#1087#1086' '#1082#1086#1076#1091
    TabOrder = 11
    OnClick = ButtonSortClick
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 154
    Width = 916
    Height = 169
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = DataSource1
    Options = [dgEditing, dgAlwaysShowEditor, dgIndicator, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    ParentShowHint = False
    PopupMenu = pm1
    ShowHint = True
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
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
        Width = 79
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Kol_1'
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
        Title.Caption = 'I'
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
        Title.Caption = 'II'
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
        Title.Caption = 'III'
        Width = 29
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Kol'
        ReadOnly = True
        Title.Caption = #1050#1086#1083
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
        FieldName = 'TM13'
        Width = 21
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TM14'
        Width = 21
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Primech'
        Title.Alignment = taCenter
        Width = 138
        Visible = True
      end>
  end
  object EditMarsh: TEdit
    Left = 440
    Top = 112
    Width = 310
    Height = 42
    AutoSize = False
    BevelKind = bkTile
    BorderStyle = bsNone
    ParentColor = True
    TabOrder = 12
    Text = 'EditMarsh'
  end
  object EditPrim: TEdit
    Left = 748
    Top = 112
    Width = 142
    Height = 42
    AutoSize = False
    BevelKind = bkTile
    BorderStyle = bsNone
    ParentColor = True
    TabOrder = 13
    Text = 'EditMarsh'
  end
  object BitBtnUndo: TBitBtn
    Left = 600
    Top = 80
    Width = 23
    Height = 26
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
    Left = 737
    Top = 2
    Width = 176
    Height = 20
    Anchors = [akTop, akRight]
    Caption = #1050#1086#1087#1080#1088#1086#1074#1072#1090#1100
    TabOrder = 15
    OnClick = ButtonCopyClick
  end
  object ButtonPaste: TButton
    Left = 737
    Top = 22
    Width = 176
    Height = 20
    Anchors = [akTop, akRight]
    Caption = #1042#1089#1090#1072#1074#1080#1090#1100' '#1074#1089#1077
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
    Left = 451
    Top = 360
    Width = 465
    Height = 105
    Anchors = [akRight, akBottom]
    TabOrder = 26
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
    Left = 352
    Top = 368
    Width = 92
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = #1053#1072#1081#1090#1080' '#1074' '#1087#1083#1072#1085#1077' ->'
    Enabled = False
    TabOrder = 27
    OnClick = btn1Click
  end
  object btn2: TButton
    Left = 737
    Top = 42
    Width = 176
    Height = 20
    Anchors = [akTop, akRight]
    Caption = #1042#1089#1090#1072#1074#1080#1090#1100' '#1095#1077#1088#1090#1077#1078#1080
    TabOrder = 28
    OnClick = btn2Click
  end
  object medt1: TMaskEdit
    Left = 48
    Top = 28
    Width = 89
    Height = 21
    EditMask = '999 999999 99;1;_'
    MaxLength = 13
    TabOrder = 29
    Text = '             '
  end
  object se1: TSpinEdit
    Left = 48
    Top = 2
    Width = 73
    Height = 22
    MaxLength = 4
    MaxValue = 9999
    MinValue = 0
    TabOrder = 30
    Value = 0
    OnExit = se1Exit
  end
  object txt15: TStaticText
    Left = 2
    Top = 325
    Width = 70
    Height = 25
    Hint = 
      #1054#1073#1103#1079#1072#1090#1077#1083#1100#1085#1086' '#1079#1072#1087#1086#1083#1085#1080#1090#1077' '#1087#1086#1083#1077' '#1048#1090#1086#1075#1086' '#1076#1083#1103' '#1089#1086#1086#1090#1074#1077#1090#1089#1090#1074#1091#1102#1097#1077#1075#1086' '#1084#1077#1089#1103#1094#1072' '#1087#1086' ' +
      #1089#1090#1088#1086#1082#1077' '#1041#1077#1079' '#1087#1086#1079#1080#1094#1080#1080
    Alignment = taCenter
    Anchors = [akLeft, akBottom]
    AutoSize = False
    Caption = #1054#1073#1103#1079#1072#1090'. '#1079#1072#1087#1086#1083#1085' '#1080#1090#1086#1075#1086
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 31
    Visible = False
  end
  object btn4: TButton
    Left = 737
    Top = 62
    Width = 176
    Height = 20
    Hint = #1042#1089#1090#1072#1074#1080#1090#1100' '#1095#1077#1088#1090#1077#1078#1080' '#1080#1079' Microsoft Excel '#1080' Word'
    Anchors = [akTop, akRight]
    Caption = #1042#1089#1090#1072#1074#1080#1090#1100' '#1082#1072#1082' '#1090#1077#1082#1089#1090
    ParentShowHint = False
    ShowHint = True
    TabOrder = 32
    OnClick = btn4Click
  end
  object btnSave: TBitBtn
    Left = 144
    Top = 48
    Width = 57
    Height = 25
    Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1090#1072#1073#1083#1080#1094#1091
    ParentShowHint = False
    ShowHint = True
    TabOrder = 33
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
  object btn6: TBitBtn
    Left = 449
    Top = 469
    Width = 160
    Height = 25
    Hint = #1055#1088#1086#1089#1084#1086#1090#1088' '#1086#1090#1087#1088#1072#1074#1083#1077#1085#1085#1099#1093' '#1074' '#1054#1040#1057#1059#1055' '#1082#1086#1088#1088#1077#1082#1090#1080#1088#1086#1074#1086#1082' '#1058#1052#1062
    Anchors = [akLeft, akBottom]
    Caption = #1054#1090#1087#1088#1072#1074#1083#1077#1085#1085#1099#1077' '#1074' '#1054#1040#1057#1059#1055
    ParentShowHint = False
    ShowHint = True
    TabOrder = 34
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
  object QueryTM: TQuery
    Left = 176
    Top = 192
  end
  object Table1: TTable
    BeforeInsert = Table1BeforeInsert
    AfterInsert = Table1AfterInsert
    BeforePost = Table1BeforePost
    AfterDelete = Table1AfterDelete
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
      DisplayLabel = #1050#1048
      FieldName = 'Kod'
      MaxValue = 9999
    end
    object Table1Chert: TStringField
      DisplayLabel = #1063#1077#1088#1090#1077#1078
      FieldName = 'Chert'
      OnSetText = Table1ChertSetText
      Size = 13
    end
    object intgrfldTable1Kol_1: TIntegerField
      DisplayLabel = #1050#1086#1083'-'#1074#1086' '#1085#1072' 1 '#1084#1072#1096
      FieldName = 'Kol_1'
    end
    object intgrfldTable1Kol1_v: TIntegerField
      DisplayLabel = #1050#1086#1083'-'#1074#1086' '#1084#1072#1096' 1 '#1084#1077#1089
      FieldName = 'Kol1_v'
    end
    object Table1Kol1: TIntegerField
      DisplayLabel = #1050#1086#1083'-'#1074#1086' 1 '#1084#1077#1089
      FieldName = 'Kol1'
    end
    object intgrfldTable1Kol2_v: TIntegerField
      DisplayLabel = #1050#1086#1083'-'#1074#1086' '#1084#1072#1096' 2 '#1084#1077#1089
      FieldName = 'Kol2_v'
    end
    object Table1Kol2: TIntegerField
      DisplayLabel = #1050#1086#1083'-'#1074#1086' 2 '#1084#1077#1089
      FieldName = 'Kol2'
    end
    object intgrfldTable1Kol3_v: TIntegerField
      DisplayLabel = #1050#1086#1083'-'#1074#1086' '#1084#1072#1096' 3 '#1084#1077#1089
      FieldName = 'Kol3_v'
    end
    object Table1Kol3: TIntegerField
      DisplayLabel = #1050#1086#1083'-'#1074#1086' 3 '#1084#1077#1089
      FieldName = 'Kol3'
    end
    object Table1Kol: TIntegerField
      DisplayLabel = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1080#1090#1086#1075#1086
      FieldName = 'Kol'
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
      DisplayLabel = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
      FieldName = 'Primech'
      Size = 30
    end
    object strngfldTable1TM13: TStringField
      FieldName = 'TM13'
      Size = 2
    end
    object strngfldTable1TM14: TStringField
      FieldName = 'TM14'
      Size = 2
    end
    object strngfldTable1TM15: TStringField
      FieldName = 'TM15'
      Size = 2
    end
    object strngfldTable1TM16: TStringField
      FieldName = 'TM16'
      Size = 2
    end
    object strngfldTable1TM17: TStringField
      FieldName = 'TM17'
      Size = 2
    end
    object strngfldTable1TM18: TStringField
      FieldName = 'TM18'
      Size = 2
    end
    object strngfldTable1TM19: TStringField
      FieldName = 'TM19'
      Size = 2
    end
    object strngfldTable1TM20: TStringField
      FieldName = 'TM20'
      Size = 2
    end
    object strngfldTable1TM21: TStringField
      FieldName = 'TM21'
      Size = 2
    end
    object strngfldTable1TM22: TStringField
      FieldName = 'TM22'
      Size = 2
    end
    object strngfldTable1TM23: TStringField
      FieldName = 'TM23'
      Size = 2
    end
    object strngfldTable1TM24: TStringField
      FieldName = 'TM24'
      Size = 2
    end
  end
  object DataSource1: TDataSource
    DataSet = Table1
    OnDataChange = DataSource1DataChange
    Left = 128
    Top = 192
  end
  object pm1: TPopupMenu
    Left = 240
    Top = 240
    object N12: TMenuItem
      Action = edtcpy1
    end
    object N13: TMenuItem
      Action = edtct1
    end
    object N14: TMenuItem
      Action = edtpst1
    end
    object N15: TMenuItem
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
      OnClick = ButtonCopyClick
    end
    object N5: TMenuItem
      Caption = #1042#1089#1090#1072#1074#1080#1090#1100' '#1074#1089#1077
      OnClick = ButtonPasteClick
    end
    object N6: TMenuItem
      Caption = #1042#1089#1090#1072#1074#1080#1090#1100' '#1095#1077#1088#1090#1077#1078#1080
      OnClick = btn2Click
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
      OnClick = btn4Click
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
    Left = 336
    Top = 208
    object edtcpy1: TEditCopy
      Category = 'Edit'
      Caption = #1050#1086#1087#1080#1088#1086#1074#1072#1090#1100
      Hint = 'Copy|Copies the selection and puts it on the Clipboard'
      ImageIndex = 1
      ShortCut = 16451
    end
    object edtct1: TEditCut
      Category = 'Edit'
      Caption = #1042#1099#1088#1077#1079#1072#1090#1100
      Hint = 'Cut|Cuts the selection and puts it on the Clipboard'
      ImageIndex = 0
      ShortCut = 16472
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
    Left = 632
    Top = 80
  end
end
