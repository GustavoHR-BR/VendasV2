unit uFunctions;

interface

procedure threadBuscarCliente;
procedure buscarCliente;
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
  uCadastrarCliente, uClientes, uDataModule, uFiltroCli, uPrincipal;

procedure buscarCliente;
begin
  dm.dSetRuas.Close;
  dm.cdsRuas.Close;
  dm.dSetClientes.Close;
  dm.cdsClientes.Close;
  dm.dSetRuas.CommandText := 'SELECT * FROM rua ORDER BY id ASC;';
  dm.dSetClientes.CommandText := 'SELECT * FROM cliente ORDER BY id ASC;';
  dm.dSetClientes.Open;
  dm.cdsClientes.Open;
  dm.dSetRuas.Open;
  dm.cdsRuas.Open;
end;

procedure threadBuscarCliente;
var
  t: TThread;
begin
  t := TThread.CreateAnonymousThread(
    procedure
    begin
      dm.dSetClientes.Close;
      dm.cdsClientes.Close;
      dm.dSetClientes.CommandText := 'SELECT * FROM cliente WHERE nome LIKE "%'
        + LowerCase(Trim(frmClientes.edtBuscar.Text)) + '%" ORDER BY id ASC;';
      dm.dSetClientes.Open;
      dm.cdsClientes.Open;

      TThread.Synchronize(nil,
        procedure
        begin
          frmClientes.dbgrid.DataSource := dm.dSourceClientes;
        end);
    end);
  t.FreeOnTerminate := true;
  t.Start;
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
        LowerCase(Trim(frmCadastrarCliente.edtRua.Text)) +
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
          frmCadastrarCliente.edtRua.Text := (dm.queryEnderecoCliente.Fields[3]
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
