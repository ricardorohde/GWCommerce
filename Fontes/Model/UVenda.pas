unit UVenda;

interface
   uses
     ACBrUtil, ACBrEAD,

     System.SysUtils, System.Classes,

     UDesconto;

type
  TVenda = class(TPersistent)
  private
    FQuantidade,
    FValorUnitario: Double;

    FCodigo,
    FCodigoProduto,
    FCodigoProdutoExibicao: Int64;
    FOrdem,
    FRegistroEmitente: Int64;

    FMD5,
    FMedida,
    FDescricaoProduto: String;

    FDataHora: TDateTime;

    FDesconto: TDesconto;

    function GetValorBruto: Double;
//    function GetMD5: String;

  public
    constructor Create(); overload;
    constructor Create(ACodigo: Int64); overload;

    destructor Destroy(); override;

    function Gerar_MD5(): String;

    procedure Filtrar_No_Banco(AFiltro: String);

  published
    property Codigo: Int64 read FCodigo write FCodigo;
    property CodigoProduto: Int64 read FCodigoProduto write FCodigoProduto;
    property CodigoProdutoExibicao: Int64 read FCodigoProdutoExibicao write FCodigoProdutoExibicao;
    property DataHora: TDateTime read FDataHora write FDataHora;
    property Desconto: TDesconto read FDesconto write FDesconto;
    property DescricaoProduto: String read FDescricaoProduto write FDescricaoProduto;
    property MD5: String read FMD5 write FMD5;
    property Medida: String read FMedida write FMedida;
    property Ordem: Int64 read FOrdem write FOrdem;
    property Quantidade: Double read FQuantidade write FQuantidade;
    property RegistroEmitente: Int64 read FRegistroEmitente write FRegistroEmitente;
    property ValorBruto: Double read GetValorBruto;
    property ValorUnitario: Double read FValorUnitario write FValorUnitario;

  end;

implementation
  Uses
    UModelBase;

{ TVenda }

constructor TVenda.Create;
begin
  Desconto              := TDesconto.Create();
  Quantidade            := 0;
  ValorUnitario         := 0;
  Codigo                := 0;
  CodigoProduto         := 0;
  CodigoProdutoExibicao := 0;
  MD5                   := '';
  Medida                := '';
  Ordem                 := 0;
  DescricaoProduto      := '';
  DataHora              := Now();
  RegistroEmitente      := -1;
end;

constructor TVenda.Create(ACodigo: Int64);
begin
  Create();
  Filtrar_No_Banco(Format('CODIGO = %d', [ACodigo]));

  if dmDados.cliVenda.RecordCount > 0 then
  begin
    Desconto.Valor        := dmDados.cliVendaDESCONTO.AsFloat;
    Quantidade            := dmDados.cliVendaQUANTIDADE.AsFloat;
    ValorUnitario         := dmDados.cliVendaVALOR_UNITARIO.AsFloat;
    Codigo                := dmDados.cliVendaCODIGO.AsLargeInt;
    CodigoProduto         := dmDados.cliVendaCODIGO_PRODUTO.AsLargeInt;
    Medida                := dmDados.cliVendaMEDIDA.AsString;
    Ordem                 := 0;
    DescricaoProduto      := dmDados.cliVendaDESCRICAO_PRODUTO.AsString;
    DataHora              := dmDados.cliVendaDATA_HORA_VENDA.AsDateTime;
    RegistroEmitente      := dmDados.cliVendaREGISTRO_EMITENTE.AsLargeInt;
    CodigoProdutoExibicao := dmDados.cliVendaCODIGO_PRODUTO_EXIBICAO.AsLargeInt;
    FMD5                  := dmDados.cliVendaMD5.AsString;
  end;

  dmDados.cliVenda.Filtered := False;
end;

destructor TVenda.Destroy;
begin
  FDesconto.Free();
end;

procedure TVenda.Filtrar_No_Banco(AFiltro: String);
begin
  dmDados.cliVenda.Filter   := AFiltro;
  dmDados.cliVenda.Filtered := True;
end;

{function TVenda.GetMD5: String;
var
  Gerador: TACBrEAD;

begin
  Gerador := TACBrEAD.Create(nil);
  try
    Result := String( Gerador.CalcularHash(
      AnsiString(Format('%d|%d|%s', [FCodigoProduto, FRegistroEmitente,
        FormatDateTime('dd/MM/yyyy hh:MM:ss.zzz', FDataHora)])), dgstMD5));
  finally
    Gerador.Free();
  end;
end;}

function TVenda.Gerar_MD5: String;
var
  Gerador: TACBrEAD;

begin
  Gerador := TACBrEAD.Create(nil);
  try
    Result := String( Gerador.CalcularHash(
      AnsiString(Format('%d|%d|%s', [FCodigoProduto, FRegistroEmitente,
        FormatDateTime('dd/MM/yyyy hh:MM:ss.zzz', FDataHora)])), dgstMD5));
  finally
    Gerador.Free();
  end;
end;

function TVenda.GetValorBruto: Double;
begin
  Result := RoundABNT(FQuantidade * FValorUnitario, -2);
end;

initialization
  System.Classes.RegisterClass(TVenda);

finalization
  System.Classes.UnRegisterClass(TVenda);

end.
