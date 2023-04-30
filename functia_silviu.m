function [out] = functia_silviu(in)
for i=1:8
    if mod(in(i),2)==0 out(i)='0';
    else out(i)='1';
    end
end

