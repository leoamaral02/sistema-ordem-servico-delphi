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
  end;

var
  DM_OrdemServico: TDM_OrdemServico;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDM_OrdemServico }

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
