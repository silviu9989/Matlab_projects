function biNum=dec2binVeryLong(decNum)
basN=vpi(2);
outNum=decNum/basN;
biNum=rem(decNum,basN);
while(true)
      if outNum==1 ||  outNum==0
            break;
      end
      biNum(end+1)=rem(outNum,basN);
      outNum=floor(outNum/basN);
      
end
biNum(end+1)=outNum;
biNum=biNum(end:-1:1);
biNum=vpi2bin(biNum)';
end
% [biNum,decNumBack]=dec2binVeryLong(10^301)