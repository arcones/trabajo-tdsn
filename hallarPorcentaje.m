function [porcentaje] = hallarPorcentaje(segnal, segnalFiltrada, Fs)

% energiaSegnal = obw(segnal,Fs);
% energiaSegnalFiltrada = obw(segnalFiltrada,Fs);


porcentaje = (segnalFiltrada/segnal)*100;