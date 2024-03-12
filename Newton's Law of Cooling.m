% Newton's Law of Cooling Animation
% Avery Law ENGR 0016 
% Instructor: Dr. Matthew Kropf

% Let the temperature of the drink start at 90 C
% Let the temperature of the surroundings be 25 C
% Newton's law of cooling: T(t) = Ts + (T0-Ts)*e^(-k*t) where Ts is the temperature of the surroundings, T0 is the initial temperature, k is the coefficient of cooling, and t is time in minutes
% Animate the cooling of the drink until the average temperature of the beverage is 40 C

% Create a circle to represent the cup - it will have a generic radius of 1

theta = linspace(-pi,pi);
xcircle = cos(theta);
ycircle = sin(theta);
plot(xcircle,ycircle);
axis equal

% Establish Constants
T0 = 90 % Starting Temperature in Celcius
Ts = 25 % Ambient Temperature in Celcius
k = 300 % Coefficient of cooling of water in Watts per minute
t = 0:100; % Time vector from 0 to 100 minutes - may need to be extended further

% Set up a coordinate matrix
xcoord = linspace(-pi:pi:1000);
ycoord = linspace(-pi:pi:1000);

coordinate = zeroes(length(xcoord), length(ycoord));
coordinate(:,:,length(t)) = zeroes(length(xcoord), length(ycoord));

for k = 1:length(t)
    for i = 1:length(xcoord)
        for j = 1:length(ycoord)
            coordinate(i,j,k) = Ts + (T0+Ts)*exp(-k*t);
        end
    end
end
% Models the temperature of a single point with coordinates (i,j) on time layer t, iterated across all possible combinations of i, j, and t

% Psuedocolor plot

figure;
pcolor(xcoord,ycoord,t);
shading interp;
colorbar;
xlabel('X Coordinate');
ylabel('Y Coordinate');
title('Newton's Law of Cooling');


% TODO

% Coordinate matrix
% Model Cooling
% Animate
