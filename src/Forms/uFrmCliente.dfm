object FrmCliente: TFrmCliente
  Left = 0
  Top = 0
  Caption = 'Clientes'
  ClientHeight = 613
  ClientWidth = 834
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
  object GroupBox1: TGroupBox
    AlignWithMargins = True
    Left = 12
    Top = 12
    Width = 810
    Height = 265
    Margins.Left = 12
    Margins.Top = 12
    Margins.Right = 12
    Margins.Bottom = 12
    Align = alTop
    Caption = 'Dados do Cliente'
    TabOrder = 0
    ExplicitLeft = 17
    DesignSize = (
      810
      265)
    object Label1: TLabel
      Left = 37
      Top = 50
      Width = 34
      Height = 13
      Caption = 'Nome :'
    end
    object Label3: TLabel
      Left = 38
      Top = 108
      Width = 31
      Height = 13
      Caption = 'Email :'
    end
    object Label4: TLabel
      Left = 453
      Top = 108
      Width = 49
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Telefone :'
    end
    object Label2: TLabel
      Left = 453
      Top = 50
      Width = 61
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Documento :'
    end
    object edtnome: TEdit
      Left = 34
      Top = 69
      Width = 327
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
    end
    object edtemail: TEdit
      Left = 34
      Top = 127
      Width = 327
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
    end
    object edttelefone: TEdit
      Left = 450
      Top = 127
      Width = 281
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 2
    end
    object edtdocumento: TEdit
      Left = 450
      Top = 69
      Width = 281
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 3
    end
    object btnnovo: TButton
      Left = 34
      Top = 192
      Width = 99
      Height = 33
      Anchors = [akTop, akBottom]
      Caption = 'Novo'
      TabOrder = 4
      OnClick = btnnovoClick
    end
    object btnsalvar: TButton
      Left = 158
      Top = 192
      Width = 99
      Height = 33
      Anchors = [akTop, akBottom]
      Caption = 'Salvar'
      TabOrder = 5
      OnClick = btnsalvarClick
    end
    object btnexcluir: TButton
      Left = 263
      Top = 192
      Width = 99
      Height = 33
      Anchors = [akTop, akBottom]
      Caption = 'Excluir'
      TabOrder = 6
      OnClick = btnexcluirClick
    end
  end
  object GroupBox2: TGroupBox
    AlignWithMargins = True
    Left = 12
    Top = 301
    Width = 810
    Height = 300
    Margins.Left = 12
    Margins.Top = 12
    Margins.Right = 12
    Margins.Bottom = 12
    Align = alClient
    Anchors = [akLeft, akTop, akRight]
    Caption = 'Buscar Clientes'
    TabOrder = 1
    ExplicitLeft = 34
    ExplicitTop = 336
    ExplicitWidth = 769
    ExplicitHeight = 249
    DesignSize = (
      810
      300)
    object edtbuscar: TEdit
      Left = 37
      Top = 34
      Width = 540
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
    end
    object btnbuscar: TButton
      Left = 609
      Top = 28
      Width = 99
      Height = 33
      Anchors = [akTop, akRight]
      Caption = 'Buscar'
      TabOrder = 1
      OnClick = btnbuscarClick
    end
    object dbgClientes: TDBGrid
      Left = 37
      Top = 88
      Width = 671
      Height = 145
      Anchors = [akLeft, akTop, akRight, akBottom]
      DataSource = dsClienteLista
      TabOrder = 2
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
    end
  end
  object dsClienteLista: TDataSource
    DataSet = DM_Cliente.qryClienteLista
    OnDataChange = dsClienteListaDataChange
    Left = 656
    Top = 480
  end
end
