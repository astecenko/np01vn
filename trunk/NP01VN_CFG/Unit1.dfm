object Form1: TForm1
  Left = 198
  Top = 129
  Width = 800
  Height = 480
  Caption = #1050#1086#1085#1092#1080#1075#1091#1088#1072#1090#1086#1088' NP01VN'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 13
  object spl1: TSplitter
    Left = 581
    Top = 0
    Height = 434
    Align = alRight
  end
  object stat1: TStatusBar
    Left = 0
    Top = 434
    Width = 792
    Height = 19
    Panels = <>
  end
  object pnl1: TPanel
    Left = 584
    Top = 0
    Width = 208
    Height = 434
    Align = alRight
    Caption = 'pnl1'
    TabOrder = 1
    object mmo1: TMemo
      Left = 1
      Top = 25
      Width = 206
      Height = 408
      Align = alClient
      TabOrder = 0
    end
    object actmmb1: TActionMainMenuBar
      Left = 1
      Top = 1
      Width = 206
      Height = 24
      UseSystemFont = False
      ActionManager = actmgr1
      Caption = 'actmmb1'
      ColorMap.HighlightColor = 14410210
      ColorMap.BtnSelectedColor = clBtnFace
      ColorMap.UnusedColor = 14410210
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      Spacing = 0
    end
  end
  object pnl2: TPanel
    Left = 0
    Top = 0
    Width = 581
    Height = 434
    Align = alClient
    Caption = 'pnl2'
    TabOrder = 2
    object pgc1: TPageControl
      Left = 1
      Top = 1
      Width = 579
      Height = 432
      ActivePage = ts1
      Align = alClient
      TabOrder = 0
      object ts1: TTabSheet
        Caption = 'NP01VN'
        DesignSize = (
          571
          404)
        object lbl1: TLabel
          Left = 0
          Top = 56
          Width = 220
          Height = 13
          Caption = #1057#1090#1072#1088#1090#1086#1074#1099#1081' '#1082#1072#1090#1072#1083#1086#1075' ('#1083#1086#1082#1072#1083#1100#1085#1086#1077' '#1093#1088#1072#1085#1080#1083#1080#1097#1077')'
          FocusControl = edtStartDir
        end
        object lbl2: TLabel
          Left = 0
          Top = 32
          Width = 212
          Height = 13
          Caption = #1056#1072#1089#1087#1086#1083#1086#1078#1077#1085#1080#1077' '#1089#1077#1090#1077#1074#1086#1075#1086' PDOXUSRS.NET'
          FocusControl = edtNetFileDir
        end
        object lbl3: TLabel
          Left = 0
          Top = 8
          Width = 100
          Height = 13
          Caption = #1050#1072#1090#1072#1083#1086#1075' '#1089' Bases.dbf'
          FocusControl = edtBases
        end
        object lbl5: TLabel
          Left = 0
          Top = 80
          Width = 211
          Height = 13
          Caption = #1050#1072#1090#1072#1083#1086#1075' '#1088#1072#1089#1087#1086#1083#1086#1078#1077#1085#1080#1103' np01vn_division.ini'
          FocusControl = edtDivisions
        end
        object lbl6: TLabel
          Left = 0
          Top = 104
          Width = 80
          Height = 13
          Caption = #1055#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1077
          FocusControl = edtDivision
        end
        object lbl7: TLabel
          Left = 0
          Top = 128
          Width = 190
          Height = 13
          Caption = #1050#1072#1090#1072#1083#1086#1075' '#1089#1077#1090#1077#1074#1086#1075#1086' '#1093#1088#1072#1085#1080#1083#1080#1097#1072' '#1054#1040#1057#1059#1055
          FocusControl = edtNetDir
        end
        object lbl8: TLabel
          Left = 0
          Top = 160
          Width = 125
          Height = 13
          Caption = #1050#1072#1090#1072#1083#1086#1075' '#1090#1072#1073#1083#1080#1094' '#1078#1091#1088#1085#1072#1083#1072
          FocusControl = edtJournalDir
        end
        object lbl9: TLabel
          Left = 0
          Top = 192
          Width = 106
          Height = 13
          Caption = #1050#1072#1090#1072#1083#1086#1075' '#1072#1088#1093#1080#1074#1072' '#1058#1052#1062
          FocusControl = edtTMSArhiv
        end
        object lbl10: TLabel
          Left = 0
          Top = 216
          Width = 123
          Height = 13
          Caption = #1050#1072#1090#1072#1083#1086#1075' '#1093#1088#1072#1085#1077#1085#1080#1103' '#1083#1086#1075#1086#1074
        end
        object edtBases: TEdit
          Left = 224
          Top = 0
          Width = 345
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
        end
        object edtNetFileDir: TEdit
          Left = 224
          Top = 24
          Width = 345
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 1
        end
        object edtStartDir: TEdit
          Left = 224
          Top = 50
          Width = 345
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 2
        end
        object edtDivisions: TEdit
          Left = 224
          Top = 74
          Width = 345
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 3
        end
        object edtDivision: TEdit
          Left = 224
          Top = 98
          Width = 345
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 4
        end
        object edtNetDir: TEdit
          Left = 222
          Top = 128
          Width = 345
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 5
        end
        object edtJournalDir: TEdit
          Left = 224
          Top = 160
          Width = 345
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 6
        end
        object edtTMSArhiv: TEdit
          Left = 224
          Top = 184
          Width = 345
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 7
        end
        object edtLogDir: TEdit
          Left = 224
          Top = 208
          Width = 345
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 8
        end
        object btn1: TButton
          Left = 488
          Top = 240
          Width = 75
          Height = 25
          Anchors = [akTop, akRight]
          Caption = '---=>'
          TabOrder = 9
          OnClick = btn1Click
        end
      end
      object ts2: TTabSheet
        Caption = 'NP01VN_Maket'
        ImageIndex = 1
      end
    end
  end
  object actmgr1: TActionManager
    ActionBars = <
      item
        Items = <
          item
            Items = <
              item
                Action = actLoadFile
                Caption = #1054#1090#1082#1088#1099#1090#1100' '#1082#1086#1085#1092#1080#1075#1091#1088#1072#1094#1080#1102' (*.&INI)'
              end
              item
                Action = actFileSave
              end
              item
                Caption = '-'
              end
              item
                Action = flxt1
                ImageIndex = 43
              end>
            Caption = #1060#1072#1081#1083
          end>
      end
      item
        Items = <
          item
            Items = <
              item
                Action = actLoadFile
                Caption = #1054#1090#1082#1088#1099#1090#1100' '#1082#1086#1085#1092#1080#1075#1091#1088#1072#1094#1080#1102' (*.&INI)'
              end
              item
                Action = actFileSave
              end
              item
                Action = flxt1
                ImageIndex = 43
              end>
            Caption = #1060#1072#1081#1083
          end>
        ActionBar = actmmb1
      end>
    Left = 136
    Top = 72
    StyleName = 'XP Style'
    object actLoadFile: TAction
      Category = #1060#1072#1081#1083
      Caption = #1054#1090#1082#1088#1099#1090#1100' '#1082#1086#1085#1092#1080#1075#1091#1088#1072#1094#1080#1102' (*.INI)'
      OnExecute = actLoadFileExecute
    end
    object actFileSave: TAction
      Category = #1060#1072#1081#1083
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1082#1086#1085#1092#1080#1075#1091#1088#1072#1094#1080#1102' '#1082#1072#1082'...'
    end
    object flxt1: TFileExit
      Category = #1060#1072#1081#1083
      Caption = #1042#1099#1093#1086#1076
      ImageIndex = 43
    end
  end
  object dlgOpen1: TOpenDialog
    Left = 332
    Top = 5
  end
  object dlgSave1: TSaveDialog
    Left = 364
    Top = 5
  end
end
