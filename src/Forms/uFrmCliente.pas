unit uFrmCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB, Vcl.Grids,
  Vcl.DBGrids,uDM_Cliente,System.UITypes;

type
  TFrmCliente = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    edtnome: TEdit;
    edtemail: TEdit;
    Label3: TLabel;
    edttelefone: TEdit;
    Label4: TLabel;
    edtdocumento: TEdit;
    Label2: TLabel;
    btnnovo: TButton;
    btnsalvar: TButton;
    btnexcluir: TButton;
    GroupBox2: TGroupBox;
    edtbuscar: TEdit;
    btnbuscar: TButton;
    dbgClientes: TDBGrid;
    dsClienteLista: TDataSource;
    procedure dsClienteListaDataChange(Sender: TObject; Field: TField);
    procedure btnbuscarClick(Sender: TObject);
    procedure btnsalvarClick(Sender: TObject);
    procedure btnnovoClick(Sender: TObject);
    procedure btnexcluirClick(Sender: TObject);
  private
    FClienteID: Integer;
    function ValidarCampos: Boolean;
    procedure LimparCampos;
  public
    { Public declarations }
  end;

var
  FrmCliente: TFrmCliente;

implementation

{$R *.dfm}

procedure TFrmCliente.btnbuscarClick(Sender: TObject);
begin
  DM_Cliente.Listar(edtbuscar.Text);
end;

procedure TFrmCliente.btnexcluirClick(Sender: TObject);
begin
 if FClienteID = 0 then
  begin
    ShowMessage('Selecione um cliente na lista antes de excluir.');
    Exit;
  end;

  if MessageDlg('Confirma excluir este cliente?', mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
    Exit;

  try
    DM_Cliente.Excluir(FClienteID);
    ShowMessage('Cliente excluído com sucesso!');
    LimparCampos;
    DM_Cliente.Listar(edtbuscar.Text);
  except
    on E: Exception do
      ShowMessage('Erro ao excluir: ' + E.Message);
  end;
end;

procedure TFrmCliente.btnnovoClick(Sender: TObject);
begin
  LimparCampos;
end;

procedure TFrmCliente.btnsalvarClick(Sender: TObject);
begin
  if not ValidarCampos then
    Exit;

  if MessageDlg('Confirma salvar os dados deste cliente?', mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
    Exit;

  try
    if FClienteID = 0 then
      DM_Cliente.Inserir(edtNome.Text, edtDocumento.Text, edtEmail.Text, edtTelefone.Text)
    else
      DM_Cliente.Editar(FClienteID, edtNome.Text, edtDocumento.Text, edtEmail.Text, edtTelefone.Text);

    ShowMessage('Cliente salvo com sucesso!');
    DM_Cliente.Listar(edtbuscar.Text);
  except
    on E: Exception do
      ShowMessage('Erro ao salvar: ' + E.Message);
  end;
end;

procedure TFrmCliente.dsClienteListaDataChange(Sender: TObject; Field: TField);
begin
    if DM_Cliente.qryClienteLista.IsEmpty then
    Exit;

  edtNome.Text := DM_Cliente.qryClienteLista.FieldByName('NOME').AsString;
  edtDocumento.Text := DM_Cliente.qryClienteLista.FieldByName('DOCUMENTO').AsString;
  edtEmail.Text := DM_Cliente.qryClienteLista.FieldByName('EMAIL').AsString;
  edtTelefone.Text := DM_Cliente.qryClienteLista.FieldByName('TELEFONE').AsString;
  FClienteID := DM_Cliente.qryClienteLista.FieldByName('ID').AsInteger;
end;

procedure TFrmCliente.LimparCampos;
begin
  edtNome.Clear;
  edtDocumento.Clear;
  edtEmail.Clear;
  edtTelefone.Clear;
  FClienteID := 0;
  edtNome.SetFocus;
end;

function TFrmCliente.ValidarCampos: Boolean;
begin
     Result := True;

  if Trim(edtNome.Text) = '' then
  begin
    ShowMessage('Nome é obrigatório.');
    edtNome.SetFocus;
    Exit(False);
  end;

  if Length(Trim(edtDocumento.Text)) <> 11 then
  begin
    ShowMessage('Documento deve conter 11 dígitos (CPF).');
    edtDocumento.SetFocus;
    Exit(False);
  end;
end;

end.
