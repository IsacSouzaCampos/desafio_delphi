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
  Fibonacci, Vcl.Mask;

type
  TIntegerArray = array of Int64;
  TForm1 = class(TForm)
    ListBox1: TListBox;
    Label1: TLabel;
    Label2: TLabel;
    Button1: TButton;
    RadioGroup1: TRadioGroup;
    MaskPosition: TMaskEdit;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure MaskPositionExit(Sender: TObject);
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
  strAux     : String;
  intPosition: Integer;
  I          : Int64;
begin
  ListBox1.Items.Clear;

  intPosition := 0;
  strAux      := StringReplace(MaskPosition.Text, ' ', '', [rfReplaceAll]);

  if strAux = '' then
    begin
      RadioGroup1.CleanupInstance;
      ShowMessage('Defina uma posição da lista de Fibonacci!');
    end
  else
    intPosition := StrToInt(strAux);

  if intPosition > 93 then
    begin
      RadioGroup1.CleanupInstance;
      ShowMessage('O resultado atingido pelo valor escolhido é muito grande ' +
                  'para ser computado. Escolha um valor até 93.')
    end
  else if intPosition > 0 then
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

    MaskPosition.SetFocus;
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

procedure TForm1.MaskPositionExit(Sender: TObject);
begin
  if MaskPosition.Text = '' then
    begin
      Label2.Font.Color := clRed;
      MaskPosition.Color       := clCream;
    end
  else
    begin
      Label2.Font.Color := clWindowText;
      MaskPosition.Color       := clWindow;
    end;
end;

end.
