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
    Label2: TLabel;
    DBEdtNome: TDBEdit;
    Label3: TLabel;
    DBEdtCpf: TDBEdit;
    Label4: TLabel;
    DBEdtTelefone: TDBEdit;
    Label5: TLabel;
    DBEdtEmail: TDBEdit;
    Label6: TLabel;
    DBEdtDtNascimento: TDBEdit;
    Label8: TLabel;
    EdtRua: TEdit;
    DBGridVendas: TDBGrid;
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
    dbgrid: TDBGrid;
    btnFecharBusca: TButton;
    edtTotalVenda: TEdit;
    Label12: TLabel;
    procedure edtBuscarChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnCadastrarClienteClick(Sender: TObject);
    procedure btnEditarClienteClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnAdicionarClick(Sender: TObject);
    procedure edtBuscarClick(Sender: TObject);
    procedure btnFecharBuscaClick(Sender: TObject);
    procedure dbgridCellClick(Column: TColumn);
    procedure btnFinalizarClick(Sender: TObject);
    procedure edtDescontoChange(Sender: TObject);
    procedure edtAcrescimoChange(Sender: TObject);
    procedure edtFreteChange(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure DBGridVendasCellClick(Column: TColumn);
    procedure btnEditarClick(Sender: TObject);
  private
    passouAqui: Boolean;
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
    abrirDados('item', false);
    dm.cdsItens.CommandText := 'SELECT * FROM item WHERE fk_venda = ' +
      dm.cdsVendasid.Text;
    abrirDados('item', True);
  end;
end;

procedure TfrmCadastrarVenda.btnExcluirClick(Sender: TObject);
var
  I, J, idDoItemExcluido, qtdDoItemExcluido, novoEstoque, idProduto,
    qtdAtualNoEstoque: Integer;
begin
  if Application.MessageBox('Deseja realmente excluir?', 'Atenção',
    MB_YESNO + MB_ICONQUESTION) = mrYes then
  begin

    // Altera valores da venda
    edtSubtTotal.Text := FloatToStr(StrToFloat(edtSubtTotal.Text) -
      dm.cdsItensvalor_total.AsFloat);
    calculaTotalVenda;

    // Altera ids
    qtdDoItemExcluido := dm.cdsItensquantidade.AsInteger;
    idDoItemExcluido := dm.cdsItensid.AsInteger;
    numeroDeItens := numeroDeItens - 1;
    idProduto := dm.cdsItensfk_produto.AsInteger;
    abrirDados('produto', false);
    dm.cdsProdutos.CommandText := 'SELECT * FROM produto WHERE id = ' +
      IntToStr(idProduto);
    abrirDados('produto', True);
    qtdAtualNoEstoque := dm.cdsProdutosquantidade_estoque.AsInteger;
    dm.cdsItens.Delete;
    try
      dm.cdsItens.ApplyUpdates(0);

      abrirDados('item', false);
      dm.cdsItens.CommandText := 'SELECT * FROM item';
      abrirDados('item', True);
      dm.cdsItens.Last;

      for J := 1 to numeroDeItens - 1 do
      begin
        dm.cdsItens.Prior;
      end;
      idPrimeiroItem := dm.cdsItensid.AsInteger;
      if idDoItemExcluido < idPrimeiroItem then
        idPrimeiroItem := idDoItemExcluido;

      for I := 1 to numeroDeItens do
      begin
        dm.cdsItens.Edit;
        dm.cdsItensid.AsInteger := idPrimeiroItem;
        idPrimeiroItem := idPrimeiroItem + 1;
        dm.cdsItens.Post;
        dm.cdsItens.ApplyUpdates(0);
        dm.cdsItens.Next;
      end;

      // voltarEstoque
      novoEstoque := qtdAtualNoEstoque + qtdDoItemExcluido;
      abrirDados('produto', false);
      dm.cdsProdutos.CommandText := 'UPDATE produto SET quantidade_estoque = "'
        + IntToStr(novoEstoque) + '" WHERE id = ' + IntToStr(idProduto);
      try
        abrirDados('produto', True);
      except
        on E: Exception do
      end;

      abrirDados('item', false);
      ShowMessage('Item excluído com sucesso! ');
      dm.cdsItens.CommandText := 'SELECT * FROM item WHERE fk_venda = ' +
        dm.cdsVendasid.Text;
      abrirDados('item', True);
      abrirDados('cliente', false);
      dm.cdsClientes.CommandText := 'SELECT * FROM cliente';
      abrirDados('cliente', True);
    except
      on E: Exception do
      begin
        ShowMessage('Erro ao deletar item! ' + E.ToString);
      end;
    end;
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

procedure TfrmCadastrarVenda.btnFecharBuscaClick(Sender: TObject);
begin
  dbgrid.Visible := false;
  btnFecharBusca.Visible := false;
  edtBuscar.Clear;
  dm.cdsClientes.Edit;
  dm.cdsClientes.ClearFields;
  btnAdicionar.Enabled := false;
  btnCadastrarCliente.Enabled := True;
  btnEditarCliente.Enabled := false;
end;

procedure TfrmCadastrarVenda.btnFinalizarClick(Sender: TObject);
begin

  if Application.MessageBox('Deseja relamente finalizar?', 'Atenção',
    MB_YESNO + MB_ICONQUESTION) = mrYes then
  begin
    Tag := 1;
    dm.cdsVendas.Edit;
    dm.cdsVendasfk_cliente.Text := dm.cdsClientesid.Text;
    dm.cdsVendastotal.Text := edtTotalVenda.Text;
    dm.cdsVendasdata.Text := DateToStr(now);
    dm.cdsVendas.Post;
    dm.cdsVendas.ApplyUpdates(0);

    frmCadastrarVenda.Close;

    abrirDados('cliente', false);
    dm.cdsClientes.CommandText := 'SELECT * FROM cliente';
    abrirDados('cliente', True);
  end
  else
    Abort;
end;

procedure TfrmCadastrarVenda.dbgridCellClick(Column: TColumn);
begin
  edtBuscar.Text := dm.cdsClientesnome.AsString;
  dbgrid.Visible := false;
  btnFecharBusca.Visible := false;
  EdtRua.Text := dm.cdsClientesRua.AsString;
  if edtBuscar.Text = dm.cdsClientesnome.Text then
    btnAdicionar.Enabled := True;
  btnEditarCliente.Enabled := True;
  btnCadastrarCliente.Enabled := false;
end;

procedure TfrmCadastrarVenda.DBGridVendasCellClick(Column: TColumn);
begin
  btnExcluir.Enabled := True;
  btnEditar.Enabled := True;
end;

procedure TfrmCadastrarVenda.edtBuscarChange(Sender: TObject);
begin
  abrirDados('cliente', false);
  dm.cdsClientes.CommandText := 'SELECT * FROM cliente WHERE nome LIKE "' +
    LowerCase(Trim(edtBuscar.Text)) + '%" ORDER BY nome ASC;';
  abrirDados('cliente', True);
  Sleep(60);
  frmCadastrarVenda.dbgrid.DataSource := dm.dSourceClientes;
  if edtBuscar.Text = dm.cdsClientesnome.Text then
    btnAdicionar.Enabled := True;
end;

procedure TfrmCadastrarVenda.edtBuscarClick(Sender: TObject);
begin
  dbgrid.Visible := True;
  btnFecharBusca.Visible := True;
  edtBuscarChange(Self);
end;

procedure TfrmCadastrarVenda.edtAcrescimoChange(Sender: TObject);
begin
  passouAqui := false;
  if edtAcrescimo.Text = '' then
  begin
    edtAcrescimo.Text := '0';
    passouAqui := True;
  end
  else
  begin
    if passouAqui = True then
    begin
      edtAcrescimo.Text := copy(edtAcrescimo.Text, 0, 1);
      passouAqui := false;
    end;
  end;
  calculaTotalVenda;
end;

procedure TfrmCadastrarVenda.edtDescontoChange(Sender: TObject);
begin
  passouAqui := false;
  if edtDesconto.Text = '' then
  begin
    edtDesconto.Text := '0';
    passouAqui := True;
  end
  else
  begin
    if passouAqui = True then
    begin
      edtDesconto.Text := copy(edtDesconto.Text, 0, 1);
      passouAqui := false;
    end;
  end;
  calculaTotalVenda;
end;

procedure TfrmCadastrarVenda.edtFreteChange(Sender: TObject);
begin
  passouAqui := false;
  if edtFrete.Text = '' then
  begin
    edtFrete.Text := '0';
    passouAqui := True;
  end
  else
  begin
    if passouAqui = True then
    begin
      edtFrete.Text := copy(edtFrete.Text, 0, 1);
      passouAqui := false;
    end;
  end;
  calculaTotalVenda;
end;

procedure TfrmCadastrarVenda.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
  idVenda: string;
  I, J, qtdDaqueleItem, idProduto, novoEstoque, estoqueAtual,
    idDoItemExcluido: Integer;
begin
  if Tag <> 1 then // USER ESTÁ CANCELANDO A VENDA
  begin
    if Application.MessageBox('Deseja realmente sair? A venda será cancelada!',
      'Atenção', MB_YESNO + MB_ICONQUESTION) = mrYes then
    begin

      // DELETA TODOS OS ITENS DA VENDA
      abrirDados('item', false);
      dm.cdsItens.CommandText := 'SELECT * FROM item';
      abrirDados('item', True);
      dm.cdsItens.Last;

      for I := 1 to numeroDeItens - 1 do
      begin
        dm.cdsItens.Prior;
      end;

      for I := 1 to numeroDeItens do
      begin
        idProduto := dm.cdsItensfk_produto.AsInteger;
        qtdDaqueleItem := dm.cdsItensquantidade.AsInteger;
        idDoItemExcluido := dm.cdsItensid.AsInteger;
        dm.cdsItens.Delete;
        dm.cdsItens.ApplyUpdates(0);
        numeroDeItens := numeroDeItens - 1;

        abrirDados('item', false);
        ///
        dm.cdsItens.CommandText := 'SELECT * FROM item';
        abrirDados('item', True);
        dm.cdsItens.Last;

        for J := 1 to numeroDeItens - 1 do
        begin
          dm.cdsItens.Prior;
        end;
        idPrimeiroItem := dm.cdsItensid.AsInteger;

        abrirDados('produto', false);
        dm.cdsProdutos.CommandText := 'SELECT * FROM produto WHERE id = ' +
          IntToStr(idProduto);
        try
          abrirDados('produto', True);
        except
          on E: Exception do
        end;
        estoqueAtual := dm.cdsProdutosquantidade_estoque.AsInteger;
        novoEstoque := estoqueAtual + qtdDaqueleItem;
        abrirDados('produto', false);
        dm.cdsProdutos.CommandText :=
          'UPDATE produto SET quantidade_estoque = "' + IntToStr(novoEstoque) +
          '" WHERE id = ' + IntToStr(idProduto);
        try
          abrirDados('produto', True);
        except
          on E: Exception do
        end;
      end;

      // DELETA A VENDA
      idVenda := dm.cdsVendasid.Text;
      abrirDados('venda', false);
      dm.cdsVendas.CommandText := 'DELETE FROM venda WHERE id = ' + idVenda;
      try
        abrirDados('venda', True);
      except
        on E: Exception do
      end;
      abrirDados('cliente', false);
      dm.cdsClientes.CommandText := 'select * from cliente';
      abrirDados('cliente', True);
      btnCancelarClick(Self);
    end
    else
      Abort;
  end
  else
    ShowMessage('Venda realizada com sucesso! ');
  threadBuscarVenda;
end;

procedure TfrmCadastrarVenda.FormShow(Sender: TObject);
var
  id: Integer;
begin
  dm.SQLConn.Close;
  dm.SQLConn.Open;
  abrirDados('venda', false);
  dm.cdsVendas.CommandText := 'SELECT * FROM venda';
  abrirDados('venda', True);
  dm.cdsVendas.Last;
  dm.cdsVendas.Edit;
  id := dm.cdsVendasid.AsInteger + 1;
  dm.cdsVendas.Append;
  dm.cdsVendasid.AsInteger := id;
  dm.cdsVendas.Post;
  dm.cdsVendas.ApplyUpdates(0);
  abrirDados('cliente', false);
  abrirDados('item', false);
  dm.cdsClientes.CommandText := 'SELECT * FROM cliente';
  dm.cdsItens.CommandText := 'SELECT * FROM item WHERE fk_venda = ' +
    dm.cdsVendasid.Text;
  abrirDados('item', True);
  abrirDados('cliente', True);
  dm.cdsClientes.Edit;
  dm.cdsClientes.ClearFields;
  numeroDeItens := 0;
end;

procedure TfrmCadastrarVenda.btnCadastrarClienteClick(Sender: TObject);
begin
  Tag := 2;
  frmClientes.btnAdicionarClick(Self);
end;

procedure TfrmCadastrarVenda.btnEditarClienteClick(Sender: TObject);
begin
  Tag := 2;
  frmClientes.btnEditarClick(Self);
end;

end.
