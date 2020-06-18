object ViewSelecaoCertificado: TViewSelecaoCertificado
  Left = 0
  Top = 0
  BorderIcons = [biMinimize, biMaximize]
  BorderStyle = bsSingle
  Caption = 'Emitente Configura'#231#227'o'
  ClientHeight = 341
  ClientWidth = 714
  Color = clLime
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
    Top = 253
    Width = 714
    Height = 88
    Align = alBottom
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    object pnlConfirmar: TPanel
      Left = 610
      Top = 8
      Width = 96
      Height = 72
      Align = alRight
      BevelOuter = bvNone
      Color = 8180311
      ParentBackground = False
      TabOrder = 0
      ExplicitLeft = 546
      ExplicitTop = 14
      ExplicitHeight = 49
      object btnConfirmar: TSpeedButton
        Left = 0
        Top = 0
        Width = 96
        Height = 72
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
        ExplicitLeft = 8
        ExplicitTop = 16
        ExplicitWidth = 23
        ExplicitHeight = 22
      end
    end
    object pnlFechar: TPanel
      Left = 8
      Top = 8
      Width = 96
      Height = 72
      Align = alLeft
      BevelOuter = bvNone
      Color = 8180311
      ParentBackground = False
      TabOrder = 1
      ExplicitLeft = 104
      ExplicitTop = 16
      ExplicitHeight = 49
      object btnFechar: TSpeedButton
        Left = 0
        Top = 0
        Width = 96
        Height = 72
        Align = alClient
        Caption = 'Fechar'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        OnClick = btnFecharClick
        ExplicitLeft = 64
        ExplicitTop = 32
        ExplicitWidth = 23
        ExplicitHeight = 22
      end
    end
    object pnl7: TPanel
      Left = 0
      Top = 80
      Width = 714
      Height = 8
      Align = alBottom
      BevelOuter = bvNone
      Color = clWhite
      ParentBackground = False
      TabOrder = 2
      ExplicitLeft = 368
      ExplicitTop = 8
      ExplicitWidth = 185
    end
    object pnl8: TPanel
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
    object pnl9: TPanel
      Left = 706
      Top = 8
      Width = 8
      Height = 72
      Align = alRight
      BevelOuter = bvNone
      Color = clWhite
      ParentBackground = False
      TabOrder = 4
      ExplicitLeft = 384
      ExplicitTop = 24
      ExplicitHeight = 41
    end
    object pnl10: TPanel
      Left = 0
      Top = 8
      Width = 8
      Height = 72
      Align = alLeft
      BevelOuter = bvNone
      Color = clWhite
      ParentBackground = False
      TabOrder = 5
      ExplicitTop = 0
    end
  end
  object pnl2: TPanel
    Left = 0
    Top = 0
    Width = 714
    Height = 253
    Align = alClient
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 1
    ExplicitHeight = 257
    object grid1: TDBGrid
      Left = 8
      Top = 8
      Width = 698
      Height = 237
      Align = alClient
      BorderStyle = bsNone
      Color = clWhite
      DataSource = dsCertificados
      DrawingStyle = gdsGradient
      Options = [dgTitles, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleHotTrack]
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDrawColumnCell = grid1DrawColumnCell
      Columns = <
        item
          Expanded = False
          FieldName = 'SERIE'
          Title.Caption = 'S'#233'rie'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = -1
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'RAZAO_SOCIAL'
          Title.Caption = 'Raz'#227'o Social'
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
          FieldName = 'CNPJ'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 200
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DATA_VENCIMENTO'
          Title.Caption = 'Vencimento'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 200
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CERTIFICADORA'
          Title.Caption = 'Certificadora'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 250
          Visible = True
        end>
    end
    object pnl3: TPanel
      Left = 0
      Top = 245
      Width = 714
      Height = 8
      Align = alBottom
      BevelOuter = bvNone
      Color = clWhite
      ParentBackground = False
      TabOrder = 1
      ExplicitLeft = 40
      ExplicitTop = 112
      ExplicitWidth = 185
    end
    object pnl4: TPanel
      Left = 0
      Top = 0
      Width = 714
      Height = 8
      Align = alTop
      BevelOuter = bvNone
      Color = clWhite
      ParentBackground = False
      TabOrder = 2
    end
    object pnl5: TPanel
      Left = 706
      Top = 8
      Width = 8
      Height = 237
      Align = alRight
      BevelOuter = bvNone
      Color = clWhite
      ParentBackground = False
      TabOrder = 3
      ExplicitLeft = 56
      ExplicitTop = 128
      ExplicitHeight = 41
    end
    object pnl6: TPanel
      Left = 0
      Top = 8
      Width = 8
      Height = 237
      Align = alLeft
      BevelOuter = bvNone
      Color = clWhite
      ParentBackground = False
      TabOrder = 4
      ExplicitTop = 0
      ExplicitHeight = 257
    end
  end
  object cliCertificados: TClientDataSet
    PersistDataPacket.Data = {
      B40000009619E0BD010000001800000005000000000003000000B40005534552
      494501004900000001000557494454480200020046000C52415A414F5F534F43
      49414C010049000000010005574944544802000200640004434E504A01004900
      00000100055749445448020002000E000F444154415F56454E43494D454E544F
      01004900000001000557494454480200020014000D434552544946494341444F
      5241020049000000010005574944544802000200FF000000}
    Active = True
    Aggregates = <>
    Params = <>
    Left = 232
    Top = 112
    object cliCertificadosSERIE: TStringField
      FieldName = 'SERIE'
      Size = 70
    end
    object cliCertificadosRAZAO_SOCIAL: TStringField
      FieldName = 'RAZAO_SOCIAL'
      Size = 100
    end
    object cliCertificadosCNPJ: TStringField
      FieldName = 'CNPJ'
      Size = 14
    end
    object cliCertificadosDATA_VENCIMENTO: TStringField
      FieldName = 'DATA_VENCIMENTO'
    end
    object cliCertificadosCERTIFICADORA: TStringField
      FieldName = 'CERTIFICADORA'
      Size = 255
    end
  end
  object dsCertificados: TDataSource
    DataSet = cliCertificados
    Left = 128
    Top = 104
  end
  object ACBrNFe1: TACBrNFe
    Configuracoes.Geral.SSLLib = libNone
    Configuracoes.Geral.SSLCryptLib = cryNone
    Configuracoes.Geral.SSLHttpLib = httpNone
    Configuracoes.Geral.SSLXmlSignLib = xsNone
    Configuracoes.Geral.FormatoAlerta = 'TAG:%TAGNIVEL% ID:%ID%/%TAG%(%DESCRICAO%) - %MSG%.'
    Configuracoes.Geral.VersaoQRCode = veqr000
    Configuracoes.Arquivos.OrdenacaoPath = <>
    Configuracoes.WebServices.UF = 'SP'
    Configuracoes.WebServices.AguardarConsultaRet = 0
    Configuracoes.WebServices.QuebradeLinha = '|'
    Configuracoes.RespTec.IdCSRT = 0
    Left = 376
    Top = 80
  end
end
