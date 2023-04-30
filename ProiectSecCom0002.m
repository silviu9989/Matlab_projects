clear all
close all
clc
%y^2===x^3-3x+b
p=vpi('115792089210356248762697446949407573530086143415290314195533631308867097853951');
b=vpi('41058363725152142129326129780047268409114441015993725554835256314039467401291');
Gx=vpi('48439561293906451759052585252797914202762949526041747995844080717082404635286');
Gy=vpi('36134250956749795798585127919587881956611106672985015071877198253568414405109');

[k1,Q1x,Q1y]=ECPM_cu_cheie(Gx,Gy,p); %user1
[k2,R1x,R1y]=ECPM_cu_cheie(Q1x,Q1y,p); %user2
[Q2x,Q2y]=ECPM_fara_cheie(Gx,Gy,k2,p); %aplicarea userului 2 a cheii publice a lui user1
[R2x,R2y]=ECPM_fara_cheie(Q2x,Q2y,k1,p); %aplicarea userului 1 a cheii publice a lui user2

function rez = mod(numar,baza)
[~,rez]=quotient(numar,baza);
while rez<0
    rez=rez+baza;
end
end

function [REZx,REZy] = add_point(INPUT1x,INPUT1y,INPUT2x,INPUT2y,modulobase)
if ((INPUT1x == INPUT2x) && (INPUT1y == INPUT2y))
    m=mod((3*INPUT1x*INPUT1x-3)*minv(2,modulobase)*minv(INPUT1y,modulobase),modulobase);
else
    m = mod((INPUT2y-INPUT1y)*minv(INPUT2x-INPUT1x,modulobase),modulobase);
end
REZx = mod( -INPUT1x - INPUT2x + m^2,modulobase);
REZy = mod(- INPUT1y + m*(INPUT1x - REZx),modulobase);
end

function [k1,Qx,Qy] = ECPM_cu_cheie(Px,Py,modulobase)
vec=unique(round(252*rand(1,5))+2);
while length(vec)< 5 
    vec=unique(round(253*rand(1,5))+1);
end
vec(6)=0;
vec(7)=255;
k1=sum(vpi(2).^vec);
[auxX,auxY]=add_point(Px,Py,Px,Py,modulobase);
aux(1,1)=Px;
aux(1,2)=Py;
contor=2;
for i=1:255
    [auxX,auxY]=add_point(auxX,auxY,auxX,auxY,modulobase);
    if sum(find(vec==i)) ~= 0
        aux(contor,1)=auxX;
        aux(contor,2)=auxY;
        contor=contor+1;
    end    
end
auxX=aux(1,1);
auxY=aux(1,2);
for i=2:7
    [auxX,auxY]=add_point(auxX,auxY,aux(i,1),aux(i,2),modulobase);
end
Qx=auxX;
Qy=auxY;
end

function [Qx,Qy] = ECPM_fara_cheie(Px,Py,key,modulobase)

contor=0;
for i=255:-1:0
    [Quot,rest]=quotient(key,vpi(2)^i);
    if Quot == 1
        contor=contor+1;
        vec(contor)=i;
        key=rest;
    end
end
[auxX,auxY]=add_point(Px,Py,Px,Py,modulobase);
aux(1,1)=Px;
aux(1,2)=Py;
contor=2;
for i=1:255
    [auxX,auxY]=add_point(auxX,auxY,auxX,auxY,modulobase);
    if sum(find(vec==i)) ~= 0
        aux(contor,1)=auxX;
        aux(contor,2)=auxY;
        contor=contor+1;
    end 
end
auxX=aux(1,1);
auxY=aux(1,2);
for i=2:7
    [auxX,auxY]=add_point(auxX,auxY,aux(i,1),aux(i,2),modulobase);
end
Qx=auxX;
Qy=auxY;
end