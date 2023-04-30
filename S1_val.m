function [output] = S1_val(input)
S1=[14,4,13,1,2,15,11,8,3,10,6,12,5,9,0,7;0,15,7,4,14,2,13,1,10,6,12,11,9,5,3,8;4,1,14,8,13,6,2,11,15,12,9,7,3,10,5,0;15,12,8,2,4,9,1,7,5,11,3,14,10,0,6,13];
linie=2*str2num(input(1))+str2num(input(6))+1;
coloana=8*str2num(input(2))+4*str2num(input(3))+2*str2num(input(4))+str2num(input(5))+1;
output=dec2bin(S1(linie,coloana));
if(length(output)==3)
    output=strcat('0',output);
end

if(length(output)==2)
    output=strcat('00',output);
end
if(length(output)==1)
    output=strcat('000',output);
end
end

