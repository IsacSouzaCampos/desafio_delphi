unit uPrincipal;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls,
  Vcl.ExtCtrls,
  Fibonacci;

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
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    Fibonacci: TFibonacci;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  intPosition    : Integer;
  strLastValue   : String;
  arrIntegerArray: TIntegerArray;
  I              : Integer;
begin
  ListBox1.Items.Clear;
  intPosition := StrToInt(Trim(Edit1.Text));

  if RadioGroup1.ItemIndex = 0 then
    ShowMessage('Linear')
  else if RadioGroup1.ItemIndex = 1 then
    begin
      if intPosition <> 0 then
        begin
          Fibonacci.Recursive(intPosition + 1);
          for I in Fibonacci.IntegerArray do
            ListBox1.Items.Add(IntToStr(I))
        end;
    end
  else
    ShowMessage('Escolha o tipo de algoritmo a ser executado!');
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Fibonacci := TFibonacci.Create;
end;

end.
