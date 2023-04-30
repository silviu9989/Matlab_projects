clear all
clc
fisier=fopen("teme_antene.txt",'r');
text=fread(fisier)';
text_binar=dec2bin(text);
text_binar_matriceal=zeros(length(text_binar),8);
for i=1:length(text)
    for j=1:7
        if text_binar(i,j)=='1'
            text_binar_matriceal(i,j+1)=1;
        end
    end
end

text_binar_flux=reshape(text_binar_matriceal',1,[]);

key=8; %cate coloane se doreste a avea matricea de codare
parametru=mod(key-mod(length(text_binar_flux),key),key);
text_binar_flux=[text_binar_flux zeros(1,parametru)];
text_codat=reshape(text_binar_flux,key,[])';

text_codat_flux=text_codat(:)';
parametru2=mod(8-mod(length(text_codat_flux),8),8);
text_codat_flux=[text_codat_flux zeros(1,parametru2)];
text_codat_matrice=reshape(text_codat_flux',8,[])';
[l,c]=size(text_codat_matrice);


for i=1:l
    for j=1:c
        if text_codat_matrice(i,j) == 1
            text_codat_ascii(i,j)='1';
        else text_codat_ascii(i,j)='0';
        end
    end
end

text_codat_ascii_debug=bin2dec(text_codat_ascii);
text_codat=char(text_codat_ascii_debug)'
P=text_codat+0;
figure
subplot(1,2,1) 
hist(P,256);
subplot(1,2,2) 
hist(text,256);
