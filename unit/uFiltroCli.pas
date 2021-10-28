unit uFiltroCli;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TfrmFiltrosCli = class(TForm)
    edtId: TEdit;
    Label1: TLabel;
    edtNome: TEdit;
    Label2: TLabel;
    edtCpf: TEdit;
    Label3: TLabel;
    Label9: TLabel;
    cboxEstados: TComboBox;
    edtCidade: TEdit;
    Label5: TLabel;
    edtBairro: TEdit;
    Label6: TLabel;
    edtRua: TEdit;
    Label7: TLabel;
    edtTelefone: TEdit;
    Label8: TLabel;
    btnFiltrar: TButton;
    btnCancelar: TButton;
    procedure FormShow(Sender: TObject);
    procedure btnFiltrarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFiltrosCli: TfrmFiltrosCli;

implementation

uses
  uAdicionarItem, uCadastrarCliente, uCadastrarProduto, uCadastrarVenda,
  uClientes, uDataModule, uFunctions, uPrincipal, uProdutos, uVendaReport,
  uVendas;

{$R *.dfm}

procedure TfrmFiltrosCli.btnFiltrarClick(Sender: TObject);
begin
  abrirDados('cliente', false);
  dm.cdsClientes.CommandText :=
  'SELECT * FROM cliente c' +
  ' INNER JOIN rua r ON r.id = c.fk_rua' +
  ' INNER JOIN bairro b ON b.id = r.fk_bairro' +
  ' INNER JOIN cidade cid ON cid.id = b.fk_cidade' +
  ' INNER JOIN estado e ON e.id = cid.fk_estado' +
  ' WHERE (c.id = "'+ edtId.Text +'") ' +
  ' AND (c.nome LIKE "'+ edtNome.Text +'%")' +
  ' AND (c.cpf LIKE "%'+ edtCpf.Text +'%")' +
  ' AND (e.uf LIKE "%'+ cboxEstados.Text +'%")' +
  ' AND (cid.nome LIKE "%'+ edtCidade.Text +'%")' +
  ' AND (b.nome LIKE "%'+ edtBairro.Text +'%")' +
  ' AND (r.nome LIKE "%'+ edtRua.Text +'%")' +
  ' AND (c.telefone LIKE "%'+ edtTelefone.Text +'%")';
  abrirDados('cliente', true);
end;

procedure TfrmFiltrosCli.FormShow(Sender: TObject);
begin
  dm.SQLConn.Open;
  dm.cdsClientes.Open;
  dm.cdsEstados.Open;
  dm.cdsEstados.Open;
end;

end.
