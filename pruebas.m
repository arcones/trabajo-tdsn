%
% Test con segnal grabada
%

%% Inicio
clc;
clear;

[s,Fs] = audioread('piano.wav');

%% Creacion de las entidades necesarias

% Grafica para mostrar las frecuencias
grafica = barh([0 0 0]);
yticklabels({'Frecuencias Bajas','Frecuencias Medias','Frecuencias Altas'})
xlabel('Porcentaje de cada tipo de frecuencia en la segnal')

% Parametros comunes a los filtros
Orden = 10;
Rizado = 1;
Atenuacion = 500;

% Filtro paso alto
WcAlto = 2*3000/Fs;
[BAlto,AAlto] = ellip(Orden,Rizado,Atenuacion,WcAlto,'high');

% Filtro paso banda
Fc1 = 1500*5;
Fc2 = 1500*5;
WnBanda = [Fc1 Fc2]/Fs; 
[BBanda,ABanda] = ellip(Orden,Rizado,Atenuacion,WnBanda,'bandpass');

% Filtro paso bajo
WcBajo = 2*3000/Fs;
[BBajo,ABajo] = ellip(Orden,Rizado,Atenuacion,WcBajo,'low');

%% Prueba
porcentajePasoBajo = hallarPorcentaje(abs(s-filter(BBajo,ABajo,s)) <= 0.01);
porcentajePasoBanda = hallarPorcentaje(abs(s-filter(BBanda,ABanda,s)) <= 0.01);
porcentajePasoAlto = hallarPorcentaje(abs(s-filter(BAlto,AAlto,s)) <= 0.01);

pintarGrafica(porcentajePasoBajo , porcentajePasoBanda, porcentajePasoAlto, grafica);

