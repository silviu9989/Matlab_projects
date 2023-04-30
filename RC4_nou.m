clc
for i=1:256
    S(i)=i-1;
end
j=0;
for i=1:256
    j=j+S(i)+cypher(i)-48