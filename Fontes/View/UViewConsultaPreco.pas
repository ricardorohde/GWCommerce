unit UViewConsultaPreco;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Buttons, Vcl.StdCtrls,
  Data.DB, Vcl.Grids, Vcl.DBGrids, System.StrUtils, System.UITypes,

  UViewBase, UModelBase, UEstoque;

type
  TViewConsultaPreco = class(TViewBase)
    pnlRodape: TPanel;
    pnlBotao: TPanel;
    btnConfirmar: TSpeedButton;
    gridEstoque: TDBGrid;
    dsEstoque: TDataSource;
    pnlTopo: TPanel;
    edtPesquisa: TEdit;
    pnl1: TPanel;
    pnl3: TPanel;
    pnl4: TPanel;
    pnl2: TPanel;
    pnl5: TPanel;
    pnl6: TPanel;
    pnl7: TPanel;
    pnl8: TPanel;
    pnl9: TPanel;
    pnl10: TPanel;
    pnl11: TPanel;
    pnl12: TPanel;
    pnlCancelar: TPanel;
    btnCancelar: TSpeedButton;
    procedure btnConfirmarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure gridEstoqueDrawColumnCell(Sender: TObject; const [Ref] Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edtPesquisaChange(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure edtPesquisaKeyPress(Sender: TObject; var Key: Char);
    procedure gridEstoqueKeyPress(Sender: TObject; var Key: Char);
    procedure dsEstoqueDataChange(Sender: TObject; Field: TField);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
  private
    FEstoque: TEstoque;
    { Private declarations }
  public
    { Public declarations }
    procedure Exibir(AConfirmar: Boolean);

    property Estoque: TEstoque read FEstoque;
  end;

implementation

{$R *.dfm}

procedure TViewConsultaPreco.btnCancelarClick(Sender: TObject);
begin
  Close();
end;

procedure TViewConsultaPreco.btnConfirmarClick(Sender: TObject);
begin
  if dmDados.cliEstoque.RecordCount = 0 then
    MessageDlg('Nenhum produto encontrado para o lançamento.', mtWarning, [mbOK], 0)
  else
  begin
    FEstoque.CodigoProduto := dmDados.cliEstoqueCODIGO_PRODUTO.AsLargeInt;
    FEstoque.Codigo        := dmDados.cliEstoqueCODIGO.AsLargeInt;
    FEstoque.Descricao     := dmDados.cliEstoqueDESCRICAO.AsString;
    FEstoque.Medida        := dmDados.cliEstoqueMEDIDA.AsString;
    FEstoque.PrecoVenda    := dmDados.cliEstoquePRECO_VENDA.AsFloat;
    Close();
  end;
end;

procedure TViewConsultaPreco.dsEstoqueDataChange(Sender: TObject;
  Field: TField);
begin
  Tirar_Barra_DBGrid(Sender, Field, gridEstoque);
end;

procedure TViewConsultaPreco.edtPesquisaChange(Sender: TObject);
var
  Codigo: Int64;

  Busca,
  Filtro: String;

begin
  Codigo := -1;
  Busca  := UpperCase(Trim(TEdit(Sender).Text));

  if not TryStrToInt64(Busca, Codigo) then
    Codigo := -1;

  Filtro := Format('(DESCRICAO LIKE %s)', [QuotedStr('%' + Busca + '%')]);
  Filtro := Filtro + IfThen(Codigo > 0, Format('OR (CODIGO = %d)', [Codigo]), '');

  dmDados.cliEstoque.Filter   := Filtro;
  dmDados.cliEstoque.Filtered := Busca <> '';
end;

procedure TViewConsultaPreco.edtPesquisaKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
    gridEstoque.SetFocus();
end;

procedure TViewConsultaPreco.Exibir(AConfirmar: Boolean);
begin
  Maximizar();
  Definir_Titulo_Tela('(Consultar Preço)');
  Arredondar_Controle(pnlCancelar);
  Arredondar_Controle(pnlBotao);

  gridEstoque.Columns[1].Width := 100;
  gridEstoque.Columns[2].Width := 270;
//  gridEstoque.Columns[4].Width := Screen.Width  - 50;
  gridEstoque.Columns[6].Width := 80;
  gridEstoque.Columns[7].Width := 100;
  gridEstoque.Columns[4].Width := Screen.Width  - 600;

  pnlBotao.Visible := AConfirmar;

  dmDados.cliEstoque.IndexFieldNames := 'Descricao';
  dmDados.cliEstoque.First();

  ShowModal();
end;

procedure TViewConsultaPreco.FormActivate(Sender: TObject);
begin
  if edtPesquisa.CanFocus() then
    edtPesquisa.SetFocus();
end;

procedure TViewConsultaPreco.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  dmDados.cliEstoque.IndexFieldNames := '';
  dmDados.cliEstoque.Filter          := '';
  dmDados.cliEstoque.Filtered        := False;
end;

procedure TViewConsultaPreco.FormCreate(Sender: TObject);
begin
  FEstoque := TEstoque.Create();
end;

procedure TViewConsultaPreco.FormDestroy(Sender: TObject);
begin
  FEstoque.Free();
end;

procedure TViewConsultaPreco.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    Close();
end;

procedure TViewConsultaPreco.gridEstoqueDrawColumnCell(Sender: TObject;
  const [Ref] Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  Colorir_DBGrid(Sender, Rect, DataCol, Column, State);
end;

procedure TViewConsultaPreco.gridEstoqueKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
   btnConfirmarClick(Sender);
end;

end.
