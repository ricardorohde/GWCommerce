object dmDados: TdmDados
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 455
  Width = 1218
  object Conexao: TSQLConnection
    ConnectionName = 'FBConnection'
    DriverName = 'Firebird'
    LoginPrompt = False
    Params.Strings = (
      'DriverName=Firebird'
      'Database=C:\GWCommerce\BD\GWCommerce.fdb'
      'RoleName=RoleName'
      'User_Name=sysdba'
      'Password=masterkey'
      'ServerCharSet='
      'SQLDialect=3'
      'ErrorResourceFile='
      'LocaleCode=0000'
      'BlobSize=-1'
      'CommitRetain=False'
      'WaitOnLocks=True'
      'IsolationLevel=ReadCommitted'
      'Trim Char=False')
    Connected = True
    Left = 80
    Top = 16
  end
  object cliEstoque: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspEstoque'
    Left = 32
    Top = 224
    object cliEstoqueCODIGO_PRODUTO: TLargeintField
      FieldName = 'CODIGO_PRODUTO'
      Required = True
    end
    object cliEstoqueCODIGO: TLargeintField
      FieldName = 'CODIGO'
    end
    object cliEstoqueREGISTRO_EMIT: TLargeintField
      FieldName = 'REGISTRO_EMIT'
    end
    object cliEstoqueDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Required = True
      Size = 90
    end
    object cliEstoqueFORNECEDOR: TLargeintField
      FieldName = 'FORNECEDOR'
    end
    object cliEstoqueMEDIDA: TStringField
      FieldName = 'MEDIDA'
      Size = 10
    end
    object cliEstoquePRECO_VENDA: TFMTBCDField
      FieldName = 'PRECO_VENDA'
      OnGetText = cliEstoquePRECO_VENDAGetText
      Precision = 18
      Size = 2
    end
    object cliEstoqueCUSTOCOMPRA: TFMTBCDField
      FieldName = 'CUSTOCOMPRA'
      Precision = 18
      Size = 2
    end
    object cliEstoqueCUSTOMEDIO: TFMTBCDField
      FieldName = 'CUSTOMEDIO'
      Precision = 18
      Size = 2
    end
    object cliEstoqueQTD_COMPRA: TFMTBCDField
      FieldName = 'QTD_COMPRA'
      Precision = 18
      Size = 2
    end
    object cliEstoqueQTD_ATUAL: TFMTBCDField
      FieldName = 'QTD_ATUAL'
      Precision = 18
      Size = 2
    end
    object cliEstoqueQTD_MINIMA: TFMTBCDField
      FieldName = 'QTD_MINIMA'
      Precision = 18
      Size = 2
    end
    object cliEstoqueQTD_INICIO: TFMTBCDField
      FieldName = 'QTD_INICIO'
      Precision = 18
      Size = 2
    end
    object cliEstoqueDATA_INICIO: TDateField
      FieldName = 'DATA_INICIO'
    end
    object cliEstoqueULT_COMPRA: TDateField
      FieldName = 'ULT_COMPRA'
    end
    object cliEstoqueULT_VENDA: TDateField
      FieldName = 'ULT_VENDA'
    end
    object cliEstoqueLOCAL: TStringField
      FieldName = 'LOCAL'
      Size = 255
    end
    object cliEstoqueIPI: TFMTBCDField
      FieldName = 'IPI'
      Precision = 18
      Size = 2
    end
    object cliEstoqueST: TStringField
      FieldName = 'ST'
      Size = 3
    end
    object cliEstoqueCOMISSAO: TFMTBCDField
      FieldName = 'COMISSAO'
      Precision = 18
      Size = 2
    end
    object cliEstoqueMARGEM_LUCRO: TFMTBCDField
      FieldName = 'MARGEM_LUCRO'
      Precision = 18
      Size = 2
    end
    object cliEstoqueFOTO: TBlobField
      FieldName = 'FOTO'
      Size = 1
    end
    object cliEstoqueIAT: TStringField
      FieldName = 'IAT'
    end
    object cliEstoqueIPPT: TStringField
      FieldName = 'IPPT'
    end
    object cliEstoqueCST_IPI: TStringField
      FieldName = 'CST_IPI'
      Size = 2
    end
    object cliEstoqueCODSELOIPI: TStringField
      FieldName = 'CODSELOIPI'
    end
    object cliEstoqueCOD_ENQ_IPI: TStringField
      FieldName = 'COD_ENQ_IPI'
      Size = 3
    end
    object cliEstoqueTIPO_ITEM: TStringField
      FieldName = 'TIPO_ITEM'
      Size = 15
    end
    object cliEstoqueCSOSN: TStringField
      FieldName = 'CSOSN'
      Size = 3
    end
    object cliEstoqueCODIGO_BARRAS: TStringField
      FieldName = 'CODIGO_BARRAS'
    end
    object cliEstoqueNCM: TStringField
      FieldName = 'NCM'
      Size = 10
    end
    object cliEstoqueCEST: TStringField
      FieldName = 'CEST'
    end
    object cliEstoqueIBPT_F: TFMTBCDField
      FieldName = 'IBPT_F'
      Precision = 18
      Size = 2
    end
    object cliEstoqueIBPT_FI: TFMTBCDField
      FieldName = 'IBPT_FI'
      Precision = 18
      Size = 2
    end
    object cliEstoqueIBPT_EST: TFMTBCDField
      FieldName = 'IBPT_EST'
      Precision = 18
      Size = 2
    end
    object cliEstoqueIBPT_MUN: TFMTBCDField
      FieldName = 'IBPT_MUN'
      Precision = 18
      Size = 2
    end
    object cliEstoqueORIGEM: TStringField
      FieldName = 'ORIGEM'
      Size = 30
    end
    object cliEstoqueGRUPO: TLargeintField
      FieldName = 'GRUPO'
    end
    object cliEstoqueMARCA: TLargeintField
      FieldName = 'MARCA'
    end
    object cliEstoqueDESCONTO_MAXIMO: TFMTBCDField
      FieldName = 'DESCONTO_MAXIMO'
      Precision = 18
      Size = 2
    end
    object cliEstoqueMVA: TFMTBCDField
      FieldName = 'MVA'
      Precision = 18
      Size = 2
    end
    object cliEstoqueCFOP: TStringField
      FieldName = 'CFOP'
      Size = 4
    end
    object cliEstoqueCFOP_NFCE: TStringField
      FieldName = 'CFOP_NFCE'
      Size = 4
    end
    object cliEstoqueINDESCALA: TStringField
      FieldName = 'INDESCALA'
      Size = 1
    end
    object cliEstoqueCNPJFAB: TStringField
      FieldName = 'CNPJFAB'
    end
    object cliEstoqueCODPIS: TStringField
      FieldName = 'CODPIS'
    end
    object cliEstoquePORCPIS: TFMTBCDField
      FieldName = 'PORCPIS'
      Precision = 18
      Size = 2
    end
    object cliEstoqueCODCOFINS: TStringField
      FieldName = 'CODCOFINS'
    end
    object cliEstoquePISCOFINS_ENT: TStringField
      FieldName = 'PISCOFINS_ENT'
    end
    object cliEstoquePORPIS_ENT: TFMTBCDField
      FieldName = 'PORPIS_ENT'
      Precision = 18
      Size = 2
    end
    object cliEstoquePORCOFINS_ENT: TFMTBCDField
      FieldName = 'PORCOFINS_ENT'
      Precision = 18
      Size = 2
    end
    object cliEstoquePORCOFINS: TFMTBCDField
      FieldName = 'PORCOFINS'
      Precision = 18
      Size = 2
    end
    object cliEstoqueCOD_BENEFICIO: TStringField
      FieldName = 'COD_BENEFICIO'
    end
    object cliEstoqueCPRODANP: TStringField
      FieldName = 'CPRODANP'
    end
    object cliEstoqueDESCANP: TStringField
      FieldName = 'DESCANP'
      Size = 60
    end
    object cliEstoqueVPART: TFMTBCDField
      FieldName = 'VPART'
      Precision = 18
      Size = 2
    end
    object cliEstoquePGLP: TFMTBCDField
      FieldName = 'PGLP'
      Precision = 18
      Size = 2
    end
    object cliEstoquePGNN: TFMTBCDField
      FieldName = 'PGNN'
      Precision = 18
      Size = 2
    end
    object cliEstoquePGNI: TFMTBCDField
      FieldName = 'PGNI'
      Precision = 18
      Size = 2
    end
    object cliEstoqueCOD_ANVISA: TStringField
      FieldName = 'COD_ANVISA'
    end
    object cliEstoqueVALIDADE: TStringField
      FieldName = 'VALIDADE'
      Size = 10
    end
  end
  object qryEstoque: TSQLQuery
    MaxBlobSize = 1
    Params = <
      item
        DataType = ftLargeint
        Name = 'PEMITENTE'
        ParamType = ptInput
      end>
    SQL.Strings = (
      '     SELECT *'
      '       FROM ESTOQUE'
      '     WHERE REGISTRO_EMIT = :PEMITENTE'
      '          AND TIPO_ITEM = '#39'00'#39
      'ORDER BY DESCRICAO')
    SQLConnection = Conexao
    Left = 32
    Top = 88
    object qryEstoqueCODIGO_PRODUTO: TLargeintField
      FieldName = 'CODIGO_PRODUTO'
      Required = True
    end
    object qryEstoqueCODIGO: TLargeintField
      FieldName = 'CODIGO'
    end
    object qryEstoqueREGISTRO_EMIT: TLargeintField
      FieldName = 'REGISTRO_EMIT'
    end
    object qryEstoqueDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Required = True
      Size = 90
    end
    object qryEstoqueFORNECEDOR: TLargeintField
      FieldName = 'FORNECEDOR'
    end
    object qryEstoqueMEDIDA: TStringField
      FieldName = 'MEDIDA'
      Size = 10
    end
    object qryEstoquePRECO_VENDA: TFMTBCDField
      FieldName = 'PRECO_VENDA'
      Precision = 18
      Size = 2
    end
    object qryEstoqueCUSTOCOMPRA: TFMTBCDField
      FieldName = 'CUSTOCOMPRA'
      Precision = 18
      Size = 2
    end
    object qryEstoqueCUSTOMEDIO: TFMTBCDField
      FieldName = 'CUSTOMEDIO'
      Precision = 18
      Size = 2
    end
    object qryEstoqueQTD_COMPRA: TFMTBCDField
      FieldName = 'QTD_COMPRA'
      Precision = 18
      Size = 2
    end
    object qryEstoqueQTD_ATUAL: TFMTBCDField
      FieldName = 'QTD_ATUAL'
      Precision = 18
      Size = 2
    end
    object qryEstoqueQTD_MINIMA: TFMTBCDField
      FieldName = 'QTD_MINIMA'
      Precision = 18
      Size = 2
    end
    object qryEstoqueQTD_INICIO: TFMTBCDField
      FieldName = 'QTD_INICIO'
      Precision = 18
      Size = 2
    end
    object qryEstoqueDATA_INICIO: TDateField
      FieldName = 'DATA_INICIO'
    end
    object qryEstoqueULT_COMPRA: TDateField
      FieldName = 'ULT_COMPRA'
    end
    object qryEstoqueULT_VENDA: TDateField
      FieldName = 'ULT_VENDA'
    end
    object qryEstoqueLOCAL: TStringField
      FieldName = 'LOCAL'
      Size = 255
    end
    object qryEstoqueIPI: TFMTBCDField
      FieldName = 'IPI'
      Precision = 18
      Size = 2
    end
    object qryEstoqueST: TStringField
      FieldName = 'ST'
      Size = 3
    end
    object qryEstoqueCOMISSAO: TFMTBCDField
      FieldName = 'COMISSAO'
      Precision = 18
      Size = 2
    end
    object qryEstoqueMARGEM_LUCRO: TFMTBCDField
      FieldName = 'MARGEM_LUCRO'
      Precision = 18
      Size = 2
    end
    object qryEstoqueFOTO: TBlobField
      FieldName = 'FOTO'
      Size = 1
    end
    object qryEstoqueIAT: TStringField
      FieldName = 'IAT'
    end
    object qryEstoqueIPPT: TStringField
      FieldName = 'IPPT'
    end
    object qryEstoqueCST_IPI: TStringField
      FieldName = 'CST_IPI'
      Size = 2
    end
    object qryEstoqueCODSELOIPI: TStringField
      FieldName = 'CODSELOIPI'
    end
    object qryEstoqueCOD_ENQ_IPI: TStringField
      FieldName = 'COD_ENQ_IPI'
      Size = 3
    end
    object qryEstoqueTIPO_ITEM: TStringField
      FieldName = 'TIPO_ITEM'
      Size = 15
    end
    object qryEstoqueCSOSN: TStringField
      FieldName = 'CSOSN'
      Size = 3
    end
    object qryEstoqueCODIGO_BARRAS: TStringField
      FieldName = 'CODIGO_BARRAS'
    end
    object qryEstoqueNCM: TStringField
      FieldName = 'NCM'
      Size = 10
    end
    object qryEstoqueCEST: TStringField
      FieldName = 'CEST'
    end
    object qryEstoqueIBPT_F: TFMTBCDField
      FieldName = 'IBPT_F'
      Precision = 18
      Size = 2
    end
    object qryEstoqueIBPT_FI: TFMTBCDField
      FieldName = 'IBPT_FI'
      Precision = 18
      Size = 2
    end
    object qryEstoqueIBPT_EST: TFMTBCDField
      FieldName = 'IBPT_EST'
      Precision = 18
      Size = 2
    end
    object qryEstoqueIBPT_MUN: TFMTBCDField
      FieldName = 'IBPT_MUN'
      Precision = 18
      Size = 2
    end
    object qryEstoqueORIGEM: TStringField
      FieldName = 'ORIGEM'
      Size = 30
    end
    object qryEstoqueGRUPO: TLargeintField
      FieldName = 'GRUPO'
    end
    object qryEstoqueMARCA: TLargeintField
      FieldName = 'MARCA'
    end
    object qryEstoqueDESCONTO_MAXIMO: TFMTBCDField
      FieldName = 'DESCONTO_MAXIMO'
      Precision = 18
      Size = 2
    end
    object qryEstoqueMVA: TFMTBCDField
      FieldName = 'MVA'
      Precision = 18
      Size = 2
    end
    object qryEstoqueCFOP: TStringField
      FieldName = 'CFOP'
      Size = 4
    end
    object qryEstoqueCFOP_NFCE: TStringField
      FieldName = 'CFOP_NFCE'
      Size = 4
    end
    object qryEstoqueINDESCALA: TStringField
      FieldName = 'INDESCALA'
      Size = 1
    end
    object qryEstoqueCNPJFAB: TStringField
      FieldName = 'CNPJFAB'
    end
    object qryEstoqueCODPIS: TStringField
      FieldName = 'CODPIS'
    end
    object qryEstoquePORCPIS: TFMTBCDField
      FieldName = 'PORCPIS'
      Precision = 18
      Size = 2
    end
    object qryEstoqueCODCOFINS: TStringField
      FieldName = 'CODCOFINS'
    end
    object qryEstoquePISCOFINS_ENT: TStringField
      FieldName = 'PISCOFINS_ENT'
    end
    object qryEstoquePORPIS_ENT: TFMTBCDField
      FieldName = 'PORPIS_ENT'
      Precision = 18
      Size = 2
    end
    object qryEstoquePORCOFINS_ENT: TFMTBCDField
      FieldName = 'PORCOFINS_ENT'
      Precision = 18
      Size = 2
    end
    object qryEstoquePORCOFINS: TFMTBCDField
      FieldName = 'PORCOFINS'
      Precision = 18
      Size = 2
    end
    object qryEstoqueCOD_BENEFICIO: TStringField
      FieldName = 'COD_BENEFICIO'
    end
    object qryEstoqueCPRODANP: TStringField
      FieldName = 'CPRODANP'
    end
    object qryEstoqueDESCANP: TStringField
      FieldName = 'DESCANP'
      Size = 60
    end
    object qryEstoqueVPART: TFMTBCDField
      FieldName = 'VPART'
      Precision = 18
      Size = 2
    end
    object qryEstoquePGLP: TFMTBCDField
      FieldName = 'PGLP'
      Precision = 18
      Size = 2
    end
    object qryEstoquePGNN: TFMTBCDField
      FieldName = 'PGNN'
      Precision = 18
      Size = 2
    end
    object qryEstoquePGNI: TFMTBCDField
      FieldName = 'PGNI'
      Precision = 18
      Size = 2
    end
    object qryEstoqueCOD_ANVISA: TStringField
      FieldName = 'COD_ANVISA'
    end
    object qryEstoqueVALIDADE: TStringField
      FieldName = 'VALIDADE'
      Size = 10
    end
  end
  object dspEstoque: TDataSetProvider
    DataSet = qryEstoque
    Left = 32
    Top = 152
  end
  object qryVenda: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT *'
      '  FROM VENDA')
    SQLConnection = Conexao
    Left = 92
    Top = 95
    object qryVendaCODIGO: TLargeintField
      FieldName = 'CODIGO'
      ProviderFlags = [pfInKey]
      Required = True
    end
    object qryVendaCODIGO_PRODUTO: TLargeintField
      FieldName = 'CODIGO_PRODUTO'
      Required = True
    end
    object qryVendaDESCRICAO_PRODUTO: TStringField
      FieldName = 'DESCRICAO_PRODUTO'
      Required = True
      Size = 90
    end
    object qryVendaVALOR_UNITARIO: TFMTBCDField
      FieldName = 'VALOR_UNITARIO'
      Required = True
      Precision = 18
      Size = 2
    end
    object qryVendaQUANTIDADE: TFMTBCDField
      FieldName = 'QUANTIDADE'
      Required = True
      Precision = 18
      Size = 4
    end
    object qryVendaDESCONTO: TFMTBCDField
      FieldName = 'DESCONTO'
      Required = True
      Precision = 18
      Size = 2
    end
    object qryVendaDATA_HORA_VENDA: TSQLTimeStampField
      FieldName = 'DATA_HORA_VENDA'
      Required = True
    end
    object qryVendaMEDIDA: TStringField
      FieldName = 'MEDIDA'
      Size = 10
    end
    object qryVendaMD5: TStringField
      FieldName = 'MD5'
      Required = True
      Size = 32
    end
    object qryVendaREGISTRO_EMITENTE: TLargeintField
      FieldName = 'REGISTRO_EMITENTE'
      Required = True
    end
    object qryVendaCODIGO_PRODUTO_EXIBICAO: TLargeintField
      FieldName = 'CODIGO_PRODUTO_EXIBICAO'
      Required = True
    end
  end
  object dspVenda: TDataSetProvider
    DataSet = qryVenda
    UpdateMode = upWhereKeyOnly
    Left = 92
    Top = 159
  end
  object cliVenda: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspVenda'
    Left = 92
    Top = 231
    object cliVendaCODIGO: TLargeintField
      FieldName = 'CODIGO'
      ProviderFlags = [pfInKey]
    end
    object cliVendaCODIGO_PRODUTO: TLargeintField
      FieldName = 'CODIGO_PRODUTO'
    end
    object cliVendaDESCRICAO_PRODUTO: TStringField
      FieldName = 'DESCRICAO_PRODUTO'
      Size = 90
    end
    object cliVendaVALOR_UNITARIO: TFMTBCDField
      FieldName = 'VALOR_UNITARIO'
      Precision = 18
      Size = 2
    end
    object cliVendaQUANTIDADE: TFMTBCDField
      FieldName = 'QUANTIDADE'
      Precision = 18
      Size = 4
    end
    object cliVendaDESCONTO: TFMTBCDField
      FieldName = 'DESCONTO'
      Precision = 18
      Size = 2
    end
    object cliVendaDATA_HORA_VENDA: TSQLTimeStampField
      FieldName = 'DATA_HORA_VENDA'
    end
    object cliVendaMEDIDA: TStringField
      FieldName = 'MEDIDA'
      Size = 10
    end
    object cliVendaMD5: TStringField
      FieldName = 'MD5'
      Size = 32
    end
    object cliVendaREGISTRO_EMITENTE: TLargeintField
      FieldName = 'REGISTRO_EMITENTE'
      Required = True
    end
    object cliVendaCODIGO_PRODUTO_EXIBICAO: TLargeintField
      FieldName = 'CODIGO_PRODUTO_EXIBICAO'
    end
  end
  object uptVenda: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftCurrency
        Name = 'PDESCONTO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PMD5'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'UPDATE VENDA'
      '       SET DESCONTO = :PDESCONTO'
      ' WHERE MD5 = :PMD5')
    SQLConnection = Conexao
    Left = 1000
    Top = 66
  end
  object delVenda: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftLargeint
        Name = 'PCODIGO'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'DELETE '
      '  FROM VENDA'
      'WHERE CODIGO = :PCODIGO')
    SQLConnection = Conexao
    Left = 840
    Top = 407
  end
  object qryVendaConsulta: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftLargeint
        Name = 'PREGISTRO_EMITENTE'
        ParamType = ptInput
      end>
    SQL.Strings = (
      '     SELECT *'
      '       FROM VENDA'
      '     WHERE REGISTRO_EMITENTE = :PREGISTRO_EMITENTE'
      'ORDER BY CODIGO')
    SQLConnection = Conexao
    Left = 1112
    Top = 18
    object qryVendaConsultaCODIGO: TLargeintField
      FieldName = 'CODIGO'
      Required = True
    end
    object qryVendaConsultaCODIGO_PRODUTO: TLargeintField
      FieldName = 'CODIGO_PRODUTO'
      Required = True
    end
    object qryVendaConsultaDESCRICAO_PRODUTO: TStringField
      FieldName = 'DESCRICAO_PRODUTO'
      Required = True
      Size = 90
    end
    object qryVendaConsultaMEDIDA: TStringField
      FieldName = 'MEDIDA'
      Size = 10
    end
    object qryVendaConsultaVALOR_UNITARIO: TFMTBCDField
      FieldName = 'VALOR_UNITARIO'
      Required = True
      Precision = 18
      Size = 2
    end
    object qryVendaConsultaQUANTIDADE: TFMTBCDField
      FieldName = 'QUANTIDADE'
      Required = True
      Precision = 18
      Size = 4
    end
    object qryVendaConsultaDESCONTO: TFMTBCDField
      FieldName = 'DESCONTO'
      Required = True
      Precision = 18
      Size = 2
    end
    object qryVendaConsultaDATA_HORA_VENDA: TSQLTimeStampField
      FieldName = 'DATA_HORA_VENDA'
      Required = True
    end
    object qryVendaConsultaMD5: TStringField
      FieldName = 'MD5'
      Required = True
      Size = 32
    end
    object qryVendaConsultaREGISTRO_EMITENTE: TLargeintField
      FieldName = 'REGISTRO_EMITENTE'
      Required = True
    end
    object qryVendaConsultaCODIGO_PRODUTO_EXIBICAO: TLargeintField
      FieldName = 'CODIGO_PRODUTO_EXIBICAO'
      Required = True
    end
  end
  object qryNfeCab: TSQLQuery
    MaxBlobSize = 1
    Params = <>
    SQL.Strings = (
      'SELECT *'
      '  FROM NFE_CAB'
      'WHERE ID_NFE = -1')
    SQLConnection = Conexao
    Left = 240
    Top = 95
    object qryNfeCabID_NFE: TLargeintField
      FieldName = 'ID_NFE'
      Required = True
    end
    object qryNfeCabREGISTRO_EMIT: TLargeintField
      FieldName = 'REGISTRO_EMIT'
    end
    object qryNfeCabID_VENDEDOR: TLargeintField
      FieldName = 'ID_VENDEDOR'
    end
    object qryNfeCabCHAVE: TStringField
      FieldName = 'CHAVE'
      Size = 44
    end
    object qryNfeCabIDE_CUF: TLargeintField
      FieldName = 'IDE_CUF'
    end
    object qryNfeCabIDE_NATOP: TStringField
      FieldName = 'IDE_NATOP'
      Size = 60
    end
    object qryNfeCabIDE_MOD: TLargeintField
      FieldName = 'IDE_MOD'
    end
    object qryNfeCabIDE_SERIE: TLargeintField
      FieldName = 'IDE_SERIE'
    end
    object qryNfeCabIDE_NNF: TLargeintField
      FieldName = 'IDE_NNF'
    end
    object qryNfeCabIDE_DHEMI: TSQLTimeStampField
      FieldName = 'IDE_DHEMI'
    end
    object qryNfeCabIDE_DHSAIENT: TSQLTimeStampField
      FieldName = 'IDE_DHSAIENT'
    end
    object qryNfeCabIDE_TPNF: TStringField
      FieldName = 'IDE_TPNF'
      Size = 2
    end
    object qryNfeCabIDE_IDDEST: TLargeintField
      FieldName = 'IDE_IDDEST'
    end
    object qryNfeCabIDE_CMUNFG: TStringField
      FieldName = 'IDE_CMUNFG'
      Size = 7
    end
    object qryNfeCabIDE_TP_IMP: TLargeintField
      FieldName = 'IDE_TP_IMP'
    end
    object qryNfeCabIDE_TPEMIS: TStringField
      FieldName = 'IDE_TPEMIS'
      Size = 45
    end
    object qryNfeCabIDE_TPAMB: TLargeintField
      FieldName = 'IDE_TPAMB'
    end
    object qryNfeCabIDE_FINNFE: TLargeintField
      FieldName = 'IDE_FINNFE'
    end
    object qryNfeCabIDE_INDFINAL: TLargeintField
      FieldName = 'IDE_INDFINAL'
    end
    object qryNfeCabIDE_INDPRES: TLargeintField
      FieldName = 'IDE_INDPRES'
    end
    object qryNfeCabIDE_PROCEMI: TLargeintField
      FieldName = 'IDE_PROCEMI'
    end
    object qryNfeCabIDE_VERPROC: TStringField
      FieldName = 'IDE_VERPROC'
    end
    object qryNfeCabEMIT_CNPJ_CPF: TStringField
      FieldName = 'EMIT_CNPJ_CPF'
    end
    object qryNfeCabEMIT_CPF: TStringField
      FieldName = 'EMIT_CPF'
      Size = 11
    end
    object qryNfeCabEMIT_XNOME: TStringField
      FieldName = 'EMIT_XNOME'
      Size = 60
    end
    object qryNfeCabEMIT_XFANT: TStringField
      FieldName = 'EMIT_XFANT'
      Size = 60
    end
    object qryNfeCabEMIT_XLGR: TStringField
      FieldName = 'EMIT_XLGR'
      Size = 60
    end
    object qryNfeCabEMIT_NRO: TStringField
      FieldName = 'EMIT_NRO'
      Size = 60
    end
    object qryNfeCabEMIT_XCPL: TStringField
      FieldName = 'EMIT_XCPL'
      Size = 60
    end
    object qryNfeCabEMIT_XBAIRRO: TStringField
      FieldName = 'EMIT_XBAIRRO'
      Size = 60
    end
    object qryNfeCabEMIT_CMUN: TStringField
      FieldName = 'EMIT_CMUN'
      Size = 7
    end
    object qryNfeCabEMIT_XMUN: TStringField
      FieldName = 'EMIT_XMUN'
      Size = 60
    end
    object qryNfeCabEMIT_UF: TStringField
      FieldName = 'EMIT_UF'
      Size = 2
    end
    object qryNfeCabEMIT_CEP: TStringField
      FieldName = 'EMIT_CEP'
      Size = 8
    end
    object qryNfeCabEMIT_CPAIS: TLargeintField
      FieldName = 'EMIT_CPAIS'
    end
    object qryNfeCabEMIT_XPAIS: TStringField
      FieldName = 'EMIT_XPAIS'
      Size = 60
    end
    object qryNfeCabEMIT_FONE: TStringField
      FieldName = 'EMIT_FONE'
      Size = 14
    end
    object qryNfeCabEMIT_IE: TStringField
      FieldName = 'EMIT_IE'
      Size = 14
    end
    object qryNfeCabEMIT_IM: TStringField
      FieldName = 'EMIT_IM'
      Size = 15
    end
    object qryNfeCabEMIT_CNAE: TStringField
      FieldName = 'EMIT_CNAE'
      Size = 7
    end
    object qryNfeCabEMIT_CRT: TStringField
      FieldName = 'EMIT_CRT'
      Size = 45
    end
    object qryNfeCabID_CLIENTE: TLargeintField
      FieldName = 'ID_CLIENTE'
    end
    object qryNfeCabDEST_CNPJ_CPF: TStringField
      FieldName = 'DEST_CNPJ_CPF'
    end
    object qryNfeCabDEST_IDESTRANGEIRO: TStringField
      FieldName = 'DEST_IDESTRANGEIRO'
    end
    object qryNfeCabDEST_XNOME: TStringField
      FieldName = 'DEST_XNOME'
      Size = 60
    end
    object qryNfeCabDEST_XLGR: TStringField
      FieldName = 'DEST_XLGR'
      Size = 60
    end
    object qryNfeCabDEST_NRO: TStringField
      FieldName = 'DEST_NRO'
      Size = 60
    end
    object qryNfeCabDEST_XCPL: TStringField
      FieldName = 'DEST_XCPL'
      Size = 60
    end
    object qryNfeCabDEST_XBAIRRO: TStringField
      FieldName = 'DEST_XBAIRRO'
      Size = 60
    end
    object qryNfeCabDEST_CMUN: TStringField
      FieldName = 'DEST_CMUN'
      Size = 7
    end
    object qryNfeCabDEST_XMUN: TStringField
      FieldName = 'DEST_XMUN'
      Size = 60
    end
    object qryNfeCabDEST_UF: TStringField
      FieldName = 'DEST_UF'
      Size = 2
    end
    object qryNfeCabDEST_CEP: TStringField
      FieldName = 'DEST_CEP'
      Size = 8
    end
    object qryNfeCabDEST_CPAIS: TLargeintField
      FieldName = 'DEST_CPAIS'
    end
    object qryNfeCabDEST_XPAIS: TStringField
      FieldName = 'DEST_XPAIS'
      Size = 60
    end
    object qryNfeCabDEST_FONE: TStringField
      FieldName = 'DEST_FONE'
      Size = 14
    end
    object qryNfeCabDEST_INDIEDEST: TLargeintField
      FieldName = 'DEST_INDIEDEST'
    end
    object qryNfeCabDEST_IE: TStringField
      FieldName = 'DEST_IE'
      Size = 14
    end
    object qryNfeCabDEST_EMAIL: TStringField
      FieldName = 'DEST_EMAIL'
      Size = 60
    end
    object qryNfeCabVBC: TFMTBCDField
      FieldName = 'VBC'
      Precision = 18
      Size = 2
    end
    object qryNfeCabVICMS: TFMTBCDField
      FieldName = 'VICMS'
      Precision = 18
      Size = 2
    end
    object qryNfeCabVICMSDESON: TFMTBCDField
      FieldName = 'VICMSDESON'
      Precision = 18
      Size = 2
    end
    object qryNfeCabVBCST: TFMTBCDField
      FieldName = 'VBCST'
      Precision = 18
      Size = 2
    end
    object qryNfeCabVST: TFMTBCDField
      FieldName = 'VST'
      Precision = 18
      Size = 2
    end
    object qryNfeCabVPROD: TFMTBCDField
      FieldName = 'VPROD'
      Precision = 18
      Size = 2
    end
    object qryNfeCabVFRETE: TFMTBCDField
      FieldName = 'VFRETE'
      Precision = 18
      Size = 2
    end
    object qryNfeCabVSEG: TFMTBCDField
      FieldName = 'VSEG'
      Precision = 18
      Size = 2
    end
    object qryNfeCabVDESC: TFMTBCDField
      FieldName = 'VDESC'
      Precision = 18
      Size = 2
    end
    object qryNfeCabVII: TFMTBCDField
      FieldName = 'VII'
      Precision = 18
      Size = 2
    end
    object qryNfeCabVIPI: TFMTBCDField
      FieldName = 'VIPI'
      Precision = 18
      Size = 2
    end
    object qryNfeCabVPIS: TFMTBCDField
      FieldName = 'VPIS'
      Precision = 18
      Size = 2
    end
    object qryNfeCabVCOFINS: TFMTBCDField
      FieldName = 'VCOFINS'
      Precision = 18
      Size = 2
    end
    object qryNfeCabVOUTRO: TFMTBCDField
      FieldName = 'VOUTRO'
      Precision = 18
      Size = 2
    end
    object qryNfeCabVNF: TFMTBCDField
      FieldName = 'VNF'
      Precision = 18
      Size = 2
    end
    object qryNfeCabVTOTTRIB: TFMTBCDField
      FieldName = 'VTOTTRIB'
      Precision = 18
      Size = 2
    end
    object qryNfeCabMODFRETE: TLargeintField
      FieldName = 'MODFRETE'
    end
    object qryNfeCabID_TRANSP: TLargeintField
      FieldName = 'ID_TRANSP'
    end
    object qryNfeCabTRANSP_CNPJ_CPF: TStringField
      FieldName = 'TRANSP_CNPJ_CPF'
      Size = 14
    end
    object qryNfeCabTRANSP_XNOME: TStringField
      FieldName = 'TRANSP_XNOME'
      Size = 60
    end
    object qryNfeCabTRANSP_IE: TStringField
      FieldName = 'TRANSP_IE'
      Size = 14
    end
    object qryNfeCabTRANSP_XENDER: TStringField
      FieldName = 'TRANSP_XENDER'
      Size = 60
    end
    object qryNfeCabTRANSP_XMUN: TStringField
      FieldName = 'TRANSP_XMUN'
      Size = 60
    end
    object qryNfeCabTRANSP_UF: TStringField
      FieldName = 'TRANSP_UF'
      Size = 2
    end
    object qryNfeCabVEIC_PLACA: TStringField
      FieldName = 'VEIC_PLACA'
      Size = 10
    end
    object qryNfeCabVEIC_UF: TStringField
      FieldName = 'VEIC_UF'
      Size = 2
    end
    object qryNfeCabVEIC_RNTC: TStringField
      FieldName = 'VEIC_RNTC'
    end
    object qryNfeCabVOL_QVOL: TLargeintField
      FieldName = 'VOL_QVOL'
    end
    object qryNfeCabVOL_ESP: TStringField
      FieldName = 'VOL_ESP'
      Size = 60
    end
    object qryNfeCabVOL_MARCA: TStringField
      FieldName = 'VOL_MARCA'
      Size = 60
    end
    object qryNfeCabVOL_NVOL: TStringField
      FieldName = 'VOL_NVOL'
      Size = 60
    end
    object qryNfeCabVOL_PESOL: TFMTBCDField
      FieldName = 'VOL_PESOL'
      Precision = 18
      Size = 3
    end
    object qryNfeCabVOL_PESOB: TFMTBCDField
      FieldName = 'VOL_PESOB'
      Precision = 18
      Size = 3
    end
    object qryNfeCabINFADFISCO: TStringField
      FieldName = 'INFADFISCO'
      Size = 500
    end
    object qryNfeCabINFCPL: TStringField
      FieldName = 'INFCPL'
      Size = 500
    end
    object qryNfeCabREFNFE: TStringField
      FieldName = 'REFNFE'
      Size = 44
    end
    object qryNfeCabEXPORTA_UFEMARQ: TStringField
      FieldName = 'EXPORTA_UFEMARQ'
      Size = 2
    end
    object qryNfeCabEXPORTA_XLOCEMARQ: TStringField
      FieldName = 'EXPORTA_XLOCEMARQ'
      Size = 60
    end
    object qryNfeCabCD_STATUS: TLargeintField
      FieldName = 'CD_STATUS'
    end
    object qryNfeCabPROTOCOLO_AUTORIZACAO: TStringField
      FieldName = 'PROTOCOLO_AUTORIZACAO'
      Size = 30
    end
    object qryNfeCabDT_AUTORIZACAO: TSQLTimeStampField
      FieldName = 'DT_AUTORIZACAO'
    end
    object qryNfeCabMOTIVO_CANCELAMENTO: TStringField
      FieldName = 'MOTIVO_CANCELAMENTO'
      Size = 100
    end
    object qryNfeCabPROTOCOLO_CANCELAMENTO: TStringField
      FieldName = 'PROTOCOLO_CANCELAMENTO'
      Size = 30
    end
    object qryNfeCabDT_CANCELAMENTO: TSQLTimeStampField
      FieldName = 'DT_CANCELAMENTO'
    end
    object qryNfeCabXML_CANCELADO: TStringField
      FieldName = 'XML_CANCELADO'
      Size = 8000
    end
    object qryNfeCabXML_APROVADO: TBlobField
      FieldName = 'XML_APROVADO'
      Size = 1
    end
  end
  object qryNfeItens: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT *'
      '  FROM NFE_ITENS'
      'WHERE ID_NFE = -1')
    SQLConnection = Conexao
    Left = 304
    Top = 95
    object qryNfeItensIDNFE_ITENS: TLargeintField
      FieldName = 'IDNFE_ITENS'
      Required = True
    end
    object qryNfeItensREGISTRO_EMIT: TLargeintField
      FieldName = 'REGISTRO_EMIT'
      Required = True
    end
    object qryNfeItensID_NFE: TLargeintField
      FieldName = 'ID_NFE'
      Required = True
    end
    object qryNfeItensCPROD: TLargeintField
      FieldName = 'CPROD'
    end
    object qryNfeItensCEAN: TStringField
      FieldName = 'CEAN'
      Size = 14
    end
    object qryNfeItensXPROD: TStringField
      FieldName = 'XPROD'
      Size = 120
    end
    object qryNfeItensNCM: TStringField
      FieldName = 'NCM'
      Size = 8
    end
    object qryNfeItensCEST: TStringField
      FieldName = 'CEST'
      Size = 10
    end
    object qryNfeItensINDESCALA: TStringField
      FieldName = 'INDESCALA'
      Size = 10
    end
    object qryNfeItensCNPJFAB: TStringField
      FieldName = 'CNPJFAB'
    end
    object qryNfeItensNVE: TStringField
      FieldName = 'NVE'
      Size = 6
    end
    object qryNfeItensEXTIPI: TStringField
      FieldName = 'EXTIPI'
      Size = 3
    end
    object qryNfeItensCFOP: TLargeintField
      FieldName = 'CFOP'
    end
    object qryNfeItensUCOM: TStringField
      FieldName = 'UCOM'
      Size = 6
    end
    object qryNfeItensQCOM: TFMTBCDField
      FieldName = 'QCOM'
      Precision = 18
      Size = 4
    end
    object qryNfeItensVUNCOM: TFMTBCDField
      FieldName = 'VUNCOM'
      Precision = 18
      Size = 10
    end
    object qryNfeItensVUNCOMI: TFMTBCDField
      FieldName = 'VUNCOMI'
      Precision = 18
      Size = 2
    end
    object qryNfeItensVPROD: TFMTBCDField
      FieldName = 'VPROD'
      Required = True
      Precision = 18
      Size = 2
    end
    object qryNfeItensVPRODI: TFMTBCDField
      FieldName = 'VPRODI'
      Precision = 18
      Size = 2
    end
    object qryNfeItensCEANTRIB: TStringField
      FieldName = 'CEANTRIB'
      Size = 14
    end
    object qryNfeItensUTRIB: TStringField
      FieldName = 'UTRIB'
      Size = 6
    end
    object qryNfeItensQTRIB: TFMTBCDField
      FieldName = 'QTRIB'
      Precision = 18
      Size = 4
    end
    object qryNfeItensVUNTRIB: TFMTBCDField
      FieldName = 'VUNTRIB'
      Precision = 18
      Size = 4
    end
    object qryNfeItensVFRETE: TFMTBCDField
      FieldName = 'VFRETE'
      Precision = 18
      Size = 2
    end
    object qryNfeItensVSEG: TFMTBCDField
      FieldName = 'VSEG'
      Precision = 18
      Size = 2
    end
    object qryNfeItensVDESC: TFMTBCDField
      FieldName = 'VDESC'
      Required = True
      Precision = 18
      Size = 2
    end
    object qryNfeItensVOUTRO: TFMTBCDField
      FieldName = 'VOUTRO'
      Precision = 18
      Size = 2
    end
    object qryNfeItensINDTOT: TLargeintField
      FieldName = 'INDTOT'
    end
    object qryNfeItensXPED: TStringField
      FieldName = 'XPED'
      Size = 15
    end
    object qryNfeItensNITEMPED: TLargeintField
      FieldName = 'NITEMPED'
    end
    object qryNfeItensORIG: TLargeintField
      FieldName = 'ORIG'
    end
    object qryNfeItensCST_ICMS: TStringField
      FieldName = 'CST_ICMS'
      Size = 3
    end
    object qryNfeItensMODBC_ICMS: TLargeintField
      FieldName = 'MODBC_ICMS'
    end
    object qryNfeItensVBC: TFMTBCDField
      FieldName = 'VBC'
      Precision = 18
      Size = 2
    end
    object qryNfeItensPICMS: TFMTBCDField
      FieldName = 'PICMS'
      Precision = 9
      Size = 2
    end
    object qryNfeItensVICMS: TFMTBCDField
      FieldName = 'VICMS'
      Precision = 18
      Size = 2
    end
    object qryNfeItensPREDBC: TFMTBCDField
      FieldName = 'PREDBC'
      Precision = 9
      Size = 2
    end
    object qryNfeItensVICMSDESON: TFMTBCDField
      FieldName = 'VICMSDESON'
      Precision = 18
      Size = 2
    end
    object qryNfeItensMOTDESICMS: TLargeintField
      FieldName = 'MOTDESICMS'
    end
    object qryNfeItensMODBCST: TLargeintField
      FieldName = 'MODBCST'
    end
    object qryNfeItensPMVAST: TFMTBCDField
      FieldName = 'PMVAST'
      Precision = 18
      Size = 2
    end
    object qryNfeItensVBCST: TFMTBCDField
      FieldName = 'VBCST'
      Precision = 18
      Size = 2
    end
    object qryNfeItensPREDBCST: TFMTBCDField
      FieldName = 'PREDBCST'
      Precision = 18
      Size = 2
    end
    object qryNfeItensPICMSST: TFMTBCDField
      FieldName = 'PICMSST'
      Precision = 18
      Size = 2
    end
    object qryNfeItensVICMSST: TFMTBCDField
      FieldName = 'VICMSST'
      Precision = 18
      Size = 2
    end
    object qryNfeItensPCREDSN: TFMTBCDField
      FieldName = 'PCREDSN'
      Precision = 18
      Size = 2
    end
    object qryNfeItensVCREDICMSSN: TFMTBCDField
      FieldName = 'VCREDICMSSN'
      Precision = 18
      Size = 2
    end
    object qryNfeItensVBCSTRET: TFMTBCDField
      FieldName = 'VBCSTRET'
      Precision = 18
      Size = 2
    end
    object qryNfeItensVICMSSTRET: TFMTBCDField
      FieldName = 'VICMSSTRET'
      Precision = 18
      Size = 2
    end
    object qryNfeItensCST_IPI: TStringField
      FieldName = 'CST_IPI'
      Size = 2
    end
    object qryNfeItensENQ_IPI: TStringField
      FieldName = 'ENQ_IPI'
      Size = 3
    end
    object qryNfeItensVBCIPI: TFMTBCDField
      FieldName = 'VBCIPI'
      Precision = 18
      Size = 2
    end
    object qryNfeItensPIPI: TFMTBCDField
      FieldName = 'PIPI'
      Precision = 9
      Size = 2
    end
    object qryNfeItensVIPI: TFMTBCDField
      FieldName = 'VIPI'
      Precision = 18
      Size = 2
    end
    object qryNfeItensCST_PIS: TStringField
      FieldName = 'CST_PIS'
      Size = 2
    end
    object qryNfeItensVBCPIS: TFMTBCDField
      FieldName = 'VBCPIS'
      Precision = 18
      Size = 2
    end
    object qryNfeItensPPIS: TFMTBCDField
      FieldName = 'PPIS'
      Precision = 9
      Size = 2
    end
    object qryNfeItensVPIS: TFMTBCDField
      FieldName = 'VPIS'
      Precision = 18
      Size = 2
    end
    object qryNfeItensCST_COFINS: TStringField
      FieldName = 'CST_COFINS'
      Size = 2
    end
    object qryNfeItensVBCCOFINS: TFMTBCDField
      FieldName = 'VBCCOFINS'
      Precision = 18
      Size = 2
    end
    object qryNfeItensPCOFINS: TFMTBCDField
      FieldName = 'PCOFINS'
      Precision = 9
      Size = 2
    end
    object qryNfeItensVCOFINS: TFMTBCDField
      FieldName = 'VCOFINS'
      Precision = 18
      Size = 2
    end
    object qryNfeItensVTOTTRIB: TFMTBCDField
      FieldName = 'VTOTTRIB'
      Precision = 18
      Size = 2
    end
    object qryNfeItensPST: TFMTBCDField
      FieldName = 'PST'
      Precision = 18
      Size = 2
    end
    object qryNfeItensVICMSSUBSTITUTO: TFMTBCDField
      FieldName = 'VICMSSUBSTITUTO'
      Precision = 18
      Size = 2
    end
    object qryNfeItensCPRODANP: TStringField
      FieldName = 'CPRODANP'
    end
    object qryNfeItensDESCANP: TStringField
      FieldName = 'DESCANP'
      Size = 60
    end
    object qryNfeItensVPART: TFMTBCDField
      FieldName = 'VPART'
      Precision = 18
      Size = 2
    end
    object qryNfeItensPGLP: TFMTBCDField
      FieldName = 'PGLP'
      Precision = 18
      Size = 2
    end
    object qryNfeItensPGNN: TFMTBCDField
      FieldName = 'PGNN'
      Precision = 18
      Size = 2
    end
    object qryNfeItensPGNI: TFMTBCDField
      FieldName = 'PGNI'
      Precision = 18
      Size = 2
    end
  end
  object qryNfePagamento: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT *'
      '  FROM NFE_PAGAMENTO'
      'WHERE ID_NFE = -1')
    SQLConnection = Conexao
    Left = 384
    Top = 103
    object qryNfePagamentoID_NFE_PAG: TLargeintField
      FieldName = 'ID_NFE_PAG'
      Required = True
    end
    object qryNfePagamentoID_NFE: TLargeintField
      FieldName = 'ID_NFE'
    end
    object qryNfePagamentoREGISTRO_EMIT: TLargeintField
      FieldName = 'REGISTRO_EMIT'
    end
    object qryNfePagamentoTPAG: TStringField
      FieldName = 'TPAG'
      Size = 11
    end
    object qryNfePagamentoVPAG: TFMTBCDField
      FieldName = 'VPAG'
      Precision = 18
      Size = 2
    end
    object qryNfePagamentoVTROCO: TFMTBCDField
      FieldName = 'VTROCO'
      Precision = 18
      Size = 2
    end
    object qryNfePagamentoINDPAG: TLargeintField
      FieldName = 'INDPAG'
    end
    object qryNfePagamentoCNPJ_ADM: TStringField
      FieldName = 'CNPJ_ADM'
    end
    object qryNfePagamentoTBAND: TStringField
      FieldName = 'TBAND'
      Size = 2
    end
    object qryNfePagamentoCAUT: TStringField
      FieldName = 'CAUT'
    end
    object qryNfePagamentoCAIXA_N: TLargeintField
      FieldName = 'CAIXA_N'
    end
  end
  object dspNfeCab: TDataSetProvider
    DataSet = qryNfeCab
    Left = 232
    Top = 151
  end
  object dspNfeItens: TDataSetProvider
    DataSet = qryNfeItens
    Left = 304
    Top = 159
  end
  object dspNfePagamento: TDataSetProvider
    DataSet = qryNfePagamento
    Left = 384
    Top = 167
  end
  object cliNfeCab: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspNfeCab'
    Left = 232
    Top = 231
    object cliNfeCabID_NFE: TLargeintField
      FieldName = 'ID_NFE'
      Required = True
    end
    object cliNfeCabREGISTRO_EMIT: TLargeintField
      FieldName = 'REGISTRO_EMIT'
    end
    object cliNfeCabID_VENDEDOR: TLargeintField
      FieldName = 'ID_VENDEDOR'
    end
    object cliNfeCabCHAVE: TStringField
      FieldName = 'CHAVE'
      Size = 44
    end
    object cliNfeCabIDE_CUF: TLargeintField
      FieldName = 'IDE_CUF'
    end
    object cliNfeCabIDE_NATOP: TStringField
      FieldName = 'IDE_NATOP'
      Size = 60
    end
    object cliNfeCabIDE_MOD: TLargeintField
      FieldName = 'IDE_MOD'
    end
    object cliNfeCabIDE_SERIE: TLargeintField
      FieldName = 'IDE_SERIE'
    end
    object cliNfeCabIDE_NNF: TLargeintField
      FieldName = 'IDE_NNF'
    end
    object cliNfeCabIDE_DHEMI: TSQLTimeStampField
      FieldName = 'IDE_DHEMI'
    end
    object cliNfeCabIDE_DHSAIENT: TSQLTimeStampField
      FieldName = 'IDE_DHSAIENT'
    end
    object cliNfeCabIDE_TPNF: TStringField
      FieldName = 'IDE_TPNF'
      Size = 2
    end
    object cliNfeCabIDE_IDDEST: TLargeintField
      FieldName = 'IDE_IDDEST'
    end
    object cliNfeCabIDE_CMUNFG: TStringField
      FieldName = 'IDE_CMUNFG'
      Size = 7
    end
    object cliNfeCabIDE_TP_IMP: TLargeintField
      FieldName = 'IDE_TP_IMP'
    end
    object cliNfeCabIDE_TPEMIS: TStringField
      FieldName = 'IDE_TPEMIS'
      Size = 45
    end
    object cliNfeCabIDE_TPAMB: TLargeintField
      FieldName = 'IDE_TPAMB'
    end
    object cliNfeCabIDE_FINNFE: TLargeintField
      FieldName = 'IDE_FINNFE'
    end
    object cliNfeCabIDE_INDFINAL: TLargeintField
      FieldName = 'IDE_INDFINAL'
    end
    object cliNfeCabIDE_INDPRES: TLargeintField
      FieldName = 'IDE_INDPRES'
    end
    object cliNfeCabIDE_PROCEMI: TLargeintField
      FieldName = 'IDE_PROCEMI'
    end
    object cliNfeCabIDE_VERPROC: TStringField
      FieldName = 'IDE_VERPROC'
    end
    object cliNfeCabEMIT_CNPJ_CPF: TStringField
      FieldName = 'EMIT_CNPJ_CPF'
    end
    object cliNfeCabEMIT_CPF: TStringField
      FieldName = 'EMIT_CPF'
      Size = 11
    end
    object cliNfeCabEMIT_XNOME: TStringField
      FieldName = 'EMIT_XNOME'
      Size = 60
    end
    object cliNfeCabEMIT_XFANT: TStringField
      FieldName = 'EMIT_XFANT'
      Size = 60
    end
    object cliNfeCabEMIT_XLGR: TStringField
      FieldName = 'EMIT_XLGR'
      Size = 60
    end
    object cliNfeCabEMIT_NRO: TStringField
      FieldName = 'EMIT_NRO'
      Size = 60
    end
    object cliNfeCabEMIT_XCPL: TStringField
      FieldName = 'EMIT_XCPL'
      Size = 60
    end
    object cliNfeCabEMIT_XBAIRRO: TStringField
      FieldName = 'EMIT_XBAIRRO'
      Size = 60
    end
    object cliNfeCabEMIT_CMUN: TStringField
      FieldName = 'EMIT_CMUN'
      Size = 7
    end
    object cliNfeCabEMIT_XMUN: TStringField
      FieldName = 'EMIT_XMUN'
      Size = 60
    end
    object cliNfeCabEMIT_UF: TStringField
      FieldName = 'EMIT_UF'
      Size = 2
    end
    object cliNfeCabEMIT_CEP: TStringField
      FieldName = 'EMIT_CEP'
      Size = 8
    end
    object cliNfeCabEMIT_CPAIS: TLargeintField
      FieldName = 'EMIT_CPAIS'
    end
    object cliNfeCabEMIT_XPAIS: TStringField
      FieldName = 'EMIT_XPAIS'
      Size = 60
    end
    object cliNfeCabEMIT_FONE: TStringField
      FieldName = 'EMIT_FONE'
      Size = 14
    end
    object cliNfeCabEMIT_IE: TStringField
      FieldName = 'EMIT_IE'
      Size = 14
    end
    object cliNfeCabEMIT_IM: TStringField
      FieldName = 'EMIT_IM'
      Size = 15
    end
    object cliNfeCabEMIT_CNAE: TStringField
      FieldName = 'EMIT_CNAE'
      Size = 7
    end
    object cliNfeCabEMIT_CRT: TStringField
      FieldName = 'EMIT_CRT'
      Size = 45
    end
    object cliNfeCabID_CLIENTE: TLargeintField
      FieldName = 'ID_CLIENTE'
    end
    object cliNfeCabDEST_CNPJ_CPF: TStringField
      FieldName = 'DEST_CNPJ_CPF'
    end
    object cliNfeCabDEST_IDESTRANGEIRO: TStringField
      FieldName = 'DEST_IDESTRANGEIRO'
    end
    object cliNfeCabDEST_XNOME: TStringField
      FieldName = 'DEST_XNOME'
      Size = 60
    end
    object cliNfeCabDEST_XLGR: TStringField
      FieldName = 'DEST_XLGR'
      Size = 60
    end
    object cliNfeCabDEST_NRO: TStringField
      FieldName = 'DEST_NRO'
      Size = 60
    end
    object cliNfeCabDEST_XCPL: TStringField
      FieldName = 'DEST_XCPL'
      Size = 60
    end
    object cliNfeCabDEST_XBAIRRO: TStringField
      FieldName = 'DEST_XBAIRRO'
      Size = 60
    end
    object cliNfeCabDEST_CMUN: TStringField
      FieldName = 'DEST_CMUN'
      Size = 7
    end
    object cliNfeCabDEST_XMUN: TStringField
      FieldName = 'DEST_XMUN'
      Size = 60
    end
    object cliNfeCabDEST_UF: TStringField
      FieldName = 'DEST_UF'
      Size = 2
    end
    object cliNfeCabDEST_CEP: TStringField
      FieldName = 'DEST_CEP'
      Size = 8
    end
    object cliNfeCabDEST_CPAIS: TLargeintField
      FieldName = 'DEST_CPAIS'
    end
    object cliNfeCabDEST_XPAIS: TStringField
      FieldName = 'DEST_XPAIS'
      Size = 60
    end
    object cliNfeCabDEST_FONE: TStringField
      FieldName = 'DEST_FONE'
      Size = 14
    end
    object cliNfeCabDEST_INDIEDEST: TLargeintField
      FieldName = 'DEST_INDIEDEST'
    end
    object cliNfeCabDEST_IE: TStringField
      FieldName = 'DEST_IE'
      Size = 14
    end
    object cliNfeCabDEST_EMAIL: TStringField
      FieldName = 'DEST_EMAIL'
      Size = 60
    end
    object cliNfeCabVBC: TFMTBCDField
      FieldName = 'VBC'
      Precision = 18
      Size = 2
    end
    object cliNfeCabVICMS: TFMTBCDField
      FieldName = 'VICMS'
      Precision = 18
      Size = 2
    end
    object cliNfeCabVICMSDESON: TFMTBCDField
      FieldName = 'VICMSDESON'
      Precision = 18
      Size = 2
    end
    object cliNfeCabVBCST: TFMTBCDField
      FieldName = 'VBCST'
      Precision = 18
      Size = 2
    end
    object cliNfeCabVST: TFMTBCDField
      FieldName = 'VST'
      Precision = 18
      Size = 2
    end
    object cliNfeCabVPROD: TFMTBCDField
      FieldName = 'VPROD'
      Precision = 18
      Size = 2
    end
    object cliNfeCabVFRETE: TFMTBCDField
      FieldName = 'VFRETE'
      Precision = 18
      Size = 2
    end
    object cliNfeCabVSEG: TFMTBCDField
      FieldName = 'VSEG'
      Precision = 18
      Size = 2
    end
    object cliNfeCabVDESC: TFMTBCDField
      FieldName = 'VDESC'
      Precision = 18
      Size = 2
    end
    object cliNfeCabVII: TFMTBCDField
      FieldName = 'VII'
      Precision = 18
      Size = 2
    end
    object cliNfeCabVIPI: TFMTBCDField
      FieldName = 'VIPI'
      Precision = 18
      Size = 2
    end
    object cliNfeCabVPIS: TFMTBCDField
      FieldName = 'VPIS'
      Precision = 18
      Size = 2
    end
    object cliNfeCabVCOFINS: TFMTBCDField
      FieldName = 'VCOFINS'
      Precision = 18
      Size = 2
    end
    object cliNfeCabVOUTRO: TFMTBCDField
      FieldName = 'VOUTRO'
      Precision = 18
      Size = 2
    end
    object cliNfeCabVNF: TFMTBCDField
      FieldName = 'VNF'
      Precision = 18
      Size = 2
    end
    object cliNfeCabVTOTTRIB: TFMTBCDField
      FieldName = 'VTOTTRIB'
      Precision = 18
      Size = 2
    end
    object cliNfeCabMODFRETE: TLargeintField
      FieldName = 'MODFRETE'
    end
    object cliNfeCabID_TRANSP: TLargeintField
      FieldName = 'ID_TRANSP'
    end
    object cliNfeCabTRANSP_CNPJ_CPF: TStringField
      FieldName = 'TRANSP_CNPJ_CPF'
      Size = 14
    end
    object cliNfeCabTRANSP_XNOME: TStringField
      FieldName = 'TRANSP_XNOME'
      Size = 60
    end
    object cliNfeCabTRANSP_IE: TStringField
      FieldName = 'TRANSP_IE'
      Size = 14
    end
    object cliNfeCabTRANSP_XENDER: TStringField
      FieldName = 'TRANSP_XENDER'
      Size = 60
    end
    object cliNfeCabTRANSP_XMUN: TStringField
      FieldName = 'TRANSP_XMUN'
      Size = 60
    end
    object cliNfeCabTRANSP_UF: TStringField
      FieldName = 'TRANSP_UF'
      Size = 2
    end
    object cliNfeCabVEIC_PLACA: TStringField
      FieldName = 'VEIC_PLACA'
      Size = 10
    end
    object cliNfeCabVEIC_UF: TStringField
      FieldName = 'VEIC_UF'
      Size = 2
    end
    object cliNfeCabVEIC_RNTC: TStringField
      FieldName = 'VEIC_RNTC'
    end
    object cliNfeCabVOL_QVOL: TLargeintField
      FieldName = 'VOL_QVOL'
    end
    object cliNfeCabVOL_ESP: TStringField
      FieldName = 'VOL_ESP'
      Size = 60
    end
    object cliNfeCabVOL_MARCA: TStringField
      FieldName = 'VOL_MARCA'
      Size = 60
    end
    object cliNfeCabVOL_NVOL: TStringField
      FieldName = 'VOL_NVOL'
      Size = 60
    end
    object cliNfeCabVOL_PESOL: TFMTBCDField
      FieldName = 'VOL_PESOL'
      Precision = 18
      Size = 3
    end
    object cliNfeCabVOL_PESOB: TFMTBCDField
      FieldName = 'VOL_PESOB'
      Precision = 18
      Size = 3
    end
    object cliNfeCabINFADFISCO: TStringField
      FieldName = 'INFADFISCO'
      Size = 500
    end
    object cliNfeCabINFCPL: TStringField
      FieldName = 'INFCPL'
      Size = 500
    end
    object cliNfeCabREFNFE: TStringField
      FieldName = 'REFNFE'
      Size = 44
    end
    object cliNfeCabEXPORTA_UFEMARQ: TStringField
      FieldName = 'EXPORTA_UFEMARQ'
      Size = 2
    end
    object cliNfeCabEXPORTA_XLOCEMARQ: TStringField
      FieldName = 'EXPORTA_XLOCEMARQ'
      Size = 60
    end
    object cliNfeCabCD_STATUS: TLargeintField
      FieldName = 'CD_STATUS'
    end
    object cliNfeCabPROTOCOLO_AUTORIZACAO: TStringField
      FieldName = 'PROTOCOLO_AUTORIZACAO'
      Size = 30
    end
    object cliNfeCabDT_AUTORIZACAO: TSQLTimeStampField
      FieldName = 'DT_AUTORIZACAO'
    end
    object cliNfeCabMOTIVO_CANCELAMENTO: TStringField
      FieldName = 'MOTIVO_CANCELAMENTO'
      Size = 100
    end
    object cliNfeCabPROTOCOLO_CANCELAMENTO: TStringField
      FieldName = 'PROTOCOLO_CANCELAMENTO'
      Size = 30
    end
    object cliNfeCabDT_CANCELAMENTO: TSQLTimeStampField
      FieldName = 'DT_CANCELAMENTO'
    end
    object cliNfeCabXML_CANCELADO: TStringField
      FieldName = 'XML_CANCELADO'
      Size = 8000
    end
    object cliNfeCabXML_APROVADO: TBlobField
      FieldName = 'XML_APROVADO'
      Size = 1
    end
  end
  object cliNfeItens: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspNfeItens'
    Left = 304
    Top = 231
    object cliNfeItensIDNFE_ITENS: TLargeintField
      FieldName = 'IDNFE_ITENS'
      Required = True
    end
    object cliNfeItensREGISTRO_EMIT: TLargeintField
      FieldName = 'REGISTRO_EMIT'
      Required = True
    end
    object cliNfeItensID_NFE: TLargeintField
      FieldName = 'ID_NFE'
      Required = True
    end
    object cliNfeItensCPROD: TLargeintField
      FieldName = 'CPROD'
    end
    object cliNfeItensCEAN: TStringField
      FieldName = 'CEAN'
      Size = 14
    end
    object cliNfeItensXPROD: TStringField
      FieldName = 'XPROD'
      Size = 120
    end
    object cliNfeItensNCM: TStringField
      FieldName = 'NCM'
      Size = 8
    end
    object cliNfeItensCEST: TStringField
      FieldName = 'CEST'
      Size = 10
    end
    object cliNfeItensINDESCALA: TStringField
      FieldName = 'INDESCALA'
      Size = 10
    end
    object cliNfeItensCNPJFAB: TStringField
      FieldName = 'CNPJFAB'
    end
    object cliNfeItensNVE: TStringField
      FieldName = 'NVE'
      Size = 6
    end
    object cliNfeItensEXTIPI: TStringField
      FieldName = 'EXTIPI'
      Size = 3
    end
    object cliNfeItensCFOP: TLargeintField
      FieldName = 'CFOP'
    end
    object cliNfeItensUCOM: TStringField
      FieldName = 'UCOM'
      Size = 6
    end
    object cliNfeItensQCOM: TFMTBCDField
      FieldName = 'QCOM'
      Precision = 18
      Size = 4
    end
    object cliNfeItensVUNCOM: TFMTBCDField
      FieldName = 'VUNCOM'
      Precision = 18
      Size = 10
    end
    object cliNfeItensVUNCOMI: TFMTBCDField
      FieldName = 'VUNCOMI'
      Precision = 18
      Size = 2
    end
    object cliNfeItensVPROD: TFMTBCDField
      FieldName = 'VPROD'
      Required = True
      Precision = 18
      Size = 2
    end
    object cliNfeItensVPRODI: TFMTBCDField
      FieldName = 'VPRODI'
      Precision = 18
      Size = 2
    end
    object cliNfeItensCEANTRIB: TStringField
      FieldName = 'CEANTRIB'
      Size = 14
    end
    object cliNfeItensUTRIB: TStringField
      FieldName = 'UTRIB'
      Size = 6
    end
    object cliNfeItensQTRIB: TFMTBCDField
      FieldName = 'QTRIB'
      Precision = 18
      Size = 4
    end
    object cliNfeItensVUNTRIB: TFMTBCDField
      FieldName = 'VUNTRIB'
      Precision = 18
      Size = 4
    end
    object cliNfeItensVFRETE: TFMTBCDField
      FieldName = 'VFRETE'
      Precision = 18
      Size = 2
    end
    object cliNfeItensVSEG: TFMTBCDField
      FieldName = 'VSEG'
      Precision = 18
      Size = 2
    end
    object cliNfeItensVDESC: TFMTBCDField
      FieldName = 'VDESC'
      Required = True
      Precision = 18
      Size = 2
    end
    object cliNfeItensVOUTRO: TFMTBCDField
      FieldName = 'VOUTRO'
      Precision = 18
      Size = 2
    end
    object cliNfeItensINDTOT: TLargeintField
      FieldName = 'INDTOT'
    end
    object cliNfeItensXPED: TStringField
      FieldName = 'XPED'
      Size = 15
    end
    object cliNfeItensNITEMPED: TLargeintField
      FieldName = 'NITEMPED'
    end
    object cliNfeItensORIG: TLargeintField
      FieldName = 'ORIG'
    end
    object cliNfeItensCST_ICMS: TStringField
      FieldName = 'CST_ICMS'
      Size = 3
    end
    object cliNfeItensMODBC_ICMS: TLargeintField
      FieldName = 'MODBC_ICMS'
    end
    object cliNfeItensVBC: TFMTBCDField
      FieldName = 'VBC'
      Precision = 18
      Size = 2
    end
    object cliNfeItensPICMS: TFMTBCDField
      FieldName = 'PICMS'
      Precision = 9
      Size = 2
    end
    object cliNfeItensVICMS: TFMTBCDField
      FieldName = 'VICMS'
      Precision = 18
      Size = 2
    end
    object cliNfeItensPREDBC: TFMTBCDField
      FieldName = 'PREDBC'
      Precision = 9
      Size = 2
    end
    object cliNfeItensVICMSDESON: TFMTBCDField
      FieldName = 'VICMSDESON'
      Precision = 18
      Size = 2
    end
    object cliNfeItensMOTDESICMS: TLargeintField
      FieldName = 'MOTDESICMS'
    end
    object cliNfeItensMODBCST: TLargeintField
      FieldName = 'MODBCST'
    end
    object cliNfeItensPMVAST: TFMTBCDField
      FieldName = 'PMVAST'
      Precision = 18
      Size = 2
    end
    object cliNfeItensVBCST: TFMTBCDField
      FieldName = 'VBCST'
      Precision = 18
      Size = 2
    end
    object cliNfeItensPREDBCST: TFMTBCDField
      FieldName = 'PREDBCST'
      Precision = 18
      Size = 2
    end
    object cliNfeItensPICMSST: TFMTBCDField
      FieldName = 'PICMSST'
      Precision = 18
      Size = 2
    end
    object cliNfeItensVICMSST: TFMTBCDField
      FieldName = 'VICMSST'
      Precision = 18
      Size = 2
    end
    object cliNfeItensPCREDSN: TFMTBCDField
      FieldName = 'PCREDSN'
      Precision = 18
      Size = 2
    end
    object cliNfeItensVCREDICMSSN: TFMTBCDField
      FieldName = 'VCREDICMSSN'
      Precision = 18
      Size = 2
    end
    object cliNfeItensVBCSTRET: TFMTBCDField
      FieldName = 'VBCSTRET'
      Precision = 18
      Size = 2
    end
    object cliNfeItensVICMSSTRET: TFMTBCDField
      FieldName = 'VICMSSTRET'
      Precision = 18
      Size = 2
    end
    object cliNfeItensCST_IPI: TStringField
      FieldName = 'CST_IPI'
      Size = 2
    end
    object cliNfeItensENQ_IPI: TStringField
      FieldName = 'ENQ_IPI'
      Size = 3
    end
    object cliNfeItensVBCIPI: TFMTBCDField
      FieldName = 'VBCIPI'
      Precision = 18
      Size = 2
    end
    object cliNfeItensPIPI: TFMTBCDField
      FieldName = 'PIPI'
      Precision = 9
      Size = 2
    end
    object cliNfeItensVIPI: TFMTBCDField
      FieldName = 'VIPI'
      Precision = 18
      Size = 2
    end
    object cliNfeItensCST_PIS: TStringField
      FieldName = 'CST_PIS'
      Size = 2
    end
    object cliNfeItensVBCPIS: TFMTBCDField
      FieldName = 'VBCPIS'
      Precision = 18
      Size = 2
    end
    object cliNfeItensPPIS: TFMTBCDField
      FieldName = 'PPIS'
      Precision = 9
      Size = 2
    end
    object cliNfeItensVPIS: TFMTBCDField
      FieldName = 'VPIS'
      Precision = 18
      Size = 2
    end
    object cliNfeItensCST_COFINS: TStringField
      FieldName = 'CST_COFINS'
      Size = 2
    end
    object cliNfeItensVBCCOFINS: TFMTBCDField
      FieldName = 'VBCCOFINS'
      Precision = 18
      Size = 2
    end
    object cliNfeItensPCOFINS: TFMTBCDField
      FieldName = 'PCOFINS'
      Precision = 9
      Size = 2
    end
    object cliNfeItensVCOFINS: TFMTBCDField
      FieldName = 'VCOFINS'
      Precision = 18
      Size = 2
    end
    object cliNfeItensVTOTTRIB: TFMTBCDField
      FieldName = 'VTOTTRIB'
      Precision = 18
      Size = 2
    end
    object cliNfeItensPST: TFMTBCDField
      FieldName = 'PST'
      Precision = 18
      Size = 2
    end
    object cliNfeItensVICMSSUBSTITUTO: TFMTBCDField
      FieldName = 'VICMSSUBSTITUTO'
      Precision = 18
      Size = 2
    end
    object cliNfeItensCPRODANP: TStringField
      FieldName = 'CPRODANP'
    end
    object cliNfeItensDESCANP: TStringField
      FieldName = 'DESCANP'
      Size = 60
    end
    object cliNfeItensVPART: TFMTBCDField
      FieldName = 'VPART'
      Precision = 18
      Size = 2
    end
    object cliNfeItensPGLP: TFMTBCDField
      FieldName = 'PGLP'
      Precision = 18
      Size = 2
    end
    object cliNfeItensPGNN: TFMTBCDField
      FieldName = 'PGNN'
      Precision = 18
      Size = 2
    end
    object cliNfeItensPGNI: TFMTBCDField
      FieldName = 'PGNI'
      Precision = 18
      Size = 2
    end
  end
  object cliNfePagamento: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspNfePagamento'
    Left = 384
    Top = 231
    object cliNfePagamentoID_NFE_PAG: TLargeintField
      FieldName = 'ID_NFE_PAG'
      Required = True
    end
    object cliNfePagamentoID_NFE: TLargeintField
      FieldName = 'ID_NFE'
    end
    object cliNfePagamentoREGISTRO_EMIT: TLargeintField
      FieldName = 'REGISTRO_EMIT'
    end
    object cliNfePagamentoTPAG: TStringField
      FieldName = 'TPAG'
      Size = 11
    end
    object cliNfePagamentoVPAG: TFMTBCDField
      FieldName = 'VPAG'
      Precision = 18
      Size = 2
    end
    object cliNfePagamentoVTROCO: TFMTBCDField
      FieldName = 'VTROCO'
      Precision = 18
      Size = 2
    end
    object cliNfePagamentoINDPAG: TLargeintField
      FieldName = 'INDPAG'
    end
    object cliNfePagamentoCNPJ_ADM: TStringField
      FieldName = 'CNPJ_ADM'
    end
    object cliNfePagamentoTBAND: TStringField
      FieldName = 'TBAND'
      Size = 2
    end
    object cliNfePagamentoCAUT: TStringField
      FieldName = 'CAUT'
    end
    object cliNfePagamentoCAIXA_N: TLargeintField
      FieldName = 'CAIXA_N'
    end
  end
  object qryCliente: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftLargeint
        Name = 'PEMITENTE'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT *'
      '  FROM CLIENTE'
      'WHERE REGISTRO_EMIT = :PEMITENTE'
      'ORDER BY NOME ')
    SQLConnection = Conexao
    Left = 464
    Top = 103
    object qryClienteCODIGO_CLIENTE: TLargeintField
      FieldName = 'CODIGO_CLIENTE'
      Required = True
    end
    object qryClienteREGISTRO_EMIT: TLargeintField
      FieldName = 'REGISTRO_EMIT'
    end
    object qryClienteNOME: TStringField
      FieldName = 'NOME'
      Size = 255
    end
    object qryClienteCONTATO: TStringField
      FieldName = 'CONTATO'
      Size = 40
    end
    object qryClienteCPF: TStringField
      FieldName = 'CPF'
      Size = 40
    end
    object qryClienteRG: TStringField
      FieldName = 'RG'
      Size = 30
    end
    object qryClienteIMUNICIPAL: TStringField
      FieldName = 'IMUNICIPAL'
      Size = 30
    end
    object qryClienteSUFRAMA: TStringField
      FieldName = 'SUFRAMA'
      Size = 30
    end
    object qryClienteINDIEDEST: TStringField
      FieldName = 'INDIEDEST'
      Size = 60
    end
    object qryClienteENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 80
    end
    object qryClienteNUMERO: TStringField
      FieldName = 'NUMERO'
      Size = 10
    end
    object qryClienteCOMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
      Size = 60
    end
    object qryClienteBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Size = 60
    end
    object qryClienteCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 60
    end
    object qryClienteCD_CIDADE: TStringField
      FieldName = 'CD_CIDADE'
      Size = 11
    end
    object qryClienteESTADO: TStringField
      FieldName = 'ESTADO'
    end
    object qryClienteCD_ESTADO: TStringField
      FieldName = 'CD_ESTADO'
      Size = 10
    end
    object qryClienteCD_PAIS: TStringField
      FieldName = 'CD_PAIS'
      Size = 10
    end
    object qryClientePAIS: TStringField
      FieldName = 'PAIS'
    end
    object qryClienteCEP: TStringField
      FieldName = 'CEP'
      Size = 15
    end
    object qryClienteTELEFONE: TStringField
      FieldName = 'TELEFONE'
    end
    object qryClienteCELULAR: TStringField
      FieldName = 'CELULAR'
    end
    object qryClienteEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 255
    end
    object qryClienteDATA_NASCIMENTO: TDateField
      FieldName = 'DATA_NASCIMENTO'
    end
    object qryClienteMAE: TStringField
      FieldName = 'MAE'
      Size = 80
    end
    object qryClientePAI: TStringField
      FieldName = 'PAI'
      Size = 80
    end
    object qryClienteDEPENDENTES: TStringField
      FieldName = 'DEPENDENTES'
      Size = 255
    end
    object qryClienteLIMITE: TFMTBCDField
      FieldName = 'LIMITE'
      Precision = 18
      Size = 2
    end
    object qryClienteBLOQUEADO: TLargeintField
      FieldName = 'BLOQUEADO'
    end
    object qryClienteCONVENIO: TStringField
      FieldName = 'CONVENIO'
      Size = 255
    end
    object qryClienteDATA_CADASTRO: TDateField
      FieldName = 'DATA_CADASTRO'
    end
    object qryClienteSENHA: TStringField
      FieldName = 'SENHA'
      Size = 255
    end
    object qryClienteOBSERVACAO: TStringField
      FieldName = 'OBSERVACAO'
      Size = 255
    end
    object qryClienteCONS_FINAL: TLargeintField
      FieldName = 'CONS_FINAL'
    end
  end
  object dspCliente: TDataSetProvider
    DataSet = qryCliente
    Left = 459
    Top = 167
  end
  object cliCliente: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCliente'
    Left = 464
    Top = 231
    object cliClienteCODIGO_CLIENTE: TLargeintField
      FieldName = 'CODIGO_CLIENTE'
      Required = True
    end
    object cliClienteREGISTRO_EMIT: TLargeintField
      FieldName = 'REGISTRO_EMIT'
    end
    object cliClienteNOME: TStringField
      FieldName = 'NOME'
      Size = 255
    end
    object cliClienteCONTATO: TStringField
      FieldName = 'CONTATO'
      Size = 40
    end
    object cliClienteCPF: TStringField
      FieldName = 'CPF'
      Size = 40
    end
    object cliClienteRG: TStringField
      FieldName = 'RG'
      Size = 30
    end
    object cliClienteIMUNICIPAL: TStringField
      FieldName = 'IMUNICIPAL'
      Size = 30
    end
    object cliClienteSUFRAMA: TStringField
      FieldName = 'SUFRAMA'
      Size = 30
    end
    object cliClienteINDIEDEST: TStringField
      FieldName = 'INDIEDEST'
      Size = 60
    end
    object cliClienteENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 80
    end
    object cliClienteNUMERO: TStringField
      FieldName = 'NUMERO'
      Size = 10
    end
    object cliClienteCOMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
      Size = 60
    end
    object cliClienteBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Size = 60
    end
    object cliClienteCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 60
    end
    object cliClienteCD_CIDADE: TStringField
      FieldName = 'CD_CIDADE'
      Size = 11
    end
    object cliClienteESTADO: TStringField
      FieldName = 'ESTADO'
    end
    object cliClienteCD_ESTADO: TStringField
      FieldName = 'CD_ESTADO'
      Size = 10
    end
    object cliClienteCD_PAIS: TStringField
      FieldName = 'CD_PAIS'
      Size = 10
    end
    object cliClientePAIS: TStringField
      FieldName = 'PAIS'
    end
    object cliClienteCEP: TStringField
      FieldName = 'CEP'
      Size = 15
    end
    object cliClienteTELEFONE: TStringField
      FieldName = 'TELEFONE'
    end
    object cliClienteCELULAR: TStringField
      FieldName = 'CELULAR'
    end
    object cliClienteEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 255
    end
    object cliClienteDATA_NASCIMENTO: TDateField
      FieldName = 'DATA_NASCIMENTO'
    end
    object cliClienteMAE: TStringField
      FieldName = 'MAE'
      Size = 80
    end
    object cliClientePAI: TStringField
      FieldName = 'PAI'
      Size = 80
    end
    object cliClienteDEPENDENTES: TStringField
      FieldName = 'DEPENDENTES'
      Size = 255
    end
    object cliClienteLIMITE: TFMTBCDField
      FieldName = 'LIMITE'
      Precision = 18
      Size = 2
    end
    object cliClienteBLOQUEADO: TLargeintField
      FieldName = 'BLOQUEADO'
    end
    object cliClienteCONVENIO: TStringField
      FieldName = 'CONVENIO'
      Size = 255
    end
    object cliClienteDATA_CADASTRO: TDateField
      FieldName = 'DATA_CADASTRO'
    end
    object cliClienteSENHA: TStringField
      FieldName = 'SENHA'
      Size = 255
    end
    object cliClienteOBSERVACAO: TStringField
      FieldName = 'OBSERVACAO'
      Size = 255
    end
    object cliClienteCONS_FINAL: TLargeintField
      FieldName = 'CONS_FINAL'
    end
  end
  object qrySequence: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = Conexao
    Left = 837
    Top = 8
  end
  object qryProximaNota: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftLargeint
        Name = 'PEMITENTE'
        ParamType = ptInput
      end
      item
        DataType = ftLargeint
        Name = 'PSERIE'
        ParamType = ptInput
      end
      item
        DataType = ftLargeint
        Name = 'PMODELO'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT MAX(IDE_NNF) AS IDE_NNF'
      '   FROM NFE_CAB'
      ' WHERE REGISTRO_EMIT = :PEMITENTE'
      '      AND IDE_SERIE = :PSERIE'
      '      AND IDE_MOD = :PMODELO')
    SQLConnection = Conexao
    Left = 839
    Top = 56
  end
  object qryEmitente: TSQLQuery
    MaxBlobSize = 1
    Params = <>
    SQL.Strings = (
      'SELECT *'
      '  FROM EMITENTE')
    SQLConnection = Conexao
    Left = 592
    Top = 96
    object qryEmitenteNOME: TStringField
      FieldName = 'NOME'
      Size = 100
    end
    object qryEmitenteNOME_FANTASIA: TStringField
      FieldName = 'NOME_FANTASIA'
      Size = 100
    end
    object qryEmitenteCONTATO: TStringField
      FieldName = 'CONTATO'
      Size = 60
    end
    object qryEmitenteENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 100
    end
    object qryEmitenteNUMERO: TStringField
      FieldName = 'NUMERO'
      Size = 10
    end
    object qryEmitenteBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Size = 60
    end
    object qryEmitenteMUNICIPIO: TStringField
      FieldName = 'MUNICIPIO'
      Size = 100
    end
    object qryEmitenteCD_CIDADE: TStringField
      FieldName = 'CD_CIDADE'
      Size = 10
    end
    object qryEmitenteCEP: TStringField
      FieldName = 'CEP'
    end
    object qryEmitenteESTADO: TStringField
      FieldName = 'ESTADO'
      Size = 60
    end
    object qryEmitenteCD_ESTADO: TStringField
      FieldName = 'CD_ESTADO'
      Size = 10
    end
    object qryEmitenteCD_PAIS: TStringField
      FieldName = 'CD_PAIS'
      Size = 10
    end
    object qryEmitentePAIS: TStringField
      FieldName = 'PAIS'
      Size = 60
    end
    object qryEmitenteCNPJ: TStringField
      FieldName = 'CNPJ'
      Size = 14
    end
    object qryEmitenteCPF: TStringField
      FieldName = 'CPF'
      Size = 11
    end
    object qryEmitenteIE: TStringField
      FieldName = 'IE'
    end
    object qryEmitenteTELEFONE: TStringField
      FieldName = 'TELEFONE'
      Size = 30
    end
    object qryEmitenteEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 255
    end
    object qryEmitenteCRT: TStringField
      FieldName = 'CRT'
      Size = 2
    end
    object qryEmitenteCNAE: TStringField
      FieldName = 'CNAE'
    end
    object qryEmitenteIMUNICIPAL: TStringField
      FieldName = 'IMUNICIPAL'
    end
    object qryEmitenteLOGOMARCA_EMITENTE: TBlobField
      FieldName = 'LOGOMARCA_EMITENTE'
      Size = 1
    end
    object qryEmitenteREGISTRO: TLargeintField
      FieldName = 'REGISTRO'
      Required = True
    end
  end
  object dspEmitente: TDataSetProvider
    DataSet = qryEmitente
    Left = 600
    Top = 167
  end
  object cliEmitente: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspEmitente'
    Left = 592
    Top = 224
    object cliEmitenteNOME: TStringField
      FieldName = 'NOME'
      Size = 100
    end
    object cliEmitenteNOME_FANTASIA: TStringField
      FieldName = 'NOME_FANTASIA'
      Size = 100
    end
    object cliEmitenteCONTATO: TStringField
      FieldName = 'CONTATO'
      Size = 60
    end
    object cliEmitenteENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 100
    end
    object cliEmitenteNUMERO: TStringField
      FieldName = 'NUMERO'
      Size = 10
    end
    object cliEmitenteBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Size = 60
    end
    object cliEmitenteMUNICIPIO: TStringField
      FieldName = 'MUNICIPIO'
      Size = 100
    end
    object cliEmitenteCD_CIDADE: TStringField
      FieldName = 'CD_CIDADE'
      Size = 10
    end
    object cliEmitenteCEP: TStringField
      FieldName = 'CEP'
    end
    object cliEmitenteESTADO: TStringField
      FieldName = 'ESTADO'
      Size = 60
    end
    object cliEmitenteCD_ESTADO: TStringField
      FieldName = 'CD_ESTADO'
      Size = 10
    end
    object cliEmitenteCD_PAIS: TStringField
      FieldName = 'CD_PAIS'
      Size = 10
    end
    object cliEmitentePAIS: TStringField
      FieldName = 'PAIS'
      Size = 60
    end
    object cliEmitenteCNPJ: TStringField
      FieldName = 'CNPJ'
      Size = 14
    end
    object cliEmitenteCPF: TStringField
      FieldName = 'CPF'
      Size = 11
    end
    object cliEmitenteIE: TStringField
      FieldName = 'IE'
    end
    object cliEmitenteTELEFONE: TStringField
      FieldName = 'TELEFONE'
      Size = 30
    end
    object cliEmitenteEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 255
    end
    object cliEmitenteCRT: TStringField
      FieldName = 'CRT'
      Size = 2
    end
    object cliEmitenteCNAE: TStringField
      FieldName = 'CNAE'
    end
    object cliEmitenteIMUNICIPAL: TStringField
      FieldName = 'IMUNICIPAL'
    end
    object cliEmitenteLOGOMARCA_EMITENTE: TBlobField
      FieldName = 'LOGOMARCA_EMITENTE'
      Size = 1
    end
    object cliEmitenteREGISTRO: TLargeintField
      FieldName = 'REGISTRO'
      Required = True
    end
  end
  object uptAtualizaStatusNotaFiscal: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftLargeint
        Name = 'PSTATUS'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PCHAVE'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'UPDATE NFE_CAB'
      '       SET CD_STATUS = :PSTATUS'
      ' WHERE CHAVE = :PCHAVE')
    SQLConnection = Conexao
    Left = 840
    Top = 152
  end
  object uptAtualizaDadosNotaFiscal: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'PINFORMACAO_COMPLEMENTAR'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PPROTOCOLO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PXML'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PCHAVE'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'UPDATE NFE_CAB'
      '       SET INFCPL = :PINFORMACAO_COMPLEMENTAR,'
      '              PROTOCOLO_AUTORIZACAO = :PPROTOCOLO,'
      '              DT_AUTORIZACAO = CURRENT_TIMESTAMP,'
      '              XML_APROVADO = :PXML'
      ' WHERE CHAVE = :PCHAVE')
    SQLConnection = Conexao
    Left = 840
    Top = 104
  end
  object base64: TIdEncoderMIME
    FillChar = '='
    Left = 24
    Top = 16
  end
  object qryConsultaNotasFiscais: TSQLQuery
    MaxBlobSize = 1
    Params = <>
    SQL.Strings = (
      'SELECT *'
      '  FROM NFE_CAB'
      'WHERE ID_NFE = -1')
    SQLConnection = Conexao
    Left = 690
    Top = 96
    object qryConsultaNotasFiscaisID_NFE: TLargeintField
      FieldName = 'ID_NFE'
      Required = True
    end
    object qryConsultaNotasFiscaisREGISTRO_EMIT: TLargeintField
      FieldName = 'REGISTRO_EMIT'
    end
    object qryConsultaNotasFiscaisID_VENDEDOR: TLargeintField
      FieldName = 'ID_VENDEDOR'
    end
    object qryConsultaNotasFiscaisCHAVE: TStringField
      FieldName = 'CHAVE'
      Size = 44
    end
    object qryConsultaNotasFiscaisIDE_CUF: TLargeintField
      FieldName = 'IDE_CUF'
    end
    object qryConsultaNotasFiscaisIDE_NATOP: TStringField
      FieldName = 'IDE_NATOP'
      Size = 60
    end
    object qryConsultaNotasFiscaisIDE_MOD: TLargeintField
      FieldName = 'IDE_MOD'
    end
    object qryConsultaNotasFiscaisIDE_SERIE: TLargeintField
      FieldName = 'IDE_SERIE'
    end
    object qryConsultaNotasFiscaisIDE_NNF: TLargeintField
      FieldName = 'IDE_NNF'
    end
    object qryConsultaNotasFiscaisIDE_DHEMI: TSQLTimeStampField
      FieldName = 'IDE_DHEMI'
    end
    object qryConsultaNotasFiscaisIDE_DHSAIENT: TSQLTimeStampField
      FieldName = 'IDE_DHSAIENT'
    end
    object qryConsultaNotasFiscaisIDE_TPNF: TStringField
      FieldName = 'IDE_TPNF'
      Size = 2
    end
    object qryConsultaNotasFiscaisIDE_IDDEST: TLargeintField
      FieldName = 'IDE_IDDEST'
    end
    object qryConsultaNotasFiscaisIDE_CMUNFG: TStringField
      FieldName = 'IDE_CMUNFG'
      Size = 7
    end
    object qryConsultaNotasFiscaisIDE_TP_IMP: TLargeintField
      FieldName = 'IDE_TP_IMP'
    end
    object qryConsultaNotasFiscaisIDE_TPEMIS: TStringField
      FieldName = 'IDE_TPEMIS'
      Size = 45
    end
    object qryConsultaNotasFiscaisIDE_TPAMB: TLargeintField
      FieldName = 'IDE_TPAMB'
    end
    object qryConsultaNotasFiscaisIDE_FINNFE: TLargeintField
      FieldName = 'IDE_FINNFE'
    end
    object qryConsultaNotasFiscaisIDE_INDFINAL: TLargeintField
      FieldName = 'IDE_INDFINAL'
    end
    object qryConsultaNotasFiscaisIDE_INDPRES: TLargeintField
      FieldName = 'IDE_INDPRES'
    end
    object qryConsultaNotasFiscaisIDE_PROCEMI: TLargeintField
      FieldName = 'IDE_PROCEMI'
    end
    object qryConsultaNotasFiscaisIDE_VERPROC: TStringField
      FieldName = 'IDE_VERPROC'
    end
    object qryConsultaNotasFiscaisEMIT_CNPJ_CPF: TStringField
      FieldName = 'EMIT_CNPJ_CPF'
    end
    object qryConsultaNotasFiscaisEMIT_CPF: TStringField
      FieldName = 'EMIT_CPF'
      Size = 11
    end
    object qryConsultaNotasFiscaisEMIT_XNOME: TStringField
      FieldName = 'EMIT_XNOME'
      Size = 60
    end
    object qryConsultaNotasFiscaisEMIT_XFANT: TStringField
      FieldName = 'EMIT_XFANT'
      Size = 60
    end
    object qryConsultaNotasFiscaisEMIT_XLGR: TStringField
      FieldName = 'EMIT_XLGR'
      Size = 60
    end
    object qryConsultaNotasFiscaisEMIT_NRO: TStringField
      FieldName = 'EMIT_NRO'
      Size = 60
    end
    object qryConsultaNotasFiscaisEMIT_XCPL: TStringField
      FieldName = 'EMIT_XCPL'
      Size = 60
    end
    object qryConsultaNotasFiscaisEMIT_XBAIRRO: TStringField
      FieldName = 'EMIT_XBAIRRO'
      Size = 60
    end
    object qryConsultaNotasFiscaisEMIT_CMUN: TStringField
      FieldName = 'EMIT_CMUN'
      Size = 7
    end
    object qryConsultaNotasFiscaisEMIT_XMUN: TStringField
      FieldName = 'EMIT_XMUN'
      Size = 60
    end
    object qryConsultaNotasFiscaisEMIT_UF: TStringField
      FieldName = 'EMIT_UF'
      Size = 2
    end
    object qryConsultaNotasFiscaisEMIT_CEP: TStringField
      FieldName = 'EMIT_CEP'
      Size = 8
    end
    object qryConsultaNotasFiscaisEMIT_CPAIS: TLargeintField
      FieldName = 'EMIT_CPAIS'
    end
    object qryConsultaNotasFiscaisEMIT_XPAIS: TStringField
      FieldName = 'EMIT_XPAIS'
      Size = 60
    end
    object qryConsultaNotasFiscaisEMIT_FONE: TStringField
      FieldName = 'EMIT_FONE'
      Size = 14
    end
    object qryConsultaNotasFiscaisEMIT_IE: TStringField
      FieldName = 'EMIT_IE'
      Size = 14
    end
    object qryConsultaNotasFiscaisEMIT_IM: TStringField
      FieldName = 'EMIT_IM'
      Size = 15
    end
    object qryConsultaNotasFiscaisEMIT_CNAE: TStringField
      FieldName = 'EMIT_CNAE'
      Size = 7
    end
    object qryConsultaNotasFiscaisEMIT_CRT: TStringField
      FieldName = 'EMIT_CRT'
      Size = 45
    end
    object qryConsultaNotasFiscaisID_CLIENTE: TLargeintField
      FieldName = 'ID_CLIENTE'
    end
    object qryConsultaNotasFiscaisDEST_CNPJ_CPF: TStringField
      FieldName = 'DEST_CNPJ_CPF'
    end
    object qryConsultaNotasFiscaisDEST_IDESTRANGEIRO: TStringField
      FieldName = 'DEST_IDESTRANGEIRO'
    end
    object qryConsultaNotasFiscaisDEST_XNOME: TStringField
      FieldName = 'DEST_XNOME'
      Size = 60
    end
    object qryConsultaNotasFiscaisDEST_XLGR: TStringField
      FieldName = 'DEST_XLGR'
      Size = 60
    end
    object qryConsultaNotasFiscaisDEST_NRO: TStringField
      FieldName = 'DEST_NRO'
      Size = 60
    end
    object qryConsultaNotasFiscaisDEST_XCPL: TStringField
      FieldName = 'DEST_XCPL'
      Size = 60
    end
    object qryConsultaNotasFiscaisDEST_XBAIRRO: TStringField
      FieldName = 'DEST_XBAIRRO'
      Size = 60
    end
    object qryConsultaNotasFiscaisDEST_CMUN: TStringField
      FieldName = 'DEST_CMUN'
      Size = 7
    end
    object qryConsultaNotasFiscaisDEST_XMUN: TStringField
      FieldName = 'DEST_XMUN'
      Size = 60
    end
    object qryConsultaNotasFiscaisDEST_UF: TStringField
      FieldName = 'DEST_UF'
      Size = 2
    end
    object qryConsultaNotasFiscaisDEST_CEP: TStringField
      FieldName = 'DEST_CEP'
      Size = 8
    end
    object qryConsultaNotasFiscaisDEST_CPAIS: TLargeintField
      FieldName = 'DEST_CPAIS'
    end
    object qryConsultaNotasFiscaisDEST_XPAIS: TStringField
      FieldName = 'DEST_XPAIS'
      Size = 60
    end
    object qryConsultaNotasFiscaisDEST_FONE: TStringField
      FieldName = 'DEST_FONE'
      Size = 14
    end
    object qryConsultaNotasFiscaisDEST_INDIEDEST: TLargeintField
      FieldName = 'DEST_INDIEDEST'
    end
    object qryConsultaNotasFiscaisDEST_IE: TStringField
      FieldName = 'DEST_IE'
      Size = 14
    end
    object qryConsultaNotasFiscaisDEST_EMAIL: TStringField
      FieldName = 'DEST_EMAIL'
      Size = 60
    end
    object qryConsultaNotasFiscaisVBC: TFMTBCDField
      FieldName = 'VBC'
      Precision = 18
      Size = 2
    end
    object qryConsultaNotasFiscaisVICMS: TFMTBCDField
      FieldName = 'VICMS'
      Precision = 18
      Size = 2
    end
    object qryConsultaNotasFiscaisVICMSDESON: TFMTBCDField
      FieldName = 'VICMSDESON'
      Precision = 18
      Size = 2
    end
    object qryConsultaNotasFiscaisVBCST: TFMTBCDField
      FieldName = 'VBCST'
      Precision = 18
      Size = 2
    end
    object qryConsultaNotasFiscaisVST: TFMTBCDField
      FieldName = 'VST'
      Precision = 18
      Size = 2
    end
    object qryConsultaNotasFiscaisVPROD: TFMTBCDField
      FieldName = 'VPROD'
      Precision = 18
      Size = 2
    end
    object qryConsultaNotasFiscaisVFRETE: TFMTBCDField
      FieldName = 'VFRETE'
      Precision = 18
      Size = 2
    end
    object qryConsultaNotasFiscaisVSEG: TFMTBCDField
      FieldName = 'VSEG'
      Precision = 18
      Size = 2
    end
    object qryConsultaNotasFiscaisVDESC: TFMTBCDField
      FieldName = 'VDESC'
      Precision = 18
      Size = 2
    end
    object qryConsultaNotasFiscaisVII: TFMTBCDField
      FieldName = 'VII'
      Precision = 18
      Size = 2
    end
    object qryConsultaNotasFiscaisVIPI: TFMTBCDField
      FieldName = 'VIPI'
      Precision = 18
      Size = 2
    end
    object qryConsultaNotasFiscaisVPIS: TFMTBCDField
      FieldName = 'VPIS'
      Precision = 18
      Size = 2
    end
    object qryConsultaNotasFiscaisVCOFINS: TFMTBCDField
      FieldName = 'VCOFINS'
      Precision = 18
      Size = 2
    end
    object qryConsultaNotasFiscaisVOUTRO: TFMTBCDField
      FieldName = 'VOUTRO'
      Precision = 18
      Size = 2
    end
    object qryConsultaNotasFiscaisVNF: TFMTBCDField
      FieldName = 'VNF'
      Precision = 18
      Size = 2
    end
    object qryConsultaNotasFiscaisVTOTTRIB: TFMTBCDField
      FieldName = 'VTOTTRIB'
      Precision = 18
      Size = 2
    end
    object qryConsultaNotasFiscaisMODFRETE: TLargeintField
      FieldName = 'MODFRETE'
    end
    object qryConsultaNotasFiscaisID_TRANSP: TLargeintField
      FieldName = 'ID_TRANSP'
    end
    object qryConsultaNotasFiscaisTRANSP_CNPJ_CPF: TStringField
      FieldName = 'TRANSP_CNPJ_CPF'
      Size = 14
    end
    object qryConsultaNotasFiscaisTRANSP_XNOME: TStringField
      FieldName = 'TRANSP_XNOME'
      Size = 60
    end
    object qryConsultaNotasFiscaisTRANSP_IE: TStringField
      FieldName = 'TRANSP_IE'
      Size = 14
    end
    object qryConsultaNotasFiscaisTRANSP_XENDER: TStringField
      FieldName = 'TRANSP_XENDER'
      Size = 60
    end
    object qryConsultaNotasFiscaisTRANSP_XMUN: TStringField
      FieldName = 'TRANSP_XMUN'
      Size = 60
    end
    object qryConsultaNotasFiscaisTRANSP_UF: TStringField
      FieldName = 'TRANSP_UF'
      Size = 2
    end
    object qryConsultaNotasFiscaisVEIC_PLACA: TStringField
      FieldName = 'VEIC_PLACA'
      Size = 10
    end
    object qryConsultaNotasFiscaisVEIC_UF: TStringField
      FieldName = 'VEIC_UF'
      Size = 2
    end
    object qryConsultaNotasFiscaisVEIC_RNTC: TStringField
      FieldName = 'VEIC_RNTC'
    end
    object qryConsultaNotasFiscaisVOL_QVOL: TLargeintField
      FieldName = 'VOL_QVOL'
    end
    object qryConsultaNotasFiscaisVOL_ESP: TStringField
      FieldName = 'VOL_ESP'
      Size = 60
    end
    object qryConsultaNotasFiscaisVOL_MARCA: TStringField
      FieldName = 'VOL_MARCA'
      Size = 60
    end
    object qryConsultaNotasFiscaisVOL_NVOL: TStringField
      FieldName = 'VOL_NVOL'
      Size = 60
    end
    object qryConsultaNotasFiscaisVOL_PESOL: TFMTBCDField
      FieldName = 'VOL_PESOL'
      Precision = 18
      Size = 3
    end
    object qryConsultaNotasFiscaisVOL_PESOB: TFMTBCDField
      FieldName = 'VOL_PESOB'
      Precision = 18
      Size = 3
    end
    object qryConsultaNotasFiscaisINFADFISCO: TStringField
      FieldName = 'INFADFISCO'
      Size = 500
    end
    object qryConsultaNotasFiscaisINFCPL: TStringField
      FieldName = 'INFCPL'
      Size = 500
    end
    object qryConsultaNotasFiscaisREFNFE: TStringField
      FieldName = 'REFNFE'
      Size = 44
    end
    object qryConsultaNotasFiscaisEXPORTA_UFEMARQ: TStringField
      FieldName = 'EXPORTA_UFEMARQ'
      Size = 2
    end
    object qryConsultaNotasFiscaisEXPORTA_XLOCEMARQ: TStringField
      FieldName = 'EXPORTA_XLOCEMARQ'
      Size = 60
    end
    object qryConsultaNotasFiscaisCD_STATUS: TLargeintField
      FieldName = 'CD_STATUS'
    end
    object qryConsultaNotasFiscaisPROTOCOLO_AUTORIZACAO: TStringField
      FieldName = 'PROTOCOLO_AUTORIZACAO'
      Size = 30
    end
    object qryConsultaNotasFiscaisDT_AUTORIZACAO: TSQLTimeStampField
      FieldName = 'DT_AUTORIZACAO'
    end
    object qryConsultaNotasFiscaisMOTIVO_CANCELAMENTO: TStringField
      FieldName = 'MOTIVO_CANCELAMENTO'
      Size = 100
    end
    object qryConsultaNotasFiscaisPROTOCOLO_CANCELAMENTO: TStringField
      FieldName = 'PROTOCOLO_CANCELAMENTO'
      Size = 30
    end
    object qryConsultaNotasFiscaisDT_CANCELAMENTO: TSQLTimeStampField
      FieldName = 'DT_CANCELAMENTO'
    end
    object qryConsultaNotasFiscaisXML_APROVADO: TBlobField
      FieldName = 'XML_APROVADO'
      Size = 1
    end
    object qryConsultaNotasFiscaisXML_CANCELADO: TStringField
      FieldName = 'XML_CANCELADO'
      Size = 8000
    end
  end
  object dspConsultaNotasFiscais: TDataSetProvider
    DataSet = qryConsultaNotasFiscais
    Left = 690
    Top = 160
  end
  object cliConsultaNotasFiscais: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspConsultaNotasFiscais'
    Left = 690
    Top = 224
    object cliConsultaNotasFiscaisID_NFE: TLargeintField
      FieldName = 'ID_NFE'
      Required = True
    end
    object cliConsultaNotasFiscaisREGISTRO_EMIT: TLargeintField
      FieldName = 'REGISTRO_EMIT'
    end
    object cliConsultaNotasFiscaisID_VENDEDOR: TLargeintField
      FieldName = 'ID_VENDEDOR'
    end
    object cliConsultaNotasFiscaisCHAVE: TStringField
      FieldName = 'CHAVE'
      Size = 44
    end
    object cliConsultaNotasFiscaisIDE_CUF: TLargeintField
      FieldName = 'IDE_CUF'
    end
    object cliConsultaNotasFiscaisIDE_NATOP: TStringField
      FieldName = 'IDE_NATOP'
      Size = 60
    end
    object cliConsultaNotasFiscaisIDE_MOD: TLargeintField
      FieldName = 'IDE_MOD'
    end
    object cliConsultaNotasFiscaisIDE_SERIE: TLargeintField
      FieldName = 'IDE_SERIE'
    end
    object cliConsultaNotasFiscaisIDE_NNF: TLargeintField
      FieldName = 'IDE_NNF'
    end
    object cliConsultaNotasFiscaisIDE_DHEMI: TSQLTimeStampField
      FieldName = 'IDE_DHEMI'
    end
    object cliConsultaNotasFiscaisIDE_DHSAIENT: TSQLTimeStampField
      FieldName = 'IDE_DHSAIENT'
    end
    object cliConsultaNotasFiscaisIDE_TPNF: TStringField
      FieldName = 'IDE_TPNF'
      Size = 2
    end
    object cliConsultaNotasFiscaisIDE_IDDEST: TLargeintField
      FieldName = 'IDE_IDDEST'
    end
    object cliConsultaNotasFiscaisIDE_CMUNFG: TStringField
      FieldName = 'IDE_CMUNFG'
      Size = 7
    end
    object cliConsultaNotasFiscaisIDE_TP_IMP: TLargeintField
      FieldName = 'IDE_TP_IMP'
    end
    object cliConsultaNotasFiscaisIDE_TPEMIS: TStringField
      FieldName = 'IDE_TPEMIS'
      Size = 45
    end
    object cliConsultaNotasFiscaisIDE_TPAMB: TLargeintField
      FieldName = 'IDE_TPAMB'
    end
    object cliConsultaNotasFiscaisIDE_FINNFE: TLargeintField
      FieldName = 'IDE_FINNFE'
    end
    object cliConsultaNotasFiscaisIDE_INDFINAL: TLargeintField
      FieldName = 'IDE_INDFINAL'
    end
    object cliConsultaNotasFiscaisIDE_INDPRES: TLargeintField
      FieldName = 'IDE_INDPRES'
    end
    object cliConsultaNotasFiscaisIDE_PROCEMI: TLargeintField
      FieldName = 'IDE_PROCEMI'
    end
    object cliConsultaNotasFiscaisIDE_VERPROC: TStringField
      FieldName = 'IDE_VERPROC'
    end
    object cliConsultaNotasFiscaisEMIT_CNPJ_CPF: TStringField
      FieldName = 'EMIT_CNPJ_CPF'
    end
    object cliConsultaNotasFiscaisEMIT_CPF: TStringField
      FieldName = 'EMIT_CPF'
      Size = 11
    end
    object cliConsultaNotasFiscaisEMIT_XNOME: TStringField
      FieldName = 'EMIT_XNOME'
      Size = 60
    end
    object cliConsultaNotasFiscaisEMIT_XFANT: TStringField
      FieldName = 'EMIT_XFANT'
      Size = 60
    end
    object cliConsultaNotasFiscaisEMIT_XLGR: TStringField
      FieldName = 'EMIT_XLGR'
      Size = 60
    end
    object cliConsultaNotasFiscaisEMIT_NRO: TStringField
      FieldName = 'EMIT_NRO'
      Size = 60
    end
    object cliConsultaNotasFiscaisEMIT_XCPL: TStringField
      FieldName = 'EMIT_XCPL'
      Size = 60
    end
    object cliConsultaNotasFiscaisEMIT_XBAIRRO: TStringField
      FieldName = 'EMIT_XBAIRRO'
      Size = 60
    end
    object cliConsultaNotasFiscaisEMIT_CMUN: TStringField
      FieldName = 'EMIT_CMUN'
      Size = 7
    end
    object cliConsultaNotasFiscaisEMIT_XMUN: TStringField
      FieldName = 'EMIT_XMUN'
      Size = 60
    end
    object cliConsultaNotasFiscaisEMIT_UF: TStringField
      FieldName = 'EMIT_UF'
      Size = 2
    end
    object cliConsultaNotasFiscaisEMIT_CEP: TStringField
      FieldName = 'EMIT_CEP'
      Size = 8
    end
    object cliConsultaNotasFiscaisEMIT_CPAIS: TLargeintField
      FieldName = 'EMIT_CPAIS'
    end
    object cliConsultaNotasFiscaisEMIT_XPAIS: TStringField
      FieldName = 'EMIT_XPAIS'
      Size = 60
    end
    object cliConsultaNotasFiscaisEMIT_FONE: TStringField
      FieldName = 'EMIT_FONE'
      Size = 14
    end
    object cliConsultaNotasFiscaisEMIT_IE: TStringField
      FieldName = 'EMIT_IE'
      Size = 14
    end
    object cliConsultaNotasFiscaisEMIT_IM: TStringField
      FieldName = 'EMIT_IM'
      Size = 15
    end
    object cliConsultaNotasFiscaisEMIT_CNAE: TStringField
      FieldName = 'EMIT_CNAE'
      Size = 7
    end
    object cliConsultaNotasFiscaisEMIT_CRT: TStringField
      FieldName = 'EMIT_CRT'
      Size = 45
    end
    object cliConsultaNotasFiscaisID_CLIENTE: TLargeintField
      FieldName = 'ID_CLIENTE'
    end
    object cliConsultaNotasFiscaisDEST_CNPJ_CPF: TStringField
      FieldName = 'DEST_CNPJ_CPF'
    end
    object cliConsultaNotasFiscaisDEST_IDESTRANGEIRO: TStringField
      FieldName = 'DEST_IDESTRANGEIRO'
    end
    object cliConsultaNotasFiscaisDEST_XNOME: TStringField
      FieldName = 'DEST_XNOME'
      Size = 60
    end
    object cliConsultaNotasFiscaisDEST_XLGR: TStringField
      FieldName = 'DEST_XLGR'
      Size = 60
    end
    object cliConsultaNotasFiscaisDEST_NRO: TStringField
      FieldName = 'DEST_NRO'
      Size = 60
    end
    object cliConsultaNotasFiscaisDEST_XCPL: TStringField
      FieldName = 'DEST_XCPL'
      Size = 60
    end
    object cliConsultaNotasFiscaisDEST_XBAIRRO: TStringField
      FieldName = 'DEST_XBAIRRO'
      Size = 60
    end
    object cliConsultaNotasFiscaisDEST_CMUN: TStringField
      FieldName = 'DEST_CMUN'
      Size = 7
    end
    object cliConsultaNotasFiscaisDEST_XMUN: TStringField
      FieldName = 'DEST_XMUN'
      Size = 60
    end
    object cliConsultaNotasFiscaisDEST_UF: TStringField
      FieldName = 'DEST_UF'
      Size = 2
    end
    object cliConsultaNotasFiscaisDEST_CEP: TStringField
      FieldName = 'DEST_CEP'
      Size = 8
    end
    object cliConsultaNotasFiscaisDEST_CPAIS: TLargeintField
      FieldName = 'DEST_CPAIS'
    end
    object cliConsultaNotasFiscaisDEST_XPAIS: TStringField
      FieldName = 'DEST_XPAIS'
      Size = 60
    end
    object cliConsultaNotasFiscaisDEST_FONE: TStringField
      FieldName = 'DEST_FONE'
      Size = 14
    end
    object cliConsultaNotasFiscaisDEST_INDIEDEST: TLargeintField
      FieldName = 'DEST_INDIEDEST'
    end
    object cliConsultaNotasFiscaisDEST_IE: TStringField
      FieldName = 'DEST_IE'
      Size = 14
    end
    object cliConsultaNotasFiscaisDEST_EMAIL: TStringField
      FieldName = 'DEST_EMAIL'
      Size = 60
    end
    object cliConsultaNotasFiscaisVBC: TFMTBCDField
      FieldName = 'VBC'
      Precision = 18
      Size = 2
    end
    object cliConsultaNotasFiscaisVICMS: TFMTBCDField
      FieldName = 'VICMS'
      Precision = 18
      Size = 2
    end
    object cliConsultaNotasFiscaisVICMSDESON: TFMTBCDField
      FieldName = 'VICMSDESON'
      Precision = 18
      Size = 2
    end
    object cliConsultaNotasFiscaisVBCST: TFMTBCDField
      FieldName = 'VBCST'
      Precision = 18
      Size = 2
    end
    object cliConsultaNotasFiscaisVST: TFMTBCDField
      FieldName = 'VST'
      Precision = 18
      Size = 2
    end
    object cliConsultaNotasFiscaisVPROD: TFMTBCDField
      FieldName = 'VPROD'
      Precision = 18
      Size = 2
    end
    object cliConsultaNotasFiscaisVFRETE: TFMTBCDField
      FieldName = 'VFRETE'
      Precision = 18
      Size = 2
    end
    object cliConsultaNotasFiscaisVSEG: TFMTBCDField
      FieldName = 'VSEG'
      Precision = 18
      Size = 2
    end
    object cliConsultaNotasFiscaisVDESC: TFMTBCDField
      FieldName = 'VDESC'
      Precision = 18
      Size = 2
    end
    object cliConsultaNotasFiscaisVII: TFMTBCDField
      FieldName = 'VII'
      Precision = 18
      Size = 2
    end
    object cliConsultaNotasFiscaisVIPI: TFMTBCDField
      FieldName = 'VIPI'
      Precision = 18
      Size = 2
    end
    object cliConsultaNotasFiscaisVPIS: TFMTBCDField
      FieldName = 'VPIS'
      Precision = 18
      Size = 2
    end
    object cliConsultaNotasFiscaisVCOFINS: TFMTBCDField
      FieldName = 'VCOFINS'
      Precision = 18
      Size = 2
    end
    object cliConsultaNotasFiscaisVOUTRO: TFMTBCDField
      FieldName = 'VOUTRO'
      Precision = 18
      Size = 2
    end
    object cliConsultaNotasFiscaisVNF: TFMTBCDField
      FieldName = 'VNF'
      OnGetText = cliConsultaNotasFiscaisVNFGetText
      Precision = 18
      Size = 2
    end
    object cliConsultaNotasFiscaisVTOTTRIB: TFMTBCDField
      FieldName = 'VTOTTRIB'
      Precision = 18
      Size = 2
    end
    object cliConsultaNotasFiscaisMODFRETE: TLargeintField
      FieldName = 'MODFRETE'
    end
    object cliConsultaNotasFiscaisID_TRANSP: TLargeintField
      FieldName = 'ID_TRANSP'
    end
    object cliConsultaNotasFiscaisTRANSP_CNPJ_CPF: TStringField
      FieldName = 'TRANSP_CNPJ_CPF'
      Size = 14
    end
    object cliConsultaNotasFiscaisTRANSP_XNOME: TStringField
      FieldName = 'TRANSP_XNOME'
      Size = 60
    end
    object cliConsultaNotasFiscaisTRANSP_IE: TStringField
      FieldName = 'TRANSP_IE'
      Size = 14
    end
    object cliConsultaNotasFiscaisTRANSP_XENDER: TStringField
      FieldName = 'TRANSP_XENDER'
      Size = 60
    end
    object cliConsultaNotasFiscaisTRANSP_XMUN: TStringField
      FieldName = 'TRANSP_XMUN'
      Size = 60
    end
    object cliConsultaNotasFiscaisTRANSP_UF: TStringField
      FieldName = 'TRANSP_UF'
      Size = 2
    end
    object cliConsultaNotasFiscaisVEIC_PLACA: TStringField
      FieldName = 'VEIC_PLACA'
      Size = 10
    end
    object cliConsultaNotasFiscaisVEIC_UF: TStringField
      FieldName = 'VEIC_UF'
      Size = 2
    end
    object cliConsultaNotasFiscaisVEIC_RNTC: TStringField
      FieldName = 'VEIC_RNTC'
    end
    object cliConsultaNotasFiscaisVOL_QVOL: TLargeintField
      FieldName = 'VOL_QVOL'
    end
    object cliConsultaNotasFiscaisVOL_ESP: TStringField
      FieldName = 'VOL_ESP'
      Size = 60
    end
    object cliConsultaNotasFiscaisVOL_MARCA: TStringField
      FieldName = 'VOL_MARCA'
      Size = 60
    end
    object cliConsultaNotasFiscaisVOL_NVOL: TStringField
      FieldName = 'VOL_NVOL'
      Size = 60
    end
    object cliConsultaNotasFiscaisVOL_PESOL: TFMTBCDField
      FieldName = 'VOL_PESOL'
      Precision = 18
      Size = 3
    end
    object cliConsultaNotasFiscaisVOL_PESOB: TFMTBCDField
      FieldName = 'VOL_PESOB'
      Precision = 18
      Size = 3
    end
    object cliConsultaNotasFiscaisINFADFISCO: TStringField
      FieldName = 'INFADFISCO'
      Size = 500
    end
    object cliConsultaNotasFiscaisINFCPL: TStringField
      FieldName = 'INFCPL'
      Size = 500
    end
    object cliConsultaNotasFiscaisREFNFE: TStringField
      FieldName = 'REFNFE'
      Size = 44
    end
    object cliConsultaNotasFiscaisEXPORTA_UFEMARQ: TStringField
      FieldName = 'EXPORTA_UFEMARQ'
      Size = 2
    end
    object cliConsultaNotasFiscaisEXPORTA_XLOCEMARQ: TStringField
      FieldName = 'EXPORTA_XLOCEMARQ'
      Size = 60
    end
    object cliConsultaNotasFiscaisCD_STATUS: TLargeintField
      FieldName = 'CD_STATUS'
    end
    object cliConsultaNotasFiscaisPROTOCOLO_AUTORIZACAO: TStringField
      FieldName = 'PROTOCOLO_AUTORIZACAO'
      Size = 30
    end
    object cliConsultaNotasFiscaisDT_AUTORIZACAO: TSQLTimeStampField
      FieldName = 'DT_AUTORIZACAO'
    end
    object cliConsultaNotasFiscaisMOTIVO_CANCELAMENTO: TStringField
      FieldName = 'MOTIVO_CANCELAMENTO'
      Size = 100
    end
    object cliConsultaNotasFiscaisPROTOCOLO_CANCELAMENTO: TStringField
      FieldName = 'PROTOCOLO_CANCELAMENTO'
      Size = 30
    end
    object cliConsultaNotasFiscaisDT_CANCELAMENTO: TSQLTimeStampField
      FieldName = 'DT_CANCELAMENTO'
    end
    object cliConsultaNotasFiscaisXML_APROVADO: TBlobField
      FieldName = 'XML_APROVADO'
      Size = 1
    end
    object cliConsultaNotasFiscaisXML_CANCELADO: TStringField
      FieldName = 'XML_CANCELADO'
      Size = 8000
    end
  end
  object uptAtualizaDadosNotaFiscalCancelamento: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftLargeint
        Name = 'PSTATUS'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PMOTIVO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PROTOCOLO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PXML'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PCHAVE'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'UPDATE NFE_CAB'
      '       SET CD_STATUS = :PSTATUS,'
      '              MOTIVO_CANCELAMENTO = :PMOTIVO,'
      '              PROTOCOLO_CANCELAMENTO = :PROTOCOLO,'
      '              DT_CANCELAMENTO = CURRENT_TIMESTAMP,'
      '              XML_CANCELADO = :PXML'
      ' WHERE CHAVE = :PCHAVE')
    SQLConnection = Conexao
    Left = 840
    Top = 200
  end
  object qryConfiguracao: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT *'
      '  FROM CONFIGURACAO')
    SQLConnection = Conexao
    Left = 528
    Top = 103
    object qryConfiguracaoNFCE_TOKEN_CSC: TStringField
      FieldName = 'NFCE_TOKEN_CSC'
      Size = 50
    end
    object qryConfiguracaoNFCE_TOKEN_ID: TStringField
      FieldName = 'NFCE_TOKEN_ID'
    end
    object qryConfiguracaoNFCE_SERIE: TLargeintField
      FieldName = 'NFCE_SERIE'
    end
    object qryConfiguracaoNFCE_NUMERO_EMITIDO: TLargeintField
      FieldName = 'NFCE_NUMERO_EMITIDO'
    end
    object qryConfiguracaoNFCE_AMBIENTE_EMISSAO: TIntegerField
      FieldName = 'NFCE_AMBIENTE_EMISSAO'
    end
    object qryConfiguracaoAPI_CONEXAO_TOKEN: TStringField
      FieldName = 'API_CONEXAO_TOKEN'
      Size = 50
    end
    object qryConfiguracaoCERTIFICADO_SERIE: TStringField
      FieldName = 'CERTIFICADO_SERIE'
      Size = 50
    end
    object qryConfiguracaoCERTIFICADO_SENHA: TStringField
      FieldName = 'CERTIFICADO_SENHA'
      Size = 50
    end
    object qryConfiguracaoREGISTRO_EMITENTE: TLargeintField
      FieldName = 'REGISTRO_EMITENTE'
      Required = True
    end
  end
  object dspConfiguracao: TDataSetProvider
    DataSet = qryConfiguracao
    Left = 528
    Top = 168
  end
  object cliConfiguracao: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspConfiguracao'
    Left = 527
    Top = 231
    object cliConfiguracaoNFCE_TOKEN_CSC: TStringField
      FieldName = 'NFCE_TOKEN_CSC'
      Size = 50
    end
    object cliConfiguracaoNFCE_TOKEN_ID: TStringField
      FieldName = 'NFCE_TOKEN_ID'
    end
    object cliConfiguracaoNFCE_SERIE: TLargeintField
      FieldName = 'NFCE_SERIE'
    end
    object cliConfiguracaoNFCE_NUMERO_EMITIDO: TLargeintField
      FieldName = 'NFCE_NUMERO_EMITIDO'
    end
    object cliConfiguracaoAPI_CONEXAO_TOKEN: TStringField
      FieldName = 'API_CONEXAO_TOKEN'
      Size = 50
    end
    object cliConfiguracaoREGISTRO_EMITENTE: TLargeintField
      FieldName = 'REGISTRO_EMITENTE'
      Required = True
    end
    object cliConfiguracaoCERTIFICADO_SERIE: TStringField
      FieldName = 'CERTIFICADO_SERIE'
      Size = 50
    end
    object cliConfiguracaoCERTIFICADO_SENHA: TStringField
      FieldName = 'CERTIFICADO_SENHA'
      Size = 50
    end
    object cliConfiguracaoNFCE_AMBIENTE_EMISSAO: TIntegerField
      FieldName = 'NFCE_AMBIENTE_EMISSAO'
    end
  end
  object uptAtualizaUltimaNFCe: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftLargeint
        Name = 'PEMITENTE'
        ParamType = ptInput
      end
      item
        DataType = ftLargeint
        Name = 'PSERIE'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'UPDATE CONFIGURACAO'
      '       SET NFCE_NUMERO_EMITIDO = (NFCE_NUMERO_EMITIDO + 1)'
      ' WHERE REGISTRO_EMITENTE = :PEMITENTE'
      '      AND NFCE_SERIE = :PSERIE')
    SQLConnection = Conexao
    Left = 992
    Top = 2
  end
  object delClientes: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftLargeint
        Name = 'PEMITENTE'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'DELETE '
      '  FROM CLIENTE'
      'WHERE REGISTRO_EMIT = :PEMITENTE')
    SQLConnection = Conexao
    Left = 840
    Top = 248
  end
  object delFuncionarios: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'PEMITENTE'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'DELETE '
      '  FROM FUNCIONARIOS'
      'WHERE REGISTRO_EMIT = :PEMITENTE'
      '')
    SQLConnection = Conexao
    Left = 840
    Top = 296
  end
  object qryFuncionarios: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'PEMITENTE'
        ParamType = ptInput
      end>
    SQL.Strings = (
      '    SELECT *'
      '      FROM FUNCIONARIOS'
      '    WHERE REGISTRO_EMIT = :PEMITENTE'
      'ORDER BY NOME_FUNCIONARIO')
    SQLConnection = Conexao
    Left = 162
    Top = 97
    object qryFuncionariosID_FUNCIONARIO: TLargeintField
      FieldName = 'ID_FUNCIONARIO'
      Required = True
    end
    object qryFuncionariosREGISTRO_EMIT: TLargeintField
      FieldName = 'REGISTRO_EMIT'
    end
    object qryFuncionariosNOME_FUNCIONARIO: TStringField
      FieldName = 'NOME_FUNCIONARIO'
      Size = 60
    end
    object qryFuncionariosCARGO: TStringField
      FieldName = 'CARGO'
      Size = 40
    end
    object qryFuncionariosCPF: TStringField
      FieldName = 'CPF'
      Size = 30
    end
    object qryFuncionariosRG: TStringField
      FieldName = 'RG'
      Size = 30
    end
    object qryFuncionariosCTPS: TStringField
      FieldName = 'CTPS'
    end
    object qryFuncionariosDATA_NASCIMENTO: TDateField
      FieldName = 'DATA_NASCIMENTO'
    end
    object qryFuncionariosCEP: TStringField
      FieldName = 'CEP'
      Size = 10
    end
    object qryFuncionariosENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 60
    end
    object qryFuncionariosBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Size = 30
    end
    object qryFuncionariosCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 40
    end
    object qryFuncionariosESTADO: TStringField
      FieldName = 'ESTADO'
      Size = 10
    end
    object qryFuncionariosTELEFONE: TStringField
      FieldName = 'TELEFONE'
    end
    object qryFuncionariosCELULAR: TStringField
      FieldName = 'CELULAR'
    end
    object qryFuncionariosDATA_ADMISSAO: TDateField
      FieldName = 'DATA_ADMISSAO'
    end
    object qryFuncionariosDATA_DEMISSAO: TDateField
      FieldName = 'DATA_DEMISSAO'
    end
    object qryFuncionariosNATURALIDADE: TStringField
      FieldName = 'NATURALIDADE'
      Size = 60
    end
    object qryFuncionariosNOME_PAI: TStringField
      FieldName = 'NOME_PAI'
      Size = 60
    end
    object qryFuncionariosNOME_MAE: TStringField
      FieldName = 'NOME_MAE'
      Size = 60
    end
    object qryFuncionariosOS: TLargeintField
      FieldName = 'OS'
    end
    object qryFuncionariosVENDA: TLargeintField
      FieldName = 'VENDA'
    end
  end
  object dspFuncionarios: TDataSetProvider
    DataSet = qryFuncionarios
    Left = 162
    Top = 153
  end
  object cliFuncionarios: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspFuncionarios'
    Left = 162
    Top = 233
    object cliFuncionariosID_FUNCIONARIO: TLargeintField
      FieldName = 'ID_FUNCIONARIO'
      Required = True
    end
    object cliFuncionariosREGISTRO_EMIT: TLargeintField
      FieldName = 'REGISTRO_EMIT'
    end
    object cliFuncionariosNOME_FUNCIONARIO: TStringField
      FieldName = 'NOME_FUNCIONARIO'
      Size = 60
    end
    object cliFuncionariosCARGO: TStringField
      FieldName = 'CARGO'
      Size = 40
    end
    object cliFuncionariosCPF: TStringField
      FieldName = 'CPF'
      Size = 30
    end
    object cliFuncionariosRG: TStringField
      FieldName = 'RG'
      Size = 30
    end
    object cliFuncionariosCTPS: TStringField
      FieldName = 'CTPS'
    end
    object cliFuncionariosDATA_NASCIMENTO: TDateField
      FieldName = 'DATA_NASCIMENTO'
    end
    object cliFuncionariosCEP: TStringField
      FieldName = 'CEP'
      Size = 10
    end
    object cliFuncionariosENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 60
    end
    object cliFuncionariosBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Size = 30
    end
    object cliFuncionariosCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 40
    end
    object cliFuncionariosESTADO: TStringField
      FieldName = 'ESTADO'
      Size = 10
    end
    object cliFuncionariosTELEFONE: TStringField
      FieldName = 'TELEFONE'
    end
    object cliFuncionariosCELULAR: TStringField
      FieldName = 'CELULAR'
    end
    object cliFuncionariosDATA_ADMISSAO: TDateField
      FieldName = 'DATA_ADMISSAO'
    end
    object cliFuncionariosDATA_DEMISSAO: TDateField
      FieldName = 'DATA_DEMISSAO'
    end
    object cliFuncionariosNATURALIDADE: TStringField
      FieldName = 'NATURALIDADE'
      Size = 60
    end
    object cliFuncionariosNOME_PAI: TStringField
      FieldName = 'NOME_PAI'
      Size = 60
    end
    object cliFuncionariosNOME_MAE: TStringField
      FieldName = 'NOME_MAE'
      Size = 60
    end
    object cliFuncionariosOS: TLargeintField
      FieldName = 'OS'
    end
    object cliFuncionariosVENDA: TLargeintField
      FieldName = 'VENDA'
    end
  end
  object delEstoques: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'PEMITENTE'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'DELETE '
      '  FROM ESTOQUE'
      'WHERE REGISTRO_EMIT = :PEMITENTE')
    SQLConnection = Conexao
    Left = 840
    Top = 350
  end
  object delPagamentosAposCancelar: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'PCHAVE'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'DELETE '
      '  FROM NFE_PAGAMENTO'
      'WHERE ID_NFE = (SELECT ID_NFE'
      '                                 FROM NFE_CAB'
      '                               WHERE CHAVE = :PCHAVE)')
    SQLConnection = Conexao
    Left = 712
    Top = 296
  end
  object qryNfeIntegracaoApi: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'PREGISTRO_EMITENTE'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'PID_NFE'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT *'
      '  FROM NFE_INTEGRACAO_API'
      'WHERE REGISTRO_EMITENTE = :PREGISTRO_EMITENTE'
      '     AND ID_NFE = :PID_NFE')
    SQLConnection = Conexao
    Left = 56
    Top = 280
  end
  object dspNfeIntegracaoApi: TDataSetProvider
    DataSet = qryNfeIntegracaoApi
    Left = 56
    Top = 328
  end
  object cliNfeIntegracaoApi: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspNfeIntegracaoApi'
    Left = 48
    Top = 384
    object cliNfeIntegracaoApiREGISTRO_EMITENTE: TLargeintField
      FieldName = 'REGISTRO_EMITENTE'
      Required = True
    end
    object cliNfeIntegracaoApiID_NFE: TLargeintField
      FieldName = 'ID_NFE'
      Required = True
    end
    object cliNfeIntegracaoApiSTATUS: TIntegerField
      FieldName = 'STATUS'
      Required = True
    end
    object cliNfeIntegracaoApiDATA_HORA_INTEGRACAO: TSQLTimeStampField
      FieldName = 'DATA_HORA_INTEGRACAO'
      Required = True
    end
    object cliNfeIntegracaoApiMENSAGEM: TStringField
      FieldName = 'MENSAGEM'
      Size = 255
    end
  end
  object qryConsultaNotasEnviarApi: TSQLQuery
    MaxBlobSize = 1
    Params = <
      item
        DataType = ftLargeint
        Name = 'PREGISTRO_EMITENTE'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PDATA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PDATA'
        ParamType = ptInput
      end
      item
        DataType = ftLargeint
        Name = 'PREGISTRO_EMITENTE'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PDATA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PDATA'
        ParamType = ptInput
      end
      item
        DataType = ftLargeint
        Name = 'PREGISTRO_EMITENTE'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT NEWTABLE.*'
      '  FROM (SELECT *                                          '
      '                FROM NFE_CAB                                    '
      '              WHERE REGISTRO_EMIT = :PREGISTRO_EMITENTE'
      
        '                   AND ((CD_STATUS IN (100, 150, 128, 135) AND (' +
        'IDE_TPEMIS = 1)) OR ((CD_STATUS = 0) AND (IDE_TPEMIS = 9)))'
      
        '                   AND IDE_MOD = 65                             ' +
        '  '
      
        '                   AND (CAST(IDE_DHEMI AS DATE) BETWEEN :PDATA A' +
        'ND :PDATA)'
      
        '               UNION ALL                                        ' +
        '  '
      '              SELECT *                                          '
      '                FROM NFE_CAB                                    '
      '              WHERE REGISTRO_EMIT = :PREGISTRO_EMITENTE'
      
        '                   AND IDE_MOD = 90                             ' +
        '  '
      
        '                   AND (CAST(IDE_DHEMI AS DATE) BETWEEN :PDATA A' +
        'ND :PDATA)'
      '                   AND (XML_APROVADO <> '#39#39')'
      ') AS NEWTABLE'
      'WHERE NEWTABLE.ID_NFE NOT IN (SELECT ID_NFE'
      
        '                                                             FRO' +
        'M NFE_INTEGRACAO_API'
      
        '                                                           WHERE' +
        ' REGISTRO_EMITENTE = :PREGISTRO_EMITENTE) '
      'ORDER BY IDE_NNF')
    SQLConnection = Conexao
    Left = 176
    Top = 288
  end
  object dspConsultaNotasEnviarApi: TDataSetProvider
    DataSet = qryConsultaNotasEnviarApi
    Left = 176
    Top = 344
  end
  object cliConsultaNotasEnviarApi: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspConsultaNotasEnviarApi'
    Left = 176
    Top = 400
    object cliConsultaNotasEnviarApiID_NFE: TLargeintField
      FieldName = 'ID_NFE'
      Required = True
    end
    object cliConsultaNotasEnviarApiREGISTRO_EMIT: TLargeintField
      FieldName = 'REGISTRO_EMIT'
    end
    object cliConsultaNotasEnviarApiID_VENDEDOR: TLargeintField
      FieldName = 'ID_VENDEDOR'
    end
    object cliConsultaNotasEnviarApiCHAVE: TStringField
      FieldName = 'CHAVE'
      Size = 44
    end
    object cliConsultaNotasEnviarApiIDE_CUF: TLargeintField
      FieldName = 'IDE_CUF'
    end
    object cliConsultaNotasEnviarApiIDE_NATOP: TStringField
      FieldName = 'IDE_NATOP'
      Size = 60
    end
    object cliConsultaNotasEnviarApiIDE_MOD: TLargeintField
      FieldName = 'IDE_MOD'
    end
    object cliConsultaNotasEnviarApiIDE_SERIE: TLargeintField
      FieldName = 'IDE_SERIE'
    end
    object cliConsultaNotasEnviarApiIDE_NNF: TLargeintField
      FieldName = 'IDE_NNF'
    end
    object cliConsultaNotasEnviarApiIDE_DHEMI: TSQLTimeStampField
      FieldName = 'IDE_DHEMI'
    end
    object cliConsultaNotasEnviarApiIDE_DHSAIENT: TSQLTimeStampField
      FieldName = 'IDE_DHSAIENT'
    end
    object cliConsultaNotasEnviarApiIDE_TPNF: TStringField
      FieldName = 'IDE_TPNF'
      Size = 2
    end
    object cliConsultaNotasEnviarApiIDE_IDDEST: TLargeintField
      FieldName = 'IDE_IDDEST'
    end
    object cliConsultaNotasEnviarApiIDE_CMUNFG: TStringField
      FieldName = 'IDE_CMUNFG'
      Size = 7
    end
    object cliConsultaNotasEnviarApiIDE_TP_IMP: TLargeintField
      FieldName = 'IDE_TP_IMP'
    end
    object cliConsultaNotasEnviarApiIDE_TPEMIS: TStringField
      FieldName = 'IDE_TPEMIS'
      Size = 45
    end
    object cliConsultaNotasEnviarApiIDE_TPAMB: TLargeintField
      FieldName = 'IDE_TPAMB'
    end
    object cliConsultaNotasEnviarApiIDE_FINNFE: TLargeintField
      FieldName = 'IDE_FINNFE'
    end
    object cliConsultaNotasEnviarApiIDE_INDFINAL: TLargeintField
      FieldName = 'IDE_INDFINAL'
    end
    object cliConsultaNotasEnviarApiIDE_INDPRES: TLargeintField
      FieldName = 'IDE_INDPRES'
    end
    object cliConsultaNotasEnviarApiIDE_PROCEMI: TLargeintField
      FieldName = 'IDE_PROCEMI'
    end
    object cliConsultaNotasEnviarApiIDE_VERPROC: TStringField
      FieldName = 'IDE_VERPROC'
    end
    object cliConsultaNotasEnviarApiEMIT_CNPJ_CPF: TStringField
      FieldName = 'EMIT_CNPJ_CPF'
    end
    object cliConsultaNotasEnviarApiEMIT_CPF: TStringField
      FieldName = 'EMIT_CPF'
      Size = 11
    end
    object cliConsultaNotasEnviarApiEMIT_XNOME: TStringField
      FieldName = 'EMIT_XNOME'
      Size = 60
    end
    object cliConsultaNotasEnviarApiEMIT_XFANT: TStringField
      FieldName = 'EMIT_XFANT'
      Size = 60
    end
    object cliConsultaNotasEnviarApiEMIT_XLGR: TStringField
      FieldName = 'EMIT_XLGR'
      Size = 60
    end
    object cliConsultaNotasEnviarApiEMIT_NRO: TStringField
      FieldName = 'EMIT_NRO'
      Size = 60
    end
    object cliConsultaNotasEnviarApiEMIT_XCPL: TStringField
      FieldName = 'EMIT_XCPL'
      Size = 60
    end
    object cliConsultaNotasEnviarApiEMIT_XBAIRRO: TStringField
      FieldName = 'EMIT_XBAIRRO'
      Size = 60
    end
    object cliConsultaNotasEnviarApiEMIT_CMUN: TStringField
      FieldName = 'EMIT_CMUN'
      Size = 7
    end
    object cliConsultaNotasEnviarApiEMIT_XMUN: TStringField
      FieldName = 'EMIT_XMUN'
      Size = 60
    end
    object cliConsultaNotasEnviarApiEMIT_UF: TStringField
      FieldName = 'EMIT_UF'
      Size = 2
    end
    object cliConsultaNotasEnviarApiEMIT_CEP: TStringField
      FieldName = 'EMIT_CEP'
      Size = 8
    end
    object cliConsultaNotasEnviarApiEMIT_CPAIS: TLargeintField
      FieldName = 'EMIT_CPAIS'
    end
    object cliConsultaNotasEnviarApiEMIT_XPAIS: TStringField
      FieldName = 'EMIT_XPAIS'
      Size = 60
    end
    object cliConsultaNotasEnviarApiEMIT_FONE: TStringField
      FieldName = 'EMIT_FONE'
      Size = 14
    end
    object cliConsultaNotasEnviarApiEMIT_IE: TStringField
      FieldName = 'EMIT_IE'
      Size = 14
    end
    object cliConsultaNotasEnviarApiEMIT_IM: TStringField
      FieldName = 'EMIT_IM'
      Size = 15
    end
    object cliConsultaNotasEnviarApiEMIT_CNAE: TStringField
      FieldName = 'EMIT_CNAE'
      Size = 7
    end
    object cliConsultaNotasEnviarApiEMIT_CRT: TStringField
      FieldName = 'EMIT_CRT'
      Size = 45
    end
    object cliConsultaNotasEnviarApiID_CLIENTE: TLargeintField
      FieldName = 'ID_CLIENTE'
    end
    object cliConsultaNotasEnviarApiDEST_CNPJ_CPF: TStringField
      FieldName = 'DEST_CNPJ_CPF'
    end
    object cliConsultaNotasEnviarApiDEST_IDESTRANGEIRO: TStringField
      FieldName = 'DEST_IDESTRANGEIRO'
    end
    object cliConsultaNotasEnviarApiDEST_XNOME: TStringField
      FieldName = 'DEST_XNOME'
      Size = 60
    end
    object cliConsultaNotasEnviarApiDEST_XLGR: TStringField
      FieldName = 'DEST_XLGR'
      Size = 60
    end
    object cliConsultaNotasEnviarApiDEST_NRO: TStringField
      FieldName = 'DEST_NRO'
      Size = 60
    end
    object cliConsultaNotasEnviarApiDEST_XCPL: TStringField
      FieldName = 'DEST_XCPL'
      Size = 60
    end
    object cliConsultaNotasEnviarApiDEST_XBAIRRO: TStringField
      FieldName = 'DEST_XBAIRRO'
      Size = 60
    end
    object cliConsultaNotasEnviarApiDEST_CMUN: TStringField
      FieldName = 'DEST_CMUN'
      Size = 7
    end
    object cliConsultaNotasEnviarApiDEST_XMUN: TStringField
      FieldName = 'DEST_XMUN'
      Size = 60
    end
    object cliConsultaNotasEnviarApiDEST_UF: TStringField
      FieldName = 'DEST_UF'
      Size = 2
    end
    object cliConsultaNotasEnviarApiDEST_CEP: TStringField
      FieldName = 'DEST_CEP'
      Size = 8
    end
    object cliConsultaNotasEnviarApiDEST_CPAIS: TLargeintField
      FieldName = 'DEST_CPAIS'
    end
    object cliConsultaNotasEnviarApiDEST_XPAIS: TStringField
      FieldName = 'DEST_XPAIS'
      Size = 60
    end
    object cliConsultaNotasEnviarApiDEST_FONE: TStringField
      FieldName = 'DEST_FONE'
      Size = 14
    end
    object cliConsultaNotasEnviarApiDEST_INDIEDEST: TLargeintField
      FieldName = 'DEST_INDIEDEST'
    end
    object cliConsultaNotasEnviarApiDEST_IE: TStringField
      FieldName = 'DEST_IE'
      Size = 14
    end
    object cliConsultaNotasEnviarApiDEST_EMAIL: TStringField
      FieldName = 'DEST_EMAIL'
      Size = 60
    end
    object cliConsultaNotasEnviarApiVBC: TFMTBCDField
      FieldName = 'VBC'
      Precision = 18
      Size = 2
    end
    object cliConsultaNotasEnviarApiVICMS: TFMTBCDField
      FieldName = 'VICMS'
      Precision = 18
      Size = 2
    end
    object cliConsultaNotasEnviarApiVICMSDESON: TFMTBCDField
      FieldName = 'VICMSDESON'
      Precision = 18
      Size = 2
    end
    object cliConsultaNotasEnviarApiVBCST: TFMTBCDField
      FieldName = 'VBCST'
      Precision = 18
      Size = 2
    end
    object cliConsultaNotasEnviarApiVST: TFMTBCDField
      FieldName = 'VST'
      Precision = 18
      Size = 2
    end
    object cliConsultaNotasEnviarApiVPROD: TFMTBCDField
      FieldName = 'VPROD'
      Precision = 18
      Size = 2
    end
    object cliConsultaNotasEnviarApiVFRETE: TFMTBCDField
      FieldName = 'VFRETE'
      Precision = 18
      Size = 2
    end
    object cliConsultaNotasEnviarApiVSEG: TFMTBCDField
      FieldName = 'VSEG'
      Precision = 18
      Size = 2
    end
    object cliConsultaNotasEnviarApiVDESC: TFMTBCDField
      FieldName = 'VDESC'
      Precision = 18
      Size = 2
    end
    object cliConsultaNotasEnviarApiVII: TFMTBCDField
      FieldName = 'VII'
      Precision = 18
      Size = 2
    end
    object cliConsultaNotasEnviarApiVIPI: TFMTBCDField
      FieldName = 'VIPI'
      Precision = 18
      Size = 2
    end
    object cliConsultaNotasEnviarApiVPIS: TFMTBCDField
      FieldName = 'VPIS'
      Precision = 18
      Size = 2
    end
    object cliConsultaNotasEnviarApiVCOFINS: TFMTBCDField
      FieldName = 'VCOFINS'
      Precision = 18
      Size = 2
    end
    object cliConsultaNotasEnviarApiVOUTRO: TFMTBCDField
      FieldName = 'VOUTRO'
      Precision = 18
      Size = 2
    end
    object cliConsultaNotasEnviarApiVNF: TFMTBCDField
      FieldName = 'VNF'
      OnGetText = cliConsultaNotasEnviarApiVNFGetText
      Precision = 18
      Size = 2
    end
    object cliConsultaNotasEnviarApiVTOTTRIB: TFMTBCDField
      FieldName = 'VTOTTRIB'
      Precision = 18
      Size = 2
    end
    object cliConsultaNotasEnviarApiMODFRETE: TLargeintField
      FieldName = 'MODFRETE'
    end
    object cliConsultaNotasEnviarApiID_TRANSP: TLargeintField
      FieldName = 'ID_TRANSP'
    end
    object cliConsultaNotasEnviarApiTRANSP_CNPJ_CPF: TStringField
      FieldName = 'TRANSP_CNPJ_CPF'
      Size = 14
    end
    object cliConsultaNotasEnviarApiTRANSP_XNOME: TStringField
      FieldName = 'TRANSP_XNOME'
      Size = 60
    end
    object cliConsultaNotasEnviarApiTRANSP_IE: TStringField
      FieldName = 'TRANSP_IE'
      Size = 14
    end
    object cliConsultaNotasEnviarApiTRANSP_XENDER: TStringField
      FieldName = 'TRANSP_XENDER'
      Size = 60
    end
    object cliConsultaNotasEnviarApiTRANSP_XMUN: TStringField
      FieldName = 'TRANSP_XMUN'
      Size = 60
    end
    object cliConsultaNotasEnviarApiTRANSP_UF: TStringField
      FieldName = 'TRANSP_UF'
      Size = 2
    end
    object cliConsultaNotasEnviarApiVEIC_PLACA: TStringField
      FieldName = 'VEIC_PLACA'
      Size = 10
    end
    object cliConsultaNotasEnviarApiVEIC_UF: TStringField
      FieldName = 'VEIC_UF'
      Size = 2
    end
    object cliConsultaNotasEnviarApiVEIC_RNTC: TStringField
      FieldName = 'VEIC_RNTC'
    end
    object cliConsultaNotasEnviarApiVOL_QVOL: TLargeintField
      FieldName = 'VOL_QVOL'
    end
    object cliConsultaNotasEnviarApiVOL_ESP: TStringField
      FieldName = 'VOL_ESP'
      Size = 60
    end
    object cliConsultaNotasEnviarApiVOL_MARCA: TStringField
      FieldName = 'VOL_MARCA'
      Size = 60
    end
    object cliConsultaNotasEnviarApiVOL_NVOL: TStringField
      FieldName = 'VOL_NVOL'
      Size = 60
    end
    object cliConsultaNotasEnviarApiVOL_PESOL: TFMTBCDField
      FieldName = 'VOL_PESOL'
      Precision = 18
      Size = 3
    end
    object cliConsultaNotasEnviarApiVOL_PESOB: TFMTBCDField
      FieldName = 'VOL_PESOB'
      Precision = 18
      Size = 3
    end
    object cliConsultaNotasEnviarApiINFADFISCO: TStringField
      FieldName = 'INFADFISCO'
      Size = 500
    end
    object cliConsultaNotasEnviarApiINFCPL: TStringField
      FieldName = 'INFCPL'
      Size = 500
    end
    object cliConsultaNotasEnviarApiREFNFE: TStringField
      FieldName = 'REFNFE'
      Size = 44
    end
    object cliConsultaNotasEnviarApiEXPORTA_UFEMARQ: TStringField
      FieldName = 'EXPORTA_UFEMARQ'
      Size = 2
    end
    object cliConsultaNotasEnviarApiEXPORTA_XLOCEMARQ: TStringField
      FieldName = 'EXPORTA_XLOCEMARQ'
      Size = 60
    end
    object cliConsultaNotasEnviarApiCD_STATUS: TLargeintField
      FieldName = 'CD_STATUS'
    end
    object cliConsultaNotasEnviarApiPROTOCOLO_AUTORIZACAO: TStringField
      FieldName = 'PROTOCOLO_AUTORIZACAO'
      Size = 30
    end
    object cliConsultaNotasEnviarApiDT_AUTORIZACAO: TSQLTimeStampField
      FieldName = 'DT_AUTORIZACAO'
    end
    object cliConsultaNotasEnviarApiMOTIVO_CANCELAMENTO: TStringField
      FieldName = 'MOTIVO_CANCELAMENTO'
      Size = 100
    end
    object cliConsultaNotasEnviarApiPROTOCOLO_CANCELAMENTO: TStringField
      FieldName = 'PROTOCOLO_CANCELAMENTO'
      Size = 30
    end
    object cliConsultaNotasEnviarApiDT_CANCELAMENTO: TSQLTimeStampField
      FieldName = 'DT_CANCELAMENTO'
    end
    object cliConsultaNotasEnviarApiXML_APROVADO: TBlobField
      FieldName = 'XML_APROVADO'
      Size = 1
    end
    object cliConsultaNotasEnviarApiXML_CANCELADO: TStringField
      FieldName = 'XML_CANCELADO'
      Size = 8000
    end
  end
  object qryInserirNotaIntegradaAPI: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftLargeint
        Name = 'PREGISTRO_EMITENTE'
        ParamType = ptInput
      end
      item
        DataType = ftLargeint
        Name = 'PID_NFE'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'INSERT INTO NFE_INTEGRACAO_API'
      
        '     VALUES(:PREGISTRO_EMITENTE, :PID_NFE, 1, CURRENT_TIMESTAMP,' +
        ' '#39'Integrado com Sucesso'#39')')
    SQLConnection = Conexao
    Left = 1008
    Top = 152
  end
  object qryConsultaFormaPagamentoEnvioAPI: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftLargeint
        Name = 'PIDNFE'
        ParamType = ptInput
      end
      item
        DataType = ftLargeint
        Name = 'PREGISTROEMIT'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PINDPAGAMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PVPAGAMENTO'
        ParamType = ptInput
      end>
    SQL.Strings = (
      '   select *'
      '     from nfe_pagamento'
      '  where id_nfe = :PIDNFE'
      '      and registro_emit = :PREGISTROEMIT'
      '      and tpag = :PINDPAGAMENTO'
      '      and vpag = :PVPAGAMENTO')
    SQLConnection = Conexao
    Left = 384
    Top = 288
  end
  object dspConsultaFormaPagamentoEnvioAPI: TDataSetProvider
    DataSet = qryConsultaFormaPagamentoEnvioAPI
    Left = 384
    Top = 344
  end
  object cliConsultaFormaPagamentoEnvioAPI: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspConsultaFormaPagamentoEnvioAPI'
    Left = 384
    Top = 400
    object cliConsultaFormaPagamentoEnvioAPIID_NFE_PAG: TLargeintField
      FieldName = 'ID_NFE_PAG'
      Required = True
    end
    object cliConsultaFormaPagamentoEnvioAPIID_NFE: TLargeintField
      FieldName = 'ID_NFE'
    end
    object cliConsultaFormaPagamentoEnvioAPIREGISTRO_EMIT: TLargeintField
      FieldName = 'REGISTRO_EMIT'
    end
    object cliConsultaFormaPagamentoEnvioAPITPAG: TStringField
      FieldName = 'TPAG'
      Size = 11
    end
    object cliConsultaFormaPagamentoEnvioAPIVPAG: TFMTBCDField
      FieldName = 'VPAG'
      Precision = 18
      Size = 2
    end
    object cliConsultaFormaPagamentoEnvioAPIVTROCO: TFMTBCDField
      FieldName = 'VTROCO'
      Precision = 18
      Size = 2
    end
    object cliConsultaFormaPagamentoEnvioAPIINDPAG: TLargeintField
      FieldName = 'INDPAG'
    end
    object cliConsultaFormaPagamentoEnvioAPICNPJ_ADM: TStringField
      FieldName = 'CNPJ_ADM'
    end
    object cliConsultaFormaPagamentoEnvioAPITBAND: TStringField
      FieldName = 'TBAND'
      Size = 2
    end
    object cliConsultaFormaPagamentoEnvioAPICAUT: TStringField
      FieldName = 'CAUT'
    end
    object cliConsultaFormaPagamentoEnvioAPICAIXA_N: TLargeintField
      FieldName = 'CAIXA_N'
    end
  end
end
