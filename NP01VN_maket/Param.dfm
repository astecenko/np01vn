object FmParam: TFmParam
  Left = 338
  Top = 207
  BorderStyle = bsDialog
  Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080' '#1087#1088#1086#1075#1088#1072#1084#1084#1099
  ClientHeight = 182
  ClientWidth = 310
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  DesignSize = (
    310
    182)
  PixelsPerInch = 96
  TextHeight = 13
  object lbl3: TLabel
    Left = 8
    Top = 92
    Width = 187
    Height = 13
    Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1089#1090#1088#1086#1082' '#1074' '#1103#1095#1077#1081#1082#1077'  '#1078#1091#1088#1085#1072#1083#1072
  end
  object btnOk: TBitBtn
    Left = 24
    Top = 152
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    TabOrder = 0
    OnClick = btnOkClick
  end
  object btnCancel: TBitBtn
    Left = 176
    Top = 152
    Width = 75
    Height = 25
    Anchors = [akLeft, akRight, akBottom]
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 1
    OnClick = btnCancelClick
  end
  object grp1: TGroupBox
    Left = 2
    Top = 2
    Width = 305
    Height = 81
    Caption = ' '#1044#1080#1088#1077#1082#1090#1086#1088#1080#1080' '#1089#1086#1093#1088#1072#1085#1077#1085#1080#1103' '#1084#1072#1082#1077#1090#1086#1074': '
    TabOrder = 2
    object lbl1: TLabel
      Left = 8
      Top = 24
      Width = 13
      Height = 13
      Caption = 'P1'
    end
    object lbl2: TLabel
      Left = 8
      Top = 48
      Width = 12
      Height = 13
      Caption = '42'
    end
    object edt1: TEdit
      Left = 24
      Top = 20
      Width = 249
      Height = 21
      Enabled = False
      TabOrder = 0
    end
    object edt2: TEdit
      Left = 24
      Top = 46
      Width = 249
      Height = 21
      Enabled = False
      TabOrder = 1
    end
    object btn1: TButton
      Left = 272
      Top = 20
      Width = 19
      Height = 21
      Caption = '...'
      TabOrder = 2
      OnClick = btn1Click
    end
    object btn2: TButton
      Left = 272
      Top = 46
      Width = 19
      Height = 21
      Caption = '...'
      TabOrder = 3
      OnClick = btn2Click
    end
  end
  object se1: TSpinEdit
    Left = 200
    Top = 88
    Width = 41
    Height = 22
    MaxValue = 15
    MinValue = 1
    TabOrder = 3
    Value = 4
  end
  object btn3: TBitBtn
    Left = 288
    Top = 88
    Width = 20
    Height = 20
    Hint = #1057#1073#1088#1086#1089' '#1087#1086#1079#1080#1094#1080#1080' '#1086#1082#1086#1085
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
    OnClick = btn3Click
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000130B0000130B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      33333333333333333333EEEEEEEEEEEEEEE333FFFFFFFFFFFFF3E00000000000
      00E337777777777777F3E0F77777777770E337F33333333337F3E0F333333333
      70E337F33333333337F3E0F33333333370E337F3333FFF3337F3E0F337000733
      70E337F333777FF337F3E0F33000003370E337F3377777F337F3E0F330000033
      70E337F3377777F337F3E0F33000003370E337F33777773337F3E0F337000733
      70E337F33377733337F3E0F33333333370E337F33333333337F3E0F333333333
      70E337F33333333337F3E0FFFFFFFFFFF0E337FFFFFFFFFFF7F3E00000000000
      00E33777777777777733EEEEEEEEEEEEEEE33333333333333333}
    NumGlyphs = 2
  end
  object chk1: TCheckBox
    Left = 28
    Top = 120
    Width = 185
    Height = 17
    Cursor = crDrag
    Alignment = taLeftJustify
    Caption = #1052#1085#1086#1078#1077#1089#1090#1074#1077#1085#1085#1099#1081' '#1074#1099#1073#1086#1088' '#1089#1090#1088#1086#1082
    TabOrder = 5
  end
end
