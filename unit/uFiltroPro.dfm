object frmFiltrarPro: TfrmFiltrarPro
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Filtrar produtos'
  ClientHeight = 214
  ClientWidth = 565
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
  object Label1: TLabel
    Left = 24
    Top = 29
    Width = 37
    Height = 13
    Caption = 'C'#243'digo:'
  end
  object Label2: TLabel
    Left = 96
    Top = 29
    Width = 31
    Height = 13
    Caption = 'Nome:'
  end
  object Label3: TLabel
    Left = 24
    Top = 89
    Width = 31
    Height = 13
    Caption = 'Pre'#231'o:'
  end
  object Label4: TLabel
    Left = 110
    Top = 110
    Width = 21
    Height = 13
    Caption = 'At'#233':'
  end
  object Label5: TLabel
    Left = 24
    Top = 110
    Width = 17
    Height = 13
    Caption = 'De:'
  end
  object Label6: TLabel
    Left = 216
    Top = 89
    Width = 50
    Height = 13
    Caption = 'Descri'#231#227'o:'
  end
  object Label7: TLabel
    Left = 378
    Top = 29
    Width = 60
    Height = 13
    Caption = 'Em estoque:'
  end
  object Label8: TLabel
    Left = 378
    Top = 51
    Width = 17
    Height = 13
    Caption = 'De:'
  end
  object Label9: TLabel
    Left = 456
    Top = 51
    Width = 21
    Height = 13
    Caption = 'At'#233':'
  end
  object edtId: TEdit
    Left = 24
    Top = 48
    Width = 57
    Height = 21
    TabOrder = 0
  end
  object edtNome: TEdit
    Left = 96
    Top = 48
    Width = 257
    Height = 21
    TabOrder = 1
  end
  object edtPrecoDe: TEdit
    Left = 45
    Top = 107
    Width = 59
    Height = 21
    TabOrder = 2
    Text = '0'
  end
  object edtPrecoAte: TEdit
    Left = 134
    Top = 107
    Width = 59
    Height = 21
    TabOrder = 3
    Text = '10000'
  end
  object edtDescricao: TEdit
    Left = 216
    Top = 107
    Width = 315
    Height = 21
    TabOrder = 4
  end
  object edtEstoqueDe: TEdit
    Left = 401
    Top = 48
    Width = 49
    Height = 21
    TabOrder = 5
    Text = '0'
  end
  object btnFiltrar: TButton
    Left = 367
    Top = 155
    Width = 67
    Height = 25
    Caption = 'Filtrar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial Unicode MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
    OnClick = btnFiltrarClick
  end
  object btnCancelar: TButton
    Left = 456
    Top = 155
    Width = 75
    Height = 25
    Caption = 'Cancelar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial Unicode MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 7
    OnClick = btnCancelarClick
  end
  object edtEstoqueAte: TEdit
    Left = 483
    Top = 48
    Width = 49
    Height = 21
    TabOrder = 8
    Text = '10000'
  end
end
