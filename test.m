%
% Test con segnal grabada
%

clear;

[s,Fs] = audioread('piano.wav');
medirSegnal(s,Fs,'piano.wav');
soundsc(s,Fs);