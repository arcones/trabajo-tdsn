function [grafica] = crearGraficaFFT(tituloGrafica)
%  figure('Name','FFT Continua')

grafica = plot(zeros(3000,1));
set(gca,'Color','k')
title(tituloGrafica,'FontSize',12,'FontWeight','bold','Color','r')
xlabel('Frecuencia','Color','k')
ylabel('|Y(f)|')
grid on
end