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
    Left = 232
    Top = 136
  end
  object qryItensEscrita: TFDQuery
    Connection = DM_Conexao.FDConexao
    Left = 320
    Top = 128
  end
end
