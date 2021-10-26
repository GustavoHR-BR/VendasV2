unit uCadastrarCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids,
  Vcl.Mask, Vcl.DBCtrls, Vcl.DBLookup;

type
  TfrmCadastrarCliente = class(TForm)
    Label3: TLabel;
    dbEdtNome: TDBEdit;
    Label4: TLabel;
    dbEdtCpf: TDBEdit;
    Label5: TLabel;
    dbEdtTelefone: TDBEdit;
    Label6: TLabel;
    dbEdtEmail: TDBEdit;
    Label7: TLabel;
    dbEdtDtNascimento: TDBEdit;
    edtCidade: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    edtBairro: TEdit;
    Label8: TLabel;
    gridRuas: TDBGrid;
    cboxEstados: TComboBox;
    btnCancelarRua: TButton;
    btnCadastrar: TButton;
    btnCancelar: TButton;
    Label9: TLabel;
    gridBairros: TDBGrid;
    btnCancelarbairro: TButton;
    btnCancelarCidade: TButton;
    gridCidades: TDBGrid;
    edtRua: TEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure cboxEstadosSelect(Sender: TObject);
    procedure edtCidadeChange(Sender: TObject);
    procedure edtCidadeClick(Sender: TObject);
    procedure btnCancelarCidadeClick(Sender: TObject);
    procedure gridCidadesCellClick(Column: TColumn);
    procedure edtBairroClick(Sender: TObject);
    procedure edtBairroChange(Sender: TObject);
    procedure cboxEstadosClick(Sender: TObject);
    procedure gridBairrosCellClick(Column: TColumn);
    procedure btnCancelarbairroClick(Sender: TObject);
    procedure edtRuaClick(Sender: TObject);
    procedure gridRuasCellClick(Column: TColumn);
    procedure btnCancelarRuaClick(Sender: TObject);
    procedure edtRuaChange(Sender: TObject);
    procedure btnCadastrarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);

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
begin
  dm.SQLConn.Close;
  dm.SQLConn.Open;

  if dbEdtNome.Text = '' then
  begin
    ShowMessage('Nome inválido!');
    dbEdtNome.SetFocus;
  end
  else if dbEdtTelefone.Text = '(  )     -    ' then
  begin
    ShowMessage('Telefone inválido!');
    dbEdtTelefone.SetFocus;
  end
  else if dbEdtCpf.Text = '   .   .   -  ' then
  begin
    ShowMessage('CPF inválido!');
    dbEdtCpf.SetFocus;
  end
  else if dbEdtEmail.Text = '' then
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
  else if edtBairro.Text = '' then
  begin
    ShowMessage('Selecione um bairro!');
    dbEdtDtNascimento.SetFocus;
  end
  else if edtRua.Text = '' then
  begin
    ShowMessage('Selecione uma rua!');
    dbEdtDtNascimento.SetFocus;
  end
  else if (dbEdtDtNascimento.Text = '  /  /    ') then
  begin
    ShowMessage('Data de nascimento inválida!');
    dbEdtDtNascimento.SetFocus;
  end
  else
  begin
    if frmClientes.Tag = 2 then
    begin
      if dm.cdsClientesfk_rua.AsInteger = 0 then
        if dm.cdsClientesfk_rua.AsInteger <> dm.cdsRuasid.AsInteger then
          dm.cdsClientesfk_rua.AsInteger := dm.cdsRuasid.AsInteger;
      try
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
    else if frmClientes.Tag = 1 then
    begin
      if frmClientes.Tag = 1 then
      begin
        dm.cdsClientesid.Text := '0';
        dm.cdsClientesfk_rua.AsInteger := dm.cdsRuasid.AsInteger;
        try
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

procedure TfrmCadastrarCliente.btnCancelarbairroClick(Sender: TObject);
begin
  if edtBairro.Text <> '' then
    edtBairro.Clear;
  if edtRua.Text <> '' then
    edtRua.Clear;
  edtBairro.SetFocus;
  fechaBuscaBairro;
  edtRua.Enabled := false;
end;

procedure TfrmCadastrarCliente.btnCancelarCidadeClick(Sender: TObject);
begin
  if edtCidade.Text <> '' then
    edtCidade.Clear;
  if edtBairro.Text <> '' then
    edtBairro.Clear;
  if edtRua.Text <> '' then
    edtRua.Clear;
  fechaBuscaBairro;
  edtCidade.SetFocus;
  fechaBuscaCidade;
  edtRua.Enabled := false;
  edtBairro.Enabled := false;
end;

procedure TfrmCadastrarCliente.btnCancelarClick(Sender: TObject);
begin
  frmCadastrarCliente.Close;
end;

procedure TfrmCadastrarCliente.btnCancelarRuaClick(Sender: TObject);
begin
  if edtRua.Text <> '' then
    edtRua.Clear;
  edtRua.SetFocus;
  fechaBuscaRua;
end;

procedure TfrmCadastrarCliente.cboxEstadosClick(Sender: TObject);
begin
  fechaBuscaCidade;
  fechaBuscaBairro;
  fechaBuscaRua;
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
  fechaBuscaBairro;
  fechaBuscaRua;
  if edtCidade.Text <> '' then
    edtCidade.Clear;
  if edtBairro.Text <> '' then
    edtBairro.Clear;
  if edtRua.Text <> '' then
    edtRua.Clear;

  abrirDados('estado', false);
  dm.dSetEstados.CommandText := 'SELECT * from estado WHERE uf = "' +
    cboxEstados.Text + '"';
  abrirDados('estado', true);

  edtCidade.SetFocus;
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
  fechaBuscaBairro;
  fechaBuscaRua;
  buscarCidade;
end;

procedure TfrmCadastrarCliente.edtBairroChange(Sender: TObject);
begin
  buscarBairro;
  edtRua.Clear;
  edtRua.Enabled := false;
end;

procedure TfrmCadastrarCliente.edtBairroClick(Sender: TObject);
begin
  abreBuscaBairro;
  buscarBairro;
  fechaBuscaCidade;
  fechaBuscaRua;
end;

procedure TfrmCadastrarCliente.edtRuaChange(Sender: TObject);
begin
  buscarRua;
end;

procedure TfrmCadastrarCliente.edtRuaClick(Sender: TObject);
begin
  abreBuscaRua;
  buscarRua;
  fechaBuscaCidade;
  fechaBuscaBairro;
end;

procedure TfrmCadastrarCliente.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  abrirDados('cliente', false);
  if (Tag <> 1) AND (Tag <> 2) then // Tag <> 1 e 2 -> close pelo usuário;
  begin
    if Application.MessageBox('Deseja realmente sair?', 'Atenção',
      MB_YESNO + MB_ICONQUESTION) = mrYes then
    begin
      if (frmCadastrarVenda.Tag <> 1) AND (frmCadastrarVenda.Tag <> 2) then
      // Tag = 1 -> Cadastrar cliente pela venda
      // Tag = 2 ->  Editar cliente pela venda
      begin
        abrirDados('cidade', false);
        abrirDados('bairro', false);
        Sleep(150);
        verificarOrdenacaoCliente;
      end;
    end
    else
      Abort;
  end
  else
  begin
    frmClientes.edtBuscar.Text := '';
    verificarOrdenacaoCliente;
  end;
end;

procedure TfrmCadastrarCliente.FormShow(Sender: TObject);
begin
  if frmClientes.Tag = 1 then // Tag = 1 -> cadastrar
  begin
    dm.SQLConn.Close;
    dm.SQLConn.Open;
    abrirDados('rua', true);
    dm.cdsClientes.Edit;
    dm.cdsClientes.ClearFields;
  end
  else if frmClientes.Tag = 2 then // Tag = 2 -> editar
  begin
    dm.SQLConn.Close;
    dm.SQLConn.Open;
    abrirDados('rua', true);
    dm.cdsClientes.Edit;
    btnCadastrar.Caption := 'Editar';
    buscarEnderecoCliente;
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

procedure TfrmCadastrarCliente.gridBairrosCellClick(Column: TColumn);
begin
  edtBairro.OnChange := nil;
  edtBairro.Text := dm.cdsBairrosnome.AsString;
  edtBairro.OnChange := edtBairroChange;
  if edtBairro.Text <> '' then
  begin
    edtRua.Enabled := true;
    fechaBuscaBairro;
    edtRua.SetFocus;
  end
  else
    edtBairro.SetFocus;
end;

procedure TfrmCadastrarCliente.gridRuasCellClick(Column: TColumn);
begin
  edtRua.OnChange := nil;
  edtRua.Text := dm.cdsRuasnome.AsString;
  edtRua.OnChange := edtRuaChange;
  if edtBairro.Text <> '' then
  begin
    fechaBuscaRua;
  end
  else
    edtBairro.SetFocus;
end;

end.
