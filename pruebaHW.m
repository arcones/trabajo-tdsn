% Programa para probar Data Adquisition Toolbox Package
% con directsound

% Hardware disponible
v=daq.getVendors;

% Dispositivos disponibles
d=daq.getDevices;

% Se crea una sesion
s=daq.createSession('directsound');

% Se agnade un canal de entrada
ea=addAudioInputChannel(s, 'Audio1', 1,'Audio');
