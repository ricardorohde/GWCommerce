unit UControllerWebService;

interface

uses
  System.Classes, System.SysUtils, System.StrUtils,

  IdHTTP,

  UModelBase;

type
  TControllerWebService = class
  private
    FIdEmitente: Int64;

    FWebService: TIdHTTP;

  protected
    function Pegar_ApiToken_Emitente(): String;
    function Pegar_CNPJ_Emitente(): String;
    function Pegar_Servico(): String; virtual; abstract;

  public
    constructor Create(AIdEmitente: Int64);

    destructor Destroy(); override;

    function Executar(): String;

    property IdEmitente: Int64 read FIdEmitente;
    property WebService: TIdHTTP read FWebService write FWebService;

  end;

implementation

{ TControllerWebService }

constructor TControllerWebService.Create(AIdEmitente: Int64);
begin
  FIdEmitente := AIdEmitente;
  WebService  := TIdHTTP.Create(nil);
end;

destructor TControllerWebService.Destroy;
begin
  inherited;
end;

function TControllerWebService.Executar: String;
var
  CNPJ,
  Retorno,
  TokenApi,
  Url: String;

  Parametro1: TStringList;

  Parametro2: TStringStream;

begin
  CNPJ := Pegar_CNPJ_Emitente();

  if Trim(CNPJ) = '' then
    raise Exception.Create('CNPJ do Emitente não encontrado.');

  TokenApi := Pegar_ApiToken_Emitente();

  if Trim(TokenApi) = '' then
    raise Exception.Create('Token da API não encontrado.');

  Retorno    := '';
  Parametro1 := TStringList.Create();
  Parametro2 := TStringStream.Create('');
  try
    Url := Format('https://www.gwcommerce.com.br/%s/index.php?cnpj=%s&token=%s', [Pegar_Servico(), CNPJ, TokenApi]);
    FWebService.Post(Url, Parametro1, Parametro2);
    Retorno := Parametro2.DataString;
  finally
    Result := Retorno;
    Parametro1.Free();
    Parametro2.Free();
  end;
end;

function TControllerWebService.Pegar_ApiToken_Emitente: String;
begin
  dmDados.cliConfiguracao.Filter   := Format('REGISTRO_EMITENTE = %d', [FIdEmitente]);
  dmDados.cliConfiguracao.Filtered := True;

  Result := IfThen(dmDados.cliConfiguracao.RecordCount > 0, dmDados.cliConfiguracaoAPI_CONEXAO_TOKEN.AsString, '');

  dmDados.cliConfiguracao.Filtered := False;
end;

function TControllerWebService.Pegar_CNPJ_Emitente: String;
begin
  dmDados.cliEmitente.Filter   := Format('REGISTRO = %d', [FIdEmitente]);
  dmDados.cliEmitente.Filtered := True;

  Result := IfThen(dmDados.cliEmitente.RecordCount > 0, dmDados.cliEmitenteCNPJ.AsString, '');

  dmDados.cliEmitente.Filtered := False;
end;

end.
