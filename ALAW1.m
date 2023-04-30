%compandare
close all;

N=512;
fn=1/128;
x=sin(2*pi*fn*(0:N-1));
n=0.1*randn(1,N);

A=87.6;
temp=A*abs(x);
xc=sign(x).*((temp<1).*temp+(temp>=1).*(1+log(temp)))/(1+log(A));
xc(1)=0;

xc2=floor(xc*128);
xc2a=abs(xc2);
xc2b=de2bi(xc2a,8,'left-msb');

SNR1=sum(x.^2);
SNR2=sum(xc.^2);

figure;plot(1:N,x,'r',1:N,xc2/max(xc2),'b');
figure;plot(Xn);
figure;plot(Xn2);