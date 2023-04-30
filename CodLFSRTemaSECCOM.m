secventa=out.iesire3';
corelatie=xcorr(secventa);
[x1,indice1]=max(corelatie);
[x2,indice2]=max(corelatie((indice1+1):end));
Perioada=indice2;