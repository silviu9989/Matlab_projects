voceamea2=zeros(1,length(voceamea));
for i=1:length(voceamea)
if i<=50000
voceamea2(i)=voceamea(i);
else voceamea2(i)=voceamea(i-50000)*1+voceamea(i)*1.5;
end
end