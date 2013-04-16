object FormNewString: TFormNewString
  Left = 340
  Top = 201
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = #1053#1086#1074#1072#1103' '#1089#1090#1088#1086#1082#1072
  ClientHeight = 129
  ClientWidth = 392
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lbl1: TLabel
    Left = 144
    Top = 92
    Width = 42
    Height = 13
    Caption = #1050#1074#1072#1088#1090#1072#1083
    FocusControl = cbb1
  end
  object Button1: TButton
    Left = 5
    Top = 99
    Width = 100
    Height = 25
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    Default = True
    ModalResult = 1
    TabOrder = 1
  end
  object Button2: TButton
    Left = 285
    Top = 99
    Width = 100
    Height = 25
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    ModalResult = 2
    TabOrder = 2
    OnClick = Button2Click
  end
  object MemoNewStr: TMemo
    Left = 0
    Top = 0
    Width = 391
    Height = 81
    Alignment = taCenter
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object cbb1: TComboBox
    Left = 192
    Top = 88
    Width = 49
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    ItemIndex = 0
    TabOrder = 3
    Text = '1'
    OnSelect = cbb1Select
    Items.Strings = (
      '1'
      '2'
      '3'
      '4')
  end
end
