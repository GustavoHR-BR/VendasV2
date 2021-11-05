object frmFiltrosCli: TfrmFiltrosCli
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Filtrar clientes'
  ClientHeight = 267
  ClientWidth = 497
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
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
    Left = 120
    Top = 29
    Width = 31
    Height = 13
    Caption = 'Nome:'
  end
  object Label3: TLabel
    Left = 24
    Top = 87
    Width = 23
    Height = 13
    Caption = 'CPF:'
  end
  object Label9: TLabel
    Left = 216
    Top = 86
    Width = 21
    Height = 18
    Caption = 'UF:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial Unicode MS'
    Font.Style = []
    ParentFont = False
  end
  object Label5: TLabel
    Left = 312
    Top = 87
    Width = 37
    Height = 13
    Caption = 'Cidade:'
  end
  object Label6: TLabel
    Left = 24
    Top = 151
    Width = 32
    Height = 13
    Caption = 'Bairro:'
  end
  object Label7: TLabel
    Left = 184
    Top = 151
    Width = 23
    Height = 13
    Caption = 'Rua:'
  end
  object Label8: TLabel
    Left = 340
    Top = 151
    Width = 46
    Height = 13
    Caption = 'Telefone:'
  end
  object edtId: TEdit
    Left = 24
    Top = 48
    Width = 75
    Height = 21
    TabOrder = 0
  end
  object edtNome: TEdit
    Left = 120
    Top = 48
    Width = 353
    Height = 21
    TabOrder = 1
  end
  object edtCpf: TEdit
    Left = 24
    Top = 106
    Width = 169
    Height = 21
    TabOrder = 2
  end
  object cboxEstados: TComboBox
    Left = 216
    Top = 105
    Width = 75
    Height = 23
    Style = csDropDownList
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial Unicode MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    Items.Strings = (
      'AC'
      'AL'
      'AM'
      'AP'
      'BA'
      'CE'
      'DF'
      'ES'
      'GO'
      'MA'
      'MG'
      'MS'
      'MT'
      'PA'
      'PB'
      'PE'
      'PI'
      'PR'
      'RJ'
      'RN'
      'RO'
      'RR'
      'RS'
      'SC'
      'SE'
      'SP'
      'TO')
  end
  object edtCidade: TEdit
    Left = 312
    Top = 106
    Width = 161
    Height = 21
    TabOrder = 4
  end
  object edtBairro: TEdit
    Left = 24
    Top = 170
    Width = 127
    Height = 21
    TabOrder = 5
  end
  object edtRua: TEdit
    Left = 184
    Top = 170
    Width = 127
    Height = 21
    TabOrder = 6
  end
  object edtTelefone: TEdit
    Left = 340
    Top = 170
    Width = 133
    Height = 21
    TabOrder = 7
  end
  object btnFiltrar: TButton
    Left = 309
    Top = 219
    Width = 67
    Height = 25
    Caption = 'Filtrar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial Unicode MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 8
    OnClick = btnFiltrarClick
  end
  object btnCancelar: TButton
    Left = 398
    Top = 219
    Width = 75
    Height = 25
    Caption = 'Cancelar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial Unicode MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 9
    OnClick = btnCancelarClick
  end
end
