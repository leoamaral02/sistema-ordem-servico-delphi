unit uFrmPesquisaOS;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.ComCtrls, Vcl.ExtCtrls, uDM_Conexao, uDM_OrdemServico;

type
  TFrmPesquisaOS = class(TForm)
    pnlDashboard: TGridPanel;
    pnlCardAbertas: TPanel;
    lblTituloAbertas: TLabel;
    lblAbertas: TLabel;
    pnlCardEmAndamento: TPanel;
    lblTituloEmAndamento: TLabel;
    lblEmAndamento: TLabel;
    pnlCardConcluidas: TPanel;
    lblTituloConcluidas: TLabel;
    lblConcluidas: TLabel;
    pnlCardEmAtraso: TPanel;
    lblTituloEmAtraso: TLabel;
    lblEmAtraso: TLabel;
    GbxFiltros: TGroupBox;
    chkDataIni: TCheckBox;
    dtpDataIni: TDateTimePicker;
    chkDataFim: TCheckBox;
    dtpDataFim: TDateTimePicker;
    lblFiltroStatus: TLabel;
    cboFiltroStatus: TComboBox;
    lblFiltroCliente: TLabel;
    edtCliente: TEdit;
    lblValorMin: TLabel;
    edtValorMin: TEdit;
    lblValorMax: TLabel;
    edtValorMax: TEdit;
    btnPesquisar: TButton;
    btnLimpar: TButton;
    pnlbotoes: TPanel;
    btnNovaOS: TButton;
    btnEditarOS: TButton;
    btnProcessarAtrasos: TButton;
    dbgOS: TDBGrid;
    dsOSLista: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure btnNovaOSClick(Sender: TObject);
    procedure btnEditarOSClick(Sender: TObject);
    procedure dbgOSDrawColumnCell(Sender: TObject; const Rect: TRect;
    DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
    procedure Buscar;
    procedure ConfigurarCampos;
    procedure AtualizarDashboard;
    procedure EmAtrasoGetText(Sender: TField; var Text: string; DisplayText: Boolean);

  public

  end;

var
  FrmPesquisaOS: TFrmPesquisaOS;

implementation

{$R *.dfm}

uses uFrmOrdemServico;

procedure TFrmPesquisaOS.FormCreate(Sender: TObject);
begin
  cboFiltroStatus.Items.Clear;
  cboFiltroStatus.Items.Add('Todos');
  cboFiltroStatus.Items.Add('Aberta');
  cboFiltroStatus.Items.Add('Em Andamento');
  cboFiltroStatus.Items.Add('Concluída');
  cboFiltroStatus.Items.Add('Cancelada');
  cboFiltroStatus.ItemIndex := 0;

  Buscar;
end;

procedure TFrmPesquisaOS.Buscar;
var
  vIni, vFim: TDateTime;
  vMin, vMax: Double;
  vStatus: string;
begin
  if chkDataIni.Checked then vIni := Trunc(dtpDataIni.Date) else vIni := 0;
  if chkDataFim.Checked then vFim := Trunc(dtpDataFim.Date) else vFim := 0;

  if (vIni <> 0) and (vFim <> 0) and (vIni > vFim) then
  begin
    ShowMessage('A data inicial não pode ser maior que a data final.');
    Exit;
  end;

  if cboFiltroStatus.ItemIndex <= 0 then vStatus := '' else vStatus := cboFiltroStatus.Text;

  if Trim(edtValorMin.Text) = '' then
    vMin := -1
  else if not TryStrToFloat(Trim(edtValorMin.Text), vMin) then
  begin
    ShowMessage('Valor mínimo inválido.');
    edtValorMin.SetFocus;
    Exit;
  end;

  if Trim(edtValorMax.Text) = '' then
    vMax := -1
  else if not TryStrToFloat(Trim(edtValorMax.Text), vMax) then
  begin
    ShowMessage('Valor máximo inválido.');
    edtValorMax.SetFocus;
    Exit;
  end;

  try
    DM_OrdemServico.Listar(vIni, vFim, vStatus, Trim(edtCliente.Text), vMin, vMax);
    ConfigurarCampos;
    AtualizarDashboard;
  except
    on E: Exception do
      ShowMessage('Erro ao pesquisar: ' + E.Message);
  end;
end;

procedure TFrmPesquisaOS.ConfigurarCampos;
begin

  begin
   DM_OrdemServico.qryOSLista.FieldByName('EM_ATRASO').OnGetText := EmAtrasoGetText;
  (DM_OrdemServico.qryOSLista.FieldByName('VALOR_TOTAL') as TNumericField).DisplayFormat := ',0.00';
  end;
end;

procedure TFrmPesquisaOS.dbgOSDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
   if DM_OrdemServico.qryOSLista.FieldByName('EM_ATRASO').AsInteger = 1 then
  begin
    if not (gdSelected in State) then
      dbgOS.Canvas.Brush.Color := $00E8E8FD;
    dbgOS.Canvas.Font.Color := clmaroon;
  end;

  dbgOS.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TFrmPesquisaOS.EmAtrasoGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  if Sender.AsInteger = 1 then
    Text := 'Sim'
  else
    Text := 'Não';
end;

procedure TFrmPesquisaOS.AtualizarDashboard;
var
  vAbertas, vEmAndamento, vConcluidas, vEmAtraso: Integer;
begin
  DM_OrdemServico.BuscarContadoresDashboard(vAbertas, vEmAndamento, vConcluidas, vEmAtraso);
  lblAbertas.Caption := IntToStr(vAbertas);
  lblEmAndamento.Caption := IntToStr(vEmAndamento);
  lblConcluidas.Caption := IntToStr(vConcluidas);
  lblEmAtraso.Caption := IntToStr(vEmAtraso);
end;

procedure TFrmPesquisaOS.btnPesquisarClick(Sender: TObject);
begin
  Buscar;
end;

procedure TFrmPesquisaOS.btnEditarOSClick(Sender: TObject);
var
  vForm: TFrmOrdemServico;
  vID: Integer;
begin
  if DM_OrdemServico.qryOSLista.IsEmpty then
  begin
    ShowMessage('Selecione uma OS na lista para editar.');
    Exit;
  end;

  vID := DM_OrdemServico.qryOSLista.FieldByName('ID').AsInteger;

  vForm := TFrmOrdemServico.Create(Self);
  try
    vForm.CarregarParaEdicao(vID);
    vForm.ShowModal;
  finally
    vForm.Free;
  end;

  Buscar;
end;

procedure TFrmPesquisaOS.btnLimparClick(Sender: TObject);
begin
  chkDataIni.Checked := False;
  chkDataFim.Checked := False;
  dtpDataIni.Date := Date;
  dtpDataFim.Date := Date;
  cboFiltroStatus.ItemIndex := 0;
  edtCliente.Clear;
  edtValorMin.Clear;
  edtValorMax.Clear;
  Buscar;
end;

procedure TFrmPesquisaOS.btnNovaOSClick(Sender: TObject);
var
  vForm: TFrmOrdemServico;
begin
  vForm := TFrmOrdemServico.Create(Self);
  try
    vForm.ShowModal;
  finally
    vForm.Free;
  end;
  Buscar;
end;

end.
