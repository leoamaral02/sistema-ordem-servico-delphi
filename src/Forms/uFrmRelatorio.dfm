object FrmRelatorio: TFrmRelatorio
  Left = 0
  Top = 0
  Caption = 'Relat'#243'rio de Ordens de Servi'#231'o'
  ClientHeight = 360
  ClientWidth = 820
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
  object GbxFiltros: TGroupBox
    AlignWithMargins = True
    Left = 12
    Top = 12
    Width = 796
    Height = 250
    Margins.Left = 12
    Margins.Top = 12
    Margins.Right = 12
    Margins.Bottom = 12
    Align = alTop
    Caption = 'Filtros do relat'#243'rio'
    TabOrder = 0
    DesignSize = (
      796
      250)
    object lblStatus: TLabel
      Left = 24
      Top = 86
      Width = 31
      Height = 13
      Caption = 'Status'
    end
    object lblCliente: TLabel
      Left = 24
      Top = 148
      Width = 33
      Height = 13
      Caption = 'Cliente'
    end
    object lblValorMin: TLabel
      Left = 24
      Top = 196
      Width = 83
      Height = 13
      Caption = 'Valor m'#237'nimo (R$)'
    end
    object lblValorMax: TLabel
      Left = 216
      Top = 196
      Width = 87
      Height = 13
      Caption = 'Valor m'#225'ximo (R$)'
    end
    object chkDataIni: TCheckBox
      Left = 24
      Top = 24
      Width = 150
      Height = 17
      Caption = 'Data inicial'
      TabOrder = 0
    end
    object dtpDataIni: TDateTimePicker
      Left = 24
      Top = 44
      Width = 170
      Height = 21
      Date = 46301.000000000000000000
      Time = 0.835166655095235900
      TabOrder = 1
    end
    object chkDataFim: TCheckBox
      Left = 216
      Top = 24
      Width = 150
      Height = 17
      Caption = 'Data final'
      TabOrder = 2
    end
    object dtpDataFim: TDateTimePicker
      Left = 216
      Top = 44
      Width = 170
      Height = 21
      Date = 46301.000000000000000000
      Time = 0.837035763892345100
      TabOrder = 3
    end
    object chkAberta: TCheckBox
      Left = 24
      Top = 106
      Width = 110
      Height = 17
      Caption = 'Aberta'
      TabOrder = 4
    end
    object chkEmAndamento: TCheckBox
      Left = 128
      Top = 106
      Width = 110
      Height = 17
      Caption = 'Em Andamento'
      TabOrder = 5
    end
    object chkConcluida: TCheckBox
      Left = 264
      Top = 106
      Width = 110
      Height = 17
      Caption = 'Conclu'#237'da'
      TabOrder = 6
    end
    object chkCancelada: TCheckBox
      Left = 384
      Top = 106
      Width = 110
      Height = 17
      Caption = 'Cancelada'
      TabOrder = 7
    end
    object edtCliente: TEdit
      Left = 24
      Top = 167
      Width = 748
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 8
      TextHint = 'Parte do nome do cliente'
    end
    object edtValorMin: TEdit
      Left = 24
      Top = 215
      Width = 170
      Height = 21
      TabOrder = 9
    end
    object edtValorMax: TEdit
      Left = 216
      Top = 215
      Width = 170
      Height = 21
      TabOrder = 10
    end
  end
  object pnlBotoes: TPanel
    AlignWithMargins = True
    Left = 12
    Top = 298
    Width = 796
    Height = 50
    Margins.Left = 12
    Margins.Top = 12
    Margins.Right = 12
    Margins.Bottom = 12
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object btnVisualizar: TButton
      Left = 0
      Top = 8
      Width = 130
      Height = 32
      Caption = 'Visualizar'
      TabOrder = 0
      OnClick = btnVisualizarClick
    end
    object btnPDF: TButton
      Left = 144
      Top = 8
      Width = 130
      Height = 32
      Caption = 'Exportar PDF'
      TabOrder = 1
      OnClick = btnPDFClick
    end
    object btnCSV: TButton
      Left = 288
      Top = 8
      Width = 130
      Height = 32
      Caption = 'Exportar CSV'
      TabOrder = 2
      OnClick = btnCSVClick
    end
  end
  object frxReport1: TfrxReport
    Version = '6.9.14'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick, pbCopy, pbSelection]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Padr'#227'o'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 46302.031973240700000000
    ReportOptions.LastChange = 46302.536736064820000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      'begin'
      ''
      'end.')
    Left = 476
    Top = 44
    Datasets = <
      item
        DataSet = frxDBOS
        DataSetName = 'frxDBOS'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Frame.Typ = []
      MirrorMode = []
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 41.574830000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo23: TfrxMemoView
          AllowVectorExport = True
          Left = 151.181200000000000000
          Top = 3.779530000000000000
          Width = 404.409710000000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'RELAT'#211'RIO DE ORDENS DE SERVI'#199'O')
          ParentFont = False
        end
      end
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 41.574830000000000000
        Top = 83.149660000000000000
        Width = 718.110700000000000000
        object Memo11: TfrxMemoView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Width = 143.622140000000000000
          Height = 18.897650000000000000
          DisplayFormat.Kind = fkDateTime
          Frame.Typ = []
          Memo.UTF8W = (
            'Emitido em: [Date]')
        end
        object Memo12: TfrxMemoView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Top = 22.677180000000000000
          Width = 22.677180000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            'ID')
        end
        object Memo13: TfrxMemoView
          AllowVectorExport = True
          Left = 64.252010000000000000
          Top = 22.677180000000000000
          Width = 188.976500000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            'Cliente')
        end
        object Memo14: TfrxMemoView
          AllowVectorExport = True
          Left = 266.787570000000000000
          Top = 22.677180000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            'Abertura')
        end
        object Memo15: TfrxMemoView
          AllowVectorExport = True
          Left = 461.102660000000000000
          Top = 22.677180000000000000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            'Status')
        end
        object Memo16: TfrxMemoView
          AllowVectorExport = True
          Left = 559.370440000000000000
          Top = 22.677180000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            'Valor')
        end
        object Memo17: TfrxMemoView
          AllowVectorExport = True
          Left = 638.740570000000000000
          Top = 22.677180000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            'Dias Atraso')
        end
        object Memo18: TfrxMemoView
          AllowVectorExport = True
          Left = 360.275820000000000000
          Top = 22.677180000000000000
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            'Prevista')
        end
      end
      object GroupHeader1: TfrxGroupHeader
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 15.118120000000000000
        Top = 185.196970000000000000
        Width = 718.110700000000000000
        Condition = 'frxDBOS."STATUS"'
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 56.692950000000000000
        Top = 222.992270000000000000
        Width = 718.110700000000000000
        DataSet = frxDBOS
        DataSetName = 'frxDBOS'
        RowCount = 0
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Top = 15.118120000000000000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBOS."ID"]')
        end
        object Memo3: TfrxMemoView
          AllowVectorExport = True
          Left = 64.252010000000000000
          Top = 15.118120000000000000
          Width = 188.976500000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBOS."CLIENTE_NOME"]')
        end
        object Memo4: TfrxMemoView
          AllowVectorExport = True
          Left = 260.787570000000000000
          Top = 15.118120000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            '[FormatDateTime('#39'dd/mm/yyyy'#39', <frxDBOS."DATA_ABERTURA">)]')
        end
        object Memo5: TfrxMemoView
          AllowVectorExport = True
          Left = 362.834880000000000000
          Top = 15.118120000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            
              '[IIF(<frxDBOS."DATA_PREVISTA"> = Null, '#39#39', FormatDateTime('#39'dd/mm' +
              '/yyyy'#39', <frxDBOS."DATA_PREVISTA">))]')
        end
        object Memo6: TfrxMemoView
          AllowVectorExport = True
          Left = 457.323130000000000000
          Top = 15.118120000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBOS."STATUS"]')
        end
        object Memo7: TfrxMemoView
          AllowVectorExport = True
          Left = 559.370440000000000000
          Top = 15.118120000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            '[FormatFloat('#39'#,##0.00'#39', <frxDBOS."VALOR_TOTAL">)]')
        end
        object Line1: TfrxLineView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Top = 41.574830000000000000
          Width = 710.551640000000000000
          Color = clBlack
          Frame.Typ = []
          Diagonal = True
        end
        object Memo8: TfrxMemoView
          AllowVectorExport = True
          Left = 653.858690000000000000
          Top = 15.118120000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            
              '[IIF(<frxDBOS."EM_ATRASO"> = 1, IntToStr(Trunc(Date) - Trunc(<fr' +
              'xDBOS."DATA_PREVISTA">)) + '#39' dias'#39', '#39'-'#39')]')
        end
      end
      object GroupFooter1: TfrxGroupFooter
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 41.574830000000000000
        Top = 302.362400000000000000
        Width = 718.110700000000000000
        object Memo9: TfrxMemoView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Top = 3.779530000000000000
          Width = 321.260050000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Total de OS neste status: [COUNT(MasterData1)]')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          AllowVectorExport = True
          Left = 422.102660000000000000
          Top = 3.779530000000000000
          Width = 230.551330000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            
              'Soma dos valores: R$ [FormatFloat('#39'#,##0.00'#39', SUM(<frxDBOS."VALO' +
              'R_TOTAL">, MasterData1))]')
          ParentFont = False
        end
      end
      object ReportSummary1: TfrxReportSummary
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 154.960730000000000000
        Top = 404.409710000000000000
        Width = 718.110700000000000000
        object Memo19: TfrxMemoView
          AllowVectorExport = True
          Left = 7.559060000000000000
          Top = 18.779530000000000000
          Width = 166.299320000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'RESUMO GERAL')
          ParentFont = False
        end
        object Memo20: TfrxMemoView
          AllowVectorExport = True
          Left = 7.559060000000000000
          Top = 43.015770000000000000
          Width = 377.953000000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            'Total de Ordens de Servi'#231'o: [COUNT(MasterData1)]')
        end
        object Memo21: TfrxMemoView
          AllowVectorExport = True
          Left = 7.559060000000000000
          Top = 68.031540000000000000
          Width = 377.953000000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            
              'Soma total: R$ [FormatFloat('#39'#,##0.00'#39', SUM(<frxDBOS."VALOR_TOTA' +
              'L">, MasterData1))]')
        end
        object Memo22: TfrxMemoView
          AllowVectorExport = True
          Left = 8.338590000000000000
          Top = 93.826840000000000000
          Width = 377.953000000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            'OS atrasadas: [SUM(<frxDBOS."EM_ATRASO">, MasterData1)]')
        end
      end
    end
  end
  object SaveDialog1: TSaveDialog
    Left = 476
    Top = 124
  end
  object frxPDFExport1: TfrxPDFExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    DataOnly = False
    EmbedFontsIfProtected = False
    InteractiveFormsFontSubset = 'A-Z,a-z,0-9,#43-#47 '
    OpenAfterExport = False
    PrintOptimized = False
    Outline = False
    Background = False
    HTMLTags = True
    Quality = 95
    Transparency = False
    Author = 'FastReport'
    Subject = 'FastReport PDF export'
    ProtectionFlags = [ePrint, eModify, eCopy, eAnnot]
    HideToolbar = False
    HideMenubar = False
    HideWindowUI = False
    FitWindow = False
    CenterWindow = False
    PrintScaling = False
    PdfA = False
    PDFStandard = psNone
    PDFVersion = pv17
    Left = 668
    Top = 52
  end
  object frxDBOS: TfrxDBDataset
    UserName = 'frxDBOS'
    CloseDataSource = False
    DataSet = DM_OrdemServico.qryRelatorio
    BCDToCurrency = False
    Left = 668
    Top = 116
  end
end
