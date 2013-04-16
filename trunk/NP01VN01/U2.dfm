object NP01VN01Form2: TNP01VN01Form2
  Left = 177
  Top = 145
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
    ButtonHeight = 25
    Caption = 'tlb1'
    TabOrder = 0
    object lbl1: TLabel
      Left = 0
      Top = 2
      Width = 770
      Height = 25
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
          FieldName = 'Cp'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #1062#1055
        end
        item
          Alignment = taCenter
          EditButtons = <>
          FieldName = 'Shifr'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #1064#1080#1092#1088
        end
        item
          Alignment = taCenter
          EditButtons = <>
          FieldName = 'Eim'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #1045#1048
        end
        item
          Alignment = taCenter
          EditButtons = <>
          FieldName = 'KI'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #1050#1048
        end
        item
          Alignment = taCenter
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
        end
        item
          EditButtons = <>
          FieldName = 'Kol2'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = '2 '#1084#1077#1089#1103#1094
        end
        item
          EditButtons = <>
          FieldName = 'Kol3'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = '3 '#1084#1077#1089#1103#1094
        end
        item
          Alignment = taCenter
          EditButtons = <>
          FieldName = 'Znak'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #1047#1085#1072#1082
          Width = 35
        end
        item
          EditButtons = <>
          FieldName = 'Primech'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
          Width = 180
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
      'Select * From '#39'NP01VN01_0.DB'#39)
    Left = 72
    Top = 53
  end
  object qry2: TQuery
    SQL.Strings = (
      'Select * From '#39'NP01VN01_1.DB'#39' where DocID=:param1')
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
    OnCalcFields = qry3CalcFields
    SQL.Strings = (
      'Select * From '#39'NP01VN01_2.DB'#39' where TableID=:param1')
    Left = 72
    Top = 340
    ParamData = <
      item
        DataType = ftInteger
        Name = 'param1'
        ParamType = ptInput
        Value = 1
      end>
    object intgrfldqry3TableID: TIntegerField
      FieldName = 'TableID'
    end
    object strngfldqry3Vp: TStringField
      FieldName = 'Vp'
      Size = 1
    end
    object strngfldqry3Cp: TStringField
      FieldName = 'Cp'
      Size = 3
    end
    object strngfldqry3Shifr: TStringField
      FieldName = 'Shifr'
      Size = 8
    end
    object strngfldqry3KI: TStringField
      FieldName = 'KI'
      Size = 4
    end
    object strngfldqry3Kol: TStringField
      FieldName = 'Kol'
      Size = 11
    end
    object intgrfldqry3Podrazd: TIntegerField
      FieldName = 'Podrazd'
    end
    object strngfldqry3Znak: TStringField
      FieldName = 'Znak'
      Size = 1
    end
    object strngfldqry3Eim: TStringField
      FieldName = 'Eim'
      Size = 5
    end
    object strngfldqry3Kol2: TStringField
      FieldName = 'Kol2'
      Size = 11
    end
    object strngfldqry3Primech: TStringField
      FieldName = 'Primech'
      Size = 50
    end
    object strngfldqry3Norma: TStringField
      FieldName = 'Norma'
      Size = 9
    end
    object strngfldqry3Kol_m: TStringField
      FieldName = 'Kol_m'
      Size = 3
    end
    object strngfldqry3Kol_m2: TStringField
      FieldName = 'Kol_m2'
      Size = 3
    end
    object strngfldqry3Kol_m3: TStringField
      FieldName = 'Kol_m3'
      Size = 3
    end
    object strngfldqry3Kol3: TStringField
      FieldName = 'Kol3'
      Size = 11
    end
    object fltfldqry3Itog: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Itog'
      Calculated = True
    end
  end
end
