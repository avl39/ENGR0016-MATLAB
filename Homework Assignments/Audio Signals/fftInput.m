% Clear workspace

clear
clc

% Initialize imported audio file
filename = input('Enter the name of your audiofile within single apostrophies as [FILENAME.ext] ');
[audio, fs] = audioread(filename);
audio = audio';
t = 0:1/fs:length(audio-1)./fs;

% Fast Fourier Transform (Documentation)

L = length(audio);
Y1 = fft(audio);
P2 = abs(Y1/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);

f = fs/L*(0:(L/2));
plot(f,P1,"LineWidth", 3)
title("Tingle-Sided Amplitude Spectrum of S(t)")
xlabel("f (Hz)")
ylabel("|P1(f)|")

figure

spectrogram(f,length(f)-1,length(f)-1,length(f))
