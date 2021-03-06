object ViewPDV: TViewPDV
  Left = 0
  Top = 0
  BorderIcons = [biMinimize, biMaximize]
  BorderStyle = bsSingle
  ClientHeight = 544
  ClientWidth = 886
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyUp = FormKeyUp
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlPesquisaItem: TPanel
    Left = 0
    Top = 0
    Width = 886
    Height = 66
    Align = alTop
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    object cbbPesquisa: TComboBox
      AlignWithMargins = True
      Left = 11
      Top = 11
      Width = 864
      Height = 41
      Align = alClient
      CharCase = ecUpperCase
      Color = 15908714
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -27
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      StyleElements = [seFont, seBorder]
      OnChange = cbbPesquisaChange
      OnKeyPress = cbbPesquisaKeyPress
      OnKeyUp = cbbPesquisaKeyUp
    end
    object pnl2: TPanel
      Left = 878
      Top = 8
      Width = 8
      Height = 50
      Align = alRight
      BevelOuter = bvNone
      Color = clWhite
      ParentBackground = False
      TabOrder = 1
    end
    object pnl3: TPanel
      Left = 0
      Top = 8
      Width = 8
      Height = 50
      Align = alLeft
      BevelOuter = bvNone
      Color = clWhite
      ParentBackground = False
      TabOrder = 2
    end
    object pnl4: TPanel
      Left = 0
      Top = 58
      Width = 886
      Height = 8
      Align = alBottom
      BevelOuter = bvNone
      Color = clWhite
      ParentBackground = False
      TabOrder = 3
    end
    object pnl5: TPanel
      Left = 0
      Top = 0
      Width = 886
      Height = 8
      Align = alTop
      BevelOuter = bvNone
      Color = clWhite
      ParentBackground = False
      TabOrder = 4
    end
  end
  object pnlRodape: TPanel
    Left = 0
    Top = 462
    Width = 886
    Height = 82
    Align = alBottom
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 1
    object Splitter1: TSplitter
      Left = 188
      Top = 0
      Width = 8
      Height = 74
      ExplicitLeft = 286
      ExplicitHeight = 72
    end
    object Splitter2: TSplitter
      Left = 364
      Top = 0
      Width = 8
      Height = 74
      ExplicitLeft = 361
      ExplicitTop = 1
      ExplicitHeight = 70
    end
    object Splitter3: TSplitter
      Left = 540
      Top = 0
      Width = 8
      Height = 74
      ExplicitLeft = 485
      ExplicitTop = 1
      ExplicitHeight = 70
    end
    object Splitter4: TSplitter
      Left = 804
      Top = 0
      Width = 8
      Height = 74
      ExplicitLeft = 589
      ExplicitTop = 1
      ExplicitHeight = 70
    end
    object spl1: TSplitter
      Left = 100
      Top = 0
      Width = 8
      Height = 74
      ExplicitLeft = 184
      ExplicitHeight = 72
    end
    object spl2: TSplitter
      Left = 628
      Top = 0
      Width = 8
      Height = 74
      ExplicitLeft = 600
      ExplicitHeight = 72
    end
    object spl3: TSplitter
      Left = 716
      Top = 0
      Width = 8
      Height = 74
      ExplicitLeft = 545
      ExplicitHeight = 72
    end
    object spl5: TSplitter
      Left = 452
      Top = 0
      Width = 8
      Height = 74
      ExplicitLeft = 369
      ExplicitHeight = 72
    end
    object spl6: TSplitter
      Left = 276
      Top = 0
      Width = 8
      Height = 74
      ExplicitLeft = 270
      ExplicitTop = 6
    end
    object pnlRodapeEsquerdo1: TPanel
      Left = 0
      Top = 0
      Width = 20
      Height = 74
      Align = alLeft
      BevelOuter = bvNone
      Color = clWhite
      ParentBackground = False
      TabOrder = 0
    end
    object pnlFecharCupom: TPanel
      Tag = 1
      Left = 108
      Top = 0
      Width = 80
      Height = 74
      Align = alLeft
      BevelOuter = bvNone
      Color = 8180311
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentBackground = False
      ParentFont = False
      TabOrder = 1
      object btnFecharCupom: TSpeedButton
        Left = 0
        Top = 0
        Width = 80
        Height = 74
        Align = alClient
        Caption = 'F3'#13'Fechar'#13'Cupom'
        Flat = True
        OnClick = btnFecharCupomClick
        ExplicitLeft = 24
        ExplicitTop = 16
        ExplicitWidth = 23
        ExplicitHeight = 22
      end
    end
    object pnlConsultarPreco: TPanel
      Tag = 1
      Left = 284
      Top = 0
      Width = 80
      Height = 74
      Align = alLeft
      BevelOuter = bvNone
      Color = 8180311
      ParentBackground = False
      TabOrder = 2
      object btnConsultaPreco: TSpeedButton
        Left = 0
        Top = 0
        Width = 80
        Height = 74
        Align = alClient
        Caption = 'F5'#13'Consulta'#13'Precos'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        OnClick = btnConsultaPrecoClick
        ExplicitLeft = 40
        ExplicitTop = 40
        ExplicitWidth = 23
        ExplicitHeight = 22
      end
    end
    object pnlFecharDinheiro: TPanel
      Tag = 1
      Left = 460
      Top = 0
      Width = 80
      Height = 74
      Align = alLeft
      BevelOuter = bvNone
      Color = 8180311
      ParentBackground = False
      TabOrder = 3
      object btnFecharDinheiro: TSpeedButton
        Left = 0
        Top = 0
        Width = 80
        Height = 74
        Align = alClient
        Caption = 'F7'#13'Fechar em'#13'Dinheiro'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        OnClick = btnFecharDinheiroClick
        ExplicitLeft = 24
        ExplicitTop = 16
        ExplicitWidth = 23
        ExplicitHeight = 22
      end
    end
    object pnlDesconto: TPanel
      Tag = 1
      Left = 548
      Top = 0
      Width = 80
      Height = 74
      Align = alLeft
      BevelOuter = bvNone
      Color = 8180311
      ParentBackground = False
      TabOrder = 4
      object btnDesconto: TSpeedButton
        Left = 0
        Top = 0
        Width = 80
        Height = 74
        Align = alClient
        Caption = 'F8'#13'Desconto'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        OnClick = btnDescontoClick
        ExplicitLeft = 24
        ExplicitTop = 8
        ExplicitWidth = 23
        ExplicitHeight = 22
      end
    end
    object pnlEsc: TPanel
      Tag = 1
      Left = 812
      Top = 0
      Width = 80
      Height = 74
      Align = alLeft
      BevelOuter = bvNone
      Color = clSilver
      ParentBackground = False
      TabOrder = 5
      object btnEsc: TSpeedButton
        Left = 0
        Top = 0
        Width = 80
        Height = 74
        Align = alClient
        Caption = 'ESC'#13'Sair'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        OnClick = btnEscClick
        ExplicitLeft = 24
        ExplicitTop = 16
        ExplicitWidth = 23
        ExplicitHeight = 22
      end
    end
    object pnlIniciarVenda: TPanel
      Tag = 1
      Left = 20
      Top = 0
      Width = 80
      Height = 74
      Align = alLeft
      BevelOuter = bvNone
      Color = 8180311
      ParentBackground = False
      TabOrder = 6
      object btnIniciarVenda: TSpeedButton
        Left = 0
        Top = 0
        Width = 80
        Height = 74
        Align = alClient
        Caption = 'F2'#13'Iniciar'#13'Venda'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        OnClick = btnIniciarVendaClick
        ExplicitLeft = 1
        ExplicitTop = 1
        ExplicitHeight = 70
      end
    end
    object pnlOpcoes: TPanel
      Tag = 1
      Left = 636
      Top = 0
      Width = 80
      Height = 74
      Align = alLeft
      BevelOuter = bvNone
      Color = 8180311
      ParentBackground = False
      TabOrder = 7
      object btnOpcoes: TSpeedButton
        Left = 0
        Top = 0
        Width = 80
        Height = 74
        Align = alClient
        Caption = 'F10'#13'Opcoes'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        OnClick = btnOpcoesClick
        ExplicitLeft = 24
        ExplicitTop = 24
        ExplicitWidth = 23
        ExplicitHeight = 22
      end
    end
    object pnlFinalizarVenda: TPanel
      Tag = 1
      Left = 724
      Top = 0
      Width = 80
      Height = 74
      Align = alLeft
      BevelOuter = bvNone
      Color = 8180311
      ParentBackground = False
      TabOrder = 8
      object btnFinalizarVenda: TSpeedButton
        Left = 0
        Top = 0
        Width = 80
        Height = 74
        Align = alClient
        Caption = 'F12'#13'Finalizar'#13'Venda'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        OnClick = btnFinalizarVendaClick
        ExplicitLeft = 16
        ExplicitTop = 16
        ExplicitWidth = 23
        ExplicitHeight = 22
      end
    end
    object pnlCancelarNotas: TPanel
      Tag = 1
      Left = 372
      Top = 0
      Width = 80
      Height = 74
      Align = alLeft
      BevelOuter = bvNone
      Color = 8180311
      ParentBackground = False
      TabOrder = 9
      object btnCancelarNota: TSpeedButton
        Left = 0
        Top = 0
        Width = 80
        Height = 74
        Align = alClient
        Caption = 'F6'#13'Cancelar'#13'Nota'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        OnClick = btnCancelarNotaClick
        ExplicitLeft = 8
        ExplicitTop = 32
        ExplicitWidth = 23
        ExplicitHeight = 22
      end
    end
    object pnl1: TPanel
      Left = 878
      Top = 0
      Width = 8
      Height = 74
      Align = alRight
      BevelOuter = bvNone
      Color = clWhite
      ParentBackground = False
      TabOrder = 10
    end
    object pnl8: TPanel
      Left = 0
      Top = 74
      Width = 886
      Height = 8
      Align = alBottom
      BevelOuter = bvNone
      Color = clWhite
      ParentBackground = False
      TabOrder = 11
    end
    object pnlIdentificarCliente: TPanel
      Tag = 1
      Left = 196
      Top = 0
      Width = 80
      Height = 74
      Align = alLeft
      BevelOuter = bvNone
      Color = 8180311
      ParentBackground = False
      TabOrder = 12
      object btnIdentificarCliente: TSpeedButton
        Left = 0
        Top = 0
        Width = 80
        Height = 74
        Align = alClient
        Caption = 'F4'#13'Identificar'#13'Cliente'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        OnClick = btnIdentificarClienteClick
        ExplicitLeft = 32
        ExplicitTop = 16
        ExplicitWidth = 23
        ExplicitHeight = 22
      end
    end
  end
  object pnlDisplayValores: TPanel
    Left = 654
    Top = 66
    Width = 224
    Height = 380
    Align = alRight
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 2
    object lbl4: TLabel
      Left = 6
      Top = 325
      Width = 151
      Height = 16
      Caption = 'Abrir Venda pelo Leitor'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object pnlQuantidade: TPanel
      Left = 0
      Top = 0
      Width = 224
      Height = 105
      Align = alTop
      BevelOuter = bvNone
      Color = clWhite
      ParentBackground = False
      TabOrder = 0
      object lbl1: TLabel
        Left = 0
        Top = 0
        Width = 224
        Height = 16
        Align = alTop
        Caption = 'Quantidade'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        ExplicitWidth = 74
      end
      object edtItemQuantidade: TEdit
        Left = 0
        Top = 16
        Width = 224
        Height = 79
        Align = alTop
        BorderStyle = bsNone
        Color = 15908714
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -59
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
    end
    object pnlPreco: TPanel
      Left = 0
      Top = 105
      Width = 224
      Height = 105
      Align = alTop
      BevelOuter = bvNone
      Color = clWhite
      ParentBackground = False
      TabOrder = 1
      object lbl2: TLabel
        Left = 0
        Top = 0
        Width = 224
        Height = 16
        Align = alTop
        Caption = 'Pre'#231'o R$'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        ExplicitWidth = 58
      end
      object edtItemPrecoUnitario: TEdit
        Left = 0
        Top = 16
        Width = 224
        Height = 79
        Align = alTop
        BorderStyle = bsNone
        Color = 15908714
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -59
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
    end
    object pnlTotalItem: TPanel
      Left = 0
      Top = 210
      Width = 224
      Height = 105
      Align = alTop
      BevelOuter = bvNone
      Color = clWhite
      ParentBackground = False
      TabOrder = 2
      object lbl3: TLabel
        Left = 0
        Top = 0
        Width = 224
        Height = 16
        Align = alTop
        Caption = 'Total do Item R$'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        ExplicitWidth = 107
      end
      object edtItemValorTotal: TEdit
        Left = 0
        Top = 16
        Width = 224
        Height = 79
        Align = alTop
        BorderStyle = bsNone
        Color = 15908714
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -59
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
    end
    object edtAbrirVendaViaLeitor: TEdit
      Left = 0
      Top = 344
      Width = 210
      Height = 21
      Color = clSkyBlue
      TabOrder = 3
      OnEnter = edtAbrirVendaViaLeitorEnter
      OnKeyPress = edtAbrirVendaViaLeitorKeyPress
    end
  end
  object pnlPreRodape: TPanel
    Left = 0
    Top = 446
    Width = 886
    Height = 16
    Align = alBottom
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 3
    object spl4: TSplitter
      Left = 0
      Top = 0
      Height = 16
      ExplicitLeft = 624
      ExplicitTop = 32
      ExplicitHeight = 100
    end
  end
  object CupomFiscal: TPanelCupomFiscal
    Left = 8
    Top = 66
    Width = 185
    Height = 380
    Align = alLeft
    BevelOuter = bvNone
    Caption = 'CupomFiscal'
    Color = clWhite
    ParentBackground = False
    TabOrder = 4
  end
  object pnl6: TPanel
    Left = 878
    Top = 66
    Width = 8
    Height = 380
    Align = alRight
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 5
  end
  object pnl7: TPanel
    Left = 0
    Top = 66
    Width = 8
    Height = 380
    Align = alLeft
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 6
  end
end
