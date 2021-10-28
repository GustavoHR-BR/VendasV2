unit uProdutoReport;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, RpDefine, RpRave, RpBase, RpSystem,
  RpCon, RpConDS, RpRender, RpRenderPDF;

type
  TfrmProdutoReport = class(TForm)
    RvProject1: TRvProject;
    rvsProdutos: TRvSystem;
    rvProdutos: TRvDataSetConnection;
    rvRelVendasPDF: TRvRenderPDF;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmProdutoReport: TfrmProdutoReport;

implementation

uses
  uDataModule, uPrincipal, uVendaReport;

{$R *.dfm}

end.
