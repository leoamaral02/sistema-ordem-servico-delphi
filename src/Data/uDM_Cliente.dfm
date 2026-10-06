object DM_Cliente: TDM_Cliente
  OldCreateOrder = False
  Height = 252
  Width = 332
  object qryClienteLista: TFDQuery
    Active = True
    Connection = DM_Conexao.FDConexao
    SQL.Strings = (
      'SELECT ID, NOME, DOCUMENTO, EMAIL, TELEFONE, DATACADASTRO'
      'FROM CLIENTE'
      'WHERE NOME LIKE :NOME'
      'ORDER BY NOME')
    Left = 80
    Top = 64
    ParamData = <
      item
        Name = 'NOME'
        DataType = ftWideString
        ParamType = ptInput
        Size = 120
        Value = Null
      end>
  end
  object qryClienteEscrita: TFDQuery
    Connection = DM_Conexao.FDConexao
    Left = 192
    Top = 64
  end
  object qryClienteComboLista: TFDQuery
    Connection = DM_Conexao.FDConexao
    SQL.Strings = (
      'SELECT ID, NOME FROM CLIENTE ORDER BY NOME')
    Left = 80
    Top = 160
  end
end
