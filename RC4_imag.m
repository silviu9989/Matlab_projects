clc
%clear all
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
j=0;
for i=0:255
   j=mod(j+S(i+1)+key(mod(i,length(key))+1),256);
   aux=S(i+1);
   S(i+1)=S(j+1);
   S(j+1)=aux;
end

i=0;
j=0;
imagine_initiala=imread('C:\Users\Maftei Silviu\Desktop\maliketh-the-black-blade-elden-ring.jpg');

%binary_sentence=imagine_initiala(:)';
binary_sentence=vadim(:)';
binary_sentence=dec2bin(binary_sentence)';
binary_sentence=binary_sentence(:)';

[l,c,d3]=size(imagine_initiala);
for k=1:l*c*d3
  i=mod(i+1,256);
  j=mod(j+S(i+1),256);
  aux=S(i+1);
  S(i+1)=S(j+1);
  S(j+1)=aux;
  K=S(mod(S(i+1)+S(j+1),256)+1);
  binary_sentence(1+(k-1)*8:1:k*8)=functia_silviu(binary_sentence(1+(k-1)*8:1:k*8)+dec2bin(K,8));
end
im_canal=reshape(binary_sentence,8,[])';
im_canal=bin2dec(im_canal);
im_canal=uint8(im_canal);
im_canal=reshape(im_canal,l,c,d3);
imshow(im_canal);
toc
%decodare
