unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, RpRave, RpBase, RpSystem,
  RpDefine, RpCon, RpConDS, RpRender, RpRenderPDF, Winapi.ShellAPI;

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
    procedure Cliente1Click(Sender: TObject);
    procedure Produto1Click(Sender: TObject);
    procedure Nova1Click(Sender: TObject);
    procedure Vendas1Click(Sender: TObject);
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
  uProdutos, uCadastrarProduto, uVendas, uVendaReport;

procedure TfrmPrincipal.Cliente1Click(Sender: TObject);
begin
  Application.CreateForm(TfrmClientes, frmClientes);
  try
    frmClientes.ShowModal;
  finally
    FreeAndNil(frmClientes);
  end;
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

procedure TfrmPrincipal.Vendas1Click(Sender: TObject);
var
  arquivo_pdf: string;
begin
  frmVendaReport.rvsVENDAS.DefaultDest := rdFile;
  frmVendaReport.rvsVENDAS.DoNativeOutput := False;
  frmVendaReport.rvsVENDAS.RenderObject := frmVendaReport.rvRelVendasPDF;
  arquivo_pdf := ExtractFilePath(Application.ExeName) + 'RELATORIO  VENDAS.pdf';
  frmVendaReport.rvsVENDAS.OutputFileName := arquivo_pdf;
  frmVendaReport.RvProject1.Execute;
  ShellExecute(0, nil, Pchar(arquivo_pdf), nil,
    Pchar(ExtractFilePath(Application.ExeName) + 'docs\relatorios\'),
    SW_NORMAL);
end;

end.
