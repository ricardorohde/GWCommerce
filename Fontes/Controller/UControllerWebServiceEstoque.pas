unit UControllerWebServiceEstoque;

interface
uses
  System.SysUtils, System.Classes, Vcl.Dialogs, System.UITypes,

  uLkJSON, UViewAviso,

  UControllerWebService, UModelBase, UControllerArquivos;

type
  TControllerWebServiceEstoque = class(TControllerWebService)
    protected
      function Montar_URL(): String; override;
      function Pegar_Parametro_Body(): String; override;

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
  IdProduto: Int64;

  I: Integer;

  Estoques: String;

  Log: TControllerArquivos;

  Json: TlkJSONobject;

  Lista: TlkJSONlist;

  Aviso: TViewAviso;

begin
  Aviso := TViewAviso.Create(nil);
  Log   := TControllerArquivos.Create();
  try
    IdProduto := 0;
    try
      Aviso.Exibir('Iniciando Integração de Produtos.');
      Estoques := Executar();

      if Pos('SEM PRODUTO', UpperCase(Estoques)) > 0 then
        raise Exception.Create('Nenhum produto encontrado.');

      dmDados.Apagar_Estoque_Antes_Integrar(IdEmitente);
      dmDados.Abrir_Tabela_Estoque(IdEmitente);
      Lista := TlkJSON.ParseText(Estoques) as TlkJSONList;

      for I := 0 to Lista.Count -1 do
      begin
        Aviso.Exibir(Format('Integração de Produtos %d%% concluídos.', [Trunc((I * 100) / Lista.Count)]));

        IdProduto := 0;
        Json      := Lista.Child[I] as TlkJSONobject;
        IdProduto := Json.Field['codigo_produto'].Value;
        Log.Gerar_Log(Format('Integrando Estoque com codigo_produto = %d', [IdProduto]));
        dmDados.Integrar_Estoque(Json, IdEmitente);
      end;
    except on E: Exception do
      MessageDlg(Format('Erro ao integrar os estoques: %s.'#13#10 + 'Código do produto: %d', [E.Message, IdProduto]), mtError, [mbOK], 0);
    end;
  finally
    FreeAndNil(Aviso);
    Log.Free();
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

end.
