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
    Button1: TButton;
    procedure edtBuscarChange(Sender: TObject);
    procedure btnAdicionarClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
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
  dm.cdsClientes.Append;
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

procedure TfrmClientes.edtBuscarChange(Sender: TObject);
begin
  buscarCliente;
  Sleep(110);
end;

procedure TfrmClientes.FormShow(Sender: TObject);
begin
  dm.SQLConn.Open;
  dm.dSetClientes.Open;
  dm.cdsClientes.Open;
end;

end.
