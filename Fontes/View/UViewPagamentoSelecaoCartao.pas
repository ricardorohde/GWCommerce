unit UViewPagamentoSelecaoCartao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons,

  UViewBase, UCartao, System.StrUtils, pcnConversao;

type
  TViewPagamentoSelecaoCartao = class(TViewBase)
    grp1: TGroupBox;
    grp2: TGroupBox;
    grp3: TGroupBox;
    pnl1: TPanel;
    pnlBotao: TPanel;
    btnConfirmar: TSpeedButton;
    lstTipoCartao: TListBox;
    lstBandeira: TListBox;
    edtCodigoAutorizacao: TEdit;
    pnl2: TPanel;
    pnl3: TPanel;
    pnl4: TPanel;
    pnl5: TPanel;
    pnl6: TPanel;
    pnl7: TPanel;
    pnl8: TPanel;
    pnlCancelar: TPanel;
    btnCancelar: TSpeedButton;
    procedure btnConfirmarClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure lstTipoCartaoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure lstBandeiraKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtCodigoAutorizacaoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
  private
    FCartao: TCartao;
    { Private declarations }
  public
    procedure Exibir();

    property Cartao: TCartao read FCartao write FCartao;

  end;

implementation

{$R *.dfm}

{ TViewPagamentoSelecaoCartao }

procedure TViewPagamentoSelecaoCartao.btnCancelarClick(Sender: TObject);
begin
  Close();
end;

procedure TViewPagamentoSelecaoCartao.btnConfirmarClick(Sender: TObject);
var
  IndiceBandeira: Integer;

begin
  if lstTipoCartao.ItemIndex = 0 then
    FCartao.Tipo := tcDebito
  else if lstTipoCartao.ItemIndex = 1 then
    FCartao.Tipo := tcCredito
  else
    FCartao.Tipo := tcNenhum;

  IndiceBandeira            := lstBandeira.ItemIndex + 1;
  FCartao.CodigoAutorizacao := IfThen(Trim(edtCodigoAutorizacao.Text) <> '',
    edtCodigoAutorizacao.Text, '0');

  case IndiceBandeira of
    1:  FCartao.TipoBandeira := bcVisa;
    2:  FCartao.TipoBandeira := bcMasterCard;
    3:  FCartao.TipoBandeira := bcAmericanExpress;
    4:  FCartao.TipoBandeira := bcSorocred;
    5:  FCartao.TipoBandeira := bcDinersClub;
    6:  FCartao.TipoBandeira := bcElo;
    7:  FCartao.TipoBandeira := bcHipercard;
    8:  FCartao.TipoBandeira := bcAura;
    9:  FCartao.TipoBandeira := bcCabal;
    10: FCartao.TipoBandeira := bcOutros;
  else
    FCartao.TipoBandeira := bcOutros;
  end;

  Close();
end;

procedure TViewPagamentoSelecaoCartao.edtCodigoAutorizacaoKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
    btnConfirmarClick(Sender);
end;

procedure TViewPagamentoSelecaoCartao.Exibir;
begin
  lstTipoCartao.ItemIndex := 0;

  Arredondar_Controle(pnlCancelar);
  Arredondar_Controle(pnlBotao);
  Definir_Titulo_Tela('(Selecionar Cartão)');
  ShowModal();
end;

procedure TViewPagamentoSelecaoCartao.FormCreate(Sender: TObject);
begin
  FCartao := TCartao.Create();
end;

procedure TViewPagamentoSelecaoCartao.FormDestroy(Sender: TObject);
begin
  FCartao.Free();
end;

procedure TViewPagamentoSelecaoCartao.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    Close();
end;

procedure TViewPagamentoSelecaoCartao.lstBandeiraKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    edtCodigoAutorizacao.Clear();
    edtCodigoAutorizacao.SetFocus();
  end;
end;

procedure TViewPagamentoSelecaoCartao.lstTipoCartaoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    lstBandeira.ItemIndex := 0;
    lstBandeira.SetFocus();
  end;
end;

end.
