unit uAdicionarItem;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids,
  db;

type
  TfrmAdicionarItem = class(TForm)
    edtBuscar: TEdit;
    Label1: TLabel;
    dbgrid: TDBGrid;
    btnCancelarItem: TButton;
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
    btnCancelar: TButton;
    Label13: TLabel;
    edtEmEstoque: TEdit;
    procedure FormShow(Sender: TObject);
    procedure edtBuscarClick(Sender: TObject);
    procedure edtBuscarChange(Sender: TObject);
    procedure dbgridCellClick(Column: TColumn);
    procedure edtQuantidadeChange(Sender: TObject);
    procedure btnFinalizarClick(Sender: TObject);
    procedure btnCancelarItemClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtAcrescimoChange(Sender: TObject);
    procedure edtDescontoChange(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
  private
    passouAqui: Boolean;
  public
    valAtualDoItem: Double;
  end;

var
  frmAdicionarItem: TfrmAdicionarItem;

implementation

uses
  uCadastrarCliente, uCadastrarProduto, uCadastrarVenda, uClientes, uDataModule,
  uFiltroCli, uFunctions, uPrincipal, uProdutos, uVendaReport, uVendas;

{$R *.dfm}

procedure TfrmAdicionarItem.btnCancelarClick(Sender: TObject);
begin
  //
end;

procedure TfrmAdicionarItem.btnCancelarItemClick(Sender: TObject);
begin
  //
end;

procedure TfrmAdicionarItem.btnFinalizarClick(Sender: TObject);
begin
  //
end;

procedure TfrmAdicionarItem.dbgridCellClick(Column: TColumn);
begin
  //
end;

procedure TfrmAdicionarItem.edtBuscarChange(Sender: TObject);
begin
  //
end;

procedure TfrmAdicionarItem.edtBuscarClick(Sender: TObject);
begin
  //
end;

procedure TfrmAdicionarItem.edtDescontoChange(Sender: TObject);
begin
  //
end;

procedure TfrmAdicionarItem.edtAcrescimoChange(Sender: TObject);
begin
  //
end;

procedure TfrmAdicionarItem.edtQuantidadeChange(Sender: TObject);
begin
  //
end;

procedure TfrmAdicionarItem.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if Tag <> 1 then
  begin
    if frmCadastrarVenda.Tag = 4 then
    // User está cancelando a adição de um item
    begin
      if Application.MessageBox
        ('Deseja realmente fechar? O item será cancelado!', 'Atenção',
        MB_YESNO + MB_ICONQUESTION) = mrYes then

    end;
  end;
end;

procedure TfrmAdicionarItem.FormShow(Sender: TObject);
begin
  //
end;

end.
