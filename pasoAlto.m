function [pasa] = pasoAlto(s,Fs)

pasoAlto = highpass(s,450,Fs);
    
pasa = abs(pasoAlto-s) <= 0.01;