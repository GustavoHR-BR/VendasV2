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
procedure resetQuery;
procedure setaMesAtual(mes: Integer);
procedure setaMesSelected(mes: string);
procedure calculaResumoDoMesSelecionado(mes, ano: string);
procedure calculaMediaVendasAno(ano: string);
procedure calculaPorcentagens(ticketMedioDataAtual, ticketTotalDataAtual,
  totalVendasDataAtual, itensVendidosDataAtual: Real);

var
  subTotalDaVenda, totalDaVenda, frete, totalDoItem, valDescontoItem,
    valAcrescimoItem, valUnitario, subTotalDoItem, desconto, acrescimo,
    descontoDoItem, acrescimoDoItem: Double;
  quantidadeDeProdutos: Integer;

implementation

uses
  Winapi.Windows, Winapi.Messages, System.Classes, System.SysUtils,
  System.Variants, uCadastrarCliente, uClientes, uDataModule, uFiltroCli,
  uPrincipal, uProdutos, uCadastrarProduto, uVendas, uCadastrarVenda,
  uVendaReport, uAdicionarItem, db, uDashboard, Vcl.ExtCtrls;

procedure buscarCliente(orderBy: string);
begin
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
    frmCadastrarCliente.cboxEstados.Items.IndexOf(dm.cdsClientesuf.AsString);
  frmCadastrarCliente.edtCidade.Text := dm.cdsClientesnome_1.AsString;
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

procedure resetQuery;
begin
  abrirDados('cliente', false);
  dm.cdsClientes.CommandText := 'SELECT * FROM cliente c' +
    ' JOIN cidade cid ON cid.id = c.fk_cidade ' +
    ' JOIN estado e ON e.id = cid.fk_estado';
  abrirDados('cliente', true);
end;

procedure setaMesAtual(mes: Integer);
begin
  if mes = 01 then
    frmDashboard.cbMes.ItemIndex := 0
  else if mes = 02 then
    frmDashboard.cbMes.ItemIndex := 1
  else if mes = 03 then
    frmDashboard.cbMes.ItemIndex := 2
  else if mes = 04 then
    frmDashboard.cbMes.ItemIndex := 3
  else if mes = 05 then
    frmDashboard.cbMes.ItemIndex := 4
  else if mes = 06 then
    frmDashboard.cbMes.ItemIndex := 5
  else if mes = 07 then
    frmDashboard.cbMes.ItemIndex := 6
  else if mes = 08 then
    frmDashboard.cbMes.ItemIndex := 7
  else if mes = 09 then
    frmDashboard.cbMes.ItemIndex := 8
  else if mes = 10 then
    frmDashboard.cbMes.ItemIndex := 9
  else if mes = 11 then
    frmDashboard.cbMes.ItemIndex := 10
  else if mes = 12 then
    frmDashboard.cbMes.ItemIndex := 11;
end;

procedure setaMesSelected(mes: string);
begin
  if frmDashboard.cbMes.ItemIndex < 9 then
    calculaResumoDoMesSelecionado('0' + IntToStr(frmDashboard.cbMes.ItemIndex +
      1), frmDashboard.cbAno.Text)
  else
    calculaResumoDoMesSelecionado(IntToStr(frmDashboard.cbMes.ItemIndex + 1),
      frmDashboard.cbAno.Text);
end;

procedure calculaResumoDoMesSelecionado(mes, ano: string);
var
  i: Integer;
  total: Real;
begin
  dm.cdsVendas.Filtered := false;
  dm.cdsVendas.Filter := 'data LIKE ' + QuotedStr('%/' + mes + '/' + ano);
  dm.cdsVendas.Filtered := true;

  dm.cdsVendas.IndexFieldNames := 'id';
  dm.cdsVendas.First;
  dm.cdsItens.Filtered := false;
  dm.cdsItens.Filter := '';
  for i := 1 to dm.cdsVendas.RecordCount do
  begin
    if i = 1 then
    begin
      dm.cdsItens.Filter := dm.cdsItens.Filter + '(fk_venda = ' +
        IntToStr(dm.cdsVendasid.AsInteger) + ')';
      dm.cdsVendas.Next;
    end
    else
    begin
      dm.cdsItens.Filter := dm.cdsItens.Filter + ' OR (fk_venda = ' +
        IntToStr(dm.cdsVendasid.AsInteger) + ')';
      dm.cdsVendas.Next;
    end;
  end;
  dm.cdsItens.Filtered := true;

  // Seta filtro pra zerar itens
  if dm.cdsVendas.RecordCount = 0 then
  begin
    dm.cdsItens.Filter := 'id < 0';
  end;

  // Total de vendas
  frmDashboard.totalVendas.Caption := IntToStr(dm.cdsVendas.RecordCount);

  // Total de itens vendidos
  frmDashboard.totalItens.Caption := IntToStr(dm.cdsItens.RecordCount);

  // Ticket médio
  total := 0;
  dm.cdsVendas.First;
  for i := 1 to dm.cdsVendas.RecordCount do
  begin
    total := total + dm.cdsVendastotal.AsFloat;
    dm.cdsVendas.Next;
  end;

  // Ticket total
  frmDashboard.ticketTotal.Caption := FormatFloat('R$ #,,,,0.00', total);
  if dm.cdsVendas.RecordCount <> 0 then
  begin
    // Ticket médio
    total := total / dm.cdsVendas.RecordCount;
    frmDashboard.ticketMedio.Caption := FormatFloat('R$ #,,,,0.00', total);
  end
  else
    frmDashboard.ticketMedio.Caption := FormatFloat('R$ #,,,,0.00', 0);
end;

procedure calculaMediaVendasAno(ano: string);
begin
  dm.cdsVendas.Filtered := false;
  dm.cdsVendas.Filter := 'data LIKE ' + QuotedStr('%/%/' + ano);
  dm.cdsVendas.Filtered := true;
  frmDashboard.mediaVendas.Caption := FloatToStr(dm.cdsVendas.RecordCount / 12);
  // Limita 2 casas e add % ao valor
  frmDashboard.mediaVendas.Caption :=
    FormatFloat('#0.00', StrToFloat(frmDashboard.mediaVendas.Caption)) + '%';
end;

procedure calculaPorcentagens(ticketMedioDataAtual, ticketTotalDataAtual,
  totalVendasDataAtual, itensVendidosDataAtual: Real);
var
  ticketMedio, ticketTotal, totalVendas, itensVendidos: Real;
begin

  // ------------------------------------------------------ INÍCIO TICKET MÉDIO

  // Pega só os números
  frmDashboard.ticketMedio.Caption :=
    copy(frmDashboard.ticketMedio.Caption, 4, 10);
  // Tira o ponto da casa do milhar
  ticketMedio := StrToFloat(StringReplace(frmDashboard.ticketMedio.Caption,
    '.', '', []));

  // Tira o símbolo da procentagem
  frmDashboard.porcTickMedio.Caption :=
    StringReplace(frmDashboard.porcTickMedio.Caption, '%', '', []);

  // Calcula porcentagem
  if ticketMedio = 0 then
    frmDashboard.porcTickMedio.Caption := '0'
  else
    frmDashboard.porcTickMedio.Caption :=
      FloatToStr(100 - (((ticketMedio * 100) / ticketMedioDataAtual)));

  // Altera shape visivel
  if StrToFloat(frmDashboard.porcTickMedio.Caption) = 0 then
  begin
    frmDashboard.shapeTicketMedioBlue.Visible := true;
    frmDashboard.shapeTicketMedioRed.Visible := false;
    frmDashboard.shapeTicketMedioGreen.Visible := false;

    // Limita 2 casas e add % ao valor
    frmDashboard.porcTickMedio.Caption :=
      FormatFloat('#0.00', StrToFloat(frmDashboard.porcTickMedio.Caption));
    frmDashboard.porcTickMedio.Caption :=
      frmDashboard.porcTickMedio.Caption + '%';
  end
  else if StrToFloat(frmDashboard.porcTickMedio.Caption) < 0 then
  begin
    frmDashboard.shapeTicketMedioRed.Visible := true;
    frmDashboard.shapeTicketMedioGreen.Visible := false;
    frmDashboard.shapeTicketMedioBlue.Visible := false;

    // Limita 2 casas e add % ao valor
    frmDashboard.porcTickMedio.Caption :=
      FormatFloat('#0.00', StrToFloat(frmDashboard.porcTickMedio.Caption));
    frmDashboard.porcTickMedio.Caption :=
      frmDashboard.porcTickMedio.Caption + '%';
  end
  else
  begin
    frmDashboard.shapeTicketMedioGreen.Visible := true;
    frmDashboard.shapeTicketMedioBlue.Visible := false;
    frmDashboard.shapeTicketMedioRed.Visible := false;

    // Limita 2 casas e add % ao valor
    frmDashboard.porcTickMedio.Caption :=
      FormatFloat('#0.00', StrToFloat(frmDashboard.porcTickMedio.Caption));
    frmDashboard.porcTickMedio.Caption := '+' +
      frmDashboard.porcTickMedio.Caption + '%';
  end;

  // Volta formato monetário
  frmDashboard.ticketMedio.Caption := FormatFloat('R$ #,,,,0.00', ticketMedio);

  // --------------------------------------------------------- FIM TICKET MÉDIO

  // ------------------------------------------------------ INÍCIO TICKET TOTAL

  // Pega só os números
  frmDashboard.ticketTotal.Caption :=
    copy(frmDashboard.ticketTotal.Caption, 4, 10);
  // Tira o ponto da casa do milhar
  ticketTotal := StrToFloat(StringReplace(frmDashboard.ticketTotal.Caption,
    '.', '', []));

  // Tira o símbolo da procentagem
  frmDashboard.porcTickTotal.Caption :=
    StringReplace(frmDashboard.porcTickTotal.Caption, '%', '', []);

  // Calcula porcentagem
  if ticketTotal = 0 then
    frmDashboard.porcTickTotal.Caption := '0'
  else
    frmDashboard.porcTickTotal.Caption :=
      FloatToStr(100 - (((ticketTotal * 100) / ticketTotalDataAtual)));

  // Altera shape visivel
  if StrToFloat(frmDashboard.porcTickTotal.Caption) = 0 then
  begin
    frmDashboard.shapeTicketTotalBlue.Visible := true;
    frmDashboard.shapeTicketTotalRed.Visible := false;
    frmDashboard.shapeTicketTotalGreen.Visible := false;

    // Limita 2 casas e add % ao valor
    frmDashboard.porcTickTotal.Caption :=
      FormatFloat('#0.00', StrToFloat(frmDashboard.porcTickTotal.Caption));
    frmDashboard.porcTickTotal.Caption :=
      frmDashboard.porcTickTotal.Caption + '%';
  end
  else if StrToFloat(frmDashboard.porcTickTotal.Caption) < 0 then
  begin
    frmDashboard.shapeTicketTotalRed.Visible := true;
    frmDashboard.shapeTicketTotalGreen.Visible := false;
    frmDashboard.shapeTicketTotalBlue.Visible := false;

    // Limita 2 casas e add % ao valor
    frmDashboard.porcTickTotal.Caption :=
      FormatFloat('#0.00', StrToFloat(frmDashboard.porcTickTotal.Caption));
    frmDashboard.porcTickTotal.Caption :=
      frmDashboard.porcTickTotal.Caption + '%';
  end
  else
  begin
    frmDashboard.shapeTicketTotalGreen.Visible := true;
    frmDashboard.shapeTicketTotalBlue.Visible := false;
    frmDashboard.shapeTicketTotalRed.Visible := false;

    // Limita 2 casas e add % ao valor
    frmDashboard.porcTickTotal.Caption :=
      FormatFloat('#0.00', StrToFloat(frmDashboard.porcTickTotal.Caption));
    frmDashboard.porcTickTotal.Caption := '+' +
      frmDashboard.porcTickTotal.Caption + '%';
  end;

  // Volta formato monetário
  frmDashboard.ticketTotal.Caption := FormatFloat('R$ #,,,,0.00', ticketTotal);

  // --------------------------------------------------------- FIM TICKET TOTAL

  // --------------------------------------------------- INÍCIO TOTAL DE VENDAS

  totalVendas := StrToFloat(frmDashboard.totalVendas.Caption);

  // Calcula porcentagem
  if totalVendas = 0 then
    frmDashboard.porcTotalVendas.Caption := '0'
  else
    frmDashboard.porcTotalVendas.Caption :=
      FloatToStr(100 - (((totalVendas * 100) / totalVendasDataAtual)));

  // Altera shape visivel
  if StrToFloat(frmDashboard.porcTotalVendas.Caption) = 0 then
  begin
    frmDashboard.shapeTotalVendasBlue.Visible := true;
    frmDashboard.shapeTotalVendasRed.Visible := false;
    frmDashboard.shapeTotalVendasGreen.Visible := false;

    // Limita 2 casas e add % ao valor
    frmDashboard.porcTotalVendas.Caption :=
      FormatFloat('#0.00',
      StrToFloat(frmDashboard.porcTotalVendas.Caption)) + '%';
  end
  else if StrToFloat(frmDashboard.porcTotalVendas.Caption) < 0 then
  begin
    frmDashboard.shapeTotalVendasRed.Visible := true;
    frmDashboard.shapeTotalVendasGreen.Visible := false;
    frmDashboard.shapeTotalVendasBlue.Visible := false;

    // Limita 2 casas e add % ao valor
    frmDashboard.porcTotalVendas.Caption :=
      FormatFloat('#0.00',
      StrToFloat(frmDashboard.porcTotalVendas.Caption)) + '%';
  end
  else
  begin
    frmDashboard.shapeTotalVendasGreen.Visible := true;
    frmDashboard.shapeTotalVendasBlue.Visible := false;
    frmDashboard.shapeTotalVendasRed.Visible := false;

    // Limita 2 casas e add % ao valor
    frmDashboard.porcTotalVendas.Caption :=
      FormatFloat('#0.00', StrToFloat(frmDashboard.porcTotalVendas.Caption));
    frmDashboard.porcTotalVendas.Caption :=
      '+' + frmDashboard.porcTotalVendas.Caption + '%';
  end;

  // ------------------------------------------------------ FIM TOTAL DE VENDAS

  // ---------------------------------------------------- INÍCIO ITENS VENDIDOS

  itensVendidos := StrToFloat(frmDashboard.totalItens.Caption);

  // Calcula porcentagem
  if itensVendidos = 0 then
    frmDashboard.porcItensVendidos.Caption := '0'
  else
    frmDashboard.porcItensVendidos.Caption :=
      FloatToStr(100 - (((itensVendidos * 100) / itensVendidosDataAtual)));

  // Altera shape visivel
  if StrToFloat(frmDashboard.porcItensVendidos.Caption) = 0 then
  begin
    frmDashboard.shapeItensTotalBlue.Visible := true;
    frmDashboard.shapeItensTotalRed.Visible := false;
    frmDashboard.shapeItensTotalGreen.Visible := false;

    // Limita 2 casas e add % ao valor
    frmDashboard.porcItensVendidos.Caption :=
      FormatFloat('#0.00',
      StrToFloat(frmDashboard.porcItensVendidos.Caption)) + '%';
  end
  else if StrToFloat(frmDashboard.porcItensVendidos.Caption) < 0 then
  begin
    frmDashboard.shapeItensTotalRed.Visible := true;
    frmDashboard.shapeItensTotalGreen.Visible := false;
    frmDashboard.shapeItensTotalBlue.Visible := false;

    // Limita 2 casas e add % ao valor
    frmDashboard.porcItensVendidos.Caption :=
      FormatFloat('#0.00',
      StrToFloat(frmDashboard.porcItensVendidos.Caption)) + '%';
  end
  else
  begin
    frmDashboard.shapeItensTotalGreen.Visible := true;
    frmDashboard.shapeItensTotalBlue.Visible := false;
    frmDashboard.shapeItensTotalRed.Visible := false;

    // Limita 2 casas e add % ao valor
    frmDashboard.porcItensVendidos.Caption :=
      FormatFloat('#0.00', StrToFloat(frmDashboard.porcItensVendidos.Caption));
    frmDashboard.porcItensVendidos.Caption :=
      '+' + frmDashboard.porcItensVendidos.Caption + '%';
  end;

  // ------------------------------------------------------- FIM ITENS VENDIDOS
end;

end.
