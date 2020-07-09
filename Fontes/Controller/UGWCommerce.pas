unit UGWCommerce;

interface
  uses
    System.SysUtils,  System.Generics.Collections, System.Classes, System.UITypes,

    Vcl.Forms, Vcl.Dialogs, pcnConversao, Winapi.Windows,

    UEstoque, UModelBase, UVenda, UControllerEstoque, UControllerVenda,
    UViewGerenciarNotasFiscais, UViewOpcoes, UEmitente, UCliente, UViewFuncionarios;

type
  TGWCommerce = class(TPersistent)
  private
    FVendaIniciada: Boolean;

    FFatorMultiplicador: Double;

    FIdVendedor: Int64;

    FCliente: TCliente;

    FEstoque: TControllerEstoque;

    FVenda: TControllerVenda;

    FEmitente: TEmitente;

    function Finalizar_Pagamento(): Boolean;
    function Pegar_IdVendedor(): Int64;

    procedure Validar_Limite_Venda();

  public
    constructor Create();

    destructor Destroy(); override;

    function Verificar_Tem_Venda_Pendente(): Boolean;

    procedure Acessar_Opcoes();
    procedure Aplicar_Desconto();
    procedure Exibir_Venda_Para_Cancelar();
    procedure Fechar_No_F12();
    procedure Fechar_No_F3();
    procedure Fechar_No_F7();
    procedure Identificar_Cliente();
    procedure Iniciar();
    procedure Inserir_Item();
    procedure Limpar_Venda();
    procedure Validar_Venda_Aberta();

    property Cliente: TCliente read FCliente write FCliente;
    property Emitente: TEmitente read FEmitente write FEmitente;
    property Estoque: TControllerEstoque read FEstoque write FEstoque;
    property IdVendedor: Int64 read FIdVendedor write FIdVendedor;
    property FatorMultiplicador: Double read FFatorMultiplicador write FFatorMultiplicador;
    property Venda: TControllerVenda read FVenda write FVenda;
    property VendaIniciada: Boolean read FVendaIniciada;

  end;

implementation
uses
  UViewPDV, UModelNFCe, UViewPagamentoSelecao, UPagamento, UViewConsultaPreco, UViewIdentificarCliente;

{ TGWCommerce }

procedure TGWCommerce.Acessar_Opcoes;
var
  View: TViewOpcoes;

begin
  if VendaIniciada then
    MessageDlg('Não é possível acessas as opções do sistema com venda em aberto.', mtError, [], 0)
  else
  begin
    View := TViewOpcoes.Create(nil);
    try
      View.Exibir(Self);
    finally
      FreeAndNil(View);
    end;
  end;
end;

procedure TGWCommerce.Aplicar_Desconto;
var
  View: TViewPDV;

begin
  try
    Validar_Venda_Aberta();

    if not FVenda.Tem_Consumo() then
      raise Exception.Create('Nenhum item adicionado para aplicar o desconto.');

    FVenda.Itens[0].Desconto.Aplicar(Self);

    View := Screen.ActiveForm as TViewPDV;
    View.CupomFiscal.Exibir_Venda(Self);
  except on E: Exception do
    MessageDlg(Format('Erro: %s', [E.Message]), mtError, [mbOK], 0);
  end;
end;

constructor TGWCommerce.Create;
begin
  FatorMultiplicador := 1;
  IdVendedor         := -1;
  Estoque            := TControllerEstoque.Create();
  Venda              := TControllerVenda.Create();
  Emitente           := TEmitente.Create();
  Cliente            := TCliente.Create();

  dmDados.Abrir_Tabela_Emitente();

  Emitente.Nome         := dmDados.cliEmitenteNOME.AsString;
  Emitente.NomeFantasia := dmDados.cliEmitenteNOME_FANTASIA.AsString;
  Emitente.Contato      := dmDados.cliEmitenteCONTATO.AsString;
  Emitente.Endereco     := dmDados.cliEmitenteENDERECO.AsString;
  Emitente.Numero       := dmDados.cliEmitenteNUMERO.AsString;
  Emitente.Bairro       := dmDados.cliEmitenteBAIRRO.AsString;
  Emitente.Municipio    := dmDados.cliEmitenteMUNICIPIO.AsString;
  Emitente.CDCidade     := dmDados.cliEmitenteCD_CIDADE.AsString;
  Emitente.CEP          := dmDados.cliEmitenteCEP.AsString;
  Emitente.Estado       := dmDados.cliEmitenteESTADO.AsString;
  Emitente.CDEstado     := dmDados.cliEmitenteCD_ESTADO.AsString;
  Emitente.CDPais       := dmDados.cliEmitenteCD_PAIS.AsString;
  Emitente.Pais         := dmDados.cliEmitentePAIS.AsString;
  Emitente.CNPJ         := dmDados.cliEmitenteCNPJ.AsString;
  Emitente.CPF          := dmDados.cliEmitenteCPF.AsString;
  Emitente.IE           := dmDados.cliEmitenteIE.AsString;
  Emitente.Telefone     := dmDados.cliEmitenteTELEFONE.AsString;
  Emitente.Email        := dmDados.cliEmitenteEMAIL.AsString;
  Emitente.CRT          := dmDados.cliEmitenteCRT.AsString;
  Emitente.CNAE         := dmDados.cliEmitenteCNAE.AsString;
  Emitente.Municipio    := dmDados.cliEmitenteMUNICIPIO.AsString;
  Emitente.Registro     := dmDados.cliEmitenteREGISTRO.AsLargeInt;

  dmDados.Abrir_Tabela_Configuracao();

  dmDados.Filtrar_Configuracao(Emitente.Registro);

  Emitente.NFCeTokenCSCId   := dmDados.cliConfiguracaoNFCE_TOKEN_ID.AsString;
  Emitente.NFCeTokenCSC     := dmDados.cliConfiguracaoNFCE_TOKEN_CSC.AsString;
  Emitente.NFCeSerie        := dmDados.cliConfiguracaoNFCE_SERIE.AsLargeInt;
  Emitente.NFCeUltimaNota   := dmDados.cliConfiguracaoNFCE_NUMERO_EMITIDO.AsLargeInt;
  Emitente.ApiToken         := dmDados.cliConfiguracaoAPI_CONEXAO_TOKEN.AsString;
  Emitente.CertificadoSerie := dmDados.cliConfiguracaoCERTIFICADO_SERIE.AsString;
  Emitente.CertificadoSenha := dmDados.cliConfiguracaoCERTIFICADO_SENHA.AsString;

  if dmDados.cliConfiguracaoNFCE_AMBIENTE_EMISSAO.AsLargeInt = 0 then
    Emitente.Ambiente := taProducao
  else
    Emitente.Ambiente := taHomologacao;

  dmDados.cliConfiguracao.Filtered := False;
end;

destructor TGWCommerce.Destroy;
begin
  FEstoque.Free();
  FVenda.Free();
  FEmitente.Free();
  FCliente.Free();
end;

procedure TGWCommerce.Exibir_Venda_Para_Cancelar;
var
  View: TViewGerenciarNotasFiscais;

begin
  View := TViewGerenciarNotasFiscais.Create(nil);
  try
    View.Exibir(Self, taCancelar);
  finally
    FreeAndNil(View);
  end;
end;

procedure TGWCommerce.Fechar_No_F12;
begin
  try
    if Finalizar_Pagamento() then
    begin
      dmNFCe.Finalizar_Venda(Self, 90);
      Limpar_Venda();

      FVendaIniciada := False;
      ViewPDV        := Screen.ActiveForm as TViewPDV;
      ViewPDV.CupomFiscal.Fechar_Cupom();
      ViewPDV.Limpar_Valores_Tela();
    end;
  except on E: Exception do
    MessageDlg(Format('Erro: %s', [E.Message]), mtError, [mbOk], 0);
  end;
end;

procedure TGWCommerce.Fechar_No_F3;
begin
  try
    if Finalizar_Pagamento() then
    begin
      Validar_Limite_Venda();

      FIdVendedor := Pegar_IdVendedor();
      dmNFCe.Finalizar_Venda(Self, 65);
      Limpar_Venda();

      FVendaIniciada := False;
      ViewPDV        := Screen.ActiveForm as TViewPDV;
      ViewPDV.CupomFiscal.Fechar_Cupom();
      ViewPDV.Limpar_Valores_Tela();
    end;
  except on E: Exception do
    MessageDlg(Format('Erro: %s', [E.Message]), mtError, [mbOk], 0);
  end;
end;

procedure TGWCommerce.Fechar_No_F7;
var
  Pagamento: TPagamento;

  ViewPDV: TViewPDV;

begin
  try
    Validar_Venda_Aberta();
    Validar_Limite_Venda();

    if not FVenda.Tem_Consumo then
      raise Exception.Create('Não há itens para fechar a venda.');

    FVenda.Liberar_Pagamentos();

    Pagamento          := TPagamento.Create();
    Pagamento.Tipo     := fpDinheiro;
    Pagamento.Dinheiro := FVenda.Total - FVenda.Desconto;
    FVenda.Pagamentos.Add(Pagamento);

    dmNFCe.Finalizar_Venda(Self, 65);

    Limpar_Venda();

    FVendaIniciada := False;
    ViewPDV        := Screen.ActiveForm as TViewPDV;
    ViewPDV.CupomFiscal.Fechar_Cupom();
    ViewPDV.Limpar_Valores_Tela();
  except on E: Exception do
    MessageDlg(Format('Erro: %s', [E.Message]), mtError, [mbOk], 0);
  end;
end;

function TGWCommerce.Finalizar_Pagamento: Boolean;
var
  Finalizou: Boolean;

  I: Integer;

  Finalizacao,
  Pagamento: TPagamento;

  Selecao: TViewPagamentoSelecao;

begin
  Validar_Venda_Aberta();
  Finalizou := False;
  Selecao   := TViewPagamentoSelecao.Create(nil);
  try
    Selecao.Exibir(Self);

    if Selecao.Finalizar then
    begin
      FVenda.Liberar_Pagamentos();

      for I := 0 to Selecao.Pagamentos.Count -1 do
      begin
        Pagamento                            := Selecao.Pagamentos.Items[I];
        Finalizacao                          := TPagamento.Create();
        Finalizacao.Tipo                     := Pagamento.Tipo;
        Finalizacao.Cartao.Tipo              := Pagamento.Cartao.Tipo;
        Finalizacao.Cartao.TipoBandeira      := Pagamento.Cartao.TipoBandeira;
        Finalizacao.Cartao.Valor             := Pagamento.Cartao.Valor;
        Finalizacao.Cartao.CodigoAutorizacao := Pagamento.Cartao.CodigoAutorizacao;
        Finalizacao.Prazo                    := Pagamento.Prazo;
        Finalizacao.Cheque                   := Pagamento.Cheque;
        Finalizacao.Dinheiro                 := Pagamento.Dinheiro;
        FVenda.Pagamentos.Add(Finalizacao);
      end;
      Finalizou := True;
    end;
  finally
    Selecao.Free;
    Result := Finalizou;
  end;
end;

procedure TGWCommerce.Identificar_Cliente;
var
  Identificacao: TViewIdentificarCliente;

begin
  try
    Validar_Venda_Aberta();

    Identificacao := TViewIdentificarCliente.Create(nil);
    try
      Identificacao.Exibir();
      Cliente.Nome       := Identificacao.Nome;
      Cliente.CPF        := Identificacao.Documento;
      Cliente.Cadastrado := not (Cliente.Nome <> '') and (Cliente.CPF <> '');
    finally
      FreeAndNil(Identificacao);
    end;
  except on E: Exception do
    MessageDlg(Format('Erro: %s', [E.Message]), mtError, [mbOK], 0);
  end;
end;

procedure TGWCommerce.Iniciar;
var
  View: TViewPDV;

begin
  try
    if FVendaIniciada then
      raise Exception.Create('Venda já Iniciada');

    FEstoque.Carregar(FEmitente.Registro);
    FVenda.Liberar();
    FVenda.Liberar_Pagamentos();
    FCliente.Cadastrado := True;

    dmDados.Abrir_Tabela_Venda(FEmitente.Registro);

    View := Screen.ActiveForm as TViewPDV;

    View.CupomFiscal.Abrir_Cupom();
    View.cbbPesquisa.Enabled := True;
    View.cbbPesquisa.Text    := '';
    View.cbbPesquisa.Color   := View.edtItemQuantidade.Color;
    View.cbbPesquisa.SetFocus();

    FVendaIniciada := True;
  except on E: Exception do
    MessageDlg(Format('Erro: %s', [E.Message]), mtError, [mbOK], 0);
  end;
end;

procedure TGWCommerce.Inserir_Item();
var
  Estoque: TEstoque;

  Venda: TVenda;

  View: TViewConsultaPreco;

begin
  Estoque := FEstoque.Pegar_Selecionado();

  if Estoque = nil then
  begin
    View := TViewConsultaPreco.Create(nil);
    try
      View.Exibir(True);
      Estoque := FEstoque.Buscar(View.Estoque.CodigoProduto);
    finally
      FreeAndNil(View);
    end;
  end;

  if Estoque = nil then
    raise Exception.Create('Nenhum produto selecionado para venda.');

  if (Trim(UpperCase(Estoque.Medida)) <> 'KG') and (Frac(FFatorMultiplicador) <> 0) then
    raise Exception.Create(Format('O Produto %s não permite venda fracionada.', [Estoque.Descricao]));

  Venda                       := TVenda.Create();
  Venda.CodigoProduto         := Estoque.CodigoProduto;
  Venda.CodigoProdutoExibicao := Estoque.Codigo;
  Estoque.Descricao           := Trim(Estoque.Descricao);
  Venda.DescricaoProduto      := Copy(Estoque.Descricao, 1, 40);
  Venda.Medida                := Copy(Trim(Estoque.Medida), 1, 3);
  Venda.Quantidade            := FFatorMultiplicador;
  Venda.ValorUnitario         := Estoque.PrecoVenda;
  Venda.RegistroEmitente      := FEmitente.Registro;
  Venda.DataHora              := Now();

  dmDados.Inserir_Venda(Venda);

  Venda.Ordem := dmDados.cliVenda.RecordCount;
  FVenda.Itens.Add(Venda);
  ViewPDV.CupomFiscal.Exibir_Venda(Self);
  ViewPDV.cbbPesquisa.Text      := '';
  ViewPDV.cbbPesquisa.ItemIndex := -1;
  FFatorMultiplicador           := 1;
end;

procedure TGWCommerce.Limpar_Venda;
begin
  dmDados.cliVenda.First();
  while not dmDados.cliVenda.Eof do
  begin
    dmDados.delVenda.ParamByName('PCODIGO').AsLargeInt := dmDados.cliVendaCODIGO.AsLargeInt;
    dmDados.delVenda.ExecSQL();
    dmDados.cliVenda.Delete();
  end;
end;

function TGWCommerce.Pegar_IdVendedor: Int64;
var
  ViewFuncionario: TViewFuncionarios;

begin
  ViewFuncionario := TViewFuncionarios.Create(nil);
  try
    ViewFuncionario.Exibir(FEmitente.Registro);
    Result := ViewFuncionario.Id;
  finally
    FreeAndNil(ViewFuncionario);
  end;
end;

procedure TGWCommerce.Validar_Limite_Venda;
const
  MAX_SEM_IDENTIFICACAO = 3000;

  MAX_TOTAL = 200000;

begin
  if (FVenda.Total - FVenda.Desconto) > MAX_TOTAL then
     raise Exception.Create(Format('Limite Máximo da NFC-e permitido é R$ 200.000,00.',
      [FormatFloat('#,##0.00', MAX_TOTAL)]));

  if ((FVenda.Total - FVenda.Desconto) > MAX_SEM_IDENTIFICACAO) and (Cliente.CodigoCliente <= 0) then
    raise Exception.Create(Format('Vendas acima de R$ %s é obrigatório identificar o cliente.',
      [FormatFloat('#,##0.00', MAX_SEM_IDENTIFICACAO)]));
end;

procedure TGWCommerce.Validar_Venda_Aberta;
begin
  if not FVendaIniciada then
    raise Exception.Create('Venda não iniciada.');
end;

function TGWCommerce.Verificar_Tem_Venda_Pendente: Boolean;
begin
  dmDados.Abrir_Tabela_Venda(FEmitente.Registro);

  Result := dmDados.cliVenda.RecordCount > 0;
end;

initialization
  System.Classes.RegisterClass(TGWCommerce);

finalization
  System.Classes.UnRegisterClass(TGWCommerce);

end.
