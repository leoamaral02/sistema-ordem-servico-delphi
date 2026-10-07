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
    Height = 200
    Margins.Left = 12
    Margins.Top = 12
    Margins.Right = 12
    Margins.Bottom = 12
    Align = alTop
    Caption = 'Dados do cliente'
    TabOrder = 0
    DesignSize = (
      810
      200)
    object Label1: TLabel
      Left = 24
      Top = 26
      Width = 27
      Height = 13
      Caption = 'Nome'
    end
    object Label2: TLabel
      Left = 448
      Top = 26
      Width = 84
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Documento (CPF)'
    end
    object Label3: TLabel
      Left = 24
      Top = 82
      Width = 28
      Height = 13
      Caption = 'E-mail'
    end
    object Label4: TLabel
      Left = 448
      Top = 82
      Width = 42
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Telefone'
    end
    object edtnome: TEdit
      Left = 24
      Top = 45
      Width = 400
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
    end
    object edtdocumento: TEdit
      Left = 448
      Top = 45
      Width = 334
      Height = 21
      Anchors = [akTop, akRight]
      MaxLength = 11
      TabOrder = 1
      TextHint = 'Somente n'#250'meros'
    end
    object edtemail: TEdit
      Left = 24
      Top = 101
      Width = 400
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
    end
    object edttelefone: TEdit
      Left = 448
      Top = 101
      Width = 334
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 3
    end
    object btnnovo: TButton
      Left = 24
      Top = 148
      Width = 104
      Height = 32
      Caption = 'Novo'
      TabOrder = 4
      OnClick = btnnovoClick
    end
    object btnsalvar: TButton
      Left = 144
      Top = 148
      Width = 104
      Height = 32
      Caption = 'Salvar'
      TabOrder = 5
      OnClick = btnsalvarClick
    end
    object btnexcluir: TButton
      Left = 264
      Top = 148
      Width = 104
      Height = 32
      Caption = 'Excluir'
      TabOrder = 6
      OnClick = btnexcluirClick
    end
  end
  object GroupBox2: TGroupBox
    AlignWithMargins = True
    Left = 12
    Top = 224
    Width = 810
    Height = 377
    Margins.Left = 12
    Margins.Top = 0
    Margins.Right = 12
    Margins.Bottom = 12
    Align = alClient
    Caption = 'Buscar clientes'
    TabOrder = 1
    DesignSize = (
      810
      377)
    object edtbuscar: TEdit
      Left = 24
      Top = 31
      Width = 624
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      TextHint = 'Digite parte do nome do cliente'
    end
    object btnbuscar: TButton
      Left = 672
      Top = 28
      Width = 110
      Height = 27
      Anchors = [akTop, akRight]
      Caption = 'Buscar'
      TabOrder = 1
      OnClick = btnbuscarClick
    end
    object dbgClientes: TDBGrid
      Left = 24
      Top = 72
      Width = 758
      Height = 285
      Anchors = [akLeft, akTop, akRight, akBottom]
      DataSource = dsClienteLista
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      ReadOnly = True
      TabOrder = 2
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'ID'
          Width = 50
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOME'
          Title.Caption = 'Nome'
          Width = 220
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DOCUMENTO'
          Title.Caption = 'Documento'
          Width = 110
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'EMAIL'
          Title.Caption = 'E-mail'
          Width = 220
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TELEFONE'
          Title.Caption = 'Telefone'
          Width = 110
          Visible = True
        end>
    end
  end
  object dsClienteLista: TDataSource
    DataSet = DM_Cliente.qryClienteLista
    OnDataChange = dsClienteListaDataChange
    Left = 656
    Top = 480
  end
end
