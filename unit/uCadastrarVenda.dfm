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
      96030000424D960300000000000036000000280000000F000000120000000100
      18000000000060030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFF000000B7B7B700000001010101010101010101010101010101
      0101010101010101010101010101010101000000B6B6B6000000000000000000
      1B1B1B1717171717171717171717171717171717171717171717171717171B1B
      1B000000000000000000000000676767FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6767670000000000000000005D5D5D
      FFFFFFFFFFFFFFFFFFFFFFFFD7D7D76B6B6BD7D7D7FFFFFFFFFFFFFFFFFFFFFF
      FF5D5D5D0000000000000000005D5D5DFFFFFFFFFFFFFFFFFFFFFFFF8A8A8A00
      00008A8A8AFFFFFFFFFFFFFFFFFFFFFFFF5D5D5D0000000000000000005D5D5D
      FFFFFFFFFFFFFFFFFFFFFFFF929292000000929292FFFFFFFFFFFFFFFFFFFFFF
      FF5D5D5D0000000000000000005D5D5DFFFFFFFFFFFFFFFFFFFFFFFFA4A4A400
      0000A4A4A4FFFFFFFFFFFFFFFFFFFFFFFF5D5D5D0000000000000000005D5D5D
      FFFFFF1C1C1C0000000000000000000000000000000000000000001C1C1CFFFF
      FF5D5D5D0000000000000000005D5D5DFFFFFF1C1C1C00000000000000000000
      00000000000000000000001C1C1CFFFFFF5D5D5D0000000000000000005D5D5D
      FFFFFFFFFFFFFFFFFFFFFFFFA4A4A4000000A4A4A4FFFFFFFFFFFFFFFFFFFFFF
      FF5D5D5D0000000000000000005D5D5DFFFFFFFFFFFFFFFFFFFFFFFF92929200
      0000929292FFFFFFFFFFFFFFFFFFFFFFFF5D5D5D0000000000000000005D5D5D
      FFFFFFFFFFFFFFFFFFFFFFFF8A8A8A0000008A8A8AFFFFFFFFFFFFFFFFFFFFFF
      FF5D5D5D0000000000000000005D5D5DFFFFFFFFFFFFFFFFFFFFFFFFD7D7D76B
      6B6BD7D7D7FFFFFFFFFFFFFFFFFFFFFFFF5D5D5D000000000000000000676767
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FF6767670000000000000000000000001B1B1B17171717171717171717171717
      17171717171717171717171717171B1B1B000000000000000000B7B7B7000000
      0101010101010101010101010101010101010101010101010101010101010101
      01000000B6B6B6000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000}
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
    Glyph.Data = {
      6E040000424D6E04000000000000360000002800000014000000120000000100
      18000000000038040000C40E0000C40E00000000000000000000AAAAAA000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000191919FBFBFBFFFFFFFFFFFFFFFFFFFFFFFF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000006C6C6CFFFFFFFFFFFFFFFFFFFFFFFF000000000000AEAEAED4D4D4CFCF
      CFD4D4D4E2E2E2DEDEDEDBDBDBD5D5D5CFCFCFCFCFCFDFDFDF3D3D3D0000006C
      6C6CFFFFFFFFFFFFFFFFFFFFFFFF000000000000DDDDDDFFFFFFFFFFFFE1E1E1
      5959598B8B8BACACACEAEAEAFFFFFFFFFFFFFFFFFF4D4D4D0000006D6D6DFFFF
      FFFFFFFFFFFFFFFFFFFF000000000000D7D7D7FFFFFFFFFFFF94949400000000
      0000000000000000C9C9C9FFFFFFFFFFFF4A4A4A0000006D6D6DFFFFFFFFFFFF
      FFFFFFFFFFFF000000000000D7D7D7FFFFFFFFFFFFC2C2C20000000000000000
      00000000000000CDCDCDFFFFFF3D3D3D0000006D6D6DFFFFFFFFFFFFFFFFFFFF
      FFFF000000000000D7D7D7FFFFFFFFFFFFE3E3E3000000000000000000000000
      000000000000D7D7D7EDEDED000000646464FFFFFFFFFFFFFFFFFFFFFFFF0000
      00000000D7D7D7FFFFFFFFFFFFFFFFFF00000000000000000000000000000000
      0000000000E2E2E2DFDFDF9B9B9BFFFFFFFFFFFFFFFFFFFFFFFF000000000000
      D7D7D7FFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000000000
      00000000DEDEDEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000D7D7D7FF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000000000000000000000000000
      000000DADADAFFFFFFFFFFFFFFFFFFFFFFFF000000000000D7D7D7FFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFF00000000000000000000000000000000000000
      0000DDDDDDFFFFFFFFFFFFFFFFFF000000000000D7D7D7FFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000000000000000
      00FAFAFAFFFFFFFFFFFF000000000000E4E4E4FFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000007A7A7AFFFFFF
      D7D7D7FFFFFF0000000000006B6B6B8383837F7F7F7F7F7F7F7F7F7F7F7F7F7F
      7F797979C2C2C2FFFFFF000000000000000000777777FFFFFF080808000000EB
      EBEB060606000000000000000000000000000000000000000000000000000000
      000000B0B0B0FFFFFF0000006F6F6FFFFFFF0C0C0C000000000000040404D7D7
      D72C2C2C2E2E2E2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2D2D2D16
      1616FFFFFFFFFFFFFFFFFF0C0C0C0000000000000000001D1D1DFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFE9E9E9000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFF9F9F90B0B0B191919FFFFFFFFFFFF}
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
  object Label12: TLabel
    Left = 545
    Top = 162
    Width = 90
    Height = 18
    Caption = 'Total da venda:'
    FocusControl = DBEdtTelefone
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
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
    Top = 197
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
  object edtDesconto: TEdit
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
    OnChange = edtDescontoChange
  end
  object edtAcrescimo: TEdit
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
    OnChange = edtAcrescimoChange
  end
  object edtFrete: TEdit
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
    OnChange = edtFreteChange
  end
  object btnFinalizar: TButton
    Left = 559
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
    OnClick = btnFinalizarClick
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
    Hint = 'Fechar busca'
    Caption = 'Cancelar'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 18
    Visible = False
    OnClick = btnFecharBuscaClick
  end
  object edtTotalVenda: TEdit
    Left = 641
    Top = 161
    Width = 75
    Height = 23
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial Unicode MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 19
    Text = '0'
    OnChange = edtBuscarChange
  end
end
