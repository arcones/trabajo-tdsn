%
% Test con segnal grabada
%

%% Inicio
clc;
clear;

[s,Fs] = audioread('piano.wav');

%% Creacion de las entidades necesarias

% Grafica para mostrar las frecuencias
grafica = crearGrafica();

% Creacion filtros
[BAlto,AAlto,BBanda,ABanda,BBajo,ABajo] = crearFiltros(Fs);

%% Prueba
porcentajePasoBajo = hallarPorcentaje(abs(s-filter(BBajo,ABajo,s)) <= 0.01);
porcentajePasoBanda = hallarPorcentaje(abs(s-filter(BBanda,ABanda,s)) <= 0.01);
porcentajePasoAlto = hallarPorcentaje(abs(s-filter(BAlto,AAlto,s)) <= 0.01);

pintarGrafica(porcentajePasoBajo , porcentajePasoBanda, porcentajePasoAlto, grafica);

