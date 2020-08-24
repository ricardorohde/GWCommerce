unit UEstoque;

interface
  uses
    Classes, System.SysUtils,

    pcnConversao,

    UModelBase;

type
  TLancamentoPorPeso = record
    LancouPorPeso: Boolean;

    Peso: Double;

    CodigoProduto,
    Verificador: Int64;

    Busca: String;

    procedure Copiar_Valores(APeso: TLancamentoPorPeso);
    procedure Inicializar;
    procedure Tratar_Lancamento(ABusca: String);
  end;

  TEstoque = class
  private
    FComissao,
    FCustoCompra,
    FCustoMedio,
    FDescontoMaximo,
    FGLP,
    FGNN,
    FIBPTEST,
    FIBPTF,
    FIBPTFI,
    FIBPTMun,
    FIPI,
    FMargemLucro,
    FMVA,
    FPGNI,
    FPorCofins,
    FPorCofinsEnt,
    FPorcPis,
    FPorPisEnt,
    FPrecoVenda,
    FQtdAtual,
    FQtdCompra,
    FQtdInicio,
    FQtdMinima,
    FVPart: Double;

    FCodigo,
    FCodigoProduto,
    FFornecedor,
    FGrupo,
    FMarca,
    FRegistroEmit: Int64;

    FCEST,
    FCFOP,
    FCFOPNfce,
    FCodAnvisa,
    FCodBeneficio,
    FCodENQIPI,
    FCodigoBarras,
    FCodCofins,
    FCodPis,
    FCodSeloIPI,
    FCNPJFab,
    FCProdAnp,
    FCSOSN,
    FCSTIPI,
    FDescAnp,
    FDescricao,
    FFoto,
    FIAT,
    FIndEscala,
    FIPPT,
    FLocal,
    FMedida,
    FNCM,
    FOrigem,
    FPisCofinsEnt,
    FST,
    FTipoItem,
    FValidade: String;

    FDataInicio,
    FUltCompra,
    FUltVenda: TDate;

    FLancamentoPorPeso: TLancamentoPorPeso;

  public
    constructor Create();

    function Pegar_Codigo_Cofins(): TpcnCstCofins;
    function Pegar_Codigo_PIS(): TpcnCstPis;
    function Pegar_CST_ICMS_Simples_Nacional(): TpcnCSOSNIcms;

    property CEST: String read FCEST write FCEST;
    property CodAnvisa: String read FCodAnvisa write FCodAnvisa;
    property CodBeneficio: String read FCodBeneficio write FCodBeneficio;
    property CodENQIPI: String read FCodENQIPI write FCodENQIPI;
    property CodCofins: String read FCodCofins write FCodCofins;
    property Codigo: Int64 read FCodigo write FCodigo;
    property CodigoBarras: String read FCodigoBarras write FCodigoBarras;
    property CodigoProduto: Int64 read FCodigoProduto write FCodigoProduto;
    property CodSeloIPI: String read FCodSeloIPI write FCodSeloIPI;
    property CFOP: String read FCFOP write FCFOP;
    property CFOPNfce: String read FCFOPNfce write FCFOPNfce;
    property CNPJFab: String read FCNPJFab write FCNPJFab;
    property CodPis: String read FCodPis write FCodPis;
    property Comissao: Double read FComissao write FComissao;
    property CProdAnp: String read FCProdAnp write FCProdAnp;
    property CSOSN: String read FCSOSN write FCSOSN;
    property CSTIPI: String read FCSTIPI write FCSTIPI;
    property CustoCompra: Double read FCustoCompra write FCustoCompra;
    property CustoMedio: Double read FCustoMedio write FCustoMedio;
    property DataInicio: TDate read FDataInicio write FDataInicio;
    property DescAnp: String read FDescAnp write FDescAnp;
    property DescontoMaximo: Double read FDescontoMaximo write FDescontoMaximo;
    property Descricao: String read FDescricao write FDescricao;
    property Fornecedor: Int64 read FFornecedor write FFornecedor;
    property Foto: String read FFoto write FFoto;
    property Grupo: Int64 read FGrupo write FGrupo;
    property IAT: String read FIAT write FIAT;
    property IBPTEST: Double read FIBPTEST write FIBPTEST;
    property IBPTF: Double read FIBPTF write FIBPTF;
    property IBPTFI: Double read FIBPTFI write FIBPTFI;
    property IBPTMun: Double read FIBPTMun write FIBPTMun;
    property IndEscala: String read FIndEscala write FIndEscala;
    property IPI: Double read FIPI write FIPI;
    property IPPT: String read FIPPT write FIPPT;
    property LancamentoPorPeso: TLancamentoPorPeso read FLancamentoPorPeso;
    property Local: String read FLocal write FLocal;
    property Marca: Int64 read FMarca write FMarca;
    property MargemLucro: Double read FMargemLucro write FMargemLucro;
    property Medida: String read FMedida write FMedida;
    property MVA: Double read FMVA write FMVA;
    property NCM: String read FNCM write FNCM;
    property Origem: String read FOrigem write FOrigem;
    property PGLP: Double read FGLP write FGLP;
    property PGNI: Double read FPGNI write FPGNI;
    property PGNN: Double read FGNN write FGNN;
    property PisCofinsEnt: String read FPisCofinsEnt write FPisCofinsEnt;
    property PorCofins: Double read FPorCofins write FPorCofins;
    property PorCofinsEnt: Double read FPorCofinsEnt write FPorCofinsEnt;
    property PorPisEnt: Double read FPorPisEnt write FPorPisEnt;
    property PorcPis: Double read FPorcPis write FPorcPis;
    property PrecoVenda: Double read FPrecoVenda write FPrecoVenda;
    property QtdAtual: Double read FQtdAtual write FQtdAtual;
    property QtdCompra: Double read FQtdCompra write FQtdCompra;
    property QtdInicio: Double read FQtdInicio write FQtdInicio;
    property QtdMinima: Double read FQtdMinima write FQtdMinima;
    property RegistroEmit: Int64 read FRegistroEmit write FRegistroEmit;
    property ST: String read FST write FST;
    property TipoItem: String read FTipoItem write FTipoItem;
    property UltCompra: TDate read FUltCompra write FUltCompra;
    property UltVenda: TDate read FUltVenda write FUltVenda;
    property Validade: String read FValidade write FValidade;
    property VPart: Double read FVPart write FVPart;

  end;

implementation

{ TEstoque }

constructor TEstoque.Create;
begin
  Comissao      := 0;
  CustoCompra   := 0;
  CustoMedio    := 0;
  DescontoMaximo:= 0;
  PGLP          := 0;
  PGNN          := 0;
  IBPTEST       := 0;
  IBPTF         := 0;
  IBPTFI        := 0;
  IBPTMun       := 0;
  IPI           := 0;
  MargemLucro   := 0;
  MVA           := 0;
  PGNI          := 0;
  PorCofins     := 0;
  PorCofinsEnt  := 0;
  PorcPis       := 0;
  PorPisEnt     := 0;
  PrecoVenda    := 0;
  QtdAtual      := 0;
  QtdCompra     := 0;
  QtdInicio     := 0;
  QtdMinima     := 0;
  VPart         := 0;
  Codigo        := 0;
  CodigoProduto := 0;
  Fornecedor    := 0;
  Grupo         := 0;
  Marca         := 0;
  RegistroEmit  := 0;
  CEST          := '';
  CFOP          := '';
  CFOPNfce      := '';
  CodAnvisa     := '';
  CodBeneficio  := '';
  CodENQIPI     := '';
  CodigoBarras  := '';
  CodCofins     := '';
  CodPis        := '';
  CodSeloIPI    := '';
  CNPJFab       := '';
  CProdAnp      := '';
  CSOSN         := '';
  CSTIPI        := '';
  DescAnp       := '';
  Descricao     := '';
  Foto          := '';
  IAT           := '';
  IndEscala     := '';
  IPPT          := '';
  Local         := '';
  Medida        := '';
  NCM           := '';
  Origem        := '';
  PisCofinsEnt  := '';
  ST            := '';
  TipoItem      := '';
  Validade      := '';
end;

function TEstoque.Pegar_Codigo_Cofins: TpcnCstCofins;
begin
  FCodCofins := Trim(FCodCofins);

  if FCodCofins = '01' then
    Result := cof01
  else if FCodCofins = '02' then
    Result := cof02
  else if FCodCofins = '03' then
    Result := cof03
  else if FCodCofins = '04' then
    Result := cof04
  else if FCodCofins = '05' then
    Result := cof05
  else if FCodCofins = '06' then
    Result := cof06
  else if FCodCofins = '07' then
    Result := cof07
  else if FCodCofins = '08' then
    Result := cof08
  else if FCodCofins = '49' then
    Result := cof49
  else if FCodCofins = '99' then
    Result := cof99
  else
    raise Exception.Create('Código Cofins não definido.');
end;

function TEstoque.Pegar_Codigo_PIS: TpcnCstPis;
begin
  FCodPis := Trim(FCodPis);

  if FCodPis = '01' then
    Result := pis01
  else if FCodPis = '02' then
    Result := pis02
  else if FCodPis = '03' then
    Result := pis03
  else if FCodPis = '04' then
    Result := pis04
  else if FCodPis = '05' then
    Result := pis05
  else if FCodPis = '06' then
    Result := pis06
  else if FCodPis = '07' then
    Result := pis07
  else if FCodPis = '08' then
    Result := pis08
  else if FCodPis = '49' then
    Result := pis49
  else if FCodPis = '99' then
    Result := pis99
  else
    raise Exception.Create('Código Pis não definido.');
end;

function TEstoque.Pegar_CST_ICMS_Simples_Nacional: TpcnCSOSNIcms;
begin
  if (Trim(FCSOSN) = '102') or (Trim(FCSOSN) = '') then
    Result := csosn102
  else if Trim(FCSOSN) = '500' then
    Result := csosn500
  else
    Result := csosn900;
end;

{ TLancamentoPorPeso }

procedure TLancamentoPorPeso.Copiar_Valores(APeso: TLancamentoPorPeso);
begin
  CodigoProduto := APeso.CodigoProduto;
  Busca         := APeso.Busca;
  Verificador   := APeso.Verificador;
  Peso          := APeso.Peso / 1000;
  LancouPorPeso := APeso.LancouPorPeso;
end;

procedure TLancamentoPorPeso.Inicializar;
begin
  LancouPorPeso := False;
  Peso          := 0;
  CodigoProduto := -1;
  Busca         := '';
  Verificador   := -1;
end;

procedure TLancamentoPorPeso.Tratar_Lancamento(ABusca: String);
var
  Indicador1,
  Indicador2: Integer;

  Valor: Double;

begin
  if Length(Trim(ABusca)) = 13 then
    if TryStrToFloat(ABusca, Valor) then
    begin
      Indicador1    := StrToInt64(Copy(ABusca, 1, 1));
      Indicador2    := StrToInt64(Copy(ABusca, 2, 1));
      CodigoProduto := StrToInt64(Copy(ABusca, 3, 5));
      Peso          := StrToFloat(Copy(ABusca, 8, 5));
      Verificador   := StrToInt64(Copy(ABusca, 13, 1));
      LancouPorPeso := (Indicador1 = 2) and (Indicador2 = 0);
    end;
end;

end.
