%codare
close all;

N=512;
x=sin(2*pi*1/128*(0:N-1));

x2=floor(4096*x);
x2c=abs(x2);
x2b=de2bi(x2c,13,'left-msb');
x2bf=zeros(N,8);
x2bf(:,1)=1-x2b(:,1);
x2bfd=zeros(1,N);
for i=1:N
    ok=0;
    if sum(x2b(i,2:8))==0
        temp=7;
        ok=1;
    else
        temp=find(x2b(i,2:8),1);
    end
    x2bf(i,2:4)=de2bi(8-temp,3,'left-msb');
    if ok==1
        x2bf(i,4)=0;
    end
    x2bf(i,5:8)=x2b(i,temp+2:temp+5);
    x2bfd(i)=bi2de(x2bf(i,:),'left-msb');
end
x2bfd(x2<=0)=-x2bfd(x2<=0);
plot(x2bfd/max(x2bfd));hold on;plot(x,'r');