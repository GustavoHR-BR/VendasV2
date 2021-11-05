unit uClientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls;

type
  TfrmClientes = class(TForm)
    dbgrid: TDBGrid;
    btnAdicionar: TButton;
    btnEditar: TButton;
    btnSair: TButton;
    edtBuscar: TEdit;
    Label1: TLabel;
    btnFiltrar: TButton;
    cbOrdenarPor: TComboBox;
    Label2: TLabel;
    btnLimparFiltros: TButton;
    procedure edtBuscarChange(Sender: TObject);
    procedure btnAdicionarClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure cbOrdenarPorSelect(Sender: TObject);
    procedure btnFiltrarClick(Sender: TObject);
    procedure btnLimparFiltrosClick(Sender: TObject);
  private
    { Private declarations }
  public
    idCli, nomeCli, cpf, nomeCid, nomeBai, nomeRua, telefone: string;
    ufPosition: Integer;
  end;

var
  frmClientes: TfrmClientes;

implementation

{$R *.dfm}

uses uCadastrarCliente, uDataModule, uPrincipal, uFiltroCli, uFunctions;

procedure TfrmClientes.btnAdicionarClick(Sender: TObject);
begin
  Application.CreateForm(TfrmCadastrarCliente, frmCadastrarCliente);
  Tag := 1;
  dm.cdsClientes.Append;
  try
    frmCadastrarCliente.ShowModal;
  finally
    FreeAndNil(frmCadastrarCliente);
  end;
end;

procedure TfrmClientes.btnEditarClick(Sender: TObject);
begin
  Application.CreateForm(TfrmCadastrarCliente, frmCadastrarCliente);
  Tag := 2;
  try
    frmCadastrarCliente.ShowModal;
  finally
    FreeAndNil(frmCadastrarCliente);
  end;
end;

procedure TfrmClientes.btnFiltrarClick(Sender: TObject);
begin
  Application.CreateForm(TfrmFiltrosCli, frmFiltrosCli);
  frmFiltrosCli.edtId.Text := idCli;
  frmFiltrosCli.edtNome.Text := nomeCli;
  frmFiltrosCli.edtCpf.Text := cpf;
  frmFiltrosCli.cboxEstados.ItemIndex := ufPosition;
  frmFiltrosCli.edtCidade.Text := nomeCid;
  frmFiltrosCli.edtBairro.Text := nomeBai;
  frmFiltrosCli.edtRua.Text := nomeRua;
  frmFiltrosCli.edtTelefone.Text := telefone;
  try
    frmFiltrosCli.ShowModal;
  finally
    FreeAndNil(frmFiltrosCli);
  end;
end;

procedure TfrmClientes.btnLimparFiltrosClick(Sender: TObject);
var
  orderBy: string;
begin
  if cbOrdenarPor.ItemIndex = 0 then
    orderBy := 'id'
  else if cbOrdenarPor.ItemIndex = 1 then
    orderBy := 'nome'
  else if cbOrdenarPor.ItemIndex = 2 then
    orderBy := 'telefone'
  else if cbOrdenarPor.ItemIndex = 3 then
    orderBy := 'email'
  else if cbOrdenarPor.ItemIndex = 4 then
    orderBy := 'data_nascimento';

  idCli := '';
  nomeCli := '';
  cpf := '';
  ufPosition := -1;
  nomeCid := '';
  nomeBai := '';
  nomeRua := '';
  telefone := '';

  dm.cdsClientes.Filtered := false;
end;

procedure TfrmClientes.btnSairClick(Sender: TObject);
begin
  frmClientes.Close;
end;

procedure TfrmClientes.cbOrdenarPorSelect(Sender: TObject);
begin
  verificarOrdenacaoCliente;
end;

procedure TfrmClientes.edtBuscarChange(Sender: TObject);
begin
  threadBuscarCliente(Trim(edtBuscar.Text));
  Sleep(60);
end;

procedure TfrmClientes.FormShow(Sender: TObject);
begin
  ufPosition := -1;
end;

end.
