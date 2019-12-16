function pintarGrafica(porcentajePasoBajo, porcentajePasoBanda, porcentajePasoAlto, grafica)

% Comprobacion
% porcentajeTotal = porcentajePasoBajo + porcentajePasoBanda + porcentajePasoAlto;
% if porcentajeTotal > 110 || porcentajeTotal < 90
%     error(strcat(['Los porcentajes ', num2str(porcentajePasoBajo,2), num2str(porcentajePasoBanda,2), num2str(porcentajePasoAlto,2), ' no son coherentes']))
% end

% Actualizacion de valores de la grafica
porcentajes = [porcentajePasoBajo porcentajePasoBanda porcentajePasoAlto];
set(grafica, 'ydata', porcentajes);
drawnow;