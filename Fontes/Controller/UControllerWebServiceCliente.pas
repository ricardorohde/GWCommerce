unit UControllerWebServiceCliente;

interface
 uses
   System.SysUtils, System.Classes, Vcl.Dialogs,

   UlkJson,

   UControllerWebService, UViewAviso, UModelBase;

type
  TControllerWebServiceCliente = class(TControllerWebService)
    protected
      function Pegar_Servico(): String; override;

    public
      constructor Create(AIdEmitente: Int64);

      destructor Destroy(); override;

      procedure Integrar();

  end;

implementation

{ TControllerWebServiceCliente }

constructor TControllerWebServiceCliente.Create(AIdEmitente: Int64);
begin
  inherited Create(AIdEmitente);
end;

destructor TControllerWebServiceCliente.Destroy;
begin
  inherited;
end;

procedure TControllerWebServiceCliente.Integrar;
var
  I: Integer;

  Clientes: String;

  Json: TlkJSONobject;

  Lista: TlkJSONlist;

  Aviso: TViewAviso;

begin
  Aviso := TViewAviso.Create(nil);
  try
    Aviso.Exibir('Iniciando Integração de Clientes.');
    Clientes   := Executar();

    if Pos('SEM CLIENTE', UpperCase(Clientes)) > 0 then
      raise Exception.Create('Nenhum cliente encontrado.');

    dmDados.Apagar_Cliente_Antes_Integrar(IdEmitente);
    dmDados.Abrir_Tabela_Cliente(IdEmitente);

    Lista := TlkJSON.ParseText(Clientes) as TlkJSONList;

    for I := 0 to Lista.Count -1 do
    begin
      Aviso.Exibir(Format('Integração de Clientes %d%% concluídos.', [Trunc((I * 100) / Lista.Count)]));
      Json := Lista.Child[I] as TlkJSONobject;

      if (Json.Field['codigo_cliente'].Value <> '0') and (Json.Field['codigo_cliente'].Value <> '') then
        dmDados.Integrar_Cliente(Json, IdEmitente);
//      Estoques := Json.Field['codigo'].Value;
    end;
  finally
    FreeAndNil(Aviso);
  end;
end;

function TControllerWebServiceCliente.Pegar_Servico: String;
begin
  Result := 'envia_clientes';
end;

end.
