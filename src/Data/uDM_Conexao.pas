unit uDM_Conexao;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client;

type
  TDM_Conexao = class(TDataModule)
    FDConexao: TFDConnection;
  private
    { Private declarations }
  public
    procedure Conectar ;
  end;

var
  DM_Conexao: TDM_Conexao;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDM_Conexao }

procedure TDM_Conexao.Conectar;
begin
  try
    if not FDconexao.Connected then
      FDconexao.Connected := True;
  except
    on E: Exception do
      raise Exception.Create('Não foi possível conectar ao banco: ' + E.Message);
  end;
end;

end.

end.
