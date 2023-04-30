clear all
clc
I = imread('Stalingrad.png');
[linii,col,d3]=size(I);
vector=I(:)/32;
for i=1:length(vector)
    if (vector(i) == 8)
        vector(i)=7;
    end
end

fc = 2E9;  fs=100E9;
tc = gmonopuls('cutoff', fc);
t  = -2*tc : 1/fs : 2*tc;
y = gmonopuls(t,fc);
zaux = -y;
aux1 = [zaux zaux zaux zaux];
aux2 = aux1(1:4:end);
z1=zeros(1,64);
z3=zeros(1,64);
z5=zeros(1,64);
z7=zeros(1,64);
z1(1:16) = aux2(1:16);
z2=2*z1; %forma de unda asociata valorii 2
z3(17:32) = aux2(1:16); %forma de unda asociata valorii 3
z4 = 2*z3; %forma de unda asociata valorii 4
z5(33:48) = aux2(1:16); %forma de unda asociata valorii 5
z6 = 2*z5; %forma de unda asociata valorii 6
z7(49:64) = aux2(1:16); %forma de unda asociata valorii 7
z8 = 2*z7; %forma de unda asociata valorii 8
%modulatia
mat_lege=[z1; z2; z3; z4; z5; z6; z7; z8];
flux_antena_emisie=mat_lege(vector+1,:)';
flux_antena_emisie=flux_antena_emisie(:)';
%canal
flux_antena_emisie=flux_antena_emisie-1/2+1*rand(1,length(flux_antena_emisie));
delay=3/5*length(flux_antena_emisie);
flux_antena_emisie=flux_antena_emisie+[zeros(1,delay) 1/5*flux_antena_emisie(1:(length(flux_antena_emisie)-delay))];
%receptie
mat_lege_2=[z1; z3; z5; z7];
flux_aux=reshape(flux_antena_emisie,64,[])';
vector_receptie=zeros(length(flux_antena_emisie)/64,1);
for i=1:length(flux_antena_emisie)/64
    maxim=0;
    steag=0;
    for j=1:4
        aux=0;
        R=corrcoef(flux_aux(i,:),mat_lege_2(j,:));
        aux=R(1,2);
        if aux > maxim 
            maxim=aux;
            steag=j; %steag imi tine minte cu care dintre liniile matricei e maxima corelatia
        end
    end
    if maxim < 0.5
        vector_receptie(i,1)=0;
    else
        maxim=max(flux_aux(i,:));
        test2=abs(maxim-2);
        test1=abs(maxim-1);
        if test1 < test2
            vector_receptie(i,1)=2*steag-2;  
        else
            vector_receptie(i,1)=2*steag-1;
        end
    end
end
vector_receptie=cast(vector_receptie,'uint8');
vector_receptie=vector_receptie*32;
J=reshape(vector_receptie,[linii,col,d3]); %J este imaginea la receptie