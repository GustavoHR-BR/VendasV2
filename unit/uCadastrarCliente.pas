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
    { Private declarations }
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

  if (dbEdtNome.Text = '') OR (Length(dbEdtNome.Text) < 5) then
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
  else if (dbEdtEmail.Text = '') OR (Length(Trim(dbEdtEmail.Text)) < 8) then
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
  else if (edtBairro.Text = '') OR (Length(Trim(edtBairro.Text)) < 5) then
  begin
    ShowMessage('Bairro inválido!');
    dbEdtDtNascimento.SetFocus;
  end
  else if (edtRua.Text = '') OR (Length(Trim(edtRua.Text)) < 5) then
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
    if frmClientes.Tag = 2 then // Editando cliente
    begin
      try
        dm.cdsClientes.Edit;
        dm.cdsClientesfk_cidade.AsString := dm.cdsCidadesid.AsString;
        dm.cdsClientesrua.AsString := Trim(edtRua.Text);
        dm.cdsClientesbairro.AsString := Trim(edtBairro.Text);
        dm.cdsClientes.Post;
        dm.cdsClientes.ApplyUpdates(0);
        ShowMessage('Cliente editado com sucesso! ');
        Tag := 2;
        frmCadastrarCliente.Close;
      except
        on E: Exception do
          ShowMessage('Erro ao editar o cliente! ' + E.ToString);
      end;
    end
    else if frmClientes.Tag = 1 then // Cadastrando cliente
    begin
      if frmClientes.Tag = 1 then
      begin
        dm.cdsClientesid.Text := '0';
        try
          dm.cdsClientes.Edit;
          dm.cdsClientesfk_cidade.AsString := dm.cdsCidadesid.AsString;
          dm.cdsClientesrua.AsString := Trim(edtRua.Text);
          dm.cdsClientesbairro.AsString := Trim(edtBairro.Text);
          dm.cdsClientes.Post;
          dm.cdsClientes.ApplyUpdates(0);
          ShowMessage('Cliente cadastrado com sucesso! ');
          Tag := 1;
          frmCadastrarCliente.Close;
        except
          on E: Exception do
            ShowMessage('Erro ao cadastrar o cliente! ' + E.ToString);
        end;
      end;
    end;
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
  if (Tag <> 1) AND (Tag <> 2) then // close pelo usuário;
  begin
    if Application.MessageBox('Deseja realmente sair?', 'Atenção',
      MB_YESNO + MB_ICONQUESTION) <> mrYes then
      Abort;
  end;
  // Após editar ou cadastrar, lista todos os clientes
  frmClientes.edtBuscar.Text := '';
  frmClientes.cbOrdenarPor.ItemIndex := 0;
  dm.cdsClientes.Filtered := false;
  abrirDados('cliente', false);
  abrirDados('cliente', true);

  if frmCadastrarVenda.Tag = 2 then // Cadastrando cliente pela venda
  begin
    dm.cdsClientes.IndexFieldNames := 'id';
    dm.cdsClientes.Last;
    frmCadastrarVenda.edtBuscar.Text := dm.cdsClientesnome.AsString;
    frmCadastrarVenda.btnAdicionar.Enabled := true;
    frmCadastrarVenda.btnAdicionar.SetFocus;
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
