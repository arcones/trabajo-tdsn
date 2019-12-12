function [pasa] = pasoBanda(s,Fs)

Orden=10;
Rizado=1;
Atenuacion=500;
Fc1=4000*5;
Fc2=5000*5;
Wn = [Fc1 Fc2]/Fs; 
[B,A]=ellip(Orden,Rizado,Atenuacion,Wn,'bandpass');

pasoBajo = filter(B,A,s);

pasa = abs(pasoBanda-s) <= 0.01;