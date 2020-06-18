unit UModelNFCe;

interface

uses
  System.SysUtils, System.Classes, ACBrBase, ACBrDFe, ACBrNFe, ACBrNFeNotasFiscais,
  pcnConversao, pcnConversaoNFe, pcnNFe, System.StrUtils, vcl.Forms, Vcl.Dialogs,

  Vcl.Printers, Winapi.Windows, pcnEnvEventoNFe, System.UITypes,

  ACBrDFeReport, ACBrDFeDANFeReport, ACBrNFeDANFEClass, ACBrUtil,
  ACBrDANFCeFortesFr, blcksock, ACBrDFeSSL,

  UGWCommerce, UEstoque, UPagamento, UCartao, ACBrNFeDANFEFR, ACBrNFeDANFeRLClass,
  UViewAviso, IdBaseComponent, IdCoder, IdCoder3to4, IdCoderMIME;

type
  TdmNFCe = class(TDataModule)
    NFCe: TACBrNFe;
    LayoutFiscal: TACBrNFeDANFCeFortes;
    LayoutNaoFiscal: TACBrNFeDANFCeFortes;
    base64: TIdDecoderMIME;
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

  public
//    function Enviar_Nota(AGWCommerce: TGWCommerce): Boolean;

//    procedure Gerar_XML(AGWCommerce: TGWCommerce);
    procedure Cancelar_Nota_Fiscal(AChave, AJustificativa: String; AGWCommerce: TGWCommerce);
    procedure Enviar_OffLine(AGWCommerce: TGWCommerce; AXML: String);
    procedure Finalizar_Venda(AGWCommerce: TGWCommerce; AModelo: Int64);
    procedure ReImprimir_Nota(AXML: String);

  end;

var
  dmNFCe: TdmNFCe;

implementation
uses
  UVenda, UModelBase;

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
  NFCe.Configuracoes.Certificados.NumeroSerie := FGWCommerce.Emitente.CertificadoSerie;//'0e470484de697d98418fb164f0b49f60';
  NFCe.Configuracoes.Certificados.Senha       := AnsiString( FGWCommerce.Emitente.CertificadoSenha );//1234
  NFCe.Configuracoes.Arquivos.Salvar          := True;
  NFCe.Configuracoes.Arquivos.PathSalvar      := Format('%s\%s', [ExtractFilePath(ParamStr(0)), 'XML']);
  NFCe.Configuracoes.Geral.SSLCryptLib        := cryWinCrypt;
  NFCe.Configuracoes.Geral.SSLHttpLib         := httpWinINet;
  NFCe.Configuracoes.Geral.SSLLib             := libWinCrypt;
  NFCe.Configuracoes.Geral.SSLXmlSignLib      := xsMsXml;
  NFCe.Configuracoes.Geral.Salvar             := False;
  NFCe.Configuracoes.Geral.IdCSC              := FGWCommerce.Emitente.NFCeTokenCSCId;//'000001';
  NFCe.Configuracoes.Geral.CSC                := FGWCommerce.Emitente.NFCeTokenCSC;// 'cc06ad48ed249572b0f90385725b5c20';
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
{  NFCe.Configuracoes.Geral.VersaoDF := ve400;
  FNota.NFe.Transp.modFrete         := mfSemFrete;

  Gerar_Tag_Ide(AModelo);
  Gerar_Tag_Emitente();
  Gerar_Tag_Destinatario();
  Gerar_Tag_Produto();
  Gerar_Tag_Total();
  Gerar_Tag_Pagamento();
  FNota.NFe.InfAdic.infCpl := 'Obrigado pela preferência e volte Sempre.';

  if Trim(String(FNota.GerarXML())) <> '' then
  begin
    dmDados.Registrar_NFE_CAB(AGWCommerce, FNota);

    //if NFCe.Enviar(FNota.NFe.Ide.nNF, True, True) then
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
    raise Exception.Create('Não foi possível gerar o xml da Nota Fiscal.');}
end;

{function TdmNFCe.Enviar_Nota(AGWCommerce: TGWCommerce): Boolean;
//var
//  Xml: String;

begin
  FGWCommerce := AGWCommerce;

  Carregar_Configuracoes();

  FNota := NFCe.NotasFiscais.Add();

  NFCe.Configuracoes.Geral.VersaoDF := ve400;
  Gerar_Tag_Ide();
  Gerar_Tag_Emitente();
  Gerar_Tag_Destinatario();

//  Processar();
  Gerar_Tag_Produto();
  Gerar_Tag_Total();
  Gerar_Tag_Pagamento();
  FNota.NFe.Transp.modFrete := mfSemFrete;
//  Gerar_Tag_Informacao_Complementar();
  Xml := string( FNota.GerarXML() );

  dmDados.Gerar_Nota_Fiscal(AGWCommerce, NFCe);

  Result := NFCe.Enviar(FNota.NFe.Ide.nNF, True, True);

  NFCe.NotasFiscais.Clear();
end;}

procedure TdmNFCe.Finalizar_Venda(AGWCommerce: TGWCommerce; AModelo: Int64);
var
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

  if Trim(String(FNota.GerarXML())) <> '' then
  begin
    dmDados.Registrar_NFE_CAB(AGWCommerce, FNota);

    if FNota.NFe.Ide.modelo = 90 then
      dmDados.Atualizar_Dados_Apos_Emitir_Nota_Fiscal(FNota);

    //if NFCe.Enviar(FNota.NFe.Ide.nNF, True, True) then
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

  AProduto.Imposto.vTotTrib := AProduto.Imposto.ICMS.vICMS + AProduto.Imposto.PIS.vPIS + AProduto.Imposto.COFINS.vCOFINS;
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

{  if FGWCommerce.Venda.Pagamento.Cartao.Valor > 0 then
  begin
    with FNota.NFe.pag.New do
    begin
      tPag := fpCartaoCredito;
      vPag := FGWCommerce.Venda.Pagamento.Cartao.Valor;
    end;
  end;

  if FGWCommerce.Venda.Pagamento.Cheque > 0 then
  begin
    with FNota.NFe.pag.New do
    begin
      tPag := fpCheque;
      vPag := FGWCommerce.Venda.Pagamento.Cheque;
    end;
  end;

  if FGWCommerce.Venda.Pagamento.Dinheiro > 0 then
  begin
    with FNota.NFe.pag.New do
    begin
      tPag := fpDinheiro;
      vPag := FGWCommerce.Venda.Pagamento.Dinheiro;
    end;
  end;

  if FGWCommerce.Venda.Pagamento.Prazo > 0 then
  begin
    with FNota.NFe.pag.New do
    begin
      tPag := fpOutro;
      vPag := FGWCommerce.Venda.Pagamento.Prazo;
    end;
  end;}
end;

procedure TdmNFCe.Gerar_Tag_Produto;
var
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
    Produto.Prod.cEAN      := IfThen(Trim(Estoque.CodigoBarras) <> '', Estoque.CodigoBarras, 'SEM GTIN');
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

{procedure TdmNFCe.Gerar_XML(AGWCommerce: TGWCommerce);
begin
  FNota       := NFCe.NotasFiscais.Add();
  FGWCommerce := AGWCommerce;

  NFCe.Configuracoes.Geral.VersaoDF := ve400;

  Gerar_Tag_Ide();
//  Gerar_Tag_Emitente();
//  Gerar_Tag_Destinatario();
  Gerar_Tag_Produto();
  Gerar_Tag_Total();

  FNota.NFe.Transp.modFrete := mfSemFrete;

  Gerar_Tag_Pagamento();

//    InfAdic.infCpl     :=  '';
 //   InfAdic.infAdFisco :=  '';

    with InfAdic.obsCont.New do
    begin
      xCampo := 'ObsCont';
      xTexto := 'Texto';
    end;

  with FNota.NFe.InfAdic.obsFisco.New do
  begin
    xCampo := 'ObsFisco';
    xTexto := 'Texto';
  end;

  FNota.Imprimir();
end;  }

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
