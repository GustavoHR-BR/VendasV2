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
    Shape18: TShape;
    Label31: TLabel;
    totalItens: TLabel;
    Label8: TLabel;
    shapeTicketMedioBlue: TShape;
    porcTickMedio: TLabel;
    shapeTicketTotalRed: TShape;
    porcTickTotal: TLabel;
    shapeTotalVendasGreen: TShape;
    porcTotalVendas: TLabel;
    shapeItensTotalRed: TShape;
    porcItensVendidos: TLabel;
    shapeTicketMedioRed: TShape;
    shapeTicketMedioGreen: TShape;
    shapeTicketTotalBlue: TShape;
    shapeTicketTotalGreen: TShape;
    Label10: TLabel;
    Label27: TLabel;
    Label29: TLabel;
    Label32: TLabel;
    btnSair: TButton;
    shapeTotalVendasBlue: TShape;
    shapeTotalVendasRed: TShape;
    shapeItensTotalGreen: TShape;
    shapeItensTotalBlue: TShape;
    Shape19: TShape;
    qtdProdMaisvendido: TLabel;
    Label34: TLabel;
    Shape20: TShape;
    Label33: TLabel;
    totalEmVendas: TLabel;
    Shape21: TShape;
    Label35: TLabel;
    numCompras: TLabel;
    procedure FormShow(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure cbMesSelect(Sender: TObject);
    procedure cbAnoSelect(Sender: TObject);
  private
    ticketMedioDataAtual, ticketTotalDataAtual, totalVendasDataAtual,
      itensVendidosDataAtual: Real;
  public
    { Public declarations }
  end;

var
  frmDashboard: TfrmDashboard;

implementation

uses
  uDataModule, uPrincipal, uFunctions;

{$R *.dfm}

procedure TfrmDashboard.btnSairClick(Sender: TObject);
begin
  frmDashboard.Close;
end;

procedure TfrmDashboard.cbAnoSelect(Sender: TObject);
begin
  setaMesSelected(cbMes.Text);
  calculaPorcentagens(ticketMedioDataAtual, ticketTotalDataAtual,
    totalVendasDataAtual, itensVendidosDataAtual);
end;

procedure TfrmDashboard.cbMesSelect(Sender: TObject);
begin
  setaMesSelected(cbMes.Text);
  calculaPorcentagens(ticketMedioDataAtual, ticketTotalDataAtual,
    totalVendasDataAtual, itensVendidosDataAtual);
end;

procedure TfrmDashboard.FormShow(Sender: TObject);
var
  total, valTotalCli: Real;
  dataAtual, mes, ano, aux: string;
  i, j, cont, idProdMaisVendido, qtdDoProdMaisVendido, idMelhorCli,
    qtdComprasCli: Integer;
begin
  if dm.cdsVendas.RecordCount > 0 then
  begin
    dm.cdsClientes.Filtered := false;
    dm.cdsProdutos.Filtered := false;
    dm.cdsItens.Filtered := false;
    dm.cdsVendas.Filtered := false;

    // Total de vendas
    totalVendasAll.Caption := IntToStr(dm.cdsVendas.RecordCount);

    // Total de itens vendidos
    totalItensAll.Caption := IntToStr(dm.cdsItens.RecordCount);

    // Ticket médio
    total := 0;
    dm.cdsVendas.First;
    for i := 1 to dm.cdsVendas.RecordCount do
    begin
      total := total + dm.cdsVendastotal.AsFloat;
      dm.cdsVendas.Next;
    end;
    // Ticket total
    ticketTotalAll.Caption := FormatFloat('R$ #,,,,0.00', total);
    // Ticket médio
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
          cont := cont + dm.cdsItensquantidade.AsInteger;
        end;
        if cont > qtdDoProdMaisVendido then
        begin
          idProdMaisVendido := dm.cdsProdutosid.AsInteger;
          qtdProdMaisvendido.Caption := IntToStr(cont);
        end;
        qtdDoProdMaisVendido := cont;
        dm.cdsItens.Next;
      end;
      dm.cdsProdutos.Next;
    end;
    dm.cdsProdutos.Locate('id', IntToStr(idProdMaisVendido), []);
    idPro.Caption := dm.cdsProdutosid.AsString;
    nomePro.Caption := dm.cdsProdutosnome.AsString;
    precoPro.Caption := FormatFloat('R$ #,,,,0.00',
      dm.cdsProdutospreco.AsFloat);

    // Cliente que mais comprou
    dm.cdsVendas.IndexFieldNames := 'id';
    dm.cdsClientes.IndexFieldNames := 'id';
    dm.cdsVendas.First;
    dm.cdsClientes.First;
    valTotalCli := 0;
    for i := 1 to dm.cdsClientes.RecordCount do
      total := 0;
    begin
      for j := 1 to dm.cdsVendas.RecordCount do
      begin
        if dm.cdsClientesid.AsInteger = dm.cdsVendasfk_cliente.AsInteger then
        begin
          total := total + dm.cdsVendastotal.AsFloat;
          Inc(qtdComprasCli);
        end;
        if total > valTotalCli then
        begin
          idMelhorCli := dm.cdsClientesid.AsInteger;
          totalEmVendas.Caption := FormatFloat('R$ #,,,,0.00', total);
          numCompras.Caption := IntToStr(qtdComprasCli);
        end;
        valTotalCli := total;
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

    // Seta mês e ano atual
    dataAtual := DateToStr(now);
    mes := Copy(dataAtual, 4, 2);
    ano := Copy(dataAtual, 7, 4);
    setaMesAtual(StrToInt(mes));
    cbAno.ItemIndex := cbAno.Items.IndexOf(ano);

    // Calcula mês selecionado
    calculaResumoDoMesSelecionado(mes, ano);

    // Calcula média de vendas
    calculaMediaVendasAno(cbAno.Text);

    // Calcula porcetagens
    aux := Copy(ticketMedio.Caption, 4, 10);
    ticketMedioDataAtual := StrToFloat(StringReplace(aux, '.', '', []));

    aux := Copy(ticketTotal.Caption, 4, 10);
    ticketTotalDataAtual := StrToFloat(StringReplace(aux, '.', '', []));

    totalVendasDataAtual := StrToFloat(totalVendas.Caption);

    itensVendidosDataAtual := StrToFloat(totalItens.Caption);

    calculaPorcentagens(ticketMedioDataAtual, ticketTotalDataAtual,
      totalVendasDataAtual, itensVendidosDataAtual);
  end
  else
    ShowMessage('Não existe nenhuma venda cadastrada!');
end;

end.
