unit uClienteReport;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, RpDefine, RpRave, RpBase, RpSystem,
  RpCon, RpConDS, RpRender, RpRenderPDF;

type
  TfrmClienteReport = class(TForm)
    RvProject1: TRvProject;
    rvsClientes: TRvSystem;
    RvClientes: TRvDataSetConnection;
    rvRelClientesPDF: TRvRenderPDF;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmClienteReport: TfrmClienteReport;

implementation

uses
  uAdicionarItem, uCadastrarCliente, uCadastrarProduto, uCadastrarVenda,
  uClientes, uDataModule, uFiltroCli, uFiltroPro, uFunctions, uPrincipal,
  uProdutos, uVendaReport, uVendas;

{$R *.dfm}

end.
