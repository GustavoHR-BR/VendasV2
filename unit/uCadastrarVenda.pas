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
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
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
    procedure edtBuscarChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
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

procedure TfrmCadastrarVenda.edtBuscarChange(Sender: TObject);
begin
  threadBuscarCliente(LowerCase(Trim(edtBuscar.Text)));
  Sleep(60);
  EdtRua.Text := dm.cdsClientesRua.Text;
end;

procedure TfrmCadastrarVenda.FormShow(Sender: TObject);
begin
  dm.SQLConn.Close;
  dm.SQLConn.Open;
  dm.cdsVendas.Open;
  dm.dSetVendas.Open;
  dm.cdsClientes.Open;
  dm.cdsClientes.Open;

  dm.cdsClientes.Edit;
  dm.cdsClientes.ClearFields;
  dm.cdsItens.Close;
  dm.dSetItens.Close;
  dm.cdsItens.CommandText := 'SELECT * FROM item LIMIT 0';
  dm.cdsItens.Open;
  dm.dSetItens.Open;
end;

end.
