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
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Edit1Exit(Sender: TObject);
    procedure FormActivate(Sender: TObject);
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
  I              : Integer;
begin
  ListBox1.Items.Clear;

  if Edit1.Text = '' then
    ShowMessage('Defina uma posição da lista de Fibonacci!')
  else
    begin
      intPosition := StrToInt(Trim(Edit1.Text));

      if intPosition > 0 then
        begin
          if RadioGroup1.ItemIndex = 0 then
            begin
              Fibonacci.Linear(intPosition);
              for I in Fibonacci.IntegerArray do
                ListBox1.Items.Add(IntToStr(I))
            end
          else if RadioGroup1.ItemIndex = 1 then
            begin
              Fibonacci.Recursive(intPosition + 1);
              for I in Fibonacci.IntegerArray do
                ListBox1.Items.Add(IntToStr(I))
            end
          else
            ShowMessage('Escolha o tipo de algoritmo a ser executado!');
        end;
    end;

    Edit1.SetFocus;
end;

procedure TForm1.Edit1Exit(Sender: TObject);
begin
  if Edit1.Text = '' then
    begin
      Label2.Font.Color := clRed;
      Edit1.Color       := clCream;
    end
  else
    begin
      Label2.Font.Color := clWindowText;
      Edit1.Color       := clWindow;
    end;
end;

procedure TForm1.FormActivate(Sender: TObject);
begin
  Form1.Left := (Form1.Monitor.Width  - Form1.Width)  div 2;
  Form1.Top  := (Form1.Monitor.Height - Form1.Height) div 2;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Fibonacci := TFibonacci.Create;
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

end.
