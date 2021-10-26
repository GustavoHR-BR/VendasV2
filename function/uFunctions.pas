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
procedure buscarBairro;
procedure buscarRua;
procedure fechaBuscaCidade;
procedure fechaBuscaBairro;
procedure fechaBuscaRua;
procedure abreBuscaCidade;
procedure abreBuscaBairro;
procedure abreBuscaRua;
procedure buscarEnderecoCliente;
procedure abrirDados(tabela: string; estado: Boolean);

implementation

uses
  System.Classes, System.SysUtils,
  uCadastrarCliente, uClientes, uDataModule, uFiltroCli, uPrincipal, uProdutos,
  uCadastrarProduto, uVendas, uCadastrarVenda, uVendaReport, uAdicionarItem;

procedure buscarCliente(orderBy: string);
begin
  abrirDados('rua', false);
  abrirDados('cliente', false);
  dm.cdsRuas.CommandText := 'SELECT * FROM rua ORDER BY id ASC;';
  dm.cdsClientes.CommandText := 'SELECT * FROM cliente ORDER BY ' + orderBy
    + ' ASC;';
  abrirDados('rua', true);
  abrirDados('cliente', true);
end;

procedure threadBuscarCliente(busca: string);
var
  t: TThread;
begin
  t := TThread.CreateAnonymousThread(
    procedure
    begin
      abrirDados('cliente', false);
      dm.cdsClientes.CommandText := 'SELECT * FROM cliente WHERE nome LIKE "' +
        busca + '%" ORDER BY nome ASC;';
      abrirDados('cliente', true);

      TThread.Synchronize(nil,
        procedure
        begin
          frmClientes.dbgrid.DataSource := dm.dSourceClientes;
        end);
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

procedure buscarProduto(orderBy: string);
begin
  dm.SQLConn.Close;
  dm.SQLConn.Open;
  abrirDados('produto', false);
  dm.cdsProdutos.IndexFieldNames := orderBy;
  abrirDados('produto', true);
end;

procedure threadBuscarProduto(busca: string);
var
  t: TThread;
begin
  t := TThread.CreateAnonymousThread(
    procedure
    begin
      abrirDados('produto', false);
      dm.cdsProdutos.CommandText := 'SELECT * FROM produto WHERE nome LIKE "%' +
        busca + '%" ORDER BY nome ASC;';
      abrirDados('produto', true);

      TThread.Synchronize(nil,
        procedure
        begin
          frmProdutos.dbgrid.DataSource := dm.dSourceProdutos;
          frmAdicionarItem.dbgrid.DataSource := dm.dSourceProdutos;
        end);
    end);
  t.FreeOnTerminate := true;
  t.Start;
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

procedure buscarVenda(orderBy: string);
begin
  dm.SQLConn.Close;
  dm.SQLConn.Open;
  abrirDados('venda', false);
  if orderBy = 'fk_cliente' then
  begin
    dm.cdsVendas.CommandText := 'SELECT * FROM venda v JOIN cliente c ON ' +
      'c.id = v.fk_cliente ORDER BY c.nome ASC';
  end
  else
  begin
    dm.cdsVendas.CommandText := 'SELECT * FROM venda ORDER BY ' + orderBy;
  end;
  abrirDados('venda', true);
end;

procedure threadBuscarVenda;
var
  t: TThread;
begin
  t := TThread.CreateAnonymousThread(
    procedure
    begin
      abrirDados('venda', false);
      dm.cdsVendas.CommandText := 'SELECT * FROM venda v JOIN cliente c ' +
        ' ON v.fk_cliente = c.id WHERE c.nome LIKE "' +
        LowerCase(Trim(frmVendas.edtBuscar.Text)) + '%" ORDER BY c.id ASC;';
      abrirDados('venda', true);

      TThread.Synchronize(nil,
        procedure
        begin
          frmVendas.DBGridVendas.DataSource := dm.dSourceVendas;
        end);
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
      abrirDados('cidade', false);
      dm.cdsCidades.CommandText := 'SELECT * FROM cidade c JOIN estado e ON ' +
        'c.fk_estado = e.id WHERE (e.uf = "' +
        UpperCase(Trim(frmCadastrarCliente.cboxEstados.Text)) +
        '") AND (c.nome LIKE "' + frmCadastrarCliente.edtCidade.Text +
        '%") ORDER BY c.nome DESC;';
      dm.cdsCidadesnome.Text;
      abrirDados('cidade', true);

      TThread.Synchronize(nil,
        procedure
        begin
          frmCadastrarCliente.gridCidades.DataSource := dm.dSourceCidades;
        end);
    end);
  t.FreeOnTerminate := true;
  t.Start;
end;

procedure buscarBairro;
var
  t: TThread;
begin
  t := TThread.CreateAnonymousThread(
    procedure
    begin
      abrirDados('bairro', false);
      dm.cdsBairros.CommandText := 'SELECT * FROM bairro b JOIN cidade c ON ' +
        'b.fk_cidade = c.id JOIN estado e ON ' +
        'c.fk_estado = e.id WHERE (e.uf = "' +
        UpperCase(Trim(dm.cdsEstadosuf.AsString)) + '") AND (c.nome = "' +
        LowerCase(Trim(dm.cdsCidadesnome.AsString)) + '") AND (b.nome LIKE "' +
        LowerCase(Trim(frmCadastrarCliente.edtBairro.Text)) +
        '%") ORDER BY b.nome ASC;';
      abrirDados('bairro', true);

      TThread.Synchronize(nil,
        procedure
        begin
          frmCadastrarCliente.gridBairros.DataSource := dm.dSourceBairros;
        end);
    end);
  t.FreeOnTerminate := true;
  t.Start;
end;

procedure buscarRua;
var
  t: TThread;
begin
  t := TThread.CreateAnonymousThread(
    procedure
    begin
      abrirDados('rua', false);
      dm.cdsRuas.CommandText := 'SELECT * FROM rua r JOIN bairro b ON ' +
        'r.fk_bairro = b.id JOIN cidade c ON ' +
        'b.fk_cidade = c.id JOIN estado e ON ' +
        'c.fk_estado = e.id WHERE (e.uf = "' +
        UpperCase(Trim(dm.cdsEstadosuf.AsString)) + '") AND (c.nome = "' +
        LowerCase(Trim(dm.cdsCidadesnome.AsString)) + '") AND b.nome = "' +
        LowerCase(Trim(dm.cdsBairrosnome.AsString)) + '" AND r.nome LIKE "%' +
        LowerCase(Trim(frmCadastrarCliente.EdtRua.Text)) +
        '%" ORDER BY r.nome ASC;';
      abrirDados('rua', true);

      TThread.Synchronize(nil,
        procedure
        begin
          frmCadastrarCliente.gridRuas.DataSource := dm.dSourceRuas;
        end);
    end);
  t.FreeOnTerminate := true;
  t.Start;
end;

procedure buscarEnderecoCliente;
var
  t: TThread;
begin

  t := TThread.CreateAnonymousThread(
    procedure
    begin
      abrirDados('rua', false);

      dm.queryEnderecoCliente.Close;
      dm.queryEnderecoCliente.SQL.Text := 'SELECT e.uf, c.nome, b.nome, r.nome '
        + 'FROM rua r JOIN bairro b ON r.fk_bairro = b.id JOIN cidade c ON ' +
        'b.fk_cidade = c.id JOIN estado e ON c.fk_estado = e.id WHERE r.id = "'
        + dm.cdsClientesfk_rua.AsString + '"';

      dm.queryEnderecoCliente.Open;
      TThread.Synchronize(nil,
        procedure
        begin
          frmCadastrarCliente.cboxEstados.ItemIndex :=
            frmCadastrarCliente.cboxEstados.Items.IndexOf
            (dm.queryEnderecoCliente.Fields[0].AsString);
          frmCadastrarCliente.edtCidade.Text :=
            (dm.queryEnderecoCliente.Fields[1].AsString);
          frmCadastrarCliente.edtBairro.Text :=
            (dm.queryEnderecoCliente.Fields[2].AsString);
          frmCadastrarCliente.EdtRua.Text := (dm.queryEnderecoCliente.Fields[3]
            .AsString);

          abrirDados('rua', true);

        end);
    end);
  t.FreeOnTerminate := true;
  t.Start;
end;

procedure fechaBuscaCidade;
begin
  frmCadastrarCliente.gridCidades.Visible := false;
  frmCadastrarCliente.btnCancelarCidade.Visible := false;
end;

procedure fechaBuscaBairro;
begin
  frmCadastrarCliente.gridBairros.Visible := false;
  frmCadastrarCliente.btnCancelarBairro.Visible := false;
end;

procedure fechaBuscaRua;
begin
  frmCadastrarCliente.gridRuas.Visible := false;
  frmCadastrarCliente.btnCancelarRua.Visible := false;
end;

procedure abreBuscaCidade;
begin
  frmCadastrarCliente.gridCidades.Visible := true;
  frmCadastrarCliente.btnCancelarCidade.Visible := true;
end;

procedure abreBuscaBairro;
begin
  frmCadastrarCliente.gridBairros.Visible := true;
  frmCadastrarCliente.btnCancelarBairro.Visible := true;
end;

procedure abreBuscaRua;
begin
  frmCadastrarCliente.gridRuas.Visible := true;
  frmCadastrarCliente.btnCancelarRua.Visible := true;
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
  else if tabela = 'bairro' then
  begin
    if estado = true then
    begin
      dm.cdsBairros.Open;
      dm.dSetBairros.Open;
    end
    else
    begin
      dm.cdsBairros.Close;
      dm.dSetBairros.Close;
    end;
  end
  else if tabela = 'rua' then
  begin
    if estado = true then
    begin
      dm.cdsRuas.Open;
      dm.dSetRuas.Open;
    end
    else
    begin
      dm.cdsRuas.Close;
      dm.dSetRuas.Close;
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

end.
