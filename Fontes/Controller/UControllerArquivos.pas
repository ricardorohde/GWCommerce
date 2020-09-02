unit UControllerArquivos;

interface
  uses
    System.SysUtils, System.StrUtils;

type
  TControllerArquivos = class
  public
     procedure Gerar_Log(AConteudo: String; ANomeArquivo: String = '');

  end;

implementation

{ TControllerArquivos }

procedure TControllerArquivos.Gerar_Log(AConteudo, ANomeArquivo: String);
var
  NomeArquivo: String;

  Arquivo: TextFile;

begin
  try
    NomeArquivo := Format('%s\%s.log',
      [ExtractFilePath(ParamStr(0)), IfThen(Trim(ANomeArquivo) <> '', ANomeArquivo, FormatDateTime('ddMMyyyy', Now()))]);
    AssignFile(Arquivo, NomeArquivo);

    if FileExists(NomeArquivo) then
      Append(Arquivo)
    else
      Rewrite(Arquivo);

    WriteLn(Arquivo, AConteudo);
    Writeln(Arquivo, '');
    CloseFile(Arquivo);
  except
  end;
end;

end.
