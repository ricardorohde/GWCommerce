program PDVGWCommerce;

uses
  madExcept,
  madLinkDisAsm,
  madListHardware,
  madListProcesses,
  madListModules,
  Vcl.Forms,
  System.SysUtils,
  Winapi.Windows,
  System.UITypes,
  Vcl.Dialogs,
  UViewPDV in 'View\UViewPDV.pas' {ViewPDV},
  UModelBase in 'Model\UModelBase.pas' {dmDados: TDataModule},
  UEstoque in 'Model\UEstoque.pas',
  UVenda in 'Model\UVenda.pas',
  UViewDesconto in 'View\UViewDesconto.pas' {ViewDesconto},
  UDesconto in 'Model\UDesconto.pas',
  UControllerEstoque in 'Controller\UControllerEstoque.pas',
  UGWCommerce in 'Controller\UGWCommerce.pas',
  UControllerVenda in 'Controller\UControllerVenda.pas',
  UViewBase in 'View\UViewBase.pas' {ViewBase},
  UViewOpcoes in 'View\UViewOpcoes.pas' {ViewOpcoes},
  UViewPagamentoSelecao in 'View\UViewPagamentoSelecao.pas' {ViewPagamentoSelecao},
  UPagamento in 'Model\UPagamento.pas',
  UModelNFCe in 'Model\UModelNFCe.pas' {dmNFCe: TDataModule},
  UEmitente in 'Model\UEmitente.pas',
  UViewConsultaCliente in 'View\UViewConsultaCliente.pas' {ViewConsultaCliente},
  UCliente in 'Model\UCliente.pas',
  UCartao in 'Model\UCartao.pas',
  UViewPagamentoSelecaoCartao in 'View\UViewPagamentoSelecaoCartao.pas' {ViewPagamentoSelecaoCartao},
  UViewGerenciarNotasFiscais in 'View\UViewGerenciarNotasFiscais.pas' {ViewGerenciarNotasFiscais},
  UViewEmitente in 'View\UViewEmitente.pas' {ViewEmitente},
  UViewConsultaPreco in 'View\UViewConsultaPreco.pas' {ViewConsultaPreco},
  UViewAviso in 'View\UViewAviso.pas' {ViewAviso},
  UViewSelecaoCertificado in 'View\UViewSelecaoCertificado.pas' {ViewSelecaoCertificado},
  uLkJSON in 'C:\Componentes\uLkJSON.pas',
  UControllerWebService in 'Controller\UControllerWebService.pas',
  UControllerWebServiceEstoque in 'Controller\UControllerWebServiceEstoque.pas',
  UControllerWebServiceCliente in 'Controller\UControllerWebServiceCliente.pas',
  UControllerWebServiceFuncionario in 'Controller\UControllerWebServiceFuncionario.pas',
  UViewFuncionarios in 'View\UViewFuncionarios.pas' {ViewFuncionarios},
  UViewIdentificarCliente in 'View\UViewIdentificarCliente.pas' {ViewIdentificarCliente},
  UControllerWebServiceEnvioNotas in 'Controller\UControllerWebServiceEnvioNotas.pas',
  UControllerWebServiceConsultaEnvioNota in 'Controller\UControllerWebServiceConsultaEnvioNota.pas',
  UViewEnvioNotasFiscais in 'View\UViewEnvioNotasFiscais.pas' {ViewEnvioNotasFiscais},
  UControllerArquivos in 'Controller\UControllerArquivos.pas';

{$R *.res}

var
  ViewEmitente: TViewEmitente;

procedure Integrar_Clientes();
var
  IntegracaoCliente: TControllerWebServiceCliente;

begin
  IntegracaoCliente := TControllerWebServiceCliente.Create(dmDados.cliConfiguracaoREGISTRO_EMITENTE.AsLargeInt);
  try
    dmDados.Abrir_Tabela_Cliente(dmDados.cliConfiguracaoREGISTRO_EMITENTE.AsLargeInt);
    IntegracaoCliente.Integrar();
  finally
    IntegracaoCliente.Free();
  end;
end;

procedure Integrar_Estoques();
var
  IntegracaoEstoque: TControllerWebServiceEstoque;

begin
  IntegracaoEstoque := TControllerWebServiceEstoque.Create(dmDados.cliConfiguracaoREGISTRO_EMITENTE.AsLargeInt);
  try
    dmDados.Abrir_Tabela_Estoque(dmDados.cliConfiguracaoREGISTRO_EMITENTE.AsLargeInt);
    IntegracaoEstoque.Integrar();
  finally
    IntegracaoEstoque.Free();
  end;
end;

procedure Integrar_Funcionarios();
var
  IntegracaoFuncionario: TControllerWebServiceFuncionario;

begin
  IntegracaoFuncionario := TControllerWebServiceFuncionario.Create(dmDados.cliConfiguracaoREGISTRO_EMITENTE.AsLargeInt);
  try
    dmDados.Abrir_Tabela_Funcionario(dmDados.cliConfiguracaoREGISTRO_EMITENTE.AsLargeInt);
    IntegracaoFuncionario.Integrar();
  finally
    IntegracaoFuncionario.Free();
  end;
end;

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;

  CreateMutex(nil, False, 'PDVGWCommerce');

  if GetLastError() = ERROR_ALREADY_EXISTS then
  begin
    MessageDlg('Este PDV já está sendo executado neste computador!', mtError, [mbOK], 0);
    Halt(0);
  end;

  Application.Title := 'PDVGWCommerce';
  Application.CreateForm(TdmDados, dmDados);

  if dmDados.cliEmitente.RecordCount = 0 then
  begin
    ViewEmitente := TViewEmitente.Create(nil);
    try
      ViewEmitente.Exibir(-1);
    finally
      FreeAndNil(ViewEmitente);
    end;

    dmDados.Abrir_Tabela_Emitente();
    if dmDados.cliEmitente.RecordCount = 0 then
    begin
      Messagedlg('É obrigatório cadastrar o emitente antes de iniciar a aplicação.', mtError, [mbOK], 0);
      Application.Terminate();
    end
    else
    begin
      Integrar_Estoques();
      Integrar_Clientes();
      Integrar_Funcionarios();
    end;
  end;

  Application.CreateForm(TViewPDV, ViewPDV);
  Application.CreateForm(TdmNFCe, dmNFCe);
  Application.Run;
end.
