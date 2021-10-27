unit uCadastrarVenda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.DBCtrls,
  Vcl.Mask, Vcl.Grids, Vcl.DBGrids, Data.FMTBcd, Data.DB, Data.SqlExpr;

type
  TfrmCadastrarVenda = class(TForm)
    edtBuscar: TEdit;
    Label1: TLabel;
    btnCadastrarCliente: TSpeedButton;
    btnEditarCliente: TSpeedButton;
    Label2: TLabel;
    DBEdtNome: TDBEdit;
    Label3: TLabel;
    DBEdtCpf: TDBEdit;
    Label4: TLabel;
    DBEdtTelefone: TDBEdit;
    Label5: TLabel;
    DBEdtEmail: TDBEdit;
    Label6: TLabel;
    DBEdtDtNascimento: TDBEdit;
    Label8: TLabel;
    EdtRua: TEdit;
    DBGridVendas: TDBGrid;
    edtSubtTotal: TEdit;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    btnFinalizar: TButton;
    btnCancelar: TButton;
    btnAdicionar: TButton;
    btnEditar: TButton;
    Label7: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    btnExcluir: TButton;
    dbgrid: TDBGrid;
    btnFecharBusca: TButton;
    procedure edtBuscarChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnCadastrarClienteClick(Sender: TObject);
    procedure btnEditarClienteClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnAdicionarClick(Sender: TObject);
    procedure edtBuscarClick(Sender: TObject);
    procedure btnFecharBuscaClick(Sender: TObject);
    procedure dbgridCellClick(Column: TColumn);
    procedure btnFinalizarClick(Sender: TObject);
  private
    { Private declarations }
  public
    numeroDeItens: Integer;
  end;

var
  frmCadastrarVenda: TfrmCadastrarVenda;

implementation

uses
  uCadastrarCliente, uCadastrarProduto, uClientes, uDataModule, uFiltroCli,
  uFunctions, uPrincipal, uProdutos, uVendaReport, uVendas, uAdicionarItem;

{$R *.dfm}

procedure TfrmCadastrarVenda.btnAdicionarClick(Sender: TObject);
begin
  Application.CreateForm(TfrmAdicionarItem, frmAdicionarItem);
  try
    frmAdicionarItem.ShowModal;
  finally
    FreeAndNil(frmAdicionarItem);
  end;
end;

procedure TfrmCadastrarVenda.btnCancelarClick(Sender: TObject);
begin
  frmCadastrarVenda.Close;
end;

procedure TfrmCadastrarVenda.btnFecharBuscaClick(Sender: TObject);
begin
  dbgrid.Visible := false;
  btnFecharBusca.Visible := false;
  edtBuscar.Clear;
  dm.cdsClientes.Edit;
  dm.cdsClientes.ClearFields;
  btnAdicionar.Enabled := false;
  btnCadastrarCliente.Enabled := True;
  btnEditarCliente.Enabled := false;
end;

procedure TfrmCadastrarVenda.btnFinalizarClick(Sender: TObject);
begin
  Tag := 1;
end;

procedure TfrmCadastrarVenda.dbgridCellClick(Column: TColumn);
begin
  edtBuscar.Text := dm.cdsClientesnome.AsString;
  dbgrid.Visible := false;
  btnFecharBusca.Visible := false;
  EdtRua.Text := dm.cdsClientesRua.AsString;
  if edtBuscar.Text = dm.cdsClientesnome.Text then
    btnAdicionar.Enabled := True;
  btnEditarCliente.Enabled := True;
  btnCadastrarCliente.Enabled := false;
end;

procedure TfrmCadastrarVenda.edtBuscarChange(Sender: TObject);
begin
  abrirDados('cliente', false);
  dm.cdsClientes.CommandText := 'SELECT * FROM cliente WHERE nome LIKE "' +
    LowerCase(Trim(edtBuscar.Text)) + '%" ORDER BY nome ASC;';
  abrirDados('cliente', True);
  Sleep(60);
  frmCadastrarVenda.dbgrid.DataSource := dm.dSourceClientes;
  if edtBuscar.Text = dm.cdsClientesnome.Text then
    btnAdicionar.Enabled := True;
end;

procedure TfrmCadastrarVenda.edtBuscarClick(Sender: TObject);
begin
  dbgrid.Visible := True;
  btnFecharBusca.Visible := True;
  edtBuscarChange(Self);
end;

procedure TfrmCadastrarVenda.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
  id: string;
begin
  if Tag <> 1 then
  begin
    if Application.MessageBox('Deseja realmente sair?', 'Atenção',
      MB_YESNO + MB_ICONQUESTION) = mrYes then
    begin
      id := dm.cdsVendasid.Text;
      abrirDados('venda', false);
      dm.cdsVendas.CommandText := 'DELETE FROM venda WHERE id = ' + id;
      try
        abrirDados('venda', True);
      except
        on E: Exception do
      end;
      btnCancelarClick(Self);
    end;
  end;
end;

procedure TfrmCadastrarVenda.FormShow(Sender: TObject);
var
  id: Integer;
begin
  dm.SQLConn.Close;
  dm.SQLConn.Open;
  abrirDados('venda', false);
  dm.cdsVendas.CommandText := 'SELECT * FROM venda';
  abrirDados('venda', True);
  dm.cdsVendas.Last;
  dm.cdsVendas.Edit;
  id := dm.cdsVendasid.AsInteger + 1;
  dm.cdsVendas.Append;
  dm.cdsVendasid.AsInteger := id;
  dm.cdsVendas.Post;
  dm.cdsVendas.ApplyUpdates(0);
  abrirDados('cliente', false);
  abrirDados('item', false);
  dm.cdsClientes.CommandText := 'SELECT * FROM cliente';
  dm.cdsItens.CommandText := 'SELECT * FROM item WHERE fk_venda = ' +
    dm.cdsVendasid.Text;
  abrirDados('item', True);
  abrirDados('cliente', True);
  dm.cdsClientes.Edit;
  dm.cdsClientes.ClearFields;
  numeroDeItens := 0;
end;

procedure TfrmCadastrarVenda.btnCadastrarClienteClick(Sender: TObject);
begin
  Tag := 1;
  frmClientes.btnAdicionarClick(Self);
end;

procedure TfrmCadastrarVenda.btnEditarClienteClick(Sender: TObject);
begin
  Tag := 2;
  frmClientes.btnEditarClick(Self);
end;

end.
