function [pasa] = pasoBanda(s,Fs)

pasoBanda = bandpass(s,[150 450],Fs);
    
pasa = abs(pasoBanda-s) <= 0.01;