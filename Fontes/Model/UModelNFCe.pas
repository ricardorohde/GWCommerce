unit UModelNFCe;

interface

uses
  System.SysUtils, System.Classes, ACBrBase, ACBrDFe, ACBrNFe, ACBrNFeNotasFiscais,
  pcnConversao, pcnConversaoNFe, pcnNFe, System.StrUtils, vcl.Forms, Vcl.Dialogs,

  Vcl.Printers, Winapi.Windows, pcnEnvEventoNFe, System.UITypes,

  ACBrDFeReport, ACBrDFeDANFeReport, ACBrNFeDANFEClass, ACBrUtil,
  ACBrDANFCeFortesFr, blcksock, ACBrDFeSSL,

  UGWCommerce, UEstoque, UPagamento, UCartao, ACBrNFeDANFEFR, ACBrNFeDANFeRLClass,
  UViewAviso, IdBaseComponent, IdCoder, IdCoder3to4, IdCoderMIME, Xml.xmldom,
  Xml.XMLIntf, Xml.XMLDoc, UControllerWebServiceConsultaEnvioNota;

type
  TdmNFCe = class(TDataModule)
    NFCe: TACBrNFe;
    LayoutFiscal: TACBrNFeDANFCeFortes;
    LayoutNaoFiscal: TACBrNFeDANFCeFortes;
    base64: TIdDecoderMIME;
    ToBase64: TIdEncoderMIME;
  private
    FNota: NotaFiscal;

    FGWCommerce: TGWCommerce;

    function Pegar_Valor_Base_Calculo(AProduto: TDetCollectionItem): Double;

    procedure Calcular_Cofins(AProduto: TDetCollectionItem; AEstoque: TEstoque);
    procedure Calcular_Pis(AProduto: TDetCollectionItem; AEstoque: TEstoque);
    procedure Carregar_Configuracoes();
    procedure Carregar_Configuracoes_Impressao();
    procedure Gerar_NFCe_Em_Contingencia(ACodigoStatus: Integer);
    procedure Gerar_Tag_Destinatario();
    procedure Gerar_Tag_Emitente();
    procedure Gerar_Tag_Ide(AModelo: Int64);
    procedure Gerar_Tag_Imposto(AProduto: TDetCollectionItem; AEstoque: TEstoque);
    procedure Gerar_Tag_Pagamento();
    procedure Gerar_Tag_Produto();
    procedure Gerar_Tag_Total();
    procedure Gerar_XML_Envio_Cabecalho(AXML: IXMLDocument);
    procedure Gerar_XML_Envio_Destinatario(AXML: IXMLDocument);
    procedure Gerar_XML_Envio_Emitente(AXML: IXMLDocument);
    procedure Gerar_XML_Envio_Finalizacao(AXML: IXMLDocument);
    procedure Gerar_XML_Envio_Pagamento(AXML: IXMLDocument);
    procedure Gerar_XML_Envio_Produto(AXML: IXMLDocument);
    procedure Gerar_XML_Envio_Total_NotaFiscal(AXML: IXMLDocument);

  public
    procedure Cancelar_Nota_Fiscal(AChave, AJustificativa: String; AGWCommerce: TGWCommerce);
    procedure Enviar_Nota_Api(AGerarArquivoEnvio: Boolean);
    procedure Enviar_OffLine(AGWCommerce: TGWCommerce; AXML: String);
    procedure Finalizar_Venda(AGWCommerce: TGWCommerce; AModelo: Int64);
    procedure ReImprimir_Nota(AXML: String);

  end;

var
  dmNFCe: TdmNFCe;

implementation
uses
  UVenda, UModelBase, UControllerWebServiceEnvioNotas;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TdmNFCe }

procedure TdmNFCe.Calcular_Cofins(AProduto: TDetCollectionItem;
  AEstoque: TEstoque);
var
  ValorBaseCalculo: Double;

begin
  AProduto.Imposto.COFINS.CST := AEstoque.Pegar_Codigo_Cofins();
  ValorBaseCalculo            := Pegar_Valor_Base_Calculo(AProduto);

  case AProduto.Imposto.COFINS.CST of
    cof01, cof02:
      begin
        AProduto.Imposto.COFINS.vBC     := ValorBaseCalculo;
        AProduto.Imposto.COFINS.pCOFINS := AEstoque.PorCofins;
        AProduto.Imposto.COFINS.vCOFINS := RoundABNT((ValorBaseCalculo * AEstoque.PorCofins) / 100, -2);
      end;
    cof04, cof05, cof06, cof07, cof08, cof09:
      begin
        AProduto.Imposto.COFINS.vBC     := 0;
        AProduto.Imposto.COFINS.pCOFINS := 0;
        AProduto.Imposto.COFINS.vCOFINS := 0;
      end;
  else
    begin
      AProduto.Imposto.COFINS.qBCProd   := 0;
      AProduto.Imposto.COFINS.vAliqProd := 0;
      AProduto.Imposto.COFINS.vCOFINS   := 0;
    end;
  end;
end;

procedure TdmNFCe.Calcular_Pis(AProduto: TDetCollectionItem; AEstoque: TEstoque);
var
  ValorBaseCalculo: Double;

begin
  AProduto.Imposto.PIS.CST   := AEstoque.Pegar_Codigo_PIS();
  ValorBaseCalculo           := Pegar_Valor_Base_Calculo(AProduto);

  case AProduto.Imposto.PIS.CST of
    pis01, pis02:
      begin
        AProduto.Imposto.PIS.vBC  := ValorBaseCalculo;
        AProduto.Imposto.PIS.pPIS := AEstoque.PorcPis;
        AProduto.Imposto.PIS.vPIS := RoundABNT((ValorBaseCalculo * AEstoque.PorcPis) / 100, -2);
      end;
    pis04, pis05, pis06, pis07, pis08, pis09:
      begin
        AProduto.Imposto.PIS.vBC  := 0;
        AProduto.Imposto.PIS.pPIS := 0;
        AProduto.Imposto.PIS.vPIS := 0;
      end;
  else
    begin
      AProduto.Imposto.PIS.qBCProd   := 0;
      AProduto.Imposto.PIS.vAliqProd := 0;
      AProduto.Imposto.PIS.vPIS      := 0;
    end;
  end;
end;

procedure TdmNFCe.Cancelar_Nota_Fiscal(AChave, AJustificativa: String; AGWCommerce: TGWCommerce);
var
  NumeroNota: Int64;

  Protocolo: String;

begin
  FGWCommerce := AGWCommerce;
  NumeroNota  := -1;
  Protocolo   := '';

  Carregar_Configuracoes();

  NFCe.NotasFiscais.Clear();

  if NFCe.Consultar(AChave) then
  begin
    dmDados.cliConsultaNotasFiscais.Filter   := Format('CHAVE = %s', [QuotedStr(AChave)]);
    dmDados.cliConsultaNotasFiscais.Filtered := True;

    if dmDados.cliConsultaNotasFiscais.RecordCount > 0 then
    begin
      NumeroNota := dmDados.cliConsultaNotasFiscaisIDE_NNF.AsLargeInt;
      Protocolo  := dmDados.cliConsultaNotasFiscaisPROTOCOLO_AUTORIZACAO.AsString;
    end;

    dmDados.cliConsultaNotasFiscais.Filtered := False;

    if (Protocolo <> '') and (NumeroNota > 0) then
    begin
      with NFCe.EventoNFe.Evento.New() do
      begin
        InfEvento.chNFe           := AChave;
        InfEvento.CNPJ            := FGWCommerce.Emitente.CNPJ;
        InfEvento.dhEvento        := Now();
        InfEvento.tpEvento        := teCancelamento;
        InfEvento.detEvento.xJust := AJustificativa;
        InfEvento.detEvento.nProt := Protocolo;
      end;

      NFCe.EnviarEvento(NumeroNota);

      if NFCe.WebServices.EnvEvento.cStat in [101, 128, 135] then
      begin
        dmDados.Atualizar_Dados_Apos_Cancelar_Nota_Fiscal(AChave, AJustificativa,
          NFCe.WebServices.EnvEvento.RetornoWS,
          NFCe.WebServices.EnvEvento.EventoRetorno.retEvento.Items[0].RetInfEvento.nProt,
          NFCe.WebServices.EnvEvento.cStat);
        MessageDlg('Nota Fiscal cancelada com sucesso.', mtInformation, [mbOK], 0);
      end;
    end;
  end;
end;

procedure TdmNFCe.Carregar_Configuracoes;
begin
  NFCe.Configuracoes.WebServices.Ambiente     := FGWCommerce.Emitente.Ambiente;
  NFCe.Configuracoes.WebServices.SSLType      := LT_TLSv1_2;
  NFCe.Configuracoes.WebServices.UF           := FGWCommerce.Emitente.Estado;
  NFCe.Configuracoes.Certificados.NumeroSerie := FGWCommerce.Emitente.CertificadoSerie;
  NFCe.Configuracoes.Certificados.Senha       := AnsiString( FGWCommerce.Emitente.CertificadoSenha );
  NFCe.Configuracoes.Arquivos.Salvar          := True;
  NFCe.Configuracoes.Arquivos.PathSalvar      := Format('%s\%s', [ExtractFilePath(ParamStr(0)), 'XML']);
  NFCe.Configuracoes.Geral.SSLCryptLib        := cryWinCrypt;
  NFCe.Configuracoes.Geral.SSLHttpLib         := httpWinINet;
  NFCe.Configuracoes.Geral.SSLLib             := libWinCrypt;
  NFCe.Configuracoes.Geral.SSLXmlSignLib      := xsMsXml;
  NFCe.Configuracoes.Geral.Salvar             := False;
  NFCe.Configuracoes.Geral.IdCSC              := FGWCommerce.Emitente.NFCeTokenCSCId;
  NFCe.Configuracoes.Geral.CSC                := FGWCommerce.Emitente.NFCeTokenCSC;
  NFCe.Configuracoes.Geral.FormaEmissao       := teNormal;
  NFCe.Configuracoes.Geral.VersaoQRCode       := veqr200;
  NFCe.Configuracoes.Geral.ModeloDF           := moNFCe;
  NFCe.Configuracoes.Geral.VersaoDF           := ve400;

  Carregar_Configuracoes_Impressao();
end;

procedure TdmNFCe.Carregar_Configuracoes_Impressao;
begin
  if Printer.PrinterIndex >= 0 then
    LayoutFiscal.Impressora := Printer.Printers[Printer.PrinterIndex]
  else
    raise Exception.Create('Nome da impressora padrão não foi definida.');
end;

procedure TdmNFCe.Enviar_Nota_Api(AGerarArquivoEnvio: Boolean);
var
  Consulta: TControllerWebServiceConsultaEnvioNota;

  Envio: TControllerWebServiceEnvioNotas;

  temp: TStringList;

  XMLEnvio: IXMLDocument;

begin
    dmDados.Consulta_Nota_Integrada(dmDados.cliConsultaNotasEnviarApiREGISTRO_EMIT.AsLargeInt, dmDados.cliConsultaNotasEnviarApiID_NFE.AsLargeInt);

      if dmDados.cliNfeIntegracaoApiSTATUS.AsLargeInt <> 1 then
      begin
        Consulta := TControllerWebServiceConsultaEnvioNota.Create(dmDados.cliConsultaNotasEnviarApiREGISTRO_EMIT.AsLargeInt);
        try
          Consulta.NFCe     := dmDados.cliConsultaNotasEnviarApiIDE_NNF.AsLargeInt;
          Consulta.Serie    := dmDados.cliConsultaNotasEnviarApiIDE_SERIE.AsString;
          Consulta.Modelo   := dmDados.cliConsultaNotasEnviarApiIDE_MOD.AsLargeInt;
          Consulta.Registro := dmDados.cliConsultaNotasEnviarApiREGISTRO_EMIT.AsLargeInt;

          if not Consulta.Consultar_API() then
          begin
            FNota    := NFCe.NotasFiscais.Add();
            XMLEnvio := TXMLDocument.Create(nil);
            try
              FNota.NFe.SetXMLString( AnsiString( base64.DecodeString(dmDados.cliConsultaNotasEnviarApiXML_APROVADO.AsString)));
              XMLEnvio.Active := True;

              XMLEnvio.AddChild('Nota');
              Gerar_XML_Envio_Cabecalho(XMLEnvio);
              Gerar_XML_Envio_Emitente(XMLEnvio);
              Gerar_XML_Envio_Destinatario(XMLEnvio);
              Gerar_XML_Envio_Total_NotaFiscal(XMLEnvio);

              XMLEnvio.DocumentElement.ChildNodes['infCpl'].Text := FNota.NFe.InfAdic.infCpl;
              Gerar_XML_Envio_Finalizacao(XMLEnvio);
              Gerar_XML_Envio_Produto(XMLEnvio);
              Gerar_XML_Envio_Pagamento(XMLEnvio);

              Envio := TControllerWebServiceEnvioNotas.Create(dmDados.cliConsultaNotasEnviarApiREGISTRO_EMIT.AsLargeInt);
              try
                Envio.XML        := ToBase64.EncodeString(XMLEnvio.XML.Text);
                Envio.NumeroNota := dmDados.cliConsultaNotasEnviarApiIDE_NNF.AsLargeInt;
                if Envio.Integrar() then
                  dmDados.Inserir_Nota_Integrada(dmDados.cliConsultaNotasEnviarApiREGISTRO_EMIT.AsLargeInt,
                    dmDados.cliConsultaNotasEnviarApiID_NFE.AsLargeInt);
              finally
                Envio.Free();
              end;

              if AGerarArquivoEnvio then
              begin
                temp := TStringList.Create();
                try
                  temp.Add(ToBase64.EncodeString(XMLEnvio.XML.Text));
                  temp.SaveToFile(Format('%s\EnvioLayoutTXT_IdNFe_%d.txt',
                    [ExtractFilePath(ParamStr(0)), dmDados.cliConsultaNotasEnviarApiIDE_NNF.AsLargeInt]));
                finally
                  temp.Free();
                end;

                XMLEnvio.SaveToFile(Format('%s\EnvioLayoutXML_IdNFe_%d.xml',
                  [ExtractFilePath(ParamStr(0)), dmDados.cliConsultaNotasEnviarApiIDE_NNF.AsLargeInt]));
              end;
            finally
              NFCe.NotasFiscais.Clear();
              XMLEnvio.Active := False;
            end;
          end;

        finally
          Consulta.Free();
        end;
      end;
end;

procedure TdmNFCe.Enviar_OffLine(AGWCommerce: TGWCommerce; AXML: String);
var
  ViewAviso: TViewAviso;

begin
  FGWCommerce := AGWCommerce;

  Carregar_Configuracoes();
  NFCe.NotasFiscais.Clear();

  FNota     := NFCe.NotasFiscais.Add();
  FNota.NFe.SetXMLString( AnsiString( base64.DecodeString(AXML) ));
  ViewAviso := TViewAviso.Create(nil);
  try
    try
      ViewAviso.Exibir('Enviando Nota Fiscal');
      NFCe.Enviar(FNota.NFe.Ide.nNF, False, True);
      dmDados.Atualizar_Status_Nota_Fiscal(FNota.NumID, NFCe.WebServices.Enviar.cStat);
      dmDados.Atualizar_Dados_Apos_Emitir_Nota_Fiscal(FNota);

      if  NFCe.WebServices.Enviar.cStat in [100, 150] then
        if Application.MessageBox('Deseja imprimir a Nota Fiscal?', 'Confirme', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = ID_YES then
        begin
          LayoutFiscal.ModoNaoFiscal := False;
          LayoutFiscal.ImprimirDANFE();
        end;
    except on E: Exception do
      dmDados.Atualizar_Status_Nota_Fiscal(FNota.NumID, NFCe.WebServices.Enviar.cStat);
    end;
  finally
    ViewAviso.Close();
    FreeAndNil(ViewAviso);
  end;
end;

procedure TdmNFCe.Finalizar_Venda(AGWCommerce: TGWCommerce; AModelo: Int64);
var
  S: String;

  ViewAviso: TViewAviso;

begin
  FGWCommerce := AGWCommerce;

  Carregar_Configuracoes();
  NFCe.NotasFiscais.Clear();

  FNota                             := NFCe.NotasFiscais.Add();
  NFCe.Configuracoes.Geral.VersaoDF := ve400;
  FNota.NFe.Transp.modFrete         := mfSemFrete;

  Gerar_Tag_Ide(AModelo);
  Gerar_Tag_Emitente();
  Gerar_Tag_Destinatario();
  Gerar_Tag_Produto();
  Gerar_Tag_Total();
  Gerar_Tag_Pagamento();
  FNota.NFe.InfAdic.infCpl := 'Obrigado pela preferência e volte Sempre.';

  S:= Trim(String(FNota.GerarXML()));

  if S <> '' then
  begin
    dmDados.Registrar_NFE_CAB(AGWCommerce, FNota);

    if FNota.NFe.Ide.modelo = 90 then
      dmDados.Atualizar_Dados_Apos_Emitir_Nota_Fiscal(FNota);

    if FNota.NFe.Ide.modelo = 65 then
    begin
      ViewAviso := TViewAviso.Create(nil);
      try
        try
          ViewAviso.Exibir('Enviando Nota Fiscal');
          NFCe.Enviar(FNota.NFe.Ide.nNF, False, True);
          dmDados.Atualizar_Status_Nota_Fiscal(FNota.NumID, NFCe.WebServices.Enviar.cStat);
          dmDados.Atualizar_Dados_Apos_Emitir_Nota_Fiscal(FNota);
        except on E: Exception do
          if ((FNota.NFe.Ide.modelo = 65) and (NFCe.WebServices.Enviar.cStat <> 100)) then
          begin
            dmDados.Atualizar_Status_Nota_Fiscal(FNota.NumID, NFCe.WebServices.Enviar.cStat);
            Gerar_NFCe_Em_Contingencia(NFCe.WebServices.Enviar.cStat);
          end;
        end;
      finally
        ViewAviso.Close();
        FreeAndNil(ViewAviso);
      end;
    end;

    if ((FNota.NFe.Ide.modelo = 90) or ((FNota.NFe.Ide.modelo = 65) and (NFCe.WebServices.Enviar.cStat = 100))) then
      if Application.MessageBox('Deseja imprimir a Nota Fiscal?', 'Confirme', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = ID_YES then
      begin
        LayoutFiscal.ModoNaoFiscal := (FNota.NFe.Ide.modelo = 90);
        LayoutFiscal.ImprimirDANFE();
      end;
  end
  else
    raise Exception.Create('Não foi possível gerar o xml da Nota Fiscal.');
end;

procedure TdmNFCe.Gerar_NFCe_Em_Contingencia(ACodigoStatus: Integer);
begin
  FNota.NFe.Ide.nNF    := dmDados.Pegar_Numero_Proxima_Nota(FGWCommerce.Emitente.Registro,
    FGWCommerce.Emitente.NFCeSerie, 65);
  FNota.NFe.Ide.dhCont := Now();
  FNota.NFe.Ide.tpEmis := teOffLine;
  FNota.NFe.Ide.xJust  := IfThen(ACodigoStatus = 0,
    'NFCe em Contingência devido a falha na internet.', 'NFCe em Contingência devido a erro de informação.');

  if Trim(String(FNota.GerarXML())) <> '' then
  begin
    dmDados.Registrar_NFE_CAB(FGWCommerce, FNota);
    dmDados.Atualizar_Dados_Apos_Emitir_Nota_Fiscal(FNota);

    if Application.MessageBox('Atenção: Nota Fiscal emitida em contingência'#13#10 +
      'Deseja imprimir a Nota Fiscal?', 'Confirme', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = ID_YES then
    begin
      LayoutFiscal.ModoNaoFiscal := False;;
      LayoutFiscal.ImprimirDANFE();
    end;
  end
  else
    raise Exception.Create('Não foi possível gerar o xml da Nota Fiscal.');
end;

procedure TdmNFCe.Gerar_Tag_Destinatario;
begin
  if FGWCommerce.Cliente.CodigoCliente > 0 then
  begin
    dmDados.cliCliente.Filter   := Format('CODIGO_CLIENTE = %d', [FGWCommerce.Cliente.CodigoCliente]);
    dmDados.cliCliente.Filtered := True;

    if dmDados.cliCliente.RecordCount > 0 then
    begin
      if not dmDados.cliClienteCPF.IsNull then
        if Trim(dmDados.cliClienteCPF.AsString) <> '' then
        begin
          FNota.NFe.Dest.CNPJCPF   := dmDados.cliClienteCPF.AsString;
          FNota.NFe.Dest.xNome     := Copy(dmDados.cliClienteNOME.AsString, 1, 60);
          FNota.NFe.Dest.indIEDest := inNaoContribuinte;
        end;
    end;

    dmDados.cliCliente.Filtered := False;
  end
  else if not FGWCommerce.Cliente.Cadastrado then
  begin
    FNota.NFe.Dest.CNPJCPF   := FGWCommerce.Cliente.CPF;
    FNota.NFe.Dest.xNome     := Copy(FGWCommerce.Cliente.Nome, 1, 60);
    FNota.NFe.Dest.indIEDest := inNaoContribuinte;
  end;
end;

procedure TdmNFCe.Gerar_Tag_Emitente;
begin
  FNota.NFe.Emit.CNPJCPF           := FGWCommerce.Emitente.CNPJ;
  FNota.NFe.Emit.xNome             := FGWCommerce.Emitente.Nome;
  FNota.NFe.Emit.xFant             := FGWCommerce.Emitente.NomeFantasia;
  FNota.NFe.Emit.EnderEmit.xLgr    := FGWCommerce.Emitente.Endereco;
  FNota.NFe.Emit.EnderEmit.nro     := FGWCommerce.Emitente.Numero;
  FNota.NFe.Emit.EnderEmit.xCpl    := '';
  FNota.NFe.Emit.EnderEmit.xBairro := FGWCommerce.Emitente.Bairro;
  FNota.NFe.Emit.EnderEmit.cMun    := StrToInt(FGWCommerce.Emitente.CDCidade);
  FNota.NFe.Emit.EnderEmit.xMun    := FGWCommerce.Emitente.Municipio;
  FNota.NFe.Emit.EnderEmit.cPais   := 1058;
  FNota.NFe.Emit.EnderEmit.xPais   := 'BRASIL';
  FNota.NFe.Emit.EnderEmit.UF      := FGWCommerce.Emitente.Estado;
  FNota.NFe.Emit.EnderEmit.CEP     := StrToInt(FGWCommerce.Emitente.CEP);
  FNota.NFe.Emit.IM                := FGWCommerce.Emitente.IMunicipal;
  FNota.NFe.Emit.IE                := FGWCommerce.Emitente.IE;
  FNota.NFe.Emit.CRT               := FGWCommerce.Emitente.Pegar_Regime_Emissao();
end;

procedure TdmNFCe.Gerar_Tag_Ide(AModelo: Int64);
begin
  if Trim(FGWCommerce.Emitente.CDEstado) = '' then
    raise Exception.Create('Código da Unidade Federativa não informado para emissão da NFC-e.');

  if Trim(FGWCommerce.Emitente.CDCidade) = '' then
    raise Exception.Create('Código do Municipio não informado para emissão da NFC-e.');

  FNota.NFe.Ide.cUF      := StrToInt64(FGWCommerce.Emitente.CDEstado);
  FNota.NFe.Ide.natOp    := 'VENDA';
  FNota.NFe.Ide.modelo   := AModelo;
  FNota.NFe.Ide.serie    := FGWCommerce.Emitente.NFCeSerie;
  FNota.NFe.Ide.nNF      := dmDados.Pegar_Numero_Proxima_Nota(FGWCommerce.Emitente.Registro,
    FNota.NFe.Ide.serie, FNota.NFe.Ide.modelo);
  FNota.NFe.Ide.dEmi     := Now;
  FNota.NFe.Ide.hSaiEnt  := Now;
  FNota.NFe.Ide.tpNF     := tnSaida;
  FNota.NFe.Ide.idDest   := doInterna;
  FNota.NFe.Ide.cMunFG   := StrToInt64(FGWCommerce.Emitente.CDCidade);
  FNota.NFe.Ide.tpImp    := tiNFCe;
  FNota.NFe.Ide.tpEmis   := teNormal;
  FNota.NFe.Ide.cDV      := 1;
  FNota.NFe.Ide.tpAmb    := NFCe.Configuracoes.WebServices.Ambiente;
  FNota.NFe.Ide.finNFe   := fnNormal;
  FNota.NFe.Ide.indFinal := cfConsumidorFinal;
  FNota.NFe.Ide.indPres  := pcPresencial;
  FNota.NFe.Ide.procEmi  := peAplicativoContribuinte;
  FNota.NFe.Ide.verProc  := '1.0.0.1';
end;

procedure TdmNFCe.Gerar_Tag_Imposto(AProduto: TDetCollectionItem; AEstoque: TEstoque);
var
  ValorItem: Double;

begin
  if FGWCommerce.Emitente.Verificar_Se_Simples_Nacional() then
    AProduto.Imposto.ICMS.CSOSN := AEstoque.Pegar_CST_ICMS_Simples_Nacional()
  else
    raise Exception.Create('Regime Tributário diferente de Simples Nacional e não tratado.');

  AProduto.Imposto.ICMS.orig := oeNacional;

  if (AProduto.Imposto.ICMS.CSOSN in [csosn201, csosn202, csosn203, csosn500, csosn900]) and
    (Trim(AProduto.Prod.CEST) = '') then
      raise Exception.Create(Format('Obrigatório informar o CEST para o produto %s', [AProduto.Prod.xProd]));

  Calcular_Pis(AProduto, AEStoque);
  Calcular_Cofins(AProduto, AEstoque);

  ValorItem := AProduto.Prod.vProd - AProduto.Prod.vDesc;

  AProduto.Imposto.vTotTrib := RoundABNT((ValorItem * AEstoque.IBPTFI) / 100, -2) +
    RoundABNT((ValorItem * AEstoque.IBPTF) / 100, -2) +
    RoundABNT((ValorItem * AEstoque.IBPTEST) / 100, -2) +
    RoundABNT((ValorItem * AEstoque.IBPTMun) / 100, -2);
end;

procedure TdmNFCe.Gerar_Tag_Pagamento;
var
  Pagamento: TPagamento;

begin
  for Pagamento in FGWCommerce.Venda.Pagamentos do
  begin
    with FNota.NFe.pag.New do
    begin
      tPag := Pagamento.Tipo;

      if Pagamento.Dinheiro > 0 then
       vPag := Pagamento.Dinheiro
      else if Pagamento.Prazo > 0 then
       vPag := Pagamento.Prazo
      else if Pagamento.Cheque > 0 then
       vPag := Pagamento.Cheque
      else if (Pagamento.Cartao.Tipo in [tcDebito, tcCredito]) and (Pagamento.Cartao.Valor > 0) then
      begin
        tpIntegra := tiPagNaoIntegrado;
        vPag      := Pagamento.Cartao.Valor;
        tBand     := Pagamento.Cartao.TipoBandeira;
        cAut      := Pagamento.Cartao.CodigoAutorizacao;
      end;
    end;
  end;

  if FGWCommerce.Venda.Troco > 0 then
    FNota.NFe.pag.vTroco := FGWCommerce.Venda.Troco;
end;

procedure TdmNFCe.Gerar_Tag_Produto;
var
  Ean: String;

  Produto: TDetCollectionItem;

  Estoque: TEstoque;

  Venda: TVenda;

begin

  for Venda in FGWCommerce.Venda.Itens do
  begin
    Estoque := FGWCommerce.Estoque.Buscar(Venda.CodigoProduto);

    if Estoque = nil then
      raise Exception.Create('Produto não encontrado para emissão.');

    Produto                := FNota.NFe.Det.New();
    Produto.Prod.nItem     := Venda.Ordem;
    Produto.Prod.cProd     := Copy(IntToStr(Venda.CodigoProdutoExibicao), 1, 60);
    Produto.Prod.cEANTrib  := Produto.Prod.cEAN;
    Produto.Prod.xProd     := Copy(Estoque.Descricao, 1, 120);
    Produto.Prod.NCM       := IfThen(Trim(Estoque.NCM) = '', '19059090', Estoque.NCM);
    Produto.Prod.CFOP      := IfThen(Trim(Estoque.CFOPNfce) = '', '5102', Estoque.CFOPNfce);
    Produto.Prod.uCom      := Copy(Venda.Medida, 1, 6);
    Produto.Prod.qCom      := Venda.Quantidade;
    Produto.Prod.vUnCom    := Venda.ValorUnitario;
    Produto.Prod.vProd     := Venda.ValorBruto;
    Produto.Prod.uTrib     := Venda.Medida;
    Produto.Prod.qTrib     := Venda.Quantidade;
    Produto.Prod.vUnTrib   := Venda.ValorUnitario;
    Produto.Prod.vOutro    := 0;
    Produto.Prod.vFrete    := 0;
    Produto.Prod.vSeg      := 0;
    Produto.Prod.vDesc     := Venda.Desconto.Valor;
    Produto.Prod.CEST      := IfThen(Trim(Estoque.CEST) = '', '2806200', Estoque.CEST);

    Ean := Trim(Estoque.CodigoBarras);

    if Length(Ean) > 2 then
      Ean := Copy(Ean, 1, 2);

    Produto.Prod.cEAN := IfThen((Ean <> '') and (Ean <> '20'), Estoque.CodigoBarras, 'SEM GTIN');

    if FNota.NFe.Ide.modelo = 90 then
      Produto.Prod.CNPJFab := Estoque.CNPJFab;

    if Trim(Estoque.CProdAnp) <> '' then
    begin
      Produto.Prod.comb.cProdANP := StrToInt64(Estoque.CProdAnp);
      Produto.Prod.comb.descANP  := Estoque.DescAnp;
      Produto.Prod.comb.vPart    := Estoque.VPart;
      Produto.Prod.comb.pGLP     := Estoque.PGLP;
      Produto.Prod.comb.pGNn     := Estoque.PGNN;
      Produto.Prod.comb.pGNi     := Estoque.PGNI;
      Produto.Prod.comb.UFcons   := FNota.NFe.Emit.EnderEmit.UF;
    end;


    Gerar_Tag_Imposto(Produto, Estoque);
  end;
end;

procedure TdmNFCe.Gerar_Tag_Total;
var
  I: Integer;

  Item: TDetCollectionItem;

begin
  FNota.NFe.Total.ICMSTot.vBC     := 0;
  FNota.NFe.Total.ICMSTot.vICMS   := 0;
  FNota.NFe.Total.ICMSTot.vProd   := 0;
  FNota.NFe.Total.ICMSTot.vFrete  := 0;
  FNota.NFe.Total.ICMSTot.vSeg    := 0;
  FNota.NFe.Total.ICMSTot.vIPI    := 0;
  FNota.NFe.Total.ICMSTot.vPIS    := 0;
  FNota.NFe.Total.ICMSTot.vCOFINS := 0;
  FNota.NFe.Total.ICMSTot.vOutro  := 0;
  FNota.NFe.Total.ICMSTot.vTotTrib:= 0;

  for I := 0 to FNota.NFe.Det.Count -1 do
  begin
    Item                            := FNota.NFe.Det.Items[I];
    FNota.NFe.Total.ICMSTot.vPIS    := FNota.NFe.Total.ICMSTot.vPIS + Item.Imposto.PIS.vPIS;
    FNota.NFe.Total.ICMSTot.vCOFINS := FNota.NFe.Total.ICMSTot.vCOFINS + Item.Imposto.COFINS.vCOFINS;
    FNota.NFe.Total.ICMSTot.vProd   := FNota.NFe.Total.ICMSTot.vProd + Item.Prod.vProd;
    FNota.NFe.Total.ICMSTot.vTotTrib:= FNota.NFe.Total.ICMSTot.vTotTrib + Item.Imposto.vTotTrib;
  end;

  FNota.NFe.Total.ICMSTot.vDesc := FGWCommerce.Venda.Desconto;
  FNota.NFe.Total.ICMSTot.vNF   := FGWCommerce.Venda.Total - FGWCommerce.Venda.Desconto;
end;

procedure TdmNFCe.Gerar_XML_Envio_Cabecalho(AXML: IXMLDocument);
var
  EnviarConteudoXML: Boolean;

begin
  AXML.DocumentElement.ChildNodes['cUF'].Text := IntToStr(FNota.NFe.Ide.cUF);

  if (dmDados.cliConsultaNotasEnviarApiID_VENDEDOR.AsLargeInt > 0) then
    AXML.DocumentElement.ChildNodes['id_vendedor'].Text := dmDados.cliConsultaNotasEnviarApiID_VENDEDOR.AsString
  else
    AXML.DocumentElement.ChildNodes['id_vendedor'].Text := '';

  AXML.DocumentElement.ChildNodes['natOP'].Text    := FNota.NFe.Ide.natOp;
  AXML.DocumentElement.ChildNodes['mod'].Text      := IntToStr(FNota.NFe.Ide.modelo);
  AXML.DocumentElement.ChildNodes['serie'].Text    := IntToStr(FNota.NFe.Ide.serie);
  AXML.DocumentElement.ChildNodes['nNF'].Text      := IntToStr(FNota.NFe.Ide.nNF);
  AXML.DocumentElement.ChildNodes['dhEmi'].Text    := FormatDateTime('yyyy-MM-dd hh:MM:ss', FNota.NFe.Ide.dEmi);
  AXML.DocumentElement.ChildNodes['tpNF'].Text     := tpNFToStr(FNota.NFe.Ide.tpNF);
  AXML.DocumentElement.ChildNodes['idDest'].Text   := DestinoOperacaoToStr(FNota.NFe.Ide.idDest);
  AXML.DocumentElement.ChildNodes['cMunFG'].Text   := IntToStr(FNota.NFe.Ide.cMunFG);
  AXML.DocumentElement.ChildNodes['tpImp'].Text    := TpImpToStr(FNota.NFe.Ide.tpImp);
  AXML.DocumentElement.ChildNodes['tpEmis'].Text   := TpEmisToStr(FNota.NFe.Ide.tpEmis);
  AXML.DocumentElement.ChildNodes['tpAmb'].Text    := TpAmbToStr(FNota.NFe.Ide.tpAmb);
  AXML.DocumentElement.ChildNodes['finNFe'].Text   := FinNFeToStr(FNota.NFe.Ide.finNFe);
  AXML.DocumentElement.ChildNodes['indFinal'].Text := ConsumidorFinalToStr(FNota.NFe.Ide.indFinal);
  AXML.DocumentElement.ChildNodes['indPres'].Text  := PresencaCompradorToStr(FNota.NFe.Ide.indPres);
  AXML.DocumentElement.ChildNodes['procEmi'].Text  := procEmiToStr(FNota.NFe.Ide.procEmi);
  AXML.DocumentElement.ChildNodes['verProc'].Text  := FNota.NFe.Ide.verProc;

  EnviarConteudoXML := (FNota.NFe.Ide.modelo = 65) and (FNota.NFe.Ide.tpEmis = teNormal);

  AXML.DocumentElement.ChildNodes['xmlBD'].Text := IfThen(EnviarConteudoXML,
    dmDados.cliConsultaNotasEnviarApiXML_APROVADO.AsString, '');
end;

procedure TdmNFCe.Gerar_XML_Envio_Destinatario(AXML: IXMLDocument);
begin
  if dmDados.cliConsultaNotasEnviarApiID_CLIENTE.AsLargeInt > 0 then
    AXML.DocumentElement.ChildNodes['id_cliente'].Text := dmDados.cliConsultaNotasEnviarApiID_CLIENTE.AsString
  else
    AXML.DocumentElement.ChildNodes['id_cliente'].Text := '';

  AXML.DocumentElement.ChildNodes['dest_cnpj_cpf'].Text := FNota.NFe.Dest.CNPJCPF;
  AXML.DocumentElement.ChildNodes['dest_xNome'].Text    := FNota.NFe.Dest.xNome;
  AXML.DocumentElement.ChildNodes['dest_xLgr'].Text     := FNota.NFe.Dest.EnderDest.xLgr;
  AXML.DocumentElement.ChildNodes['dest_nro'].Text      := Fnota.NFe.Dest.EnderDest.nro;
  AXML.DocumentElement.ChildNodes['dest_xCpl'].Text     := FNota.NFe.Dest.EnderDest.xCpl;
  AXML.DocumentElement.ChildNodes['dest_xBairro'].Text  := FNota.NFe.Dest.EnderDest.xBairro;

  if Assigned(FNota.NFe.Dest.EnderDest) then
    AXML.DocumentElement.ChildNodes['dest_cMun'].Text := IntToStr(FNota.NFe.Dest.EnderDest.cMun)
  else
    AXML.DocumentElement.ChildNodes['dest_cMun'].Text := '';

  AXML.DocumentElement.ChildNodes['dest_xMun'].Text := FNota.NFe.Dest.EnderDest.xMun;
  AXML.DocumentElement.ChildNodes['dest_UF'].Text   := FNota.NFe.Dest.EnderDest.UF;

  if Assigned(FNota.NFe.Dest.EnderDest) then
    AXML.DocumentElement.ChildNodes['dest_CEP'].Text := IntToStr(FNota.NFe.Dest.EnderDest.CEP)
  else
    AXML.DocumentElement.ChildNodes['dest_CEP'].Text := '';

  AXML.DocumentElement.ChildNodes['dest_cPais'].Text     := IntToStr(FNota.NFe.Dest.EnderDest.cPais);
  AXML.DocumentElement.ChildNodes['dest_xPais'].Text     := FNota.NFe.Dest.EnderDest.xPais;
  AXML.DocumentElement.ChildNodes['dest_fone'].Text      := FNota.NFe.Dest.EnderDest.fone;
  AXML.DocumentElement.ChildNodes['dest_indIEDest'].Text := indIEDestToStr(FNota.NFe.Dest.indIEDest);
  AXML.DocumentElement.ChildNodes['dest_IE'].Text        := FNota.NFe.Dest.IE;
end;

procedure TdmNFCe.Gerar_XML_Envio_Emitente(AXML: IXMLDocument);
begin
  AXML.DocumentElement.ChildNodes['CNPJ'].Text    := FNota.NFe.Emit.CNPJCPF;
  AXML.DocumentElement.ChildNodes['xNome'].Text   := FNota.NFe.Emit.xNome;
  AXML.DocumentElement.ChildNodes['xFant'].Text   := FNota.NFe.Emit.xFant;
  AXML.DocumentElement.ChildNodes['xLgr'].Text    := FNota.NFe.Emit.EnderEmit.xLgr;
  AXML.DocumentElement.ChildNodes['nro'].Text     := FNota.NFe.Emit.EnderEmit.nro;
  AXML.DocumentElement.ChildNodes['xBairro'].Text := FNota.NFe.Emit.EnderEmit.xBairro;
  AXML.DocumentElement.ChildNodes['cMun'].Text    := IntToStr(FNota.NFe.Emit.EnderEmit.cMun);
  AXML.DocumentElement.ChildNodes['xMun'].Text    := FNota.NFe.Emit.EnderEmit.xMun;
  AXML.DocumentElement.ChildNodes['UF'].Text      := FNota.NFe.Emit.EnderEmit.UF;
  AXML.DocumentElement.ChildNodes['CEP'].Text     := IntToStr(FNota.NFe.Emit.EnderEmit.CEP);
  AXML.DocumentElement.ChildNodes['cPais'].Text   := IntToStr(FNota.NFe.Emit.EnderEmit.cPais);
  AXML.DocumentElement.ChildNodes['xPais'].Text   := FNota.NFe.Emit.EnderEmit.xPais;
  AXML.DocumentElement.ChildNodes['IE'].Text      := FNota.NFe.Emit.IE;
  AXML.DocumentElement.ChildNodes['CRT'].Text     := CRTToStr(FNota.NFe.Emit.CRT);
end;

procedure TdmNFCe.Gerar_XML_Envio_Finalizacao(AXML: IXMLDocument);
begin
  AXML.DocumentElement.ChildNodes['tpAmbNFCe'].Text := TpAmbToStr(FNota.NFe.procNFe.tpAmb);
  AXML.DocumentElement.ChildNodes['verAplic'].Text  := FNota.NFe.procNFe.verAplic;
  AXML.DocumentElement.ChildNodes['chNFe'].Text     := FNota.NFe.procNFe.chNFe;
  AXML.DocumentElement.ChildNodes['dhRecbto'].Text  := IfThen(FNota.NFe.Ide.modelo = 90, '', FormatDateTime('yyyy-MM-dd hh:mm:ss', FNota.NFe.procNFe.dhRecbto));
  AXML.DocumentElement.ChildNodes['nProt'].Text     := FNota.NFe.procNFe.nProt;
  AXML.DocumentElement.ChildNodes['digVal'].Text    := FNota.NFe.procNFe.digVal;
  AXML.DocumentElement.ChildNodes['cStat'].Text     := IfThen(FNota.NFe.Ide.modelo = 90, '100', IntToStr(FNota.NFe.procNFe.cStat));
  AXML.DocumentElement.ChildNodes['xMotivo'].Text   := FNota.NFe.procNFe.xMotivo;
end;

procedure TdmNFCe.Gerar_XML_Envio_Pagamento(AXML: IXMLDocument);
var
  I,
  Indice: Integer;

  Node: IXMLNode;

begin
  Node := AXML.DocumentElement.AddChild('Pagamento');

  for I := 0 to FNota.NFe.pag.Count -1 do
  begin
    Node.AddChild('Pagamento');
    Indice := Node.ChildNodes.Count -1;

    Node.ChildNodes[Indice].ChildNodes['indPag'].Text     := IndpagToStr(FNota.NFe.Pag.Items[I].indPag);
    Node.ChildNodes[Indice].ChildNodes['tPag'].Text       := FormaPagamentoToStr(FNota.NFe.Pag.Items[I].tPag);
    Node.ChildNodes[Indice].ChildNodes['vPag'].Text       := StringReplace(FormatFloat('#,##0.00', FNota.NFe.Pag.Items[I].vPag), ',', '.', [rfReplaceAll]);
    Node.ChildNodes[Indice].ChildNodes['vTroco'].Text     := StringReplace(FormatFloat('#,##0.00', FNota.NFe.pag.vTroco), ',', '.', [rfReplaceAll]);
    Node.ChildNodes[Indice].ChildNodes['tpIntegra'].Text  := tpIntegraToStr(FNota.NFe.Pag.Items[I].tpIntegra);

    if FNota.NFe.pag.Items[I].tPag in [fpCartaoDebito,fpCartaoCredito] then
    begin
      dmDados.Consultar_FormaPagamento_Para_Integrar_API(dmDados.cliConsultaNotasEnviarApiREGISTRO_EMIT.AsLargeInt,
        dmDados.cliConsultaNotasEnviarApiID_NFE.AsLargeInt,
        FormaPagamentoToStr(FNota.NFe.Pag.Items[I].tPag), FNota.NFe.Pag.Items[I].vPag);

      Node.ChildNodes[Indice].ChildNodes['CNPJCartao'].Text := dmDados.cliConsultaFormaPagamentoEnvioAPICNPJ_ADM.AsString;
      Node.ChildNodes[Indice].ChildNodes['tBand'].Text      := dmDados.cliConsultaFormaPagamentoEnvioAPITBAND.AsString;
      Node.ChildNodes[Indice].ChildNodes['cAut'].Text       := dmDados.cliConsultaFormaPagamentoEnvioAPICAUT.AsString;
    end
    else
    begin
      Node.ChildNodes[Indice].ChildNodes['CNPJCartao'].Text := FNota.NFe.Pag.Items[I].CNPJ;
      Node.ChildNodes[Indice].ChildNodes['tBand'].Text      := BandeiraCartaoToStr(FNota.NFe.Pag.Items[I].tBand);
      Node.ChildNodes[Indice].ChildNodes['cAut'].Text       := FNota.NFe.Pag.Items[I].cAut;
    end;
  end;
end;

procedure TdmNFCe.Gerar_XML_Envio_Produto(AXML: IXMLDocument);
var
  I,
  Indice: Integer;

  Node: IXMLNode;

begin
  Node := AXML.DocumentElement.AddChild('Produto');

  for I := 0 to FNota.NFe.Det.Count -1 do
  begin
    Node.AddChild('Item');
    Indice := Node.ChildNodes.Count -1;

    Node.ChildNodes[Indice].ChildNodes['cProd'].Text    := FNota.NFe.Det.Items[I].Prod.cProd;
    Node.ChildNodes[Indice].ChildNodes['cEAN'].Text     := FNota.NFe.Det.Items[I].Prod.cEAN;
    Node.ChildNodes[Indice].ChildNodes['xProd'].Text    := FNota.NFe.Det.Items[I].Prod.xProd;
    Node.ChildNodes[Indice].ChildNodes['NCM'].Text      := FNota.NFe.Det.Items[I].Prod.NCM;
    Node.ChildNodes[Indice].ChildNodes['CEST'].Text     := FNota.NFe.Det.Items[I].Prod.CEST;
    Node.ChildNodes[Indice].ChildNodes['CFOP'].Text     := FNota.NFe.Det.Items[I].Prod.CFOP;
    Node.ChildNodes[Indice].ChildNodes['uCom'].Text     := FNota.NFe.Det.Items[I].Prod.uCom;
    Node.ChildNodes[Indice].ChildNodes['qCom'].Text     := StringReplace(FormatFloat('#,##0.00', FNota.NFe.Det.Items[I].Prod.qCom), ',', '.', [rfReplaceAll]);
    Node.ChildNodes[Indice].ChildNodes['vUnCom'].Text   := StringReplace(FormatFloat('#,##0.00', FNota.NFe.Det.Items[I].Prod.vUnCom), ',', '.', [rfReplaceAll]);
    Node.ChildNodes[Indice].ChildNodes['vProd'].Text    := StringReplace(FormatFloat('#,##0.00', FNota.NFe.Det.Items[I].Prod.vProd), ',', '.', [rfReplaceAll]);
    Node.ChildNodes[Indice].ChildNodes['vDesc'].Text    := StringReplace(FormatFloat('#,##0.00', FNota.NFe.Det.Items[I].Prod.vDesc), ',', '.', [rfReplaceAll]);
    Node.ChildNodes[Indice].ChildNodes['cEANTrib'].Text := FNota.NFe.Det.Items[I].Prod.cEANTrib;
    Node.ChildNodes[Indice].ChildNodes['uTrib'].Text    := FNota.NFe.Det.Items[I].Prod.uTrib;
    Node.ChildNodes[Indice].ChildNodes['qTrib'].Text    := StringReplace(FormatFloat('#,##0.00', FNota.NFe.Det.Items[I].Prod.qTrib), ',', '.', [rfReplaceAll]);
    Node.ChildNodes[Indice].ChildNodes['vUnTrib'].Text  := StringReplace(FormatFloat('#,##0.00', FNota.NFe.Det.Items[I].Prod.vUnTrib), ',', '.', [rfReplaceAll]);
    Node.ChildNodes[Indice].ChildNodes['indTot'].Text   := indTotToStr(FNota.NFe.Det.Items[I].Prod.IndTot);
    //Impostos
    Node.ChildNodes[Indice].ChildNodes['origICMS'].Text  := OrigToStr(FNota.NFe.Det.Items[I].Imposto.ICMS.orig);
    Node.ChildNodes[Indice].ChildNodes['CSOSN'].Text     := CSOSNIcmsToStr(FNota.NFe.Det.Items[I].Imposto.ICMS.CSOSN);
    Node.ChildNodes[Indice].ChildNodes['CSTPis'].Text    := CSTPISToStr(FNota.NFe.Det.Items[I].Imposto.PIS.CST);
    Node.ChildNodes[Indice].ChildNodes['CSTCofins'].Text := CSTCOFINSToStr(FNota.NFe.Det.Items[I].Imposto.COFINS.CST);

    if FNota.NFe.Det.Items[I].Imposto.COFINS.vBC > 0 then
      Node.ChildNodes[Indice].ChildNodes['vBCCofins'].Text := StringReplace(FormatFloat('#,##0.00', FNota.NFe.Det.Items[I].Imposto.COFINS.vBC), ',', '.', [rfReplaceAll])
    else
      Node.ChildNodes[Indice].ChildNodes['vBCCofins'].Text := '';

    if FNota.NFe.Det.Items[I].Imposto.COFINS.pCOFINS > 0 then
      Node.ChildNodes[Indice].ChildNodes['pCofins'].Text := StringReplace(FormatFloat('#,##0.00', FNota.NFe.Det.Items[I].Imposto.COFINS.pCOFINS), ',', '.', [rfReplaceAll])
    else
      Node.ChildNodes[Indice].ChildNodes['pCofins'].Text := '';

    if FNota.NFe.Det.Items[I].Imposto.COFINS.vCOFINS > 0 then
      Node.ChildNodes[Indice].ChildNodes['vCofins'].Text := StringReplace(FormatFloat('#,##0.00', FNota.NFe.Det.Items[I].Imposto.COFINS.vCOFINS), ',', '.', [rfReplaceAll])
    else
      Node.ChildNodes[Indice].ChildNodes['vCofins'].Text := '';
  end;
end;

procedure TdmNFCe.Gerar_XML_Envio_Total_NotaFiscal(AXML: IXMLDocument);
begin
  AXML.DocumentElement.ChildNodes['vBC'].Text        := StringReplace(FormatFloat('#,##0.00', FNota.NFe.Total.ICMSTot.vBC), ',', '.', [rfReplaceAll]);
  AXML.DocumentElement.ChildNodes['vICMS'].Text      := StringReplace(FormatFloat('#,##0.00', FNota.NFe.Total.ICMSTot.vICMS), ',', '.', [rfReplaceAll]);
  AXML.DocumentElement.ChildNodes['vICMSDeson'].Text := StringReplace(FormatFloat('#,##0.00', FNota.NFe.Total.ICMSTot.vICMSDeson), ',', '.', [rfReplaceAll]);
  AXML.DocumentElement.ChildNodes['vFCP'].Text       := StringReplace(FormatFloat('#,##0.00', FNota.NFe.Total.ICMSTot.vFCP), ',', '.', [rfReplaceAll]);
  AXML.DocumentElement.ChildNodes['vBCST'].Text      := StringReplace(FormatFloat('#,##0.00', FNota.NFe.Total.ICMSTot.vBCST), ',', '.', [rfReplaceAll]);
  AXML.DocumentElement.ChildNodes['vST'].Text        := StringReplace(FormatFloat('#,##0.00', FNota.NFe.Total.ICMSTot.vST), ',', '.', [rfReplaceAll]);
  AXML.DocumentElement.ChildNodes['vFCPST'].Text     := StringReplace(FormatFloat('#,##0.00', FNota.NFe.Total.ICMSTot.vFCPST), ',', '.', [rfReplaceAll]);
  AXML.DocumentElement.ChildNodes['vFCPSTRet'].Text  := StringReplace(FormatFloat('#,##0.00', FNota.NFe.Total.ICMSTot.vFCPSTRet), ',', '.', [rfReplaceAll]);
  AXML.DocumentElement.ChildNodes['vProd'].Text      := StringReplace(FormatFloat('#,##0.00', FNota.NFe.Total.ICMSTot.vProd), ',', '.', [rfReplaceAll]);
  AXML.DocumentElement.ChildNodes['vFrete'].Text     := StringReplace(FormatFloat('#,##0.00', FNota.NFe.Total.ICMSTot.vFrete), ',', '.', [rfReplaceAll]);
  AXML.DocumentElement.ChildNodes['vSeg'].Text       := StringReplace(FormatFloat('#,##0.00', FNota.NFe.Total.ICMSTot.vSeg), ',', '.', [rfReplaceAll]);
  AXML.DocumentElement.ChildNodes['vDesc'].Text      := StringReplace(FormatFloat('#,##0.00', FNota.NFe.Total.ICMSTot.vDesc), ',', '.', [rfReplaceAll]);
  AXML.DocumentElement.ChildNodes['vII'].Text        := StringReplace(FormatFloat('#,##0.00', FNota.NFe.Total.ICMSTot.vII), ',', '.', [rfReplaceAll]);
  AXML.DocumentElement.ChildNodes['vIPI'].Text       := StringReplace(FormatFloat('#,##0.00', FNota.NFe.Total.ICMSTot.vIPI), ',', '.', [rfReplaceAll]);
  AXML.DocumentElement.ChildNodes['vIPIDevol'].Text  := StringReplace(FormatFloat('#,##0.00', FNota.NFe.Total.ICMSTot.vIPIDevol), ',', '.', [rfReplaceAll]);
  AXML.DocumentElement.ChildNodes['vPIS'].Text       := StringReplace(FormatFloat('#,##0.00', FNota.NFe.Total.ICMSTot.vPIS), ',', '.', [rfReplaceAll]);
  AXML.DocumentElement.ChildNodes['vCOFINS'].Text    := StringReplace(FormatFloat('#,##0.00', FNota.NFe.Total.ICMSTot.vCOFINS), ',', '.', [rfReplaceAll]);
  AXML.DocumentElement.ChildNodes['vOutro'].Text     := StringReplace(FormatFloat('#,##0.00', FNota.NFe.Total.ICMSTot.vOutro), ',', '.', [rfReplaceAll]);
  AXML.DocumentElement.ChildNodes['vNF'].Text        := StringReplace(FormatFloat('#,##0.00', FNota.NFe.Total.ICMSTot.vNF), ',', '.', [rfReplaceAll]);
end;

function TdmNFCe.Pegar_Valor_Base_Calculo(AProduto: TDetCollectionItem): Double;
begin
  Result := RoundABNT((AProduto.Prod.qCom * AProduto.Prod.vUnCom) +
    AProduto.Prod.vFrete + AProduto.Prod.vSeg + AProduto.Prod.vOutro - AProduto.Prod.vDesc, -2);
end;

procedure TdmNFCe.ReImprimir_Nota(AXML: String);
begin
  if Trim(AXML) = '' then
    raise Exception.Create('Não foi possível recarregar o xml para a impressão da DANFE.');

  Carregar_Configuracoes_Impressao();

  NFCe.NotasFiscais.Clear();
  FNota := NFCe.NotasFiscais.Add();
  FNota.LerXML(base64.DecodeString(AXML));
  FNota.Imprimir();
end;

end.
