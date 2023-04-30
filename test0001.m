clc
clear all
close all

t='robu nu are mere'
lt=length(t)
v=find(t==' ')
t(v)=[]

for i=1:length(v)
    for j=length(t):-1:v(i)
    t(j+1)=t(j);
    end
    t(v(i))=' ';
end