object ViewOpcoes: TViewOpcoes
  Left = 0
  Top = 0
  BorderIcons = [biMinimize, biMaximize]
  BorderStyle = bsSingle
  ClientHeight = 288
  ClientWidth = 451
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnKeyUp = FormKeyUp
  PixelsPerInch = 96
  TextHeight = 13
  object pnl1: TPanel
    Left = 0
    Top = 200
    Width = 451
    Height = 88
    Align = alBottom
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    object pnlAcessar: TPanel
      Left = 347
      Top = 8
      Width = 96
      Height = 72
      Align = alRight
      BevelOuter = bvNone
      Color = 8180311
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentBackground = False
      ParentFont = False
      TabOrder = 0
      object btnAcessar: TSpeedButton
        Left = 0
        Top = 0
        Width = 96
        Height = 72
        Align = alClient
        Caption = 'Acessar'
        Flat = True
        OnClick = btnAcessarClick
        ExplicitLeft = 1
        ExplicitTop = 1
        ExplicitHeight = 32
      end
    end
    object pnlCancelar: TPanel
      Left = 8
      Top = 8
      Width = 96
      Height = 72
      Align = alLeft
      BevelOuter = bvNone
      Color = 8180311
      ParentBackground = False
      TabOrder = 1
      object btnCancelar: TSpeedButton
        Left = 0
        Top = 0
        Width = 96
        Height = 72
        Align = alClient
        Caption = 'Cancelar'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        OnClick = btnCancelarClick
        ExplicitLeft = 56
        ExplicitTop = 24
        ExplicitWidth = 23
        ExplicitHeight = 22
      end
    end
    object pnl6: TPanel
      Left = 443
      Top = 8
      Width = 8
      Height = 72
      Align = alRight
      BevelOuter = bvNone
      Color = clWhite
      ParentBackground = False
      TabOrder = 2
    end
    object pnl7: TPanel
      Left = 0
      Top = 8
      Width = 8
      Height = 72
      Align = alLeft
      BevelOuter = bvNone
      Color = clWhite
      ParentBackground = False
      TabOrder = 3
    end
    object pnl8: TPanel
      Left = 0
      Top = 0
      Width = 451
      Height = 8
      Align = alTop
      BevelOuter = bvNone
      Color = clWhite
      ParentBackground = False
      TabOrder = 4
    end
    object pnl9: TPanel
      Left = 0
      Top = 80
      Width = 451
      Height = 8
      Align = alBottom
      BevelOuter = bvNone
      Color = clWhite
      ParentBackground = False
      TabOrder = 5
    end
  end
  object rgOpcoes: TRadioGroup
    Left = 8
    Top = 8
    Width = 435
    Height = 184
    Align = alClient
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    Items.Strings = (
      'Emitente'
      'Gerenciador'
      'Receber Atualiza'#231#227'o'
      'Enviar Atualiza'#231#227'o')
    ParentBackground = False
    ParentColor = False
    ParentFont = False
    TabOrder = 1
  end
  object pnl2: TPanel
    Left = 0
    Top = 0
    Width = 451
    Height = 8
    Align = alTop
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 2
  end
  object pnl3: TPanel
    Left = 0
    Top = 8
    Width = 8
    Height = 184
    Align = alLeft
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 3
  end
  object pnl4: TPanel
    Left = 443
    Top = 8
    Width = 8
    Height = 184
    Align = alRight
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 4
  end
  object pnl5: TPanel
    Left = 0
    Top = 192
    Width = 451
    Height = 8
    Align = alBottom
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 5
  end
end
