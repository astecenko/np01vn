object NP01VN01Form3: TNP01VN01Form3
  Left = 272
  Top = 107
  Anchors = [akLeft, akBottom]
  BorderStyle = bsDialog
  Caption = #1057#1086#1093#1088#1072#1085#1077#1085#1085#1099#1077' '#1092#1080#1083#1100#1090#1088#1099
  ClientHeight = 387
  ClientWidth = 292
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  DesignSize = (
    292
    387)
  PixelsPerInch = 96
  TextHeight = 13
  object lst1: TListBox
    Left = 0
    Top = 32
    Width = 249
    Height = 321
    Anchors = [akLeft, akTop, akRight, akBottom]
    ItemHeight = 13
    TabOrder = 0
    OnDblClick = lst1DblClick
  end
  object btn1: TButton
    Left = 8
    Top = 360
    Width = 97
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = #1042#1099#1073#1086#1088
    TabOrder = 1
    OnClick = btn1Click
  end
  object btn2: TButton
    Left = 176
    Top = 360
    Width = 105
    Height = 25
    Anchors = [akLeft, akBottom]
    Cancel = True
    Caption = #1047#1072#1082#1088#1099#1090#1100
    TabOrder = 2
    OnClick = btn2Click
  end
  object edt1: TEdit
    Left = 5
    Top = 5
    Width = 244
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 3
    Text = #1053#1086#1074#1099#1081' '#1089#1086#1093#1088#1072#1085#1077#1085#1085#1099#1081' '#1092#1080#1083#1100#1090#1088
  end
  object btn3: TButton
    Left = 256
    Top = 5
    Width = 35
    Height = 22
    Hint = #1044#1086#1073#1072#1074#1080#1090#1100
    Anchors = [akTop, akRight]
    Caption = '+'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
    OnClick = btn3Click
  end
  object btn4: TButton
    Left = 256
    Top = 40
    Width = 35
    Height = 22
    Hint = #1059#1076#1072#1083#1080#1090#1100' '#1074#1099#1076#1077#1083#1077#1085#1085#1099#1081
    Anchors = [akTop, akRight]
    Caption = '-'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 5
    OnClick = btn4Click
  end
end
