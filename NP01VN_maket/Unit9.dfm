object FmDept: TFmDept
  Left = 357
  Top = 110
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsDialog
  Caption = 'FmDept'
  ClientHeight = 274
  ClientWidth = 640
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  DesignSize = (
    640
    274)
  PixelsPerInch = 96
  TextHeight = 13
  object lbl1: TLabel
    Left = 8
    Top = 8
    Width = 160
    Height = 13
    Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1103':'
  end
  object lbl2: TLabel
    Left = 8
    Top = 40
    Width = 154
    Height = 13
    Caption = #1055#1091#1090#1100' '#1082' '#1093#1088#1072#1085#1080#1083#1080#1097#1091' '#1076#1086#1082#1091#1084#1077#1085#1090#1086#1074
  end
  object lbl3: TLabel
    Left = 8
    Top = 72
    Width = 141
    Height = 13
    Caption = #1055#1091#1090#1100' '#1082' '#1078#1091#1088#1085#1072#1083#1091' '#1076#1086#1082#1091#1084#1077#1085#1090#1086#1074
  end
  object lbl4: TLabel
    Left = 8
    Top = 104
    Width = 211
    Height = 13
    Caption = #1055#1091#1090#1100' '#1082' '#1072#1088#1093#1080#1074#1085#1086#1084#1091' '#1093#1088#1072#1085#1080#1083#1080#1097#1091' '#1076#1086#1082#1091#1084#1077#1085#1090#1086#1074
  end
  object lbl6: TLabel
    Left = 8
    Top = 138
    Width = 193
    Height = 13
    Caption = #1055#1091#1090#1100' '#1082' '#1082#1072#1090#1072#1083#1086#1075#1091' '#1072#1088#1093#1080#1074#1085#1099#1093' ZIP '#1092#1072#1081#1083#1086#1074
  end
  object lbl7: TLabel
    Left = 8
    Top = 170
    Width = 198
    Height = 13
    Caption = #1055#1091#1090#1100' '#1082' '#1082#1072#1090#1072#1083#1086#1075#1091' '#1089#1086#1093#1088#1072#1085#1077#1085#1080#1103' '#1084#1072#1082#1077#1090#1072' 42'
  end
  object lbl8: TLabel
    Left = 8
    Top = 202
    Width = 199
    Height = 13
    Caption = #1055#1091#1090#1100' '#1082' '#1082#1072#1090#1072#1083#1086#1075#1091' '#1089#1086#1093#1088#1072#1085#1077#1085#1080#1103' '#1084#1072#1082#1077#1090#1072' P1'
  end
  object edt1: TEdit
    Left = 224
    Top = 8
    Width = 377
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
  end
  object edt2: TEdit
    Left = 224
    Top = 40
    Width = 377
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    Enabled = False
    TabOrder = 1
  end
  object edt3: TEdit
    Left = 224
    Top = 70
    Width = 377
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    Enabled = False
    TabOrder = 2
  end
  object edt4: TEdit
    Left = 224
    Top = 102
    Width = 377
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    Enabled = False
    TabOrder = 3
  end
  object btn1: TButton
    Left = 608
    Top = 40
    Width = 25
    Height = 21
    Hint = #1042#1099#1073#1088#1072#1090#1100' '#1082#1072#1090#1072#1083#1086#1075
    Anchors = [akTop, akRight]
    Caption = '...'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
    OnClick = btn1Click
  end
  object btn2: TButton
    Left = 608
    Top = 70
    Width = 25
    Height = 21
    Hint = #1042#1099#1073#1088#1072#1090#1100' '#1082#1072#1090#1072#1083#1086#1075
    Anchors = [akTop, akRight]
    Caption = '...'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 5
    OnClick = btn2Click
  end
  object btn3: TButton
    Left = 608
    Top = 102
    Width = 25
    Height = 21
    Hint = #1042#1099#1073#1088#1072#1090#1100' '#1082#1072#1090#1072#1083#1086#1075
    Anchors = [akTop, akRight]
    Caption = '...'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 6
    OnClick = btn3Click
  end
  object btn5: TButton
    Left = 152
    Top = 240
    Width = 123
    Height = 25
    Caption = #1055#1088#1080#1084#1077#1085#1080#1090#1100
    TabOrder = 7
    OnClick = btn5Click
  end
  object btn6: TButton
    Left = 400
    Top = 240
    Width = 121
    Height = 25
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 8
    OnClick = btn6Click
  end
  object edt6: TEdit
    Left = 224
    Top = 136
    Width = 377
    Height = 21
    Enabled = False
    TabOrder = 9
  end
  object btn7: TButton
    Left = 608
    Top = 134
    Width = 25
    Height = 21
    Hint = #1042#1099#1073#1088#1072#1090#1100' '#1082#1072#1090#1072#1083#1086#1075
    Anchors = [akTop, akRight]
    Caption = '...'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 10
    OnClick = btn7Click
  end
  object edt7: TEdit
    Left = 224
    Top = 168
    Width = 377
    Height = 21
    Enabled = False
    TabOrder = 11
  end
  object btn8: TButton
    Left = 607
    Top = 166
    Width = 25
    Height = 21
    Hint = #1042#1099#1073#1088#1072#1090#1100' '#1082#1072#1090#1072#1083#1086#1075
    Anchors = [akTop, akRight]
    Caption = '...'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 12
    OnClick = btn8Click
  end
  object edt8: TEdit
    Left = 224
    Top = 200
    Width = 377
    Height = 21
    Enabled = False
    TabOrder = 13
  end
  object btn9: TButton
    Left = 607
    Top = 198
    Width = 25
    Height = 21
    Hint = #1042#1099#1073#1088#1072#1090#1100' '#1082#1072#1090#1072#1083#1086#1075
    Anchors = [akTop, akRight]
    Caption = '...'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 14
    OnClick = btn9Click
  end
end
