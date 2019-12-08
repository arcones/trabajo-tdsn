% 
% Trabajo Final
% Vumetro
% Marta Arcones y Miguel Gonzalez
% 
clear

% Datos
Fs=8000; % Frecuencia de muestreo
L=400; % Longitud de los bloques de la señal de entrada

% Programación del canal de entrada analógica
s=daq.createSession('directsound');               % Se crea una sesión
ea=addAudioInputChannel(s, 'Audio1', 1,'Audio');  % Se añade un canal de entrada
s.Rate = Fs; % Frecuencia de muestreo
s.IsContinuous=true; % Operation continua
s.NotifyWhenDataAvailableExceeds = L; % Se avisa cuando hay mas de L muestras en la FIFO de entrada

% Listener
lh = addlistener(s,'DataAvailable',@(src,event) medirSegnal(s,Fs));

% Comienzo de la operación
startBackground(s);  % Operación en Background
