% 
% Trabajo Final
% Marta Arcones y Miguel Gonzalez
% 

%% Creacion de variables y filtros fuera de tiempo real

clear, clc

% Datos
Fs = 8000;
L = 800; % Quiero 10 actualizaciones de la grafica cada segundo

% Creacion filtros
[BAlto,AAlto,BBanda,ABanda,BBajo,ABajo] = crearFiltros(Fs);

% Representacion
graficaBarras = crearGraficaBarras();
fftGrafica = crearGraficaFFT();

%% Tiempo real

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
listener2 = addlistener(session, 'DataAvailable', @(src,event) fftContinua(event.Data, Fs, fftGrafica));

% Comienzo de la operacion
startBackground(session);  % Operacion en Background

%% Parar el proceso
stop(session);
close all;
