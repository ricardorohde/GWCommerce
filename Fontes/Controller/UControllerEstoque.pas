unit UControllerEstoque;

interface
  uses
    UEstoque, UModelBase,

    System.SysUtils, System.StrUtils,

    vcl.Forms,

    System.Generics.Collections, System.Classes;

type
  TControllerEstoque = class
  private
    FProdutos: TList<TEstoque>;

  public
    constructor Create();

    destructor Destroy(); override;

    function Buscar(ACodigoProduto: Int64): TEstoque;
    function Pegar_Selecionado(): TEstoque;

    procedure Carregar(ARegistroEmitente: Int64);

    property Lista: TList<TEstoque> read FProdutos write FProdutos;

  end;

implementation
uses
  UViewPDV;

{ TControllerEstoque }

function TControllerEstoque.Buscar(ACodigoProduto: Int64): TEstoque;
var
  I: Integer;

  Estoque: TEstoque;

begin
  Estoque:= nil;

  for I := 0 to FProdutos.Count -1  do
    if TEstoque(FProdutos.Items[I]).CodigoProduto = ACodigoProduto then
    begin
      Estoque := FProdutos.Items[I];
      Break;
    end;

  Result := Estoque;
end;

procedure TControllerEstoque.Carregar(ARegistroEmitente: Int64);
var
  Estoque: TEstoque;

begin
  if FProdutos.Count > 0 then
    Exit();

  dmDados.Abrir_Tabela_Estoque(ARegistroEmitente);

  dmDados.cliEstoque.First();
  while not dmDados.cliEstoque.Eof do
  begin
    if dmDados.cliEstoquePRECO_VENDA.AsFloat > 0 then
    begin
      Estoque               := TEstoque.Create();
      Estoque.CodigoProduto := dmDados.cliEstoqueCODIGO_PRODUTO.AsLargeInt;
      Estoque.Codigo        := dmDados.cliEstoqueCODIGO.AsLargeInt;
      Estoque.RegistroEmit  := dmDados.cliEstoqueREGISTRO_EMIT.AsLargeInt;
      Estoque.Descricao     := dmDados.cliEstoqueDESCRICAO.AsString;
      Estoque.Fornecedor    := dmDados.cliEstoqueFORNECEDOR.AsLargeInt;
      Estoque.Medida        := dmDados.cliEstoqueMEDIDA.AsString;
      Estoque.PrecoVenda    := dmDados.cliEstoquePRECO_VENDA.AsFloat;
      Estoque.CustoCompra   := dmDados.cliEstoqueCUSTOCOMPRA.AsFloat;
      Estoque.CustoMedio    := dmDados.cliEstoqueCUSTOMEDIO.AsFloat;
      Estoque.QtdCompra     := dmDados.cliEstoqueQTD_COMPRA.AsFloat;
      Estoque.QtdAtual      := dmDados.cliEstoqueQTD_ATUAL.AsFloat;
      Estoque.QtdMinima     := dmDados.cliEstoqueQTD_MINIMA.AsFloat;
      Estoque.QtdInicio     := dmDados.cliEstoqueQTD_INICIO.AsFloat;
      Estoque.DataInicio    := dmDados.cliEstoqueDATA_INICIO.AsDateTime;
      Estoque.UltCompra     := dmDados.cliEstoqueULT_COMPRA.AsDateTime;
      Estoque.UltVenda      := dmDados.cliEstoqueULT_VENDA.AsDateTime;
      Estoque.Local         := dmDados.cliEstoqueLOCAL.AsString;
      Estoque.IPI           := dmDados.cliEstoqueIPI.AsFloat;
      Estoque.ST            := dmDados.cliEstoqueST.AsString;
      Estoque.Comissao      := dmDados.cliEstoqueCOMISSAO.AsFloat;
      Estoque.MargemLucro   := dmDados.cliEstoqueMARGEM_LUCRO.AsFloat;
      Estoque.IAT           := dmDados.cliEstoqueIAT.AsString;
      Estoque.IPPT          := dmDados.cliEstoqueIPPT.AsString;
      Estoque.CSTIPI        := dmDados.cliEstoqueCST_IPI.AsString;
      Estoque.CodSeloIPI    := dmDados.cliEstoqueCODSELOIPI.AsString;
      Estoque.CodENQIPI     := dmDados.cliEstoqueCOD_ENQ_IPI.AsString;
      Estoque.TipoItem      := dmDados.cliEstoqueTIPO_ITEM.AsString;
      Estoque.CSOSN         := dmDados.cliEstoqueCSOSN.AsString;
      Estoque.CodigoBarras  := dmDados.cliEstoqueCODIGO_BARRAS.AsString;
      Estoque.NCM           := dmDados.cliEstoqueNCM.AsString;
      Estoque.CEST          := dmDados.cliEstoqueCEST.AsString;
      Estoque.IBPTF         := dmDados.cliEstoqueIBPT_F.AsFloat;
      Estoque.IBPTFI        := dmDados.cliEstoqueIBPT_FI.AsFloat;
      Estoque.IBPTMun       := dmDados.cliEstoqueIBPT_MUN.AsFloat;
      Estoque.IBPTEST       := dmDados.cliEstoqueIBPT_EST.AsFloat;
      Estoque.Origem        := dmDados.cliEstoqueORIGEM.AsString;
      Estoque.CFOP          := dmDados.cliEstoqueCFOP.AsString;
      Estoque.CFOPNfce      := dmDados.cliEstoqueCFOP_NFCE.AsString;
      Estoque.CodPis        := dmDados.cliEstoqueCODPIS.AsString;
      Estoque.PorcPis       := dmDados.cliEstoquePORCPIS.AsFloat;
      Estoque.CodCofins     := dmDados.cliEstoqueCODCOFINS.AsString;
      Estoque.PorCofins     := dmDados.cliEstoquePORCOFINS.AsFloat;
      Estoque.CProdAnp      := dmDados.cliEstoqueCPRODANP.AsString;
      Estoque.DescAnp       := dmDados.cliEstoqueDESCANP.AsString;
      Estoque.VPart         := dmDados.cliEstoqueVPART.AsFloat;
      Estoque.PGLP          := dmDados.cliEstoquePGLP.AsFloat;
      Estoque.PGNN          := dmDados.cliEstoquePGNN.AsFloat;
      Estoque.PGNI          := dmDados.cliEstoquePGNI.AsFloat;
      FProdutos.Add(Estoque);
    end;
    dmDados.cliEstoque.Next();
  end;
end;

constructor TControllerEstoque.Create;
begin
  FProdutos := TList<TEstoque>.Create();
end;

destructor TControllerEstoque.Destroy;
begin
  while FProdutos.Count > 0 do
  begin
    FProdutos.Items[0].Free();
    FProdutos.Delete(0);
  end;

  FProdutos.Free();
end;

function TControllerEstoque.Pegar_Selecionado: TEstoque;
var
  Codigo: Double;

  Busca: String;

  Estoque,
  EstoqueSelecionado: TEstoque;

  EstoquePorPeso: TLancamentoPorPeso;

  View: TViewPDV;

begin
  View               := Screen.ActiveForm as TViewPDV;
  Busca              := Trim(UpperCase(View.cbbPesquisa.Text));
  EstoqueSelecionado := nil;
  Codigo             := 0;

  if TryStrToFloat(Busca, Codigo) then
    if Pos('0', Busca) <> 1 then
      Busca := FloatToStr(Codigo);

  EstoquePorPeso.Inicializar();
  EstoquePorPeso.Tratar_Lancamento(Busca);
  if EstoquePorPeso.LancouPorPeso then
    Codigo  := EstoquePorPeso.CodigoProduto;

  if Busca <> '' then
    for Estoque in FProdutos do
      if (Trim(UpperCase(Estoque.Descricao)) = Busca) or (Estoque.Codigo = Codigo) or (Estoque.CodigoBarras = Busca) then
      begin
        EstoqueSelecionado := Estoque;
        EstoqueSelecionado.LancamentoPorPeso.Copiar_Valores(EstoquePorPeso);
        Break;
      end;

  Result := EstoqueSelecionado;
end;

end.
