unit uFrmRelatorio;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  System.StrUtils,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls,
  Vcl.ExtCtrls, Data.DB, uDM_OrdemServico, frxClass, frxExportBaseDialog,
  frxExportPDF, frxDBSet,frxDesgn;

type
  TFrmRelatorio = class(TForm)
    GbxFiltros: TGroupBox;
    lblStatus: TLabel;
    lblCliente: TLabel;
    lblValorMin: TLabel;
    lblValorMax: TLabel;
    chkDataIni: TCheckBox;
    dtpDataIni: TDateTimePicker;
    chkDataFim: TCheckBox;
    dtpDataFim: TDateTimePicker;
    chkAberta: TCheckBox;
    chkEmAndamento: TCheckBox;
    chkConcluida: TCheckBox;
    chkCancelada: TCheckBox;
    edtCliente: TEdit;
    edtValorMin: TEdit;
    edtValorMax: TEdit;
    pnlBotoes: TPanel;
    btnVisualizar: TButton;
    btnPDF: TButton;
    btnCSV: TButton;
    frxReport1: TfrxReport;
    SaveDialog1: TSaveDialog;
    frxPDFExport1: TfrxPDFExport;
    frxDBOS: TfrxDBDataset;
    procedure btnVisualizarClick(Sender: TObject);
    procedure btnPDFClick(Sender: TObject);
    procedure btnCSVClick(Sender: TObject);
  private
    function CarregarDados: Boolean;
    function LocalizarRelatorio: string;
    function PrepararRelatorio: Boolean;
    procedure GravarCSV(const AArquivo: string);
  end;

var
  FrmRelatorio: TFrmRelatorio;

implementation

{$R *.dfm}

function TFrmRelatorio.CarregarDados: Boolean;
var
  vIni, vFim: TDateTime;
  vMin, vMax: Double;
  vStatus: TArray<string>;
begin
  Result := False;

  if chkDataIni.Checked then vIni := Trunc(dtpDataIni.Date) else vIni := 0;
  if chkDataFim.Checked then vFim := Trunc(dtpDataFim.Date) else vFim := 0;

  if (vIni <> 0) and (vFim <> 0) and (vIni > vFim) then
  begin
    ShowMessage('A data inicial não pode ser maior que a data final.');
    Exit;
  end;

  vStatus := nil;
  if chkAberta.Checked then vStatus := vStatus + ['Aberta'];
  if chkEmAndamento.Checked then vStatus := vStatus + ['Em Andamento'];
  if chkConcluida.Checked then vStatus := vStatus + ['Concluída'];
  if chkCancelada.Checked then vStatus := vStatus + ['Cancelada'];

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

  DM_OrdemServico.ListarRelatorio(vIni, vFim, vStatus, Trim(edtCliente.Text), vMin, vMax);

  if DM_OrdemServico.qryRelatorio.IsEmpty then
  begin
    ShowMessage('Nenhuma Ordem de Serviço encontrada com esses filtros.');
    Exit;
  end;

  Result := True;
end;

function TFrmRelatorio.LocalizarRelatorio: string;
const
  NOME = 'RelatorioOS.fr3';
var
  vDiretorioExe: string;
  vCaminhos: array[0..3] of string;
  vCaminho: string;
begin
  vDiretorioExe := IncludeTrailingPathDelimiter(ExtractFilePath(ParamStr(0)));
  vCaminhos[0] := vDiretorioExe + NOME;
  vCaminhos[1] := vDiretorioExe + 'Reports\' + NOME;
  vCaminhos[2] := vDiretorioExe + '..\Reports\' + NOME;
  vCaminhos[3] := vDiretorioExe + '..\..\Reports\' + NOME;

  for vCaminho in vCaminhos do
    if FileExists(vCaminho) then
      Exit(ExpandFileName(vCaminho));

  raise Exception.Create('Report file not found: ' + NOME +
    '. Check the project Reports folder.');
end;
function TFrmRelatorio.PrepararRelatorio: Boolean;
begin
  Result := False;
  try
    if not CarregarDados then
      Exit;

    frxDBOS.DataSet := DM_OrdemServico.qryRelatorio;
    frxDBOS.UserName := 'frxDBOS';

    frxReport1.DataSets.Clear;
    frxReport1.DataSets.Add(frxDBOS);

    frxReport1.LoadFromFile(LocalizarRelatorio);

    Result := True;
  except
    on E: Exception do
      ShowMessage('Erro ao preparar o relatório: ' + E.Message);
  end;
end;

procedure TFrmRelatorio.btnPDFClick(Sender: TObject);
begin
  try
    if not PrepararRelatorio then
      Exit;

    SaveDialog1.Filter := 'PDF (*.pdf)|*.pdf';
    SaveDialog1.DefaultExt := 'pdf';
    SaveDialog1.FileName := 'RelatorioOS.pdf';
    if not SaveDialog1.Execute then
      Exit;

    frxReport1.PrepareReport;
    frxPDFExport1.FileName := SaveDialog1.FileName;
    frxPDFExport1.ShowDialog := False;
    frxPDFExport1.DefaultPath := '';
    frxReport1.Export(frxPDFExport1);
    ShowMessage('PDF gerado com sucesso.');
  except
    on E: Exception do
      ShowMessage('Erro ao exportar PDF: ' + E.Message);
  end;
end;

procedure TFrmRelatorio.btnVisualizarClick(Sender: TObject);
begin
  try
    if PrepararRelatorio then
      frxReport1.ShowReport;
  except
    on E: Exception do
      ShowMessage('Erro ao gerar o relatório: ' + E.Message);
  end;
end;

procedure TFrmRelatorio.GravarCSV(const AArquivo: string);
var
  vLinhas: TStringList;
  vPrevista: string;
begin
  vLinhas := TStringList.Create;
  try
    vLinhas.Add('ID;Cliente;Abertura;Prevista;Status;Valor;Em atraso');
    with DM_OrdemServico.qryRelatorio do
    begin
      First;
      while not Eof do
      begin
        if FieldByName('DATA_PREVISTA').IsNull then
          vPrevista := ''
        else
          vPrevista := FormatDateTime('dd/mm/yyyy', FieldByName('DATA_PREVISTA').AsDateTime);

        vLinhas.Add(Format('%d;"%s";%s;%s;%s;%s;%s', [
          FieldByName('ID').AsInteger,
          StringReplace(FieldByName('CLIENTE_NOME').AsString, '"', '""', [rfReplaceAll]),
          FormatDateTime('dd/mm/yyyy', FieldByName('DATA_ABERTURA').AsDateTime),
          vPrevista,
          FieldByName('STATUS').AsString,
          FormatFloat('0.00', FieldByName('VALOR_TOTAL').AsFloat),
          IfThen(FieldByName('EM_ATRASO').AsInteger = 1, 'Sim', 'Não')]));
        Next;
      end;
    end;
    vLinhas.SaveToFile(AArquivo, TEncoding.UTF8);
  finally
    vLinhas.Free;
  end;
end;

procedure TFrmRelatorio.btnCSVClick(Sender: TObject);
begin
  try
    if not CarregarDados then
      Exit;

    SaveDialog1.Filter := 'CSV (*.csv)|*.csv';
    SaveDialog1.DefaultExt := 'csv';
    SaveDialog1.FileName := 'RelatorioOS.csv';
    if not SaveDialog1.Execute then
      Exit;

    GravarCSV(SaveDialog1.FileName);
    ShowMessage('CSV gerado com sucesso.');
  except
    on E: Exception do
      ShowMessage('Erro ao exportar CSV: ' + E.Message);
  end;
end;
end.
