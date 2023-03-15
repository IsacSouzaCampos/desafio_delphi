unit Fatorial;

interface

type
  TFatorial = class
    function Linear(intValue   : Integer): Int64;
    function Recursive(intValue: Integer): Int64;
  end;

implementation

{ TFatorial }

function TFatorial.Linear(intValue: Integer): Int64;
var
  I: Integer;
begin
  Result := 1;
  for I := intValue downto 1 do
    Result := Result * I;
end;

function TFatorial.Recursive(intValue: Integer): Int64;
begin
  Result := 1;

  if intValue = 1 then
    Result := 1
  else
    Result := intValue * Recursive(intValue - 1)
end;

end.
