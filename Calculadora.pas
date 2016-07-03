unit Calculadora;

interface

uses
  Winapi.Windows, Winapi.Messages, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.StdCtrls, Vcl.Grids, Data.DB, Vcl.DBGrids,
  Datasnap.DBClient;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edtCampo1: TEdit;
    edtCampo2: TEdit;
    btnSomar: TButton;
    btnSubtrair: TButton;
    btnMultiplicar: TButton;
    btnDividir: TButton;
    Label4: TLabel;
    edtResultado: TEdit;
    dbGridResultados: TDBGrid;
    cdsValores: TClientDataSet;
    cdsValoresValor1: TFloatField;
    cdsValoresValor2: TFloatField;
    dsValores: TDataSource;
    cdsValoresResultado: TFloatField;
    procedure btnSomarClick(Sender: TObject);
    procedure btnSubtrairClick(Sender: TObject);
    procedure btnMultiplicarClick(Sender: TObject);
    procedure btnDividirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    Function Somar(pValor1, pValor2 : Double): Double;
    Function Subtrair(pValor1, pValor2 : Double): Double;
    Function Multiplicar(pValor1, pValor2 : Double): Double;
    Function Dividir(pValor1, pValor2 : Double): Double;
    Function VerificaCampos(pValor1, pValor2 : Double): Boolean;
    procedure AtribuiValoresAoGrid(pValor1, pValor2, pResultado: Double);
  end;

var
  Form1: TForm1;

implementation

uses
  System.SysUtils, Dialogs;

{$R *.dfm}

procedure TForm1.AtribuiValoresAoGrid(pValor1, pValor2, pResultado: Double);
begin
  cdsValores.Insert;
  cdsValores.FieldByName('Valor1').AsFloat := pValor1;
  cdsValores.FieldByName('Valor2').AsFloat := pValor2;
  cdsValores.FieldByName('Resultado').AsFloat := pResultado;
  cdsValores.Post;
end;

procedure TForm1.btnDividirClick(Sender: TObject);
begin
  edtResultado.Text := floatToStr(Dividir(StrToFloat(edtCampo1.Text), StrToFloat(edtCampo2.Text)));
  AtribuiValoresAoGrid(StrToFloat(edtCampo1.Text), StrToFloat(edtCampo2.Text), StrToFloat(edtResultado.Text));
end;

procedure TForm1.btnMultiplicarClick(Sender: TObject);
begin
  edtResultado.Text := floatToStr(Multiplicar(StrToFloat(edtCampo1.Text), StrToFloat(edtCampo2.Text)));
  AtribuiValoresAoGrid(StrToFloat(edtCampo1.Text), StrToFloat(edtCampo2.Text), StrToFloat(edtResultado.Text));
end;

procedure TForm1.btnSomarClick(Sender: TObject);
begin
  edtResultado.Text := floatToStr(Somar(StrToFloat(edtCampo1.Text), StrToFloat(edtCampo2.Text)));
  AtribuiValoresAoGrid(StrToFloat(edtCampo1.Text), StrToFloat(edtCampo2.Text), StrToFloat(edtResultado.Text));  
end;

procedure TForm1.btnSubtrairClick(Sender: TObject);
begin
  edtResultado.Text := floatToStr(Subtrair(StrToFloat(edtCampo1.Text), StrToFloat(edtCampo2.Text)));
  AtribuiValoresAoGrid(StrToFloat(edtCampo1.Text), StrToFloat(edtCampo2.Text), StrToFloat(edtResultado.Text));
end;

function TForm1.Dividir(pValor1, pValor2: Double): Double;
begin
  if VerificaCampos(pValor1, pValor2) then
  begin
    ShowMessage('Não poderá calcular com valores iguais a zero');
    Exit;
  end;
    Result := pValor1/pValor2;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  cdsValores.Close;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  cdsValores.CreateDataSet;
  cdsValores.Open;
end;

function TForm1.Multiplicar(pValor1, pValor2: Double): Double;
begin
  if VerificaCampos(pValor1, pValor2) then
  begin
    ShowMessage('Não poderá calcular com valores iguais a zero');
    Exit;
  end;
  Result := pValor1*pValor2;
end;

function TForm1.Somar(pValor1, pValor2: Double): Double;
begin
  if VerificaCampos(pValor1, pValor2) then
  begin
    ShowMessage('Não poderá calcular com valores iguais a zero');
    Exit;
  end;
  Result := pValor1+pValor2;
end;

function TForm1.Subtrair(pValor1, pValor2: Double): Double;
begin
  if VerificaCampos(pValor1, pValor2) then
  begin
    ShowMessage('Não poderá calcular com valores iguais a zero');
    Exit;
  end;
  Result := pValor1-pValor2;
end;

function TForm1.VerificaCampos(pValor1, pValor2: Double): Boolean;
begin
  Result := (pValor1 = 0) and (pValor2 = 0);
end;

end.

