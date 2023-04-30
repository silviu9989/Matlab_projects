clear all
clc
I = imread('Stalingrad.png');
[linii,col,d3]=size(I);
vector=I(:)/32;
%Iss=reshape(vector,[960,1280,3]);
%imshow(Iss)
flux_binar=reshape(dec2bin(vector)',[1,linii*col*d3*4])-48; %obtinere flux binar
fc = 2E9;  fs=100E9;
tc = gmonopuls('cutoff', fc);
t  = -2*tc : 1/fs : 2*tc;
y = gmonopuls(t,fc);  %forma de unda a bitului de 0
z=-y; %forma de unda a bitului de 1
flux_antena_emisie=(flux_binar'*z)';
flux_antena_emisie=flux_antena_emisie(:);
flux_antena_emisie=flux_antena_emisie'+1/2*rand(1,length(flux_antena_emisie));
%delay=length(3/5*length(flux_antena_emisie));
%flux_antena_emisie=flux_antena_emisie+[zeros(1,delay) 1/5*flux_antena_emisie(delay+1:end)];