object FormNP01: TFormNP01
  Left = 181
  Top = 87
  Width = 800
  Height = 480
  Caption = 'FormNP01'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 792
    Height = 41
    Align = alTop
    TabOrder = 0
    DesignSize = (
      792
      41)
    object lblFullPath: TLabel
      Left = 240
      Top = 16
      Width = 545
      Height = 13
      Anchors = [akLeft, akTop, akRight]
      AutoSize = False
      Caption = 'lblFullPath'
    end
    object dbnvgr1: TDBNavigator
      Left = 8
      Top = 8
      Width = 224
      Height = 25
      DataSource = ds1
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      TabOrder = 0
    end
  end
  object pnl2: TPanel
    Left = 0
    Top = 41
    Width = 792
    Height = 412
    Align = alClient
    TabOrder = 1
    object dbgrd1: TDBGrid
      Left = 1
      Top = 1
      Width = 790
      Height = 410
      Align = alClient
      DataSource = ds1
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
    end
  end
  object ds1: TDataSource
    Left = 104
    Top = 89
  end
end
