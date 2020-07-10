unit UControllerWebServiceConsultaEnvioNota;

interface
 uses
   System.SysUtils, System.Classes, Vcl.Dialogs,

   UControllerWebService, UViewAviso, UModelBase;

type
  TControllerWebServiceConsultaEnvioNota = class(TControllerWebService)
  private
    FModelo,
    FNFCe,
    FRegistro: Int64;

    FIntegrado: Integer;

    FSerie: String;

    protected
      function Montar_URL(): String; override;
      function Pegar_Parametro_Body(): String; override;

    public
      constructor Create(AIdEmitente: Int64);

      destructor Destroy(); override;

      function Consultar_API(): Boolean;

      property Integrado: Integer read FIntegrado;
      property Modelo: Int64 read FModelo write FModelo;
      property NFCe: Int64 read FNFCe write FNFCe;
      property Registro: Int64 read FRegistro write FRegistro;
      property Serie: String read FSerie write FSerie;
  end;

implementation

{ TControllerWebServiceConsultaEnvioNota }

function TControllerWebServiceConsultaEnvioNota.Consultar_API: Boolean;
var
  Status: String;

  Aviso: TViewAviso;

begin
  Status := '0';
  Aviso  := TViewAviso.Create(nil);
  try
    Aviso.Exibir(Format('Consultando Status da Nota Fiscal Nº %d.', [FNFCe]));
    Status := Executar();
  finally
    Result := Trim(Status) = '1';
    FreeAndNil(Aviso);
  end;
end;

constructor TControllerWebServiceConsultaEnvioNota.Create(AIdEmitente: Int64);
begin
  inherited Create(AIdEmitente);
  Modelo   := -1;
  NFCe     := -1;
  Serie    := '';
  Registro := -1;
end;

destructor TControllerWebServiceConsultaEnvioNota.Destroy;
begin
  inherited;
end;

function TControllerWebServiceConsultaEnvioNota.Montar_URL: String;
begin
  Result := Format('%s/verifica_nfce/index.php?cnpjEmit=%s&Token=%s&NFCe=%d&SerieNFC=%s&ModNFC=%d&Registro=%d',
    [URL_BASE, Pegar_CNPJ_Emitente(), Pegar_ApiToken_Emitente(), FNFCe, FSerie, FModelo, FRegistro]);
end;

function TControllerWebServiceConsultaEnvioNota.Pegar_Parametro_Body: String;
begin
  Result := '';
end;

end.
