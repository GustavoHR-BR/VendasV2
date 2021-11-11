object frmDashboard: TfrmDashboard
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Dashboard'
  ClientHeight = 646
  ClientWidth = 804
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
  object shapeItensTotalBlue: TShape
    Left = 470
    Top = 579
    Width = 129
    Height = 51
    Brush.Color = clSkyBlue
    Pen.Color = clMedGray
    Pen.Width = 2
    Shape = stRoundRect
  end
  object shapeItensTotalGreen: TShape
    Left = 470
    Top = 579
    Width = 129
    Height = 51
    Brush.Color = clMoneyGreen
    Pen.Color = clMedGray
    Pen.Width = 2
    Shape = stRoundRect
  end
  object shapeTotalVendasRed: TShape
    Left = 321
    Top = 579
    Width = 129
    Height = 51
    Brush.Color = 6973183
    Pen.Color = clMedGray
    Pen.Width = 2
    Shape = stRoundRect
  end
  object shapeTotalVendasBlue: TShape
    Left = 321
    Top = 579
    Width = 129
    Height = 51
    Brush.Color = clSkyBlue
    Pen.Color = clMedGray
    Pen.Width = 2
    Shape = stRoundRect
  end
  object shapeTicketTotalGreen: TShape
    Left = 174
    Top = 579
    Width = 129
    Height = 51
    Brush.Color = clMoneyGreen
    Pen.Color = clMedGray
    Pen.Width = 2
    Shape = stRoundRect
  end
  object shapeTicketTotalBlue: TShape
    Left = 174
    Top = 579
    Width = 129
    Height = 51
    Brush.Color = clSkyBlue
    Pen.Color = clMedGray
    Pen.Width = 2
    Shape = stRoundRect
  end
  object shapeTicketMedioGreen: TShape
    Left = 24
    Top = 579
    Width = 129
    Height = 51
    Brush.Color = clMoneyGreen
    Pen.Color = clMedGray
    Pen.Width = 2
    Shape = stRoundRect
  end
  object shapeTicketMedioRed: TShape
    Left = 24
    Top = 579
    Width = 129
    Height = 51
    Brush.Color = 6973183
    Pen.Color = clMedGray
    Pen.Width = 2
    Shape = stRoundRect
  end
  object Shape15: TShape
    Left = 584
    Top = 45
    Width = 57
    Height = 50
    Brush.Color = clSilver
    Pen.Color = clMedGray
    Pen.Width = 2
    Shape = stRoundRect
  end
  object Shape14: TShape
    Left = 380
    Top = 45
    Width = 192
    Height = 50
    Brush.Color = clSilver
    Pen.Color = clMedGray
    Pen.Width = 2
    Shape = stRoundRect
  end
  object Shape13: TShape
    Left = 369
    Top = 108
    Width = 192
    Height = 50
    Brush.Color = clSilver
    Pen.Color = clMedGray
    Pen.Width = 2
    Shape = stRoundRect
  end
  object Shape12: TShape
    Left = 222
    Top = 108
    Width = 134
    Height = 50
    Brush.Color = clSilver
    Pen.Color = clMedGray
    Pen.Width = 2
    Shape = stRoundRect
  end
  object Shape11: TShape
    Left = 251
    Top = 45
    Width = 114
    Height = 50
    Brush.Color = clSilver
    Pen.Color = clMedGray
    Pen.Width = 2
    Shape = stRoundRect
  end
  object Shape10: TShape
    Left = 96
    Top = 45
    Width = 140
    Height = 50
    Brush.Color = clSilver
    Pen.Color = clMedGray
    Pen.Width = 2
    Shape = stRoundRect
  end
  object Shape9: TShape
    Left = 24
    Top = 45
    Width = 57
    Height = 50
    Brush.Color = clSilver
    Pen.Color = clMedGray
    Pen.Width = 2
    Shape = stRoundRect
  end
  object Shape8: TShape
    Left = 24
    Top = 108
    Width = 185
    Height = 50
    Brush.Color = clSilver
    Pen.Color = clMedGray
    Pen.Width = 2
    Shape = stRoundRect
  end
  object Shape7: TShape
    Left = 248
    Top = 231
    Width = 129
    Height = 50
    Brush.Color = clSilver
    Pen.Color = clMedGray
    Pen.Width = 2
    Shape = stRoundRect
  end
  object Shape6: TShape
    Left = 104
    Top = 231
    Width = 129
    Height = 50
    Brush.Color = clSilver
    Pen.Color = clMedGray
    Pen.Width = 2
    Shape = stRoundRect
  end
  object Shape5: TShape
    Left = 24
    Top = 231
    Width = 65
    Height = 50
    Brush.Color = clSilver
    Pen.Color = clMedGray
    Pen.Width = 2
    Shape = stRoundRect
  end
  object shpTotalDeVendas: TShape
    Left = 321
    Top = 349
    Width = 129
    Height = 50
    Brush.Color = clSilver
    Pen.Color = clMedGray
    Pen.Width = 2
    Shape = stRoundRect
  end
  object Label1: TLabel
    Left = 321
    Top = 353
    Width = 129
    Height = 15
    Alignment = taCenter
    AutoSize = False
    Caption = 'Total de vendas:'
    Color = clGray
    Font.Charset = ANSI_CHARSET
    Font.Color = clDefault
    Font.Height = -15
    Font.Name = 'Bahnschrift Light SemiCondensed'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object totalVendasAll: TLabel
    Left = 321
    Top = 376
    Width = 129
    Height = 15
    Align = alCustom
    Alignment = taCenter
    AutoSize = False
    Caption = 'NULL'
    Color = clGray
    Font.Charset = ANSI_CHARSET
    Font.Color = clDefault
    Font.Height = -15
    Font.Name = 'Bahnschrift Light SemiCondensed'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object shpQtdItensVendidos: TShape
    Left = 470
    Top = 349
    Width = 129
    Height = 50
    Brush.Color = clSilver
    Pen.Color = clMedGray
    Pen.Width = 2
    Shape = stRoundRect
  end
  object Label2: TLabel
    Left = 470
    Top = 353
    Width = 129
    Height = 15
    Alignment = taCenter
    AutoSize = False
    Caption = 'Itens vendidos:'
    Color = clGray
    Font.Charset = ANSI_CHARSET
    Font.Color = clDefault
    Font.Height = -15
    Font.Name = 'Bahnschrift Light SemiCondensed'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object totalItensAll: TLabel
    Left = 470
    Top = 376
    Width = 129
    Height = 15
    Align = alCustom
    Alignment = taCenter
    AutoSize = False
    Caption = 'NULL'
    Color = clGray
    Font.Charset = ANSI_CHARSET
    Font.Color = clDefault
    Font.Height = -15
    Font.Name = 'Bahnschrift Light SemiCondensed'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object Shape1: TShape
    Left = 24
    Top = 349
    Width = 129
    Height = 51
    Brush.Color = clSilver
    Pen.Color = clMedGray
    Pen.Width = 2
    Shape = stRoundRect
  end
  object Label3: TLabel
    Left = 24
    Top = 353
    Width = 129
    Height = 15
    Alignment = taCenter
    AutoSize = False
    Caption = 'Ticket m'#233'dio:'
    Color = clGray
    Font.Charset = ANSI_CHARSET
    Font.Color = clDefault
    Font.Height = -15
    Font.Name = 'Bahnschrift Light SemiCondensed'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object ticketMedioAll: TLabel
    Left = 24
    Top = 376
    Width = 129
    Height = 15
    Align = alCustom
    Alignment = taCenter
    AutoSize = False
    Caption = 'NULL'
    Color = clGray
    Font.Charset = ANSI_CHARSET
    Font.Color = clDefault
    Font.Height = -15
    Font.Name = 'Bahnschrift Light SemiCondensed'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object Label4: TLabel
    Left = 8
    Top = 192
    Width = 177
    Height = 30
    AutoSize = False
    Caption = ' Produto mais vendido:'
    Color = clGray
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -19
    Font.Name = 'Bahnschrift SemiCondensed'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object Shape4: TShape
    Left = 174
    Top = 349
    Width = 129
    Height = 51
    Brush.Color = clSilver
    Pen.Color = clMedGray
    Pen.Width = 2
    Shape = stRoundRect
  end
  object Label6: TLabel
    Left = 174
    Top = 353
    Width = 129
    Height = 15
    Alignment = taCenter
    AutoSize = False
    Caption = 'Ticket total:'
    Color = clGray
    Font.Charset = ANSI_CHARSET
    Font.Color = clDefault
    Font.Height = -15
    Font.Name = 'Bahnschrift Light SemiCondensed'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object ticketTotalAll: TLabel
    Left = 174
    Top = 376
    Width = 129
    Height = 15
    Align = alCustom
    Alignment = taCenter
    AutoSize = False
    Caption = 'NULL'
    Color = clGray
    Font.Charset = ANSI_CHARSET
    Font.Color = clDefault
    Font.Height = -15
    Font.Name = 'Bahnschrift Light SemiCondensed'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object Shape3: TShape
    Left = 618
    Top = 349
    Width = 167
    Height = 50
    Brush.Color = clSilver
    Pen.Color = clMedGray
    Pen.Width = 2
    Shape = stRoundRect
  end
  object Label9: TLabel
    Left = 618
    Top = 353
    Width = 167
    Height = 17
    Alignment = taCenter
    AutoSize = False
    Caption = 'M'#233'dia de vendas: [anual]'
    Color = clGray
    Font.Charset = ANSI_CHARSET
    Font.Color = clDefault
    Font.Height = -15
    Font.Name = 'Bahnschrift Light SemiCondensed'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object mediaVendas: TLabel
    Left = 618
    Top = 376
    Width = 167
    Height = 15
    Align = alCustom
    Alignment = taCenter
    AutoSize = False
    Caption = 'NULL'
    Color = clGray
    Font.Charset = ANSI_CHARSET
    Font.Color = clDefault
    Font.Height = -15
    Font.Name = 'Bahnschrift Light SemiCondensed'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object Label11: TLabel
    Left = -13
    Top = 412
    Width = 1548
    Height = 19
    Caption = 
      '----------------------------------------------------------------' +
      '----------------------------------------------------------------' +
      '----------------------------------------------------------------' +
      '----------------------------------------------------------------' +
      '--'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label12: TLabel
    Left = -646
    Top = 290
    Width = 1548
    Height = 19
    Caption = 
      '----------------------------------------------------------------' +
      '----------------------------------------------------------------' +
      '----------------------------------------------------------------' +
      '----------------------------------------------------------------' +
      '--'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label13: TLabel
    Left = -614
    Top = 167
    Width = 1548
    Height = 19
    Caption = 
      '----------------------------------------------------------------' +
      '----------------------------------------------------------------' +
      '----------------------------------------------------------------' +
      '----------------------------------------------------------------' +
      '--'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object nomeCli: TLabel
    Left = 33
    Top = 132
    Width = 176
    Height = 17
    Alignment = taCenter
    AutoSize = False
    Caption = 'NULL'
    Color = clGray
    Font.Charset = ANSI_CHARSET
    Font.Color = clDefault
    Font.Height = -15
    Font.Name = 'Bahnschrift Light SemiCondensed'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object CpfCli: TLabel
    Left = 96
    Top = 72
    Width = 140
    Height = 18
    Alignment = taCenter
    AutoSize = False
    Caption = 'NULL'
    Color = clGray
    Font.Charset = ANSI_CHARSET
    Font.Color = clDefault
    Font.Height = -15
    Font.Name = 'Bahnschrift Light SemiCondensed'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object telefoneCli: TLabel
    Left = 222
    Top = 131
    Width = 134
    Height = 18
    Alignment = taCenter
    AutoSize = False
    Caption = 'NULL'
    Color = clGray
    Font.Charset = ANSI_CHARSET
    Font.Color = clDefault
    Font.Height = -15
    Font.Name = 'Bahnschrift Light SemiCondensed'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object emailCli: TLabel
    Left = 369
    Top = 132
    Width = 192
    Height = 18
    Alignment = taCenter
    AutoSize = False
    Caption = 'NULL'
    Color = clGray
    Font.Charset = ANSI_CHARSET
    Font.Color = clDefault
    Font.Height = -15
    Font.Name = 'Bahnschrift Light SemiCondensed'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object nascimentoCli: TLabel
    Left = 251
    Top = 72
    Width = 114
    Height = 18
    Alignment = taCenter
    AutoSize = False
    Caption = 'NULL'
    Color = clGray
    Font.Charset = ANSI_CHARSET
    Font.Color = clDefault
    Font.Height = -15
    Font.Name = 'Bahnschrift Light SemiCondensed'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object cidadeCli: TLabel
    Left = 380
    Top = 72
    Width = 192
    Height = 18
    Alignment = taCenter
    AutoSize = False
    Caption = 'NULL'
    Color = clGray
    Font.Charset = ANSI_CHARSET
    Font.Color = clDefault
    Font.Height = -15
    Font.Name = 'Bahnschrift Light SemiCondensed'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object idCli: TLabel
    Left = 24
    Top = 72
    Width = 57
    Height = 15
    Alignment = taCenter
    AutoSize = False
    Caption = 'NULL'
    Color = clGray
    Font.Charset = ANSI_CHARSET
    Font.Color = clDefault
    Font.Height = -15
    Font.Name = 'Bahnschrift Light SemiCondensed'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object estadoCli: TLabel
    Left = 585
    Top = 72
    Width = 57
    Height = 18
    Alignment = taCenter
    AutoSize = False
    Caption = 'NULL'
    Color = clGray
    Font.Charset = ANSI_CHARSET
    Font.Color = clDefault
    Font.Height = -15
    Font.Name = 'Bahnschrift Light SemiCondensed'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object idPro: TLabel
    Left = 24
    Top = 258
    Width = 65
    Height = 18
    Alignment = taCenter
    AutoSize = False
    Caption = 'NULL'
    Color = clGray
    Font.Charset = ANSI_CHARSET
    Font.Color = clDefault
    Font.Height = -15
    Font.Name = 'Bahnschrift Light SemiCondensed'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object precoPro: TLabel
    Left = 251
    Top = 258
    Width = 129
    Height = 15
    Alignment = taCenter
    AutoSize = False
    Caption = 'NULL'
    Color = clGray
    Font.Charset = ANSI_CHARSET
    Font.Color = clDefault
    Font.Height = -15
    Font.Name = 'Bahnschrift Light SemiCondensed'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object nomePro: TLabel
    Left = 107
    Top = 258
    Width = 129
    Height = 15
    Alignment = taCenter
    AutoSize = False
    Caption = 'NULL'
    Color = clGray
    Font.Charset = ANSI_CHARSET
    Font.Color = clDefault
    Font.Height = -15
    Font.Name = 'Bahnschrift Light SemiCondensed'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object Label15: TLabel
    Left = 248
    Top = 234
    Width = 129
    Height = 16
    Alignment = taCenter
    AutoSize = False
    Caption = 'Pre'#231'o:'
    Color = clGray
    Font.Charset = ANSI_CHARSET
    Font.Color = clDefault
    Font.Height = -15
    Font.Name = 'Bahnschrift Light SemiCondensed'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object Label16: TLabel
    Left = 104
    Top = 234
    Width = 129
    Height = 18
    Alignment = taCenter
    AutoSize = False
    Caption = 'Produto:'
    Color = clGray
    Font.Charset = ANSI_CHARSET
    Font.Color = clDefault
    Font.Height = -15
    Font.Name = 'Bahnschrift Light SemiCondensed'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object Label17: TLabel
    Left = 24
    Top = 234
    Width = 65
    Height = 18
    Alignment = taCenter
    AutoSize = False
    Caption = 'C'#243'digo:'
    Color = clGray
    Font.Charset = ANSI_CHARSET
    Font.Color = clDefault
    Font.Height = -15
    Font.Name = 'Bahnschrift Light SemiCondensed'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object Label5: TLabel
    Left = 8
    Top = 8
    Width = 121
    Height = 30
    AutoSize = False
    Caption = ' Melhor cliente:'
    Color = clGray
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -19
    Font.Name = 'Bahnschrift SemiCondensed'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object Label14: TLabel
    Left = 24
    Top = 111
    Width = 185
    Height = 15
    Alignment = taCenter
    AutoSize = False
    Caption = 'Nome:'
    Color = clGray
    Font.Charset = ANSI_CHARSET
    Font.Color = clDefault
    Font.Height = -15
    Font.Name = 'Bahnschrift Light SemiCondensed'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object Label19: TLabel
    Left = 24
    Top = 51
    Width = 57
    Height = 18
    Alignment = taCenter
    AutoSize = False
    Caption = 'C'#243'digo:'
    Color = clGray
    Font.Charset = ANSI_CHARSET
    Font.Color = clDefault
    Font.Height = -15
    Font.Name = 'Bahnschrift Light SemiCondensed'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object Label20: TLabel
    Left = 96
    Top = 49
    Width = 140
    Height = 15
    Alignment = taCenter
    AutoSize = False
    Caption = 'CPF:'
    Color = clGray
    Font.Charset = ANSI_CHARSET
    Font.Color = clDefault
    Font.Height = -15
    Font.Name = 'Bahnschrift Light SemiCondensed'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object Label21: TLabel
    Left = 251
    Top = 49
    Width = 114
    Height = 15
    Alignment = taCenter
    AutoSize = False
    Caption = 'Nascimento:'
    Color = clGray
    Font.Charset = ANSI_CHARSET
    Font.Color = clDefault
    Font.Height = -15
    Font.Name = 'Bahnschrift Light SemiCondensed'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object Label22: TLabel
    Left = 222
    Top = 111
    Width = 134
    Height = 15
    Alignment = taCenter
    AutoSize = False
    Caption = 'Telefone:'
    Color = clGray
    Font.Charset = ANSI_CHARSET
    Font.Color = clDefault
    Font.Height = -15
    Font.Name = 'Bahnschrift Light SemiCondensed'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object Label23: TLabel
    Left = 369
    Top = 111
    Width = 192
    Height = 15
    Alignment = taCenter
    AutoSize = False
    Caption = 'E-mail:'
    Color = clGray
    Font.Charset = ANSI_CHARSET
    Font.Color = clDefault
    Font.Height = -15
    Font.Name = 'Bahnschrift Light SemiCondensed'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object Label24: TLabel
    Left = 380
    Top = 49
    Width = 192
    Height = 16
    Alignment = taCenter
    AutoSize = False
    Caption = 'Cidade:'
    Color = clGray
    Font.Charset = ANSI_CHARSET
    Font.Color = clDefault
    Font.Height = -15
    Font.Name = 'Bahnschrift Light SemiCondensed'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object Label25: TLabel
    Left = 585
    Top = 49
    Width = 57
    Height = 18
    Alignment = taCenter
    AutoSize = False
    Caption = 'UF:'
    Color = clGray
    Font.Charset = ANSI_CHARSET
    Font.Color = clDefault
    Font.Height = -15
    Font.Name = 'Bahnschrift Light SemiCondensed'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object Label18: TLabel
    Left = 8
    Top = 439
    Width = 241
    Height = 30
    AutoSize = False
    Caption = '  Resumo das vendas do m'#234's de:'
    Color = clGray
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -19
    Font.Name = 'Bahnschrift SemiCondensed'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object Shape2: TShape
    Left = 321
    Top = 479
    Width = 129
    Height = 51
    Brush.Color = clSilver
    Pen.Color = clMedGray
    Pen.Width = 2
    Shape = stRoundRect
  end
  object Label7: TLabel
    Left = 321
    Top = 485
    Width = 129
    Height = 15
    Alignment = taCenter
    AutoSize = False
    Caption = 'Total de vendas:'
    Color = clGray
    Font.Charset = ANSI_CHARSET
    Font.Color = clDefault
    Font.Height = -15
    Font.Name = 'Bahnschrift Light SemiCondensed'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object totalVendas: TLabel
    Left = 321
    Top = 505
    Width = 129
    Height = 15
    Align = alCustom
    Alignment = taCenter
    AutoSize = False
    Caption = 'NULL'
    Color = clGray
    Font.Charset = ANSI_CHARSET
    Font.Color = clDefault
    Font.Height = -15
    Font.Name = 'Bahnschrift Light SemiCondensed'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object Shape16: TShape
    Left = 24
    Top = 479
    Width = 129
    Height = 51
    Brush.Color = clSilver
    Pen.Color = clMedGray
    Pen.Width = 2
    Shape = stRoundRect
  end
  object Label26: TLabel
    Left = 24
    Top = 485
    Width = 129
    Height = 15
    Alignment = taCenter
    AutoSize = False
    Caption = 'Ticket m'#233'dio:'
    Color = clGray
    Font.Charset = ANSI_CHARSET
    Font.Color = clDefault
    Font.Height = -15
    Font.Name = 'Bahnschrift Light SemiCondensed'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object ticketMedio: TLabel
    Left = 24
    Top = 505
    Width = 129
    Height = 15
    Align = alCustom
    Alignment = taCenter
    AutoSize = False
    Caption = 'NULL'
    Color = clGray
    Font.Charset = ANSI_CHARSET
    Font.Color = clDefault
    Font.Height = -15
    Font.Name = 'Bahnschrift Light SemiCondensed'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object Shape17: TShape
    Left = 174
    Top = 479
    Width = 129
    Height = 51
    Brush.Color = clSilver
    Pen.Color = clMedGray
    Pen.Width = 2
    Shape = stRoundRect
  end
  object Label28: TLabel
    Left = 174
    Top = 485
    Width = 129
    Height = 15
    Alignment = taCenter
    AutoSize = False
    Caption = 'Ticket total:'
    Color = clGray
    Font.Charset = ANSI_CHARSET
    Font.Color = clDefault
    Font.Height = -15
    Font.Name = 'Bahnschrift Light SemiCondensed'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object ticketTotal: TLabel
    Left = 174
    Top = 505
    Width = 129
    Height = 15
    Align = alCustom
    Alignment = taCenter
    AutoSize = False
    Caption = 'NULL'
    Color = clGray
    Font.Charset = ANSI_CHARSET
    Font.Color = clDefault
    Font.Height = -15
    Font.Name = 'Bahnschrift Light SemiCondensed'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object Label30: TLabel
    Left = 8
    Top = 315
    Width = 281
    Height = 30
    AutoSize = False
    Caption = '  Resumo de todas as vendas:'
    Color = clGray
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -19
    Font.Name = 'Bahnschrift SemiCondensed'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object Shape18: TShape
    Left = 470
    Top = 479
    Width = 129
    Height = 51
    Brush.Color = clSilver
    Pen.Color = clMedGray
    Pen.Width = 2
    Shape = stRoundRect
  end
  object Label31: TLabel
    Left = 470
    Top = 482
    Width = 129
    Height = 15
    Alignment = taCenter
    AutoSize = False
    Caption = 'Itens vendidos:'
    Color = clGray
    Font.Charset = ANSI_CHARSET
    Font.Color = clDefault
    Font.Height = -15
    Font.Name = 'Bahnschrift Light SemiCondensed'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object totalItens: TLabel
    Left = 470
    Top = 505
    Width = 129
    Height = 15
    Align = alCustom
    Alignment = taCenter
    AutoSize = False
    Caption = 'NULL'
    Color = clGray
    Font.Charset = ANSI_CHARSET
    Font.Color = clDefault
    Font.Height = -15
    Font.Name = 'Bahnschrift Light SemiCondensed'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object Label8: TLabel
    Left = 8
    Top = 543
    Width = 357
    Height = 30
    AutoSize = False
    Caption = '  M'#234's atual em rela'#231#227'o ao m'#234's selecionado:'
    Color = clGray
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -19
    Font.Name = 'Bahnschrift SemiCondensed'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object shapeTicketMedioBlue: TShape
    Left = 24
    Top = 579
    Width = 129
    Height = 51
    Brush.Color = clSkyBlue
    Pen.Color = clMedGray
    Pen.Width = 2
    Shape = stRoundRect
  end
  object porcTickMedio: TLabel
    Left = 24
    Top = 605
    Width = 129
    Height = 17
    Alignment = taCenter
    AutoSize = False
    Caption = 'NULL'
    Color = clGray
    Font.Charset = ANSI_CHARSET
    Font.Color = clDefault
    Font.Height = -15
    Font.Name = 'Bahnschrift Light SemiCondensed'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object shapeTicketTotalRed: TShape
    Left = 174
    Top = 579
    Width = 129
    Height = 51
    Brush.Color = 6973183
    Pen.Color = clMedGray
    Pen.Width = 2
    Shape = stRoundRect
  end
  object porcTickTotal: TLabel
    Left = 174
    Top = 605
    Width = 129
    Height = 17
    Alignment = taCenter
    AutoSize = False
    Caption = 'NULL'
    Color = clGray
    Font.Charset = ANSI_CHARSET
    Font.Color = clDefault
    Font.Height = -15
    Font.Name = 'Bahnschrift Light SemiCondensed'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object shapeTotalVendasGreen: TShape
    Left = 321
    Top = 579
    Width = 129
    Height = 51
    Brush.Color = clMoneyGreen
    Pen.Color = clMedGray
    Pen.Width = 2
    Shape = stRoundRect
  end
  object porcTotalVendas: TLabel
    Left = 324
    Top = 605
    Width = 129
    Height = 17
    Alignment = taCenter
    AutoSize = False
    Caption = 'NULL'
    Color = clGray
    Font.Charset = ANSI_CHARSET
    Font.Color = clDefault
    Font.Height = -15
    Font.Name = 'Bahnschrift Light SemiCondensed'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object shapeItensTotalRed: TShape
    Left = 470
    Top = 579
    Width = 129
    Height = 51
    Brush.Color = 6973183
    Pen.Color = clMedGray
    Pen.Width = 2
    Shape = stRoundRect
  end
  object porcItensVendidos: TLabel
    Left = 474
    Top = 605
    Width = 129
    Height = 17
    Alignment = taCenter
    AutoSize = False
    Caption = 'NULL'
    Color = clGray
    Font.Charset = ANSI_CHARSET
    Font.Color = clDefault
    Font.Height = -15
    Font.Name = 'Bahnschrift Light SemiCondensed'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object Label10: TLabel
    Left = 24
    Top = 585
    Width = 129
    Height = 15
    Alignment = taCenter
    AutoSize = False
    Caption = 'Ticket m'#233'dio:'
    Color = clGray
    Font.Charset = ANSI_CHARSET
    Font.Color = clDefault
    Font.Height = -15
    Font.Name = 'Bahnschrift Light SemiCondensed'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object Label27: TLabel
    Left = 174
    Top = 585
    Width = 129
    Height = 15
    Alignment = taCenter
    AutoSize = False
    Caption = 'Ticket total:'
    Color = clGray
    Font.Charset = ANSI_CHARSET
    Font.Color = clDefault
    Font.Height = -15
    Font.Name = 'Bahnschrift Light SemiCondensed'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object Label29: TLabel
    Left = 324
    Top = 585
    Width = 129
    Height = 15
    Alignment = taCenter
    AutoSize = False
    Caption = 'Total de vendas:'
    Color = clGray
    Font.Charset = ANSI_CHARSET
    Font.Color = clDefault
    Font.Height = -15
    Font.Name = 'Bahnschrift Light SemiCondensed'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object Label32: TLabel
    Left = 474
    Top = 585
    Width = 129
    Height = 15
    Alignment = taCenter
    AutoSize = False
    Caption = 'Itens vendidos:'
    Color = clGray
    Font.Charset = ANSI_CHARSET
    Font.Color = clDefault
    Font.Height = -15
    Font.Name = 'Bahnschrift Light SemiCondensed'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object Shape19: TShape
    Left = 392
    Top = 231
    Width = 129
    Height = 50
    Brush.Color = clSilver
    Pen.Color = clMedGray
    Pen.Width = 2
    Shape = stRoundRect
  end
  object qtdProdMaisvendido: TLabel
    Left = 392
    Top = 258
    Width = 129
    Height = 15
    Alignment = taCenter
    AutoSize = False
    Caption = 'NULL'
    Color = clGray
    Font.Charset = ANSI_CHARSET
    Font.Color = clDefault
    Font.Height = -15
    Font.Name = 'Bahnschrift Light SemiCondensed'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object Label34: TLabel
    Left = 392
    Top = 234
    Width = 129
    Height = 16
    Alignment = taCenter
    AutoSize = False
    Caption = 'Quantidade:'
    Color = clGray
    Font.Charset = ANSI_CHARSET
    Font.Color = clDefault
    Font.Height = -15
    Font.Name = 'Bahnschrift Light SemiCondensed'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object Shape20: TShape
    Left = 572
    Top = 108
    Width = 189
    Height = 50
    Brush.Color = clSilver
    Pen.Color = clMedGray
    Pen.Width = 2
    Shape = stRoundRect
  end
  object Label33: TLabel
    Left = 572
    Top = 111
    Width = 189
    Height = 15
    Alignment = taCenter
    AutoSize = False
    Caption = 'Total em vendas:'
    Color = clGray
    Font.Charset = ANSI_CHARSET
    Font.Color = clDefault
    Font.Height = -15
    Font.Name = 'Bahnschrift Light SemiCondensed'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object totalEmVendas: TLabel
    Left = 572
    Top = 133
    Width = 189
    Height = 15
    Align = alCustom
    Alignment = taCenter
    AutoSize = False
    Caption = 'NULL'
    Color = clGray
    Font.Charset = ANSI_CHARSET
    Font.Color = clDefault
    Font.Height = -15
    Font.Name = 'Bahnschrift Light SemiCondensed'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object Shape21: TShape
    Left = 653
    Top = 45
    Width = 108
    Height = 50
    Brush.Color = clSilver
    Pen.Color = clMedGray
    Pen.Width = 2
    Shape = stRoundRect
  end
  object Label35: TLabel
    Left = 653
    Top = 49
    Width = 108
    Height = 20
    Alignment = taCenter
    AutoSize = False
    Caption = 'N'#186' compras:'
    Color = clGray
    Font.Charset = ANSI_CHARSET
    Font.Color = clDefault
    Font.Height = -15
    Font.Name = 'Bahnschrift Light SemiCondensed'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object numCompras: TLabel
    Left = 653
    Top = 72
    Width = 108
    Height = 15
    Align = alCustom
    Alignment = taCenter
    AutoSize = False
    Caption = 'NULL'
    Color = clGray
    Font.Charset = ANSI_CHARSET
    Font.Color = clDefault
    Font.Height = -15
    Font.Name = 'Bahnschrift Light SemiCondensed'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object cbMes: TComboBox
    Left = 251
    Top = 437
    Width = 145
    Height = 27
    Style = csDropDownList
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Bahnschrift Light SemiCondensed'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnSelect = cbMesSelect
    Items.Strings = (
      'Janeiro'
      'Fevereiro'
      'Mar'#231'o'
      'Abril'
      'Maio'
      'Junho'
      'Julho'
      'Agosto'
      'Setembro'
      'Outubro'
      'Novembro'
      'Dezembro')
  end
  object cbAno: TComboBox
    Left = 405
    Top = 437
    Width = 145
    Height = 27
    Style = csDropDownList
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Bahnschrift Light SemiCondensed'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnSelect = cbAnoSelect
    Items.Strings = (
      '2011'
      '2012'
      '2013'
      '2014'
      '2015'
      '2016'
      '2017'
      '2018'
      '2019'
      '2020'
      '2021')
  end
  object btnSair: TButton
    Left = 710
    Top = 600
    Width = 75
    Height = 30
    Caption = 'Sair'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Bahnschrift Light SemiCondensed'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = btnSairClick
  end
end
