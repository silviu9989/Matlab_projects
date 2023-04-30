input1=dec2bin(round(rand(1,256)))';
close all
clc
input1=dec2bin(round(rand(1,256)))';
input2=dec2bin(round(rand(1,256)))';
p='1111111111111111111111111111111100000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111';
produs=prod_mod_256(input1,input2,p)
function [sumafinala] = suma_nemod_256(input1,input2)
sumafinala=dec2bin(0,256);
carry=0;
for i=256:-1:1
   aux=input1(i)+input2(i)+carry-96;
   if aux==0
       sumafinala(i)='0';
       carry=0;
   elseif aux==1
       sumafinala(i)='1';
       carry=0;
   elseif aux==2
       sumafinala(i)='0';
       carry=1;
   elseif aux==3
       sumafinala(i)='1';
       carry=1;
   end
end
if carry==1
    sumafinala=strcat('1',sumafinala);
end
end

function [diffinala,steag] = dif_nemod_256(input1,input2)
diffinala=dec2bin(0,256);
carry=0;
steag=0;
for i=256:-1:1
   aux=input1(i)-input2(i);
   if ((aux==0) && (carry == 0))
       diffinala(i)='0';
       carry=0;
   elseif ((aux==0) && (carry == 1))
       diffinala(i)='1';
       carry=1;
   elseif ((aux==1) && (carry == 0))
       diffinala(i)='1';
       carry=0;
   elseif ((aux==1) && (carry == 1))
       diffinala(i)='0';
       carry=0;
   elseif ((aux==-1) && (carry == 0))
       diffinala(i)='1';
       carry=1;
   elseif ((aux==-1) && (carry == 1))
       diffinala(i)='0';
       carry=1;
   end
end
if carry == 1
    steag=1; %peste ordin
    diffinala=dec2bin(0,256);
end
end

function [rez] = modulo(input1,input2)
[aux,steag]=dif_nemod_256(input1,input2);
rez=input1;
while(steag ~= 1)
    rez=aux;
    [aux,steag]=dif_nemod_256(rez,input2);
end
end

function [rez] = suma_mod(input1,input2,input3)
input1=modulo(input1,input3);
input2=modulo(input2,input3);
rez=suma_nemod_256(input1,input2);
if length(rez) == 256 
    rez=modulo(rez,input3);
else  
    rez1=modulo(rez(2:end),input3);
    rez2=dec2bin(0,256);
    for i=1:256 rez2(i)='1';end
    rez2=modulo(rez2,input3);
    aux=dec2bin(1,256);
    rez2=suma_nemod_256(aux,rez2);
    rez2=modulo(rez2,input3);
    rez=modulo(suma_nemod_256(rez1,rez2),input3);
end
end

function [rez] = prod_mod_256(input1, input2, input3)
input1=modulo(input1,input3);
input2=modulo(input2,input3);
mat=zeros(256,1);
mat=dec2bin(mat,511);
for i=256:-1:1
    if input2(i) == '1'
       mat(256-i+1,i:i+255)=input1;
    end
end
k=1;
contor=0;
rezultatmare=dec2bin(0,511);
aux=0;
for i=511:-1:1
    for j=1:256
        aux=aux+str2num(mat(j,i));
    end
    aux=aux+contor;
    rezultatmare(i)=num2str(mod(aux,2));
    contor=floor(aux/2);
    aux=0;
end
if contor ~= 0
    rezultatmare=strcat(dec2bin(contor),rezultatmare);
end
    
end
