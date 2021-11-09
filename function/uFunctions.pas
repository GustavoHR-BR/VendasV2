unit uFunctions;

interface

procedure threadBuscarCliente(busca: string);
procedure buscarCliente(orderBy: string);
procedure verificarOrdenacaoCliente;
procedure threadBuscarProduto(busca: string);
procedure buscarProduto(orderBy: string);
procedure verificarOrdenacaoProduto;
procedure threadBuscarVenda;
procedure buscarVenda(orderBy: string);
procedure verificarOrdenacaoVenda;
procedure buscarCidade;
procedure fechaBuscaCidade;
procedure abreBuscaCidade;
procedure buscarEnderecoCliente(id: Integer);
procedure abrirDados(tabela: string; estado: Boolean);
procedure calculaSubTotalItem;
procedure calculaAcrescimoItem;
procedure calculaDescontoItem;
procedure calculaTotalItem;
procedure calculaSubTotalVenda;
procedure calculaTotalVenda;
procedure atualizaEditEstoque;
procedure removeFormatacaoPrecoProduto;

var
  subTotalDaVenda, totalDaVenda, frete, totalDoItem, valDescontoItem,
    valAcrescimoItem, valUnitario, subTotalDoItem, desconto, acrescimo,
    descontoDoItem, acrescimoDoItem: Double;
  quantidadeDeProdutos: Integer;

implementation

uses
  System.Classes, System.SysUtils,
  uCadastrarCliente, uClientes, uDataModule, uFiltroCli, uPrincipal, uProdutos,
  uCadastrarProduto, uVendas, uCadastrarVenda, uVendaReport, uAdicionarItem, db;

procedure buscarCliente(orderBy: string);
begin
  dm.cdsClientes.Filtered := false;
  dm.cdsClientes.IndexFieldNames := orderBy;
end;

procedure threadBuscarCliente(busca: string);
var
  t: TThread;
begin
  t := TThread.CreateAnonymousThread(
    procedure
    begin
      dm.cdsClientes.Filtered := false;
      dm.cdsClientes.FilterOptions := [foCaseInsensitive];
      dm.cdsClientes.Filter := 'nome LIKE ' + QuotedStr('%' + busca + '%');
      dm.cdsClientes.Filtered := true;
    end);
  t.FreeOnTerminate := true;
  t.Start;
end;

procedure verificarOrdenacaoCliente;
begin
  case frmClientes.cbOrdenarPor.ItemIndex of
    0:
      buscarCliente('id');
    1:
      buscarCliente('nome');
    2:
      buscarCliente('telefone');
    3:
      buscarCliente('email');
    4:
      buscarCliente('data_nascimento');
  end;
end;

procedure verificarOrdenacaoProduto;
begin
  case frmProdutos.cbOrdenarPor.ItemIndex of
    0:
      buscarProduto('id');
    1:
      buscarProduto('nome');
    2:
      buscarProduto('preco');
    3:
      buscarProduto('descricao');
    4:
      buscarProduto('quantidade_estoque');
  end;
end;

procedure buscarProduto(orderBy: string);
begin
  dm.cdsProdutos.Filtered := false;
  dm.cdsProdutos.IndexFieldNames := orderBy;
end;

procedure threadBuscarProduto(busca: string);
var
  t: TThread;
begin
  t := TThread.CreateAnonymousThread(
    procedure
    begin
      dm.cdsProdutos.Filtered := false;
      dm.cdsProdutos.FilterOptions := [foCaseInsensitive];
      dm.cdsProdutos.Filter := 'nome LIKE ' + QuotedStr(busca + '%');
      dm.cdsProdutos.Filtered := true;
    end);
  t.FreeOnTerminate := true;
  t.Start;
end;

procedure buscarVenda(orderBy: string);
begin
  frmVendas.cdsVendas.Filtered := false;
  if orderBy = 'fk_cliente' then
    frmVendas.cdsVendas.IndexFieldNames := 'nome'
  else
    frmVendas.cdsVendas.IndexFieldNames := orderBy;
end;

procedure threadBuscarVenda;
var
  t: TThread;
begin
  t := TThread.CreateAnonymousThread(
    procedure
    begin
      frmVendas.cdsVendas.Filtered := false;
      frmVendas.cdsVendas.FilterOptions := [foCaseInsensitive];
      frmVendas.cdsVendas.Filter := ' nome LIKE ' +
        QuotedStr(LowerCase(Trim(frmVendas.edtBuscar.Text)) + '%');
      frmVendas.cdsVendas.Filtered := true;
    end);
  t.FreeOnTerminate := true;
  t.Start;
end;

procedure verificarOrdenacaoVenda;
begin
  case frmVendas.cbOrdenarPor.ItemIndex of
    0:
      buscarVenda('id');
    1:
      buscarVenda('fk_cliente');
    2:
      buscarVenda('total');
    3:
      buscarVenda('data');
  end;
end;

procedure buscarCidade;
var
  t: TThread;
begin
  t := TThread.CreateAnonymousThread(
    procedure
    begin
      dm.cdsCidades.Filtered := false;
      dm.cdsCidades.FilterOptions := [foCaseInsensitive];
      dm.cdsCidades.Filter := 'uf = ' +
        QuotedStr(UpperCase(Trim(frmCadastrarCliente.cboxEstados.Text))) +
        ' AND nome LIKE ' + QuotedStr(frmCadastrarCliente.edtCidade.Text + '%');
      dm.cdsCidades.Filtered := true;
    end);
  t.FreeOnTerminate := true;
  t.Start;
end;

procedure buscarEnderecoCliente(id: Integer);
begin
  dm.cdsClientes.Filtered := false;
  dm.cdsClientes.FilterOptions := [foCaseInsensitive];
  dm.cdsClientes.Filter := 'id = ' + IntToStr(id);
  dm.cdsClientes.Filtered := true;
  frmCadastrarCliente.cboxEstados.ItemIndex :=
    frmCadastrarCliente.cboxEstados.Items.IndexOf(dm.cdsEstadosuf.AsString);
  frmCadastrarCliente.edtCidade.Text := dm.cdsCidadesnome.AsString;
  frmCadastrarCliente.edtBairro.Text := dm.cdsClientesbairro.AsString;
  frmCadastrarCliente.edtRua.Text := dm.cdsClientesrua.AsString;
end;

procedure fechaBuscaCidade;
begin
  frmCadastrarCliente.gridCidades.Visible := false;
  frmCadastrarCliente.btnCancelarCidade.Visible := false;
end;

procedure abreBuscaCidade;
begin
  frmCadastrarCliente.gridCidades.Visible := true;
  frmCadastrarCliente.btnCancelarCidade.Visible := true;
end;

procedure abrirDados(tabela: string; estado: Boolean);
begin

  if tabela = 'cliente' then
  begin
    if estado = true then
    begin
      dm.cdsClientes.Open;
      dm.dSetClientes.Open;
    end
    else
    begin
      dm.cdsClientes.Close;
      dm.dSetClientes.Close;
    end;
  end
  else if tabela = 'produto' then
  begin
    if estado = true then
    begin
      dm.cdsProdutos.Open;
      dm.dSetProdutos.Open;
    end
    else
    begin
      dm.cdsProdutos.Close;
      dm.dSetProdutos.Close;
    end;
  end
  else if tabela = 'estado' then
  begin
    if estado = true then
    begin
      dm.cdsEstados.Open;
      dm.dSetEstados.Open;
    end
    else
    begin
      dm.cdsEstados.Close;
      dm.dSetEstados.Close;
    end;
  end
  else if tabela = 'cidade' then
  begin
    if estado = true then
    begin
      dm.cdsCidades.Open;
      dm.dSetCidades.Open;
    end
    else
    begin
      dm.cdsCidades.Close;
      dm.dSetCidades.Close;
    end;
  end
  else if tabela = 'item' then
  begin
    if estado = true then
    begin
      dm.cdsItens.Open;
      dm.dSetItens.Open;
    end
    else
    begin
      dm.cdsItens.Close;
      dm.dSetItens.Close;
    end;
  end
  else if tabela = 'venda' then
  begin
    if estado = true then
    begin
      dm.cdsVendas.Open;
      dm.dSetVendas.Open;
    end
    else
    begin
      dm.cdsVendas.Close;
      dm.dSetVendas.Close;
    end;
  end;
end;

procedure calculaSubTotalItem;
begin
  if frmAdicionarItem.edtQuantidade.Text = '' then
    frmAdicionarItem.edtQuantidade.Text := '1';

  quantidadeDeProdutos := StrToInt(frmAdicionarItem.edtQuantidade.Text);
  valUnitario := StrToFloat(frmAdicionarItem.edtValUnitario.Text);
  frmAdicionarItem.edtSubTotal.Text :=
    FloatToStr(quantidadeDeProdutos * valUnitario);
end;

procedure calculaAcrescimoItem;
begin
  if frmAdicionarItem.edtAcrescimo.Text = '' then
    frmAdicionarItem.edtAcrescimo.Text := '0';

  acrescimoDoItem := StrToFloat(frmAdicionarItem.edtAcrescimo.Text) / 100;
  frmAdicionarItem.edtValAcrescimo.Text :=
    FloatToStr(acrescimoDoItem * StrToFloat(frmAdicionarItem.edtSubTotal.Text));
end;

procedure calculaDescontoItem;
begin
  if frmAdicionarItem.edtDesconto.Text = '' then
    frmAdicionarItem.edtDesconto.Text := '0';

  descontoDoItem := StrToFloat(frmAdicionarItem.edtDesconto.Text) / 100;
  frmAdicionarItem.edtValDesconto.Text :=
    FloatToStr(descontoDoItem * StrToFloat(frmAdicionarItem.edtSubTotal.Text));
end;

procedure calculaTotalItem;
begin
  valAcrescimoItem := StrToFloat(frmAdicionarItem.edtValAcrescimo.Text);
  valDescontoItem := StrToFloat(frmAdicionarItem.edtValDesconto.Text);
  subTotalDoItem := StrToFloat(frmAdicionarItem.edtSubTotal.Text);
  frmAdicionarItem.edtValTotal.Text :=
    FloatToStr(valAcrescimoItem + subTotalDoItem - valDescontoItem);
end;

procedure calculaSubTotalVenda;
var
  diferenca: Double;
begin
  if frmCadastrarVenda.Tag = 4 then // adicionando algum item
  begin
    frmCadastrarVenda.edtSubtTotal.Text :=
      FloatToStr(StrToFloat(frmCadastrarVenda.edtSubtTotal.Text) +
      StrToFloat(frmAdicionarItem.edtValTotal.Text));
  end
  else if frmCadastrarVenda.Tag = 5 then // excluindo um item
  begin
    frmCadastrarVenda.edtSubtTotal.Text :=
      FloatToStr(StrToFloat(frmCadastrarVenda.edtSubtTotal.Text) -
      dm.cdsItensvalor_total.AsFloat);
  end
  else if frmCadastrarVenda.Tag = 3 then // editando um item
  begin
    if frmCadastrarVenda.DBGridItens.DataSource.DataSet.RecordCount = 0 then
      frmCadastrarVenda.edtSubtTotal.Text := '0'
    else
    begin
      diferenca := StrToInt(frmAdicionarItem.edtQuantidade.Text) -
        dm.cdsItensquantidade.AsInteger;

      frmCadastrarVenda.edtSubtTotal.Text :=
        FloatToStr(StrToFloat(frmCadastrarVenda.edtSubtTotal.Text) +
        (dm.cdsItenspreco.AsFloat * diferenca));
    end;
  end;
end;

procedure calculaTotalVenda;
var
  subTotal: Double;
begin
  if frmCadastrarVenda.edtDesconto.Text = '' then
    frmCadastrarVenda.edtDesconto.Text := '0'
  else if frmCadastrarVenda.edtAcrescimo.Text = '' then
    frmCadastrarVenda.edtAcrescimo.Text := '0'
  else if frmCadastrarVenda.edtFrete.Text = '' then
    frmCadastrarVenda.edtFrete.Text := '0';

  desconto := StrToFloat(frmCadastrarVenda.edtDesconto.Text) / 100;
  acrescimo := StrToFloat(frmCadastrarVenda.edtAcrescimo.Text) / 100;
  frete := StrToFloat(frmCadastrarVenda.edtFrete.Text);
  subTotal := StrToFloat(frmCadastrarVenda.edtSubtTotal.Text);
  frmCadastrarVenda.edtTotalVenda.Text :=
    FloatToStr(subTotal + frete + (subTotal * acrescimo) -
    (subTotal * desconto));
end;

procedure atualizaEditEstoque;
begin
  if frmAdicionarItem.edtQuantidade.Text = '' then
    frmAdicionarItem.edtQuantidade.Text := '0';

  if dm.cdsProdutosquantidade_estoque.AsInteger > 0 then
  begin
    frmAdicionarItem.edtEmEstoque.Text :=
      IntToStr(dm.cdsProdutosquantidade_estoque.AsInteger -
      StrToInt(frmAdicionarItem.edtQuantidade.Text));
  end;
end;

procedure removeFormatacaoPrecoProduto;
begin
  frmCadastrarProduto.dbEdtPreco.Text :=
    copy(frmCadastrarProduto.dbEdtPreco.Text, 4, 10);
  frmCadastrarProduto.dbEdtPreco.Text :=
    StringReplace(frmCadastrarProduto.dbEdtPreco.Text, '.', '', [rfReplaceAll]);
end;

end.
