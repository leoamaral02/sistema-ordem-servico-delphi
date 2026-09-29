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
    Left = 32
    Top = 48
    Width = 769
    Height = 265
    Caption = 'Dados do Cliente'
    TabOrder = 0
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
      Caption = 'Telefone :'
    end
    object Label2: TLabel
      Left = 453
      Top = 50
      Width = 61
      Height = 13
      Caption = 'Documento :'
    end
    object edtnome: TEdit
      Left = 34
      Top = 69
      Width = 383
      Height = 21
      TabOrder = 0
    end
    object edtemail: TEdit
      Left = 34
      Top = 127
      Width = 383
      Height = 21
      TabOrder = 1
    end
    object edttelefone: TEdit
      Left = 450
      Top = 127
      Width = 281
      Height = 21
      TabOrder = 2
    end
    object edtdocumento: TEdit
      Left = 450
      Top = 69
      Width = 281
      Height = 21
      TabOrder = 3
    end
    object btnnovo: TButton
      Left = 110
      Top = 192
      Width = 99
      Height = 33
      Caption = 'Novo'
      TabOrder = 4
      OnClick = btnnovoClick
    end
    object btneditar: TButton
      Left = 246
      Top = 192
      Width = 99
      Height = 33
      Caption = 'Editar'
      TabOrder = 5
    end
    object btnsalvar: TButton
      Left = 382
      Top = 192
      Width = 99
      Height = 33
      Caption = 'Salvar'
      TabOrder = 6
      OnClick = btnsalvarClick
    end
    object btnexcluir: TButton
      Left = 518
      Top = 192
      Width = 99
      Height = 33
      Caption = 'Excluir'
      TabOrder = 7
      OnClick = btnexcluirClick
    end
  end
  object GroupBox2: TGroupBox
    Left = 32
    Top = 336
    Width = 769
    Height = 249
    Caption = 'Buscar Clientes'
    TabOrder = 1
    object edtbuscar: TEdit
      Left = 37
      Top = 34
      Width = 540
      Height = 21
      TabOrder = 0
    end
    object btnbuscar: TButton
      Left = 606
      Top = 28
      Width = 99
      Height = 33
      Caption = 'Buscar'
      TabOrder = 1
      OnClick = btnbuscarClick
    end
    object dbgClientes: TDBGrid
      Left = 37
      Top = 88
      Width = 671
      Height = 120
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
