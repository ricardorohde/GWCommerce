unit UDesconto;

interface
  uses
    System.SysUtils, System.Classes, System.Generics.Collections, System.Math,

    Vcl.Forms,

    ACBrUtil,

    UViewDesconto, UModelBase, UViewAviso;

type
  TDesconto = class(TPersistent)
  private
    FValor: Double;

    procedure Gravar(AVenda: TObject);

  public
    constructor Create();

    procedure Aplicar(AVenda: TObject);

  published
    property Valor: Double read FValor write FValor;

  end;

implementation
uses
  UGWCommerce, UVenda;

{ TDesconto }

procedure TDesconto.Aplicar(AVenda: TObject);
var
  Rateou: Boolean;

  Desconto,
  Restante: Double;

  GWCommerce: TGWCommerce;

  Venda: TVenda;

  ViewAviso: TViewAviso;

  ViewDesconto: TViewDesconto;

begin
  GWCommerce := AVenda as TGWCommerce;

//  ViewAviso    := TViewAviso.Create(nil);
  ViewDesconto := TViewDesconto.Create(nil);
  try
    ViewDesconto.Exibir(GWCommerce.Venda.Total);

//    ViewAviso.Exibir('Calculando desconto.');
    if ViewDesconto.Desconto.ValorAplicado > 0 then
    begin
      ViewAviso := TViewAviso.Create(nil);
      try
        ViewAviso.Exibir('Calculando desconto.');
        Desconto := ViewDesconto.Desconto.ValorAplicado;

        //Aplica o desconto rateando para todos os itens
        while Desconto > 0 do
          for Venda in GWCommerce.Venda.Itens do
            if CompareValue(Venda.ValorBruto, Venda.Desconto.Valor) > 0.01 then
            begin
              Venda.Desconto.Valor := RoundABNT(Venda.Desconto.Valor + 0.01, -2);
              Desconto             := RoundABNT(Desconto - 0.01, -2);
            end;

        //Calcula e corrige os itens que tiveram desconto de 100%, não permitindo e aplicando
        //o minimo de 0.01 centavo.
        for Venda in GWCommerce.Venda.Itens do
        begin
          Desconto := RoundABNT(Venda.Desconto.Valor - Venda.ValorBruto, -2);

          if Desconto > 0 then
            Venda.Desconto.Valor := RoundABNT(Venda.Desconto.Valor - Desconto, -2)
          else if Desconto = 0 then
            Venda.Desconto.Valor := RoundABNT(Venda.Desconto.Valor - 0.01, -2);
        end;

        Desconto := 0;
        //Soma o desconto que foi rateado
        for Venda in GWCommerce.Venda.Itens do
          Desconto := RoundABNT(Desconto + Venda.Desconto.Valor, -2);

        //Tratar a diferença entre o total aplicado e o efetivado após rateio
        //Exemplo: aplicou-se 15,00 de desconto mas ao ratear o total foi 14,99
        Restante := RoundABNT(ViewDesconto.Desconto.ValorAplicado - Desconto, -2);
        if Restante > 0 then
        begin
          while Restante > 0 do
          begin
            Rateou := False;

            for Venda in GWCommerce.Venda.Itens do
              if RoundABNT(Venda.ValorBruto - Venda.Desconto.Valor, -2) >= 0.02 then
              begin
                Venda.Desconto.Valor := RoundABNT(Venda.Desconto.Valor + 0.01, -2);
                Restante             := RoundABNT(Restante - 0.01, -2);
                Rateou               := True;
                Break;
              end;

            if not Rateou then
              Restante := RoundABNT(Restante - 0.01, -2);
          end;
        end
        else if Restante < 0 then
        begin
          while Restante < 0 do
          begin
            Rateou := False;

            for Venda in GWCommerce.Venda.Itens do
              if RoundABNT(Venda.ValorBruto - Venda.Desconto.Valor, -2) >= 0.02 then
              begin
                Venda.Desconto.Valor := RoundABNT(Venda.Desconto.Valor - 0.01, -2);
                Restante             := RoundABNT(Restante + 0.01, -2);
                Rateou               := True;
                Break;
              end;

            if not Rateou then
              Restante := RoundABNT(Restante + 0.01, -2);
          end;
        end;

        Gravar(GWCommerce);
      finally
        FreeAndNil(ViewAviso);
      end;
    end;
  finally
//    FreeAndNil(ViewAviso);
    FreeAndNil(ViewDesconto);
  end;
end;

constructor TDesconto.Create;
begin
  Valor := 0;
end;

procedure TDesconto.Gravar(AVenda: TObject);
var
  GWCommerce: TGWCommerce;

  Venda: TVenda;

begin
  GWCommerce := AVenda as TGWCommerce;

  for Venda in GWCommerce.Venda.Itens do
  begin
    Venda.Filtrar_No_Banco(Format('MD5 = %s', [QuotedStr(Venda.MD5)]));

    if dmDados.cliVenda.RecordCount > 0 then
    begin
      dmDados.uptVenda.ParamByName('PDESCONTO').AsCurrency := Venda.Desconto.Valor;
      dmDados.uptVenda.ParamByName('PMD5').AsString        := Venda.MD5;
      dmDados.uptVenda.ExecSQL();
    end;

    dmDados.cliVenda.Filtered := False;
  end;
end;

initialization
  System.Classes.RegisterClass(TDesconto);

finalization
  System.Classes.UnRegisterClass(TDesconto);

end.
