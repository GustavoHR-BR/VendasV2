object frmProdutos: TfrmProdutos
  Left = 0
  Top = 0
  Caption = 'Produtos'
  ClientHeight = 474
  ClientWidth = 839
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 31
    Top = 22
    Width = 60
    Height = 16
    Caption = 'Pesquisar:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 592
    Top = 24
    Width = 63
    Height = 13
    Caption = 'Ordenar por:'
  end
  object dbgrid: TDBGrid
    Left = -14
    Top = 56
    Width = 853
    Height = 369
    DataSource = dm.dSourceProdutos
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgTitleClick, dgTitleHotTrack]
    TabOrder = 0
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
        Width = 160
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
        Width = 450
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'quantidade_estoque'
        Title.Caption = 'No estoque'
        Width = 90
        Visible = True
      end>
  end
  object btnAdicionar: TButton
    Left = 48
    Top = 442
    Width = 75
    Height = 25
    Caption = 'Adicionar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
  end
  object btnEditar: TButton
    Left = 136
    Top = 442
    Width = 75
    Height = 25
    Caption = 'Editar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
  end
  object btnSair: TButton
    Left = 731
    Top = 441
    Width = 75
    Height = 25
    Caption = 'Sair'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
  end
  object edtBuscar: TEdit
    Left = 97
    Top = 21
    Width = 273
    Height = 21
    TabOrder = 4
  end
  object btnFiltrar: TButton
    Left = 384
    Top = 19
    Width = 75
    Height = 25
    Caption = 'Filtrar'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
  end
  object cbOrdenarPor: TComboBox
    Left = 661
    Top = 21
    Width = 145
    Height = 21
    Style = csDropDownList
    ItemIndex = 1
    TabOrder = 6
    Text = 'Nome'
    Items.Strings = (
      'C'#243'digo'
      'Nome'
      'Telefone'
      'E-mail'
      'Anivers'#225'rio')
  end
end
