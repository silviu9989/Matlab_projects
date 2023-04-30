lorem='Lorem ipsum doloyzyzyzyzr sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.';
letters=unique(lorem);
letter_counts=histcounts(double(lorem),max(letters)-min(letters)+1);
letter_counts(letter_counts==0)=[];
bar(1:numel(letters),letter_counts)
set(gca,'XTick',1:numel(letters))
set(gca,'XTickLabels',num2cell(letters))