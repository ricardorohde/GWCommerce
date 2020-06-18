object ViewPagamentoSelecaoCartao: TViewPagamentoSelecaoCartao
  Left = 0
  Top = 0
  BorderIcons = [biMinimize, biMaximize]
  BorderStyle = bsSingle
  Caption = 'ViewPagamentoSelecaoCartao'
  ClientHeight = 629
  ClientWidth = 326
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = [fsBold]
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyUp = FormKeyUp
  PixelsPerInch = 96
  TextHeight = 13
  object grp1: TGroupBox
    Left = 8
    Top = 7
    Width = 310
    Height = 169
    Caption = 'Tipo Cart'#227'o'
    TabOrder = 0
    object lstTipoCartao: TListBox
      Left = 2
      Top = 15
      Width = 306
      Height = 152
      Align = alClient
      BevelOuter = bvNone
      BorderStyle = bsNone
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -24
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ItemHeight = 29
      Items.Strings = (
        'DEBITO'
        'CREDITO')
      ParentFont = False
      TabOrder = 0
      OnKeyDown = lstTipoCartaoKeyDown
      ExplicitWidth = 215
    end
  end
  object grp2: TGroupBox
    Left = 8
    Top = 493
    Width = 310
    Height = 56
    Caption = 'C'#243'digo de Autoriza'#231#227'o'
    TabOrder = 1
    object edtCodigoAutorizacao: TEdit
      Left = 3
      Top = 16
      Width = 303
      Height = 31
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnKeyDown = edtCodigoAutorizacaoKeyDown
    end
  end
  object grp3: TGroupBox
    Left = 7
    Top = 169
    Width = 311
    Height = 320
    Caption = 'Bandeira'
    TabOrder = 2
    object lstBandeira: TListBox
      Left = 2
      Top = 15
      Width = 307
      Height = 303
      Align = alClient
      BorderStyle = bsNone
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -24
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ItemHeight = 29
      Items.Strings = (
        'VISA'
        'MASTERCARD'
        'AMERICAN EXPRESS'
        'SOROCRED'
        'DINERS CLUB'
        'ELO'
        'HIPERCARD'
        'AURA'
        'CABAL'
        'OUTROS')
      ParentFont = False
      TabOrder = 0
      OnKeyDown = lstBandeiraKeyDown
      ExplicitLeft = 6
      ExplicitWidth = 295
    end
  end
  object pnl1: TPanel
    Left = 0
    Top = 549
    Width = 326
    Height = 80
    Align = alBottom
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 3
    object pnlBotao: TPanel
      Left = 222
      Top = 8
      Width = 96
      Height = 64
      Align = alRight
      BevelOuter = bvNone
      Color = 8180311
      ParentBackground = False
      TabOrder = 0
      ExplicitLeft = 120
      ExplicitTop = 14
      ExplicitHeight = 56
      object btnConfirmar: TSpeedButton
        Left = 0
        Top = 0
        Width = 96
        Height = 64
        Align = alClient
        Caption = 'Confirmar'
        Flat = True
        OnClick = btnConfirmarClick
        ExplicitLeft = 8
        ExplicitTop = 16
        ExplicitWidth = 23
        ExplicitHeight = 22
      end
    end
    object pnl5: TPanel
      Left = 318
      Top = 8
      Width = 8
      Height = 64
      Align = alRight
      BevelOuter = bvNone
      Color = clWhite
      ParentBackground = False
      TabOrder = 1
      ExplicitLeft = 45
      ExplicitHeight = 56
    end
    object pnl6: TPanel
      Left = 0
      Top = 8
      Width = 8
      Height = 64
      Align = alLeft
      BevelOuter = bvNone
      Color = clWhite
      ParentBackground = False
      TabOrder = 2
      ExplicitHeight = 56
    end
    object pnl7: TPanel
      Left = 0
      Top = 72
      Width = 326
      Height = 8
      Align = alBottom
      BevelOuter = bvNone
      Color = clWhite
      ParentBackground = False
      TabOrder = 3
      ExplicitLeft = 56
      ExplicitTop = 24
      ExplicitWidth = 185
    end
    object pnl8: TPanel
      Left = 0
      Top = 0
      Width = 326
      Height = 8
      Align = alTop
      BevelOuter = bvNone
      Color = clWhite
      ParentBackground = False
      TabOrder = 4
    end
    object pnlCancelar: TPanel
      Left = 8
      Top = 8
      Width = 96
      Height = 64
      Align = alLeft
      BevelOuter = bvNone
      Color = 8180311
      ParentBackground = False
      TabOrder = 5
      object btnCancelar: TSpeedButton
        Left = 0
        Top = 0
        Width = 96
        Height = 64
        Align = alClient
        Caption = 'Cancelar'
        Flat = True
        OnClick = btnCancelarClick
        ExplicitLeft = 40
        ExplicitTop = 16
        ExplicitWidth = 23
        ExplicitHeight = 22
      end
    end
  end
  object pnl2: TPanel
    Left = 0
    Top = 8
    Width = 8
    Height = 541
    Align = alLeft
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 4
    ExplicitLeft = 310
    ExplicitTop = 72
    ExplicitHeight = 41
  end
  object pnl3: TPanel
    Left = 318
    Top = 8
    Width = 8
    Height = 541
    Align = alRight
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 5
    ExplicitLeft = 311
    ExplicitTop = 119
    ExplicitHeight = 41
  end
  object pnl4: TPanel
    Left = 0
    Top = 0
    Width = 326
    Height = 8
    Align = alTop
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 6
  end
end
