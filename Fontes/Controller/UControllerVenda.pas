unit UControllerVenda;

interface
  uses
    System.Generics.Collections, System.SysUtils,

    UVenda, UPagamento, UCartao;

type
  TControllerVenda = class
  private
    FItens: TList<TVenda>;

    FPagamentos: TList<TPagamento>;

    function GetFTotal: Double;

    function GetDesconto: Double;
    function GetTroco: Double;

  public
    constructor Create();

    destructor Destroy(); override;

    function Tem_Consumo(): Boolean;

    procedure Carregar(ARegistroEmitente: Int64);
    procedure Excluir_Item(AOrdem: Int64);
    procedure Liberar();
    procedure Liberar_Pagamentos();

    property Desconto: Double read GetDesconto;
    property Itens: TList<TVenda> read FItens;
    property Pagamentos: TList<TPagamento> read FPagamentos;
    property Total: Double read GetFTotal;
    property Troco: Double read GetTroco;

  end;

implementation
  uses
    UModelBase;

{ TControllerVenda }

procedure TControllerVenda.Carregar(ARegistroEmitente: Int64);
var
  Venda: TVenda;

begin
  Liberar();

  dmDados.Abrir_Tabela_Venda(ARegistroEmitente);

  while not dmDados.qryVendaConsulta.Eof do
  begin
    Venda       := TVenda.Create(dmDados.qryVendaConsultaCODIGO.AsLargeInt);
    Venda.Ordem := FItens.Count + 1;
    FItens.Add(Venda);
    dmDados.qryVendaConsulta.Next();
  end;
end;

constructor TControllerVenda.Create;
begin
  FItens      := TList<TVenda>.Create();
  FPagamentos := TList<TPagamento>.Create();
end;

destructor TControllerVenda.Destroy;
begin
  Liberar();
  FItens.Free();

  Liberar_Pagamentos();
  FPagamentos.Free();
end;

procedure TControllerVenda.Excluir_Item(AOrdem: Int64);
var
  AchouItem: Boolean;

  Venda: TVenda;

begin
  AchouItem := False;

  try
    for Venda in FItens do
      if Venda.Ordem = AOrdem then
      begin
        Venda.Filtrar_No_Banco(Format('CODIGO = %d', [Venda.Codigo]));

        if dmDados.cliVenda.RecordCount > 0 then
        begin
          AchouItem                                       := True;
          dmDados.delVenda.ParamByName('PCODIGO').AsLargeInt := Venda.Codigo;
          dmDados.delVenda.ExecSQL();
          Carregar(Venda.RegistroEmitente);
          Break;
        end;
      end;

    if not AchouItem then
      raise Exception.Create('Item não encontrado.');
  finally
    dmDados.cliVenda.Filtered := False;
  end;
end;

function TControllerVenda.GetDesconto: Double;
var
  Valor: Double;

  Venda: TVenda;

begin
  Valor := 0;

  for Venda in FItens do
    Valor := Valor + Venda.Desconto.Valor;

  Result := Valor;
end;

function TControllerVenda.GetFTotal: Double;
var
  TotalConsumo: Double;

  Venda: TVenda;

begin
  TotalConsumo:= 0;

  for Venda in FItens do
    TotalConsumo := TotalConsumo + Venda.ValorBruto;

  Result := TotalConsumo;
end;

function TControllerVenda.GetTroco: Double;
var
  Valor: Double;

  Pagamento: TPagamento;

begin
  Valor := 0;

  for Pagamento in FPagamentos do
    Valor := Valor + Pagamento.Prazo + Pagamento.Cheque + Pagamento.Dinheiro + Pagamento.Cartao.Valor;

  Result := Valor - GetFTotal + GetDesconto;
end;

procedure TControllerVenda.Liberar;
begin
  while Tem_Consumo() do
  begin
    FItens.Items[0].Free();
    FItens.Delete(0);
  end;
end;

procedure TControllerVenda.Liberar_Pagamentos;
begin
  while FPagamentos.Count > 0 do
  begin
    FPagamentos.Items[0].Free();
    FPagamentos.Delete(0);
  end;
end;

function TControllerVenda.Tem_Consumo: Boolean;
begin
  Result := FItens.Count > 0;
end;

end.
