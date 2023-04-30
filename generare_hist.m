y=zeros(1,128);
for i=1:length(binary_sentence_coded_text)
    y(binary_sentence_coded_text(i)-0+1)=y(binary_sentence_coded_text(i)-0+1)+1;
end