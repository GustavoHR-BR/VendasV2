unit uAdicionarItem;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids;

type
  TfrmAdicionarItem = class(TForm)
    edtBuscar: TEdit;
    Label1: TLabel;
    dbgrid: TDBGrid;
    btnCancelar: TButton;
    edtQuantidade: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    edtValUnitario: TEdit;
    edtAcrescimo: TEdit;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    edtValAcrescimo: TEdit;
    edtDesconto: TEdit;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    edtValDesconto: TEdit;
    Label11: TLabel;
    edtSubTotal: TEdit;
    Label12: TLabel;
    edtValTotal: TEdit;
    btnFinalizar: TButton;
    Button1: TButton;
    procedure FormShow(Sender: TObject);
    procedure edtBuscarClick(Sender: TObject);
    procedure edtBuscarChange(Sender: TObject);
    procedure dbgridCellClick(Column: TColumn);
    procedure edtQuantidadeChange(Sender: TObject);
  private
    passouAqui: Boolean;
  public
    { Public declarations }
  end;

var
  frmAdicionarItem: TfrmAdicionarItem;

implementation

uses
  uCadastrarCliente, uCadastrarProduto, uCadastrarVenda, uClientes, uDataModule,
  uFiltroCli, uFunctions, uPrincipal, uProdutos, uVendaReport, uVendas;

{$R *.dfm}

procedure TfrmAdicionarItem.dbgridCellClick(Column: TColumn);
begin
  edtBuscar.Text := dm.cdsProdutosnome.AsString;
  edtValUnitario.Text := dm.cdsProdutospreco.AsString;
  edtSubTotal.Text := dm.cdsProdutospreco.AsString;
  edtValTotal.Text := dm.cdsProdutospreco.AsString;
  dbgrid.Visible := false;
  btnCancelar.Visible := false;
end;

procedure TfrmAdicionarItem.edtBuscarChange(Sender: TObject);
begin
  //
end;

procedure TfrmAdicionarItem.edtBuscarClick(Sender: TObject);
begin
  btnCancelar.Visible := True;
  dbgrid.Visible := True;
  threadBuscarProduto(LowerCase(Trim(edtBuscar.Text)));
  Sleep(60);
end;

procedure TfrmAdicionarItem.edtQuantidadeChange(Sender: TObject);
begin
  if edtQuantidade.Text = '' then
  begin
    edtQuantidade.Text := '1';
    passouAqui := True;
  end
  else
  begin
    if passouAqui = True then
      edtQuantidade.Text := copy(edtQuantidade.Text, 0, 1);

    edtSubTotal.Text := FloatToStr(strtoFloat(edtQuantidade.Text) *
      strtoFloat(dm.cdsProdutospreco.Text));
  end;
end;

procedure TfrmAdicionarItem.FormShow(Sender: TObject);
begin
  dm.SQLConn.Close;
  dm.SQLConn.Open;
  dm.dSetProdutos.Close;
  dm.cdsProdutos.Close;
  dm.cdsProdutos.CommandText := 'SELECT * FROM produto LIMIT 0';
  dm.cdsProdutos.Open;
  dm.dSetProdutos.Open;
end;

end.
