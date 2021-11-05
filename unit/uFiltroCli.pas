unit uFiltroCli;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, db;

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
    dm.cdsClientes.Filtered := false;
    dm.cdsClientes.FilterOptions := [foCaseInsensitive];
    dm.cdsClientes.Filter := '(id = ' + QuotedStr(edtId.Text) + ') ' +
      ' AND (nome LIKE ' + QuotedStr(Trim(edtNome.Text) + '%') + ')' +
      ' AND (cpf LIKE ' + QuotedStr('%' + Trim(edtCpf.Text) + '%') + ')' +
      ' AND (uf LIKE ' + QuotedStr('%' + Trim(cboxEstados.Text) + '%') + ')' +
      ' AND (nome LIKE ' + QuotedStr('%' + Trim(edtCidade.Text) + '%') + ')' +
      ' AND (bairro LIKE ' + QuotedStr('%' + Trim(edtBairro.Text) + '%') + ')' +
      ' AND (rua LIKE ' + QuotedStr('%' + Trim(edtRua.Text) + '%') + ')' +
      ' AND (telefone LIKE ' + QuotedStr('%' + Trim(edtTelefone.Text) + '%') + ')';
   dm.cdsClientes.Filtered := true;
  end
  else
  begin
    edtId.Text := '0';
    dm.cdsClientes.Filtered := false;
    dm.cdsClientes.FilterOptions := [foCaseInsensitive];
    dm.cdsClientes.Filter := '(id > ' + QuotedStr(edtId.Text) + ') ' +
      ' AND (nome LIKE ' + QuotedStr(Trim(edtNome.Text) + '%') + ')' +
      ' AND (cpf LIKE ' + QuotedStr('%' + Trim(edtCpf.Text) + '%') + ')' +
      ' AND (uf LIKE ' + QuotedStr('%' + Trim(cboxEstados.Text) + '%') + ')' +
      ' AND (nome LIKE ' + QuotedStr('%' + Trim(edtCidade.Text) + '%') + ')' +
      ' AND (bairro LIKE ' + QuotedStr('%' + Trim(edtBairro.Text) + '%') + ')' +
      ' AND (rua LIKE ' + QuotedStr('%' + Trim(edtRua.Text) + '%') + ')' +
      ' AND (telefone LIKE ' + QuotedStr('%' + Trim(edtTelefone.Text) + '%') + ')';
   dm.cdsClientes.Filtered := true;
   edtId.Clear;
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

end.
