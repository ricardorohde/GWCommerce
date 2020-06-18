object ViewConsultaCliente: TViewConsultaCliente
  Left = 0
  Top = 0
  BorderIcons = [biMinimize, biMaximize]
  BorderStyle = bsSingle
  Caption = 'ViewConsultaCliente'
  ClientHeight = 660
  ClientWidth = 714
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnCloseQuery = FormCloseQuery
  OnKeyUp = FormKeyUp
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnl1: TPanel
    Left = 0
    Top = 580
    Width = 714
    Height = 80
    Align = alBottom
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    object pnlBotao: TPanel
      Left = 610
      Top = 2
      Width = 96
      Height = 70
      Align = alRight
      BevelOuter = bvNone
      Color = 8180311
      ParentBackground = False
      TabOrder = 0
      object btnConfirmar: TSpeedButton
        Left = 0
        Top = 0
        Width = 96
        Height = 70
        Align = alClient
        Caption = 'Confirmar'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        OnClick = btnConfirmarClick
        ExplicitLeft = 24
        ExplicitTop = 16
        ExplicitWidth = 23
        ExplicitHeight = 22
      end
    end
    object pnl10: TPanel
      Left = 0
      Top = 0
      Width = 714
      Height = 2
      Align = alTop
      BevelOuter = bvNone
      Color = clWhite
      ParentBackground = False
      TabOrder = 1
    end
    object pnl11: TPanel
      Left = 706
      Top = 2
      Width = 8
      Height = 70
      Align = alRight
      BevelOuter = bvNone
      Color = clWhite
      ParentBackground = False
      TabOrder = 2
    end
    object pnl12: TPanel
      Left = 0
      Top = 72
      Width = 714
      Height = 8
      Align = alBottom
      BevelOuter = bvNone
      Color = clWhite
      ParentBackground = False
      TabOrder = 3
    end
    object pnlCancelar: TPanel
      Left = 8
      Top = 2
      Width = 96
      Height = 70
      Align = alLeft
      BevelOuter = bvNone
      Color = 8180311
      ParentBackground = False
      TabOrder = 4
      object btnCancelar: TSpeedButton
        Left = 0
        Top = 0
        Width = 96
        Height = 70
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
        ExplicitLeft = 32
        ExplicitTop = 8
        ExplicitWidth = 23
        ExplicitHeight = 22
      end
    end
    object pnl14: TPanel
      Left = 0
      Top = 2
      Width = 8
      Height = 70
      Align = alLeft
      BevelOuter = bvNone
      Color = clWhite
      ParentBackground = False
      TabOrder = 5
    end
  end
  object pnlCentral: TPanel
    Left = 0
    Top = 0
    Width = 714
    Height = 580
    Align = alClient
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 1
    object gridClientes: TDBGrid
      Left = 8
      Top = 98
      Width = 698
      Height = 474
      Align = alClient
      BorderStyle = bsNone
      Color = clWhite
      DataSource = dsCliente
      DrawingStyle = gdsGradient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -32
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      Options = [dgTitles, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDrawColumnCell = gridClientesDrawColumnCell
      OnKeyUp = gridClientesKeyUp
      Columns = <
        item
          Alignment = taLeftJustify
          Expanded = False
          FieldName = 'CODIGO_CLIENTE'
          Title.Caption = 'C'#243'digo'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'REGISTRO_EMIT'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'NOME'
          Title.Caption = 'Nome'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 300
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CONTATO'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'CPF'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -21
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'RG'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'CELULAR'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -21
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Title.Caption = 'Celular'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 80
          Visible = True
        end>
    end
    object pnlTopo: TPanel
      Left = 0
      Top = 0
      Width = 714
      Height = 90
      Align = alTop
      BevelOuter = bvNone
      Color = clWhite
      ParentBackground = False
      TabOrder = 1
      TabStop = True
      object edtPesquisa: TEdit
        Left = 8
        Top = 8
        Width = 698
        Height = 74
        Align = alClient
        Color = 15908714
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -40
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnChange = edtPesquisaChange
        OnKeyUp = edtPesquisaKeyUp
        ExplicitHeight = 56
      end
      object pnl4: TPanel
        Left = 0
        Top = 8
        Width = 8
        Height = 74
        Align = alLeft
        BevelOuter = bvNone
        Color = clWhite
        ParentBackground = False
        TabOrder = 1
      end
      object pnl5: TPanel
        Left = 706
        Top = 8
        Width = 8
        Height = 74
        Align = alRight
        BevelOuter = bvNone
        Color = clWhite
        ParentBackground = False
        TabOrder = 2
      end
      object pnl6: TPanel
        Left = 0
        Top = 0
        Width = 714
        Height = 8
        Align = alTop
        BevelOuter = bvNone
        Color = clWhite
        ParentBackground = False
        TabOrder = 3
      end
      object pnl7: TPanel
        Left = 0
        Top = 82
        Width = 714
        Height = 8
        Align = alBottom
        BevelOuter = bvNone
        Color = clWhite
        ParentBackground = False
        TabOrder = 4
      end
    end
    object pnl2: TPanel
      Left = 0
      Top = 90
      Width = 714
      Height = 8
      Align = alTop
      BevelOuter = bvNone
      Color = clWhite
      ParentBackground = False
      TabOrder = 2
    end
    object pnl3: TPanel
      Left = 0
      Top = 572
      Width = 714
      Height = 8
      Align = alBottom
      BevelOuter = bvNone
      Color = clWhite
      ParentBackground = False
      TabOrder = 3
    end
    object pnl8: TPanel
      Left = 0
      Top = 98
      Width = 8
      Height = 474
      Align = alLeft
      BevelOuter = bvNone
      Color = clWhite
      ParentBackground = False
      TabOrder = 4
    end
    object pnl9: TPanel
      Left = 706
      Top = 98
      Width = 8
      Height = 474
      Align = alRight
      BevelOuter = bvNone
      Color = clWhite
      ParentBackground = False
      TabOrder = 5
    end
  end
  object dsCliente: TDataSource
    DataSet = dmDados.cliCliente
    OnDataChange = dsClienteDataChange
    Left = 192
    Top = 440
  end
  object tmr1: TTimer
    Enabled = False
    OnTimer = tmr1Timer
    Left = 488
    Top = 168
  end
end
