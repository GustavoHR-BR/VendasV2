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
    procedure edtBuscarChange(Sender: TObject);
    procedure btnAdicionarClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure cbOrdenarPorSelect(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
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
  threadBuscarCliente(LowerCase(Trim(frmClientes.edtBuscar.Text)));
  Sleep(60);
end;

procedure TfrmClientes.FormShow(Sender: TObject);
begin
  dm.SQLConn.Close;
  dm.SQLConn.Open;
  threadBuscarCliente('');
end;

end.
