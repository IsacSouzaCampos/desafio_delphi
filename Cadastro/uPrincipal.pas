unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    Edit2: TEdit;
    Label3: TLabel;
    Edit3: TEdit;
    Label4: TLabel;
    Edit4: TEdit;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Button1: TButton;
    Label5: TLabel;
    Edit5: TEdit;
    Button2: TButton;
    procedure Edit1Exit(Sender: TObject);
    procedure Edit2Exit(Sender: TObject);
    procedure Edit3Exit(Sender: TObject);
    procedure Edit5Exit(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

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

procedure TForm1.Edit3Exit(Sender: TObject);
begin
  if Edit3.Text = '' then
    begin
      Label3.Font.Color := clRed;
      Edit3.Color       := clCream;
    end
  else
    begin
      Label3.Font.Color := clWindowText;
      Edit3.Color       := clWindow;
    end;
end;

procedure TForm1.Edit5Exit(Sender: TObject);
begin
  if Edit5.Text = '' then
    begin
      Label5.Font.Color := clRed;
      Edit5.Color       := clCream;
    end
  else
    begin
      Label5.Font.Color := clWindowText;
      Edit5.Color       := clWindow;
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

end.
