% 
% Trabajo Final
% Marta Arcones y Miguel Gonzalez
% 

%% Creacion de variables y filtros fuera de tiempo real

clear

% Datos
Fs = 44100;
L = 4410; % Quiero 10 actualizaciones de la grafica cada segundo

% Parametros comunes a los filtros
Orden = 10;
Rizado = 1;
Atenuacion = 500;

% Filtro paso alto
WcAlto = 2*6000/Fs;
[BAlto,AAlto] = ellip(Orden,Rizado,Atenuacion,WcAlto,'high');

% Filtro paso banda
Fc1 = 4000*5;
Fc2 = 5000*5;
WnBanda = [Fc1 Fc2]/Fs; 
[BBanda,ABanda] = ellip(Orden,Rizado,Atenuacion,WnBanda,'bandpass');

% Filtro paso bajo
WcBajo = 2*600/Fs;
[BBajo,ABajo] = ellip(Orden,Rizado,Atenuacion,WcBajo,'low');

% Representacion
grafica = barh([0 0 0]);
yticklabels({'Frecuencias Bajas','Frecuencias Medias','Frecuencias Altas'})
xlabel('Porcentaje de cada tipo de frecuencia en la segnal')

%% Tiempo real

% Preparacion de la sesion
session = daq.createSession('directsound');    
addAudioInputChannel(session,'Audio1',1); 
session.Rate = Fs;
session.IsContinuous = true;
session.NotifyWhenDataAvailableExceeds = L;

% Listener
lh = addlistener(session,'DataAvailable',@(src,event) pintarGrafica(hallarPorcentaje(abs(event.Data-filter(BBajo,ABajo,event.Data)) <= 0.01), hallarPorcentaje(abs(event.Data-filter(BBanda,ABanda,event.Data)) <= 0.01), hallarPorcentaje(abs(event.Data-filter(BAlto,AAlto,event.Data)) <= 0.01), grafica));

% Comienzo de la operacion
startBackground(session);  % Operacion en Background

%% Parar el proceso

stop(session);

