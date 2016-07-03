unit TestCalculadora;
{

  Delphi DUnit Test Case
  ----------------------
  This unit contains a skeleton test case class generated by the Test Case Wizard.
  Modify the generated code to correctly setup and call the methods from the unit
  being tested.

}

interface

uses
  TestFramework, Vcl.Forms, Vcl.Graphics, Vcl.StdCtrls, Winapi.Windows,
  System.Variants, Vcl.Dialogs, Vcl.Controls, Calculadora, Winapi.Messages,
  System.Classes;

type
  // Test methods for class TForm1

  TestTForm1 = class(TTestCase)
  strict private
    FForm1: TForm1;
  public
    Valor1, Valor2: Double;
    procedure SetUp; override;
    procedure TearDown; override;
  published
    procedure TestbtnSomarClick;
    procedure TestbtnSubtrairClick;
    procedure TestbtnMultiplicarClick;
    procedure TestbtnDividirClick;
    procedure TestSomar;
    procedure TestSubtrair;
    procedure TestMultiplicar;
    procedure TestDividir;

    procedure TestValidarValoresZerados;
    procedure TestValidarResultadoNaGrid;
    procedure TestValidarQtdeResultadoNoClientDataSet;
  end;

implementation

uses
  System.SysUtils;

procedure TestTForm1.SetUp;
begin
  FForm1 := TForm1.Create(nil);
  Valor1 := 20;
  Valor2 := 5;
end;

procedure TestTForm1.TearDown;
begin
  FForm1.Free;
  FForm1 := nil;
end;

procedure TestTForm1.TestbtnSomarClick;
var
  Sender: TObject;
begin
  // TODO: Setup method call parameters
  FForm1.btnSomarClick(Sender);
  // TODO: Validate method results

  CheckEquals((Valor1 + Valor2), StrToFloat(FForm1.edtResultado.Text));
end;

procedure TestTForm1.TestbtnSubtrairClick;
var
  Sender: TObject;
begin
  // TODO: Setup method call parameters
  FForm1.btnSubtrairClick(Sender);
  // TODO: Validate method results
  CheckEquals((Valor1 - Valor2), StrToFloat(FForm1.edtResultado.Text));
end;

procedure TestTForm1.TestbtnMultiplicarClick;
var
  Sender: TObject;
begin
  // TODO: Setup method call parameters
  FForm1.btnMultiplicarClick(Sender);
  // TODO: Validate method results
  CheckEquals((Valor1 * Valor2), StrToFloat(FForm1.edtResultado.Text));
end;

procedure TestTForm1.TestbtnDividirClick;
var
  Sender: TObject;
begin
  // TODO: Setup method call parameters
  FForm1.btnDividirClick(Sender);
  // TODO: Validate method results
  CheckEquals((Valor1 / Valor2), StrToFloat(FForm1.edtResultado.Text));
end;

procedure TestTForm1.TestSomar;
var
  ReturnValue: Double;
begin
  // TODO: Setup method call parameters
  ReturnValue := FForm1.Somar(Valor1, Valor2);
  // TODO: Validate method results
  CheckEquals((Valor1 + Valor2), ReturnValue);
end;

procedure TestTForm1.TestSubtrair;
var
  ReturnValue: Double;
begin
  // TODO: Setup method call parameters
  ReturnValue := FForm1.Subtrair(Valor1, Valor2);
  // TODO: Validate method results
  CheckEquals((Valor1 - Valor2), ReturnValue);
end;

procedure TestTForm1.TestValidarResultadoNaGrid;
var
  Sender: TObject;
begin
  FForm1.btnSomarClick(Sender);
  if FForm1.dbGridResultados.Columns[2].FieldName = 'Resultado' then
    CheckEquals((Valor1 + Valor2), FForm1.dbGridResultados.Columns[2].Field.AsFloat);
end;

procedure TestTForm1.TestValidarQtdeResultadoNoClientDataSet;
var
  Sender: TObject;
begin
  FForm1.btnSomarClick(Sender);
  FForm1.btnSubtrairClick(Sender);
  FForm1.btnMultiplicarClick(Sender);
  FForm1.btnDividirClick(Sender);
  CheckEquals(4, FForm1.cdsValores.RecordCount, 'Era esperado retornar 4 registros no ClientDataSet');
end;

procedure TestTForm1.TestValidarValoresZerados;
begin
  Valor1 := 0;
  Valor2 := 0;

  Check(FForm1.VerificaCampos(Valor1, Valor2), 'os parametros valor 1 e valor 2 devem estar zerados.');
end;

procedure TestTForm1.TestMultiplicar;
var
  ReturnValue: Double;
begin
  // TODO: Setup method call parameters
  ReturnValue := FForm1.Multiplicar(Valor1, Valor2);
  // TODO: Validate method results
  CheckEquals((Valor1 * Valor2), ReturnValue);
end;

procedure TestTForm1.TestDividir;
var
  ReturnValue: Double;
begin
  // TODO: Setup method call parameters
  ReturnValue := FForm1.Dividir(Valor1, Valor2);
  // TODO: Validate method results
  CheckEquals((Valor1 / Valor2), ReturnValue);
end;

initialization

// Register any test cases with the test runner
RegisterTest(TestTForm1.Suite);

end.