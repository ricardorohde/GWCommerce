unit UPanelCupomFiscal;

interface

uses
  Winapi.Windows,

  System.SysUtils, System.Classes, System.Math,

  Vcl.Controls, Vcl.ExtCtrls, Vcl.DBGrids, vcl.Forms, Vcl.Grids, Vcl.Graphics,

  Data.DB, Datasnap.DBClient, ACBrDANFCeFortesFr,

  UVenda, UGWCommerce;

type
  TPanelCupomFiscal = class(TPanel)
  private
    FClientDataSet: TClientDataSet;

    FDataSource: TDataSource;

    FGrid: TDBGrid;

    procedure Criar_ClientDataSet();
    procedure Criar_DataSource();
    procedure Criar_DBGrid();
    procedure DataDrawColumnCell(Sender: TObject; const [Ref] Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DataSourceChange(Sender: TObject; Field: TField);
    procedure Exibir_Cabecalho();
    procedure Exibir_Conteudo(AMensagem: String);
    procedure Exibir_Desconto(AVenda: TVenda);
    procedure Exibir_Linha_Tracejada();
    procedure Exibir_Total_Geral(AValorTotal: Double);

  public
    { Public declarations }
     procedure Abrir_Cupom();
     procedure Exibir_Venda(AGWCommerce: TGWCommerce);
     procedure Fechar_Cupom();

  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('Samples', [TPanelCupomFiscal]);
end;

{ TPanelCupomFiscal }

procedure TPanelCupomFiscal.Abrir_Cupom;
begin
  Criar_ClientDataSet();
  Criar_DataSource();
  Criar_DBGrid();

  FGrid.BringToFront();
  InsertControl(FGrid);

  Exibir_Cabecalho();
end;

procedure TPanelCupomFiscal.Criar_ClientDataSet;
begin
  if Assigned(FClientDataSet) then
    FClientDataSet.Free();

  FClientDataSet := TClientDataSet.Create(nil);
  FClientDataSet.FieldDefs.Add('Registro', ftString, 255);
  FClientDataSet.CreateDataSet();
end;

procedure TPanelCupomFiscal.Criar_DataSource;
begin
  if Assigned(FDataSource) then
    FDataSource.Free();

  FDataSource              := TDataSource.Create(nil);
  FDataSource.DataSet      := FClientDataSet;
  FDataSource.OnDataChange := DataSourceChange;
end;

procedure TPanelCupomFiscal.Criar_DBGrid;
begin
  if Assigned(FGrid) then
    FGrid.Free();

  FGrid                    := TDBGrid.Create(nil);
  FGrid.DataSource         := FDataSource;
  FGrid.Align              := alClient;
  FGrid.Color              := $00A4FFFF;
  FGrid.FixedColor         := FGrid.Color;
  FGrid.GradientEndColor   := FGrid.Color;
  FGrid.GradientStartColor := FGrid.Color;
  FGrid.BorderStyle        := bsNone;
  FGrid.DrawingStyle       := gdsGradient;
  FGrid.Options            := [];
  FGrid.TabStop            := False;
  FGrid.Width              := Self.Width;
  FGrid.Height             := Trunc((Self.Height * 95) / 100);
  FGrid.Columns[0].Width   := Trunc((FGrid.Width * 98) / 100);
  FGrid.OnDrawColumnCell   := DataDrawColumnCell;
end;

procedure TPanelCupomFiscal.DataDrawColumnCell(Sender: TObject;
  const [Ref] Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  Grid: TDBGrid;

begin
  Grid := Sender as TDBGrid;

  if not (gdSelected in State) then
  begin
    Grid.Canvas.Font.Color := clBlack;

    if (Pos('CUPOM FISCAL', Column.Field.AsString) > 0) or (Pos('Total', Column.Field.AsString) > 0) then
    begin
      Grid.Canvas.Font.Style := [fsBold];
      Grid.Canvas.Font.Size  := 12;
    end
    else
    begin
      Grid.Canvas.Font.Style := [];
      Grid.Canvas.Font.Size  := 8;
    end;

    Grid.Canvas.FillRect(Rect);
    Grid.Canvas.TextOut(Rect.Left + 2, Rect.Top, Column.Field.DisplayText);
  end;
end;

procedure TPanelCupomFiscal.DataSourceChange(Sender: TObject; Field: TField);
begin
  ShowScrollBar(FGrid.handle, SB_VERT, False);
end;

procedure TPanelCupomFiscal.Exibir_Cabecalho;
var
  I: Integer;

  Linha: String;

begin
  Exibir_Linha_Tracejada();

  Linha := '';

  for I := 0 to 47 do
    Linha := Linha + ' ';

  Exibir_Conteudo(Format('%s %s', [StringOfChar(' ', 47), 'CUPOM FISCAL']));
  Exibir_Linha_Tracejada();
end;

procedure TPanelCupomFiscal.Exibir_Conteudo(AMensagem: String);
begin
  FClientDataSet.Append();
  FClientDataSet.Fields[0].AsString := AMensagem;
  FClientDataSet.Post();
end;

procedure TPanelCupomFiscal.Exibir_Desconto(AVenda: TVenda);
var
  Conteudo: String;

begin
  if AVenda.Desconto.Valor > 0 then
  begin
    Conteudo := Format('%sdesconto no item %s', [StringOfChar(' ', 150), FormatFloat('#0.00', AVenda.Desconto.Valor)]);
    Exibir_Conteudo(Conteudo);
  end;
end;

procedure TPanelCupomFiscal.Exibir_Linha_Tracejada;
var
  I: Integer;

  Linha: String;

begin
  Linha := '';

  for I := 0 to 180 do
    Linha := Linha + '-';

  Exibir_Conteudo(Linha);
end;

procedure TPanelCupomFiscal.Exibir_Total_Geral(AValorTotal: Double);
begin
  Exibir_Conteudo(Format('%s Total R$ %s', [StringOfChar(' ', 47),
    FormatFloat('#,0.00', AValorTotal)]));
  Exibir_Linha_Tracejada();
end;

procedure TPanelCupomFiscal.Exibir_Venda(AGWCommerce: TGWCommerce);
var
  TotalGeral: Double;

  Espaco: Integer;

  Venda: TVenda;

  Conteudo: String;

begin
  TotalGeral := 0;

  FClientDataSet.First();
  while not FClientDataSet.Eof do
    FClientDataSet.Delete();

  Exibir_Cabecalho();

  for Venda in AGWCommerce.Venda.Itens do
  begin
    Venda.DescricaoProduto := Trim(Venda.DescricaoProduto);
    Espaco                 := 45 - Length(Venda.DescricaoProduto);

    Conteudo   := FormatFloat('0000', Venda.Ordem);
    Conteudo   := Conteudo + ' ' + FormatFloat('0000000000000000000', Venda.CodigoProdutoExibicao);
    Conteudo   := Conteudo + ' ' + Format('%s%s', [Venda.DescricaoProduto, StringOfChar('_', Espaco)]);
    Espaco     := 4 - Length(Venda.Medida);
    Conteudo   := Conteudo + ' ' + Format('%s%s', [Venda.Medida, StringOfChar('_', Espaco)]);
    Conteudo   := Conteudo + ' ' + FormatFloat('#0.0000', Venda.Quantidade);
    Conteudo   := Conteudo + ' ' + FormatFloat('#0.00', Venda.ValorUnitario);
    Conteudo   := Conteudo + ' ' + FormatFloat('#0.00', Venda.ValorBruto);
    TotalGeral := TotalGeral + Venda.ValorBruto - Venda.Desconto.Valor;

    Exibir_Conteudo(Conteudo);
    Exibir_Desconto(Venda);
    Exibir_Linha_Tracejada();
  end;

  Exibir_Total_Geral(TotalGeral);
end;

procedure TPanelCupomFiscal.Fechar_Cupom;
begin
  FClientDataSet.Free();
  FClientDataSet := nil;

  FDataSource.Free();
  FDataSource := nil;

  Self.RemoveControl(FGrid);

  FGrid.Free();
  FGrid := nil;
end;

end.
