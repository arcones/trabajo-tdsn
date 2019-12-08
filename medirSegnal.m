function medirSegnal(segnal, Fs, nombreSegnal)

if ~exist('nombreSegnal','var')
  nombreSegnal = 'Segnal en Tiempo Real';
end

% Paso bajo
porcentajePasoBajo = hallarPorcentaje(pasoBajo(segnal, Fs));

% Paso alto
porcentajePasoAlto = hallarPorcentaje(pasoAlto(segnal, Fs));

% Comprobacion
total = porcentajePasoAlto + porcentajePasoBajo;
disp(['La suma de los porcentajes es ', num2str(total)]);
condicionError = total < 98 || total > 102;

if condicionError == 1
    error('La suma de los porcentajes es incoherente');
end

% Grafico de tarta
pie([porcentajePasoBajo, porcentajePasoAlto]);
legend('Paso Bajo', 'Paso Alto');
title(strcat(['Distribucion de frecuencias de', ' ',nombreSegnal]));