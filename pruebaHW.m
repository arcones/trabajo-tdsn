% Programa para probar Data Adquisition Toolbox Package
% con directsound

% Hardware disponible
v=daq.getVendors;

% Dispositivos disponibles
d=daq.getDevices;

% Se crea una sesión
s=daq.createSession('directsound');

% Se añade un canal de salida
sa=addAudioOutputChannel(s, 'Audio3', 1,'Audio');

% Se añade un canal de entrada
ea=addAudioInputChannel(s, 'Audio1', 1,'Audio');
