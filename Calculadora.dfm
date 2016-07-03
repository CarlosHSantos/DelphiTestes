object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 338
  ClientWidth = 419
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 32
    Top = 32
    Width = 105
    Height = 13
    Caption = 'Exemplo de DUnit GUI'
  end
  object Label2: TLabel
    Left = 32
    Top = 64
    Width = 42
    Height = 13
    Caption = 'Campo 1'
  end
  object Label3: TLabel
    Left = 32
    Top = 91
    Width = 42
    Height = 13
    Caption = 'Campo 2'
  end
  object Label4: TLabel
    Left = 26
    Top = 128
    Width = 48
    Height = 13
    Caption = 'Resultado'
  end
  object edtCampo1: TEdit
    Left = 80
    Top = 61
    Width = 121
    Height = 21
    TabOrder = 0
    Text = '20'
  end
  object edtCampo2: TEdit
    Left = 80
    Top = 88
    Width = 121
    Height = 21
    TabOrder = 1
    Text = '5'
  end
  object btnSomar: TButton
    Left = 224
    Top = 59
    Width = 75
    Height = 25
    Caption = 'Somar'
    TabOrder = 2
    OnClick = btnSomarClick
  end
  object btnSubtrair: TButton
    Left = 305
    Top = 59
    Width = 75
    Height = 25
    Caption = 'subtrair'
    TabOrder = 3
    OnClick = btnSubtrairClick
  end
  object btnMultiplicar: TButton
    Left = 224
    Top = 86
    Width = 75
    Height = 25
    Caption = 'Multiplicar'
    TabOrder = 4
    OnClick = btnMultiplicarClick
  end
  object btnDividir: TButton
    Left = 305
    Top = 86
    Width = 75
    Height = 25
    Caption = 'Dividir'
    TabOrder = 5
    OnClick = btnDividirClick
  end
  object edtResultado: TEdit
    Left = 80
    Top = 125
    Width = 121
    Height = 21
    TabOrder = 6
  end
  object dbGridResultados: TDBGrid
    Left = 40
    Top = 176
    Width = 327
    Height = 121
    DataSource = dsValores
    TabOrder = 7
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'Valor1'
        Title.Caption = 'Valor 1'
        Width = 89
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Valor2'
        Title.Caption = 'Valor 2'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Resultado'
        Width = 96
        Visible = True
      end>
  end
  object cdsValores: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 320
    Top = 120
    object cdsValoresValor1: TFloatField
      FieldName = 'Valor1'
    end
    object cdsValoresValor2: TFloatField
      FieldName = 'Valor2'
    end
    object cdsValoresResultado: TFloatField
      FieldName = 'Resultado'
    end
  end
  object dsValores: TDataSource
    DataSet = cdsValores
    Left = 256
    Top = 120
  end
end
