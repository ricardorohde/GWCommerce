unit UViewEmitente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.UITypes,

  UViewBase, Vcl.Buttons, Vcl.ExtCtrls, Vcl.StdCtrls, UViewSelecaoCertificado,

  pcnConversao, ACBrValidador;

type
  TViewEmitente = class(TViewBase)
    pnlIdentificacao: TPanel;
    grp1: TGroupBox;
    pnlContato: TPanel;
    grp2: TGroupBox;
    lbl1: TLabel;
    edtNomeRazaoSocial: TEdit;
    lbl2: TLabel;
    edtApelidoFantasia: TEdit;
    pnlEndereco: TPanel;
    grp3: TGroupBox;
    lbl3: TLabel;
    edtContato: TEdit;
    lbl4: TLabel;
    edtTelefone: TEdit;
    lbl5: TLabel;
    edtEmail: TEdit;
    lbl6: TLabel;
    edtEndereco: TEdit;
    lbl7: TLabel;
    edtBairro: TEdit;
    lbl8: TLabel;
    edtMunicipio: TEdit;
    lbl9: TLabel;
    edtCodigoCidade: TEdit;
    lbl10: TLabel;
    edtNumero: TEdit;
    lbl11: TLabel;
    edtCep: TEdit;
    lbl12: TLabel;
    edtCodigoEstado: TEdit;
    lbl13: TLabel;
    edtEstado: TEdit;
    pnlDocumentos: TPanel;
    grp4: TGroupBox;
    lbl14: TLabel;
    edtCNPJ: TEdit;
    lbl15: TLabel;
    edtCPF: TEdit;
    lbl16: TLabel;
    edtInscricaoEstadual: TEdit;
    lbl17: TLabel;
    edtInscricaoMunicipal: TEdit;
    lbl18: TLabel;
    edtCNAE: TEdit;
    pnlConfiguracoes: TPanel;
    grp5: TGroupBox;
    grp6: TGroupBox;
    lbl19: TLabel;
    edtNFCeSerie: TEdit;
    lbl20: TLabel;
    edtNFCeUltimaEmissao: TEdit;
    grp7: TGroupBox;
    grp8: TGroupBox;
    lbl21: TLabel;
    edtCSCId: TEdit;
    lbl22: TLabel;
    edtCSCToken: TEdit;
    lbl23: TLabel;
    edtApiToken: TEdit;
    pnlBotoes: TPanel;
    pnlConfirmar: TPanel;
    btnConfirmar: TSpeedButton;
    pnlCancelar: TPanel;
    btnCancelar: TSpeedButton;
    lbl25: TLabel;
    edtCertificadoSerie: TEdit;
    lbl26: TLabel;
    edtCertificadoSenha: TEdit;
    rgNFCeAmbiente: TRadioGroup;
    btnSelecionarCertificado: TSpeedButton;
    lbl24: TLabel;
    edtCodigo: TEdit;
    pnl1: TPanel;
    pnl2: TPanel;
    pnl3: TPanel;
    pnl4: TPanel;
    pnl5: TPanel;
    pnl6: TPanel;
    pnl7: TPanel;
    pnl8: TPanel;
    pnl9: TPanel;
    pnl10: TPanel;
    pnl11: TPanel;
    pnl12: TPanel;
    pnl13: TPanel;
    pnl14: TPanel;
    procedure btnConfirmarClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure edtApiSenhaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnSelecionarCertificadoClick(Sender: TObject);
  private
    { Private declarations }
//    FIdRegistroEmitente: Int64;
    procedure Exibir_Dados_Configuracao();
    procedure Exibir_Dados_Emitente();
    procedure Salvar_Dados_Configuracao(AEmitente: Int64);
    procedure Salvar_Dados_Emitente();

  public
    { Public declarations }
    procedure Exibir(AIdRegistroEmitente: Int64);
  end;

implementation
uses
  UModelBase;

{$R *.dfm}

{ TViewEmitente }

procedure TViewEmitente.btnCancelarClick(Sender: TObject);
begin
  Close();
end;

procedure TViewEmitente.btnConfirmarClick(Sender: TObject);
var
  I,
  J,
  K,
  L: Integer;

  MensagemErro: String;

  Edit: TEdit;

  GroupBoxInterno,
  GroupBoxPrincipal: TGroupBox;

  Panel: TPanel;

procedure Validar_Edit(AEdit: TEdit);
begin
  if (AEdit.Tag = 1) and (Trim(AEdit.Text) = '') then
  begin
    AEdit.SetFocus();
    raise Exception.Create(Format('%s não foi informado.', [AEdit.Hint]));
  end;
end;

begin
  try
    for I := 0 to ControlCount -1 do
      if Controls[I] is TPanel then
      begin
        Panel := TPanel(Controls[I]);

        for J := 0 to Panel.ControlCount -1 do
          if Panel.Controls[J] is TGroupBox then
          begin
            GroupBoxPrincipal := TGroupBox(Panel.Controls[J]);

            for K := 0 to GroupBoxPrincipal.ControlCount -1 do
              if GroupBoxPrincipal.Controls[K] is TEdit then
              begin
                Edit := TEdit(GroupBoxPrincipal.Controls[K]);
                Validar_Edit(Edit);
              end
              else if GroupBoxPrincipal.Controls[K] is TGroupBox then
              begin
                GroupBoxInterno := TGroupBox(GroupBoxPrincipal.Controls[K]);
                for L := 0 to GroupBoxInterno.ControlCount -1 do
                  if GroupBoxInterno.Controls[L] is TEdit then
                  begin
                    Edit := TEdit(GroupBoxInterno.Controls[L]);
                    Validar_Edit(Edit);
                  end;
              end;
          end;
      end;

    MensagemErro := ValidarCNPJ(edtCNPJ.Text);

    if MensagemErro <> '' then
      raise Exception.Create(MensagemErro);

    MensagemErro := ValidarCPF(edtCPF.Text);

    if MensagemErro <> '' then
      raise Exception.Create(MensagemErro);

    if StrToInt64(edtCodigo.Text) <= 0 then
      raise Exception.Create('O Código do Emitente não pode ser menor ou igual a zero');      

    Salvar_Dados_Emitente();
    Close();
  except on E: Exception do
    MessageDlg(Format('Erro: %s', [E.Message]), mtError, [mbOK], 0);
  end;
end;

procedure TViewEmitente.btnSelecionarCertificadoClick(Sender: TObject);
var
  View: TViewSelecaoCertificado;

begin
  View := TViewSelecaoCertificado.Create(nil);
  try
    View.Exibir();

    if Trim(View.NumeroSerie) <> '' then
      edtCertificadoSerie.Text := View.NumeroSerie;
  finally
    FreeAndNil(View);
  end;
end;

procedure TViewEmitente.edtApiSenhaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    btnConfirmarClick(Sender);
end;

procedure TViewEmitente.Exibir(AIdRegistroEmitente: Int64);
begin
  //FIdRegistroEmitente := AIdRegistroEmitente;
  Arredondar_Controle(pnlConfirmar);
  Arredondar_Controle(pnlCancelar);
  Definir_Titulo_Tela('(Cadastro de Emitente)');

  dmDados.Abrir_Tabela_Configuracao();

  dmDados.cliEmitente.Filter   := Format('REGISTRO = %d', [AIdRegistroEmitente]);
  dmDados.cliEmitente.Filtered := True;

  dmDados.Filtrar_Configuracao(AIdRegistroEmitente);

  Exibir_Dados_Emitente();
  Exibir_Dados_Configuracao();

  ShowModal();
end;

procedure TViewEmitente.Exibir_Dados_Configuracao;
begin
  edtNFCeSerie.Text         := dmDados.cliConfiguracaoNFCE_SERIE.AsString;
  edtNFCeUltimaEmissao.Text := dmDados.cliConfiguracaoNFCE_NUMERO_EMITIDO.AsString;
  edtCSCId.Text             := dmDados.cliConfiguracaoNFCE_TOKEN_ID.AsString;
  edtCSCToken.Text          := dmDados.cliConfiguracaoNFCE_TOKEN_CSC.AsString;
  edtApiToken.Text          := dmDados.cliConfiguracaoAPI_CONEXAO_TOKEN.AsString;
  edtCertificadoSerie.Text  := dmDados.cliConfiguracaoCERTIFICADO_SERIE.AsString;
  edtCertificadoSenha.Text  := dmDados.cliConfiguracaoCERTIFICADO_SENHA.AsString;

  if dmDados.cliConfiguracaoNFCE_AMBIENTE_EMISSAO.IsNull then
    rgNFCeAmbiente.ItemIndex := 0
  else
    rgNFCeAmbiente.ItemIndex := dmDados.cliConfiguracaoNFCE_AMBIENTE_EMISSAO.AsLargeInt;
end;

procedure TViewEmitente.Exibir_Dados_Emitente;
begin
  edtCodigo.Text            := dmDados.cliEmitenteREGISTRO.AsString;
  edtNomeRazaoSocial.Text   := dmDados.cliEmitenteNOME.AsString;
  edtApelidoFantasia.Text   := dmDados.cliEmitenteNOME_FANTASIA.AsString;
  edtCNAE.Text              := dmDados.cliEmitenteCNAE.AsString;
  edtContato.Text           := dmDados.cliEmitenteCONTATO.AsString;
  edtTelefone.Text          := dmDados.cliEmitenteTELEFONE.AsString;
  edtEmail.Text             := dmDados.cliEmitenteEMAIL.AsString;
  edtEndereco.Text          := dmDados.cliEmitenteENDERECO.AsString;
  edtNumero.Text            := dmDados.cliEmitenteNUMERO.AsString;
  edtBairro.Text            := dmDados.cliEmitenteBAIRRO.AsString;
  edtMunicipio.Text         := dmDados.cliEmitenteMUNICIPIO.AsString;
  edtCodigoCidade.Text      := dmDados.cliEmitenteCD_CIDADE.AsString;
  edtCep.Text               := dmDados.cliEmitenteCEP.AsString;
  edtCodigoEstado.Text      := dmDados.cliEmitenteCD_ESTADO.AsString;
  edtEstado.Text            := dmDados.cliEmitenteESTADO.AsString;
  edtCNPJ.Text              := dmDados.cliEmitenteCNPJ.AsString;
  edtCPF.Text               := dmDados.cliEmitenteCPF.AsString;
  edtInscricaoEstadual.Text := dmDados.cliEmitenteIE.AsString;
  edtInscricaoMunicipal.Text:= dmDados.cliEmitenteIMUNICIPAL.AsString;
end;

procedure TViewEmitente.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  dmDados.cliEmitente.Filter   := '';
  dmDados.cliEmitente.Filtered := False;

  dmDados.cliConfiguracao.Filter   := '';
  dmDados.cliConfiguracao.Filtered := False;
end;

procedure TViewEmitente.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    Key := #0;
    Perform(WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TViewEmitente.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    Close();
end;

procedure TViewEmitente.Salvar_Dados_Configuracao(AEmitente: Int64);
begin
  if dmDados.cliConfiguracao.RecordCount = 0 then
    dmDados.cliConfiguracao.Insert()
  else
    dmDados.cliConfiguracao.Edit();

  dmDados.cliConfiguracaoNFCE_TOKEN_CSC.AsString          := edtCSCToken.Text;
  dmDados.cliConfiguracaoNFCE_TOKEN_ID.AsString           := edtCSCId.Text;
  dmDados.cliConfiguracaoNFCE_SERIE.AsLargeInt            := StrToInt64(edtNFCeSerie.Text);
  dmDados.cliConfiguracaoNFCE_NUMERO_EMITIDO.AsLargeInt   := StrToInt64(edtNFCeUltimaEmissao.Text);
  dmDados.cliConfiguracaoAPI_CONEXAO_TOKEN.AsString       := edtApiToken.Text;
  dmDados.cliConfiguracaoREGISTRO_EMITENTE.AsLargeInt     := AEmitente;
  dmDados.cliConfiguracaoCERTIFICADO_SERIE.AsString       := edtCertificadoSerie.Text;
  dmDados.cliConfiguracaoCERTIFICADO_SENHA.AsString       := edtCertificadoSenha.Text;
  dmDados.cliConfiguracaoNFCE_AMBIENTE_EMISSAO.AsLargeInt := rgNFCeAmbiente.ItemIndex;
  dmDados.cliConfiguracao.Post();
  dmDados.cliConfiguracao.ApplyUpdates(0);
end;

procedure TViewEmitente.Salvar_Dados_Emitente;
var
  IdEmitente: Int64;

begin
  if dmDados.cliEmitente.RecordCount = 0 then
  begin
    dmDados.cliEmitente.Insert();
    IdEmitente                             := StrToInt64(edtCodigo.Text); //dmDados.Gerar_Id('GEN_EMITENTE_REGISTRO');;
    dmDados.cliEmitenteREGISTRO.AsLargeInt := IdEmitente;
  end
  else
  begin
    dmDados.cliEmitente.Edit();
    IdEmitente := dmDados.cliEmitenteREGISTRO.AsLargeInt;
  end;

  dmDados.cliEmitenteNOME.AsString          := edtNomeRazaoSocial.Text;
  dmDados.cliEmitenteNOME_FANTASIA.AsString := edtApelidoFantasia.Text;
  dmDados.cliEmitenteCONTATO.AsString       := edtContato.Text;
  dmDados.cliEmitenteENDERECO.AsString      := edtEndereco.Text;
  dmDados.cliEmitenteNUMERO.AsString        := edtNumero.Text;
  dmDados.cliEmitenteBAIRRO.AsString        := edtBairro.Text;
  dmDados.cliEmitenteMUNICIPIO.AsString     := edtMunicipio.Text;
  dmDados.cliEmitenteCD_CIDADE.AsString     := edtCodigoCidade.Text;
  dmDados.cliEmitenteCEP.AsString           := edtCep.Text;
  dmDados.cliEmitenteESTADO.AsString        := edtEstado.Text;
  dmDados.cliEmitenteCD_ESTADO.AsString     := edtCodigoEstado.Text;
  dmDados.cliEmitenteCD_PAIS.AsString       := '1058';
  dmDados.cliEmitentePAIS.AsString          := 'BRASIL';
  dmDados.cliEmitenteCNPJ.AsString          := edtCNPJ.Text;
  dmDados.cliEmitenteCPF.AsString           := edtCPF.Text;
  dmDados.cliEmitenteIE.AsString            := edtInscricaoEstadual.Text;
  dmDados.cliEmitenteTELEFONE.AsString      := edtTelefone.Text;
  dmDados.cliEmitenteEMAIL.AsString         := edtEmail.Text;
  dmDados.cliEmitenteCRT.AsString           := '1';
  dmDados.cliEmitenteCNAE.AsString          := edtCNAE.Text;
  dmDados.cliEmitenteIMUNICIPAL.AsString    := edtInscricaoMunicipal.Text;
  dmDados.cliEmitente.Post();
  dmDados.cliEmitente.ApplyUpdates(0);

  Salvar_Dados_Configuracao(IdEmitente);
end;

end.
