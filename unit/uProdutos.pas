unit uProdutos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids;

type
  TfrmProdutos = class(TForm)
    Label1: TLabel;
    dbgrid: TDBGrid;
    btnAdicionar: TButton;
    btnEditar: TButton;
    btnSair: TButton;
    edtBuscar: TEdit;
    btnFiltrar: TButton;
    cbOrdenarPor: TComboBox;
    Label2: TLabel;
    procedure edtBuscarChange(Sender: TObject);
    procedure cbOrdenarPorSelect(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure btnAdicionarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmProdutos: TfrmProdutos;

implementation

{$R *.dfm}

uses uCadastrarCliente, uClientes, uDataModule, uFiltroCli, uFunctions,
  uPrincipal, uCadastrarProduto;

procedure TfrmProdutos.btnAdicionarClick(Sender: TObject);
begin
  Application.CreateForm(TfrmCadastrarProduto, frmCadastrarProduto);
  Tag := 1;
  dm.cdsProdutos.Append;
  try
    frmCadastrarProduto.ShowModal;
  finally
    FreeAndNil(frmCadastrarProduto);
  end;
end;

procedure TfrmProdutos.btnSairClick(Sender: TObject);
begin
  frmProdutos.Close;
end;

procedure TfrmProdutos.cbOrdenarPorSelect(Sender: TObject);
begin
  verificarOrdenacaoProduto;
end;

procedure TfrmProdutos.edtBuscarChange(Sender: TObject);
begin
  threadBuscarProduto;
  Sleep(60);
end;

end.
