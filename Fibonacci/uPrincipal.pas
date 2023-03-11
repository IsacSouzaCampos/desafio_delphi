unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TIntegerArray = array of Integer;
  TForm1 = class(TForm)
    ListBox1: TListBox;
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    Button1: TButton;
    RadioGroup1: TRadioGroup;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function Recursive(intPosition: Integer): TIntegerArray;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  intPosition : Integer;
  strLastValue: String;
begin
  ListBox1.Items.Clear;
  intPosition := StrToInt(Trim(Edit1.Text));

  if RadioGroup1.ItemIndex = 0 then
    ShowMessage('Linear')
  else if RadioGroup1.ItemIndex = 1 then
    begin
      if intPosition <> 0 then
        begin
          strLastValue := IntToStr(Recursive(intPosition)[0]);
          ListBox1.Items.Add(strLastValue)
        end;
    end
  else
    ShowMessage('Escolha o tipo de algoritmo a ser executado!');
end;

function TForm1.Recursive(intPosition: Integer): TIntegerArray;
var
  intTemp: Integer;
begin
  if intPosition = 0 then
    begin
      Result[0] := 0;
      Result[1] := 0
    end
  else if intPosition = 1 then
    begin
      SetLength(Result, 2);
      Result[0] := 0;
      Result[1] := 1
    end
  else
    begin
      Result    := Recursive(intPosition - 1);
      intTemp   := Result[0];
      Result[0] := Result[1];
      Result[1] := intTemp + Result[1];
      ListBox1.Items.Add(IntToStr(intTemp))
    end;
end;

end.
