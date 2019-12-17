function [BAlto,AAlto,BBanda,ABanda,BBajo,ABajo] = crearFiltros(Fs)

% Frecuencias de la voz humana: entre 250Hz y 3000Hz

% Parametros comunes a los filtros
Orden = 6;
Rizado = 1;
Atenuacion = 40;

% Filtro paso bajo
FcBajo = 750;
WcBajo = FcBajo/(Fs/2);
[BBajo,ABajo] = ellip(Orden,Rizado,Atenuacion,WcBajo,'low');

% Filtro paso banda
FcBanda1 = 750;
FcBanda2 = 1750;
WnBanda = [FcBanda1 FcBanda2]/(Fs/2); 
[BBanda,ABanda] = ellip(Orden,Rizado,Atenuacion,WnBanda,'bandpass');

% Filtro paso alto
FcAlto = 1750;
WcAlto = FcAlto/(Fs/2);
[BAlto,AAlto] = ellip(Orden,Rizado,Atenuacion,WcAlto,'high');

% Representacion de los filtros
figure('Name','Filtros')
xlabel('F(Hz)'), ylabel('dB');
title('Filtros')
grid on
representarFiltro(BBajo, ABajo, Fs, 'Paso Bajo')
hold on
representarFiltro(BBanda,ABanda, Fs, 'Paso Banda')
hold on 
representarFiltro(BAlto,AAlto, Fs, 'Paso Alto')
legend ('Paso Bajo','Paso Banda','Paso Alto')
axis([240 3000 -250 20])
hold off



