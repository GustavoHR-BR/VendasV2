unit uCadastrarProduto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls;

type
  TfrmCadastrarProduto = class(TForm)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    btnCadastrar: TButton;
    btnCancelar: TButton;
    procedure FormShow(Sender: TObject);
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
    //
  end;
end;

end.
