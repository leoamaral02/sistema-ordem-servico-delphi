unit uDM_Cliente;

interface

uses
  System.SysUtils, System.Classes,uDM_Conexao, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TDM_Cliente = class(TDataModule)
    qryClienteLista: TFDQuery;
    qryClienteEscrita: TFDQuery;
  private
    { Private declarations }
  public
   procedure Listar(const AFiltroNome: string = '');
   procedure Inserir(const ANome, ADocumento, AEmail, ATelefone: string);
   procedure Editar(const AID: Integer; const ANome, ADocumento, AEmail, ATelefone: string);
   procedure Excluir(const AID: Integer);
  end;

var
  DM_Cliente: TDM_Cliente;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDM_Cliente }

procedure TDM_Cliente.Editar(const AID: Integer; const ANome, ADocumento,
  AEmail, ATelefone: string);
begin
  qryClienteEscrita.Close;
  qryClienteEscrita.SQL.Text :=
    'UPDATE CLIENTE SET ' +
    'NOME = :NOME, DOCUMENTO = :DOCUMENTO, EMAIL = :EMAIL, TELEFONE = :TELEFONE ' +
    'WHERE ID = :ID';

  qryClienteEscrita.ParamByName('NOME').AsString := ANome;
  qryClienteEscrita.ParamByName('DOCUMENTO').AsString := ADocumento;
  qryClienteEscrita.ParamByName('EMAIL').AsString := AEmail;
  qryClienteEscrita.ParamByName('TELEFONE').AsString := ATelefone;
  qryClienteEscrita.ParamByName('ID').AsInteger := AID;

  qryClienteEscrita.ExecSQL;
end;

procedure TDM_Cliente.Excluir(const AID: Integer);
begin
  qryClienteEscrita.Close;
  qryClienteEscrita.SQL.Text := 'DELETE FROM CLIENTE WHERE ID = :ID';
  qryClienteEscrita.ParamByName('ID').AsInteger := AID;
  qryClienteEscrita.ExecSQL;
end;

procedure TDM_Cliente.Inserir(const ANome, ADocumento, AEmail,
  ATelefone: string);
begin
  qryClienteEscrita.Close;
  qryClienteEscrita.SQL.Text :=
    'INSERT INTO CLIENTE (NOME, DOCUMENTO, EMAIL, TELEFONE) ' +
    'VALUES (:NOME, :DOCUMENTO, :EMAIL, :TELEFONE)';

  qryClienteEscrita.ParamByName('NOME').AsString := ANome;
  qryClienteEscrita.ParamByName('DOCUMENTO').AsString := ADocumento;
  qryClienteEscrita.ParamByName('EMAIL').AsString := AEmail;
  qryClienteEscrita.ParamByName('TELEFONE').AsString := ATelefone;

  qryClienteEscrita.ExecSQL;
end;

procedure TDM_Cliente.Listar(const AFiltroNome: string);
begin
  qryClienteLista.Close;
  qryClienteLista.ParamByName('NOME').AsString := '%' + AFiltroNome + '%';
  qryClienteLista.Open;
end;

end.
