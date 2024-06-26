% Avery Law
% ENGR 0016 Intro to Engineering Computing Final Project
% Impact absorption comparison/bounce script

% clear workspace

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
    materials(5) = input('Please enter the name of your material');
end

m = input('Please input the mass of your object in kilograms: ');
g = input('Please input your acceleration due to gravity. If left blank the default value will be 9.8 metres per second. ');
if isempty(g)
    g = 9.8;
end
h = input('Please input the height that you would like your mass to be dropped from in metres: ');
duration = input('Please input the duration of the impact in seconds: ');
t = input('How many seconds would you like to simulate? ');

% Calculations

vf = sqrt(2*g*h);
vi = 0;
timetotal = vf/g;
displacement = h;
forceExperienced = vf/t; % Force Experienced during impact
impacts = 0;
t = 0:0.01:t;
bounce = 0;
timer = 0;

% Put inside of a loop iterating over some period of time, idk how long to model it for, figure it out (Maybe have the user declare it?)

for i = 1:length(t)
    if i == 1
        V0 = 0;
        x(i) = displacement;
    elseif bounce >=1
        x(i) = V0*t(i)-0.5*g*timer^2;
        if x(i)<0
            Vf = sqrt(V0^2+2*g*x(i-1));
            V0 = sqrt(m*Vf^2-(100-0.01*vertReb(opSec)*m*Vf^2)/m);
            bounce = bounce + 1;
            timer = timer + 0.001;
        end
    else
        x(i) =displacement + V0*t(i)-0.5*g*t(i)^2;
        if x(i)<0
            Vf = sqrt(V0^2+2*g*x(i-1));
            V0 = sqrt(m*Vf^2-(100-0.01*vertReb(opSec)*m*Vf^2)/m);
            bounce = bounce + 1;
            timer = i;
        end
    end 
end


% Animate motion
% h = animatedline;


% TODO
% Displacement vs time vector
% Animation of displacement vs time vector