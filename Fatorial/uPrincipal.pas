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
  Fatorial;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    Edit2: TEdit;
    Button1: TButton;
    RadioGroup1: TRadioGroup;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Edit1Exit(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
    Fatorial: TFatorial;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  intValue: Integer;
begin
  if Edit1.Text = '' then
    ShowMessage('Informe um valor a ser calculado!')
  else
    begin
      try
        intValue   := StrToInt(Trim(Edit1.Text));
      except
        ShowMessage('Insira um valor v�lido!');
        Edit1.SetFocus;
        Exit
      end;

      if intValue < 0 then
        begin
          Edit2.Text := '';
          ShowMessage('O valor informado deve ser positivo!');
        end
      else if intValue > 20 then
        begin
          Edit2.Text := '';
          ShowMessage('O resultado do valor informado � muito grande e ' +
                    'n�o pode ser computado. Escolha um valor at� 20!');
        end
      else
        begin
          if intValue = 0 then
            Edit2.Text := '1'
          else if RadioGroup1.ItemIndex = 0 then
            Edit2.Text := IntToStr(Fatorial.Linear(intValue))
          else if RadioGroup1.ItemIndex = 1 then
            Edit2.Text := IntToStr(Fatorial.Recursive(intValue))
          else
            ShowMessage('Defina o algoritmo a ser usado!');
        end;
    end;

  Edit1.SetFocus;
end;

procedure TForm1.Edit1Exit(Sender: TObject);
begin
  if Edit1.Text = '' then
    begin
      Label1.Font.Color := clRed;
      Edit1.Color       := clCream;
    end
  else
    begin
      Label1.Font.Color := clWindowText;
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
  Fatorial := TFatorial.Create;
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
