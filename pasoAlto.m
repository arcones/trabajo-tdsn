function [pasa] = pasoAlto(s,Fs)

pasoAlto = highpass(s,150,Fs);
    
pasa = abs(pasoAlto-s) <= 0.01;