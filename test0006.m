lorem=binary_sentence;
letters=unique(lorem);
letter_counts=histcounts(double(lorem),max(letters)-min(letters)+1);
letter_counts(letter_counts==0)=[];
bar(1:numel(letters),letter_counts)
set(gca,'XTick',0:numel(letters)-1)
set(gca,'XTickLabels',num2cell(letters))

title('Histograma textului criptat, de 50000 de caractere');
xlabel('Caracter');
ylabel('Numãrul de aparitii');