unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Mask,
  Data.DB, Vcl.Grids, Vcl.DBGrids, uDados, FireDAC.Stan.Param;

type
  TForm1 = class(TForm)
    LabelCPFInput : TLabel;
    LabelName     : TLabel;
    EditName      : TEdit;
    LabelAge      : TLabel;
    LabelPhone    : TLabel;
    PageControl1  : TPageControl;
    TabSheet1     : TTabSheet;
    TabSheet2     : TTabSheet;
    ButtonInsert  : TButton;
    LabelCPFSearch: TLabel;
    ButtonSearch  : TButton;
    MaskCPFSearch : TMaskEdit;
    MaskPhone     : TMaskEdit;
    MaskCPFInput  : TMaskEdit;
    DBGrid1       : TDBGrid;
    MaskAge       : TMaskEdit;
    ButtonShowAll: TButton;

    procedure FormActivate(Sender: TObject);
    procedure EditNameKeyPress(Sender: TObject; var Key: Char);
    procedure EditNameExit(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure MaskCPFInputExit(Sender: TObject);
    procedure MaskCPFSearchExit(Sender: TObject);
    procedure ButtonSearchClick(Sender: TObject);
    procedure ButtonInsertClick(Sender: TObject);
    procedure MaskAgeExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ButtonShowAllClick(Sender: TObject);

  private
    { Private declarations }
    ValidCPFInput : Boolean;
    ValidCPFSearch: Boolean;
    ValidName     : Boolean;
    ValidAge      : Boolean;
    ValidPhone    : Boolean;

    function IsCPFValid(MaskEdit: TMaskEdit): Boolean;
    procedure ClearAll;

  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses
  FireDAC.Comp.Client;

{$R *.dfm}

procedure TForm1.EditNameKeyPress(Sender: TObject; var Key: Char);
begin
  if not CharInSet(Key,['A'..'Z', 'a'..'z', #8, ' ']) then
    key := #0;
end;

procedure TForm1.FormActivate(Sender: TObject);
begin
  Form1.Left := (Form1.Monitor.Width  - Form1.Width)  div 2;
  Form1.Top  := (Form1.Monitor.Height - Form1.Height) div 2;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  ValidCPFInput  := True;
  ValidCPFSearch := True;
  ValidName      := True;
  ValidAge       := True;
  ValidPhone     := True;
end;

procedure TForm1.ButtonInsertClick(Sender: TObject);
var
  FDConnection: TFDConnection;
  strCPF      : String;
  strName     : String;
  intAge      : Integer;
  strPhone    : String;
begin
  if not (ValidCPFInput and ValidName and ValidAge and ValidPhone) then
    begin
      ShowMessage('Certifique-se de que todos os dados são válidos!');
      MaskCPFInput.SetFocus;
    end
  else
    begin
      strCPF   := MaskCPFInput.Text;
      strName  := UpperCase(Trim(EditName.Text));
      intAge   := StrToInt(
                    StringReplace(MaskAge.Text, ' ', '', [rfReplaceAll])
                  );
      strPhone := StringReplace(MaskPhone.Text, ' ', '', [rfReplaceAll]);

      try
        FDConnection := uDados.dmDados.FDConnection;
        FDConnection.ExecSQL('INSERT INTO CADASTRO VALUES (:CPF, :NAME, ' +
                              ':AGE, :PHONE)', [strCPF, strName, intAge,
                              strPhone]);
        ClearAll;
        ShowMessage('Cadastro efetuado com êxito!');
      except
        on E: Exception do
          begin
            ShowMessage('Ocorreu um erro durante o cadastro!');
            ShowMessage(E.ToString);
          end;
      end;
    end;
end;

procedure TForm1.ButtonSearchClick(Sender: TObject);
var
  strCPF: String;
begin
  if not ValidCPFSearch then
    begin
      ShowMessage('Certifique-se de que os dados são válidos!');
      MaskCPFSearch.SetFocus;
    end
  else
    begin
      strCPF := MaskCPFSearch.Text;
      with dmDados.qryBanco do
        begin
          Close;
          Sql.Clear;
          Sql.Add('SELECT * FROM CADASTRO WHERE CPF = :CPF');
          ParamByName('CPF').AsString := strCPF;
          Open;
        end;
    end;
end;

procedure TForm1.ButtonShowAllClick(Sender: TObject);
begin
  with dmDados.qryBanco do
    begin
      Close;
      Sql.Clear;
      Sql.Add('SELECT * FROM CADASTRO');
      Open;
    end;
end;

procedure TForm1.ClearAll;
begin
  MaskCPFInput.Clear;
  EditName.Clear;
  MaskAge.Clear;
  MaskPhone.Clear;
end;

procedure TForm1.EditNameExit(Sender: TObject);
begin
  if EditName.Text = '' then
    begin
      ValidName            := False;
      LabelName.Font.Color := clRed;
      EditName.Color       := clCream;
    end
  else
    begin
      ValidName            := True;
      LabelName.Font.Color := clWindowText;
      EditName.Color       := clWindow;
    end;
end;

procedure TForm1.MaskAgeExit(Sender: TObject);
var
  strAux: String;
begin
  strAux := StringReplace(MaskAge.Text, ' ', '', [rfReplaceAll]);

  if strAux = '' then
    begin
      ValidAge            := False;
      LabelAge.Font.Color := clRed;
      MaskAge.Color       := clCream;
    end
  else
    begin
      ValidAge            := True;
      LabelAge.Font.Color := clWindowText;
      MaskAge.Color       := clWindow;
    end;
end;

procedure TForm1.MaskCPFInputExit(Sender: TObject);
begin
  if not IsCPFValid(MaskCPFInput) then
    begin
      ValidCPFInput            := False;
      LabelCPFInput.Caption    := '*CPF (inválido)';
      LabelCPFInput.Font.Color := clRed;
      MaskCPFInput.Color       := clCream;
    end
  else
    begin
      ValidCPFInput            := True;
      LabelCPFInput.Caption    := '*CPF';
      LabelCPFInput.Font.Color := clWindowText;
      MaskCPFInput.Color       := clWindow;
    end;
end;

procedure TForm1.MaskCPFSearchExit(Sender: TObject);
begin
  if not IsCPFValid(MaskCPFSearch) then
    begin
      ValidCPFSearch            := False;
      LabelCPFSearch.Caption    := '*CPF (inválido)';
      LabelCPFSearch.Font.Color := clRed;
      MaskCPFSearch.Color       := clCream;
    end
  else
    begin
      ValidCPFSearch            := True;
      LabelCPFSearch.Caption    := '*CPF';
      LabelCPFSearch.Font.Color := clWindowText;
      MaskCPFSearch.Color       := clWindow;
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
