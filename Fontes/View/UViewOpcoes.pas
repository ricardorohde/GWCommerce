unit UViewOpcoes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,

  UViewBase, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons, UViewEmitente, UViewGerenciarNotasFiscais,
  UControllerWebServiceEstoque, UControllerWebServiceCliente, UControllerWebServiceFuncionario;

type
  TViewOpcoes = class(TViewBase)
    pnl1: TPanel;
    pnlAcessar: TPanel;
    rgOpcoes: TRadioGroup;
    btnAcessar: TSpeedButton;
    pnlCancelar: TPanel;
    btnCancelar: TSpeedButton;
    pnl2: TPanel;
    pnl3: TPanel;
    pnl4: TPanel;
    pnl5: TPanel;
    pnl6: TPanel;
    pnl7: TPanel;
    pnl8: TPanel;
    pnl9: TPanel;
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnAcessarClick(Sender: TObject);
  private
    { Private declarations }
    FGWCommerce: TObject;

    procedure Acessar_Emitente();
    procedure Acessar_Gerenciador_Notas();
    procedure Atualizar_Clientes();
    procedure Atualizar_Estoques();
    procedure Atualizar_Funcionarios();
    procedure Receber_Atualizacoes();

  public
    procedure Exibir(AGWCommerce: TObject);

  end;

implementation
uses
  UGWCommerce, UModelBase;

{$R *.dfm}

{ TViewOpcoes }

procedure TViewOpcoes.Acessar_Emitente;
var
  Emitente: TViewEmitente;

begin
  Emitente := TViewEmitente.Create(nil);
  try
    Emitente.Exibir(TGWCommerce(FGWCommerce).Emitente.Registro);
  finally
    FreeAndNil(Emitente);
  end;
end;

procedure TViewOpcoes.Acessar_Gerenciador_Notas;
var
  Gerenciador: TViewGerenciarNotasFiscais;

begin
   Gerenciador := TViewGerenciarNotasFiscais.Create(nil);
   try
     Gerenciador.Exibir(FGWCommerce, taEnviarOffLine);
   finally
     FreeAndNil(Gerenciador);
   end;
end;

procedure TViewOpcoes.Atualizar_Clientes;
var
  RecebeCliente: TControllerWebServiceCliente;

begin
  RecebeCliente := TControllerWebServiceCliente.Create(TGWCommerce(FGWCommerce).Emitente.Registro);
  try
    RecebeCliente.Integrar();
  finally
    RecebeCliente.Free();
  end;
end;

procedure TViewOpcoes.Atualizar_Estoques;
var
  RecebeEstoque: TControllerWebServiceEstoque;

begin
  RecebeEstoque := TControllerWebServiceEstoque.Create(TGWCommerce(FGWCommerce).Emitente.Registro);
  try
//    if TGWCommerce(FGWCommerce).Estoque.Lista.Count = 0 then
//      dmDados.Abrir_Tabela_Estoque(TGWCommerce(FGWCommerce).Emitente.Registro);

    RecebeEstoque.Integrar();
  finally
    RecebeEstoque.Free();
  end;
end;

procedure TViewOpcoes.Atualizar_Funcionarios;
var
  Funcionario: TControllerWebServiceFuncionario;

begin
  Funcionario := TControllerWebServiceFuncionario.Create(TGWCommerce(FGWCommerce).Emitente.Registro);
  try
    Funcionario.Integrar();
  finally
    Funcionario.Free();
  end;
end;

procedure TViewOpcoes.btnAcessarClick(Sender: TObject);
begin
  case rgOpcoes.ItemIndex of
    0: Acessar_Emitente();
    1: Acessar_Gerenciador_Notas();
    2: Receber_Atualizacoes();
  end;
end;

procedure TViewOpcoes.btnCancelarClick(Sender: TObject);
begin
  Close();
end;

procedure TViewOpcoes.Exibir(AGWCommerce: TObject);
begin
  Definir_Titulo_Tela('(Opções)');
  Arredondar_Controle(pnlAcessar);
  Arredondar_Controle(pnlCancelar);
  FGWCommerce        := AGWCommerce;
  rgOpcoes.ItemIndex := 0;
  ShowModal();
end;

procedure TViewOpcoes.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    Close();
end;

procedure TViewOpcoes.Receber_Atualizacoes;
begin
  Atualizar_Estoques();
  Atualizar_Clientes();
  Atualizar_Funcionarios();
end;

end.
