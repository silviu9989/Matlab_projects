function y = modinv(x,N)
% Computes y such that mod(x*y,N) = 1
if ~isunit(gcd(x, N))
    display('mod inverse does not exist');
    y = NaN;
    return
end
x = mod(x, N);
m = [N vpi(0); x vpi(1)];
i = 2;
while ~isunit(m(i,1))
    r = quotient(m(i-1,1),m(i,1));
    a = minus(m(i-1,1), times(r, m(i,1)));
    b = minus(m(i-1,2), times(r, m(i,2)));
    newrow = [a b];
    m = [m; newrow];
    i = i + 1;
end
    
    y = times(m(end,1), m(end,2));
end