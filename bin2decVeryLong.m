function decNum=bin2decVeryLong(biNum)
biVect=biNum(:)';
binSiz=max(size(biVect));
baseN=vpi(2);
binare= power(baseN,[0:binSiz-1]);
binare=binare(end:-1:1);
selct=(biVect=='1');
decNum=sum(binare(selct'));
end
