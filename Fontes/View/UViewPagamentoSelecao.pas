unit UViewPagamentoSelecao;

interface

uses
  Winapi.Windows, Winapi.Messages,

  System.SysUtils, System.Variants, System.Classes, System.UITypes,
  System.Generics.Collections,

  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Graphics,

  UViewBase, UPagamento, UViewConsultaCliente, UGWCommerce, UViewPagamentoSelecaoCartao,
  UPanelCupomFiscal, Vcl.Buttons, pcnConversao, UCartao, JvExControls,
  JvSpeedButton, JvButton, JvTransparentButton, JvExButtons, JvButtons,
  JvExStdCtrls, JvCtrls, JvBitBtn, AdvGlowButton, madExceptVcl;

type
  TViewPagamentoSelecao = class(TViewBase)
    pnlValores: TPanel;
    pnlTotal: TPanel;
    lbl1: TLabel;
    edtTotal: TEdit;
    pnlCartao: TPanel;
    lbl2: TLabel;
    edtCartao: TEdit;
    pnlPrazo: TPanel;
    lbl3: TLabel;
    edtPrazo: TEdit;
    pnlCheque: TPanel;
    edtCheque: TEdit;
    pnl5: TPanel;
    edt5: TEdit;
    pnl6: TPanel;
    edt6: TEdit;
    pnl7: TPanel;
    edt7: TEdit;
    pnl8: TPanel;
    edt8: TEdit;
    pnl9: TPanel;
    edt9: TEdit;
    pnl10: TPanel;
    edt10: TEdit;
    pnl11: TPanel;
    edt11: TEdit;
    pnl12: TPanel;
    edt12: TEdit;
    lbl4: TLabel;
    lbl5: TLabel;
    lbl6: TLabel;
    lbl7: TLabel;
    lbl8: TLabel;
    lbl9: TLabel;
    pnl2: TPanel;
    edt13: TEdit;
    pnl3: TPanel;
    edt14: TEdit;
    pnlDinheiro: TPanel;
    lbl14: TLabel;
    edtDinheiro: TEdit;
    pnlTroco: TPanel;
    lbl15: TLabel;
    edtTroco: TEdit;
    lbl10: TLabel;
    lbl11: TLabel;
    lbl12: TLabel;
    lbl13: TLabel;
    lbl16: TLabel;
    CupomFiscal: TPanelCupomFiscal;
    pnlBotoes: TPanel;
    pnlFinalizar: TPanel;
    pnlCancelar: TPanel;
    btnCancelar: TSpeedButton;
    btnFinalizar: TSpeedButton;
    pnl1: TPanel;
    pnl4: TPanel;
    pnl13: TPanel;
    pnl14: TPanel;
    pnl15: TPanel;
    pnl16: TPanel;
    edtFinalizar: TEdit;
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure edtCartaoKeyPress(Sender: TObject; var Key: Char);
    procedure edtCartaoExit(Sender: TObject);
    procedure edtPrazoExit(Sender: TObject);
    procedure edtChequeExit(Sender: TObject);
    procedure edtDinheiroExit(Sender: TObject);
    procedure pnlFinalizarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnFinalizarClick(Sender: TObject);
    procedure edtDinheiroKeyPress(Sender: TObject; var Key: Char);
    procedure edtFinalizarKeyPress(Sender: TObject; var Key: Char);
  private
    FFinalizar: Boolean;

    FGWCommerce: TGWCommerce;

    FPagamentos: TList<TPagamento>;

    function Exibir_Troco(): Double;
    function Formatar(AValor: Double): String;
    function Pegar_Valor(ASender: TObject): Double;

    procedure Ajustar_Panels();
    procedure Iniciar_Pagamento();
    procedure Validar();

  public
    procedure Exibir(AGWCommerce: TGWCommerce);

    property Finalizar: Boolean read FFinalizar;
    property Pagamentos: TList<TPagamento> read FPagamentos;
  end;

implementation

{$R *.dfm}

{ TViewPagamentoSelecao }

procedure TViewPagamentoSelecao.Ajustar_Panels;
begin
  pnl5.Left := pnlTotal.Left + pnlTotal.Width + 2;
  pnl6.Left := pnl5.Left;
  pnl7.Left := pnl5.Left;
  pnl8.Left := pnl5.Left;

  pnl9.Left  := pnl5.Left + pnl5.Width + 2;
  pnl10.Left := pnl9.Left;
  pnl11.Left := pnl9.Left;
  pnl12.Left := pnl9.Left;

  pnl2.Left        := pnl9.Left + pnl9.Width + 2;
  pnl3.Left        := pnl2.Left;
  pnlDinheiro.Left := pnl2.Left;
  pnlTroco.Left    := pnl2.Left;
end;

procedure TViewPagamentoSelecao.btnCancelarClick(Sender: TObject);
begin
  FFinalizar := False;
  Close();
end;

procedure TViewPagamentoSelecao.btnFinalizarClick(Sender: TObject);
begin
  Iniciar_Pagamento();
end;

procedure TViewPagamentoSelecao.edtCartaoExit(Sender: TObject);
var
  Achou: Boolean;

  Cartao: Double;

  I: Integer;

  Pagamento: TPagamento;

  Selecao: TViewPagamentoSelecaoCartao;

begin
  Achou  := False;
  Cartao := Pegar_Valor(Sender);

  for I := 0 to FPagamentos.Count -1 do
    if ((FPagamentos.Items[I].Cartao.Tipo = tcCredito) or (FPagamentos.Items[I].Cartao.Tipo = tcDebito)) then
    begin
      FPagamentos.Items[I].Cartao.Valor := Cartao;
      Achou                             := True;
      Break;
    end;

  if Cartao > 0 then
  begin
    Selecao := TViewPagamentoSelecaoCartao.Create(nil);
    try
      Selecao.Exibir();

      if Selecao.Cartao.Tipo <> tcNenhum then
      begin
        if Achou then
        begin
          FPagamentos.Items[I].Cartao.Tipo              := Selecao.Cartao.Tipo;
          FPagamentos.Items[I].Cartao.TipoBandeira      := Selecao.Cartao.TipoBandeira;
          FPagamentos.Items[I].Cartao.CodigoAutorizacao := Selecao.Cartao.CodigoAutorizacao;
          FPagamentos.Items[I].Cartao.Valor             := Cartao;

          if Selecao.Cartao.Tipo = tcCredito then
            FPagamentos.Items[I].Tipo := fpCartaoCredito
          else if Selecao.Cartao.Tipo = tcDebito then
            FPagamentos.Items[I].Tipo := fpCartaoDebito;
        end
        else
        begin
          Pagamento                          := TPagamento.Create();
          Pagamento.Cartao.Tipo              := Selecao.Cartao.Tipo;
          Pagamento.Cartao.TipoBandeira      := Selecao.Cartao.TipoBandeira;
          Pagamento.Cartao.CodigoAutorizacao := Selecao.Cartao.CodigoAutorizacao;
          Pagamento.Cartao.Valor             := Cartao;

          if Selecao.Cartao.Tipo = tcCredito then
            Pagamento.Tipo := fpCartaoCredito
          else if Selecao.Cartao.Tipo = tcDebito then
            Pagamento.Tipo := fpCartaoDebito;

          FPagamentos.Add(Pagamento);
        end;
      end;
    finally
      FreeAndNil(Selecao);
    end;
  end;

//  FPagamento.Cartao.Valor := Pegar_Valor(Sender);
  edtTroco.Text  := Formatar(Exibir_Troco());
end;

procedure TViewPagamentoSelecao.edtCartaoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not CharInSet(Key, ['0'..'9', #8, ',']) then
    Key := #0;
end;

procedure TViewPagamentoSelecao.edtChequeExit(Sender: TObject);
var
  Achou: Boolean;

  Cheque: Double;

  I: Integer;

  Pagamento: TPagamento;

begin
 Achou  := False;
 Cheque := Pegar_Valor(Sender);

 for I := 0 to FPagamentos.Count -1 do
   if FPagamentos.Items[I].Tipo = fpCheque then
   begin
     FPagamentos.Items[I].Cheque := Cheque;
     Achou                      := True;
     Break;
   end;

 if (Cheque > 0) and (not Achou) then
 begin
   Pagamento        := TPagamento.Create();
   Pagamento.Cheque := Cheque;
   Pagamento.Tipo   := fpCheque;
   FPagamentos.Add(Pagamento);
 end;

  edtTroco.Text := Formatar(Exibir_Troco());
end;

procedure TViewPagamentoSelecao.edtDinheiroExit(Sender: TObject);
var
  Achou: Boolean;

  Dinheiro: Double;

  I: Integer;

  Pagamento: TPagamento;

begin
  Achou    := False;
  Dinheiro := Pegar_Valor(Sender);

  for I := 0 to FPagamentos.Count - 1 do
    if FPagamentos.Items[I].Tipo = fpDinheiro then
    begin
      FPagamentos.Items[I].Dinheiro := Dinheiro;
      Achou                         := True;
      Break;
    end;

  if (Dinheiro > 0) and (not Achou) then
  begin
    Pagamento          := TPagamento.Create();
    Pagamento.Tipo     := fpDinheiro;
    Pagamento.Dinheiro := Dinheiro;
    FPagamentos.Add(Pagamento);
  end;
  edtTroco.Text := Formatar(Exibir_Troco());
end;

procedure TViewPagamentoSelecao.edtDinheiroKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
  begin
    edtDinheiroExit(Sender);
  end
  else if not CharInSet(Key, ['0'..'9', #8, ',']) then
    Key := #0;
end;

procedure TViewPagamentoSelecao.edtFinalizarKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
  begin
    edtCartao.SetFocus();
    Key := #0;
  end;
end;

procedure TViewPagamentoSelecao.edtPrazoExit(Sender: TObject);
var
  Achou: Boolean;

  Prazo: Double;

  I: Integer;

  Pagamento: TPagamento;

  Cliente: TViewConsultaCliente;

begin
  Achou := False;
  Prazo := Pegar_Valor(Sender);

  for I := 0 to FPagamentos.Count -1 do
    if (FPagamentos.Items[I].Tipo = fpCreditoLoja) then
    begin
      FPagamentos.Items[I].Prazo := Prazo;
      Achou                     := True;
      Break;
    end;

  FGWCommerce.Cliente.CodigoCliente := -1;

  if Prazo > 0 then
  begin
    Cliente := TViewConsultaCliente.Create(nil);
    try
      Cliente.Exibir(FGWCommerce.Emitente.Registro);
      FGWCommerce.Cliente.Cadastrado := Cliente.IdCliente > 0;

      if FGWCommerce.Cliente.Cadastrado then
      begin
        FGWCommerce.Cliente.CodigoCliente := Cliente.IdCliente;

        if Achou  then
          FPagamentos.Items[I].Prazo := Prazo
        else
        begin
          Pagamento       := TPagamento.Create();
          Pagamento.Tipo  := fpCreditoLoja;
          Pagamento.Prazo := Prazo;
          FPagamentos.Add(Pagamento)
        end;
      end;

    finally
      FreeAndNil(Cliente);
      edtTroco.Text := Formatar(Exibir_Troco());
    end;
  end;
end;

procedure TViewPagamentoSelecao.Exibir(AGWCommerce: TGWCommerce);
var
  I: Integer;

  Controle: TControl;

begin
  FFinalizar        := False;
  edtFinalizar.Left := -50;
  Arredondar_Controle(pnlCancelar);
  Arredondar_Controle(pnlFinalizar);
//  pnlBotoes.Top       := pnlValores.Top + pnlValores.Height + 5;
//  pnlBotoes.Left      := Screen.Width - pnlBotoes.Width - 5;
  CupomFiscal.Width   := Trunc((Screen.Width * 60) / 100);
  CupomFiscal.Caption := '';

  Definir_Titulo_Tela('(Pagamento)');
  Maximizar();

  for I := 0 to pnlValores.ControlCount -1 do
  begin
    Controle := pnlValores.Controls[I];

    if (Controle is TPanel) and (Controle.Tag = 0) then
    begin
      Controle.Width              := Trunc((Self.Width * 25) / 100);
      TPanel(Controle).BevelOuter := bvNone;
      TPanel(Controle).Color      := clWhite;
    end;
  end;

  Ajustar_Panels();
  FGWCommerce   := AGWCommerce;
  edtTotal.Text := Formatar(FGWCommerce.Venda.Total - FGWCommerce.Venda.Desconto);
  edtTroco.Text := Formatar(Exibir_Troco());
  ShowModal();
end;

function TViewPagamentoSelecao.Exibir_Troco: Double;
var
  Valor: Double;

  Pagamento: TPagamento;

begin
  Valor := 0;

  for Pagamento in FPagamentos do
    Valor := Valor + Pagamento.Prazo + Pagamento.Cheque + Pagamento.Dinheiro + Pagamento.Cartao.Valor;

  Result := Valor - FGWCommerce.Venda.Total + FGWCommerce.Venda.Desconto;
end;

function TViewPagamentoSelecao.Formatar(AValor: Double): String;
begin
  Result := FormatFloat('#,0.00', AValor);
end;

procedure TViewPagamentoSelecao.FormCreate(Sender: TObject);
begin
  FPagamentos := TList<TPagamento>.Create();
end;

procedure TViewPagamentoSelecao.FormDestroy(Sender: TObject);
begin
  while FPagamentos.Count > 0 do
  begin
    FPagamentos.Items[0].Free();
    FPagamentos.Delete(0);
  end;

  FPagamentos.Free();
end;

procedure TViewPagamentoSelecao.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    if ActiveControl.Name = edtDinheiro.Name then
      edtFinalizar.SetFocus()
    else if ActiveControl.Name = edtFinalizar.Name then
      btnFinalizarClick(Sender)     
    else
      Perform(Wm_NextDlgCtl, 0, 0);
  end;
end;

procedure TViewPagamentoSelecao.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
  begin
    FFinalizar := False;
    Close();
  end;
end;

procedure TViewPagamentoSelecao.FormShow(Sender: TObject);
begin
  CupomFiscal.Abrir_Cupom();
  CupomFiscal.Exibir_Venda(FGWCommerce);
  edtCartao.SetFocus();
end;

procedure TViewPagamentoSelecao.Iniciar_Pagamento;
begin
  try
    Validar();
    FFinalizar := True;
    Close();
  except on E: Exception do
  begin
    MessageDlg(Format('Erro: %s', [E.Message]), mtError, [mbOK], 0);
    edtCartao.SetFocus();
  end;
  end;
end;

function TViewPagamentoSelecao.Pegar_Valor(ASender: TObject): Double;
var
  Valor: Double;

begin
  Valor := 0;

  TryStrToFloat(TEdit(ASender).Text, Valor);

  Result := Valor;
end;

procedure TViewPagamentoSelecao.pnlFinalizarClick(Sender: TObject);
begin
  Iniciar_Pagamento();
end;

procedure TViewPagamentoSelecao.Validar;
var
  Valor: Double;

  Pagamento: TPagamento;

begin
  for Pagamento in FPagamentos do
    if (Pagamento.Prazo > 0) and (FGWCommerce.Cliente.CodigoCliente <= 0) then
      raise Exception.Create('A Forma de pagamento prazo foi informado mas o cliente não foi selecionado');

  Valor := 0;
  for Pagamento in FPagamentos do
    Valor := Valor + Pagamento.Dinheiro;

  if (Valor = 0) and (StrToFloat(edtTroco.Text) > 0) then
    raise Exception.Create('Não é permitido gerar troco com as formas de pagamento selecionadas.');

  Valor := 0;

  for Pagamento in FPagamentos do
    Valor := Valor + Pagamento.Cartao.Valor + Pagamento.Prazo + Pagamento.Cheque + Pagamento.Dinheiro;

  if Valor < (FGWCommerce.Venda.Total - FGWCommerce.Venda.Desconto) then
    raise Exception.Create('O total das formas de pagamento é menor que o total da venda.');
end;

end.
