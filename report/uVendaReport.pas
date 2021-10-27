unit uVendaReport;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, RpDefine, RpCon, RpConDS, RpRave,
  RpBase, RpSystem, RpRender, RpRenderPDF;

type
  TfrmVendaReport = class(TForm)
    RvProject1: TRvProject;
    rvsVENDAS: TRvSystem;
    RvVendas: TRvDataSetConnection;
    rvRelVendasPDF: TRvRenderPDF;
    RvItens: TRvDataSetConnection;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmVendaReport: TfrmVendaReport;

implementation

{$R *.dfm}

uses uCadastrarCliente, uCadastrarProduto, uClientes, uDataModule, uFiltroCli,
  uFunctions, uPrincipal, uProdutos, uVendas, uAdicionarItem, uCadastrarVenda;

end.
