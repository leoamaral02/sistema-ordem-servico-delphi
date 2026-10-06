unit uFrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.Imaging.pngimage,uFrmOrdemServico;

type
  TFrmPrincipal = class(TForm)
    pnlMenu: TPanel;
    pnlConteudo: TPanel;
    sbRelatorios: TSpeedButton;
    sbClientes: TSpeedButton;
    sbOrdens: TSpeedButton;
    pnlTopo: TPanel;
    Image1: TImage;
    procedure sbClientesClick(Sender: TObject);
    procedure sbOrdensClick(Sender: TObject);

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
  mostrartela(tFrmOrdemServico);
end;

end.
