function [s,dBA] = medirSegnal(s,Fs)

% Calculo la FFT
X = abs(fft(s));

% Cuando la transformada da cero, pongo un valor muy pequegno para evitar logaritmos de cero
X(find(X==0)) = 1e-17;

% Cojo las frecuencias que cumplen el teorema de Nyquist
f = (Fs/length(X))*[0:length(X)-1];
ind = find(f<Fs/2);
f = f(ind);
X = X(ind);


% Filtrado
A = filterA(f);
X =  A'.*X;

% Estimacion de los dBA de la segnal
energiaTotal = sum(X.^2)/length(X);
media = energiaTotal/((1/Fs)*length(x));
dBA = 10*log10(media)+50; % 50 es un parámetro de calibración

% Decibelios de la señal
X = 20*log10(X);