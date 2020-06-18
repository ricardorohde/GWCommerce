unit UViewSelecaoCertificado;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.ExtCtrls,

  UViewBase, Data.DB, Datasnap.DBClient, Vcl.Grids, Vcl.DBGrids, ACBrBase,
  ACBrDFe, ACBrNFe, ACBrUtil, blcksock, ACBrDFeSSL;

type
  TViewSelecaoCertificado = class(TViewBase)
    pnl1: TPanel;
    pnl2: TPanel;
    pnlConfirmar: TPanel;
    pnlFechar: TPanel;
    btnFechar: TSpeedButton;
    btnConfirmar: TSpeedButton;
    cliCertificados: TClientDataSet;
    cliCertificadosSERIE: TStringField;
    cliCertificadosRAZAO_SOCIAL: TStringField;
    cliCertificadosCNPJ: TStringField;
    cliCertificadosDATA_VENCIMENTO: TStringField;
    cliCertificadosCERTIFICADORA: TStringField;
    grid1: TDBGrid;
    dsCertificados: TDataSource;
    ACBrNFe1: TACBrNFe;
    pnl3: TPanel;
    pnl4: TPanel;
    pnl5: TPanel;
    pnl6: TPanel;
    pnl7: TPanel;
    pnl8: TPanel;
    pnl9: TPanel;
    pnl10: TPanel;
    procedure btnFecharClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure grid1DrawColumnCell(Sender: TObject; const [Ref] Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);

  private
    FNumeroSerie: String;

    procedure Carregar_Certificados();

  public
    { Public declarations }
      procedure Exibir();

      property NumeroSerie: String read FNumeroSerie;
  end;

var
  ViewSelecaoCertificado: TViewSelecaoCertificado;

implementation

{$R *.dfm}

{ TViewSelecaoCertificado }

procedure TViewSelecaoCertificado.btnConfirmarClick(Sender: TObject);
begin
  inherited;
  if cliCertificados.RecordCount > 0 then
  begin
    FNumeroSerie := cliCertificadosSERIE.AsString;
    Close();
  end;
end;

procedure TViewSelecaoCertificado.btnFecharClick(Sender: TObject);
begin
  FNumeroSerie := '';
  Close();
end;

procedure TViewSelecaoCertificado.Carregar_Certificados;
var
  I: Integer;

begin
  cliCertificados.First();
  while not cliCertificados.Eof do
    cliCertificados.Delete();

  ACBrNFe1.SSL.LerCertificadosStore;

  for I := 0 to ACBrNFe1.SSL.ListaCertificados.Count-1 do
  begin
    if Trim(ACBrNFe1.SSL.ListaCertificados[I].CNPJ) <> '' then
    begin
      cliCertificados.Insert();
      cliCertificadosSERIE.AsString           := ACBrNFe1.SSL.ListaCertificados[I].NumeroSerie;
      cliCertificadosRAZAO_SOCIAL.AsString    := ACBrNFe1.SSL.ListaCertificados[I].RazaoSocial;
      cliCertificadosCNPJ.AsString            := ACBrNFe1.SSL.ListaCertificados[I].CNPJ;
      cliCertificadosDATA_VENCIMENTO.AsString := FormatDateTimeBr(ACBrNFe1.SSL.ListaCertificados[I].DataVenc);
      cliCertificadosCERTIFICADORA.AsString   := ACBrNFe1.SSL.ListaCertificados[I].Certificadora;
      cliCertificados.Post();
    end;
  end;

{  frmSelecionarCertificado.ShowModal;

  if frmSelecionarCertificado.ModalResult = mrOK then
    edtNumSerie.Text := frmSelecionarCertificado.StringGrid1.Cells[0, frmSelecionarCertificado.StringGrid1.Row];}
end;

procedure TViewSelecaoCertificado.Exibir;
begin
  FNumeroSerie := '';
  Definir_Titulo_Tela('(Certificado digital)');
  Arredondar_Controle(pnlFechar);
  Arredondar_Controle(pnlConfirmar);

  ACBrNFe1.Configuracoes.WebServices.SSLType := LT_TLSv1_2;
  ACBrNFe1.Configuracoes.Geral.SSLCryptLib   := cryWinCrypt;
  ACBrNFe1.Configuracoes.Geral.SSLHttpLib    := httpWinINet;
  ACBrNFe1.Configuracoes.Geral.SSLLib        := libWinCrypt;
  ACBrNFe1.Configuracoes.Geral.SSLXmlSignLib := xsMsXml;

  Carregar_Certificados();

  ShowModal();
end;

procedure TViewSelecaoCertificado.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    Close();
end;

procedure TViewSelecaoCertificado.grid1DrawColumnCell(Sender: TObject;
  const [Ref] Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  Colorir_DBGrid(Sender, Rect, DataCol,Column, State);
end;

end.
