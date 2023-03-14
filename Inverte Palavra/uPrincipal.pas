unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Edit1: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Edit2: TEdit;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Edit1Exit(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  strInverted: String;
  intSize    : Integer;
  I          : Integer;
begin
  if Edit1.Text <> '' then
    begin
      Edit2.Text := '';
      intSize := Length(Edit1.Text);

      for I := intSize downto 0 do
        strInverted := strInverted + Edit1.Text[I];

      Edit2.Text := strInverted;
      Edit1.SetFocus;
    end
  else
    begin
      ShowMessage('Palavra Original não informada. Digite uma palavra/frase' +
                  ' a ser invertida!');
      Edit1.SetFocus;
    end;
end;

procedure TForm1.Edit1Exit(Sender: TObject);
begin
  if Edit1.Text = '' then
    begin
      Label1.Font.Color := clRed;
      Edit1.Color       := clCream
    end
  else
    begin
      Label1.Font.Color := clWindowText;
      Edit1.Color       := clWindow
    end;

  Button1.SetFocus;
end;

procedure TForm1.FormActivate(Sender: TObject);
begin
  Form1.Left := (Form1.Monitor.Width  - Form1.Width)  div 2;
  Form1.Top  := (Form1.Monitor.Height - Form1.Height) div 2;
end;

procedure TForm1.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 13 then
    Perform(Wm_NextDlgCtl, 0, 0);
end;

procedure TForm1.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    Key := #0;
end;

end.
