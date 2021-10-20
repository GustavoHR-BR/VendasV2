program Sistema;

uses
  Vcl.Forms,
  uPrincipal in '..\unit\uPrincipal.pas' {frmPrincipal},
  uDataModule in 'uDataModule.pas' {DataModule1: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TDataModule1, DataModule1);
  Application.Run;
end.
