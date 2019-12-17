function fftContinua(segnal, segnalBajo, segnalBanda, segnalAlto, Fs, grafica, graficaBajo, graficaBanda, graficaAlto)

[gfreq, fftSegnal] = pintarFFT(segnal, Fs);
[gfreq, fftBajo] = pintarFFT(segnalBajo, Fs);
[gfreq, fftBanda] = pintarFFT(segnalBanda, Fs);
[gfreq, fftAlto] = pintarFFT(segnalAlto, Fs);

set(grafica, 'ydata', fftSegnal, 'xdata', gfreq);
set(graficaBajo, 'ydata', fftBajo, 'xdata', gfreq);
set(graficaBanda, 'ydata', fftBanda, 'xdata', gfreq);
set(graficaAlto,  'ydata', fftAlto, 'xdata', gfreq);
drawnow;

end