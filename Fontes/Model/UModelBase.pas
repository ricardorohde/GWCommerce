unit UModelBase;

interface

uses
  System.SysUtils, System.Classes, Data.DBXFirebird, Data.DB, Data.SqlExpr, System.StrUtils,
  Datasnap.DBClient, Data.FMTBcd, Datasnap.Provider, System.Math, ACBrNFeNotasFiscais,

  uLkJSON, System.Variants,

  pcnConversao, pcnConversaoNFe, pcnNFe, IdBaseComponent, IdCoder, IdCoder3to4,
  IdCoderMIME, UCliente;

type
  TdmDados = class(TDataModule)
    Conexao: TSQLConnection;
    cliEstoque: TClientDataSet;
    qryEstoque: TSQLQuery;
    dspEstoque: TDataSetProvider;
    qryEstoqueCODIGO_PRODUTO: TLargeintField;
    qryEstoqueCODIGO: TLargeintField;
    qryEstoqueREGISTRO_EMIT: TLargeintField;
    qryEstoqueDESCRICAO: TStringField;
    qryEstoqueFORNECEDOR: TLargeintField;
    qryEstoqueMEDIDA: TStringField;
    qryEstoquePRECO_VENDA: TFMTBCDField;
    qryEstoqueCUSTOCOMPRA: TFMTBCDField;
    qryEstoqueCUSTOMEDIO: TFMTBCDField;
    qryEstoqueQTD_COMPRA: TFMTBCDField;
    qryEstoqueQTD_ATUAL: TFMTBCDField;
    qryEstoqueQTD_MINIMA: TFMTBCDField;
    qryEstoqueQTD_INICIO: TFMTBCDField;
    qryEstoqueDATA_INICIO: TDateField;
    qryEstoqueULT_COMPRA: TDateField;
    qryEstoqueULT_VENDA: TDateField;
    qryEstoqueLOCAL: TStringField;
    qryEstoqueIPI: TFMTBCDField;
    qryEstoqueST: TStringField;
    qryEstoqueCOMISSAO: TFMTBCDField;
    qryEstoqueMARGEM_LUCRO: TFMTBCDField;
    qryEstoqueFOTO: TBlobField;
    qryEstoqueIAT: TStringField;
    qryEstoqueIPPT: TStringField;
    qryEstoqueCST_IPI: TStringField;
    qryEstoqueCODSELOIPI: TStringField;
    qryEstoqueCOD_ENQ_IPI: TStringField;
    qryEstoqueTIPO_ITEM: TStringField;
    qryEstoqueCSOSN: TStringField;
    qryEstoqueCODIGO_BARRAS: TStringField;
    qryEstoqueNCM: TStringField;
    qryEstoqueCEST: TStringField;
    qryEstoqueIBPT_F: TFMTBCDField;
    qryEstoqueIBPT_FI: TFMTBCDField;
    qryEstoqueIBPT_EST: TFMTBCDField;
    qryEstoqueIBPT_MUN: TFMTBCDField;
    qryEstoqueORIGEM: TStringField;
    qryEstoqueGRUPO: TLargeintField;
    qryEstoqueMARCA: TLargeintField;
    qryEstoqueDESCONTO_MAXIMO: TFMTBCDField;
    qryEstoqueMVA: TFMTBCDField;
    qryEstoqueCFOP: TStringField;
    qryEstoqueCFOP_NFCE: TStringField;
    qryEstoqueINDESCALA: TStringField;
    qryEstoqueCNPJFAB: TStringField;
    qryEstoqueCODPIS: TStringField;
    qryEstoquePORCPIS: TFMTBCDField;
    qryEstoqueCODCOFINS: TStringField;
    qryEstoquePISCOFINS_ENT: TStringField;
    qryEstoquePORPIS_ENT: TFMTBCDField;
    qryEstoquePORCOFINS_ENT: TFMTBCDField;
    qryEstoquePORCOFINS: TFMTBCDField;
    qryEstoqueCOD_BENEFICIO: TStringField;
    qryEstoqueCPRODANP: TStringField;
    qryEstoqueDESCANP: TStringField;
    qryEstoqueVPART: TFMTBCDField;
    qryEstoquePGLP: TFMTBCDField;
    qryEstoquePGNN: TFMTBCDField;
    qryEstoquePGNI: TFMTBCDField;
    qryEstoqueCOD_ANVISA: TStringField;
    qryEstoqueVALIDADE: TStringField;
    cliEstoqueCODIGO_PRODUTO: TLargeintField;
    cliEstoqueCODIGO: TLargeintField;
    cliEstoqueREGISTRO_EMIT: TLargeintField;
    cliEstoqueDESCRICAO: TStringField;
    cliEstoqueFORNECEDOR: TLargeintField;
    cliEstoqueMEDIDA: TStringField;
    cliEstoquePRECO_VENDA: TFMTBCDField;
    cliEstoqueCUSTOCOMPRA: TFMTBCDField;
    cliEstoqueCUSTOMEDIO: TFMTBCDField;
    cliEstoqueQTD_COMPRA: TFMTBCDField;
    cliEstoqueQTD_ATUAL: TFMTBCDField;
    cliEstoqueQTD_MINIMA: TFMTBCDField;
    cliEstoqueQTD_INICIO: TFMTBCDField;
    cliEstoqueDATA_INICIO: TDateField;
    cliEstoqueULT_COMPRA: TDateField;
    cliEstoqueULT_VENDA: TDateField;
    cliEstoqueLOCAL: TStringField;
    cliEstoqueIPI: TFMTBCDField;
    cliEstoqueST: TStringField;
    cliEstoqueCOMISSAO: TFMTBCDField;
    cliEstoqueMARGEM_LUCRO: TFMTBCDField;
    cliEstoqueFOTO: TBlobField;
    cliEstoqueIAT: TStringField;
    cliEstoqueIPPT: TStringField;
    cliEstoqueCST_IPI: TStringField;
    cliEstoqueCODSELOIPI: TStringField;
    cliEstoqueCOD_ENQ_IPI: TStringField;
    cliEstoqueTIPO_ITEM: TStringField;
    cliEstoqueCSOSN: TStringField;
    cliEstoqueCODIGO_BARRAS: TStringField;
    cliEstoqueNCM: TStringField;
    cliEstoqueCEST: TStringField;
    cliEstoqueIBPT_F: TFMTBCDField;
    cliEstoqueIBPT_FI: TFMTBCDField;
    cliEstoqueIBPT_EST: TFMTBCDField;
    cliEstoqueIBPT_MUN: TFMTBCDField;
    cliEstoqueORIGEM: TStringField;
    cliEstoqueGRUPO: TLargeintField;
    cliEstoqueMARCA: TLargeintField;
    cliEstoqueDESCONTO_MAXIMO: TFMTBCDField;
    cliEstoqueMVA: TFMTBCDField;
    cliEstoqueCFOP: TStringField;
    cliEstoqueCFOP_NFCE: TStringField;
    cliEstoqueINDESCALA: TStringField;
    cliEstoqueCNPJFAB: TStringField;
    cliEstoqueCODPIS: TStringField;
    cliEstoquePORCPIS: TFMTBCDField;
    cliEstoqueCODCOFINS: TStringField;
    cliEstoquePISCOFINS_ENT: TStringField;
    cliEstoquePORPIS_ENT: TFMTBCDField;
    cliEstoquePORCOFINS_ENT: TFMTBCDField;
    cliEstoquePORCOFINS: TFMTBCDField;
    cliEstoqueCOD_BENEFICIO: TStringField;
    cliEstoqueCPRODANP: TStringField;
    cliEstoqueDESCANP: TStringField;
    cliEstoqueVPART: TFMTBCDField;
    cliEstoquePGLP: TFMTBCDField;
    cliEstoquePGNN: TFMTBCDField;
    cliEstoquePGNI: TFMTBCDField;
    cliEstoqueCOD_ANVISA: TStringField;
    cliEstoqueVALIDADE: TStringField;
    qryVenda: TSQLQuery;
    dspVenda: TDataSetProvider;
    cliVenda: TClientDataSet;
    qryVendaCODIGO: TLargeintField;
    qryVendaCODIGO_PRODUTO: TLargeintField;
    qryVendaDESCRICAO_PRODUTO: TStringField;
    qryVendaVALOR_UNITARIO: TFMTBCDField;
    qryVendaQUANTIDADE: TFMTBCDField;
    qryVendaDESCONTO: TFMTBCDField;
    qryVendaDATA_HORA_VENDA: TSQLTimeStampField;
    cliVendaCODIGO: TLargeintField;
    cliVendaCODIGO_PRODUTO: TLargeintField;
    cliVendaDESCRICAO_PRODUTO: TStringField;
    cliVendaVALOR_UNITARIO: TFMTBCDField;
    cliVendaQUANTIDADE: TFMTBCDField;
    cliVendaDESCONTO: TFMTBCDField;
    cliVendaDATA_HORA_VENDA: TSQLTimeStampField;
    qryVendaMEDIDA: TStringField;
    cliVendaMEDIDA: TStringField;
    qryVendaMD5: TStringField;
    cliVendaMD5: TStringField;
    uptVenda: TSQLQuery;
    delVenda: TSQLQuery;
    qryVendaConsulta: TSQLQuery;
    qryVendaConsultaCODIGO: TLargeintField;
    qryVendaConsultaCODIGO_PRODUTO: TLargeintField;
    qryVendaConsultaDESCRICAO_PRODUTO: TStringField;
    qryVendaConsultaMEDIDA: TStringField;
    qryVendaConsultaVALOR_UNITARIO: TFMTBCDField;
    qryVendaConsultaQUANTIDADE: TFMTBCDField;
    qryVendaConsultaDESCONTO: TFMTBCDField;
    qryVendaConsultaDATA_HORA_VENDA: TSQLTimeStampField;
    qryVendaConsultaMD5: TStringField;
    qryNfeCab: TSQLQuery;
    qryNfeItens: TSQLQuery;
    qryNfePagamento: TSQLQuery;
    dspNfeCab: TDataSetProvider;
    dspNfeItens: TDataSetProvider;
    dspNfePagamento: TDataSetProvider;
    cliNfeCab: TClientDataSet;
    cliNfeItens: TClientDataSet;
    cliNfePagamento: TClientDataSet;
    qryNfeCabID_NFE: TLargeintField;
    qryNfeCabREGISTRO_EMIT: TLargeintField;
    qryNfeCabID_VENDEDOR: TLargeintField;
    qryNfeCabCHAVE: TStringField;
    qryNfeCabIDE_CUF: TLargeintField;
    qryNfeCabIDE_NATOP: TStringField;
    qryNfeCabIDE_MOD: TLargeintField;
    qryNfeCabIDE_SERIE: TLargeintField;
    qryNfeCabIDE_NNF: TLargeintField;
    qryNfeCabIDE_DHEMI: TSQLTimeStampField;
    qryNfeCabIDE_DHSAIENT: TSQLTimeStampField;
    qryNfeCabIDE_TPNF: TStringField;
    qryNfeCabIDE_IDDEST: TLargeintField;
    qryNfeCabIDE_CMUNFG: TStringField;
    qryNfeCabIDE_TP_IMP: TLargeintField;
    qryNfeCabIDE_TPEMIS: TStringField;
    qryNfeCabIDE_TPAMB: TLargeintField;
    qryNfeCabIDE_FINNFE: TLargeintField;
    qryNfeCabIDE_INDFINAL: TLargeintField;
    qryNfeCabIDE_INDPRES: TLargeintField;
    qryNfeCabIDE_PROCEMI: TLargeintField;
    qryNfeCabIDE_VERPROC: TStringField;
    qryNfeCabEMIT_CNPJ_CPF: TStringField;
    qryNfeCabEMIT_CPF: TStringField;
    qryNfeCabEMIT_XNOME: TStringField;
    qryNfeCabEMIT_XFANT: TStringField;
    qryNfeCabEMIT_XLGR: TStringField;
    qryNfeCabEMIT_NRO: TStringField;
    qryNfeCabEMIT_XCPL: TStringField;
    qryNfeCabEMIT_XBAIRRO: TStringField;
    qryNfeCabEMIT_CMUN: TStringField;
    qryNfeCabEMIT_XMUN: TStringField;
    qryNfeCabEMIT_UF: TStringField;
    qryNfeCabEMIT_CEP: TStringField;
    qryNfeCabEMIT_CPAIS: TLargeintField;
    qryNfeCabEMIT_XPAIS: TStringField;
    qryNfeCabEMIT_FONE: TStringField;
    qryNfeCabEMIT_IE: TStringField;
    qryNfeCabEMIT_IM: TStringField;
    qryNfeCabEMIT_CNAE: TStringField;
    qryNfeCabEMIT_CRT: TStringField;
    qryNfeCabID_CLIENTE: TLargeintField;
    qryNfeCabDEST_CNPJ_CPF: TStringField;
    qryNfeCabDEST_IDESTRANGEIRO: TStringField;
    qryNfeCabDEST_XNOME: TStringField;
    qryNfeCabDEST_XLGR: TStringField;
    qryNfeCabDEST_NRO: TStringField;
    qryNfeCabDEST_XCPL: TStringField;
    qryNfeCabDEST_XBAIRRO: TStringField;
    qryNfeCabDEST_CMUN: TStringField;
    qryNfeCabDEST_XMUN: TStringField;
    qryNfeCabDEST_UF: TStringField;
    qryNfeCabDEST_CEP: TStringField;
    qryNfeCabDEST_CPAIS: TLargeintField;
    qryNfeCabDEST_XPAIS: TStringField;
    qryNfeCabDEST_FONE: TStringField;
    qryNfeCabDEST_INDIEDEST: TLargeintField;
    qryNfeCabDEST_IE: TStringField;
    qryNfeCabDEST_EMAIL: TStringField;
    qryNfeCabVBC: TFMTBCDField;
    qryNfeCabVICMS: TFMTBCDField;
    qryNfeCabVICMSDESON: TFMTBCDField;
    qryNfeCabVBCST: TFMTBCDField;
    qryNfeCabVST: TFMTBCDField;
    qryNfeCabVPROD: TFMTBCDField;
    qryNfeCabVFRETE: TFMTBCDField;
    qryNfeCabVSEG: TFMTBCDField;
    qryNfeCabVDESC: TFMTBCDField;
    qryNfeCabVII: TFMTBCDField;
    qryNfeCabVIPI: TFMTBCDField;
    qryNfeCabVPIS: TFMTBCDField;
    qryNfeCabVCOFINS: TFMTBCDField;
    qryNfeCabVOUTRO: TFMTBCDField;
    qryNfeCabVNF: TFMTBCDField;
    qryNfeCabVTOTTRIB: TFMTBCDField;
    qryNfeCabMODFRETE: TLargeintField;
    qryNfeCabID_TRANSP: TLargeintField;
    qryNfeCabTRANSP_CNPJ_CPF: TStringField;
    qryNfeCabTRANSP_XNOME: TStringField;
    qryNfeCabTRANSP_IE: TStringField;
    qryNfeCabTRANSP_XENDER: TStringField;
    qryNfeCabTRANSP_XMUN: TStringField;
    qryNfeCabTRANSP_UF: TStringField;
    qryNfeCabVEIC_PLACA: TStringField;
    qryNfeCabVEIC_UF: TStringField;
    qryNfeCabVEIC_RNTC: TStringField;
    qryNfeCabVOL_QVOL: TLargeintField;
    qryNfeCabVOL_ESP: TStringField;
    qryNfeCabVOL_MARCA: TStringField;
    qryNfeCabVOL_NVOL: TStringField;
    qryNfeCabVOL_PESOL: TFMTBCDField;
    qryNfeCabVOL_PESOB: TFMTBCDField;
    qryNfeCabINFADFISCO: TStringField;
    qryNfeCabINFCPL: TStringField;
    qryNfeCabREFNFE: TStringField;
    qryNfeCabEXPORTA_UFEMARQ: TStringField;
    qryNfeCabEXPORTA_XLOCEMARQ: TStringField;
    qryNfeCabCD_STATUS: TLargeintField;
    qryNfeCabPROTOCOLO_AUTORIZACAO: TStringField;
    qryNfeCabDT_AUTORIZACAO: TSQLTimeStampField;
    qryNfeCabMOTIVO_CANCELAMENTO: TStringField;
    qryNfeCabPROTOCOLO_CANCELAMENTO: TStringField;
    qryNfeCabDT_CANCELAMENTO: TSQLTimeStampField;
    qryNfeCabXML_CANCELADO: TStringField;
    cliNfeCabID_NFE: TLargeintField;
    cliNfeCabREGISTRO_EMIT: TLargeintField;
    cliNfeCabID_VENDEDOR: TLargeintField;
    cliNfeCabCHAVE: TStringField;
    cliNfeCabIDE_CUF: TLargeintField;
    cliNfeCabIDE_NATOP: TStringField;
    cliNfeCabIDE_MOD: TLargeintField;
    cliNfeCabIDE_SERIE: TLargeintField;
    cliNfeCabIDE_NNF: TLargeintField;
    cliNfeCabIDE_DHEMI: TSQLTimeStampField;
    cliNfeCabIDE_DHSAIENT: TSQLTimeStampField;
    cliNfeCabIDE_TPNF: TStringField;
    cliNfeCabIDE_IDDEST: TLargeintField;
    cliNfeCabIDE_CMUNFG: TStringField;
    cliNfeCabIDE_TP_IMP: TLargeintField;
    cliNfeCabIDE_TPEMIS: TStringField;
    cliNfeCabIDE_TPAMB: TLargeintField;
    cliNfeCabIDE_FINNFE: TLargeintField;
    cliNfeCabIDE_INDFINAL: TLargeintField;
    cliNfeCabIDE_INDPRES: TLargeintField;
    cliNfeCabIDE_PROCEMI: TLargeintField;
    cliNfeCabIDE_VERPROC: TStringField;
    cliNfeCabEMIT_CNPJ_CPF: TStringField;
    cliNfeCabEMIT_CPF: TStringField;
    cliNfeCabEMIT_XNOME: TStringField;
    cliNfeCabEMIT_XFANT: TStringField;
    cliNfeCabEMIT_XLGR: TStringField;
    cliNfeCabEMIT_NRO: TStringField;
    cliNfeCabEMIT_XCPL: TStringField;
    cliNfeCabEMIT_XBAIRRO: TStringField;
    cliNfeCabEMIT_CMUN: TStringField;
    cliNfeCabEMIT_XMUN: TStringField;
    cliNfeCabEMIT_UF: TStringField;
    cliNfeCabEMIT_CEP: TStringField;
    cliNfeCabEMIT_CPAIS: TLargeintField;
    cliNfeCabEMIT_XPAIS: TStringField;
    cliNfeCabEMIT_FONE: TStringField;
    cliNfeCabEMIT_IE: TStringField;
    cliNfeCabEMIT_IM: TStringField;
    cliNfeCabEMIT_CNAE: TStringField;
    cliNfeCabEMIT_CRT: TStringField;
    cliNfeCabID_CLIENTE: TLargeintField;
    cliNfeCabDEST_CNPJ_CPF: TStringField;
    cliNfeCabDEST_IDESTRANGEIRO: TStringField;
    cliNfeCabDEST_XNOME: TStringField;
    cliNfeCabDEST_XLGR: TStringField;
    cliNfeCabDEST_NRO: TStringField;
    cliNfeCabDEST_XCPL: TStringField;
    cliNfeCabDEST_XBAIRRO: TStringField;
    cliNfeCabDEST_CMUN: TStringField;
    cliNfeCabDEST_XMUN: TStringField;
    cliNfeCabDEST_UF: TStringField;
    cliNfeCabDEST_CEP: TStringField;
    cliNfeCabDEST_CPAIS: TLargeintField;
    cliNfeCabDEST_XPAIS: TStringField;
    cliNfeCabDEST_FONE: TStringField;
    cliNfeCabDEST_INDIEDEST: TLargeintField;
    cliNfeCabDEST_IE: TStringField;
    cliNfeCabDEST_EMAIL: TStringField;
    cliNfeCabVBC: TFMTBCDField;
    cliNfeCabVICMS: TFMTBCDField;
    cliNfeCabVICMSDESON: TFMTBCDField;
    cliNfeCabVBCST: TFMTBCDField;
    cliNfeCabVST: TFMTBCDField;
    cliNfeCabVPROD: TFMTBCDField;
    cliNfeCabVFRETE: TFMTBCDField;
    cliNfeCabVSEG: TFMTBCDField;
    cliNfeCabVDESC: TFMTBCDField;
    cliNfeCabVII: TFMTBCDField;
    cliNfeCabVIPI: TFMTBCDField;
    cliNfeCabVPIS: TFMTBCDField;
    cliNfeCabVCOFINS: TFMTBCDField;
    cliNfeCabVOUTRO: TFMTBCDField;
    cliNfeCabVNF: TFMTBCDField;
    cliNfeCabVTOTTRIB: TFMTBCDField;
    cliNfeCabMODFRETE: TLargeintField;
    cliNfeCabID_TRANSP: TLargeintField;
    cliNfeCabTRANSP_CNPJ_CPF: TStringField;
    cliNfeCabTRANSP_XNOME: TStringField;
    cliNfeCabTRANSP_IE: TStringField;
    cliNfeCabTRANSP_XENDER: TStringField;
    cliNfeCabTRANSP_XMUN: TStringField;
    cliNfeCabTRANSP_UF: TStringField;
    cliNfeCabVEIC_PLACA: TStringField;
    cliNfeCabVEIC_UF: TStringField;
    cliNfeCabVEIC_RNTC: TStringField;
    cliNfeCabVOL_QVOL: TLargeintField;
    cliNfeCabVOL_ESP: TStringField;
    cliNfeCabVOL_MARCA: TStringField;
    cliNfeCabVOL_NVOL: TStringField;
    cliNfeCabVOL_PESOL: TFMTBCDField;
    cliNfeCabVOL_PESOB: TFMTBCDField;
    cliNfeCabINFADFISCO: TStringField;
    cliNfeCabINFCPL: TStringField;
    cliNfeCabREFNFE: TStringField;
    cliNfeCabEXPORTA_UFEMARQ: TStringField;
    cliNfeCabEXPORTA_XLOCEMARQ: TStringField;
    cliNfeCabCD_STATUS: TLargeintField;
    cliNfeCabPROTOCOLO_AUTORIZACAO: TStringField;
    cliNfeCabDT_AUTORIZACAO: TSQLTimeStampField;
    cliNfeCabMOTIVO_CANCELAMENTO: TStringField;
    cliNfeCabPROTOCOLO_CANCELAMENTO: TStringField;
    cliNfeCabDT_CANCELAMENTO: TSQLTimeStampField;
    cliNfeCabXML_CANCELADO: TStringField;
    qryNfeItensIDNFE_ITENS: TLargeintField;
    qryNfeItensREGISTRO_EMIT: TLargeintField;
    qryNfeItensID_NFE: TLargeintField;
    qryNfeItensCPROD: TLargeintField;
    qryNfeItensCEAN: TStringField;
    qryNfeItensXPROD: TStringField;
    qryNfeItensNCM: TStringField;
    qryNfeItensCEST: TStringField;
    qryNfeItensINDESCALA: TStringField;
    qryNfeItensCNPJFAB: TStringField;
    qryNfeItensNVE: TStringField;
    qryNfeItensEXTIPI: TStringField;
    qryNfeItensCFOP: TLargeintField;
    qryNfeItensUCOM: TStringField;
    qryNfeItensQCOM: TFMTBCDField;
    qryNfeItensVUNCOM: TFMTBCDField;
    qryNfeItensVUNCOMI: TFMTBCDField;
    qryNfeItensVPROD: TFMTBCDField;
    qryNfeItensVPRODI: TFMTBCDField;
    qryNfeItensCEANTRIB: TStringField;
    qryNfeItensUTRIB: TStringField;
    qryNfeItensQTRIB: TFMTBCDField;
    qryNfeItensVUNTRIB: TFMTBCDField;
    qryNfeItensVFRETE: TFMTBCDField;
    qryNfeItensVSEG: TFMTBCDField;
    qryNfeItensVDESC: TFMTBCDField;
    qryNfeItensVOUTRO: TFMTBCDField;
    qryNfeItensINDTOT: TLargeintField;
    qryNfeItensXPED: TStringField;
    qryNfeItensNITEMPED: TLargeintField;
    qryNfeItensORIG: TLargeintField;
    qryNfeItensCST_ICMS: TStringField;
    qryNfeItensMODBC_ICMS: TLargeintField;
    qryNfeItensVBC: TFMTBCDField;
    qryNfeItensPICMS: TFMTBCDField;
    qryNfeItensVICMS: TFMTBCDField;
    qryNfeItensPREDBC: TFMTBCDField;
    qryNfeItensVICMSDESON: TFMTBCDField;
    qryNfeItensMOTDESICMS: TLargeintField;
    qryNfeItensMODBCST: TLargeintField;
    qryNfeItensPMVAST: TFMTBCDField;
    qryNfeItensVBCST: TFMTBCDField;
    qryNfeItensPREDBCST: TFMTBCDField;
    qryNfeItensPICMSST: TFMTBCDField;
    qryNfeItensVICMSST: TFMTBCDField;
    qryNfeItensPCREDSN: TFMTBCDField;
    qryNfeItensVCREDICMSSN: TFMTBCDField;
    qryNfeItensVBCSTRET: TFMTBCDField;
    qryNfeItensVICMSSTRET: TFMTBCDField;
    qryNfeItensCST_IPI: TStringField;
    qryNfeItensENQ_IPI: TStringField;
    qryNfeItensVBCIPI: TFMTBCDField;
    qryNfeItensPIPI: TFMTBCDField;
    qryNfeItensVIPI: TFMTBCDField;
    qryNfeItensCST_PIS: TStringField;
    qryNfeItensVBCPIS: TFMTBCDField;
    qryNfeItensPPIS: TFMTBCDField;
    qryNfeItensVPIS: TFMTBCDField;
    qryNfeItensCST_COFINS: TStringField;
    qryNfeItensVBCCOFINS: TFMTBCDField;
    qryNfeItensPCOFINS: TFMTBCDField;
    qryNfeItensVCOFINS: TFMTBCDField;
    qryNfeItensVTOTTRIB: TFMTBCDField;
    qryNfeItensPST: TFMTBCDField;
    qryNfeItensVICMSSUBSTITUTO: TFMTBCDField;
    qryNfeItensCPRODANP: TStringField;
    qryNfeItensDESCANP: TStringField;
    qryNfeItensVPART: TFMTBCDField;
    qryNfeItensPGLP: TFMTBCDField;
    qryNfeItensPGNN: TFMTBCDField;
    qryNfeItensPGNI: TFMTBCDField;
    cliNfeItensIDNFE_ITENS: TLargeintField;
    cliNfeItensREGISTRO_EMIT: TLargeintField;
    cliNfeItensID_NFE: TLargeintField;
    cliNfeItensCPROD: TLargeintField;
    cliNfeItensCEAN: TStringField;
    cliNfeItensXPROD: TStringField;
    cliNfeItensNCM: TStringField;
    cliNfeItensCEST: TStringField;
    cliNfeItensINDESCALA: TStringField;
    cliNfeItensCNPJFAB: TStringField;
    cliNfeItensNVE: TStringField;
    cliNfeItensEXTIPI: TStringField;
    cliNfeItensCFOP: TLargeintField;
    cliNfeItensUCOM: TStringField;
    cliNfeItensQCOM: TFMTBCDField;
    cliNfeItensVUNCOM: TFMTBCDField;
    cliNfeItensVUNCOMI: TFMTBCDField;
    cliNfeItensVPROD: TFMTBCDField;
    cliNfeItensVPRODI: TFMTBCDField;
    cliNfeItensCEANTRIB: TStringField;
    cliNfeItensUTRIB: TStringField;
    cliNfeItensQTRIB: TFMTBCDField;
    cliNfeItensVUNTRIB: TFMTBCDField;
    cliNfeItensVFRETE: TFMTBCDField;
    cliNfeItensVSEG: TFMTBCDField;
    cliNfeItensVDESC: TFMTBCDField;
    cliNfeItensVOUTRO: TFMTBCDField;
    cliNfeItensINDTOT: TLargeintField;
    cliNfeItensXPED: TStringField;
    cliNfeItensNITEMPED: TLargeintField;
    cliNfeItensORIG: TLargeintField;
    cliNfeItensCST_ICMS: TStringField;
    cliNfeItensMODBC_ICMS: TLargeintField;
    cliNfeItensVBC: TFMTBCDField;
    cliNfeItensPICMS: TFMTBCDField;
    cliNfeItensVICMS: TFMTBCDField;
    cliNfeItensPREDBC: TFMTBCDField;
    cliNfeItensVICMSDESON: TFMTBCDField;
    cliNfeItensMOTDESICMS: TLargeintField;
    cliNfeItensMODBCST: TLargeintField;
    cliNfeItensPMVAST: TFMTBCDField;
    cliNfeItensVBCST: TFMTBCDField;
    cliNfeItensPREDBCST: TFMTBCDField;
    cliNfeItensPICMSST: TFMTBCDField;
    cliNfeItensVICMSST: TFMTBCDField;
    cliNfeItensPCREDSN: TFMTBCDField;
    cliNfeItensVCREDICMSSN: TFMTBCDField;
    cliNfeItensVBCSTRET: TFMTBCDField;
    cliNfeItensVICMSSTRET: TFMTBCDField;
    cliNfeItensCST_IPI: TStringField;
    cliNfeItensENQ_IPI: TStringField;
    cliNfeItensVBCIPI: TFMTBCDField;
    cliNfeItensPIPI: TFMTBCDField;
    cliNfeItensVIPI: TFMTBCDField;
    cliNfeItensCST_PIS: TStringField;
    cliNfeItensVBCPIS: TFMTBCDField;
    cliNfeItensPPIS: TFMTBCDField;
    cliNfeItensVPIS: TFMTBCDField;
    cliNfeItensCST_COFINS: TStringField;
    cliNfeItensVBCCOFINS: TFMTBCDField;
    cliNfeItensPCOFINS: TFMTBCDField;
    cliNfeItensVCOFINS: TFMTBCDField;
    cliNfeItensVTOTTRIB: TFMTBCDField;
    cliNfeItensPST: TFMTBCDField;
    cliNfeItensVICMSSUBSTITUTO: TFMTBCDField;
    cliNfeItensCPRODANP: TStringField;
    cliNfeItensDESCANP: TStringField;
    cliNfeItensVPART: TFMTBCDField;
    cliNfeItensPGLP: TFMTBCDField;
    cliNfeItensPGNN: TFMTBCDField;
    cliNfeItensPGNI: TFMTBCDField;
    qryNfePagamentoID_NFE_PAG: TLargeintField;
    qryNfePagamentoID_NFE: TLargeintField;
    qryNfePagamentoREGISTRO_EMIT: TLargeintField;
    qryNfePagamentoTPAG: TStringField;
    qryNfePagamentoVPAG: TFMTBCDField;
    qryNfePagamentoVTROCO: TFMTBCDField;
    qryNfePagamentoINDPAG: TLargeintField;
    qryNfePagamentoCNPJ_ADM: TStringField;
    qryNfePagamentoTBAND: TStringField;
    qryNfePagamentoCAUT: TStringField;
    qryNfePagamentoCAIXA_N: TLargeintField;
    cliNfePagamentoID_NFE_PAG: TLargeintField;
    cliNfePagamentoID_NFE: TLargeintField;
    cliNfePagamentoREGISTRO_EMIT: TLargeintField;
    cliNfePagamentoTPAG: TStringField;
    cliNfePagamentoVPAG: TFMTBCDField;
    cliNfePagamentoVTROCO: TFMTBCDField;
    cliNfePagamentoINDPAG: TLargeintField;
    cliNfePagamentoCNPJ_ADM: TStringField;
    cliNfePagamentoTBAND: TStringField;
    cliNfePagamentoCAUT: TStringField;
    cliNfePagamentoCAIXA_N: TLargeintField;
    qryCliente: TSQLQuery;
    dspCliente: TDataSetProvider;
    cliCliente: TClientDataSet;
    qryClienteCODIGO_CLIENTE: TLargeintField;
    qryClienteREGISTRO_EMIT: TLargeintField;
    qryClienteNOME: TStringField;
    qryClienteCONTATO: TStringField;
    qryClienteCPF: TStringField;
    qryClienteRG: TStringField;
    qryClienteIMUNICIPAL: TStringField;
    qryClienteSUFRAMA: TStringField;
    qryClienteINDIEDEST: TStringField;
    qryClienteENDERECO: TStringField;
    qryClienteNUMERO: TStringField;
    qryClienteCOMPLEMENTO: TStringField;
    qryClienteBAIRRO: TStringField;
    qryClienteCIDADE: TStringField;
    qryClienteCD_CIDADE: TStringField;
    qryClienteESTADO: TStringField;
    qryClienteCD_ESTADO: TStringField;
    qryClienteCD_PAIS: TStringField;
    qryClientePAIS: TStringField;
    qryClienteCEP: TStringField;
    qryClienteTELEFONE: TStringField;
    qryClienteCELULAR: TStringField;
    qryClienteEMAIL: TStringField;
    qryClienteDATA_NASCIMENTO: TDateField;
    qryClienteMAE: TStringField;
    qryClientePAI: TStringField;
    qryClienteDEPENDENTES: TStringField;
    qryClienteLIMITE: TFMTBCDField;
    qryClienteBLOQUEADO: TLargeintField;
    qryClienteCONVENIO: TStringField;
    qryClienteDATA_CADASTRO: TDateField;
    qryClienteSENHA: TStringField;
    qryClienteOBSERVACAO: TStringField;
    qryClienteCONS_FINAL: TLargeintField;
    cliClienteCODIGO_CLIENTE: TLargeintField;
    cliClienteREGISTRO_EMIT: TLargeintField;
    cliClienteNOME: TStringField;
    cliClienteCONTATO: TStringField;
    cliClienteCPF: TStringField;
    cliClienteRG: TStringField;
    cliClienteIMUNICIPAL: TStringField;
    cliClienteSUFRAMA: TStringField;
    cliClienteINDIEDEST: TStringField;
    cliClienteENDERECO: TStringField;
    cliClienteNUMERO: TStringField;
    cliClienteCOMPLEMENTO: TStringField;
    cliClienteBAIRRO: TStringField;
    cliClienteCIDADE: TStringField;
    cliClienteCD_CIDADE: TStringField;
    cliClienteESTADO: TStringField;
    cliClienteCD_ESTADO: TStringField;
    cliClienteCD_PAIS: TStringField;
    cliClientePAIS: TStringField;
    cliClienteCEP: TStringField;
    cliClienteTELEFONE: TStringField;
    cliClienteCELULAR: TStringField;
    cliClienteEMAIL: TStringField;
    cliClienteDATA_NASCIMENTO: TDateField;
    cliClienteMAE: TStringField;
    cliClientePAI: TStringField;
    cliClienteDEPENDENTES: TStringField;
    cliClienteLIMITE: TFMTBCDField;
    cliClienteBLOQUEADO: TLargeintField;
    cliClienteCONVENIO: TStringField;
    cliClienteDATA_CADASTRO: TDateField;
    cliClienteSENHA: TStringField;
    cliClienteOBSERVACAO: TStringField;
    cliClienteCONS_FINAL: TLargeintField;
    qrySequence: TSQLQuery;
    qryProximaNota: TSQLQuery;
    qryEmitente: TSQLQuery;
    dspEmitente: TDataSetProvider;
    cliEmitente: TClientDataSet;
    qryEmitenteNOME: TStringField;
    qryEmitenteNOME_FANTASIA: TStringField;
    qryEmitenteCONTATO: TStringField;
    qryEmitenteENDERECO: TStringField;
    qryEmitenteNUMERO: TStringField;
    qryEmitenteBAIRRO: TStringField;
    qryEmitenteMUNICIPIO: TStringField;
    qryEmitenteCD_CIDADE: TStringField;
    qryEmitenteCEP: TStringField;
    qryEmitenteESTADO: TStringField;
    qryEmitenteCD_ESTADO: TStringField;
    qryEmitenteCD_PAIS: TStringField;
    qryEmitentePAIS: TStringField;
    qryEmitenteCNPJ: TStringField;
    qryEmitenteCPF: TStringField;
    qryEmitenteIE: TStringField;
    qryEmitenteTELEFONE: TStringField;
    qryEmitenteEMAIL: TStringField;
    qryEmitenteCRT: TStringField;
    qryEmitenteCNAE: TStringField;
    qryEmitenteIMUNICIPAL: TStringField;
    qryEmitenteLOGOMARCA_EMITENTE: TBlobField;
    qryEmitenteREGISTRO: TLargeintField;
    cliEmitenteNOME: TStringField;
    cliEmitenteNOME_FANTASIA: TStringField;
    cliEmitenteCONTATO: TStringField;
    cliEmitenteENDERECO: TStringField;
    cliEmitenteNUMERO: TStringField;
    cliEmitenteBAIRRO: TStringField;
    cliEmitenteMUNICIPIO: TStringField;
    cliEmitenteCD_CIDADE: TStringField;
    cliEmitenteCEP: TStringField;
    cliEmitenteESTADO: TStringField;
    cliEmitenteCD_ESTADO: TStringField;
    cliEmitenteCD_PAIS: TStringField;
    cliEmitentePAIS: TStringField;
    cliEmitenteCNPJ: TStringField;
    cliEmitenteCPF: TStringField;
    cliEmitenteIE: TStringField;
    cliEmitenteTELEFONE: TStringField;
    cliEmitenteEMAIL: TStringField;
    cliEmitenteCRT: TStringField;
    cliEmitenteCNAE: TStringField;
    cliEmitenteIMUNICIPAL: TStringField;
    cliEmitenteLOGOMARCA_EMITENTE: TBlobField;
    cliEmitenteREGISTRO: TLargeintField;
    qryVendaREGISTRO_EMITENTE: TLargeintField;
    cliVendaREGISTRO_EMITENTE: TLargeintField;
    qryVendaConsultaREGISTRO_EMITENTE: TLargeintField;
    uptAtualizaStatusNotaFiscal: TSQLQuery;
    uptAtualizaDadosNotaFiscal: TSQLQuery;
    base64: TIdEncoderMIME;
    qryNfeCabXML_APROVADO: TBlobField;
    cliNfeCabXML_APROVADO: TBlobField;
    qryConsultaNotasFiscais: TSQLQuery;
    dspConsultaNotasFiscais: TDataSetProvider;
    cliConsultaNotasFiscais: TClientDataSet;
    cliConsultaNotasFiscaisID_NFE: TLargeintField;
    cliConsultaNotasFiscaisREGISTRO_EMIT: TLargeintField;
    cliConsultaNotasFiscaisID_VENDEDOR: TLargeintField;
    cliConsultaNotasFiscaisCHAVE: TStringField;
    cliConsultaNotasFiscaisIDE_CUF: TLargeintField;
    cliConsultaNotasFiscaisIDE_NATOP: TStringField;
    cliConsultaNotasFiscaisIDE_MOD: TLargeintField;
    cliConsultaNotasFiscaisIDE_SERIE: TLargeintField;
    cliConsultaNotasFiscaisIDE_NNF: TLargeintField;
    cliConsultaNotasFiscaisIDE_DHEMI: TSQLTimeStampField;
    cliConsultaNotasFiscaisIDE_DHSAIENT: TSQLTimeStampField;
    cliConsultaNotasFiscaisIDE_TPNF: TStringField;
    cliConsultaNotasFiscaisIDE_IDDEST: TLargeintField;
    cliConsultaNotasFiscaisIDE_CMUNFG: TStringField;
    cliConsultaNotasFiscaisIDE_TP_IMP: TLargeintField;
    cliConsultaNotasFiscaisIDE_TPEMIS: TStringField;
    cliConsultaNotasFiscaisIDE_TPAMB: TLargeintField;
    cliConsultaNotasFiscaisIDE_FINNFE: TLargeintField;
    cliConsultaNotasFiscaisIDE_INDFINAL: TLargeintField;
    cliConsultaNotasFiscaisIDE_INDPRES: TLargeintField;
    cliConsultaNotasFiscaisIDE_PROCEMI: TLargeintField;
    cliConsultaNotasFiscaisIDE_VERPROC: TStringField;
    cliConsultaNotasFiscaisEMIT_CNPJ_CPF: TStringField;
    cliConsultaNotasFiscaisEMIT_CPF: TStringField;
    cliConsultaNotasFiscaisEMIT_XNOME: TStringField;
    cliConsultaNotasFiscaisEMIT_XFANT: TStringField;
    cliConsultaNotasFiscaisEMIT_XLGR: TStringField;
    cliConsultaNotasFiscaisEMIT_NRO: TStringField;
    cliConsultaNotasFiscaisEMIT_XCPL: TStringField;
    cliConsultaNotasFiscaisEMIT_XBAIRRO: TStringField;
    cliConsultaNotasFiscaisEMIT_CMUN: TStringField;
    cliConsultaNotasFiscaisEMIT_XMUN: TStringField;
    cliConsultaNotasFiscaisEMIT_UF: TStringField;
    cliConsultaNotasFiscaisEMIT_CEP: TStringField;
    cliConsultaNotasFiscaisEMIT_CPAIS: TLargeintField;
    cliConsultaNotasFiscaisEMIT_XPAIS: TStringField;
    cliConsultaNotasFiscaisEMIT_FONE: TStringField;
    cliConsultaNotasFiscaisEMIT_IE: TStringField;
    cliConsultaNotasFiscaisEMIT_IM: TStringField;
    cliConsultaNotasFiscaisEMIT_CNAE: TStringField;
    cliConsultaNotasFiscaisEMIT_CRT: TStringField;
    cliConsultaNotasFiscaisID_CLIENTE: TLargeintField;
    cliConsultaNotasFiscaisDEST_CNPJ_CPF: TStringField;
    cliConsultaNotasFiscaisDEST_IDESTRANGEIRO: TStringField;
    cliConsultaNotasFiscaisDEST_XNOME: TStringField;
    cliConsultaNotasFiscaisDEST_XLGR: TStringField;
    cliConsultaNotasFiscaisDEST_NRO: TStringField;
    cliConsultaNotasFiscaisDEST_XCPL: TStringField;
    cliConsultaNotasFiscaisDEST_XBAIRRO: TStringField;
    cliConsultaNotasFiscaisDEST_CMUN: TStringField;
    cliConsultaNotasFiscaisDEST_XMUN: TStringField;
    cliConsultaNotasFiscaisDEST_UF: TStringField;
    cliConsultaNotasFiscaisDEST_CEP: TStringField;
    cliConsultaNotasFiscaisDEST_CPAIS: TLargeintField;
    cliConsultaNotasFiscaisDEST_XPAIS: TStringField;
    cliConsultaNotasFiscaisDEST_FONE: TStringField;
    cliConsultaNotasFiscaisDEST_INDIEDEST: TLargeintField;
    cliConsultaNotasFiscaisDEST_IE: TStringField;
    cliConsultaNotasFiscaisDEST_EMAIL: TStringField;
    cliConsultaNotasFiscaisVBC: TFMTBCDField;
    cliConsultaNotasFiscaisVICMS: TFMTBCDField;
    cliConsultaNotasFiscaisVICMSDESON: TFMTBCDField;
    cliConsultaNotasFiscaisVBCST: TFMTBCDField;
    cliConsultaNotasFiscaisVST: TFMTBCDField;
    cliConsultaNotasFiscaisVPROD: TFMTBCDField;
    cliConsultaNotasFiscaisVFRETE: TFMTBCDField;
    cliConsultaNotasFiscaisVSEG: TFMTBCDField;
    cliConsultaNotasFiscaisVDESC: TFMTBCDField;
    cliConsultaNotasFiscaisVII: TFMTBCDField;
    cliConsultaNotasFiscaisVIPI: TFMTBCDField;
    cliConsultaNotasFiscaisVPIS: TFMTBCDField;
    cliConsultaNotasFiscaisVCOFINS: TFMTBCDField;
    cliConsultaNotasFiscaisVOUTRO: TFMTBCDField;
    cliConsultaNotasFiscaisVNF: TFMTBCDField;
    cliConsultaNotasFiscaisVTOTTRIB: TFMTBCDField;
    cliConsultaNotasFiscaisMODFRETE: TLargeintField;
    cliConsultaNotasFiscaisID_TRANSP: TLargeintField;
    cliConsultaNotasFiscaisTRANSP_CNPJ_CPF: TStringField;
    cliConsultaNotasFiscaisTRANSP_XNOME: TStringField;
    cliConsultaNotasFiscaisTRANSP_IE: TStringField;
    cliConsultaNotasFiscaisTRANSP_XENDER: TStringField;
    cliConsultaNotasFiscaisTRANSP_XMUN: TStringField;
    cliConsultaNotasFiscaisTRANSP_UF: TStringField;
    cliConsultaNotasFiscaisVEIC_PLACA: TStringField;
    cliConsultaNotasFiscaisVEIC_UF: TStringField;
    cliConsultaNotasFiscaisVEIC_RNTC: TStringField;
    cliConsultaNotasFiscaisVOL_QVOL: TLargeintField;
    cliConsultaNotasFiscaisVOL_ESP: TStringField;
    cliConsultaNotasFiscaisVOL_MARCA: TStringField;
    cliConsultaNotasFiscaisVOL_NVOL: TStringField;
    cliConsultaNotasFiscaisVOL_PESOL: TFMTBCDField;
    cliConsultaNotasFiscaisVOL_PESOB: TFMTBCDField;
    cliConsultaNotasFiscaisINFADFISCO: TStringField;
    cliConsultaNotasFiscaisINFCPL: TStringField;
    cliConsultaNotasFiscaisREFNFE: TStringField;
    cliConsultaNotasFiscaisEXPORTA_UFEMARQ: TStringField;
    cliConsultaNotasFiscaisEXPORTA_XLOCEMARQ: TStringField;
    cliConsultaNotasFiscaisCD_STATUS: TLargeintField;
    cliConsultaNotasFiscaisPROTOCOLO_AUTORIZACAO: TStringField;
    cliConsultaNotasFiscaisDT_AUTORIZACAO: TSQLTimeStampField;
    cliConsultaNotasFiscaisMOTIVO_CANCELAMENTO: TStringField;
    cliConsultaNotasFiscaisPROTOCOLO_CANCELAMENTO: TStringField;
    cliConsultaNotasFiscaisDT_CANCELAMENTO: TSQLTimeStampField;
    cliConsultaNotasFiscaisXML_APROVADO: TBlobField;
    cliConsultaNotasFiscaisXML_CANCELADO: TStringField;
    qryConsultaNotasFiscaisID_NFE: TLargeintField;
    qryConsultaNotasFiscaisREGISTRO_EMIT: TLargeintField;
    qryConsultaNotasFiscaisID_VENDEDOR: TLargeintField;
    qryConsultaNotasFiscaisCHAVE: TStringField;
    qryConsultaNotasFiscaisIDE_CUF: TLargeintField;
    qryConsultaNotasFiscaisIDE_NATOP: TStringField;
    qryConsultaNotasFiscaisIDE_MOD: TLargeintField;
    qryConsultaNotasFiscaisIDE_SERIE: TLargeintField;
    qryConsultaNotasFiscaisIDE_NNF: TLargeintField;
    qryConsultaNotasFiscaisIDE_DHEMI: TSQLTimeStampField;
    qryConsultaNotasFiscaisIDE_DHSAIENT: TSQLTimeStampField;
    qryConsultaNotasFiscaisIDE_TPNF: TStringField;
    qryConsultaNotasFiscaisIDE_IDDEST: TLargeintField;
    qryConsultaNotasFiscaisIDE_CMUNFG: TStringField;
    qryConsultaNotasFiscaisIDE_TP_IMP: TLargeintField;
    qryConsultaNotasFiscaisIDE_TPEMIS: TStringField;
    qryConsultaNotasFiscaisIDE_TPAMB: TLargeintField;
    qryConsultaNotasFiscaisIDE_FINNFE: TLargeintField;
    qryConsultaNotasFiscaisIDE_INDFINAL: TLargeintField;
    qryConsultaNotasFiscaisIDE_INDPRES: TLargeintField;
    qryConsultaNotasFiscaisIDE_PROCEMI: TLargeintField;
    qryConsultaNotasFiscaisIDE_VERPROC: TStringField;
    qryConsultaNotasFiscaisEMIT_CNPJ_CPF: TStringField;
    qryConsultaNotasFiscaisEMIT_CPF: TStringField;
    qryConsultaNotasFiscaisEMIT_XNOME: TStringField;
    qryConsultaNotasFiscaisEMIT_XFANT: TStringField;
    qryConsultaNotasFiscaisEMIT_XLGR: TStringField;
    qryConsultaNotasFiscaisEMIT_NRO: TStringField;
    qryConsultaNotasFiscaisEMIT_XCPL: TStringField;
    qryConsultaNotasFiscaisEMIT_XBAIRRO: TStringField;
    qryConsultaNotasFiscaisEMIT_CMUN: TStringField;
    qryConsultaNotasFiscaisEMIT_XMUN: TStringField;
    qryConsultaNotasFiscaisEMIT_UF: TStringField;
    qryConsultaNotasFiscaisEMIT_CEP: TStringField;
    qryConsultaNotasFiscaisEMIT_CPAIS: TLargeintField;
    qryConsultaNotasFiscaisEMIT_XPAIS: TStringField;
    qryConsultaNotasFiscaisEMIT_FONE: TStringField;
    qryConsultaNotasFiscaisEMIT_IE: TStringField;
    qryConsultaNotasFiscaisEMIT_IM: TStringField;
    qryConsultaNotasFiscaisEMIT_CNAE: TStringField;
    qryConsultaNotasFiscaisEMIT_CRT: TStringField;
    qryConsultaNotasFiscaisID_CLIENTE: TLargeintField;
    qryConsultaNotasFiscaisDEST_CNPJ_CPF: TStringField;
    qryConsultaNotasFiscaisDEST_IDESTRANGEIRO: TStringField;
    qryConsultaNotasFiscaisDEST_XNOME: TStringField;
    qryConsultaNotasFiscaisDEST_XLGR: TStringField;
    qryConsultaNotasFiscaisDEST_NRO: TStringField;
    qryConsultaNotasFiscaisDEST_XCPL: TStringField;
    qryConsultaNotasFiscaisDEST_XBAIRRO: TStringField;
    qryConsultaNotasFiscaisDEST_CMUN: TStringField;
    qryConsultaNotasFiscaisDEST_XMUN: TStringField;
    qryConsultaNotasFiscaisDEST_UF: TStringField;
    qryConsultaNotasFiscaisDEST_CEP: TStringField;
    qryConsultaNotasFiscaisDEST_CPAIS: TLargeintField;
    qryConsultaNotasFiscaisDEST_XPAIS: TStringField;
    qryConsultaNotasFiscaisDEST_FONE: TStringField;
    qryConsultaNotasFiscaisDEST_INDIEDEST: TLargeintField;
    qryConsultaNotasFiscaisDEST_IE: TStringField;
    qryConsultaNotasFiscaisDEST_EMAIL: TStringField;
    qryConsultaNotasFiscaisVBC: TFMTBCDField;
    qryConsultaNotasFiscaisVICMS: TFMTBCDField;
    qryConsultaNotasFiscaisVICMSDESON: TFMTBCDField;
    qryConsultaNotasFiscaisVBCST: TFMTBCDField;
    qryConsultaNotasFiscaisVST: TFMTBCDField;
    qryConsultaNotasFiscaisVPROD: TFMTBCDField;
    qryConsultaNotasFiscaisVFRETE: TFMTBCDField;
    qryConsultaNotasFiscaisVSEG: TFMTBCDField;
    qryConsultaNotasFiscaisVDESC: TFMTBCDField;
    qryConsultaNotasFiscaisVII: TFMTBCDField;
    qryConsultaNotasFiscaisVIPI: TFMTBCDField;
    qryConsultaNotasFiscaisVPIS: TFMTBCDField;
    qryConsultaNotasFiscaisVCOFINS: TFMTBCDField;
    qryConsultaNotasFiscaisVOUTRO: TFMTBCDField;
    qryConsultaNotasFiscaisVNF: TFMTBCDField;
    qryConsultaNotasFiscaisVTOTTRIB: TFMTBCDField;
    qryConsultaNotasFiscaisMODFRETE: TLargeintField;
    qryConsultaNotasFiscaisID_TRANSP: TLargeintField;
    qryConsultaNotasFiscaisTRANSP_CNPJ_CPF: TStringField;
    qryConsultaNotasFiscaisTRANSP_XNOME: TStringField;
    qryConsultaNotasFiscaisTRANSP_IE: TStringField;
    qryConsultaNotasFiscaisTRANSP_XENDER: TStringField;
    qryConsultaNotasFiscaisTRANSP_XMUN: TStringField;
    qryConsultaNotasFiscaisTRANSP_UF: TStringField;
    qryConsultaNotasFiscaisVEIC_PLACA: TStringField;
    qryConsultaNotasFiscaisVEIC_UF: TStringField;
    qryConsultaNotasFiscaisVEIC_RNTC: TStringField;
    qryConsultaNotasFiscaisVOL_QVOL: TLargeintField;
    qryConsultaNotasFiscaisVOL_ESP: TStringField;
    qryConsultaNotasFiscaisVOL_MARCA: TStringField;
    qryConsultaNotasFiscaisVOL_NVOL: TStringField;
    qryConsultaNotasFiscaisVOL_PESOL: TFMTBCDField;
    qryConsultaNotasFiscaisVOL_PESOB: TFMTBCDField;
    qryConsultaNotasFiscaisINFADFISCO: TStringField;
    qryConsultaNotasFiscaisINFCPL: TStringField;
    qryConsultaNotasFiscaisREFNFE: TStringField;
    qryConsultaNotasFiscaisEXPORTA_UFEMARQ: TStringField;
    qryConsultaNotasFiscaisEXPORTA_XLOCEMARQ: TStringField;
    qryConsultaNotasFiscaisCD_STATUS: TLargeintField;
    qryConsultaNotasFiscaisPROTOCOLO_AUTORIZACAO: TStringField;
    qryConsultaNotasFiscaisDT_AUTORIZACAO: TSQLTimeStampField;
    qryConsultaNotasFiscaisMOTIVO_CANCELAMENTO: TStringField;
    qryConsultaNotasFiscaisPROTOCOLO_CANCELAMENTO: TStringField;
    qryConsultaNotasFiscaisDT_CANCELAMENTO: TSQLTimeStampField;
    qryConsultaNotasFiscaisXML_APROVADO: TBlobField;
    qryConsultaNotasFiscaisXML_CANCELADO: TStringField;
    uptAtualizaDadosNotaFiscalCancelamento: TSQLQuery;
    qryVendaConsultaCODIGO_PRODUTO_EXIBICAO: TLargeintField;
    qryVendaCODIGO_PRODUTO_EXIBICAO: TLargeintField;
    qryConfiguracao: TSQLQuery;
    dspConfiguracao: TDataSetProvider;
    cliConfiguracao: TClientDataSet;
    cliConfiguracaoNFCE_TOKEN_CSC: TStringField;
    cliConfiguracaoNFCE_TOKEN_ID: TStringField;
    cliConfiguracaoNFCE_SERIE: TLargeintField;
    cliConfiguracaoNFCE_NUMERO_EMITIDO: TLargeintField;
    cliConfiguracaoAPI_CONEXAO_TOKEN: TStringField;
    cliConfiguracaoREGISTRO_EMITENTE: TLargeintField;
    cliConfiguracaoCERTIFICADO_SERIE: TStringField;
    cliConfiguracaoCERTIFICADO_SENHA: TStringField;
    uptAtualizaUltimaNFCe: TSQLQuery;
    cliConfiguracaoNFCE_AMBIENTE_EMISSAO: TIntegerField;
    delClientes: TSQLQuery;
    qryConfiguracaoNFCE_TOKEN_CSC: TStringField;
    qryConfiguracaoNFCE_TOKEN_ID: TStringField;
    qryConfiguracaoNFCE_SERIE: TLargeintField;
    qryConfiguracaoNFCE_NUMERO_EMITIDO: TLargeintField;
    qryConfiguracaoNFCE_AMBIENTE_EMISSAO: TIntegerField;
    qryConfiguracaoAPI_CONEXAO_TOKEN: TStringField;
    qryConfiguracaoCERTIFICADO_SERIE: TStringField;
    qryConfiguracaoCERTIFICADO_SENHA: TStringField;
    qryConfiguracaoREGISTRO_EMITENTE: TLargeintField;
    delFuncionarios: TSQLQuery;
    qryFuncionarios: TSQLQuery;
    dspFuncionarios: TDataSetProvider;
    cliFuncionarios: TClientDataSet;
    delEstoques: TSQLQuery;
    qryFuncionariosID_FUNCIONARIO: TLargeintField;
    qryFuncionariosREGISTRO_EMIT: TLargeintField;
    qryFuncionariosNOME_FUNCIONARIO: TStringField;
    qryFuncionariosCARGO: TStringField;
    qryFuncionariosCPF: TStringField;
    qryFuncionariosRG: TStringField;
    qryFuncionariosCTPS: TStringField;
    qryFuncionariosDATA_NASCIMENTO: TDateField;
    qryFuncionariosCEP: TStringField;
    qryFuncionariosENDERECO: TStringField;
    qryFuncionariosBAIRRO: TStringField;
    qryFuncionariosCIDADE: TStringField;
    qryFuncionariosESTADO: TStringField;
    qryFuncionariosTELEFONE: TStringField;
    qryFuncionariosCELULAR: TStringField;
    qryFuncionariosDATA_ADMISSAO: TDateField;
    qryFuncionariosDATA_DEMISSAO: TDateField;
    qryFuncionariosNATURALIDADE: TStringField;
    qryFuncionariosNOME_PAI: TStringField;
    qryFuncionariosNOME_MAE: TStringField;
    qryFuncionariosOS: TLargeintField;
    qryFuncionariosVENDA: TLargeintField;
    cliFuncionariosID_FUNCIONARIO: TLargeintField;
    cliFuncionariosREGISTRO_EMIT: TLargeintField;
    cliFuncionariosNOME_FUNCIONARIO: TStringField;
    cliFuncionariosCARGO: TStringField;
    cliFuncionariosCPF: TStringField;
    cliFuncionariosRG: TStringField;
    cliFuncionariosCTPS: TStringField;
    cliFuncionariosDATA_NASCIMENTO: TDateField;
    cliFuncionariosCEP: TStringField;
    cliFuncionariosENDERECO: TStringField;
    cliFuncionariosBAIRRO: TStringField;
    cliFuncionariosCIDADE: TStringField;
    cliFuncionariosESTADO: TStringField;
    cliFuncionariosTELEFONE: TStringField;
    cliFuncionariosCELULAR: TStringField;
    cliFuncionariosDATA_ADMISSAO: TDateField;
    cliFuncionariosDATA_DEMISSAO: TDateField;
    cliFuncionariosNATURALIDADE: TStringField;
    cliFuncionariosNOME_PAI: TStringField;
    cliFuncionariosNOME_MAE: TStringField;
    cliFuncionariosOS: TLargeintField;
    cliFuncionariosVENDA: TLargeintField;
    delPagamentosAposCancelar: TSQLQuery;
    cliVendaCODIGO_PRODUTO_EXIBICAO: TLargeintField;
    procedure DataModuleCreate(Sender: TObject);
    procedure cliEstoquePRECO_VENDAGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure cliConsultaNotasFiscaisVNFGetText(Sender: TField;
      var Text: string; DisplayText: Boolean);
  private
//    function Tratar_Chave_Nota_Fiscal(AChaveGerada: String): String;

    procedure Abrir_Tabelas_NFe();
    procedure Apagar_Pagamento_Apos_Cancelar_Notas(AChave: String);
    procedure Consultar(AQuery: TSQLQuery; ASql: String);
    //procedure Inserir_Itens(AIdNFe: Int64; AGWCommerce: TObject);
//    procedure Inserir_Pagamentos(AIdNFe: Int64; AGWCommerce: TObject);
    procedure Preencher_Cliente(ARegistroEmitente: Int64; ACliente: TCliente);
    procedure Preencher_Emitente_Nota(ARegistroEmitente: Int64; ANotaFiscal: NotaFiscal);
//    procedure Registrar_NFE_Itens(AIdNFe: Int64; AGWCommerce: TObject; ANotaFiscal: NotaFiscal);
    procedure Registrar_NFE_Itens(AIdNFe, AIdRegistroEmitente: Int64; ANotaFiscal: NotaFiscal);
    procedure Registrar_NFE_Pagamentos(AIdNFe, AIdRegistroEmitente: Int64; ANotaFiscal: NotaFiscal);
//    procedure Inserir_Pagamentos(AIdNFe: Int64; AGWCommerce: TObject);
//    function Pegar_Proxima_Nota(AEmitente, ASerie, AModelo: Int64): Int64;

  public
    function Gerar_Id(ANomeGenerator: String): Int64;
    function Pegar_Numero_Proxima_Nota(AEmitente, ASerie, AModelo: Int64): Int64;

    procedure Abrir_Consulta_Venda(ARegistroEmitente: Int64);
    procedure Abrir_Tabela_Cliente(ARegistroEmitente: Int64);
    procedure Abrir_Tabela_Configuracao();
    procedure Abrir_Tabela_Emitente();
    procedure Abrir_Tabela_Estoque(ARegistroEmitente: Int64);
    procedure Abrir_Tabela_Funcionario(ARegistroEmitente: Int64);
    procedure Abrir_Tabela_Venda(ARegistroEmitente: Int64);
    procedure Apagar_Cliente_Antes_Integrar(ARegistroEmitente: Int64);
    procedure Apagar_Estoque_Antes_Integrar(ARegistroEmitente: Int64);
    procedure Apagar_Funcionario_Antes_Integrar(ARegistroEmitente: Int64);
    procedure Atualizar_Dados_Apos_Cancelar_Nota_Fiscal(AChave, AMotivo, AXML, AProtocolo: String; AStatus: Int64);
    procedure Atualizar_Dados_Apos_Emitir_Nota_Fiscal(ANotaFiscal: NotaFiscal);
    procedure Atualizar_Status_Nota_Fiscal(AChave: String; ACodigoStatus: Int64);
//    procedure Finalizar_Venda_Com_F12(AGWCommerce: TObject; NFCe: TACBrNFe);
//    procedure Gerar_Nota_Fiscal(AGWCommerce: TObject; NFCe: TACBrNFe);
    procedure Filtrar_Configuracao(AIdRegistroEmitente: Int64);
    procedure Inserir_Venda(AVenda: TObject);
    procedure Integrar_Cliente(ACliente: TlkJSONobject; AIdEmitente: Int64);
    procedure Integrar_Estoque(AEstoque: TlkJSONobject; AIdEmitente: Int64);
    procedure Integrar_Funcionarios(AFuncionario: TlkJSONobject; AIdEmitente: Int64);
    procedure Registrar_NFE_CAB(AGWCommerce: TObject; ANotaFiscal: NotaFiscal);

  end;

var
  dmDados: TdmDados;

implementation
uses
  UGWCommerce, UVenda, UEstoque{, UPagamento};

{$R *.dfm}

{ TdmDados }

procedure TdmDados.Abrir_Consulta_Venda(ARegistroEmitente: Int64);
begin
  qryVendaConsulta.Close();
  qryVendaConsulta.ParamByName('PREGISTRO_EMITENTE').AsLargeInt := ARegistroEmitente;
  qryVendaConsulta.Open();

  cliVenda.Close();
  cliVenda.Open();
end;

procedure TdmDados.Abrir_Tabela_Cliente(ARegistroEmitente: Int64);
begin
  qryCliente.Close();
  qryCliente.ParamByName('PEMITENTE').AsLargeInt := ARegistroEmitente;
  qryCliente.Open();

  cliCliente.Close();
  cliCliente.Open();
end;

procedure TdmDados.Abrir_Tabela_Configuracao;
begin
  qryConfiguracao.Close();
  qryConfiguracao.Open();

  cliConfiguracao.Close();
  cliConfiguracao.Open();
end;

procedure TdmDados.Abrir_Tabela_Emitente;
begin
  qryEmitente.Close();
  qryEmitente.Open();

  cliEmitente.Close();
  cliEmitente.Open();
end;

procedure TdmDados.Abrir_Tabela_Estoque(ARegistroEmitente: Int64);
begin
  qryEstoque.Close();
  qryEstoque.ParamByName('PEMITENTE').AsLargeInt := ARegistroEmitente;
  qryEstoque.Open();

  cliEstoque.Close();
  cliEstoque.Open();
end;

procedure TdmDados.Abrir_Tabela_Funcionario(ARegistroEmitente: Int64);
begin
  qryFuncionarios.Close();
  qryFuncionarios.ParamByName('PEMITENTE').AsLargeInt := ARegistroEmitente;
  qryFuncionarios.Open();

  cliFuncionarios.Close();
  cliFuncionarios.Open();
end;

procedure TdmDados.Abrir_Tabelas_NFe;
var
  Sql: String;

begin
  Sql :=
    'SELECT *          '#13#10 +
    '  FROM NFE_CAB    '#13#10 +
    ' WHERE ID_NFE = -1';

  Consultar(qryNfeCab, Sql);

  cliNfeCab.Close();
  cliNfeCab.Open();

  Sql :=
    'SELECT *          '#13#10 +
    '  FROM NFE_ITENS  '#13#10 +
    ' WHERE ID_NFE = -1';

  Consultar(qryNfeItens, Sql);

  cliNfeItens.Close();
  cliNfeItens.Open();

  Sql :=
    'SELECT *            '#13#10 +
    '  FROM NFE_PAGAMENTO'#13#10 +
    ' WHERE ID_NFE = -1';

  Consultar(qryNfePagamento, Sql);

  cliNfePagamento.Close();
  cliNfePagamento.Open();
end;

procedure TdmDados.Abrir_Tabela_Venda(ARegistroEmitente: Int64);
var
  Sql: String;

begin
  Sql := Format(
    'SELECT *    '#13#10 +
    '  FROM VENDA'#13#10 +
    ' WHERE REGISTRO_EMITENTE = %d', [ARegistroEmitente]);

  qryVenda.Close();
  qryVenda.SQL.Clear();
  qryVenda.SQL.Add(Sql);
  qryVenda.Open();

  cliVenda.Filter   := '';
  cliVenda.Filtered := False;

  cliVenda.Close();
  cliVenda.Open();
  cliVenda.First();

  Abrir_Consulta_Venda(ARegistroEmitente);
end;

procedure TdmDados.Apagar_Cliente_Antes_Integrar(ARegistroEmitente: Int64);
begin
  delClientes.Close();
  delClientes.ParamByName('PEMITENTE').AsLargeInt := ARegistroEmitente;
  delClientes.ExecSQL();
end;

procedure TdmDados.Apagar_Estoque_Antes_Integrar(ARegistroEmitente: Int64);
begin
  delEstoques.Close();
  delEstoques.ParamByName('PEMITENTE').AsLargeInt := ARegistroEmitente;
  delEstoques.ExecSQL();
end;

procedure TdmDados.Apagar_Funcionario_Antes_Integrar(ARegistroEmitente: Int64);
begin
  delFuncionarios.Close();
  delFuncionarios.ParamByName('PEMITENTE').AsLargeInt := ARegistroEmitente;
  delFuncionarios.ExecSQL();
end;

procedure TdmDados.Apagar_Pagamento_Apos_Cancelar_Notas(AChave: String);
//var
//  Deletar: String;

begin
{  Deletar := Format(
    'DELETE                          '#13#10 +
    '  FROM NFE_PAGAMENTO            '#13#10 +
    ' WHERE ID_NFE IN (SELECT ID_NFE '#13#10 +
     '                   FROM NFE_CAB'#13#10 +
    '                   CHAVE = %s)',
    [QuotedStr(AChave)]);                       }

  delPagamentosAposCancelar.Close();
 // delPagamentosAposCancelar.SQL.Clear();
 // delPagamentosAposCancelar.SQL.Add(Deletar);
  delPagamentosAposCancelar.ParamByName('PCHAVE').AsString := AChave;
  delPagamentosAposCancelar.ExecSQL();
end;

procedure TdmDados.Atualizar_Dados_Apos_Cancelar_Nota_Fiscal(AChave, AMotivo,
  AXML, AProtocolo: String; AStatus: Int64);
begin
  uptAtualizaDadosNotaFiscalCancelamento.Close();
  uptAtualizaDadosNotaFiscalCancelamento.ParamByName('PCHAVE').AsString    := AChave;
  uptAtualizaDadosNotaFiscalCancelamento.ParamByName('PMOTIVO').AsString   := AMotivo;
  uptAtualizaDadosNotaFiscalCancelamento.ParamByName('PXML').AsString      := AXML;
  uptAtualizaDadosNotaFiscalCancelamento.ParamByName('PROTOCOLO').AsString := AProtocolo;
  uptAtualizaDadosNotaFiscalCancelamento.ParamByName('PSTATUS').AsLargeInt := AStatus;
  uptAtualizaDadosNotaFiscalCancelamento.ExecSQL();

  Apagar_Pagamento_Apos_Cancelar_Notas(AChave);
end;

procedure TdmDados.Atualizar_Dados_Apos_Emitir_Nota_Fiscal(
  ANotaFiscal: NotaFiscal);
//var
//  xml: String;

begin
//  xml := base64.EncodeString(ANotaFiscal.XMLAssinado);
  uptAtualizaDadosNotaFiscal.Close();
  uptAtualizaDadosNotaFiscal.ParamByName('PINFORMACAO_COMPLEMENTAR').AsString := ANotaFiscal.NFe.InfAdic.infCpl;
  uptAtualizaDadosNotaFiscal.ParamByName('PPROTOCOLO').AsString               := ANotaFiscal.NFe.procNFe.nProt;
  uptAtualizaDadosNotaFiscal.ParamByName('PXML').AsString                     := base64.EncodeString(ANotaFiscal.XMLAssinado);//xml;
  uptAtualizaDadosNotaFiscal.ParamByName('PCHAVE').AsString                   := ANotaFiscal.NumID; //Tratar_Chave_Nota_Fiscal(ANotaFiscal.NFe.infNFe.ID);
  uptAtualizaDadosNotaFiscal.ExecSQL();
end;

procedure TdmDados.Atualizar_Status_Nota_Fiscal(AChave: String;
  ACodigoStatus: Int64);
begin
  uptAtualizaStatusNotaFiscal.Close();
  uptAtualizaStatusNotaFiscal.ParamByName('PCHAVE').AsString    := AChave;//Tratar_Chave_Nota_Fiscal(AChave);
  uptAtualizaStatusNotaFiscal.ParamByName('PSTATUS').AsLargeInt := ACodigoStatus;
  uptAtualizaStatusNotaFiscal.ExecSQL();
end;

procedure TdmDados.cliConsultaNotasFiscaisVNFGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  if Sender.AsFloat > 0 then
    Text := FormatFloat('#,##0.00', Sender.AsFloat);
end;

procedure TdmDados.cliEstoquePRECO_VENDAGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
//'#,##0.00'
  Text := FormatFloat('#,##0.00', Sender.AsFloat);
//  Sender.DisplayText
end;

procedure TdmDados.Consultar(AQuery: TSQLQuery; ASql: String);
begin
  AQuery.Close();
  AQuery.SQL.Clear();
  AQuery.SQL.Add(ASql);
  AQuery.Open();
end;

procedure TdmDados.DataModuleCreate(Sender: TObject);
begin
  qryEmitente.Close();
  qryEmitente.Open();

  cliEmitente.Close();
  cliEmitente.Open();
end;

procedure TdmDados.Filtrar_Configuracao(AIdRegistroEmitente: Int64);
begin
  dmDados.cliConfiguracao.Filter   := Format('REGISTRO_EMITENTE = %d', [AIdRegistroEmitente]);
  dmDados.cliConfiguracao.Filtered := True;
end;

{procedure TdmDados.Finalizar_Venda_Com_F12(AGWCommerce: TObject; NFCe: TACBrNFe);
//var
//  IdNFE: Int64;

//  GWCommerce: TGWCommerce;

begin
  GWCommerce := AGWCommerce as TGWCommerce;

  IdNFE := Gerar_Id('GEN_NFE_CAB_ID');

  Abrir_Tabelas_NFe();

  cliNfeCab.Append();
  cliNfeCabID_NFE.AsLargeInt    := IdNFE;
  cliNfeCabIDE_SERIE.AsLargeInt := 1;
  cliNfeCabIDE_NNF.AsLargeInt   := Pegar_Proxima_Nota(GWCommerce.Emitente.Registro, cliNfeCabIDE_SERIE.AsLargeInt, 90);
  cliNfeCabIDE_NATOP.AsString   := 'VENDA';
  cliNfeCabIDE_MOD.AsLargeInt   := 90;

  Preencher_Emitente_Nota(GWCommerce.Emitente.Registro);
  Preencher_Cliente(GWCommerce.Emitente.Registro, GWCommerce.Cliente.Codigo_Cliente);

  cliNfeCabVPROD.AsFloat        := GWCommerce.Venda.Total;
  cliNfeCabVDESC.AsFloat        := GWCommerce.Venda.Desconto;
  cliNfeCabVNF.AsFloat          := GWCommerce.Venda.Total - GWCommerce.Venda.Desconto;
  cliNfeCabMODFRETE.AsLargeInt  := 0;
  cliNfeCabCD_STATUS.AsLargeInt := 100;
  cliNfeCab.Post();
  cliNfeCab.ApplyUpdates(0);

  Inserir_Itens(IdNFE, AGWCommerce);
  Inserir_Pagamentos(IdNFE, AGWCommerce);
end; }

function TdmDados.Gerar_Id(ANomeGenerator: String): Int64;
var
  Sql: String;

begin
  Sql := Format(
    'SELECT GEN_ID(%s, 1)'#13#10 +
    '  FROM RDB$DATABASE', [ANomeGenerator]);

  qrySequence.Close();
  qrySequence.SQL.Clear();
  qrySequence.SQL.Add(Sql);
  qrySequence.Open();

  Result := qrySequence.FieldByName('GEN_ID').AsLargeInt;
end;

{procedure TdmDados.Gerar_Nota_Fiscal(AGWCommerce: TObject; NFCe: TACBrNFe);
var
  IdNFE: Int64;

  GWCommerce: TGWCommerce;

begin
  GWCommerce := AGWCommerce as TGWCommerce;

  IdNFE := Gerar_Id('GEN_NFE_CAB_ID');

  Abrir_Tabelas_NFe();

  cliNfeCab.Append();
  cliNfeCabID_NFE.AsLargeInt    := IdNFE;
  cliNfeCabIDE_SERIE.AsLargeInt := 1;
  cliNfeCabIDE_NNF.AsLargeInt   := Pegar_Proxima_Nota(GWCommerce.Emitente.Registro, cliNfeCabIDE_SERIE.AsLargeInt, 90);
  cliNfeCabIDE_NATOP.AsString   := 'VENDA';
  cliNfeCabIDE_MOD.AsLargeInt   := 90;

  Preencher_Emitente_Nota(GWCommerce.Emitente.Registro);
  Preencher_Cliente(GWCommerce.Emitente.Registro, GWCommerce.Cliente.Codigo_Cliente);

  cliNfeCabVPROD.AsFloat        := GWCommerce.Venda.Total;
  cliNfeCabVDESC.AsFloat        := GWCommerce.Venda.Desconto;
  cliNfeCabVNF.AsFloat          := GWCommerce.Venda.Total - GWCommerce.Venda.Desconto;
  cliNfeCabMODFRETE.AsLargeInt  := 0;
  cliNfeCabCD_STATUS.AsLargeInt := 100;
  cliNfeCab.Post();
  cliNfeCab.ApplyUpdates(0);

  Inserir_Itens(IdNFE, AGWCommerce);
  Inserir_Pagamentos(IdNFE, AGWCommerce);
end;

procedure TdmDados.Inserir_Itens(AIdNFe: Int64; AGWCommerce: TObject);
begin

end;

procedure TdmDados.Inserir_Pagamentos(AIdNFe: Int64; AGWCommerce: TObject);
var
  GWCommerce: TGWCommerce;

  Pagamento: TPagamento;

begin
  GWCommerce := AGWCommerce as TGWCommerce;

  for Pagamento in GWCommerce.Venda.Pagamentos do
  begin
    cliNfePagamento.Append();
    cliNfePagamentoID_NFE_PAG.AsLargeInt    := Gerar_Id('GEN_NFE_PAGAMENTO_ID');
    cliNfePagamentoID_NFE.AsLargeInt        := AIdNFe;
    cliNfePagamentoREGISTRO_EMIT.AsLargeInt := cliNfeCabREGISTRO_EMIT.AsLargeInt;
    cliNfePagamentoTPAG.AsString            := Pagamento.Pegar_Tipo();
    cliNfePagamentoVPAG.AsFloat             := Pagamento.Pegar_Valor();
    cliNfePagamentoVTROCO.AsFloat           := GWCommerce.Venda.Troco;
    cliNfePagamentoINDPAG.AsLargeInt        := IfThen(Pagamento.Prazo > 0, 1, 0);

    if Pagamento.Tipo = fpCartaoCredito then
    begin
      cliNfePagamentoTBAND.AsString := Pagamento.Cartao.Pegar_Codigo_Bandeira();
      cliNfePagamentoCAUT.AsString  := Pagamento.Cartao.CodigoAutorizacao
    end;

    cliNfePagamento.Post();
    cliNfePagamento.ApplyUpdates(0);
  end;
end;}

procedure TdmDados.Inserir_Venda(AVenda: TObject);
var
  Insert: String;

  Venda: TVenda;

begin
  Venda        := AVenda as TVenda;
  Venda.Codigo := Gerar_Id('GEN_VENDA_CODIGO');
  Venda.MD5    := Venda.Gerar_MD5();

  Insert := Format(
    'INSERT INTO VENDA (CODIGO, CODIGO_PRODUTO, DESCRICAO_PRODUTO, MEDIDA, '#13#10 +
    '                   VALOR_UNITARIO, QUANTIDADE, MD5, REGISTRO_EMITENTE, CODIGO_PRODUTO_EXIBICAO)'#13#10 +
    '     VALUES (%d, %d, %s, %s, %s, %s, %s, %d, %d)', [Venda.Codigo, Venda.CodigoProduto,
      QuotedStr(Venda.DescricaoProduto), QuotedStr(Venda.Medida),
      StringReplace(FloatToStr(Venda.ValorUnitario), ',', '.', [rfReplaceAll]),
      StringReplace(FloatToStr(Venda.Quantidade), ',', '.', [rfReplaceAll]),
      QuotedStr(Venda.MD5), Venda.RegistroEmitente, Venda.CodigoProdutoExibicao]);

  qryVenda.Close();
  qryVenda.SQL.Clear();
  qryVenda.SQL.Add(Insert);
  qryVenda.ExecSQL();

  Abrir_Tabela_Venda(Venda.RegistroEmitente);
end;

procedure TdmDados.Integrar_Cliente(ACliente: TlkJSONobject;
  AIdEmitente: Int64);
begin
   NullStrictConvert := False;

  cliCliente.Filter   := Format('(CODIGO_CLIENTE = %s) AND (REGISTRO_EMIT = %d)',
    [ACliente.Field['codigo_cliente'].Value, AIdEmitente]);
  cliCliente.Filtered := True;

  if cliCliente.RecordCount > 0 then
    cliCliente.Edit()
  else
    cliCliente.Insert();

  cliClienteCODIGO_CLIENTE.AsVariant := ACliente.Field['codigo_cliente'].Value;
  cliClienteREGISTRO_EMIT.AsVariant  := ACliente.Field['registro_emit'].Value;
  cliClienteNOME.AsString            := ACliente.Field['nome'].Value;
  cliClienteCONTATO.AsString         := ACliente.Field['contato'].Value;
  cliClienteCPF.AsString             := ACliente.Field['cpf'].Value;
  cliClienteRG.AsString              := ACliente.Field['rg'].Value;
  cliClienteIMUNICIPAL.AsString      := ACliente.Field['imunicipal'].Value;
  cliClienteSUFRAMA.AsString         := ACliente.Field['suframa'].Value;
  cliClienteINDIEDEST.AsString       := ACliente.Field['indIEDest'].Value;
  cliClienteENDERECO.AsString        := ACliente.Field['endereco'].Value;
  cliClienteNUMERO.AsString          := ACliente.Field['numero'].Value;
  cliClienteCOMPLEMENTO.AsString     := ACliente.Field['complemento'].Value;
  cliClienteBAIRRO.AsString          := ACliente.Field['bairro'].Value;
  cliClienteCIDADE.AsString          := ACliente.Field['cidade'].Value;
  cliClienteCD_CIDADE.AsString       := ACliente.Field['cd_cidade'].Value;
  cliClienteESTADO.AsString          := ACliente.Field['estado'].Value;
  cliClienteCD_ESTADO.AsString       := ACliente.Field['cd_estado'].Value;
  cliClienteCD_PAIS.AsString         := ACliente.Field['cd_pais'].Value;
  cliClientePAIS.AsString            := ACliente.Field['pais'].Value;
  cliClienteCEP.AsString             := ACliente.Field['cep'].Value;
  cliClienteTELEFONE.AsString        := ACliente.Field['telefone'].Value;
  cliClienteCELULAR.AsString         := ACliente.Field['celular'].Value;
  cliClienteEMAIL.AsString           := ACliente.Field['email'].Value;
  cliClienteDATA_NASCIMENTO.AsVariant:= ACliente.Field['data_nascimento'].Value;
  cliClienteMAE.AsString             := ACliente.Field['mae'].Value;
  cliClientePAI.AsString             := ACliente.Field['pai'].Value;
  cliClienteDEPENDENTES.AsString     := ACliente.Field['dependentes'].Value;
  cliClienteLIMITE.AsVariant         := StringReplace(ACliente.Field['limite'].Value, '.', ',', [rfReplaceAll]);
  cliClienteBLOQUEADO.AsVariant      := ACliente.Field['bloqueado'].Value;
  cliClienteCONVENIO.AsString        := ACliente.Field['convenio'].Value;
  cliClienteDATA_CADASTRO.AsVariant  := ACliente.Field['data_cadastro'].Value;
  cliClienteSENHA.AsString           := ACliente.Field['senha'].Value;
  cliClienteOBSERVACAO.AsString      := ACliente.Field['observacao'].Value;
  cliClienteCONS_FINAL.AsVariant     := ACliente.Field['cons_final'].Value;

  cliCliente.Post();
  cliCliente.ApplyUpdates(0);

  cliCliente.Filtered := False;
end;

procedure TdmDados.Integrar_Estoque(AEstoque: TlkJSONobject; AIdEmitente: Int64);
{var
  FloatValido: Double;

  InteiroValido: Int64;

  DataValida: TDateTime;  }

begin
 NullStrictConvert := False;

  cliEstoque.Filter   := Format('(CODIGO_PRODUTO = %s) AND (REGISTRO_EMIT = %d)',
    [AEstoque.Field['codigo_produto'].Value, AIdEmitente]);
  cliEstoque.Filtered := True;

  if cliEstoque.RecordCount = 0 then
    cliEstoque.Insert()
  else
    cliEstoque.Edit();

  cliEstoqueCODIGO_PRODUTO.AsLargeInt := AEstoque.Field['codigo_produto'].Value;
  cliEstoqueCODIGO.AsLargeInt         := AEstoque.Field['codigo'].Value;
  cliEstoqueREGISTRO_EMIT.AsLargeInt  := AEstoque.Field['registro_emit'].Value;
  cliEstoqueDESCRICAO.AsString        := AEstoque.Field['descricao'].Value;

//  if TryStrToInt64(AEstoque.Field['fornecedor'].Value, InteiroValido) then
    cliEstoqueFORNECEDOR.AsLargeInt := AEstoque.Field['fornecedor'].Value;

  cliEstoqueMedida.AsString := AEstoque.Field['medida'].Value;

//  if TryStrToFloat(AEstoque.Field['preco_venda'].Value, FloatValido) then
    cliEstoquePRECO_VENDA.AsVariant := StringReplace(AEstoque.Field['preco_venda'].Value, '.', ',', [rfReplaceAll]);

//  if TryStrToFloat(AEstoque.Field['custocompra'].Value, FloatValido) then
    cliEstoqueCUSTOCOMPRA.AsVariant := StringReplace(AEstoque.Field['custocompra'].Value, '.', ',', [rfReplaceAll]);

//  if TryStrToFloat(AEstoque.Field['customedio'].Value, FloatValido) then
    cliEstoqueCUSTOMEDIO.AsVariant := StringReplace(AEstoque.Field['customedio'].Value, '.', ',', [rfReplaceAll]);

//  if TryStrToFloat(AEstoque.Field['qtd_compra'].Value, FloatValido) then
    cliEstoqueQTD_COMPRA.AsVariant := StringReplace(AEstoque.Field['qtd_compra'].Value, '.', ',', [rfReplaceAll]);

//  if TryStrToFloat(AEstoque.Field['qtd_atual'].Value, FloatValido) then
    cliEstoqueQTD_ATUAL.AsVariant := StringReplace(AEstoque.Field['qtd_atual'].Value, '.', ',', [rfReplaceAll]);

//  if TryStrToFloat(AEstoque.Field['qtd_minima'].Value, FloatValido) then
    cliEstoqueQTD_MINIMA.AsVariant := StringReplace(AEstoque.Field['qtd_minima'].Value, '.', ',', [rfReplaceAll]);

//  if TryStrToFloat(AEstoque.Field['qtd_inicio'].Value, FloatValido) then
    cliEstoqueQTD_INICIO.AsVariant := StringReplace(AEstoque.Field['qtd_inicio'].Value, '.', ',', [rfReplaceAll]);

//  if TryStrToDate(AEstoque.Field['data_inicio'].Value, DataValida) then
    cliEstoqueDATA_INICIO.AsVariant := AEstoque.Field['data_inicio'].Value;

//    if TryStrToDate(AEstoque.Field['ult_compra'].Value, DataValida) then
      cliEstoqueULT_COMPRA.AsVariant := AEstoque.Field['ult_compra'].Value;

//  if TryStrToDate(AEstoque.Field['ult_venda'].Value, DataValida) then
    cliEstoqueULT_VENDA.AsVariant := AEstoque.Field['ult_venda'].Value;

  cliEstoqueLOCAL.AsString := AEstoque.Field['local'].Value;

//  if TryStrToFloat(AEstoque.Field['ipi'].Value, FloatValido) then
    cliEstoqueIPI.AsVariant := StringReplace(AEstoque.Field['ipi'].Value, '.', ',', [rfReplaceAll]);

  cliEstoqueST.AsString := AEstoque.Field['st'].Value;

//  if TryStrToFloat(AEstoque.Field['comissao'].Value, FloatValido) then
    cliEstoqueCOMISSAO.AsVariant :=  StringReplace(AEstoque.Field['comissao'].Value, '.', ',', [rfReplaceAll]);

//  if TryStrToFloat(AEstoque.Field['margem_lucro'].Value, FloatValido) then
    cliEstoqueMARGEM_LUCRO.AsVariant :=  StringReplace(AEstoque.Field['margem_lucro'].Value, '.', ',', [rfReplaceAll]);

  cliEstoqueFOTO.AsVariant         := AEstoque.Field['foto'].Value;
  cliEstoqueIAT.AsString           := AEstoque.Field['iat'].Value;
  cliEstoqueIPPT.AsString          := AEstoque.Field['ippt'].Value;
  cliEstoqueCST_IPI.AsString       := AEstoque.Field['cst_ipi'].Value;
  cliEstoqueCODSELOIPI.AsString    := AEstoque.Field['codseloipi'].Value;
  cliEstoqueCOD_ENQ_IPI.AsString   := AEstoque.Field['cod_enq_ipi'].Value;
  cliEstoqueTIPO_ITEM.AsString     := AEstoque.Field['tipo_item'].Value;
  cliEstoqueCSOSN.AsString         := AEstoque.Field['csosn'].Value;
  cliEstoqueCODIGO_BARRAS.AsString := AEstoque.Field['codigo_barras'].Value;
  cliEstoqueNCM.AsString           := AEstoque.Field['ncm'].Value;
  cliEstoqueCEST.AsString          := AEstoque.Field['cest'].Value;

//  if TryStrToFloat(AEstoque.Field['ibpt_f'].Value, FloatValido) then
    cliEstoqueIBPT_F.AsVariant :=  StringReplace(AEstoque.Field['ibpt_f'].Value, '.', ',', [rfReplaceAll]);

//  if TryStrToFloat(AEstoque.Field['ibpt_fi'].Value, FloatValido) then
    cliEstoqueIBPT_FI.AsVariant :=  StringReplace(AEstoque.Field['ibpt_fi'].Value, '.', ',', [rfReplaceAll]);

//  if TryStrToFloat(AEstoque.Field['ibpt_est'].Value, FloatValido) then
    cliEstoqueIBPT_EST.AsVariant :=  StringReplace(AEstoque.Field['ibpt_est'].Value, '.', ',', [rfReplaceAll]);

//  if TryStrToFloat(AEstoque.Field['ibpt_mun'].Value, FloatValido) then
    cliEstoqueIBPT_MUn.AsVariant :=  StringReplace(AEstoque.Field['ibpt_mun'].Value, '.', ',', [rfReplaceAll]);

  cliEstoqueORIGEM.AsString := AEstoque.Field['origem'].Value;

//  if TryStrToFloat(AEstoque.Field['grupo'].Value, FloatValido) then
    cliEstoqueGRUPO.AsLargeInt := AEstoque.Field['grupo'].Value;

//  if TryStrToFloat(AEstoque.Field['marca'].Value, FloatValido) then
    cliEstoqueMARCA.AsLargeInt := AEstoque.Field['marca'].Value;

//  if TryStrToFloat(AEstoque.Field['desconto_maximo'].Value, FloatValido) then
    cliEstoqueDESCONTO_MAXIMO.AsVariant := StringReplace(AEstoque.Field['desconto_maximo'].Value, '.', ',', [rfReplaceAll]);

//  if TryStrToFloat(AEstoque.Field['mva'].Value, FloatValido) then
    cliEstoqueMVA.AsVariant := StringReplace(AEstoque.Field['mva'].Value, '.', ',', [rfReplaceAll]);

  cliEstoqueCFOP.AsString      := AEstoque.Field['cfop'].Value;
  cliEstoqueCFOP_NFCE.AsString := AEstoque.Field['cfop_nfce'].Value;
  cliEstoqueINDESCALA.AsString := AEstoque.Field['indEscala'].Value;
  cliEstoqueCNPJFAB.AsString   := AEstoque.Field['CNPJFab'].Value;
  cliEstoqueCODPIS.AsString    := AEstoque.Field['codpis'].Value;

//  if TryStrToFloat(AEstoque.Field['porcpis'].Value, FloatValido) then
    cliEstoquePORCPIS.AsVariant := StringReplace(AEstoque.Field['porcpis'].Value, '.', ',', [rfReplaceAll]);

  cliEstoqueCODCOFINS.AsString     := AEstoque.Field['codcofins'].Value;
  cliEstoquePISCOFINS_ENT.AsString := AEstoque.Field['piscofins_ent'].Value;

//  if TryStrToFloat(AEstoque.Field['porpis_ent'].Value, FloatValido) then
    cliEstoquePORPIS_ENT.AsVariant := StringReplace(AEstoque.Field['porpis_ent'].Value, '.', ',', [rfReplaceAll]);

//  if TryStrToFloat(AEstoque.Field['porcofins_ent'].Value, FloatValido) then
    cliEstoquePORCOFINS_ENT.AsVariant := StringReplace(AEstoque.Field['porcofins_ent'].Value, '.', ',', [rfReplaceAll]);

//  if TryStrToFloat(AEstoque.Field['porcofins'].Value, FloatValido) then
    cliEstoquePORCOFINS.AsVariant :=StringReplace(AEstoque.Field['porcofins'].Value, '.', ',', [rfReplaceAll]);

  cliEstoqueCOD_BENEFICIO.AsString := AEstoque.Field['cod_beneficio'].Value;
  cliEstoqueCPRODANP.AsString      := AEstoque.Field['cProdANP'].Value;
  cliEstoqueDESCANP.AsString       := AEstoque.Field['descANP'].Value;

//  if TryStrToFloat(AEstoque.Field['vPart'].Value, FloatValido) then
    cliEstoqueVPART.AsVariant := StringReplace(AEstoque.Field['vPart'].Value, '.', ',', [rfReplaceAll]);

//  if TryStrToFloat(AEstoque.Field['pGLP'].Value, FloatValido) then
    cliEstoquePGLP.AsVariant := StringReplace(AEstoque.Field['pGLP'].Value, '.', ',', [rfReplaceAll]);

//  if TryStrToFloat(AEstoque.Field['pGNn'].Value, FloatValido) then
    cliEstoquePGNN.AsVariant := StringReplace(AEstoque.Field['pGNn'].Value, '.', ',', [rfReplaceAll]);

//  if TryStrToFloat(AEstoque.Field['pGNi'].Value, FloatValido) then
    cliEstoquePGNI.AsVariant := StringReplace(AEstoque.Field['pGNi'].Value, '.', ',', [rfReplaceAll]);

  cliEstoqueCOD_ANVISA.AsString := AEstoque.Field['cod_anvisa'].Value;
  cliEstoqueVALIDADE.AsString   := AEstoque.Field['validade'].Value;

  cliEstoque.Post();
  cliEstoque.ApplyUpdates(0);

  cliEstoque.Filtered := False;
end;

procedure TdmDados.Integrar_Funcionarios(AFuncionario: TlkJSONobject;
  AIdEmitente: Int64);
begin
   NullStrictConvert := False;

  cliFuncionarios.Filter   := Format('(ID_FUNCIONARIO = %s) AND (REGISTRO_EMIT = %d)',
    [AFuncionario.Field['id_funcionario'].Value, AIdEmitente]);
  cliFuncionarios.Filtered := True;

  if cliFuncionarios.RecordCount > 0 then
    cliFuncionarios.Edit()
  else
    cliFuncionarios.Insert();

  cliFuncionariosID_FUNCIONARIO.AsVariant  := AFuncionario.Field['id_funcionario'].Value;
  cliFuncionariosREGISTRO_EMIT.AsVariant   := AFuncionario.Field['registro_emit'].Value;
  cliFuncionariosNOME_FUNCIONARIO.AsString := AFuncionario.Field['nome_funcionario'].Value;
  cliFuncionariosCPF.AsString              := AFuncionario.Field['cpf'].Value;
  cliFuncionariosDATA_NASCIMENTO.AsVariant := AFuncionario.Field['data_nascimento'].Value;
  cliFuncionariosVENDA.AsVariant           := AFuncionario.Field['venda'].Value;

  cliFuncionarios.Post();
  cliFuncionarios.ApplyUpdates(0);

  cliFuncionarios.Filtered := False;
end;

function TdmDados.Pegar_Numero_Proxima_Nota(AEmitente, ASerie,
  AModelo: Int64): Int64;
var
  ProximaNota: Int64;

begin
  if AModelo = 90 then
  begin
    qryProximaNota.Close();
    qryProximaNota.ParamByName('PEMITENTE').AsLargeInt := AEmitente;
    qryProximaNota.ParamByName('PSERIE').AsLargeInt    := ASerie;
    qryProximaNota.ParamByName('PMODELO').AsLargeInt   := AModelo;
    qryProximaNota.Open();

    if (qryProximaNota.FieldByName('IDE_NNF').AsLargeInt = 0) or
      (qryProximaNota.FieldByName('IDE_NNF').IsNull) then
      ProximaNota := 1
    else
      ProximaNota := qryProximaNota.FieldByName('IDE_NNF').AsLargeInt + 1;
  end
  else
  begin
    Abrir_Tabela_Configuracao();
    Filtrar_Configuracao(AEmitente);

    ProximaNota              := cliConfiguracaoNFCE_NUMERO_EMITIDO.AsLargeInt + 1;
    cliConfiguracao.Filtered := False;

    uptAtualizaUltimaNFCe.Close();
    uptAtualizaUltimaNFCe.ParamByName('PEMITENTE').AsLargeInt := AEmitente;
    uptAtualizaUltimaNFCe.ParamByName('PSERIE').AsLargeInt    := ASerie;
    uptAtualizaUltimaNFCe.ExecSQL();
  end;

  Result := ProximaNota;
end;

{function TdmDados.Pegar_Proxima_Nota(AEmitente, ASerie, AModelo: Int64): Int64;
begin
  qryProximaNota.Close();
  qryProximaNota.ParamByName('PEMITENTE').AsLargeInt := AEmitente;
  qryProximaNota.ParamByName('PSERIE').AsLargeInt    := ASerie;
  qryProximaNota.ParamByName('PMODELO').AsLargeInt   := AModelo;
  qryProximaNota.Open();

  if (qryProximaNota.FieldByName('IDE_NNF').AsLargeInt = 0) or
    (qryProximaNota.FieldByName('IDE_NNF').IsNull) then
    Result := 1
  else
    Result := qryProximaNota.FieldByName('IDE_NNF').AsLargeInt + 1;
end;}

procedure TdmDados.Preencher_Cliente(ARegistroEmitente: Int64; ACliente: TCliente);
begin
  try
    Abrir_Tabela_Cliente(ARegistroEmitente);

    cliCliente.Filter   := Format('CODIGO_CLIENTE = %d', [ACliente.CodigoCliente]);
    cliCliente.Filtered := True;

    if cliCliente.RecordCount > 0 then
    begin
      cliNfeCabID_CLIENTE.AsLargeInt  := ACliente.CodigoCliente;
      cliNfeCabDEST_CNPJ_CPF.AsString := cliClienteCPF.AsString;
      cliNfeCabDEST_XNOME.AsString    := cliClienteNOME.AsString;
      cliNfeCabDEST_XLGR.AsString     := cliClienteENDERECO.AsString;
      cliNfeCabDEST_NRO.AsString      := cliClienteNUMERO.AsString;
      cliNfeCabDEST_XCPL.AsString     := cliClienteCOMPLEMENTO.AsString;
      cliNfeCabDEST_XBAIRRO.AsString  := cliClienteBAIRRO.AsString;
      cliNfeCabDEST_CMUN.AsString     := cliClienteCD_ESTADO.AsString;
      cliNfeCabDEST_XMUN.AsString     := cliClienteCIDADE.AsString;
      cliNfeCabDEST_UF.AsString       := cliClientePAIS.AsString;
      cliNfeCabDEST_CEP.AsString      := cliClienteCEP.AsString;
      cliNfeCabDEST_CPAIS.AsString    := cliClienteCD_PAIS.AsString;
      cliNfeCabDEST_XPAIS.AsString    := 'BRASIL';
      cliNfeCabDEST_FONE.AsString     := cliClienteTELEFONE.AsString;
      cliNfeCabDEST_EMAIL.AsString    := cliClienteEMAIL.AsString;

      if Trim(cliClienteINDIEDEST.AsString) <> '' then
        cliNfeCabDEST_INDIEDEST.AsLargeInt := cliClienteINDIEDEST.AsLargeInt;
    end
    else if not ACliente.Cadastrado then
    begin
      cliNfeCabDEST_XNOME.AsString    := ACliente.Nome;
      cliNfeCabDEST_CNPJ_CPF.AsString := ACliente.CPF;
    end;
  finally
    cliCliente.Filtered := False;
  end;
end;

procedure TdmDados.Preencher_Emitente_Nota(ARegistroEmitente: Int64; ANotaFiscal: NotaFiscal);
begin
  //Filtrar Emitente
  try
    cliEmitente.Filter  := Format('REGISTRO = %d', [ARegistroEmitente]);
    cliEmitente.Filtered:= True;

    cliNfeCabREGISTRO_EMIT.AsLargeInt := ARegistroEmitente;
    cliNfeCabIDE_CUF.AsLargeInt       := cliEmitenteCD_ESTADO.AsLargeInt;
    cliNfeCabIDE_DHEMI.AsDateTime     := Now();
    cliNfeCabIDE_TPNF.AsLargeInt      := StrToInt(tpNFToStr(ANotaFiscal.NFe.Ide.tpNF));//Ord(ANotaFiscal.NFe.Ide.tpNF);
    cliNfeCabIDE_IDDEST.AsLargeInt    := StrToInt(DestinoOperacaoToStr(ANotaFiscal.NFe.Ide.idDest));//Ord(ANotaFiscal.NFe.Ide.idDest) + 1;
    cliNfeCabIDE_CMUNFG.AsString      := cliEmitenteCD_CIDADE.AsString;
    cliNfeCabIDE_TP_IMP.AsLargeInt    := StrToInt(TpImpToStr(ANotaFiscal.NFe.Ide.tpImp));// Ord(ANotaFiscal.NFe.Ide.tpImp);
    cliNfeCabIDE_TPEMIS.AsLargeInt    := StrToInt(TpEmisToStr(ANotaFiscal.NFe.Ide.tpEmis));//Ord(ANotaFiscal.NFe.Ide.tpEmis) + 1;
    cliNfeCabIDE_TPAMB.AsLargeInt     := StrToInt(TpAmbToStr(ANotaFiscal.NFe.Ide.tpAmb));// Ord(ANotaFiscal.NFe.Ide.tpAmb) + 1;
    cliNfeCabIDE_FINNFE.AsLargeInt    := StrToInt(FinNFeToStr(ANotaFiscal.NFe.Ide.finNFe));//Ord(ANotaFiscal.NFe.Ide.finNFe) + 1;
    cliNfeCabIDE_INDFINAL.AsLargeInt  := StrToInt(ConsumidorFinalToStr(ANotaFiscal.NFe.Ide.indFinal));//Ord(ANotaFiscal.NFe.Ide.indFinal);
    cliNfeCabIDE_INDPRES.AsLargeInt   := StrToInt(PresencaCompradorToStr(ANotaFiscal.NFe.Ide.indPres));//Ord(ANotaFiscal.NFe.Ide.indPres);
    cliNfeCabIDE_PROCEMI.AsLargeInt   := StrToInt(procEmiToStr(ANotaFiscal.NFe.Ide.procEmi));//Ord(ANotaFiscal.NFe.Ide.procEmi);
    cliNfeCabEMIT_CNPJ_CPF.AsString   := cliEmitenteCNPJ.AsString;
    cliNfeCabEMIT_XNOME.AsString      := cliEmitenteNOME.AsString;
    cliNfeCabEMIT_XFANT.AsString      := cliEmitenteNOME_FANTASIA.AsString;
    cliNfeCabEMIT_XLGR.AsString       := cliEmitenteENDERECO.AsString;
    cliNfeCabEMIT_NRO.AsString        := cliEmitenteNUMERO.AsString;
    cliNfeCabEMIT_XBAIRRO.AsString    := cliEmitenteBAIRRO.AsString;
    cliNfeCabEMIT_CMUN.AsString       := cliEmitenteCD_CIDADE.AsString;
    cliNfeCabEMIT_XMUN.AsString       := cliEmitenteMUNICIPIO.AsString;
    cliNfeCabEMIT_CEP.AsString        := cliEmitenteCEP.AsString;
    cliNfeCabEMIT_UF.AsString         := cliEmitenteESTADO.AsString;
    cliNfeCabEMIT_CPAIS.AsLargeInt    := 1058;
    cliNfeCabEMIT_XPAIS.AsString      := 'BRASIL';
    cliNfeCabEMIT_FONE.AsString       := cliEmitenteTELEFONE.AsString;
    cliNfeCabEMIT_IE.AsString         := cliEmitenteIE.AsString;
    cliNfeCabEMIT_IM.AsString         := cliEmitenteIMUNICIPAL.AsString;
    cliNfeCabEMIT_CNAE.AsString       := cliEmitenteCNAE.AsString;

    if Trim(cliEmitenteCRT.AsString) = '' then
      cliNfeCabEMIT_CRT.AsLargeInt := 1
    else
      cliNfeCabEMIT_CRT.AsLargeInt := StrToInt(cliEmitenteCRT.AsString);
  finally
    cliEmitente.Filtered := False;
  end;
end;

procedure TdmDados.Registrar_NFE_CAB(AGWCommerce: TObject; ANotaFiscal: NotaFiscal);
var
  IdNFE: Int64;

  GWCommerce: TGWCommerce;

begin
  GWCommerce := AGWCommerce as TGWCommerce;
  IdNFE      := Gerar_Id('GEN_NFE_CAB_ID');

  Abrir_Tabelas_NFe();

  cliNfeCab.Append();
  cliNfeCabID_NFE.AsLargeInt    := IdNFE;
  cliNfeCabIDE_SERIE.AsLargeInt := ANotaFiscal.NFe.Ide.serie;
  cliNfeCabIDE_NNF.AsLargeInt   := ANotaFiscal.NFe.Ide.nNF;
  cliNfeCabIDE_NATOP.AsString   := 'VENDA';
  cliNfeCabIDE_MOD.AsLargeInt   := ANotaFiscal.NFe.Ide.modelo;
  cliNfeCabCHAVE.AsString       := ANotaFiscal.NumID; //Tratar_Chave_Nota_Fiscal(ANotaFiscal.NFe.infNFe.ID);
  cliNfeCabIDE_VERPROC.AsString := ANotaFiscal.NFe.Ide.verProc;

  Preencher_Emitente_Nota(GWCommerce.Emitente.Registro, ANotaFiscal);
  Preencher_Cliente(GWCommerce.Emitente.Registro, GWCommerce.Cliente);

  cliNfeCabVPROD.AsFloat        := ANotaFiscal.NFe.Total.ICMSTot.vProd;//GWCommerce.Venda.Total;
  cliNfeCabVDESC.AsFloat        := ANotaFiscal.NFe.Total.ICMSTot.vDesc; //GWCommerce.Venda.Desconto;
  cliNfeCabVNF.AsFloat          := ANotaFiscal.NFe.Total.ICMSTot.vNF; //GWCommerce.Venda.Total - GWCommerce.Venda.Desconto;
  cliNfeCabMODFRETE.AsLargeInt  := StrToInt(modFreteToStr(ANotaFiscal.NFe.Transp.modFrete));
  cliNfeCabVTOTTRIB.AsFloat     := ANotaFiscal.NFe.Total.ICMSTot.vTotTrib;
  cliNfeCabCD_STATUS.AsLargeInt := 0;

  if GWCommerce.IdVendedor > 0 then
    cliNfeCabID_VENDEDOR.AsLargeInt := GWCommerce.IdVendedor;

  cliNfeCab.Post();
  cliNfeCab.ApplyUpdates(0);

  Registrar_NFE_Itens(IdNFE, GWCommerce.Emitente.Registro, ANotaFiscal);
  //Inserir_Pagamentos(IdNFE, AGWCommerce);
  Registrar_NFE_Pagamentos(IdNFE, GWCommerce.Emitente.Registro, ANotaFiscal);
end;

procedure TdmDados.Registrar_NFE_Itens(AIdNFe, AIdRegistroEmitente: Int64; ANotaFiscal: NotaFiscal);
var
  I: Integer;

  Item: TDetCollectionItem;

//  Estoque: TEstoque;

//  GWCommerce: TGWCommerce;

//  Venda: TVenda;

begin
//  GWCommerce := AGWCommerce as TGWCommerce;

  for I := 0 to ANotaFiscal.NFe.Det.Count -1 do
  begin
    Item := ANotaFiscal.NFe.Det.Items[I];

    cliNfeItens.Append();
    cliNfeItensIDNFE_ITENS.AsLargeInt   := Gerar_Id('GEN_NFE_ITENS_ID');
    cliNfeItensREGISTRO_EMIT.AsLargeInt := AIdRegistroEmitente;//GWCommerce.Emitente.Registro;//cliNfeCabREGISTRO_EMIT.AsLargeInt;
    cliNfeItensID_NFE.AsLargeInt        := AIdNFe;
    cliNfeItensCPROD.AsLargeInt         := StrToInt64(Item.Prod.cProd);// Estoque.CodigoProduto;
    cliNfeItensCEAN.AsString            := Item.Prod.cEAN;// Estoque.CodigoBarras;
    cliNfeItensXPROD.AsString           := Item.Prod.xProd;//Estoque.Descricao;
    cliNfeItensNCM.AsString             := Item.Prod.NCM;// Estoque.NCM;
    cliNfeItensCEST.AsString            := Item.Prod.CEST;// Estoque.CEST;
    cliNfeItensINDESCALA.AsString       := IfThen(Item.Prod.indEscala = ieRelevante, 'S', 'N');
    cliNfeItensCNPJFAB.AsString         := Item.Prod.CNPJFab; //Estoque.CNPJFab;
    cliNfeItensUCOM.AsString            := Item.Prod.uCom;//Estoque.Medida;
    cliNfeItensQCOM.AsFloat             := Item.Prod.qCom;// Venda.Quantidade;
    cliNfeItensVUNCOM.AsFloat           := Item.Prod.qCom;//Venda.Quantidade;
    cliNfeItensVPROD.AsFloat            := Item.Prod.vProd;//Venda.ValorBruto;
    cliNfeItensCEANTRIB.AsString        := Item.Prod.cEANTrib;//Estoque.CodigoBarras;
    cliNfeItensUTRIB.AsString           := Item.Prod.uCom;//Estoque.Medida;
    cliNfeItensQTRIB.AsFloat            := Item.Prod.qCom;//Venda.Quantidade;
    cliNfeItensVUNTRIB.AsFloat          := Item.Prod.qCom;//Venda.Quantidade;
    cliNfeItensVDESC.AsFloat            := Item.Prod.vDesc;//Venda.Desconto.Valor;
    cliNfeItensINDTOT.AsLargeInt        := StrToInt(indTotToStr(Item.Prod.IndTot));// Ord(Item.Prod.IndTot); //1;
    cliNfeItensNITEMPED.AsLargeInt      := Item.Prod.nItem; //Venda.Ordem;
    cliNfeItensORIG.AsLargeInt          := StrToInt(OrigToStr(Item.Imposto.ICMS.orig));// Ord(Item.Imposto.ICMS.orig);
    cliNfeItensCST_ICMS.AsString        := CSOSNIcmsToStr(Item.Imposto.ICMS.CSOSN);
    cliNfeItensVTOTTRIB.AsFloat         := Item.Imposto.vTotTrib;

    if Item.Prod.comb.cProdANP > 0 then
    begin
      cliNfeItensCPRODANP.AsString := IntToStr(Item.Prod.comb.cProdANP);
      cliNfeItensDESCANP.AsString  := Item.Prod.comb.descANP;
      cliNfeItensVPART.AsFloat     := Item.Prod.comb.vPart;
      cliNfeItensPGLP.AsFloat      := Item.Prod.comb.pGLP;
      cliNfeItensPGNN.AsFloat      := Item.Prod.comb.pGNn;
      cliNfeItensPGNI.AsFloat      := Item.Prod.comb.pGNi;
    end
    else
    begin
      cliNfeItensCPRODANP.AsString := '';
      cliNfeItensDESCANP.AsString  := '';
      cliNfeItensVPART.AsFloat     := 0;
      cliNfeItensPGLP.AsFloat      := 0;
      cliNfeItensPGNN.AsFloat      := 0;
      cliNfeItensPGNI.AsFloat      := 0;
    end;

    {if Trim(Estoque.Origem) <> '' then
      cliNfeItensORIG.AsLargeInt        := StrToInt(Estoque.Origem)
    else
      cliNfeItensORIG.AsLargeInt        := 0;

    case Item.Imposto.ICMS.CSOSN of
      csosn101: cliNfeItensCST_ICMS.AsString := '101';
      csosn102: cliNfeItensCST_ICMS.AsString := '102';
      csosn103: cliNfeItensCST_ICMS.AsString := '103';
      csosn201: cliNfeItensCST_ICMS.AsString := '201';
      csosn202: cliNfeItensCST_ICMS.AsString := '202';
      csosn203: cliNfeItensCST_ICMS.AsString := '203';
      csosn300: cliNfeItensCST_ICMS.AsString := '300';
      csosn400: cliNfeItensCST_ICMS.AsString := '400';
      csosn500: cliNfeItensCST_ICMS.AsString := '500';
      csosn900: cliNfeItensCST_ICMS.AsString := '900';
    end;  }

//    cliNfeItensCST_ICMS.AsString        := Item.Imposto.ICMS.CSOSN; //Estoque.CSOSN;
    cliNfeItensMODBCST.AsLargeInt  := StrToInt(modBCSTToStr(Item.Imposto.ICMS.modBCST));//Ord(Item.Imposto.ICMS.modBCST);

    if Trim(Item.Prod.CFOP) <> '' then
      cliNfeItensCFOP.AsLargeInt := StrToInt(Item.Prod.CFOP); //StrToInt64(Estoque.CFOPNfce);
    cliNfeItens.Post();
    cliNfeItens.ApplyUpdates(0);
  end;

{  GWCommerce := AGWCommerce as TGWCommerce;

  for Venda in GWCommerce.Venda.Itens do
  begin
    Estoque := GWCommerce.Estoque.Buscar(Venda.CodigoProduto);

    cliNfeItens.Append();

    cliNfeItensIDNFE_ITENS.AsLargeInt   := Gerar_Id('GEN_NFE_ITENS_ID');
    cliNfeItensREGISTRO_EMIT.AsLargeInt := cliNfeCabREGISTRO_EMIT.AsLargeInt;
    cliNfeItensID_NFE.AsLargeInt        := AIdNFe;
    cliNfeItensCPROD.AsLargeInt         := Estoque.CodigoProduto;
    cliNfeItensCEAN.AsString            := Estoque.CodigoBarras;
    cliNfeItensXPROD.AsString           := Estoque.Descricao;
    cliNfeItensNCM.AsString             := Estoque.NCM;
    cliNfeItensCEST.AsString            := Estoque.CEST;
    cliNfeItensINDESCALA.AsString       := Estoque.IndEscala;
    cliNfeItensCNPJFAB.AsString         := Estoque.CNPJFab;
    cliNfeItensUCOM.AsString            := Estoque.Medida;
    cliNfeItensQCOM.AsFloat             := Venda.Quantidade;
    cliNfeItensVUNCOM.AsFloat           := Venda.Quantidade;
    cliNfeItensVPROD.AsFloat            := Venda.ValorBruto;
    cliNfeItensCEANTRIB.AsString        := Estoque.CodigoBarras;
    cliNfeItensUTRIB.AsString           := Estoque.Medida;
    cliNfeItensQTRIB.AsFloat            := Venda.Quantidade;
    cliNfeItensVUNTRIB.AsFloat          := Venda.Quantidade;
    cliNfeItensVDESC.AsFloat            := Venda.Desconto.Valor;
    cliNfeItensINDTOT.AsLargeInt        := 1;
    cliNfeItensNITEMPED.AsLargeInt      := Venda.Ordem;

    if Trim(Estoque.Origem) <> '' then
      cliNfeItensORIG.AsLargeInt        := StrToInt(Estoque.Origem)
    else
      cliNfeItensORIG.AsLargeInt        := 0;
    cliNfeItensCST_ICMS.AsString        := Estoque.CSOSN;
    cliNfeItensMODBCST.AsLargeInt       := 0;

    if Trim(Estoque.CFOP) <> '' then
      cliNfeItensCFOP.AsLargeInt := StrToInt64(Estoque.CFOPNfce);
    cliNfeItens.Post();
    cliNfeItens.ApplyUpdates(0);
  end;  }
end;

procedure TdmDados.Registrar_NFE_Pagamentos(AIdNFe, AIdRegistroEmitente: Int64; ANotaFiscal: NotaFiscal);
var
  I: Integer;
//  GWCommerce: TGWCommerce;

//  Pagamento: TPagamento;

  Pagamento:  TpagCollectionItem;

begin
  for I := 0 to ANotaFiscal.NFe.pag.Count -1 do
  begin
    Pagamento := ANotaFiscal.NFe.pag.Items[I];
    cliNfePagamento.Append();
    cliNfePagamentoID_NFE_PAG.AsLargeInt    := Gerar_Id('GEN_NFE_PAGAMENTO_ID');
    cliNfePagamentoID_NFE.AsLargeInt        := AIdNFe;
    cliNfePagamentoREGISTRO_EMIT.AsLargeInt := AIdRegistroEmitente;//cliNfeCabREGISTRO_EMIT.AsLargeInt;
    cliNfePagamentoVPAG.AsFloat             := Pagamento.vPag;
    cliNfePagamentoVTROCO.AsFloat           := IfThen((Pagamento.tPag = fpDinheiro) and (ANotaFiscal.NFe.pag.vTroco > 0), ANotaFiscal.NFe.pag.vTroco, 0);
    cliNfePagamentoCAUT.AsString            := Pagamento.cAut;
    cliNfePagamentoTBAND.AsString           := BandeiraCartaoToStr(Pagamento.tBand);
    cliNfePagamentoTPAG.AsString            := FormaPagamentoToStr(Pagamento.tPag);

    if Pagamento.indPag <> ipNenhum then
      cliNfePagamentoINDPAG.AsLargeInt := StrToInt(IndpagToStr(Pagamento.indPag))
    else
      cliNfePagamentoINDPAG.AsLargeInt := 0;
{    case Pagamento.tBand of
      bcVisa           : cliNfePagamentoTBAND.AsString := 'Visa';
      bcMasterCard     : cliNfePagamentoTBAND.AsString := 'MasterCard';
      bcAmericanExpress: cliNfePagamentoTBAND.AsString := 'American Express';
      bcSorocred       : cliNfePagamentoTBAND.AsString := 'Sorocred';
      bcDinersClub     : cliNfePagamentoTBAND.AsString := 'Diners Club';
      bcElo            : cliNfePagamentoTBAND.AsString := 'Elo';
      bcHipercard      : cliNfePagamentoTBAND.AsString := 'Hipercard';
      bcAura           : cliNfePagamentoTBAND.AsString := 'Aura';
      bcCabal          : cliNfePagamentoTBAND.AsString := 'Cabal';
      bcOutros         : cliNfePagamentoTBAND.AsString := 'Outros';
    else
      cliNfePagamentoTBAND.AsString := '';
    end;   }

    {case Pagamento.tPag of
      fpDinheiro          : cliNfePagamentoTPAG.AsString := 'Dinheiro';
      fpCheque            : cliNfePagamentoTPAG.AsString := 'Cheque';
      fpCartaoCredito     : cliNfePagamentoTPAG.AsString := 'Credito';
      fpCartaoDebito      : cliNfePagamentoTPAG.AsString := 'Debito';
      fpCreditoLoja       : cliNfePagamentoTPAG.AsString := 'Prazo';
      fpValeAlimentacao   : cliNfePagamentoTPAG.AsString := 'Vale Alimentacao';
      fpValeRefeicao      : cliNfePagamentoTPAG.AsString := 'Vale Refeicao';
      fpValePresente      : cliNfePagamentoTPAG.AsString := 'Vale Presente';
      fpValeCombustivel   : cliNfePagamentoTPAG.AsString := 'Vale Combustivel';
      fpDuplicataMercantil: cliNfePagamentoTPAG.AsString := 'Duplicata Mercantil';
      fpBoletoBancario    : cliNfePagamentoTPAG.AsString := 'Boleto';
      fpSemPagamento      : cliNfePagamentoTPAG.AsString := 'Sem Pagameto';
      fpOutro             : cliNfePagamentoTPAG.AsString := 'Outro';
    else
      cliNfePagamentoTPAG.AsString := '';
    end;  }

//    cliNfePagamentoTPAG.AsString            := Pagamento.Pegar_Tipo();
 //   cliNfePagamentoVPAG.AsFloat             := Pagamento.Pegar_Valor();
 //   cliNfePagamentoVTROCO.AsFloat           := GWCommerce.Venda.Troco;
//    cliNfePagamentoINDPAG.AsLargeInt        := IfThen(Pagamento.Prazo > 0, 1, 0);

{    if Pagamento.Tipo = fpCartaoCredito then
    begin
      cliNfePagamentoTBAND.AsString := Pagamento.Cartao.Pegar_Codigo_Bandeira();
      cliNfePagamentoCAUT.AsString  := Pagamento.Cartao.CodigoAutorizacao
    end;}

    cliNfePagamento.Post();
    cliNfePagamento.ApplyUpdates(0);
  end;
{  GWCommerce := AGWCommerce as TGWCommerce;

  for Pagamento in GWCommerce.Venda.Pagamentos do
  begin
    cliNfePagamento.Append();
    cliNfePagamentoID_NFE_PAG.AsLargeInt    := Gerar_Id('GEN_NFE_PAGAMENTO_ID');
    cliNfePagamentoID_NFE.AsLargeInt        := AIdNFe;
    cliNfePagamentoREGISTRO_EMIT.AsLargeInt := cliNfeCabREGISTRO_EMIT.AsLargeInt;
    cliNfePagamentoTPAG.AsString            := Pagamento.Pegar_Tipo();
    cliNfePagamentoVPAG.AsFloat             := Pagamento.Pegar_Valor();
    cliNfePagamentoVTROCO.AsFloat           := GWCommerce.Venda.Troco;
    cliNfePagamentoINDPAG.AsLargeInt        := IfThen(Pagamento.Prazo > 0, 1, 0);

    if Pagamento.Tipo = fpCartaoCredito then
    begin
      cliNfePagamentoTBAND.AsString := Pagamento.Cartao.Pegar_Codigo_Bandeira();
      cliNfePagamentoCAUT.AsString  := Pagamento.Cartao.CodigoAutorizacao
    end;

    cliNfePagamento.Post();
    cliNfePagamento.ApplyUpdates(0);
  end;  }
end;

{function TdmDados.Tratar_Chave_Nota_Fiscal(AChaveGerada: String): String;
begin
  Result := StringReplace(UpperCase(AChaveGerada), 'NFE', '', [rfReplaceAll]);
end;}

end.
