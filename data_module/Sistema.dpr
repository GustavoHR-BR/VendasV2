program Sistema;

uses
  Vcl.Forms,
  uDataModule in 'uDataModule.pas' {dm: TDataModule},
  uCadastrarCliente in '..\unit\uCadastrarCliente.pas' {frmCadastrarCliente},
  uClientes in '..\unit\uClientes.pas' {frmClientes},
  uFiltroCli in '..\unit\uFiltroCli.pas' {Form1},
  uFunctions in '..\function\uFunctions.pas',
  uPrincipal in '..\unit\uPrincipal.pas' {frmPrincipal},
  uProdutos in '..\unit\uProdutos.pas' {frmProdutos},
  uCadastrarProduto in '..\unit\uCadastrarProduto.pas' {frmCadastrarProduto},
  uVendas in '..\unit\uVendas.pas' {frmVendas};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(Tdm, dm);
  Application.CreateForm(TfrmCadastrarCliente, frmCadastrarCliente);
  Application.CreateForm(TfrmClientes, frmClientes);
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmProdutos, frmProdutos);
  Application.CreateForm(TfrmCadastrarProduto, frmCadastrarProduto);
  Application.CreateForm(TfrmVendas, frmVendas);
  Application.Run;
end.
