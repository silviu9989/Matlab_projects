clear all
close all
clc
t=fopen('fara efect laser.txt','r');
vectorx=zeros(1,110);
vectory=zeros(1,110);
k=0;
while(feof(t)==0)
    k=k+1;
    linie='';
    linie=fgets(t);
    for(i=1:length(linie))
        if(linie(i)==',')
          linie(i)='.';
         end
    end
    for(i=1:length(linie))
        if(linie(i)+0==9)
            nr1=linie(1:i-1);
            nr2=linie(i+1:end);
        end
    end
    vectorx(k)=str2num(nr1);
    vectory(k)=str2num(nr2);
end
figure;
plot(vectorx,vectory);
xlabel('lungime de unda (nm)');
ylabel('intensitate');

% vectorx=[0 5 10 15 20 25 30 35 40 45 50 55 60 65 70 75 80 85 90];
% vectory=[0.158 0.130 0.232 0.408 0.686 1.013 1.233 1.233 1.233 1.233 1.233 1.233 1.233 1.233 1.233 1.233 1.233 1.233 1.233];
% stem(vectorx,vectory);