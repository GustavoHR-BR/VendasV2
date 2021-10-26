object frmAdicionarItem: TfrmAdicionarItem
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Novo item'
  ClientHeight = 337
  ClientWidth = 500
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 26
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
  object Label2: TLabel
    Left = 24
    Top = 95
    Width = 59
    Height = 15
    Caption = 'Quantidade:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial Unicode MS'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 160
    Top = 112
    Width = 9
    Height = 18
    Caption = 'X'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial Unicode MS'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 184
    Top = 95
    Width = 66
    Height = 15
    Caption = 'Valor unit'#225'rio:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial Unicode MS'
    Font.Style = []
    ParentFont = False
  end
  object Label5: TLabel
    Left = 24
    Top = 159
    Width = 54
    Height = 15
    Caption = 'Acr'#233'scimo:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial Unicode MS'
    Font.Style = []
    ParentFont = False
  end
  object Label6: TLabel
    Left = 147
    Top = 179
    Width = 12
    Height = 18
    Caption = '%'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial Unicode MS'
    Font.Style = []
    ParentFont = False
  end
  object Label7: TLabel
    Left = 184
    Top = 159
    Width = 81
    Height = 15
    Caption = 'Valor acr'#233'scimo:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial Unicode MS'
    Font.Style = []
    ParentFont = False
  end
  object Label8: TLabel
    Left = 24
    Top = 232
    Width = 50
    Height = 15
    Caption = 'Desconto:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial Unicode MS'
    Font.Style = []
    ParentFont = False
  end
  object Label9: TLabel
    Left = 147
    Top = 251
    Width = 12
    Height = 18
    Caption = '%'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial Unicode MS'
    Font.Style = []
    ParentFont = False
  end
  object Label10: TLabel
    Left = 184
    Top = 232
    Width = 76
    Height = 15
    Caption = 'Valor desconto:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial Unicode MS'
    Font.Style = []
    ParentFont = False
  end
  object Label11: TLabel
    Left = 354
    Top = 155
    Width = 83
    Height = 15
    Caption = 'Sub-total do item:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial Unicode MS'
    Font.Style = []
    ParentFont = False
  end
  object Label12: TLabel
    Left = 354
    Top = 228
    Width = 88
    Height = 15
    Caption = 'Valor total do item:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial Unicode MS'
    Font.Style = []
    ParentFont = False
  end
  object edtValAcrescimo: TEdit
    Left = 184
    Top = 176
    Width = 121
    Height = 21
    Alignment = taRightJustify
    TabOrder = 6
  end
  object edtSubTotal: TEdit
    Left = 354
    Top = 176
    Width = 121
    Height = 21
    Alignment = taRightJustify
    TabOrder = 9
  end
  object edtValUnitario: TEdit
    Left = 184
    Top = 112
    Width = 121
    Height = 21
    Alignment = taRightJustify
    TabOrder = 4
  end
  object edtAcrescimo: TEdit
    Left = 24
    Top = 176
    Width = 121
    Height = 21
    Alignment = taRightJustify
    TabOrder = 5
  end
  object edtQuantidade: TEdit
    Left = 24
    Top = 112
    Width = 121
    Height = 21
    Alignment = taRightJustify
    TabOrder = 3
  end
  object edtValTotal: TEdit
    Left = 354
    Top = 244
    Width = 121
    Height = 21
    Alignment = taRightJustify
    TabOrder = 10
  end
  object edtValDesconto: TEdit
    Left = 184
    Top = 248
    Width = 121
    Height = 21
    Alignment = taRightJustify
    TabOrder = 8
  end
  object edtDesconto: TEdit
    Left = 24
    Top = 248
    Width = 121
    Height = 21
    Alignment = taRightJustify
    TabOrder = 7
  end
  object edtBuscar: TEdit
    Left = 24
    Top = 45
    Width = 451
    Height = 23
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial Unicode MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object dbgrid: TDBGrid
    Left = 24
    Top = 67
    Width = 451
    Height = 159
    DataSource = dm.dSourceProdutos
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial Unicode MS'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgTitleClick, dgTitleHotTrack]
    ParentFont = False
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Visible = False
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'id'
        Title.Caption = 'C'#243'digo'
        Width = 45
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nome'
        Title.Caption = 'Nome'
        Width = 220
        Visible = True
      end
      item
        Alignment = taLeftJustify
        Expanded = False
        FieldName = 'preco'
        Title.Caption = 'Pre'#231'o'
        Width = 80
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'quantidade_estoque'
        Title.Caption = 'Em estoque'
        Visible = True
      end>
  end
  object btnCancelar: TButton
    Left = 400
    Top = 201
    Width = 75
    Height = 25
    Hint = 'Fechar busca'
    Caption = 'Cancelar'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    Visible = False
  end
  object btnFinalizar: TButton
    Left = 314
    Top = 287
    Width = 67
    Height = 30
    Hint = 'Adicionar item'
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
    TabOrder = 11
  end
  object Button1: TButton
    Left = 400
    Top = 287
    Width = 75
    Height = 30
    Hint = 'Cancelar item'#13#10
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
  end
end
