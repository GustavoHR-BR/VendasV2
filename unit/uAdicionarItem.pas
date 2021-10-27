unit uAdicionarItem;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids;

type
  TfrmAdicionarItem = class(TForm)
    edtBuscar: TEdit;
    Label1: TLabel;
    dbgrid: TDBGrid;
    btnCancelarItem: TButton;
    edtQuantidade: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    edtValUnitario: TEdit;
    edtAcrescimo: TEdit;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    edtValAcrescimo: TEdit;
    edtDesconto: TEdit;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    edtValDesconto: TEdit;
    Label11: TLabel;
    edtSubTotal: TEdit;
    Label12: TLabel;
    edtValTotal: TEdit;
    btnFinalizar: TButton;
    btnCancelar: TButton;
    procedure FormShow(Sender: TObject);
    procedure edtBuscarClick(Sender: TObject);
    procedure edtBuscarChange(Sender: TObject);
    procedure dbgridCellClick(Column: TColumn);
    procedure edtQuantidadeChange(Sender: TObject);
    procedure btnFinalizarClick(Sender: TObject);
    procedure btnCancelarItemClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    passouAqui: Boolean;
    idDoItem: string;
  public
    { Public declarations }
  end;

var
  frmAdicionarItem: TfrmAdicionarItem;

implementation

uses
  uCadastrarCliente, uCadastrarProduto, uCadastrarVenda, uClientes, uDataModule,
  uFiltroCli, uFunctions, uPrincipal, uProdutos, uVendaReport, uVendas;

{$R *.dfm}

procedure TfrmAdicionarItem.btnCancelarItemClick(Sender: TObject);
begin
  edtBuscar.Clear;
  dbgrid.Visible := false;
  btnCancelarItem.Visible := false;
  edtQuantidade.Text := '1';
  edtValUnitario.Text := '0';
  edtAcrescimo.Text := '0';
  edtValAcrescimo.Text := '0';
  edtDesconto.Text := '0';
  edtValDesconto.Text := '0';
  edtSubTotal.Text := '0';
  edtValTotal.Text := '0';
  btnFinalizar.Enabled := false;
end;

procedure TfrmAdicionarItem.btnFinalizarClick(Sender: TObject);
begin
  dm.cdsItens.Edit;
  dm.cdsItensfk_produto.Text := dm.cdsProdutosid.Text;
  dm.cdsItensnome.Text := dm.cdsProdutosnome.Text;
  dm.cdsItenspreco.Text := dm.cdsProdutospreco.Text;
  dm.cdsItensdescricao.Text := dm.cdsProdutosdescricao.Text;
  dm.cdsItensquantidade.Text := edtQuantidade.Text;
  dm.cdsItens.Post;
  dm.cdsItens.ApplyUpdates(0);
  frmAdicionarItem.Close;
  Tag := 1;
end;

procedure TfrmAdicionarItem.dbgridCellClick(Column: TColumn);
begin
  edtBuscar.Text := dm.cdsProdutosnome.AsString;
  edtValUnitario.Text := dm.cdsProdutospreco.AsString;
  edtSubTotal.Text := dm.cdsProdutospreco.AsString;
  edtValTotal.Text := dm.cdsProdutospreco.AsString;
  dbgrid.Visible := false;
  btnCancelarItem.Visible := false;
  btnFinalizar.Enabled := true;
end;

procedure TfrmAdicionarItem.edtBuscarChange(Sender: TObject);
begin
  threadBuscarProduto(edtBuscar.Text);
  dbgrid.DataSource := dm.cdsProdutos.DataSource;
  Sleep(60);
end;

procedure TfrmAdicionarItem.edtBuscarClick(Sender: TObject);
begin
  btnCancelarItem.Visible := true;
  dbgrid.Visible := true;
  threadBuscarProduto(LowerCase(Trim(edtBuscar.Text)));
  Sleep(60);
end;

procedure TfrmAdicionarItem.edtQuantidadeChange(Sender: TObject);
begin
  if edtQuantidade.Text = '' then
  begin
    edtQuantidade.Text := '1';
    passouAqui := true;
  end
  else
  begin
    if passouAqui = true then
      edtQuantidade.Text := copy(edtQuantidade.Text, 0, 1);

    edtSubTotal.Text := FloatToStr(strtoFloat(edtQuantidade.Text) *
      strtoFloat(dm.cdsProdutospreco.Text));
  end;
end;

procedure TfrmAdicionarItem.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if Tag <> 1 then
  begin
    if Application.MessageBox('Deseja realmente fechar? O item será cancelado!',
      'Atenção', MB_YESNO + MB_ICONQUESTION) = mrYes then
    begin
      abrirDados('item', false);
      dm.cdsItens.CommandText := 'DELETE FROM item WHERE id = ' + idDoItem;
      try
        abrirDados('item', true);
      except
        on E: Exception do
      end;
      dbgrid.DataSource := dm.cdsItens.DataSource;
    end;
  end;
end;

procedure TfrmAdicionarItem.FormShow(Sender: TObject);
begin
  dm.SQLConn.Close;
  dm.SQLConn.Open;
  abrirDados('item', true);
  dm.cdsItens.Edit;
  dm.cdsItens.Append;
  dm.cdsItensid.AsInteger := frmCadastrarVenda.numeroDeItens;
  dm.cdsItensfk_venda.Text := dm.cdsVendasid.Text;
  dm.cdsItens.Post;
  dm.cdsItens.ApplyUpdates(0);
  abrirDados('item', false);
  dm.cdsItens.CommandText := 'SELECT * FROM item WHERE fk_venda = ' +
    dm.cdsVendasid.Text + ' ORDER BY id ASC;';
  abrirDados('item', true);
  dm.cdsItens.Last;
  dm.cdsItens.Edit;
  dm.cdsItensid.Text := dm.cdsItensid.Text;
  idDoItem := dm.cdsItensid.Text;
end;

end.
