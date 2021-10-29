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
    edtQuantidade.Text := '1';
    edtValUnitario.Text := '0';
    edtAcrescimo.Text := '0';
    edtValAcrescimo.Text := '0';
    edtDesconto.Text := '0';
    edtValDesconto.Text := '0';
    edtSubTotal.Text := '0';
    edtValTotal.Text := '0';
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
var
  novoEstoque, idDoProduto, qtdDeProdutosBeforeEdit: string;
  diferenca: Integer;
begin
  novoEstoque := IntToStr(dm.cdsProdutosquantidade_estoque.AsInteger -
    StrToInt(edtQuantidade.Text));
  if StrToInt(edtQuantidade.Text) > dm.cdsProdutosquantidade_estoque.AsInteger
  then
  begin
    ShowMessage('Quantidade inválida! Estoque insuficiente.');
    edtQuantidade.Text := '1';
    edtQuantidade.SetFocus;
  end
  else if StrToInt(edtQuantidade.Text) < 1 then
  begin
    ShowMessage('Valor inválido! A quantidade mínima é de 1 item.');
    edtQuantidade.Text := '1';
    edtQuantidade.SetFocus;
  end
  else if (StrToInt(edtAcrescimo.Text) < 0) OR
    (StrToInt(edtAcrescimo.Text) > 100) then
  begin
    ShowMessage('Acréscimo inválido!');
    edtAcrescimo.Text := '0';
    edtAcrescimo.SetFocus;
  end
  else if (StrToInt(edtDesconto.Text) < 0) OR (StrToInt(edtDesconto.Text) > 100)
  then
  begin
    ShowMessage('Desconto inválido!');
    edtDesconto.Text := '0';
    edtDesconto.SetFocus;
  end
  else if frmCadastrarVenda.Tag = 4 then // Adicionando Item a venda
  begin
    dm.cdsItens.Edit;
    dm.cdsItensfk_produto.Text := dm.cdsProdutosid.Text;
    dm.cdsItensnome.Text := dm.cdsProdutosnome.Text;
    dm.cdsItenspreco.Text := dm.cdsProdutospreco.Text;
    dm.cdsItensdescricao.Text := dm.cdsProdutosdescricao.Text;
    dm.cdsItensquantidade.Text := edtQuantidade.Text;
    dm.cdsItensacrescimo.AsInteger := StrToInt(edtAcrescimo.Text);
    dm.cdsItensdesconto.AsInteger := StrToInt(edtDesconto.Text);
    dm.cdsItensvalor_total.AsFloat := StrToFloat(edtValTotal.Text);
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
    qtdDeProdutosBeforeEdit := dm.cdsItensquantidade.Text;
    dm.cdsItens.Edit;
    dm.cdsItensquantidade.Text := edtQuantidade.Text;
    dm.cdsItensacrescimo.AsInteger := StrToInt(edtAcrescimo.Text);
    dm.cdsItensdesconto.AsInteger := StrToInt(edtDesconto.Text);
    dm.cdsItensvalor_total.AsFloat := StrToFloat(edtValTotal.Text);
    dm.cdsItens.Post;
    dm.cdsItens.ApplyUpdates(0);

    idDoProduto := dm.cdsItensfk_produto.AsString;
    if StrToInt(qtdDeProdutosBeforeEdit) > StrToInt(dm.cdsItensquantidade.Text)
    then
    begin
      diferenca := StrToInt(qtdDeProdutosBeforeEdit) -
        StrToInt(dm.cdsItensquantidade.Text);
      novoEstoque := IntToStr(dm.cdsProdutosquantidade_estoque.AsInteger +
        diferenca);
    end
    else
    begin
      diferenca := StrToInt(dm.cdsItensquantidade.Text) -
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
  edtBuscar.Text := dm.cdsProdutosnome.AsString;
  edtValUnitario.Text := dm.cdsProdutospreco.AsString;
  dbgrid.Visible := false;
  btnCancelarItem.Visible := false;
  btnFinalizar.Enabled := true;
  calculaSubTotalItem;
  calculaTotalItem;
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

procedure TfrmAdicionarItem.edtDescontoChange(Sender: TObject);
begin
  passouAqui := false;
  if edtDesconto.Text = '' then
  begin
    edtDesconto.Text := '0';
    passouAqui := true;
  end
  else
  begin
    if passouAqui = true then
    begin
      edtDesconto.Text := copy(edtDesconto.Text, 0, 1);
      passouAqui := false;
    end;

    calculaDescontoItem;
    calculaTotalItem;
  end;
end;

procedure TfrmAdicionarItem.edtAcrescimoChange(Sender: TObject);
begin
  passouAqui := false;
  if edtAcrescimo.Text = '' then
  begin
    edtAcrescimo.Text := '0';
    passouAqui := true;
  end
  else
  begin
    if passouAqui = true then
    begin
      edtAcrescimo.Text := copy(edtAcrescimo.Text, 0, 1);
      passouAqui := false;
    end;

    calculaAcrescimoItem;
    calculaTotalItem;
  end;
end;

procedure TfrmAdicionarItem.edtQuantidadeChange(Sender: TObject);
begin
  passouAqui := false;
  if edtQuantidade.Text = '' then
  begin
    edtQuantidade.Text := '1';
    passouAqui := true;
  end
  else
  begin
    if passouAqui = true then
    begin
      edtQuantidade.Text := copy(edtQuantidade.Text, 0, 1);
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
          dm.cdsVendasid.Text + ' ORDER BY id ASC;';
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
    idProduto := StrToInt(dm.cdsItensfk_produto.Text);

    abrirDados('produto', false);
    dm.cdsProdutos.CommandText := 'SELECT * FROM produto WHERE id = ' +
      IntToStr(idProduto);
    abrirDados('produto', true);
    estoqueAtual := dm.cdsProdutosquantidade_estoque.AsInteger;
    resetEstoque := dm.cdsProdutosquantidade_estoque.AsInteger +
      dm.cdsItensquantidade.AsInteger;
    abrirDados('produto', false);
    dm.cdsProdutos.CommandText := 'UPDATE produto SET quantidade_estoque = ' +
      IntToStr(resetEstoque) + ' WHERE id = ' + IntToStr(idProduto);
    try
      abrirDados('produto', true);
    except
      on E: Exception do
    end;

    btnFinalizar.Caption := 'Editar';
    btnFinalizar.Enabled := true;
    edtBuscar.Enabled := false;
    edtBuscar.Text := dm.cdsItensnome.Text;
    edtQuantidade.Text := dm.cdsItensquantidade.AsString;
    edtValUnitario.Text := dm.cdsItenspreco.AsString;
    edtAcrescimo.Text := dm.cdsItensacrescimo.AsString;
    edtDesconto.Text := dm.cdsItensdesconto.AsString;
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
    frmCadastrarVenda.idDoItem := dm.cdsItensid.Text;
  end;

end;

end.
