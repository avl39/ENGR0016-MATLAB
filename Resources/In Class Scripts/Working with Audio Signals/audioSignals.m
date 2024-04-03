% Audio Signals

% Creating a .wav file with simulated audio
t = 0:1/fs:3;
f1 = 100;                 % Frequency 1 at 100Hz
f2 = 5000;                % Frequency 2 at 5000Hz
omega = 2*pi;             % Angular Frequency Constant
y1 = sin(omega*f1.*t);
y2 = sin(omega*f2.*t);
yHeard = 0.5.*y1+0.5.*y2;
audowrite('twoTone1005kHz',yHeard,fs);

% Pulling data from a .wav file

[audioNew,newFs] = audioread('dualtone.wav');
audioNew = audioNew';
tNew = 0:1/newFs:length(audioNew-1)./newFs;

% FFT usage - Use after importing data from a .wav(see above)
% Pulled almost directly from the documentation

L = length(audioNew);
Y1 = fft(audioNew);
P2 = abs(Y1/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);

f = fs/L*(0:(L/2));
plot(f,P1,"LineWidth", 3)
title("Single-Sided Amplitude Spectrum of S(t)")
xlabel("f (Hz)")
ylabel("|P1(f)|")