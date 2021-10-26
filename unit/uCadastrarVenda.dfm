object frmCadastrarVenda: TfrmCadastrarVenda
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Nova venda'
  ClientHeight = 458
  ClientWidth = 744
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 16
    Width = 52
    Height = 15
    Caption = 'Pesquisar:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial Unicode MS'
    Font.Style = []
    ParentFont = False
  end
  object btnCadastrarCliente: TSpeedButton
    Left = 351
    Top = 39
    Width = 26
    Height = 23
    Hint = 'Cadastrar novo cliente'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial Unicode MS'
    Font.Style = []
    Glyph.Data = {
      06030000424D06030000000000003600000028000000100000000F0000000100
      180000000000D002000000000000000000000000000000000000DFDEDCDFDEDC
      E2E0DEE1DFDDE3DFDFE0E2DCE2E3DEE5E5E1E5E5E1E4E0E6E2E5DFE2E3E2E4E5
      E3E3E4E2E3E4E2E5E6E4E0DFDDE2E0DEE1DFDEE1DFDEE0E1DBE1E0E7E0D5B8E3
      D7AEE3D8B1E2D9CBE4E4E5E2E3E1E5E6E4E3E4E2E5E6E4E5E6E4E2E0DEE2DFDE
      E0E0DDDFE0DEE0E0DFE6E8F1C2A21ABF9800BD9800B39F39E6ECF1E3E4E1E5E6
      E4E5E6E4E4E5E3E4E5E3E2E0DEE2DFDEE0E0DDE1E1DFE1E0DFE6E7F2C8A929C3
      A000C29F00B9A64BE6ECF1E4E4E2E5E6E4E6E7E5E5E6E4E5E6E4E2E0DEE1E0DE
      E0DFDDE2E1DFE1E0DFE6E8F4C9AB24C3A000C2A000BAA74CE5EDF1E3E4E3E6E7
      E5E7E7E5E7E7E5E7E7E5E2E0DFE6E5ECE6E6F4E5E5F3E5E7F3E9EEFFC8AB2AC5
      A200C2A100BAA956EAF4FFE9EBFAE8ECFAE8ECFAE7E9EBE7E7E5DDE0DFBCA95B
      BEA310C5A714C4A727C5AB30C5A204C5A300C5A401CCAB29CBA820C7AA14C8A8
      1ABE9D05D8D7BBE7E9E9DFDFE1B4A545C19F01C4A100C3A100C7A201C5A300C4
      A300C4A400BEA000C39E00C4A100C6A200C39B00E4DBBFE7E8EBE0E1E1C4A664
      CBAB2AC6AA1FC8A924CEAB27C6A406C5A300C6A503C3A618D4B031CCAD2DCFB0
      3BCAA818DDDEC3E7E8EAE4E2E0E4E5ECE3E5EAEAEAEFE6E8EEECF2FFCCB134C7
      A300C0A001BCA967F0F1FFE9E7F2E9E8F2ECEEEEE2E8EAE6E6E5E1E3E0E2E3E0
      E2E3E1E1E3E0E1E2E1E6E8F6CBB130C5A500C4A401BEAC5CE8EDF3E5E6E5E6E7
      E5E6E7E6E7E6E5E7E7E5E1E2DFE3E4E1E3E4E0E2E3E1E3E4E0E4E9F4C9B033CA
      A710C7A611BAAA5DEAEEF4E7E7E5E7E7E5E7E7E5E6E6E4E8E9E6E1E2DFE3E4E1
      E2E3E1E3E4E1E3E5DFE5E9F3C8AC2BC39F00C5A102B5A362EAEEF4E7E6E4E6E6
      E4E6E6E4E6E6E4E8E9E6E1E2DFE3E4E1E4E5E3E4E5E3E1E6E1E4E5E9ECDDAFF1
      DFA6F1E0A8EDE3C2E5E7EAE6E7E4E9EAE6E7E7E5E7E8E5E8E9E5E1E2DFE1E2DF
      E3E4E1E3E3E1E2E3E0E4E5E2E5E6E6E6E8E9E6E7E8E8E9E9E7E7E8E7E8E7E8E8
      E8E8E7E7E8E8E8E8E8E7}
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    OnClick = btnCadastrarClienteClick
  end
  object btnEditarCliente: TSpeedButton
    Left = 383
    Top = 39
    Width = 26
    Height = 23
    Hint = 'Editar cliente selecionado'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial Unicode MS'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    OnClick = btnEditarClienteClick
  end
  object Label2: TLabel
    Left = 24
    Top = 80
    Width = 31
    Height = 15
    Caption = 'Nome:'
    FocusControl = DBEdtNome
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial Unicode MS'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 440
    Top = 21
    Width = 25
    Height = 15
    Caption = 'CPF:'
    FocusControl = DBEdtCpf
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial Unicode MS'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 230
    Top = 83
    Width = 45
    Height = 15
    Caption = 'Telefone:'
    FocusControl = DBEdtTelefone
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial Unicode MS'
    Font.Style = []
    ParentFont = False
  end
  object Label5: TLabel
    Left = 367
    Top = 80
    Width = 32
    Height = 15
    Caption = 'E-mail:'
    FocusControl = DBEdtEmail
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial Unicode MS'
    Font.Style = []
    ParentFont = False
  end
  object Label6: TLabel
    Left = 584
    Top = 21
    Width = 55
    Height = 15
    Caption = 'Anivers'#225'rio'
    FocusControl = DBEdtDtNascimento
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial Unicode MS'
    Font.Style = []
    ParentFont = False
  end
  object Label8: TLabel
    Left = 559
    Top = 80
    Width = 20
    Height = 15
    Caption = 'Rua'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial Unicode MS'
    Font.Style = []
    ParentFont = False
  end
  object Label7: TLabel
    Left = 24
    Top = 396
    Width = 50
    Height = 15
    Caption = 'Sub-Total:'
    FocusControl = DBEdtTelefone
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial Unicode MS'
    Font.Style = []
    ParentFont = False
  end
  object Label9: TLabel
    Left = 128
    Top = 396
    Width = 71
    Height = 15
    Caption = 'Desconto (%):'
    FocusControl = DBEdtTelefone
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial Unicode MS'
    Font.Style = []
    ParentFont = False
  end
  object Label10: TLabel
    Left = 230
    Top = 396
    Width = 75
    Height = 15
    Caption = 'Acr'#233'scimo (%):'
    FocusControl = DBEdtTelefone
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial Unicode MS'
    Font.Style = []
    ParentFont = False
  end
  object Label11: TLabel
    Left = 336
    Top = 396
    Width = 29
    Height = 15
    Caption = 'Frete:'
    FocusControl = DBEdtTelefone
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial Unicode MS'
    Font.Style = []
    ParentFont = False
  end
  object edtBuscar: TEdit
    Left = 24
    Top = 39
    Width = 321
    Height = 23
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial Unicode MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnChange = edtBuscarChange
    OnClick = edtBuscarClick
  end
  object DBEdtNome: TDBEdit
    Left = 24
    Top = 99
    Width = 185
    Height = 23
    DataField = 'nome'
    DataSource = dm.dSourceClientes
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial Unicode MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
  end
  object DBEdtCpf: TDBEdit
    Left = 440
    Top = 40
    Width = 104
    Height = 23
    DataField = 'cpf'
    DataSource = dm.dSourceClientes
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial Unicode MS'
    Font.Style = []
    MaxLength = 14
    ParentFont = False
    TabOrder = 1
  end
  object DBEdtTelefone: TDBEdit
    Left = 230
    Top = 99
    Width = 115
    Height = 23
    DataField = 'telefone'
    DataSource = dm.dSourceClientes
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial Unicode MS'
    Font.Style = []
    MaxLength = 15
    ParentFont = False
    TabOrder = 4
  end
  object DBEdtEmail: TDBEdit
    Left = 367
    Top = 99
    Width = 169
    Height = 23
    DataField = 'email'
    DataSource = dm.dSourceClientes
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial Unicode MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
  end
  object DBEdtDtNascimento: TDBEdit
    Left = 584
    Top = 40
    Width = 132
    Height = 23
    DataField = 'data_nascimento'
    DataSource = dm.dSourceClientes
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial Unicode MS'
    Font.Style = []
    MaxLength = 10
    ParentFont = False
    TabOrder = 2
  end
  object EdtRua: TEdit
    Left = 559
    Top = 99
    Width = 157
    Height = 23
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial Unicode MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
  end
  object DBGridVendas: TDBGrid
    Left = -4
    Top = 192
    Width = 749
    Height = 193
    DataSource = dm.dSourceItens
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial Unicode MS'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgTitleClick, dgTitleHotTrack]
    ParentFont = False
    TabOrder = 10
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'id'
        Title.Caption = 'C'#243'digo'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nome'
        Title.Caption = 'Nome'
        Width = 260
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'preco'
        Title.Caption = 'Pre'#231'o'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'descricao'
        Title.Caption = 'Descri'#231#227'o'
        Width = 250
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'quantidade'
        Title.Caption = 'Quantidade'
        Visible = True
      end>
  end
  object edtSubtTotal: TEdit
    Left = 24
    Top = 417
    Width = 81
    Height = 23
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial Unicode MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 13
    Text = '0'
    OnChange = edtBuscarChange
  end
  object Edit1: TEdit
    Left = 128
    Top = 417
    Width = 81
    Height = 23
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial Unicode MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 14
    Text = '0'
    OnChange = edtBuscarChange
  end
  object Edit2: TEdit
    Left = 230
    Top = 417
    Width = 81
    Height = 23
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial Unicode MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 15
    Text = '0'
    OnChange = edtBuscarChange
  end
  object Edit3: TEdit
    Left = 336
    Top = 417
    Width = 81
    Height = 23
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial Unicode MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 16
    Text = '0'
    OnChange = edtBuscarChange
  end
  object btnFinalizar: TButton
    Left = 552
    Top = 411
    Width = 67
    Height = 30
    Hint = 'Finalizar venda'
    Caption = 'Finalizar'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial Unicode MS'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 11
  end
  object btnCancelar: TButton
    Left = 641
    Top = 411
    Width = 75
    Height = 30
    Hint = 'Cancelar venda'
    Caption = 'Cancelar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial Unicode MS'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 12
    OnClick = btnCancelarClick
  end
  object btnAdicionar: TButton
    Left = 24
    Top = 144
    Width = 67
    Height = 34
    Hint = 'Adicionar item a compra'
    Caption = 'Adicionar'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial Unicode MS'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 7
    OnClick = btnAdicionarClick
  end
  object btnEditar: TButton
    Left = 115
    Top = 144
    Width = 75
    Height = 34
    Hint = 'Editar item selecionado'
    Caption = 'Editar'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial Unicode MS'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 8
  end
  object btnExcluir: TButton
    Left = 212
    Top = 144
    Width = 75
    Height = 34
    Hint = 'Excluir item selecionado'
    Caption = 'Excluir'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial Unicode MS'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 9
  end
  object dbgrid: TDBGrid
    Left = 24
    Top = 60
    Width = 321
    Height = 190
    DataSource = dm.dSourceClientes
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial Unicode MS'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgTitleClick, dgTitleHotTrack]
    ParentFont = False
    TabOrder = 17
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Visible = False
    OnCellClick = dbgridCellClick
    Columns = <
      item
        Expanded = False
        FieldName = 'cpf'
        Title.Caption = 'CPF'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 110
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nome'
        Title.Caption = 'Nome'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 160
        Visible = True
      end>
  end
  object btnFecharBusca: TButton
    Left = 270
    Top = 225
    Width = 75
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 18
    Visible = False
    OnClick = btnFecharBuscaClick
  end
end
