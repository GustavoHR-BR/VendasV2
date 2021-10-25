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
  object SpeedButton1: TSpeedButton
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
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
  end
  object SpeedButton2: TSpeedButton
    Left = 383
    Top = 39
    Width = 26
    Height = 23
    Hint = 'Editar cliente selecionado'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial Unicode MS'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
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
    Top = 401
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
    Top = 401
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
    Top = 401
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
    Top = 401
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
    TabOrder = 1
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
    TabOrder = 2
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
    TabOrder = 3
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
    TabOrder = 4
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
    TabOrder = 5
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
    TabOrder = 7
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
    Top = 422
    Width = 81
    Height = 23
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial Unicode MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 8
    Text = '0'
    OnChange = edtBuscarChange
  end
  object Edit1: TEdit
    Left = 128
    Top = 422
    Width = 81
    Height = 23
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial Unicode MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 9
    Text = '0'
    OnChange = edtBuscarChange
  end
  object Edit2: TEdit
    Left = 230
    Top = 422
    Width = 81
    Height = 23
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial Unicode MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 10
    Text = '0'
    OnChange = edtBuscarChange
  end
  object Edit3: TEdit
    Left = 336
    Top = 422
    Width = 81
    Height = 23
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial Unicode MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 11
    Text = '0'
    OnChange = edtBuscarChange
  end
  object btnFinalizar: TButton
    Left = 552
    Top = 416
    Width = 67
    Height = 30
    Hint = 'Finalizar venda'
    Caption = 'Finalizar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial Unicode MS'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 12
  end
  object btnCancelar: TButton
    Left = 641
    Top = 416
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
    TabOrder = 13
  end
  object btnAdicionar: TButton
    Left = 24
    Top = 144
    Width = 67
    Height = 34
    Hint = 'Adicionar item a compra'
    Caption = 'Adicionar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial Unicode MS'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 14
  end
  object btnEditar: TButton
    Left = 115
    Top = 144
    Width = 75
    Height = 34
    Hint = 'Editar item selecionado'
    Caption = 'Editar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial Unicode MS'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 15
  end
  object btnExcluir: TButton
    Left = 212
    Top = 144
    Width = 75
    Height = 34
    Hint = 'Excluir item selecionado'
    Caption = 'Excluir'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial Unicode MS'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 16
  end
end
