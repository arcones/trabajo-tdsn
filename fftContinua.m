function fftContinua(segnales, Fs, graficas)

if length(segnales) == length(graficas)
    error('Los arrays de segnales y graficas han de tener el mismo tamanyo');
end

for i=1:length(graficas)
    [frecuencia, fftSegnal] = pintarFFT(segnales(:,i), Fs);
    set(graficas(i), 'ydata', fftSegnal, 'xdata', frecuencia);
    drawnow;
end

end