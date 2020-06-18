unit UControllerWebServiceFuncionario;

interface
 uses
   System.SysUtils,

   uLkJSON,

   UControllerWebService, UViewAviso, UModelBase;

type
  TControllerWebServiceFuncionario = class(TControllerWebService)
    protected
      function Pegar_Servico(): String; override;

    public
      constructor Create(AIdEmitente: Int64);

      destructor Destroy(); override;

      procedure Integrar();

  end;

implementation

{ TControllerWebServiceFuncionario }

constructor TControllerWebServiceFuncionario.Create(AIdEmitente: Int64);
begin
  inherited Create(AIdEmitente);
end;

destructor TControllerWebServiceFuncionario.Destroy;
begin
  inherited;
end;

procedure TControllerWebServiceFuncionario.Integrar;
var
  I: Integer;

  Funcionarios: String;

  Json: TlkJSONobject;

  Lista: TlkJSONlist;

  Aviso: TViewAviso;

begin
  Aviso := TViewAviso.Create(nil);
  try
    Aviso.Exibir('Iniciando Integração de Funcionários.');
    Funcionarios := Executar();

    if Pos('SEM FUNC', UpperCase(Funcionarios)) > 0 then
      raise Exception.Create('Nenhum funcionário encontrado.');

    dmDados.Apagar_Funcionario_Antes_Integrar(IdEmitente);
    dmDados.Abrir_Tabela_Funcionario(IdEmitente);

    Lista := TlkJSON.ParseText(Funcionarios) as TlkJSONList;

    for I := 0 to Lista.Count -1 do
    begin
      Aviso.Exibir(Format('Integração de Funcionarios %d%% concluídos.', [Trunc((I * 100) / Lista.Count)]));
      Json := Lista.Child[I] as TlkJSONobject;

      if (Json.Field['id_funcionario'].Value <> '0') and (Json.Field['id_funcionario'].Value <> '') then
        dmDados.Integrar_Funcionarios(Json, IdEmitente);
    end;
  finally
    FreeAndNil(Aviso);
  end;
end;

function TControllerWebServiceFuncionario.Pegar_Servico: String;
begin
  Result := 'envia_funcionarios';
end;

end.
