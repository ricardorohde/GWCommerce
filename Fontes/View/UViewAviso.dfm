object ViewAviso: TViewAviso
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'ViewAviso'
  ClientHeight = 110
  ClientWidth = 545
  Color = 8180311
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  Visible = True
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object pnl1: TPanel
    Left = 8
    Top = 8
    Width = 529
    Height = 94
    BevelOuter = bvNone
    BorderStyle = bsSingle
    Caption = 'Aguarde...'
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 0
  end
end
