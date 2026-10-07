object DM_OrdemServico: TDM_OrdemServico
  OldCreateOrder = False
  Height = 291
  Width = 455
  object qryOSLista: TFDQuery
    Connection = DM_Conexao.FDConexao
    SQL.Strings = (
      
        'SELECT ID, CLIENTE_ID, CLIENTE_NOME, DATA_ABERTURA, DATA_PREVIST' +
        'A, DATA_FECHAMENTO,'
      '       STATUS, VALOR_TOTAL, EM_ATRASO'
      'FROM VW_OS_RESUMO'
      'WHERE (:DATAINI IS NULL OR DATA_ABERTURA >= :DATAINI)'
      '  AND (:DATAFIM IS NULL OR DATA_ABERTURA <= :DATAFIM)'
      '  AND (:STATUS IS NULL OR STATUS = :STATUS)'
      '  AND (:CLIENTE IS NULL OR CLIENTE_NOME LIKE :CLIENTE)'
      '  AND (:VALORMIN IS NULL OR VALOR_TOTAL >= :VALORMIN)'
      '  AND (:VALORMAX IS NULL OR VALOR_TOTAL <= :VALORMAX)'
      'ORDER BY DATA_ABERTURA DESC')
    Left = 32
    Top = 32
    ParamData = <
      item
        Name = 'DATAINI'
        DataType = ftFixedChar
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'DATAFIM'
        DataType = ftFixedChar
        ParamType = ptInput
      end
      item
        Name = 'STATUS'
        DataType = ftFixedChar
        ParamType = ptInput
      end
      item
        Name = 'CLIENTE'
        DataType = ftFixedChar
        ParamType = ptInput
      end
      item
        Name = 'VALORMIN'
        DataType = ftFixedChar
        ParamType = ptInput
      end
      item
        Name = 'VALORMAX'
        DataType = ftFixedChar
        ParamType = ptInput
      end>
  end
  object qryOSEscrita: TFDQuery
    Connection = DM_Conexao.FDConexao
    Left = 104
    Top = 32
  end
  object qryItensLista: TFDQuery
    Connection = DM_Conexao.FDConexao
    Left = 264
    Top = 24
  end
  object qryItensEscrita: TFDQuery
    Connection = DM_Conexao.FDConexao
    Left = 352
    Top = 24
  end
  object qryDashboard: TFDQuery
    Connection = DM_Conexao.FDConexao
    SQL.Strings = (
      'SELECT'
      
        '  SUM(CASE WHEN STATUS = '#39'Aberta'#39' THEN 1 ELSE 0 END) AS QTD_ABER' +
        'TAS,'
      
        '  SUM(CASE WHEN STATUS = '#39'Em Andamento'#39' THEN 1 ELSE 0 END) AS QT' +
        'D_EM_ANDAMENTO,'
      
        '  SUM(CASE WHEN STATUS = '#39'Conclu'#237'da'#39' THEN 1 ELSE 0 END) AS QTD_C' +
        'ONCLUIDAS,'
      
        '  SUM(CASE WHEN EM_ATRASO = 1 THEN 1 ELSE 0 END) AS QTD_EM_ATRAS' +
        'O'
      'FROM VW_OS_RESUMO')
    Left = 80
    Top = 168
  end
  object qryRelatorio: TFDQuery
    Connection = DM_Conexao.FDConexao
    SQL.Strings = (
      'SELECT '
      '  ID, '
      '  CLIENTE_NOME, '
      '  DATA_ABERTURA, '
      '  DATA_PREVISTA, '
      '  STATUS, '
      '  VALOR_TOTAL, '
      '  EM_ATRASO'
      'FROM VW_OS_RESUMO'
      'WHERE 1 = 0')
    Left = 264
    Top = 160
    object qryRelatorioID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
    end
    object qryRelatorioCLIENTE_NOME: TWideStringField
      FieldName = 'CLIENTE_NOME'
      Origin = 'CLIENTE_NOME'
      Size = 120
    end
    object qryRelatorioDATA_ABERTURA: TDateField
      FieldName = 'DATA_ABERTURA'
      Origin = 'DATA_ABERTURA'
    end
    object qryRelatorioDATA_PREVISTA: TDateField
      FieldName = 'DATA_PREVISTA'
      Origin = 'DATA_PREVISTA'
    end
    object qryRelatorioSTATUS: TWideStringField
      FieldName = 'STATUS'
      Origin = 'STATUS'
      Size = 15
    end
    object qryRelatorioVALOR_TOTAL: TFMTBCDField
      FieldName = 'VALOR_TOTAL'
      Origin = 'VALOR_TOTAL'
      Precision = 18
      Size = 2
    end
    object qryRelatorioEM_ATRASO: TIntegerField
      FieldName = 'EM_ATRASO'
      Origin = 'EM_ATRASO'
    end
  end
end
