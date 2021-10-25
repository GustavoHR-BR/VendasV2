unit uCadastrarProduto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls;

type
  TfrmCadastrarProduto = class(TForm)
    Label1: TLabel;
    dbEdtNome: TDBEdit;
    Label2: TLabel;
    Label3: TLabel;
    dbEdtDescricao: TDBEdit;
    Label4: TLabel;
    dbEdtEstoque: TDBEdit;
    btnCadastrar: TButton;
    btnCancelar: TButton;
    dbEdtPreco: TDBEdit;
    procedure FormShow(Sender: TObject);
    procedure btnCadastrarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadastrarProduto: TfrmCadastrarProduto;

implementation

{$R *.dfm}

uses uCadastrarCliente, uClientes, uDataModule, uFiltroCli, uFunctions,
  uPrincipal, uProdutos;

procedure TfrmCadastrarProduto.btnCadastrarClick(Sender: TObject);
begin
  if dbEdtNome.Text = '' then
  begin
    ShowMessage('Nome inválido! ');
    dbEdtNome.SetFocus;
  end
  else if (dbEdtPreco.Text = '') OR (StrToFloat(dbEdtPreco.Text) < 0) then
  begin
    ShowMessage('Preço inválido! ');
    dbEdtPreco.SetFocus;
  end
  else if dbEdtDescricao.Text = '' then
  begin
    ShowMessage('Descrição inválida! ');
    dbEdtNome.SetFocus;
  end
  else if (dbEdtEstoque.Text = '') OR (StrToInt(dbEdtEstoque.Text) < 0) then
  begin
    ShowMessage('Quantidade inválida! ');
    dbEdtNome.SetFocus;
  end
  else
  begin
    if frmProdutos.Tag = 1 then
    begin
      dm.cdsProdutosid.Text := '0';
      try
        dm.cdsProdutos.Post;
        dm.cdsProdutos.ApplyUpdates(0);
        ShowMessage('Sucesso ao cadastrar o produto! ');
        frmCadastrarProduto.Close;
        Tag := 1;
      except
        on E: Exception do
          ShowMessage('Erro ao cadastrar o produto! ' + E.ToString);
      end;
    end
    else if frmProdutos.Tag = 2 then
    begin
      try
        dm.cdsProdutos.Post;
        dm.cdsProdutos.ApplyUpdates(0);
        Tag := 2;
        frmCadastrarProduto.Close;
      except
        on E: Exception do
          ShowMessage('Erro ao editar o produto! ' + E.ToString);
      end;
    end;
  end;
end;

procedure TfrmCadastrarProduto.btnCancelarClick(Sender: TObject);
begin
  frmCadastrarProduto.Close;
end;

procedure TfrmCadastrarProduto.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if (Tag <> 1) AND (Tag <> 2) then // close pelo usuário;
  begin
    if Application.MessageBox('Deseja realmente sair?', 'Atenção',
      MB_YESNO + MB_ICONQUESTION) = mrYes then
    begin
      dm.dSetProdutos.Close;
      dm.dSetProdutos.Close;
      verificarOrdenacaoProduto;
    end
    else
      Abort;
  end
  else
  begin
    frmProdutos.edtBuscar.Text := '';
    verificarOrdenacaoProduto;
  end;
end;

procedure TfrmCadastrarProduto.FormShow(Sender: TObject);
begin
  if frmProdutos.Tag = 1 then // Tag = 1 -> cadastrar
  begin
    dm.SQLConn.Close;
    dm.SQLConn.Open;
    dm.cdsProdutos.Edit;
    dm.cdsProdutos.ClearFields;
  end
  else if frmProdutos.Tag = 2 then // Tag = 2 -> editar
  begin
    dm.cdsProdutos.Edit;
    btnCadastrar.Caption := 'Editar';
  end;
end;

end.
