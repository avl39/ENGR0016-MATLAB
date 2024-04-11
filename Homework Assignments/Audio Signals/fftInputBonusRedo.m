% Avery Law ENGR 0016: Introduction to Engineering Computing instructed by Dr. Matthew Kropf
% Audio file analysis script using the fft and spectrogram functions
% 7.4.24

% Clear the Workspace

clear
clc

% Initialize variables

bool = "Y";
i = 1;
j = 1;
L = 3;

% Import audio files

file{i} = input('Enter the name of your audio file within single apostrophies as [FILENAME.ext] ');
filename{i} = file{i};
[audio{i},fs(i)] = audioread(file{i});

while bool == "Y"
    bool = input('Would you like to read another file? Please input Y for yes or N for no. ', "s");
    if bool == "Y"
        i = i+1;
        file{i} = input('Enter the name of your audio file within single apostrophies as [FILENAME.ext] ');
        filename(i) = file{i};
    elseif bool == "N"
        break
    end
end

% FFT and spectrogram plots

tiledlayout(length(file),2); % Initialize tiled chart for all of the plots

while j < i
   P2{j} = abs(audio{j}); 
   P1{j} = P2{1:L/2+1};
   P1{2:end-1} = 2*P1(2:end-1);
   f{j} = fs{j}/L*(0:(L/2));
   plot(f{j},P1,"Linewidth",3)
   title("Single-Sided Amplitude Spectrum of F(t)")
   xlabel("f (Hz)")
   ylabel("|P1(f)")
end