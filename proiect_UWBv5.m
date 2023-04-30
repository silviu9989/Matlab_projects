clear all
clc

I = imread('poza_UWB.jpg');
[linii,col,d3]=size(I);
vector=I(:)/32;
for i=1:length(vector) 
    if vector(i) == 0 
        vector(i)=vector(i)+1; 
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
flux_antena_emisie=mat_lege(vector,:)';
flux_antena_emisie=flux_antena_emisie(:)';

%spectruinitialnezgomotos
tnou=linspace(0,5e-10,64); % f semnal are 2GHz, esantionat cu fs = 128GHz
Fs = 128e9;            % Sampling frequency                    
T = 1/Fs;             % Sampling period       
L = 64000;             % Length of signal
t = (0:L-1)*T;        % Time vector
Y=fft(flux_antena_emisie(64001:128000));
P2 = abs(Y/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);
f = Fs*(0:(L/2)-1)/L;
assignin('base','Pnezgomot',P1(1:end-1));

%canal
flux_antena_emisie=flux_antena_emisie+2*rand(1,length(flux_antena_emisie));
delay=round(3/5*length(flux_antena_emisie));
flux_antena_emisie=flux_antena_emisie+[zeros(1,delay) 1/5*flux_antena_emisie(1:(length(flux_antena_emisie)-delay))];

%spectruv2
tnou=linspace(0,5e-10,64); % f semnal are 2GHz, esantionat cu fs = 128GHz
Fs = 128e9;            % Sampling frequency                    
T = 1/Fs;             % Sampling period       
L = 64000;             % Length of signal
t = (0:L-1)*T;        % Time vector
Y=fft(flux_antena_emisie(64001:128000));
P2 = abs(Y/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);
f = Fs*(0:(L/2)-1)/L;
assignin('base','Pzgomot',P1(1:end-1));
assignin('base','faux',f);

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
%     if maxim < 0.5
%         vector_receptie(i,1)=0;
%     else
        maxim=max(flux_aux(i,:));
        test2=abs(maxim-2);
        test1=abs(maxim-1);
        if test1 < test2
            vector_receptie(i,1)=2*steag-1;  
        else
            vector_receptie(i,1)=2*steag;
        end
    end
% end

vector_receptie=vector_receptie*32;
vector_receptie=cast(vector_receptie,'uint8');

J=reshape(vector_receptie,[linii,col,d3]); %J este imaginea la receptie
