program Sistema;

uses
  Vcl.Forms,
  uDataModule in 'uDataModule.pas' {dm: TDataModule},
  uCadastrarCliente in '..\unit\uCadastrarCliente.pas' {frmCadastrarCliente},
  uClientes in '..\unit\uClientes.pas' {frmClientes},
  uFiltroCli in '..\unit\uFiltroCli.pas' {frmFiltrosCli},
  uFunctions in '..\function\uFunctions.pas',
  uPrincipal in '..\unit\uPrincipal.pas' {frmPrincipal},
  uProdutos in '..\unit\uProdutos.pas' {frmProdutos},
  uCadastrarProduto in '..\unit\uCadastrarProduto.pas' {frmCadastrarProduto},
  uVendas in '..\unit\uVendas.pas' {frmVendas},
  uVendaReport in '..\report\uVendaReport.pas' {frmVendaReport},
  uCadastrarVenda in '..\unit\uCadastrarVenda.pas' {frmCadastrarVenda},
  uAdicionarItem in '..\unit\uAdicionarItem.pas' {frmAdicionarItem},
  uFiltroPro in '..\unit\uFiltroPro.pas' {frmFiltrarPro},
  uClienteReport in '..\report\uClienteReport.pas' {frmClienteReport};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(Tdm, dm);
  Application.CreateForm(TfrmCadastrarCliente, frmCadastrarCliente);
  Application.CreateForm(TfrmClientes, frmClientes);
  Application.CreateForm(TfrmFiltrosCli, frmFiltrosCli);
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmProdutos, frmProdutos);
  Application.CreateForm(TfrmCadastrarProduto, frmCadastrarProduto);
  Application.CreateForm(TfrmVendas, frmVendas);
  Application.CreateForm(TfrmVendaReport, frmVendaReport);
  Application.CreateForm(TfrmCadastrarVenda, frmCadastrarVenda);
  Application.CreateForm(TfrmAdicionarItem, frmAdicionarItem);
  Application.CreateForm(TfrmFiltrarPro, frmFiltrarPro);
  Application.CreateForm(TfrmClienteReport, frmClienteReport);
  Application.Run;
end.
