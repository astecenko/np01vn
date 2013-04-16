object SendOASUP: TSendOASUP
  Left = 310
  Top = 205
  BorderStyle = bsDialog
  Caption = #1044#1086#1073#1072#1074#1083#1077#1085#1080#1077' '#1076#1086#1082#1091#1084#1077#1085#1090#1072' '#1074' '#1078#1091#1088#1085#1072#1083
  ClientHeight = 134
  ClientWidth = 563
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
  object lbl1: TLabel
    Left = 0
    Top = 0
    Width = 556
    Height = 48
    Alignment = taCenter
    Caption = 
      #1055#1086#1089#1083#1077' '#1076#1086#1073#1072#1074#1083#1077#1085#1080#1103' '#1074' '#1078#1091#1088#1085#1072#1083' '#1076#1086#1082#1091#1084#1077#1085#1090' '#1073#1091#1076#1077#1090' '#1076#1086#1089#1090#1091#1087#1077#1085' '#1074' '#1088#1077#1078#1080#1084#1077' "'#1090#1086#1083#1100 +
      #1082#1086' '#1095#1090#1077#1085#1080#1077'"!'#13#10#1042#1099' '#1091#1074#1077#1088#1077#1085#1099' '#1095#1090#1086' '#1088#1072#1073#1086#1090#1072' '#1089' '#1076#1086#1082#1091#1084#1077#1085#1090#1086#1084' '#1079#1072#1082#1086#1085#1095#1077#1085#1072' '#1087#1086#1083#1085#1086#1089 +
      #1090#1100#1102'  '#1080' '#1086#1085' '#1075#1086#1090#1086#1074' '#1082' '#1087#1077#1088#1077#1076#1072#1095#1077' '#1074#13#10#1086#1090#1076#1077#1083' '#1072#1074#1090#1086#1084#1072#1090#1080#1079#1080#1088#1086#1074#1072#1085#1085#1086#1081' '#1089#1080#1089#1090#1077#1084#1099' '#1091 +
      #1087#1088#1072#1074#1083#1077#1085#1080#1103' '#1087#1088#1086#1080#1079#1074#1086#1076#1089#1090#1074#1086#1084' ('#1054#1040#1057#1059#1055') ?'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    WordWrap = True
  end
  object lbl2: TLabel
    Left = 4
    Top = 64
    Width = 243
    Height = 16
    Caption = #1059#1082#1072#1078#1080#1090#1077' '#1076#1072#1090#1091' '#1084#1077#1089#1103#1094#1072' '#1082#1086#1088#1088#1077#1082#1090#1080#1088#1086#1074#1082#1080
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object dtp1: TDateTimePicker
    Left = 256
    Top = 60
    Width = 89
    Height = 24
    Date = 40909.000000000000000000
    Time = 40909.000000000000000000
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    MinDate = 40909.000000000000000000
    ParentFont = False
    TabOrder = 0
  end
  object btn1: TBitBtn
    Left = 472
    Top = 96
    Width = 83
    Height = 33
    Caption = #1044#1072' >>>'
    ModalResult = 6
    TabOrder = 1
    OnClick = btn1Click
  end
  object btn2: TBitBtn
    Left = 8
    Top = 96
    Width = 83
    Height = 33
    Cancel = True
    Caption = '<<< '#1053#1077#1090
    Default = True
    ModalResult = 2
    TabOrder = 2
    OnClick = btn2Click
  end
end
