unit random_array;

interface

type int_array = array of integer;

function rand(lower, upper: integer): integer;
procedure gen_random_array(lower, upper, size: integer; var ar: int_array);

implementation
uses crt;

function rand(lower, upper: integer): integer;
begin
    rand := Random(upper - lower) + lower;
end;

procedure gen_random_array(lower, upper, size: integer; var ar: int_array);
var
    i: integer;
begin
    setlength(ar, size);
    Randomize;
    for i := 0 to size - 1 do
    begin
        ar[i] := rand(lower, upper);
    end;
end;

end.