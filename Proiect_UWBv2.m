clear all
clc
I = imread('poza_UWB.jpg');
[linii,col,d3]=size(I);
vector=I(:)/32;
fc = 2E9;  fs=100E9;
tc = gmonopuls('cutoff', fc);
t  = -2*tc : 1/fs : 2*tc;
y = gmonopuls(t,fc);
z0 = zeros(1,64); %forma de unda asociata valorii 0
z1 = -y; %forma de unda asociata valorii 1
z2 = y; %forma de unda asociata valorii 2
aux11 = [z1 z1];
aux12 = [z1 z1 z1];
aux13 = [z1 z1 z1 z1];
aux21 = [z2 z2];
aux22 = [z2 z2 z2];
aux23 = [z2 z2 z2 z2];
z3 = aux11(1:2:end); %forma de unda asociata valorii 3
z4 = aux21(1:2:end); %forma de unda asociata valorii 4
z5 = aux12(1:3:end); %forma de unda asociata valorii 5
z6 = aux22(1:3:end); %forma de unda asociata valorii 6
z7 = aux13(1:4:end); %forma de unda asociata valorii 7
z8 = aux23(1:4:end); %forma de unda asociata valorii 8
%modulatia
mat_lege=[z0; z1; z2; z3; z4; z5; z6; z7; z8];
flux_antena_emisie=mat_lege(vector+1,:)';
flux_antena_emisie=flux_antena_emisie(:)';
%canal
flux_antena_emisie=flux_antena_emisie+-1/2+1/2*rand(1,length(flux_antena_emisie));
delay=3/5*length(flux_antena_emisie);
flux_antena_emisie=flux_antena_emisie+[zeros(1,delay) 1/5*flux_antena_emisie(1:(length(flux_antena_emisie)-delay))];
%receptie
flux_aux=reshape(flux_antena_emisie,64,[])';
vector_receptie=zeros(length(flux_antena_emisie)/64,1);
for i=1:length(flux_antena_emisie)/64
    max=0;
    steag=0;
    for j=2:9
        aux=0;
        R=corrcoef(flux_aux(i,:),mat_lege(j,:));
        aux=R(1,2);
        if aux > max 
            max=aux;
            steag=j;
        end
    end
    if max < 0.6
        vector_receptie(i,1)=0;
    else
        vector_receptie(i,1)=steag-1;
    end
end
vector_receptie=cast(vector_receptie,'uint8');
vector_receptie=vector_receptie*32;
J=reshape(vector_receptie,[linii,col,d3]);