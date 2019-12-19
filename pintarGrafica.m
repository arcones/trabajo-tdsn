function pintarGrafica(porcentajePasoBajo, porcentajePasoBanda, porcentajePasoAlto, grafica)

porcentajes = [porcentajePasoBajo porcentajePasoBanda porcentajePasoAlto];
set(grafica, 'ydata', porcentajes);
drawnow;

end