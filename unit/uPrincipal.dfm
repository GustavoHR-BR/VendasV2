object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Sistema de vendas'
  ClientHeight = 256
  ClientWidth = 428
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = menu
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object menu: TMainMenu
    Left = 32
    Top = 192
    object Cadastrar1: TMenuItem
      Caption = 'Cadastrar'
      object Cliente1: TMenuItem
        Caption = 'Cliente'
      end
      object Produto1: TMenuItem
        Caption = 'Produto'
      end
    end
    object Pedidosdevenda1: TMenuItem
      Caption = 'Pedidos de venda'
      object Nova1: TMenuItem
        Caption = 'Nova'
      end
    end
  end
end
