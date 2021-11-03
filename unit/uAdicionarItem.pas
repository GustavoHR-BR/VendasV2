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
    passouAqui: Boolean;
  public
    valAtualDoItem: Double;
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
  if frmCadastrarVenda.Tag = 4 then
  begin
    edtBuscar.SetFocus;
    edtBuscar.Clear;
    dbgrid.Visible := false;
    btnCancelarItem.Visible := false;
    edtEmEstoque.text := '';
    edtQuantidade.text := '1';
    edtValUnitario.text := '0';
    edtAcrescimo.text := '0';
    edtValAcrescimo.text := '0';
    edtDesconto.text := '0';
    edtValDesconto.text := '0';
    edtSubTotal.text := '0';
    edtValTotal.text := '0';
    btnFinalizar.Enabled := false;
  end
  else if frmCadastrarVenda.Tag = 3 then
  begin
    frmAdicionarItem.Close;
    Tag := 1;
  end;
end;

procedure TfrmAdicionarItem.btnCancelarItemClick(Sender: TObject);
begin
  edtBuscar.Clear;
  dbgrid.Visible := false;
  btnCancelarItem.Visible := false;
  edtEmEstoque.text := '';
  edtQuantidade.text := '1';
  edtValUnitario.text := '0';
  edtAcrescimo.text := '0';
  edtValAcrescimo.text := '0';
  edtDesconto.text := '0';
  edtValDesconto.text := '0';
  edtSubTotal.text := '0';
  edtValTotal.text := '0';
  btnFinalizar.Enabled := false;
end;

procedure TfrmAdicionarItem.btnFinalizarClick(Sender: TObject);
var
  novoEstoque, idDoProduto, qtdDeProdutosBeforeEdit: string;
  diferenca: Integer;
begin
  if frmCadastrarVenda.Tag = 3 then
  begin
    novoEstoque := dm.cdsItensquantidade.Text + IntToStr(dm.cdsProdutosquantidade_estoque.AsInteger -
    StrToInt(edtQuantidade.text));
  end;
  novoEstoque := IntToStr(dm.cdsProdutosquantidade_estoque.AsInteger -
    StrToInt(edtQuantidade.text));
  if (StrToInt(novoEstoque) + StrToInt(edtQuantidade.text)) > dm.cdsProdutosquantidade_estoque.AsInteger
  then
  begin
    ShowMessage('Quantidade inválida! Estoque insuficiente.');
    edtQuantidade.text := '1';
    edtQuantidade.SetFocus;
  end
  else if StrToInt(edtQuantidade.text) < 1 then
  begin
    ShowMessage('Valor inválido! A quantidade mínima é de 1 item.');
    edtQuantidade.text := '1';
    edtQuantidade.SetFocus;
  end
  else if (StrToInt(edtAcrescimo.text) < 0) OR
    (StrToInt(edtAcrescimo.text) > 100) then
  begin
    ShowMessage('Acréscimo inválido!');
    edtAcrescimo.text := '0';
    edtAcrescimo.SetFocus;
  end
  else if (StrToInt(edtDesconto.text) < 0) OR (StrToInt(edtDesconto.text) > 100)
  then
  begin
    ShowMessage('Desconto inválido!');
    edtDesconto.text := '0';
    edtDesconto.SetFocus;
  end
  else if frmCadastrarVenda.Tag = 4 then // Adicionando Item a venda
  begin
    dm.cdsItens.Edit;
    dm.cdsItensfk_produto.text := dm.cdsProdutosid.text;
    dm.cdsItensnome.text := dm.cdsProdutosnome.text;
    dm.cdsItenspreco.text := dm.cdsProdutospreco.text;
    dm.cdsItensdescricao.text := dm.cdsProdutosdescricao.text;
    dm.cdsItensquantidade.text := edtQuantidade.text;
    dm.cdsItensacrescimo.AsInteger := StrToInt(edtAcrescimo.text);
    dm.cdsItensdesconto.AsInteger := StrToInt(edtDesconto.text);
    dm.cdsItensvalor_total.AsFloat := StrToFloat(edtValTotal.text);
    dm.cdsItens.Post;
    dm.cdsItens.ApplyUpdates(0);
    frmCadastrarVenda.numeroDeItens := frmCadastrarVenda.numeroDeItens + 1;
    frmCadastrarVenda.btnFinalizar.Enabled := true;
    frmCadastrarVenda.edtDesconto.Enabled := true;
    frmCadastrarVenda.edtAcrescimo.Enabled := true;
    frmCadastrarVenda.edtFrete.Enabled := true;
    calculaSubTotalVenda;
    calculaTotalVenda;

    idDoProduto := dm.cdsProdutosid.AsString;
    abrirDados('produto', false);
    dm.cdsProdutos.CommandText := 'UPDATE produto SET quantidade_estoque = ' +
      novoEstoque + ' WHERE id = ' + idDoProduto;
    try
      abrirDados('produto', true);
    except
      on E: Exception do
    end;

    Tag := 1;
    frmAdicionarItem.Close;
  end
  else if frmCadastrarVenda.Tag = 3 then // Editando Item da venda
  begin
    qtdDeProdutosBeforeEdit := dm.cdsItensquantidade.text;
    dm.cdsItens.Edit;
    dm.cdsItensquantidade.text := edtQuantidade.text;
    dm.cdsItensacrescimo.AsInteger := StrToInt(edtAcrescimo.text);
    dm.cdsItensdesconto.AsInteger := StrToInt(edtDesconto.text);
    dm.cdsItensvalor_total.AsFloat := StrToFloat(edtValTotal.text);
    dm.cdsItens.Post;
    dm.cdsItens.ApplyUpdates(0);

    idDoProduto := dm.cdsItensfk_produto.AsString;
    if StrToInt(qtdDeProdutosBeforeEdit) > StrToInt(dm.cdsItensquantidade.text)
    then
    begin
      diferenca := StrToInt(qtdDeProdutosBeforeEdit) -
        StrToInt(dm.cdsItensquantidade.text);
      novoEstoque := IntToStr(dm.cdsProdutosquantidade_estoque.AsInteger +
        diferenca);
    end
    else
    begin
      diferenca := StrToInt(dm.cdsItensquantidade.text) -
        StrToInt(qtdDeProdutosBeforeEdit);
      novoEstoque := IntToStr(dm.cdsProdutosquantidade_estoque.AsInteger -
        diferenca);
    end;
    abrirDados('produto', false);
    dm.cdsProdutos.CommandText := 'UPDATE produto SET quantidade_estoque = ' +
      novoEstoque + ' WHERE id = ' + idDoProduto;
    try
      abrirDados('produto', true);
    except
      on E: Exception do
    end;
    calculaSubTotalVenda;
    calculaTotalVenda;

    Tag := 1;
    frmAdicionarItem.Close;
  end;

end;

procedure TfrmAdicionarItem.dbgridCellClick(Column: TColumn);
begin
  edtBuscar.text := dm.cdsProdutosnome.AsString;
  edtValUnitario.text := dm.cdsProdutospreco.AsString;
  edtEmEstoque.text := dm.cdsProdutosquantidade_estoque.AsString;
  dbgrid.Visible := false;
  btnCancelarItem.Visible := false;
  btnFinalizar.Enabled := true;
  calculaSubTotalItem;
  calculaTotalItem;
end;

procedure TfrmAdicionarItem.edtBuscarChange(Sender: TObject);
begin
  threadBuscarProduto(edtBuscar.text);
  dbgrid.DataSource := dm.cdsProdutos.DataSource;
  Sleep(60);
end;

procedure TfrmAdicionarItem.edtBuscarClick(Sender: TObject);
begin
  btnCancelarItem.Visible := true;
  dbgrid.Visible := true;
  threadBuscarProduto(LowerCase(Trim(edtBuscar.text)));
  Sleep(60);
end;

procedure TfrmAdicionarItem.edtDescontoChange(Sender: TObject);
begin
  passouAqui := false;
  if edtDesconto.text = '' then
  begin
    edtDesconto.text := '0';
    passouAqui := true;
  end
  else
  begin
    if passouAqui = true then
    begin
      edtDesconto.text := copy(edtDesconto.text, 0, 1);
      passouAqui := false;
    end;

    calculaDescontoItem;
    calculaTotalItem;
  end;
end;

procedure TfrmAdicionarItem.edtAcrescimoChange(Sender: TObject);
begin
  passouAqui := false;
  if edtAcrescimo.text = '' then
  begin
    edtAcrescimo.text := '0';
    passouAqui := true;
  end
  else
  begin
    if passouAqui = true then
    begin
      edtAcrescimo.text := copy(edtAcrescimo.text, 0, 1);
      passouAqui := false;
    end;

    calculaAcrescimoItem;
    calculaTotalItem;
  end;
end;

procedure TfrmAdicionarItem.edtQuantidadeChange(Sender: TObject);
begin
  passouAqui := false;
  if edtQuantidade.text = '' then
  begin
    edtQuantidade.text := '1';
    passouAqui := true;
  end
  else
  begin
    if passouAqui = true then
    begin
      edtQuantidade.text := copy(edtQuantidade.text, 0, 1);
      passouAqui := false;
    end;

    calculaSubTotalItem;
    calculaTotalItem;
  end;
end;

procedure TfrmAdicionarItem.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if Tag <> 1 then
  begin
    if frmCadastrarVenda.Tag = 4 then // User está cancelando adição de um item
    begin
      if Application.MessageBox
        ('Deseja realmente fechar? O item será cancelado!', 'Atenção',
        MB_YESNO + MB_ICONQUESTION) = mrYes then
      begin
        abrirDados('item', false);
        dm.cdsItens.CommandText := 'DELETE FROM item WHERE id = ' +
          frmCadastrarVenda.idDoItem;
        try
          abrirDados('item', true);
        except
          on E: Exception do
        end;
        dbgrid.DataSource := dm.cdsItens.DataSource;
      end;
    end
    else if frmCadastrarVenda.Tag = 3 then
    // User está cancelando edição de um item
    begin
      if Application.MessageBox
        ('Deseja realmente fechar? Qualquer alteração não será aplicada!',
        'Atenção', MB_YESNO + MB_ICONQUESTION) = mrYes then
      begin
        abrirDados('item', false);
        dm.cdsItens.CommandText := 'SELECT * FROM item WHERE fk_venda = ' +
          dm.cdsVendasid.text + ' ORDER BY id ASC;';
        abrirDados('item', true);
        dbgrid.DataSource := dm.cdsItens.DataSource;
      end;
    end;
  end;
end;

procedure TfrmAdicionarItem.FormShow(Sender: TObject);
var
  resetEstoque, idProduto, estoqueAtual: Integer;
begin
  if frmCadastrarVenda.Tag = 3 then // Editando item
  begin
//    idProduto := StrToInt(dm.cdsItensfk_produto.text);
//
//    abrirDados('produto', false);
//    dm.cdsProdutos.CommandText := 'SELECT * FROM produto WHERE id = ' +
//      IntToStr(idProduto);
//    abrirDados('produto', true);
//    estoqueAtual := dm.cdsProdutosquantidade_estoque.AsInteger;
//    resetEstoque := dm.cdsProdutosquantidade_estoque.AsInteger +
//      dm.cdsItensquantidade.AsInteger;
//    abrirDados('produto', false);
//    dm.cdsProdutos.CommandText := 'UPDATE produto SET quantidade_estoque = ' +
//      IntToStr(resetEstoque) + ' WHERE id = ' + IntToStr(idProduto);
//    try
//      abrirDados('produto', true);
//    except
//      on E: Exception do
//    end;

    btnFinalizar.Caption := 'Editar';
    btnFinalizar.Enabled := true;
    edtBuscar.Enabled := false;
    edtBuscar.text := dm.cdsItensnome.text;
    edtEmEstoque.Text := dm.cdsProdutosquantidade_estoque.AsString;
    edtQuantidade.text := dm.cdsItensquantidade.AsString;
    edtValUnitario.text := dm.cdsItenspreco.AsString;
    edtAcrescimo.text := dm.cdsItensacrescimo.AsString;
    edtDesconto.text := dm.cdsItensdesconto.AsString;
    valAtualDoItem := dm.cdsItensvalor_total.AsFloat;
    calculaSubTotalItem;
    calculaAcrescimoItem;
    calculaDescontoItem;
    calculaTotalItem;
  end
  else if frmCadastrarVenda.Tag = 4 then // Adicionando novo item
  begin
    dm.SQLConn.Close;
    dm.SQLConn.Open;
    abrirDados('item', true);
    dm.cdsItens.Edit;
    dm.cdsItens.Append;
    dm.cdsItensid.AsInteger := frmCadastrarVenda.numeroDeItens;
    dm.cdsItensfk_venda.text := dm.cdsVendasid.text;
    dm.cdsItens.Post;
    dm.cdsItens.ApplyUpdates(0);
    abrirDados('item', false);
    dm.cdsItens.CommandText := 'SELECT * FROM item WHERE fk_venda = ' +
      dm.cdsVendasid.text + ' ORDER BY id ASC;';
    abrirDados('item', true);
    dm.cdsItens.Last;
    dm.cdsItens.Edit;
    dm.cdsItensid.text := dm.cdsItensid.text;
    frmCadastrarVenda.idDoItem := dm.cdsItensid.text;
  end;

end;

end.
