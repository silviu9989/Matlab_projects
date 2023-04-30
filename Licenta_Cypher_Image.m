clc
%clear all
clear ans aux binary_sentence binary_sentence_coded cypher fid2 i im_canal imagine_initiala
tic
%EMISIE
fid2=fopen('C:\Users\Maftei Silviu\Desktop\fisier_licenta_out.txt');
cypher=fscanf(fid2, '%c');
fclose(fid2);
cypher=vpi(cypher);
cypher=dec2binVeryLong(cypher);
imagine_initiala=imread('C:\Users\Maftei Silviu\Desktop\poza_UWB.jpg');
binary_sentence=imagine_initiala(:)';
binary_sentence=dec2bin(binary_sentence)';
binary_sentence=binary_sentence(:)';

%codare
if(length(binary_sentence)>length(cypher))
    binary_sentence_coded=char(binary_sentence(1:length(cypher))+cypher-48);
    for i=2:(length(binary_sentence)/length(cypher))
        aux=char(binary_sentence((i-1)*length(cypher)+1:(i)*length(cypher))+cypher-48);
        binary_sentence_coded=strcat(binary_sentence_coded,aux);
    end
    aux=char(binary_sentence(1+i*length(cypher):end)+cypher(1:(length(binary_sentence)-i*length(cypher)))-48);
    binary_sentence_coded=strcat(binary_sentence_coded,aux);
end
for i=1:length(binary_sentence_coded)
if binary_sentence_coded(i) =='2'
    binary_sentence_coded(i) ='0';
end
end

im_canal=reshape(binary_sentence_coded,8,[])';
im_canal=bin2dec(im_canal);
im_canal=uint8(im_canal);
im_canal=reshape(im_canal,960,1280,3);
imshow(im_canal);
toc

