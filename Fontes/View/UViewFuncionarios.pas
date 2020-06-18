unit UViewFuncionarios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Data.DB,
  Vcl.Buttons, Vcl.Grids, Vcl.DBGrids, System.UITypes,

  UViewBase;

type
  TViewFuncionarios = class(TViewBase)
    pnlTopo: TPanel;
    edtPesquisa: TEdit;
    pnl2: TPanel;
    pnlConfirmar: TPanel;
    pnl3: TPanel;
    pnl4: TPanel;
    pnl5: TPanel;
    pnl6: TPanel;
    pnl7: TPanel;
    gridFuncionarios: TDBGrid;
    btnConfirmar: TSpeedButton;
    pnlCancelar: TPanel;
    btnCancelar: TSpeedButton;
    dsFuncionarios: TDataSource;
    pnl8: TPanel;
    pnl9: TPanel;
    pnl10: TPanel;
    pnl11: TPanel;
    pnl1: TPanel;
    pnl12: TPanel;
    pnl13: TPanel;
    pnl14: TPanel;
    procedure btnCancelarClick(Sender: TObject);
    procedure gridFuncionariosDrawColumnCell(Sender: TObject;
      const [Ref] Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure edtPesquisaChange(Sender: TObject);
    procedure dsFuncionariosDataChange(Sender: TObject; Field: TField);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnConfirmarClick(Sender: TObject);
    procedure edtPesquisaKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure gridFuncionariosKeyPress(Sender: TObject; var Key: Char);
  private
    FId: Int64;
    { Private declarations }
    procedure Fechar_Tela();

  public
    { Public declarations }
     procedure Exibir(ARegistroEmitente: Int64);

     property Id: Int64 read FId;

  end;

implementation
uses
  UModelBase;

{$R *.dfm}

{ TViewFuncionarios }

procedure TViewFuncionarios.btnCancelarClick(Sender: TObject);
begin
  Fechar_Tela();
end;

procedure TViewFuncionarios.btnConfirmarClick(Sender: TObject);
begin
  if dmDados.cliFuncionarios.RecordCount = 0 then
    MessageDlg('Nenhum funcionário selecionado.', mtError, [mbOK], 0)
  else
  begin
    FId := dmDados.cliFuncionariosID_FUNCIONARIO.AsLargeInt;
    Close();
  end;
end;

procedure TViewFuncionarios.dsFuncionariosDataChange(Sender: TObject;
  Field: TField);
begin
  Tirar_Barra_DBGrid(Sender, Field, gridFuncionarios);
end;

procedure TViewFuncionarios.edtPesquisaChange(Sender: TObject);
var
  Filtro: String;

begin
  Filtro := Format('UPPER(NOME_FUNCIONARIO) like %0:s OR CPF like %0:s OR RG like %0:s OR CELULAR like %0:s OR TELEFONE like %0:s',
    [QuotedStr('%' + UpperCase(TEdit(Sender).Text) + '%')]);

  dmDados.cliFuncionarios.Filter   := Filtro;
  dmDados.cliFuncionarios.Filtered := Trim(TEdit(Sender).Text) <> '';
end;

procedure TViewFuncionarios.edtPesquisaKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_RETURN) and (ActiveControl.Name = edtPesquisa.Name) and (Self.Active) then
    gridFuncionarios.SetFocus();
end;

procedure TViewFuncionarios.Exibir(ARegistroEmitente: Int64);
begin
  FId := -1;
  Maximizar();
  Arredondar_Controle(pnlCancelar);
  Arredondar_Controle(pnlConfirmar);

  Definir_Titulo_Tela('(Identificar Funcionário)');

  dmDados.Abrir_Tabela_Funcionario(ARegistroEmitente);

  gridFuncionarios.Columns[4].Width  := 100;
  gridFuncionarios.Columns[13].Width := 100;
  gridFuncionarios.Columns[14].Width := 100;
  gridFuncionarios.Columns[2].Width  := Screen.Width - 320;

  ShowModal();
end;

procedure TViewFuncionarios.Fechar_Tela;
begin
  FId := -1;
  Close();
end;

procedure TViewFuncionarios.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    Fechar_Tela();
end;

procedure TViewFuncionarios.gridFuncionariosDrawColumnCell(Sender: TObject;
  const [Ref] Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  Colorir_DBGrid(Sender, Rect, DataCol, Column, State);
end;

procedure TViewFuncionarios.gridFuncionariosKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
    btnConfirmarClick(Sender);
end;

end.
