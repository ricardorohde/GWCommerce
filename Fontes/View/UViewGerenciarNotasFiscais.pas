unit UViewGerenciarNotasFiscais;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Buttons, Data.DB,
  Vcl.Grids, Vcl.DBGrids, System.DateUtils, System.StrUtils,

  UViewAviso,

  UModelBase, UViewBase, Vcl.ComCtrls, Vcl.StdCtrls;

type
  TTipoAcao = (taCancelar = 0, taEnviarOffLine = 1, taReImprimir = 2);

  TViewGerenciarNotasFiscais = class(TViewBase)
    pnl1: TPanel;
    pnlCancelarNota: TPanel;
    btnExecutar: TSpeedButton;
    gridNotasFiscais: TDBGrid;
    dsNotasFiscais: TDataSource;
    pnl3: TPanel;
    lbl1: TLabel;
    dtpDataEmissao: TDateTimePicker;
    pnlBuscarNotas: TPanel;
    btnBuscar: TSpeedButton;
    pnl2: TPanel;
    pnl4: TPanel;
    pnl5: TPanel;
    pnl6: TPanel;
    pnl7: TPanel;
    pnl8: TPanel;
    pnl9: TPanel;
    pnl10: TPanel;
    pnlCancelar: TPanel;
    btnCancelar: TSpeedButton;
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure dsNotasFiscaisDataChange(Sender: TObject; Field: TField);
    procedure gridNotasFiscaisDrawColumnCell(Sender: TObject;
      const [Ref] Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure btnExecutarClick(Sender: TObject);
    procedure btnBuscarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
  private
    { Private declarations }
    FGWCommerce: TObject;

    FAcao: TTipoAcao;

    procedure Consultar_Notas(ASql: String);
    procedure AfterScroll(ADataSet: TDataSet);
    procedure Cancelar_Nota();
    procedure Carregar_Notas();
    procedure Enviar_Nota_OffLine();
    procedure ReImprimir();

  public
    procedure Exibir(AGWCommerce: TObject; AAcao: TTipoAcao);

  end;

implementation
uses
  UModelNFCe, UGWCommerce;

{$R *.dfm}

{ TViewGerenciarNotasFiscais }

procedure TViewGerenciarNotasFiscais.AfterScroll(ADataSet: TDataSet);
var
  Status: Int64;

begin
  btnExecutar.Enabled := False;

  if FAcao = taCancelar then
  begin
    btnExecutar.Enabled := ADataSet.FieldByName('IDE_MOD').AsLargeInt = 65;
    btnExecutar.Caption := 'Cancelar Nota';
  end
  else
  begin
    Status := ADataSet.FieldByName('CD_STATUS').AsLargeInt;
    if (ADataSet.FieldByName('IDE_TPEMIS').AsLargeInt = 9) and (Status <> 100) and (Status <> 150) then
    begin
      FAcao               := taEnviarOffLine;
      btnExecutar.Caption := 'Enviar Off-Line';
      btnExecutar.Enabled := True;
    end
    else if ((Status in [100, 150])) then
    begin
      FAcao               := taReImprimir;
      btnExecutar.Caption := 'Re-Imprimir';
      btnExecutar.Enabled := True;
    end;
  end;
end;

procedure TViewGerenciarNotasFiscais.btnBuscarClick(Sender: TObject);
var
  Aviso: TViewAviso;

begin
  Aviso := TViewAviso.Create(nil);
  try
    Aviso.Exibir('Consultando Notas.');
    Carregar_Notas();
  finally
    FreeAndNil(Aviso);
  end;
end;

procedure TViewGerenciarNotasFiscais.btnCancelarClick(Sender: TObject);
begin
  Close();
end;

procedure TViewGerenciarNotasFiscais.btnExecutarClick(Sender: TObject);
begin
  if dmDados.cliConsultaNotasFiscais.RecordCount > 0 then
   begin
     case FAcao of
       taCancelar : Cancelar_Nota();
       taEnviarOffLine: Enviar_Nota_OffLine();
       taReImprimir: ReImprimir();
     end;

     Carregar_Notas();
   end;
end;

procedure TViewGerenciarNotasFiscais.Cancelar_Nota;
var
  Justificativa: String;

begin
  if HoursBetween(Now(), dmDados.cliConsultaNotasFiscaisIDE_DHEMI.AsDateTime) >  24 then
    raise Exception.Create('Essa Nota Fiscal não pode ser cancelada pois o tempo de tolerancia já foi atingido.');

  Justificativa := Trim(InputBox('Justificativa', 'Informe uma justificativa para cancelar a nota fiscal', ''));

  if (Justificativa = '') or (Length(Justificativa) < 15) then
    raise Exception.Create('A Justificativa é obrigatório e superior a 15 caracteres.');

  dmNFCe.Cancelar_Nota_Fiscal(dmDados.cliConsultaNotasFiscaisCHAVE.AsString, Justificativa, TGWCommerce(FGWCommerce));
end;

procedure TViewGerenciarNotasFiscais.Carregar_Notas;
var
  Sql: String;

begin
  Sql:= Format(
    'SELECT NEWTABLE.*                       '#13#10 +
    '  FROM(                                 '#13#10 +
    '  SELECT *                              '#13#10 +
    '    FROM NFE_CAB                        '#13#10 +
    '   WHERE REGISTRO_EMIT = %0:d           '#13#10 +
    '     AND CAST(IDE_DHEMI AS DATE) = %1:s '#13#10 +
    '     AND %2:s                           '#13#10 +
    '     AND IDE_MOD = 65                   '#13#10 +
    'UNION                                   '#13#10 +
    '  SELECT *                              '#13#10 +
    '    FROM NFE_CAB                        '#13#10 +
    '   WHERE REGISTRO_EMIT = %0:d           '#13#10 +
    '     AND CAST(IDE_DHEMI AS DATE) = %1:s '#13#10 +
    '     AND IDE_MOD = 90                   '#13#10 +
    '       ) AS NEWTABLE                    '#13#10 +
    'ORDER BY ID_NFE DESC', [TGWCommerce(FGWCommerce).Emitente.Registro,
    QuotedStr(FormatDateTime('yyyy-MM-dd', dtpDataEmissao.DateTime)),
    IfThen(FAcao = taCancelar, 'CD_STATUS IN (100, 150)',
      'CD_STATUS NOT IN (128, 135)')]);
//      '((CD_STATUS in [128, 135) AND (IDE_TPEMIS = 9))')]);

  Consultar_Notas(Sql);
{  dmDados.qryConsultaNotasFiscais.Close();
  dmDados.qryConsultaNotasFiscais.SQL.Clear();
  dmDados.qryConsultaNotasFiscais.SQL.Add(Sql);
  dmDados.qryConsultaNotasFiscais.Open();

  dmDados.cliConsultaNotasFiscais.Close();
  dmDados.cliConsultaNotasFiscais.Open();}
end;

procedure TViewGerenciarNotasFiscais.Consultar_Notas(ASql: String);
var
  TemNotas: Boolean;

begin
  dmDados.qryConsultaNotasFiscais.Close();
  dmDados.qryConsultaNotasFiscais.SQL.Clear();
  dmDados.qryConsultaNotasFiscais.SQL.Add(ASql);
  dmDados.qryConsultaNotasFiscais.Open();

  dmDados.cliConsultaNotasFiscais.Close();
  dmDados.cliConsultaNotasFiscais.Open();

  TemNotas            := dmDados.cliConsultaNotasFiscais.RecordCount > 0;
  btnExecutar.Enabled := TemNotas;

  if TemNotas then
    dmDados.cliConsultaNotasFiscais.First();
end;

procedure TViewGerenciarNotasFiscais.dsNotasFiscaisDataChange(Sender: TObject;
  Field: TField);
begin
  ShowScrollBar(gridNotasFiscais.Handle, SB_VERT, False);
  ShowScrollBar(gridNotasFiscais.Handle, SB_HORZ, False);
end;

procedure TViewGerenciarNotasFiscais.Enviar_Nota_OffLine;
begin
  dmNFCe.Enviar_OffLine(TGWCommerce(FGWCommerce), dmDados.cliConsultaNotasFiscaisXML_APROVADO.AsString);
end;

procedure TViewGerenciarNotasFiscais.Exibir(AGWCommerce: TObject; AAcao: TTipoAcao);
var
  Sql: String;

begin
  FAcao               := AAcao;
  FGWCommerce         := AGWCommerce;
  Self.Width          := Trunc((Screen.Width * 90) / 100);
  Self.Height         := Trunc((Screen.Height * 90) / 100);
//  btnExecutar.Caption := IfThen(FAcao = taCancelar, 'Cancelar Nota', 'Enviar Off-Line');

  Definir_Titulo_Tela(Format('(%s Notas Fiscais)', [IfThen(AAcao = taCancelar, 'Cancelar', 'Gerenciar')]));

  Sql := 'SELECT *      '#13#10 +
         '  FROM NFE_CAB'#13#10 +
         ' WHERE ID_NFE = -1';

  Consultar_Notas(Sql);

  dsNotasFiscais.DataSet.AfterScroll := AfterScroll;

  Arredondar_Controle(pnlCancelar);
  Arredondar_Controle(pnlCancelarNota);
  Arredondar_Controle(pnlBuscarNotas);
  dtpDataEmissao.Date := Now();
  ShowModal();
end;

procedure TViewGerenciarNotasFiscais.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    Close();
end;

procedure TViewGerenciarNotasFiscais.gridNotasFiscaisDrawColumnCell(
  Sender: TObject; const [Ref] Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
  Grid: TDBGrid;

begin
  Grid := Sender as TDBGrid;

  if not (gdSelected in State) then
  begin
    if Odd(Grid.DataSource.DataSet.RecNo) then
      Grid.Canvas.Brush.Color:= clWhite
    else
      Grid.Canvas.Brush.Color:= $0092E08B;

    Grid.Canvas.FillRect(Rect);
    Grid.Canvas.TextOut(Rect.Left + 2, Rect.Top, Column.Field.DisplayText);
  end;
end;

procedure TViewGerenciarNotasFiscais.ReImprimir;
begin
  dmNFCe.ReImprimir_Nota(dmDados.cliConsultaNotasFiscaisXML_APROVADO.AsString);
end;

end.
