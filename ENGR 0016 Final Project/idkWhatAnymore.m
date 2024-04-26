% MATLAB Project simulating wind turbine efficiency with random wind speeds

% Key equations
% P = 0.5*rho*A*v^3
% E = P*Cp*Cf*t
% P is power, E is energy(kWh), Cp is Coefficient of Performance(efficiency), Cf is capacity factor, and t is time in hours

% Info Strings

clear
clc

cpInfo1 = "The Coefficient of Performance is the efficiency of a wind turbine.";
cpInfo2 = "The Betz limit declares that the maximum possible efficiency of a wind turbine is 59.3%";
cfInfo1 = "The Capacity Factor of a wind turbine is the ratio between how much energy can actually be output";
cfInfo2 = "versus its maximum possible output. The average value capacity factor is between 20-40%.";
aInfo1 = "Swept area is how much area is taken up by the turbine blades when spinning.";

% User-facing
disp(cpInfo1)
disp(cpInfo2)
Cp = input('Please input the efficiency of your wind turbine as a value between 1 and 100: ');

disp(cfInfo1)
disp(cfInfo2)
Cf = input('Please input the capacity factor of your wind turbine as a value between 1 and 100: ');

disp(aInfo1)
a = input('Please input the swept area of your turbines in m^2: ');
velocity = input('Please input the average windspeed of your area in m/s: ');
disp('Please input the density of air at your altitude in kg/m^3.')
density = input('If left blank, the default value will be the 1.225 kg/m^3 ');
t = input('How many hours would you like to simulate the output for? ');


% Calculations
altitude = linspace(0,1000,1001);
v = 15.*rand(length(altitude),1);
rho = linspace(1.112,1.225,1001);   % Density of air between 0m to 1000m 

for i = 1:length(rho)
    for j = 1:length(rho)
        power(j,i) = 0.5*rho(j)*a*v(i)^3;
        energy(j,i) = power(j,i)*(0.01*Cp)*(0.01*Cf)*t;
    end
end

windspeed = linspace(0,15,1001);

for k = 1:length(rho)
    for l = 1:length(rho)
        output(k,l) = (0.5*rho(l)*a*windspeed(k)^3)/10^3;
    end
end

powerFixed = 0.5*density*a*velocity^3;
energyfixed = powerFixed*0.01*Cp*0.01*Cf*t;

disp(['With the selected wind speed, your turbine has a theoretical output of ', num2str(powerFixed), 'kW.'])
disp(['For the selected period of time, your turbine has an actual output of', num2str(energyfixed), 'kWh.'])
energySum = mean(energy(1))/(t*10^3);
disp(['With randomized airspeed, the average energy produced by your wind turbine at sea level was ', num2str(energySum), ' kWh'])

figure
pcolor(rho, windspeed,output)
shading interp
c = colorbar;
ylabel(c, 'Hourly output in kWh')

title('Average output for the modeled wind turbine')
xlabel('Air Density in kg/m^3')
ylabel('Wind Speed in m/s')
