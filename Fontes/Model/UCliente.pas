unit UCliente;

interface

type
  TCliente = class
  private
    FCadastrado: Boolean;

    FCodigoCliente: Int64;

    FCPF,
    FNome: String;

    public
      constructor Create();

      property Cadastrado: Boolean read FCadastrado write FCadastrado;
      property CodigoCliente: Int64 read FCodigoCliente write FCodigoCliente;
      property CPF: String read FCPF write FCPF;
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

end.
