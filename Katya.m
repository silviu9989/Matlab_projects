n=17;
beginFreq=300/(Fs/2);
endFreq=4000/(Fs/2);
[b,a]=butter(n, [beginFreq, endFreq], 'bandpass');
[H,W]=freqz(b,a,n);
plot(20*log10(abs(H)));