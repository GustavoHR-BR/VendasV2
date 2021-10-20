unit uDataModule;

interface

uses
  System.SysUtils, System.Classes, Data.DBXMySQL, Data.DB, Data.SqlExpr,
  Data.FMTBcd, Datasnap.DBClient, Datasnap.Provider;

type
  Tdm = class(TDataModule)
    SQLConn: TSQLConnection;
    cdsClientes: TClientDataSet;
    dSetClientes: TSQLDataSet;
    dspClientes: TDataSetProvider;
    dSourceClientes: TDataSource;
    cdsClientesid: TIntegerField;
    cdsClientesfk_rua: TIntegerField;
    cdsClientesnome: TStringField;
    cdsClientescpf: TStringField;
    cdsClientestelefone: TStringField;
    cdsClientesemail: TStringField;
    cdsClientesdata_nascimento: TStringField;
    cdsClientesendereco: TStringField;
    cdsProdutos: TClientDataSet;
    dSetProdutos: TSQLDataSet;
    dspProdutos: TDataSetProvider;
    dSourceProdutos: TDataSource;
    cdsRuas: TClientDataSet;
    dSetRuas: TSQLDataSet;
    dspRuas: TDataSetProvider;
    dSourceRuas: TDataSource;
    cdsBairros: TClientDataSet;
    dSetBairros: TSQLDataSet;
    dspBairros: TDataSetProvider;
    dSourceBairros: TDataSource;
    cdsProdutosid: TIntegerField;
    cdsProdutosnome: TStringField;
    cdsProdutospreco: TFMTBCDField;
    cdsProdutosdescricao: TStringField;
    cdsProdutosquantidade_estoque: TIntegerField;
    cdsRuasid: TIntegerField;
    cdsRuasnome: TStringField;
    cdsRuasfk_bairro: TIntegerField;
    cdsBairrosid: TIntegerField;
    cdsBairrosnome: TStringField;
    cdsBairrosfk_cidade: TIntegerField;
    cdsCidades: TClientDataSet;
    dSetCidades: TSQLDataSet;
    dspCidades: TDataSetProvider;
    dSourceCidades: TDataSource;
    cdsEstados: TClientDataSet;
    dSetEstados: TSQLDataSet;
    dspEstados: TDataSetProvider;
    dSourceEstados: TDataSource;
    cdsCidadesid: TIntegerField;
    cdsCidadesnome: TStringField;
    cdsCidadesfk_estado: TIntegerField;
    cdsEstadosid: TIntegerField;
    cdsEstadosnome: TStringField;
    cdsEstadosuf: TStringField;
    cdsVendas: TClientDataSet;
    dSetVendas: TSQLDataSet;
    dspVendas: TDataSetProvider;
    dSourceVendas: TDataSource;
    cdsItens: TClientDataSet;
    dSetItens: TSQLDataSet;
    dpsItens: TDataSetProvider;
    dSourceItens: TDataSource;
    cdsVendasid: TIntegerField;
    cdsVendasfk_cliente: TIntegerField;
    cdsVendastotal: TFMTBCDField;
    cdsVendasdata: TStringField;
    cdsItensid: TIntegerField;
    cdsItensfk_venda: TIntegerField;
    cdsItensfk_produto: TIntegerField;
    cdsItensnome: TStringField;
    cdsItenspreco: TFMTBCDField;
    cdsItensdescricao: TStringField;
    cdsItensquantidade: TIntegerField;
    cdsClientesRua: TStringField;
    SQLDataSet1: TSQLDataSet;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dm: Tdm;

implementation

{%CLASSGROUP 'System.Classes.TPersistent'}

{$R *.dfm}

end.
