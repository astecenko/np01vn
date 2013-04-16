object FmJournal: TFmJournal
  Left = 40
  Top = 168
  BorderStyle = bsSingle
  Caption = #1046#1091#1088#1085#1072#1083' '#1087#1077#1088#1077#1076#1072#1095#1080' '#1076#1072#1085#1085#1099#1093' '#1074' '#1054#1040#1057#1059#1055
  ClientHeight = 445
  ClientWidth = 752
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object spl1: TSplitter
    Left = 0
    Top = 421
    Width = 752
    Height = 3
    Cursor = crVSplit
    Align = alBottom
  end
  object pnl2: TPanel
    Left = 0
    Top = 31
    Width = 752
    Height = 390
    Align = alClient
    TabOrder = 0
    object dbgrdh1: TDBGridEh
      Left = 1
      Top = 1
      Width = 750
      Height = 388
      Align = alClient
      AllowedOperations = [alopInsertEh, alopUpdateEh, alopAppendEh]
      AutoFitColWidths = True
      DataGrouping.GroupLevels = <>
      DataSource = ds1
      Flat = False
      FooterColor = clWindow
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -11
      FooterFont.Name = 'MS Sans Serif'
      FooterFont.Style = []
      OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghFitRowHeightToText, dghDialogFind, dghShowRecNo, dghColumnResize, dghColumnMove, dghAutoFitRowHeight, dghExtendVertLines]
      RowDetailPanel.Color = clBtnFace
      RowHeight = 4
      RowLines = 4
      RowSizingAllowed = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      TitleLines = 3
      OnDblClick = dbgrdh1DblClick
      OnGetCellParams = dbgrdh1GetCellParams
      Columns = <
        item
          EditButtons = <>
          FieldName = 'Mark'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #1052#1077#1090#1082#1072
          Title.Orientation = tohVertical
          Visible = False
          Width = 20
          OnGetCellParams = dbgrdh1Columns0GetCellParams
        end
        item
          EditButtons = <>
          FieldName = 'Mmyyyy'
          Footers = <>
          ReadOnly = True
          Title.Alignment = taCenter
          Title.Caption = #1044#1072#1090#1072' '#1083#1080#1084#1080#1090#1072
          OnGetCellParams = dbgrdh1Columns1GetCellParams
        end
        item
          EditButtons = <>
          FieldName = 'Fname2'
          Footers = <>
          ReadOnly = True
          Title.Alignment = taCenter
          Title.Caption = #1048#1084#1103' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
          Width = 120
        end
        item
          EditButtons = <>
          FieldName = 'Doc'
          Footers = <>
          ReadOnly = True
          Title.Alignment = taCenter
          Title.Caption = #1053#1086#1084#1077#1088' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
          Width = 105
          OnGetCellParams = dbgrdh1Columns3GetCellParams
        end
        item
          EditButtons = <>
          FieldName = 'Tname'
          Footers = <>
          ReadOnly = True
          Title.Alignment = taCenter
          Width = 140
        end
        item
          EditButtons = <>
          FieldName = 'Priznak'
          Footers = <>
          ReadOnly = True
          Title.Alignment = taCenter
          Title.Caption = #1058#1080#1087' '#1090#1072#1073#1083#1080#1094#1099
          Width = 48
        end
        item
          EditButtons = <>
          FieldName = 'Makname'
          Footers = <>
          ReadOnly = True
          Title.Orientation = tohVertical
          Width = 24
        end
        item
          EditButtons = <>
          FieldName = 'Kl'
          Footers = <>
          ReadOnly = True
          Title.Alignment = taCenter
          Title.Caption = #1050#1086#1083'-'#1074#1086' '#1089#1090#1088#1086#1082
          Width = 37
        end
        item
          EditButtons = <>
          FieldName = 'Sdate'
          Footers = <>
          ReadOnly = True
          Title.Alignment = taCenter
          Title.Caption = #1054#1090#1087#1088#1072#1074#1083'. '#1074' '#1054#1040#1057#1059#1055
          Width = 56
          OnGetCellParams = dbgrdh1Columns8GetCellParams
        end
        item
          EditButtons = <>
          FieldName = 'PDate'
          Footers = <>
          ReadOnly = True
          Title.Alignment = taCenter
          Title.Caption = #1042#1079#1103#1090' '#1074' '#1086#1073#1088#1072#1073#1086#1090#1082#1091' '#1054#1040#1057#1059#1055
          Width = 56
          OnGetCellParams = dbgrdh1Columns8GetCellParams
        end
        item
          EditButtons = <>
          FieldName = 'WDate'
          Footers = <>
          ReadOnly = True
          Title.Alignment = taCenter
          Title.Caption = #1054#1073#1088#1072'- '#1073#1086#1090#1072#1085' '#1054#1040#1057#1059#1055
          Width = 46
          OnGetCellParams = dbgrdh1Columns9GetCellParams
        end>
      object RowDetailData: TRowDetailPanelControlEh
      end
    end
  end
  object pnl3: TPanel
    Left = 0
    Top = 424
    Width = 752
    Height = 21
    Align = alBottom
    TabOrder = 1
    object stat1: TStatusBar
      Left = 1
      Top = 1
      Width = 750
      Height = 19
      Panels = <
        item
          Width = 100
        end
        item
          Width = 50
        end>
    end
  end
  object pnl4: TPanel
    Left = 0
    Top = 0
    Width = 752
    Height = 31
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 2
    DesignSize = (
      752
      31)
    object btnFiltr1: TSpeedButton
      Left = 121
      Top = 2
      Width = 41
      Height = 26
      Hint = #1055#1086#1082#1072#1079#1072#1090#1100' '#1090#1086#1083#1100#1082#1086' '#1090#1077#1082#1091#1097#1080#1081' '#1076#1086#1082#1091#1084#1077#1085#1090
      AllowAllUp = True
      GroupIndex = 1
      Flat = True
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
      ParentShowHint = False
      ShowHint = True
      OnClick = btnFiltr1Click
    end
    object bvl1: TBevel
      Left = 112
      Top = 3
      Width = 9
      Height = 23
      Shape = bsLeftLine
    end
    object btnFiltr2: TSpeedButton
      Left = 168
      Top = 2
      Width = 41
      Height = 26
      Hint = #1055#1086#1082#1072#1079#1072#1090#1100' '#1087#1083#1072#1085
      AllowAllUp = True
      GroupIndex = 3
      Caption = #1055#1083#1072#1085
      Flat = True
      ParentShowHint = False
      ShowHint = True
      OnClick = btnFiltr1Click
    end
    object btnFiltr3: TSpeedButton
      Left = 216
      Top = 2
      Width = 41
      Height = 26
      Hint = #1055#1086#1082#1072#1079#1072#1090#1100' '#1083#1080#1084#1080#1090' '#1058#1052#1062
      AllowAllUp = True
      GroupIndex = 3
      Caption = #1051#1080#1084#1080#1090
      Flat = True
      ParentShowHint = False
      ShowHint = True
      OnClick = btnFiltr1Click
    end
    object btnFiltr4: TSpeedButton
      Left = 264
      Top = 2
      Width = 41
      Height = 26
      Hint = #1055#1086#1082#1072#1079#1072#1090#1100' '#1085#1077#1086#1073#1088#1072#1073#1086#1090#1072#1085#1085#1099#1077
      AllowAllUp = True
      GroupIndex = 2
      Caption = #1053#1077#1086#1073#1088'.'
      Flat = True
      ParentShowHint = False
      ShowHint = True
      OnClick = btnFiltr1Click
    end
    object btnFiltr5: TSpeedButton
      Left = 312
      Top = 2
      Width = 41
      Height = 26
      Hint = #1055#1086#1082#1072#1079#1072#1090#1100' '#1086#1073#1088#1072#1073#1086#1090#1072#1085#1085#1099#1077
      AllowAllUp = True
      GroupIndex = 2
      Caption = #1042#1079#1103#1090
      Flat = True
      ParentShowHint = False
      ShowHint = True
      OnClick = btnFiltr1Click
    end
    object btnFiltr0: TSpeedButton
      Left = 408
      Top = 2
      Width = 41
      Height = 26
      Hint = #1054#1090#1084#1077#1085#1072' '#1074#1099#1073#1086#1088#1082#1080
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333000003
        333333333F777773FF333333008888800333333377333F3773F3333077870787
        7033333733337F33373F3308888707888803337F33337F33337F330777880887
        7703337F33337FF3337F3308888000888803337F333777F3337F330777700077
        7703337F33377733337FB3088888888888033373FFFFFFFFFF733B3000000000
        0033333777777777773333BBBB3333080333333333F3337F7F33BBBB707BB308
        03333333373F337F7F3333BB08033308033333337F7F337F7F333B3B08033308
        033333337F73FF737F33B33B778000877333333373F777337333333B30888880
        33333333373FFFF73333333B3300000333333333337777733333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btnFiltr0Click
    end
    object bvl2: TBevel
      Left = 456
      Top = 3
      Width = 9
      Height = 23
      Shape = bsLeftLine
    end
    object btnFiltr6: TSpeedButton
      Left = 360
      Top = 2
      Width = 41
      Height = 26
      Hint = #1055#1086#1082#1072#1079#1072#1090#1100' '#1086#1073#1088#1072#1073#1086#1090#1072#1085#1085#1099#1077
      AllowAllUp = True
      GroupIndex = 2
      Caption = #1054#1073#1088#1072#1073'.'
      Flat = True
      ParentShowHint = False
      ShowHint = True
      OnClick = btnFiltr1Click
    end
    object btn5: TBitBtn
      Left = 680
      Top = 2
      Width = 65
      Height = 26
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1080#1079' '#1078#1091#1088#1085#1072#1083#1072
      Anchors = [akTop, akRight]
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = btn5Click
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333FFFFF3333333333999993333333333F77777FFF333333999999999
        3333333777333777FF3333993333339993333377FF3333377FF3399993333339
        993337777FF3333377F3393999333333993337F777FF333337FF993399933333
        399377F3777FF333377F993339993333399377F33777FF33377F993333999333
        399377F333777FF3377F993333399933399377F3333777FF377F993333339993
        399377FF3333777FF7733993333339993933373FF3333777F7F3399933333399
        99333773FF3333777733339993333339933333773FFFFFF77333333999999999
        3333333777333777333333333999993333333333377777333333}
      NumGlyphs = 2
    end
    object btn4: TBitBtn
      Left = 8
      Top = 2
      Width = 97
      Height = 25
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      TabOrder = 1
      OnClick = btn4Click
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000333300
        0000377777FFFF7777770FFFF099990FFFF07FFFF777777FFFF7000000333300
        00007777773333777777307703333330770337FF7F333337FF7F300003333330
        0003377773333337777333993333333399333F7FFFF3333FF7FF000000333300
        0000777777F3337777770FFFF033330FFFF07FFFF7F3337FFFF7000000333300
        00007777773333777777307703333330770337FF7F333337FF7F300003333330
        0003377773FFFFF777733393300000033933337F3777777F37F3339990FFFF09
        99333373F7FFFF7FF73333399000000993333337777777777333333333077033
        33333333337FF7F3333333333300003333333333337777333333}
      NumGlyphs = 2
    end
  end
  object ds1: TDataSource
    DataSet = tbl1
    OnDataChange = ds1DataChange
    Left = 24
    Top = 200
  end
  object tbl1: TTable
    DatabaseName = 'd:\ProjectsD\NP01VN_NEW\trunk\NP01VN_maket\Resource\'
    FilterOptions = [foNoPartialCompare]
    FieldDefs = <
      item
        Name = 'Num'
        Attributes = [faReadonly]
        DataType = ftAutoInc
      end
      item
        Name = 'Mark'
        DataType = ftBoolean
      end
      item
        Name = 'Mmyyyy'
        DataType = ftString
        Size = 7
      end
      item
        Name = 'Tname'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'Kod'
        DataType = ftSmallint
      end
      item
        Name = 'OldKod'
        DataType = ftSmallint
      end
      item
        Name = 'Digit'
        DataType = ftInteger
      end
      item
        Name = 'OldDigit'
        DataType = ftInteger
      end
      item
        Name = 'Makname'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'Kl'
        DataType = ftInteger
      end
      item
        Name = 'FnId'
        DataType = ftInteger
      end
      item
        Name = 'Data'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'Sdate'
        DataType = ftDate
      end
      item
        Name = 'WDate'
        DataType = ftDate
      end
      item
        Name = 'PDate'
        DataType = ftDate
      end
      item
        Name = 'Rekv_P0'
        DataType = ftString
        Size = 80
      end
      item
        Name = 'Maket'
        DataType = ftMemo
        Size = 1
      end
      item
        Name = 'Spravka'
        DataType = ftMemo
        Size = 1
      end>
    IndexDefs = <
      item
        Name = 'tbl1Index1'
        Fields = 'Num'
        Options = [ixPrimary, ixUnique]
      end
      item
        Name = 'Fnid_Ind'
        Fields = 'FnId'
        Options = [ixCaseInsensitive]
      end>
    StoreDefs = True
    TableName = 'NP01VN.DB'
    Left = 24
    Top = 232
    object tbl1Mark: TBooleanField
      FieldName = 'Mark'
      OnChange = tbl1MarkChange
    end
    object strngfldtbl1Mmyyyy: TStringField
      DisplayLabel = #1052#1077#1089#1103#1094'.'#1075#1086#1076' '#1087#1077#1088#1077#1076#1072#1095#1080
      FieldName = 'Mmyyyy'
      Size = 7
    end
    object strngfldtbl1Tname: TStringField
      DisplayLabel = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1090#1072#1073#1083#1080#1094#1099
      FieldName = 'Tname'
      Size = 255
    end
    object strngfldtbl1Priznak: TStringField
      FieldKind = fkLookup
      FieldName = 'Priznak'
      LookupDataSet = tbl3
      LookupKeyFields = 'Num'
      LookupResultField = 'Priznak'
      KeyFields = 'Kod'
      Lookup = True
    end
    object smlntfldtbl1Kod: TSmallintField
      FieldName = 'Kod'
    end
    object strngfldtbl1Makname: TStringField
      DisplayLabel = #1052#1072#1082#1077#1090
      FieldName = 'Makname'
      Size = 2
    end
    object intgrfldtbl1Kl: TIntegerField
      DisplayLabel = #1050#1086#1083'.'#1089#1090#1088#1086#1082
      FieldName = 'Kl'
    end
    object dtfldtbl1Date: TDateField
      DisplayLabel = #1044#1072#1090#1072' '#1086#1090#1087#1088#1072#1074
      FieldName = 'Sdate'
    end
    object tbl1Maket: TMemoField
      FieldName = 'Maket'
      BlobType = ftMemo
      Size = 1
    end
    object tbl1Metk: TBooleanField
      AutoGenerateValue = arDefault
      FieldKind = fkCalculated
      FieldName = 'Metk'
      DisplayValues = 'False'
      Calculated = True
    end
    object atncfldtbl1Num: TAutoIncField
      FieldName = 'Num'
      ReadOnly = True
    end
    object intgrfldtbl1FnId: TIntegerField
      FieldName = 'FnId'
    end
    object strngfldtbl1Fname2: TStringField
      FieldKind = fkLookup
      FieldName = 'Fname2'
      LookupDataSet = tbl2
      LookupKeyFields = 'Id'
      LookupResultField = 'Fname'
      KeyFields = 'FnId'
      Size = 255
      Lookup = True
    end
    object mfldtbl1Spravka: TMemoField
      FieldName = 'Spravka'
      BlobType = ftMemo
      Size = 1
    end
    object dtfldtbl1WDate: TDateField
      FieldName = 'WDate'
    end
    object dtfldtbl1PDate: TDateField
      FieldName = 'PDate'
    end
    object strngfldtbl1Data: TStringField
      FieldName = 'Data'
      Size = 5
    end
    object intgrfldtbl1Digit: TIntegerField
      FieldName = 'Digit'
    end
    object smlntfldtbl1OldKod: TSmallintField
      FieldName = 'OldKod'
    end
    object intgrfldtbl1OldDigit: TIntegerField
      FieldName = 'OldDigit'
    end
    object strngfldtbl1Doc: TStringField
      FieldKind = fkLookup
      FieldName = 'Doc'
      LookupDataSet = tbl2
      LookupKeyFields = 'Id'
      LookupResultField = 'Doc'
      KeyFields = 'FnId'
      Size = 25
      Lookup = True
    end
  end
  object tbl2: TTable
    DatabaseName = 'd:\ProjectsD\NP01VN_NEW\trunk\NP01VN_maket\Resource\'
    IndexFieldNames = 'Id'
    TableName = 'NP01VN1.DB'
    Left = 56
    Top = 232
    object tbl2Id: TAutoIncField
      FieldName = 'Id'
      ReadOnly = True
    end
    object strngfldtbl2Fname: TStringField
      FieldName = 'Fname'
      Size = 255
    end
    object dtfldtbl2SDate: TDateField
      FieldName = 'SDate'
    end
    object strngfldtbl2Doc: TStringField
      FieldName = 'Doc'
      Size = 25
    end
  end
  object ds2: TDataSource
    DataSet = tbl2
    Left = 56
    Top = 200
  end
  object ds3: TDataSource
    DataSet = tbl3
    Left = 88
    Top = 200
  end
  object tbl3: TTable
    DatabaseName = 'Data\'
    ReadOnly = True
    TableName = 'NP01VN2.DB'
    Left = 88
    Top = 232
    object intgrfldtbl3Num: TIntegerField
      FieldName = 'Num'
    end
    object strngfldtbl3Priznak: TStringField
      FieldName = 'Priznak'
    end
  end
  object qry1: TQuery
    DatabaseName = 'Data\'
    Left = 24
    Top = 168
  end
  object dlgSave1: TSaveDialog
    DefaultExt = '.txt'
    Filter = #1058#1077#1082#1089#1090#1086#1074#1099#1077' '#1092#1072#1081#1083#1099'|*.txt|'#1042#1089#1077' '#1092#1072#1081#1083#1099'|*.*'
    Options = [ofHideReadOnly, ofNoChangeDir, ofEnableSizing]
    Left = 56
    Top = 168
  end
end
