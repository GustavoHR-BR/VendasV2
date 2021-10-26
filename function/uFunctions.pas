unit uFunctions;

interface

procedure threadBuscarCliente(busca: string);
procedure buscarCliente(orderBy: string);
procedure verificarOrdenacaoCliente;
procedure threadBuscarProduto;
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

implementation

uses
  System.Classes, System.SysUtils,
  uCadastrarCliente, uClientes, uDataModule, uFiltroCli, uPrincipal, uProdutos,
  uCadastrarProduto, uVendas, uCadastrarVenda, uVendaReport;

procedure buscarCliente(orderBy: string);
begin
  dm.dSetRuas.Close;
  dm.cdsRuas.Close;
  dm.dSetClientes.Close;
  dm.cdsClientes.Close;
  dm.dSetRuas.CommandText := 'SELECT * FROM rua ORDER BY id ASC;';
  dm.dSetClientes.CommandText := 'SELECT * FROM cliente ORDER BY ' + orderBy
    + ' ASC;';
  dm.cdsRuas.Open;
  dm.dSetRuas.Open;
  dm.cdsClientes.Open;
  dm.dSetClientes.Open;
end;

procedure threadBuscarCliente(busca: string);
var
  t: TThread;
begin
  t := TThread.CreateAnonymousThread(
    procedure
    begin
      dm.dSetClientes.Close;
      dm.cdsClientes.Close;
      dm.cdsClientes.CommandText := 'SELECT * FROM cliente WHERE nome LIKE "' +
        busca + '%" ORDER BY nome ASC;';
      dm.cdsClientes.Open;
      dm.dSetClientes.Open;

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
  dm.dSetProdutos.Close;
  dm.cdsProdutos.Close;
  dm.cdsProdutos.IndexFieldNames := orderBy;
  dm.dSetProdutos.Open;
  dm.cdsProdutos.Open;
end;

procedure threadBuscarProduto;
var
  t: TThread;
begin
  t := TThread.CreateAnonymousThread(
    procedure
    begin
      dm.dSetProdutos.Close;
      dm.cdsProdutos.Close;
      dm.dSetProdutos.CommandText := 'SELECT * FROM produto WHERE nome LIKE "%'
        + LowerCase(Trim(frmProdutos.edtBuscar.Text)) + '%" ORDER BY nome ASC;';
      dm.dSetProdutos.Open;
      dm.cdsProdutos.Open;

      TThread.Synchronize(nil,
        procedure
        begin
          frmProdutos.dbgrid.DataSource := dm.dSourceProdutos;
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
  dm.dSetVendas.Close;
  dm.cdsVendas.Close;
  // dm.cdsVendas.IndexFieldNames := orderBy;
  if orderBy = 'fk_cliente' then
  begin
    dm.dSetVendas.CommandText := 'SELECT * FROM venda v JOIN cliente c ON ' +
      'c.id = v.fk_cliente ORDER BY c.nome ASC';
  end
  else
  begin
    dm.dSetVendas.CommandText := 'SELECT * FROM venda ORDER BY ' + orderBy;
  end;
  dm.dSetVendas.Open;
  dm.cdsVendas.Open;
end;

procedure threadBuscarVenda;
var
  t: TThread;
begin
  t := TThread.CreateAnonymousThread(
    procedure
    begin
      dm.dSetVendas.Close;
      dm.cdsVendas.Close;
      dm.dSetVendas.CommandText := 'SELECT * FROM venda v JOIN cliente c ' +
        ' ON v.fk_cliente = c.id WHERE c.nome LIKE "' +
        LowerCase(Trim(frmVendas.edtBuscar.Text)) + '%" ORDER BY c.id ASC;';
      dm.dSetVendas.Open;
      dm.cdsVendas.Open;

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
      dm.dSetCidades.Close;
      dm.cdsCidades.Close;
      dm.dSetCidades.CommandText := 'SELECT * FROM cidade c JOIN estado e ON ' +
        'c.fk_estado = e.id WHERE (e.uf = "' +
        UpperCase(Trim(frmCadastrarCliente.cboxEstados.Text)) +
        '") AND (c.nome LIKE "' + frmCadastrarCliente.edtCidade.Text +
        '%") ORDER BY c.nome DESC;';
      dm.dSetCidades.Open;
      dm.cdsCidades.Open;
      dm.cdsCidadesnome.Text;

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
      dm.dSetBairros.Close;
      dm.cdsBairros.Close;

      dm.dSetBairros.CommandText := 'SELECT * FROM bairro b JOIN cidade c ON ' +
        'b.fk_cidade = c.id JOIN estado e ON ' +
        'c.fk_estado = e.id WHERE (e.uf = "' +
        UpperCase(Trim(dm.cdsEstadosuf.AsString)) + '") AND (c.nome = "' +
        LowerCase(Trim(dm.cdsCidadesnome.AsString)) + '") AND (b.nome LIKE "' +
        LowerCase(Trim(frmCadastrarCliente.edtBairro.Text)) +
        '%") ORDER BY b.nome ASC;';

      dm.dSetBairros.Open;
      dm.cdsBairros.Open;

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
      dm.dSetRuas.Close;
      dm.cdsRuas.Close;

      dm.dSetRuas.CommandText := 'SELECT * FROM rua r JOIN bairro b ON ' +
        'r.fk_bairro = b.id JOIN cidade c ON ' +
        'b.fk_cidade = c.id JOIN estado e ON ' +
        'c.fk_estado = e.id WHERE (e.uf = "' +
        UpperCase(Trim(dm.cdsEstadosuf.AsString)) + '") AND (c.nome = "' +
        LowerCase(Trim(dm.cdsCidadesnome.AsString)) + '") AND b.nome = "' +
        LowerCase(Trim(dm.cdsBairrosnome.AsString)) + '" AND r.nome LIKE "%' +
        LowerCase(Trim(frmCadastrarCliente.EdtRua.Text)) +
        '%" ORDER BY r.nome ASC;';

      dm.dSetRuas.Open;
      dm.cdsRuas.Open;

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
      dm.dSetRuas.Close;
      dm.cdsRuas.Close;

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

          dm.dSetRuas.Open;
          dm.cdsRuas.Open;
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

end.
