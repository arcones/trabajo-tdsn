%
% Test con segnal grabada
%

clear;

[s,Fs] = audioread('./segnales/piano.wav');
medirSegnal(s,Fs,'piano.wav');
soundsc(s,Fs);