object ViewDesconto: TViewDesconto
  Left = 0
  Top = 0
  BorderIcons = [biMinimize, biMaximize]
  BorderStyle = bsSingle
  Caption = 'Desconto'
  ClientHeight = 151
  ClientWidth = 304
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
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 102
    Height = 16
    Caption = 'Desconto em %'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 8
    Top = 54
    Width = 105
    Height = 16
    Caption = 'Desconto em R$'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object btnCancelar: TSpeedButton
    Left = 8
    Top = 106
    Width = 140
    Height = 39
    Caption = '&Cancelar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = btnCancelarClick
  end
  object btnOk: TSpeedButton
    Left = 152
    Top = 106
    Width = 140
    Height = 39
    Caption = '&OK'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = btnOkClick
  end
  object edtDescontoPercentual: TEdit
    Left = 8
    Top = 27
    Width = 284
    Height = 27
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    MaxLength = 5
    ParentFont = False
    TabOrder = 0
    OnExit = edtDescontoPercentualExit
    OnKeyPress = edtDescontoPercentualKeyPress
  end
  object edtDescontoValor: TEdit
    Left = 8
    Top = 73
    Width = 284
    Height = 27
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    MaxLength = 7
    ParentFont = False
    TabOrder = 1
    OnExit = edtDescontoPercentualExit
    OnKeyPress = edtDescontoValorKeyPress
  end
end
