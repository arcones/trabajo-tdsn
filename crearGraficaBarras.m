function [grafica] = crearGraficaBarras()
figure('Name','Grafico de barras')
grafica = barh([0 0 0]);
yticklabels({'Frecuencias Bajas','Frecuencias Medias','Frecuencias Altas'})
xlabel('Porcentaje de cada tipo de frecuencia en la segnal')
