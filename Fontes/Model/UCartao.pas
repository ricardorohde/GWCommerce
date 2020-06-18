unit UCartao;

interface
uses
  System.SysUtils,

  pcnConversao;

type
//  TTipoBandeira = (tbNenhum = 0, tbVisa = 1, tbMastercard = 2, tbAmericanExpress = 3, tbSorocred = 4,
//     tbDinersClub = 5, tbElo = 6, tbHipercard = 7, tbAura = 8, tbCabal = 9, tbOutros = 99);

  TTipoCartao = (tcNenhum = 0, tcCredito = 1, tcDebito = 2);

  TCartao = class
  private
    FValor: Double;

    FCodigoAutorizacao: String;

    FTipoBandeira: TpcnBandeiraCartao;//TTipoBandeira;

    FTipo: TTipoCartao;

    procedure SetValor(const Value: Double);

  public
    constructor Create();

 //   function Pegar_Codigo_Bandeira(): String;

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
  TipoBandeira      := bcOutros;//tbNenhum;
  Tipo              := tcNenhum;
  Valor             := 0;
  CodigoAutorizacao := '';
end;

destructor TCartao.Destroy;
begin
//  inherited;
end;

{function TCartao.Pegar_Codigo_Bandeira: String;
begin
  case FTipoBandeira of
    tbVisa           : Result := '01';
    tbMastercard     : Result := '02';
    tbAmericanExpress: Result := '03';
    tbSorocred       : Result := '04';
    tbDinersClub     : Result := '05';
    tbElo            : Result := '06';
    tbHipercard      : Result := '07';
    tbAura           : Result := '08';
    tbCabal          : Result := '09';
  else
    Result := '99';
  end;
end;}

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
