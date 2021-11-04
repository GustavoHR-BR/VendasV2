object frmVendas: TfrmVendas
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Vendas'
  ClientHeight = 482
  ClientWidth = 849
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
  object Label2: TLabel
    Left = 595
    Top = 34
    Width = 63
    Height = 15
    Caption = 'Ordenar por:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial Unicode MS'
    Font.Style = []
    ParentFont = False
  end
  object Label1: TLabel
    Left = 16
    Top = 11
    Width = 62
    Height = 18
    Caption = 'Pesquisar:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial Unicode MS'
    Font.Style = []
    ParentFont = False
  end
  object edtBuscar: TEdit
    Left = 16
    Top = 31
    Width = 561
    Height = 23
    Hint = 'Digite algum cliente para buscar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial Unicode MS'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    OnChange = edtBuscarChange
  end
  object btnNova: TButton
    Left = 16
    Top = 438
    Width = 75
    Height = 25
    Hint = 'Criar nova venda'
    Caption = 'Nova'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial Unicode MS'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    OnClick = btnNovaClick
  end
  object btnImprimir: TButton
    Left = 97
    Top = 438
    Width = 75
    Height = 25
    Hint = 'Imprimir venda selecionada'
    Caption = 'Imprimir'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial Unicode MS'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    OnClick = btnImprimirClick
  end
  object btnSair: TButton
    Left = 734
    Top = 438
    Width = 75
    Height = 25
    Hint = 'Fechar as vendas'
    Caption = 'Sair'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial Unicode MS'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    OnClick = btnSairClick
  end
  object cbOrdenarPor: TComboBox
    Left = 664
    Top = 31
    Width = 145
    Height = 23
    Style = csDropDownList
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial Unicode MS'
    Font.Style = []
    ItemIndex = 0
    ParentFont = False
    TabOrder = 4
    Text = 'C'#243'digo'
    OnSelect = cbOrdenarPorSelect
    Items.Strings = (
      'C'#243'digo'
      'Cliente'
      'Total'
      'Data')
  end
  object DBGridVendas: TDBGrid
    Left = 0
    Top = 67
    Width = 849
    Height = 223
    DataSource = dSourceVendas
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial Unicode MS'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgTitleClick, dgTitleHotTrack]
    ParentFont = False
    TabOrder = 5
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'id'
        Title.Caption = 'C'#243'digo'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'cliente'
        Title.Caption = 'Cliente'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 350
        Visible = True
      end
      item
        Alignment = taLeftJustify
        Expanded = False
        FieldName = 'total'
        Title.Caption = 'Total'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'data'
        Title.Caption = 'Data'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 120
        Visible = True
      end>
  end
  object DBGridItens: TDBGrid
    Left = 0
    Top = 296
    Width = 849
    Height = 128
    DataSource = dSourceItens
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial Unicode MS'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgTitleClick, dgTitleHotTrack]
    ParentFont = False
    TabOrder = 6
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'id'
        Title.Caption = 'C'#243'digo'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 80
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
        Width = 350
        Visible = True
      end
      item
        Alignment = taLeftJustify
        Expanded = False
        FieldName = 'preco'
        Title.Caption = 'Pre'#231'o'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'descricao'
        Title.Caption = 'Descri'#231#227'o'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 165
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'quantidade'
        Title.Caption = 'Quantidade'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 90
        Visible = True
      end>
  end
  object dSetVendas: TSQLDataSet
    SchemaName = 'gustavo_reblin'
    CommandText = 'select * from venda v JOIN cliente c ON v.fk_cliente = c.id;'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dm.SQLConn
    Left = 376
    Top = 360
  end
  object dspVendas: TDataSetProvider
    DataSet = dSetVendas
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 472
    Top = 360
  end
  object cdsVendas: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspVendas'
    Left = 568
    Top = 360
    object cdsVendasid: TIntegerField
      FieldName = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsVendasfk_cliente: TIntegerField
      FieldName = 'fk_cliente'
    end
    object cdsVendastotal: TFMTBCDField
      FieldName = 'total'
      Precision = 12
      Size = 2
    end
    object cdsVendasdata: TStringField
      FieldName = 'data'
      Size = 10
    end
    object cdsVendascliente: TStringField
      FieldKind = fkLookup
      FieldName = 'cliente'
      LookupDataSet = dm.cdsClientes
      LookupKeyFields = 'id'
      LookupResultField = 'nome'
      KeyFields = 'fk_cliente'
      Size = 100
      Lookup = True
    end
  end
  object dSourceVendas: TDataSource
    DataSet = cdsVendas
    Left = 664
    Top = 360
  end
  object dSourceItens: TDataSource
    DataSet = cdsItens
    Left = 664
    Top = 432
  end
  object cdsItens: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'fk_venda'
    MasterFields = 'id'
    MasterSource = dSourceVendas
    PacketRecords = 0
    Params = <>
    ProviderName = 'dspItens'
    Left = 568
    Top = 432
    object cdsItensid: TIntegerField
      FieldName = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsItensfk_venda: TIntegerField
      FieldName = 'fk_venda'
    end
    object cdsItensfk_produto: TIntegerField
      FieldName = 'fk_produto'
    end
    object cdsItensnome: TStringField
      FieldName = 'nome'
      Size = 60
    end
    object cdsItenspreco: TFMTBCDField
      FieldName = 'preco'
      Precision = 12
      Size = 2
    end
    object cdsItensdescricao: TStringField
      FieldName = 'descricao'
      Size = 100
    end
    object cdsItensquantidade: TIntegerField
      FieldName = 'quantidade'
    end
  end
  object dspItens: TDataSetProvider
    DataSet = dSetItens
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 472
    Top = 432
  end
  object dSetItens: TSQLDataSet
    SchemaName = 'gustavo_reblin'
    CommandText = 'select * from item order by id;'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'fk_venda'
        ParamType = ptInput
        Value = 1
      end>
    SQLConnection = dm.SQLConn
    Left = 376
    Top = 432
  end
end
