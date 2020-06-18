unit ControlCupomFiscal;

interface

uses
  System.SysUtils, System.Classes, Vcl.Controls;

type
  TControlCupomFiscal = class(TControl)
  private
    { Private declarations }
  protected
    { Protected declarations }
  public
    { Public declarations }
  published
    { Published declarations }
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('GWCommerce', [TControlCupomFiscal]);
end;

end.
