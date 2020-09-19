unit UViewEnvioNotasFiscais;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Buttons, Vcl.ComCtrls,
  Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, System.DateUtils, System.UITypes,

  UViewBase, UModelBase;

type
  TViewEnvioNotasFiscais = class(TViewBase)
    pnl1: TPanel;
    pnl2: TPanel;
    pnl3: TPanel;
    pnl4: TPanel;
    pnl5: TPanel;
    pnl6: TPanel;
    pnl7: TPanel;
    gridNotas: TDBGrid;
    lbl1: TLabel;
    dtpDataFiltro: TDateTimePicker;
    pnlBuscarNotas: TPanel;
    btnConsultar: TSpeedButton;
    pnlCancelar: TPanel;
    pnlEnviar: TPanel;
    pnl9: TPanel;
    pnl10: TPanel;
    btnCancelar: TSpeedButton;
    btnEnviar: TSpeedButton;
    dsConsultaNotas: TDataSource;
    pnl8: TPanel;
    pnl11: TPanel;
    chkGerarArquivoEnvio: TCheckBox;
    procedure btnCancelarClick(Sender: TObject);
    procedure btnConsultarClick(Sender: TObject);
    procedure btnEnviarClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure gridNotasDrawColumnCell(Sender: TObject; const [Ref] Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
    FRegistroEmitente: Int64;

    procedure Consultar_Notas(AData: TDateTime);
  public
    { Public declarations }
    procedure Exibir(AIdRegistroEmitente: Int64);
  end;

var
  ViewEnvioNotasFiscais: TViewEnvioNotasFiscais;

implementation
uses
  UViewAviso, UModelNFCe;

{$R *.dfm}

procedure TViewEnvioNotasFiscais.btnConsultarClick(Sender: TObject);
begin
  Consultar_Notas(dtpDataFiltro.DateTime);
end;

procedure TViewEnvioNotasFiscais.btnCancelarClick(Sender: TObject);
begin
  Close();
end;

procedure TViewEnvioNotasFiscais.btnEnviarClick(Sender: TObject);
var
  Aviso: TViewAviso;

begin
  try
    if dmDados.cliConsultaNotasEnviarApi.RecordCount = 0  then
      raise Exception.Create('Nenhuma Nota Fiscal encontrada.');

  except on E: Exception do
  begin
    MessageDlg('Nenhuma Nota Fiscal encontrada.', mtError, [mbOk], 0);
    Exit();
  end;
  end;

  dmDados.cliConsultaNotasEnviarApi.DisableControls();
  Aviso := TViewAviso.Create(nil);
  try
    try
      dmDados.cliConsultaNotasEnviarApi.First();
      while not dmDados.cliConsultaNotasEnviarApi.Eof do
      begin
        Aviso.Exibir(Format('Integrando Nota Nº %d', [dmDados.cliConsultaNotasEnviarApiIDE_NNF.AsLargeInt]));
        dmNFCe.Enviar_Nota_Api(chkGerarArquivoEnvio.Checked);
        dmDados.cliConsultaNotasEnviarApi.Next();
      end;
      btnConsultarClick(Sender);
    except on E: Exception do
      MessageDlg(Format('Erro: %s.', [E.Message]), mtError, [mbOk], 0);
    end;
  finally
    dmDados.cliConsultaNotasEnviarApi.EnableControls();
    FreeAndNil(Aviso);
  end;
end;

procedure TViewEnvioNotasFiscais.Consultar_Notas(AData: TDateTime);
var
  Aviso: TViewAviso;

begin
  Aviso := TViewAviso.Create(nil);
  try
    Aviso.Exibir('Consultando Notas Fiscais Emitidas.');
    try
      dmDados.Consultar_Notas_Para_Integrar_API(FRegistroEmitente, AData);
    except on E: Exception do
      MessageDlg(Format('Erro ao consultar as notas no banco de dados. %s', [E.Message]), mtError, [mbOK], 0);
    end;
  finally
    FreeAndNil(Aviso);
  end;
end;

procedure TViewEnvioNotasFiscais.Exibir(AIdRegistroEmitente: Int64);
begin
  FRegistroEmitente := AIdRegistroEmitente;
  Definir_Titulo_Tela('(Enviar Notas Fiscais)');

  Arredondar_Controle(pnlBuscarNotas);
  Arredondar_Controle(pnlCancelar);
  Arredondar_Controle(pnlEnviar);

  Consultar_Notas(IncDay(Now(), -365));

  dtpDataFiltro.DateTime := IncDay(Now(), - 1);

  ShowModal();
end;

procedure TViewEnvioNotasFiscais.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    Close();
end;

procedure TViewEnvioNotasFiscais.gridNotasDrawColumnCell(Sender: TObject;
  const [Ref] Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  Colorir_DBGrid(Sender, Rect, DataCol, Column, State);
end;

end.
