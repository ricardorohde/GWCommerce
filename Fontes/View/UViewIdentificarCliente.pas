unit UViewIdentificarCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Buttons, Vcl.StdCtrls, UViewBase,
  ACBrValidador, System.UITypes;

type
  TViewIdentificarCliente = class(TViewBase)
    pnl1: TPanel;
    pnl2: TPanel;
    pnl3: TPanel;
    pnl4: TPanel;
    pnl5: TPanel;
    pnlConfirmar: TPanel;
    pnlCancelar: TPanel;
    btnConfirmar: TSpeedButton;
    btnCancelar: TSpeedButton;
    pnl8: TPanel;
    pnl9: TPanel;
    pnl10: TPanel;
    pnl11: TPanel;
    grp1: TGroupBox;
    lbl1: TLabel;
    lbl2: TLabel;
    edtNome: TEdit;
    edtDocumento: TEdit;
    procedure btnCancelarClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure edtNomeKeyPress(Sender: TObject; var Key: Char);
    procedure edtDocumentoKeyPress(Sender: TObject; var Key: Char);
  private
    FDocumento,
    FNome: String;

    procedure Fechar_Tela();
    procedure Limpar_Valores();

    { Private declarations }
  public
    { Public declarations }
    procedure Exibir();

    property Documento: String read FDocumento write FDocumento;
    property Nome: String read FNome write FNome;

  end;

implementation

{$R *.dfm}

procedure TViewIdentificarCliente.btnConfirmarClick(Sender: TObject);
var
  Erro: String;

begin
  try
    FNome     := Trim(edtNome.Text);
    Documento := Trim(edtDocumento.Text);

    edtNome.SetFocus();

    if FNome = '' then
      raise Exception.Create('O Nome do cliente é obrigatório.');

    if (FNome <> '') and (Length(FNome) = 1) then
      raise Exception.Create('O Nome do cliente deve ter mais que 2 caracteres.');

    Erro := '';

    edtDocumento.SetFocus();
    if Length(Documento) > 12 then
      Erro :=  ValidarCNPJ(Documento)
    else
      Erro := ValidarCPF(Documento);

    if Trim(Erro) <> '' then
      raise Exception.Create(Erro);

    Close();
  except on E: Exception do
  begin
    Limpar_Valores();
    MessageDlg(Format('Erro: %s', [E.Message]), mtError, [mbOK], 0);
  end;
  end;
end;

procedure TViewIdentificarCliente.btnCancelarClick(Sender: TObject);
begin
  Fechar_Tela();
end;

procedure TViewIdentificarCliente.edtDocumentoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
    btnConfirmarClick(Sender);
end;

procedure TViewIdentificarCliente.edtNomeKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
    edtDocumento.SetFocus();
end;

procedure TViewIdentificarCliente.Exibir;
begin
  Limpar_Valores();
  Definir_Titulo_Tela('(Identificar Cliente)');
  Arredondar_Controle(pnlCancelar);
  Arredondar_Controle(pnlConfirmar);
  edtNome.Clear();
  edtDocumento.Clear();
  ShowModal();
end;

procedure TViewIdentificarCliente.Fechar_Tela;
begin
  Limpar_Valores();
  Close();
end;

procedure TViewIdentificarCliente.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    Fechar_Tela();
end;

procedure TViewIdentificarCliente.FormShow(Sender: TObject);
begin
  edtNome.SetFocus();
end;

procedure TViewIdentificarCliente.Limpar_Valores;
begin
  Nome      := '';
  Documento := '';
end;

end.
