program main;
uses crt, random_array, bubble_sort;

type int_array = array of integer;

procedure gen_random_array_test(lower, upper, size: integer; var ar: int_array);
var
    i: integer;
begin
    gen_random_array(lower, upper, size, ar);

    if (high(ar) - low(ar) + 1 <> size) then
    begin
        writeln('Wrong size. Expected: ', size, ', received: ', high(ar) - low(ar) + 1);
        Exit;
    end;

    for i := 0 to size - 1 do
    begin
        if (ar[i] < lower) or (ar[i] > upper) then
        begin
            writeln('Random generator issue. Number expected to be between ', lower, ' and ', upper, ' inclusive');
            writeln('Received number: ', ar[i]);
            Exit;
        end;
    end;

    writeln('gen_random_array OK');
end;

procedure sort_array_test(var ar: int_array);
var
    size, i: integer;
begin
    sort_array(ar);
    size := high(ar) - low(ar) + 1;

    for i := 0 to size - 2 do
    begin
        if (ar[i + 1] < ar[i]) then
        begin
            writeln('Array not sorted. ar[', i + 1, '] = ', ar[i + 1], ', ar[', i, '] = ', ar[i]);
            Exit;
        end;
    end;

    writeln('sort_array OK');
end;

const
    lower1 = 0;
    upper1 = 100;
    size1 = 50;
    lower2 = 15;
    upper2 = 175;
    size2 = 123;
    lower3 = 123;
    upper3 = 475;
    size3 = 17;
    lower4 = 333;
    upper4 = 777;
    size4 = 33;
    lower5 = 0;
    upper5 = 1;
    size5 = 20;
var
    ar1, ar2, ar3, ar4, ar5: int_array;
begin
    writeln('Test 1: lower = ', lower1, ', upper = ', upper1, ', size = ', size1);
    gen_random_array_test(lower1, upper1, size1, ar1);
    sort_array_test(ar1);

    writeln('Test 2: lower = ', lower2, ', upper = ', upper2, ', size = ', size2);
    gen_random_array_test(lower2, upper2, size2, ar2);
    sort_array_test(ar2);

    writeln('Test 3: lower = ', lower3, ', upper = ', upper3, ', size = ', size3);
    gen_random_array_test(lower3, upper3, size3, ar3);
    sort_array_test(ar3);

    writeln('Test 4: lower = ', lower4, ', upper = ', upper4, ', size = ', size4);
    gen_random_array_test(lower4, upper4, size4, ar4);
    sort_array_test(ar4);

    writeln('Test 5: lower = ', lower5, ', upper = ', upper5, ', size = ', size5);
    gen_random_array_test(lower5, upper5, size5, ar5);
    sort_array_test(ar5);
end.