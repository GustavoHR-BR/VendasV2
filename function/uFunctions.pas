unit uFunctions;

interface

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

implementation

uses
  System.Classes, System.SysUtils,
  uCadastrarCliente, uClientes, uDataModule, uFiltroCli, uPrincipal;

procedure buscarCliente;
begin
  TThread.CreateAnonymousThread(
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
    end).Start;
end;

procedure buscarCidade;
begin
  TThread.CreateAnonymousThread(
    procedure
    begin
      dm.dSetCidades.Close;
      dm.cdsCidades.Close;
      dm.dSetCidades.CommandText :=
        'SELECT * FROM cidade cid JOIN estado est ON ' +
        'cid.fk_estado = est.id WHERE (est.uf = "' +
        UpperCase(Trim(frmCadastrarCliente.cboxEstados.Text)) +
        '") AND (cid.nome LIKE "' + frmCadastrarCliente.edtCidade.Text +
        '%") ORDER BY cid.nome DESC;';
      dm.dSetCidades.Open;
      dm.cdsCidades.Open;
      dm.cdsCidadesnome.Text;

      TThread.Synchronize(nil,
        procedure
        begin
          frmCadastrarCliente.gridCidades.DataSource := dm.dSourceCidades;
        end);
    end).Start;
end;

procedure buscarBairro;
begin
  TThread.CreateAnonymousThread(
    procedure
    begin
      dm.dSetBairros.Close;
      dm.cdsBairros.Close;

      {
        dm.dSetBairros.CommandText :=
        'SELECT bai.id, bai.nome FROM bairro bai JOIN cidade cid ON ' +
        'bai.fk_cidade = cid.id JOIN estado est ON ' +
        'cid.fk_estado = est.id WHERE (est.uf = "' +
        UpperCase(Trim(frmCadastrarCliente.cboxEstados.Text)) +
        '") AND (cid.nome = "' +
        LowerCase(Trim(frmCadastrarCliente.edtCidade.Text)) +
        '") AND (bai.nome LIKE "' +
        LowerCase(Trim(frmCadastrarCliente.edtBairro.Text)) +
        '%") ORDER BY bai.nome ASC;';

        VERIFICAR PQ N DEU CERTO;
      }

      dm.dSetBairros.CommandText :=
        'SELECT * FROM bairro bai JOIN cidade cid ON ' +
        'bai.fk_cidade = cid.id WHERE (cid.nome = "' +
        UpperCase(Trim(frmCadastrarCliente.edtCidade.Text)) +
        '") AND (bai.nome LIKE "' + frmCadastrarCliente.edtBairro.Text +
        '%") ORDER BY bai.nome DESC;';

      dm.dSetBairros.Open;
      dm.cdsBairros.Open;

      TThread.Synchronize(nil,
        procedure
        begin
          frmCadastrarCliente.gridBairros.DataSource := dm.dSourceBairros;
        end);
    end).Start;
end;

procedure buscarRua;
begin
  TThread.CreateAnonymousThread(
    procedure
    begin
      dm.dSetRuas.Close;
      dm.cdsRuas.Close;

      {
        dm.dSetRuas.CommandText := 'SELECT * FROM rua rua JOIN bairro bai ON ' +
        'rua.fk_bairro = bai.id JOIN cidade cid ON ' +
        'bai.fk_cidade = cid.id JOIN estado est ON ' +
        'cid.fk_estado = est.id WHERE (est.uf = "' +
        UpperCase(Trim(frmCadastrarCliente.cboxEstados.Text)) +
        '") AND rua.nome LIKE "' +
        LowerCase(Trim(frmCadastrarCliente.edtRua.Text)) +
        '%" ORDER BY rua.nome ASC;';

        VERIFICAR PQ N DEU CERTO;
      }

      dm.dSetRuas.CommandText := 'SELECT * FROM rua rua JOIN bairro bai ON '
        + 'rua.fk_bairro = bai.id WHERE (bai.nome = "' +
        UpperCase(Trim(frmCadastrarCliente.edtBairro.Text)) +
        '") AND (rua.nome LIKE "' + frmCadastrarCliente.edtRua.Text +
        '%") ORDER BY rua.nome DESC;';

      dm.dSetRuas.Open;
      dm.cdsRuas.Open;

      TThread.Synchronize(nil,
        procedure
        begin
          frmCadastrarCliente.gridRuas.DataSource := dm.dSourceRuas;
        end);
    end).Start;
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
