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
    function Montar_URL(): String; virtual; abstract;
    function Pegar_ApiToken_Emitente(): String;
    function Pegar_CNPJ_Emitente(): String;
    function Pegar_Parametro_Body(): String; virtual; abstract;

  public
    const
      URL_BASE = 'https://www.gwcommerce.com.br';

    constructor Create(AIdEmitente: Int64);

    destructor Destroy(); override;

    function Executar(AModoGet: Boolean = True): String;

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

function TControllerWebService.Executar(AModoGet: Boolean = True): String;
var
  Retorno: String;

  Parametro1: TStringList;

  Parametro2: TStringStream;

begin
  Retorno    := '';
  Parametro1 := TStringList.Create();
  try
    if not AModoGet then
    begin
      FWebService.Request.Accept      := 'application/json';
      FWebService.Request.ContentType := 'application/json';
      FWebService.Request.CharSet     := 'utf-8';

      Parametro2 := TStringStream.Create(Pegar_Parametro_Body(), TEncoding.UTF8);
      Retorno    := FWebService.Post(Montar_URL(), Parametro2);
      Parametro2.Free();
    end
    else
    begin
      Parametro2 := TStringStream.Create('');
      FWebService.Post(Montar_URL(), Parametro1, Parametro2);
      Retorno := Parametro2.DataString;
      Parametro2.Free();
    end;
  finally
    Result := Retorno;
    Parametro1.Free();
  end;
end;

function TControllerWebService.Pegar_ApiToken_Emitente: String;
begin
  dmDados.cliConfiguracao.Filter   := Format('REGISTRO_EMITENTE = %d', [FIdEmitente]);
  dmDados.cliConfiguracao.Filtered := True;

  Result := IfThen(dmDados.cliConfiguracao.RecordCount > 0, dmDados.cliConfiguracaoAPI_CONEXAO_TOKEN.AsString, '');

  dmDados.cliConfiguracao.Filtered := False;

  if Trim(Result) = '' then
    raise Exception.Create('Token da API não encontrado.');
end;

function TControllerWebService.Pegar_CNPJ_Emitente: String;
begin
  dmDados.cliEmitente.Filter   := Format('REGISTRO = %d', [FIdEmitente]);
  dmDados.cliEmitente.Filtered := True;

  Result := IfThen(dmDados.cliEmitente.RecordCount > 0, dmDados.cliEmitenteCNPJ.AsString, '');

  dmDados.cliEmitente.Filtered := False;

  if Trim(Result) = '' then
    raise Exception.Create('CNPJ do Emitente não encontrado.');
end;

end.
