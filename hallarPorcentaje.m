function [porcentaje] = hallarPorcentaje(segnal, segnalFiltrada, Fs)

energiaSegnal = obw(segnal,Fs);
energiaSegnalFiltrada = obw(segnalFiltrada,Fs);

porcentaje = (energiaSegnalFiltrada/energiaSegnal)*100;