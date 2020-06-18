object ViewEmitente: TViewEmitente
  Left = 0
  Top = 0
  BorderIcons = [biMinimize, biMaximize]
  BorderStyle = bsSingle
  Caption = 'ViewEmitente'
  ClientHeight = 626
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
  OnKeyPress = FormKeyPress
  OnKeyUp = FormKeyUp
  PixelsPerInch = 96
  TextHeight = 13
  object pnlIdentificacao: TPanel
    Left = 0
    Top = 0
    Width = 714
    Height = 81
    Align = alTop
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    object grp1: TGroupBox
      Left = 8
      Top = 0
      Width = 698
      Height = 81
      Align = alClient
      Caption = 'IDENTIFICA'#199#195'O'
      TabOrder = 0
      ExplicitLeft = 14
      ExplicitWidth = 684
      object lbl1: TLabel
        Left = 3
        Top = 24
        Width = 91
        Height = 13
        Caption = 'Nome/Raz'#227'o Social'
      end
      object lbl2: TLabel
        Left = 14
        Top = 48
        Width = 80
        Height = 13
        Caption = 'Apelido/Fantasia'
      end
      object lbl18: TLabel
        Left = 504
        Top = 24
        Width = 27
        Height = 13
        Caption = 'CNAE'
      end
      object lbl24: TLabel
        Left = 498
        Top = 48
        Width = 33
        Height = 13
        Caption = 'C'#243'digo'
      end
      object edtNomeRazaoSocial: TEdit
        Tag = 1
        Left = 100
        Top = 17
        Width = 387
        Height = 21
        Hint = 'Raz'#227'o Social'
        CharCase = ecUpperCase
        MaxLength = 100
        TabOrder = 0
      end
      object edtApelidoFantasia: TEdit
        Tag = 1
        Left = 100
        Top = 40
        Width = 387
        Height = 21
        Hint = 'Nome Fantasia'
        CharCase = ecUpperCase
        MaxLength = 100
        TabOrder = 1
      end
      object edtCNAE: TEdit
        Tag = 1
        Left = 537
        Top = 17
        Width = 155
        Height = 21
        Hint = 'CNAE'
        MaxLength = 20
        NumbersOnly = True
        TabOrder = 2
      end
      object edtCodigo: TEdit
        Tag = 1
        Left = 537
        Top = 40
        Width = 155
        Height = 21
        Hint = 'C'#243'digo'
        MaxLength = 7
        NumbersOnly = True
        TabOrder = 3
      end
    end
    object pnl5: TPanel
      Left = 0
      Top = 0
      Width = 8
      Height = 81
      Align = alLeft
      BevelOuter = bvNone
      Color = clWhite
      ParentBackground = False
      TabOrder = 1
      ExplicitLeft = 8
      ExplicitTop = 16
      ExplicitHeight = 41
    end
    object pnl6: TPanel
      Left = 706
      Top = 0
      Width = 8
      Height = 81
      Align = alRight
      BevelOuter = bvNone
      Color = clWhite
      ParentBackground = False
      TabOrder = 2
      ExplicitLeft = 529
    end
  end
  object pnlContato: TPanel
    Left = 0
    Top = 81
    Width = 714
    Height = 81
    Align = alTop
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 1
    object grp2: TGroupBox
      Left = 8
      Top = 0
      Width = 698
      Height = 81
      Align = alClient
      Caption = 'CONTATOS'
      TabOrder = 0
      ExplicitLeft = 14
      ExplicitWidth = 684
      object lbl3: TLabel
        Left = 55
        Top = 24
        Width = 39
        Height = 13
        Caption = 'Contato'
      end
      object lbl4: TLabel
        Left = 344
        Top = 24
        Width = 42
        Height = 13
        Caption = 'Telefone'
      end
      object lbl5: TLabel
        Left = 70
        Top = 51
        Width = 24
        Height = 13
        Caption = 'Email'
      end
      object edtContato: TEdit
        Tag = 1
        Left = 100
        Top = 16
        Width = 213
        Height = 21
        Hint = 'Contato'
        CharCase = ecUpperCase
        MaxLength = 60
        TabOrder = 0
      end
      object edtTelefone: TEdit
        Tag = 1
        Left = 392
        Top = 16
        Width = 213
        Height = 21
        Hint = 'Telefone'
        CharCase = ecUpperCase
        MaxLength = 30
        NumbersOnly = True
        TabOrder = 1
      end
      object edtEmail: TEdit
        Left = 100
        Top = 43
        Width = 505
        Height = 21
        CharCase = ecLowerCase
        MaxLength = 255
        TabOrder = 2
      end
    end
    object pnl7: TPanel
      Left = 0
      Top = 0
      Width = 8
      Height = 81
      Align = alLeft
      BevelOuter = bvNone
      Color = clWhite
      ParentBackground = False
      TabOrder = 1
    end
    object pnl8: TPanel
      Left = 706
      Top = 0
      Width = 8
      Height = 81
      Align = alRight
      BevelOuter = bvNone
      Color = clWhite
      ParentBackground = False
      TabOrder = 2
      ExplicitLeft = 176
      ExplicitTop = 43
      ExplicitHeight = 41
    end
  end
  object pnlEndereco: TPanel
    Left = 0
    Top = 162
    Width = 714
    Height = 127
    Align = alTop
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 2
    object grp3: TGroupBox
      Left = 8
      Top = 0
      Width = 698
      Height = 127
      Align = alClient
      Caption = 'ENDERE'#199'O'
      TabOrder = 0
      ExplicitLeft = 14
      ExplicitWidth = 684
      object lbl6: TLabel
        Left = 48
        Top = 20
        Width = 45
        Height = 13
        Caption = 'Endere'#231'o'
      end
      object lbl7: TLabel
        Left = 65
        Top = 47
        Width = 28
        Height = 13
        Caption = 'Bairro'
      end
      object lbl8: TLabel
        Left = 342
        Top = 47
        Width = 43
        Height = 13
        Caption = 'Municipio'
      end
      object lbl9: TLabel
        Left = 9
        Top = 71
        Width = 84
        Height = 13
        Caption = 'C'#243'digo da Cidade'
      end
      object lbl10: TLabel
        Left = 608
        Top = 24
        Width = 12
        Height = 13
        Caption = 'N'#186
      end
      object lbl11: TLabel
        Left = 366
        Top = 72
        Width = 19
        Height = 13
        Caption = 'CEP'
      end
      object lbl12: TLabel
        Left = 8
        Top = 95
        Width = 84
        Height = 13
        Caption = 'C'#243'digo do Estado'
      end
      object lbl13: TLabel
        Left = 352
        Top = 95
        Width = 33
        Height = 13
        Caption = 'Estado'
      end
      object edtEndereco: TEdit
        Tag = 1
        Left = 99
        Top = 16
        Width = 505
        Height = 21
        Hint = 'Endere'#231'o'
        CharCase = ecUpperCase
        MaxLength = 100
        TabOrder = 0
      end
      object edtBairro: TEdit
        Tag = 1
        Left = 99
        Top = 39
        Width = 213
        Height = 21
        Hint = 'Bairro'
        CharCase = ecUpperCase
        MaxLength = 60
        TabOrder = 2
      end
      object edtMunicipio: TEdit
        Tag = 1
        Left = 391
        Top = 39
        Width = 213
        Height = 21
        Hint = 'Municipio'
        CharCase = ecUpperCase
        MaxLength = 100
        TabOrder = 3
      end
      object edtCodigoCidade: TEdit
        Tag = 1
        Left = 99
        Top = 64
        Width = 213
        Height = 21
        Hint = 'C'#243'digo da Cidade'
        MaxLength = 10
        NumbersOnly = True
        TabOrder = 4
      end
      object edtNumero: TEdit
        Tag = 1
        Left = 626
        Top = 16
        Width = 66
        Height = 21
        Hint = 'N'#250'mero do Endere'#231'o'
        CharCase = ecUpperCase
        MaxLength = 10
        TabOrder = 1
      end
      object edtCep: TEdit
        Tag = 1
        Left = 391
        Top = 64
        Width = 213
        Height = 21
        Hint = 'CEP'
        MaxLength = 20
        NumbersOnly = True
        TabOrder = 5
      end
      object edtCodigoEstado: TEdit
        Tag = 1
        Left = 99
        Top = 92
        Width = 213
        Height = 21
        Hint = 'C'#243'digo do Estado'
        MaxLength = 10
        NumbersOnly = True
        TabOrder = 6
      end
      object edtEstado: TEdit
        Tag = 1
        Left = 392
        Top = 92
        Width = 212
        Height = 21
        Hint = 'Estado'
        CharCase = ecUpperCase
        MaxLength = 60
        TabOrder = 7
      end
    end
    object pnl9: TPanel
      Left = 0
      Top = 0
      Width = 8
      Height = 127
      Align = alLeft
      BevelOuter = bvNone
      Color = clWhite
      ParentBackground = False
      TabOrder = 1
    end
    object pnl10: TPanel
      Left = 706
      Top = 0
      Width = 8
      Height = 127
      Align = alRight
      BevelOuter = bvNone
      Color = clWhite
      ParentBackground = False
      TabOrder = 2
      ExplicitLeft = 529
    end
  end
  object pnlDocumentos: TPanel
    Left = 0
    Top = 289
    Width = 714
    Height = 81
    Align = alTop
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 3
    object grp4: TGroupBox
      Left = 8
      Top = 0
      Width = 698
      Height = 81
      Align = alClient
      Caption = 'DOCUMENTOS'
      TabOrder = 0
      ExplicitLeft = 14
      ExplicitWidth = 689
      object lbl14: TLabel
        Left = 69
        Top = 24
        Width = 25
        Height = 13
        Caption = 'CNPJ'
      end
      object lbl15: TLabel
        Left = 367
        Top = 24
        Width = 19
        Height = 13
        Caption = 'CPF'
      end
      object lbl16: TLabel
        Left = 7
        Top = 52
        Width = 87
        Height = 13
        Caption = 'Inscri'#231#227'o Estadual'
      end
      object lbl17: TLabel
        Left = 316
        Top = 52
        Width = 70
        Height = 13
        Caption = 'Insc. Municipal'
      end
      object edtCNPJ: TEdit
        Tag = 1
        Left = 100
        Top = 16
        Width = 213
        Height = 21
        Hint = 'CNPJ'
        MaxLength = 14
        NumbersOnly = True
        TabOrder = 0
      end
      object edtCPF: TEdit
        Left = 392
        Top = 16
        Width = 213
        Height = 21
        MaxLength = 11
        NumbersOnly = True
        TabOrder = 1
      end
      object edtInscricaoEstadual: TEdit
        Tag = 1
        Left = 100
        Top = 44
        Width = 213
        Height = 21
        Hint = 'Inscri'#231#227'o Estadual'
        MaxLength = 20
        NumbersOnly = True
        TabOrder = 2
      end
      object edtInscricaoMunicipal: TEdit
        Left = 392
        Top = 44
        Width = 213
        Height = 21
        NumbersOnly = True
        TabOrder = 3
      end
    end
    object pnl11: TPanel
      Left = 0
      Top = 0
      Width = 8
      Height = 81
      Align = alLeft
      BevelOuter = bvNone
      Color = clWhite
      ParentBackground = False
      TabOrder = 1
      ExplicitLeft = 16
    end
    object pnl12: TPanel
      Left = 706
      Top = 0
      Width = 8
      Height = 81
      Align = alRight
      BevelOuter = bvNone
      Color = clWhite
      ParentBackground = False
      TabOrder = 2
      ExplicitLeft = 502
      ExplicitTop = 15
      ExplicitHeight = 64
    end
  end
  object pnlConfiguracoes: TPanel
    Left = 0
    Top = 370
    Width = 714
    Height = 167
    Align = alTop
    BevelOuter = bvNone
    Color = clFuchsia
    ParentBackground = False
    TabOrder = 4
    object grp5: TGroupBox
      Left = 8
      Top = 0
      Width = 698
      Height = 167
      Align = alClient
      Caption = 'CONFIGURA'#199#213'ES'
      Color = clWhite
      ParentBackground = False
      ParentColor = False
      TabOrder = 0
      ExplicitLeft = 12
      ExplicitWidth = 689
      object grp6: TGroupBox
        Left = 6
        Top = 12
        Width = 318
        Height = 102
        Caption = 'NFC-e'
        Color = clWhite
        ParentBackground = False
        ParentColor = False
        TabOrder = 0
        object lbl19: TLabel
          Left = 63
          Top = 19
          Width = 24
          Height = 13
          Caption = 'S'#233'rie'
        end
        object lbl20: TLabel
          Left = 17
          Top = 46
          Width = 70
          Height = 13
          Caption = #218'ltima Emiss'#227'o'
        end
        object edtNFCeSerie: TEdit
          Tag = 1
          Left = 94
          Top = 11
          Width = 212
          Height = 21
          Hint = 'S'#233'rie da NFC-e'
          MaxLength = 5
          NumbersOnly = True
          TabOrder = 0
        end
        object edtNFCeUltimaEmissao: TEdit
          Tag = 1
          Left = 94
          Top = 38
          Width = 213
          Height = 21
          Hint = #218'ltimo n'#250'mero da Nota NFC-e Emitida'
          MaxLength = 5
          TabOrder = 1
        end
        object rgNFCeAmbiente: TRadioGroup
          Left = 4
          Top = 60
          Width = 310
          Height = 40
          Caption = 'Ambiente de Emiss'#227'o'
          Columns = 2
          Items.Strings = (
            'Produ'#231#227'o'
            'Homologa'#231#227'o')
          TabOrder = 2
        end
      end
      object grp7: TGroupBox
        Left = 6
        Top = 120
        Width = 318
        Height = 41
        Caption = 'Conex'#227'o API'
        Color = clWhite
        ParentBackground = False
        ParentColor = False
        TabOrder = 2
        object lbl23: TLabel
          Left = 57
          Top = 19
          Width = 29
          Height = 13
          Caption = 'Token'
        end
        object edtApiToken: TEdit
          Tag = 1
          Left = 94
          Top = 11
          Width = 212
          Height = 21
          Hint = 'Token da conex'#227'o com a API'
          MaxLength = 50
          TabOrder = 0
        end
      end
      object grp8: TGroupBox
        Left = 326
        Top = 12
        Width = 318
        Height = 149
        Caption = 'Certificado Digital'
        Color = clWhite
        ParentBackground = False
        ParentColor = False
        TabOrder = 1
        object lbl21: TLabel
          Left = 27
          Top = 19
          Width = 33
          Height = 13
          Caption = 'CSC Id'
        end
        object lbl22: TLabel
          Left = 7
          Top = 46
          Width = 52
          Height = 13
          Caption = 'CSC Token'
        end
        object lbl25: TLabel
          Left = 35
          Top = 79
          Width = 24
          Height = 13
          Caption = 'S'#233'rie'
        end
        object lbl26: TLabel
          Left = 29
          Top = 108
          Width = 30
          Height = 13
          Caption = 'Senha'
        end
        object btnSelecionarCertificado: TSpeedButton
          Left = 284
          Top = 71
          Width = 23
          Height = 22
          Caption = '...'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          OnClick = btnSelecionarCertificadoClick
        end
        object edtCSCId: TEdit
          Tag = 1
          Left = 66
          Top = 11
          Width = 215
          Height = 21
          Hint = 'CSC Id da NFC-e'
          MaxLength = 30
          NumbersOnly = True
          TabOrder = 0
        end
        object edtCSCToken: TEdit
          Tag = 1
          Left = 66
          Top = 40
          Width = 215
          Height = 21
          Hint = 'CSC Token da NFC-e'
          MaxLength = 50
          TabOrder = 1
        end
        object edtCertificadoSerie: TEdit
          Tag = 1
          Left = 66
          Top = 71
          Width = 215
          Height = 21
          Hint = 'S'#233'rie do Certificado Digital'
          MaxLength = 50
          ReadOnly = True
          TabOrder = 2
        end
        object edtCertificadoSenha: TEdit
          Tag = 1
          Left = 66
          Top = 100
          Width = 215
          Height = 21
          Hint = 'Senha do Certificado Digital'
          MaxLength = 50
          PasswordChar = '*'
          TabOrder = 3
        end
      end
    end
    object pnl13: TPanel
      Left = 706
      Top = 0
      Width = 8
      Height = 167
      Align = alRight
      BevelOuter = bvNone
      Color = clWhite
      ParentBackground = False
      TabOrder = 1
      ExplicitLeft = 529
    end
    object pnl14: TPanel
      Left = 0
      Top = 0
      Width = 8
      Height = 167
      Align = alLeft
      BevelOuter = bvNone
      Color = clWhite
      ParentBackground = False
      TabOrder = 2
    end
  end
  object pnlBotoes: TPanel
    Left = 0
    Top = 537
    Width = 714
    Height = 89
    Align = alBottom
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 5
    object pnlConfirmar: TPanel
      Left = 610
      Top = 8
      Width = 96
      Height = 73
      Align = alRight
      BevelOuter = bvNone
      Color = 8180311
      ParentBackground = False
      TabOrder = 0
      ExplicitLeft = 416
      ExplicitTop = 16
      ExplicitHeight = 41
      object btnConfirmar: TSpeedButton
        Left = 0
        Top = 0
        Width = 96
        Height = 73
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
        ExplicitLeft = 223
        ExplicitTop = 1
        ExplicitHeight = 68
      end
    end
    object pnlCancelar: TPanel
      Left = 8
      Top = 8
      Width = 96
      Height = 73
      Align = alLeft
      BevelOuter = bvNone
      Color = 8180311
      ParentBackground = False
      TabOrder = 1
      ExplicitLeft = 155
      ExplicitTop = 15
      ExplicitHeight = 42
      object btnCancelar: TSpeedButton
        Left = 0
        Top = 0
        Width = 96
        Height = 73
        Align = alClient
        Caption = 'Fechar'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        OnClick = btnCancelarClick
        ExplicitLeft = 16
        ExplicitTop = 8
        ExplicitWidth = 23
        ExplicitHeight = 22
      end
    end
    object pnl1: TPanel
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
    object pnl2: TPanel
      Left = 0
      Top = 81
      Width = 714
      Height = 8
      Align = alBottom
      BevelOuter = bvNone
      Color = clWhite
      ParentBackground = False
      TabOrder = 3
      ExplicitTop = 29
    end
    object pnl3: TPanel
      Left = 0
      Top = 8
      Width = 8
      Height = 73
      Align = alLeft
      BevelOuter = bvNone
      Color = clWhite
      ParentBackground = False
      TabOrder = 4
      ExplicitHeight = 54
    end
    object pnl4: TPanel
      Left = 706
      Top = 8
      Width = 8
      Height = 73
      Align = alRight
      BevelOuter = bvNone
      Color = clWhite
      ParentBackground = False
      TabOrder = 5
      ExplicitLeft = 529
      ExplicitHeight = 54
    end
  end
end
