object frmCadastrarCliente: TfrmCadastrarCliente
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Cadastro de clientes'
  ClientHeight = 469
  ClientWidth = 646
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label3: TLabel
    Left = 32
    Top = 16
    Width = 26
    Height = 13
    Caption = 'nome'
    FocusControl = DBEdit3
  end
  object Label4: TLabel
    Left = 400
    Top = 16
    Width = 15
    Height = 13
    Caption = 'cpf'
    FocusControl = DBEdit4
  end
  object Label5: TLabel
    Left = 32
    Top = 72
    Width = 40
    Height = 13
    Caption = 'telefone'
    FocusControl = DBEdit5
  end
  object Label6: TLabel
    Left = 248
    Top = 72
    Width = 24
    Height = 13
    Caption = 'email'
    FocusControl = DBEdit6
  end
  object Label7: TLabel
    Left = 478
    Top = 72
    Width = 82
    Height = 13
    Caption = 'data_nascimento'
    FocusControl = DBEdit7
  end
  object DBEdit3: TDBEdit
    Left = 32
    Top = 35
    Width = 337
    Height = 21
    DataField = 'nome'
    DataSource = dm.dSourceClientes
    TabOrder = 0
  end
  object DBEdit4: TDBEdit
    Left = 400
    Top = 35
    Width = 212
    Height = 21
    DataField = 'cpf'
    DataSource = dm.dSourceClientes
    TabOrder = 1
  end
  object DBEdit5: TDBEdit
    Left = 32
    Top = 88
    Width = 199
    Height = 21
    DataField = 'telefone'
    DataSource = dm.dSourceClientes
    TabOrder = 2
  end
  object DBEdit6: TDBEdit
    Left = 248
    Top = 88
    Width = 201
    Height = 21
    DataField = 'email'
    DataSource = dm.dSourceClientes
    TabOrder = 3
  end
  object DBEdit7: TDBEdit
    Left = 478
    Top = 88
    Width = 134
    Height = 21
    DataField = 'data_nascimento'
    DataSource = dm.dSourceClientes
    TabOrder = 4
  end
  object DBGrid1: TDBGrid
    Left = 32
    Top = 152
    Width = 199
    Height = 120
    TabOrder = 5
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object Edit1: TEdit
    Left = 32
    Top = 136
    Width = 199
    Height = 21
    TabOrder = 6
    Text = 'Edit1'
  end
end
