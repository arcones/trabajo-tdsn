%
% Test con segnal grabada
%

%% Inicio
clc;
clear;

%% Grafica para mostrar las frecuencias
grafica = barh([0 0 0]);
yticklabels({'Frecuencias Bajas','Frecuencias Medias','Frecuencias Altas'})
xlabel('Porcentaje de cada tipo de frecuencia en la segnal')

%% Prueba 1
[s,Fs] = audioread('piano.wav');
medirSegnal(1,s,Fs,grafica);

%% Prueba 2
[s,Fs] = audioread('dave.wav');
medirSegnal(1,s,Fs,grafica);

%% Prueba 3
[s,Fs] = audioread('noimporta.wav');
medirSegnal(1,s,Fs,grafica);

%% Prueba 4
[s,Fs] = audioread('jack.wav');
medirSegnal(1,s,Fs,grafica);

