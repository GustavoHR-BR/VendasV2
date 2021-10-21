unit uCadastrarCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids,
  Vcl.Mask, Vcl.DBCtrls;

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

uses uClientes, uDataModule, uFiltroCli, uFunctions, uPrincipal;

procedure TfrmCadastrarCliente.btnCadastrarClick(Sender: TObject);
begin
  if dbEdtNome.Text = '' then
  begin
    ShowMessage('Preencha o nome!');
    dbEdtNome.SetFocus;
  end
  else if dbEdtTelefone.Text = '(  )     -    ' then
  begin
    ShowMessage('Preencha o telefone!');
    dbEdtTelefone.SetFocus;
  end
  else if dbEdtCpf.Text = '   .   .   -  ' then
  begin
    ShowMessage('Preencha o CPF!');
    dbEdtCpf.SetFocus;
  end
  else if dbEdtEmail.Text = '' then
  begin
    ShowMessage('Preencha o e-mail!');
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
  else if dbEdtDtNascimento.Text = '  /  /    ' then
  begin
    ShowMessage('Preencha a data de nascimento!');
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
  else
  begin
    dm.cdsClientesid.Text := '';
    dm.cdsClientesfk_rua.AsInteger := dm.cdsRuasid.AsInteger;
    dm.cdsClientes.Post;
    try
      dm.cdsClientes.ApplyUpdates(0);
      ShowMessage('Cliente cadastrado com sucesso! ');
    except
      on E: Exception do
        ShowMessage('Erro ao cadastrar o cliente! ');
    end;
  end;
end;

procedure TfrmCadastrarCliente.btnCancelarbairroClick(Sender: TObject);
begin
  if edtBairro.Text <> '' then
    edtBairro.Clear;
  edtBairro.SetFocus;
  fechaBuscaBairro;
end;

procedure TfrmCadastrarCliente.btnCancelarCidadeClick(Sender: TObject);
begin
  if edtCidade.Text <> '' then
    edtCidade.Clear;
  fechaBuscaBairro;
  edtCidade.SetFocus;
  fechaBuscaCidade;
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

  edtCidade.SetFocus;
end;

procedure TfrmCadastrarCliente.edtCidadeChange(Sender: TObject);
begin
  fechaBuscaBairro;
  fechaBuscaRua;
  if edtBairro.Text <> '' then
    edtBairro.Clear;
  if edtRua.Text <> '' then
    edtRua.Clear;
  gridCidades.Visible := true;
  btnCancelarCidade.Visible := true;
  buscarCidade;
end;

procedure TfrmCadastrarCliente.edtCidadeClick(Sender: TObject);
begin
  gridCidades.Visible := true;
  btnCancelarCidade.Visible := true;
  fechaBuscaBairro;
  fechaBuscaRua;
  buscarCidade;
end;

procedure TfrmCadastrarCliente.edtBairroChange(Sender: TObject);
begin
  fechaBuscaCidade;
  fechaBuscaRua;
  if edtRua.Text <> '' then
    edtRua.Clear;
  gridBairros.Visible := true;
  btnCancelarbairro.Visible := true;
  buscarBairro;
end;

procedure TfrmCadastrarCliente.edtBairroClick(Sender: TObject);
begin
  gridBairros.Visible := true;
  btnCancelarbairro.Visible := true;
  fechaBuscaCidade;
  fechaBuscaRua;
  buscarBairro;
end;

procedure TfrmCadastrarCliente.edtRuaChange(Sender: TObject);
begin
  fechaBuscaCidade;
  fechaBuscaBairro;
  if edtRua.Text <> '' then
    edtRua.Clear;
  gridRuas.Visible := true;
  btnCancelarRua.Visible := true;
  buscarRua;
end;

procedure TfrmCadastrarCliente.edtRuaClick(Sender: TObject);
begin
  gridRuas.Visible := true;
  btnCancelarRua.Visible := true;
  fechaBuscaCidade;
  fechaBuscaBairro;
  buscarRua;
end;

procedure TfrmCadastrarCliente.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if Application.MessageBox('Deseja realmente sair?', 'Atenção',
    MB_YESNO + MB_ICONQUESTION) = mrYes then
  begin
    dm.dSetCidades.Close;
    dm.cdsCidades.Close;
    dm.dSetBairros.Close;
    dm.cdsBairros.Close;
    dm.dSetRuas.Close;
    dm.cdsRuas.Close;
    dm.dSetClientes.Close;
    dm.cdsClientes.Close;
    dm.dSetClientes.Open;
    dm.cdsClientes.Open;
  end
  else
    Abort;
end;

procedure TfrmCadastrarCliente.FormShow(Sender: TObject);
begin
  dm.dSetRuas.Open;
  dm.cdsRuas.Open;
  dm.cdsClientes.Edit;
  dm.cdsClientes.ClearFields;
end;

procedure TfrmCadastrarCliente.gridCidadesCellClick(Column: TColumn);
begin
  edtCidade.Text := dm.cdsCidadesnome.AsString;
  if edtCidade.Text <> '' then
  begin
    edtBairro.Enabled := true;
    edtBairro.SetFocus;
    fechaBuscaCidade;
    fechaBuscaBairro;
    fechaBuscaRua;
  end
  else
    edtCidade.SetFocus;
end;

procedure TfrmCadastrarCliente.gridBairrosCellClick(Column: TColumn);
begin
  edtBairro.Text := dm.cdsBairrosnome.AsString;
  if edtBairro.Text <> '' then
  begin
    edtRua.Enabled := true;
    edtRua.SetFocus;
    fechaBuscaCidade;
    fechaBuscaBairro;
    fechaBuscaRua;
  end
  else
    edtBairro.SetFocus;
end;

procedure TfrmCadastrarCliente.gridRuasCellClick(Column: TColumn);
begin
  edtRua.Text := dm.cdsRuasnome.AsString;
  fechaBuscaRua;
end;

end.
