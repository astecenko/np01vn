object NP01VN02Form2: TNP01VN02Form2
  Left = 105
  Top = 137
  Width = 780
  Height = 480
  Caption = #1055#1088#1086#1089#1084#1086#1090#1088' '#1089#1090#1088#1091#1082#1090#1091#1088#1099
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object spl1: TSplitter
    Left = 0
    Top = 185
    Width = 772
    Height = 3
    Cursor = crVSplit
    Align = alTop
  end
  object spl2: TSplitter
    Left = 0
    Top = 289
    Width = 772
    Height = 3
    Cursor = crVSplit
    Align = alTop
  end
  object tlb1: TToolBar
    Left = 0
    Top = 0
    Width = 772
    Height = 29
    ButtonHeight = 13
    Caption = 'tlb1'
    TabOrder = 0
    object lbl1: TLabel
      Left = 0
      Top = 2
      Width = 425
      Height = 13
      Align = alCustom
      Alignment = taCenter
      Anchors = [akLeft, akTop, akRight]
      Caption = #1050#1083#1080#1082' '#1087#1086' '#1079#1072#1087#1080#1089#1077' '#1090#1072#1073#1083#1080#1094#1099' '#1079#1072#1087#1086#1083#1085#1103#1077#1090' '#1087#1086#1080#1089#1082#1086#1074#1099#1077' '#1087#1086#1083#1103' '#1086#1089#1085#1086#1074#1085#1086#1081' '#1092#1086#1088#1084#1099
    end
  end
  object pnl1: TPanel
    Left = 0
    Top = 29
    Width = 772
    Height = 156
    Align = alTop
    Caption = 'pnl1'
    TabOrder = 1
    object dbgrdh1: TDBGridEh
      Left = 1
      Top = 1
      Width = 770
      Height = 154
      Align = alClient
      AutoFitColWidths = True
      ColumnDefValues.Title.TitleButton = True
      DataGrouping.GroupLevels = <>
      DataSource = ds1
      Flat = False
      FooterColor = clWindow
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -11
      FooterFont.Name = 'MS Sans Serif'
      FooterFont.Style = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghDialogFind, dghColumnResize, dghColumnMove, dghExtendVertLines]
      RowDetailPanel.Color = clBtnFace
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      TitleLines = 2
      OnDblClick = dbgrdh1DblClick
      Columns = <
        item
          EditButtons = <>
          FieldName = 'Title'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
          Width = 500
        end
        item
          EditButtons = <>
          FieldName = 'NameDoc'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #1056#1077#1082#1074#1080#1079#1080#1090#1099' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
        end
        item
          EditButtons = <>
          FieldName = 'SDate'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #1054#1090#1087#1088#1072#1074#1083#1077#1085#1086' '#1074' '#1054#1040#1057#1059#1055
        end>
      object RowDetailData: TRowDetailPanelControlEh
      end
    end
  end
  object pnl2: TPanel
    Left = 0
    Top = 188
    Width = 772
    Height = 101
    Align = alTop
    Caption = 'pnl2'
    TabOrder = 2
    object dbgrdh2: TDBGridEh
      Left = 1
      Top = 1
      Width = 770
      Height = 99
      Align = alClient
      AutoFitColWidths = True
      ColumnDefValues.Title.TitleButton = True
      DataGrouping.GroupLevels = <>
      DataSource = ds2
      Flat = False
      FooterColor = clWindow
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -11
      FooterFont.Name = 'MS Sans Serif'
      FooterFont.Style = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghDialogFind, dghColumnResize, dghColumnMove, dghExtendVertLines]
      RowDetailPanel.Color = clBtnFace
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDblClick = dbgrdh2DblClick
      Columns = <
        item
          EditButtons = <>
          FieldName = 'Title'
          Footers = <>
          Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1090#1072#1073#1083#1080#1094#1099
          Width = 500
        end
        item
          EditButtons = <>
          FieldName = 'Quart'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #1050#1074#1072#1088#1090#1072#1083
        end
        item
          EditButtons = <>
          FieldName = 'Kod'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #1058#1080#1087
        end>
      object RowDetailData: TRowDetailPanelControlEh
      end
    end
  end
  object pnl3: TPanel
    Left = 0
    Top = 292
    Width = 772
    Height = 161
    Align = alClient
    Caption = 'pnl3'
    TabOrder = 3
    object dbgrdh3: TDBGridEh
      Left = 1
      Top = 1
      Width = 770
      Height = 159
      Align = alClient
      AutoFitColWidths = True
      ColumnDefValues.Title.TitleButton = True
      DataGrouping.GroupLevels = <>
      DataSource = ds3
      Flat = False
      FooterColor = clWindow
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -11
      FooterFont.Name = 'MS Sans Serif'
      FooterFont.Style = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghDialogFind, dghColumnResize, dghColumnMove, dghExtendVertLines]
      RowDetailPanel.Color = clBtnFace
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDblClick = dbgrdh3DblClick
      Columns = <
        item
          Alignment = taCenter
          EditButtons = <>
          FieldName = 'Chert'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #1063#1077#1088#1090#1077#1078
        end
        item
          Alignment = taCenter
          EditButtons = <>
          FieldName = 'Kol'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #1048#1090#1086#1075#1086
          Width = 60
        end
        item
          EditButtons = <>
          FieldName = 'Kol1'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = '1 '#1084#1077#1089#1103#1094
          Width = 60
        end
        item
          EditButtons = <>
          FieldName = 'Kol2'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = '2 '#1084#1077#1089#1103#1094
          Width = 60
        end
        item
          EditButtons = <>
          FieldName = 'Kol3'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = '3 '#1084#1077#1089#1103#1094
          Width = 60
        end
        item
          EditButtons = <>
          FieldName = 'TM1'
          Footers = <>
          Title.Caption = #1058
        end
        item
          EditButtons = <>
          FieldName = 'TM2'
          Footers = <>
          Title.Caption = #1077
        end
        item
          EditButtons = <>
          FieldName = 'TM3'
          Footers = <>
          Title.Caption = #1093
        end
        item
          EditButtons = <>
          FieldName = 'TM4'
          Footers = <>
          Title.Caption = #1085
        end
        item
          EditButtons = <>
          FieldName = 'TM5'
          Footers = <>
          Title.Caption = #1086
        end
        item
          EditButtons = <>
          FieldName = 'TM6'
          Footers = <>
          Title.Caption = #1083'.'
        end
        item
          EditButtons = <>
          FieldName = 'TM7'
          Footers = <>
          Title.Caption = ' '
          Width = 17
        end
        item
          EditButtons = <>
          FieldName = 'TM8'
          Footers = <>
          Title.Caption = #1084
        end
        item
          EditButtons = <>
          FieldName = 'TM9'
          Footers = <>
          Title.Caption = #1072
        end
        item
          EditButtons = <>
          FieldName = 'TM10'
          Footers = <>
          Title.Caption = #1088
        end
        item
          EditButtons = <>
          FieldName = 'TM11'
          Footers = <>
          Title.Caption = #1096
        end
        item
          EditButtons = <>
          FieldName = 'TM12'
          Footers = <>
          Title.Caption = #1088
        end
        item
          EditButtons = <>
          FieldName = 'TM13'
          Footers = <>
          Title.Caption = #1091
        end
        item
          EditButtons = <>
          FieldName = 'TM14'
          Footers = <>
          Title.Caption = #1090
        end
        item
          EditButtons = <>
          FieldName = 'Primech'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
          Width = 160
        end>
      object RowDetailData: TRowDetailPanelControlEh
      end
    end
  end
  object ds1: TDataSource
    DataSet = qry1
    OnDataChange = ds1DataChange
    Left = 32
    Top = 48
  end
  object ds2: TDataSource
    DataSet = qry2
    OnDataChange = ds2DataChange
    Left = 32
    Top = 192
  end
  object ds3: TDataSource
    DataSet = qry3
    Left = 24
    Top = 332
  end
  object qry1: TQuery
    SQL.Strings = (
      'Select * From '#39'NP01VN02_0.DB'#39)
    Left = 72
    Top = 53
  end
  object qry2: TQuery
    SQL.Strings = (
      'Select * From '#39'NP01VN02_1.DB'#39' where DocID=:param1')
    Left = 88
    Top = 196
    ParamData = <
      item
        DataType = ftInteger
        Name = 'param1'
        ParamType = ptInput
        Value = 1
      end>
  end
  object qry3: TQuery
    SQL.Strings = (
      'Select * From '#39'NP01VN02_2.DB'#39' where TableID=:param1')
    Left = 72
    Top = 340
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'param1'
        ParamType = ptUnknown
      end>
    object intgrfldqry3TableID: TIntegerField
      FieldName = 'TableID'
    end
    object intgrfldqry3Kod: TIntegerField
      FieldName = 'Kod'
    end
    object strngfldqry3Chert: TStringField
      FieldName = 'Chert'
      Size = 13
    end
    object intgrfldqry3Kol_1: TIntegerField
      FieldName = 'Kol_1'
    end
    object intgrfldqry3Kol: TIntegerField
      FieldName = 'Kol'
    end
    object intgrfldqry3Kol1: TIntegerField
      FieldName = 'Kol1'
    end
    object intgrfldqry3Kol2: TIntegerField
      FieldName = 'Kol2'
    end
    object intgrfldqry3Kol3: TIntegerField
      FieldName = 'Kol3'
    end
    object strngfldqry3TM1: TStringField
      FieldName = 'TM1'
      Size = 2
    end
    object strngfldqry3TM2: TStringField
      FieldName = 'TM2'
      Size = 2
    end
    object strngfldqry3TM3: TStringField
      FieldName = 'TM3'
      Size = 2
    end
    object strngfldqry3TM4: TStringField
      FieldName = 'TM4'
      Size = 2
    end
    object strngfldqry3TM5: TStringField
      FieldName = 'TM5'
      Size = 2
    end
    object strngfldqry3TM6: TStringField
      FieldName = 'TM6'
      Size = 2
    end
    object strngfldqry3TM7: TStringField
      FieldName = 'TM7'
      Size = 2
    end
    object strngfldqry3TM8: TStringField
      FieldName = 'TM8'
      Size = 2
    end
    object strngfldqry3TM9: TStringField
      FieldName = 'TM9'
      Size = 2
    end
    object strngfldqry3TM10: TStringField
      FieldName = 'TM10'
      Size = 2
    end
    object strngfldqry3TM11: TStringField
      FieldName = 'TM11'
      Size = 2
    end
    object strngfldqry3TM12: TStringField
      FieldName = 'TM12'
      Size = 2
    end
    object strngfldqry3TM13: TStringField
      FieldName = 'TM13'
      Size = 2
    end
    object strngfldqry3TM14: TStringField
      FieldName = 'TM14'
      Size = 2
    end
    object strngfldqry3TM15: TStringField
      FieldName = 'TM15'
      Size = 2
    end
    object strngfldqry3TM16: TStringField
      FieldName = 'TM16'
      Size = 2
    end
    object strngfldqry3TM17: TStringField
      FieldName = 'TM17'
      Size = 2
    end
    object strngfldqry3TM18: TStringField
      FieldName = 'TM18'
      Size = 2
    end
    object strngfldqry3TM19: TStringField
      FieldName = 'TM19'
      Size = 2
    end
    object strngfldqry3TM20: TStringField
      FieldName = 'TM20'
      Size = 2
    end
    object strngfldqry3TM21: TStringField
      FieldName = 'TM21'
      Size = 2
    end
    object strngfldqry3TM22: TStringField
      FieldName = 'TM22'
      Size = 2
    end
    object strngfldqry3TM23: TStringField
      FieldName = 'TM23'
      Size = 2
    end
    object strngfldqry3TM24: TStringField
      FieldName = 'TM24'
      Size = 2
    end
    object strngfldqry3Primech: TStringField
      FieldName = 'Primech'
      Size = 255
    end
  end
end
