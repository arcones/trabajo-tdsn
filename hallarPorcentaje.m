function [porcentaje] = hallarPorcentaje(segnal, segnalFiltrada)

energiaSegnal = sum(segnal.^2);
energiaSegnalFiltrada = sum(segnalFiltrada.^2);

porcentaje = (energiaSegnalFiltrada/energiaSegnal)*100;

if porcentaje > 100
    error("El porcentaje del filtro no es coherente");
end

end