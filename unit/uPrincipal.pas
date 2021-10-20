unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus;

type
  TfrmPrincipal = class(TForm)
    menu: TMainMenu;
    Cadastrar1: TMenuItem;
    Cliente1: TMenuItem;
    Produto1: TMenuItem;
    Pedidosdevenda1: TMenuItem;
    Nova1: TMenuItem;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

end.
