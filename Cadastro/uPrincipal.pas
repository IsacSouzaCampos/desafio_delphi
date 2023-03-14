unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Mask;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Edit2: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Button1: TButton;
    Label5: TLabel;
    Button2: TButton;
    MaskEdit4: TMaskEdit;
    MaskEdit3: TMaskEdit;
    MaskEdit1: TMaskEdit;
    MaskEdit2: TMaskEdit;
    Edit3: TEdit;
    procedure FormActivate(Sender: TObject);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure Edit2Exit(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure MaskEdit1Exit(Sender: TObject);
    procedure MaskEdit2Exit(Sender: TObject);
    procedure MaskEdit3Exit(Sender: TObject);
    procedure MaskEdit4Exit(Sender: TObject);
  private
    { Private declarations }
    function IsCPFValid(MaskEdit: TMaskEdit): Boolean;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
  if not CharInSet(Key,['A'..'Z', 'a'..'z', #8]) then
    key := #0;
end;

procedure TForm1.FormActivate(Sender: TObject);
begin
  Form1.Left := (Form1.Monitor.Width  - Form1.Width)  div 2;
  Form1.Top  := (Form1.Monitor.Height - Form1.Height) div 2;
end;

procedure TForm1.Edit2Exit(Sender: TObject);
begin
  if Edit2.Text = '' then
    begin
      Label2.Font.Color := clRed;
      Edit2.Color       := clCream;
    end
  else
    begin
      Label2.Font.Color := clWindowText;
      Edit2.Color       := clWindow;
    end;
end;

procedure TForm1.MaskEdit1Exit(Sender: TObject);
begin
  if not IsCPFValid(MaskEdit1) then
    begin
      Label1.Caption    := '*CPF (inválido)';
      Label1.Font.Color := clRed;
      MaskEdit1.Color   := clCream;
    end
  else
    begin
      Label1.Caption    := '*CPF';
      Label1.Font.Color := clWindowText;
      MaskEdit1.Color   := clWindow;
    end;
end;

procedure TForm1.MaskEdit2Exit(Sender: TObject);
var
  strAux: String;
begin
  strAux := StringReplace(MaskEdit2.Text, ' ', '', [rfReplaceAll]);

  if strAux = '' then
    begin
      Label3.Font.Color := clRed;
      MaskEdit2.Color   := clCream;
    end
  else
    begin
      Label3.Font.Color := clWindowText;
      MaskEdit2.Color   := clWindow;
    end;
end;

procedure TForm1.MaskEdit3Exit(Sender: TObject);
begin
  if MaskEdit3.Text = '' then
    begin
      Label5.Font.Color := clRed;
      MaskEdit3.Color   := clCream;
    end
  else
    begin
      Label5.Font.Color := clWindowText;
      MaskEdit3.Color   := clWindow;
    end;
end;

procedure TForm1.MaskEdit4Exit(Sender: TObject);
begin
  if not IsCPFValid(MaskEdit4) then
    begin
      Label5.Caption    := '*CPF (inválido)';
      Label5.Font.Color := clRed;
      MaskEdit4.Color   := clCream;
    end
  else
    begin
      Label5.Caption    := '*CPF';
      Label5.Font.Color := clWindowText;
      MaskEdit4.Color   := clWindow;
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

function TForm1.IsCPFValid(MaskEdit: TMaskEdit): Boolean;
var
  strCPF: String;
  intSum: Integer;
  I     : Integer;
  arrCPF: Array[1..11] of Integer;
begin
  Result := True;

  intSum := 0;
  strCPF := MaskEdit.Text;
  strCPF := StringReplace(strCPF, '.', '', [rfReplaceAll]);
  strCPF := StringReplace(strCPF, '-', '', [rfReplaceAll]);
  strCPF := StringReplace(strCPF, ' ', '', [rfReplaceAll]);

  if strCPF <> '' then
    begin
      for I := 1 to Length(strCPF) do
        begin
          arrCPF[I] := StrToInt(strCPF[I]);
        end;


      for I := 1 to 9 do
        intSum := intSum + (arrCPF[I] * (11 - I));

      intSum := (intSum * 10) mod 11;
      if intSum in [10, 11] then
        intSum := 0;

      if intSum <> arrCPF[10] then
        Result := False;

      if Result then
        begin
          intSum := 0;
          for I := 1 to 10 do
            intSum := intSum + (arrCPF[I] * (12 - I));

          intSum := (intSum * 10) mod 11;
          if intSum in [10, 11] then
            intSum := 0;

          if intSum <> arrCPF[11] then
            Result := False;
        end;
    end
  else
    Result := False;
end;

end.
