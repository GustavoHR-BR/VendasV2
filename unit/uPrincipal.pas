unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, RpRave, RpBase, RpSystem,
  RpDefine, RpCon, RpConDS, RpRender, RpRenderPDF, Winapi.ShellAPI, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls;

type
  TfrmPrincipal = class(TForm)
    menu: TMainMenu;
    Cadastrar1: TMenuItem;
    Cliente1: TMenuItem;
    Produto1: TMenuItem;
    Pedidosdevenda1: TMenuItem;
    Nova1: TMenuItem;
    Relatrios1: TMenuItem;
    Vendas1: TMenuItem;
    Clientes1: TMenuItem;
    Produtos1: TMenuItem;
    procedure Cliente1Click(Sender: TObject);
    procedure Produto1Click(Sender: TObject);
    procedure Nova1Click(Sender: TObject);
    procedure Vendas1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Clientes1Click(Sender: TObject);
    procedure Produtos1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses uCadastrarCliente, uClientes, uDataModule, uFiltroCli, uFunctions,
  uProdutos, uCadastrarProduto, uVendas, uVendaReport, uCadastrarVenda,
  uClienteReport, uAdicionarItem, uFiltroPro, uProdutoReport;

procedure TfrmPrincipal.Cliente1Click(Sender: TObject);
begin
  Application.CreateForm(TfrmClientes, frmClientes);
  try
    frmClientes.ShowModal;
  finally
    FreeAndNil(frmClientes);
  end;
end;

procedure TfrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  abrirDados('cliente', false);
  abrirDados('produto', false);
  abrirDados('cidade', false);
  abrirDados('estado', false);
  abrirDados('item', false);
  abrirDados('venda', false);
  dm.SQLConn.Close;
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
  dm.SQLConn.Open;
  abrirDados('cliente', true);
  abrirDados('produto', true);
  abrirDados('cidade', true);
  abrirDados('estado', true);
  abrirDados('item', true);
  abrirDados('venda', true);
end;

procedure TfrmPrincipal.Nova1Click(Sender: TObject);
begin
  Application.CreateForm(Tfrmvendas, frmVendas);
  try
    frmVendas.ShowModal;
  finally
    FreeAndNil(frmVendas);
  end;
end;

procedure TfrmPrincipal.Produto1Click(Sender: TObject);
begin
  Application.CreateForm(TfrmProdutos, frmProdutos);
  try
    frmProdutos.ShowModal;
  finally
    FreeAndNil(frmProdutos);
  end;
end;

procedure TfrmPrincipal.Produtos1Click(Sender: TObject);
var
  arquivo_pdf: string;
begin
  if frmProdutoReport = nil then
    Application.CreateForm(TfrmProdutoReport, frmProdutoReport);

  dm.cdsProdutos.Filtered := false;
  frmProdutoReport.rvsProdutos.DefaultDest := rdFile;
  frmProdutoReport.rvsProdutos.DoNativeOutput := false;
  frmProdutoReport.rvsProdutos.RenderObject := frmVendaReport.rvRelVendasPDF;
  arquivo_pdf := ExtractFilePath(Application.ExeName) +
    'RELATORIO PRODUTOS.pdf';
  frmProdutoReport.rvsProdutos.OutputFileName := arquivo_pdf;
  frmProdutoReport.RvProject1.Execute;
  ShellExecute(0, nil, Pchar(arquivo_pdf), nil,
    Pchar(ExtractFilePath(Application.ExeName) + 'docs\relatorios\'),
    SW_NORMAL);

  FreeAndNil(frmProdutoReport);
end;

procedure TfrmPrincipal.Clientes1Click(Sender: TObject);
var
  arquivo_pdf: string;
begin
  if frmClienteReport = nil then
    Application.CreateForm(TfrmClienteReport, frmClienteReport);

  dm.cdsClientes.Filtered := false;
  frmClienteReport.rvsClientes.DefaultDest := rdFile;
  frmClienteReport.rvsClientes.DoNativeOutput := false;
  frmClienteReport.rvsClientes.RenderObject := frmVendaReport.rvRelVendasPDF;
  arquivo_pdf := ExtractFilePath(Application.ExeName) +
    'RELATORIO CLIENTES.pdf';
  frmClienteReport.rvsClientes.OutputFileName := arquivo_pdf;
  frmClienteReport.RvProject1.Execute;
  ShellExecute(0, nil, Pchar(arquivo_pdf), nil,
    Pchar(ExtractFilePath(Application.ExeName) + 'docs\relatorios\'),
    SW_NORMAL);

  FreeAndNil(frmProdutoReport);
end;

procedure TfrmPrincipal.Vendas1Click(Sender: TObject);
var
  arquivo_pdf: string;
begin
  if frmVendaReport = nil then
    Application.CreateForm(TfrmVendaReport, frmVendaReport);

  frmVendaReport.RvVendas.DataSet := dm.cdsVendas;
  frmVendaReport.RvItens.DataSet := dm.cdsItens;
  dm.cdsVendas.Filtered := false;
  dm.cdsItens.Filtered := false;
  frmVendaReport.rvsVENDAS.DefaultDest := rdFile;
  frmVendaReport.rvsVENDAS.DoNativeOutput := false;
  frmVendaReport.rvsVENDAS.RenderObject := frmVendaReport.rvRelVendasPDF;
  arquivo_pdf := ExtractFilePath(Application.ExeName) + 'RELATORIO VENDAS.pdf';
  frmVendaReport.rvsVENDAS.OutputFileName := arquivo_pdf;
  frmVendaReport.RvProject1.SetParam('titulo', 'Relatório de vendas');
  frmVendaReport.RvProject1.Execute;
  ShellExecute(0, nil, Pchar(arquivo_pdf), nil,
    Pchar(ExtractFilePath(Application.ExeName) + 'docs\relatorios\'),
    SW_NORMAL);

  FreeAndNil(frmCadastrarCliente);
end;

end.
