object frmDocName: TfrmDocName
  Left = 349
  Top = 277
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = #1056#1077#1082#1074#1080#1079#1080#1090#1099' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
  ClientHeight = 101
  ClientWidth = 272
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
  object Label1: TLabel
    Left = 150
    Top = 36
    Width = 18
    Height = 16
    Caption = #1086#1090
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 9
    Top = 36
    Width = 49
    Height = 16
    Caption = #8470' 104-'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 43
    Top = 8
    Width = 148
    Height = 16
    Caption = #1057#1083#1091#1078#1077#1073#1085#1072#1103' '#1079#1072#1087#1080#1089#1082#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object meNDoc: TMaskEdit
    Left = 64
    Top = 33
    Width = 81
    Height = 24
    EditMask = '!9999;1;_'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    MaxLength = 4
    ParentFont = False
    TabOrder = 0
    Text = '    '
    OnChange = meNDocChange
  end
  object dtpDateDoc: TDateTimePicker
    Left = 173
    Top = 33
    Width = 88
    Height = 24
    Date = 39456.456801597240000000
    Format = 'dd.MM.yy'
    Time = 39456.456801597240000000
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
  end
  object Button1: TButton
    Left = 56
    Top = 72
    Width = 75
    Height = 25
    Caption = 'OK'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ModalResult = 1
    ParentFont = False
    TabOrder = 2
  end
  object Button2: TButton
    Left = 136
    Top = 72
    Width = 75
    Height = 25
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ModalResult = 2
    ParentFont = False
    TabOrder = 3
  end
end
