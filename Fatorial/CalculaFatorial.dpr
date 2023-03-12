program CalculaFatorial;

uses
  Vcl.Forms,
  uPrincipal in 'uPrincipal.pas' {Form1},
  Fatorial in 'Fatorial.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
