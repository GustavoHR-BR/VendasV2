unit uCadastrarCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids,
  Vcl.Mask, Vcl.DBCtrls, Vcl.DBLookup, db;

type
  TfrmCadastrarCliente = class(TForm)
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    dbEdtDtNascimento: TDBEdit;
    edtCidade: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label8: TLabel;
    cboxEstados: TComboBox;
    btnCadastrar: TButton;
    btnCancelar: TButton;
    Label9: TLabel;
    btnCancelarCidade: TButton;
    gridCidades: TDBGrid;
    btnCancelarRua: TButton;
    edtBairro: TEdit;
    edtRua: TEdit;
    dbEdtNome: TDBEdit;
    dbEdtTelefone: TDBEdit;
    dbEdtCpf: TDBEdit;
    dbEdtEmail: TDBEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure cboxEstadosSelect(Sender: TObject);
    procedure edtCidadeChange(Sender: TObject);
    procedure edtCidadeClick(Sender: TObject);
    procedure btnCancelarCidadeClick(Sender: TObject);
    procedure gridCidadesCellClick(Column: TColumn);
    procedure cboxEstadosClick(Sender: TObject);
    procedure btnCadastrarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure edtBairroChange(Sender: TObject);
    procedure FormClick(Sender: TObject);

  private
    id, fk_cidade, nome, cpf, telefone, email, data_nascimento, rua,
      bairro: string;
  public
    { Public declarations }
  end;

var
  frmCadastrarCliente: TfrmCadastrarCliente;

implementation

{$R *.dfm}

uses uClientes, uDataModule, uFiltroCli, uFunctions, uPrincipal,
  uCadastrarProduto, uCadastrarVenda, uProdutos, uVendaReport, uVendas;

procedure TfrmCadastrarCliente.btnCadastrarClick(Sender: TObject);
var
  dia, mes, ano: string;
begin
  dia := Copy(dbEdtDtNascimento.Text, 0, 2);
  mes := Copy(dbEdtDtNascimento.Text, 4, 2);
  ano := Copy(dbEdtDtNascimento.Text, 7, 4);

  if (dbEdtNome.Text = '') OR (Length(dbEdtNome.Text) < 5) OR
    (Length(dbEdtNome.Text) > 30) then
  begin
    ShowMessage('Nome inválido!');
    dbEdtNome.SetFocus;
  end
  else if (dbEdtTelefone.Text = '(  )     -    ') OR
    (Length(Trim(dbEdtTelefone.Text)) < 14) then
  begin
    ShowMessage('Telefone inválido!');
    dbEdtTelefone.SetFocus;
  end
  else if (dbEdtCpf.Text = '   .   .   -  ') OR
    (Length(Trim(dbEdtCpf.Text)) < 14) then
  begin
    ShowMessage('CPF inválido!');
    dbEdtCpf.SetFocus;
  end
  else if (dbEdtEmail.Text = '') OR (Length(Trim(dbEdtEmail.Text)) < 6) OR
    (Length(Trim(dbEdtEmail.Text)) > 25) then
  begin
    ShowMessage('E-mail inválido!');
    dbEdtEmail.SetFocus;
  end
  else if cboxEstados.Text = '' then
  begin
    ShowMessage('Selecione um estado!');
    dbEdtDtNascimento.SetFocus;
  end
  else if edtCidade.Text = '' then
  begin
    ShowMessage('Selecione uma cidade!');
    dbEdtDtNascimento.SetFocus;
  end
  else if (edtBairro.Text = '') OR (Length(Trim(edtBairro.Text)) < 5) OR
    (Length(Trim(edtBairro.Text)) > 30) then
  begin
    ShowMessage('Bairro inválido!');
    dbEdtDtNascimento.SetFocus;
  end
  else if (edtRua.Text = '') OR (Length(Trim(edtRua.Text)) < 5) OR
    (Length(Trim(edtRua.Text)) > 30) then
  begin
    ShowMessage('Rua inválida!');
    dbEdtDtNascimento.SetFocus;
  end
  else if (dbEdtDtNascimento.Text = '  /  /    ') OR
    ((StrToInt(dia) < 1) OR (StrToInt(dia) > 31)) OR
    ((StrToInt(mes) < 1) OR (StrToInt(mes) > 12)) OR
    ((StrToInt(ano) < 1921) OR (StrToInt(ano) > 2021)) then
  begin
    ShowMessage('Data de nascimento inválida!');
    dbEdtDtNascimento.SetFocus;
  end
  else
  begin
    dm.cdsClientes.Edit;
    if frmClientes.Tag = 1 then // Cadastrando novo cliente
    begin
      dm.cdsClientesid.Text := '0';
      dm.cdsClientesfk_cidade.AsString := dm.cdsCidadesid.AsString;
      dm.cdsClientesrua.AsString := Trim(edtRua.Text);
      dm.cdsClientesbairro.AsString := Trim(edtBairro.Text);
      try
        dm.cdsClientes.Post;
        dm.cdsClientes.ApplyUpdates(0);
      except
        on E: Exception do
          ShowMessage('Erro ao cadastrar o cliente! ' + E.ToString);
      end;
      ShowMessage('Cliente cadastrado com sucesso! ');
      if frmCadastrarVenda.Tag = 2 then // Cadastrando cliente pela venda
      begin
        dm.cdsClientes.IndexFieldNames := 'id';
        dm.cdsClientes.Last;
        frmCadastrarVenda.edtBuscar.Text := dm.cdsClientesnome.AsString;
        frmCadastrarVenda.btnAdicionar.Enabled := true;
        frmCadastrarVenda.btnAdicionar.SetFocus;
      end
    end
    else // Editando cliente
    begin
      id := dm.cdsClientesid.AsString;
      fk_cidade := dm.cdsCidadesid.AsString;
      nome := dm.cdsClientesnome.AsString;
      cpf := dm.cdsClientescpf.AsString;
      telefone := dm.cdsClientestelefone.AsString;
      email := dm.cdsClientesemail.AsString;
      data_nascimento := dm.cdsClientesdata_nascimento.AsString;
      rua := Trim(edtRua.Text);
      bairro := Trim(edtBairro.Text);
      abrirDados('cliente', false);
      dm.cdsClientes.CommandText := 'UPDATE cliente SET nome = "' + nome +
        '", fk_cidade = "' + fk_cidade + '", cpf = "' + cpf + '", telefone = "'
        + telefone + '", email = "' + email + '", data_nascimento = "' +
        data_nascimento + '", rua = "' + rua + '", bairro = "' + bairro +
        '" WHERE id = ' + id;
      try
        abrirDados('cliente', true);
      except
        on E: Exception do
      end;
      ShowMessage('Cliente editado com sucesso! ');

      if frmCadastrarVenda.Tag = 3 then // Editando cliente pela venda
      begin
        resetQuery;
        dm.cdsClientes.Locate('nome', nome, []); // TESTAR
        frmCadastrarVenda.edtBuscar.Text := dm.cdsClientesnome.AsString;
      end
    end;

    Tag := 2;
    frmCadastrarCliente.Close;
  end;
end;

procedure TfrmCadastrarCliente.btnCancelarCidadeClick(Sender: TObject);
begin
  if edtCidade.Text <> '' then
    edtCidade.Clear;
  if edtBairro.Text <> '' then
    edtBairro.Clear;
  if edtRua.Text <> '' then
    edtRua.Clear;
  edtCidade.SetFocus;
  fechaBuscaCidade;
  edtRua.Enabled := false;
  edtBairro.Enabled := false;
end;

procedure TfrmCadastrarCliente.btnCancelarClick(Sender: TObject);
begin
  frmCadastrarCliente.Close;
end;

procedure TfrmCadastrarCliente.cboxEstadosClick(Sender: TObject);
begin
  fechaBuscaCidade;
  if edtCidade.Text <> '' then
    edtCidade.Clear;
  if edtBairro.Text <> '' then
    edtBairro.Clear;
  if edtRua.Text <> '' then
    edtRua.Clear;
end;

procedure TfrmCadastrarCliente.cboxEstadosSelect(Sender: TObject);
begin
  edtCidade.Enabled := true;
  if edtCidade.Text <> '' then
    edtCidade.Clear;
  fechaBuscaCidade;
  if edtCidade.Text <> '' then
    edtCidade.Clear;
  if edtBairro.Text <> '' then
    edtBairro.Clear;
  if edtRua.Text <> '' then
    edtRua.Clear;

  edtCidade.SetFocus;
end;

procedure TfrmCadastrarCliente.edtBairroChange(Sender: TObject);
begin
  edtRua.Enabled := true;
end;

procedure TfrmCadastrarCliente.edtCidadeChange(Sender: TObject);
begin
  buscarCidade;
  edtBairro.Clear;
  edtBairro.Enabled := false;
  edtRua.Clear;
  edtRua.Enabled := false;
end;

procedure TfrmCadastrarCliente.edtCidadeClick(Sender: TObject);
begin
  abreBuscaCidade;
  buscarCidade;
end;

procedure TfrmCadastrarCliente.FormClick(Sender: TObject);
begin
  gridCidades.Visible := false;
  btnCancelarCidade.Visible := false;
end;

procedure TfrmCadastrarCliente.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if (Tag <> 1) AND (Tag <> 2) then // alterações não foram concluida;
  begin
    if Application.MessageBox('Deseja realmente sair?', 'Atenção',
      MB_YESNO + MB_ICONQUESTION) = mrYes then
    begin
      if (frmCadastrarVenda.Tag <> 2) AND (frmCadastrarVenda.Tag <> 3) then
      // Tag = 2 Cancelando cadastro de cliente pela venda
      // Tag = 3 Cancelando edição de cliente pela venda
      begin
        // Atualiza os clientes
        frmClientes.edtBuscar.Text := '';
        resetQuery;
        dm.cdsClientes.Filtered := false;
      end;
    end
    else
      Abort;
  end;
  if (frmCadastrarVenda.Tag <> 2) AND (frmCadastrarVenda.Tag <> 3) then
  // Tag = 2 Cancelando cadastro de cliente pela venda
  // Tag = 3 Cancelando edição de cliente pela venda
  begin
    // Atualiza os clientes
    frmClientes.edtBuscar.Text := '';
    resetQuery;
    dm.cdsClientes.Filtered := false;
  end;
end;

procedure TfrmCadastrarCliente.FormShow(Sender: TObject);
begin
  if frmClientes.Tag = 1 then // Cadastrando cliente
  begin
    dm.cdsClientes.Edit;
    dm.cdsClientes.ClearFields;
  end
  else if frmClientes.Tag = 2 then // Editando cliente
  begin
    dm.cdsClientes.Edit;
    btnCadastrar.Caption := 'Editar';
    buscarEnderecoCliente(dm.cdsClientesid.AsInteger);
    edtCidade.Enabled := true;
    edtBairro.Enabled := true;
    edtRua.Enabled := true;
  end;
end;

procedure TfrmCadastrarCliente.gridCidadesCellClick(Column: TColumn);
begin
  edtCidade.OnChange := nil;
  edtCidade.Text := dm.cdsCidadesnome.AsString;
  edtCidade.OnChange := edtCidadeChange;
  if edtCidade.Text <> '' then
  begin
    fechaBuscaCidade;
    edtBairro.Enabled := true;
    edtBairro.SetFocus;
    edtBairro.Clear;
  end
  else
    edtCidade.SetFocus;
end;

end.
