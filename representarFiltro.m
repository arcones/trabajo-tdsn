function [] = representarFiltro(B,A,Fs,tipo)
[H,F]=freqz(B,A,1000,Fs,'whole');
plot(F,20*log10(abs(H)));