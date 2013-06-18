object FmParam: TFmParam
  Left = 256
  Top = 109
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsDialog
  Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099
  ClientHeight = 410
  ClientWidth = 383
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  DesignSize = (
    383
    410)
  PixelsPerInch = 96
  TextHeight = 13
  object btn1: TBitBtn
    Left = 56
    Top = 383
    Width = 89
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = #1055#1088#1080#1084#1077#1085#1080#1090#1100
    TabOrder = 0
    OnClick = btn1Click
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
      555555555555555555555555555555555555555555FF55555555555559055555
      55555555577FF5555555555599905555555555557777F5555555555599905555
      555555557777FF5555555559999905555555555777777F555555559999990555
      5555557777777FF5555557990599905555555777757777F55555790555599055
      55557775555777FF5555555555599905555555555557777F5555555555559905
      555555555555777FF5555555555559905555555555555777FF55555555555579
      05555555555555777FF5555555555557905555555555555777FF555555555555
      5990555555555555577755555555555555555555555555555555}
    NumGlyphs = 2
  end
  object btn2: TBitBtn
    Left = 232
    Top = 383
    Width = 89
    Height = 25
    Anchors = [akLeft, akBottom]
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    ModalResult = 2
    TabOrder = 1
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
  object pgc1: TPageControl
    Left = 0
    Top = 0
    Width = 383
    Height = 377
    ActivePage = ts5
    Align = alTop
    TabOrder = 2
    object ts1: TTabSheet
      Caption = #1054#1089#1085#1086#1074#1085#1099#1077
      object lbl7: TLabel
        Left = 8
        Top = 8
        Width = 100
        Height = 13
        Caption = #1050#1086#1076' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1103
      end
      object lbl8: TLabel
        Left = 8
        Top = 88
        Width = 113
        Height = 13
        Caption = #1042#1085#1077#1096#1085#1077#1077' '#1087#1088#1080#1083#1086#1078#1077#1085#1080#1077':'
      end
      object chk3: TCheckBox
        Left = 192
        Top = 64
        Width = 145
        Height = 17
        Alignment = taLeftJustify
        Caption = #1055#1086#1082#1072#1079#1099#1074#1072#1090#1100' '#1087#1086#1076#1089#1082#1072#1079#1082#1080
        TabOrder = 0
      end
      object chkAutoSave: TCheckBox
        Left = 0
        Top = 32
        Width = 201
        Height = 17
        Alignment = taLeftJustify
        Caption = #1040#1074#1090#1086#1089#1086#1093#1088#1072#1085#1077#1085#1080#1077' '#1090#1072#1073#1083#1080#1094' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
        TabOrder = 1
        OnClick = chkAutoSaveClick
      end
      object edt3: TEdit
        Left = 128
        Top = 88
        Width = 241
        Height = 21
        TabOrder = 2
      end
      object se3: TSpinEdit
        Left = 280
        Top = 4
        Width = 57
        Height = 22
        Enabled = False
        MaxLength = 3
        MaxValue = 999
        MinValue = 0
        TabOrder = 3
        Value = 0
      end
      object seAutoSave: TSpinEdit
        Left = 280
        Top = 32
        Width = 57
        Height = 22
        Hint = #1042#1088#1077#1084#1103' '#1074' '#1089#1077#1082#1091#1085#1076#1072#1093
        MaxLength = 4
        MaxValue = 7200
        MinValue = 30
        ParentShowHint = False
        ShowHint = True
        TabOrder = 4
        Value = 180
      end
    end
    object ts2: TTabSheet
      Caption = 'Ms Excel 1'
      ImageIndex = 1
      object lbl1: TLabel
        Left = 8
        Top = 8
        Width = 127
        Height = 13
        Caption = #1056#1072#1079#1084#1077#1088' '#1096#1088#1080#1092#1090#1072' Ms Excel'
      end
      object lbl10: TLabel
        Left = 248
        Top = 168
        Width = 12
        Height = 13
        Caption = #1085#1072
      end
      object lbl2: TLabel
        Left = 8
        Top = 32
        Width = 288
        Height = 13
        Caption = #1056#1072#1079#1084#1077#1088' '#1096#1088#1080#1092#1090#1072' '#1087#1086#1083#1103' '#1063#1077#1088#1090#1077#1078'/'#1064#1080#1092#1088' '#1084#1072#1090#1077#1088#1080#1072#1083#1072' Ms Excel'
      end
      object lbl5: TLabel
        Left = 8
        Top = 56
        Width = 168
        Height = 13
        Caption = #1054#1088#1080#1077#1085#1090#1072#1094#1080#1103' '#1089#1090#1088#1072#1085#1080#1094#1099' '#1074' Ms Excel'
      end
      object lbl6: TLabel
        Left = 8
        Top = 80
        Width = 152
        Height = 13
        Caption = #1060#1086#1088#1084#1072#1090' '#1089#1090#1088#1072#1085#1080#1094#1099' '#1074' Ms Excel '
      end
      object lbl9: TLabel
        Left = 248
        Top = 144
        Width = 12
        Height = 13
        Caption = #1085#1072
      end
      object cbb1: TComboBox
        Left = 240
        Top = 54
        Width = 97
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        ItemIndex = 1
        TabOrder = 0
        Text = #1040#1083#1100#1073#1086#1084#1085#1072#1103
        Items.Strings = (
          #1050#1085#1080#1078#1085#1072#1103
          #1040#1083#1100#1073#1086#1084#1085#1072#1103)
      end
      object cbb2: TComboBox
        Left = 240
        Top = 78
        Width = 97
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 1
        Items.Strings = (
          'A4'
          'A3')
      end
      object chk1: TCheckBox
        Left = 8
        Top = 104
        Width = 313
        Height = 17
        Alignment = taLeftJustify
        Caption = #1056#1072#1079#1076#1077#1083#1103#1090#1100' '#1074' Ms Excel '#1089#1090#1088#1072#1085#1080#1094#1099' '#1058#1052#1062' '#1080' '#1080#1079#1076#1077#1083#1080#1081
        TabOrder = 2
      end
      object chk2: TCheckBox
        Left = 8
        Top = 188
        Width = 313
        Height = 17
        Alignment = taLeftJustify
        Caption = #1054#1090#1082#1088#1099#1074#1072#1090#1100' Ms Excel '#1087#1086#1089#1083#1077' '#1089#1086#1093#1088#1072#1085#1077#1085#1080#1103' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
        TabOrder = 3
      end
      object chkExchenPrimech: TCheckBox
        Left = 8
        Top = 144
        Width = 233
        Height = 17
        Alignment = taLeftJustify
        Caption = #1047#1072#1084#1077#1085#1103#1090#1100' '#1087#1086#1074#1090#1086#1088#1103#1102#1097#1077#1077#1089#1103' '#1087#1088#1080#1084#1077#1095#1072#1085#1080#1077
        TabOrder = 4
        OnClick = chkExchenPrimechClick
      end
      object chkExchenTitle: TCheckBox
        Left = 8
        Top = 168
        Width = 233
        Height = 17
        Alignment = taLeftJustify
        Caption = #1047#1072#1084#1077#1085#1103#1090#1100' '#1087#1086#1074#1090#1086#1088#1103#1102#1097#1077#1077#1089#1103' '#1085#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
        TabOrder = 5
        OnClick = chkExchenTitleClick
      end
      object chkPrintShifr: TCheckBox
        Left = 8
        Top = 120
        Width = 313
        Height = 17
        Alignment = taLeftJustify
        Caption = #1042#1099#1074#1086#1076#1080#1090#1100' '#1074' Ms Excel '#1085#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1103' '#1058#1052#1062' '#1080' '#1095#1077#1088#1090#1077#1078#1077#1081
        TabOrder = 6
      end
      object edtPrimech: TEdit
        Left = 264
        Top = 140
        Width = 57
        Height = 21
        Enabled = False
        TabOrder = 7
        Text = '"-'
      end
      object edtTitle: TEdit
        Left = 264
        Top = 164
        Width = 57
        Height = 21
        Enabled = False
        TabOrder = 8
      end
      object se1: TSpinEdit
        Left = 312
        Top = 2
        Width = 57
        Height = 22
        MaxValue = 24
        MinValue = 7
        TabOrder = 9
        Value = 7
      end
      object se2: TSpinEdit
        Left = 312
        Top = 28
        Width = 57
        Height = 22
        MaxValue = 24
        MinValue = 7
        TabOrder = 10
        Value = 12
      end
      object grp1: TGroupBox
        Left = 1
        Top = 207
        Width = 373
        Height = 114
        Caption = '  '#1064#1072#1073#1083#1086#1085#1099'  '
        TabOrder = 11
        object lbl3: TLabel
          Left = 8
          Top = 16
          Width = 108
          Height = 13
          Caption = #1044#1086#1083#1078#1085#1086#1089#1090#1100' '#1072#1076#1088#1077#1089#1072#1090#1072
        end
        object lbl4: TLabel
          Left = 8
          Top = 40
          Width = 77
          Height = 13
          Caption = #1060#1048#1054' '#1072#1076#1088#1077#1089#1072#1090#1072
        end
        object lbl11: TLabel
          Left = 8
          Top = 64
          Width = 120
          Height = 13
          Caption = #1044#1086#1083#1078#1085#1086#1089#1090#1100' '#1087#1086#1076#1087#1080#1089#1072#1085#1090#1072
        end
        object lbl12: TLabel
          Left = 8
          Top = 88
          Width = 89
          Height = 13
          Caption = #1060#1048#1054' '#1087#1086#1076#1087#1080#1089#1072#1085#1090#1072
        end
        object edtDolgnostAdres: TEdit
          Left = 136
          Top = 12
          Width = 229
          Height = 21
          TabOrder = 0
        end
        object edtFIOAdres: TEdit
          Left = 136
          Top = 37
          Width = 229
          Height = 21
          TabOrder = 1
        end
        object edtDolgnostPodpis: TEdit
          Left = 136
          Top = 62
          Width = 229
          Height = 21
          TabOrder = 2
        end
        object edtFIOPodpis: TEdit
          Left = 136
          Top = 86
          Width = 229
          Height = 21
          TabOrder = 3
        end
      end
    end
    object ts5: TTabSheet
      Caption = 'Ms Excel 2'
      ImageIndex = 4
      OnMouseMove = ts5MouseMove
      object lbl17: TLabel
        Left = 0
        Top = 0
        Width = 343
        Height = 13
        Caption = #1064#1080#1088#1080#1085#1072' '#1089#1090#1086#1083#1073#1094#1086#1074' '#1074' '#1087#1091#1085#1082#1090#1072#1093', '#1089#1090#1072#1085#1076#1072#1088#1090' + '#1080#1079#1084#1077#1085#1077#1085#1080#1077', '#1074#1099#1088#1072#1074#1085#1080#1074#1072#1085#1080#1077':'
      end
      object lbl18: TLabel
        Left = 36
        Top = 16
        Width = 76
        Height = 13
        Hint = #8470#8470
        Caption = #1057#1090#1086#1083#1073#1077#1094' A   5 +'
        ParentShowHint = False
        ShowHint = True
        OnMouseMove = lbl18MouseMove
        OnMouseLeave = lbl18MouseLeave
      end
      object lbl19: TLabel
        Left = 36
        Top = 40
        Width = 94
        Height = 13
        Hint = #1095#1072#1089#1090#1100' '#1087#1086#1083#1103' '#1050#1086#1076
        Caption = #1057#1090#1086#1083#1073#1077#1094'  B   1.55 +'
        ParentShowHint = False
        ShowHint = True
        OnMouseMove = lbl18MouseMove
        OnMouseLeave = lbl18MouseLeave
      end
      object lbl20: TLabel
        Left = 36
        Top = 64
        Width = 88
        Height = 13
        Hint = #1050#1086#1076' '#1080#1079#1076#1077#1083#1080#1103
        Caption = #1057#1090#1086#1083#1073#1077#1094' C  6.14 +'
        ParentShowHint = False
        ShowHint = True
        OnMouseMove = lbl18MouseMove
        OnMouseLeave = lbl18MouseLeave
      end
      object lbl21: TLabel
        Left = 36
        Top = 88
        Width = 80
        Height = 13
        Hint = #1064#1080#1092#1088'/'#1095#1077#1088#1090#1077#1078
        Caption = #1057#1090#1086#1083#1073#1077#1094' D  16 +'
        ParentShowHint = False
        ShowHint = True
        OnMouseMove = lbl18MouseMove
        OnMouseLeave = lbl18MouseLeave
      end
      object lbl22: TLabel
        Left = 36
        Top = 112
        Width = 73
        Height = 13
        Hint = #1058#1052#1062':'#1045#1076'.'#1080#1079#1084#13#10#1063#1077#1088#1090#1077#1078':'#1050#1086#1083#1080#1095#1077#1089#1090#1074#1086
        Caption = #1057#1090#1086#1083#1073#1077#1094' E  6 +'
        ParentShowHint = False
        ShowHint = True
        OnMouseMove = lbl18MouseMove
        OnMouseLeave = lbl18MouseLeave
      end
      object lbl23: TLabel
        Left = 36
        Top = 136
        Width = 78
        Height = 13
        Hint = #1063#1077#1088#1090#1077#1078': 1 '#1084#1077#1089#13#10#1058#1052#1062' '#1082#1074#1072#1088#1090': 1 '#1084#1077#1089#13#10#1058#1052#1062' '#1084#1077#1089': '#1095#1072#1089#1090#1100' '#1084#1077#1089
        Caption = #1057#1090#1086#1083#1073#1077#1094' F  10 +'
        ParentShowHint = False
        ShowHint = True
        OnMouseMove = lbl18MouseMove
        OnMouseLeave = lbl18MouseLeave
      end
      object lbl24: TLabel
        Left = 36
        Top = 160
        Width = 80
        Height = 13
        Hint = #1063#1077#1088#1090#1077#1078': 2 '#1084#1077#1089#13#10#1058#1052#1062' '#1082#1074#1072#1088#1090': 2 '#1084#1077#1089#13#10#1058#1052#1062' '#1084#1077#1089': '#1095#1072#1089#1090#1100' '#1084#1077#1089
        Caption = #1057#1090#1086#1083#1073#1077#1094' G  10 +'
        ParentShowHint = False
        ShowHint = True
        OnMouseMove = lbl18MouseMove
        OnMouseLeave = lbl18MouseLeave
      end
      object lbl25: TLabel
        Left = 36
        Top = 184
        Width = 80
        Height = 13
        Hint = #1063#1077#1088#1090#1077#1078': 3 '#1084#1077#1089#13#10#1058#1052#1062' '#1082#1074#1072#1088#1090': 3 '#1084#1077#1089#13#10#1058#1052#1062' '#1084#1077#1089': '#1095#1072#1089#1090#1100' '#1062#1055
        Caption = #1057#1090#1086#1083#1073#1077#1094' H  10 +'
        ParentShowHint = False
        ShowHint = True
        OnMouseMove = lbl18MouseMove
        OnMouseLeave = lbl18MouseLeave
      end
      object lbl26: TLabel
        Left = 36
        Top = 208
        Width = 69
        Height = 13
        Hint = #1063#1077#1088#1090#1077#1078': '#1087#1088#1086#1087#1091#1089#1082' '#1087#1077#1088#1077#1076' '#1058#1052#13#10#1058#1052#1062' : '#1095#1072#1089#1090#1100' '#1062#1055
        Caption = #1057#1090#1086#1083#1073#1077#1094' I  1 +'
        ParentShowHint = False
        ShowHint = True
        OnMouseMove = lbl18MouseMove
        OnMouseLeave = lbl18MouseLeave
      end
      object lbl27: TLabel
        Left = 36
        Top = 232
        Width = 108
        Height = 13
        Hint = #1063#1077#1088#1090#1077#1078': '#1094#1077#1093' '#1058#1052#13#10#1058#1052#1062' : '#1089#1084#1086#1090#1088#1080#1090#1077' '#1092#1072#1081#1083' Excel'
        Caption = #1057#1090#1086#1083#1073#1094#1099' J - W  2.29 +'
        ParentShowHint = False
        ShowHint = True
        OnMouseMove = lbl18MouseMove
        OnMouseLeave = lbl18MouseLeave
      end
      object lbl28: TLabel
        Left = 36
        Top = 256
        Width = 79
        Height = 13
        Hint = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081
        Caption = #1057#1090#1086#1083#1073#1077#1094' X  25 +'
        ParentShowHint = False
        ShowHint = True
        OnMouseMove = lbl18MouseMove
        OnMouseLeave = lbl18MouseLeave
      end
      object lbl29: TLabel
        Left = 36
        Top = 280
        Width = 79
        Height = 13
        Hint = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1058#1052#1062'/'#1095#1077#1088#1090#1077#1078#1072
        Caption = #1057#1090#1086#1083#1073#1077#1094' Y  30 +'
        ParentShowHint = False
        ShowHint = True
        OnMouseMove = lbl18MouseMove
        OnMouseLeave = lbl18MouseLeave
      end
      object lbl15: TLabel
        Left = 64
        Top = 302
        Width = 257
        Height = 45
        AutoSize = False
        Caption = '.'
      end
      object jvspined1: TJvSpinEdit
        Left = 152
        Top = 16
        Width = 73
        Height = 21
        Hint = #8470#8470
        MaxValue = 100.000000000000000000
        MinValue = -6.000000000000000000
        ValueType = vtFloat
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
      end
      object jvspined2: TJvSpinEdit
        Left = 152
        Top = 40
        Width = 73
        Height = 21
        Hint = #1095#1072#1089#1090#1100' '#1087#1086#1083#1103' '#1050#1086#1076
        MaxValue = 100.000000000000000000
        MinValue = -2.000000000000000000
        ValueType = vtFloat
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
      end
      object jvspined3: TJvSpinEdit
        Left = 152
        Top = 64
        Width = 73
        Height = 21
        Hint = #1050#1086#1076' '#1080#1079#1076#1077#1083#1080#1103
        MaxValue = 100.000000000000000000
        MinValue = -7.000000000000000000
        ValueType = vtFloat
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
      end
      object jvspined4: TJvSpinEdit
        Left = 152
        Top = 88
        Width = 73
        Height = 21
        Hint = #1064#1080#1092#1088'/'#1095#1077#1088#1090#1077#1078
        MaxValue = 100.000000000000000000
        MinValue = -16.000000000000000000
        ValueType = vtFloat
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
      end
      object jvspined5: TJvSpinEdit
        Left = 152
        Top = 112
        Width = 73
        Height = 21
        Hint = #1058#1052#1062':'#1045#1076'.'#1080#1079#1084#13#10#1063#1077#1088#1090#1077#1078':'#1050#1086#1083#1080#1095#1077#1089#1090#1074#1086
        MaxValue = 100.000000000000000000
        MinValue = -7.000000000000000000
        ValueType = vtFloat
        ParentShowHint = False
        ShowHint = True
        TabOrder = 4
      end
      object jvspined6: TJvSpinEdit
        Left = 152
        Top = 136
        Width = 73
        Height = 21
        Hint = #1063#1077#1088#1090#1077#1078': 1 '#1084#1077#1089#13#10#1058#1052#1062' '#1082#1074#1072#1088#1090': 1 '#1084#1077#1089#13#10#1058#1052#1062' '#1084#1077#1089': '#1095#1072#1089#1090#1100' '#1084#1077#1089
        MaxValue = 100.000000000000000000
        MinValue = -11.000000000000000000
        ValueType = vtFloat
        ParentShowHint = False
        ShowHint = True
        TabOrder = 5
      end
      object jvspined7: TJvSpinEdit
        Left = 152
        Top = 160
        Width = 73
        Height = 21
        Hint = #1063#1077#1088#1090#1077#1078': 2 '#1084#1077#1089#13#10#1058#1052#1062' '#1082#1074#1072#1088#1090': 2 '#1084#1077#1089#13#10#1058#1052#1062' '#1084#1077#1089': '#1095#1072#1089#1090#1100' '#1084#1077#1089
        MaxValue = 100.000000000000000000
        MinValue = -11.000000000000000000
        ValueType = vtFloat
        ParentShowHint = False
        ShowHint = True
        TabOrder = 6
      end
      object jvspined8: TJvSpinEdit
        Left = 152
        Top = 184
        Width = 73
        Height = 21
        Hint = #1063#1077#1088#1090#1077#1078': 3 '#1084#1077#1089#13#10#1058#1052#1062' '#1082#1074#1072#1088#1090': 3 '#1084#1077#1089#13#10#1058#1052#1062' '#1084#1077#1089': '#1095#1072#1089#1090#1100' '#1062#1055
        MaxValue = 100.000000000000000000
        MinValue = -11.000000000000000000
        ValueType = vtFloat
        ParentShowHint = False
        ShowHint = True
        TabOrder = 7
      end
      object jvspined9: TJvSpinEdit
        Left = 152
        Top = 208
        Width = 73
        Height = 21
        Hint = #1063#1077#1088#1090#1077#1078': '#1087#1088#1086#1087#1091#1089#1082' '#1087#1077#1088#1077#1076' '#1058#1052#13#10#1058#1052#1062' : '#1095#1072#1089#1090#1100' '#1062#1055
        MaxValue = 100.000000000000000000
        MinValue = -2.000000000000000000
        ValueType = vtFloat
        ParentShowHint = False
        ShowHint = True
        TabOrder = 8
      end
      object jvspined10: TJvSpinEdit
        Left = 152
        Top = 232
        Width = 73
        Height = 21
        Hint = #1063#1077#1088#1090#1077#1078': '#1094#1077#1093' '#1058#1052#13#10#1058#1052#1062' : '#1089#1084#1086#1090#1088#1080#1090#1077' '#1092#1072#1081#1083' Excel'
        MaxValue = 100.000000000000000000
        MinValue = -3.000000000000000000
        ValueType = vtFloat
        ParentShowHint = False
        ShowHint = True
        TabOrder = 9
      end
      object jvspined11: TJvSpinEdit
        Left = 152
        Top = 256
        Width = 73
        Height = 21
        Hint = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081
        MaxValue = 200.000000000000000000
        MinValue = -31.000000000000000000
        ValueType = vtFloat
        ParentShowHint = False
        ShowHint = True
        TabOrder = 10
      end
      object jvspined12: TJvSpinEdit
        Left = 152
        Top = 280
        Width = 73
        Height = 21
        Hint = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1058#1052#1062'/'#1095#1077#1088#1090#1077#1078#1072
        MaxValue = 200.000000000000000000
        MinValue = -31.000000000000000000
        ValueType = vtFloat
        ParentShowHint = False
        ShowHint = True
        TabOrder = 11
      end
      object cbbHAlign1: TComboBox
        Left = 232
        Top = 16
        Width = 105
        Height = 21
        Hint = #8470#8470
        Style = csDropDownList
        ItemHeight = 13
        ItemIndex = 0
        ParentShowHint = False
        ShowHint = True
        TabOrder = 12
        Text = #1055#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
        Items.Strings = (
          #1055#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
          #1055#1086' '#1096#1080#1088#1080#1085#1077
          #1055#1086' '#1083#1077#1074#1086#1084#1091' '#1082#1088#1072#1102
          #1055#1086' '#1094#1077#1085#1090#1088#1091
          #1055#1086' '#1087#1088#1072#1074#1086#1084#1091' '#1082#1088#1072#1102)
      end
      object cbbHAlign2: TComboBox
        Left = 232
        Top = 40
        Width = 105
        Height = 21
        Hint = #1095#1072#1089#1090#1100' '#1087#1086#1083#1103' '#1050#1086#1076
        Style = csDropDownList
        ItemHeight = 13
        ItemIndex = 0
        ParentShowHint = False
        ShowHint = True
        TabOrder = 13
        Text = #1055#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
        Items.Strings = (
          #1055#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
          #1055#1086' '#1096#1080#1088#1080#1085#1077
          #1055#1086' '#1083#1077#1074#1086#1084#1091' '#1082#1088#1072#1102
          #1055#1086' '#1094#1077#1085#1090#1088#1091
          #1055#1086' '#1087#1088#1072#1074#1086#1084#1091' '#1082#1088#1072#1102)
      end
      object cbbHAlign3: TComboBox
        Left = 232
        Top = 64
        Width = 105
        Height = 21
        Hint = #1050#1086#1076' '#1080#1079#1076#1077#1083#1080#1103
        Style = csDropDownList
        ItemHeight = 13
        ItemIndex = 0
        ParentShowHint = False
        ShowHint = True
        TabOrder = 14
        Text = #1055#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
        Items.Strings = (
          #1055#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
          #1055#1086' '#1096#1080#1088#1080#1085#1077
          #1055#1086' '#1083#1077#1074#1086#1084#1091' '#1082#1088#1072#1102
          #1055#1086' '#1094#1077#1085#1090#1088#1091
          #1055#1086' '#1087#1088#1072#1074#1086#1084#1091' '#1082#1088#1072#1102)
      end
      object cbbHAlign4: TComboBox
        Left = 232
        Top = 88
        Width = 105
        Height = 21
        Hint = #1064#1080#1092#1088'/'#1095#1077#1088#1090#1077#1078
        Style = csDropDownList
        ItemHeight = 13
        ItemIndex = 0
        ParentShowHint = False
        ShowHint = True
        TabOrder = 15
        Text = #1055#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
        Items.Strings = (
          #1055#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
          #1055#1086' '#1096#1080#1088#1080#1085#1077
          #1055#1086' '#1083#1077#1074#1086#1084#1091' '#1082#1088#1072#1102
          #1055#1086' '#1094#1077#1085#1090#1088#1091
          #1055#1086' '#1087#1088#1072#1074#1086#1084#1091' '#1082#1088#1072#1102)
      end
      object cbbHAlign5: TComboBox
        Left = 232
        Top = 112
        Width = 105
        Height = 21
        Hint = #1058#1052#1062':'#1045#1076'.'#1080#1079#1084#13#10#1063#1077#1088#1090#1077#1078':'#1050#1086#1083#1080#1095#1077#1089#1090#1074#1086
        Style = csDropDownList
        ItemHeight = 13
        ItemIndex = 0
        ParentShowHint = False
        ShowHint = True
        TabOrder = 16
        Text = #1055#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
        Items.Strings = (
          #1055#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
          #1055#1086' '#1096#1080#1088#1080#1085#1077
          #1055#1086' '#1083#1077#1074#1086#1084#1091' '#1082#1088#1072#1102
          #1055#1086' '#1094#1077#1085#1090#1088#1091
          #1055#1086' '#1087#1088#1072#1074#1086#1084#1091' '#1082#1088#1072#1102)
      end
      object cbbHAlign6: TComboBox
        Left = 232
        Top = 136
        Width = 105
        Height = 21
        Hint = #1063#1077#1088#1090#1077#1078': 1 '#1084#1077#1089#13#10#1058#1052#1062' '#1082#1074#1072#1088#1090': 1 '#1084#1077#1089#13#10#1058#1052#1062' '#1084#1077#1089': '#1095#1072#1089#1090#1100' '#1084#1077#1089
        Style = csDropDownList
        ItemHeight = 13
        ItemIndex = 0
        ParentShowHint = False
        ShowHint = True
        TabOrder = 17
        Text = #1055#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
        Items.Strings = (
          #1055#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
          #1055#1086' '#1096#1080#1088#1080#1085#1077
          #1055#1086' '#1083#1077#1074#1086#1084#1091' '#1082#1088#1072#1102
          #1055#1086' '#1094#1077#1085#1090#1088#1091
          #1055#1086' '#1087#1088#1072#1074#1086#1084#1091' '#1082#1088#1072#1102)
      end
      object cbbHAlign7: TComboBox
        Left = 232
        Top = 160
        Width = 105
        Height = 21
        Hint = #1063#1077#1088#1090#1077#1078': 2 '#1084#1077#1089#13#10#1058#1052#1062' '#1082#1074#1072#1088#1090': 2 '#1084#1077#1089#13#10#1058#1052#1062' '#1084#1077#1089': '#1095#1072#1089#1090#1100' '#1084#1077#1089
        Style = csDropDownList
        ItemHeight = 13
        ItemIndex = 0
        ParentShowHint = False
        ShowHint = True
        TabOrder = 18
        Text = #1055#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
        Items.Strings = (
          #1055#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
          #1055#1086' '#1096#1080#1088#1080#1085#1077
          #1055#1086' '#1083#1077#1074#1086#1084#1091' '#1082#1088#1072#1102
          #1055#1086' '#1094#1077#1085#1090#1088#1091
          #1055#1086' '#1087#1088#1072#1074#1086#1084#1091' '#1082#1088#1072#1102)
      end
      object cbbHAlign8: TComboBox
        Left = 232
        Top = 184
        Width = 105
        Height = 21
        Hint = #1063#1077#1088#1090#1077#1078': 3 '#1084#1077#1089#13#10#1058#1052#1062' '#1082#1074#1072#1088#1090': 3 '#1084#1077#1089#13#10#1058#1052#1062' '#1084#1077#1089': '#1095#1072#1089#1090#1100' '#1062#1055
        Style = csDropDownList
        ItemHeight = 13
        ItemIndex = 0
        ParentShowHint = False
        ShowHint = True
        TabOrder = 19
        Text = #1055#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
        Items.Strings = (
          #1055#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
          #1055#1086' '#1096#1080#1088#1080#1085#1077
          #1055#1086' '#1083#1077#1074#1086#1084#1091' '#1082#1088#1072#1102
          #1055#1086' '#1094#1077#1085#1090#1088#1091
          #1055#1086' '#1087#1088#1072#1074#1086#1084#1091' '#1082#1088#1072#1102)
      end
      object cbbHAlign9: TComboBox
        Left = 232
        Top = 208
        Width = 105
        Height = 21
        Hint = #1063#1077#1088#1090#1077#1078': '#1087#1088#1086#1087#1091#1089#1082' '#1087#1077#1088#1077#1076' '#1058#1052#13#10#1058#1052#1062' : '#1095#1072#1089#1090#1100' '#1062#1055
        Style = csDropDownList
        ItemHeight = 13
        ItemIndex = 0
        ParentShowHint = False
        ShowHint = True
        TabOrder = 20
        Text = #1055#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
        Items.Strings = (
          #1055#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
          #1055#1086' '#1096#1080#1088#1080#1085#1077
          #1055#1086' '#1083#1077#1074#1086#1084#1091' '#1082#1088#1072#1102
          #1055#1086' '#1094#1077#1085#1090#1088#1091
          #1055#1086' '#1087#1088#1072#1074#1086#1084#1091' '#1082#1088#1072#1102)
      end
      object cbbHAlign10: TComboBox
        Left = 232
        Top = 232
        Width = 105
        Height = 21
        Hint = #1063#1077#1088#1090#1077#1078': '#1094#1077#1093' '#1058#1052#13#10#1058#1052#1062' : '#1089#1084#1086#1090#1088#1080#1090#1077' '#1092#1072#1081#1083' Excel'
        Style = csDropDownList
        ItemHeight = 13
        ItemIndex = 0
        ParentShowHint = False
        ShowHint = True
        TabOrder = 21
        Text = #1055#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
        Items.Strings = (
          #1055#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
          #1055#1086' '#1096#1080#1088#1080#1085#1077
          #1055#1086' '#1083#1077#1074#1086#1084#1091' '#1082#1088#1072#1102
          #1055#1086' '#1094#1077#1085#1090#1088#1091
          #1055#1086' '#1087#1088#1072#1074#1086#1084#1091' '#1082#1088#1072#1102)
      end
      object cbbHAlign11: TComboBox
        Left = 232
        Top = 256
        Width = 105
        Height = 21
        Hint = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081
        Style = csDropDownList
        ItemHeight = 13
        ItemIndex = 0
        ParentShowHint = False
        ShowHint = True
        TabOrder = 22
        Text = #1055#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
        Items.Strings = (
          #1055#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
          #1055#1086' '#1096#1080#1088#1080#1085#1077
          #1055#1086' '#1083#1077#1074#1086#1084#1091' '#1082#1088#1072#1102
          #1055#1086' '#1094#1077#1085#1090#1088#1091
          #1055#1086' '#1087#1088#1072#1074#1086#1084#1091' '#1082#1088#1072#1102)
      end
      object cbbHAlign12: TComboBox
        Left = 232
        Top = 280
        Width = 105
        Height = 21
        Hint = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1058#1052#1062'/'#1095#1077#1088#1090#1077#1078#1072
        Style = csDropDownList
        ItemHeight = 13
        ItemIndex = 0
        ParentShowHint = False
        ShowHint = True
        TabOrder = 23
        Text = #1055#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
        Items.Strings = (
          #1055#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
          #1055#1086' '#1096#1080#1088#1080#1085#1077
          #1055#1086' '#1083#1077#1074#1086#1084#1091' '#1082#1088#1072#1102
          #1055#1086' '#1094#1077#1085#1090#1088#1091
          #1055#1086' '#1087#1088#1072#1074#1086#1084#1091' '#1082#1088#1072#1102)
      end
    end
    object ts4: TTabSheet
      Caption = #1064#1072#1073#1083#1086#1085#1099
      ImageIndex = 3
      object lbl14: TLabel
        Left = 8
        Top = 216
        Width = 140
        Height = 52
        Caption = #1057#1090#1088#1086#1082#1080' '#1072#1074#1090#1086#1079#1072#1084#1077#1085#1099' ('#1072#1085#1075#1083'.):'#13#10'MM - '#1084#1077#1089#1103#1094#13#10'QQ - '#1082#1074#1072#1088#1090#1072#1083#13#10'YY - '#1075#1086#1076
      end
      object strngrd1: TStringGrid
        Left = 0
        Top = 0
        Width = 375
        Height = 205
        Align = alCustom
        ColCount = 2
        RowCount = 8
        FixedRows = 0
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goEditing, goAlwaysShowEditor]
        ScrollBars = ssNone
        TabOrder = 0
      end
      object btnSaveTemplate: TBitBtn
        Left = 280
        Top = 208
        Width = 91
        Height = 25
        Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
        TabOrder = 1
        OnClick = btnSaveTemplateClick
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
    end
    object ts3: TTabSheet
      Caption = #1058#1077#1089#1090#1086#1074#1099#1081' '#1088#1077#1078#1080#1084
      ImageIndex = 2
      object lbl13: TLabel
        Left = 0
        Top = 8
        Width = 362
        Height = 39
        Caption = 
          #1058#1077#1089#1090#1086#1074#1099#1081' '#1088#1077#1078#1080#1084' '#1087#1088#1077#1076#1086#1089#1090#1072#1074#1083#1103#1077#1090' '#1076#1086#1089#1090#1091#1087' '#1082' '#1101#1082#1089#1087#1077#1088#1080#1084#1077#1085#1090#1072#1083#1100#1085#1099#1084' '#1092#1091#1085#1082#1094#1080#1103#1084 +
          ' '#1087#1088#1086#1075#1088#1072#1084#1084#1099'. '#1048#1089#1087#1086#1083#1100#1079#1091#1077#1090#1089#1103' '#1085#1072' '#1089#1074#1086#1081' '#1089#1090#1088#1072#1093' '#1080' '#1088#1080#1089#1082'.'#13#10#1045#1089#1083#1080' '#1042#1099' '#1085#1077' '#1091#1074#1077#1088#1077 +
          #1085#1099' '#1095#1090#1086' '#1086#1085' '#1042#1072#1084' '#1085#1091#1078#1077#1085', '#1085#1077' '#1074#1082#1083#1102#1095#1072#1081#1090#1077' '#1090#1077#1089#1090#1086#1074#1099#1081' '#1088#1077#1078#1080#1084'!'
        WordWrap = True
      end
      object chkTest: TCheckBox
        Left = 0
        Top = 64
        Width = 161
        Height = 17
        Caption = #1042#1082#1083#1102#1095#1080#1090#1100' '#1090#1077#1089#1090#1086#1074#1099#1081' '#1088#1077#1078#1080#1084
        TabOrder = 0
      end
    end
  end
end
