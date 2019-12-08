%
% Test con segnal grabada
%

clear;

segnales = dir('./segnales/*.wav');
for segnal = segnales'
    nombreCompleto = strcat('./segnales/',segnal.name);
    [s,Fs] = audioread(nombreCompleto);
    medirSegnal(s,Fs,segnal.name);
    soundsc(s,Fs);
    pause(5);
end
