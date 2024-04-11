% Avery Law
% ENGR 0016: Introduction to Engineering Computing with Dr. Matthew Kropf
% Fast Fourier Transform and Spectrogram bonus assignment

clear
clc

option = 'Would you like to analyze another file?';
i = 1;
j = 1;

file{i} = input('Enter the name of the audio file that you would like to analyze: ');
filename{i} = file{i};
[audio{i},fs{i}] = audioread(file{i});

disp(option)
choice = input('Please enter Y for yes or N for no ', "s");

while choice == 'Y'
    i = i+1;
    file{i} = input('Enter the name of the audio file that you would like to analyze: ');
    filename{i} = file{i};
    [audio{i},fs{i}] = audioread(file{i});
    disp(option)
    choice = input('Please enter Y for yes or N for no ', "s");
end

tiledlayout(i,2)

while j <= i
    T = 1/fs{j};
    L = length(audio{j});

    nexttile
    firstFFT = fft(audio{j});
    P2 = abs(firstFFT/L);
    P1 = P2(1:(L/2+1));
    P1(2:end-1) = 2*P1(2:end-1);
    f = fs{j}/L*(0:(L/2));
    f = f';
    plot(f,P1,"LineWidth",3)
    title(['fft of ', filename{j}]);
    xlabel("f (Hz)")
    ylabel("|P1(f)|")
    
    nexttile
    spectrogram(f, 10, 1, 100, fs{j},'yaxis')
    title(['Spectrogram of ', filename{j}])
    j = j+1;
end


% I spent far too long on this too late at night, freezing my computer several times
% I originally wanted to add a small plot of the function over 1/100 of the length of the recording but that broke my computer an incredible amount
% This script should be robust enough to handle a good number of audio recordings, given you have enough time to allow your computer to process all of the recordings
% The script in its current state is the last stable version before it started breaking my computer and I've given up on trying to fix it from here -- See file name