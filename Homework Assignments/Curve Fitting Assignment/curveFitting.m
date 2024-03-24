% Curve fitting script to find best fitting polynomial for a given datafile

% Clear workspace
clear
clc

% Initialize imported file and filename
fileName = input('Enter the filename within single apostrophes as [FILENAME.ext]');
file = importdata(fileName);

% Parse imported file for data labels and values
cheaders = file.colheaders;
data = file.data;
x = data(:,1);
y = data(:,2);

% Find line of best fit for data values up to a fourth-order polynomial
for i = 1:4
    [p, S] = polyfit(x, y, i);
    r = 1 - (S.normr/norm(y-mean(y)))^2;    % Calculate R^2 values for each polynomial
    rSquaredCompare(i) = r;                 % Store R^2 values in a vector called rSquaredCompare
end

% Find the best fitting polynomial function and plot it
[M, j] = max(rSquaredCompare); % Pull out the location(degree) of the polynomial with the best R^2 value
if j == 1
    disp(j 'st order polynomial with an R^2 value of' r(j))
elseif j == 2
    disp(j 'nd order polynomial with an R^2 value of' r(j))
elseif j == 3
    disp(j 'rd order polynomial with an R^2 value of' r(j))
elseif j > 3
    disp(j 'th order polynomial with an R^2 value of' r(j))
end
plot(x,y,'o', x, polyval(polyfit(x,y,j),x)) % Plot the imported data against the line of best fit
legend('Imported Values', 'Polynomial line of best fit')
xlabel(cheaders(1))
ylabel(cheaders(2))