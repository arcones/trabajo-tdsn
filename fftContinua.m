function fftContinua(segnales, Fs, graficas)

if length(segnales) == length(graficas)
    error('Los arrays de segnales y graficas han de tener el mismo tamanyo');
end

for i=1:4
    disp(num2str(i));
    [frecuencia, fftSegnal] = pintarFFT(segnales(:,i), Fs);
    set(graficas(i), 'ydata', fftSegnal, 'xdata', frecuencia);
    drawnow;
end


% 
% 
% [frecuencia, fftSegnal] = pintarFFT(segnal, Fs);
% [frecuencia, fftBajo] = pintarFFT(segnalBajo, Fs);
% [frecuencia, fftBanda] = pintarFFT(segnalBanda, Fs);
% [frecuencia, fftAlto] = pintarFFT(segnalAlto, Fs);
% 
% set(grafica, 'ydata', fftSegnal, 'xdata', frecuencia);
% set(graficaBajo, 'ydata', fftBajo, 'xdata', frecuencia);
% set(graficaBanda, 'ydata', fftBanda, 'xdata', frecuencia);
% set(graficaAlto,  'ydata', fftAlto, 'xdata', frecuencia);
% drawnow;

end