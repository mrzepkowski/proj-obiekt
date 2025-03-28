unit bubble_sort;

interface

procedure sort_array(var ar: array of integer);

implementation
uses crt;

procedure sort_array(var ar: array of integer);
var
    size, i, j, buf: integer;
begin
    size := high(ar) - low(ar) + 1;
    for i := 0 to size - 1 do
    begin
        for j :=  i + 1 to size - 1 do
        begin
            if ar[j] < ar[i] then
            begin
                buf := ar[i];
                ar[i] := ar[j];
                ar[j] := buf;
            end;
        end;
    end;
end;

end.