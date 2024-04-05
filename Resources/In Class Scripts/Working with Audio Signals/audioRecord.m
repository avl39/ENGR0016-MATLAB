% Audio Recording Script

fs = 44100;
recObj = audiorecorder(fs,16,1,1);
recDuration = 5;
disp("Begin Recording")
recordblocking(recObj,recDuration);
disp("End of Recording")

play(recObj);

y = getaudiodata(recObj);
t = 0:1/fs:((length(y)-1)./fs);
audiowrite('testtest.wav',y,fs);