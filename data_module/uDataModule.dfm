object dm: Tdm
  OldCreateOrder = False
  Height = 573
  Width = 581
  object SQLConn: TSQLConnection
    DriverName = 'MySQL'
    GetDriverFunc = 'getSQLDriverMYSQL'
    LibraryName = 'dbxmys.dll'
    LoginPrompt = False
    Params.Strings = (
      'DriverUnit=Data.DBXMySQL'
      
        'DriverPackageLoader=TDBXDynalinkDriverLoader,DbxCommonDriver160.' +
        'bpl'
      
        'DriverAssemblyLoader=Borland.Data.TDBXDynalinkDriverLoader,Borla' +
        'nd.Data.DbxCommonDriver,Version=16.0.0.0,Culture=neutral,PublicK' +
        'eyToken=91d62ebb5b0d1b1b'
      
        'MetaDataPackageLoader=TDBXMySqlMetaDataCommandFactory,DbxMySQLDr' +
        'iver160.bpl'
      
        'MetaDataAssemblyLoader=Borland.Data.TDBXMySqlMetaDataCommandFact' +
        'ory,Borland.Data.DbxMySQLDriver,Version=16.0.0.0,Culture=neutral' +
        ',PublicKeyToken=91d62ebb5b0d1b1b'
      'GetDriverFunc=getSQLDriverMYSQL'
      'LibraryName=dbxmys.dll'
      'LibraryNameOsx=libsqlmys.dylib'
      'VendorLib=LIBMYSQL.dll'
      'VendorLibWin64=libmysql.dll'
      'VendorLibOsx=libmysqlclient.dylib'
      'HostName=gustavo_reblin.mysql.dbaas.com.br'
      'Database=gustavo_reblin'
      'User_Name=gustavo_reblin'
      'Password=otsgt.3.47Jea'
      'MaxBlobSize=-1'
      'LocaleCode=0000'
      'Compressed=False'
      'Encrypted=False'
      'BlobSize=-1'
      'ErrorResourceFile=')
    VendorLib = 'LIBMYSQL.dll'
    Left = 496
    Top = 16
  end
  object cdsClientes: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspClientes'
    Left = 224
    Top = 24
    object cdsClientesid: TIntegerField
      FieldName = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsClientesfk_rua: TIntegerField
      FieldName = 'fk_rua'
    end
    object cdsClientesnome: TStringField
      FieldName = 'nome'
      Size = 60
    end
    object cdsClientescpf: TStringField
      FieldName = 'cpf'
      EditMask = '!999.999.999-99;1;_'
      Size = 16
    end
    object cdsClientestelefone: TStringField
      FieldName = 'telefone'
      EditMask = '!(99) 99999-9999;1;_'
      Size = 15
    end
    object cdsClientesemail: TStringField
      FieldName = 'email'
      Size = 30
    end
    object cdsClientesdata_nascimento: TStringField
      FieldName = 'data_nascimento'
      EditMask = '!99/99/9999;1;_'
      Size = 10
    end
    object cdsClientesendereco: TStringField
      FieldName = 'endereco'
      Size = 60
    end
    object cdsClientesRua: TStringField
      FieldKind = fkLookup
      FieldName = 'Rua'
      LookupDataSet = cdsRuas
      LookupKeyFields = 'id'
      LookupResultField = 'nome'
      KeyFields = 'fk_rua'
      Size = 80
      Lookup = True
    end
  end
  object dSetClientes: TSQLDataSet
    SchemaName = 'gustavo_reblin'
    CommandText = 'SELECT * FROM cliente ORDER BY nome ASC;'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConn
    Left = 32
    Top = 24
  end
  object dspClientes: TDataSetProvider
    DataSet = dSetClientes
    Left = 128
    Top = 24
  end
  object dSourceClientes: TDataSource
    DataSet = cdsClientes
    Left = 320
    Top = 24
  end
  object cdsProdutos: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspProdutos'
    Left = 224
    Top = 88
    object cdsProdutosid: TIntegerField
      FieldName = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsProdutosnome: TStringField
      FieldName = 'nome'
      Size = 60
    end
    object cdsProdutospreco: TFMTBCDField
      FieldName = 'preco'
      Precision = 12
      Size = 2
    end
    object cdsProdutosdescricao: TStringField
      FieldName = 'descricao'
      Size = 100
    end
    object cdsProdutosquantidade_estoque: TIntegerField
      FieldName = 'quantidade_estoque'
    end
  end
  object dSetProdutos: TSQLDataSet
    SchemaName = 'gustavo_reblin'
    CommandText = 'SELECT * FROM produto ORDER BY id ASC;'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConn
    Left = 32
    Top = 88
  end
  object dspProdutos: TDataSetProvider
    DataSet = dSetProdutos
    Left = 128
    Top = 88
  end
  object dSourceProdutos: TDataSource
    DataSet = cdsProdutos
    Left = 320
    Top = 88
  end
  object cdsRuas: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'dspRuas'
    Left = 224
    Top = 160
    object cdsRuasid: TIntegerField
      FieldName = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsRuasnome: TStringField
      FieldName = 'nome'
      Size = 80
    end
    object cdsRuasfk_bairro: TIntegerField
      FieldName = 'fk_bairro'
    end
  end
  object dSetRuas: TSQLDataSet
    SchemaName = 'gustavo_reblin'
    CommandText = 'select * from rua;'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConn
    Left = 32
    Top = 160
  end
  object dspRuas: TDataSetProvider
    DataSet = dSetRuas
    Left = 128
    Top = 160
  end
  object dSourceRuas: TDataSource
    DataSet = cdsRuas
    Left = 320
    Top = 160
  end
  object cdsBairros: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'dspBairros'
    Left = 224
    Top = 232
    object cdsBairrosid: TIntegerField
      FieldName = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsBairrosnome: TStringField
      FieldName = 'nome'
      Size = 80
    end
    object cdsBairrosfk_cidade: TIntegerField
      FieldName = 'fk_cidade'
    end
  end
  object dSetBairros: TSQLDataSet
    SchemaName = 'gustavo_reblin'
    CommandText = 'select * from bairro;'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConn
    Left = 32
    Top = 232
  end
  object dspBairros: TDataSetProvider
    DataSet = dSetBairros
    Left = 128
    Top = 232
  end
  object dSourceBairros: TDataSource
    DataSet = cdsBairros
    Left = 320
    Top = 232
  end
  object cdsCidades: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCidades'
    Left = 224
    Top = 304
    object cdsCidadesid: TIntegerField
      FieldName = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsCidadesnome: TStringField
      FieldName = 'nome'
      Size = 80
    end
    object cdsCidadesfk_estado: TIntegerField
      FieldName = 'fk_estado'
    end
  end
  object dSetCidades: TSQLDataSet
    SchemaName = 'gustavo_reblin'
    CommandText = 'select * from cidade;'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConn
    Left = 32
    Top = 304
  end
  object dspCidades: TDataSetProvider
    DataSet = dSetCidades
    Left = 128
    Top = 304
  end
  object dSourceCidades: TDataSource
    DataSet = cdsCidades
    Left = 320
    Top = 304
  end
  object cdsEstados: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'dspEstados'
    Left = 224
    Top = 376
    object cdsEstadosid: TIntegerField
      FieldName = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsEstadosnome: TStringField
      FieldName = 'nome'
      Size = 80
    end
    object cdsEstadosuf: TStringField
      FieldName = 'uf'
      Size = 2
    end
  end
  object dSetEstados: TSQLDataSet
    SchemaName = 'gustavo_reblin'
    CommandText = 'select * from estado;'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConn
    Left = 32
    Top = 376
  end
  object dspEstados: TDataSetProvider
    DataSet = dSetEstados
    Left = 128
    Top = 376
  end
  object dSourceEstados: TDataSource
    DataSet = cdsEstados
    Left = 320
    Top = 376
  end
  object cdsVendas: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspVendas'
    Left = 224
    Top = 440
    object cdsVendasid: TIntegerField
      FieldName = 'id'
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
  end
  object dSetVendas: TSQLDataSet
    SchemaName = 'gustavo_reblin'
    CommandText = 'select * from venda;'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConn
    Left = 32
    Top = 440
  end
  object dspVendas: TDataSetProvider
    DataSet = dSetVendas
    Left = 128
    Top = 440
  end
  object dSourceVendas: TDataSource
    DataSet = cdsVendas
    Left = 320
    Top = 440
  end
  object cdsItens: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dpsItens'
    Left = 224
    Top = 512
    object cdsItensid: TIntegerField
      FieldName = 'id'
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
  object dSetItens: TSQLDataSet
    SchemaName = 'gustavo_reblin'
    CommandText = 'select * from item;'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConn
    Left = 32
    Top = 512
  end
  object dpsItens: TDataSetProvider
    DataSet = dSetItens
    Left = 128
    Top = 512
  end
  object dSourceItens: TDataSource
    DataSet = cdsItens
    Left = 320
    Top = 512
  end
  object queryEnderecoCliente: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConn
    Left = 496
    Top = 72
  end
end
