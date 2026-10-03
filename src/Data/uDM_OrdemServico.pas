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
    { Private declarations }
  public
    procedure Listar(ADataIni: TDateTime = 0; ADataFim: TDateTime = 0;
      AStatus: string = ''; ACliente: string = '';
      AValorMin: Double = -1; AValorMax: Double = -1);
       function Inserir(AClienteID: Integer; ADataPrevista: TDateTime;
    const ADescricaoProblema: string): Integer;
  end;

var
  DM_OrdemServico: TDM_OrdemServico;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDM_OrdemServico }

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

end.
