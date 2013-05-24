object NP01VN01Form1: TNP01VN01Form1
  Left = 253
  Top = 163
  Width = 780
  Height = 400
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCanResize = FormCanResize
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object spl1: TSplitter
    Left = 0
    Top = 343
    Width = 772
    Height = 5
    Cursor = crVSplit
    Align = alBottom
  end
  object spl2: TSplitter
    Left = 0
    Top = 65
    Width = 772
    Height = 3
    Cursor = crVSplit
    Align = alTop
  end
  object pnl1: TPanel
    Left = 0
    Top = 348
    Width = 772
    Height = 25
    Align = alBottom
    BevelOuter = bvLowered
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    OnCanResize = pnl1CanResize
    DesignSize = (
      772
      25)
    object lbl1: TLabel
      Left = 8
      Top = 6
      Width = 19
      Height = 13
      Hint = '2 '#1097#1077#1083#1095#1086#1082' '#1084#1099#1096#1100#1102' '#1076#1083#1103' '#1079#1072#1087#1086#1083#1085#1077#1085#1080#1103' '#1091#1089#1083#1086#1074#1080#1081' '#1092#1080#1083#1100#1090#1088#1072#1094#1080#1080
      Caption = #1053#1077#1090
      OnDblClick = lbl1DblClick
    end
    object lbl2: TLabel
      Left = 8
      Top = 40
      Width = 46
      Height = 13
      Caption = #1058#1072#1073#1083#1080#1094#1072':'
    end
    object lbl3: TLabel
      Left = 8
      Top = 88
      Width = 54
      Height = 13
      Caption = #1044#1086#1082#1091#1084#1077#1085#1090':'
    end
    object lbl5: TLabel
      Left = 539
      Top = 112
      Width = 111
      Height = 13
      Anchors = [akTop, akRight]
      Caption = #1054#1090#1087#1088#1072#1074#1083#1077#1085#1086' '#1074' '#1054#1040#1057#1059#1055
    end
    object dbtxtSendDate: TDBText
      Left = 659
      Top = 112
      Width = 81
      Height = 17
      Anchors = [akTop, akRight]
      DataField = 'SendDate'
      DataSource = ds1
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object dbtxtQuart: TDBText
      Left = 635
      Top = 48
      Width = 20
      Height = 17
      Anchors = [akTop, akRight]
      DataField = 'Quart'
      DataSource = ds1
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbl6: TLabel
      Left = 539
      Top = 48
      Width = 88
      Height = 13
      Anchors = [akTop, akRight]
      Caption = #1062#1077#1083#1077#1074#1086#1081' '#1082#1074#1072#1088#1090#1072#1083
    end
    object DBText1: TDBText
      Left = 608
      Top = 7
      Width = 129
      Height = 14
      Hint = #1056#1077#1082#1074#1080#1079#1080#1090#1099' '#1076#1086#1082#1091#1084#1077#1085#1090#1072' '#1082#1086#1088#1088#1077#1082#1090#1080#1088#1086#1074#1082#1080
      Anchors = [akTop, akRight]
      DataField = 'NameDoc'
      DataSource = ds1
    end
    object dbmmoDocTitle: TDBMemo
      Left = 64
      Top = 88
      Width = 468
      Height = 41
      Anchors = [akLeft, akTop, akRight]
      DataField = 'DocTitle'
      DataSource = ds1
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
      OnDblClick = dbmmoDocTitleDblClick
    end
    object dbmmoTable: TDBMemo
      Left = 64
      Top = 40
      Width = 468
      Height = 41
      Anchors = [akLeft, akTop, akRight]
      DataField = 'TableTitle'
      DataSource = ds1
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
      OnDblClick = dbmmoTableDblClick
    end
    object btn3: TButton
      Left = 752
      Top = 6
      Width = 17
      Height = 17
      Hint = #1055#1086#1082#1072#1079#1072#1090#1100'/'#1089#1082#1088#1099#1090#1100' '#1085#1080#1078#1085#1102#1102' '#1087#1072#1085#1077#1083#1100
      Anchors = [akTop, akRight]
      Caption = '_'
      TabOrder = 2
      OnClick = btn3Click
    end
  end
  object pnl2: TPanel
    Left = 0
    Top = 68
    Width = 772
    Height = 275
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object dbgrdh1: TDBGridEh
      Left = 0
      Top = 0
      Width = 772
      Height = 275
      Align = alClient
      AutoFitColWidths = True
      DataGrouping.GroupLevels = <>
      DataSource = ds1
      Flat = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      FooterColor = clWindow
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -11
      FooterFont.Name = 'MS Sans Serif'
      FooterFont.Style = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
      OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghDialogFind, dghColumnResize, dghColumnMove, dghExtendVertLines]
      ParentFont = False
      PopupMenu = pm1
      ReadOnly = True
      RowDetailPanel.Color = clBtnFace
      RowHeight = 4
      RowLines = 1
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -13
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      TitleLines = 2
      OnDblClick = lbl1DblClick
      Columns = <
        item
          EditButtons = <>
          FieldName = 'Cp'
          Footers = <>
          Title.Caption = #1062#1055
          Title.TitleButton = True
          Width = 23
        end
        item
          EditButtons = <>
          FieldName = 'Shifr'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #1064#1080#1092#1088' '#1084#1072#1090#1077#1088#1080#1072#1083#1072
          Title.TitleButton = True
          Width = 77
        end
        item
          EditButtons = <>
          FieldName = 'KI'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #1050#1086#1076' '#1080#1079#1076#1077#1083
          Title.TitleButton = True
          Width = 46
        end
        item
          EditButtons = <>
          FieldName = 'Eim'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #1045#1048
        end
        item
          EditButtons = <>
          FieldName = 'Norma'
          Footers = <>
          Title.Caption = #1053#1072' 1 '#1080#1079#1076'.'
          Visible = False
        end
        item
          Alignment = taLeftJustify
          EditButtons = <>
          FieldName = 'Itog'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #1048#1090#1086#1075#1086
        end
        item
          EditButtons = <>
          FieldName = 'Kol'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = '1 '#1084#1077#1089#1103#1094
          Width = 77
        end
        item
          EditButtons = <>
          FieldName = 'Kol2'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = '2 '#1084#1077#1089#1103#1094
          Width = 75
        end
        item
          EditButtons = <>
          FieldName = 'Kol3'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = '3 '#1084#1077#1089#1103#1094
          Width = 73
        end
        item
          EditButtons = <>
          FieldName = 'Quart'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #1050#1074#1072#1088#1090'.'
          Title.TitleButton = True
          Width = 46
        end
        item
          EditButtons = <>
          FieldName = 'Znak'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #1047#1085#1072#1082
          Title.TitleButton = True
          Width = 34
        end
        item
          EditButtons = <>
          FieldName = 'NameDoc'
          Footers = <>
          Title.Caption = #1056#1077#1082#1074#1080#1079#1080#1090#1099
          Title.TitleButton = True
          Visible = False
        end
        item
          EditButtons = <>
          FieldName = 'Podrazd'
          Footers = <>
          Title.Caption = #1055#1086#1076#1088#1072#1079#1076'.'
          Visible = False
        end
        item
          EditButtons = <>
          FieldName = 'Primech'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
          Title.TitleButton = True
          Width = 165
        end
        item
          EditButtons = <>
          FieldName = 'DocDate'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #1044#1072#1090#1072' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
          Title.TitleButton = True
          Visible = False
        end
        item
          EditButtons = <>
          FieldName = 'SendDate'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #1054#1090#1087#1088#1072#1074'. '#1074' '#1054#1040#1057#1059#1055
          Title.TitleButton = True
          Visible = False
        end
        item
          EditButtons = <>
          FieldName = 'TableTitle'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #1058#1072#1073#1083#1080#1094#1072
          Visible = False
        end
        item
          EditButtons = <>
          FieldName = 'DocTitle'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #1044#1086#1082#1091#1084#1077#1085#1090
          Visible = False
        end>
      object RowDetailData: TRowDetailPanelControlEh
      end
    end
  end
  object pnl3: TPanel
    Left = 0
    Top = 0
    Width = 772
    Height = 65
    Align = alTop
    BevelOuter = bvLowered
    TabOrder = 2
    OnCanResize = pnl3CanResize
    OnMouseMove = pnl3MouseMove
    DesignSize = (
      772
      65)
    object btnQ1: TSpeedButton
      Left = 64
      Top = 8
      Width = 41
      Height = 22
      AllowAllUp = True
      GroupIndex = 1
      Caption = 'I '#1082#1074'.'
      Flat = True
    end
    object btnQ2: TSpeedButton
      Left = 108
      Top = 8
      Width = 41
      Height = 22
      AllowAllUp = True
      GroupIndex = 2
      Caption = 'II '#1082#1074'.'
      Flat = True
    end
    object btnQ3: TSpeedButton
      Left = 152
      Top = 8
      Width = 41
      Height = 22
      AllowAllUp = True
      GroupIndex = 3
      Caption = 'III '#1082#1074'.'
      Flat = True
    end
    object btnQ4: TSpeedButton
      Left = 196
      Top = 8
      Width = 41
      Height = 22
      AllowAllUp = True
      GroupIndex = 4
      Caption = 'IV '#1082#1074'.'
      Flat = True
    end
    object bvl2: TBevel
      Left = 8
      Top = 72
      Width = 756
      Height = 98
      Anchors = [akLeft, akTop, akRight]
    end
    object lbl7: TLabel
      Left = 16
      Top = 96
      Width = 63
      Height = 13
      Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
    end
    object lbl8: TLabel
      Left = 16
      Top = 120
      Width = 43
      Height = 13
      Caption = #1058#1072#1073#1083#1080#1094#1072
    end
    object lbl9: TLabel
      Left = 16
      Top = 144
      Width = 51
      Height = 13
      Caption = #1044#1086#1082#1091#1084#1077#1085#1090
    end
    object lbl10: TLabel
      Left = 454
      Top = 144
      Width = 11
      Height = 13
      Anchors = [akTop, akRight]
      Caption = #8470
    end
    object lbl11: TLabel
      Left = 542
      Top = 144
      Width = 11
      Height = 13
      Anchors = [akTop, akRight]
      Caption = #1086#1090
    end
    object lbl12: TLabel
      Left = 162
      Top = 40
      Width = 11
      Height = 13
      Caption = #8470
    end
    object lbl13: TLabel
      Left = 229
      Top = 40
      Width = 11
      Height = 13
      Caption = #1086#1090
    end
    object btnTable: TSpeedButton
      Left = 244
      Top = 8
      Width = 23
      Height = 22
      Hint = #1058#1086#1083#1100#1082#1086' '#1090#1077#1082#1091#1097#1072#1103' '#1090#1072#1073#1083#1080#1094#1072
      AllowAllUp = True
      GroupIndex = 5
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        33333FFFFFFFFFFFFFFF000000000000000077777777777777770FF7FF7FF7FF
        7FF07FF7FF7FF7F37F3709F79F79F7FF7FF077F77F77F7FF7FF7077777777777
        777077777777777777770FF7FF7FF7FF7FF07FF7FF7FF7FF7FF709F79F79F79F
        79F077F77F77F77F77F7077777777777777077777777777777770FF7FF7FF7FF
        7FF07FF7FF7FF7FF7FF709F79F79F79F79F077F77F77F77F77F7077777777777
        777077777777777777770FFFFF7FF7FF7FF07F33337FF7FF7FF70FFFFF79F79F
        79F07FFFFF77F77F77F700000000000000007777777777777777CCCCCC8888CC
        CCCC777777FFFF777777CCCCCCCCCCCCCCCC7777777777777777}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
    end
    object btnDoc: TSpeedButton
      Left = 268
      Top = 8
      Width = 23
      Height = 22
      Hint = #1058#1086#1083#1100#1082#1086' '#1090#1077#1082#1091#1097#1080#1081' '#1076#1086#1082#1091#1084#1077#1085#1090
      AllowAllUp = True
      GroupIndex = 5
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555000000
        000055555F77777777775555000FFFFFFFF0555F777F5FFFF55755000F0F0000
        FFF05F777F7F77775557000F0F0FFFFFFFF0777F7F7F5FFFFFF70F0F0F0F0000
        00F07F7F7F7F777777570F0F0F0FFFFFFFF07F7F7F7F5FFFFFF70F0F0F0F0000
        00F07F7F7F7F777777570F0F0F0FFFFFFFF07F7F7F7F5FFF55570F0F0F0F000F
        FFF07F7F7F7F77755FF70F0F0F0FFFFF00007F7F7F7F5FF577770F0F0F0F00FF
        0F057F7F7F7F77557F750F0F0F0FFFFF00557F7F7F7FFFFF77550F0F0F000000
        05557F7F7F77777775550F0F0000000555557F7F7777777555550F0000000555
        55557F7777777555555500000005555555557777777555555555}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
    end
    object lblSearch: TLabel
      Left = 16
      Top = 76
      Width = 609
      Height = 13
      Anchors = [akLeft, akTop, akRight]
      AutoSize = False
      Caption = #1055#1086#1080#1089#1082':'
    end
    object btnFilter: TSpeedButton
      Left = 635
      Top = 4
      Width = 78
      Height = 25
      AllowAllUp = True
      Anchors = [akTop, akRight]
      GroupIndex = 8
      Caption = #1060#1080#1083#1100#1090#1088
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00500000000000
        055557777777777775F508888888888880557F5FFFFFFFFFF75F080000000000
        88057577777777775F755080FFFFFF05088057F7FFFFFF7575F70000000000F0
        F08077777777775757F70FFFFFFFFF0F008075F5FF5FF57577F750F00F00FFF0
        F08057F775775557F7F750FFFFFFFFF0F08057FF5555555757F7000FFFFFFFFF
        0000777FF5FFFFF577770900F00000F000907F775777775777F7090FFFFFFFFF
        00907F7F555555557757000FFFFFFFFF0F00777F5FFF5FF57F77550F000F00FF
        0F05557F777577557F7F550FFFFFFFFF0005557F555FFFFF7775550FFF000000
        05555575FF777777755555500055555555555557775555555555}
      NumGlyphs = 2
      OnClick = btnFilterClick
      OnMouseMove = btnFilterMouseMove
    end
    object btnFind: TSpeedButton
      Left = 635
      Top = 96
      Width = 97
      Height = 25
      AllowAllUp = True
      Anchors = [akTop, akRight]
      GroupIndex = 10
      Caption = #1042#1099#1073#1088#1072#1090#1100
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
        55555555FFFFFFFF5555555000000005555555577777777FF555550999999900
        55555575555555775F55509999999901055557F55555557F75F5001111111101
        105577FFFFFFFF7FF75F00000000000011057777777777775F755070FFFFFF0F
        01105777F555557F75F75500FFFFFF0FF0105577F555FF7F57575550FF700008
        8F0055575FF7777555775555000888888F005555777FFFFFFF77555550000000
        0F055555577777777F7F555550FFFFFF0F05555557F5FFF57F7F555550F000FF
        0005555557F777557775555550FFFFFF0555555557F555FF7F55555550FF7000
        05555555575FF777755555555500055555555555557775555555}
      NumGlyphs = 2
      OnClick = btnFindClick
    end
    object lbl14: TLabel
      Left = 304
      Top = 40
      Width = 29
      Height = 13
      Caption = #1055#1086#1076#1088'.'
    end
    object cbbYear: TComboBox
      Left = 8
      Top = 8
      Width = 49
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 0
      OnChange = cbbYearChange
    end
    object medtShifr: TMaskEdit
      Left = 40
      Top = 40
      Width = 73
      Height = 21
      Hint = #1064#1080#1092#1088' '#1084#1072#1090#1077#1088#1080#1072#1083#1072
      EditMask = '99999999;1;_'
      MaxLength = 8
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      Text = '        '
      OnClick = medtShifrClick
    end
    object medtCP: TMaskEdit
      Left = 8
      Top = 40
      Width = 25
      Height = 21
      Hint = #1062#1077#1093' '#1087#1086#1083#1091#1095#1072#1090#1077#1083#1100
      EditMask = '!99;1;_'
      MaxLength = 2
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      Text = '  '
      OnClick = medtCPClick
    end
    object medtKI: TMaskEdit
      Left = 116
      Top = 40
      Width = 41
      Height = 21
      Hint = #1050#1086#1076' '#1080#1079#1076#1077#1083#1080#1103
      EditMask = '!9999;1;_'
      MaxLength = 4
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      Text = '    '
      OnClick = medtKIClick
    end
    object btnSearch: TBitBtn
      Left = 635
      Top = 32
      Width = 97
      Height = 25
      Hint = #1055#1077#1088#1077#1081#1090#1080' '#1082' '#1087#1077#1088#1074#1086#1081' '#1089#1086#1086#1090#1074#1077#1090#1089#1090#1074#1091#1102#1097#1077#1081' '#1091#1089#1083#1086#1074#1080#1102' '#1089#1090#1088#1086#1082#1077
      Anchors = [akTop, akRight]
      Caption = #1055#1077#1088#1077#1081#1090#1080
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
      OnClick = btnSearchClick
      OnMouseMove = btnSearchMouseMove
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333300000000
        0000333377777777777733330FFFFFFFFFF033337F3FFF3F3FF733330F000F0F
        00F033337F777373773733330FFFFFFFFFF033337F3FF3FF3FF733330F00F00F
        00F033337F773773773733330FFFFFFFFFF033337FF3333FF3F7333300FFFF00
        F0F03333773FF377F7373330FB00F0F0FFF0333733773737F3F7330FB0BF0FB0
        F0F0337337337337373730FBFBF0FB0FFFF037F333373373333730BFBF0FB0FF
        FFF037F3337337333FF700FBFBFB0FFF000077F333337FF37777E0BFBFB000FF
        0FF077FF3337773F7F37EE0BFB0BFB0F0F03777FF3733F737F73EEE0BFBF00FF
        00337777FFFF77FF7733EEEE0000000003337777777777777333}
      NumGlyphs = 2
    end
    object edtPrimech: TEdit
      Left = 88
      Top = 96
      Width = 535
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 5
    end
    object edtTable: TEdit
      Left = 88
      Top = 120
      Width = 535
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 6
    end
    object edtDoc: TEdit
      Left = 88
      Top = 144
      Width = 351
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 7
    end
    object btnExport: TBitBtn
      Left = 739
      Top = 32
      Width = 25
      Height = 25
      Hint = #1069#1082#1089#1087#1086#1088#1090
      Anchors = [akTop, akRight]
      ParentShowHint = False
      ShowHint = True
      TabOrder = 8
      OnClick = btnExportClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333303
        333333333333337FF3333333333333903333333333333377FF33333333333399
        03333FFFFFFFFF777FF3000000999999903377777777777777FF0FFFF0999999
        99037F3337777777777F0FFFF099999999907F3FF777777777770F00F0999999
        99037F773777777777730FFFF099999990337F3FF777777777330F00FFFFF099
        03337F773333377773330FFFFFFFF09033337F3FF3FFF77733330F00F0000003
        33337F773777777333330FFFF0FF033333337F3FF7F3733333330F08F0F03333
        33337F7737F7333333330FFFF003333333337FFFF77333333333000000333333
        3333777777333333333333333333333333333333333333333333}
      NumGlyphs = 2
    end
    object btn1: TBitBtn
      Left = 739
      Top = 4
      Width = 25
      Height = 24
      Hint = #1042#1099#1073#1086#1088' '#1089#1090#1086#1083#1073#1094#1086#1074
      Anchors = [akTop, akRight]
      ParentShowHint = False
      ShowHint = True
      TabOrder = 9
      OnClick = btn1Click
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333333333333333333333333333333333333333333333
        33333F3F3F3F3F3F3F3F03030303030303037373737373737373333333333333
        33333F3FFFFFFFFFFF3F03000000000003037377777777777F73330800808080
        03333F7F77F7F7F77F3F0308008080800303737F77F737F77F73330080080008
        03333F77F77F777F7F3F03000000000003037377777777777373333333333333
        33333F3F3F3F3F3F3F3F03030303030303037373737373737373333333333333
        3333333333333333333333333333333333333333333333333333333333333333
        3333333333333333333333333333333333333333333333333333}
      NumGlyphs = 2
    end
    object medtDocNumb: TMaskEdit
      Left = 470
      Top = 144
      Width = 63
      Height = 21
      Anchors = [akTop, akRight]
      EditMask = '999\-9999;1;_'
      MaxLength = 8
      TabOrder = 10
      Text = '   -    '
      OnChange = medtDocNumbChange
    end
    object medtDocDate: TMaskEdit
      Left = 560
      Top = 144
      Width = 63
      Height = 21
      Anchors = [akTop, akRight]
      Enabled = False
      EditMask = '!99/99/99;1;_'
      MaxLength = 8
      TabOrder = 11
      Text = '  .  .  '
    end
    object medt1: TMaskEdit
      Left = 174
      Top = 40
      Width = 55
      Height = 21
      Hint = #1053#1086#1084#1077#1088' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
      EditMask = '999\-9999;1;_'
      MaxLength = 8
      ParentShowHint = False
      ShowHint = True
      TabOrder = 12
      Text = '   -    '
      OnChange = medt1Change
      OnClick = medt1Click
    end
    object medt2: TMaskEdit
      Left = 240
      Top = 40
      Width = 55
      Height = 21
      Hint = #1044#1072#1090#1072' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
      Enabled = False
      EditMask = '!99/99/99;1;_'
      MaxLength = 8
      ParentShowHint = False
      ShowHint = True
      TabOrder = 13
      Text = '  .  .  '
      OnClick = medt2Click
    end
    object rg1: TRadioGroup
      Left = 368
      Top = 23
      Width = 215
      Height = 40
      Caption = ' '#1044#1072#1090#1072' '
      Color = clBtnFace
      Items.Strings = (
        #1076#1086#1082#1091#1084#1077#1085#1090#1072
        #1086#1090#1087#1088#1072#1074#1082#1080)
      ParentColor = False
      TabOrder = 15
    end
    object medtDate1: TMaskEdit
      Left = 451
      Top = 36
      Width = 63
      Height = 21
      EditMask = '!99/99/99;1;_'
      MaxLength = 8
      TabOrder = 16
      Text = '  .  .  '
      OnChange = medtDate1Change
    end
    object medtDate2: TMaskEdit
      Left = 516
      Top = 36
      Width = 63
      Height = 21
      Enabled = False
      EditMask = '!99/99/99;1;_'
      MaxLength = 8
      TabOrder = 17
      Text = '  .  .  '
      OnChange = medtDate2Change
    end
    object btn5: TButton
      Left = 586
      Top = 32
      Width = 17
      Height = 22
      Hint = #1054#1095#1080#1089#1090#1080#1090#1100' '#1091#1089#1083#1086#1074#1080#1103' '#1092#1080#1083#1100#1090#1088#1072#1094#1080#1080
      Caption = 'X'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 18
      OnClick = btn5Click
    end
    object btnStructura: TBitBtn
      Left = 635
      Top = 128
      Width = 97
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1057#1090#1088#1091#1082#1090#1091#1088#1072
      TabOrder = 19
      OnClick = btnStructuraClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00303333333333
        333337F3333333333333303333333333333337F33FFFFF3FF3FF303300000300
        300337FF77777F77377330000BBB0333333337777F337F33333330330BB00333
        333337F373F773333333303330033333333337F3377333333333303333333333
        333337F33FFFFF3FF3FF303300000300300337FF77777F77377330000BBB0333
        333337777F337F33333330330BB00333333337F373F773333333303330033333
        333337F3377333333333303333333333333337FFFF3FF3FFF333000003003000
        333377777F77377733330BBB0333333333337F337F33333333330BB003333333
        333373F773333333333330033333333333333773333333333333}
      NumGlyphs = 2
    end
    object txt1: TStaticText
      Left = 292
      Top = 1
      Width = 341
      Height = 24
      Anchors = [akLeft, akTop, akRight]
      AutoSize = False
      Caption = #1060#1080#1083#1100#1090#1088':'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 14
      Visible = False
    end
    object medtPodrazd: TMaskEdit
      Left = 334
      Top = 40
      Width = 27
      Height = 21
      Hint = #1050#1086#1076' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1103':'#13#10'108 - '#1055#1044#1054#13#10'153 - '#1054#1055#1080#1040#1055#1044#13#10'118 - '#1054#1055#1080#1059#1058#1052#1062
      EditMask = '!999;1;_'
      MaxLength = 3
      ParentShowHint = False
      ShowHint = True
      TabOrder = 20
      Text = '   '
    end
    object btn2: TButton
      Left = 714
      Top = 4
      Width = 18
      Height = 25
      Hint = #1057#1086#1093#1088#1072#1085#1077#1085#1085#1099#1077' '#1092#1080#1083#1100#1090#1088#1099
      Anchors = [akTop, akRight]
      Caption = '...'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 21
      OnClick = btn2Click
    end
  end
  object ds1: TDataSource
    DataSet = qry1
    OnDataChange = ds1DataChange
    Left = 168
    Top = 164
  end
  object qry1: TQuery
    OnCalcFields = qry1CalcFields
    DatabaseName = 'd:\Temp\000\ArhivTMS\2012\'
    SQL.Strings = (
      
        'SELECT t2.Cp as Cp, t2.Shifr as Shifr, t2.KI as KI, t2.Eim as Ei' +
        'm,'
      
        't2.kol as Kol, t2.kol2 as Kol2, t2.kol3 as Kol3, t2.Znak as Znak' +
        ','
      
        't2.Primech as Primech, t2.Vp as Vp, t2.Podrazd as Podrazd, t2.No' +
        'rma as Norma,'
      't1.Quart as Quart, t1.Title as TableTitle,'
      't0.Title as DocTitle, t0.DDate as DocDate, t0.SDate as SendDate,'
      
        't1.Kod as Kod, t0.NameDoc as NameDoc,  t2.TableID as TableID, t1' +
        '.DocID as DocID'
      'FROM "NP01VN01_0.DB" t0, "NP01VN01_1.DB" t1, "NP01VN01_2.DB" t2 '
      'WHERE (t0.DocID = t1.DocID) and (t1.TableID=t2.TableID)')
    Left = 168
    Top = 132
    object fltfldqry1Itog: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Itog'
      Calculated = True
    end
    object strngfldqry1Cp: TStringField
      FieldName = 'Cp'
      Size = 3
    end
    object strngfldqry1Shifr: TStringField
      FieldName = 'Shifr'
      Size = 8
    end
    object strngfldqry1KI: TStringField
      FieldName = 'KI'
      Size = 4
    end
    object strngfldqry1Eim: TStringField
      FieldName = 'Eim'
      Size = 5
    end
    object strngfldqry1Kol: TStringField
      FieldName = 'Kol'
      Size = 11
    end
    object strngfldqry1Kol2: TStringField
      FieldName = 'Kol2'
      Size = 11
    end
    object strngfldqry1Kol3: TStringField
      FieldName = 'Kol3'
      Size = 11
    end
    object strngfldqry1Znak: TStringField
      FieldName = 'Znak'
      Size = 1
    end
    object strngfldqry1Primech: TStringField
      FieldName = 'Primech'
      Size = 50
    end
    object strngfldqry1TableTitle: TStringField
      FieldName = 'TableTitle'
      Size = 255
    end
    object strngfldqry1DocTitle: TStringField
      FieldName = 'DocTitle'
      Size = 255
    end
    object dtfldqry1DocDate: TDateField
      FieldName = 'DocDate'
    end
    object dtfldqry1SendDate: TDateField
      FieldName = 'SendDate'
    end
    object smlntfldqry1Quart: TSmallintField
      FieldName = 'Quart'
    end
    object intgrfldqry1Kod: TIntegerField
      FieldName = 'Kod'
    end
    object strngfldqry1NameDoc: TStringField
      FieldName = 'NameDoc'
      Size = 22
    end
    object intgrfldqry1TableID: TIntegerField
      FieldName = 'TableID'
    end
    object intgrfldqry1DocID: TIntegerField
      FieldName = 'DocID'
    end
    object strngfldqry1Vp: TStringField
      FieldName = 'Vp'
      Size = 1
    end
    object intgrfldqry1Podrazd: TIntegerField
      FieldName = 'Podrazd'
    end
    object strngfldqry1Norma: TStringField
      FieldName = 'Norma'
      Size = 9
    end
  end
  object vkdbfNS03: TVKDBFNTX
    OEM = True
    SetDeleted = False
    FastPostRecord = False
    LookupOptions = []
    TrimInLocate = False
    TrimCType = False
    StorageType = pstFile
    AccessMode.AccessMode = 64
    AccessMode.OpenRead = True
    AccessMode.OpenWrite = False
    AccessMode.OpenReadWrite = False
    AccessMode.ShareExclusive = False
    AccessMode.ShareDenyWrite = False
    AccessMode.ShareDenyNone = True
    Crypt.Active = False
    Crypt.CryptMethod = cmNone
    BufferSize = 4096
    WaitBusyRes = 3000
    CreateNow = False
    DbfVersion = xClipper
    LobBlockSize = 512
    LockProtocol = lpClipperLock
    LobLockProtocol = lpClipperLock
    FoxTableFlag.TableFlag = 0
    FoxTableFlag.HasGotIndex = False
    FoxTableFlag.HasGotMemo = False
    FoxTableFlag.ItIsDatabase = False
    Left = 104
    Top = 164
  end
  object dlgSave1: TSaveDialog
    DefaultExt = '.xls'
    Filter = 
      'Microsoft Excel (XLS)|*.xls|'#1058#1077#1082#1089#1090' '#1089' '#1086#1092#1086#1088#1084#1083#1077#1085#1080#1077#1084' (RTF)|*.rtf|'#1048#1085#1090#1077 +
      #1088#1085#1077#1090'-'#1089#1090#1088#1072#1085#1080#1094#1072'|*.htm|'#1055#1088#1086#1089#1090#1086#1081' '#1090#1077#1082#1089#1090'|*.txt|'#1058#1077#1082#1089#1090' '#1089' '#1088#1072#1079#1076#1077#1083#1080#1090#1077#1083#1103#1084#1080'|*.' +
      'csv'
    Title = #1069#1082#1089#1087#1086#1088#1090'...'
    Left = 136
    Top = 144
  end
  object pm1: TPopupMenu
    Left = 104
    Top = 132
    object N1: TMenuItem
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1074#1099#1076#1077#1083#1077#1085#1085#1099#1077' '#1089#1090#1088#1086#1082#1080
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #1050#1086#1087#1080#1088#1086#1074#1072#1090#1100' '#1074#1099#1076#1077#1083#1077#1085#1085#1099#1077' '#1089#1090#1088#1086#1082#1080
      OnClick = N2Click
    end
    object N3: TMenuItem
      Caption = '-'
      Visible = False
    end
    object NP01VN1: TMenuItem
      Caption = #1050#1086#1087#1080#1088#1086#1074#1072#1090#1100' '#1074' NP01VN '#1089' '#1082#1086#1083'-'#1074#1086#1084' '#1085#1072' 1 '#1080#1079#1076#1077#1083#1080#1077
      Visible = False
      OnClick = NP01VN1Click
    end
    object NP01VN2: TMenuItem
      Caption = #1050#1086#1087#1080#1088#1086#1074#1072#1090#1100' '#1074' NP01VN '#1073#1077#1079' '#1082#1086#1083'-'#1074#1072' '#1085#1072' 1 '#1080#1079#1076#1077#1083#1080#1077
      Visible = False
      OnClick = NP01VN2Click
    end
    object N4: TMenuItem
      AutoCheck = True
      Caption = #1050#1086#1087#1080#1088#1086#1074#1072#1090#1100' '#1087#1088#1080#1084#1077#1095#1072#1085#1080#1077
      Checked = True
      Visible = False
    end
  end
end
