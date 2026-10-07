program SistemaOS;

uses
  Vcl.Forms,
  uFrmPrincipal in 'src\Forms\uFrmPrincipal.pas' {FrmPrincipal},
  uDM_Conexao in 'src\Data\uDM_Conexao.pas' {DM_Conexao: TDataModule},
  uDM_Cliente in 'src\Data\uDM_Cliente.pas' {DM_Cliente: TDataModule},
  uFrmCliente in 'src\Forms\uFrmCliente.pas' {FrmCliente},
  uDM_OrdemServico in 'src\Data\uDM_OrdemServico.pas' {DM_OrdemServico: TDataModule},
  uFrmOrdemServico in 'src\Forms\uFrmOrdemServico.pas' {FrmOrdemServico},
  uFrmPesquisaOS in 'src\Forms\uFrmPesquisaOS.pas' {FrmPesquisaOS},
  uFrmRelatorio in 'src\Forms\uFrmRelatorio.pas' {FrmRelatorio};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.CreateForm(TDM_Conexao, DM_Conexao);
  Application.CreateForm(TDM_Cliente, DM_Cliente);
  Application.CreateForm(TDM_OrdemServico, DM_OrdemServico);
  Application.CreateForm(TFrmOrdemServico, FrmOrdemServico);
  Application.CreateForm(TFrmPesquisaOS, FrmPesquisaOS);
  Application.CreateForm(TFrmRelatorio, FrmRelatorio);
  Application.Run;
end.
