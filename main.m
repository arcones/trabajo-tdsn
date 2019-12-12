% 
% Trabajo Final
% Marta Arcones y Miguel Gonzalez
% 
clear

% Datos
Fs = 44100; % Frecuencia de muestreo
L = 400; % Longitud de los bloques de la segnal de entrada

% Grafica para mostrar las frecuencias
grafica = barh([0 0 0]);
yticklabels({'Frecuencias Bajas','Frecuencias Medias','Frecuencias Altas'})
xlabel('Porcentaje de cada tipo de frecuencia en la segnal')

session =daq.createSession('directsound');               
addAudioInputChannel(session,'Audio1',1); 
session.Rate = Fs;
session.IsContinuous=true;
session.NotifyWhenDataAvailableExceeds = L; % Se avisa cuando hay mas de L muestras en la FIFO de entrada

% Listener
lh = addlistener(session,'DataAvailable',@(src,event) medirSegnal(session, event.Data, Fs, grafica));

% Comienzo de la operacion
startBackground(session);  % Operacion en Background

%% Para el proceso
stop(session);

