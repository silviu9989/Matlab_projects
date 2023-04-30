clear contor i Quot rest
contor=0;
for i=255:-1:0
    [Quot,rest]=quotient(k1,vpi(2)^i);
    if Quot == 1
        contor=contor+1;
        vec2(contor)=i;
        k1=rest;
    end
end