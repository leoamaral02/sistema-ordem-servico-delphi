unit uFrmOrdemServico;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.ComCtrls,
  Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, System.UITypes,
  uDM_Cliente, uDM_OrdemServico, FireDAC.Comp.Client,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet;

type
  TFrmOrdemServico = class(TForm)
    pnlTopo: TPanel;
    btnNovo: TButton;
    btnSalvarOS: TButton;
    btnCancelarOS: TButton;
    pnlAlertaAtraso: TPanel;
    GbxDadosOS: TGroupBox;
    cboCliente: TDBLookupComboBox;
    Label1: TLabel;
    dtpAbertura: TDateTimePicker;
    dtpPrevista: TDateTimePicker;
    cboStatus: TComboBox;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    GbxDescricao: TGroupBox;
    Memo1: TMemo;
    GbxItens: TGroupBox;
    lblValorTotal: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    edtItemDescricao: TEdit;
    edtItemQuantidade: TEdit;
    edtItemValorUnitario: TEdit;
    btnAdicionarItem: TButton;
    dbgItens: TDBGrid;
    dsClienteCombo: TDataSource;
    mtItens: TFDMemTable;
    dsItens: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure btnAdicionarItemClick(Sender: TObject);
    procedure btnSalvarOSClick(Sender: TObject);
    procedure btnCancelarOSClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
  private
    { Private declarations }
    FOSID: Integer;
    procedure LimparTela;
    procedure RecalcularTotalTela;
    function ValidarAntesDeSalvar: Boolean;
  public
    { Public declarations }
  end;

var
  FrmOrdemServico: TFrmOrdemServico;

implementation

{$R *.dfm}

procedure TFrmOrdemServico.FormCreate(Sender: TObject);
begin
  DM_Cliente.qryClienteComboLista.Close;
  DM_Cliente.qryClienteComboLista.Open;

  cboStatus.Items.Clear;
  cboStatus.Items.Add('Aberta');
  cboStatus.Items.Add('Em Andamento');
  cboStatus.Items.Add('Concluída');
  cboStatus.Items.Add('Cancelada');

  mtItens.FieldDefs.Clear;
  mtItens.FieldDefs.Add('DESCRICAO', ftString, 200);
  mtItens.FieldDefs.Add('QUANTIDADE', ftFloat);
  mtItens.FieldDefs.Add('VALOR_UNITARIO', ftFloat);
  mtItens.FieldDefs.Add('SUBTOTAL', ftFloat);
  mtItens.CreateDataSet;

  dtpAbertura.Enabled := False;

  LimparTela;
end;

procedure TFrmOrdemServico.RecalcularTotalTela;
var
  vTotal: Double;
begin
  vTotal := 0;
  mtItens.First;
  while not mtItens.Eof do
  begin
    vTotal := vTotal + mtItens.FieldByName('SUBTOTAL').AsFloat;
    mtItens.Next;
  end;
  lblValorTotal.Caption := Format('Valor Total: R$ %.2f', [vTotal]);
end;

procedure TFrmOrdemServico.btnAdicionarItemClick(Sender: TObject);
var
  vQuantidade, vValorUnitario: Double;
begin
  if Trim(edtItemDescricao.Text) = '' then
  begin
    ShowMessage('Informe a descrição do item.');
    edtItemDescricao.SetFocus;
    Exit;
  end;

  if not TryStrToFloat(edtItemQuantidade.Text, vQuantidade) or (vQuantidade <= 0) then
  begin
    ShowMessage('Quantidade inválida.');
    edtItemQuantidade.SetFocus;
    Exit;
  end;

  if not TryStrToFloat(edtItemValorUnitario.Text, vValorUnitario) or (vValorUnitario <= 0) then
  begin
    ShowMessage('Valor unitário inválido.');
    edtItemValorUnitario.SetFocus;
    Exit;
  end;

  mtItens.Append;
  mtItens.FieldByName('DESCRICAO').AsString := Trim(edtItemDescricao.Text);
  mtItens.FieldByName('QUANTIDADE').AsFloat := vQuantidade;
  mtItens.FieldByName('VALOR_UNITARIO').AsFloat := vValorUnitario;
  mtItens.FieldByName('SUBTOTAL').AsFloat := vQuantidade * vValorUnitario;
  mtItens.Post;

  edtItemDescricao.Clear;
  edtItemQuantidade.Clear;
  edtItemValorUnitario.Clear;
  edtItemDescricao.SetFocus;

  RecalcularTotalTela;
end;

function TFrmOrdemServico.ValidarAntesDeSalvar: Boolean;
begin
  Result := True;

  if VarIsNull(cboCliente.KeyValue) then
  begin
    ShowMessage('Selecione um cliente.');
    Exit(False);
  end;

  if mtItens.IsEmpty then
  begin
    ShowMessage('Adicione pelo menos um item antes de salvar.');
    Exit(False);
  end;
end;

procedure TFrmOrdemServico.btnSalvarOSClick(Sender: TObject);
var
  vClienteID: Integer;
begin
  if not ValidarAntesDeSalvar then
    Exit;

  if MessageDlg('Confirma salvar esta Ordem de Serviço?', mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
    Exit;

  vClienteID := cboCliente.KeyValue;

  try
    FOSID := DM_OrdemServico.SalvarOSCompleta(FOSID, vClienteID, dtpPrevista.Date,
      cboStatus.Text, Memo1.Lines.Text, mtItens);

    ShowMessage('Ordem de Serviço salva com sucesso!');
    LimparTela;
  except
    on E: Exception do
      ShowMessage('Erro ao salvar: ' + E.Message);
  end;
end;

procedure TFrmOrdemServico.btnCancelarOSClick(Sender: TObject);
begin
  if MessageDlg('Descartar as alterações desta OS?', mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
    Exit;
  LimparTela;
end;

procedure TFrmOrdemServico.btnNovoClick(Sender: TObject);
begin
  LimparTela;
end;

procedure TFrmOrdemServico.LimparTela;
begin
  FOSID := 0;
  cboCliente.KeyValue := Null;
  dtpAbertura.Date := Now;
  dtpPrevista.Date := Now;
  cboStatus.ItemIndex := 0;
  Memo1.Lines.Clear;
  mtItens.EmptyDataSet;
  RecalcularTotalTela;
  pnlAlertaAtraso.Visible := False;
end;

end.
