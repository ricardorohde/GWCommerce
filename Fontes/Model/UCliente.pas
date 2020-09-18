unit UCliente;

interface
  uses
    SysUtils;

type
  TCliente = class
  private
    FCadastrado: Boolean;

    FCodigoCliente: Int64;

    FCPF,
    FNome: String;

    function GetIdentificado: Boolean;

    public
      constructor Create();


      procedure Inicializar();

      property Cadastrado: Boolean read FCadastrado write FCadastrado;
      property CodigoCliente: Int64 read FCodigoCliente write FCodigoCliente;
      property CPF: String read FCPF write FCPF;
      property Identificado: Boolean read GetIdentificado;
      property Nome: String read FNome write FNome;

  end;
implementation

{ TCliente }

constructor TCliente.Create;
begin
  Cadastrado    := True;
  CodigoCliente := -1;
  Nome          := '';
  CPF           := '';
end;

function TCliente.GetIdentificado: Boolean;
begin
  Result := (FCadastrado and (FCodigoCliente > 0)) or ((Trim(FNome) <> '') and (Trim(FCPF) <> '') and not FCadastrado);
end;

procedure TCliente.Inicializar;
begin
  FCadastrado    := False;
  FCodigoCliente := -1;
  FCPF           := '';
  FNome          := '';
end;

end.
