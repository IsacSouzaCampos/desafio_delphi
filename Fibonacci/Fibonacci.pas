unit Fibonacci;

interface

type
  TIntegerArray = array of Integer;

  TFibonacci = class
    IntegerArray: TIntegerArray;

    function Linear   : TIntegerArray;
    function Recursive(intPosition: Integer): TIntegerArray;
  end;

implementation

{ TFibonacci }

function TFibonacci.Linear: TIntegerArray;
begin

end;

function TFibonacci.Recursive(intPosition: Integer): TIntegerArray;
var
  intAux, intLength: Integer;
begin
  IntegerArray := [];

  if intPosition = 0 then
    begin
      Result[0] := 0;
      Result[1] := 0
    end
  else if intPosition = 1 then
    begin
      SetLength(Result, 2);
      Result[0] := 0;
      Result[1] := 1
    end
  else
    begin
      Result    := Recursive(intPosition - 1);
      intAux    := Result[0];
      Result[0] := Result[1];
      Result[1] := intAux + Result[1];

      intLength := Length(IntegerArray);
      SetLength(IntegerArray, intLength + 1);
      IntegerArray[intLength] := intAux
    end;
end;

end.
