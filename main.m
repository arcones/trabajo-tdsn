% 
% Trabajo Final
% Marta Arcones y Miguel Gonzalez
% 

%% Arranque del programa

clear, clc

% Datos
Fs = 44100;
L = 4100; % Quiero 10 actualizaciones de la grafica cada segundo

% Creacion y representacion de los filtros utilizados
figure(1);
[BAlto,AAlto,BBanda,ABanda,BBajo,ABajo] = crearFiltros(Fs);

% Grafico de barras con los porcentajes de frecuencias
figure(2);
graficaBarras = crearGraficaBarras();

% FFT de la segnal y de las segnales filtradas
figure(3);
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

% Tiempo real

% Preparacion de la sesion
session = daq.createSession('directsound');    
addAudioInputChannel(session,'Audio1',1); 
session.Rate = Fs;
session.IsContinuous = true;
session.NotifyWhenDataAvailableExceeds = L;

% Listener 1: Grafico de barras con los porcentajes de frecuencias
listener1 = addlistener(session, 'DataAvailable', @(src,event) pintarGrafica(...
        hallarPorcentaje(event.Data,filter(BBajo,ABajo,event.Data)), ...
        hallarPorcentaje(event.Data,filter(BBanda,ABanda,event.Data)), ...
        hallarPorcentaje(event.Data,filter(BAlto,AAlto,event.Data)), ...
        graficaBarras) ...
    );


% Listener 2: FFT de la segnal y de las segnales filtradas
listener2 = addlistener(session, 'DataAvailable', @(src,event) fftContinua(...
        [event.Data, filter(BBajo,ABajo,event.Data), filter(BBanda,ABanda,event.Data), filter(BAlto,AAlto,event.Data)], ...
        Fs,... 
        graficasFFT...
        )...
);

% Comienzo de la operacion
startBackground(session);  % Operacion en Background

%% Parada del programa
stop(session);
close all;

