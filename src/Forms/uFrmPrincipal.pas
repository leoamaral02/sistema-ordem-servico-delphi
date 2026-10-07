unit uFrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.Imaging.pngimage,uFrmOrdemServico,uFrmPesquisaOS,uFrmRelatorio;

type
  TFrmPrincipal = class(TForm)
    pnlMenu: TPanel;
    pnlConteudo: TPanel;
    sbRelatorios: TSpeedButton;
    sbClientes: TSpeedButton;
    sbOrdens: TSpeedButton;
    pnlTopo: TPanel;
    Image1: TImage;
    Label1: TLabel;
    procedure sbClientesClick(Sender: TObject);
    procedure sbOrdensClick(Sender: TObject);
    procedure sbRelatoriosClick(Sender: TObject);
    procedure FormShow(Sender: TObject);

  private
  FTelaAtual: TForm;
  procedure MostrarTela(AClasse: TFormClass);
  public
    { Public declarations }
  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

{$R *.dfm}

uses uFrmCliente;



{ TFrmPrincipal }

procedure TFrmPrincipal.FormShow(Sender: TObject);
begin
  if FTelaAtual = nil then
    MostrarTela(TFrmPesquisaOS);
end;

procedure TFrmPrincipal.MostrarTela(AClasse: TFormClass);
begin
  FreeAndNil(FTelaAtual);
  FTelaAtual := AClasse.Create(Self);
  FTelaAtual.BorderStyle := bsNone;
  FTelaAtual.Parent := pnlConteudo;
  FTelaAtual.Align := alClient;
  FTelaAtual.Show;
end;

procedure TFrmPrincipal.sbClientesClick(Sender: TObject);
begin
   mostrartela(tFrmCliente);
end;

procedure TFrmPrincipal.sbOrdensClick(Sender: TObject);
begin
  mostrartela(tFrmpesquisaos);
end;

procedure TFrmPrincipal.sbRelatoriosClick(Sender: TObject);
begin
    MostrarTela(TFrmRelatorio);
end;

end.
