% Avery Law ENGR 0016: Introduction to Engineering Computing instructed by Dr. Matthew Kropf
% Audio file analysis script using the fft and spectrogram functions
% 7.4.24

% Clear the Workspace

clear
clc

% Initialize variables

bool = "Y"
i = 1;

% Import audio files

file(i) = input('Enter the name of your audio file within single apostrophies as [FILENAME.ext] ');
filename(i) = num2str(file(i));
[audio(i),fs(i)] = audioread(file(i));

while bool == "Y"
    bool = input('Would you like to read another file? Please input Y for yes or N for no. ', "s");
    if bool == "Y"
        i = i+1;
        file(i) = input('Enter the name of your audio file within single apostrophies as [FILENAME.ext] ');
        filename(i) = num2str(file(i));
    elseif bool == "N"
        break
    end
end

% FFT and spectrogram plots

tiledlayout(length(file),2); % Initialize tiled chart for all of the plots

for j < i
    % FFT plot pulled from documentation
    L(j) = length(audio(j));
    Y1{j} = fft(audio(j));
    P2{j} = abs(Y1{j}/L(j));
    P1{j} = P2{1(1:L{j}/2+1)};
    P1{j(2:end-1)} = 2*P1{j(2:end-1)};
    f{j} = fs(j)/L(j)*(0:(L(j)/2);
    nexttile
    plot(f{j},P1{j},"Linewidth",3);
    title(["Single-Sided Amplitude Spectrum of S(t) of audio file ", filename(j)])
    xlabel("f (Hz)")
    ylabel("|P1(f)|")
    nexttile
    spectrogram(f{j},length(f{j}-1),length(f{j}))
end