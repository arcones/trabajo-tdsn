function [pasa] = pasoBajo(s,Fs)

pasoBajo = lowpass(s,150,Fs);
    
pasa = abs(s-pasoBajo) <= 0.01;