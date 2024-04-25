% Avery Law
% ENGR 0016: Intro to Engineering Computing Final Project
% Impact Absorption Comparison Test/Bounce Script

clear
clc

% Text Strings for User Information
materials = ["1. Sorbothane 30"; "2. Sorbothane 50"; "3. Sorbothane 70"; "4. Poron"; "5. Custom Material"];
vertReb1 = "Vertical Rebound is how high a specimen bounces off a material after being dropped a specified distance in the form of a percent out of the total height dropped";
vertReb2 = "A lower value corresponds to a higher absorption of energy by the material";

% Materials Properties
% First Number is the Resilience by vertical rebound, second number is compressive set, both in per 100 units
vertReb = [5, 12, 27, 4];

% The first position corresponds to Sorbothane 30, second to Sorbothane 50, third to Sorbothane 70, and the fourth to Poron

disp(materials)
opSec = input('Please input the number corresponding to the material you would like to analyze: ');

if opSec == 5
    disp(vertReb1);
    disp(vertReb2);
    vertReb(5) = input('Please input the value of the resillience by vertical rebound of your material as a value between 1 and 100: ');
    materials(5) = input('Please enter the name of your material: ', "s");
end

m = input('Please input the mass of your object in kilograms: ');
g = input('Please input your acceleration due to gravity. If left blank the default value will be 9.8 metres per second. ');
if isempty(g)
    g = 9.8;
end
h = input('Please input the height that you would like your mass to be dropped from in metres: ');
duration = input('Please input the duration of the impact in seconds: ');
t = input('How many seconds would you like to simulate? ');

t = 0:0.001:t; % Time Vector
V0 = 0; % Intial Velocity at time 0
time = 0; % Time counter for loop
counter = 0;
% Calculations

for i = 1:length(t)
    if counter == 0
        x(i) = V0*(time)-0.5*g*(time)^2+h;
        if x(i) <=0
            x(i) = 0;
            forceExp = m*g;
            Vi = sqrt(2*g*(0+x(i)));
            V0 = sqrt((2*(0.01*vertReb(opSec)*0.5*m*Vi^2))/m);
            time = 0;
            counter = 1;
        end
    else
        x(i) = V0*time-0.5*g*(time)^2+h;
        if x(i) <=0
            x(i) = 0;
            Vi = sqrt(2*g*(x(i-1)));
            forceExp = m*(Vi/duration);
            V0 = sqrt((2*(0.01*vertReb(opSec)*0.5*m*Vi^2))/m);
            time = 0;
        end
    end
    time = time+0.001;
end

figure
line = animatedline('Marker','o');

for k = 1:length(x)
    addpoints(line, t(k),x(k));
    axis([-0.3*max(t)+0.01*k 0.3*max(t)+0.01*k 0 h])
    drawnow limitrate
end
drawnow