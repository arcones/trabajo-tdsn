% 
% Trabajo Final
% Marta Arcones y Miguel Gonzalez
% 

%% Arranque del programa

% Creacion de variables y filtros fuera de tiempo real

clear, clc
warning('off','all')
% Datos
Fs = 8000;
L = 800; % Quiero 10 actualizaciones de la grafica cada segundo

% Creacion filtros
figure(1)
[BAlto,AAlto,BBanda,ABanda,BBajo,ABajo] = crearFiltros(Fs);

% Representacion
figure(2)
graficaBarras = crearGraficaBarras();

figure(3)
subplot(2,2,1)
fftGrafica = crearGraficaFFT('Paso Todo');
subplot(2,2,2)
fftGraficaBajo = crearGraficaFFT('Paso Bajo');
subplot(2,2,3)
fftGraficaBanda = crearGraficaFFT('Paso Banda');
subplot(2,2,4)
fftGraficaAlto = crearGraficaFFT('Paso Alto');
subplot

% Tiempo real

% Preparacion de la sesion
session = daq.createSession('directsound');    
addAudioInputChannel(session,'Audio1',1); 
session.Rate = Fs;
session.IsContinuous = true;
session.NotifyWhenDataAvailableExceeds = L;

% Listener 1
listener1 = addlistener(...
    session, ...
    'DataAvailable',...
    @(src,event) ...
    pintarGrafica(...
        hallarPorcentaje(abs(event.Data-filter(BBajo,ABajo,event.Data)) <= 0.01), ...
        hallarPorcentaje(abs(event.Data-filter(BBanda,ABanda,event.Data)) <= 0.01), ...
        hallarPorcentaje(abs(event.Data-filter(BAlto,AAlto,event.Data)) <= 0.01), ...
        graficaBarras) ...
    );

% Listener 2
listener2 = addlistener(session, 'DataAvailable', @(src,event) fftContinua(event.Data, ...
        filter(BBajo,ABajo,event.Data), ...
        filter(BBanda,ABanda,event.Data), ...
        filter(BAlto,AAlto,event.Data), ...
        Fs, ...
        fftGrafica, ...
        fftGraficaBajo, ...
        fftGraficaBanda, ...
        fftGraficaAlto ...
        )...
    );

% Comienzo de la operacion
startBackground(session);  % Operacion en Background

%% Parada del programa
stop(session);
close all;

