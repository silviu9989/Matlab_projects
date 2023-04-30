%clc
tic
fid2=fopen('C:\Users\Maftei Silviu\Desktop\fisier_licenta_out.txt');
cypher=fscanf(fid2, '%c');
fclose(fid2);
cypher=vpi(cypher);
cypher=dec2binVeryLong(cypher);
S=zeros(1,256);
for i=1:256
    S(i)=i-1;
end

kbin=cypher;
kbin2=kbin(1:1:floor(length(kbin)/8)*8);
kbin3=reshape(kbin2,8,[]);
kbin3=kbin3';
key=bin2dec(kbin3)';
j=1;
for i=1:256
   j=mod(j-1+S(i)+key(1+mod(i-1,length(key))),256);
   aux=S(i);
   S(i)=S(j);
   S(j)=aux;
end

i=1;
j=1;
fid1=fopen('C:\Users\Maftei Silviu\Desktop\source.txt');
sentence=fscanf(fid1, '%c');
fclose(fid1);
binary_sentence=dec2bin(binary_sentence);
binary_sentence=reshape(binary_sentence', 1, 7*length(binary_sentence));
lprim=length(binary_sentence);
lungime=floor(length(binary_sentence)/8)+1;
binary_sentence(length(binary_sentence):1:8*lungime)='0';
for k=1:lungime
  i=mod(i,256)+1;
  j=mod(j+S(i)-1,256)+1;
  aux=S(i);
  S(i)=S(j);
  S(j)=aux;
  K=S(mod(S(i)+S(j),256)+1);
  binary_sentence(1+(k-1)*8:1:k*8)=functia_silviu(binary_sentence(1+(k-1)*8:1:k*8)+dec2bin(K,8));
end
binary_sentence=binary_sentence(1:lprim);
binary_sentence=(reshape(binary_sentence, 7, []))';
binary_sentence=char(bin2dec(binary_sentence))';
toc
%decodare
