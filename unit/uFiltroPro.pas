unit uFiltroPro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TfrmFiltrarPro = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    edtId: TEdit;
    edtNome: TEdit;
    edtPrecoDe: TEdit;
    Label3: TLabel;
    edtPrecoAte: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    edtDescricao: TEdit;
    Label7: TLabel;
    edtEstoqueDe: TEdit;
    btnFiltrar: TButton;
    btnCancelar: TButton;
    edtEstoqueAte: TEdit;
    Label8: TLabel;
    Label9: TLabel;
    procedure btnFiltrarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFiltrarPro: TfrmFiltrarPro;

implementation

uses
  uAdicionarItem, uCadastrarCliente, uCadastrarProduto, uCadastrarVenda,
  uClientes, uDataModule, uFiltroCli, uFunctions, uPrincipal, uProdutos,
  uVendaReport, uVendas;

{$R *.dfm}

procedure TfrmFiltrarPro.btnCancelarClick(Sender: TObject);
begin
  Tag := -1;
  frmFiltrarPro.Close;
end;

procedure TfrmFiltrarPro.btnFiltrarClick(Sender: TObject);
begin
  if StrToInt(edtEstoqueDe.Text) >= 0 then
  begin
    if StrToInt(edtPrecoDe.Text) >= 0 then
    begin
      if StrToInt(edtEstoqueAte.Text) >= 0 then
      begin
        if StrToInt(edtPrecoAte.Text) >= 0 then
        begin
          abrirDados('produto', false);
          if edtId.Text <> '' then
          begin
            dm.cdsProdutos.CommandText := 'SELECT * FROM produto WHERE (id = "'
              + edtId.Text + '")' + ' AND (nome LIKE "%' + edtNome.Text + '%")'
              + ' AND (preco BETWEEN "' + edtPrecoDe.Text + '" ' + ' AND "' +
              edtPrecoAte.Text + '")' + ' AND (descricao LIKE "%' +
              edtDescricao.Text + '%") ' + ' AND (quantidade_estoque BETWEEN "'
              + edtEstoqueDe.Text + '" ' + ' AND "' + edtEstoqueAte.Text +
              '") ORDER BY ' + frmProdutos.orderBy;
          end
          else
          begin
            dm.cdsProdutos.CommandText :=
              'SELECT * FROM produto WHERE (nome LIKE "' + edtNome.Text + '%")'
              + ' AND (preco BETWEEN "' + edtPrecoDe.Text + '" ' + ' AND "' +
              edtPrecoAte.Text + '")' + ' AND (descricao LIKE "%' +
              edtDescricao.Text + '%") ' + ' AND (quantidade_estoque BETWEEN "'
              + edtEstoqueDe.Text + '" ' + ' AND "' + edtEstoqueAte.Text +
              '") ORDER BY ' + frmProdutos.orderBy;
          end;
          abrirDados('produto', true);
          frmFiltrarPro.Close;
        end
        else
        begin
          ShowMessage('Informe apenas valores acima de 0! ');
          edtEstoqueAte.Text := '0';
          edtEstoqueAte.SetFocus;
        end;
      end
      else
      begin
        ShowMessage('Informe apenas valores acima de 0! ');
        edtPrecoAte.Text := '0';
        edtPrecoAte.SetFocus;
      end;
    end
    else
    begin
      ShowMessage('Informe apenas valores acima de 0! ');
      edtPrecoDe.Text := '0';
      edtPrecoDe.SetFocus;
    end;
  end
  else
  begin
    ShowMessage('Informe apenas valores acima de 0! ');
    edtEstoqueDe.Text := '0';
    edtEstoqueDe.SetFocus;
  end;
end;

procedure TfrmFiltrarPro.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Tag = -1 then
  begin
    frmProdutos.id := '';
    frmProdutos.nome := '';
    frmProdutos.precoDe := '0';
    frmProdutos.precoAte := '10000';
    frmProdutos.qtdEstoqueDe := '0';
    frmProdutos.qtdEstoqueAte := '10000';
    frmProdutos.descricao := '';
  end
  else
  begin
    frmProdutos.id := edtId.Text;
    frmProdutos.nome := edtNome.Text;
    frmProdutos.precoDe := edtPrecoDe.Text;
    frmProdutos.precoAte := edtPrecoAte.Text;
    frmProdutos.qtdEstoqueDe := edtEstoqueDe.Text;
    frmProdutos.qtdEstoqueAte := edtEstoqueAte.Text;
    frmProdutos.descricao := edtDescricao.Text;
  end;
end;

procedure TfrmFiltrarPro.FormShow(Sender: TObject);
begin
  dm.SQLConn.Open;
  abrirDados('produto', true);
end;

end.
