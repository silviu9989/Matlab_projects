clc
clear all
tic
%EMISIE
fid2=fopen('C:\Users\Maftei Silviu\Desktop\fisier_licenta_out.txt');
cypher=fscanf(fid2, '%c');
fclose(fid2);
fid1=fopen('C:\Users\Maftei Silviu\Desktop\source.txt');
sentence=fscanf(fid1, '%c');
fclose(fid1);
binary_sentence=dec2bin(sentence);
binary_sentence=reshape(binary_sentence', 1, 7*length(binary_sentence));

%codare
cypher=vpi(cypher);
cypher=dec2binVeryLong(cypher);

if(length(binary_sentence)>length(cypher))
    binary_sentence_coded=char(binary_sentence(1:length(cypher))+cypher-48);
    for i=2:length(binary_sentence)/length(cypher)
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

%binary sentence coded este transmis
binary_sentence_coded_text=(reshape(binary_sentence_coded, 7, length(sentence)))';
binary_sentence_coded_text=char(bin2dec(binary_sentence_coded_text))';

fid2=fopen('C:\Users\Maftei Silviu\Desktop\channel.txt','w+');
fprintf(fid2,'%c', binary_sentence_coded_text);

%decodare

if(length(binary_sentence_coded)>length(cypher))
    binary_sentence_decoded=char(binary_sentence_coded(1:length(cypher))+cypher-48);
    for i=2:length(binary_sentence_coded)/length(cypher)
        aux=char(binary_sentence_coded((i-1)*length(cypher)+1:(i)*length(cypher))+cypher-48);
        binary_sentence_decoded=strcat(binary_sentence_decoded,aux);
    end
    aux=char(binary_sentence_coded(1+i*length(cypher):end)+cypher(1:(length(binary_sentence_coded)-i*length(cypher)))-48);
    binary_sentence_decoded=strcat(binary_sentence_decoded,aux);
end
for i=1:length(binary_sentence_decoded)
if binary_sentence_decoded(i) =='2'
    binary_sentence_decoded(i) ='0';
end
end
binary_sentence_decoded=(reshape(binary_sentence_decoded, 7, length(sentence)))';
binary_sentence_decoded=char(bin2dec(binary_sentence_decoded))';

fclose(fid2);

fid3=fopen('C:\Users\Maftei Silviu\Desktop\receiver.txt','w+');
fprintf(fid3,'%c', binary_sentence_decoded);
fclose(fid3);
%histograma

toc


