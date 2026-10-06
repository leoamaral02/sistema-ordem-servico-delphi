object FrmOrdemServico: TFrmOrdemServico
  Left = 0
  Top = 0
  Caption = 'Ordem de Servi'#231'o'
  ClientHeight = 820
  ClientWidth = 1024
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
  object pnlTopo: TPanel
    Left = 0
    Top = 0
    Width = 1024
    Height = 50
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitTop = -6
    object btnNovo: TButton
      Left = 16
      Top = 10
      Width = 90
      Height = 30
      Caption = 'Novo'
      TabOrder = 0
      OnClick = btnNovoClick
    end
    object btnSalvarOS: TButton
      Left = 120
      Top = 10
      Width = 100
      Height = 30
      Caption = 'Salvar'
      TabOrder = 1
      OnClick = btnSalvarOSClick
    end
    object btnCancelarOS: TButton
      Left = 226
      Top = 10
      Width = 100
      Height = 30
      Caption = 'Cancelar'
      TabOrder = 2
      OnClick = btnCancelarOSClick
    end
  end
  object pnlAlertaAtraso: TPanel
    Left = 0
    Top = 50
    Width = 1024
    Height = 32
    Align = alTop
    BevelOuter = bvNone
    Caption = #9888' Em atraso'
    Color = clSkyBlue
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    Visible = False
    ExplicitTop = 47
  end
  object GbxDadosOS: TGroupBox
    AlignWithMargins = True
    Left = 12
    Top = 94
    Width = 1000
    Height = 146
    Margins.Left = 12
    Margins.Top = 12
    Margins.Right = 12
    Margins.Bottom = 12
    Align = alTop
    Caption = 'Dados da OS'
    TabOrder = 2
    DesignSize = (
      1000
      146)
    object Label1: TLabel
      Left = 37
      Top = 13
      Width = 33
      Height = 13
      Caption = 'Cliente'
    end
    object Label3: TLabel
      Left = 37
      Top = 77
      Width = 83
      Height = 13
      Caption = 'Data de abertura'
    end
    object Label4: TLabel
      Left = 341
      Top = 77
      Width = 65
      Height = 13
      Caption = 'Data prevista'
    end
    object Label5: TLabel
      Left = 613
      Top = 77
      Width = 38
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'STATUS'
    end
    object cboCliente: TDBLookupComboBox
      Left = 37
      Top = 32
      Width = 490
      Height = 21
      KeyField = 'ID'
      ListField = 'NOME'
      ListSource = dsClienteCombo
      TabOrder = 0
    end
    object dtpAbertura: TDateTimePicker
      Left = 37
      Top = 96
      Width = 186
      Height = 21
      Date = 46299.000000000000000000
      Time = 0.961759895835712100
      TabOrder = 1
    end
    object dtpPrevista: TDateTimePicker
      Left = 341
      Top = 96
      Width = 186
      Height = 21
      Date = 46299.000000000000000000
      Time = 0.961759895835712100
      TabOrder = 2
    end
    object cboStatus: TComboBox
      Left = 613
      Top = 96
      Width = 145
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 3
    end
  end
  object GbxDescricao: TGroupBox
    AlignWithMargins = True
    Left = 12
    Top = 264
    Width = 1000
    Height = 129
    Margins.Left = 12
    Margins.Top = 12
    Margins.Right = 12
    Margins.Bottom = 12
    Align = alTop
    Caption = 'Descri'#231#227'o'
    TabOrder = 3
    DesignSize = (
      1000
      129)
    object Memo1: TMemo
      Left = 37
      Top = 24
      Width = 926
      Height = 90
      Anchors = [akLeft, akTop, akRight]
      Lines.Strings = (
        'Memo1')
      TabOrder = 0
    end
  end
  object GbxItens: TGroupBox
    AlignWithMargins = True
    Left = 12
    Top = 417
    Width = 1000
    Height = 391
    Margins.Left = 12
    Margins.Top = 12
    Margins.Right = 12
    Margins.Bottom = 12
    Align = alClient
    Caption = 'Itens'
    TabOrder = 4
    ExplicitLeft = 17
    ExplicitTop = 433
    DesignSize = (
      1000
      391)
    object Label6: TLabel
      Left = 37
      Top = 24
      Width = 84
      Height = 13
      Caption = 'Descri'#231#227'o do item'
    end
    object Label7: TLabel
      Left = 379
      Top = 24
      Width = 56
      Height = 13
      Caption = 'Quantidade'
    end
    object Label8: TLabel
      Left = 528
      Top = 24
      Width = 64
      Height = 13
      Caption = 'Valor Unitario'
    end
    object lblValorTotal: TLabel
      Left = 781
      Top = 286
      Width = 164
      Height = 19
      Alignment = taRightJustify
      Anchors = [akRight, akBottom]
      Caption = 'Valor Total: R$ 0,00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Layout = tlCenter
    end
    object edtItemDescricao: TEdit
      Left = 37
      Top = 43
      Width = 283
      Height = 21
      TabOrder = 0
    end
    object edtItemQuantidade: TEdit
      Left = 379
      Top = 43
      Width = 79
      Height = 21
      TabOrder = 1
    end
    object edtItemValorUnitario: TEdit
      Left = 528
      Top = 43
      Width = 99
      Height = 21
      TabOrder = 2
    end
    object btnAdicionarItem: TButton
      Left = 658
      Top = 41
      Width = 91
      Height = 25
      Caption = 'Adicionar Item'
      TabOrder = 3
      OnClick = btnAdicionarItemClick
    end
    object dbgItens: TDBGrid
      Left = 37
      Top = 96
      Width = 926
      Height = 184
      Anchors = [akLeft, akTop, akRight, akBottom]
      DataSource = dsItens
      TabOrder = 4
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
    end
  end
  object dsClienteCombo: TDataSource
    DataSet = DM_Cliente.qryClienteComboLista
    Left = 560
    Top = 125
  end
  object mtItens: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 864
    Top = 507
  end
  object dsItens: TDataSource
    DataSet = mtItens
    Left = 928
    Top = 527
  end
end
