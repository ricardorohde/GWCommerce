unit UViewDesconto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons,
  System.Math, SysTem.UITypes, ACBrUtil;

type
  TTipoDesconto = (tdNenhum = 0, tdPercentual = 1, tdValor = 2);

  TRegistroDesconto = record
    Tipo: TTipoDesconto;
    ValorAplicado: Double;
  end;

  TViewDesconto = class(TForm)
    Label1: TLabel;
    edtDescontoPercentual: TEdit;
    Label2: TLabel;
    edtDescontoValor: TEdit;
    btnCancelar: TSpeedButton;
    btnOk: TSpeedButton;
    procedure edtDescontoPercentualExit(Sender: TObject);
    procedure edtDescontoPercentualKeyPress(Sender: TObject; var Key: Char);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edtDescontoValorKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    FDesconto: TRegistroDesconto;

    FValorBase: Double;

    function Validar_Digito(AKey: Char): Boolean;

    procedure Aplicar_Desconto_Percentual();
    procedure Aplicar_Desconto_Valor();
    procedure Zerar_Valor(Sender: TObject);

  public
    { Public declarations }
    procedure Exibir(AValorBase: Double);

    property Desconto: TRegistroDesconto read FDesconto write FDesconto;

  end;

implementation

{$R *.dfm}

{ TViewDesconto }

procedure TViewDesconto.Aplicar_Desconto_Percentual;
var
  Percentual: Double;

begin
  Percentual := StrToFloat(edtDescontoPercentual.Text);

  if Percentual >= 100 then
    raise Exception.Create('Percentual de desconto não permitido.');

  FDesconto.ValorAplicado := Percentual;
  FDesconto.Tipo          := tdPercentual;
end;

procedure TViewDesconto.Aplicar_Desconto_Valor;
var
  Valor: Double;

begin
  Valor := StrToFloat(edtDescontoValor.Text);

  if CompareValue(FValorBase, Valor, 0.001) <= 0.001 then
    raise Exception.Create('Valor de desconto não permitido.');

  FDesconto.ValorAplicado := Valor;
  FDesconto.Tipo          := tdValor;
end;

procedure TViewDesconto.btnCancelarClick(Sender: TObject);
begin
  Close();
end;

procedure TViewDesconto.btnOkClick(Sender: TObject);
var
  Valor: Double;

begin
  try
    if not TryStrToFloat(edtDescontoPercentual.Text, Valor) then
        raise Exception.Create('Informe um percentual válido para aplicação do desconto.');

    if not TryStrToFloat(edtDescontoValor.Text, Valor) then
        raise Exception.Create('Informe um valor válido para aplicação do desconto.');

    FDesconto.Tipo   := tdNenhum;

    if StrToFloat(edtDescontoValor.Text) <> 0 then
      Aplicar_Desconto_Valor()
    else if StrToFloat(edtDescontoPercentual.Text) <> 0 then
      Aplicar_Desconto_Percentual();

    if (FDesconto.ValorAplicado <= 0) or (FDesconto.Tipo = tdNenhum) then
      raise Exception.Create('Informe um valor para aplicar o desconto.');

     if FDesconto.Tipo = tdPercentual then
       FDesconto.ValorAplicado := RoundABNT((FValorBase * StrToFloat(edtDescontoPercentual.Text)) / 100, -2);

    btnCancelarClick(Sender);
  except on E: Exception do
    MessageDlg(Format('Erro ao aplicar o desconto: %s', [E.Message]), mtError, [mbOK], 0);
  end;
end;

procedure TViewDesconto.edtDescontoPercentualExit(Sender: TObject);
var
  Valor: Double;

begin
  if not TryStrToFloat(TEdit(Sender).Text, Valor) then
    Zerar_Valor(Sender);
end;

procedure TViewDesconto.edtDescontoPercentualKeyPress(Sender: TObject; var Key: Char);
var
  Percentual: Double;

begin
  if Key = #13 then
  begin
    if TryStrToFloat(TEdit(Sender).Text, Percentual) and (Percentual > 0) then
      btnOkClick(Sender)
    else
      edtDescontoValor.SetFocus();
  end
  else if not Validar_Digito(Key) then
    Key := #0;
end;

procedure TViewDesconto.edtDescontoValorKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
    btnOkClick(Sender)
  else if not Validar_Digito(Key) then
    Key := #0;
end;

procedure TViewDesconto.Exibir(AValorBase: Double);
begin
  FValorBase              := AValorBase;
  FDesconto.Tipo          := tdNenhum;
  FDesconto.ValorAplicado := 0;

  Zerar_Valor(edtDescontoPercentual);
  Zerar_Valor(edtDescontoValor);

  ShowModal();
end;

procedure TViewDesconto.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    btnCancelarClick(Sender);
end;

function TViewDesconto.Validar_Digito(AKey: Char): Boolean;
begin
  Result := CharInSet(AKey, ['0'..'9', #8, #44]);
end;

procedure TViewDesconto.Zerar_Valor(Sender: TObject);
begin
  TEdit(Sender).Text := '0,00';
end;

end.
