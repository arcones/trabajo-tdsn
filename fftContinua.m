function fftContinua(segnal, Fs, grafica)

siguentePotencia = 2 ^ nextpow2(length(segnal));
plotScaleFactor = 4;
plotRange = siguentePotencia / 2;
plotRange = floor(plotRange / plotScaleFactor);
rangoFrecuencias = (0:siguentePotencia-1) * (Fs / siguentePotencia);
gfreq = rangoFrecuencias(1:plotRange);

yDFT = fft(segnal, siguentePotencia);
h = yDFT(1:plotRange);
abs_h = abs(h);

set(grafica, 'ydata', abs_h, 'xdata', gfreq);
drawnow;

end