unit UViewPDV;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Buttons, System.UITypes,

  ACBrUtil,

  UPanelCupomFiscal, UGWCommerce, UEstoque, UViewBase, UViewConsultaPreco;

type
  TViewPDV = class(TViewBase)
    pnlPesquisaItem: TPanel;
    pnlRodape: TPanel;
    pnlDisplayValores: TPanel;
    pnlRodapeEsquerdo1: TPanel;
    pnlFecharCupom: TPanel;
    Splitter1: TSplitter;
    pnlConsultarPreco: TPanel;
    Splitter2: TSplitter;
    pnlFecharDinheiro: TPanel;
    Splitter3: TSplitter;
    pnlDesconto: TPanel;
    Splitter4: TSplitter;
    pnlEsc: TPanel;
    cbbPesquisa: TComboBox;
    spl1: TSplitter;
    pnlIniciarVenda: TPanel;
    btnIniciarVenda: TSpeedButton;
    btnFecharCupom: TSpeedButton;
    btnConsultaPreco: TSpeedButton;
    btnFecharDinheiro: TSpeedButton;
    btnDesconto: TSpeedButton;
    btnEsc: TSpeedButton;
    pnlQuantidade: TPanel;
    lbl1: TLabel;
    edtItemQuantidade: TEdit;
    pnlPreco: TPanel;
    lbl2: TLabel;
    edtItemPrecoUnitario: TEdit;
    pnlTotalItem: TPanel;
    lbl3: TLabel;
    edtItemValorTotal: TEdit;
    pnlPreRodape: TPanel;
    CupomFiscal: TPanelCupomFiscal;
    spl2: TSplitter;
    pnlOpcoes: TPanel;
    btnOpcoes: TSpeedButton;
    spl3: TSplitter;
    pnlFinalizarVenda: TPanel;
    btnFinalizarVenda: TSpeedButton;
    spl4: TSplitter;
    pnlCancelarNotas: TPanel;
    btnCancelarNota: TSpeedButton;
    spl5: TSplitter;
    pnl1: TPanel;
    pnl2: TPanel;
    pnl3: TPanel;
    pnl4: TPanel;
    pnl5: TPanel;
    pnl6: TPanel;
    pnl7: TPanel;
    pnl8: TPanel;
    pnlIdentificarCliente: TPanel;
    spl6: TSplitter;
    btnIdentificarCliente: TSpeedButton;
    edtAbrirVendaViaLeitor: TEdit;
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure cbbPesquisaKeyPress(Sender: TObject; var Key: Char);
    procedure cbbPesquisaKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbbPesquisaChange(Sender: TObject);
    procedure btnIniciarVendaClick(Sender: TObject);
    procedure btnFecharDinheiroClick(Sender: TObject);
    procedure btnDescontoClick(Sender: TObject);
    procedure btnEscClick(Sender: TObject);
    procedure btnOpcoesClick(Sender: TObject);
    procedure btnFecharCupomClick(Sender: TObject);
    procedure btnConsultaPrecoClick(Sender: TObject);
    procedure btnCancelarNotaClick(Sender: TObject);
    procedure btnFinalizarVendaClick(Sender: TObject);
    procedure btnIdentificarClienteClick(Sender: TObject);
    procedure edtAbrirVendaViaLeitorKeyPress(Sender: TObject; var Key: Char);
    procedure edtAbrirVendaViaLeitorEnter(Sender: TObject);
  private
    { Private declarations }
    FGWCommerce: TGWCommerce;

    procedure Excluir_Item(ASender: TObject);
    procedure Ocultar_Barra_Tarefas(AOcultar: Boolean);
    procedure Lancar_Item();
    procedure Pegar_Fator_Multiplicador(ASender: TObject; AParametro: String);
    procedure Sair_Da_Aplicacao();

  public
    { Public declarations }
    procedure Limpar_Valores_Tela();
  end;

var
  ViewPDV: TViewPDV;

implementation
  uses
    UModelBase;

{$R *.dfm}

procedure TViewPDV.btnCancelarNotaClick(Sender: TObject);
begin
  FGWCommerce.Exibir_Venda_Para_Cancelar();
end;

procedure TViewPDV.btnConsultaPrecoClick(Sender: TObject);
var
  View: TViewConsultaPreco;

begin
  View := TViewConsultaPreco.Create(nil);
  try
     if not FGWCommerce.VendaIniciada then
       dmDados.Abrir_Tabela_Estoque(FGWCommerce.Emitente.Registro);

    View.Exibir(False);
  finally
    FreeAndNil(View);
  end;
end;

procedure TViewPDV.btnDescontoClick(Sender: TObject);
begin
  FGWCommerce.Aplicar_Desconto();
end;

procedure TViewPDV.btnEscClick(Sender: TObject);
begin
  Sair_Da_Aplicacao();
end;

procedure TViewPDV.btnFecharCupomClick(Sender: TObject);
begin
  FGWCommerce.Fechar_No_F3();
end;

procedure TViewPDV.btnFecharDinheiroClick(Sender: TObject);
begin
  FGWCommerce.Fechar_No_F7();
end;

procedure TViewPDV.btnFinalizarVendaClick(Sender: TObject);
begin
  FGWCommerce.Fechar_No_F12();
end;

procedure TViewPDV.btnIdentificarClienteClick(Sender: TObject);
begin
  FGWCommerce.Identificar_Cliente();
end;

procedure TViewPDV.btnIniciarVendaClick(Sender: TObject);
begin
  FGWCommerce.Iniciar();
end;

procedure TViewPDV.btnOpcoesClick(Sender: TObject);
begin
  FGWCommerce.Acessar_Opcoes();
end;

procedure TViewPDV.cbbPesquisaChange(Sender: TObject);
var
  ValorUnitario: Double;

  Estoque: TEstoque;

begin
  try
    FGWCommerce.Validar_Venda_Aberta();

    Estoque := FGWCommerce.Estoque.Pegar_Selecionado();

    if Estoque <> nil then
      ValorUnitario := Estoque.PrecoVenda
    else
      ValorUnitario := 0;

    edtItemQuantidade.Text    := FloatToStr(FGWCommerce.FatorMultiplicador);
    edtItemPrecoUnitario.Text := FormatFloat('#0.00', ValorUnitario);
    edtItemValorTotal.Text    := FormatFloat('#0.00', RoundABNT(FGWCommerce.FatorMultiplicador * ValorUnitario, -2));
  except on E: Exception do
    MessageDlg(Format('Erro: %s', [E.Message]), mtError, [mbOK], 0);
  end;
end;

procedure TViewPDV.cbbPesquisaKeyPress(Sender: TObject; var Key: Char);
var
  Esc: Boolean;

  Combo: TComboBox;

begin
  Combo := Sender as TComboBox;
  Esc   := Key = #27;

  if Esc then
  begin
    if Combo.DroppedDown then
      Combo.Text := ''
    else
      Sair_Da_Aplicacao();
  end
  else if Key = #13 then
    Lancar_Item();

  Combo.DroppedDown := (Combo.Items.Count > 0) and not Esc;
end;

procedure TViewPDV.cbbPesquisaKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_MULTIPLY: Pegar_Fator_Multiplicador(Sender, '*');
    VK_SUBTRACT: Excluir_Item(Sender);
  end;
end;

procedure TViewPDV.edtAbrirVendaViaLeitorEnter(Sender: TObject);
begin
  TEdit(Sender).Clear();
end;

procedure TViewPDV.edtAbrirVendaViaLeitorKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
    if not FGWCommerce.VendaIniciada then
    begin
      try
        FGWCommerce.Iniciar();
        cbbPesquisa.Text := TEdit(Sender).Text;
        cbbPesquisaKeyPress(cbbPesquisa, Key);
        cbbPesquisa.DroppedDown := False;
      except on Ex: Exception do
        MessageDlg(Format('Erro ao iniciar a venda: %s', [Ex.Message]), mtError, [mbOK], 0);
      end;
    end;
end;

procedure TViewPDV.Excluir_Item(ASender: TObject);
begin
  cbbPesquisa.DroppedDown := False;
  Pegar_Fator_Multiplicador(ASender, '-');

  try
    if TComboBox(ASender).Tag = 0 then
    begin
      FGWCommerce.Venda.Excluir_Item(Trunc(FGWCommerce.FatorMultiplicador));
      CupomFiscal.Exibir_Venda(FGWCommerce);
      FGWCommerce.FatorMultiplicador := 1;
    end;
  except on E: Exception do
    MessageDlg(Format('Erro: %s', [E.Message]), mtError, [mbOK], 0);
  end;
end;

procedure TViewPDV.FormCreate(Sender: TObject);
begin
  FGWCommerce := TGWCommerce.Create();
end;

procedure TViewPDV.FormDestroy(Sender: TObject);
begin
  FGWCommerce.Free();
end;

procedure TViewPDV.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_F2     : FGWCommerce.Iniciar();
    VK_F3     : FGWCommerce.Fechar_No_F3();
    VK_F4     : FGWCommerce.Identificar_Cliente();
    VK_F5     : btnConsultaPrecoClick(Sender);
    VK_F6     : FGWCommerce.Exibir_Venda_Para_Cancelar();
    VK_F7     : FGWCommerce.Fechar_No_F7();
    VK_F8     : FGWCommerce.Aplicar_Desconto();
    VK_F10    : FGWCommerce.Acessar_Opcoes();
    VK_F12    : FGWCommerce.Fechar_No_F12();
    VK_ESCAPE : begin
                  if (FGWCommerce.VendaIniciada and (ActiveControl.Name <> cbbPesquisa.Name)) or not FGWCommerce.VendaIniciada then
                    Sair_Da_Aplicacao();
                end;
  end;
end;

procedure TViewPDV.FormShow(Sender: TObject);
var
  I: Integer;

begin
  Maximizar();
  Ocultar_Barra_Tarefas(True);

  edtAbrirVendaViaLeitor.Left := -300;
  cbbPesquisa.Width           := Trunc((Self.Width * 60) / 100);
  pnlDisplayValores.Width     := Trunc((Self.Width * 35) / 100);
  CupomFiscal.Width           := Trunc((Self.Width * 60) / 100);
  pnl2.Width                  := edtItemQuantidade.Width;

  Arredondar_Controle(cbbPesquisa);
  Arredondar_Controle(edtItemQuantidade);
  Arredondar_Controle(edtItemPrecoUnitario);
  Arredondar_Controle(edtItemValorTotal);

  for I := 0 to pnlRodape.ControlCount -1 do
    if pnlRodape.Controls[I] is TPanel then
    begin
      if pnlRodape.Controls[I].Tag = 1 then
        TWinControl(pnlRodape.Controls[I]).Width := 90;

      Arredondar_Controle(TWinControl(pnlRodape.Controls[I]));
    end;

  CupomFiscal.Caption := '';

  if Screen.Width > 1366 then
    pnlRodapeEsquerdo1.Width := 180
  else
    pnlRodapeEsquerdo1.Width := Screen.Width - 100 - (12 * pnlIniciarVenda.Width) - (11 * Splitter1.Width);

  if pnlRodapeEsquerdo1.Width <= 0 then
    pnlRodapeEsquerdo1.Width := 25;

  Definir_Titulo_Tela('(Caixa)');
  Limpar_Valores_Tela();

  if (not FGWCommerce.VendaIniciada) and (FGWCommerce.Verificar_Tem_Venda_Pendente()) then
    begin
      FGWCommerce.Iniciar();
      FGWCommerce.Venda.Carregar(FGWCommerce.Emitente.Registro);
      CupomFiscal.Exibir_Venda(FGWCommerce);
      cbbPesquisa.SetFocus();
    end
  else
    edtAbrirVendaViaLeitor.SetFocus();
end;

procedure TViewPDV.Lancar_Item;
var
  ValorUnitario: Double;

  Estoque: TEstoque;

begin
  try
    FGWCommerce.Validar_Venda_Aberta();

    Estoque := FGWCommerce.Estoque.Pegar_Selecionado();

    if Estoque <> nil then
    begin
      if Estoque.LancamentoPorPeso.LancouPorPeso then
        FGWCommerce.FatorMultiplicador := (Estoque.LancamentoPorPeso.Total / 100) / Estoque.PrecoVenda;
      ValorUnitario := Estoque.PrecoVenda;
    end
    else
      ValorUnitario := 0;
    edtItemQuantidade.Text    := FloatToStr(FGWCommerce.FatorMultiplicador);
    edtItemPrecoUnitario.Text := FormatFloat('#0.00', ValorUnitario);
    edtItemValorTotal.Text    := FormatFloat('#0.00', RoundABNT(FGWCommerce.FatorMultiplicador * ValorUnitario, -2));
    FGWCommerce.Inserir_Item();
  except on Ex: Exception do
    MessageDlg(Format('Erro ao inserir o item na venda: %s', [Ex.Message]), mtError, [mbOK], 0);
  end;
end;

procedure TViewPDV.Limpar_Valores_Tela;
begin
  edtItemQuantidade.Text    := '0,00';
  edtItemPrecoUnitario.Text := edtItemQuantidade.Text;
  edtItemValorTotal.Text    := edtItemQuantidade.Text;
  cbbPesquisa.Text          := 'CAIXA LIVRE';
  cbbPesquisa.Color         := clSilver;
  cbbPesquisa.Enabled       := False;
  edtAbrirVendaViaLeitor.SetFocus();
end;

procedure TViewPDV.Ocultar_Barra_Tarefas(AOcultar: Boolean);
var
  Janela: HWND;

begin
  Janela := FindWindow('Shell_TrayWnd', nil);

  if Janela > 0 then
    if AOcultar then
      ShowWindow(Janela, SW_HIDE)
    else
      ShowWindow(Janela, SW_RESTORE)
end;

procedure TViewPDV.Pegar_Fator_Multiplicador(ASender: TObject; AParametro: String);
var
  Fator: Double;

  Combo: TComboBox;

begin
  try
    Combo     := ASender as TComboBox;
    Combo.Tag := 1;
    FGWCommerce.Validar_Venda_Aberta();
    Fator := 1;

    if (not TryStrToFloat(StringReplace(Combo.Text, AParametro, '', [rfReplaceAll]),
     Fator)) or (Fator <= 0) then
       raise Exception.Create('Valor informado incorreto para o item.');

    Combo.Tag                      := 0;
    FGWCommerce.FatorMultiplicador := Fator;
    Combo.Text                     := '';
    edtItemQuantidade.Text := FloatToStr(Fator);
  except on E: Exception do
    MessageDlg(Format('Erro: %s', [E.Message]), mtError, [mbOK], 0);
  end;
end;

procedure TViewPDV.Sair_Da_Aplicacao;
begin
  if Application.MessageBox('Deseja realmente fechar o sistema?', 'Confirme', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = ID_YES then
  begin
    Ocultar_Barra_Tarefas(False);
    Application.Terminate();
  end;
end;

end.
