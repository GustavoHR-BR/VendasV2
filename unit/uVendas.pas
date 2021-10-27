unit uVendas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids,
  RpRave, RpBase, RpSystem, RpDefine, RpCon, RpConDS, RpRender, RpRenderPDF,
  Winapi.ShellAPI, Data.FMTBcd, Data.DB, Data.SqlExpr, Datasnap.DBClient,
  Datasnap.Provider;

type
  TfrmVendas = class(TForm)
    edtBuscar: TEdit;
    btnNova: TButton;
    btnImprimir: TButton;
    btnSair: TButton;
    Label2: TLabel;
    cbOrdenarPor: TComboBox;
    Label1: TLabel;
    DBGridVendas: TDBGrid;
    DBGridItens: TDBGrid;
    dSetVendas: TSQLDataSet;
    dspVendas: TDataSetProvider;
    cdsVendas: TClientDataSet;
    cdsVendasid: TIntegerField;
    cdsVendasfk_cliente: TIntegerField;
    cdsVendastotal: TFMTBCDField;
    cdsVendasdata: TStringField;
    dSourceVendas: TDataSource;
    dSourceItens: TDataSource;
    cdsItens: TClientDataSet;
    cdsItensid: TIntegerField;
    cdsItensfk_venda: TIntegerField;
    cdsItensfk_produto: TIntegerField;
    cdsItensnome: TStringField;
    cdsItenspreco: TFMTBCDField;
    cdsItensdescricao: TStringField;
    cdsItensquantidade: TIntegerField;
    dspItens: TDataSetProvider;
    dSetItens: TSQLDataSet;
    cdsVendascliente: TStringField;
    procedure edtBuscarChange(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure cbOrdenarPorSelect(Sender: TObject);
    procedure btnNovaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmVendas: TfrmVendas;

implementation

{$R *.dfm}

uses uCadastrarCliente, uCadastrarProduto, uClientes, uDataModule, uFiltroCli,
  uFunctions, uPrincipal, uProdutos, uVendaReport, uCadastrarVenda;

procedure TfrmVendas.btnNovaClick(Sender: TObject);
begin
  Application.CreateForm(TfrmCadastrarVenda, frmCadastrarVenda);
  try
    frmCadastrarVenda.ShowModal;
  finally
    FreeAndNil(frmCadastrarVenda);
  end;
end;

procedure TfrmVendas.btnSairClick(Sender: TObject);
begin
  frmVendas.Close;
end;

procedure TfrmVendas.cbOrdenarPorSelect(Sender: TObject);
begin
  verificarOrdenacaoVenda;
end;

procedure TfrmVendas.edtBuscarChange(Sender: TObject);
begin
  threadBuscarVenda;
  Sleep(60);
end;

procedure TfrmVendas.FormShow(Sender: TObject);
begin
  dm.SQLConn.Close;
  dm.SQLConn.Open;
  cdsVendas.Open;
  dSetVendas.Open;
  cdsItens.Open;
  dSetItens.Open;
end;

end.
