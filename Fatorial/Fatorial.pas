unit Fatorial;

interface

type
  TFatorial = class
    function Linear(intValue   : Integer): Integer;
    function Recursive(intValue: Integer): Integer;
  end;

implementation

{ TFatorial }

function TFatorial.Linear(intValue: Integer): Integer;
var
  I: Integer;
begin
  Result := 0;
  for I := intValue downto 1 do
    Result := Result + I;
end;

function TFatorial.Recursive(intValue: Integer): Integer;
begin
  Result := 0;

  if intValue = 1 then
    Result := 1
  else
    Result := intValue + Recursive(intValue - 1)
end;

end.
