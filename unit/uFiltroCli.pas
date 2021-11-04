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
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCancelarClick(Sender: TObject);
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

procedure TfrmFiltrosCli.btnCancelarClick(Sender: TObject);
begin
  Tag := -1;
  frmFiltrosCli.Close;
end;

procedure TfrmFiltrosCli.btnFiltrarClick(Sender: TObject);
begin
  if edtId.Text <> '' then
  begin
    dm.cdsClientes.CommandText := 'SELECT * FROM cliente c' +
      ' INNER JOIN cidade cid ON cid.id = c.fk_cidade' +
      ' INNER JOIN estado e ON e.id = cid.fk_estado' +
      ' WHERE (c.id = "' + edtId.Text + '") ' +
      ' AND (c.nome LIKE "' + edtNome.Text + '%")' +
      ' AND (c.cpf LIKE "%' + edtCpf.Text + '%")' +
      ' AND (e.uf LIKE "%' + cboxEstados.Text + '%")' +
      ' AND (cid.nome LIKE "%' + edtCidade.Text + '%")' +
      ' AND (c.bairro LIKE "%' + edtBairro.Text + '%")' +
      ' AND (c.rua LIKE "%' + edtRua.Text + '%")' +
      ' AND (c.telefone LIKE "%' + edtTelefone.Text + '%")';
  end
  else
  begin
    dm.cdsClientes.CommandText := 'SELECT * FROM cliente c' +
      ' INNER JOIN cidade cid ON cid.id = c.fk_cidade' +
      ' INNER JOIN estado e ON e.id = cid.fk_estado' +
      ' WHERE (c.nome LIKE "' + edtNome.Text + '%")' +
      ' AND (c.cpf LIKE "%' + edtCpf.Text + '%")' +
      ' AND (e.uf LIKE "%' + cboxEstados.Text + '%")' +
      ' AND (cid.nome LIKE "%' + edtCidade.Text + '%")' +
      ' AND (c.bairro LIKE "%' + edtBairro.Text + '%")' +
      ' AND (c.rua LIKE "%' + edtRua.Text + '%")' +
      ' AND (c.telefone LIKE "%' + edtTelefone.Text + '%")';
  end;
  frmClientes.btnLimparFiltros.Enabled := true;
  frmFiltrosCli.Close;
end;

procedure TfrmFiltrosCli.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Tag = -1 then
  begin
    frmClientes.idCli := '';
    frmClientes.nomeCli := '';
    frmClientes.cpf := '';
    frmClientes.ufPosition := -1;
    frmClientes.nomeCid := '';
    frmClientes.nomeBai := '';
    frmClientes.nomeRua := '';
    frmClientes.telefone := '';
  end
  else
  begin
    frmClientes.idCli := edtId.Text;
    frmClientes.nomeCli := edtNome.Text;
    frmClientes.cpf := edtCpf.Text;
    frmClientes.ufPosition := cboxEstados.ItemIndex;
    frmClientes.nomeCid := edtCidade.Text;
    frmClientes.nomeBai := edtBairro.Text;
    frmClientes.nomeRua := edtRua.Text;
    frmClientes.telefone := edtTelefone.Text;
  end;
end;

procedure TfrmFiltrosCli.FormShow(Sender: TObject);
begin
  dm.SQLConn.Open;
  abrirDados('estado', true);
  abrirDados('cidade', true);
end;

end.
