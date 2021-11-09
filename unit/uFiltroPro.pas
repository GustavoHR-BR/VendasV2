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
    procedure btnCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtEstoqueAteChange(Sender: TObject);
    procedure edtPrecoDeChange(Sender: TObject);
    procedure edtPrecoAteChange(Sender: TObject);
    procedure edtEstoqueDeChange(Sender: TObject);
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
  uVendaReport, uVendas, db;

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
          if edtId.Text <> '' then
          begin
            dm.cdsProdutos.Filtered := false;
            dm.cdsProdutos.FilterOptions := [foCaseInsensitive];
            dm.cdsProdutos.Filter := '(id = ' + (QuotedStr(Trim(edtId.Text))) +
              ')' + ' AND (nome LIKE ' + (QuotedStr(Trim(edtNome.Text) + '%')) +
              ')' + ' AND (preco >= ' + (QuotedStr(Trim(edtPrecoDe.Text))) + ')'
              + ' AND (preco < ' + (QuotedStr(Trim(edtPrecoAte.Text))) + ')' +
              ' AND (descricao LIKE ' +
              (QuotedStr('%' + Trim(edtDescricao.Text) + '%')) + ')' +
              ' AND (quantidade_estoque >= ' +
              (QuotedStr(Trim(edtEstoqueDe.Text))) + ')' +
              ' AND (quantidade_estoque < ' +
              (QuotedStr(Trim(edtEstoqueAte.Text))) + ')';
            dm.cdsProdutos.Filtered := true;
          end
          else
          begin
            edtId.Text := '0';
            dm.cdsProdutos.Filtered := false;
            dm.cdsProdutos.FilterOptions := [foCaseInsensitive];
            dm.cdsProdutos.Filter := '(id > ' + (QuotedStr(Trim(edtId.Text))) +
              ')' + ' AND (nome LIKE ' + (QuotedStr(Trim(edtNome.Text) + '%')) +
              ')' + ' AND (preco >= ' + (QuotedStr(Trim(edtPrecoDe.Text))) + ')'
              + ' AND (preco < ' + (QuotedStr(Trim(edtPrecoAte.Text))) + ')' +
              ' AND (descricao LIKE ' +
              (QuotedStr('%' + Trim(edtDescricao.Text) + '%')) + ')' +
              ' AND (quantidade_estoque >= ' +
              (QuotedStr(Trim(edtEstoqueDe.Text))) + ')' +
              ' AND (quantidade_estoque < ' +
              (QuotedStr(Trim(edtEstoqueAte.Text))) + ')';
            dm.cdsProdutos.Filtered := true;
            edtId.Clear;
          end;
          frmProdutos.btnLimparFiltros.Enabled := true;
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

procedure TfrmFiltrarPro.edtEstoqueAteChange(Sender: TObject);
begin
  if edtEstoqueAte.Text = '' then
    edtEstoqueAte.Text := '0';
end;

procedure TfrmFiltrarPro.edtEstoqueDeChange(Sender: TObject);
begin
  if edtEstoqueDe.Text = '' then
    edtEstoqueDe.Text := '0';
end;

procedure TfrmFiltrarPro.edtPrecoAteChange(Sender: TObject);
begin
  if edtPrecoAte.Text = '' then
    edtPrecoAte.Text := '0';
end;

procedure TfrmFiltrarPro.edtPrecoDeChange(Sender: TObject);
begin
  if edtPrecoDe.Text = '' then
    edtPrecoDe.Text := '0';
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

end.
