unit UViewConsultaCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.ExtCtrls, System.UITypes, System.StrUtils,

  UViewBase, Data.DB, Vcl.Grids, Vcl.DBGrids,

  UModelBase, Vcl.StdCtrls;

type
  TViewConsultaCliente = class(TViewBase)
    pnl1: TPanel;
    pnlBotao: TPanel;
    btnConfirmar: TSpeedButton;
    pnlCentral: TPanel;
    gridClientes: TDBGrid;
    dsCliente: TDataSource;
    pnlTopo: TPanel;
    edtPesquisa: TEdit;
    tmr1: TTimer;
    pnl4: TPanel;
    pnl5: TPanel;
    pnl6: TPanel;
    pnl7: TPanel;
    pnl2: TPanel;
    pnl3: TPanel;
    pnl8: TPanel;
    pnl9: TPanel;
    pnl10: TPanel;
    pnl11: TPanel;
    pnl12: TPanel;
    pnlCancelar: TPanel;
    pnl14: TPanel;
    btnCancelar: TSpeedButton;
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure gridClientesDrawColumnCell(Sender: TObject;
      const [Ref] Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure edtPesquisaChange(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure edtPesquisaKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure gridClientesKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure tmr1Timer(Sender: TObject);
    procedure dsClienteDataChange(Sender: TObject; Field: TField);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure btnCancelarClick(Sender: TObject);
  private
    FIdCliente,
    FRegistroEmitente: Int64;

    procedure Tratar_Botao(AValor: Boolean);

  public
    procedure Exibir(ARegistroEmitente: Int64);

    property IdCliente: Int64 read FIdCliente;

  end;

implementation

{$R *.dfm}

{ TViewConsultaCliente }

procedure TViewConsultaCliente.btnCancelarClick(Sender: TObject);
begin
  Close();
end;

procedure TViewConsultaCliente.btnConfirmarClick(Sender: TObject);
begin
  try
    if dmDados.cliCliente.RecordCount > 0 then
    begin
      FIdCliente := dmDados.cliClienteCODIGO_CLIENTE.AsLargeInt;
      Close();
    end
    else
      raise Exception.Create('Nenhum cliente selecionado.');  

  except on E: Exception do
    MessageDlg(Format('Erro: %s', [E.Message]), mtError, [mbOK], 0);
  end;
end;

procedure TViewConsultaCliente.dsClienteDataChange(Sender: TObject;
  Field: TField);
begin
  Tirar_Barra_DBGrid(Sender, Field, gridClientes);
end;

procedure TViewConsultaCliente.edtPesquisaChange(Sender: TObject);
var
  Filtro: String;

begin
  Filtro := Format('UPPER(NOME) like %0:s OR CPF like %0:s OR RG like %0:s OR CELULAR like %0:s',
    [QuotedStr('%' + UpperCase(TEdit(Sender).Text) + '%')]);

  dmDados.cliCliente.Filter   := Filtro;
  dmDados.cliCliente.Filtered := Trim(TEdit(Sender).Text) <> '';
end;

procedure TViewConsultaCliente.edtPesquisaKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_RETURN) and (ActiveControl.Name = edtPesquisa.Name) and (Self.Active) then
    gridClientes.SetFocus();
end;

procedure TViewConsultaCliente.Exibir(ARegistroEmitente: Int64);
begin
  Maximizar();
  Arredondar_Controle(pnlCancelar);
  Arredondar_Controle(pnlBotao);
  Definir_Titulo_Tela('(Consultar Cliente)');

  gridClientes.Columns[0].Width := 100;
  gridClientes.Columns[4].Width := 180;
  gridClientes.Columns[6].Width := 180;
  gridClientes.Columns[2].Width := Screen.Width  - 520;

  FRegistroEmitente    := ARegistroEmitente;
  tmr1.Interval        := 1000;
  FIdCliente           := -1;
  tmr1.Enabled         := True;
  Tratar_Botao(False);
  ShowModal();
end;

procedure TViewConsultaCliente.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  dmDados.cliCliente.Filter   := '';
  dmDados.cliCliente.Filtered := False;
end;

procedure TViewConsultaCliente.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    Close();
end;

procedure TViewConsultaCliente.FormShow(Sender: TObject);
begin
  edtPesquisa.Clear();
  edtPesquisa.SetFocus();
end;

procedure TViewConsultaCliente.gridClientesDrawColumnCell(Sender: TObject;
  const [Ref] Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);

begin
  Colorir_DBGrid(Sender, Rect, DataCol, Column, State);
end;

procedure TViewConsultaCliente.gridClientesKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_RETURN) and (btnConfirmar.Enabled) then
    btnConfirmarClick(Sender);
end;

procedure TViewConsultaCliente.tmr1Timer(Sender: TObject);
begin
  if tmr1.Interval >= 1000 then
  begin
    try
      edtPesquisa.SetFocus();
      dmDados.Abrir_Tabela_Cliente(FRegistroEmitente);
    finally
      tmr1.Enabled := False;
      Tratar_Botao(True);
    end;
  end
  else
    tmr1.Interval := tmr1.Interval + 1000;
end;

procedure TViewConsultaCliente.Tratar_Botao(AValor: Boolean);
begin
  btnConfirmar.Enabled := AValor;
  btnConfirmar.Caption := IfThen(AValor, 'Confirmar', 'Aguarde');
end;

end.
