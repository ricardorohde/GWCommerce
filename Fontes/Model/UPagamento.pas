unit UPagamento;

interface
  uses
    ACBrUtil,

    System.SysUtils,

    pcnConversao,

    UCartao;

type
  TPagamento = class
  private
    FCheque,
    FDinheiro,
    FPrazo,
    FTotal: Double;

    FCartao: TCartao;

    FTipo: TpcnFormaPagamento;

    procedure SetCheque(const Value: Double);
    procedure SetDinheiro(const Value: Double);
    procedure SetPrazo(const Value: Double);
    procedure SetTotal(const Value: Double);

  const
    ERRO = 'Valor de %s inválido.';

  public
    constructor Create();

    destructor Destroy(); override;

    procedure Validar_Pagamento();

    property Cartao: TCartao read FCartao write FCartao;
    property Cheque: Double read FCheque write SetCheque;
    property Dinheiro: Double read FDinheiro write SetDinheiro;
    property Prazo: Double read FPrazo write SetPrazo;
    property Tipo: TpcnFormaPagamento read FTipo write FTipo;
    property Total: Double read FTotal write SetTotal;

  end;

implementation

{ TPagamento }

constructor TPagamento.Create;
begin
  Cartao   := TCartao.Create();
  Cheque   := 0;
  Dinheiro := 0;
  Prazo    := 0;
  Total    := 0;
  Tipo     := fpSemPagamento;
end;

destructor TPagamento.Destroy;
begin

end;

procedure TPagamento.SetCheque(const Value: Double);
var
  Valor: String;

begin
  FCheque := 0;
  Valor   := FloatToStr(Value);

  if not TryStrToFloat(Valor, FCheque) then
    raise Exception.Create(Format(ERRO, ['Cheque']));
end;

procedure TPagamento.SetDinheiro(const Value: Double);
var
  Valor: String;

begin
  FDinheiro := 0;
  Valor     := FloatToStr(Value);

  if not TryStrToFloat(Valor, FDinheiro) then
    raise Exception.Create(Format(ERRO, ['Dinheiro']));
end;

procedure TPagamento.SetPrazo(const Value: Double);
var
  Valor: String;

begin
  FPrazo := 0;
  Valor  := FloatToStr(Value);

  if not TryStrToFloat(Valor, FPrazo) then
    raise Exception.Create(Format(ERRO, ['Prazo']));
end;

procedure TPagamento.SetTotal(const Value: Double);
var
  Valor: String;

begin
  FTotal := 0;
  Valor  := FloatToStr(Value);

  if not TryStrToFloat(Valor, FTotal) then
    raise Exception.Create(Format(ERRO, ['Total']));
end;

procedure TPagamento.Validar_Pagamento;
var
  TotalGeral: Double;

begin
  TotalGeral := RoundABNT(FCartao.Valor + FPrazo + FCheque + FDinheiro, -2);

  if TotalGeral < FTotal then
    raise Exception.Create('Valor de pagamentos menor que o valor total da conta.');
end;

end.
