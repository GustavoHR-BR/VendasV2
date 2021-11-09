object frmCadastrarCliente: TfrmCadastrarCliente
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Cadastro de clientes'
  ClientHeight = 283
  ClientWidth = 636
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClick = FormClick
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
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial Unicode MS'
    Font.Style = []
    ParentFont = False
  end
  object Label8: TLabel
    Left = 277
    Top = 159
    Width = 27
    Height = 18
    Caption = 'Rua:'
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
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial Unicode MS'
    Font.Style = []
    ParentFont = False
  end
  object edtRua: TEdit
    Left = 277
    Top = 183
    Width = 182
    Height = 21
    Enabled = False
    TabOrder = 9
  end
  object dbEdtDtNascimento: TDBEdit
    Left = 478
    Top = 183
    Width = 137
    Height = 21
    DataField = 'data_nascimento'
    DataSource = dm.dSourceClientes
    TabOrder = 2
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
    TabOrder = 1
    OnChange = edtCidadeChange
    OnClick = edtCidadeClick
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
    TabOrder = 0
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
  object btnCadastrar: TButton
    Left = 32
    Top = 236
    Width = 67
    Height = 25
    Caption = 'Cadastrar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial Unicode MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnClick = btnCadastrarClick
  end
  object btnCancelar: TButton
    Left = 113
    Top = 236
    Width = 75
    Height = 25
    Caption = 'Cancelar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial Unicode MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    OnClick = btnCancelarClick
  end
  object gridCidades: TDBGrid
    Left = 358
    Top = 142
    Width = 257
    Height = 133
    DataSource = dm.dSourceCidades
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial Unicode MS'
    Font.Style = []
    Options = [dgColumnResize, dgColLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ParentFont = False
    TabOrder = 5
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
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nome'
        Width = 200
        Visible = True
      end>
  end
  object btnCancelarCidade: TButton
    Left = 358
    Top = 250
    Width = 75
    Height = 25
    Caption = 'Cancelar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial Unicode MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
    Visible = False
    OnClick = btnCancelarCidadeClick
  end
  object btnCancelarRua: TButton
    Left = 260
    Top = 290
    Width = 75
    Height = 25
    Caption = 'Cancelar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial Unicode MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 7
    Visible = False
  end
  object edtBairro: TEdit
    Left = 32
    Top = 183
    Width = 222
    Height = 21
    Enabled = False
    TabOrder = 8
    OnChange = edtBairroChange
  end
  object dbEdtNome: TDBEdit
    Left = 30
    Top = 61
    Width = 224
    Height = 21
    DataField = 'nome'
    DataSource = dm.dSourceClientes
    TabOrder = 10
  end
  object dbEdtTelefone: TDBEdit
    Left = 277
    Top = 61
    Width = 182
    Height = 21
    DataField = 'telefone'
    DataSource = dm.dSourceClientes
    TabOrder = 11
  end
  object dbEdtCpf: TDBEdit
    Left = 478
    Top = 61
    Width = 137
    Height = 21
    DataField = 'cpf'
    DataSource = dm.dSourceClientes
    TabOrder = 12
  end
  object dbEdtEmail: TDBEdit
    Left = 32
    Top = 122
    Width = 222
    Height = 21
    DataField = 'email'
    DataSource = dm.dSourceClientes
    TabOrder = 13
  end
end
