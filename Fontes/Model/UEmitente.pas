unit UEmitente;

interface
uses
  System.SysUtils,

  pcnConversao;

type
  TEmitente = class
  private
    FNFCeSerie,
    FNFCeUltimaNota,
    FRegistro: Int64;

    FApiToken,
    FBairro,
    FCDCidade,
    FCDEstado,
    FCDPais,
    FCEP,
    FCertificadoSenha,
    FCertificadoSerie,
    FCNAE,
    FCNPJ,
    FContato,
    FCPF,
    FCRT,
    FEmail,
    FEndereco,
    FEstado,
    FIE,
    FIMunicipal,
    FLogoMarcaEmitente,
    FMunicipio,
    FNFCeTokenCSC,
    FNFCeTokenCSCId,
    FNome,
    FNomeFantasia,
    FNumero,
    FPais,
    FTelefone: String;

    FAmbiente: TpcnTipoAmbiente;

  public
    constructor Create();

    function Pegar_Regime_Emissao(): TpcnCRT;
    function Verificar_Se_Simples_Nacional(): Boolean;

    property Ambiente: TpcnTipoAmbiente read FAmbiente write FAmbiente;
    property ApiToken: String read FApiToken write FApiToken;
    property Bairro: String read FBairro write FBairro;
    property CDCidade: String read FCDCidade write FCDCidade;
    property CDEstado: String read FCDEstado write FCDEstado;
    property CDPais: String read FCDPais write FCDPais;
    property CEP: String read FCEP write FCEP;
    property CertificadoSenha: String read FCertificadoSenha write FCertificadoSenha;
    property CertificadoSerie: String read FCertificadoSerie write FCertificadoSerie;
    property CNAE: String read FCNAE write FCNAE;
    property CNPJ: String read FCNPJ write FCNPJ;
    property CPF: String read FCPF write FCPF;
    property CRT: String read FCRT write FCRT;
    property Contato: String read FContato write FContato;
    property Email: String read FEmail write FEmail;
    property Endereco: String read FEndereco write FEndereco;
    property Estado: String read FEstado write FEstado;
    property IE: String read FIE write FIE;
    property IMunicipal: String read FIMunicipal write FIMunicipal;
    property LogoMarcaEmitente: String read FLogoMarcaEmitente write FLogoMarcaEmitente;
    property Municipio: String read FMunicipio write FMunicipio;
    property NFCeSerie: Int64 read FNFCeSerie write FNFCeSerie;
    property NFCeTokenCSC: String read FNFCeTokenCSC write FNFCeTokenCSC;
    property NFCeTokenCSCId: String read FNFCeTokenCSCId write FNFCeTokenCSCId;
    property NFCeUltimaNota: Int64 read FNFCeUltimaNota write FNFCeUltimaNota;
    property Nome: String read FNome write FNome;
    property NomeFantasia: String read FNomeFantasia write FNomeFantasia;
    property Numero: String read FNumero write FNumero;
    property Pais: String read FPais write FPais;
    property Registro: Int64 read FRegistro write FRegistro;
    property Telefone: String read FTelefone write FTelefone;
//    property TokenIdNFCe: String read FTokenIdNFCe write FTokenIdNFCe;
//    property TokenNFCe: String read FTokenNFCe write FTokenNFCe;

  end;

implementation

{ TEmitente }

constructor TEmitente.Create;
begin
  Ambiente          := taProducao;
  ApiToken          := '';
  Registro          := -1;
  Bairro            := '';
  CDCidade          := '';
  CDEstado          := '';
  CDPais            := '';
  CertificadoSerie  := '';
  CertificadoSenha  := '';
  CEP               := '';
  CNAE              := '';
  CNPJ              := '';
  Contato           := '';
  CPF               := '';
  CRT               := '';
  Email             := '';
  Endereco          := '';
  Estado            := '';
  IE                := '';
  IMunicipal        := '';
  LogoMarcaEmitente := '';
  Municipio         := '';
  NFCeSerie         := -1;
  NFCeUltimaNota    := -1;
  Nome              := '';
  NomeFantasia      := '';
  Numero            := '';
  Pais              := '';
  Telefone          := '';
  NFCeTokenCSC      := '';
  NFCeTokenCSCId    := '';
end;

function TEmitente.Pegar_Regime_Emissao: TpcnCRT;
begin
  if Verificar_Se_Simples_Nacional() then
    Result := crtSimplesNacional
  else if Trim(FCRT) = '2' then
    Result := crtSimplesExcessoReceita
  else
    Result := crtRegimeNormal;
end;

function TEmitente.Verificar_Se_Simples_Nacional: Boolean;
begin
  Result := Trim(FCRT) = '1';
end;

end.
