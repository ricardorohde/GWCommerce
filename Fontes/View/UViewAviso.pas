unit UViewAviso;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.OleCtrls, SHDocVw, Vcl.ExtCtrls;

type
  TViewAviso = class(TForm)
    pnl1: TPanel;
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Exibir(AMensagem: String);
  end;

implementation

{$R *.dfm}

procedure TViewAviso.Exibir(AMensagem: String);
begin
  pnl1.Caption := Format('%s. Aguarde...', [AMensagem]);
  Show();
  BringToFront();
  Application.ProcessMessages();
end;

procedure TViewAviso.FormActivate(Sender: TObject);
begin
  Application.ProcessMessages();
end;

end.
