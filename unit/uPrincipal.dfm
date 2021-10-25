object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Sistema de vendas'
  ClientHeight = 266
  ClientWidth = 438
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = menu
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object menu: TMainMenu
    Left = 16
    Top = 8
    object Cadastrar1: TMenuItem
      Caption = 'Cadastrar'
      object Cliente1: TMenuItem
        Caption = 'Cliente'
        OnClick = Cliente1Click
      end
      object Produto1: TMenuItem
        Caption = 'Produto'
        OnClick = Produto1Click
      end
    end
    object Pedidosdevenda1: TMenuItem
      Caption = 'Pedidos de venda'
      object Nova1: TMenuItem
        Caption = 'Nova'
        OnClick = Nova1Click
      end
    end
  end
end
