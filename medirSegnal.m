function medirSegnal(segnal, Fs, nombreSegnal)

if ~exist('nombreSegnal','var')
  nombreSegnal = 'Segnal en Tiempo Real';
end

% Paso bajo
porcentajePasoBajo = hallarPorcentaje(pasoBajo(segnal, Fs));

% Paso banda
porcentajePasoBanda = hallarPorcentaje(pasoBanda(segnal, Fs));

% Paso alto
porcentajePasoAlto = hallarPorcentaje(pasoAlto(segnal, Fs));

% Grafico de tarta
pie([porcentajePasoBajo, porcentajePasoBanda, porcentajePasoAlto]);
legend('Paso Bajo', 'Paso Banda', 'Paso Alto');
title(strcat(['Distribucion de frecuencias de', ' ',nombreSegnal]));