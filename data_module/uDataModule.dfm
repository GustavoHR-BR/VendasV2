object dm: Tdm
  OldCreateOrder = False
  Height = 418
  Width = 590
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
      'HostName=localhost'
      'Database=vendas'
      'User_Name=root'
      'Password=root'
      'MaxBlobSize=-1'
      'LocaleCode=0000'
      'Compressed=False'
      'Encrypted=False'
      'BlobSize=-1'
      'ErrorResourceFile=')
    VendorLib = 'LIBMYSQL.dll'
    Connected = True
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
    object cdsClientesfk_cidade: TIntegerField
      FieldName = 'fk_cidade'
    end
    object cdsClientesnome: TStringField
      FieldName = 'nome'
      Size = 60
    end
    object cdsClientescpf: TStringField
      FieldName = 'cpf'
      EditMask = '000.000.000-00;1;_'
      Size = 16
    end
    object cdsClientestelefone: TStringField
      FieldName = 'telefone'
      EditMask = '(00)00000-0000;1;_'
      Size = 15
    end
    object cdsClientesemail: TStringField
      FieldName = 'email'
      Size = 30
    end
    object cdsClientesdata_nascimento: TStringField
      FieldName = 'data_nascimento'
      EditMask = '00/00/0000;1;_'
      Size = 10
    end
    object cdsClientesrua: TStringField
      FieldName = 'rua'
      Size = 50
    end
    object cdsClientesbairro: TStringField
      FieldName = 'bairro'
      Size = 50
    end
    object cdsClientesnome_1: TStringField
      FieldName = 'nome_1'
      Size = 80
    end
    object cdsClientesfk_estado: TIntegerField
      FieldName = 'fk_estado'
    end
    object cdsClientesid_2: TIntegerField
      FieldName = 'id_2'
      Required = True
    end
    object cdsClientesuf: TStringField
      FieldName = 'uf'
      Size = 2
    end
    object cdsClientesnome_2: TStringField
      FieldName = 'nome_2'
      Size = 100
    end
    object cdsClientesid_1: TIntegerField
      FieldName = 'id_1'
      Required = True
    end
  end
  object dSetClientes: TSQLDataSet
    SchemaName = 'gustavo_reblin'
    Active = True
    CommandText = 
      'SELECT * FROM cliente c '#13#10'JOIN cidade cid ON cid.id = c.fk_cidad' +
      'e'#13#10'JOIN estado e ON e.id = cid.fk_estado;'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConn
    Left = 32
    Top = 24
  end
  object dspClientes: TDataSetProvider
    DataSet = dSetClientes
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 128
    Top = 24
  end
  object dSourceClientes: TDataSource
    DataSet = cdsClientes
    Left = 320
    Top = 24
  end
  object dSetProdutos: TSQLDataSet
    SchemaName = 'gustavo_reblin'
    CommandText = 'SELECT * FROM produto ORDER BY nome ASC;'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConn
    Left = 32
    Top = 88
  end
  object dspProdutos: TDataSetProvider
    DataSet = dSetProdutos
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 128
    Top = 88
  end
  object dSourceProdutos: TDataSource
    DataSet = cdsProdutos
    Left = 320
    Top = 88
  end
  object cdsCidades: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCidades'
    Left = 224
    Top = 152
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
    object cdsCidadesuf: TStringField
      FieldName = 'uf'
      Size = 2
    end
  end
  object dSetCidades: TSQLDataSet
    SchemaName = 'gustavo_reblin'
    CommandText = 'SELECT * FROM cidade c JOIN estado e ON c.fk_estado = e.id'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConn
    Left = 32
    Top = 152
  end
  object dspCidades: TDataSetProvider
    DataSet = dSetCidades
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 128
    Top = 152
  end
  object dSourceCidades: TDataSource
    DataSet = cdsCidades
    Left = 320
    Top = 152
  end
  object cdsEstados: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspEstados'
    Left = 224
    Top = 224
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
    Top = 224
  end
  object dspEstados: TDataSetProvider
    DataSet = dSetEstados
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 128
    Top = 224
  end
  object dSourceEstados: TDataSource
    DataSet = cdsEstados
    Left = 320
    Top = 224
  end
  object cdsVendas: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspVendas'
    Left = 224
    Top = 288
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
      currency = True
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
    CommandText = 'SELECT * FROM venda;'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConn
    Left = 32
    Top = 288
  end
  object dspVendas: TDataSetProvider
    DataSet = dSetVendas
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 128
    Top = 288
  end
  object dSourceVendas: TDataSource
    DataSet = cdsVendas
    Left = 320
    Top = 288
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
    SQLConnection = SQLConn
    Left = 32
    Top = 360
  end
  object dpsItens: TDataSetProvider
    DataSet = dSetItens
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 128
    Top = 360
  end
  object dSourceItens: TDataSource
    DataSet = cdsItens
    Left = 320
    Top = 360
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
      currency = True
      Precision = 22
      Size = 6
    end
    object cdsProdutosdescricao: TStringField
      FieldName = 'descricao'
      Size = 100
    end
    object cdsProdutosquantidade_estoque: TIntegerField
      FieldName = 'quantidade_estoque'
    end
  end
  object cdsItens: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dpsItens'
    Left = 224
    Top = 360
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
      currency = True
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
    object cdsItensacrescimo: TIntegerField
      FieldName = 'acrescimo'
    end
    object cdsItensdesconto: TIntegerField
      FieldName = 'desconto'
    end
    object cdsItensvalor_total: TFloatField
      FieldName = 'valor_total'
      currency = True
    end
  end
  object queryEnderecoCliente: TSQLQuery
    DataSource = dSourceClientes
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConn
    Left = 496
    Top = 72
  end
end
