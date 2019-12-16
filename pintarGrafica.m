function pintarGrafica(porcentajePasoBajo, porcentajePasoBanda, porcentajePasoAlto, grafica)

% Actualizacion de valores de la grafica
porcentajes = [porcentajePasoBajo porcentajePasoBanda porcentajePasoAlto];
set(grafica, 'ydata', porcentajes);
drawnow;