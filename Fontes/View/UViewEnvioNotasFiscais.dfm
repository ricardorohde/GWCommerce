object ViewEnvioNotasFiscais: TViewEnvioNotasFiscais
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'ViewEnvioNotasFiscais'
  ClientHeight = 478
  ClientWidth = 807
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
    Top = 0
    Width = 807
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    object lbl1: TLabel
      Left = 16
      Top = 22
      Width = 79
      Height = 13
      Caption = 'Data Emiss'#227'o:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object dtpDataFiltro: TDateTimePicker
      Left = 101
      Top = 14
      Width = 106
      Height = 21
      Date = 44012.943612314810000000
      Time = 44012.943612314810000000
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
    object pnlBuscarNotas: TPanel
      Left = 213
      Top = 6
      Width = 89
      Height = 32
      BevelOuter = bvNone
      Color = 8180311
      ParentBackground = False
      TabOrder = 1
      object btnConsultar: TSpeedButton
        Left = 0
        Top = 0
        Width = 89
        Height = 32
        Align = alClient
        Caption = 'Buscar'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        OnClick = btnConsultarClick
        ExplicitLeft = 16
        ExplicitTop = 8
        ExplicitWidth = 23
        ExplicitHeight = 22
      end
    end
    object chkGerarArquivoEnvio: TCheckBox
      Left = 320
      Top = 13
      Width = 153
      Height = 17
      Caption = 'Gerar Arquivo de Envio'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
    end
  end
  object pnl2: TPanel
    Left = 0
    Top = 398
    Width = 807
    Height = 80
    Align = alBottom
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 1
    object pnlCancelar: TPanel
      Left = 8
      Top = 8
      Width = 96
      Height = 64
      Align = alLeft
      BevelOuter = bvNone
      Color = 8180311
      ParentBackground = False
      TabOrder = 0
      object btnCancelar: TSpeedButton
        Left = 0
        Top = 0
        Width = 96
        Height = 64
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
        ExplicitLeft = 48
        ExplicitTop = -10
      end
    end
    object pnlEnviar: TPanel
      Left = 703
      Top = 8
      Width = 96
      Height = 64
      Align = alRight
      BevelOuter = bvNone
      Color = 8180311
      ParentBackground = False
      TabOrder = 1
      object btnEnviar: TSpeedButton
        Left = 0
        Top = 0
        Width = 96
        Height = 64
        Align = alClient
        Caption = 'Enviar'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        OnClick = btnEnviarClick
        ExplicitLeft = 40
        ExplicitTop = 32
        ExplicitWidth = 23
        ExplicitHeight = 22
      end
    end
    object pnl9: TPanel
      Left = 0
      Top = 8
      Width = 8
      Height = 64
      Align = alLeft
      BevelOuter = bvNone
      Color = clWhite
      ParentBackground = False
      TabOrder = 2
    end
    object pnl10: TPanel
      Left = 799
      Top = 8
      Width = 8
      Height = 64
      Align = alRight
      BevelOuter = bvNone
      Color = clWhite
      ParentBackground = False
      TabOrder = 3
    end
    object pnl8: TPanel
      Left = 0
      Top = 72
      Width = 807
      Height = 8
      Align = alBottom
      BevelOuter = bvNone
      Color = clWhite
      ParentBackground = False
      TabOrder = 4
    end
    object pnl11: TPanel
      Left = 0
      Top = 0
      Width = 807
      Height = 8
      Align = alTop
      BevelOuter = bvNone
      Color = clWhite
      ParentBackground = False
      TabOrder = 5
    end
  end
  object pnl3: TPanel
    Left = 0
    Top = 41
    Width = 807
    Height = 357
    Align = alClient
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 2
    object pnl4: TPanel
      Left = 0
      Top = 0
      Width = 807
      Height = 8
      Align = alTop
      BevelOuter = bvNone
      Color = clWhite
      ParentBackground = False
      TabOrder = 0
    end
    object pnl5: TPanel
      Left = 0
      Top = 349
      Width = 807
      Height = 8
      Align = alBottom
      BevelOuter = bvNone
      Color = clWhite
      ParentBackground = False
      TabOrder = 1
    end
    object pnl6: TPanel
      Left = 0
      Top = 8
      Width = 8
      Height = 341
      Align = alLeft
      BevelOuter = bvNone
      Color = clWhite
      ParentBackground = False
      TabOrder = 2
    end
    object pnl7: TPanel
      Left = 799
      Top = 8
      Width = 8
      Height = 341
      Align = alRight
      BevelOuter = bvNone
      Color = clWhite
      ParentBackground = False
      TabOrder = 3
    end
    object gridNotas: TDBGrid
      Left = 8
      Top = 8
      Width = 791
      Height = 341
      Align = alClient
      BorderStyle = bsNone
      DataSource = dsConsultaNotas
      DrawingStyle = gdsGradient
      Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleHotTrack]
      ReadOnly = True
      TabOrder = 4
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDrawColumnCell = gridNotasDrawColumnCell
      Columns = <
        item
          Expanded = False
          FieldName = 'ID_NFE'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'REGISTRO_EMIT'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'ID_VENDEDOR'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'CHAVE'
          Title.Alignment = taCenter
          Title.Caption = 'Chave'
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
          FieldName = 'IDE_CUF'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'IDE_NATOP'
          Visible = False
        end
        item
          Alignment = taLeftJustify
          Expanded = False
          FieldName = 'IDE_MOD'
          Title.Alignment = taCenter
          Title.Caption = 'Modelo'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Visible = True
        end
        item
          Alignment = taLeftJustify
          Expanded = False
          FieldName = 'IDE_SERIE'
          Title.Alignment = taCenter
          Title.Caption = 'S'#233'rie'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Visible = True
        end
        item
          Alignment = taLeftJustify
          Expanded = False
          FieldName = 'IDE_NNF'
          Title.Alignment = taCenter
          Title.Caption = 'N'#250'mero'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'IDE_DHEMI'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'IDE_DHSAIENT'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'IDE_TPNF'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'IDE_IDDEST'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'IDE_CMUNFG'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'IDE_TP_IMP'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'IDE_TPEMIS'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'IDE_TPAMB'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'IDE_FINNFE'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'IDE_INDFINAL'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'IDE_INDPRES'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'IDE_PROCEMI'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'IDE_VERPROC'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'EMIT_CNPJ_CPF'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'EMIT_CPF'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'EMIT_XNOME'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'EMIT_XFANT'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'EMIT_XLGR'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'EMIT_NRO'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'EMIT_XCPL'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'EMIT_XBAIRRO'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'EMIT_CMUN'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'EMIT_XMUN'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'EMIT_UF'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'EMIT_CEP'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'EMIT_CPAIS'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'EMIT_XPAIS'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'EMIT_FONE'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'EMIT_IE'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'EMIT_IM'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'EMIT_CNAE'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'EMIT_CRT'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'ID_CLIENTE'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'DEST_CNPJ_CPF'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'DEST_IDESTRANGEIRO'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'DEST_XNOME'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'DEST_XLGR'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'DEST_NRO'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'DEST_XCPL'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'DEST_XBAIRRO'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'DEST_CMUN'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'DEST_XMUN'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'DEST_UF'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'DEST_CEP'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'DEST_CPAIS'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'DEST_XPAIS'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'DEST_FONE'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'DEST_INDIEDEST'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'DEST_IE'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'DEST_EMAIL'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'VBC'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'VICMS'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'VICMSDESON'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'VBCST'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'VST'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'VPROD'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'VFRETE'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'VSEG'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'VDESC'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'VII'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'VIPI'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'VPIS'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'VCOFINS'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'VOUTRO'
          Visible = False
        end
        item
          Alignment = taLeftJustify
          Expanded = False
          FieldName = 'VNF'
          Title.Alignment = taCenter
          Title.Caption = 'Valor'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VTOTTRIB'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'MODFRETE'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'ID_TRANSP'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'TRANSP_CNPJ_CPF'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'TRANSP_XNOME'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'TRANSP_IE'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'TRANSP_XENDER'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'TRANSP_XMUN'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'TRANSP_UF'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'VEIC_PLACA'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'VEIC_UF'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'VEIC_RNTC'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'VOL_QVOL'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'VOL_ESP'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'VOL_MARCA'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'VOL_NVOL'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'VOL_PESOL'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'VOL_PESOB'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'INFADFISCO'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'INFCPL'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'REFNFE'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'EXPORTA_UFEMARQ'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'EXPORTA_XLOCEMARQ'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'CD_STATUS'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'PROTOCOLO_AUTORIZACAO'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'DT_AUTORIZACAO'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'MOTIVO_CANCELAMENTO'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'PROTOCOLO_CANCELAMENTO'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'DT_CANCELAMENTO'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'XML_APROVADO'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'XML_CANCELADO'
          Visible = False
        end>
    end
  end
  object dsConsultaNotas: TDataSource
    DataSet = dmDados.cliConsultaNotasEnviarApi
    Left = 616
    Top = 193
  end
end
