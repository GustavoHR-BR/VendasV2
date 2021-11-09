unit uCadastrarVenda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.DBCtrls,
  Vcl.Mask, Vcl.Grids, Vcl.DBGrids, Data.FMTBcd, Data.DB, Data.SqlExpr;

type
  TfrmCadastrarVenda = class(TForm)
    edtBuscar: TEdit;
    Label1: TLabel;
    btnCadastrarCliente: TSpeedButton;
    btnEditarCliente: TSpeedButton;
    Label3: TLabel;
    DBEdtCpf: TDBEdit;
    Label4: TLabel;
    DBEdtTelefone: TDBEdit;
    Label5: TLabel;
    DBEdtEmail: TDBEdit;
    Label6: TLabel;
    DBEdtDtNascimento: TDBEdit;
    Label8: TLabel;
    DBGridItens: TDBGrid;
    edtSubtTotal: TEdit;
    edtDesconto: TEdit;
    edtAcrescimo: TEdit;
    edtFrete: TEdit;
    btnFinalizar: TButton;
    btnCancelar: TButton;
    btnAdicionar: TButton;
    btnEditar: TButton;
    Label7: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    btnExcluir: TButton;
    dbgridClientes: TDBGrid;
    btnFecharBusca: TButton;
    edtTotalVenda: TEdit;
    Label12: TLabel;
    DBEdtRua: TDBEdit;
    Label2: TLabel;
    DBEdtBairro: TDBEdit;
    procedure edtBuscarChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnCadastrarClienteClick(Sender: TObject);
    procedure btnEditarClienteClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnAdicionarClick(Sender: TObject);
    procedure edtBuscarClick(Sender: TObject);
    procedure btnFecharBuscaClick(Sender: TObject);
    procedure dbgridClientesCellClick(Column: TColumn);
    procedure btnFinalizarClick(Sender: TObject);
    procedure edtDescontoChange(Sender: TObject);
    procedure edtAcrescimoChange(Sender: TObject);
    procedure edtFreteChange(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure FormClick(Sender: TObject);
  private
  public
    numeroDeItens, idPrimeiroItem: Integer;
    idDoItem: string;
  end;

var
  frmCadastrarVenda: TfrmCadastrarVenda;

implementation

uses
  uCadastrarCliente, uCadastrarProduto, uClientes, uDataModule, uFiltroCli,
  uFunctions, uPrincipal, uProdutos, uVendaReport, uVendas, uAdicionarItem;

{$R *.dfm}

procedure TfrmCadastrarVenda.btnAdicionarClick(Sender: TObject);
begin
  Application.CreateForm(TfrmAdicionarItem, frmAdicionarItem);
  Tag := 4;
  try
    frmAdicionarItem.ShowModal;
  finally
    FreeAndNil(frmAdicionarItem);
  end;
end;

procedure TfrmCadastrarVenda.btnExcluirClick(Sender: TObject);
begin
  if Application.MessageBox('Deseja realmente excluir?', 'Atenção',
    MB_YESNO + MB_ICONQUESTION) = mrYes then
  begin
    dm.cdsProdutos.Edit;
    dm.cdsProdutosquantidade_estoque.AsInteger :=
      dm.cdsProdutosquantidade_estoque.AsInteger +
      dm.cdsItensquantidade.AsInteger;
    try
      dm.cdsItens.Delete;
    except
      on E: Exception do
        ShowMessage('Erro ao excluir o item! ' + E.ToString);
    end;
    if DBGridItens.DataSource.DataSet.RecordCount = 0 then
    begin
      edtSubtTotal.Text := '0';
      edtTotalVenda.Text := '0';
      btnEditar.Enabled := false;
      btnExcluir.Enabled := false;
      btnFinalizar.Enabled := false;
    end;
    Tag := 5;
    calculaSubTotalVenda;
    calculaTotalVenda;
  end;
end;

procedure TfrmCadastrarVenda.btnEditarClick(Sender: TObject);
begin
  Application.CreateForm(TfrmAdicionarItem, frmAdicionarItem);
  Tag := 3;
  try
    frmAdicionarItem.ShowModal;
  finally
    FreeAndNil(frmAdicionarItem);
  end;
end;

procedure TfrmCadastrarVenda.btnCancelarClick(Sender: TObject);
begin
  frmCadastrarVenda.Close;
end;

procedure TfrmCadastrarVenda.btnFinalizarClick(Sender: TObject);
begin
  if DBGridItens.DataSource.DataSet.RecordCount > 0 then
  begin
    if edtBuscar.Text = dm.cdsClientesnome.Text then
    begin
      if Application.MessageBox('Deseja relamente finalizar?', 'Atenção',
        MB_YESNO + MB_ICONQUESTION) = mrYes then
      begin
        dm.cdsVendasfk_cliente.AsInteger := dm.cdsClientesid.AsInteger;
        dm.cdsVendastotal.AsString := edtTotalVenda.Text;
        dm.cdsVendasdata.AsString := DateToStr(now);
        try
          dm.cdsVendas.ApplyUpdates(0);
          dm.cdsItens.ApplyUpdates(0);
          dm.cdsProdutos.ApplyUpdates(0);
        except
          on E: Exception do
            ShowMessage('Erro ao finalizar a venda: ' + E.ToString);
        end;
        Tag := 1;
        frmCadastrarVenda.Close;
      end
      else
        Abort;
    end
    else
      ShowMessage('Para finalizar a venda é necessário escolher um cliente!');
  end
  else
    ShowMessage('Para ser finalizada a venda precisa possuir ao menos 1 item!');
end;

procedure TfrmCadastrarVenda.dbgridClientesCellClick(Column: TColumn);
begin
  edtBuscar.Text := dm.cdsClientesnome.AsString;
  dbgridClientes.Visible := false;
  btnFecharBusca.Visible := false;
  btnAdicionar.Enabled := True;
  btnCadastrarCliente.Enabled := false;
  btnEditarCliente.Enabled := True;
  btnAdicionar.SetFocus;
end;

procedure TfrmCadastrarVenda.btnFecharBuscaClick(Sender: TObject);
begin
  edtBuscar.Clear;
  edtBuscar.SetFocus;
  dbgridClientes.Visible := false;
  btnFecharBusca.Visible := false;
  btnCadastrarCliente.Enabled := True;
  btnEditarCliente.Enabled := false;
  btnAdicionar.Enabled := false;

  // Limpa edits cliente
  DBEdtCpf.Text := '';
  DBEdtTelefone.Text := '';
  DBEdtEmail.Text := '';
  DBEdtDtNascimento.Text := '';
  DBEdtRua.Text := '';
  DBEdtBairro.Text := '';
end;

procedure TfrmCadastrarVenda.edtBuscarChange(Sender: TObject);
begin
  dm.cdsClientes.Filtered := false;
  dm.cdsClientes.FilterOptions := [foCaseInsensitive];
  dm.cdsClientes.Filter := 'nome LIKE ' +
    QuotedStr('%' + Trim(edtBuscar.Text) + '%');
  dm.cdsClientes.Filtered := True;
  Sleep(60);
end;

procedure TfrmCadastrarVenda.edtBuscarClick(Sender: TObject);
begin
  dbgridClientes.Visible := True;
  btnFecharBusca.Visible := True;
end;

procedure TfrmCadastrarVenda.edtAcrescimoChange(Sender: TObject);
begin
  calculaTotalVenda;
end;

procedure TfrmCadastrarVenda.edtDescontoChange(Sender: TObject);
begin
  calculaTotalVenda;
end;

procedure TfrmCadastrarVenda.edtFreteChange(Sender: TObject);
begin
  calculaTotalVenda;
end;

procedure TfrmCadastrarVenda.FormClick(Sender: TObject);
begin
  dbgridClientes.Visible := false;
  btnFecharBusca.Visible := false;
end;

procedure TfrmCadastrarVenda.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if Tag <> 1 then // USER ESTÁ CANCELANDO A VENDA
  begin
    if Application.MessageBox('Deseja realmente sair? A venda será cancelada!',
      'Atenção', MB_YESNO + MB_ICONQUESTION) <> mrYes then
      Abort;
  end
  else
  begin
    ShowMessage('Venda realizada com sucesso! ');
    frmVendas.cdsVendas.Close;
    frmVendas.dSetVendas.Close;
    frmVendas.cdsItens.Close;
    frmVendas.dSetItens.Close;
    frmVendas.cdsVendas.Open;
    frmVendas.dSetVendas.Open;
    frmVendas.cdsItens.Open;
    frmVendas.dSetItens.Open;
  end;
end;

procedure TfrmCadastrarVenda.FormShow(Sender: TObject);
var
  id: Integer;
begin
  dm.cdsClientes.Filtered := false;

  // Cria nova venda em memória
  dm.cdsVendas.Filtered := false;
  dm.cdsVendas.IndexFieldNames := 'id';
  dm.cdsVendas.Last;
  id := dm.cdsVendasid.AsInteger + 1;
  dm.cdsVendas.Append;
  dm.cdsVendas.Edit;
  dm.cdsVendasid.AsInteger := id;

  // Filtra os itens da nova venda
  dm.cdsItens.Filtered := false;
  dm.cdsItens.FilterOptions := [foCaseInsensitive];
  dm.cdsItens.Filter := 'fk_venda = ' +
    QuotedStr(Trim(dm.cdsVendasid.AsString));
  dm.cdsItens.Filtered := True;

  // Limpa edits clientes
  DBEdtCpf.Text := '';
  DBEdtTelefone.Text := '';
  DBEdtEmail.Text := '';
  DBEdtDtNascimento.Text := '';
  DBEdtRua.Text := '';
  DBEdtBairro.Text := '';
end;

procedure TfrmCadastrarVenda.btnCadastrarClienteClick(Sender: TObject);
begin
  Tag := 2;
  frmClientes.btnAdicionarClick(Self);
  dbgridClientes.Visible := false;
  btnFecharBusca.Visible := false;
end;

procedure TfrmCadastrarVenda.btnEditarClienteClick(Sender: TObject);
begin
  Tag := 3;
  frmClientes.btnEditarClick(Self);
  dbgridClientes.Visible := false;
  btnFecharBusca.Visible := false;
end;

end.
