% Newtons Law of Cooling Animation
% Avery Law
% ENGR 0016 instructed by Dr. Matthew Kropf

% Define Constants
T0 = 90; % Starting temperature of the drink in Celcius
Ts = 25; % Ambient temperature in Celcius
k = 0.01; % Coefficient of cooling in Watts per Minute
t = 0:150; % Time vector in minutes

% Defining the size of the graph
xcoord = 1:60;
ycoord = 1:60;

% Defining the baseline temperature
temp = zeros(length(xcoord),length(ycoord), length(t)) + Ts;

% Solving for every possible temperature
for x = 1:max(xcoord)
    for y = 1:max(ycoord)
        for z = 1:max(t)
            if z == 1
                if sqrt(x^2+y^2) > 51
                    break
                elseif sqrt(x^2+y^2) <= 51
                    temp(x,y,z) = Ts + (T0 - Ts);
                end
            elseif sqrt(x^2+y^2) > 51
                temp(x,y,z) = Ts;
            elseif sqrt(x^2+y^2) <= 51
                temp(x,y,z) = Ts + (T0 - Ts)*exp(-k*t(z));
            end
        end
    end
end

% pcolor code taken from MATLAB user KSSV and modified slightly
% Their code can be found here:
% https://www.mathworks.com/matlabcentral/answers/875128-how-could-i-speed-up-this-loop-made-to-plot-using-the-pcolor-function#answer_743178

figure;
h = pcolor(temp(:,:,1));
cb = colorbar;
title('Newtons law of cooling');
xlabel('X Coordinate');
ylabel('Y Coordinate');
ylabel(cb, 'Temperature in Celcius');
clim([25 100]);
colormap("jet");
shading interp;
axis equal tight;

for i = 1:length(t)
    set(h,'CData',temp(:,:,i));
    drawnow;
    pause(0.1);
end