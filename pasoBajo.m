function [pasa] = pasoBajo(s,Fs)

Orden=10;
Rizado=1;
Atenuacion=500;
wc=2*600/Fs;
[B,A]=ellip(Orden,Rizado,Atenuacion,wc);

pasoBajo = filter(B,A,s)

pasa = abs(s-pasoBajo) <= 0.01;


