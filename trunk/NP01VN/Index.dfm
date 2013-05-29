object FormIndex: TFormIndex
  Left = 182
  Top = 66
  Anchors = [akTop, akRight]
  AutoScroll = False
  Caption = #1057#1086#1089#1090#1072#1074' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
  ClientHeight = 493
  ClientWidth = 627
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = mm1
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnResize = FormResize
  OnShow = FormShow
  DesignSize = (
    627
    493)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 4
    Top = 2
    Width = 441
    Height = 16
    Anchors = [akLeft, akTop, akRight]
    AutoSize = False
    Caption = 'Label1'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lDocName: TLabel
    Left = 543
    Top = 218
    Width = 83
    Height = 27
    Alignment = taCenter
    Anchors = [akRight]
    AutoSize = False
    Caption = #8470' 000-0000 '#1086#1090' 00.00.00'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    WordWrap = True
    OnClick = bDocNameClick
  end
  object lbl1: TLabel
    Left = 452
    Top = -2
    Width = 167
    Height = 16
    Anchors = [akTop, akRight]
    AutoSize = False
    Caption = #1057#1082#1086#1087#1080#1088#1086#1074#1072#1085#1086' '#1074' '#1054#1040#1057#1059#1055
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    Visible = False
  end
  object BitBtnDelete: TBitBtn
    Left = 546
    Top = 96
    Width = 81
    Height = 25
    Anchors = [akTop, akRight]
    Caption = #1059#1076#1072#1083#1080#1090#1100
    Enabled = False
    TabOrder = 0
    OnClick = BitBtnDeleteClick
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      333333333333333333333333000033338833333333333333333F333333333333
      0000333911833333983333333388F333333F3333000033391118333911833333
      38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
      911118111118333338F3338F833338F3000033333911111111833333338F3338
      3333F8330000333333911111183333333338F333333F83330000333333311111
      8333333333338F3333383333000033333339111183333333333338F333833333
      00003333339111118333333333333833338F3333000033333911181118333333
      33338333338F333300003333911183911183333333383338F338F33300003333
      9118333911183333338F33838F338F33000033333913333391113333338FF833
      38F338F300003333333333333919333333388333338FFF830000333333333333
      3333333333333333333888330000333333333333333333333333333333333333
      0000}
    NumGlyphs = 2
  end
  object BitBtnUp: TBitBtn
    Left = 546
    Top = 126
    Width = 81
    Height = 25
    Anchors = [akTop, akRight]
    Enabled = False
    TabOrder = 1
    OnClick = BitBtnUpClick
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333000333
      3333333333777F33333333333300033333333333337F7F333333333333000333
      33333333337F7F33333333333300033333333333337F7F333333333333000333
      33333333337F7F33333333333300033333333333FF7F7FFFF333333000000000
      3333333777737777F333333000000000333333373F3333373333333300000003
      333333337F33337F33333333000000033333333373F333733333333330000033
      3333333337F337F3333333333000003333333333373F37333333333333000333
      33333333337F7F33333333333300033333333333337373333333333333303333
      333333333337F333333333333330333333333333333733333333}
    NumGlyphs = 2
  end
  object BitBtnDown: TBitBtn
    Left = 546
    Top = 156
    Width = 81
    Height = 25
    Anchors = [akTop, akRight]
    Enabled = False
    TabOrder = 2
    OnClick = BitBtnDownClick
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333303333
      333333333337F33333333333333033333333333333373F333333333333000333
      33333333337F7F33333333333300033333333333337373F33333333330000033
      3333333337F337F33333333330000033333333333733373F3333333300000003
      333333337F33337F33333333000000033333333373333373F333333000000000
      33333337FFFF3FF7F33333300000000033333337777F77773333333333000333
      33333333337F7F33333333333300033333333333337F7F333333333333000333
      33333333337F7F33333333333300033333333333337F7F333333333333000333
      33333333337F7F33333333333300033333333333337773333333}
    NumGlyphs = 2
  end
  object BitBtn1: TBitBtn
    Left = 546
    Top = 440
    Width = 81
    Height = 31
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = '&'#1042#1099#1093#1086#1076
    TabOrder = 3
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
  object DBGridIndex: TDBGrid
    Left = 0
    Top = 25
    Width = 543
    Height = 448
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = DataSourceIndex
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 4
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = DBGridIndexDblClick
    OnEnter = DBGridIndexEnter
    Columns = <
      item
        ButtonStyle = cbsEllipsis
        Expanded = False
        FieldName = 'Num'
        Title.Caption = #8470
        Width = 37
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'type'
        Title.Caption = #1058#1080#1087
        Width = 102
        Visible = True
      end
      item
        ButtonStyle = cbsEllipsis
        Expanded = False
        FieldName = 'Title'
        Title.Caption = #1053#1072#1079#1074#1072#1085#1080#1077
        Width = 378
        Visible = True
      end>
  end
  object Codes: TButton
    Left = 546
    Top = 370
    Width = 81
    Height = 33
    Anchors = [akRight, akBottom]
    Caption = #1057#1074#1086#1076#1082#1072' '#1082#1086#1076#1086#1074
    TabOrder = 6
    WordWrap = True
    OnClick = CodesClick
  end
  object ButtonCopy: TButton
    Left = 546
    Top = 300
    Width = 81
    Height = 33
    Hint = #1055#1088#1086#1089#1084#1086#1090#1088' '#1078#1091#1088#1085#1072#1083#1072#13#10#1087#1077#1088#1077#1076#1072#1095#1080' '#1076#1072#1085#1085#1099#1093#13#10#1087#1086' '#1089#1077#1090#1080
    Anchors = [akRight, akBottom]
    Caption = #1050#1086#1087#1080#1088#1086#1074#1072#1090#1100' '#1074' '#1054#1040#1057#1059#1055
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 7
    WordWrap = True
    OnClick = ButtonCopyClick
  end
  object ButtonExcel: TButton
    Left = 546
    Top = 248
    Width = 81
    Height = 17
    Anchors = [akRight, akBottom]
    Caption = 'Excel'
    TabOrder = 5
    Visible = False
    WordWrap = True
    OnClick = ButtonExcelClick
  end
  object bDocName: TButton
    Left = 546
    Top = 265
    Width = 81
    Height = 33
    Anchors = [akRight, akBottom]
    Caption = #1056#1077#1082#1074#1080#1079#1080#1090#1099' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
    TabOrder = 8
    WordWrap = True
    OnClick = bDocNameClick
  end
  object btn1: TBitBtn
    Left = 547
    Top = 55
    Width = 80
    Height = 25
    Anchors = [akTop, akRight]
    Caption = #1058'&'#1052#1062
    TabOrder = 9
    OnClick = btn1Click
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555500000000
      0555555F7777777775F55500FFFFFFFFF0555577F5FFFFFFF7F550F0FEEEEEEE
      F05557F7F777777757F550F0FFFFFFFFF05557F7F5FFFFFFF7F550F0FEEEEEEE
      F05557F7F777777757F550F0FF777FFFF05557F7F5FFFFFFF7F550F0FEEEEEEE
      F05557F7F777777757F550F0FF7F777FF05557F7F5FFFFFFF7F550F0FEEEEEEE
      F05557F7F777777757F550F0FF77F7FFF05557F7F5FFFFFFF7F550F0FEEEEEEE
      F05557F7F777777757F550F0FFFFFFFFF05557F7FF5F5F5F57F550F00F0F0F0F
      005557F77F7F7F7F77555055070707070555575F7F7F7F7F7F55550507070707
      0555557575757575755555505050505055555557575757575555}
    NumGlyphs = 2
  end
  object ButtonNet: TButton
    Left = 546
    Top = 405
    Width = 81
    Height = 33
    Hint = 
      #1055#1077#1088#1077#1076#1072#1095#1072' '#1076#1072#1085#1085#1099#1093' '#1087#1086' '#1082#1086#1088#1088#1077#1082#1090#1080#1088#1086#1074#1082#1077#13#10#1087#1083#1072#1085#1072' '#1080' '#1083#1080#1084#1080#1090#1072' ('#1086#1089#1090#1072#1090#1082#1072' '#1083#1080#1084#1080#1090#1072 +
      ')'#13#10#1087#1086' '#1089#1077#1090#1080' '#1074' '#1054#1040#1057#1059#1055
    Anchors = [akRight, akBottom]
    Caption = #1046#1091#1088#1085#1072#1083' '#1087#1077#1088#1077#1076#1072#1095#1080
    ParentShowHint = False
    ShowHint = True
    TabOrder = 10
    WordWrap = True
    OnClick = ButtonNetClick
  end
  object BitBtnCreate: TBitBtn
    Left = 546
    Top = 28
    Width = 81
    Height = 25
    Anchors = [akTop, akRight]
    Caption = #1053#1086#1074#1072#1103
    TabOrder = 11
    OnClick = BitBtnCreateClick
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
      5555555FFFFFFFFFF5555550000000000555557777777777F5555550FFFFFFFF
      0555557F5FFFF557F5555550F0000FFF0555557F77775557F5555550FFFFFFFF
      0555557F5FFFFFF7F5555550F000000F0555557F77777757F5555550FFFFFFFF
      0555557F5FFFFFF7F5555550F000000F0555557F77777757F5555550FFFFFFFF
      0555557F5FFF5557F5555550F000FFFF0555557F77755FF7F5555550FFFFF000
      0555557F5FF5777755555550F00FF0F05555557F77557F7555555550FFFFF005
      5555557FFFFF7755555555500000005555555577777775555555555555555555
      5555555555555555555555555555555555555555555555555555}
    NumGlyphs = 2
  end
  object stat1: TStatusBar
    Left = 0
    Top = 474
    Width = 627
    Height = 19
    Panels = <>
  end
  object btn2: TBitBtn
    Left = 546
    Top = 192
    Width = 35
    Height = 25
    Hint = #1069#1082#1089#1087#1086#1088#1090#13#10'('#1101#1082#1089#1087#1077#1088#1080#1084#1077#1085#1090#1072#1083#1100#1085#1072#1103' '#1092#1091#1085#1082#1094#1080#1103')'
    Anchors = [akTop, akRight]
    ParentShowHint = False
    ShowHint = True
    TabOrder = 13
    OnClick = btn2Click
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
  object btn3: TBitBtn
    Left = 592
    Top = 192
    Width = 35
    Height = 25
    Hint = #1048#1084#1087#1086#1088#1090#13#10'('#1101#1082#1089#1087#1077#1088#1080#1084#1077#1085#1090#1072#1083#1100#1085#1072#1103' '#1092#1091#1085#1082#1094#1080#1103')'
    Anchors = [akTop, akRight]
    ParentShowHint = False
    ShowHint = True
    TabOrder = 14
    OnClick = btn3Click
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
  object btnOPiUTMC: TBitBtn
    Left = 546
    Top = 62
    Width = 80
    Height = 25
    Anchors = [akTop, akRight]
    Caption = #1052#1072#1090#1077#1088#1080#1072#1083#1099
    TabOrder = 15
    Visible = False
    OnClick = btnOPiUTMCClick
  end
  object btnNativeExcel: TButton
    Left = 546
    Top = 335
    Width = 81
    Height = 33
    Anchors = [akRight, akBottom]
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1074' Ms Excel'
    TabOrder = 16
    WordWrap = True
    OnClick = btnNativeExcelClick
  end
  object TableIndex: TTable
    OnCalcFields = TableIndexCalcFields
    DatabaseName = 'd:\ProjectsD\NP01VN\NP01VN\NP01VN_'#1050#1086#1088#1088#1077#1082#1090#1080#1088#1086#1074#1082#1072' '#1087#1083#1072#1085#1072' 15.04.11\'
    TableName = 'NP01F0.DB'
    Left = 220
    Top = 160
    object TableIndexNum: TIntegerField
      FieldName = 'Num'
      Required = True
    end
    object TableIndexDigit: TIntegerField
      FieldName = 'Digit'
    end
    object TableIndextype: TStringField
      FieldKind = fkCalculated
      FieldName = 'type'
      Calculated = True
    end
    object TableIndexKod: TIntegerField
      FieldName = 'Kod'
    end
    object TableIndexFileName: TIntegerField
      FieldName = 'FileName'
    end
    object TableIndexTitle: TStringField
      FieldName = 'Title'
      Size = 255
    end
    object TableIndexMarsh: TStringField
      FieldName = 'Marsh'
      Size = 50
    end
    object TableIndexPrim: TStringField
      FieldName = 'Prim'
      Size = 50
    end
    object strngfldTableIndexData: TStringField
      FieldName = 'Data'
      Visible = False
      Size = 10
    end
  end
  object DataSourceIndex: TDataSource
    DataSet = TableIndex
    OnDataChange = DataSourceIndexDataChange
    Left = 256
    Top = 160
  end
  object SaveDialog1: TSaveDialog
    DefaultExt = 'xls'
    Filter = #1051#1080#1089#1090#1099' Excel (*.xls)|*.xls'
    Left = 139
    Top = 224
  end
  object PopupMenu2: TPopupMenu
    MenuAnimation = [maLeftToRight]
    Left = 233
    Top = 192
    object N3: TMenuItem
      Caption = #1050#1086#1088#1088#1077#1082#1090#1080#1088#1086#1074#1082#1072' '#1083#1080#1084#1080#1090#1072
      object NYear1: TMenuItem
        Caption = #1052#1077#1089#1103#1094
        Visible = False
        object Nm01: TMenuItem
          OnClick = Nm01Click
        end
        object Nm02: TMenuItem
          OnClick = Nm02Click
        end
        object Nm03: TMenuItem
          OnClick = Nm03Click
        end
        object Nm04: TMenuItem
          OnClick = Nm04Click
        end
        object Nm05: TMenuItem
          OnClick = Nm05Click
        end
        object Nm06: TMenuItem
          OnClick = Nm06Click
        end
        object Nm07: TMenuItem
          OnClick = Nm07Click
        end
        object Nm08: TMenuItem
          OnClick = Nm08Click
        end
        object Nm09: TMenuItem
          OnClick = Nm09Click
        end
        object Nm010: TMenuItem
          OnClick = Nm010Click
        end
        object Nm011: TMenuItem
          OnClick = Nm011Click
        end
        object Nm012: TMenuItem
          OnClick = Nm012Click
        end
      end
      object N11: TMenuItem
        Caption = #1058#1077#1082#1091#1097#1080#1081' '#1082#1074#1072#1088#1090#1072#1083
        OnClick = N11Click
      end
      object NQuart: TMenuItem
        Caption = #1055#1083#1072#1085#1080#1088#1091#1077#1084#1099#1081' '#1082#1074#1072#1088#1090#1072#1083
        OnClick = NQuartClick
      end
    end
    object N4: TMenuItem
      Caption = #1050#1086#1088#1088#1077#1082#1090#1080#1088#1086#1074#1082#1072' '#1086#1089#1090#1072#1090#1082#1072' '#1083#1080#1084#1080#1090#1072
      object NOst01: TMenuItem
        Visible = False
        OnClick = NOst01Click
      end
      object NOst02: TMenuItem
        Visible = False
        OnClick = NOst02Click
      end
      object NOst03: TMenuItem
        Visible = False
        OnClick = NOst03Click
      end
      object NOst04: TMenuItem
        Visible = False
        OnClick = NOst04Click
      end
      object NOst05: TMenuItem
        Visible = False
        OnClick = NOst05Click
      end
      object NOst06: TMenuItem
        Visible = False
        OnClick = NOst06Click
      end
      object NOst07: TMenuItem
        Visible = False
        OnClick = NOst07Click
      end
      object NOst08: TMenuItem
        Visible = False
        OnClick = NOst08Click
      end
      object NOst09: TMenuItem
        Visible = False
        OnClick = NOst09Click
      end
      object NOst010: TMenuItem
        Visible = False
        OnClick = NOst010Click
      end
      object NOst011: TMenuItem
        Visible = False
        OnClick = NOst011Click
      end
      object NOst012: TMenuItem
        Visible = False
        OnClick = NOst012Click
      end
    end
  end
  object pm1: TPopupMenu
    Left = 200
    Top = 192
    object N5: TMenuItem
      Caption = #1057#1090#1088#1086#1082#1072
      OnClick = N5Click
    end
    object N6: TMenuItem
      Caption = '-'
    end
    object N7: TMenuItem
      Caption = #1050#1086#1088#1088#1077#1082#1090#1080#1088#1086#1074#1082#1072' '#1087#1083#1072#1085#1072
      OnClick = N7Click
    end
    object N8: TMenuItem
      Caption = #1050#1086#1088#1088#1077#1082#1090#1080#1088#1086#1074#1082#1072' '#1087#1083#1072#1085#1072' '#1080' '#1083#1080#1084#1080#1090#1072
      OnClick = N8Click
    end
    object N9: TMenuItem
      Caption = #1050#1086#1088#1088#1077#1082#1090#1080#1088#1086#1074#1082#1072' '#1083#1080#1084#1080#1090#1072
      OnClick = N9Click
    end
    object N10: TMenuItem
      Caption = #1050#1086#1088#1088#1077#1082#1090#1080#1088#1086#1074#1082#1072' '#1086#1089#1090#1072#1090#1082#1072' '#1083#1080#1084#1080#1090#1072
      OnClick = N10Click
    end
  end
  object dlgOpen1: TOpenDialog
    DefaultExt = '.np01vn'
    Filter = #1060#1072#1081#1083' '#1087#1077#1088#1077#1076#1072#1095#1080' NP01VN|*.np01vn|'#1042#1089#1077' '#1092#1072#1081#1083#1099'|*.*'
    Options = [ofHideReadOnly, ofNoChangeDir, ofEnableSizing]
    Title = #1048#1084#1087#1086#1088#1090' '#1090#1072#1073#1083#1080#1094#1099
    Left = 216
    Top = 224
  end
  object dlgSave1: TSaveDialog
    DefaultExt = '.np01vn'
    Filter = #1060#1072#1081#1083' '#1087#1077#1088#1077#1076#1072#1095#1080' NP01VN|*.np01vn|'#1042#1089#1077' '#1092#1072#1081#1083#1099'|*.*'
    Options = [ofOverwritePrompt, ofHideReadOnly, ofNoChangeDir, ofEnableSizing]
    Title = #1069#1082#1089#1087#1086#1088#1090' '#1090#1072#1073#1083#1080#1094#1099
    Left = 176
    Top = 224
  end
  object mm1: TMainMenu
    Left = 272
    Top = 192
  end
  object pmKods: TPopupMenu
    Left = 136
    Top = 192
    object N1: TMenuItem
      Caption = #1087#1086' '#1095#1077#1088#1090#1077#1078#1072#1084
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #1087#1086' '#1084#1072#1090#1077#1088#1080#1072#1083#1072#1084
      OnClick = N2Click
    end
  end
  object vkdbNS03: TVKDBFNTX
    OEM = True
    SetDeleted = False
    FastPostRecord = False
    LookupOptions = []
    TrimInLocate = False
    TrimCType = True
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
    Left = 144
    Top = 160
  end
  object vkdbNs02nch: TVKDBFNTX
    OEM = True
    SetDeleted = False
    FastPostRecord = False
    LookupOptions = []
    TrimInLocate = False
    TrimCType = True
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
    Left = 184
    Top = 160
  end
  object pmOPiUTMC: TPopupMenu
    Left = 168
    Top = 200
    object N12: TMenuItem
      Caption = #1054#1087#1077#1088#1077#1078#1072#1102#1097#1080#1081' '#1083#1080#1084#1080#1090
      OnClick = N12Click
    end
    object N14: TMenuItem
      Caption = #1057#1085#1103#1090#1080#1077' '#1086#1087#1077#1088#1077#1078#1072#1102#1097#1077#1075#1086' '#1083#1080#1084#1080#1090#1072
      OnClick = N14Click
    end
    object N13: TMenuItem
      Caption = #1050#1086#1088#1088#1077#1082#1090#1080#1088#1086#1074#1082#1072' '#1086#1089#1090#1072#1090#1082#1072' '#1083#1080#1084#1080#1090#1072
      OnClick = N13Click
    end
  end
end
