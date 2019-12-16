function [BAlto,AAlto,BBanda,ABanda,BBajo,ABajo] = crearFiltros(Fs)

% Parametros comunes a los filtros
Orden = 10;
Rizado = 1;
Atenuacion = 500;

% Filtro paso alto
WcAlto = 2*3000/Fs;
[BAlto,AAlto] = ellip(Orden,Rizado,Atenuacion,WcAlto,'high');

% Filtro paso banda
Fc1 = 4000*5;
Fc2 = 5000*5;
WnBanda = [Fc1 Fc2]/Fs; 
[BBanda,ABanda] = ellip(Orden,Rizado,Atenuacion,WnBanda,'bandpass');

% Filtro paso bajo
WcBajo = 2*3000/Fs;
[BBajo,ABajo] = ellip(Orden,Rizado,Atenuacion,WcBajo,'low');

