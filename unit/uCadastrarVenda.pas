unit uCadastrarVenda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.DBCtrls,
  Vcl.Mask, Vcl.Grids, Vcl.DBGrids;

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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadastrarVenda: TfrmCadastrarVenda;

implementation

uses
  uCadastrarCliente, uCadastrarProduto, uClientes, uDataModule, uFiltroCli,
  uFunctions, uPrincipal, uProdutos, uVendaReport, uVendas;

{$R *.dfm}

procedure TfrmCadastrarVenda.btnAdicionarClick(Sender: TObject);
begin
  //
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
  dm.dSetClientes.Close;
  dm.cdsClientes.Close;
  dm.cdsClientes.CommandText := 'SELECT * FROM cliente WHERE nome LIKE "' +
    LowerCase(Trim(edtBuscar.Text)) + '%" ORDER BY nome ASC;';
  dm.cdsClientes.Open;
  dm.dSetClientes.Open;
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
begin
  dm.cdsClientes.Close;
  dm.dSetClientes.Close;
  if Application.MessageBox('Deseja realmente sair?', 'Atenção',
    MB_YESNO + MB_ICONQUESTION) = mrYes then
  begin
    dm.SQLConn.Close;
    dm.SQLConn.Open;
    btnFecharBuscaClick(Self);
    threadBuscarVenda;
    dm.dSetItens.Close;
    dm.cdsItens.Close;
    dm.cdsItens.CommandText := 'SELECT * FROM item';
    dm.cdsItens.Open;
    dm.dSetItens.Open;
  end
  else
  begin
    Abort;
    dm.cdsClientes.Open;
    dm.dSetVendas.Open;
  end;
end;

procedure TfrmCadastrarVenda.FormShow(Sender: TObject);
begin
  dm.SQLConn.Close;
  dm.SQLConn.Open;
  dm.cdsVendas.Open;
  dm.dSetVendas.Open;
  dm.cdsClientes.Close;
  dm.cdsClientes.Close;
  dm.cdsClientes.CommandText := 'SELECT * FROM cliente';
  dm.cdsItens.Close;
  dm.dSetItens.Close;
  dm.cdsItens.CommandText := 'SELECT * FROM item LIMIT 0';
  dm.cdsItens.Open;
  dm.dSetItens.Open;
  dm.cdsClientes.Open;
  dm.cdsClientes.Open;
  dm.cdsClientes.Edit;
  dm.cdsClientes.ClearFields;
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
