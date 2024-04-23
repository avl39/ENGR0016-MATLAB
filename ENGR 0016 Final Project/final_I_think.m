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
t = input('Please input the duration of the impact in seconds: ');

% Calculations

vf = sqrt(2*g*h);
timetotal = vf/g;
displacement = h;
forceExperienced = vf/t; % Force Experienced during impact

while displacement > 0.001
    aUp = forceExperienced/m - g;
    vi = forceExperienced/m*t;
    displacement = vi^2/(2*aUp);
    time = 2*((2*displacement)/vi);
    timetotal = timetotal + time;
    forceExperienced = vi/t;
end

time = 0:1/length(timetotal):length(timetotal);

j = 1;
for i = 1:length(time)

    j = j+1;
    if j == 2
        j = 1;

    end
end

% Animate motion
h = animatedline;


% TODO
% Displacement vs time vector
% Animation of displacement vs time vector