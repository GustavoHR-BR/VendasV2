unit uDashboard;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids;

type
  TfrmDashboard = class(TForm)
    shpTotalDeVendas: TShape;
    shpQtdItensVendidos: TShape;
    Label1: TLabel;
    Label2: TLabel;
    totalVendasAll: TLabel;
    totalItensAll: TLabel;
    Shape1: TShape;
    Label3: TLabel;
    ticketMedioAll: TLabel;
    Label4: TLabel;
    Shape4: TShape;
    Label6: TLabel;
    ticketTotalAll: TLabel;
    Shape3: TShape;
    Label9: TLabel;
    mediaVendas: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    nomeCli: TLabel;
    CpfCli: TLabel;
    telefoneCli: TLabel;
    emailCli: TLabel;
    nascimentoCli: TLabel;
    cidadeCli: TLabel;
    idCli: TLabel;
    estadoCli: TLabel;
    idPro: TLabel;
    precoPro: TLabel;
    nomePro: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Shape5: TShape;
    Label17: TLabel;
    Shape6: TShape;
    Shape7: TShape;
    Label5: TLabel;
    Shape8: TShape;
    Label14: TLabel;
    Shape9: TShape;
    Label19: TLabel;
    Shape10: TShape;
    Label20: TLabel;
    Shape11: TShape;
    Label21: TLabel;
    Label22: TLabel;
    Shape12: TShape;
    Label23: TLabel;
    Shape13: TShape;
    Label24: TLabel;
    Shape14: TShape;
    Shape15: TShape;
    Label25: TLabel;
    Label18: TLabel;
    Shape2: TShape;
    Label7: TLabel;
    totalVendas: TLabel;
    Shape16: TShape;
    Label26: TLabel;
    ticketMedio: TLabel;
    Shape17: TShape;
    Label28: TLabel;
    ticketTotal: TLabel;
    Label30: TLabel;
    cbMes: TComboBox;
    cbAno: TComboBox;
    btnSair: TButton;
    Shape18: TShape;
    Label31: TLabel;
    totalItens: TLabel;
    Label8: TLabel;
    Shape19: TShape;
    Label10: TLabel;
    Shape20: TShape;
    Label27: TLabel;
    Shape21: TShape;
    Label29: TLabel;
    Shape22: TShape;
    Label32: TLabel;
    Shape23: TShape;
    Label33: TLabel;
    procedure FormShow(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDashboard: TfrmDashboard;

implementation

uses
  uDataModule, uPrincipal;

{$R *.dfm}

procedure TfrmDashboard.btnSairClick(Sender: TObject);
begin
  frmDashboard.Close;
end;

procedure TfrmDashboard.FormShow(Sender: TObject);
var
  total: Real;
  i, j, cont, idProdMaisVendido, qtdDoProdMaisVendido, idMelhorCli,
    qtdDoMelhorCli: Integer;
begin
  dm.cdsClientes.Filtered := false;
  dm.cdsProdutos.Filtered := false;
  dm.cdsItens.Filtered := false;
  dm.cdsVendas.Filtered := false;

  // Total de vendas
  totalVendasAll.Caption := IntToStr(dm.cdsVendas.RecordCount);

  // Total de itens vendidos
  totalItensAll.Caption := IntToStr(dm.cdsItens.RecordCount);

  // Ticket m�dio
  total := 0;
  dm.cdsVendas.First;
  for i := 1 to dm.cdsVendas.RecordCount do
  begin
    total := total + dm.cdsVendastotal.AsFloat;
    dm.cdsVendas.Next;
  end;
  ticketTotalAll.Caption := FormatFloat('R$ #,,,,0.00', total);
  total := total / dm.cdsVendas.RecordCount;
  ticketMedioAll.Caption := FormatFloat('R$ #,,,,0.00', total);

  // Produto mais vendido
  dm.cdsItens.IndexFieldNames := 'id';
  dm.cdsProdutos.IndexFieldNames := 'id';
  dm.cdsItens.First;
  dm.cdsProdutos.First;
  qtdDoProdMaisVendido := 0;
  for i := 1 to dm.cdsProdutos.RecordCount do
  begin
    for j := 1 to dm.cdsItens.RecordCount do
    begin
      cont := 0;
      if dm.cdsProdutosid.AsInteger = dm.cdsItensfk_produto.AsInteger then
      begin
        Inc(cont);
      end;
      if cont > qtdDoProdMaisVendido then
        idProdMaisVendido := dm.cdsProdutosid.AsInteger;

      qtdDoProdMaisVendido := cont;
      dm.cdsItens.Next;
    end;
    dm.cdsProdutos.Next;
  end;
  dm.cdsProdutos.Locate('id', IntToStr(idProdMaisVendido), []);
  idPro.Caption := dm.cdsProdutosid.AsString;
  nomePro.Caption := dm.cdsProdutosnome.AsString;
  precoPro.Caption := FormatFloat('R$ #,,,,0.00', dm.cdsProdutospreco.AsFloat);

  // Cliente que mais comprou
  dm.cdsVendas.IndexFieldNames := 'id';
  dm.cdsClientes.IndexFieldNames := 'id';
  dm.cdsVendas.First;
  dm.cdsClientes.First;
  qtdDoMelhorCli := 0;
  for i := 1 to dm.cdsClientes.RecordCount do
  begin
    for j := 1 to dm.cdsVendas.RecordCount do
    begin
      cont := 0;
      if dm.cdsClientesid.AsInteger = dm.cdsVendasfk_cliente.AsInteger then
      begin
        Inc(cont);
      end;
      if cont > qtdDoMelhorCli then
        idMelhorCli := dm.cdsClientesid.AsInteger;

      qtdDoMelhorCli := cont;
      dm.cdsVendas.Next;
    end;
    dm.cdsClientes.Next;
  end;
  dm.cdsClientes.Locate('id', IntToStr(idMelhorCli), []);
  idCli.Caption := dm.cdsClientesid.AsString;
  nomeCli.Caption := dm.cdsClientesnome.AsString;
  CpfCli.Caption := dm.cdsClientescpf.AsString;
  nascimentoCli.Caption := dm.cdsClientesdata_nascimento.AsString;
  telefoneCli.Caption := dm.cdsClientestelefone.AsString;
  emailCli.Caption := dm.cdsClientesemail.AsString;
  cidadeCli.Caption := dm.cdsClientesnome_1.AsString;
  estadoCli.Caption := dm.cdsClientesuf.AsString;
end;

end.
