unit UViewBase;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.DBGrids, Vcl.Grids, Data.DB;

type
  TViewBase = class(TForm)
  public
    procedure Arredondar_Controle(AControle: TWinControl);
    procedure Colorir_DBGrid(ASender: TObject; const [Ref] ARect: TRect; ADataCol: Integer;
      AColumn: TColumn; AState: TGridDrawState);
    procedure Definir_Titulo_Tela(AComplemento: String);
    procedure Maximizar();
    procedure Tirar_Barra_DBGrid(ASender: TObject; AField: TField; AGrid: TDBGrid);

  end;

implementation

{$R *.dfm}

{ TViewBase }

procedure TViewBase.Arredondar_Controle(AControle: TWinControl);
var
   Rect: TRect;
   Rgn: HRGN;

begin
  with AControle do
  begin
    Rect:= ClientRect;
    rgn := CreateRoundRectRgn(Rect.Left, Rect.Top, Rect.Right, Rect.Bottom, 30, 30) ;
    Perform(EM_GETRECT, 0, lParam(@Rect)) ;
    InflateRect(Rect, - 10, - 10) ;
    Perform(EM_SETRECTNP, 0, lParam(@Rect)) ;
    SetWindowRgn(Handle, rgn, True) ;
    Invalidate;
  end;
end;

procedure TViewBase.Definir_Titulo_Tela(AComplemento: String);
begin
  Self.Caption := Format('GWCommerce - PDV %s', [AComplemento]);
end;

procedure TViewBase.Colorir_DBGrid(ASender: TObject;
  const [Ref] ARect: TRect; ADataCol: Integer; AColumn: TColumn;
  AState: TGridDrawState);
var
  Grid: TDBGrid;

begin
  Grid := ASender as TDBGrid;

  if not (gdSelected in AState) then
  begin
    if Odd(Grid.DataSource.DataSet.RecNo) then
      Grid.Canvas.Brush.Color:= clWhite
    else
      Grid.Canvas.Brush.Color:= $0092E08B;

    Grid.Canvas.FillRect(ARect);
    Grid.Canvas.TextOut(ARect.Left + 2, ARect.Top, AColumn.Field.DisplayText);
  end;
end;

procedure TViewBase.Maximizar;
begin
  Self.Width     := Screen.Width;
  Self.Height    := Screen.Height;
  WindowState    := wsMaximized;
  DefaultMonitor := dmMainForm;
end;

procedure TViewBase.Tirar_Barra_DBGrid(ASender: TObject; AField: TField; AGrid: TDBGrid);
begin
  ShowScrollBar(AGrid.Handle, SB_VERT, False);
end;

end.
