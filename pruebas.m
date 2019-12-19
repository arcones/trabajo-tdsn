%
% Test con segnal grabada
%

%% Inicio
close all;
clc;
clear;

[segnal,Fs] = audioread('piano.wav');

% Creacion y representacion de los filtros utilizados
figure('Name','Filtros utilizados','NumberTitle','off');
[BAlto,AAlto,BBanda,ABanda,BBajo,ABajo] = crearFiltros(Fs);

% Grafico de barras con los porcentajes de frecuencias
figure('Name','Grafico de barras','NumberTitle','off');
graficaBarras = crearGraficaBarras();

% FFT de la segnal y de las segnales filtradas
figure('Name','FFT de los filtros','NumberTitle','off');
subplot(2,2,1);
fftGrafica = crearGraficaFFT('Paso Todo');
subplot(2,2,2);
fftGraficaBajo = crearGraficaFFT('Paso Bajo');
subplot(2,2,3);
fftGraficaBanda = crearGraficaFFT('Paso Banda');
subplot(2,2,4);
fftGraficaAlto = crearGraficaFFT('Paso Alto');
subplot;

graficasFFT = [fftGrafica, fftGraficaBajo, fftGraficaBanda, fftGraficaAlto];

%% Prueba Grafico de barras

pintarGrafica(...
    hallarPorcentaje(segnal,filter(BBajo,ABajo,segnal)), ...
    hallarPorcentaje(segnal,filter(BBanda,ABanda,segnal)), ...
    hallarPorcentaje(segnal,filter(BAlto,AAlto,segnal)), ...
    graficaBarras);

%% Prueba FFTs
fftContinua(...
    [segnal, filter(BBajo,ABajo,segnal), filter(BBanda,ABanda,segnal), filter(BAlto,AAlto,segnal)], ...
    Fs,... 
    graficasFFT...
    );

%% Limpieza
close all;
clear;