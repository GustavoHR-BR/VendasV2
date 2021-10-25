object frmCadastrarProduto: TfrmCadastrarProduto
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Cadastro de produtos'
  ClientHeight = 204
  ClientWidth = 494
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
    Top = 42
    Width = 31
    Height = 13
    Caption = 'Nome:'
    FocusControl = dbEdtNome
  end
  object Label2: TLabel
    Left = 24
    Top = 106
    Width = 31
    Height = 13
    Caption = 'Pre'#231'o:'
  end
  object Label3: TLabel
    Left = 264
    Top = 42
    Width = 50
    Height = 13
    Caption = 'Descri'#231#227'o:'
    FocusControl = dbEdtDescricao
  end
  object Label4: TLabel
    Left = 135
    Top = 106
    Width = 59
    Height = 13
    Caption = 'No estoque:'
    FocusControl = dbEdtEstoque
  end
  object dbEdtNome: TDBEdit
    Left = 24
    Top = 61
    Width = 193
    Height = 21
    DataField = 'nome'
    DataSource = dm.dSourceProdutos
    TabOrder = 0
  end
  object dbEdtDescricao: TDBEdit
    Left = 264
    Top = 61
    Width = 201
    Height = 21
    DataField = 'descricao'
    DataSource = dm.dSourceProdutos
    TabOrder = 1
  end
  object dbEdtEstoque: TDBEdit
    Left = 135
    Top = 125
    Width = 82
    Height = 21
    DataField = 'quantidade_estoque'
    DataSource = dm.dSourceProdutos
    TabOrder = 3
  end
  object btnCadastrar: TButton
    Left = 264
    Top = 123
    Width = 67
    Height = 25
    Caption = 'Cadastrar'
    TabOrder = 4
    OnClick = btnCadastrarClick
  end
  object btnCancelar: TButton
    Left = 353
    Top = 123
    Width = 75
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 5
    OnClick = btnCancelarClick
  end
  object dbEdtPreco: TDBEdit
    Left = 24
    Top = 125
    Width = 89
    Height = 21
    DataField = 'preco'
    DataSource = dm.dSourceProdutos
    TabOrder = 2
  end
end
