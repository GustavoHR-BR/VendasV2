unit uFunctions;

interface

procedure edtBuscarChangeCliente;

implementation

uses
  System.Classes, System.SysUtils,
  uCadastrarCliente, uClientes, uDataModule, uFiltroCli, uPrincipal;

procedure edtBuscarChangeCliente;
begin
  TThread.CreateAnonymousThread(
    procedure
    begin
      dm.cdsClientes.Close;
      dm.dSetClientes.Close;
      dm.dSetClientes.CommandText := 'SELECT * FROM cliente WHERE nome LIKE "%'
        + LowerCase(Trim(frmClientes.edtBuscar.Text)) + '%";';
      dm.dSetClientes.Open;
      dm.cdsClientes.Open;

      TThread.Synchronize(nil,
        procedure
        begin
          frmClientes.dbgrid.DataSource := dm.dSourceClientes;
        end);
    end).Start;
end;

end.
