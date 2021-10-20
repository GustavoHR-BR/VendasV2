program Sistema;

uses
  Vcl.Forms,
  uPrincipal in '..\unit\uPrincipal.pas' {frmPrincipal},
  uDataModule in 'uDataModule.pas' {dm: TDataModule},
  uCadastrarCliente in '..\unit\uCadastrarCliente.pas' {frmCadastrarCliente},
  uClientes in '..\unit\uClientes.pas' {frmClientes},
  uFiltroCli in '..\unit\uFiltroCli.pas' {Form1},
  uFunctions in '..\function\uFunctions.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(Tdm, dm);
  Application.CreateForm(TfrmCadastrarCliente, frmCadastrarCliente);
  Application.CreateForm(TfrmClientes, frmClientes);
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
