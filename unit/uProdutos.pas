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
    btnLimparFiltros: TButton;
    procedure edtBuscarChange(Sender: TObject);
    procedure cbOrdenarPorSelect(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure btnAdicionarClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnFiltrarClick(Sender: TObject);
    procedure btnLimparFiltrosClick(Sender: TObject);
  private
    { Private declarations }
  public
    id, nome, qtdEstoqueDe, qtdEstoqueAte, precoDe, precoAte, descricao,
      orderBy: string;
  end;

var
  frmProdutos: TfrmProdutos;

implementation

{$R *.dfm}

uses uCadastrarCliente, uClientes, uDataModule, uFiltroCli, uFunctions,
  uPrincipal, uCadastrarProduto, uAdicionarItem, uCadastrarVenda, uFiltroPro,
  uVendaReport, uVendas;

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

procedure TfrmProdutos.btnEditarClick(Sender: TObject);
begin
  Application.CreateForm(TfrmCadastrarProduto, frmCadastrarProduto);
  Tag := 2;
  try
    frmCadastrarProduto.ShowModal;
  finally
    FreeAndNil(frmCadastrarProduto);
  end;
end;

procedure TfrmProdutos.btnFiltrarClick(Sender: TObject);
begin
  Application.CreateForm(TfrmFiltrarPro, frmFiltrarPro);
  frmFiltrarPro.edtId.Text := id;
  frmFiltrarPro.edtNome.Text := nome;
  frmFiltrarPro.edtPrecoDe.Text := precoDe;
  frmFiltrarPro.edtPrecoAte.Text := precoAte;
  frmFiltrarPro.edtEstoqueDe.Text := qtdEstoqueDe;
  frmFiltrarPro.edtEstoqueAte.Text := qtdEstoqueAte;
  frmFiltrarPro.edtDescricao.Text := descricao;
  try
    frmFiltrarPro.ShowModal;
  finally
    FreeAndNil(frmFiltrarPro);
  end;
end;

procedure TfrmProdutos.btnLimparFiltrosClick(Sender: TObject);
begin
  id := '';
  nome := '';
  precoDe := '0';
  precoAte := '10000';
  qtdEstoqueDe := '0';
  qtdEstoqueAte := '10000';
  descricao := '';

  dm.cdsProdutos.Filtered := false;
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
  threadBuscarProduto(Trim(edtBuscar.Text));
  Sleep(60);
end;

procedure TfrmProdutos.FormShow(Sender: TObject);
begin
  dm.cdsProdutos.Filtered := false;

  precoDe := '0';
  precoAte := '10000';
  qtdEstoqueDe := '0';
  qtdEstoqueAte := '10000';

  if cbOrdenarPor.ItemIndex = 0 then
    orderBy := 'id'
  else if cbOrdenarPor.ItemIndex = 1 then
    orderBy := 'nome'
  else if cbOrdenarPor.ItemIndex = 2 then
    orderBy := 'preco'
  else if cbOrdenarPor.ItemIndex = 3 then
    orderBy := 'descricao'
  else if cbOrdenarPor.ItemIndex = 4 then
    orderBy := 'quantidade_estoque';
end;

end.
