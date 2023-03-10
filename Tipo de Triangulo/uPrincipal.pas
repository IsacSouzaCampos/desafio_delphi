unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Edit1: TEdit;
    Label1: TLabel;
    Edit2: TEdit;
    Label2: TLabel;
    Edit3: TEdit;
    Label3: TLabel;
    Button1: TButton;
    Label4: TLabel;
    procedure Edit1Exit(Sender: TObject);
    procedure Edit2Exit(Sender: TObject);
    procedure Edit3Exit(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    function CheckType(dblSide1, dblSide2, dblSide3: Double): String;
    function IsEqual(dblSide1, dblSide2: Double): Boolean;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  dblSide1, dblSide2, dblSide3: Double;
  strAux                      : String;
begin
  if (Edit1.Text = '') or (Edit2.Text = '') or (Edit3.Text = '') then
    begin
      ShowMessage('Preencha todos os campos referentes aos lados do ' +
                  'triângulo!');
      Edit1.SetFocus;
    end
  else
    begin
      try
        strAux := StringReplace(Trim(Edit1.Text), '.', ',', [rfReplaceAll]);
        dblSide1 := StrToFloat(strAux);

        strAux := StringReplace(Trim(Edit2.Text), '.', ',', [rfReplaceAll]);
        dblSide2 := StrToFloat(strAux);

        strAux := StringReplace(Trim(Edit3.Text), '.', ',', [rfReplaceAll]);
        dblSide3 := StrToFloat(strAux);

        Label4.Caption := CheckType(dblSide1, dblSide2, dblSide3);
      except
        ShowMessage('Erro ao analisar o tipo de triângulo informado.' +
                      ' Verifique se os valores definidos estão corretos!');
        Edit1.SetFocus;
      end;
    end;
end;

procedure TForm1.Edit1Exit(Sender: TObject);
begin
  if Edit1.Text = '' then
    begin
      Label1.Font.Color := clMaroon;
      Edit1.Color       := clCream
    end
  else
    begin
      Label1.Font.Color := clWindowText;
      Edit1.Color       := clWindow
    end;
end;

procedure TForm1.Edit2Exit(Sender: TObject);
begin
  if Edit2.Text = '' then
    begin
      Label2.Font.Color := clMaroon;
      Edit2.Color       := clCream
    end
  else
    begin
      Label2.Font.Color := clWindowText;
      Edit2.Color       := clWindow
    end;
end;

procedure TForm1.Edit3Exit(Sender: TObject);
begin
  if Edit3.Text = '' then
    begin
      Label3.Font.Color := clMaroon;
      Edit3.Color       := clCream
    end
  else
    begin
      Label3.Font.Color := clWindowText;
      Edit3.Color       := clWindow
    end;
end;

procedure TForm1.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then
    Perform(Wm_NextDlgCtl, 0, 0);
end;

procedure TForm1.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
    key := #0;
end;

function TForm1.CheckType(dblSide1, dblSide2, dblSide3: Double): String;
var
  bolEqualSides12: Boolean;
  bolEqualSides13: Boolean;
  bolEqualSides23: Boolean;
begin
  Result := '';

  if ((dblSide1 + dblSide2) <= dblSide3) or
      ((dblSide1 + dblSide3) <= dblSide2) then
      begin
        ShowMessage('Os lados definidos não formam um triângulo válido.' +
                    ' Escolha outros valores!');
        Edit1.SetFocus;
      end
  else
    begin
      bolEqualSides12 := IsEqual(dblSide1, dblSide2);
      bolEqualSides13 := IsEqual(dblSide1, dblSide3);
      bolEqualSides23 := IsEqual(dblSide2, dblSide3);

      if bolEqualSides12 and bolEqualSides23 then
        Result := 'Equilátero'
      else if (bolEqualSides12 or bolEqualSides13 or bolEqualSides23) then
        Result := 'Isósceles'
      else
        Result := 'Escaleno';

      Edit1.SetFocus;
    end;
end;

function TForm1.IsEqual(dblSide1, dblSide2: Double): Boolean;
begin
  Result := Abs(dblSide1 - dblSide2) < 0.000001;
end;

end.
