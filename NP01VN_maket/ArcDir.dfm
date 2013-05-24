object FormArcDir: TFormArcDir
  Left = 474
  Top = 158
  Width = 200
  Height = 275
  Caption = #1042#1099#1073#1077#1088#1080#1090#1077' '#1072#1088#1093#1080#1074'...'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnResize = FormResize
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object spl1: TSplitter
    Left = 0
    Top = 113
    Width = 192
    Height = 3
    Cursor = crVSplit
    Align = alBottom
  end
  object pnl1: TPanel
    Left = 0
    Top = 168
    Width = 192
    Height = 80
    Align = alBottom
    TabOrder = 0
    DesignSize = (
      192
      80)
    object btn1: TBitBtn
      Left = 8
      Top = 49
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      TabOrder = 0
      Kind = bkOK
    end
    object btn2: TBitBtn
      Left = 110
      Top = 49
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = #1054#1090#1084#1077#1085#1072
      TabOrder = 1
      Kind = bkCancel
    end
    object Button1: TButton
      Left = 80
      Top = 8
      Width = 33
      Height = 25
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1072#1088#1093#1080#1074#1085#1099#1081' '#1082#1072#1090#1072#1083#1086#1075
      Anchors = [akLeft, akBottom]
      Caption = '+'
      TabOrder = 2
      OnClick = Button1Click
    end
  end
  object pnl2: TPanel
    Left = 0
    Top = 0
    Width = 192
    Height = 113
    Align = alClient
    TabOrder = 1
    object lst1: TListBox
      Left = 1
      Top = 1
      Width = 190
      Height = 111
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ItemHeight = 16
      ParentFont = False
      TabOrder = 0
      OnClick = lst1Click
    end
  end
  object pnl3: TPanel
    Left = 0
    Top = 116
    Width = 192
    Height = 52
    Align = alBottom
    TabOrder = 2
    object mmo1: TMemo
      Left = 1
      Top = 1
      Width = 190
      Height = 50
      Align = alClient
      ReadOnly = True
      TabOrder = 0
    end
  end
end
