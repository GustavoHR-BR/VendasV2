unit uAdicionarItem;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids,
  db;

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
    Label13: TLabel;
    edtEmEstoque: TEdit;
    procedure FormShow(Sender: TObject);
    procedure edtBuscarClick(Sender: TObject);
    procedure edtBuscarChange(Sender: TObject);
    procedure dbgridCellClick(Column: TColumn);
    procedure edtQuantidadeChange(Sender: TObject);
    procedure btnFinalizarClick(Sender: TObject);
    procedure btnCancelarItemClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtAcrescimoChange(Sender: TObject);
    procedure edtDescontoChange(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
  private
    //
  public
    idNovoItem, quantidadeBeforeEdit: integer;
  end;

var
  frmAdicionarItem: TfrmAdicionarItem;

implementation

uses
  uCadastrarCliente, uCadastrarProduto, uCadastrarVenda, uClientes, uDataModule,
  uFiltroCli, uFunctions, uPrincipal, uProdutos, uVendaReport, uVendas;

{$R *.dfm}

procedure TfrmAdicionarItem.btnCancelarClick(Sender: TObject);
begin
  frmAdicionarItem.Close;
end;

procedure TfrmAdicionarItem.btnCancelarItemClick(Sender: TObject);
begin
  edtBuscar.Clear;
  edtBuscar.SetFocus;
  dbgrid.Visible := false;
  btnCancelarItem.Visible := false;
  btnFinalizar.Enabled := false;
  edtEmEstoque.Text := '0';
  edtQuantidade.Text := '1';
  edtDesconto.Text := '0';
  edtAcrescimo.Text := '0';
end;

procedure TfrmAdicionarItem.btnFinalizarClick(Sender: TObject);
var
  diferenca: integer;
begin
  if (StrToInt(edtEmEstoque.Text) >= 0) AND
    (dm.cdsProdutosquantidade_estoque.AsInteger > 0) then
  begin
    if Application.MessageBox('Adicionar Item?', 'Confirmação',
      MB_YESNO + MB_ICONQUESTION) = mrYes then
    begin
      calculaSubTotalItem;
      calculaTotalItem;
      calculaSubTotalVenda;
      calculaTotalVenda;
      Tag := 1;

      if (dm.cdsItens.Locate('nome', edtBuscar.Text, [])) and
        dm.cdsItens.Locate('fk_venda', dm.cdsVendasid.Text, []) then
      // Já adicionado
      begin
        diferenca := StrToInt(edtQuantidade.Text) -
          dm.cdsItensquantidade.AsInteger;

        dm.cdsItens.Edit;
        dm.cdsItensquantidade.AsInteger := dm.cdsItensquantidade.AsInteger +
          diferenca;
        dm.cdsItensacrescimo.AsString := edtAcrescimo.Text;
        dm.cdsItensdesconto.AsString := edtDesconto.Text;
        dm.cdsItensvalor_total.AsFloat := StrTofloat(edtValTotal.Text);
      end
      else
      begin
        dm.cdsItens.Append;
        dm.cdsItens.Edit;
        dm.cdsItensid.Text := IntToStr(idNovoItem);
        dm.cdsItensfk_venda.AsInteger := dm.cdsVendasid.AsInteger;
        dm.cdsItensfk_produto.AsString := dm.cdsProdutosid.AsString;
        dm.cdsItensnome.AsString := dm.cdsProdutosnome.AsString;
        dm.cdsItenspreco.AsFloat := dm.cdsProdutospreco.AsFloat;
        dm.cdsItensdescricao.AsString := dm.cdsProdutosdescricao.AsString;
        dm.cdsItensquantidade.AsString := edtQuantidade.Text;
        dm.cdsItensacrescimo.AsString := edtAcrescimo.Text;
        dm.cdsItensdesconto.AsString := edtDesconto.Text;
        dm.cdsItensvalor_total.AsString := edtValTotal.Text;
      end;

      dm.cdsProdutos.Edit;
      dm.cdsProdutosquantidade_estoque.AsInteger :=
        dm.cdsProdutosquantidade_estoque.AsInteger -
        StrToInt(edtQuantidade.Text);

      try
        dm.cdsItens.Post;
        dm.cdsProdutos.Post;
      except
        on E: Exception do
          ShowMessage('Erro ao adicionar o item! ' + E.ToString);
      end;
      frmAdicionarItem.Close;
      frmCadastrarVenda.edtDesconto.Enabled := True;
      frmCadastrarVenda.edtAcrescimo.Enabled := True;
      frmCadastrarVenda.edtFrete.Enabled := True;
      frmCadastrarVenda.btnFinalizar.Enabled := True;
      frmCadastrarVenda.btnEditar.Enabled := True;
      frmCadastrarVenda.btnExcluir.Enabled := True;
    end
    else
      Abort;
  end
  else
  begin
    ShowMessage('Estoque insuficiente!');
    edtQuantidade.Text := '1';
    edtQuantidade.SetFocus;
  end;
end;

procedure TfrmAdicionarItem.dbgridCellClick(Column: TColumn);
begin
  edtBuscar.Text := dm.cdsProdutosnome.AsString;
  btnFinalizar.Enabled := True;
  dbgrid.Visible := false;
  btnCancelarItem.Visible := false;
  edtQuantidade.SetFocus;
  edtValUnitario.Text := dm.cdsProdutospreco.AsString;
  edtEmEstoque.Text := dm.cdsProdutosquantidade_estoque.AsString;
  atualizaEditEstoque;
  calculaSubTotalItem;
  calculaTotalItem;
end;

procedure TfrmAdicionarItem.edtBuscarChange(Sender: TObject);
begin
  dm.cdsProdutos.Filtered := false;
  dm.cdsProdutos.FilterOptions := [foCaseInsensitive];
  dm.cdsProdutos.Filter := 'nome LIKE ' + QuotedStr(Trim(edtBuscar.Text) + '%');
  dm.cdsProdutos.Filtered := True;
end;

procedure TfrmAdicionarItem.edtBuscarClick(Sender: TObject);
begin
  dbgrid.Visible := True;
  btnCancelarItem.Visible := True;
end;

procedure TfrmAdicionarItem.edtDescontoChange(Sender: TObject);
begin
  calculaDescontoItem;
  calculaSubTotalItem;
  calculaTotalItem;
end;

procedure TfrmAdicionarItem.edtAcrescimoChange(Sender: TObject);
begin
  calculaAcrescimoItem;
  calculaSubTotalItem;
  calculaTotalItem;
end;

procedure TfrmAdicionarItem.edtQuantidadeChange(Sender: TObject);
begin
  calculaSubTotalItem;
  calculaTotalItem;
  atualizaEditEstoque;
end;

procedure TfrmAdicionarItem.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if Tag <> 1 then
  begin
    if frmCadastrarVenda.Tag = 4 then
    // User está cancelando a adição de um item
    begin
      if Application.MessageBox
        ('Deseja realmente fechar? O item será cancelado!', 'Atenção',
        MB_YESNO + MB_ICONQUESTION) <> mrYes then
        Abort;
    end
    else if frmCadastrarVenda.Tag = 3 then
    // User está cancelando a edição de um item
    begin
      if Application.MessageBox
        ('Deseja realmente fechar? Qualquer alteração será descartada!',
        'Atenção', MB_YESNO + MB_ICONQUESTION) <> mrYes then
        Abort;
      dm.cdsProdutos.Edit;
      dm.cdsProdutosquantidade_estoque.AsInteger := quantidadeBeforeEdit;
    end;
  end;
end;

procedure TfrmAdicionarItem.FormShow(Sender: TObject);
begin
  if frmCadastrarVenda.Tag = 3 then // Editando um Item
  begin
    edtBuscar.Enabled := false;
    btnFinalizar.Caption := 'Editar';
    btnFinalizar.Enabled := True;
    edtBuscar.Text := dm.cdsItensnome.AsString;
    edtQuantidade.Text := dm.cdsItensquantidade.AsString;
    edtAcrescimo.Text := dm.cdsItensacrescimo.AsString;
    edtDesconto.Text := dm.cdsItensdesconto.AsString;
    edtValUnitario.Text := dm.cdsItenspreco.AsString;
    dm.cdsProdutos.Locate('id', dm.cdsItensfk_produto.Text, []);
    quantidadeBeforeEdit := dm.cdsProdutosquantidade_estoque.AsInteger;
    dm.cdsProdutos.Edit;
    dm.cdsProdutosquantidade_estoque.AsInteger :=
      dm.cdsProdutosquantidade_estoque.AsInteger +
      dm.cdsItensquantidade.AsInteger;

    atualizaEditEstoque;
  end
  else
  begin
    dm.cdsProdutos.Filtered := false;

    // Lista todos os itens
    dm.cdsItens.Filtered := false;

    // Busca último id
    dm.cdsItens.IndexFieldNames := 'id';
    dm.cdsItens.Last;
    idNovoItem := dm.cdsItensid.AsInteger + 1;

    // Filtra os itens para a venda em questão
    dm.cdsItens.Filtered := false;
    dm.cdsItens.FilterOptions := [foCaseInsensitive];
    dm.cdsItens.Filter := 'fk_venda = ' +
      QuotedStr(Trim(dm.cdsVendasid.AsString));
    dm.cdsItens.Filtered := True;
  end;
end;

end.
