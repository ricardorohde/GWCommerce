unit UCartao;

interface
uses
  System.SysUtils,

  pcnConversao;

type
  TTipoCartao = (tcNenhum = 0, tcCredito = 1, tcDebito = 2);

  TCartao = class
  private
    FValor: Double;

    FCodigoAutorizacao: String;

    FTipoBandeira: TpcnBandeiraCartao;

    FTipo: TTipoCartao;

    procedure SetValor(const Value: Double);

  public
    constructor Create();

    destructor Destroy(); override;

    property CodigoAutorizacao: String read FCodigoAutorizacao write FCodigoAutorizacao;
    property Tipo: TTipoCartao read FTipo write FTipo;
    property TipoBandeira: TpcnBandeiraCartao read FTipoBandeira write FTipoBandeira;
    property Valor: Double read FValor write SetValor;

  end;

implementation

{ TCartao }

constructor TCartao.Create;
begin
  TipoBandeira      := bcOutros;
  Tipo              := tcNenhum;
  Valor             := 0;
  CodigoAutorizacao := '';
end;

destructor TCartao.Destroy;
begin

end;

procedure TCartao.SetValor(const Value: Double);
var
  Cartao: String;

begin
  FValor := 0;
  Cartao := FloatToStr(Value);

  if not TryStrToFloat(Cartao, FValor) then
    raise Exception.Create(Format('Valor de %s inválido.', ['Cartão']));
end;

end.
