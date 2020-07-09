unit UControllerWebServiceEstoque;

interface
uses
  System.SysUtils, System.Classes, Vcl.Dialogs,

  uLkJSON, UViewAviso,

  UControllerWebService, UModelBase;

type
  TControllerWebServiceEstoque = class(TControllerWebService)
    protected
      function Montar_URL(): String; override;
      function Pegar_Parametro_Body(): String; override;
//      function Pegar_Servico(): String; override;

    public
      constructor Create(AIdEmitente: Int64);

      destructor Destroy(); override;

      procedure Integrar();

  end;

implementation

{ TControllerWebServiceEstoque }

constructor TControllerWebServiceEstoque.Create(AIdEmitente: Int64);
begin
  inherited Create(AIdEmitente);
end;

destructor TControllerWebServiceEstoque.Destroy;
begin

  inherited;
end;

procedure TControllerWebServiceEstoque.Integrar;
var
  I: Integer;

  //CampoChave,
  Estoques: String;

  Json: TlkJSONobject;

  Lista: TlkJSONlist;

  Aviso: TViewAviso;

begin
  Aviso := TViewAviso.Create(nil);
  try
    Aviso.Exibir('Iniciando Integração de Produtos.');
    Estoques   := Executar();

    if Pos('SEM PRODUTO', UpperCase(Estoques)) > 0 then
      raise Exception.Create('Nenhum produto encontrado.');

    dmDados.Apagar_Estoque_Antes_Integrar(IdEmitente);
    dmDados.Abrir_Tabela_Estoque(IdEmitente);

//    Estoques   := StringReplace(Estoques, '<BR/>', ',"Lista":', [rfReplaceAll]);
//    Estoques   := StringReplace(Estoques, 'TotalProdutos', '"TotalProdutos"', [rfReplaceAll]);
//    Estoques   := '{' + Estoques + '}';
    Lista := TlkJSON.ParseText(Estoques) as TlkJSONList;
//    CampoChave := 'Lista';

  //  if not Assigned(Json.Field[CampoChave]) then
  //  raise Exception.Create(Format('Erro ao integrar os estoques. Campo %s não encontrado.', [CampoChave]));

 //   Lista := Json.Field[CampoChave] as TlkJSONlist;
    for I := 0 to Lista.Count -1 do
    begin
      Aviso.Exibir(Format('Integração de Produtos %d%% concluídos.', [Trunc((I * 100) / Lista.Count)]));
      Json := Lista.Child[I] as TlkJSONobject;
      dmDados.Integrar_Estoque(Json, IdEmitente);
//      Estoques := Json.Field['codigo'].Value;
    end;
  finally
    FreeAndNil(Aviso);
  end;
end;

function TControllerWebServiceEstoque.Montar_URL: String;
begin
  Result := Format('%s/envia_estoque/index.php?cnpj=%s&token=%s', [URL_BASE, Pegar_CNPJ_Emitente(), Pegar_ApiToken_Emitente()]);
end;

function TControllerWebServiceEstoque.Pegar_Parametro_Body: String;
begin
  Result := '';
end;

{function TControllerWebServiceEstoque.Pegar_Servico: String;
begin
  Result := 'envia_estoque';
end;}

end.
