object PasteMSO: TPasteMSO
  Left = 216
  Top = 151
  Width = 500
  Height = 450
  Caption = 
    #1042#1089#1090#1072#1074#1082#1072' '#1080#1079' Microsoft Office, CSV (** '#1069#1082#1089#1087#1077#1088#1080#1084#1077#1085#1090#1072#1083#1100#1085#1072#1103' '#1092#1091#1085#1082#1094#1080#1103' *' +
    '*)'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnResize = FormResize
  OnShow = FormShow
  DesignSize = (
    492
    423)
  PixelsPerInch = 96
  TextHeight = 13
  object lblHint: TLabel
    Left = 305
    Top = 0
    Width = 185
    Height = 17
    Anchors = [akTop, akRight]
    AutoSize = False
    Caption = #1057#1090#1086#1083#1073#1094#1099' '#1088#1072#1079#1076#1077#1083#1103#1102#1090#1089#1103' '#1089#1080#1084#1074#1086#1083#1086#1084
    WordWrap = True
  end
  object rg1: TRadioGroup
    Left = 306
    Top = 64
    Width = 185
    Height = 57
    Anchors = [akTop, akRight]
    Caption = ' '#1056#1077#1078#1080#1084' '#1074#1089#1090#1072#1074#1082#1080' '
    ItemIndex = 0
    Items.Strings = (
      #1044#1086#1073#1072#1074#1083#1077#1085#1080#1077
      #1047#1072#1084#1077#1085#1072)
    TabOrder = 0
    OnClick = rg1Click
  end
  object grp1: TGroupBox
    Left = 306
    Top = 160
    Width = 185
    Height = 227
    Anchors = [akTop, akRight, akBottom]
    Caption = ' '#1055#1086#1088#1103#1076#1086#1082' '#1089#1090#1086#1083#1073#1094#1086#1074' '
    TabOrder = 1
    DesignSize = (
      185
      227)
    object chklst1: TCheckListBox
      Left = 2
      Top = 15
      Width = 150
      Height = 205
      OnClickCheck = chklst1ClickCheck
      Align = alCustom
      Anchors = [akLeft, akTop, akRight, akBottom]
      BorderStyle = bsNone
      Color = clBtnFace
      DragMode = dmAutomatic
      ItemHeight = 13
      Style = lbOwnerDrawVariable
      TabOrder = 0
      OnDragDrop = chklst1DragDrop
      OnDragOver = chklst1DragOver
      OnDrawItem = chklst1DrawItem
    end
    object btnUp: TBitBtn
      Left = 155
      Top = 16
      Width = 25
      Height = 33
      Hint = #1055#1077#1088#1077#1084#1077#1089#1090#1080#1090#1100' '#1087#1086#1083#1077' '#1074#1074#1077#1088#1093
      Anchors = [akTop, akRight]
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = btnUpClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333000333
        3333333333777F33333333333309033333333333337F7F333333333333090333
        33333333337F7F33333333333309033333333333337F7F333333333333090333
        33333333337F7F33333333333309033333333333FF7F7FFFF333333000090000
        3333333777737777F333333099999990333333373F3333373333333309999903
        333333337F33337F33333333099999033333333373F333733333333330999033
        3333333337F337F3333333333099903333333333373F37333333333333090333
        33333333337F7F33333333333309033333333333337373333333333333303333
        333333333337F333333333333330333333333333333733333333}
      NumGlyphs = 2
    end
    object btnDown: TBitBtn
      Left = 155
      Top = 56
      Width = 25
      Height = 33
      Hint = #1055#1077#1088#1077#1084#1077#1089#1090#1080#1090#1100' '#1087#1086#1083#1077' '#1074#1085#1080#1079
      Anchors = [akTop, akRight]
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = btnDownClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333303333
        333333333337F33333333333333033333333333333373F333333333333090333
        33333333337F7F33333333333309033333333333337373F33333333330999033
        3333333337F337F33333333330999033333333333733373F3333333309999903
        333333337F33337F33333333099999033333333373333373F333333099999990
        33333337FFFF3FF7F33333300009000033333337777F77773333333333090333
        33333333337F7F33333333333309033333333333337F7F333333333333090333
        33333333337F7F33333333333309033333333333337F7F333333333333090333
        33333333337F7F33333333333300033333333333337773333333}
      NumGlyphs = 2
    end
    object btnEmpty: TBitBtn
      Left = 155
      Top = 104
      Width = 25
      Height = 33
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1087#1088#1086#1087#1091#1089#1082#1072#1077#1084#1099#1081' '#1089#1090#1086#1083#1073#1077#1094
      Anchors = [akTop, akRight]
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnClick = btnEmptyClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333333B333
        333B33FF33337F3333F73BB3777BB7777BB3377FFFF77FFFF77333B000000000
        0B3333777777777777333330FFFFFFFF07333337F33333337F333330FFFFFFFF
        07333337F33333337F333330FFFFFFFF07333337F33333337F333330FFFFFFFF
        07333FF7F33333337FFFBBB0FFFFFFFF0BB37777F3333333777F3BB0FFFFFFFF
        0BBB3777F3333FFF77773330FFFF000003333337F333777773333330FFFF0FF0
        33333337F3337F37F3333330FFFF0F0B33333337F3337F77FF333330FFFF003B
        B3333337FFFF77377FF333B000000333BB33337777777F3377FF3BB3333BB333
        3BB33773333773333773B333333B3333333B7333333733333337}
      NumGlyphs = 2
    end
    object btnChkOpt: TBitBtn
      Left = 155
      Top = 184
      Width = 25
      Height = 33
      Hint = #1053#1072#1089#1090#1088#1086#1081#1082#1080' '#1087#1086#1083#1077#1081
      Anchors = [akRight, akBottom]
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
      OnClick = btnChkOptClick
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
    end
    object lstFieldOpt: TListBox
      Left = 8
      Top = 48
      Width = 121
      Height = 169
      Anchors = [akLeft, akTop, akRight, akBottom]
      BorderStyle = bsNone
      ItemHeight = 13
      ParentShowHint = False
      ShowHint = True
      TabOrder = 5
      Visible = False
      OnDblClick = lstFieldOptDblClick
      OnMouseMove = lstFieldOptMouseMove
    end
    object edtFieldOpt: TEdit
      Left = 8
      Top = 24
      Width = 121
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      BevelInner = bvNone
      BevelOuter = bvNone
      BorderStyle = bsNone
      TabOrder = 6
      Visible = False
    end
    object btnAddOpt: TButton
      Left = 130
      Top = 24
      Width = 19
      Height = 22
      Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1090#1077#1082#1091#1097#1091#1102' '#1085#1072#1089#1090#1088#1086#1081#1082#1091
      Caption = '+'
      TabOrder = 7
      Visible = False
      OnClick = btnAddOptClick
    end
    object btnDeleteOpt: TButton
      Left = 130
      Top = 48
      Width = 19
      Height = 22
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1085#1072#1089#1090#1088#1086#1081#1082#1091
      Caption = '-'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 8
      Visible = False
      OnClick = btnDeleteOptClick
    end
  end
  object btnTest: TButton
    Left = 307
    Top = 128
    Width = 89
    Height = 25
    Anchors = [akTop, akRight]
    Caption = #1055#1088#1086#1074#1077#1088#1080#1090#1100
    TabOrder = 2
    OnClick = btnTestClick
  end
  object btnPaste: TButton
    Left = 400
    Top = 128
    Width = 89
    Height = 25
    Anchors = [akTop, akRight]
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ModalResult = 1
    ParentFont = False
    TabOrder = 3
  end
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 298
    Height = 419
    Anchors = [akLeft, akTop, akRight, akBottom]
    BevelOuter = bvNone
    TabOrder = 4
    object spl1: TSplitter
      Left = 0
      Top = 215
      Width = 298
      Height = 3
      Cursor = crVSplit
      Align = alBottom
    end
    object strngrd1: TStringGrid
      Left = 0
      Top = 218
      Width = 298
      Height = 201
      Align = alBottom
      ColCount = 1
      FixedCols = 0
      RowCount = 1
      FixedRows = 0
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goEditing]
      TabOrder = 0
    end
    object mmo1: TMemo
      Left = 0
      Top = 0
      Width = 298
      Height = 215
      Align = alClient
      ScrollBars = ssBoth
      TabOrder = 1
      WantTabs = True
      OnKeyDown = mmo1KeyDown
    end
  end
  object btn1: TButton
    Left = 307
    Top = 394
    Width = 185
    Height = 25
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    ModalResult = 2
    TabOrder = 5
    OnClick = btn1Click
  end
  object edtDelimiter: TEdit
    Left = 304
    Top = 16
    Width = 145
    Height = 21
    Hint = #1055#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102' '#1089#1080#1084#1074#1086#1083' '#1090#1072#1073#1091#1083#1103#1094#1080#1080
    Anchors = [akTop, akRight]
    ParentShowHint = False
    ShowHint = True
    TabOrder = 6
  end
  object btnTab: TButton
    Left = 456
    Top = 16
    Width = 25
    Height = 18
    Hint = #1042#1089#1090#1072#1074#1080#1090#1100' '#1089#1080#1084#1074#1086#1083' '#1090#1072#1073#1091#1083#1103#1094#1080#1080
    Anchors = [akTop, akRight]
    Caption = 'tab'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 7
    OnClick = btnTabClick
  end
  object btnLoad: TBitBtn
    Left = 304
    Top = 38
    Width = 33
    Height = 21
    Hint = #1054#1090#1082#1088#1099#1090#1100' CSV'
    Anchors = [akTop, akRight]
    Enabled = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 8
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000130B0000130B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      33333333333FFFFFFFFF333333000000000033333377777777773333330FFFFF
      FFF03333337F333333373333330FFFFFFFF03333337F3FF3FFF73333330F00F0
      00F03333F37F773777373330330FFFFFFFF03337FF7F3F3FF3F73339030F0800
      F0F033377F7F737737373339900FFFFFFFF03FF7777F3FF3FFF70999990F00F0
      00007777777F7737777709999990FFF0FF0377777777FF37F3730999999908F0
      F033777777777337F73309999990FFF0033377777777FFF77333099999000000
      3333777777777777333333399033333333333337773333333333333903333333
      3333333773333333333333303333333333333337333333333333}
    NumGlyphs = 2
  end
  object btnSave: TBitBtn
    Left = 344
    Top = 38
    Width = 33
    Height = 21
    Anchors = [akTop, akRight]
    Enabled = False
    TabOrder = 9
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
end
