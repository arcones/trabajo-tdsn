function medirSegnal(session, porcentajePasoBajo, porcentajePasoBanda, porcentajePasoAlto, Fs, grafica)

% Actualizacion de valores de la grafica
porcentajes = [porcentajePasoBajo porcentajePasoBanda porcentajePasoAlto];
set(grafica, 'ydata', porcentajes); % Updating the plot
drawnow;