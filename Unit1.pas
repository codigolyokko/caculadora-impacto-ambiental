unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.jpeg,
  Vcl.ExtCtrls, Vcl.Imaging.pngimage;

type
  TForm1 = class(TForm)
    Edit1: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    edtArea: TEdit;
    Label3: TLabel;
    edtAgua: TEdit;
    Label4: TLabel;
    edtFertilizantes: TEdit;
    Label5: TLabel;
    edtPesticidas: TEdit;
    btnCalcularImpacto: TButton;
    lblImpacto: TLabel;
    Panel1: TPanel;
    Image1: TImage;
    Panel2: TPanel;
    procedure btnCalcularImpactoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btnCalcularImpactoClick(Sender: TObject);
var
  area: Double;
  aguaPorM2: Double;
  aguaTotal: Double;
  fertilizantes: Double;
  pesticidas: Double;
  impacto: Double;
  nivel: string;
begin
  area := StrToFloatDef(edtArea.Text, 0);
  aguaPorM2 := StrToFloatDef(edtAgua.Text, 0);
  fertilizantes := StrToFloatDef(edtFertilizantes.Text, 0);
  pesticidas := StrToFloatDef(edtPesticidas.Text, 0);

  aguaTotal := area * aguaPorM2;
  impacto := (aguaTotal / 100) + (fertilizantes * 2) + (pesticidas * 3);

  if impacto < 20 then
    nivel := 'Bajo'
  else if impacto < 50 then
    nivel := 'Medio'
  else
    nivel := 'Alto';

  lblImpacto.Caption := Format('Impacto ambiental: %.2f (%s)', [impacto, nivel]);

  if nivel = 'Bajo' then
    lblImpacto.Font.Color := clGreen
  else if nivel = 'Medio' then
    lblImpacto.Font.Color := clOlive
  else if nivel = 'Alto' then
    lblImpacto.Font.Color := clRed;
end;
end.
