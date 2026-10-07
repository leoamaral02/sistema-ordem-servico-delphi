object FrmPesquisaOS: TFrmPesquisaOS
  Left = 0
  Top = 0
  Caption = 'Pesquisa de Ordens de Servi'#231'o'
  ClientHeight = 708
  ClientWidth = 1089
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pnlDashboard: TGridPanel
    AlignWithMargins = True
    Left = 12
    Top = 12
    Width = 1065
    Height = 84
    Margins.Left = 12
    Margins.Top = 12
    Margins.Right = 12
    Margins.Bottom = 12
    Align = alTop
    BevelOuter = bvNone
    ColumnCollection = <
      item
        Value = 25.000000000000000000
      end
      item
        Value = 25.000000000000000000
      end
      item
        Value = 25.000000000000000000
      end
      item
        Value = 25.000000000000000000
      end>
    ControlCollection = <
      item
        Column = 0
        Control = pnlCardAbertas
        Row = 0
      end
      item
        Column = 1
        Control = pnlCardEmAndamento
        Row = 0
      end
      item
        Column = 2
        Control = pnlCardConcluidas
        Row = 0
      end
      item
        Column = 3
        Control = pnlCardEmAtraso
        Row = 0
      end>
    RowCollection = <
      item
        Value = 100.000000000000000000
      end>
    TabOrder = 0
    object pnlCardAbertas: TPanel
      AlignWithMargins = True
      Left = 6
      Top = 6
      Width = 254
      Height = 72
      Margins.Left = 6
      Margins.Top = 6
      Margins.Right = 6
      Margins.Bottom = 6
      Align = alClient
      BevelOuter = bvNone
      Color = 16247773
      ParentBackground = False
      TabOrder = 0
      object lblTituloAbertas: TLabel
        Left = 0
        Top = 0
        Width = 254
        Height = 24
        Align = alTop
        Alignment = taCenter
        AutoSize = False
        Caption = 'Abertas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 8143884
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Layout = tlCenter
      end
      object lblAbertas: TLabel
        Left = 0
        Top = 24
        Width = 254
        Height = 48
        Align = alClient
        Alignment = taCenter
        AutoSize = False
        Caption = '0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 8143884
        Font.Height = -27
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Layout = tlCenter
        ExplicitLeft = 3
        ExplicitTop = 30
      end
    end
    object pnlCardEmAndamento: TPanel
      AlignWithMargins = True
      Left = 272
      Top = 6
      Width = 254
      Height = 72
      Margins.Left = 6
      Margins.Top = 6
      Margins.Right = 6
      Margins.Bottom = 6
      Align = alClient
      BevelOuter = bvNone
      Color = 13497343
      ParentBackground = False
      TabOrder = 1
      object lblTituloEmAndamento: TLabel
        Left = 0
        Top = 0
        Width = 254
        Height = 24
        Align = alTop
        Alignment = taCenter
        AutoSize = False
        Caption = 'Em andamento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 287877
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Layout = tlCenter
      end
      object lblEmAndamento: TLabel
        Left = 0
        Top = 24
        Width = 254
        Height = 48
        Align = alClient
        Alignment = taCenter
        AutoSize = False
        Caption = '0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 287877
        Font.Height = -27
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Layout = tlCenter
        ExplicitLeft = 3
      end
    end
    object pnlCardConcluidas: TPanel
      AlignWithMargins = True
      Left = 538
      Top = 6
      Width = 254
      Height = 72
      Margins.Left = 6
      Margins.Top = 6
      Margins.Right = 6
      Margins.Bottom = 6
      Align = alClient
      BevelOuter = bvNone
      Color = 14348258
      ParentBackground = False
      TabOrder = 2
      object lblTituloConcluidas: TLabel
        Left = 0
        Top = 0
        Width = 254
        Height = 24
        Align = alTop
        Alignment = taCenter
        AutoSize = False
        Caption = 'Conclu'#237'das'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 2381589
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Layout = tlCenter
      end
      object lblConcluidas: TLabel
        Left = 0
        Top = 24
        Width = 254
        Height = 48
        Align = alClient
        Alignment = taCenter
        AutoSize = False
        Caption = '0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 2381589
        Font.Height = -27
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Layout = tlCenter
        ExplicitLeft = 3
      end
    end
    object pnlCardEmAtraso: TPanel
      AlignWithMargins = True
      Left = 804
      Top = 6
      Width = 255
      Height = 72
      Margins.Left = 6
      Margins.Top = 6
      Margins.Right = 6
      Margins.Bottom = 6
      Align = alClient
      BevelOuter = bvNone
      Color = 14342136
      ParentBackground = False
      TabOrder = 3
      object lblTituloEmAtraso: TLabel
        Left = 0
        Top = 0
        Width = 255
        Height = 24
        Align = alTop
        Alignment = taCenter
        AutoSize = False
        Caption = 'Em atraso'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 2366578
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Layout = tlCenter
      end
      object lblEmAtraso: TLabel
        Left = 0
        Top = 24
        Width = 255
        Height = 48
        Align = alClient
        Alignment = taCenter
        AutoSize = False
        Caption = '0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 2366578
        Font.Height = -27
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Layout = tlCenter
      end
    end
  end
  object GbxFiltros: TGroupBox
    AlignWithMargins = True
    Left = 12
    Top = 108
    Width = 1065
    Height = 135
    Margins.Left = 12
    Margins.Top = 0
    Margins.Right = 12
    Margins.Bottom = 12
    Align = alTop
    Caption = 'Filtros'
    TabOrder = 1
    DesignSize = (
      1065
      135)
    object lblFiltroStatus: TLabel
      Left = 400
      Top = 24
      Width = 31
      Height = 13
      Caption = 'Status'
    end
    object lblFiltroCliente: TLabel
      Left = 584
      Top = 24
      Width = 33
      Height = 13
      Caption = 'Cliente'
    end
    object lblValorMin: TLabel
      Left = 16
      Top = 76
      Width = 83
      Height = 13
      Caption = 'Valor m'#237'nimo (R$)'
    end
    object lblValorMax: TLabel
      Left = 208
      Top = 76
      Width = 87
      Height = 13
      Caption = 'Valor m'#225'ximo (R$)'
    end
    object chkDataIni: TCheckBox
      Left = 16
      Top = 22
      Width = 150
      Height = 17
      Caption = 'Data inicial'
      TabOrder = 0
    end
    object dtpDataIni: TDateTimePicker
      Left = 16
      Top = 42
      Width = 170
      Height = 21
      Date = 46301.000000000000000000
      Time = 0.835166655095235900
      TabOrder = 1
    end
    object chkDataFim: TCheckBox
      Left = 208
      Top = 22
      Width = 150
      Height = 17
      Caption = 'Data final'
      TabOrder = 2
    end
    object dtpDataFim: TDateTimePicker
      Left = 208
      Top = 42
      Width = 170
      Height = 21
      Date = 46301.000000000000000000
      Time = 0.837035763892345100
      TabOrder = 3
    end
    object cboFiltroStatus: TComboBox
      Left = 400
      Top = 42
      Width = 160
      Height = 21
      Style = csDropDownList
      TabOrder = 4
    end
    object edtCliente: TEdit
      Left = 584
      Top = 42
      Width = 465
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 5
    end
    object edtValorMin: TEdit
      Left = 16
      Top = 94
      Width = 170
      Height = 21
      TabOrder = 6
    end
    object edtValorMax: TEdit
      Left = 208
      Top = 94
      Width = 170
      Height = 21
      TabOrder = 7
    end
    object btnPesquisar: TButton
      Left = 400
      Top = 91
      Width = 110
      Height = 27
      Caption = 'Pesquisar'
      TabOrder = 8
      OnClick = btnPesquisarClick
    end
    object btnLimpar: TButton
      Left = 524
      Top = 91
      Width = 110
      Height = 27
      Caption = 'Limpar'
      TabOrder = 9
      OnClick = btnLimparClick
    end
  end
  object pnlbotoes: TPanel
    AlignWithMargins = True
    Left = 12
    Top = 656
    Width = 1065
    Height = 40
    Margins.Left = 12
    Margins.Top = 12
    Margins.Right = 12
    Margins.Bottom = 12
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    object btnNovaOS: TButton
      Left = 0
      Top = 4
      Width = 110
      Height = 32
      Caption = 'Nova OS'
      TabOrder = 0
      OnClick = btnNovaOSClick
    end
    object btnEditarOS: TButton
      Left = 124
      Top = 4
      Width = 110
      Height = 32
      Caption = 'Editar OS'
      TabOrder = 1
      OnClick = btnEditarOSClick
    end
    object btnProcessarAtrasos: TButton
      Left = 248
      Top = 4
      Width = 130
      Height = 32
      Caption = 'Processar Atrasos'
      TabOrder = 2
    end
  end
  object dbgOS: TDBGrid
    AlignWithMargins = True
    Left = 12
    Top = 255
    Width = 1065
    Height = 389
    Margins.Left = 12
    Margins.Top = 0
    Margins.Right = 12
    Margins.Bottom = 0
    Align = alClient
    DataSource = dsOSLista
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ReadOnly = True
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDrawColumnCell = dbgOSDrawColumnCell
    Columns = <
      item
        Expanded = False
        FieldName = 'ID'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CLIENTE_NOME'
        Title.Caption = 'Cliente'
        Width = 300
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DATA_ABERTURA'
        Title.Caption = 'Abertura'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DATA_PREVISTA'
        Title.Caption = 'Prevista'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'STATUS'
        Title.Caption = 'Status'
        Width = 120
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'VALOR_TOTAL'
        Title.Alignment = taRightJustify
        Title.Caption = 'Valor (R$)'
        Width = 110
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'EM_ATRASO'
        Title.Alignment = taCenter
        Title.Caption = 'Atraso'
        Width = 70
        Visible = True
      end>
  end
  object dsOSLista: TDataSource
    DataSet = DM_OrdemServico.qryOSLista
    Left = 864
    Top = 440
  end
end
