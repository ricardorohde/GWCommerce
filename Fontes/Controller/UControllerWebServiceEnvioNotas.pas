unit UControllerWebServiceEnvioNotas;

interface
 uses
   System.SysUtils, System.Classes, Vcl.Dialogs,

   uLkJSON,

   UControllerWebService, UViewAviso;

type
  TControllerWebServiceEnvioNotas = class(TControllerWebService)
  private
    FNumeroNota: Int64;

    FXML: String;

    protected
      function Montar_URL(): String; override;
      function Pegar_Parametro_Body(): String; override;

    public
      constructor Create(AIdEmitente: Int64);

      destructor Destroy(); override;

      function Integrar(): Boolean;

      property NumeroNota: Int64 read FNumeroNota write FNumeroNota;
      property XML: String read FXML write FXML;

  end;

implementation

{ TControllerWebServiceEnvioNotas }

constructor TControllerWebServiceEnvioNotas.Create(AIdEmitente: Int64);
begin
  inherited Create(AIdEmitente);
  XML := '';
end;

destructor TControllerWebServiceEnvioNotas.Destroy;
begin
  inherited;
end;

function TControllerWebServiceEnvioNotas.Integrar: Boolean;
var
  Integrou: Boolean;

  Retorno: String;

  Json: TlkJSONobject;

  Aviso: TViewAviso;

begin
  Integrou := False;
  Retorno  := '';
  Aviso    := TViewAviso.Create(nil);
  try
    Aviso.Exibir(Format('Integrando Nota Fiscal Nº %d.', [FNumeroNota]));
    Retorno := Executar(False);

    Json := TlkJSON.ParseText(Retorno) as TlkJSONobject;

    if Assigned(Json) and (Assigned(Json.Field['statusCode'])) then
      Integrou := Json.Field['statusCode'].Value = 200;
  finally
    Result := Integrou;
    FreeAndNil(Aviso);
  end;
end;

function TControllerWebServiceEnvioNotas.Montar_URL: String;
begin
//  Result := Format('%s/recebe_vendas/index.php?{"xml":"%s"}', [URL_BASE, FXML]);
  Result := Format('%s/recebe_vendas/index.php', [URL_BASE]);
end;

function TControllerWebServiceEnvioNotas.Pegar_Parametro_Body: String;
begin
  Result := Format('{"xml":"%s"}', [FXML]);
end;

end.
