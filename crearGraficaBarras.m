function [grafica] = crearGraficaBarras()
grafica = barh([0 0 0]);
yticklabels({'Frecuencias Bajas','Frecuencias Medias','Frecuencias Altas'})
xlabel('% de cada tipo de frecuencia en la segnal')
title('Porcentaje de energia que se queda en cada filtro')
end