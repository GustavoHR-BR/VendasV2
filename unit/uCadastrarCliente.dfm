object frmCadastrarCliente: TfrmCadastrarCliente
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Cadastro de clientes'
  ClientHeight = 378
  ClientWidth = 636
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
  object Label3: TLabel
    Left = 32
    Top = 37
    Width = 38
    Height = 18
    Caption = 'Nome:'
    FocusControl = dbEdtNome
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial Unicode MS'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 478
    Top = 37
    Width = 30
    Height = 18
    Caption = 'CPF:'
    FocusControl = dbEdtCpf
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial Unicode MS'
    Font.Style = []
    ParentFont = False
  end
  object Label5: TLabel
    Left = 277
    Top = 37
    Width = 54
    Height = 18
    Caption = 'Telefone:'
    FocusControl = dbEdtTelefone
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial Unicode MS'
    Font.Style = []
    ParentFont = False
  end
  object Label6: TLabel
    Left = 32
    Top = 98
    Width = 37
    Height = 18
    Caption = 'E-mail'
    FocusControl = dbEdtEmail
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial Unicode MS'
    Font.Style = []
    ParentFont = False
  end
  object Label7: TLabel
    Left = 478
    Top = 161
    Width = 118
    Height = 16
    Caption = 'Data de nascimento:'
    FocusControl = dbEdtDtNascimento
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label1: TLabel
    Left = 358
    Top = 98
    Width = 44
    Height = 18
    Caption = 'Cidade:'
    FocusControl = dbEdtEmail
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial Unicode MS'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 32
    Top = 161
    Width = 38
    Height = 18
    Caption = 'Bairro:'
    FocusControl = dbEdtEmail
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial Unicode MS'
    Font.Style = []
    ParentFont = False
  end
  object Label8: TLabel
    Left = 260
    Top = 160
    Width = 27
    Height = 18
    Caption = 'Rua:'
    FocusControl = dbEdtEmail
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial Unicode MS'
    Font.Style = []
    ParentFont = False
  end
  object Label9: TLabel
    Left = 277
    Top = 98
    Width = 21
    Height = 18
    Caption = 'UF:'
    FocusControl = dbEdtEmail
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial Unicode MS'
    Font.Style = []
    ParentFont = False
  end
  object edtRua: TEdit
    Left = 260
    Top = 183
    Width = 199
    Height = 23
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial Unicode MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 16
    OnChange = edtRuaChange
    OnClick = edtRuaClick
  end
  object dbEdtNome: TDBEdit
    Left = 32
    Top = 59
    Width = 225
    Height = 23
    DataField = 'nome'
    DataSource = dm.dSourceClientes
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial Unicode MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object dbEdtCpf: TDBEdit
    Left = 478
    Top = 59
    Width = 137
    Height = 23
    DataField = 'cpf'
    DataSource = dm.dSourceClientes
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial Unicode MS'
    Font.Style = []
    MaxLength = 14
    ParentFont = False
    TabOrder = 2
  end
  object dbEdtTelefone: TDBEdit
    Left = 277
    Top = 59
    Width = 182
    Height = 23
    DataField = 'telefone'
    DataSource = dm.dSourceClientes
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial Unicode MS'
    Font.Style = []
    MaxLength = 15
    ParentFont = False
    TabOrder = 1
  end
  object dbEdtEmail: TDBEdit
    Left = 32
    Top = 120
    Width = 225
    Height = 23
    DataField = 'email'
    DataSource = dm.dSourceClientes
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial Unicode MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
  end
  object dbEdtDtNascimento: TDBEdit
    Left = 478
    Top = 183
    Width = 137
    Height = 21
    DataField = 'data_nascimento'
    DataSource = dm.dSourceClientes
    MaxLength = 10
    TabOrder = 6
  end
  object edtCidade: TEdit
    Left = 358
    Top = 120
    Width = 257
    Height = 23
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial Unicode MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    OnChange = edtCidadeChange
    OnClick = edtCidadeClick
  end
  object edtBairro: TEdit
    Left = 32
    Top = 183
    Width = 199
    Height = 23
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial Unicode MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 7
    OnChange = edtBairroChange
    OnClick = edtBairroClick
  end
  object gridRuas: TDBGrid
    Left = 260
    Top = 203
    Width = 199
    Height = 110
    DataSource = dm.dSourceRuas
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial Unicode MS'
    Font.Style = []
    Options = [dgColumnResize, dgColLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ParentFont = False
    TabOrder = 8
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Visible = False
    OnCellClick = gridRuasCellClick
    Columns = <
      item
        Expanded = False
        FieldName = 'id'
        Width = 25
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nome'
        Width = 200
        Visible = True
      end>
  end
  object cboxEstados: TComboBox
    Left = 277
    Top = 120
    Width = 75
    Height = 23
    Style = csDropDownList
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial Unicode MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    OnSelect = cboxEstadosSelect
    Items.Strings = (
      'AC'
      'AL'
      'AM'
      'AP'
      'BA'
      'CE'
      'DF'
      'ES'
      'GO'
      'MA'
      'MG'
      'MS'
      'MT'
      'PA'
      'PB'
      'PE'
      'PI'
      'PR'
      'RJ'
      'RN'
      'RO'
      'RR'
      'RS'
      'SC'
      'SE'
      'SP'
      'TO')
  end
  object btnCancelarRua: TButton
    Left = 260
    Top = 288
    Width = 75
    Height = 25
    Caption = 'Cancelar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial Unicode MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 9
    Visible = False
    OnClick = btnCancelarRuaClick
  end
  object btnCadastrar: TButton
    Left = 32
    Top = 332
    Width = 67
    Height = 25
    Caption = 'Cadastrar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial Unicode MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 10
    OnClick = btnCadastrarClick
  end
  object btnCancelar: TButton
    Left = 121
    Top = 332
    Width = 75
    Height = 25
    Caption = 'Cancelar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial Unicode MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 11
    OnClick = btnCancelarClick
  end
  object gridBairros: TDBGrid
    Left = 32
    Top = 203
    Width = 199
    Height = 110
    DataSource = dm.dSourceBairros
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial Unicode MS'
    Font.Style = []
    Options = [dgColumnResize, dgColLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ParentFont = False
    TabOrder = 12
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Visible = False
    OnCellClick = gridBairrosCellClick
    Columns = <
      item
        Expanded = False
        FieldName = 'id'
        Width = 25
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nome'
        Width = 200
        Visible = True
      end>
  end
  object gridCidades: TDBGrid
    Left = 358
    Top = 140
    Width = 257
    Height = 110
    DataSource = dm.dSourceCidades
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial Unicode MS'
    Font.Style = []
    Options = [dgColumnResize, dgColLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ParentFont = False
    TabOrder = 13
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Visible = False
    OnCellClick = gridCidadesCellClick
    Columns = <
      item
        Expanded = False
        FieldName = 'id'
        Width = 25
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nome'
        Width = 200
        Visible = True
      end>
  end
  object btnCancelarbairro: TButton
    Left = 32
    Top = 288
    Width = 75
    Height = 25
    Caption = 'Cancelar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial Unicode MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 14
    Visible = False
    OnClick = btnCancelarBairroClick
  end
  object btnCancelarCidade: TButton
    Left = 358
    Top = 225
    Width = 75
    Height = 25
    Caption = 'Cancelar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial Unicode MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 15
    Visible = False
    OnClick = btnCancelarCidadeClick
  end
end
