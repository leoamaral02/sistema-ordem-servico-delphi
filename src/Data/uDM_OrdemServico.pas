unit uDM_OrdemServico;

interface

uses
  System.SysUtils, System.Classes, uDM_Conexao, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
    TDM_OrdemServico = class(TDataModule)
    qryOSLista: TFDQuery;
    qryOSEscrita: TFDQuery;
    qryItensLista: TFDQuery;
    qryItensEscrita: TFDQuery;
    qryDashboard: TFDQuery;
    qryRelatorio: TFDQuery;
    qryRelatorioID: TIntegerField;
    qryRelatorioCLIENTE_NOME: TWideStringField;
    qryRelatorioDATA_ABERTURA: TDateField;
    qryRelatorioDATA_PREVISTA: TDateField;
    qryRelatorioSTATUS: TWideStringField;
    qryRelatorioVALOR_TOTAL: TFMTBCDField;
    qryRelatorioEM_ATRASO: TIntegerField;
  private
    procedure ExcluirTodosItensDaOS(AOrdemID: Integer);
  public
    procedure Listar(ADataIni: TDateTime = 0; ADataFim: TDateTime = 0;
      AStatus: string = ''; ACliente: string = '';
      AValorMin: Double = -1; AValorMax: Double = -1);
    function Inserir(AClienteID: Integer; ADataPrevista: TDateTime;
    const ADescricaoProblema: string): Integer;
    procedure Editar(AID, AClienteID: Integer; ADataPrevista: TDateTime;
    AStatus: string; const ADescricaoProblema: string);
    procedure Excluir(AID: Integer);

    function InserirItem(AOrdemID: Integer; const ADescricao: string;
    AQuantidade, AValorUnitario: Double): Integer;
    procedure EditarItem(AID: Integer; const ADescricao: string;
    AQuantidade, AValorUnitario: Double);
    procedure ExcluirItem(AID: Integer);
    function SalvarOSCompleta(AID: Integer; AClienteID: Integer; ADataPrevista: TDateTime;
    AStatus: string; const ADescricaoProblema: string; AItens: TFDMemTable): Integer;
    procedure BuscarContadoresDashboard(out AAbertas, AEmAndamento, AConcluidas, AEmAtraso: Integer);
    procedure BuscarPorID(AID: Integer; out AClienteID: Integer; out ADataPrevista: TDateTime;
    out AStatus, ADescricaoProblema: string);
    procedure CarregarItensDaOS(AOrdemID: Integer; ADestino: TFDMemTable);
    procedure ListarRelatorio(ADataIni, ADataFim: TDateTime;
    const AStatus: TArray<string>; const ACliente: string;
    AValorMin, AValorMax: Double);

  end;

var
  DM_OrdemServico: TDM_OrdemServico;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDM_OrdemServico }

procedure TDM_OrdemServico.BuscarContadoresDashboard(out AAbertas, AEmAndamento,
  AConcluidas, AEmAtraso: Integer);
begin
  qryDashboard.Close;
  qryDashboard.Open;
  AAbertas := qryDashboard.FieldByName('QTD_ABERTAS').AsInteger;
  AEmAndamento := qryDashboard.FieldByName('QTD_EM_ANDAMENTO').AsInteger;
  AConcluidas := qryDashboard.FieldByName('QTD_CONCLUIDAS').AsInteger;
  AEmAtraso := qryDashboard.FieldByName('QTD_EM_ATRASO').AsInteger;
  qryDashboard.Close;
end;

procedure TDM_OrdemServico.BuscarPorID(AID: Integer; out AClienteID: Integer;
  out ADataPrevista: TDateTime; out AStatus, ADescricaoProblema: string);
begin
  qryOSEscrita.Close;
  qryOSEscrita.SQL.Text := 'SELECT CLIENTE_ID, DATA_PREVISTA, STATUS, DESCRICAO_PROBLEMA ' +
    'FROM ORDEM_SERVICO WHERE ID = :ID';
  qryOSEscrita.ParamByName('ID').AsInteger := AID;
  qryOSEscrita.Open;

  AClienteID := qryOSEscrita.FieldByName('CLIENTE_ID').AsInteger;
  ADataPrevista := qryOSEscrita.FieldByName('DATA_PREVISTA').AsDateTime;
  AStatus := qryOSEscrita.FieldByName('STATUS').AsString;
  ADescricaoProblema := qryOSEscrita.FieldByName('DESCRICAO_PROBLEMA').AsString;

  qryOSEscrita.Close;
end;

procedure TDM_OrdemServico.CarregarItensDaOS(AOrdemID: Integer;
  ADestino: TFDMemTable);
begin
  qryItensLista.Close;
  qryItensLista.SQL.Text := 'SELECT DESCRICAO, QUANTIDADE, VALOR_UNITARIO ' +
    'FROM ITEM_ORDEM WHERE ORDEM_ID = :ORDEM_ID';
  qryItensLista.ParamByName('ORDEM_ID').AsInteger := AOrdemID;
  qryItensLista.Open;

  ADestino.EmptyDataSet;
  qryItensLista.First;
  while not qryItensLista.Eof do
  begin
    ADestino.Append;
    ADestino.FieldByName('DESCRICAO').AsString := qryItensLista.FieldByName('DESCRICAO').AsString;
    ADestino.FieldByName('QUANTIDADE').AsFloat := qryItensLista.FieldByName('QUANTIDADE').AsFloat;
    ADestino.FieldByName('VALOR_UNITARIO').AsFloat := qryItensLista.FieldByName('VALOR_UNITARIO').AsFloat;
    ADestino.FieldByName('SUBTOTAL').AsFloat :=
    qryItensLista.FieldByName('QUANTIDADE').AsFloat * qryItensLista.FieldByName('VALOR_UNITARIO').AsFloat;
    ADestino.Post;
    qryItensLista.Next;
  end;

  qryItensLista.Close;
end;

procedure TDM_OrdemServico.Editar(AID, AClienteID: Integer;
  ADataPrevista: TDateTime; AStatus: string; const ADescricaoProblema: string);
begin
     qryOSEscrita.Close;
  qryOSEscrita.SQL.Text :=
    'UPDATE ORDEM_SERVICO SET ' +
    'CLIENTE_ID = :CLIENTE_ID, DATA_PREVISTA = :DATA_PREVISTA, ' +
    'STATUS = :STATUS, DESCRICAO_PROBLEMA = :DESCRICAO ' +
    'WHERE ID = :ID';

  qryOSEscrita.ParamByName('CLIENTE_ID').AsInteger := AClienteID;
  qryOSEscrita.ParamByName('DATA_PREVISTA').AsDate := ADataPrevista;
  qryOSEscrita.ParamByName('STATUS').AsString := AStatus;
  qryOSEscrita.ParamByName('DESCRICAO').AsString := ADescricaoProblema;
  qryOSEscrita.ParamByName('ID').AsInteger := AID;

  qryOSEscrita.ExecSQL;
end;

procedure TDM_OrdemServico.EditarItem(AID: Integer; const ADescricao: string;
  AQuantidade, AValorUnitario: Double);
begin
     qryItensEscrita.Close;
  qryItensEscrita.SQL.Text :=
    'UPDATE ITEM_ORDEM SET DESCRICAO = :DESCRICAO, QUANTIDADE = :QUANTIDADE, ' +
    'VALOR_UNITARIO = :VALOR_UNITARIO WHERE ID = :ID';

  qryItensEscrita.ParamByName('DESCRICAO').AsString := ADescricao;
  qryItensEscrita.ParamByName('QUANTIDADE').AsFloat := AQuantidade;
  qryItensEscrita.ParamByName('VALOR_UNITARIO').AsFloat := AValorUnitario;
  qryItensEscrita.ParamByName('ID').AsInteger := AID;

  qryItensEscrita.ExecSQL;
end;

procedure TDM_OrdemServico.Excluir(AID: Integer);
begin
  qryOSEscrita.Close;
  qryOSEscrita.SQL.Text := 'DELETE FROM ORDEM_SERVICO WHERE ID = :ID';
  qryOSEscrita.ParamByName('ID').AsInteger := AID;
  qryOSEscrita.ExecSQL;
end;

procedure TDM_OrdemServico.ExcluirItem(AID: Integer);
begin
  qryItensEscrita.Close;
  qryItensEscrita.SQL.Text := 'DELETE FROM ITEM_ORDEM WHERE ID = :ID';
  qryItensEscrita.ParamByName('ID').AsInteger := AID;
  qryItensEscrita.ExecSQL;
end;

procedure TDM_OrdemServico.ExcluirTodosItensDaOS(AOrdemID: Integer);
begin
  qryItensEscrita.Close;
  qryItensEscrita.SQL.Text := 'DELETE FROM ITEM_ORDEM WHERE ORDEM_ID = :ORDEM_ID';
  qryItensEscrita.ParamByName('ORDEM_ID').AsInteger := AOrdemID;
  qryItensEscrita.ExecSQL;
end;

function TDM_OrdemServico.Inserir(AClienteID: Integer; ADataPrevista: TDateTime;
  const ADescricaoProblema: string): Integer;
begin
   qryOSEscrita.Close;
  qryOSEscrita.SQL.Text :=
    'INSERT INTO ORDEM_SERVICO (CLIENTE_ID, DATA_ABERTURA, DATA_PREVISTA, STATUS, DESCRICAO_PROBLEMA) ' +
    'VALUES (:CLIENTE_ID, CURRENT_DATE, :DATA_PREVISTA, ''Aberta'', :DESCRICAO) ' +
    'RETURNING ID';

  qryOSEscrita.ParamByName('CLIENTE_ID').AsInteger := AClienteID;
  qryOSEscrita.ParamByName('DATA_PREVISTA').AsDate := ADataPrevista;
  qryOSEscrita.ParamByName('DESCRICAO').AsString := ADescricaoProblema;

  qryOSEscrita.Open;
  Result := qryOSEscrita.FieldByName('ID').AsInteger;
  qryOSEscrita.Close;
end;

function TDM_OrdemServico.InserirItem(AOrdemID: Integer;
  const ADescricao: string; AQuantidade, AValorUnitario: Double): Integer;
begin
    qryItensEscrita.Close;
  qryItensEscrita.SQL.Text :=
    'INSERT INTO ITEM_ORDEM (ORDEM_ID, DESCRICAO, QUANTIDADE, VALOR_UNITARIO) ' +
    'VALUES (:ORDEM_ID, :DESCRICAO, :QUANTIDADE, :VALOR_UNITARIO) ' +
    'RETURNING ID';

  qryItensEscrita.ParamByName('ORDEM_ID').AsInteger := AOrdemID;
  qryItensEscrita.ParamByName('DESCRICAO').AsString := ADescricao;
  qryItensEscrita.ParamByName('QUANTIDADE').AsFloat := AQuantidade;
  qryItensEscrita.ParamByName('VALOR_UNITARIO').AsFloat := AValorUnitario;

  qryItensEscrita.Open;
  Result := qryItensEscrita.FieldByName('ID').AsInteger;
  qryItensEscrita.Close
end;

procedure TDM_OrdemServico.Listar(ADataIni, ADataFim: TDateTime; AStatus,
  ACliente: string; AValorMin, AValorMax: Double);
begin
  qryOSLista.Close;

  if ADataIni = 0 then
    qryOSLista.ParamByName('DATAINI').Clear
  else
    qryOSLista.ParamByName('DATAINI').AsDate := ADataIni;

  if ADataFim = 0 then
    qryOSLista.ParamByName('DATAFIM').Clear
  else
    qryOSLista.ParamByName('DATAFIM').AsDate := ADataFim;

  if Trim(AStatus) = '' then
    qryOSLista.ParamByName('STATUS').Clear
  else
    qryOSLista.ParamByName('STATUS').AsString := AStatus;

  if Trim(ACliente) = '' then
    qryOSLista.ParamByName('CLIENTE').Clear
  else
    qryOSLista.ParamByName('CLIENTE').AsString := '%' + ACliente + '%';

  if AValorMin < 0 then
    qryOSLista.ParamByName('VALORMIN').Clear
  else
    qryOSLista.ParamByName('VALORMIN').AsCurrency := AValorMin;

  if AValorMax < 0 then
    qryOSLista.ParamByName('VALORMAX').Clear
  else
    qryOSLista.ParamByName('VALORMAX').AsCurrency := AValorMax;

  qryOSLista.Open;
end;

procedure TDM_OrdemServico.ListarRelatorio(ADataIni, ADataFim: TDateTime;
  const AStatus: TArray<string>; const ACliente: string; AValorMin,
  AValorMax: Double);
const
  TODOS: array[0..3] of string = ('Aberta', 'Em Andamento', 'Concluída', 'Cancelada');
var
  I: Integer;
  vLista: TArray<string>;
begin
  qryRelatorio.Close;
  qryRelatorio.SQL.Text :=
    'SELECT ID, CLIENTE_NOME, DATA_ABERTURA, DATA_PREVISTA, STATUS, VALOR_TOTAL, EM_ATRASO ' +
    'FROM VW_OS_RESUMO ' +
    'WHERE (CAST(:DATAINI AS DATE) IS NULL OR DATA_ABERTURA >= :DATAINI) ' +
    '  AND (CAST(:DATAFIM AS DATE) IS NULL OR DATA_ABERTURA <= :DATAFIM) ' +
    '  AND STATUS IN (:S1, :S2, :S3, :S4) ' +
    '  AND (CAST(:CLIENTE AS VARCHAR(122)) IS NULL OR CLIENTE_NOME LIKE :CLIENTE) ' +
    '  AND (CAST(:VALORMIN AS NUMERIC(15,2)) IS NULL OR VALOR_TOTAL >= :VALORMIN) ' +
    '  AND (CAST(:VALORMAX AS NUMERIC(15,2)) IS NULL OR VALOR_TOTAL <= :VALORMAX) ' +
    'ORDER BY STATUS, DATA_ABERTURA';

  qryRelatorio.ParamByName('DATAINI').DataType := ftDate;
  qryRelatorio.ParamByName('DATAFIM').DataType := ftDate;
  qryRelatorio.ParamByName('CLIENTE').DataType := ftString;
  qryRelatorio.ParamByName('VALORMIN').DataType := ftCurrency;
  qryRelatorio.ParamByName('VALORMAX').DataType := ftCurrency;
  for I := 1 to 4 do
    qryRelatorio.ParamByName('S' + IntToStr(I)).DataType := ftString;

  if ADataIni = 0 then qryRelatorio.ParamByName('DATAINI').Clear
  else qryRelatorio.ParamByName('DATAINI').AsDate := ADataIni;

  if ADataFim = 0 then qryRelatorio.ParamByName('DATAFIM').Clear
  else qryRelatorio.ParamByName('DATAFIM').AsDate := ADataFim;

  if Trim(ACliente) = '' then qryRelatorio.ParamByName('CLIENTE').Clear
  else qryRelatorio.ParamByName('CLIENTE').AsString := '%' + Trim(ACliente) + '%';

  if AValorMin < 0 then qryRelatorio.ParamByName('VALORMIN').Clear
  else qryRelatorio.ParamByName('VALORMIN').AsCurrency := AValorMin;

  if AValorMax < 0 then qryRelatorio.ParamByName('VALORMAX').Clear
  else qryRelatorio.ParamByName('VALORMAX').AsCurrency := AValorMax;


  if Length(AStatus) = 0 then
  begin
    SetLength(vLista, 4);
    for I := 0 to 3 do vLista[I] := TODOS[I];
  end
  else
    vLista := AStatus;

  for I := 1 to 4 do
    if I <= Length(vLista) then
      qryRelatorio.ParamByName('S' + IntToStr(I)).AsString := vLista[I - 1]
    else
      qryRelatorio.ParamByName('S' + IntToStr(I)).Clear;

  qryRelatorio.Open;
end;

function TDM_OrdemServico.SalvarOSCompleta(AID, AClienteID: Integer;
  ADataPrevista: TDateTime; AStatus: string; const ADescricaoProblema: string;
  AItens: TFDMemTable): Integer;
begin
       DM_Conexao.FDConexao.StartTransaction;
  try
    if AID = 0 then
      Result := Inserir(AClienteID, ADataPrevista, ADescricaoProblema)
    else
    begin
      Editar(AID, AClienteID, ADataPrevista, AStatus, ADescricaoProblema);
      Result := AID;
    end;

    ExcluirTodosItensDaOS(Result);

    AItens.First;
    while not AItens.Eof do
    begin
      InserirItem(Result,
        AItens.FieldByName('DESCRICAO').AsString,
        AItens.FieldByName('QUANTIDADE').AsFloat,
        AItens.FieldByName('VALOR_UNITARIO').AsFloat);
      AItens.Next;
    end;

    DM_Conexao.FDConexao.Commit;
  except
    DM_Conexao.FDConexao.Rollback;
    raise;
  end;
end;

end.
