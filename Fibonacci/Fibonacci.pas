unit Fibonacci;

interface

type
  TIntegerArray = array of Int64;

  TFibonacci = class
    IntegerArray: TIntegerArray;

    function Linear(intPosition: Integer)   : TIntegerArray;
    function Recursive(intPosition: Integer): TIntegerArray;
  end;

implementation

{ TFibonacci }

function TFibonacci.Linear(intPosition: Integer): TIntegerArray;
var
  I         : Integer;
  intLength : Integer;
  intPrev1  : Int64;
  intPrev2  : Int64;
  intCurrent: Int64;
begin
  IntegerArray := [];
  SetLength(IntegerArray, 1);

  IntegerArray[0] := 0;

  if intPosition > 1 then
    begin
      SetLength(IntegerArray, 2);
      IntegerArray[1] := 1;
    end;

  intPrev1 := 1;
  intPrev2 := 0;
  for I := 2 to intPosition - 1 do
    begin
      intLength := Length(IntegerArray);
      SetLength(IntegerArray, intLength + 1);

      intCurrent := intPrev1 + intPrev2;
      IntegerArray[intLength] := intCurrent;

      intPrev2 := intPrev1;
      intPrev1 := intCurrent;
    end;
end;

function TFibonacci.Recursive(intPosition: Integer): TIntegerArray;
var
  intLength: Integer;
  intAux   : Int64;
begin
  IntegerArray := [];
  SetLength(IntegerArray, 0);

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
