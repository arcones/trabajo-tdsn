function medirSegnal(session, segnal, Fs, grafica)

sound(segnal,Fs)

% Paso bajo
porcentajePasoBajo = hallarPorcentaje(pasoBajo(segnal, Fs));

% Paso banda
%porcentajePasoBanda = hallarPorcentaje(pasoBanda(segnal, Fs));

% Paso alto
%porcentajePasoAlto = hallarPorcentaje(pasoAlto(segnal, Fs));

% Actualizacion de valores de la grafica
porcentajes = [porcentajePasoBajo rand() rand()];
set(grafica, 'ydata', porcentajes); % Updating the plot
drawnow;

sound(segnal,Fs);