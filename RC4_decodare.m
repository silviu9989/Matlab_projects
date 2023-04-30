clc
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
imagine_initiala=im_canal;

binary_sentence=imagine_initiala(:)';
binary_sentence=dec2bin(binary_sentence)';
binary_sentence=binary_sentence(:)';

[l,c,d3]=size(imagine_initiala);
for k=1:l*c*d3
  i=mod(i,256)+1;
  j=mod(j+S(i)-1,256)+1;
  aux=S(i);
  S(i)=S(j);
  S(j)=aux;
  K=S(mod(S(i)+S(j),256)+1);
  binary_sentence(1+(k-1)*8:1:k*8)=functia_silviu(binary_sentence(1+(k-1)*8:1:k*8)+dec2bin(K,8));
end
imagine_finala=reshape(binary_sentence,8,[])';
imagine_finala=bin2dec(imagine_finala);
imagine_finala=uint8(imagine_finala);
imagine_finala=reshape(imagine_finala,l,c,d3);
imshow(imagine_finala);
toc
